Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6594EA72A4E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 07:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB12E10E049;
	Thu, 27 Mar 2025 06:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOhAYl0J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E31210E049;
 Thu, 27 Mar 2025 06:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743058179; x=1774594179;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=va/65PcRS3qiiNrf9v+dTNgllRqZl2Tj1au7wNsz4p0=;
 b=cOhAYl0Jlm8HsBle8mVdVg0SOew7OBCrmk/D4wKVy88191ARME+QVL2B
 qd6NBzrCmZGDwJ+w1ERWOCvt0pk17EUa5iUrhawk0otzj4Ot7yTiipfnU
 c7zCsajLSYtMLLtQzFM1gm6xMiWMqJKhtbBG3lSuEqbzcDTsaG3hqGIVy
 4HD+5DF0PFtxrA4gXQEwS0P0YlHYc6O6tVUT+7f8LgQ5CusauqJOo4zzp
 Bvh184u2H3AQQrKzoeL5zBgv0URpf450WLiNINpUhkF3430U25c4abgVl
 a9twNQzP5Q4vnPmpR6CQUVRAM84P1QYYPTuB6cTgXxlOncrxpxeLf+VWZ A==;
X-CSE-ConnectionGUID: Ozejh1wGTJebQiC4pUZWhA==
X-CSE-MsgGUID: zsojBXq1SUO9vQgw9T4smA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48251193"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="48251193"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 23:49:39 -0700
X-CSE-ConnectionGUID: A6nr3fHRTR+W0puQCnlnVw==
X-CSE-MsgGUID: UreRB/mgSpWFEa1H3epAGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="129198821"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.108])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 23:49:36 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Z-KLCnjl3vjHAZAL@ashyti-mobl2.lan>
References: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
 <174289108243.28532.3277935060267794468@jlahtine-mobl>
 <Z-KLCnjl3vjHAZAL@ashyti-mobl2.lan>
Subject: Re: [PATCH v4 00/15] CCS static load balance
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Arshad Mehmood <arshad.mehmood@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, Andi Shyti <andi.shyti@kernel.org>,
 Usharani Ayyalasomayajula <usharani.ayyalasomayajula@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Date: Thu, 27 Mar 2025 08:49:32 +0200
Message-ID: <174305817284.14046.5109974456042494206@jlahtine-mobl>
User-Agent: alot/0.12.dev7+g16b50e5f
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

Quoting Andi Shyti (2025-03-25 12:52:58)
> On Tue, Mar 25, 2025 at 10:24:42AM +0200, Joonas Lahtinen wrote:

<SNIP>

> > Do you have a reference to some GitLab issues or maybe some external
> > project issues where regressions around here are discussed?
>=20
> AFAIK, there's no GitLab issue for this because we're not fixing
> a bug here; we're adding a new sysfs interface.

This sysfs interface was exactly designed to address performance
regressions coming from limiting the number of CCS to 1.

So unless we have a specific workload and end-user reporting a=20
regression on it, there's no incentive to spend any further time here.

<SNIP>

> Arshad and Usha can definitely help if there are any technical
> questions about how the application uses the interface.

I don't have any technical questions as I specified the interface
initially :)

This is not about technical opens about how the interface works.
To recap, when we initially implemented the 1CCS mode, we got active
feedback on the community on regressions.

We were careful to verify that all userspace would cleanly fall back to
using 1CCS mode after it was implemented. And indeed, nobody has been
asking for the 4CCS mode back after the 1CCS mode bugs were fixed.

So as far as I see it, there are no users for this interface in
upstream, and thus we should not spend the time on it.

Regards, Joonas
