Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A67BC244DF
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 10:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057CC10EAE7;
	Fri, 31 Oct 2025 09:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YFgnCTxE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320C810EAE4;
 Fri, 31 Oct 2025 09:59:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 68A2460403;
 Fri, 31 Oct 2025 09:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B4CC4CEE7;
 Fri, 31 Oct 2025 09:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761904794;
 bh=0H+2X2wBzENuCnBV2Y0fipHxX4GX0+68/lismInwpE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YFgnCTxE/zAgB7l+xIWpvQUDxpEzTxObQOioe8FzoPjpHkOmTIv6/AM9Ho3YuG3xJ
 Rp1GfNmWa2bNWlp3tpm0QYRN3JgyWATssk22OB+sbix0Sx4gCa2vmVwa1/exBNBr/a
 EX6KVy5CtovvPB4XLyKOUIlf/qWDiQuPxkYtqPnpECqqgb3ZXnpB/yl2T5iq2PBikO
 4BcGUAjN7CuyJ9G6XnyjgjgHmR1ys+qyRyvRuPaTFo8nib8ugQ0cZfq90REbeZNUO6
 x2GVqMWdCo3Ng5IsogXfZruzToj0Rlq8K90tQzrj/ep49XoxAOBb4FcK6jsrihrTAR
 rhOnXfhsBhLIQ==
Date: Fri, 31 Oct 2025 10:59:49 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>
Subject: Re: [PATCH] drm/i915/gt: Use standard API for seqcount read in TLB
 invalidation
Message-ID: <2y3ze4qzzjg76hmocset2up54z4oakuur5a2muyltvl3lfo7xm@eejjdkwgm35e>
References: <20251023132802.654061-1-andi.shyti@linux.intel.com>
 <DDTYRY4J7XJ5.8PR5I265OCFJ@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDTYRY4J7XJ5.8PR5I265OCFJ@intel.com>
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

Hi Sebastian,

On Tue, Oct 28, 2025 at 12:45:56PM +0000, Sebastian Brzezinka wrote:
> On Thu Oct 23, 2025 at 1:28 PM UTC, Andi Shyti wrote:
> > seqprop_sequence() is not intended for use outside seqlock.h.
> > Although it is accessible as a macro, it is meant to be used only
> > internally within the header.
> >
> > Replace it with its proper wrapper, raw_read_seqcount().
> >
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Co-developed-by: Jani Nikula <jani.nikula@linux.intel.com>
> > Signed-off-by: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Christoph Lameter (Ampere) <cl@gentwo.org>
> > ---
> 
> LGTM
> Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

Thank you! Pushed to drm-intel-gt-next.

Andi
