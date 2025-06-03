Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D868ACC795
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0364910E124;
	Tue,  3 Jun 2025 13:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T0ReAnAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0D310E124
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 13:20:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 839DAA5023E;
 Tue,  3 Jun 2025 13:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F34C4CEED;
 Tue,  3 Jun 2025 13:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748956844;
 bh=RLET0vNHW12fPEu2WD0/7IfHIEMQvJ29hvwt3raNVWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T0ReAnAt9ELewq8mhN1MKu8QAhUBd75lgYpwe/y0CJrqDw6NT+FXDbtF9D5Urf8+R
 cekywChSI4uLND1SK0Bn5LKBsmUdSS4y9xooQ7sbIx3t2UFvuhYAetxGCfRiWyarSw
 lpxtLwTHqkGlISZNDoK76o5Vyma7W6+nyM83Oc/lw55lo8umALKXhAERYZ6daDB54F
 idE2D7diFj8XpVZD1B8ScJiRh/wByJt2+wAFDq9xdFPySNqJzdiycQs17Z+3URIQus
 HxbKBuAXer5DK+Psal5gAlH0jurXXkKKNylzOyRRnplJRWgdg27xzMHqt69B0Mfwzd
 GMuFGku2QmpwQ==
Date: Tue, 3 Jun 2025 15:20:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/8] riscv: dts: thead: th1520: Add missing reset
 controller header include
Message-ID: <20250603-tactful-valiant-mackerel-bfb6be@kuoka>
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <CGME20250529222407eucas1p233be883d7e84e5a000e4d44b37cf7265@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-5-83d5744d997c@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-apr_14_for_sending-v3-5-83d5744d997c@samsung.com>
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

On Fri, May 30, 2025 at 12:23:52AM GMT, Michal Wilczynski wrote:
> TH1520_RESET_ID_GPU_CLKGEN and TH1520_RESET_ID_GPU are required for GPU
> power sequencing to work.  To make these symbols available, add the
> necessary include for the T-HEAD TH1520 reset controller bindings.

How would it compile/build without it? If there are no users, then do
not add unused header just to add it.

Best regards,
Krzysztof

