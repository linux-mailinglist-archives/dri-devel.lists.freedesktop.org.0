Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E404E85437C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 08:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D6D10E480;
	Wed, 14 Feb 2024 07:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pa0bYRoK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D794310E19F;
 Wed, 14 Feb 2024 07:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707896019; x=1739432019;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/3E1nRwVFdO3/rrdfx9ajZDZBX7k8hMptwwaLoAeOKQ=;
 b=Pa0bYRoKYDYtyI/E24Nf5Nv7liSyltonhAzv4PBdITFJ/IdImfoIeGie
 JkIhhXiY4zd1ffT+ExG3TarOUQ8dADhBoW+ZGnP/ul553E81kDUt6KPig
 PqaWmFE2lcxwm/niWzFpb6qaHX+LLWPZfvS9mKl8G8DgkAYfHvQPiAs9Y
 B3hajsQlE6i3VkrWI4+r6q/FXrYyhRbmeOWkoYhdoLk3EdMtNYWebcg+V
 ZWQ3V1P+nBgoRAh00e1sthrRi8gJx5Zad47mQWIO21w8vU6AyufFKcHa8
 w2tpwReLZ816tKbPDMG2YZ9JU7jcAexUqz0QFBlI7tlcqDW/QYP+eOouD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5762005"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="5762005"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 23:33:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="34178324"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 23:33:39 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 23:33:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 23:33:38 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 23:33:38 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 23:33:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WS0Y7BLoVZefxT1HFvSyyDehvxKCoYfyZlWt1+sGwIGoIv1HI25MU8vASXoZSY1eXR8ItosjVwXUl0gbyCLJOCCCkRdEcv7RUnQ/yovfrzEuF4MuRyMQV5PkL1GSVTEmOT6TTG89UT4TgYGi9pFRjE3Qtyd3bebA/5ka3eDOhINBI9MP4RGoODKvfQ5xhJcl0KTLUU7PhvCLzRqxvx3SPDcA43qWxv/XJEkd5FP4gvZuY8tZVZf15K836q0vK+dCt7vUnImf4Re9qTat7hrfhWHSH09wdQaLdLUTqldkqRSkCZlhv99XDAny+dcASci/TA0LYKJnHTZG4KfoLdR5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rE3vDhUIr1gZQWJYv8fh4aNmmhX4nLUqsLTEGhC0ov0=;
 b=LaPfc2UQWnfyTtKlvzEXkNUkNxj/uuMxiIKcx+A8DgWvS5vN8lEqDg7KK7Il6TrQUBpq8VKhJmMxU/da5tFNIQX/A5gFHZN0GUe9AnX3/2cZfut1i5Hq+DMpPKKmzIKDrJM4FKkQfZMmfBy8sCX5dp7THYnWJShzYGHVhmY+y3ptAv7ddNwMWgTTOB9iOp51CYd8kOj78y+yzq6rOlH7Pctd3pffra/QmVdSA9hLZWETwfM6rKEEYktr8NhyRSkOjpwHnAvEydxLTMbnWfp+GtKKlK6mUqK/J7N4aRbv0hW2W9hPWjm4JJS6UQB7UqVisztyv4gvce19dktRYqEAcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CH0PR11MB5284.namprd11.prod.outlook.com (2603:10b6:610:bf::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25; Wed, 14 Feb 2024 07:33:31 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7292.022; Wed, 14 Feb 2024
 07:33:31 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "agoins@nvidia.com" <agoins@nvidia.com>,
 "joshua@froggi.es" <joshua@froggi.es>, "mdaenzer@redhat.com"
 <mdaenzer@redhat.com>, "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, "victoria@system76.com"
 <victoria@system76.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "arthurgrillo@riseup.net" <arthurgrillo@riseup.net>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>, "sean@poorly.run"
 <sean@poorly.run>, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Subject: RE: [PATCH 00/28] Plane Color Pipeline support for Intel platforms
Thread-Topic: [PATCH 00/28] Plane Color Pipeline support for Intel platforms
Thread-Index: AQHaXkeNnG2I7T5sFU+ygcDvllPusLEIG4kAgAFWy5A=
Date: Wed, 14 Feb 2024 07:33:31 +0000
Message-ID: <DM4PR11MB6360D1D20B144C99E82BB722F44E2@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
 <20240213130152.3ad4ae50@eldfell>
In-Reply-To: <20240213130152.3ad4ae50@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CH0PR11MB5284:EE_
x-ms-office365-filtering-correlation-id: b19af636-8382-4af0-8ab1-08dc2d2f3e4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yuIhXcZ7TVIZF4ggaELsIX5s9QRo97XzGL5mMSl+jlA6CvcmTg1ij4ykyRHIRGyBGjwtwwQPkPqBSkcH/sRPp2JrD4nY+GfF5nN28DBgSkZ/8AxjJMC+HUciB2XFIDOC+kkVFUYDknMKKD0F3ADl78EEw+y5LZYlhGm9Vldcz7hrJL/v876yTX2S9P7zpZ9wFVf/ijBf5msYs8tVgEzK04bPx7amG14jXLtMJuvpPJYJSplU2nsjLrLkl8F4rI83MSxWvgjXP0sBqDGKwQ2Tc+f20gveAupt8YVtvHcmQO28c0/Vg/cK/DfHXxMfee+9KXALiOFiMiv+YKk5UFCkUUUH2TFsBRE6GMx/VuI3LqgH5HXPEYo4M9TvXX5CwY7n6uAsi1wOCGHt/80WRtsSxv2ywN17tfiJIREf2zUMBwKtJDc53dRHxRGq9RCIKolzwOdzzYVzNdidg9/FXq80N5MG7gW80hlcDIBKD+ZaMPyABwU/m16OokSPj6Wn/jd1r9iIiKbPe2H+LPLsuobgUk2+NT1O+TboYL0mtF9S1Zm2LSldTSBzEqIg9nHjo5EwZwjnW7Ylv/Ln1Lg4C3S1/GL9spPPCYvz79RHFF7fwz9Nc/cbQKQ6eMpdHpXrI0mtocVd+rhEHGqYIsH/pZRqyg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(9686003)(478600001)(966005)(55016003)(41300700001)(7696005)(8936002)(8676002)(5660300002)(4326008)(7416002)(2906002)(52536014)(6506007)(38070700009)(66556008)(316002)(71200400001)(53546011)(6916009)(76116006)(66946007)(66476007)(64756008)(54906003)(66446008)(83380400001)(86362001)(122000001)(82960400001)(26005)(38100700002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6nHTdVkyGoDH5PZqU5OpQ4PIkz+o4k+qNH3EZulH4aKSgrSHHzy5WGVAjj99?=
 =?us-ascii?Q?SrVPKw/FXKFEeYOUWj9cjAOuSEUvdS+BsQ36FXvh/zi4OTu/zcIRYgZsTgKx?=
 =?us-ascii?Q?klyWL22l3swIXxxlY7F8XKDYwuQ2DA6Sxp5k/8jjf6kvHe9rLz9QTH0pa2wP?=
 =?us-ascii?Q?v8wF/rst7Mc0SHAURKu0tzU7yhGx6le0l/KEKN8IsVvcjbUvlnPdmH6Ue7D0?=
 =?us-ascii?Q?b/4HKFW/kvz9hHq+BSINVuEtnwm0uqJl1ewy/UdzRn5dBQraIQcFWatQyujj?=
 =?us-ascii?Q?Z5k1eSTsit2X4C3PFUJi7OueMCehX/EHo0ZMzGg4ASiuBpaB6yeeVDx77zZe?=
 =?us-ascii?Q?q1nll93XZMHhRydqIIX/ni8tjScMp7k/R/nMZi2sO5Erj8tTb9NPyBACe1+9?=
 =?us-ascii?Q?VdQA2ug6MJ6HAF71yQEEiRpc80BBk0rUGSHNiOhI+gqYCcQmbEn3KzJltTxm?=
 =?us-ascii?Q?+pJsYJUNu9wIq3p2h9kmhLXR+tInkK3V4md0jWQaBVrtSBz0gnl2+4m5jTU3?=
 =?us-ascii?Q?lIlIqeySIfPEgVTs5XF/lWrGmkCAHxM7GpGDolFM6Zl+hT2LmJTXQgwARUPh?=
 =?us-ascii?Q?AbwheCtVwueA7XuOuBYoY/345Kwpc5tIXHfFabHPEJHFyJJ6LJLrE9l1SWm5?=
 =?us-ascii?Q?s+H67Zkv8WgOt6ZADRygpNYCgt8s1gfX5H4Fae3EfnevUMu3bOzxk8aTRLPq?=
 =?us-ascii?Q?f7rBy95IEoAwTqmzuhG5N7eDDby/BnBNxpavQNbwem5chCe+GxXlYQrmjnfL?=
 =?us-ascii?Q?br556eGQF2qrf13jRx0bv3I+E93F8zJUCC3ZNkUkrN4rjMDM1tYOrGdVrxTr?=
 =?us-ascii?Q?AySUrrSLxQF1oFUczsRte1tBz/NbBxAyou6y+S2frhna08fbjxXdNt8KcggN?=
 =?us-ascii?Q?kQ+MO8Y248pC/DlOLWDsf1QzjGGDzISkDiX3g477Wfzr6Kh2ZTGE5ygo3MqS?=
 =?us-ascii?Q?3Ic6/hueACj0IkgDc1m1JPA1ShD6zm5GqkEKgPmQO/gIms7KvRBCHZVY9biD?=
 =?us-ascii?Q?GbMAov3vcHGuhVW4wN7l9UAbB5fC/6pMIrjJ62Uom7qbI0unzQwP57XWg3W7?=
 =?us-ascii?Q?QT1lX0IglZClNQPAZ05FgFjd5BIh2ikM6uIysFfQ1MKjSvBaWqkUBTPThOvK?=
 =?us-ascii?Q?Kyr9AX4xpe6eYdDiukr/Pb5isB7aaIoggLuf4BxuSHYiLfdQeiGuD0N9H43q?=
 =?us-ascii?Q?AJ7PEPM837Fq3jOgrBhSB8x8uO681nUtT+xpDFH3PCVib1xp/YnPn7fM87bL?=
 =?us-ascii?Q?NL23k0u2HZhZYMkGw7ITmrysD5l6df/+I8AzGLlNRoB4wRVf4BZJKYGkhSmA?=
 =?us-ascii?Q?8j3s1eTsWn1LJz8XjCJjAzPS72JTkCB8eiK4WwDSjle9SctIUXVZ7AjNSat4?=
 =?us-ascii?Q?3tdkCiTDS67ynKhe99983gyt2GQh89p37+tDcvjGzj/427P1WC8BmBxFzuNi?=
 =?us-ascii?Q?r6A+Nu3m5oAMdNr+K1brnB49zHYv4QmB7A6J9jN0pcbGZienEjS7Xtct8BQT?=
 =?us-ascii?Q?gjvahLamrgQVpPch1xnx4/wYXwA6YIM53iTYaWs3p/cWXVxJbzYbK20JCLtY?=
 =?us-ascii?Q?vQ9Z/5a9zSAT1V7R27WsFAU0ExIuvBUIg8xBi06k?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b19af636-8382-4af0-8ab1-08dc2d2f3e4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 07:33:31.1529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Gn4aJy8Ds+/TJHj6aDUC4mkSq5veoxXcwt7tf/eku+JFRjq9454U5SahlmGcsdIrEOju8OC4jkYDIcABW3xHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5284
X-OriginatorOrg: intel.com
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
> From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> Sent: Tuesday, February 13, 2024 4:32 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> ville.syrjala@linux.intel.com; contact@emersion.fr; harry.wentland@amd.co=
m;
> mwen@igalia.com; jadahl@redhat.com; sebastian.wick@redhat.com;
> shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
> mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
> victoria@system76.com; daniel@ffwll.ch; quic_naseer@quicinc.com;
> quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com; arthurgrillo@riseup.n=
et;
> marcan@marcan.st; Liviu.Dudau@arm.com; sashamcintosh@google.com;
> sean@poorly.run; Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Subject: Re: [PATCH 00/28] Plane Color Pipeline support for Intel platfor=
ms
>=20
> On Tue, 13 Feb 2024 12:18:07 +0530
> Uma Shankar <uma.shankar@intel.com> wrote:
>=20
> > This series intends to add support for Plane Color Management for
> > Intel platforms. This is based on the design which has been agreed
> > upon by the community. Series implementing the design for generic DRM
> > core has been sent out by Harry Wentland and is under review
> > below:
> > https://patchwork.freedesktop.org/series/123446/
> >
> > The base work of above series is squashed under 1 patch and support
> > for Intel platform is added on top of it.
> > Any reviews on the original core design is expected to be done in
> > Harry's series to avoid any forking of the discussion.
> >
> > We have added some changes/fixes to the Harry's core DRM changes,
> > being put up as separate patches on top of squashed patch. These are
> > expected to get included in the main series from Harry once agreed upon=
.
> >
> > Changes added on core design:
> > 1. Below patches implement some fixes on original series
> > drm: Add missing function declarations
> > drm: handle NULL next colorop in drm_colorop_set_next_property
> > drm: Fix error logging in set Color Pipeline
> >
> > 2. Implemented a HW capability property to expose segmented luts.
> > drm: Add Color lut range attributes
> > drm: Add Color ops capability property
> > drm: Define helper to create color ops capability property
> > drm: Define helper for adding capability property for 1D LUT
> >
> > This helps in generically defining the hardware lut capabilities, lut
> > distribution, precision, segmented or PWL LUTS.
> >
> > 3. Added support for enhanced prescision, 3x3 matrix and 1d LUT:
> > drm: Add Enhanced LUT precision structure
> > drm: Add support for 3x3 CTM
> > drm: Add 1D LUT color op
> >
> > On top of this base work for DRM core plane color pipeline design,
> > implementation is done for Intel hardware platforms. Below patches
> > include the same:
> >
> > drm/i915: Add identifiers for intel color blocks
> > drm/i915: Add intel_color_op
> > drm/i915/color: Add helper to allocate intel colorop
> > drm/i915/color: Add helper to create intel colorop
> > drm/i915/color: Create a transfer function color pipeline
> > drm/i915/color: Add and attach COLORPIPELINE plane property
> > drm/i915/color: Add framework to set colorop
> > drm/i915/color: Add callbacks to set plane CTM
> > drm/i915/color: Add framework to program PRE/POST CSC LUT
> > FIXME: force disable legacy plane color properties for TGL and beyond
> > drm/i915/color: Enable Plane Color Pipelines
> > drm/i915: Define segmented Lut and add capabilities to colorop
> > drm/i915/color: Add plane CTM callback for TGL and beyond
> > drm/i915: Add register definitions for Plane Degamma
> > drm/i915: Add register definitions for Plane Post CSC
> > drm/i915/color: Program Pre-CSC registers
> > drm/i915/xelpd: Program Plane Post CSC Registers
> >
> > Bhanu from Intel will be sending out the igt changes to help test the
> > color pipeline implementation based on the current igt changes sent
> > out by Harry.
> > https://patchwork.freedesktop.org/series/123448/
> >
> > Planned Next Steps:
> > 1. Work with Harry and community and get DRM core changes for color
> > pipeline merged.
> > 2. Implement pipe color management (post blending) based on the
> > current color pipeline design.
> > 3. Work with compositor maintainers to get color processing
> > implemented using display hardware, thereby avoid any GL or GPU shaders=
.
> >
> > Thanks to all the community maintainers and contributors who have
> > helped to get this support in upstream Linux. Looking forward to
> > collaborate, work together and get this merged.
> >
>=20
> ...
>=20
> > Chaitanya Kumar Borah (16):
> >   drm: Add missing function declarations
> >   drm: handle NULL next colorop in drm_colorop_set_next_property
> >   drm: Fix error logging in set Color Pipeline
> >   drm: Add support for 3x3 CTM
> >   drm: Add 1D LUT color op
> >   drm/i915: Add identifiers for intel color blocks
> >   drm/i915: Add intel_color_op
> >   drm/i915/color: Add helper to allocate intel colorop
> >   drm/i915/color: Add helper to create intel colorop
> >   drm/i915/color: Create a transfer function color pipeline
> >   drm/i915/color: Add and attach COLORPIPELINE plane property
> >   drm/i915/color: Add framework to set colorop
> >   drm/i915/color: Add callbacks to set plane CTM
> >   drm/i915/color: Add framework to program PRE/POST CSC LUT
> >   FIXME: force disable legacy plane color properties for TGL and beyond
> >   drm/i915/color: Enable Plane Color Pipelines
> >
> > Harry Wentland (1):
> >   [NOT FOR REVIEW] drm: color pipeline base work
> >
> > Uma Shankar (11):
> >   drm: Add Enhanced LUT precision structure
> >   drm: Add Color lut range attributes
> >   drm: Add Color ops capability property
> >   drm: Define helper to create color ops capability property
> >   drm: Define helper for adding capability property for 1D LUT
> >   drm/i915: Define segmented Lut and add capabilities to colorop
> >   drm/i915/color: Add plane CTM callback for TGL and beyond
> >   drm/i915: Add register definitions for Plane Degamma
> >   drm/i915: Add register definitions for Plane Post CSC
> >   drm/i915/color: Program Pre-CSC registers
> >   drm/i915/xelpd: Program Plane Post CSC Registers
>=20
>=20
> Hi Uma,
>=20
> it is really hard for me to get a good picture of what this would result =
in from
> userspace perspective, which properties will exist with what values, but =
I didn't
> spot any fundamental UAPI design problems so far.

Hi Pekka,
Original idea remains same from Harry's series, we just added 1 more proper=
ty for
advertising hw caps and added 2 additional color op types. Will update the =
documentation
as well to make this clear and readable. We missed to add in this version.

Thanks for looking into the series and your valuable inputs.

Regards,
Uma Shankar
 =20
>=20
> Thanks,
> pq
