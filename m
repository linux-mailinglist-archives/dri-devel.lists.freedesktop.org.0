Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 321D1A3E920
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 01:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C6010E196;
	Fri, 21 Feb 2025 00:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l2+IqDJw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2897310E02B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 00:21:03 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-546237cd3cbso1568085e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 16:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740097261; x=1740702061; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uumccPimCc696EpPgURZ0zz8UVBod+A3tWmA8Rwx4ak=;
 b=l2+IqDJw2XX2mnn44/DhlSsbgO7xH8CQBSM8gj/szVQNJr+gqiZcqoQg2Ugs0kqi1a
 cANesazoG9ARFsmn5fryVXvQwLn18VciWCp+87pxCr6Z/yFOzNPQinUhBVf4e7npErjT
 FMqFk700BuPJ2a+4wUURTW/4vad4Z5ADmijfSMeKnryRxGiTVwj8LB1wvMROxc38MMMm
 svRgb/n9OILZs1bktwP7GV4jw8jhxPjg+1bsPa3HWURJmR3NGsSF33wElGc3csG908K4
 BpKWEZFNGe01Dj0mvruicyeQHV56wlUMilyLsmiKgi/sgziDnS2ULxLk96q9VRf4hAVo
 HF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740097261; x=1740702061;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uumccPimCc696EpPgURZ0zz8UVBod+A3tWmA8Rwx4ak=;
 b=ALTz1qXLB95bnr/5PC54TMs1PIkvBUagAwvkkL+g8avqwBwZMqO3eKHyq97jSh3Xi5
 3H5bEgoIc72PZrIUINl58qgpuZ24C/QacNNgLHTx9yBTr6rw6P1xZG29++k+nazujpSk
 tCoB2ArS/9yADk76dlT9iBbbDj/2Si9qAS5npTXGAd3ZzXoh7dP/yi85QJq/JOcUfVMZ
 C8qgQQIqSe0MWXeRveeYmPxXzVhRBAStOrRPRUrq+dTxZioHcII20tZtdD0u0oD5j002
 ulZbm+Ll8ylwVWgGTNpKjBFruNIh9upuNI30yYl7BOgjEYOLvko37jn8eTr+vwMZmkSx
 4zRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb6eF+d8916gJfq+GRVjEWS4x7b1IiT/S/fBkzkpWshWp/xlds9KtvxHhynFAOQdiboLw5UHXODJE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydsUZoCQ7YmWNF7vLI32IbSzPC3evRgbTHC8qLrAOMBMQwMdbe
 kwRIf27vDJ4fl4M7zMEE/rmIrBDoTy5IAxiewe1Qmg8gEI5xGGkqwzCxC7LK2hY=
X-Gm-Gg: ASbGncsjuT3oTs/x6aO5mnH5tmsfYRnO2V5ZOTx+GH6jIpHn5ETNTSQM7GqXw+/urFH
 p/Ht3L/sZ37u0uTFZX6zVR40LjV1HmmsXCWfu0VS3+lbqqg99RstW1Lk+6PkZ8ej7XDyIRIWPqc
 dfZ+5wcn1h6uzNXPjkSM8vbEcxVbZPWCQ6+YhETcXnFoE7+2O1AlCEZjfVmv1go79SWFyZxZep+
 bq09qFjk38Gh9ofWrXQf/cRJzf3BXcbPkfUhPYGR15iXOP+gjRStblHH1VGxJdHi/NrPs02kVSB
 0WUCwTwL18Y3Gh7VEJ3oUrCUgIn/M1g8i5V2FDlylc1/NrhvkLinHeOBE381dUHXg/0ZXbE=
X-Google-Smtp-Source: AGHT+IGNo0fUbZvhJBTd0sVsxry1VC2OXImPx0tjx0XJ5qw8Unx7mQg3SjKB4fdzbc9nKdNk/+jLJA==
X-Received: by 2002:a05:6512:3186:b0:546:2f44:ee99 with SMTP id
 2adb3069b0e04-54838eeb268mr405891e87.17.1740097261039; 
 Thu, 20 Feb 2025 16:21:01 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-547df6106f6sm159624e87.204.2025.02.20.16.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 16:20:59 -0800 (PST)
