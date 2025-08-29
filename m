Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0105DB3BEDE
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 17:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECA610EBF8;
	Fri, 29 Aug 2025 15:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="lK1O57V5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F19410EBF8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 15:10:05 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7f6d8fcd106so304500885a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756480204; x=1757085004;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EGLIvrEeA6aZSH5bbWcCyh35lvNtwwlGEu4excYVUnY=;
 b=lK1O57V5WV23jTI8jLHiNwu2xusEHKL1ahDG5ZzPbjkAL/ug/WdoxjxqRdP9KAbOWW
 Ge8XLSxhRVc/ogMWoy8LZdr6wE5zV0oKOKVPoZTDYvOvhV+7u214MXDjhL5fS11RTmhz
 ZuxO9OxsbSgSQ57aPzW/VSBKjp8xa75Trr2d9sUDTxiaWhpwCs5XfFvqJhiIyEkNvuCc
 jLukSGtethM8ocqR46v8MeS+cLh83Tbfh6dn3bLZQngHoiTwdIUc/KzWWef7QI722Dz1
 oausWNa2D03FxHQm8q28EdykOrbOhbIHWFuxTe5TWbdAh2JxpRkxdh44ioYjqvy1PuAQ
 kiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756480204; x=1757085004;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EGLIvrEeA6aZSH5bbWcCyh35lvNtwwlGEu4excYVUnY=;
 b=IE2pqbHoM6HRepxgV+GRQUH7P8jLqLnv471t8YpDs4x1aBoTCV+I4ncr5ovafrpBSi
 QJsVfoE9Mz2R7cKnwL6GKb4riYmfbtnZF1jE0enh/OUzQypy3OJxfjF/6S3TrpHr8gBL
 AsWwDeGGQfORxhSECdaHBsDjpDFLwFQqL5IXpBoqgL4+/wLztLejoAbJS4VqLQSjJQHv
 jYpmN0xLHyjsc998+HymaXXxWQPAezQRvE+Ss6QtqrALWOsth6j1Y7wK4QLxFHUDmnEz
 P6w6rQcbthZu8eOMBylyWuoCb+/imYe5Ogpiq/ymJawE5SYhLe8SwvNcDhyUcjsuj8On
 Idlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr/jaQzrjsouTkpAq8cYwq/b00ISWr2Ze2z6rDQlizc5bBKMk10HEIozxYc+udjcmqSd3mICmpTKs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpF+Km5eWYZiKp0pCDcGNVfDT2sFEH3RdOYp94EZLHRlhpE1ax
 recKg4MFWWY0eucac0Epk7l7XyPAe8l5OwGxIvgINYaPnM5HQGxqJ1pllN2af61p49y1/EtJ8FX
 yi5IC4Hxy7F2kv1rVisT4OKOQDoRBIGhc1Zvuqrp4eg==
X-Gm-Gg: ASbGncvNILY1WAKGjGnipzCStbKPpOX3Yi4iZpHoRbfLrSE4cNOZdj6l4pXeSZtcbZ8
 h9qrn8NzEoaG1PJXXZZavYw8vQd8llmVzZiXOl8l8Pd5R5pQ7bXH8EeQAF+ruRRMwc4V9k64eoM
 E+JwI9/Udrh/h/e1ImmRzjebGsUHZYDAgdDnhtBoK6qCPE4SHNVNDPeZfM1KTj/bc6Koh6yifQ0
 C5uKQ==
X-Google-Smtp-Source: AGHT+IGKh7Y20GWjms5CEWqUFYK6Fhl4aSsCjrhVa2muuLuQNwyCT8KtW05eeJgqP4jwNECHf4vjyNzCIEKa9V1tI+Y=
X-Received: by 2002:a05:620a:269b:b0:7f9:98ca:af1f with SMTP id
 af79cd13be357-7f998cac79emr862285085a.32.1756480204505; Fri, 29 Aug 2025
 08:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com>
 <20250825-rk3588-hdmi-cec-v3-3-95324fb22592@collabora.com>
In-Reply-To: <20250825-rk3588-hdmi-cec-v3-3-95324fb22592@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 29 Aug 2025 17:09:53 +0200
X-Gm-Features: Ac12FXxjT2DMgVXZUD7stQTdp-evPmAyNIHAST4h_-TfcQ_juOKoIsGqjkI2p6g
Message-ID: <CAPj87rPhhhhEHrPqAcKNtWwAtCQRANp_=8sQtg3urqf5wcrmsA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] drm/rockchip: dw_hdmi_qp: Improve error handling
 with dev_err_probe()
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Aug 2025 at 10:57, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> The error handling in dw_hdmi_qp_rockchip_bind() is quite inconsistent,
> i.e. in some cases the error code is not included in the message, while
> in some other cases there is no check for -EPROBE_DEFER.
>
> Since this is part of the probe path, address the aforementioned issues
> by switching to dev_err_probe(), which also reduces the code a bit.

Reviewed-by: Daniel Stone <daniels@collabora.com>
