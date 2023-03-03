Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A158D6A9966
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7F510E5FE;
	Fri,  3 Mar 2023 14:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE74710E5FE
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 14:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677853719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o3ApB4exZoXcG63nEHDI8L+9x3I4wPipSfbFGyH/f0E=;
 b=EtH+KGjGfg9xf5S/aa+pF6m6eRiErYCn1xaZQ9mcrcZhwDYxagye7rCr7+MOPvhVuPPYLc
 p8DrhFWKwNnql9CbILAM+pFLV8wDgjyNiIzDjY0Uc69lg83IFtDyp0yikFAJp9+z3t8ajx
 gG4GIYy20gJDxB3bnVRPWItJW3gg6G8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-AYWotm_1PR-MaxtQuwLhoA-1; Fri, 03 Mar 2023 09:28:35 -0500
X-MC-Unique: AYWotm_1PR-MaxtQuwLhoA-1
Received: by mail-lf1-f70.google.com with SMTP id
 i16-20020ac25b50000000b004b565e69540so1085824lfp.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 06:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677853714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o3ApB4exZoXcG63nEHDI8L+9x3I4wPipSfbFGyH/f0E=;
 b=lFfMYIzK5RCtDCnDaFHBqfDH6mxln3YKf7ZFV4+I8A+Vdjm/n4XbAZ5MKvc2N1nQjJ
 /TYR8+wotKUwe12rMLSYoqdX3HBP6g+JYYufvCHAV/kqlUWVG4EN2OnmcxrNL4YE2adZ
 YxwoMgMk77hDc9WQ54z4+zSHsm0p2yNml0FrW4Ju3zzh4nK4nOOZGwekkGazDIajVO6a
 ZnHDreocgHnBYDjpF6t7N08RiikI+7ADfxJt3ENMNtotQ87kvwXlD6Zhcicf8nYQNsv1
 3Hq6ArsqKL8JDN78RJUMTqQDTa4DyzoVjoqRrWi/InW27leTzgcWe2smq/cF9RTabhTs
 y4JQ==
X-Gm-Message-State: AO0yUKWtvTADaSaoBx9b0sLA4RplVLcjk1957MRQk4vufT0ftQMr2Her
 bNaMBmUP12SBDZme2YZ+WIIYUDl91oJlU/UaZGzrmtL3XoFRBPRVdjjZN/LYvxCBGVy8DvDYr8l
 fe9cYShszvOZCSbOMTXZQGMGdRpH8ycpgit5xHFbwuQX3
X-Received: by 2002:ac2:5927:0:b0:4d5:ca32:6aec with SMTP id
 v7-20020ac25927000000b004d5ca326aecmr645060lfi.12.1677853714511; 
 Fri, 03 Mar 2023 06:28:34 -0800 (PST)
X-Google-Smtp-Source: AK7set89z3ZaDV+0l8hN22o89ZbCZILIi4QRjANWBxaYKra+nJigSS7Ho1XPgvAOO/WyESHVRzmPsFP0RA2BCA7iIf8=
X-Received: by 2002:ac2:5927:0:b0:4d5:ca32:6aec with SMTP id
 v7-20020ac25927000000b004d5ca326aecmr645049lfi.12.1677853714194; Fri, 03 Mar
 2023 06:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20230303132731.1919329-1-trix@redhat.com>
In-Reply-To: <20230303132731.1919329-1-trix@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 3 Mar 2023 15:28:21 +0100
Message-ID: <CACO55tuMxp5M+zgG_p3QpXUfrPhcssPMz91tfMBFt5OVobOSaw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/fifo: set gf100_fifo_nonstall_block_dump
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
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

will push in a moment

On Fri, Mar 3, 2023 at 2:27 PM Tom Rix <trix@redhat.com> wrote:
>
> gcc with W=3D1 reports
> drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: error:
>   no previous prototype for =E2=80=98gf100_fifo_nonstall_block=E2=80=99 [=
-Werror=3Dmissing-prototypes]
>   451 | gf100_fifo_nonstall_block(struct nvkm_event *event, int type, int=
 index)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> gf100_fifo_nonstall_block is only used in gf100.c, so it should be static
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/fifo/gf100.c
> index 5bb65258c36d..6c94451d0faa 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
> @@ -447,7 +447,7 @@ gf100_fifo_nonstall_allow(struct nvkm_event *event, i=
nt type, int index)
>         spin_unlock_irqrestore(&fifo->lock, flags);
>  }
>
> -void
> +static void
>  gf100_fifo_nonstall_block(struct nvkm_event *event, int type, int index)
>  {
>         struct nvkm_fifo *fifo =3D container_of(event, typeof(*fifo), non=
stall.event);
> --
> 2.27.0
>

