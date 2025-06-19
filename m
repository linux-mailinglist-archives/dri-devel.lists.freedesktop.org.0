Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8122DADFD5B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 07:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FAC10E9A5;
	Thu, 19 Jun 2025 05:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gVtwoIAc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8B510E99E;
 Thu, 19 Jun 2025 05:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750312580; x=1781848580;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4GcBePnQs52mQ9GdcKJf9wSGUg2Vj9O7lpUy2eeDChA=;
 b=gVtwoIAceLKQNZ4TAtCT9+sIKXIaRLqqBwnIepTdLGIwZeytSD23tp70
 +ETj7S2jsJtVjkkNlbh4MUmI6NgFz5ScGBqilsosp/bj6p3vpiAoWst2L
 iaH64QPwbZPLR5EWEa3hGWFTOonwvtWMvAiT5/hCKIqP48xoi7aKV9M5d
 JUNlee+GvxvfA86QcrC3Ctjq4NKGxAsrJAlqZJzivXVOegL4eTRfUrtqn
 H0pqjOp4zSwxQ2DITjtZQwCLa5i8DCPEcO09x+gZ/gJt1KRuf6FpzZalZ
 LnlqRKmi9barBEvS66oH6Qmwsp3YA0o1ahubQrayt84mpaNIANswtqcld A==;
X-CSE-ConnectionGUID: C0wUvWvOQ0qmatE2k/DjYg==
X-CSE-MsgGUID: dGvrD9zoRvSpNOnX22+TKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52648179"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="52648179"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:56:20 -0700
X-CSE-ConnectionGUID: cycqUwdvR3OvSPHMaBPKtw==
X-CSE-MsgGUID: B5EJtWw8R0+sfBcrRr8/sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="150074860"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:56:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:56:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 22:56:18 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:56:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJMPerj501iiS+nUGoqBz8QTKU9eXSI0r3hoY9r+6KVNmDIBLvQEGQO6CiCdjgc0vPs8Rp1/fxfWbho1kTP4XSj99pQh2yFPLfuzyYSkb8zkNbVcfdb/VmlgOsgY/APEe3udvyUr1BezPD/FzpD6Nb7NzrH0DkEJykJwrr7WciDvSTsMrc4t2iZBUN1eXZXvZMR9mz0JUldzcc76LB8Wxdrglghr8NBghKlPyYqG2Fo1yfKCulqIF/b39SBDqRKTqdv7EXyblN5sa3THtzdDWIFyfnQkGbue79aRUkA9JQEc6Ac9AOY6N/ldBTuMZo0tU8WQtshMHv2n1R0AyRGv8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Jz6fgymKsZh5jBOTb2nRVUs5s0/RsiodDUvKrhe8HQ=;
 b=p+oiUMstu3UevSR3PnWR7JjkeLNWv7xOHH7ubPtf1A766xRmlBIrTMV2sfHK39bHhfjh1ZeBjZAi7MGc/E8v8JB8S+Ul/JNSHZX3sAzSJH1nXcj9NnXeGmC/PX/Y9drpbdeSTX6oY7DFNZ+1MJt5kjISRQ4PJz5b58KugoTBpJe7NqKr0uMBeub98+fINeX2BpIlhm/viV06VbaDOH0+GuAKkgtVgdjIhp4n9oHcYKzxL43bhzwSJCqHBxJYJZtkbtSBVtUESu6X1QHMbRo+pacYO6erWELinN+ByOWvdvHe/DY9yF35bojsxBHI3fzt09HOpKoMgMX3Kk3H4dDETg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA1PR11MB8253.namprd11.prod.outlook.com
 (2603:10b6:806:250::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 05:56:15 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%5]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 05:56:15 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 03/13] drm/dp: Add argument for luminance range info in
 drm_edp_backlight_init
Thread-Topic: [PATCH 03/13] drm/dp: Add argument for luminance range info in
 drm_edp_backlight_init
