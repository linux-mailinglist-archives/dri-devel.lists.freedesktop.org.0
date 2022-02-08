Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2570B4AD83D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 13:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C541010E21E;
	Tue,  8 Feb 2022 12:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7E410E21E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 12:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644322897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Mdb5Ebivxr6jzHOzSN/tIiK6XfSCOdpNYf9wIWORf4=;
 b=EgceZ2mq05boLTTXTrWM5FX0RNfpgPtKave8xMZOhN5IHKlFUCsTlnvc/fWXdu3I0G/fzu
 dCLE38POHEawoQcfeSifOO3HhfZPh4IxGeQNnRxOexn9IN6GmT3otmg3wiA/Dq7uVxE1ns
 bKlm4SN9E4BjRDyxSLdPbI4rfpqYe9A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-47B28NUkMguYVoiEFa9vlA-1; Tue, 08 Feb 2022 07:21:32 -0500
X-MC-Unique: 47B28NUkMguYVoiEFa9vlA-1
Received: by mail-wr1-f71.google.com with SMTP id
 n18-20020adfc612000000b001e3310ca453so1494203wrg.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 04:21:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Mdb5Ebivxr6jzHOzSN/tIiK6XfSCOdpNYf9wIWORf4=;
 b=29bg92d9b67HtGytjEbBvssOuUJyxDtcy9mFDPKT6PpCB8bhrGOuIFWtZg+x5i9Jxt
 4+8kkKC2X1be1nTCUO2V+E3N8M2xB8bJFHiPyovZiutWKuD/WyAClHBZFcmdmwwvkSKE
 EySmv7DBP/rWXxAygduRlDDtEixQ/oYJlHpQFmXNtHQpHwXJUq3OJijnbDP66GQKhkKP
 6ofoXPSMYGNIWZagHHpID/WTX/V2plBhiiyy69EIMW5M1oKl7NfoLtju5BX3tIS9Yume
 wfpawOmlupqlZFn8NgKTvlK05kK7WGyMCabUe8bbcYIj233N0vLNVv3E2ISpxLkoGYnD
 GoIg==
X-Gm-Message-State: AOAM530I/JihaKaN5S0HJSLlIdOaJ5JslBwqDh4VNmUrYvDZ70Yoj3yE
 JEAceHtJut03O3FdfU2A3UTy+Aa53/ebv8Ozixj/Y5rtJK7bpYJbDZtOHpx1Up4eYj+jJQgsIhu
 I7qDU3m6uuj+4tGBnMDFpHS58kYUg++D/Ra8RJnEhDknG
X-Received: by 2002:adf:e281:: with SMTP id v1mr3333555wri.308.1644322890929; 
 Tue, 08 Feb 2022 04:21:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLlALWJQvkTxajX4mY5wFPC0i9Cbyibc6vh+dA8xRid1wKDVpfMqtwnuSqGnDZsRaAsQEg1IKxzDseghgHQVU=
X-Received: by 2002:adf:e281:: with SMTP id v1mr3333537wri.308.1644322890725; 
 Tue, 08 Feb 2022 04:21:30 -0800 (PST)
MIME-Version: 1.0
References: <20220204180504.328999-1-lyude@redhat.com>
In-Reply-To: <20220204180504.328999-1-lyude@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 8 Feb 2022 13:21:12 +0100
Message-ID: <CACO55ttjtNW9Gx6pJegGD+r37j53Do+jc5xoyTFf8aXaBt5y-g@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/backlight: Fix LVDS backlight detection on
 some laptops
To: Lyude Paul <lyude@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 4, 2022 at 7:05 PM Lyude Paul <lyude@redhat.com> wrote:
>
> It seems that some laptops will report having both an eDP and LVDS
> connector, even though only the LVDS connector is actually hooked up. This
> can lead to issues with backlight registration if the eDP connector ends up
> getting registered before the LVDS connector, as the backlight device will
> then be registered to the eDP connector instead of the LVDS connector.
>
> So, fix this by only registering the backlight on connectors that are
> reported as being connected.
>

I think the patch might risk breaking muxed systems where we have two
GPUs, but.. the systems I know of have different ways of controlling
the backlight anyway. So unless there is something I missed this is

Reviewed-by: Karol Herbst <kherbst@redhat.com>

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau")
> Bugzilla: https://gitlab.freedesktop.org/drm/nouveau/-/issues/137
> Cc: <stable@vger.kernel.org> # v5.15+
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index ae2f2abc8f5a..6af12dc99d7f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -294,7 +294,8 @@ nv50_backlight_init(struct nouveau_backlight *bl,
>         struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
>         struct nvif_object *device = &drm->client.device.object;
>
> -       if (!nvif_rd32(device, NV50_PDISP_SOR_PWM_CTL(ffs(nv_encoder->dcb->or) - 1)))
> +       if (!nvif_rd32(device, NV50_PDISP_SOR_PWM_CTL(ffs(nv_encoder->dcb->or) - 1)) ||
> +           nv_conn->base.status != connector_status_connected)
>                 return -ENODEV;
>
>         if (nv_conn->type == DCB_CONNECTOR_eDP) {
> --
> 2.34.1
>

