Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8434B70D93D
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 11:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B205F10E419;
	Tue, 23 May 2023 09:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693B910E41E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 09:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684834647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+TAJ51kmQXr16zT02BkW6TkdFoXJfwtWEG43wr2zqYI=;
 b=Do9We+fewiIzH4JxkuuvUf6WhWR6fRR+uqGsXNwRfs7PsSax7UjwzbcX8VQsAouMK29tOM
 dkX0fFWaL6B6YTSXiztWUEV8vmlRp84nfMfowGe4T5RHlD/E4o/xv1TzQum4Mfbas4UJrZ
 56Aw37yQSs+cCGQASZGB5t3jOmcRpJU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-PFOScCQGPHKc8-nQdzdMXA-1; Tue, 23 May 2023 05:37:25 -0400
X-MC-Unique: PFOScCQGPHKc8-nQdzdMXA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4f3b0cf7613so468628e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 02:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684834644; x=1687426644;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+TAJ51kmQXr16zT02BkW6TkdFoXJfwtWEG43wr2zqYI=;
 b=jOIhQMgljg7KwytddLDriQ2sOaOqvaSqiUJd/xSiM2DezRacpApJ1Pf2Jhxp6Sujw2
 oznCHu2B8gdVaLYFXvPtu2UNM/cfppD84ox55+LNtnatoXeHthj/YlF6xP6xXcNwgqM6
 S1MRrVPrDlhK7njHhGvO+1kp+1uRFvlKFJRiBjvflk+UYvXqX/DAwUXC+QLw/BQJLQ2N
 o7qJMxcXchdisxBA5S7fldnXigv8p4G7DZk16ikpt814ro0PCyNohB3YPtuGrKHZwgYC
 kzgtZpWjnQJpxoeDC0V9EXfqRApU36SWbiZMtuhG63qWoSXCQC6d/vlKn4Jngb/GpjA1
 EwEA==
X-Gm-Message-State: AC+VfDwI8bPeDYQGeJOKqhkDr8fFDR22LaEHHHehF+XYdq0fqvWI9EW3
 X02MnUpOjjj+YFfxGf7AHC3AAXOLOUgGcifFmZkheVBIpw9kxl97sw0hF8V/ht3wCVveegp4Vgf
 JfXKXmy/ZJbbfI5AbaUOSoW3zmxLZOFg0reqI/qf4jGEE
X-Received: by 2002:a2e:b543:0:b0:2b0:2214:f817 with SMTP id
 a3-20020a2eb543000000b002b02214f817mr1806094ljn.3.1684834644383; 
 Tue, 23 May 2023 02:37:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6wfUxvYYMlMNYwsAxAvtMPY98o1s7TG750zKkGUBhjjl6rfxJ9Oo5E13RWKqWTlG86vS4OkxKnbLDWvHZB7oY=
X-Received: by 2002:a2e:b543:0:b0:2b0:2214:f817 with SMTP id
 a3-20020a2eb543000000b002b02214f817mr1806084ljn.3.1684834644065; Tue, 23 May
 2023 02:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230522201838.1496622-1-kherbst@redhat.com>
In-Reply-To: <20230522201838.1496622-1-kherbst@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 23 May 2023 11:37:13 +0200
Message-ID: <CACO55tuZeJZ6GTA+ooaXsSgde2Zy70qpe8Cg_AEfZRXtmd2LWA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/acr: Abort loading ACR if no firmware was
 found
To: linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Gourav Samaiya <gsamaiya@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 10:18=E2=80=AFPM Karol Herbst <kherbst@redhat.com> =
wrote:
>
> This fixes a NULL pointer access inside nvkm_acr_oneinit in case necessar=
y
> firmware files couldn't be loaded.
>
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/212
> Fixes: 4b569ded09fd ("drm/nouveau/acr/ga102: initial support")
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/acr/base.c
> index 795f3a649b12..6388234c352c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
> @@ -224,7 +224,7 @@ nvkm_acr_oneinit(struct nvkm_subdev *subdev)
>         u64 falcons;
>         int ret, i;
>
> -       if (list_empty(&acr->hsfw)) {
> +       if (list_empty(&acr->hsfw) || !acr->func->wpr_layout) {

Now thinking about this, it should probably also check acr->func...

>                 nvkm_debug(subdev, "No HSFW(s)\n");
>                 nvkm_acr_cleanup(acr);
>                 return 0;
> --
> 2.40.1
>

