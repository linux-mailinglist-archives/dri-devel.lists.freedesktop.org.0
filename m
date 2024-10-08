Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE5D99576E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 21:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF47310E5A8;
	Tue,  8 Oct 2024 19:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJ9ErkOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D4E10E5A5;
 Tue,  8 Oct 2024 19:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728414739; x=1759950739;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XVySQBxuiqFHVXdt+Jru3XVKRKScnO4sJDTEy7qOStw=;
 b=eJ9ErkOw2n9/3Cp/AoMdudW7XOR15qFm7FTiWQf7xkriDevdKcKymswJ
 nYfiQaFnZgJlaCnQCRt7ePTMQ8ka7VWHAATNXPB5OV7YN3f9F+bmu04Ud
 I+ArmqDr9f4M0OTNFBrTJWColW1LYv/NBAtBkYHeWIwEqeAPFi2djpklm
 dHwyBbT9Vg9qA2Al3gCBDrLw4PgmgzVY5cbzOPGQLg1ZPrCartPtbleBy
 uQGuwWRRf4i1uFJgv7xUP6ttq8mAjLl3mg5IoON+cL9eYFix+KHmnUGLU
 ZnLsIQjRRW5WQEmdmzXYfQ6Gs24LUz8rHIXJRH00TNt8QRhxortCWvYLc g==;
X-CSE-ConnectionGUID: eppr9Fo+RXKBymfr/rdfrQ==
X-CSE-MsgGUID: s6fvEVf7QH6nShqd7nKqGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38240920"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="38240920"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 12:12:18 -0700
X-CSE-ConnectionGUID: hQV9bL8RR9quCG9JzTFiYg==
X-CSE-MsgGUID: M4nvk6kDR6ac+l+lkTIanw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="76065578"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 08 Oct 2024 12:12:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 08 Oct 2024 22:12:15 +0300
Date: Tue, 8 Oct 2024 22:12:15 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 8/8] drm/client: s/unsigned int i/int i/
Message-ID: <ZwWED3yDPKfMsNPA@intel.com>
References: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
 <20241003113304.11700-9-ville.syrjala@linux.intel.com>
 <4bb5b981-0703-4853-acf8-f834da76ed05@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bb5b981-0703-4853-acf8-f834da76ed05@suse.de>
X-Patchwork-Hint: comment
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

On Mon, Oct 07, 2024 at 09:43:47AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 03.10.24 um 13:33 schrieb Ville Syrjala:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Replace the 'unsigned int i' footguns with plain old signed
> > int. Avoids accidents if/when someone decides they need
> > to iterate backwards.
> 
> Why are signed types preferable here?

If you iterate backwards you typically write

for (i = max; i >= 0; i--) {...}

and i>=0 is always true for unsigned types.

Another danger is doing any kind of arithmetic
with 'i' and expecting a signed result.

Based on my experience in getting burned by C integer
promotion/converison rules a good rule of thumb is to
always use just "int" unless there is a very good
reason for not doing so (eg. if the thing is a bitmask
or some kind of other thing where negative values
can never ever come up).

Also IIRC there was a Linus rant about "unsigned int i"
but I can't find it now.

-- 
Ville Syrjälä
Intel
