Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 695B443E3DF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 16:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331A96E0DB;
	Thu, 28 Oct 2021 14:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 586 seconds by postgrey-1.36 at gabe;
 Thu, 28 Oct 2021 14:36:14 UTC
Received: from 17.mo584.mail-out.ovh.net (17.mo584.mail-out.ovh.net
 [46.105.41.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2656E0DB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 14:36:14 +0000 (UTC)
Received: from player750.ha.ovh.net (unknown [10.109.138.120])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id C25BD213B2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 14:26:26 +0000 (UTC)
Received: from etezian.org (unknown [31.22.57.166])
 (Authenticated sender: andi@etezian.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 3424323A54006;
 Thu, 28 Oct 2021 14:26:19 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0034c0c6515-9f08-41d5-8798-fdd96c89b8e3,
 19738AB094897BD963DB89D239EF437C7015E8F6) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 31.22.57.166
Date: Thu, 28 Oct 2021 16:26:18 +0200
From: Andi Shyti <andi@etezian.org>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi@etezian.org>
Subject: Re: [Intel-gfx] [PATCH 04/11] drm/i915: Store backpointer to GT in
 uncore
Message-ID: <YXqzCkHPwlMoLKpl@jack.zhora.eu>
References: <20211008215635.2026385-1-matthew.d.roper@intel.com>
 <20211008215635.2026385-5-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211008215635.2026385-5-matthew.d.roper@intel.com>
X-Ovh-Tracer-Id: 12903375885699910154
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegvddgjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtugfgjgesthekrodttddtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughisegvthgviihirghnrdhorhhgqeenucggtffrrghtthgvrhhnpeelfeegueejvdelledtueefudeljedvhedvgeehledtfedtkeeukeekvefgvddthfenucfkpheptddrtddrtddrtddpfedurddvvddrheejrdduieeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejhedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
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

Hi Matt and Michal,

> From: Michał Winiarski <michal.winiarski@intel.com>
> 
> We now support a per-gt uncore, yet we're not able to infer which GT
> we're operating upon.  Let's store a backpointer for now.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
