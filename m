Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872A89DFDD7
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 10:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D286310E218;
	Mon,  2 Dec 2024 09:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTxRl2hL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A90A10E218;
 Mon,  2 Dec 2024 09:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733133325; x=1764669325;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ERTsU77ihNE6p4SDvyMZYI+FLs3rv392ZJpoB5qQwYA=;
 b=lTxRl2hLrSEPAy5ZP+p0X8iPqZm0McKlLoAsCs8SjMZA57h5JbiQltfk
 bQVB2eTStcwMgFrfmORjqUoJR//2mMEHVtEAB0LvqL6c5+4xllyr2+qxY
 K/Qqtxc5D/yqjkWnGX4PGRioeQU4uvOdTE5lfm4YvyclV6HjbDsPwx/YY
 3RHU+oylJoIaiu548txmBHYrPXQdMAO0jTFfBtyHbAPnAdF1riY2AwA5I
 Is22I/gTqKHunVxvcHmt4M1tAr/AEFrVVonOt4cFbE0Z0CHm5/9V8eG3j
 fuFhsmSvd8KgpHsAsWORh21dgnpJFy1hcmeuPY2h0QNsZThji8gmMh7uT A==;
X-CSE-ConnectionGUID: 0fYJTNKPTRyx56xTPg1QVA==
X-CSE-MsgGUID: qA+tjQlfT+6pSnPnjrKdBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33541678"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="33541678"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 01:55:25 -0800
X-CSE-ConnectionGUID: fNArhqJuQgmPWfJzf3Fh2w==
X-CSE-MsgGUID: mUP9+ocNSfqlL7oqJI0DqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="93154845"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.72])
 ([10.245.246.72])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 01:55:23 -0800
Message-ID: <86d678fa510aa1647bb863606032875b3e93006a.camel@linux.intel.com>
Subject: Re: Merging the xe / ttm shrinker series?
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Mon, 02 Dec 2024 10:55:11 +0100
In-Reply-To: <f1c9230a-d0b8-4322-b7be-09afdfe938db@amd.com>
References: <ce4c83dfa93e22487ed80e855318cd8f92a054f2.camel@linux.intel.com>
 <c0ba86c43497626c329a7c4ee9cf1ebc96279519.camel@linux.intel.com>
 <f1c9230a-d0b8-4322-b7be-09afdfe938db@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
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

Hi, Christian,

On Tue, 2024-11-19 at 14:04 +0100, Christian K=C3=B6nig wrote:
> Am 19.11.24 um 12:22 schrieb Thomas Hellstr=C3=B6m:
> > Hi, Christian,
> >=20
> > On Sun, 2024-11-03 at 13:38 +0100, Thomas Hellstr=C3=B6m wrote:
> > > Hi, Christian,
> > >=20
> > > The TTM shrinker series is now at v12 with all patches R-B:d.
> > >=20
> > > Ack to merge through drm-xe-next?
> > >=20
> > > Thanks,
> > > Thomas
> > >=20
> > Gentle ping on this,
> > The requested change of the ttm_backup interface done and MBrost
> > has
> > extended his R-B.
>=20
> Yeah and you guys keep pushing stuff on my TODO list additionally to
> the=20
> stuff the AMD guys are pushing for.
>=20
> Give me a few more days, it looked mostly good. I just couldn't wrap
> my=20
> head around splitting the huge pages so far.
>=20
> Regards,
> Christian.

Where are we on this? I have a small update on the series as a result
of your last review comments, but are you planning to review more
patches of the series or should I send the update and prepare for
merging?

It would be good if we could close on this one.

Thanks,
Thomas




>=20
> >=20
> > Thanks,
> > Thomas
> >=20
>=20

