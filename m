Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6391F6EAC4A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 16:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB3D10EE1F;
	Fri, 21 Apr 2023 14:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C2C10EE1F;
 Fri, 21 Apr 2023 14:09:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D384760E05;
 Fri, 21 Apr 2023 14:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A126EC4339B;
 Fri, 21 Apr 2023 14:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682086147;
 bh=EcPNXFz/2vVBZwu2kGf48w1/9yroyC/oDcQGDWlaWD4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l762Ds4IhBIA3pDqYDAK5zYE7oMetEGBSsLPgxtyug0MaLQ2XHqkJby7JBsBra4LZ
 GYp+AydBkNWpGVnMRho3Ijd3lM2a8P7AB2vh3UT1VWbpPAnrqxygqUC6iD52UyO5W0
 tO/vkdhU0wPUBFTQkSJfJ7DgE8NlQNo0Sby0xC5yHviWeYDQ+bS3ryvwnCINNoCp8Y
 AeL+FbeLE+Fdh/TXxkxgNDtqJdRDJWiiCiszI0ar6prl5FDGBawMBBzo2lEWJ0sZCh
 ckt0N3KVhUhrmhM04/DvTcJwErRGwgGwU8HBgS6lm49RgrKMfu+qSGfuoC4wxOhmez
 yOoB/ouIHlKjg==
Date: Fri, 21 Apr 2023 07:09:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH v7 0/7] drm/i915: use ref_tracker library for tracking
 wakerefs
Message-ID: <20230421070905.3ed2bb78@kernel.org>
In-Reply-To: <20230224-track_gt-v7-0-11f08358c1ec@intel.com>
References: <20230224-track_gt-v7-0-11f08358c1ec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "David S. Miller" <davem@davemloft.net>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Apr 2023 13:35:04 +0200 Andrzej Hajda wrote:
> Gently ping for network developers, could you look at ref_tracker patches,
> as the ref_tracker library was developed for network.

Putting Eric in the To: field, I know email so hard and confusing...
