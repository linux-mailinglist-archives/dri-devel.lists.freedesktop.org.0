Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BC787B745
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 06:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2E110F55F;
	Thu, 14 Mar 2024 05:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkMr5uYw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E6C10F55F;
 Thu, 14 Mar 2024 05:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710393727; x=1741929727;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EGBOBij6635v3EfZavJ21WegkhRlWp/HZ65PdCegHNI=;
 b=TkMr5uYwjqI20PSNL4ftsokmEpFIpyuHEGmzyJo+vNwrTROaFNO6Zd6C
 7wvt8pNWH6fhZHhQbNtFQHkoo2ie9avprQkTXfrcWdL8CvzcBDCESSJWB
 ztwwsI3oanLRtSsaglil3SjR6c5tZ09S50i7gCkNLjJt8uNjpkYc5H7K6
 NlyGPuOmaQ8g2J6jtZ+kOP3u7MU13rKofQfXdufmVW/LB8nY7kYdzeu/r
 NsXuyVy5VyGTZnEqdci6/y+9lgIM9SJs2W3XMvZHMzzPFAP22ERaz4qVd
 mbpDNTefb40qjC0CNIy6DLJNozk9CNAIY8WTE9fQdeuERJJ7HT3psKsWS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5043037"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5043037"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 22:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="12244177"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 22:22:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 22:22:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 22:22:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 22:22:05 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 22:22:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esqz1TzU4dV0en1dRHtDvF8HXciBoSl7JvHoouslanF+RF+d4NZ4O44HXIEnt2C+0FVtga7wBWAGjN87gCBDvqU37o30DgXLiSgzKAz/84AIHDYXP7vaxEZAimJYQliIYJMvOBTmLdmMlVc8NG04wGzzs+r6hhqSA60hCQRszJ51q29akCgl/San2BxSxqnWjScf62rQTiTkwhd4SAke+7NdFP4H/KvsBAF/ti442PD3x73C0OG2raX8D0GqTXRz2okKc7FeaKAvSpkAp2d7DZj/DhQwxXNmGmTPCXxNprG5+Q4cgaVMzDODTKberUXIGtv28YLgZzi3tdua7OV60A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WScweXIxCtapeiZqPJ/C1w+RQNAUM88jTJvIO8rVQLc=;
 b=foQoHmSrbMwlXdwNjXLGI081aA6VOU43ZQBmO7pEF3KQtR9wBit2lS6shNiR22BEQGL858/G5XpkwoXQINDrje2CGjfAVFLsCF8RK3xpsltJ42zKnq5LNYlejmyrC9Oc4CSwgx9cdzCU5sfFugb40mtFuYZ54QmW/sQBOT6CA4g51cl0nHYXkCrSRB+paK8l1eqpep23geVULz02aZZHH2gT1k47xOkh6LkjFVPsU5HYokr2P0P7FjSrdZ+8XYDndXh7OZy20thtOPALq51iVmQs1glDOS2AM9dHMx8B8aoTErWwvpUcb/aIYFpGhwAmYHAjBy2itV+/KTXt8JZzCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 by SA1PR11MB8374.namprd11.prod.outlook.com (2603:10b6:806:385::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Thu, 14 Mar
 2024 05:21:58 +0000
Received: from BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::46dd:6e91:5461:35a]) by BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::46dd:6e91:5461:35a%7]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 05:21:58 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@kernel.org>, "Hajda, Andrzej"
 <andrzej.hajda@intel.com>, Chris Wilson <chris.p.wilson@linux.intel.com>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Das, Nirmoy"
 <nirmoy.das@intel.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] drm/i915/gt: Report full vm address range