Date: Fri, 21 Feb 2025 02:20:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm/msm/dsi: Support DSC for dual panel case
Message-ID: <jsir3n555ucylcc3m63gzrcf2arvsmsoivubsnrhzuxm3ts3qw@lyrghilffo5j>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
 <20250220-dual-dsi-v2-5-6c0038d5a2ef@linaro.org>
 <iibq3orsb7uf44luz2he2auox43ki42m2z4nnderyqlhypvfgo@pwqpvua6vuyo>
 <CABymUCNajuc8WnWgf2JehFYUY-MqxCYmD=By8nY-JppxYHsyNw@mail.gmail.com>
 <m7brftsrxdikfeumbjkubeeleezka7mwjbchxefqgs4ybtca5n@ge3ay2olagq2>
 <cokgqc6qd26caz63lwoyjcfbewbh3zxagjedzy6o6tfkt7wgmp@fz2gquyxcxbu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cokgqc6qd26caz63lwoyjcfbewbh3zxagjedzy6o6tfkt7wgmp@fz2gquyxcxbu>
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

On Thu, Feb 20, 2025 at 10:50:57PM +0100, Marijn Suijten wrote:
> On 2025-02-20 18:06:01, Dmitry Baryshkov wrote:
> > On Thu, Feb 20, 2025 at 11:42:28PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年2月20日周四 18:39写道：
> > > >
> > > > On Thu, Feb 20, 2025 at 06:07:56PM +0800, Jun Nie wrote:
> > > > > There is dual DSI case that every DSI link is connected to an independent
> 
> There is a dual-DSI case where every DSI link ...
> 
> > > > > panel. In this dual panel case, the frame width for DSC on each link should
> > > > > be halved to support the usage case.
> 
> use* case.  Also, it shouldn't be "halved" just... because?  It should be
> "halved" because apparently hdisplay here is the width of the two panels
> together, while the width coded in pic_width should contain that of a single
> panel (since they're independent), which is equal to the width of a single
> interface.
> 
> Tl;dr for below: this needs a *lot* more text to explain the setup and
> possibilities.  How is a DSI panel driver supposed to configure this on their
> end?  Hint: look at my previous drm/msm patches that explain how we expect to
> interface with the parameters set by the panel driver.
> 
> > > >
> > > > Isn't it the case for the DSI panel utilizing two DSI links?
> > > 
> > > The added case here is 2 DSI panel utilizing two DSI links, 1 DSI link
> > > in each panel.
> > > I assume default case is 1 panel with 2 DSI link, such as Marijn's case.
> > 
> > So it should be halved in your case, but not in Marijn's case? I can
> > suspect that if you are describing two DSI panels as a single instance,
> > you should also adjust drm_dsc_config accordingly (on the panel's side?)
> > 
> > Maybe drm_dsc_config.pic_width and drm_dsc_config.pic_height should be
> > set on the panel's side? But then, how will that function for the DSI
> > panels or bridges which can change the mode?
> 
> It appears that these patches are missing a proper description of the setup
> or use-case.  I previously NAK'd those "dual DSI" patches because of this, but
> reading between the lines I think I came to understand the reason without anyone
> else explaining it, unfortunately.  Needless to say that this needs very careful
> documentation and wording in both code (DT and/or header structs) and commit
> messages.
> 
> In my case I have a single high-resolution high-refresh-rate panel that can
> simply not be driven over a single DSI link.  A dual-DSI link is used in bonded
> mode, most likely to keep the clocks and other things in sync, and to make it
> easier to be represented by one virtual encoder in DPU?  All control commands
> only need the sent over one DSI link, not over both.
> 
> In this case pic_width is equal to the entire width of the panel, hence it is
> double the width of a single interface.
> 
> Jun seems to have a strangely different use-case for bonded-DSI / dual-DSI that
> isn't explained: two "independent" panels.  It is clear to me that pic_width
> here has to contain the width of the entire panel, and is hence equal to the
> entire width of a single interface.
> (And in the future, it seems the quad setup can drive two "bonded" panels with
>  two DSI-merge's each)
> 
> But what we're missing here is what the **advantages and limitations** are
> of this setup: why would one run two DSI links for "independent" panels in
> bonded-DSI mode?  Is it more power-optimal?  Will userspace see this as one
> panel that's simply twice as wide?  Do these panels have to be "identical"
> so that they behave and are clocked the same?  How is the driver expected to
> prepare the mode and DSC configuration parameters to make this work?

Fair enough. Maybe you will suggest how to handle it in a more efficient
way. We have been running such configurations (2 independent panels over
a bonded DSI link) in order to get a single synchronous CRTC vblank for
both panels. This is a nice hack for the software that outputs data for
both panels, but doesn't want to be concerned with separate vblanks.

> Perhaps it's possible to scrape this info from [1] and prior commits but I
> rather have a more digestible description in the commit message, thanks.
> 
> - Marijn
> 
> [1]: https://gitlab.com/jun.nie/linux/-/commit/98c0f411a85d68a76be500f8421df467d6cc53f3

-- 
With best wishes
Dmitry
