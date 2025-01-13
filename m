Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B62A0B122
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 09:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2541D10E4C8;
	Mon, 13 Jan 2025 08:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WI72mi8N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248AD10E4D6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:30:00 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30219437e63so46757731fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 00:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736756998; x=1737361798; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wpNfgPmZHWvswUwSBHQaLXxsDd/iOPSUp9zWO21bZZk=;
 b=WI72mi8Nuk9oEy0zaAr/LSgMsYuDDKSHqmORbvdzfIFX6G5dp+HXLh5HlXPzmTwH4g
 N4EWV/tHsMbnj4Dqi61Ns7wVI8NY6lugVwsSp50vH2wq1Jby3xWM75YiAlO4dcuNtk5/
 sRAb2xncPNIPl55TQmRaTyqM9pbfoGqkgjusBG36Ofl87Q8wiMEezOBsD7WvpbwkIJXW
 eoNb8zMR/DVaaO6QPfFzBHIF3jdREjmG7Yva7TWBH30DzVqsvhHuSr87Px0iHpO+z3uF
 ZbJ9QZizOMbSUtPVWXXTunDcoSSLf4QjzQPiYu3MM4W0HA8stDovNSWdXqt1fLwSN+2r
 VjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736756998; x=1737361798;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wpNfgPmZHWvswUwSBHQaLXxsDd/iOPSUp9zWO21bZZk=;
 b=L7LhWX/VMXWvuSFTLHjKPw8d+Pmtw9GMiEkmqqZUQLFZh74LRGVpUSfNLp8+obF09E
 iuwgXsLkUVqMK0+gtQ41fXGEoHbndhQy/AZJqXBTq0v4PenUE8KxUBhpN83UG15l2K9x
 ZKFxwwRTkN7sdekYYVull4DUYYyQy55FeCVJslIcSPsMLFkrvzX3WMbtAw/8Ic+lG+wQ
 oJ0fOGH1FlmgHRHOaT3b/CCAwDDRT7Vks4COlPJrHu2leqMdVxNkCz0GWM1dB0e5Ci6/
 s1DFLqeyNzsl4W8pgrH+OyyElXjo4id5FDAfrFEJlD1EiDo6qGPxIFy/op6YRZGFx16k
 nQMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBTG1vnJBhMwxjiTNBeg0JSUyNpecYTWxSJS3VQExhbogcj3+T9gEFs4/Xl1Tq2sC+RXq+C/P6WNs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwivtcP6dyD9XMdNvnQwSrOMqcQ57aq4TibFo9e5RXk22d7YGkV
 I4z0Bf7KY+wdlfIdP9x3ltKmh6L3wljydskXUrrhpKdZ80cGsb7Zcu49VIr+pKU=
X-Gm-Gg: ASbGnctd9M7Ps09smOcRrg4FPu7QUcO4IQVMGrDjNgUTi16CRaSi+CDNIwBqsVH7Bcs
 1jwihWm5pe3JqQo8W5xi9Oh5UTQGI0OjBvQQNjhqfpEawUrKpOoh+e9Kwabv+M2zCImg+b5zbqN
 A5FFfAs4C7Lg7et2eHXXgowmJaslsVToSiEkleMYtYu5Gl2DM3x9TmNYDaPmON5a10CPPBQtO3h
 wtVfPV5qwcxnXI/rrWu4R+b/Af9VU89r9ogePhpXZOWg/0fKQVemi0H+gz9jAZO1xicJ3dErUW3
 +4kkwYX5+wzof/QjR6VujdheeUAliBc/PRL1
X-Google-Smtp-Source: AGHT+IE54yzyiPD4ub1IysG2kNFqrLtRmbf0RfdOOdV+LhLhjjBOzskOmKPSTGDp09AS8bI5jIgTSw==
X-Received: by 2002:a05:651c:b08:b0:302:2cb3:bb1d with SMTP id
 38308e7fff4ca-305fee0b3a6mr41291591fa.12.1736756998394; 
 Mon, 13 Jan 2025 00:29:58 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0cf1f8sm13837701fa.27.2025.01.13.00.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 00:29:57 -0800 (PST)
Date: Mon, 13 Jan 2025 10:29:54 +0200
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
Message-ID: <uyidfuh5ul5kcg4keeev6yagmjc5ksun626dyb6kdgwegc76d7@iu7ggdhgt5qr>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-8-b3f15faf4c97@linaro.org>
 <3p7kjok5jzwvgt7dxuad26xgdkjd52v4gbtuudvgkeoj33skqn@afl2ddtsq7s2>
 <4fc7fdd5-36cd-42e6-af4a-e0e429f9f50b@linaro.org>
 <7eupqawhdrbjgsj2p7e3ky7uj62m252i6dzkb6y23btocedp3q@qmw72nmbk2c4>
 <6ee02d22-7a00-4c7c-a5e9-63e91d7d84ba@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ee02d22-7a00-4c7c-a5e9-63e91d7d84ba@linaro.org>
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

On Fri, Jan 10, 2025 at 01:43:28PM +0100, Krzysztof Kozlowski wrote:
> On 10/01/2025 10:17, Dmitry Baryshkov wrote:
> > On Fri, Jan 10, 2025 at 09:59:26AM +0100, Krzysztof Kozlowski wrote:
> >> On 10/01/2025 00:18, Dmitry Baryshkov wrote:
> >>> On Thu, Jan 09, 2025 at 02:08:35PM +0100, Krzysztof Kozlowski wrote:
> >>>> Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with two
> >>>> differences worth noting:
> >>>>
> >>>> 1. ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
> >>>>    offsets were just switched.  Currently these registers are not used
> >>>>    in the driver, so the easiest is to document both but keep them
> >>>>    commented out to avoid conflict.
> >>>>
> >>>> 2. DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
> >>>>    parents before they are prepared and initial rate is set.  Therefore
> >>>>    assigned-clock-parents are not working here and driver is responsible
> >>>>    for reparenting clocks with proper procedure: see dsi_clk_init_6g_v2_9().
> >>>
> >>> Isn't it a description of CLK_SET_PARENT_GATE and/or
> >>
> >> No - must be gated accross reparent - so opposite.
> >>
> >>> CLK_OPS_PARENT_ENABLE ?
> >>
> >> Yes, but does not work. Probably enabling parent, before
> >> assigned-clocks-parents, happens still too early:
> >>
> >> [    1.623554] DSI PLL(0) lock failed, status=0x00000000
> >> [    1.623556] PLL(0) lock failed
> >> [    1.624650] ------------[ cut here ]------------
> >> [    1.624651] disp_cc_mdss_byte0_clk_src: rcg didn't update its
> >> configuration.
> >>
> >> Or maybe something is missing in the DSI PHY PLL driver?
> > 
> > Do you have the no-zero-freq workaround?
> 
> Yes, it is necessary also for my variant. I did not include it here, but
> I should mention it in the cover letter.

Could you please possibly backtrace the corresponding enable() calls?
I'd let Stephen and/or Bjorn or Konrad to correct me, but I think that
such requirement should be handled by the framework instead of having
the drivers to manually reparent the clocks.

-- 
With best wishes
Dmitry
