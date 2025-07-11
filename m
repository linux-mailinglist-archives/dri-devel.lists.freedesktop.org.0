Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D2AB022F1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 19:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AED10E2C4;
	Fri, 11 Jul 2025 17:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WpPGK+iV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2185910E2C4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:44:30 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-32f1763673cso31037991fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 10:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752255868; x=1752860668; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
 b=WpPGK+iVTe1P7ee3gL8K+Cd9xYjdAyvE53eydFlPY1c6yAZmQ/GiT7/WBU41j3WEt+
 XBpbSzb8g0YtQA33cSSu4SrLI5Z2tsoxuwHtOcud1YG+oyX0Qw62j/LvxzMfVWpBkE7r
 YlT3Z0/C8XTBIfUH3pIG51YJFk/6qL0Ov1jwV7FzujOpMzCikxFh8HCZL51/wx+ySkJI
 flVvFtLXxRe2zeerS6fCvSn1JC8nlAWj4/PKjvWAn4T42TDjiJobBKoxN+ZMCceOLxjm
 j5UTPQyScXX4tHAic9RsL3KLMSMm3kSttSYprOiOW5fYkVI5sKGp9DYxmltAF73z6mhR
 ijCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752255868; x=1752860668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
 b=JXKsOmpz3MzZEv3fPlxSav+lXOnpr+hApDn95e8Qw9tZS+P08dF/GlBavA7U2+bG6t
 ZCDYraIqMl/+l86uMgh86pTKTCfPatoPEZrU4QnYtDKX6xSib3XQbpmdpBQP9CcuwpNv
 CE1MQOU1kdl95Tpvx5kwxL+Kzl3SnnAcsxQ8OWO/ZggFQZr5QlPsQopYJo/E260NEZVn
 Zx6uFEDpY3u0N3gQ7bAsttUBaaVEZ0sX2V/VWYoGGVkoWoai7FSG6CLFZx85UJZCqvDP
 rVhi2pa37MwxQuvAR9M0XFTrcW+ZFbDk5Fe4ho+Dp4GyfUA1YdQGfs7Hq15z0alEHYoj
 p0RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCOs4Kbe/A7VKH33QTnZoHqOXOjOpc7/JBltQvySpzUB0bzNr+6czwttKZQmwHcHeDZmTLG/WGEhE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMS5g3njGIOIQ+j8SvSjnVBSqgx92vKOIeaRMgSxA6//QPIJig
 YfDdpnMHefMxXDnVjc+qWTPtlNKgLIBVZUpKPQmlKTtgD6/uoPxqK2ruVOKPTIa7DOJAleTqoOm
 2yKnhGnq5LN8K/4UWZF3SZ9m9V6oxmfr0Ma8VeCECvw==
X-Gm-Gg: ASbGncvQFlkH9xDhtuIkiksFnEM/WSXy8TBDG5fCKpGWxv1Zo3Uk/QEdvH3Nn0ajAUz
 yGSxYkDt+gnRuj+usbu8rsZ+UiZOFyRZqWzGC/6c7DYsKr/Nn8I/AXgcwSgdSHQ/7wg5nw9qaNS
 hH/w/InSIINCiiaHqcXqbHTXg7JwgDmz3IA7dYBeNoB9WyYcdMA/Jdyn6H+C6gAKUYfwRqBOJhq
 Ypt5R4=
X-Google-Smtp-Source: AGHT+IHCwFbr6hM4SofCoKFNuaGsZexul62ZHJaP09xPkxTc5K3eZJNMRyy9Lqm+DJrLEpWrNm0Dt8rNW5UZHZ3ILnk=
X-Received: by 2002:a05:651c:111b:b0:32a:6b23:d3cc with SMTP id
 38308e7fff4ca-3305341163emr16031911fa.25.1752255868348; Fri, 11 Jul 2025
 10:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-2-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-2-601b9ea384c3@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:44:17 +0200
X-Gm-Features: Ac12FXy5w5LZfYTJ16GWumg6iWoXPYqfrbZ0euf79O43X2SKG618Bj4k3h1lAGY
Message-ID: <CACRpkdZus86rP1BiSw2j24eaSuMrCEorZU9Rc4ouWmmz8iaqhA@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/mcde/mcde_clk_div: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 10, 2025 at 7:43=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:

> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
