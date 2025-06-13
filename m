Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846CDAD9029
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CE010E030;
	Fri, 13 Jun 2025 14:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dWqW3fJF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99DD10E030
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:52:31 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-748435ce7cdso2019612b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 07:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749826351; x=1750431151; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nX9ttAjMiBk5GnAWKnbFZ+j4zoLGHNZodgimLxzGDTU=;
 b=dWqW3fJFuXE5PVKYpFZ78uDtJHbs9vQamgn5J3FznOJaWmTz+Cwi7ikgokI8YwKN3z
 +T09EitpKoRzVrqWPuDZ9B73G95iVkD6vl9XkDqSPISCY2E2QssG2Wji08PQ1W4K4wqX
 +ba6eZZy41kguraUKN65CUTi+f/M7mmkJCs64+JkVIO6moklteUi+sm8U360FpSMQLOj
 c7cPcL//DMGru2VNmpgbtdL3WcWgYcNZfSDF3A+PIq461twiH/1uUfAp5+Gj0AM01S4q
 XOovSSeK3imLoSu5dYtty0j4Q7ec28QpygKEqKFRjXEu5HuOK9RCA05M4oliweV+ioez
 x65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749826351; x=1750431151;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nX9ttAjMiBk5GnAWKnbFZ+j4zoLGHNZodgimLxzGDTU=;
 b=o88RHfjwp1rO+Nwy3v+/U7s+qLpiKED1Orq3mUiRRVOVGOSFMJpPBVG0mxtzSFPvoX
 P6ZXmDMekQlUeBj9V4/XQufZvLpGmVtyoxiwKRTpye+Y+jUw/qY2BpwmeC6HfqpL7hq0
 HUAN/NEVxtfyO4Ig+IQHIuNrJvrr4vHnW4xISSaWgE4V6orCNsG4RyzrFKknk5kq95Ut
 LTb8d/DLvyZQHKAGdzZuR1TOp+LOmrA8WP4WHr9UB67bKqHYTvDRuPFKAfr3uE/JioIh
 XB6TnYmPNKqJQK6z5gBbaYjQZbV/aIblxs+bwCfYUS9F0qTETlBAjYEcRSUONL51uoBX
 AP/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnGQ9kJtF0q/HKz3Ozd4rJgTgmPW+GIVkpIUxiu/6rGMd05wSWnDjeUIEeH0g+PK0CGUC0EOUcDxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz5qYaEChHSpZTuotLdqs+//aAkaDoXnKtV3WKlBaQEuKvTUWp
 xnltr5Pzno+OsFtZNDzQtonZTc9BQC91Go+YGkRaf2oo9NEa9LylX5gB
X-Gm-Gg: ASbGnctUNIzPhzAU35idutT0GQMR0uqi+LnGd4k7zhTfqj0RqmwHSSk3PngqEvyQgDk
 eO/5L+cwE/NoNsSgWweizHR92D86OwAMWii6zcB7FaZEDtqLCbj503RQQYqqOBk3nRUgWToCkTO
 uKKKJABqToIXxDQXnTTIvIay8byowAL8W8Y53I9qli6RgcJyd6dveFToDR0YLBQU/2VD9NpD9TQ
 Ea0Lf28J/g0KIDSSpbJpMzmzZNPtVs5g/d+dvNqgj50RgaAMDTfXMhB3Lf6ZTbE1cFboaW4nY5H
 27X9HqL96qAY18vCU5PViJYzjjmz3RygLU7ZPREe4d06xxbcqbc6QH0bw3iR/g==
X-Google-Smtp-Source: AGHT+IGmduwXbHVfGIDlskqKLcCBNDCHGWRFnOFCbxfY7iXbpVq03NTOlkVGcUndD/CI3gBb8mRMVQ==
X-Received: by 2002:a05:6a00:2d8d:b0:742:b3a6:db16 with SMTP id
 d2e1a72fcca58-7488f7e38f1mr4843190b3a.20.1749826350828; 
 Fri, 13 Jun 2025 07:52:30 -0700 (PDT)
Received: from localhost ([216.228.127.129]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900cbf58sm1723692b3a.148.2025.06.13.07.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 07:52:30 -0700 (PDT)
Date: Fri, 13 Jun 2025 10:52:28 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, linux-pm@vger.kernel.org,
 netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 01/20] bitfield: introduce HWORD_UPDATE bitfield macros
Message-ID: <aEw7LBpmkfOqZgf1@yury>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-1-f4afb8f6313f@collabora.com>
 <1437fe89-341b-4b57-b1fa-a0395081e941@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437fe89-341b-4b57-b1fa-a0395081e941@arm.com>
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

On Fri, Jun 13, 2025 at 02:54:50PM +0100, Robin Murphy wrote:
> On 2025-06-12 7:56 pm, Nicolas Frattaroli wrote:
> > Hardware of various vendors, but very notably Rockchip, often uses
> > 32-bit registers where the upper 16-bit half of the register is a
> > write-enable mask for the lower half.
> > 
> > This type of hardware setup allows for more granular concurrent register
> > write access.
> > 
> > Over the years, many drivers have hand-rolled their own version of this
> > macro, usually without any checks, often called something like
> > HIWORD_UPDATE or FIELD_PREP_HIWORD, commonly with slightly different
> > semantics between them.
> > 
> > Clearly there is a demand for such a macro, and thus the demand should
> > be satisfied in a common header file.
> > 
> > Add two macros: HWORD_UPDATE, and HWORD_UPDATE_CONST. The latter is a
> > version that can be used in initializers, like FIELD_PREP_CONST. The
> > macro names are chosen to not clash with any potential other macros that
> > drivers may already have implemented themselves, while retaining a
> > familiar name.
> 
> Nit: while from one angle it indeed looks similar, from another it's even
> more opaque and less meaningful than what we have already. Personally I
> cannot help but see "hword" as "halfword", so logically if we want 32+32-bit
> or 8+8-bit variants in future those would be WORD_UPDATE() and
> BYTE_UPDATE(), right? ;)
> 
> It's also confounded by "update" not actually having any obvious meaning at
> this level without all the implicit usage context. FWIW my suggestion would
> be FIELD_PREP_WM_U16, such that the reader instantly sees "FIELD_PREP with
> some additional semantics", even if they then need to glance at the
> kerneldoc for clarification that WM stands for writemask (or maybe WE for
> write-enable if people prefer). Plus it then leaves room to easily support
> different sizes (and potentially even bonkers upside-down Ux_WM variants?!)
> without any bother if we need to.

I like the idea. Maybe even shorter: FIELD_PREP_WM16()?
