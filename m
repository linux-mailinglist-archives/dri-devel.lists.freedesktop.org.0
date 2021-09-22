Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF6941514C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 22:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD186EC71;
	Wed, 22 Sep 2021 20:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D126EC74
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 20:19:42 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id c7so14350826qka.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 13:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dWG04tH8ZQ7gPjKUtd+hX/duqooCcZZ2VSN1tOuuz5k=;
 b=dtauWIWomSt7xfZQ6C6Lm/WKaRcTXvI5dEgP+WHYIn52J6eCV6dXwTKNjUSmjOtrru
 mavucHfKbDcoYu+xKDdpGwn4MDP3rd5C8CdKD2sYEpNec2UwkuGWGIuR2OmS1KuC8p8f
 9KirbCX43ov5ZV4EECH7SNF++ejT/GLbLGPLsjFZF2PJfzAAJ0QQmqroKhi9ojgUMCQk
 ft4+D5KcBElXJ39czp+1z5FF3f7k6zUo3iNrFM+qqe1JpVYwJc/5BpWbLFXJL85167pW
 ccIiyGVBlm6wzD9ThqS2SilBHVIziYLRfxIYML1HOm1Uzkio1ahwitXAPP3S3PFSXVl9
 GCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dWG04tH8ZQ7gPjKUtd+hX/duqooCcZZ2VSN1tOuuz5k=;
 b=AT15SUq0SxHludokjTd6NxqDzbKOeJ/DGSlXd0o3HbWa0DUE1V13SJRaZ9AteNQZxL
 7dB+SssYiy+/PeMl19x05uMGP4ybLxH/bXAq84lsMzUOfOyRgn4NZmCX4ZDN0S1XuFPb
 BBXg3HjRp+ZhcgnkxYCCB3W4qRca6LEmiAJSrLbKos5jZ2R8q16KU6RF9yqSO3Rtb/w0
 Xmll84p889Z45BB9S7g0+/mHcumxy2yKi/Xs5UxXURNX9XVXRvDDPZve7NjGUEilLmF3
 +oHLI/V8tG7yI/aN1BtBcvlWryB852SOVep/imzShD1c6+IY90XqBy1WS0ofx4vOIfai
 gkyA==
X-Gm-Message-State: AOAM530E2jr9C9TdaDn43MTtW/KqueaoSOFi8g1149eYba1tEddUXkpi
 u6+G7gmRDbsYY2vlllCViun9E62xFkNAhCC78fw=
X-Google-Smtp-Source: ABdhPJyDEsC/NHuUbFQwSMD4X/S9ZHm7zqsPZ5bIpJKEvIB03KJx81JCqj86QQj+BRLowiekNZ1W2eVYuP67JZ6q800=
X-Received: by 2002:a25:bdc5:: with SMTP id g5mr1157340ybk.403.1632341981997; 
 Wed, 22 Sep 2021 13:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210903160302.yh42vpkuob45dbpb@gilmour>
 <CADVatmMqT1yq3YHBzt4-VsL8uVHUULmy2gpaH27rAqimao2i_A@mail.gmail.com>
 <20210904091050.g5axxctgelciihjn@gilmour>
 <CADVatmN+9euG5Fegor1+kaSPewbW8vRwBgnxmr5SsK3mOE6FEg@mail.gmail.com>
 <20210920144730.d7oabqfbx7pmyyfb@gilmour>
 <20210920154333.vunyxeshdb7jt5ka@gilmour>
 <20210920155350.h6624mt65vwg72p2@gilmour>
 <CADVatmNi+jN+EwiWuoDoocZFyErDVNt1ND0BxtjuKiV63aNuJg@mail.gmail.com>
 <20210920171042.oq3ndp3ox4xv5odh@gilmour>
 <CADVatmOs7Cc1EdCZXMyXcWM-3-J4bU_3zF1thkOohVUL-G6ZrQ@mail.gmail.com>
 <20210922095725.dk4vk42zb3kh7y6s@gilmour>
 <CADVatmOMV5gMhCuoP65O9mbW639x5=0+bGh92WVL8FFX2Mvu3w@mail.gmail.com>
 <CAHk-=wi=8Wp31FSyOH5A8KY+7f3dSuP62zUpvTtyvENm1Hh7xA@mail.gmail.com>
 <CADVatmNZB6yjS6zXqUcY4xsUTyX3pa6VysB6RmT1CGV5LXer6g@mail.gmail.com>
 <CAHk-=wh+y=C5hVhE1X=AvZz+OM5Yp8eLHYGth31pfoJVF7UKKQ@mail.gmail.com>
In-Reply-To: <CAHk-=wh+y=C5hVhE1X=AvZz+OM5Yp8eLHYGth31pfoJVF7UKKQ@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 22 Sep 2021 21:19:06 +0100
Message-ID: <CADVatmPDeSxeY3GTZyC6+G0N76su0E6Y3LF_h6BOcBf5QAtjvg@mail.gmail.com>
Subject: Re: Regression with mainline kernel on rpi4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 22, 2021 at 7:23 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Sep 22, 2021 at 10:02 AM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> >
> >
> > Attached is a complete dmesg and also the decoded trace.
> > This is done on 4357f03d6611 ("Merge tag 'pm-5.15-rc2' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm")
>
> drivers/gpu/drm/vc4/vc4_hdmi.c:1214 is
>
>         tmp = (u64)(mode->clock * 1000) * n;
>
> in vc4_hdmi_set_n_cts(), which has apparently been inlined from
> vc4_hdmi_audio_prepare() in vc4_hdmi.c:1398.
>
> So it looks like 'mode' is some offset off a NULL pointer.
>
> Which looks not impossible:
>
>   1207          struct drm_connector *connector = &vc4_hdmi->connector;
>   1208          struct drm_crtc *crtc = connector->state->crtc;
>   1209          const struct drm_display_mode *mode =
> &crtc->state->adjusted_mode;
>
> looks like crtc->state perhaps might be NULL.

I added some debugs to print the addresses, and I am getting:
[   38.813809] sudip crtc 0000000000000000

This is from struct drm_crtc *crtc = connector->state->crtc;

connector and connector->state had valid addresses.
[   38.805302] sudip connector ffff000040bac578
[   38.809779] sudip state ffff000057eb5400

This is the diff of the debug I added:
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4a1115043114..2a8f06948094 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1205,11 +1205,20 @@ static void
vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi,
 static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi, unsigned
int samplerate)
 {
        struct drm_connector *connector = &vc4_hdmi->connector;
-       struct drm_crtc *crtc = connector->state->crtc;
-       const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+       struct drm_crtc *crtc;
+       struct drm_display_mode *mode;
        u32 n, cts;
        u64 tmp;

+
+       pr_err("sudip connector %px\n", connector);
+       pr_err("sudip state %px\n", connector->state);
+       crtc = connector->state->crtc;
+
+       pr_err("sudip crtc %px\n", crtc);
+       pr_err("sudip state %px\n", crtc->state);
+       pr_err("state mode %px\n", &crtc->state->adjusted_mode);
+       mode = &crtc->state->adjusted_mode;
        n = 128 * samplerate / 1000;
        tmp = (u64)(mode->clock * 1000) * n;
        do_div(tmp, 128 * samplerate);


-- 
Regards
Sudip
