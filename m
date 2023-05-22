Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0B570BB4B
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 13:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715AE10E2CD;
	Mon, 22 May 2023 11:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2815310E2CB
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684753997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kd+PsvNileg5XRg62rxcYULjvxE2s9HN/H5lXiFohgM=;
 b=ZldgP6g1wMg9ZwUuT0LFCDkYESJO3o/KRPCubhQuBeTXIOeVnC7XA6v/cJVR6RyDBMdCjM
 tqUxwbBQRoarQB4oxE5I3UL5jI3/HpJK7EP0NM/7+2FEn5+tLH2b5GQROC4sSFKkRTxl/V
 wA+T+lamGN8Zjiah/JSOJ+FP70H9CGg=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-po-iKG8kNheYosOXaI0Vzw-1; Mon, 22 May 2023 07:13:15 -0400
X-MC-Unique: po-iKG8kNheYosOXaI0Vzw-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4f24f491835so235739e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 04:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684753994; x=1687345994;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kd+PsvNileg5XRg62rxcYULjvxE2s9HN/H5lXiFohgM=;
 b=NnDlA0NuheFkOAOcpIOSzRaz2xy/r2dckKiMmDx9Q0oQanRLpACdOl978x7ThEWt/I
 D/D+n+29HjOs/CgVbCSM7EHog3nM1VDUzR85Qzah86V0ZtWhGpQPyXfwzlK2i+YRpckm
 oAMcUSlDwiEW9Eazv/zBaPsGoQ2DWUW0gWpz3LA41YJ4MtmbIkjZ/bKgs5PbGlIpObte
 5ATivHl8cpthuAPS5nlTP7SJv7dfoqB9Em9nsyFxTUhqRAiYgaMsCCoonPF73jhDXhwc
 S1IJsiC8dV7dhZyjWlWEexJqeIDDqpgxuIE4TWTHVufi5r6OK/l05+1E/xANe/yz8iPb
 kHDw==
X-Gm-Message-State: AC+VfDysfIPDxdkaA0BTir/+jQqjJJRbtKacM9UxcxGc6L+ePOBtpZ4+
 F7RBlZ+NsT1kX0xo8WAT5F/hpaTLxofdA+YRPF+Avs5+arDf78UoY3P5bEvKmtyaakjL3b+Qq3N
 VO7xs4R7igaSF8P5NECuv1/lThfUfCnOZmfrK+Jv9BsMu
X-Received: by 2002:a2e:a37a:0:b0:2af:150f:d421 with SMTP id
 i26-20020a2ea37a000000b002af150fd421mr3749238ljn.5.1684753994428; 
 Mon, 22 May 2023 04:13:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4+vYH0Nc1ESK4QTZEtrWsGcanm7ymTNCOr4z8IJm7Iru4aBRqsqfYh/jPAqeDcjuMGqcwQ1DLogJOpk7PIIHY=
X-Received: by 2002:a2e:a37a:0:b0:2af:150f:d421 with SMTP id
 i26-20020a2ea37a000000b002af150fd421mr3749226ljn.5.1684753994119; Mon, 22 May
 2023 04:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230517133112.873856-1-trix@redhat.com>
In-Reply-To: <20230517133112.873856-1-trix@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 22 May 2023 13:13:02 +0200
Message-ID: <CACO55tvx_45D6Jnj_HhL0H9DQ-=PezGqucDQ-=-6JD9s_aAZMg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/acr/ga102: set variable ga102_gsps
 storage-class-specifier to static
To: Tom Rix <trix@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com, gsamaiya@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Wed, May 17, 2023 at 3:31=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> smatch reports
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c:49:1: warning: symbol
>   'ga102_gsps' was not declared. Should it be static?
>
> This variable is only used in its defining file, so it should be static
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/ga102.c
> index 525267412c3e..a3996ceca995 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> @@ -45,7 +45,7 @@ ga102_gsp_nofw(struct nvkm_gsp *gsp, int ver, const str=
uct nvkm_gsp_fwif *fwif)
>         return 0;
>  }
>
> -struct nvkm_gsp_fwif
> +static struct nvkm_gsp_fwif
>  ga102_gsps[] =3D {
>         { -1, ga102_gsp_nofw, &ga102_gsp },
>         {}
> --
> 2.27.0
>

