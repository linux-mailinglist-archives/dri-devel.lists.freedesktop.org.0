Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC3D43E63D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 18:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249246E0AF;
	Thu, 28 Oct 2021 16:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net
 [46.105.63.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC75D6E0AF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 16:39:39 +0000 (UTC)
Received: from player787.ha.ovh.net (unknown [10.110.115.231])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 77C0C23FC8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 16:33:22 +0000 (UTC)
Received: from etezian.org (unknown [31.22.57.166])
 (Authenticated sender: andi@etezian.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id 34FBB23ED280B;
 Thu, 28 Oct 2021 16:33:14 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005a037f3d6-d91c-491d-be00-dfefa369bff3,
 19738AB094897BD963DB89D239EF437C7015E8F6) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 31.22.57.166
Date: Thu, 28 Oct 2021 18:33:13 +0200
From: Andi Shyti <andi@etezian.org>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi@etezian.org>
Subject: Re: [Intel-gfx] [PATCH 10/11] drm/i915: Release per-gt resources
 allocated
Message-ID: <YXrQyaDnNEtOqJ2K@jack.zhora.eu>
References: <20211008215635.2026385-1-matthew.d.roper@intel.com>
 <20211008215635.2026385-11-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008215635.2026385-11-matthew.d.roper@intel.com>
X-Ovh-Tracer-Id: 15047089305654004234
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegfedgudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihesvghtvgiiihgrnhdrohhrgheqnecuggftrfgrthhtvghrnheptdfgudduhfefueeujeefieehtdeftefggeevhefgueellefhudetgeeikeduieefnecukfhppedtrddtrddtrddtpdefuddrvddvrdehjedrudeiieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeekjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
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

Hi Matt and Venkata,

On Fri, Oct 08, 2021 at 02:56:34PM -0700, Matt Roper wrote:
> From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> 
> Iterate for_each_gt during release to support multi-tile
> devices.
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

This patches are quite similar, we could even think of squashing
them.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
