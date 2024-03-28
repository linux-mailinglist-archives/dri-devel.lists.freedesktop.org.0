Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F4888FC54
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 11:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243F910E651;
	Thu, 28 Mar 2024 10:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fyB6f87B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC7D10E651;
 Thu, 28 Mar 2024 10:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711620093; x=1743156093;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7ygww6fxO0O5cjOfFNVtJlj6SInsP4JFgHxQOdt8rg0=;
 b=fyB6f87B+clQK431G7Agd8zK/VhsQ+PkD2xUCItSBH+KEEj9z43+Pw6T
 sSbi2qnISZL3KYzWuU132PZk27aKHsl6rNdgjUuZqc1HeUYfno62hRDOA
 VRTiY58FOiCqs/WMrjCKs20U/lDlxchXGIvqnCrTXfIW28FIbmo4ySMZi
 QVmZku0TIKz3EyVJdqSbf6obUH7T3c2W6+ls7QLclBb8/YeeKcfnlweSw
 qAz/OfZX9v6cc0CG+M3puajD+XBFjh7OZ9p36Xr0y5Qa1ppd2wJFSsZkc
 HvxZFrjMSu6fvbs/OF8Pg6nUfGVq+S3RE7NFXRLo7YsM/ATzw6OaI+PQu g==;
X-CSE-ConnectionGUID: a/Xsaf9bSh6lk9ixk2t6pA==
X-CSE-MsgGUID: A4hdkcm6Q7SDE+hmq4Su5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6653961"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6653961"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 03:01:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21284647"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 03:01:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 03:01:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 03:01:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 03:00:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxCwxpSx/XYx5fxtEzeD2N+WrjjozhT5WKA87j1Xh5q4jcQ7NPptV4p3g9Tn6zg4Tn1M4nA3nJb65G035JVfwr8MhPg0q9GqyxLWnL5buggxH/kZ0eLZx0JAJwtLAJbTv1/FN9IVAIqL3eMLUZ/IE8a1n4rde8L3W+OOrV4nGW9KnMUrj0GS/vo/X/ZV7w7QXjT3hmkeDbCZEg8jhIXeuIgdY5xMfQ5pmnZ05GkMUN5sq7qH4BEMNdjDpBTotSIXGDGwlEsLcyIeNqZNtqQF7dF765iIiCThfNXDDf1s2bM6pb1n4UBcIpKOEoPxn5JITGm0peM7GXsMijTEM8eaiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ygww6fxO0O5cjOfFNVtJlj6SInsP4JFgHxQOdt8rg0=;
 b=Bxn8NTFAZjj7LMEd3tm0Rku4gcFAoPR39AJ4S+luzWJKyhdGtkGCLKWumJvTOTE6w+DorTPR9y4qx5EU50aWb/GIqkRipwYAwjc4afwR3DQ6ztXLl2xBThOkYyHqu2bZFy4wW5Rfq8LVkrB3MSHSg6n9VxF7FwqknDWE8VIRZvY7mDCfltvv1Jdfp6VI9EiK9BoADoBw+EJz55vv40116rggq2X+/MQbga7ueW8BRh3kocgwK0ZJSKcoxUwOzYc6BIq7UGBQEojVYdKe6C/aGnHdEx+W1dCwnZqipjIcM/5e1zgK/TsSb120xu6NvXctzFASmJBOVjmSyFgj2sgblQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 by DM4PR11MB7758.namprd11.prod.outlook.com (2603:10b6:8:101::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Thu, 28 Mar
 2024 10:00:35 +0000
Received: from BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::46dd:6e91:5461:35a]) by BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::46dd:6e91:5461:35a%7]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 10:00:35 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Jablonski,
 Mateusz" <mateusz.jablonski@intel.com>, Andi Shyti <andi.shyti@kernel.org>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
Subject: RE: [PATCH] drm/i915/gt: Limit the reserved VM space to only the
 platforms that need it
Thread-Topic: [PATCH] drm/i915/gt: Limit the reserved VM space to only the
 platforms that need it
