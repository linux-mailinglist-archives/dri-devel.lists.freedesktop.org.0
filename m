Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B031552236
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 18:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B23710E144;
	Mon, 20 Jun 2022 16:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5B010E0E6;
 Mon, 20 Jun 2022 16:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655742424; x=1687278424;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vW1GSb/rXGX+OO45zygSrgH0BwyX722Bx9s+XnCfEb4=;
 b=PmDXC9UPfztqPHiq4cIvWbXFn2SkWSielY5ShSvNknOvkr5Rxu/+kBYk
 kF7RTzEbBYuvJvnQgb1tiyRWS8WDNMc40YseuliFiwL+kPrjJrrJANXhK
 3lOEEe6DsRZ8Zd4hQGhRua9ov+vOFWCPjuzf7zqXcZFcK4cHk4XFhWgzO
 wjPKcrPXmjq+SW0JKztojzX+Cp7SrLWXmvoHvf8OnmzizbcWCMnAV+BkQ
 e1nJ5aOjTH5+WC9UhVVVmVb4gxVhzufZkCmurA8/yiRT0OK3ZAzIHmEmD
 I921o7V83WTktIIth5HKW8bU9Ahh/TP/hAp+PhctxFhtW1GDmRDmSjXB7 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="278706328"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; d="scan'208";a="278706328"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 09:27:03 -0700
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; d="scan'208";a="591243638"
Received: from hkanchar-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.36.6])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 09:26:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: Re-add check for low
 voltage sku for max dp source rate
In-Reply-To: <YrCddlmhykkRDQAC@zx2c4.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220613102241.9236-1-Jason@zx2c4.com>
 <CAHmME9q0QbuUR-11gkFG9PQpHrNfZk2b-Ja+tDnqbV13JCJ7+g@mail.gmail.com>
 <875ykvtix5.fsf@intel.com> <YrCddlmhykkRDQAC@zx2c4.com>
Date: Mon, 20 Jun 2022 19:26:53 +0300
Message-ID: <8735fzti5u.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Jun 2022, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> Hi Jani,
>
> On Mon, Jun 20, 2022 at 07:10:30PM +0300, Jani Nikula wrote:
>> On Mon, 20 Jun 2022, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>> > Hi Jani,
>> >
>> > Do you plan to merge this revert?
>> 
>> Yes, I've done that now, thanks for the bisection and the patch.
>
> Thanks!
>
> I see that this went into `drm-intel-next`, but shouldn't it go into
> `drm-intel-fixes`, so that it makes it into 5.19-rc4?

All of our commits go to drm-intel-next first. I'll pick it up for fixes
later.

BR,
Jani.



-- 
Jani Nikula, Intel Open Source Graphics Center
