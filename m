Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C137A03FD
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 14:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB17710E56A;
	Thu, 14 Sep 2023 12:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B581E10E562;
 Thu, 14 Sep 2023 12:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694694975; x=1726230975;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=BLDy6P7ezZszo0JnrBvHWkb+fxSbulk/FBisqnX7MAA=;
 b=DCydmmdHC8nssct+rGm8zsRUdkvHRX23HbV63gUHIAOsYIeN9hpXEIoy
 Qg4Vb2jpl2QclgHBL1R5Vu8ZHEomhJOUVnFAUm8jz3C/WqcfxTWHQoppe
 MBCkfm8XlAx/ZfypZ1qd4UL8ixHkGCWHj8i2f5A4fNyn43WJ6SM1IP1DG
 z0PBj/8Kj53u1tqdv5JzRGtSuuAXUrXm+0AIikMlZVRr2yYSphgkmEWIW
 Y/JaZ0danHNFdoTryv0ExEJ4lXPyE+45rbEToy9UwdS9ElkIsVEPaYSKt
 dho4U1oJx8P16PZWP4CNMJfZUCQP3m161KR6b/y9NJ395Vcg08nTeB9zo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="442966461"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="442966461"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 05:36:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="737907941"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="737907941"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 05:36:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 05:36:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 05:36:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 05:36:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1CHca7n8lTymGeCYVXJtOKmo/EYKFhnMtfEUV7ZHKLIBnjD1+I9STSvADFY0+dwfI1mxef80LckZxJGXFosGnYKWaFYnh1pMz144TFBXoRTfrsAE4PWu0H9Pi+RJYikrfdkq6308W8vB9G0H7+VN186ChC75jqUqvTFd+WmWCGIoMtEVOBhpX4i1xa/kNbsdpVn6BMPLjoqmvAlWb0t5ZlVGR2j6mF/lw8obF9zz/4SxQK+KhUmgIcyURtEsYACtX0C6ei61ARPSHowlDt+dNRRyX+D8UDsgPpivU5fL/QtIwbanJfS7JL9InnxCTnuZKEhOvcBAnXpepwAJVd1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULyZSSUrqsYEnMZiOGJleJXIe5I5f8DXZhUf1mYyEYo=;
 b=COqpFULKUOQ3BYfhZGFlBgGI+1g8ROCirScQsaCbFtdGLZkziAYwFAs4iypIV1IShoqpeXrmEMj+OLyYrUbZyAR123bmRI9KhojDf9iagxqlE1yiVa2fjdoQgd7kSOqyR5pRGuz6MpGNW05hDvhHBjLaU++A9EfvmnlLWIIXo44bFbLq/RPtv5nO0ZFZTskueM1M2UoJoHh/5YPASLqOzuUwJ08Oyy+QVYu9U5oiuis+SMyyvPipipB3bFHGKO4T37hPvbKL4AqzO4Nhh9I2YXTp3t4KQzawzVkoGNiZYbt5oCXvhprh3ohc8nhVebEZYfwjmF3/1LFifIDsDY/gCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN9PR11MB5322.namprd11.prod.outlook.com (2603:10b6:408:137::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 12:36:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Thu, 14 Sep 2023
 12:36:12 +0000
Date: Thu, 14 Sep 2023 08:36:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZQL+NqtIZH5F/Nxr@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BN9PR11MB5322:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bedb066-708d-4c95-273f-08dbb51f2dd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s0gP/9fYJ7inu8qa4RtuRRJT4fNWBh3g1wt68h+TLWX+dklIi5XS7RgtUdn4pAfHvzg02bCd4zYt7jiYHzGlX2Ex8QwP0FWmXZI1CZKisKda2Yn8HvWUtlppr8HoOGDQe8mVbWvsJhm5VaKr6jEa8mI7EWuL/8yu0j5BQEVViqQrF9vt90uWMjwtpJkXabmZq2KXccVpzNmmDiD6B9dYi/i9Jzpaiu/jnnH05LMt1nQlWtisduiLQ2tBS7MzPjhgQt4zXqwtvZIo1Mxnv9YaliXJj7IejwRd4YKlF1CwAW4kIxyh2WiU1/XA0wVGrt6GQ7cHrwi1SOrudQqMUsaQpPU2SzaumWVb+tEMSoZb7UTNyhjuUUOqBOZwd+HPVGbjnXbZShjjF/il0QBFlUiineii5QxFFd0XiaK+4b8+8Cb9uo6RF2HuMQlVvQgB4vetXtdzKZYRTc+jSwQo0dxiWJexMAqatXcLOCaiGHnHdOSTYQvS1ysLjHPn+QyHbrGUpjyPCT72VcQ9P1sB+VSRZCArhq4ZqT3AcZwYQQoU8/FK/ISv9eP1GJEfNU0FRPQn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199024)(1800799009)(186009)(36756003)(66574015)(44832011)(5660300002)(26005)(83380400001)(86362001)(7416002)(41300700001)(4326008)(8676002)(8936002)(6486002)(6506007)(2616005)(6666004)(6512007)(66946007)(66556008)(478600001)(2906002)(38100700002)(82960400001)(110136005)(66476007)(316002)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?16sWnwKgVIpbiH3kIFXej508i5btKav5VtZWrf+hebMzsffRqMrC3oqBjh?=
 =?iso-8859-1?Q?/TKJgSEyJ7nKe3PH33zED4D+pu/konE3nYv7nJ5IrlSq2DGhOdTYDaP8q5?=
 =?iso-8859-1?Q?fgn3nQ7MNOFn2laqwWaTmXY+gpSJvjhOnl3BWfYA5Q4Jdc4pPbjYQe9Vkc?=
 =?iso-8859-1?Q?pkOXZN+22ToFV0OYMxpqo41DArKiJ10t/FetTkrvbgW4l/rpCXS9mI8+J9?=
 =?iso-8859-1?Q?KKd15OuDujYt5osubZHr1BElag4d5dB6iJyLJ6tDuMn0X3pPyZRjzBBibU?=
 =?iso-8859-1?Q?poZwyuohScKSiUs110wO38uz7oZjt219ICs+C0qo+O1sfe9LToWvEKfrEf?=
 =?iso-8859-1?Q?lHe3+/iIDsOwvludVQl6m30QKWSyV5JthkqTa3HwJ3/Yu+ZWYMc41nEs+e?=
 =?iso-8859-1?Q?MaYXPjncsIi7CizG9y6KsovFfDKT708MKRiJtyjPi+G/sUrv0zMIvfZ2GP?=
 =?iso-8859-1?Q?4RvLPJZUDI3H8wIAjTOyZzcAeFHiXukcL/f1jAlvQanTcZehdZs1d1/VOg?=
 =?iso-8859-1?Q?vIPZ9Z9uV7gL5yyyggUHakPYSl8qjTfy7PODsigoEtzxRFvPL8AH/4sfcI?=
 =?iso-8859-1?Q?S8Uslvuj+ud9l2+rL2T0z2aweRDQcJnW5bMWTKmbHO82EWBM6PhFF2tTr5?=
 =?iso-8859-1?Q?sXJyN0mdRj/YxXYWUfE8wV5aPXOUnaGBS5THEDpjnYvojWdqNSuyxn8AJh?=
 =?iso-8859-1?Q?Sk6Kwx+Bv+g7sikLDZfOuQXHhFEfBfXMxnE0i8++z7/Gu50I++R2rSbHzR?=
 =?iso-8859-1?Q?p0IlCb1wA3CK9nWwY70ubg6nUm8OujHM27g4sBUATd2sSB6hDQj+W2yORY?=
 =?iso-8859-1?Q?UaCCM7y39rQe58HyqhRfLTnhFQK7vlMug2dU6RRlTKg3tKnvKeV6l/CO+o?=
 =?iso-8859-1?Q?KX0kn3+zFmwmUARpIIQaMN+XXbUFCdZmpp896gbGT/6uMcPsph5bMtyMJE?=
 =?iso-8859-1?Q?h9LsKca56tNejtoI4brkQ9ouTVQypOXyYEirpGycanvv8zL5P377u+Kp1i?=
 =?iso-8859-1?Q?lFCxmAyOnDPAm6PtOKry3UT/ONNSABV5PKPFJwAitsXG5iZwDo06Hfb4rh?=
 =?iso-8859-1?Q?ye4ojaZsejdzi7LQi/08VfDVwjjwILDZrvijlEMb3LAwu/1rSzTBHSdvns?=
 =?iso-8859-1?Q?agF7EbluG07BCsJnHgFoBciKEewpKLVQw36ZA5VifQ+Q3ZghIl1VdFvLic?=
 =?iso-8859-1?Q?wn2lsknOTgRYu1H0KN//imk4MUI08guPZAtlQx8obWRmCj2yGoJ+bm9x+0?=
 =?iso-8859-1?Q?cX2AN4kO1L5J/+8yiUo9Ehed0e++aJFZEJkPZdna0Bse5FBmn8EGAYLPom?=
 =?iso-8859-1?Q?WkvAwXc5+lKZRFJrZuAXOYDmXqZkkilDbfN8p+yGcR3IYUrCWE+ZTqATUb?=
 =?iso-8859-1?Q?SsvxKe/syPX4ftIB4xjm3h92EtfJx04/n/sTn5JLK0TP3a7SKKULLPM7lX?=
 =?iso-8859-1?Q?TCB3n7FtnOC8AI7KM6GPvyp7HjKVD2ioCv9P2ispwLzl8t1uUfTLF3IL39?=
 =?iso-8859-1?Q?oQy9pfX6DXGOKlF8X9ZDgMRjTe9iHEVFWlsYV9p/RmWNEwSnz8Mktm/DD7?=
 =?iso-8859-1?Q?aLvcwsdD4xDGbuqAG8PA6e03o7hCCLYSvGJ3pis8ffHtJEcPbFkXvK1X4o?=
 =?iso-8859-1?Q?Mh9SBIGaJpMIiB2mu868BkoBScqBXVSBMq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bedb066-708d-4c95-273f-08dbb51f2dd6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 12:36:12.2993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P65EbeDwjsDMEs5nn4kpPhuW4MYWeiMEfMM9Ku5RFeBosTitXZxmcHo10oLWCB2uOTKVo2Un4XAMGL+fVX/C6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5322
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Only a fix for blank-screen regression on Chromebooks,
targeting stable 6.5.

Here goes drm-intel-fixes-2023-09-14:
- Only check eDP HPD when AUX CH is shared. (Ville)

Thanks,
Rodrigo.

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-09-14

for you to fetch changes up to 7c95ec3b59479bb24093918bbfc801c9f31826f2:

  drm/i915: Only check eDP HPD when AUX CH is shared (2023-09-12 08:35:32 -0400)

----------------------------------------------------------------
- Only check eDP HPD when AUX CH is shared.

----------------------------------------------------------------
Ville Syrjälä (1):
      drm/i915: Only check eDP HPD when AUX CH is shared

 drivers/gpu/drm/i915/display/intel_bios.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_bios.h |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c   |  7 ++++++-
 3 files changed, 28 insertions(+), 1 deletion(-)
