Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EA74AD840
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 13:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F89E10E4B9;
	Tue,  8 Feb 2022 12:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA83110E51A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 12:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644322932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mt0hncQ/RRm0riihXr626lJBH3pbgbYhHyz5dtgoOAs=;
 b=WL2FRKkfFxp1OLndYDWJJp/R1C9zauMdAZZb+WeZlAOaj0H0wxUMO2EGq1qFkPZjgG3h+t
 e2aL4ABRiBavAA3T2rrW+5eTpRnTR8vPrxK0Y0N0L9sAgG+FNtatgLR27kLK77pOMmXsHs
 QKZbEfF//Ch0Qp7JkTGtkI21x+tnLUg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-pCae8OTmNTWRgeQ9gZ7Acw-1; Tue, 08 Feb 2022 07:22:09 -0500
X-MC-Unique: pCae8OTmNTWRgeQ9gZ7Acw-1
Received: by mail-wr1-f69.google.com with SMTP id
 v9-20020adfa1c9000000b001e33e5dbd5fso339187wrv.17
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 04:22:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mt0hncQ/RRm0riihXr626lJBH3pbgbYhHyz5dtgoOAs=;
 b=3GL5aZzm8Pwod9VmBC63D1gNauUMMvJJm5M5O0XUYrEf5RLJSQeJVJvkk/WoMVSGMR
 jHTp2RztPhGEYh6LDmI2chRUCCA+dr2S1ol1hKxOL+7+yU0NCIVLNDj7zUM6ju6kyORL
 RKZdc9U1Ps2ya6ttgUCLifK9DxBjoh2chKK8boRKtO4jz1ikELf6DiQAIR7DRxB4v5lQ
 GhO9wOIVXxGav8Zuu4tJ0r3Mg9Wv99PecPbYpQgCgoG2UeKI1JY6mhmrSl1Y/A3Pj+gx
 hWtI2KDFGX1qBlbrnl8hvhwf4hUbhNcj7XVJEJW+DHP+o2nBwaIz5CRxZaYSQAj5FTZz
 1jeA==
X-Gm-Message-State: AOAM533fbcwGGN0TtxjQkjqq28wWLC+R3dW17DV7POldbFslWpqGlOa/
 279Ax+9j5apG0zLhRjLasXR8cF9FKKUltr5+Xnolgdmz1Wb/xxm88AF/0uVxfC6YsRFzallqgbs
 6/9YpJFIQXloHextkVMOnEk5yV6CQ6hdUIhG+A4nK7vq6
X-Received: by 2002:a7b:c21a:: with SMTP id x26mr938350wmi.74.1644322928165;
 Tue, 08 Feb 2022 04:22:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw05S2FM4hb+eMcua2vq2VzpKE6qzOqTT3pzSCAKpcyucQY5qglNO8kSljUgpASBmw4liJar8UCAeaCMl7/oQ0=
X-Received: by 2002:a7b:c21a:: with SMTP id x26mr938337wmi.74.1644322927980;
 Tue, 08 Feb 2022 04:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20220204193319.451119-1-lyude@redhat.com>
In-Reply-To: <20220204193319.451119-1-lyude@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 8 Feb 2022 13:21:57 +0100
Message-ID: <CACO55tv1yFYeboJsdV9sg1KWqWhs3WfJVmHuBKjAV6FUi6BLSA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/backlight: Just set all backlight types as RAW
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

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Fri, Feb 4, 2022 at 8:33 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Currently we can get a warning on systems with eDP backlights like so:
>
>   nv_backlight: invalid backlight type
>   WARNING: CPU: 4 PID: 454 at drivers/video/backlight/backlight.c:420
>     backlight_device_register+0x226/0x250
>
> This happens as a result of us not filling out props.type for the eDP
> backlight, even though we do it for all other backlight types.
>
> Since nothing in our driver uses anything but BACKLIGHT_RAW, let's take the
> props\.type assignments out of the codepaths for individual backlight types
> and just set it unconditionally to prevent this from happening again.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau")
> Cc: <stable@vger.kernel.org> # v5.15+
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index 6af12dc99d7f..daf9f87477ba 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -101,7 +101,6 @@ nv40_backlight_init(struct nouveau_encoder *encoder,
>         if (!(nvif_rd32(device, NV40_PMC_BACKLIGHT) & NV40_PMC_BACKLIGHT_MASK))
>                 return -ENODEV;
>
> -       props->type = BACKLIGHT_RAW;
>         props->max_brightness = 31;
>         *ops = &nv40_bl_ops;
>         return 0;
> @@ -343,7 +342,6 @@ nv50_backlight_init(struct nouveau_backlight *bl,
>         else
>                 *ops = &nva3_bl_ops;
>
> -       props->type = BACKLIGHT_RAW;
>         props->max_brightness = 100;
>
>         return 0;
> @@ -411,6 +409,7 @@ nouveau_backlight_init(struct drm_connector *connector)
>                 goto fail_alloc;
>         }
>
> +       props.type = BACKLIGHT_RAW;
>         bl->dev = backlight_device_register(backlight_name, connector->kdev,
>                                             nv_encoder, ops, &props);
>         if (IS_ERR(bl->dev)) {
> --
> 2.34.1
>

