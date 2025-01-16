Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5621BA13397
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6FE10E149;
	Thu, 16 Jan 2025 07:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KERiO3l1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5055F10E149;
 Thu, 16 Jan 2025 07:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737011363; x=1768547363;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O3cOADYN/yeKvObCwXHY/3eOvzM7DjX1x7+LIhjjaj4=;
 b=KERiO3l1gSFUreoYZ/8p/isgAj5sCpBjyHnoky9S6lqRiJqlvDWkuEUZ
 D1bdVzwY/6pfYP8rs2A9YSF8xOitZxdPVqjtGIeKU6AFJ9UZ6sMtn0fwx
 Blw9LAFIztrmC9lUSXbUsvNEHcMBYLctUX0KE+oAcxxzUi63vr14IGvOQ
 vyD5gCBOgq9bFWBqPPiO9ubxtHcAVuU/1RYcazPHd0EklsVaDR20EC/bE
 5fpzWNiFMvdSZGcFh97lGP98m7rxwtBelF4uJ+MR0Ol46gWc5a4vVFMPM
 eNW4Baq8B8wQzAzzcoxrwVJbw8CXfbWAhE+PcgBoazyfqM957oQZzaBn7 g==;
X-CSE-ConnectionGUID: y4l2+uT9QGqjwCBeTh5PzA==
X-CSE-MsgGUID: f795RS5nTS6ZG306MYzCpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="59860222"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="59860222"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 23:09:22 -0800
X-CSE-ConnectionGUID: vOKJ4WIqQKKsh5X50DIJQg==
X-CSE-MsgGUID: 9BqC15NmRKW/5HllgKu8wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="105213886"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 23:09:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 23:09:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 23:09:20 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 23:09:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2EItpz6flf7LuwrPo+v0nfRA+BTvfkxlkrQ3a22O6Ye8t2a9yih8csVQGrN/BmVft1+pY37V06vD3GUX+FB1MnnicYG2fR5I43LO6qd9PVkkWgoy+xpB6z6gtO9HEi/YC9cBG87I1hC0tXDra1XLN251oiTI4PvxWyzNFJcEYbkEIhSU5pcGgJnzgx4m6aP9L4fD8A17NIs/DToZQ7jxlzsoz90yKo+X2T34PhaHplljSulEm/Oo6qDTlf4oqQ4Qjk/G72HWjaJhuhMazZTQS6HK7MafLXAzuKfpGbrYdXjqp24YKeo0mrVx9wdQMWsymG4sPlb3XoIUAFcdZEpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3cOADYN/yeKvObCwXHY/3eOvzM7DjX1x7+LIhjjaj4=;
 b=spAFzEwMZ8xWI3jih7/oIPQUzzPaNAevO1B2FTd42BE9wjdW3WGKrarsOZA9wJGjLR/wd0oEZ4GWwRycnjGJMVfBhl89lJtMcqnrNJ521XaODTuq5TZ1eOxSkLgxqFiYU1gCwcl/dXqEh7irYYtQZe469biqxRDEPQQEKcu+VMRzabQ9g2rkxiYjHG5rCWi71k1JguMnacEVmwAxRby/degLzqyBUmJgz0nCZRxbFZpXTl248QtpRW41u0t51Fg69kgvyTg/WkA0J1+6XmmAUxOoObnXFG+qpysZZw8hj7JuW8WoLT8vs9ghn9ZiFtw+0cxnGfIB4Tnr3zvvapIaGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 07:08:51 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 07:08:51 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "Bhattacharjee, Susanta" <susanta.bhattacharjee@intel.com>
Subject: RE: [PATCH v7 07/14] drm/xe: Add histogram support to Xe builds
Thread-Topic: [PATCH v7 07/14] drm/xe: Add histogram support to Xe builds
Thread-Index: AQHbYtFQ1sPHU5lxiE2S4Tu5yG4Xr7MYqLEAgABGTGA=
Date: Thu, 16 Jan 2025 07:08:51 +0000
Message-ID: <IA0PR11MB73078232EED1B5A1B6EF0C66BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-7-605cb0271162@intel.com>
 <45k46w3ir4ytz3eqm5sapbqdzgfbkd7zyy5gl26a4ietlc32u2@c7brxhuuitru>
