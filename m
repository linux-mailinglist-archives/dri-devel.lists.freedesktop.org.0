Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0233B9F70
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 13:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B4589CCB;
	Fri,  2 Jul 2021 11:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BBC89CCB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 11:03:49 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 r9-20020a7bc0890000b02901f347b31d55so5925711wmh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 04:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=YPxjaHKeXihxK4iZwt1dYOvPhkmUp1HzDC1gwPSw/vg=;
 b=mEPeXHwAM90stqL1NuPyaIB4ScEmtyABadkajk37ioVAHpg7FxT6iuM8GK2QNulyVn
 8HjMv/iqRf3XBLXhq/YfSPj3E2cTmF+kH1kEh5Ix6LYHJ4WxZNNt+PFSuIsjKnlROWzG
 LaRf3CbRpZs5BktLh/xf5TiMyYYrK1xcWjGRp0fvVUV11mG8yPf5lMIfwPVAxXh3piG5
 VI23kVTfloKGvTB72guAaQtbMlV+7Thm3k49C9ekmaDaEEpEcNAFbaFHA4M2uI1ic4GX
 XCtrapthPdM5ScxYoXklcDrZ6+MTi4f/C6FmcZ7HNfmiawj812dDoemG7B7kiSbfWJGS
 unOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YPxjaHKeXihxK4iZwt1dYOvPhkmUp1HzDC1gwPSw/vg=;
 b=Bk1RWLoOFdPgvFwpZ35YCgCp9Xg9kiXw44sKXDzY2o6mOJsIcfk5wJIXqC20rwB52D
 BDaCC6ZUIpy94ZWsFSScxriD7SZzXK0xCROmM8I8jvBqmBkSHZ1SZGoe/jzhPfRXntND
 s7+Tm0fRFdxdeNEl1AI0AxPe+IIgBgo5zsLGcAXZwj08Nl3IVfOFt12qTHjOrg3n7Mdz
 htypLW7wZhejWPzfeCHWjrWrh+nM5LRbcq25KVmpHIP8WW/zgmd/KXx042ZcNx6ovCHv
 XiT7hSH3tJAQb6otUYWIwH3W4snI8lDb1ly1bJxbRGLPqRmHCM73kXcfJ4IM0bm6U2if
 p12g==
X-Gm-Message-State: AOAM533haP4AKL7fXHTqVFjedbJFxUrBFkntfImbdTY95rdsr3rF6qAs
 1UfSBpo0upQ8MONsrU6Gyx8VQzlCG3JDSPnM8XxwPE77X4NO5Q4Z
X-Google-Smtp-Source: ABdhPJwrXcvmCq7An3qKWr8ol1tKBbo7APzt9DJXk834fEILqKMbHK71dr2C+L5/sBR86U12FJ9d77gVeUUNUCGHPnk=
X-Received: by 2002:a1c:b485:: with SMTP id d127mr16209639wmf.82.1625223827610; 
 Fri, 02 Jul 2021 04:03:47 -0700 (PDT)
MIME-Version: 1.0
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 2 Jul 2021 12:03:31 +0100
Message-ID: <CAPY8ntBUKRkSam59Y+72dW_6XOeKVswPWffzPj3uvgE6pV4ZGQ@mail.gmail.com>
Subject: Questions over DSI within DRM.
To: DRI Development <dri-devel@lists.freedesktop.org>
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

Hi All

I'm trying to get DSI devices working reliably on the Raspberry Pi,
but I'm hitting a number of places where it isn't clear as to the
expected behaviour within DRM.

Power on state. Many devices want the DSI clock and/or data lanes in
LP-11 state when they are powered up. With the normal calling sequence
of:
- panel/bridge pre_enable calls from connector towards the encoder.
- encoder enable which also enables video.
- panel/bridge enable calls from encoder to connector.
there is no point at which the DSI tx is initialised but not
transmitting video. What DSI states are expected to be adopted at each
point?

On a similar theme, some devices want the clock lane in HS mode early
so they can use it in place of an external oscillator, but the data
lanes still in LP-11. There appears to be no way for the
display/bridge to signal this requirement or it be achieved.

host_transfer calls can supposedly be made at any time, however unless
MIPI_DSI_MSG_USE_LPM is set in the message then we're meant to send it
in high speed mode. If this is before a mode has been set, what
defines the link frequency parameters at this point? Adopting a random
default sounds like a good way to get undefined behaviour.

DSI burst mode needs to set the DSI link frequency independently of
the display mode. How is that meant to be configured? I would have
expected it to come from DT due to link frequency often being chosen
based on EMC restrictions, but I don't see such a thing in any
binding.

As a follow on, bridge devices can support burst mode (eg TI's
SN65DSI83 that's just been merged), so it needs to know the desired
panel timings for the output side of the bridge, but the DSI link
timings to set up the bridge's PLL. What's the correct way for
signalling that? drm_crtc_state->adjusted_mode vs
drm_crtc_state->mode? Except mode is userspace's request, not what has
been validated/updated by the panel/bridge.

vc4 has constraints that the DSI host interface is fed off an integer
divider from a typically 3GHz clock, so the host interface needs to
signal that burst mode is in use even if the panel/bridge doesn't need
to run in burst mode. (This does mean that displays that require a
very precise link frequency can not be supported).
It currently updates the adjusted_mode via drm_encoder_helper_funcs
mode_fixup, but is that the correct thing to do, or is there a better
solution?
I'd have expected the DSI tx to be responsible for configuring burst
mode parameters anyway, so the mechanism required would seem to be
just the normal approach for adopting burst mode if that is defined.

Some DSI host interfaces are implemented as bridges, others are
encoders. Pro's and con's of each? I suspect I'm just missing the
history here.

When it comes to the MIPI_DSI_MODE_* flags, which ones are mutually
exclusive, or are assumed based on others? Does a burst mode DSI sink
set both MIPI_DSI_MODE_VIDEO and MIPI_DSI_MODE_VIDEO_BURST, or just
the latter?
Presumably !MIPI_DSI_MODE_VIDEO signals the of use command mode for
conveying video. So looking at panel-ilitek-ili9881c where it sets
just MIPI_DSI_MODE_VIDEO_SYNC_PULSE means command mode video with sync
pulses? That sounds unlikely.

I have looked for any information that covers this, but failed to find
such, hence calling on all your expertise.

Many thanks for your time,
  Dave