Thread-Topic: [PATCH] drm/i915/gt: Report full vm address range
Thread-Index: AQHadX44Sh9xWy77xE2oPkbaYDlfvLE2s/iQ
Date: Thu, 14 Mar 2024 05:21:58 +0000
Message-ID: <BN9PR11MB527586F3C80D29B7147AFC4EE7292@BN9PR11MB5275.namprd11.prod.outlook.com>
References: <20240313193907.95205-1-andi.shyti@linux.intel.com>
In-Reply-To: <20240313193907.95205-1-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5275:EE_|SA1PR11MB8374:EE_
x-ms-office365-filtering-correlation-id: c88a670f-67c2-43c3-5672-08dc43e6abc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kC+lG+rUAldkhYgqJWswo/neBJPaIW/Di0gp38Fh7QQTWuSkf91eH4DM8N8VsJtdCa/RRvBLgjkkQ4zTsZR8Q3nAox4DNg1FG2DWSY6Re+/3Rcz+xvZqBnPLmXnjcKMLdz+s10k3/uTylAxI1K8NlWd3mL8K2jTeGElCDon3nVaOUoFfk2RPoD4XYPJY8VmkdxB2xlg9AJnS7R46De0clUBTWLjVBOZcS7pXRrlHLOSMcm4q9mNQwVs8tETjO+C6cd3bBXWZ1NFo09V83GIZg/pkSGMWeWtOKfG05BmGPGvE//wXPM6qZ4/s1LcKF/cOjU8NN3M4nylXw8eXMBxyxNgAbEYSSOm3OR2PXzruVsXSkZE8AMvA9QeGl+ZskDtvqqsLHPUfa7kbfOFW2qM0Zq8/q1W3FZH5twnpUF+IhmP9/aBtTPVMg9yXNqzOCXcl2hfUx3ewnViqbxIIC/wQwjsrABkxu/74q+c9nB0R6H6AmhcRbe3CkqXQovixsqUY7MF8e6nJbt9n9HJTe/TvUsIw408AMxD7AbMLI3BmQ98AjrTSUNlFLw7Tx4+Ckic8HyPdnTTM9HTufb+3YEYiXnt7ge3L/4vCnA9RSb6zQLuVX5YcdChxWqD+udc9PR7inhgs/k1zZuA6XEXxqIJkVZzGhyIriJMsZN/cM7YDG3VEJEPdl/TU4BrkBoWOsdCDNCfnGiMTamYgUkFOBMQHAmsCj/kTb0uyKGVtIGSHpeI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5275.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N7Xh3N0Av5TF9ERK8p0GHwqaiZPA6pgTBu/wXQbTUJ37hne8kOtPz64nakeu?=
 =?us-ascii?Q?vBQad7ZrKpR/rNwnw8I3U00J5DuCBzff/4PWpWYMklnOsxkycVOCjUo5xddu?=
 =?us-ascii?Q?KV3vQzkTzn7AEmpFzhRF7bYqsDF/hIwPXlnQkYpbuX196BixwKEGtFgwQ6cD?=
 =?us-ascii?Q?m5KaxkKq67IKYgCe9CRw7BsH4CAwBS2GtHLEGaGvUkSgTkpX4HwBiPnhG2PT?=
 =?us-ascii?Q?MivLQkRbEl2pK2Q+C/NZwrUTbmvoehoaBN/3gvOU2Sa5mwz9wC9MK9ezjyMa?=
 =?us-ascii?Q?LNqwuuKK9ZCSSSh6MS6kMVvyiB3UVUyIyvUDuJ2DAH+r4E3xuihPeD0G+Uhc?=
 =?us-ascii?Q?P3bpYyiAFeuvzGRMIgChqIvEVCLgWL479/0CeLfn2Q5HdXuxdE5bn9vj2K1/?=
 =?us-ascii?Q?SROT3kv+BCYfS73+9i3dlR4xW6iLeXWU0wDS1qdEcVTgd1E7TJ1/0jS0oSiu?=
 =?us-ascii?Q?1XiAqfOP/AmazwfGpLZLoNbCQwUwxVtj9mw4qonWkP2ZEeSW38uqLO/B3OXA?=
 =?us-ascii?Q?kIo+pWhU4imo6rkRsjwKSB6OubL6Pyp6uoc/9dnIWKIar1vivTjEx1ejbIT5?=
 =?us-ascii?Q?Q0UmU2kGxCNX/zzEuF7YlgczAwGInqDvc8lqOc8F0MQI1eWdjgxRXAWrrQs7?=
 =?us-ascii?Q?Ab+2VdaIWexCpka16iZGIGQZ9QKdejnjAUIRRd++zzNQQJs3Y5bNQa9P/+/c?=
 =?us-ascii?Q?RkzV1mJAywz0Qs1Ed8aYBKoXdBHah/NmbMP6zVgooUmOSQImcF5QGlLPF5bv?=
 =?us-ascii?Q?B0+oFL1jXKHYoopJoTmgFqVJadHXK1x2lLJzd3g8rYZTlQuiSi7xc9PLyp06?=
 =?us-ascii?Q?/EdIBIob5wmwN6YO++WdVpisvtcbteCA/fqrecqUZ6bdQ0Z3G12gPPPczdmN?=
 =?us-ascii?Q?We756jH4iU7AWuKM72Oj5KV5gbPWmPziPBrb8AtPSMJTbTZ0kWEAotoD0vxt?=
 =?us-ascii?Q?X4IHP/VFCxznpjSbNjI1z9IpU5k5kV0L6uOL5AxJcYZvkI5TNDXy4TLYQlGr?=
 =?us-ascii?Q?YNl+QyUfTdel9BEtFbOOXVKi2mjXOgutrtUyKyvJtA8aBN/wXVnpglS4i0tS?=
 =?us-ascii?Q?vmVrhxT5F6r2wHQ+qcz3rZR4EWrz17I0rmQHn0GhknibXHe4QDZLvPOppB82?=
 =?us-ascii?Q?ReFdvSkC5qMq9MMzuA8B8cDtHjYdMFuSTKftBlmJ3VnYS/dhIueulyMKmIau?=
 =?us-ascii?Q?wvKbY7T9D6QOZ/R2BqTC2g84lUbfRHD5Cydg5LuU/M1IEJ7rUqK1oLhfShjd?=
 =?us-ascii?Q?CW3yx7INIO1ZuNDLBst9Z9vUpbjrCylo+9DNoYA3sa8bJj20+Rg9VlYJFmaY?=
 =?us-ascii?Q?KFcEYat3krQ2a/iACIYPvo82yAIZGi3OkYeQDF4/aIpy9CELDjjseqmv21To?=
 =?us-ascii?Q?/Unj5iNE/SiFIPKkbmmsghapDDWmO6myPm3cwAg3BaIng/crBv9UwJc1FzZc?=
 =?us-ascii?Q?QJKnbqjJqElAUQ3zG4+7HslS7b5+4DwZjL7bNoLVBriGMQfkxD4BtiUlMcgA?=
 =?us-ascii?Q?0mn8htVey+FsyaldAm1hYTRUFgiXnSKH4fpgFQMrjM70drOdf2o2+dayAGRs?=
 =?us-ascii?Q?bJmCVd2U9S05uqZ1wpL1VTyzbdLMqm4gH3U5bYxj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c88a670f-67c2-43c3-5672-08dc43e6abc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 05:21:58.2794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wItLMy3iUSXvIrHqBKMeuc/5V38I7N2OjMlCV+Ye1SrBV6zaigNrUveDHk1H9S2bnH23V9Qti53zfjQHbRxFHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8374
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
vm") has reserved an object for kernel space usage.

Userspace, though, needs to know the full address range.

Fixes: 9bb66c179f50 ("drm/i915: Reserve some kernel space per vm")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: <stable@vger.kernel.org> # v6.2+
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt=
/gen8_ppgtt.c
index fa46d2308b0e..d76831f50106 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -982,8 +982,9 @@ static int gen8_init_rsvd(struct i915_address_space *vm=
)
=20
 	vm->rsvd.vma =3D i915_vma_make_unshrinkable(vma);
 	vm->rsvd.obj =3D obj;
-	vm->total -=3D vma->node.size;
+
 	return 0;
+
 unref:
 	i915_gem_object_put(obj);
 	return ret;
--=20
2.43.0

Acked-by: Michal Mrozek <michal.mrozek@intel.com>
