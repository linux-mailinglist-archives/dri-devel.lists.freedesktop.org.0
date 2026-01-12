Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC349D112F7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 09:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E13F10E046;
	Mon, 12 Jan 2026 08:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="XS7brIbs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0CC10E046
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 08:23:16 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-59b855a46d2so1497790e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 00:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768206195; x=1768810995; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OUxvknvL2YWQXQwD+7waJKw0gxMOdm8B3byZUil/7ag=;
 b=XS7brIbsAHC5C2iawDs2+HYFNLWtirFEGXKDRzHyHoIRrgQipHJBj4xD728yMz1nmc
 m1+jFY6ZIzzVGcNdGmGKTQWv8GYiNSZZkmlqb7QkHeS1SrKINulnsvlqBQeStfnwS802
 3csan01KtPBUP8pvkJBNE1+wBMUB4xOs0ui9Vs+t7pxjCCuGOLM8eFB6Cx4MUF/T+7GW
 XIk2xmSSogIDFY1N/vcJ2aUN2yxTTjHglpY7G4byAxVeJ2XBjfJL/MWFf6JLhNDsP82h
 2VinhS6ybQFLwGwTTXTrq8In4VaDm1kMKxCNvn3sAnVoNzL0dH8SwKAcuqon6Agx/elk
 0Y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768206195; x=1768810995;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OUxvknvL2YWQXQwD+7waJKw0gxMOdm8B3byZUil/7ag=;
 b=g41Z9gt6bvGdsJTBfNGv1P4LzlzboM8yNVUQ2A1iXczglBxLSUXYNspfzqObvCF22+
 OdQqGl/L8kp58Xsms7ogioYhUiFc6l+nUB2DrY0T2pBrlqR/7erjr3jB5zcowSgi50B0
 omSGWjC0T129fJeKtg929Dq9jkQf6hvqyzSUYSoRjoTjw/WoYJNVZyBW1Y7NHtfeMzF3
 h4spAkjLHlddCXS5j6YcGxhoJAlnVp2BMzJ1hQUYnO9VNUKdQPK5J9KjSdXF7U5AQjY5
 EwCHQP2nLjImwVItF0c/uCN1JuV3kZeR/+qeInL+HXD1/fwz//mN0cTw2aoGzdHZTHPM
 Na7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbIjjVirKOeq1GZUog3TQQpN0UW2a4I+K/aC8/CU2DX64Bedmctdno/xzMyWDavzevsoagRFk5JbY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKt+CQxyQm0mQ+dyCgm+yOMShitYAvD/vD0r/HzILgqe3NXf8q
 vGzlhcRZfN0HOK+LVVza2IhZdsQipdRdbDJ60e8qnUEl5OnUBW0X+oLjLy1skd+ZJNbA0vJXJSc
 C08MTpbZVvu+R4JExelU388Re7n9tWuenZI84Qgn1Kw==
X-Gm-Gg: AY/fxX7NwP7re4bNG6Yy8icfzZvOa7wI7t8JvuiKHUtpg0Q+7Ds0ZVWrF1G3eIK6tuA
 OznbsBPsPOjLbc+5X5x9M10lwP8XXDLWvow/tgcxqM1UxdfcVAporppxKfTf2PMMzvCHjZChewg
 ILvQj8YsKADuGUhdM3Zh/clMEg2bTIka0yBRuO1+CAdYT5VCDbDFZnX8RjQBiXTXe/61j/NpK9J
 +cAhABhhThDYZ11hwnGX9qMQfR9C9EvF7Sxhk+/ubaKdO7ewOOF5bYUYCA1RsR6tClNPd4FM37n
 QzOL9avwGED+FkWrD0xGikPF8K34
X-Google-Smtp-Source: AGHT+IE6p5/ZrwPp+xuSiOG+gGKacHGFDX09xl3BGCerXqWsyT2ieGJ7KPUjbuzOn9UrLQbKiZi7jmfAYVy4hhdoJck=
X-Received: by 2002:a05:6512:3e0a:b0:59b:8505:51e5 with SMTP id
 2adb3069b0e04-59b8505529amr2306172e87.37.1768206194825; Mon, 12 Jan 2026
 00:23:14 -0800 (PST)
MIME-Version: 1.0
References: <20251031104846.119503-1-marco.crivellari@suse.com>
 <176798671267.3432512.10099163174587731077.b4-ty@sntech.de>
In-Reply-To: <176798671267.3432512.10099163174587731077.b4-ty@sntech.de>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 12 Jan 2026 09:23:03 +0100
X-Gm-Features: AZwV_Qjx9rLgKQcPZeKegbP8uvfJGRMynbrqihioo2kQ-eL10Lfla26TS98jxTs
Message-ID: <CAAofZF7K3XokopS99UuizraGzF-=haLxYhDeBdmzELJtYvgTVA@mail.gmail.com>
Subject: Re: [PATCH 0/2] rename system_wq and system_unbound_wq
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

On Fri, Jan 9, 2026 at 8:25=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wro=
te:
> [...]
>
> Applied, thanks!
>
> [1/2] drm/rockchip: replace use of system_unbound_wq with system_dfl_wq
>       commit: 0650f4909af2bafe49322c91dd8dd0f68abfdf4f
> [2/2] drm/rockchip: replace use of system_wq with system_percpu_wq
>       commit: ab8559d44de5750e03778c42311aec8dd41a61f5

Thank you!

--=20

Marco Crivellari

L3 Support Engineer