Thread-Index: AQHagIJBWgKv+CDMNkCT2nSszshCrLFM7FHA
Date: Thu, 28 Mar 2024 10:00:35 +0000
Message-ID: <BN9PR11MB5275CF6AA1248DD2DD23F3F0E73B2@BN9PR11MB5275.namprd11.prod.outlook.com>
References: <20240327200546.640108-1-andi.shyti@linux.intel.com>
In-Reply-To: <20240327200546.640108-1-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5275:EE_|DM4PR11MB7758:EE_
x-ms-office365-filtering-correlation-id: 22a19cf8-4bc2-4908-f987-08dc4f0de9ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YCOsS4spOX2n2IimZAWNnybgBgQeAoMTJzLMW5W4uZlIpNNASjIJL8GkGyCPBOx/twE13wCbHyiJNqOZbhk2ioVqg1TLvpziEmm7/v8468OMFgd+XygMrxp5wdF/D5sEErGhl2l32wwUfgWB31353BeMbl+l1mlmgQYm8KM5VeWOU6zgHtG3SOv6gBlWmPlyGiWRhFawV718wFT0797W/F5X4qRwqvwz0Mmh6UyCIti9ef5v88qWfSibrneqVoALrjP7WRVA0ula8i1mr3KLKApYcdHtE1F5aMMvkrEJQllG9iFMXN+UXTT52EYwRaeIzSFeHj0XediOCo8InHJwcyW6ruVONZ1/DrcyRFGinjzpCiXTvFgz1BTIMnm7kSUlusVaTBgNwI2mfq9Mw0orAak8mNjzBRrxVAt7YFB+BLiRNunGAKOJkadzCmDOn4Wpgv+8R22jUEcfRFoXiqNxyWxBkWYE0mGi+tCjjk93mOzdOfO7txjVjFrjGF/Z9l/9+lSssdAsMI4HDzLL8LUi+TTUJ+JeykAQkMp4MMqaO24IGpejhobs1KxQz97C5Ckm0lh4j30ScFKRh1I6LI0yDZIi9wIVNTi7rT/wcr4M4vWUa6mudmPtvyfG7HyhaibyGmtplD0MhQCcEuCvXWDig/Me1e4J5vrlYsSgltMze6Iji6JTKv0UYURBib0OFcqOQDT2V7e2vgqxfz7GeWsRXEyFWSWviG7wDxqmyp2Dpc0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5275.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1QCOSYNq3D//AQrVFj2zjhbWckwxJK4V18MS9BVpP9XlwLavkcCsX8liXpeQ?=
 =?us-ascii?Q?y1IGDOnsZPr3Y2y8gB2sCv0bNXTGYZwKHtlujAFQCe20cxWZfPGlGfIJ/Vhn?=
 =?us-ascii?Q?2TpVyrrl/2IUqCOUYuPoos3O6fCKdFLknQyRXFhQTwlyQFd/4fxh8fUUgRbp?=
 =?us-ascii?Q?Kbw8v87evN2Iib2utIrZKJSw14OdUhH5XIZHonQ2/BJfAWwvq3xWcSjetKmV?=
 =?us-ascii?Q?X76YXQxFVcfv4WNyNiXxj75WLFDsnbLlcjD97wt6j2N2rPooBRgGfRkCLJdN?=
 =?us-ascii?Q?F+ohImQb45P3AtzzzK1hfp+sIb11X7vPLqleZRL9szwFD3r1y8O0n7yciUHU?=
 =?us-ascii?Q?rFYxNW4zDucRNrchfeYnLUwJiYdshhDEU65BgxwsCXxpcFxvtwB8ZWTz+BkY?=
 =?us-ascii?Q?ALiRBu8FNnTNHyquXgaaU3USeWQCsVl1EMvqX3E237UsTP3b+ZykO55ylHTi?=
 =?us-ascii?Q?7dcKDQXgcKZUYGWSucTqNW/N6sqYHGc6pjzqEo1lc0dHmZIPC60oHw1rd4Vb?=
 =?us-ascii?Q?lYWFO85yQtHenyeMccir+FuSfv6FCJLMtNzt5ab1j7L0kLXzycY0q4rgv1MB?=
 =?us-ascii?Q?cr4simMp9iMpQMOA0+iurTdXIpXNO2Tv/Go7AIDYYJ4dZ1t2yZp/VbBbTo5L?=
 =?us-ascii?Q?ALCtyIOy4+DKsZPPJIHUsAHQ6SrVBcOQdghxVBtVAvbiuo0PyJh0PPtPauVI?=
 =?us-ascii?Q?Onkf6iz9qi2jhKsR3XN6CNrHBe+QGWj+jotbPed86wPZI+mFBSVmKh+ZMS1O?=
 =?us-ascii?Q?RsMkUXARqAAPP2jNixQvXOaIFkArjlctaihv5pdOUYcCOcj+HjC8bq7QbhOj?=
 =?us-ascii?Q?PzLc4jSCyMotXA0yTuk5dZ17tqqWhC0EdVCpwPvJH6O07RBoR8f44n0imoqc?=
 =?us-ascii?Q?jk2GdsrtzRV18Y1Y7QyjthlhtfQGPMWxecaudHPXO9+3b5VyaSagVafpDIxH?=
 =?us-ascii?Q?R8JBcnwEY1LU7G99U5qiAZFBLC8ECV69ED5M7PzGjCgxgbU4aUXHt9D4EvJ0?=
 =?us-ascii?Q?0acTnjMC6iq9FWP6yJOt8S1t2MVdMgvsZRNB+G6PULYwAT347OFJNNuvTZ7E?=
 =?us-ascii?Q?lXI8qQRbf8hhKgYsjVdR2z390tHP0L3DR1kVKocJdJQVWayxtScxuyKq4a6K?=
 =?us-ascii?Q?iEWndrRJ2p/d++bZZv2ZgJIJfacI8x/oLkfke63Jn6I7zMexDWv0Bohn+K+R?=
 =?us-ascii?Q?qPSvx9JNh4o3ke/YutoAm1/d/EQffo1OIHpz2ZcjrQJmIUMorPgU45ZuOk59?=
 =?us-ascii?Q?UCjajocZ805gGp1l6dVidayN4bgMYPH8KfEMZqOpCYziaD9vaKnCdq/19Osg?=
 =?us-ascii?Q?pOMaWgVL0NbLoILmzYX0orhJBmCSDLc/4IjKQ7kBKwOmpb/eNxeslfELXrvM?=
 =?us-ascii?Q?vraLD7Uu1aoDN8kjlyE+kNkk6B//wC83lbTSPKOHATxJFjrb6HjPBO42JIkM?=
 =?us-ascii?Q?zEp79rzUFu3e2Mmma3Q6Gtq1E54gAUBhPbGe/EkXt2C5817EXxi+r1TZ/3ho?=
 =?us-ascii?Q?22MZvCu8mLJvuTVgbZJ+JUhs2zZDqskEWZ7xjf7ohhAP+ZFKphO7EN7o42uh?=
 =?us-ascii?Q?v2Oo6omCW59e0NTn6RyZcZ84JrpJi4lM4FV4PHel?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a19cf8-4bc2-4908-f987-08dc4f0de9ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 10:00:35.7360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: da5b/EYkB8kMi+VXkvPSBYtMosn5pEfuSNaSFOIn1UvyNdeXxpAu93ig7GnC9JtUwWCNM7l0ySDd9NAt5je1kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7758
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

Commit 9bb66c179f50 ("drm/i915: Reserve some kernel space per
vm") reduces the available VM space of one page in order to apply
Wa_16018031267 and Wa_16018063123.

This page was reserved indiscrimitely in all platforms even when not needed=
. Limit it to DG2 onwards.

Fixes: 9bb66c179f50 ("drm/i915: Reserve some kernel space per vm")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>

Acked-by: Michal Mrozek <michal.mrozek@intel.com>
