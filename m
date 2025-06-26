Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB92AE94C3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 05:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9251110E25F;
	Thu, 26 Jun 2025 03:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="ONY/arsN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6022B10E036;
 Thu, 26 Jun 2025 03:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=w/Yyw+ccEoMxrDSG6h1V3bV+6dI8LKFZgQRaaNFKTG8=; b=ONY/arsND3fW9q8HlHOr5pl5v5
 NGV/4L6+g0DYo35fjuh31SlKo/m7oxVvMrUFqZx9QlLRRKs8Tp3qtx822xs0u9Vw31ImgGlZdof7G
 vMn5uG71kyaa0t0MKWSm0x8heuli+n+QmwgDLN5sPrNJipLP5kB5p9kAYK3J0Hf1xnPTnJUCylVZL
 UvcGfMJAxWE2VGtK4iwiWYwWYD4QgTcUTUDp9ftYcsCJWRM/i21qT5SaxuWl7JFvL3m2+zWH6SLWs
 tV47Z7IQHYJY/zIIW4KCyptS9isYuS45KJPP57NDwgT0kzyMOnETdeyZjjKjRIa7SacY/WtaJDdp2
 iVClIP9A==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uUdk6-000000061sE-1uGB; Thu, 26 Jun 2025 03:57:44 +0000
Message-ID: <3667a992-a24b-4e49-aab2-5ca73f2c0a56@infradead.org>
Date: Wed, 25 Jun 2025 20:57:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jun 25
 (drivers/gpu/drm/{i915,xe}/intel_pcode.o)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250625172220.2b6aeff8@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250625172220.2b6aeff8@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/25/25 12:22 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250624:
> 

on i386, when both CONFIG_DRM_XE=y
and CONFIG_DRM_I915=y:

ld: drivers/gpu/drm/xe/xe_pcode.o: in function `intel_pcode_read':
xe_pcode.c:(.text+0x7d0): multiple definition of `intel_pcode_read'; drivers/gpu/drm/i915/intel_pcode.o:intel_pcode.c:(.text+0x990): first defined here
ld: drivers/gpu/drm/xe/xe_pcode.o: in function `intel_pcode_write_timeout':
xe_pcode.c:(.text+0x850): multiple definition of `intel_pcode_write_timeout'; drivers/gpu/drm/i915/intel_pcode.o:intel_pcode.c:(.text+0x9b0): first defined here
ld: drivers/gpu/drm/xe/xe_pcode.o: in function `intel_pcode_request':
xe_pcode.c:(.text+0x8f0): multiple definition of `intel_pcode_request'; drivers/gpu/drm/i915/intel_pcode.o:intel_pcode.c:(.text+0x9d0): first defined here


-- 
~Randy

