Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 159E2967310
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 21:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28A010E159;
	Sat, 31 Aug 2024 19:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=lausen.nl header.i=@lausen.nl header.b="iUyOoSzD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is
 [185.26.156.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482B310E159
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 19:00:10 +0000 (UTC)
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
 by mailgate02.uberspace.is (Postfix) with ESMTPS id 9711617F64F
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 21:00:06 +0200 (CEST)
Received: (qmail 21879 invoked by uid 990); 31 Aug 2024 19:00:06 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Sat, 31 Aug 2024 21:00:05 +0200
Message-ID: <9d359542-bd16-4aba-88a8-0bdea1c1de44@lausen.nl>
Date: Sat, 31 Aug 2024 15:00:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,1/2] drm/msm/dpu1: don't choke on disabling the writeback
 connector
Content-Language: en-US
To: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org
References: <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
 <b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com>
 <0b2286bf-42fc-45dc-a4e0-89f85e97b189@lausen.nl>
 <56bf547a-08a5-4a08-87a9-c65f94416ef3@kuruczgy.com>
From: Leonard Lausen <leonard@lausen.nl>
Autocrypt: addr=leonard@lausen.nl; keydata=
 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 Sw==
In-Reply-To: <56bf547a-08a5-4a08-87a9-c65f94416ef3@kuruczgy.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-0.002348) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -0.092348
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lausen.nl; s=uberspace;
 h=from:to:cc:subject:date;
 bh=UwKPp9JUYK4rRvslxHWwmxYRfnMGtjCQxAzmaPwy3AY=;
 b=iUyOoSzDtrStwnLKl6pqdhTdYhMsl73vXTx3XZBMpuwViJm+IgXBIn9nSY7KdrKSkRVTOQhwka
 mDwkhNuWjyQeNX/W5ghF1t0EOmKSlC5x0TFcmoyamrMH34rQ8/eRWhis8xnUG/6CDBqZIcCtmqrj
 t7X4I0LDcOJBFr9Nk8PdiFp5QKMdNXKVhcuW20S3vMNEuWG4YcRjQAexfS5fB0/GNFTOWj7tIG3p
 YHyuRvo011aUN5dqzHSypuQMObfM2ciEEuhzevvc9AKEWYuRBB3zgUzGZxBqIhkxvG6Ur9t2SjRY
 p4YYdFIXnx51ZcdcHpC9PVhdNdmpnZgC6w9sp424ateEb36IhKF7M4YswoqYnAvH5RY+RtGNv9p9
 7cBM6gsxIHeI0SVDrKbleTDCdnGLCcKUdg8ooix7hcZtvsYdYTuBDs4tDPXw0YsL9wiBrAWNpQmJ
 OzdSvzzmrISC8brCWtGLG+C12vTKvKyz5Z07a9OJ+ElqYIQ4v1XjbkfJUBllBSjky6kR8sES1PFg
 zftJ33NONN72iaUxBfz3bzp6gI7/8SXk/tytvaJ4fK6GCCxKAvnTtyNIetHQXWKaNTljm+EQLUz8
 1T0qrsAj1CLcIHUTm8yeRbLA8Xg2GFUssI93QjdP0VCSaMrqcvH+X/2cT+BXF7E+KBBFhfMmynY2
 U=
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

Dear György,

>> Do you observe this issue on every suspend-resume cycle?
> 
> I just did 10 suspend/resume cycles in a row to double check, and without this patch the screen never comes back (always have to switch VT back-and-forth to bring it back). The
> 
> [dpu error]connector not connected 3
> [drm:drm_mode_config_helper_resume] *ERROR* Failed to resume (-22)
> 
> pair of error messages also consistently appears after all resumes.
> 
> Though I think e.g. Rob Clark reported that suspend/resume already works properly for him without this patch, so this experience is not universal on the Yoga Slim 7x.

Ack. Do you mean that Rob Clark also uses Yoga Slim 7x but does not face the "screen never comes back (always have to switch VT back-and-forth to bring it back)" issue?

>> On sc7180 lazor, I do observe that this patch deterministically breaks restoring the CRTC state and functionality after resume. Can you please validate if you observe the same on Lenovo Yoga Slim 7x? Specifically, try set Night Light in your desktop environment to "Always On" and observe whether the screen remains in "Night Light" mode after resume. For lazor, "Night Light" is breaks after applying this patch and even manually toggling it off and on after resume does not restore "Night Light" / CRTC functionality.
> 
> Unfortunately I cannot test this, as color temperature adjustments seems to be completely non-functional for me in the first place. For color temperature adjustment, I use gammastep on my machines, which uses wlr_gamma_control_unstable_v1 under the hood. It outputs the following warnings:
> 
> Warning: Zero outputs support gamma adjustment.
> Warning: 1/1 output(s) do not support gamma adjustment.
> 
> I haven't dug deeper into the cause yet, based on these it seems that wlroots isn't detecting the display as being gamma-adjustable in the first place.

The cause is simple: Qualcomm SoCs don't implement GAMMA_LUT support. Your desktop environment needs to use Color Transform Matrix (CTM) on ARM/QCom devices. You can refer to https://bugs.kde.org/show_bug.cgi?id=455720 for further details. It would be great if you can validate whether this patch breaks CRTC state (which includes the CTM state) on Yoga Slim 7x, or whether that is specific to the trogdor lazor (Chromebook Acer Spin 513), though it may require you to install KDE. Gnome does not support CTM yet (https://gitlab.gnome.org/GNOME/mutter/-/issues/2318).

Best regards
Leonard
