Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0016832F94
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 21:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2353B10EA24;
	Fri, 19 Jan 2024 20:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6AF10EA24;
 Fri, 19 Jan 2024 20:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705695043; x=1737231043;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:to:cc:date:message-id;
 bh=YVYWNCWwY9G1KvwQksqhw9zl83V/JO0wGRMmJLLI15I=;
 b=K/wREhsFpqkMALixqetDDS5SfLeAI8NXknz/lgw+pzooZ57aRT+mxLcN
 SB4AByBETV/sWIc5JfuSsqmuqdPQy75ywfTIPZrkLHTDzvpNsOpukR28n
 NAOAX3FzSrABwcF7fv6mmL8LGNCcE4BjcrBY1PeJda5SOY1zKg9KNOyC9
 C818eyFeiyNYBi3BfoyTpBPbE23OVUmWT/4fvf0Ry6+NIMqbvxsLJeb9g
 dBpKYwmaiE5UQPJJ4UPibPZG0/wJpSoy8GWCshklqQj88icUa+BRtoWjk
 Af+kkeuC3lwUi/DxM0vwx1tyCT2q1VcdCnvES5LKDnUP+gsp0Q9YOxW42 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="8226535"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="8226535"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 12:10:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="788443963"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="788443963"
Received: from jamiemi-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.209.71.181])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 12:10:39 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240118123752.bl3qss3qbbxgvpdk@suse.de>
References: <20240118123752.bl3qss3qbbxgvpdk@suse.de>
Subject: Re: Mesa >= 23.3.x and python 2.6 ...
From: Jordan Justen <jordan.l.justen@intel.com>
To: Stefan Dirsch <sndirsch@suse.com>, dri-devel@lists.freedesktop.org,
 Dylan Baker <dylan@pnwbakers.com>
Date: Fri, 19 Jan 2024 12:10:37 -0800
Message-ID: <170569503795.494457.15400783572444467039@jljusten-skl>
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
Cc: mesa-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-01-18 04:37:52, Stefan Dirsch wrote:
> Hi
>=20
> I noticed that with version 23.3.x Mesa no longer can be built with python
> 2.6. It still worked with Mesa 23.2.1.

As mentioned in other emails, this was typo where 3.6 was intended.

>=20
> It fails with
>=20
> [   95s] Traceback (most recent call last):
> [   95s]   File "../src/intel/genxml/gen_bits_header.py", line 23, in <mo=
dule>
> [   95s]     import intel_genxml
> [   95s]   File "/home/abuild/rpmbuild/BUILD/mesa-23.3.3/src/intel/genxml=
/intel_
> genxml.py", line 5
> [   95s]     from __future__ import annotations
> [   95s]     ^
> [   95s] SyntaxError: future feature annotations is not defined
>=20

I guess this code first appeared in Dylan's:

4fd2e15855d ("intel/genxml: add type annotations to gen_sort_tags.py")

and then became part of the standard tests a few commits later in:

1f0a0a46d97 ("meson: run genxml sort tests")

back in Oct 2022. So, I guess at that point 'ninja test' would have
failed with Python 3.6.

Then, I suppose I propagated this to being used on every build in:

0495f952d48 ("intel/genxml: Add genxml_import.py script")

in Sept 2023.

Maybe Dylan knows how we might make this compatible with Python 3.6,
assuming we want to. :)

https://devguide.python.org/versions/

-Jordan
