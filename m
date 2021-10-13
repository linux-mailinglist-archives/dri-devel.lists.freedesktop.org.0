Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48F842B244
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 03:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A69C89C9B;
	Wed, 13 Oct 2021 01:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1200 seconds by postgrey-1.36 at gabe;
 Wed, 13 Oct 2021 01:31:32 UTC
Received: from 14.mo582.mail-out.ovh.net (14.mo582.mail-out.ovh.net
 [46.105.56.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3E189C9B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 01:31:32 +0000 (UTC)
Received: from player796.ha.ovh.net (unknown [10.109.146.240])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id F1D0D22F4B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 00:55:29 +0000 (UTC)
Received: from etezian.org (unknown [31.22.55.47])
 (Authenticated sender: andi@etezian.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id C2C10231A0DDB;
 Wed, 13 Oct 2021 00:55:21 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006d2cc06d3-2e70-4931-9f1a-eac143c2056a,
 C786CB9E79FC7D8AF81679FEBE5E79C8CF9BC842) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 31.22.55.47
Date: Wed, 13 Oct 2021 02:55:20 +0200
From: Andi Shyti <andi@etezian.org>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi@etezian.org>
Subject: Re: [Intel-gfx] [PATCH 07/11] drm/i915/xehp: Determine which tile
 raised an interrupt
Message-ID: <YWYueLmeWfeOWkLN@jack.zhora.eu>
References: <20211008215635.2026385-1-matthew.d.roper@intel.com>
 <20211008215635.2026385-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008215635.2026385-8-matthew.d.roper@intel.com>
X-Ovh-Tracer-Id: 3350959600001092106
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtledgfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihesvghtvgiiihgrnhdrohhrgheqnecuggftrfgrthhtvghrnhepveekjeegvddvheevueeltddvgfdvgffgheevkeffffevkeekheekgeehieelfeelnecukfhppedtrddtrddtrddtpdefuddrvddvrdehhedrgeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeliedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
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

Hi Matt and Paulo,

> The first step of interrupt handling is to read a tile0 register that
> tells us in which tile the interrupt happened; we can then we read the
                                                ^^^^^^^^^^^^^^^^

... we can then read the...

Andi
