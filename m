Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E8759628C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 20:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6779211241B;
	Tue, 16 Aug 2022 18:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A91113C0B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 18:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660674994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ATLTNrU7GYz0luvrW4anz32ZvPvWjx6FLjAwIXa1ryQ=;
 b=JaEM4dCsujBGlIowU71zVaF8COc2TzZkh6T86wnOksj5qroFTdC8zHtr0Bc3SKVPgjYBiA
 0curIOPf6hMzcZ+vOLdQ8NI1C04QlgRiWPsM0ggDw87KZCWw9mbS1TcSnQnIKE/63pYiZk
 xO6Iq6HerTwuBjpR9WLf5GXNu2jvWYY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-195-0PP-TJpKO-e-8zEHY--aqw-1; Tue, 16 Aug 2022 14:36:33 -0400
X-MC-Unique: 0PP-TJpKO-e-8zEHY--aqw-1
Received: by mail-qk1-f200.google.com with SMTP id
 u15-20020a05620a0c4f00b006b8b3f41303so9808098qki.8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 11:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ATLTNrU7GYz0luvrW4anz32ZvPvWjx6FLjAwIXa1ryQ=;
 b=lgkO7O4WkRHRkbMQGhK/PazphhQrJiezjVDQ7WgwzRsa3UZAcSB6DJ7yVXy0Ed8Ai4
 x6+jfqDVEVc8OEknMo5UhEtK0OA0LsgTksJasI7Mk9/19Jq7iraPgOLDT6euzSjHLVHi
 jQ24W4XO8nR7hz7T9bBJHt1IMR01dmcSRB8WX9j100Wbq05crCzWrkUURxjcnZDTA45V
 8H1I61KHTcV8+ImNwaXczVh0o/+ibS1OMZWAH9aSJkm5X7+odcdlL87RE7oqVJk65ixx
 C5ETeOUKrOMDVUve+fcVa+YOE/f9LEM12HNbpxpr96TPK6+V1EDnZjI/nPfSNdAbY7Q3
 MPfQ==
X-Gm-Message-State: ACgBeo3oAMAkuTeoCf2qtVKIDzryrTxzfDMaB3lA74A6iuuzZgDW8q3Q
 mSlLX/eJNIP59HB5frSmXbU8TflMI2u5UkvPVr2VIR4clP9qWHEWRIRRzj1dr+PaYpnTjNwwYEv
 tKvq39a3otf3Cs5kUkLWLFwxS22Om9NV3wkwVsbeGKqnC
X-Received: by 2002:a05:622a:53:b0:344:6f46:9b16 with SMTP id
 y19-20020a05622a005300b003446f469b16mr4523475qtw.664.1660674993000; 
 Tue, 16 Aug 2022 11:36:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4uzqnNt/HXR/q6B/lqjN5qSDiPZY/PY86apwP8teYfRNvnblpR+HCXfIUeJjTQ/VgoEgoyP1yH48Iodoy+LVI=
X-Received: by 2002:a05:622a:53:b0:344:6f46:9b16 with SMTP id
 y19-20020a05622a005300b003446f469b16mr4523466qtw.664.1660674992830; Tue, 16
 Aug 2022 11:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220816180436.156310-1-lyude@redhat.com>
In-Reply-To: <20220816180436.156310-1-lyude@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 16 Aug 2022 20:36:22 +0200
Message-ID: <CACO55tvoDZMTr6my2LvhWWz7h3L6u2938n5dwvjvLANpvwxhjA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/kms/nv140-: Disable interlacing
To: Lyude Paul <lyude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 16, 2022 at 8:04 PM Lyude Paul <lyude@redhat.com> wrote:
>
> As it turns out: while Nvidia does actually have interlacing knobs on their
> GPU still pretty much no current GPUs since Volta actually support it.
> Trying interlacing on these GPUs will result in NVDisplay being quite
> unhappy like so:
>
> nouveau 0000:1f:00.0: disp: chid 0 stat 00004802 reason 4 [INVALID_ARG] mthd 2008 data 00000001 code 00080000
> nouveau 0000:1f:00.0: disp: chid 0 stat 10005080 reason 5 [INVALID_STATE] mthd 0200 data 00000001 code 00000001
>
> So let's fix this by following the same behavior Nvidia's driver does and
> disable interlacing entirely.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 43a9d1e1cf71..8100c75ee731 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -504,7 +504,8 @@ nouveau_connector_set_encoder(struct drm_connector *connector,
>                         connector->interlace_allowed =
>                                 nv_encoder->caps.dp_interlace;
>                 else
> -                       connector->interlace_allowed = true;
> +                       connector->interlace_allowed =
> +                               drm->client.device.info.family < NV_DEVICE_INFO_V0_VOLTA;
>                 connector->doublescan_allowed = true;
>         } else
>         if (nv_encoder->dcb->type == DCB_OUTPUT_LVDS ||
> --
> 2.37.1
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

