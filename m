Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC38E9F89DE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 03:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE98F10EE3C;
	Fri, 20 Dec 2024 02:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MrlBfTX0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C30F10E4E6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 02:01:18 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53e399e3310so1475880e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 18:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734660077; x=1735264877; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EWBTHFNbhUAO2tJHYtLJkSARvPMYrKVes0xn2BSQkPc=;
 b=MrlBfTX06OW5ZlSWM0nlAg1lKYbvBj8RCffUnKEOHSKJLZSaTFieSaz0p61tai3xzf
 aYBNCLeqJFc4B/sDjnpZ+obvA0M6zr7QdAKxNl1Dg8p6XYsSFTRTsZLYLojfYvxBtbTc
 tDm9pbN5x/Jfux62CnNnAR22iyWgLqgrAmuP8q8enIs/AdaiRf6PD7UxhCDGIouaLAVR
 ojlhQLv157uhjBvbcevj7BRluEQ/AwxA/6/K5O1ZJWlAeLnWHcT9SNcB7Ymw3h7AkHIe
 Fkg3n5dtgku1Pza3a+NSQDhnBst3ChEYO1gj7gYiyoX2xWsF4DL2QmHBnQh5Nb2BTa3D
 LVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734660077; x=1735264877;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EWBTHFNbhUAO2tJHYtLJkSARvPMYrKVes0xn2BSQkPc=;
 b=gLq4UG7BSVSRJpFyyo9f+w7rJd7fsKi0dIp0RmzzUWkWqXcFVhdJ/g5LFiaBvlc0SG
 iL3w+NLvYVURoxb9SSFur2FR6aqNNmVU+L4t6p4o1yMexPJWgQwFgrsn043Resg+hDS6
 lv8MDA1z+hKvUsXLo097geHw97BNbQXM/zbBHlKVkHfeFMvnaR6mpPD5XlyBItN3JR9k
 x8jtQddKdsfgTV8KCJeijFFweGj6UZZVH+nlJqVtYHwTPe7+8ZfUuRfK5t2jct+q2KDA
 oPxKaUG7WnPkkn0EVNFYPkV/X/xCF80B3FnM10CQNOOIiarU8oMKnIESXBH0cPez+/sV
 RDMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXUMKshCGIrvUeJwpHF23N/rjfw9KvLEryfuQCo74uHF7Ighuyxl2akRS+IHcLGGBfz6sezw+3/Xk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwyaK/rbH0CY4+Wl/S9o14toOtmyTd68waholr22Zn/k75Vkwy
 pe/QxKCQdkCzSUOrF0yRdmC4AtMVzto7723nJCR3gxLP6hIxf5AQgw90R8se+rs=
X-Gm-Gg: ASbGncsCKqKvIHCo7P3hk9FwrXAEYUmRd+h9nrQ+4w5W1boFk/02gaXttN6f8IWpn2K
 ry8sVdXF7c7ZoG9r2sGmaZxelehWjcuW5UD9m3gi/uS3atUFnVZuT9KWUPURNG8/6bRBNgbSn0f
 1b99OUlKfiP+ClzyKv8Csrfyr9x9O8xLAwHBfO29JfH0jDIICVcmt/0sXbozFPlQq/0rIJDmhNs
 O9phtGL59FCSd3PmsNT6CcWvFa2yYkaUEzdRD4IdPCD0obsTcJFIrhXluRA8bTzVr9UcWZJxbHa
 UGmUsT9Rct3HklUdf2JmuHdyZIHNhDznEIec
X-Google-Smtp-Source: AGHT+IHhyKDZ3R905U4863Iiit2Hr7nBV4qFueikwh/HiT57AnESraqkbGPykNmkeBs/b1aNdwU6wQ==
X-Received: by 2002:a05:6512:118e:b0:540:22e0:1f80 with SMTP id
 2adb3069b0e04-54229530295mr201261e87.20.1734660077002; 
 Thu, 19 Dec 2024 18:01:17 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223600724sm344911e87.90.2024.12.19.18.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 18:01:16 -0800 (PST)
Date: Fri, 20 Dec 2024 04:01:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 04/15] phy: phy-rockchip-samsung-hdptx: Rename some
 register names related to DP
Message-ID: <pb5ds6pyugndyfttqeyy2czumaltagbuns5zfclvqpwcp5gdez@tfsgukr6irzh>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-5-damon.ding@rock-chips.com>
 <rkdp44csph6stq2e7emhgjziiwypcas7uqsvcdo7i6ypvg64uz@gnqikl5fzxqd>
 <20d95d18-ddbc-423e-ab15-d246dc605527@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20d95d18-ddbc-423e-ab15-d246dc605527@rock-chips.com>
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

On Fri, Dec 20, 2024 at 09:46:24AM +0800, Damon Ding wrote:
> Hi Dmitry,
> 
> On 2024/12/20 8:22, Dmitry Baryshkov wrote:
> > On Thu, Dec 19, 2024 at 04:05:53PM +0800, Damon Ding wrote:
> > > The modifications of DP register names are as follows:
> > > - Add the '_MASK' suffix to some registers to ensure consistency.
> > > - Complete the names of some register to their full names.
> > > - Swap the definitions of LCPLL_REF and ROPLL_REF.
> > 
> > Three unrelated changes, ideally means three commits (I won't insist on
> > that though). Also please mention that LCPLL_REF and ROPLL_REF were not
> > used by the existing driver, so it's not a bug and there is no need to
> > backport it.
> > 
> 
> Indeed, it would be better to split this patch into three different commits.
> However, I still want to keep the fixes for LCPLL_REF and ROPLL_REF because,
> according to the datasheet, they are indeed incorrect. And I will describe
> the suggestions you mentioned in the commit message.

I meant that the issue with those defines doesn't affect existing code,
so there is no need for Fixes:, etc.


-- 
With best wishes
Dmitry
