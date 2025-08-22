Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC53B31CC0
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 16:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C28110EB3D;
	Fri, 22 Aug 2025 14:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="D9bjwOaH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C542510EB3D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 14:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=A+IxoVzr/Gy0fVsugG6tFwzEXcy9WeUzEa+V/jBW33E=; b=D9bjwOaH6v0mvIcZ78K9PHY6S2
 sVK41lkk9SDAUkVmdwB6MNjDvBAPnOgjgkjSg+LJzzeWnyeuwZHsFUk4w6cqbliO1OH9Jgi1qSyAQ
 HqKz95OKnlZvwaXvJGWIrlVKJ4Tv4ipIr4Cp73O2f8mNWVofEilUF/tl0S5lDWDMLRVDaBI5yQ+Zp
 FTAzi9aUTV21lesBnDXZ/S6WanmNCLHKCoaHWtaflQI4gOkWGbT1kgwXFdjxNwnOU2+f4O984JKD3
 Xz0O6AmuUC8jLYhhCY+vN2btbtChUyDsysNUDzfKxIJ4l+ot505CPIwgdekTdBsILP29xvXt1wwUn
 Bu1/Ldcw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1upT8c-000000097PU-3xNB;
 Fri, 22 Aug 2025 14:53:07 +0000
Date: Fri, 22 Aug 2025 15:53:06 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [PATCH v2 0/6] DRM IDR to Xarray conversions
Message-ID: <aKiEUlldVf2YazK9@casper.infradead.org>
References: <20250821145429.305526-1-sidhartha.kumar@oracle.com>
 <f69669c873dbb99c239e9f2ddf154e983baa61e3@intel.com>
 <e80a3fd9-56ca-40c5-8ac8-237ce14cc79f@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e80a3fd9-56ca-40c5-8ac8-237ce14cc79f@oracle.com>
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

On Fri, Aug 22, 2025 at 10:36:24AM -0400, Sidhartha Kumar wrote:
> On 8/22/25 8:33 AM, Jani Nikula wrote:
> > It would be great if the commit messages mentioned whether the
> > identifiers are expected to remain the same in the conversion.
> 
> By identifiers do you mean if the name of the previous idr variable is the
> same as the XArray variable that is introduced? Sure I can add that in a v3.

I think Jani means that the actual numbers assigned should remain the
saame after the conversion.