Thread-Index: AQHbrPQjjHgX94DrmU+/a+D20aPY7rP/aJsAgABHZZCAAAwhgIAABp4QgAqWNQCAAArHwA==
Date: Thu, 19 Jun 2025 05:56:15 +0000
Message-ID: <DM3PPF208195D8DF450691C45A5C906D7A8E37DA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-4-suraj.kandpal@intel.com>
 <IA0PR11MB73072A82012F059738260626BA74A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <DM3PPF208195D8D82C92D58A8780E866EE6E374A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <IA0PR11MB7307ED398EE421D9A54A686CBA74A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <DM3PPF208195D8DD3B3CBE1B3B00821BC02E374A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <IA0PR11MB730719B23CABD77E02CB6220BA7DA@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB730719B23CABD77E02CB6220BA7DA@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA1PR11MB8253:EE_
x-ms-office365-filtering-correlation-id: 5acf7b94-2bf8-4d9f-4269-08ddaef600d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?tXC3iloyHBDwk1SDB33D/IenLPqAECtv7tjcL9tJ0bpL+bPLmGkQdyRW2N48?=
 =?us-ascii?Q?hQ1ipPO9ImmkJ2x0iL0IlI+9n6QpODPIIDtxm2tg1LcckiHJ22cvw+6gf8v/?=
 =?us-ascii?Q?i+1U/Z2ik/wI2MjZy1aSly44DC5DLd4xGepxl8WUsk74PqKswhpo42qh1pwM?=
 =?us-ascii?Q?M+vy4yrmYfYBthv/vjoVQAM1acy0N73gC7YrbT2mGH4+Y7wvk7RQcQ8EZJjA?=
 =?us-ascii?Q?ubyGVfMR+1bbAOMhWviSdWhDLhWUkWrirhhOeCTcGiytwOhwEO/Do41Njbzb?=
 =?us-ascii?Q?EOk5u7etlwLZALUh4S48AuSMM6yIj1SM8WmtuY7ctQbfxYlX32/FQpgKdiE/?=
 =?us-ascii?Q?TB5u293jtLbBRU8EDAi2RMJSVkMbR3jSGSdZlszP00kFPETJ4q7xK/aqa4NA?=
 =?us-ascii?Q?xDbtB50gINRoiGkf9A7LDtWQB2g4R/HMTxD3T8p1qXEhj9vjpi7I0l+LsQa1?=
 =?us-ascii?Q?nW2Jf23RZFX1pRtyaeq4/ygqdlUayoAp66ENE9w1OJPyd8lchQw6JEyhMm2Y?=
 =?us-ascii?Q?4RFVB2tpBEr9YS2hx37uv/jHW0Srj5vEEZQIyHNouET5SRQOZKLqbT4XIwPu?=
 =?us-ascii?Q?ofnqZSjKTn8jp6RDR51nZQ2PFzdh0deXF+2M9gqGxU9ktRyXlamLUgHIChk6?=
 =?us-ascii?Q?uMVtyqCxKXGJ1UhZ10qC4leGsSr+D4iCA/0caehrEZu2Ve9fovQcMhXewzSs?=
 =?us-ascii?Q?4P5sbi2AmIqEFb5vainQgARBYg1hMOkRz2OhDVaD0QXRVfpu7ovZ4/zE0xKJ?=
 =?us-ascii?Q?01IIw9Ncwkivoxu0GDKMw+Uy4T4LxpS0+ldWAWsJGlsEMjJ54I5S52Tb7fZ4?=
 =?us-ascii?Q?p/nobMNqxwUmJYxj51bJCnTW0BlTkUO7wSOLXvhzfW5cgGvdi+3cEfEh22NN?=
 =?us-ascii?Q?9z0yAhI/6yL2EP0hJFre0Kqxoz7ZnxbigNYLz10a0XqrDVh6k0K2MA/QrA9+?=
 =?us-ascii?Q?fvc5Vm0uu1IhjPNCgr2tleyKIrpIwSSMtvNVTr9rK9AUDyoQkx+c3/Day/LN?=
 =?us-ascii?Q?tx9F9SzRJ3f+DwKrJ0dYgKDfIMOvwDrVdsrbnyUZ/87aYGmp94h7Fcv+QUXV?=
 =?us-ascii?Q?LyqqiUCtbRY88ztJtD0my+DZBylno8Crbn2zCK8ePvIw1avg7FB8S/WJzJ4P?=
 =?us-ascii?Q?F4F6wYhCUI8AMgsVd2l9xyTojyfA4JGrYvuzWkwJtgfnqNRieBUzuPotZ6ri?=
 =?us-ascii?Q?Hucf87bFo/XVOjuZXj+UZBGD+AgwmEY3gAxFTUqkJ9MYBbdIkYOOl/RtHnGr?=
 =?us-ascii?Q?vpgQDo7THV9rNAF6LFeN3LUQhhTTe49cpiHvmCggnzfHBjyhMkx1Lz/Dabws?=
 =?us-ascii?Q?ZnK0DQz1gOGOLL0YnjSvqaICABdn6VPOQEMJYqD7KkiASoaQlDIN/VwHxhNv?=
 =?us-ascii?Q?6aGSr+JkKkbVQCOXyuDcgErZmVF2MBfYkjyIvO8AgV8lqvO3EyXUCFAQQt3A?=
 =?us-ascii?Q?HZYi+mgLT7rK4B10UQeiZ4aXO0534zJ2/fwOwDkWgM/qPByQuxUbu+lcaqkr?=
 =?us-ascii?Q?xJSBE2JAxldvADo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pZE6L14XFOwSeIoOXAeahi/7/xNJdiCHW1HLlDSCy/FiuZqfBJP9ZNzfixBu?=
 =?us-ascii?Q?Ghb4yGsXFlnRhOBdESX5CsJCTYyj86dG4NfM/Z+rKCAduuzbPxg0xsuXu23x?=
 =?us-ascii?Q?3ZpKbO/eiIE9Wia7sw7l567nwwfLXgFahjNTl6ztvqBQAkw2AUa2n1LSJY6c?=
 =?us-ascii?Q?LcGxlMpwqkUFPud3sFHazz84RlSyIBBCjFEF95GhHHDVUyrFib/j3YCPlKW6?=
 =?us-ascii?Q?PCHFvgcotTRLTmzmGeFJIe0sQtcRb9lyraTn+qsMBVTu3fL/arB1oKGGZWAt?=
 =?us-ascii?Q?WQH8860bsDJp0pzg7MvUfE+Q2b7Uq/PFnDTr7p63VrwI8KkKeF5A/h2kRSma?=
 =?us-ascii?Q?eBbYZ4yL+P2Wu7vFsuR+z36VEIZ/zljBDg+js6wRR3tfQp4ogXkFQHQhD+JJ?=
 =?us-ascii?Q?IMcp8KCbOPDe4q76RE+szCzkxkyMdI1XcHiW+vxzb/uLFCdzd1k0VIfs5gmS?=
 =?us-ascii?Q?Cw7WFUTE/DDVuhQlnM3Ll3O1tlpA4fxOyvvzO5qiv7rZqNRTcdz5cULbBDY5?=
 =?us-ascii?Q?8B9enFv+4+gG+jgVOue+X0ATV8+4zF72RyuttYhOKM1CrYXNpL/Ngv9Pi2An?=
 =?us-ascii?Q?c0LYElIeY/incjnFcu/T44CKOw2bjNd6XsM4doGrqbisDXuL4PAnQ8aN1+dX?=
 =?us-ascii?Q?8UbYjkDPKDOaZKWjPlLKaGgZ716CdTugguqi/E9YuhX/JzAhrIQJXHFr8oEF?=
 =?us-ascii?Q?ktnVlyIyuCIQp2f8xwwq0oFMHpgB7wxvlTOjp80LQtKwbl7ZmMEknIDMRTS+?=
 =?us-ascii?Q?sjln3XzSN7E9VqjXNb18HiNo5kK63nJs9nMhmJDX1ITJuS53REyOFhAOrx+G?=
 =?us-ascii?Q?b4nmPitLzhEEe/ePX42oGtF1LjdeHwnhBTdPnc3Xc21rb50Pg7TMe7/0eSZ3?=
 =?us-ascii?Q?IZpRfMug+IoBYBgUnuiloWUJGxd/FjHPZT8vgcol5VKE7RqL6XPY7uXmZMHT?=
 =?us-ascii?Q?a4TjXQVoDcoUsUvx1pW0uS1lOBHdfU4AgFULmgUrY3PyvxA8PDxl1YO40dbk?=
 =?us-ascii?Q?UfB782olvdgTRTN7gd77BI0Z/VkNZZgFn7ES4lcO0IuTFhJ8XjmiKn01XLzF?=
 =?us-ascii?Q?4d7yXgnWydFc7sZyYif1UDQom9Rdkk30mHReQRKMcivRBOcZHN5bfyM+lteJ?=
 =?us-ascii?Q?vSJeNyn3t46xTr8+tu2L/tdjLHtoCqLPG+DcIwmCfzV0JNQs3fflsetzzOKp?=
 =?us-ascii?Q?3e4RtWtG4oAU9eBM+1SnRWAs76ZB1L8rt9q7OTvTNzZfcMmBaiwqsk3uQE1k?=
 =?us-ascii?Q?Txn42RODYppGb73+zexD5ME2rYNUh1eXZXVq/l1acQ9xb3Yk3gA8wC/TaNeT?=
 =?us-ascii?Q?0QVggwGomvHdT5kPxnOd37eSTOMndKr9keWW0pCI44fb1B8O49kyfuSBo1bL?=
 =?us-ascii?Q?R4qZUWn3ILAS4H0Efib3Upsp0ODchMcAbkHDgS9jY77qBYup9vHFTnH96c1W?=
 =?us-ascii?Q?pCFNThiungUaRT3Y0mDAXmi20WsaHWbt+kJ/mfFjaaWAuUSzFBx+TO81LCJo?=
 =?us-ascii?Q?KjbQMzDm2UDW3xFxUJLqUQ4Bqd4PI0lcQQ2o1pSW4ln+6cwcWyNVUcWPMpK2?=
 =?us-ascii?Q?fC86CmnF5GrYFzAmaXAGJQfcx//HOPvZKTTwnUU4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5acf7b94-2bf8-4d9f-4269-08ddaef600d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 05:56:15.5571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X0uAPeI7xn5y7XWaCNfbH6nHVOfgF8vFvaRCj3WMKd6A7pObhMYhNXex9clWfRxegB4T41chhAln/01G8L550Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8253
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
> From: Murthy, Arun R <arun.r.murthy@intel.com>
> Sent: Thursday, June 19, 2025 10:47 AM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>;
> nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel-
> xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Subject: RE: [PATCH 03/13] drm/dp: Add argument for luminance range info =
in
> drm_edp_backlight_init
>=20
> > > -----Original Message-----
> > > From: Murthy, Arun R <arun.r.murthy@intel.com>
> > > Sent: Thursday, June 12, 2025 4:43 PM
> > > To: Kandpal, Suraj <suraj.kandpal@intel.com>;
> > > nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> > > intel- xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> > > Subject: RE: [PATCH 03/13] drm/dp: Add argument for luminance range
> > > info in drm_edp_backlight_init
> > >
> > > > > > -----Original Message-----
> > > > > > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > > > > > Sent: Monday, April 14, 2025 9:46 AM
> > > > > > To: nouveau@lists.freedesktop.org;
> > > > > > dri-devel@lists.freedesktop.org;
> > > > > > intel- xe@lists.freedesktop.org;
> > > > > > intel-gfx@lists.freedesktop.org
> > > > > > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy,
> > > > > > Arun R <arun.r.murthy@intel.com>; Kandpal, Suraj
> > > > > > <suraj.kandpal@intel.com>
> > > > > > Subject: [PATCH 03/13] drm/dp: Add argument for luminance
> > > > > > range info in drm_edp_backlight_init
> > > > > >
> > > > > > Add new argument to drm_edp_backlight_init which gives the
> > > > > > drm_luminance_range_info struct which will be needed to set
> > > > > > the min and max values for backlight.
> > > > > >
> > > > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/display/drm_dp_helper.c               | 5 ++++=
-
> > > > > >  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 5 +++-=
-
> > > > > >  drivers/gpu/drm/nouveau/nouveau_backlight.c           | 5 ++++=
-
> > > > > >  include/drm/display/drm_dp_helper.h                   | 1 +
> > > > > >  4 files changed, 12 insertions(+), 4 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> > > > > > b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > > > index 99b27e5e3365..3b309ac5190b 100644
> > > > > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > > > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > > > @@ -4227,6 +4227,8 @@ drm_edp_backlight_probe_state(struct
> > > > > drm_dp_aux
> > > > > > *aux, struct drm_edp_backlight_i
> > > > > >   * interface.
> > > > > >   * @aux: The DP aux device to use for probing
> > > > > >   * @bl: The &drm_edp_backlight_info struct to fill out with
> > > > > > information on the backlight
> > > > > > + * @lr: The &drm_luminance_range_info struct which is used to
> > > > > > + get the min max when using *luminance override
> > > > > >   * @driver_pwm_freq_hz: Optional PWM frequency from the
> > > > > > driver in
> > > hz
> > > > > >   * @edp_dpcd: A cached copy of the eDP DPCD
> > > > > >   * @current_level: Where to store the probed brightness
> > > > > > level, if any @@ -
> > > > > > 4243,6 +4245,7 @@ drm_edp_backlight_probe_state(struct
> > > drm_dp_aux
> > > > > > *aux, struct drm_edp_backlight_i
> > > > > >   */
> > > > > >  int
> > > > > >  drm_edp_backlight_init(struct drm_dp_aux *aux, struct
> > > > > > drm_edp_backlight_info *bl,
> > > > > > +		       struct drm_luminance_range_info *lr,
> > > > > Would it be better to have this drm_luminance_range_info inside
> > > > > the drm_edp_backlight_info?
> > > >
> > > > The thing is we fill drm_edp_backlight_info struct in
> > > > drm_edp_backlight_init Which means we would have to pass it
> anyways.
> > > > So having a reference of this in drm_edp_backlight_info didn't make
> sense.
> > > >
> > > The main intention for this ask is two xx_info struct passed as argum=
ent.
> > > Moreover luminance is part of backlight and this new element is
> > > _info and there already exists backlight_info. So wondering is
> > > luminance can be put inside backlight_info. The caller of this
> > > function can fill the luminance part and then make a call.
> > >
> >
> > I see you point but the thing is luminance range is not something we
> > will be using later and is only used the set the max level of brightnes=
s that
> can be set.
> > That being said I do get your point on sending two xx_info struct
> > here, I was thinking we send only the
> > U32 max luminance here since that's the only one we actually use.
> > Drivers can send the max luminance they like.
> > What do you think?
> >
> That should be better! 4th patch can be squashed with this one.
>=20

Sure will do that

Regards,
Suraj Kandpal

> Thanks and Regards,
> Arun R Murthy
> --------------------
> > Regards,
> > Suraj Kandpal
> >
> > > Thanks and Regards,
> > > Arun R Murthy
> > > --------------------
