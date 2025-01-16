Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F32CA13AF9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 14:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE82B10E975;
	Thu, 16 Jan 2025 13:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZgQgnCy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CD610E96B;
 Thu, 16 Jan 2025 13:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737034468; x=1768570468;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LYlMVHPB8eJsfaV0mlttM3ZYVEMH8iapvmVN9EFJTv4=;
 b=BZgQgnCy26nmvkVAR5I+BFeGdePcU2TnAAez0dBoUsqt3067Kmjhx193
 K6wzXDqJoSD2gGP8iPsOI+fcrzX1MwW+eFBW5YeHT5XDHP76NduY6OGlw
 2V37aCzsF8Xr0ff+vOxgfR2E6lvgXxHLNF6rbaCeaoge+iom0DznMrefW
 5XGFF53CoHmipkPX15ytwxwvDscXZjOono4LQVNAGE3Wyy4xhqCuq/FxY
 inGz2e6w76itgJy/i28F7psoiay6u2gRsdgtV0V7o5HB15lKH1Nt+Gk6v
 bYy9gtxoD0bTE0C8E679oxWSo2qxX4jkLjt7+6y7xA8IZ9E46PyWMTSwH Q==;
X-CSE-ConnectionGUID: BdzbvXRaRlmxT6lirzuDOQ==
X-CSE-MsgGUID: K2D9oRL6TqCsnEGo5JIufA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="47911232"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="47911232"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 05:34:28 -0800
X-CSE-ConnectionGUID: BqCc3L4ETCmckpTVc52PSw==
X-CSE-MsgGUID: gfWUw2UJTDmnV581oaYWbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="110473301"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 05:34:27 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 05:34:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 05:34:26 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 05:34:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWOxGmg3TfqCRnI5zRoLYF0znQGq2ShY4xdcQCU9xtf1OrTI37f8pKIGjmQ2jEKK8DWoS5HslTXqtd7Lr8+iVEEiwDh0ydU4EQuz54jmngaQDsPSJ2nd6nh8d2oM0SCG5a+AWHEosPX/keBKau2/GuOiE8ir9r2b2mWuXLC2o3KIx6WsPOnpWBHmKYg1wPKSEEQrhdK0QWvp7wECxVKnig99B2NEVbJqMrSIXej9IVadutAzYUnwcaVZcMwIeZrtYOHbnHKlPhHGKPY9RLhqpNkuwn89UCsys6Ekees8Dn5s+7vLplYrM30M5y9hynx4JtW4v0Yug2dn0/wXsrc6Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giLCsUsJ+Q2ek4lSy3kuIJ6cy5E8Ey0wnt7KVAJIRCY=;
 b=FaQwrgICESkNXpgMAuu8F7BbpgctmlIYfKO959ZJ9sWDQ/wqQnf32MoWReYySk4Gd4VUKXmjQ9eUN5i8YYMcp4YULhBmKUDU8m7qJ1ltX8tpMj6gEfpZlPCr+7+hrDNqK0vNzAhpxZLMX8rwIHBv/y7QXoca//k+gsliKvzNpz+5S9+9Ge2SAlVFHIfs3MHFoBXn6HwKl86wONg8uWQtCqlCyVyBEOQkB5spD5q3aa6cy7q/aqCOF+V3e6u3QcQ2qpfJG0O+Vsyvpv2gbGdKsC7fPTZAvFhiFKecpS9xbH+dAmRVlt/XHuQkg69bb7HB3V3S7pH1UMrz5p7krbxsHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM4PR11MB7182.namprd11.prod.outlook.com (2603:10b6:8:112::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 13:33:44 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 13:33:43 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "Bhattacharjee, Susanta" <susanta.bhattacharjee@intel.com>
Subject: RE: [PATCH v7 01/14] drm: Define histogram structures exposed to user
Thread-Topic: [PATCH v7 01/14] drm: Define histogram structures exposed to user
Thread-Index: AQHbYtFCB5lsX7WJdUO11PRG7LBZALMYRh8AgACXd6CAADEQgIAAGP2AgABDagCAAADIMA==
Date: Thu, 16 Jan 2025 13:33:43 +0000
Message-ID: <IA0PR11MB73076D2B950535216961E209BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-1-605cb0271162@intel.com>
 <kwklrd2zjovabsa537jwg3bpqilvhfmxxyr4exmqbi2b35uxej@mhequ6ttibsd>
 <IA0PR11MB73079537444DAA9596F0A837BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CAA8EJpojDKtcG=amuwT7B+iaU_A9EwcvpkyyQ8nupKtsF_79gg@mail.gmail.com>
 <IA0PR11MB73070AE8FD9EAF5E47A56A96BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <yyn35zkvqfajyyata2kuwfswfzjf3oqv4hzq5pc5rw7o2sporu@vsybecmh54ow>
