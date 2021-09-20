Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 449844110A4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 10:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD0989D56;
	Mon, 20 Sep 2021 08:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F080689D56;
 Mon, 20 Sep 2021 08:04:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="223128994"
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; d="scan'208";a="223128994"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 01:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; d="scan'208";a="612380727"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2021 01:04:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 20 Sep 2021 01:04:35 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 20 Sep 2021 01:04:34 -0700
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.012;
 Mon, 20 Sep 2021 13:34:32 +0530
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "Auld, Matthew" <matthew.auld@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 14/19] drm/i915/oprom: Basic sanitization
Thread-Topic: [Intel-gfx] [PATCH 14/19] drm/i915/oprom: Basic sanitization
Thread-Index: AQHXL3uUZJb5Qa4rAEOKCneFU4maiarnbHmAgMJkIoCAA1owAIAAXUjg
Date: Mon, 20 Sep 2021 08:04:32 +0000
Message-ID: <97159e5b7e8f4ef49b773be085b886be@intel.com>
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-15-matthew.auld@intel.com> <87im3hh8sy.fsf@intel.com>
 <20210918043019.hhol5fgwbi2ogod2@ldmartin-desk2> <87czp3vgl9.fsf@intel.com>
In-Reply-To: <87czp3vgl9.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
x-originating-ip: [10.223.10.1]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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



> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Monday, September 20, 2021 1:12 PM
> To: De Marchi, Lucas <lucas.demarchi@intel.com>
> Cc: Auld, Matthew <matthew.auld@intel.com>; intel-gfx@lists.freedesktop.o=
rg;
> dri-devel@lists.freedesktop.org; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: Re: [Intel-gfx] [PATCH 14/19] drm/i915/oprom: Basic sanitization
>=20
> On Fri, 17 Sep 2021, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > On Mon, May 17, 2021 at 02:57:33PM +0300, Jani Nikula wrote:
> >>On Mon, 12 Apr 2021, Matthew Auld <matthew.auld@intel.com> wrote:
> >>> From: Anshuman Gupta <anshuman.gupta@intel.com>
> >>>
> >>> Sanitize OPROM header, CPD signature and OPROM PCI version.
> >>> OPROM_HEADER, EXPANSION_ROM_HEADER and OPROM_MEU_BLOB
> structures and
> >>> PCI struct offsets are provided by GSC counterparts.
> >>> These are yet to be Documented in B.Spec.
> >>> After successful sanitization, extract VBT from opregion image.
> >>
> >>So I don't understand what the point is with two consecutive patches
> >>where the latter rewrites a lot of the former.
> >
> > I actually wonder what's the point of this. Getting it from spi is
> > already the fallback and looks much more complex. Yes, it's pretty
> > detailed and document the format pretty well, but it still looks more
> > complex than the initial code. Do you see additional benefit in this
> > one?
Getting opregion image from spi is needed to get the intel_opregion and its=
 mailboxes on discrete card.
>=20
> The commit message doesn't really explain much. Anshuman?
I will get rework of the patches and float it again.
Thanks,
Anshuman Gupta.
>=20
> BR,
> Jani.
>=20
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center
