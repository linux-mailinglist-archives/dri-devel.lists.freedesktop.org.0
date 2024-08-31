Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45220967241
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 16:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C80989D9A;
	Sat, 31 Aug 2024 14:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=lausen.nl header.i=@lausen.nl header.b="Y+haWd6F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is
 [185.26.156.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E64F10E126
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 14:53:29 +0000 (UTC)
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
 by mailgate02.uberspace.is (Postfix) with ESMTPS id 2F7C518039F
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 16:53:26 +0200 (CEST)
Received: (qmail 12192 invoked by uid 990); 31 Aug 2024 14:53:25 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Sat, 31 Aug 2024 16:53:25 +0200
Message-ID: <9723f25d-1005-4045-b8f2-7c2d06f30394@lausen.nl>
Date: Sat, 31 Aug 2024 10:53:19 -0400
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
From: Leonard Lausen <leonard@lausen.nl>
Autocrypt: addr=leonard@lausen.nl; keydata=
 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 Sw==
In-Reply-To: <b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-0.000362) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -0.090362
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lausen.nl; s=uberspace;
 h=from:to:cc:subject:date;
 bh=YyHUK4IQnTPVeEYta+n1gsttoFXt/qfofrar4WmPX0o=;
 b=Y+haWd6F2IkMZFwSh6XhOxrXM68YxkZSpN/H80ZBRQNLHfuwidSidGR4PD9M+Gzi15Jk29us7A
 bRQJ0xuAOLBWqEexqccheh2Tan22DqzMAJ2F3Ot6Ez5HqWvj5CZchmTdgriNGQXTEjSiTBGlpEzo
 HoctCqB47hI81L/hxhzRUe2F4/4iHs81Khy3rsvxA4s2Z/6detbkdS5gY0kyqMLwOktmoP7n0A9v
 lE0dLsmUic7nv7L73f0O/uZfxMUqMDAW83e44TwGsjtAOWEOW/1yeoF90sBn5v4QXBal0+40XS+r
 V+M51ztYaTKdG+hA26AK8SZifxYTU0+khBNSrE7XSGyCrFjTe3B005kfBaWKAkI3KQZDqD9QvAG9
 hQZ6xVIXPriN2d92DYBxdbi7kKBNcpuNrlScbVWv0HWUwstlPIj1rZ9v8fcIbjZiPd9y3LM/Ky1U
 ZZdUPhrXwPZEQk/YwkUQtppmozUxDvjN+71MYaPyeo0vovbyOFG0tf291v4AW+Yr9fKFm03pQPpr
 OZYmkxwfZ7osHZ9YjQpS/AVXtsCU61v+5mfW1joq6/AiFMEoeH+PbF6Ro0eAS2WVgt67d/oh9wzX
 0hMVxoqrOIsgOdmxaNACJTte1joMG7h1SUt9s5VHmualyyJny0muzZN4ODus91qj/LiJUOXRMXF0
 c=
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

On 8/30/24 13:36, György Kurucz wrote:
> For context, I have a Lenovo Yoga Slim 7x laptop, and was having issues with the display staying black after sleep. As a workaround, I could switch to a different VT and back.

Do you observe this issue on every suspend-resume cycle? On sc7180 trogdor lazor, I do observe the same "display staying black after sleep" in some of the suspend-resume cycles. I have not been able to observe a pattern with respect to when the issue occurs and when it does not. "[drm:drm_mode_config_helper_resume] *ERROR* Failed to resume (-22)" is printed in either case. Switching to a different VT and back works to restore display functionality after those suspend-resume cycles that experience the issue.

On sc7180 lazor, I do observe that this patch deterministically breaks restoring the CRTC state and functionality after resume. Can you please validate if you observe the same on Lenovo Yoga Slim 7x? Specifically, try set Night Light in your desktop environment to "Always On" and observe whether the screen remains in "Night Light" mode after resume. For lazor, "Night Light" is breaks after applying this patch and even manually toggling it off and on after resume does not restore "Night Light" / CRTC functionality.

Best regards
Leonard