In-Reply-To: <yyn35zkvqfajyyata2kuwfswfzjf3oqv4hzq5pc5rw7o2sporu@vsybecmh54ow>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DM4PR11MB7182:EE_
x-ms-office365-filtering-correlation-id: eae220a6-0a40-4326-8d6b-08dd363265ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mJY/6hJUHz03RGMhbb/CgkWEpP+yWFW+Nk+cIlEtoORHxcuak6hetSjZcY7O?=
 =?us-ascii?Q?WMMfHMilC7xjUR7j0T7i9S0ElNcLpvIDPbh+7TbWscHs/mtCo1CWZW5Dgxn0?=
 =?us-ascii?Q?YH5cjCPUIwqUYbav7VSL1N/OvOm2w1m10SRTzxSUd3epQl0FIDybZ8jsP/mm?=
 =?us-ascii?Q?h5QQaPYv2eNmUuMDlhyaIrGqvHrRtXOqhpBw0U2smiDYxqg0WR3g6DyP92Hr?=
 =?us-ascii?Q?kjVxMgLyzAu0RcbvzrDQFwePPEIJJubCNSorFKHD6rBDGDTG7RcTbav+NHXZ?=
 =?us-ascii?Q?+gnZM2zJk7rutSNm3pjPETNCuZCKJJMYutvnHy1th06/M8ceHRFG5+y0MnJe?=
 =?us-ascii?Q?p4VrKChhv98INGs/aWSNV9IsMq99kzrhMuxiCwil+JrBywg9Y1laF55w3KDn?=
 =?us-ascii?Q?eea/KBSNnXoHtA5/PQ8ltmUqKLTVI1k65T3crKG6xF0OHkhTw5Uq0Syk3qdX?=
 =?us-ascii?Q?0y3kYP2xEaHQrWxHGzMgpYjM85Uwqnz1sifD1iqnhvx6cORqhSj/7HbTqWL6?=
 =?us-ascii?Q?RAp1BlGEnHHc7+5g5NXg4gmZ7Blclea/LIrs0ROBdowEHULJAaNZYu5xBJxv?=
 =?us-ascii?Q?G1xBmA0kMU/CUv6eZfEfcFO6X4gKQYmE0h02JPqKz2zm6iK0hZ65XaIOhwE7?=
 =?us-ascii?Q?uP08xjfgDir3C+hTYZWAXjmVWyLejrbnekIbfQm2VfhhtufCgDkcmhRFBOIn?=
 =?us-ascii?Q?VOirVSbjjq0we3FZE8SRvX/qzoiafLoih5Q3Yt2Shg6RwlPqgSsXdSPL+jtK?=
 =?us-ascii?Q?qG4PVQOi9T9svydhcQjUcKzwLVCt99QQlTwkthqI3LuKb0E/rC5YHh0goOEK?=
 =?us-ascii?Q?SfcZdQw4LcGwpxupKsZVzMYnriXQ9+VOfRmiN4D4BQBwIfYEFR8dhKQDbgDA?=
 =?us-ascii?Q?uTal1oLKfzwQ7eIHgkINfh0dOZS/skSWYeagtfVJRR/7+mTjLhJpFXDppYio?=
 =?us-ascii?Q?JSEA8skeMX/lu7eT5jLHq8tGduCJITKF5lJe4rBfRbvPbBpcE3q1l/HtOPFK?=
 =?us-ascii?Q?u46tM8BCSCjHtb9EAN0ZY9FTnSv2WdyFvSsYBYB5bPu47cLBjMizGcQNdR/4?=
 =?us-ascii?Q?3lUHOwGGEeLDWFcSR4TrbsT/UShFr2ZoM6C1Ei2KwlhGHCSIRPiVubg/tCJp?=
 =?us-ascii?Q?9iiSrN2eV52Vke/rjMrgnhVk1wY8JTjLGVzdO5uY1Q4YRyOyonJmmEh4pu2z?=
 =?us-ascii?Q?MQU+j/4/R49SKCIEUyqM/+Iy68GfofoXN+Cjq5tfVM10QGcfNZjVRD6Sqh8V?=
 =?us-ascii?Q?xsGA8xYtCf4GPyVksBQMh3nqWWTyOui6OOjkQYQkh94HBzDhggaP+DhwQB+a?=
 =?us-ascii?Q?+pxWeI0DxrfPwIqGpJIRDP57qQ58+ldb6V1IYGhFIqUhnBzpTAwiLAbfZ9w7?=
 =?us-ascii?Q?Vo/HpcWtnHQq3NukdMoALx8/pyOvNVvnDAVu/oBobirwAuGVV3PH79V/Ei0C?=
 =?us-ascii?Q?TbIUddFAbFkqPRqNfTaXiyAs0kq2QT3M?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G1fsphdo6T7qw+O+Pb8eFVuc9wyyI0eqFlE7Apa/en484BHYmwiniZUA27WH?=
 =?us-ascii?Q?KdHfcDqK8Y1Nepz8fMScwtNFp0D3xhxn4ATqX5o1q3oLc5Yo0yGRMiKBrzsR?=
 =?us-ascii?Q?Gw/gU08aROnOJMmDZzbp9X4bRIDbtWIEExEPv4a8Gv2rx3TFPCUtIwyC4nx0?=
 =?us-ascii?Q?ME2pdGxKYWQwkAc3ua3R6dOfNqPLNiyNezLoGoI18W0lVyLYL/QDAizCJtOR?=
 =?us-ascii?Q?hcxrDY7Tdh50J08CyqFX8qOLKbxtH7pYs2V76vYRzCnXFIlVkzMg/b0rc5Iw?=
 =?us-ascii?Q?Cr9haC6NAb0aJCePFnkcvDbgd4bcxHKIE0iFxLTzKnpD5eASYurgn+cLPtfj?=
 =?us-ascii?Q?nOd7QejJkdog4sPZMoZzpu1tRCIbrBAZz/KUE+eLEU7wX9ZKKourK93M5+yy?=
 =?us-ascii?Q?dDMIvPufm4k+qMNVyRv7LcdmQ/i049xkLN+crPaRr7wuJXOuPKDboTjf1mED?=
 =?us-ascii?Q?RuMcrivr81vsn3jEGWttIRupB+7EKjglKBZL9jfDNqhL8KlrHVLcziQeIbo3?=
 =?us-ascii?Q?Mpe5cL8yrQOmuyfo/e0fAZdoFMYTdhxVYFt3SpTFGuoOPjktR9wpCjoY1oyI?=
 =?us-ascii?Q?CZNza9z1PcxoqQPSwLaPFfc9NKLgVotSqy4Fj4bJ9b7PyhFtLXL65BXBussw?=
 =?us-ascii?Q?U4cKNEKNxlQrl/T8VrL7ypI2ZWv8Suxx7FfHPFIkDfsrr9R566LuHJqRDQhm?=
 =?us-ascii?Q?vDfmTIM2yTSXenOmxGJqvI+F+Q2JIm46paOKgV+GtaEiHJ2dmpXSwSnjoicE?=
 =?us-ascii?Q?HT6vmceQFek178fNgjNGadhlldj+JjN2VI1F7mw0giqLqHt3ZOul1n5fwzGv?=
 =?us-ascii?Q?prR7Em82pFdbRBmBD4lA9B7/eVPw2luAm0BhIWW5ytVv4FUnDAXPG/YVSvhX?=
 =?us-ascii?Q?5OuSguxNhPTrxLxnulKyUyHDYA1h1atr0j3s8TjOqV13L25fwIS5vkHQ0SPO?=
 =?us-ascii?Q?5QmeFTDJuqmK/OCo7DsqX11I8G1QLqacApvrcYzhelDr9VXGE55Ssp/E61VF?=
 =?us-ascii?Q?0ID1S7vy1bZ3Z/1fOa5GCiYBD3Jk5Ujqu5d5oPdmJBSHgaw5x1AGNWGBj+vV?=
 =?us-ascii?Q?L1MXhOOC0P5RG7hehbKIwGjBzLzC/9wLdgFm+b5TelFn5cUIgrvkXMQ9UIBv?=
 =?us-ascii?Q?Btq5cAvBEU21tlU2fbc+qt3X4+QWZhSmQ/9rK+FmT+Jwff3QDyCw7tblAnQH?=
 =?us-ascii?Q?d3szGO/byxvevcHs8HgkCUt8CTzfTvXiDvf0jmZs+RelwJ8RbbICo2CSYuUG?=
 =?us-ascii?Q?JhF6WODEL5hQQmIZC5YSLiuBnxsumrmEyI8H9BpNk6Xip7uyNUKsYQUIldBr?=
 =?us-ascii?Q?TqGs4gzw3nSNwfX++A3wSr3YeGl/fyFZxrf9cX6ZO90uFQA3a3Z7jeJm6kW9?=
 =?us-ascii?Q?od9DrotC87MMSPzm0Zr5r0IrYzxn9oHszAdgPEtu8OCkqKDsK70si5YnUDb2?=
 =?us-ascii?Q?KdaWkKvHKCyYT77Dg2KjZql4axdPVjgl1tDMCHT6K0jUG4toJWOkPfvw5ygJ?=
 =?us-ascii?Q?Zy2pUrGs79PtlvrMr0YeUwetn/tnFfidVq26wRxkkQLt+49KkSZnyVRK5059?=
 =?us-ascii?Q?GFRGo21TJR5xDEfQ1ApEnhqu4YtDtZoVXQR8DhUdcn+8PafvS5vUto/n79WJ?=
 =?us-ascii?Q?dL79/AzFMaVB/1EupitSHWDltCb534JLTf0k1qbgPYl/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eae220a6-0a40-4326-8d6b-08dd363265ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 13:33:43.8911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dRuQCQMEMNTTN5dGCkD4kFJW5sm0AQVVvYC8Ii4uIjBGwMDUl+TNNmAGjCElNUUKrWsFzdzvkc/6jwGn4lYmzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7182
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

