Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB6AA4A0A3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 18:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BF710ED1C;
	Fri, 28 Feb 2025 17:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UeNhZnC6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2C710ED1C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 17:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740764521; x=1772300521;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cQP9Tjjpixo0PJZ0ElOw99s5hBvUi8QO1U/639xGd/c=;
 b=UeNhZnC6gAmk2eFHVXfthRuNFZw7aDMsnUpUpgcoiyZM4F4UcvfADdx8
 sX4fojo2/vHKbi5QJfyhWD1I9Og8lM5a6QlpMrQV9W9oZ+f78EP3+st58
 jLjzRPz1l7tg/VNnhDikLbA3ADBnHhlu2UI7B0bIBzIEhrwypDy5tJled
 I7bOtqu3cYJf7Kn4bQ4j/WqrqIrzeM4k0Ve1g2ry7LorKz7Xf/TMR9mF/
 JMal+D1QK5CoWM3L+/RPjKkdcJjt9Pb2ZepJ6GyMsoSPKijlnOBXa8Rs3
 NUq/qqQ6tV77RUQiXbIb3d353cvXgJnHV1SpmD/5AaPGhWFiJ7RIwfoEi w==;
X-CSE-ConnectionGUID: ZX4mQTx5Rb2MXJg20YEY1g==
X-CSE-MsgGUID: kgqOHXlFTW2sG8r0FRaSmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="64163331"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="64163331"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 09:42:00 -0800
X-CSE-ConnectionGUID: yFkVV49TTam7fMsQon5sjA==
X-CSE-MsgGUID: 5KkR00mHQHCdd2ZJaXak5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="117153369"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 09:41:59 -0800
Date: Fri, 28 Feb 2025 19:41:55 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Cleanup io.h
Message-ID: <Z8H1Y2_RlFnXeNEa@black.fi.intel.com>
References: <20250227070747.3105451-1-raag.jadav@intel.com>
 <Z8CD33_OWK2LB6IZ@smile.fi.intel.com>
 <0011035a-5816-48c4-9fe4-c0b9db3c8e72@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0011035a-5816-48c4-9fe4-c0b9db3c8e72@app.fastmail.com>
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

On Fri, Feb 28, 2025 at 06:11:16PM +0100, Arnd Bergmann wrote:
> On Thu, Feb 27, 2025, at 16:25, Andy Shevchenko wrote:
> > On Thu, Feb 27, 2025 at 12:37:45PM +0530, Raag Jadav wrote:
> >> This series attempts to cleanup io.h with "include what you use" approach.
> >> This depends on changes available on immutable tag[1].
> >> 
> >> Although this series is too trivial in the grand scheme of things, it is
> >> still a tiny step towards untangling core headers. I have success results
> >> from LKP for this series but there can still be corner cases. So perhaps
> >> we can queue this on a temporary branch which we can use to submit fixes
> >> in case of fallout.
> >> 
> >> Future plan is to use the excellent analysis[2][3] by Arnd to cleanup other
> >> headers.
> >> 
> >> [1] https://lore.kernel.org/r/Z7xGpz3Q4Zj6YHx7@black.fi.intel.com
> >> [2] https://lore.kernel.org/r/2342b516-2c6e-42e5-b4f4-579b280823ba@app.fastmail.com
> >> [3] https://lore.kernel.org/r/f6eb011b-40fb-409a-b2b2-a09d0e770bbd@app.fastmail.com
> >
> > I believe Arnd can take it through his tree for headers as DRM part is 
> > Acked already.
> 
> I've applied it yesterday and not seen any regression reports so far.

Probably because the immutable tag is already in -next?

Raag
