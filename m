Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E93E3D8F9C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7446E055;
	Wed, 28 Jul 2021 13:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB9D6E055
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:52:41 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 f14-20020a05600c154eb02902519e4abe10so4363472wmg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 06:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kuD2/cMi9v63nZZZmSBG2IaupOS/1XWwnneUf9M1k9o=;
 b=qcRqP641xG0vB+UDYiik9LQYbPUpon4cK820eR4sCWfADHA+T9YgUCydz8yzF5Z8gN
 9ZQUEAhytwB5ZTNRpwtUWvuzeTq7kDMKRLGiRBEVaGKgpBgaJMzQzHdYwsT+ei/fzUXD
 tnEDngdpt/iMmL9N+uLOZBHGyiUIgar1ziPC1yNKhdps+wgFOmNmB2Bv2w4E8HKZTvBf
 72i9hM0HTF4pHTf0pEs99WWodCZCQ9/x9snGUz247KYbrsT1v4M7LCB4quydvu6HYkrl
 oK5ypCS8Fy3yBcHA54M1L3MZ+MlQ2d4dGvvShgn5bgsDF8hmQrtKCtyrAcYa18gE4f8n
 mkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kuD2/cMi9v63nZZZmSBG2IaupOS/1XWwnneUf9M1k9o=;
 b=ujzE5dmRNDUS6YX1RTE/BzXainen6J6Sy8yemBm4NC8S4FqLhKlJY8A7QmMG/X2kek
 FBnYiFF106NXjso77GIWdRAL5TtQbujkyZyD5oyfSrP8tpHG/XgQMXogJ/4+mzwetnzs
 sQh/BDjU+Y5JwiUMuTyM1cG2xk7SIchiCr5hta1dXZEAi1cox4IgpQJqopMb0czdu6EL
 dF2cEadILK9/r65916XnKivTYP5A9wWhnMy4iquC1Cp0EEpznnmYz9rqQRRgTHaHlSps
 Sig/IXDTbUufcWZOl+kFTdAtEcSw4DQvw8o1+sQBbTndeFf3jHQvJHqU2z0N7zMH32pe
 nkZA==
X-Gm-Message-State: AOAM532HJG61P921d4WT6NhtGo2/aLQjuw1I6QTfF3pphs/aXZKlrey3
 wfb1qtf5cHIc8SMAVipkUrrxE+5mx4qRdybH4952Kw==
X-Google-Smtp-Source: ABdhPJyZ4wRTiW93BgBlBxE6MvcGFi57mJyOUsPHwaGo/ilO2tap+IJYgnG0mQS5pIEyDpoLfvQwlnfJlQMVP7gRGQs=
X-Received: by 2002:a05:600c:354e:: with SMTP id
 i14mr27642677wmq.96.1627480360236; 
 Wed, 28 Jul 2021 06:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210707092257.1465109-1-maxime@cerno.tech>
In-Reply-To: <20210707092257.1465109-1-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 28 Jul 2021 14:52:24 +0100
Message-ID: <CAPY8ntDXZ7ExjKvBMFjd5d3RTfrGCe2TYiXfmjF4bmE+WMFssQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/vc4: hdmi: Fix CEC access while disabled
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
Cc: linux-rpi-kernel@lists.infradead.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 7 Jul 2021 at 10:23, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> This series aims at fixing a complete and silent hang when one tries to use CEC
> while the display output is off.
>
> This can be tested with:
>
> echo off > /sys/class/drm/card0-HDMI-A-1/status
> cec-ctl --tuner -p 1.0.0.0
> cec-compliance
>
> This series addresses it by making sure the HDMI controller is powered up as
> soon as the CEC device is opened by the userspace.
>
> Let me know what you think,
> Maxime
>
> Changes from v1:
>   - More fixes
>   - Added a big warning if we try to access a register while the device is
>     disabled.
>   - Fixed the pre_crtc_configure error path
>
> Maxime Ripard (5):
>   drm/vc4: hdmi: Make sure the controller is powered up during bind
>   drm/vc4: hdmi: Rework the pre_crtc_configure error handling
>   drm/vc4: hdmi: Split the CEC disable / enable functions in two
>   drm/vc4: hdmi: Make sure the device is powered with CEC
>   drm/vc4: hdmi: Warn if we access the controller while disabled

Comment made on patch 1.

Patches 2-5:
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

  Dave

>
>  drivers/gpu/drm/vc4/vc4_hdmi.c      | 123 +++++++++++++++++++---------
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   6 ++
>  2 files changed, 89 insertions(+), 40 deletions(-)
>
> --
> 2.31.1
>
