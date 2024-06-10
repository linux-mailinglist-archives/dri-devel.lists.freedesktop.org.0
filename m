Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F97590214C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 14:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CB710E43B;
	Mon, 10 Jun 2024 12:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S0PfJnAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FF710E439;
 Mon, 10 Jun 2024 12:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718021411; x=1749557411;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kr85y/BVLUoTNpyKznry9YJ/PyNEjz5/b4JTZEEa2t4=;
 b=S0PfJnAy2NDC6Vc/N7qdOIrd7RWSgAxwPy1E2q53WG6Bkt1Ky5QyB3/N
 dSiRb2scrj54ab036NzZcBE/Z8QUt++dvsvXeuwdCuimCUZe5MO+OL7HZ
 g55SrfkEbKnbMkyBx2wOSwzIdvH8qs4taiSzG9GBNqZK5U9G6eUBdBP0P
 KOMu1eRHlo+3ljaMlMCfto4bOgB1Al9ZIntZLUV908IfcNoagKDhzaQ7Z
 qlm/qR9uvxOEZlt2NqIty93J3sDhBku/FUNa1N7bBFd5u6jdk+d5qplB9
 RoUTUaIdPTHcFuuR7Xi76qcrhHZjt5GLbAsSuTsrkm0y/3sSZOdJPBGg5 g==;
X-CSE-ConnectionGUID: zH2dNX2BT0mBM7uruLkTXQ==
X-CSE-MsgGUID: pzENp1V/R7mobaxPtlWQBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="11996878"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="11996878"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 05:10:09 -0700
X-CSE-ConnectionGUID: NPgIcUpoSROAO8wT5iihhg==
X-CSE-MsgGUID: eVmkuHp0SkmBDCBAHV7Y1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="76497866"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.193])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 05:10:08 -0700
Date: Mon, 10 Jun 2024 14:10:04 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: "Niemiec, Krzysztof" <krzysztof.niemiec@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nirmoy.das@intel.com, janusz.krzysztofik@intel.com,
 chris.p.wilson@intel.com
Subject: Re: [PATCH] drm/i915/gt: Delete the live_hearbeat_fast selftest
Message-ID: <ZmbtHOm0oNNFOgrJ@ashyti-mobl2.lan>
References: <fe2vu5h7v7ooxbhwpbfsypxg5mjrnt56gc3cgrqpnhgrgce334@qfrv2skxrp47>
 <ac40fa93-cffc-4fa8-9ee7-2414faac95bf@ursulin.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac40fa93-cffc-4fa8-9ee7-2414faac95bf@ursulin.net>
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

Hi Tvrtko,

On Mon, Jun 10, 2024 at 12:42:31PM +0100, Tvrtko Ursulin wrote:
> On 03/06/2024 17:20, Niemiec, Krzysztof wrote:
> > The test is trying to push the heartbeat frequency to the limit, which
> > might sometimes fail. Such a failure does not provide valuable
> > information, because it does not indicate that there is something
> > necessarily wrong with either the driver or the hardware.
> > 
> > Remove the test to prevent random, unnecessary failures from appearing
> > in CI.
> > 
> > Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
> > Signed-off-by: Niemiec, Krzysztof <krzysztof.niemiec@intel.com>
> 
> Just a note in passing that comma in the email display name is I believe not
> RFC 5322 compliant and there might be tools which barf on it(*). If you can
> put it in double quotes, it would be advisable.

yes, we discussed it with Krzysztof, I noticed it right after I
submitted the code.

> Regards,
> 
> Tvrtko
> 
> *) Such as my internal pull request generator which uses CPAN's
> Email::Address::XS. :)

If we are in time, we can fix it as Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Sorry about this oversight,
Andi
