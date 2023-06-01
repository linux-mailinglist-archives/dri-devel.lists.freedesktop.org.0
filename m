Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7348571F080
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 19:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795C110E593;
	Thu,  1 Jun 2023 17:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C614D10E23E;
 Thu,  1 Jun 2023 17:18:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA82061E16;
 Thu,  1 Jun 2023 17:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DF8C433EF;
 Thu,  1 Jun 2023 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685639889;
 bh=rmHFArekaGiZKmQ4ziA9csHRSAucq2oWTt/lCe73L1U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iUk2l35RTUEH2L4IMsBA4fbLDaA5Lj610c0mdiM2klA9M/8oSzJxop86q+KXmO6Uw
 oV73orKsz+L76WpEzmtX6YdC6jvuAPcgzoLOqcL18mnXhspJzPhCZCzDv88U7jjxYi
 LSyK8TaFIb8Ilr2P2MhRoc74XeBYFvJlf5c2SLpkc9r4/sHBvyZ7efUT0YUn0WbbXL
 eDNAHuUMQHP6WRjnQ9QVV+Zy9Nso6ClbLwcZxdp2+8yzmbrCgrh4QOHdSyjYuG+aTN
 v3x56RSvEnyoQu1OgGJi5DzePWVR+c4rQJ49eiBg9W4Xg74BoqWXn0eWpC9P94zEOR
 cxadhV6GfK8Vg==
Date: Thu, 1 Jun 2023 10:18:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v8 0/7] drm/i915: use ref_tracker library
 for tracking wakerefs
Message-ID: <20230601101807.7e0363bf@kernel.org>
In-Reply-To: <b7811942-da09-7295-4774-46360715f147@intel.com>
References: <20230224-track_gt-v8-0-4b6517e61be6@intel.com>
 <55aa19b3-58d4-02ae-efd1-c3f3d0f21ce6@intel.com>
 <ZFVhx2PBdcwpNNl0@rdvivi-mobl4>
 <bb49bbd6-1ff2-8dba-11d1-6b6ab2ccd986@intel.com>
 <b7811942-da09-7295-4774-46360715f147@intel.com>
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
Cc: netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Eric Dumazet <edumazet@google.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Rodrigo Vivi <rodrigo.vivi@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 1 Jun 2023 19:14:50 +0200 Andrzej Hajda wrote:
> Ping on the series, everything reviewed.
> Eric, Dave, Jakub, could you take patches 1-4 via net tree?

Sure thing, would you mind reposting them separately?
Easier for us to apply and it's been over a month since posting,
a fresh run of build bots won't hurt either.
