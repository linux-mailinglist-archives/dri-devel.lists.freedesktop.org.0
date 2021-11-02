Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B25B54433FC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:52:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AA773325;
	Tue,  2 Nov 2021 16:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C8673324
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 16:52:08 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id b71so4674888wmd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 09:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A0Gv/QN2qKt1UUPbNJBs29OCuwlLk5Iawd0kmAyppIA=;
 b=h8aMBSgC270p3YyYgpwd9zWqS4OtdEsHQZvdJaLWV40vD/w3SBChTEGVptLs4VFMcV
 F+m0yWAxAiUwVV61X7q/i5Unb16+/SPQ06goMnbo0rqkGD+hNXgrCr40eqc0eyCriHWQ
 vVcCZrnStQNxzF0Vk8mGFtQ5go+gzkRcRs9mbuG1d9X6dTQTvvMLv1WlRaKMnOXQyn8s
 +lCoJMOgq1G2+PNrnXXiToV8q+ew4tPM6QgDTNohpD2dn4A/Z3Ze8FR7X5yRuAM5qkHo
 arzRyFiTo2RFka7YS6ianmQPTC7B19SphNKM4HC3fK6Tlykb1zjzHE5J9pgr3HSDpMRL
 o7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A0Gv/QN2qKt1UUPbNJBs29OCuwlLk5Iawd0kmAyppIA=;
 b=5mHHD1oq2E4GHQBcYKepb3mbONcNKsZs/WlSBvwHC8truxnJZ0S5+aPJJ8u11+xddu
 J4kcSl8qL7sgLZ/2PRmuhuPe3ocDs4JCe67GHFhF4PnOvgFBJk8CJ9sQ4a4zL7yHSvHN
 5mu1UoUtAjvV3M/Sfq38KfpLfQEEsRA6MsytfjbvWKwKeVjJBI2brEcTXgYoDomvc6B/
 A6h6MXVYcr6COxvyuxttQ3A/tEZNkDO8wxIBJFpxFZvLETZKbj4m2KMy8OoT88O4QICN
 hpNs5RT6z5qwKhn/M1BiRt8hF60xNZMe9MtwW0ADrqVTPiSj2kFptxfhAJCRcmT4WsJh
 RFnA==
X-Gm-Message-State: AOAM531rq/6bF3WIDSfsNn3SF7dhhYD4niPFalVk3BQmHlcNOqdEeF0u
 FrIO5FF5tuVlhI50LD0QoUA26yZqkV0We3QRuaY/OA==
X-Google-Smtp-Source: ABdhPJxwhjzaNXSqOK31BY9i52m7fgj9oObZ/pz+E28nZFxKsfZi10g6CAzJlWv/8mfKRLWsrXwneMezrmknElEZ96o=
X-Received: by 2002:a1c:4e04:: with SMTP id g4mr8145187wmh.15.1635871926869;
 Tue, 02 Nov 2021 09:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211025152903.1088803-1-maxime@cerno.tech>
 <20211025152903.1088803-10-maxime@cerno.tech>
In-Reply-To: <20211025152903.1088803-10-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 2 Nov 2021 16:51:50 +0000
Message-ID: <CAPY8ntCiQ_42mXMYz_TF33TwAArH=o_C9MazuPmKwSosP2qrnQ@mail.gmail.com>
Subject: Re: [PATCH v8 09/10] drm/vc4: hdmi: Enable the scrambler on
 reconnection
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
> If we have a state already and disconnect/reconnect the display, the
> SCDC messages won't be sent again since we didn't go through a disable /
> enable cycle.
>
> In order to fix this, let's call the vc4_hdmi_enable_scrambling function
> in the detect callback if there is a mode and it needs the scrambler to
> be enabled.
>
> Fixes: c85695a2016e ("drm/vc4: hdmi: Enable the scrambler")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index d36b3b6ebed1..fab9b93e1b84 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -180,6 +180,8 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
>  static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
>  #endif
>
> +static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder);
> +
>  static enum drm_connector_status
>  vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  {
> @@ -216,6 +218,7 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
>                         }
>                 }
>
> +               vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
>                 pm_runtime_put(&vc4_hdmi->pdev->dev);
>                 mutex_unlock(&vc4_hdmi->mutex);
>                 return connector_status_connected;
> --
> 2.31.1
>
