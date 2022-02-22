Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE0B4C0330
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 21:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66FD10E466;
	Tue, 22 Feb 2022 20:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D0410E5DB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 20:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645562204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jtsuMnx/zdBZQQ43trmEefCQDk5DNh8X7mDs4NkeFJU=;
 b=PxeQlAVNfQPnPrUulYIL3NkuBOcYzEkRi9sJ3NHjzd78rKmOsc9UWDvLellb9dZ9QXyCeD
 5GdpzFilm8GF+1Hei0aFKOQYSXGfe61ir9h7n0vR2Y2223NxtvlYgqM5IKlUuOXPDDo9+9
 Vp5IVxNx6MZPb6RWBG4dwg1liv0gurA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-dSodFBYgMomQF5bSknuXdg-1; Tue, 22 Feb 2022 15:36:43 -0500
X-MC-Unique: dSodFBYgMomQF5bSknuXdg-1
Received: by mail-qk1-f199.google.com with SMTP id
 w4-20020a05620a094400b0060dd52a1445so987839qkw.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 12:36:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=jtsuMnx/zdBZQQ43trmEefCQDk5DNh8X7mDs4NkeFJU=;
 b=2Niai0XRhcJAZlw6NHAoacHqz2uyQPTcY6BDZmpw223ygJLwt3fIH/KKuqusHIdVBb
 SuXQbqLeK2Nc7T1a3tUU+/Tp6mc1hMoucmEH2brBSBdcmiiw939MclUTIT2Fez2EzrEw
 fq4tJPFmekLahkLP8yww/2Aire9kTn3kLRcU3brJfsUsZQMAu+JDYGnSrvM6N6Cd8xTB
 xV6X8bzgWg38VUviyz7Y+3KL0qPHj/gzZ7DQv2V8GkMVuwekLCKdsIaU37SHa9OdRUZ/
 Ps/4lcUh899WQ9oYDKkfH0WJ7JOKdFOZEMCPI/gu7+RKqkKxykaDyHYXfFNZehSEGInd
 mFPw==
X-Gm-Message-State: AOAM532BP49eSlgGr9M3nhtG6AwJo5yyhgF0vPE6NgFiJyC4uJX+Yb+O
 TSea0vVSA6GPwfLMW3Ae+GXJVYhRtNS20n0jtFVy8Dv7UN1qcYwDS6EAQHF0rICINEaF3fqx9bX
 9fkWA/1jx2HynmI/OpY5Ogc9J7qx1
X-Received: by 2002:a37:2791:0:b0:60d:d5a2:965e with SMTP id
 n139-20020a372791000000b0060dd5a2965emr16739718qkn.701.1645562202992; 
 Tue, 22 Feb 2022 12:36:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+ajuFarqEUjo9dTNx5yXpRv7c3qYT0A8Pm1EMM/XSCJ6AROkRiryQH0hVpjcTXRQO/t+Zgw==
X-Received: by 2002:a37:2791:0:b0:60d:d5a2:965e with SMTP id
 n139-20020a372791000000b0060dd5a2965emr16739694qkn.701.1645562202715; 
 Tue, 22 Feb 2022 12:36:42 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15])
 by smtp.gmail.com with ESMTPSA id y15sm404048qki.15.2022.02.22.12.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 12:36:42 -0800 (PST)
Message-ID: <91d0a60e2da3e2313f68b8c126d1da1efbaf0f88.camel@redhat.com>
Subject: Re: [PATCH v2 13/22] drm/nouveau/kms: Remove redundant zpos
 initialisation
From: Lyude Paul <lyude@redhat.com>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>,  David Airlie <airlied@linux.ie>
Date: Tue, 22 Feb 2022 15:36:40 -0500
In-Reply-To: <20220221095918.18763-14-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-14-maxime@cerno.tech>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

I assume you'll handle pushing this yourself? (JFYI - using drm-misc for
pushing this is fine by me)

On Mon, 2022-02-21 at 10:59 +0100, Maxime Ripard wrote:
> The nouveau KMS driver will call drm_plane_create_zpos_property() with
> an init value depending on the plane purpose.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in nv50_wndw_reset(). However, the helpers have been
> adjusted to set it properly at reset, so this is not needed anymore.
> 
> Cc: nouveau@lists.freedesktop.org
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index 133c8736426a..0c1a2ea0ed04 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -635,8 +635,6 @@ nv50_wndw_reset(struct drm_plane *plane)
>                 plane->funcs->atomic_destroy_state(plane, plane->state);
>  
>         __drm_atomic_helper_plane_reset(plane, &asyw->state);
> -       plane->state->zpos = nv50_wndw_zpos_default(plane);
> -       plane->state->normalized_zpos = nv50_wndw_zpos_default(plane);
>  }
>  
>  static void

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

