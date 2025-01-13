Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DE1A0B672
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 13:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E09F10E657;
	Mon, 13 Jan 2025 12:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Kd2nCSrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5B610E657
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 12:13:13 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5426fcb3c69so3600220e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 04:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736770392; x=1737375192; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ggEttB+Ig+Bz7ybwolYRC3yeEiYX+HeeyppyvsOBIZc=;
 b=Kd2nCSrXgFun/pT3s9xlXf7rtL4bgqkQi/JaLlwyWib15Uat0/uG1GikOMrXefGclB
 4GgM4REhK8mp6JCYUP5W3HtkQymE1dr+0YVbZK+fnByXLO8jCGG8886uWgOhaefyJlso
 VrmwBE3RU652+JnlEDwsAVJ3UJDaO3qLcMNmQJrj4yMhglAw+q7ptoGt699wJD6+7hqV
 u3zGgWZjMYafF61bsz3K0zpry/4RcJJQBywgxNeMdHHYVaS0Yny78cIV9HGBqYqu0Nmp
 ehFx/06UGpGjNWvIOR5V4jCVdBHAA9gyGrWxSlStGCIwl9g+nBaGPNl3sAnGo6dbBhD8
 O2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736770392; x=1737375192;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ggEttB+Ig+Bz7ybwolYRC3yeEiYX+HeeyppyvsOBIZc=;
 b=QlAmXOVZ5Gky1P8TkBxlIdGCkrp0kTbSuS3OwnfzG9hEs7i800NrD7Fq0aPFI/qTzM
 pXLmekcIBZEU3TxZ3fraCbydF7V77AY951qlWcR1CoUePTfYna/5LaXut/CWHD75keTq
 RqwGAidWrMDgeCKnau/xCmwT5mN2FGIn/z9EJo0qKHrJ+GZGYzqcrMVIRzeEli1ZjqDn
 Jy04gZVLsHKjZtbKRip6gt9vHRy8Einn5vWabjiA7G2+BoEnHNj6rwCeL32vNyO5otHF
 BxpiU3G6Gfx4sabKiRFrjP0ua9zbu8wOouRYRiLwJIkrAXoFXHNH80j7cylGrGwVD/q3
 jdzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1WZFt/0SmtiVD9CoFhmaeTvLwUx2GQgw8PInW8Tdl5mUUewHTRkJUPLHxXxbeMBo7PEfG/Bwl3mQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2wh5sshPHL5JcRuA1C3BokaSLpAzUkSTv7xPtxPHcrnfRXGqe
 9IZere+8f2SpPVj6Cfi84NuWnlB5dVQG3GUNyke2PRmYxIoE9ywyviAxS7DFWJo=
X-Gm-Gg: ASbGnctiVuYA7X56JsPHUxlPZ75TxRZw/4tk9QkmC6ZlopY/BWcSX8ih40n9jAgS14Z
 6KRYvW55RH6wvyPL2ftsak89sV79HXequeuz/LFQG7YYl7mrVaSjJTzIX2Ew66JxQQ4+knUonzJ
 zR9e5qm+IKASPbGCRN7Ts5tcOGJqnRFrntsy7/W0bsWdul7LPmxi3PkpVrIMcAHBO49HxsYw35C
 JRMVuiz7NvmoaJpeIxjLyB3fGUOmgVt9Jgl0+MfbkzrnZmTK+8M0gxN7y6ktOMgcW9Q1j/XSEYz
 VQmuhxPEywz1rKng4saQVjUJ81Hp9bP4g1sm
X-Google-Smtp-Source: AGHT+IHCGa5rn9lWyMqh8mQVDrsEl9vr/KAqV5tVASicZai5lykFeCgDGNkiRJea/sc3hviUH+ycOg==
X-Received: by 2002:a05:6512:1256:b0:540:1f2f:6ac8 with SMTP id
 2adb3069b0e04-542845d61famr6629822e87.33.1736770391761; 
 Mon, 13 Jan 2025 04:13:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be4a010sm1325391e87.35.2025.01.13.04.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 04:13:10 -0800 (PST)