In-Reply-To: <45k46w3ir4ytz3eqm5sapbqdzgfbkd7zyy5gl26a4ietlc32u2@c7brxhuuitru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ1PR11MB6156:EE_
x-ms-office365-filtering-correlation-id: 67dda33a-d5e8-411f-8399-08dd35fca18b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?SwwtIEp0DcaxzvjLKO/Vb4+1T5hZFqw2HUZFMN6yeZDk33ywzDC6v1p7LSTg?=
 =?us-ascii?Q?n1WAJ1bGquOV+nJ6Qvlm6ijsa2A3vBteC/GeX4x+veWODn+0sETuObVnfeDx?=
 =?us-ascii?Q?K2NMqWSHrEFSQsTECQ9U0pQD04NjlCFP02LQAFrTwli8HUUWhyPaBhPldhbR?=
 =?us-ascii?Q?ecWjUM3dAahjTfveF6sRnbLS3jcq01QzNIGJxZgf8x/sgLFHUIv3pe8rvUeg?=
 =?us-ascii?Q?eT+W4ke7ZRJzLRIUaHS6jNkwbYgli3qU+wS0Dg4UOko+xCLBo3INCbauFaKi?=
 =?us-ascii?Q?HWb+499IVTUTQNS53DBTIAiepIE/dAaQz8/EYZ/i3POje0YnYeXP8oDgh3V3?=
 =?us-ascii?Q?B8W1NGfcX4wXgMYw5BzWzRdWGgB783Qc0v6yCsZXB9DiyLcrdYg6bAcqWWQx?=
 =?us-ascii?Q?l6C6z2Gx7szTuWOdAvw/alnepcFyBlTacRxrIBLw7nE11+RBypCUscO4vf1a?=
 =?us-ascii?Q?Re5synGQ0dqXKU0ltwoC4TD4OfKh96GMe6uafftdYZne9OjbOKR7XgBVQ2dW?=
 =?us-ascii?Q?vYEkKvPDVGzXLYOkZ9WFqr4hzfp/07WdlJKZ55EreoJIIQC4AMxaxDjE/Vab?=
 =?us-ascii?Q?JSy06IFuB+byG/suG89HDNVcmDhUEoox+zfXJF6rBFiXeAVeLQ4X6y9UbH5j?=
 =?us-ascii?Q?QdLKH4Y9h9achq+EG2XReBhG43yXEnsV5Dd6Z02Drck6vAWSgfBouCyWOknd?=
 =?us-ascii?Q?SVmHzvwuuLrTaNH833nF21ktQ+753OLxJNcR5Ogn3NFswMihmL8VzyQUh62O?=
 =?us-ascii?Q?dJeaC06U4s36JOhxNIvdQ/AyIhEz4XVRUkhzlbKIYqvI1Bri8f5jMIteUyCf?=
 =?us-ascii?Q?dOIEsWdSVENLNgFcvCLPqkA7figwnuwJVtxyPZn3PmtUb15vxe/eSl0TwP3J?=
 =?us-ascii?Q?f6Fw15CA2Q6YdfB82c5en+1FLrzpd8bjCVhKJq+860hg8P68mNQ0H4vhpP/p?=
 =?us-ascii?Q?8hL0CxLLwF6fhWjmtTp8FknD+AUOb/9Gg97hrluimcA7qSoRhAq2f+HfyZG6?=
 =?us-ascii?Q?sjoJhODg6LL5k2rCp+xbUckBoPCX8Hn3fHYvpdtIhu4OEWhMydoLhJ4UG8Ay?=
 =?us-ascii?Q?/AwwLgYS1Lte3ewP4B+4N2Kr3lfUm7a8DlsI7/vr+mIvjxUjfhJdeknG3Q44?=
 =?us-ascii?Q?j7YRTIvtAlSrrg4lkWw5evIDjwh2sSOrnb41PG9pWCGSQUtg9s912p/7uDP9?=
 =?us-ascii?Q?SBqv+mLEj86VtkWBxHqObl4/cEx6IguEa2gQW5pD+DlUUzlrCuHlO3Jmyz/n?=
 =?us-ascii?Q?Lyq6+a5gJ2o51KmU19oMev8P4bHdTD1+I8/jPe9ywiEuj2sqhHlfTCcJJV4L?=
 =?us-ascii?Q?TY+HGExmF20P+VmRqXI51XXn9Emc5DmhEUrTAB8xvJMRYdFC1J2T158z3H7d?=
 =?us-ascii?Q?3lqRyTV0ON4AkOxMoncVO6MRjWxLap0Hhs696ce3sIRZ9NrEqbOQwvLFl1mK?=
 =?us-ascii?Q?cZP+kwSpWq9ZGxPNcgQGYYFVOLTSYARD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zt3zGpV3SwXVh5nQGMSJRac0fZPfVBJtcerKlq6EdkZ+ZmeokIXb8OyqTTzp?=
 =?us-ascii?Q?VrnuyAwGVabugGkTKEMuEGgyuAcK3WGXKlRhKfzJJItv7XRXb2qWM5/QpY+z?=
 =?us-ascii?Q?IYwuKxgQU6ycSRqmkK0d/g2bb+uWKPZwEbmZbinni0gJohrl1l6CsrTPYesi?=
 =?us-ascii?Q?AZMYqIWAWu5VFLk6n+OaJfve/HU03KPC70huTK2UW/g3qGt924lZ191A32tJ?=
 =?us-ascii?Q?oGw+BpZ0ZVT9Q+iqzHpdoRHfiW5YuJI8OOVNnr29414mQeKXRkn6PWPNF39/?=
 =?us-ascii?Q?tafgIG8NKKu5pEW8ozI4kCRHry3O63MgRlpHjz3sHROCYhUeuSyHRjh2sdF9?=
 =?us-ascii?Q?8xCTyPUteEff6PE1i6azw84SJmQl41hlebgkrM4/f334VrZhGExCucSn/CdA?=
 =?us-ascii?Q?pv36qwksNUxa2Xz3pfJNPjhpshpDg3C7w90kXkO86WxyWo1pY1MjZ80mU1JZ?=
 =?us-ascii?Q?xMW7xkCmbKoLOlFlH4kK50qiydH8LO8l0aT4Z4tuL8uSkcs42rADECgCZBu8?=
 =?us-ascii?Q?/XQuBzYtUYD3fgCcpDJB/g4YNy0RNEOYUOtRicSAnv7jdpKLPmZvRv1QJDXI?=
 =?us-ascii?Q?k3L1XUtBLBCqQhY4Zz5iOxwPW/Gq+CF2C8lIprLm0Kdqa4jbkfg7Q9L6aw/y?=
 =?us-ascii?Q?jN95IjxAxXwqUfoxQYTIcaldjO8jzJe+8uhpKrq0L7pcSEBl/mi0s6CmnV+R?=
 =?us-ascii?Q?ncjinIwiKyaQZqIh5Dqd9SsvjiGnb0L49/L8iz4FVM3O6XfxkwWJkgjBKziP?=
 =?us-ascii?Q?6Bc/45tfywumtbvSeuE/94dzhSZA0N6E0NPDainFRP8GkKsbRjqFC4/MDR8a?=
 =?us-ascii?Q?hrh8FeE6h/k+jr366wfboEB99SuiT4/Wy6jAixGoO4sVIqrHT0IZVy8jDcUB?=
 =?us-ascii?Q?ncUKRZJRdbRUlRvaPDoTB8+RO1vjbw5m6DlNgJSM3qXn25bRTI8PFDb1hZnb?=
 =?us-ascii?Q?Pw94zNpsNyJyUH9IzxmneLHHexRQcRBxjCtlFRR32KrE9raiCh/HLJKrblsw?=
 =?us-ascii?Q?kN15Jk8nPOSwZqksBHSDReQKX9lE+3/3RbtJbY/Ex0I0OKDb3eOjOJYDUM34?=
 =?us-ascii?Q?1j7EcBLMV+OD+DFW8bzpAoMpDamlEY4qainioh4+A1sJJqQQZJhCLgyxSHk7?=
 =?us-ascii?Q?sn0ZGiqTt7JDyYDnzuKgJD/ErugQTzVLulg/JvyES1qCNVU/k/JT4zw1v0rw?=
 =?us-ascii?Q?iOqCbc/2XThTo4JS3HTKl1fQZxElanXgKRpLKb0MVvzAF8uBcVdiWKBVr8bo?=
 =?us-ascii?Q?6MKgUqGFTXpG7ij6GxQy2j074SHTFjdNGx/xuU0OOVQOanmvfE4jVb5sECDI?=
 =?us-ascii?Q?sDQ6ydw/pcQZgjpBw/PqGtFxZjthM6lsOUyR//ds5R7xAcTal/rqjit5aMkg?=
 =?us-ascii?Q?ttJoiUkLN2mfe3gLkKGyIWSmQrSEOHGbBkUWLHnEDK420Ac+RG7f7Ll9WQ2d?=
 =?us-ascii?Q?blizvowzzJCez0p1UqaWegtb/hXeHGXgD0GC6TfINMascN4MvHrETGxmNkBD?=
 =?us-ascii?Q?E8qH+DExvGV41a/WjP0x0nFxHIR/CjPgqO4rDZKW2q1asje7Oymvm3YVroYx?=
 =?us-ascii?Q?fioNUA83iHkMiH4WuThxUj1J/Ie4zqRRIrkyvflOUll0sfv85/4r1qZ/DLjR?=
 =?us-ascii?Q?gjo+x1XBCB6Yy4h9E8iqa/5/L5LptveK1p9PPDUH1Z7j?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67dda33a-d5e8-411f-8399-08dd35fca18b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 07:08:51.4664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0STot2jM4/Skk+XKJCZAXYLvoPS6hvsCUe2eTwcXI34LrRUhF2g5Y648mIclH5EYiXulydOAZa30rbUXIjkGYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6156
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

> On Fri, Jan 10, 2025 at 01:15:35AM +0530, Arun R Murthy wrote:
> > Histogram added as part of i915/display driver. Adding the same for xe
> > as well.
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>=20
> Is building of the Xe driver broken between the previous commit and this =
one?
> In such a case, it needs to be squashed into the previous commit.
>=20
No!
New file for histogram is added and compilation of this file for Xe builds =
is
added in this patch. In the previous patch it was done for i915 builds.

Thanks and Regards,
Arun R Murthy
--------------------=20