> On Thu, Jan 16, 2025 at 12:33:20PM +0000, Murthy, Arun R wrote:
> > > > > On Fri, Jan 10, 2025 at 01:15:29AM +0530, Arun R Murthy wrote:
> > > > > > Display Histogram is an array of bins and can be generated in
> > > > > > many ways referred to as modes.
> > > > > > Ex: HSV max(RGB), Wighted RGB etc.
> > > > > >
> > > > > > Understanding the histogram data format(Ex: HSV max(RGB))
> > > > > > Histogram is just the pixel count.
> > > > > > For a maximum resolution of 10k (10240 x 4320 =3D 44236800)
> > > > > > 25 bits should be sufficient to represent this along with a
> > > > > > buffer of
> > > > > > 7 bits(future use) u32 is being considered.
> > > > > > max(RGB) can be 255 i.e 0xFF 8 bit, considering the most
> > > > > > significant 5 bits, hence 32 bins.
> > > > > > Below mentioned algorithm illustrates the histogram generation
> > > > > > in hardware.
> > > > > >
> > > > > > hist[32] =3D {0};
> > > > > > for (i =3D 0; i < resolution; i++) {
> > > > > >     bin =3D max(RGB[i]);
> > > > > >     bin =3D bin >> 3; /* consider the most significant bits */
> > > > > >     hist[bin]++;
> > > > > > }
> > > > > > If the entire image is Red color then max(255,0,0) is 255 so
> > > > > > the pixel count of each pixels will be placed in the last bin.
> > > > > > Hence except hist[31] all other bins will have a value zero.
> > > > > > Generated histogram in this case would be hist[32] =3D
> > > > > > {0,0,....44236800}
> > > > > >
> > > > > > Description of the structures, properties defined are
> > > > > > documented in the header file include/uapi/drm/drm_mode.h
> > > > > >
> > > > > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > > > > ---
> > > > > >  include/uapi/drm/drm_mode.h | 59
> > > > > > +++++++++++++++++++++++++++++++++++++++++++++
> > > > > >  1 file changed, 59 insertions(+)
> > > > > >
> > > > > > diff --git a/include/uapi/drm/drm_mode.h
> > > > > > b/include/uapi/drm/drm_mode.h index
> > > > > >
> > > > >
> > >
> c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..7a7039381142bb5dba269bda
> > > > > ec42
> > > > > > c18be34e2d05 100644
> > > > > > --- a/include/uapi/drm/drm_mode.h
> > > > > > +++ b/include/uapi/drm/drm_mode.h
> > > > > > @@ -1355,6 +1355,65 @@ struct drm_mode_closefb {
> > > > > >     __u32 pad;
> > > > > >  };
> > > > > >
> > > > > > +/*
> > > > > > + * Maximum resolution at present 10k, 10240x4320 =3D 44236800
> > > > > > + * can be denoted in 25bits. With an additional 7 bits in
> > > > > > +buffer each bin
> > > > > > + * can be a u32 value.
> > > > > > + * Maximum value of max(RGB) is 255, so max 255 bins.
> > > > >
> > > > > HDR planes have higher max value for a component.
> > > > > Likewise even in an RGB24 case there are 256 possible values.
> > > > > It's not clear why
> > > > > 0 gets excluded.
> > > > >
> > > > This applies to only SDR and excludes HDR.
> > >
> > > Why?
> > >
> > We are limiting to only SDR. HDR includes a broad range of color and
> > finer details, which essentially means its an enhanced image.
> > We are trying to enhance the image quality of SDR with the support of
> histogram.
>=20
> You are defining generic API. It might be broader than your existing usec=
ase.
> Please consider supporting HDR too.
>=20
HDR image enhancement is very much complex including multiple stages such a=
s image tone mapping and image denoising.
Here for SDR planes, image enhancement is done by playing around the contra=
st and color.
Maybe at this stage we can focus on SDR and can take this HDR at the next s=
tage.

Thanks and Regards,
Arun R Murthy
--------------------=20
