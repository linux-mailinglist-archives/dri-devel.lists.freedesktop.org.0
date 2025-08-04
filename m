Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9405B19B65
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 08:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0EB10E063;
	Mon,  4 Aug 2025 06:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TiZ54x9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9E810E063
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 06:13:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0F30EA554FC;
 Mon,  4 Aug 2025 06:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0401EC4CEE7;
 Mon,  4 Aug 2025 06:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754288022;
 bh=ouSCa63PfcibmTngtsiZfiLb80eCw/Ck6Mr/TiO6ydo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TiZ54x9nofxjzdr2CQm1i6/GPi3ANL7DIv32SIY1TpPIpjaLd/AiI0LjzGW4MjR03
 Hx+9OFcVj/dBU3ucCMeaofpTPeF0OhJaahKDui/GKWMYiDZubl6qwLYZnXKsCjK4ix
 fAuIZngS0SCWQWEG2MuQ3CySmkL4+A9VUK6ib7s6lBe2r0JMH7KqY9TwIjPI5IaEwP
 DxfCpKirLm3HkobXEGNpQMwX1i0FlJ8w5MF3PoGiS9K/+RQ9fWbi8RyDgfYt+F0nMJ
 SUA1kZ6q8GO33YjqacAOGtGsqqWznTz4CP2iuuDNlqn8aFAGX00N4dC6wGujI341FE
 tWPHmccRgKGAg==
Date: Mon, 4 Aug 2025 08:13:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v10 0/4] Add TH1520 GPU support with power sequencing
Message-ID: <20250804-sociable-sceptical-snake-f5ac8d@kuoka>
References: <CGME20250801103104eucas1p1dae57601c48faae879b154f11af8a4f1@eucas1p1.samsung.com>
 <20250801-apr_14_for_sending-v10-0-e85802902a29@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250801-apr_14_for_sending-v10-0-e85802902a29@samsung.com>
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

On Fri, Aug 01, 2025 at 12:31:00PM +0200, Michal Wilczynski wrote:
> 
> v10:
>  - Squashed the two dt-binding patches back into a single commit.
>  - Simplified the B-series GPU rule by removing the not clause.
>  - Reverted the removal of the items definition from the top-level
>    power-domain-names property, per maintainer feedback.
> 

You are using b4, so where are all the lore links for each previous
version? b4 creates proper changelog, so why are you removing them?

> v9:

Best regards,
Krzysztof