Date: Mon, 13 Jan 2025 14:13:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH RFC 08/11] drm/msm/dsi: Add support for SM8750
Message-ID: <5irzvm4socrdjx3zqdxnogpai3bmfb52f63ddr3pisn5aa4jgf@mbc42kb3gyqd>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-8-b3f15faf4c97@linaro.org>
 <3p7kjok5jzwvgt7dxuad26xgdkjd52v4gbtuudvgkeoj33skqn@afl2ddtsq7s2>
 <4fc7fdd5-36cd-42e6-af4a-e0e429f9f50b@linaro.org>
 <7eupqawhdrbjgsj2p7e3ky7uj62m252i6dzkb6y23btocedp3q@qmw72nmbk2c4>
 <6ee02d22-7a00-4c7c-a5e9-63e91d7d84ba@linaro.org>
 <uyidfuh5ul5kcg4keeev6yagmjc5ksun626dyb6kdgwegc76d7@iu7ggdhgt5qr>
 <7255ae24-983d-452c-bd6d-85804c367f8f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7255ae24-983d-452c-bd6d-85804c367f8f@linaro.org>
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

On Mon, Jan 13, 2025 at 12:02:54PM +0100, Krzysztof Kozlowski wrote:
> On 13/01/2025 09:29, Dmitry Baryshkov wrote:
> > On Fri, Jan 10, 2025 at 01:43:28PM +0100, Krzysztof Kozlowski wrote:
> >> On 10/01/2025 10:17, Dmitry Baryshkov wrote:
> >>> On Fri, Jan 10, 2025 at 09:59:26AM +0100, Krzysztof Kozlowski wrote:
> >>>> On 10/01/2025 00:18, Dmitry Baryshkov wrote:
> >>>>> On Thu, Jan 09, 2025 at 02:08:35PM +0100, Krzysztof Kozlowski wrote:
> >>>>>> Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with two
> >>>>>> differences worth noting:
> >>>>>>
> >>>>>> 1. ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
> >>>>>>    offsets were just switched.  Currently these registers are not used
> >>>>>>    in the driver, so the easiest is to document both but keep them
> >>>>>>    commented out to avoid conflict.
> >>>>>>
> >>>>>> 2. DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
> >>>>>>    parents before they are prepared and initial rate is set.  Therefore
> >>>>>>    assigned-clock-parents are not working here and driver is responsible
> >>>>>>    for reparenting clocks with proper procedure: see dsi_clk_init_6g_v2_9().
> >>>>>
> >>>>> Isn't it a description of CLK_SET_PARENT_GATE and/or
> >>>>
> >>>> No - must be gated accross reparent - so opposite.
> >>>>
> >>>>> CLK_OPS_PARENT_ENABLE ?
> >>>>
> >>>> Yes, but does not work. Probably enabling parent, before
> >>>> assigned-clocks-parents, happens still too early:
> >>>>
> >>>> [    1.623554] DSI PLL(0) lock failed, status=0x00000000
> >>>> [    1.623556] PLL(0) lock failed
> >>>> [    1.624650] ------------[ cut here ]------------
> >>>> [    1.624651] disp_cc_mdss_byte0_clk_src: rcg didn't update its
> >>>> configuration.
> >>>>
> >>>> Or maybe something is missing in the DSI PHY PLL driver?
> >>>
> >>> Do you have the no-zero-freq workaround?
> >>
> >> Yes, it is necessary also for my variant. I did not include it here, but
> >> I should mention it in the cover letter.
> > 
> > Could you please possibly backtrace the corresponding enable() calls?
> 
> 
> It's the same backtrace I shared some time ago in internal discussions:
> https://pastebin.com/kxUFgzD9
> Unless you ask for some other backtrace?
> 
> > I'd let Stephen and/or Bjorn or Konrad to correct me, but I think that
> > such requirement should be handled by the framework instead of having
> > the drivers to manually reparent the clocks.
> 
> I don't know how exactly you would like to solve it. The clocks can be
> reparented only after some other device specific enable sequence. It's
> the third device here, but not reflected in the clocks hierarchy. Maybe
> it's the result how entire Display device nodes were designed in the
> first place?
> 
> Assigned clocks are between DSI PHY and DISP cc, but they are a property
> of DSI controller. This looks exactly too specific for core to handle
> and drivers, not framework, should manually reparent such clocks.
> Otherwise we need
> "clk_pre_prepare_callback_if_we_are_called_when_phy_is_disabled" sort of
> callback.

What kind of PHY programming is required? Is enabling the PLL enough or
does it need anything else? Are the PLL supplies properly enabled at
this point?

-- 
With best wishes
Dmitry
