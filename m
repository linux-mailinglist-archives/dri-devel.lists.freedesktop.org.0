Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0204432A2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9097C73190;
	Tue,  2 Nov 2021 16:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84A773190
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 16:21:44 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso1907620wmh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 09:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FuNpocQi4pocnnGlw+gkPjkIozlrXXBhAiLbx0uyBSE=;
 b=TQfVT0o9MR49aeFAQKvXyRgJnF8SgQZwxFl6y5i0aLo8NLuJQauP37MW/cddpDOslf
 sCe/WNGTQEjcf7Wwk1bDINL/ejg1TfDz3nJf4rvipi+dLKmRGBsO5j+5w9SwKqa9sSN+
 NSIxGTcMP1uqxkf31C7Zlj+3Rr7c0NsxxklN7wEG3Sn1oc4KqXgtaL2dd62SfdPfxbH/
 IuOf7JrXRfqqYeh7vqkJqUpb5eDUDLSuXe7CgzOzdKmGgrW4E3uFzPY8cJPLkPQxqNmv
 2jzh36GecFwHi1hb5DcpO6wegifg/g2E9GpjK2q1pvasSQoIx3iRwPm7ZEo9Q/ge9rUb
 lM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FuNpocQi4pocnnGlw+gkPjkIozlrXXBhAiLbx0uyBSE=;
 b=t1I2SDky/yQI5e9Ml49xiM9i10cFOHeDYJTvTBrjTARosOmPN1wECnLktmPFhhVrop
 M76RMyxnNB1BGOKSFe42LexDmoEDQSl6ve+n+tKcl0RXeyCJOUfs2uI4CKED0fX5hriC
 WLdalmdSEnnPli5ePu/OxfPdpyXvfEPpy7TCDpz/f2/x26ki2TjPY6YcBNZbr9LYcl5b
 E5TC6uqWC1TdwcK971GVDzn7DT2ULxmMz8fb4QMmVs1j3K3KDFyWgsPLXXI5N9VWzgY2
 ImotbotljsgJauBLzh04/rW3VcGk06kQxuc0jJXMljEpzDY8lotkXpn31J2GAxBJWIM7
 uwOg==
X-Gm-Message-State: AOAM53228GnmLcY3Kt55MUDzPYLrAW64ZZnnXz58RNSSaOa05whzmNzj
 qlWLa4JAV1eEiGKRShdmNDAUQ+Io4l7mhBn6cY2ycQ==
X-Google-Smtp-Source: ABdhPJwTeeL5hbLH4I+o+Y0n9y/WzHOMWRv0uAn5PLot7TrFzvgrzlzMJujU5AxE48Mi2iCqMBuWV5qa+Esy7ZbVgNo=
X-Received: by 2002:a7b:cc07:: with SMTP id f7mr8408896wmh.106.1635870103486; 
 Tue, 02 Nov 2021 09:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211025152903.1088803-1-maxime@cerno.tech>
 <20211025152903.1088803-4-maxime@cerno.tech>
In-Reply-To: <20211025152903.1088803-4-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 2 Nov 2021 16:21:27 +0000
Message-ID: <CAPY8ntB7e_=CWoWz=zf-ZHyaUYsEsgO2gzEDqNQno0vX_jqhcQ@mail.gmail.com>
Subject: Re: [PATCH v8 03/10] drm/vc4: Make vc4_crtc_get_encoder public
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Oct 2021 at 16:29, Maxime Ripard <maxime@cerno.tech> wrote:
>
> We'll need that function in vc4_kms to compute the core clock rate
> requirements.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 8 ++++----
>  drivers/gpu/drm/vc4/vc4_drv.h  | 5 +++++
>  2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index e3ed52d96f42..7cfd4a097847 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -281,10 +281,10 @@ static u32 vc4_crtc_get_fifo_full_level_bits(struct vc4_crtc *vc4_crtc,
>   * allows drivers to push pixels to more than one encoder from the
>   * same CRTC.
>   */
> -static struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
> -                                               struct drm_atomic_state *state,
> -                                               struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
> -                                                                                        struct drm_connector *connector))
> +struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
> +                                        struct drm_atomic_state *state,
> +                                        struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
> +                                                                                 struct drm_connector *connector))
>  {
>         struct drm_connector *connector;
>         struct drm_connector_list_iter conn_iter;
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 4b550ebd9572..f5e678491502 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -544,6 +544,11 @@ vc4_crtc_to_vc4_pv_data(const struct vc4_crtc *crtc)
>         return container_of(data, struct vc4_pv_data, base);
>  }
>
> +struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
> +                                        struct drm_atomic_state *state,
> +                                        struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
> +                                                                                 struct drm_connector *connector));
> +
>  struct vc4_crtc_state {
>         struct drm_crtc_state base;
>         /* Dlist area for this CRTC configuration. */
> --
> 2.31.1
>
