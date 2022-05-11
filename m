Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA0C523E68
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 22:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7D6112B50;
	Wed, 11 May 2022 20:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4429B112B4D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 20:06:35 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id c12so3809754edv.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 13:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s+VKxsDNd2Dlk25JXEG0/tKdfNG/XmzW8g0WEIYdC88=;
 b=R7vHakTRampr8OzU3rpFsQDFxOiF/ZYOzyU/LbZPRwC2qoIjA41ST8iUnSy/gzro0B
 jTSxW/5/tKOFtoy6GEXCUuG7WzsuuTRO9uiHlsS2zYy6Q3XcNRZo3IY6AxUvfNLsJgll
 Cp/W/Cf1mJWMPRsE9Ldkye6nOnCYHs/+4rGE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s+VKxsDNd2Dlk25JXEG0/tKdfNG/XmzW8g0WEIYdC88=;
 b=KdzZh5B65vWNg9K6pgnS1M3fDrMxOuCOPC4hDLosaCSLfX8RRz3NMDGpR0djMA++af
 cKiZutquZO5fd+bjXwBA5uOrQMDOFV6Ktb3zwuZYsKnCchKqQQy26rrLZSc6YdVkkeW9
 /93z93C12zvvaClkk2x5UJxNcDBdb0e2G/nFTPwoRoxZ/6WOxV77+TLsjotezx85XXP/
 M/b1LwRBgJYA4+WMhCsnFhnZJbLDDUacVVrV7QfKSl/RbzMelS0xFfyzCi3KUZ//zYxS
 QTEaubodOOuChiDKNv9mp4I7DqTu3xpK6yaCWg9X1sEDNkYPFSZW1xroRBIOvjlW+6A/
 gSlg==
X-Gm-Message-State: AOAM532N6ypz1Ns99hgOXig5G/0Kn/tKJNJ976uBI2SBVIv86uV8xanq
 1q0mSPRm+4XnifKTeU+xb1JzY7OV4OSjQmX4ruU=
X-Google-Smtp-Source: ABdhPJw2xTO4KQkhPHoI02W8EBDrsN/fH8aJE1S8IU3qXZPJd0T1TMnFRkP4mB6508rSXWvg36XUKw==
X-Received: by 2002:a05:6402:31fc:b0:428:5da9:be6a with SMTP id
 dy28-20020a05640231fc00b004285da9be6amr23737509edb.223.1652299593111; 
 Wed, 11 May 2022 13:06:33 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 l12-20020a50cbcc000000b0042617ba6385sm1699243edi.15.2022.05.11.13.06.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 13:06:31 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id k126so1845798wme.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 13:06:30 -0700 (PDT)
X-Received: by 2002:a7b:c4c8:0:b0:394:26c5:b79e with SMTP id
 g8-20020a7bc4c8000000b0039426c5b79emr6580581wmk.15.1652299589792; Wed, 11 May
 2022 13:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211207222901.988484-1-dmitry.baryshkov@linaro.org>
 <20211207222901.988484-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20211207222901.988484-2-dmitry.baryshkov@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 May 2022 13:06:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7RyVJKis9e3aoouQyhUppyAhVs9oN9=miKeZcV0t6_g@mail.gmail.com>
Message-ID: <CAD=FV=V7RyVJKis9e3aoouQyhUppyAhVs9oN9=miKeZcV0t6_g@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dsi: move DSI host powerup to modeset time
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Dec 7, 2021 at 2:29 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The DSI subsystem does not fully fall into the pre-enable/enable system
> of callbacks, since typically DSI device bridge drivers expect to be
> able to communicate with DSI devices at the pre-enable() callback. The
> reason is that for some DSI hosts enabling the video stream would
> prevent other drivers from sending DSI commands. For example see the
> panel-bridge driver, which does drm_panel_prepare() from the
> pre_enable() callback (which would be called before our pre_enable()
> callback, resulting in panel preparation failures as the link is not yet
> ready).
>
> Therewere several attempts to solve this issue, but currently the best
> approach is to power up the DSI link from the mode_set() callback,
> allowing next bridge/panel to use DSI transfers in the pre_enable()
> time. Follow this approach.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 43 +++++++++++++++++++--------
>  1 file changed, 31 insertions(+), 12 deletions(-)

I happened to be testing today on one of the sc7180-trogdor variants
that has a parade-ps8640 bridge chip in it and ran into problems. A
bisect pointed to this patch and, sure enough, reverting it fixes me
again.

The Chromebook in question is able to power the screen on at bootup
but things don't work so well in other cases. Specifically, if I leave
the Chromebook idle then it will turn the screen off (but in this
case, not enter S3). Hitting a key should wake the screen up, but it
doesn't.

None of the error prints in dsi_mgr_bridge_power_on() are hitting when
it fails and I even added extra error prints. It's not hitting any of
the early returns.

I did a little bit more debugging and it appears that nothing funny is
going on. It's just the ordering difference that matters. With the
patch reverted, I see this and it all works:

boot:
[    9.653801] DOUG: dsi_mgr_bridge_mode_set
[    9.658687] DOUG: ps8640_pre_enable
[    9.664194] DOUG: dsi_mgr_bridge_pre_enable

screen turns off:
[   82.130038] DOUG: dsi_mgr_bridge_post_disable
[   82.166817] DOUG: ps8640_post_disable

screen turns on:
[   92.611846] DOUG: dsi_mgr_bridge_mode_set
[   92.617875] DOUG: ps8640_pre_enable
[   92.920237] DOUG: dsi_mgr_bridge_pre_enable

Without the patch reverted, I see this and it fails:

boot:
[   10.817810] DOUG: dsi_mgr_bridge_mode_set
[   10.822128] DOUG: dsi_mgr_bridge_power_on
[   10.852131] DOUG: ps8640_pre_enable
[   10.857942] DOUG: dsi_mgr_bridge_pre_enable

screen turns off:
[   34.819953] DOUG: dsi_mgr_bridge_post_disable
[   34.883777] DOUG: ps8640_post_disable

screen should turn on, but doesn't:
[   46.193589] DOUG: dsi_mgr_bridge_mode_set
[   46.197951] DOUG: dsi_mgr_bridge_power_on
[   46.248438] DOUG: ps8640_pre_enable
[   46.541700] DOUG: dsi_mgr_bridge_pre_enable

Unfortunately, ps8640 is a pretty big black box. The Linux kernel
driver does almost nothing at all and the parade bridge chip has a
bunch of magic firmware on it. Though I don't know for sure, I assume
that this magic firmware simply can't handle the fact that the MIPI
side is already setup / running when the bridge is powered on.

Rather than this patch, maybe you can jump on Dave Stevenson's patch
series [1] which I believe would solve this problem in a more dynamic
way? Would you accept a revert of ${SUBJECT} patch to fix my problem?

[1] https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com


-Doug
