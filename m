Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91808A2D37D
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 04:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C5410E1AF;
	Sat,  8 Feb 2025 03:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kNPCPoRw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A290010E1AF
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 03:24:36 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-307bc125e2eso25192461fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 19:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738985075; x=1739589875; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Tc6hvH16HL02+LBdNm0oBeAynWr7uQ4sq+3344BeoFU=;
 b=kNPCPoRw+YWWdGgf9tdy3uvxKrj2FoHOybPJbE5v8Hzxi+e4KE6rjs/u8aI76zeAk+
 0qsOat5AP4wNnMQ0jjzEpJJHPEvPSgHHzJ3UZJ1A2vTmp44kSJauo/qaYl93XKprqWPQ
 jZFZ2jk6E+YwSiJ1mdwFZlS+kb6D46ExlOO5xVWfPibyV/QuspNIBpaaB55cH+WJMHvE
 5pNr35usvvcX396eSBf5RT83J65/uhPLHHhElC8am8jHrsD9Ci2EBc0mGzLC4EiNb/an
 PLZHsFiCknUQvNZ9i0dCk7WeJLxy5lqD7yZkIZmix8Xlr/qDO5foXWdJSteMCggMTUrT
 36qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738985075; x=1739589875;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tc6hvH16HL02+LBdNm0oBeAynWr7uQ4sq+3344BeoFU=;
 b=o0ECD6EhWCPfmDQrkdW8ZYtJeo6TVrse6wTO/ixyb/AQ6kHHPvCkNLQLP70qm//vyj
 +ZRnI737NS8SILMhEwmGg6l2fzVLkS1mWGhDiiQZuYzlbS1LU2extwWfFmtK8IWTa/NI
 GkcJ/3YBgkvE22LAN6nCJFzZZb32Q+2LXDD9XzejipbzTrtV09lyUHNSJgYHCJgH3bzJ
 MYMXulg9Od/UdJN5sRCu2ni6irdV+oHqg0mYw5QEIfB0fQZGhPMZJ5Qe8pe623FQA7iT
 mbTeMItLI8XAiEORcVItXBytUAffe2araJHpBbbGhNOl1vAOzgxrxfclCqiZqgvD9UDe
 oTbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmvuyBCF2POhl/XQKfaVf1bt2s92/1aZmErqx0zuEJlYgF9jug4E1dzOe7AwPzsygXetRwDVGDMDc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2SqFeYGhbrSQ95gbCtFZ76shhaPodL59bGApBKjomLSfoasRZ
 P/occH2V4SgoUP93h+YpBwGVAQrPWa+OrGWIxqShRKzs6Ril8lkXQZU0pa0Puqk=
X-Gm-Gg: ASbGncsKjcscOt6PBJX/3PKpyhxMD2E3xLoyu+yncDTKVdhEIgdMSlmQY1wG7pX3VuS
 /u6Ak/xUCQziqG4f64KcQjBX8Ow3q4Pr6q91YHwUx5bEu60BFEdhPlxA9exzBO8mkm3FdcdV+sn
 vycaSlTrm9hMYCwE+A8U8RG/vG9Bz5MyYAVz5snL+HdLjbJR4qEVPN1vsyd704WmStcemEO5x0Q
 E8WA5o/iNQQyE4zxnEc3DGPE/z7FzYF0lJ3YqLLdNE7tBMAuFK4kYKxIw68P07arfYM3cKc79Wn
 98IpqYz8913SXHMQbqJz11yJqo/VCbeRx3FEkn/KLZED86TM8+wzTLjcqTQCI4xVoI+ZBYM=
X-Google-Smtp-Source: AGHT+IFydtUFynrK2gRpKzEKvd+/uEV8NSFd5so2WMhom1ky7+A67a+p0tJRz+0pk2ZePPqPbJ3Tsw==
X-Received: by 2002:a2e:a550:0:b0:306:1524:4a65 with SMTP id
 38308e7fff4ca-307e57fed91mr19942481fa.20.1738985074455; 
 Fri, 07 Feb 2025 19:24:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de1a67c9sm6260441fa.48.2025.02.07.19.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 19:24:33 -0800 (PST)
Date: Sat, 8 Feb 2025 05:24:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/7] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
Message-ID: <ry2jfdxhbogl42wbiajll5et5n2puvu46fn25v25qwpac7bbyu@wvhz3ijtfd56>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
 <20250208-bridge-hdmi-connector-v7-6-0c3837f00258@linaro.org>
 <9c35f577-2124-4f80-a5d3-542b47ed6825@quicinc.com>
 <7hpfx2whiyt5pjfcqnzmx5wllezlyttugmvqg2pg3be546m75p@5jfyw4z5wxsw>
 <af3fa1fd-122b-44e9-8e3b-48918bad7bab@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af3fa1fd-122b-44e9-8e3b-48918bad7bab@quicinc.com>
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

On Fri, Feb 07, 2025 at 07:05:14PM -0800, Abhinav Kumar wrote:
> 
> 
> On 2/7/2025 6:04 PM, Dmitry Baryshkov wrote:
> > On Fri, Feb 07, 2025 at 05:31:20PM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 2/7/2025 4:27 PM, Dmitry Baryshkov wrote:
> > > > Extend the driver to send SPD and HDMI Vendor Specific InfoFrames.
> > > > 
> > > > While the HDMI block has special block to send HVS InfoFrame, use
> > > > GENERIC0 block instead. VENSPEC_INFO registers pack frame data in a way
> > > > that requires manual repacking in the driver, while GENERIC0 doesn't
> > > > have such format requirements. The msm-4.4 kernel uses GENERIC0 to send
> > > > HDR InfoFrame which we do not at this point anyway.
> > > > 
> > > 
> > > True that GENERIC_0/1 packets can be used for any infoframe. But because we
> > > have so many of them, thats why when there are dedicated registers for some
> > > of them, we use them to save the GENERIC0 ones for others.
> > 
> > True
> > 
> > > Lets take a case where we want to send HVSIF, SPD and HDR together for the
> > > same frame, then we run out as there are no HDR specific infoframe registers
> > > we can use. Is the expectation that we will migrate to VENSPEC_INFO regs for
> > > HVSIF when we add HDR support?
> > 
> > Most likely, yes. That would be a part of the HDR support. At the same
> > time note, we can use GENERIC0 to send new HFVS InfoFrames defined in
> > HDMI 2.x (once Linux gets support for that). At the same time we can not
> > use VENSPEC_INFO to send those.
> > 
> > I can imagine that the driver will have to switch GENERIC1 between HDR
> > (if required) and SPD (in all other cases).
> > 
> 
> We dont have to use GENERIC0 for HFVS infoframes. We have dedicated
> HFVS_INFO registers for those.

Ack, I have been checking the old (apq8064) chipset.

> 
> > > 
> > > Also from a validation standpoint, I guess to really validate this change
> > > you need an analyzer which decodes the HVSIF. So was this mostly sanity
> > > tested at this pointed to make sure that the sink just comes up?
> > 
> > Vertex 2 dumps received HVS InfoFrame, so the InfoFrame contents has
> > been validated (validated SPD, AUD, HVS and AVI frames).
> > 
> 
> Yup, vertex2 validation is perfect for this!
> 
> Overall, I am fine with this,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry
