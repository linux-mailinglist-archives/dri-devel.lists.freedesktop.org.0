Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0644A83335F
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 10:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1266A10E106;
	Sat, 20 Jan 2024 09:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D86F10E106;
 Sat, 20 Jan 2024 09:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705744086; x=1737280086;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=pAjdTgr48PjYTBALtv000+NKbOLwSZeSprGS5zoj8TQ=;
 b=Ym/E9p1a9X42q37o7mfc6nzH+6T+qwBnZ5Byc/phx1/4Y1FDFKm0TtWq
 M9RGvnWsD3ZCfO46oppeHJ4KX7X5+j3abkgPO5j2PffG9rB2mWrnn6KmT
 UMuuMN2OeCu/6o44xfjkVw59NLMz00DdFp684HhYzAN24/1Y8zqC7q6OB
 gzBNshc8zuRyskS3vluN0xZ2x+ryC8pxUTSPGk1vwqlrUUli+wMa5Um5l
 KbED5sN+nkhXXP+tZcT8v0956YcxxgsjbZrskg4CsGkBlJr00ei5uO5wU
 JDXyhahtMB7AVxRKBpfBNFy09wrevDg0iHm4cQ2i8r9UZxILiTjPa4E3w g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="432102927"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; d="scan'208";a="432102927"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2024 01:48:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="778184029"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; d="scan'208";a="778184029"
Received: from jamiemi-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.209.71.181])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2024 01:47:59 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240119202424.ronbrs5dts3bn5n6@suse.de>
References: <20240118123752.bl3qss3qbbxgvpdk@suse.de>
 <170569503795.494457.15400783572444467039@jljusten-skl>
 <20240119202424.ronbrs5dts3bn5n6@suse.de>
Subject: Re: Mesa >= 23.3.x and python 2.6 ...
From: Jordan Justen <jordan.l.justen@intel.com>
To: Stefan Dirsch <sndirsch@suse.com>
Date: Sat, 20 Jan 2024 01:47:58 -0800
Message-ID: <170574407803.494457.2218713541081503202@jljusten-skl>
User-Agent: alot/0.10
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
Cc: mesa-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dylan Baker <dylan@pnwbakers.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-01-19 12:24:24, Stefan Dirsch wrote:
> Hi Jordan
>=20
> Thanks for digging into this!
>=20
> On Fri, Jan 19, 2024 at 12:10:37PM -0800, Jordan Justen wrote:
> > On 2024-01-18 04:37:52, Stefan Dirsch wrote:
> > > Hi
> > >=20
> > > I noticed that with version 23.3.x Mesa no longer can be built with p=
ython
> > > 2.6. It still worked with Mesa 23.2.1.
> >=20
> > As mentioned in other emails, this was typo where 3.6 was intended.
> >=20
> > >=20
> > > It fails with
> > >=20
> > > [   95s] Traceback (most recent call last):
> > > [   95s]   File "../src/intel/genxml/gen_bits_header.py", line 23, in=
 <module>
> > > [   95s]     import intel_genxml
> > > [   95s]   File "/home/abuild/rpmbuild/BUILD/mesa-23.3.3/src/intel/ge=
nxml/intel_
> > > genxml.py", line 5
> > > [   95s]     from __future__ import annotations
> > > [   95s]     ^
> > > [   95s] SyntaxError: future feature annotations is not defined
> > >=20
> >=20
> > I guess this code first appeared in Dylan's:
> >=20
> > 4fd2e15855d ("intel/genxml: add type annotations to gen_sort_tags.py")
> >=20
> > and then became part of the standard tests a few commits later in:
> >=20
> > 1f0a0a46d97 ("meson: run genxml sort tests")
> >=20
> > back in Oct 2022. So, I guess at that point 'ninja test' would have
> > failed with Python 3.6.
> >=20
> > Then, I suppose I propagated this to being used on every build in:
> >=20
> > 0495f952d48 ("intel/genxml: Add genxml_import.py script")
> >=20
> > in Sept 2023.
>=20
> Thanks. This explains why I've found this code already in older releases,=
 but
> it didn't fail for me yet. You said tests. Is this just a test, I could
> disable (as dirty hack)? I was assuming it would generate code ...

In 0495f952d48, I moved in to a common file, and essentially, now it's
used by our script that runs during the build in addition to the test.

It was "fun" finding a way to get python 3.6 :), but after that, I
think I found a way to make Python 3.6 work. I guess you can try it
out:

https://gitlab.freedesktop.org/jljusten/mesa/-/commits/intel-genxml-python3=
.6

In my light testing, Python 3.6 through 3.13 seemed to work. Python
3.5 did *not* work.

-Jordan
