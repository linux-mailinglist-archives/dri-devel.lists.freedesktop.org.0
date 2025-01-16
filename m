Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9B2A13392
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0511110E8B4;
	Thu, 16 Jan 2025 07:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VmbshPO+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EA910E149;
 Thu, 16 Jan 2025 07:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737011327; x=1768547327;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=do+APYHMY/aFm80EtSKXNJP6xCYPgv/b7P1sPXKBMnA=;
 b=VmbshPO+jhcsq3NKJ+Iv+wSrI42157RNYFNQ7euyZi6qZMJMFF/LbH8l
 Iybq++BEt/8nvPi3VjoqhsySq8tEUWTKoKzvrGVsNDEvIys2ww95x6Try
 pJbd3vzJJvCveNjtJKI3DaUXE8oKDBoTTK06cuNs8zeNrwNCTT8rvAitR
 gi3pLdgACAETDdcvHufrsAbH3/5CxUTZw0PYYvoirY1YRSWoB1LJRyRAJ
 9ib936BxKUvt74kgb2/Qy6TRNMWC2tmYOr89wZO4c+A5fhIbsK9w9wu+Y
 tkfg0gicV6aoNMHfFCDxHTHNLi1c/TliAWOfsFWtRrS2YLtpaAdGA924B Q==;
X-CSE-ConnectionGUID: MXWtV/rcQsOnA+tQ0LZs9A==
X-CSE-MsgGUID: jXdLj97vRXun0xSnkb1iGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="40193842"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="40193842"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 23:08:46 -0800
X-CSE-ConnectionGUID: 3sQ3O8jISSGyHHvF8uUr3g==
X-CSE-MsgGUID: zKjkuxyUSUiMQ+trFHB+vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110026632"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 23:08:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 23:08:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 23:08:45 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 23:08:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8B56aiGMadIz9xFugbGSGxVw2tU7roYUrrIE0Y6ZiKL21pRnUtO8MfnqcgIw9ok/HTBC6yDRYU9t+f0ld2jv3SIjWbEFCtI46Ue8+gcY7/p5QXmFiGSwZvdgf0pkUTXEQyg/YX6MHCQvfHz2FO+gbvvuhDF6/hRAXqXSEnIvDwtTBpjmOQXOizKK8i8tYdFztd5jGiizkMhwFNW2D2H2aqxJTygdgxud+EADYcf7B+tuGWo01S2+6nuRhJpUVsPmVMnDytxN/PlcpMC05Mh0+hgSnQsVlmhrvJ2KhezBWmrLR+2pfsjR2oka6sdlg8aKLn0XwQrxiTUrp4/V8UFbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1Em360RCvxGW45ethUOSrqdnfyq2DqZKbzy4L6xLM4=;
 b=pZ+UqYRlJhpk82uNtM9i7GvUcZ/vZfCmoUp9735brC5OGXuCLYB1rA1Mmke8WBl//seGFG9twkIi05MmfHa5sUqylyi+lPcr+L3L7c1jQjv0KwFHXtMLPiWCtV4MWFb4AvRKounzIgzVsgCJH48j6n70e8RhEM5hLFjk1syvDfhRc/6TKVg/HUoXuSDwDWpXDrCxL9xyGgCfMe9hbg4U9vD+P25VHcsL0My2CtxEl/2E3bi0fO6SjxYBqQ0fkpxy9k+VQ5NZOU7WdjJvFhsmQx05bgqNPc1OEuK08HhMT+Gb0wB5Y+66+/UoJMU1lNSeDbMjvz8Gn8x2TeRL9931Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 07:08:43 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 07:08:42 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "Bhattacharjee, Susanta" <susanta.bhattacharjee@intel.com>
Subject: RE: [PATCH v7 01/14] drm: Define histogram structures exposed to user
Thread-Topic: [PATCH v7 01/14] drm: Define histogram structures exposed to user
Thread-Index: AQHbYtFCB5lsX7WJdUO11PRG7LBZALMYRh8AgACXd6A=
Date: Thu, 16 Jan 2025 07:08:42 +0000
Message-ID: <IA0PR11MB73079537444DAA9596F0A837BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-1-605cb0271162@intel.com>
 <kwklrd2zjovabsa537jwg3bpqilvhfmxxyr4exmqbi2b35uxej@mhequ6ttibsd>
In-Reply-To: <kwklrd2zjovabsa537jwg3bpqilvhfmxxyr4exmqbi2b35uxej@mhequ6ttibsd>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ1PR11MB6156:EE_
x-ms-office365-filtering-correlation-id: c76821a0-7960-476c-4857-08dd35fc9c16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mAQ/CFTBHoeyyyEQXsO6hiEMMvQaHSf1wa8r63KhUFqnfLF55QRmT7sLZTOI?=
 =?us-ascii?Q?ycp5UgbKe3OsGY0h+40m1vi6veeY6HK00GUXPuNhoUQhvQaF11atJVz1979O?=
 =?us-ascii?Q?YXn/ynMGcm7laylNRRI4ZRC31PI90zIpI+wzWHelAK7uz8jeaUkQcZcI7M10?=
 =?us-ascii?Q?u1h3Zevagm46BdCSBwkor+qGhWxVZWYlYZ8VMsZYO+IJv57zbFDw9I/reLTi?=
 =?us-ascii?Q?y1eQ/NXiRtZcBoP4hBmEX8t/3gnjjZnauKJiN8V1QN9hHB4IZZ4bz8hX9uXY?=
 =?us-ascii?Q?Ff/Wj7w86vHVYFUGK+WpC3i8fFQ8NUtVgamXoZZc59Vjl2gikAJjZn9tBn+A?=
 =?us-ascii?Q?r4kEK1mLniJgs4zxdvn5EziHwkLfZrfmHqJats1qiPECJ97YDYyaMqaqEUIA?=
 =?us-ascii?Q?mZqIaUDssiuBqJYWoZprhZYHAGeshEbbNKd/a61tGGiHgmpdiCXSRr/RtpzH?=
 =?us-ascii?Q?5sHrgbH0CfdoTXCg7BXFlUEpDnzHbwC4V+GWmR58go5g2HAp6dhWINrcLBmU?=
 =?us-ascii?Q?g42Xk36HaF3+Bh4pv/YTCd6ck6l3a9WF2IaoC00cCyKcYPQzRmpAEXy40cTr?=
 =?us-ascii?Q?ruhi/rM0Aq8mXRzOo2+chJLARxqhu+E5bGSX+A8ZTKF05anmoFKbwVax4brf?=
 =?us-ascii?Q?VLxiLiTZENTX6GGhHWmrEXlJtjyp0gRqk7IFhs0+UJSRPwJhIUowTQpFeEHz?=
 =?us-ascii?Q?VkF4GnYVTrqS6DXcfMNE2HUmxMVR4Lr383kz3kxU51yYXVPsyVuDaD3EnMQ5?=
 =?us-ascii?Q?723cFB9wjmt0QjXeWO5Dfk3Wuhf7H3Lgsw/vxUS4Er2DjdHQFFdbgstYj3kZ?=
 =?us-ascii?Q?n4n3CQQIyszFyf88WJQRYmNr25LdNYAmPcHI4Taixf4OLCLh4bOiT5OpJ7+P?=
 =?us-ascii?Q?NBg5cF4Zfg0dcwgALhT3lVsrV+QcMGynCyNv62HEoa76sEsMo72NgU0Ac6jA?=
 =?us-ascii?Q?5xx6zXgTli5FWDrsinID09e2TkA+4HL8Jtse2PGa4arD86i/XF+Y9bEeGPMw?=
 =?us-ascii?Q?eejAl+x0lh2M8sK0ZGu/4sIvgbgGHn+IXcaGZy8myqTZ2hQVWa02yMBNBxnh?=
 =?us-ascii?Q?/OJSbrPyK/ezFa1Hz2a2uWfw3hu5qeDcoG4VWqSCqwFpvvay4F0Eq8MiUp1B?=
 =?us-ascii?Q?5IYNvAeDquOZeDoi189kLGl9yCx5VtJ6sodFMiKjmpRdtuApT6kJsbcQJTwz?=
 =?us-ascii?Q?OFHfIaivfZLcXvcek1T6vIPP0Y/pixtv6UkdAJFG0W9eCNjaPFjdzkFZbsDU?=
 =?us-ascii?Q?PFfU5vltLuwRYqKGPuuAS2Rk3pGQEbcdeq37EdlAK3vDgv40+FKypvqoYxfN?=
 =?us-ascii?Q?QN9+hj4KE1ehru2iQosKvQ2G+KCp0/E/4f5cK9qUzSvHcEwsrhjMWmNTSau/?=
 =?us-ascii?Q?BENjD1HYosDdtqvLQndReOY6rXrjMBQdLZ9qBUflCqcZeagNfCltcjqF5L2w?=
 =?us-ascii?Q?ZbXF5GMSUXhnTj7+kP930m5CeZRbEq99?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qzICAg+Enh0b30EmQlvuM7Y7Pdc2lw96CZifASnzJwY35zXTHMLbdPXemnlA?=
 =?us-ascii?Q?iB9bjqQIiR0qG0r1iegT4/hW1Gc2hQX518E+uJUzBbLV0iAA/choktp3WQ5y?=
 =?us-ascii?Q?FtlnuhBNdfnmd50k8A1SkiGx1Y/O/YYIjvuHDzr84PS1ajiBZXFDuys0rYBd?=
 =?us-ascii?Q?U/qwC08wA74QQzlBHbJCzVTxTDUYWGRfyf/+POh+svkur95MnCfpIOcUzo7/?=
 =?us-ascii?Q?BAs73dUf8bfpXnHq/46kwdopXbWCbtEH3u40Np8an3q+Slw0SyPqh0vh0jM7?=
 =?us-ascii?Q?QGKRpPxvwFHyZN2m/bjjkeQtyX8kYa7RbzdZKP2SbgbqdUUZCAJ3q5LJbcJg?=
 =?us-ascii?Q?xIDxlmqRQx8u05c269+hcfjyz8Q/fdNwJNnUrDZe4RDo41OSJTJCA5bNnPXT?=
 =?us-ascii?Q?MCRHVh1paRBMx50CSPC9TrE5Do4Mx11TH9+Kwn2mkw3iA2z2SrmGksg7GALt?=
 =?us-ascii?Q?nTBKtj49CnOdFeJaNTFwjjGsSIWM32JnU02/v9bsdxQpQCpc/wZMQekD7P94?=
 =?us-ascii?Q?EEsyZtIo5IoYOAKJy8HBpnGdzA61jIlG1JA8GGiCrpv7QsLNcQLpHPTMnqFH?=
 =?us-ascii?Q?pX+P3sR+xJPoXi+UI1Zl2Hrq+m5udvTswazKFMh6cVToweNNDoT0BQVH6JfL?=
 =?us-ascii?Q?ISQxlBEsKm29Fbn/C5Gx7O3adifXsVjxUpMoBZnw0AGQB8lry+sWfreJbjsd?=
 =?us-ascii?Q?fPEl36lN3z3h717Hoz9LJKBTHN6rNv0VRHtLzKDswthG8f00IGz/J+F3NqQ6?=
 =?us-ascii?Q?+FMT01fcl6eKvxhu9I8DglpOYWjcs5bLzwWfIwhKdkR0vAK4ok0YfPGClJmw?=
 =?us-ascii?Q?abmhtyqt42sA4Qisxk+/zRb3NVnJYNQBmHntoi3I3Due8QE8YEJ/Lxttqbzu?=
 =?us-ascii?Q?oQICE0Ifjd6+gjdO6vCNTssPUQBZRNZGdM778W/yae6pjJ9FA0CEVEoEC/fP?=
 =?us-ascii?Q?wwj+9m4tJzgu7M/qzZ/5F+JbLKdeUqWzu8THeoPzxZd4TXgSINbQSDA2e1Vi?=
 =?us-ascii?Q?pBe8NH5g/rZOxqv9YFck9WzkIGIgFlpWwVzu+yCyyZ+aFz5U5m3kD8zD3ud7?=
 =?us-ascii?Q?vQR7c0n4C8VwpFyO5uMZuojjZjUXJCWIPddEF7GXZ8cBQzCtTe62nHsuqbQD?=
 =?us-ascii?Q?NqhCeT5DFv7ED7z95+95wXguGg9hqKqJma/aPib3/MCR7+T1LvnNsYFyfvZN?=
 =?us-ascii?Q?bM57dCS+h3o0OIhOJOojfHUn4d6sLaGwef/LdiC1Ppb5130jJheSBf2K0/Kl?=
 =?us-ascii?Q?RIsa2iK5JrTS03vrl89i4MVUzBwF2aF2yVsT5voiUio0gTmJKyRjaTGa5qEo?=
 =?us-ascii?Q?8ned/EZtiULrwauFBA0CVaYp0jO452AL0D5gNINC2iQoTxjwTtVniIQsCUHK?=
 =?us-ascii?Q?3RhR4yKmkCfjKNfZwTKEtmucTMeVyJlQfL2M0hoAa989ilqERdg8Rbsqs5MI?=
 =?us-ascii?Q?h/ozQAFtEcK9TcNjpr4ydiVjtBSIMaeHGdeIaj84hLXBF5D8Cusg88foBAhi?=
 =?us-ascii?Q?aJeaZx0tIdoB3BKSNv/Lb6uMu7ZNipcl+ifKIx8/Q9rnLxUutR1+R9HfzByP?=
 =?us-ascii?Q?2JfO2tmb3//skbuuqY+9zZFPHrVtknz/uRWkGFw4ptNp4p9p+FeZqYuOqOmF?=
 =?us-ascii?Q?m5AGcNLq1qutfA5Tki8S6IyXB+CUWfBX+tChuu9KneZh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76821a0-7960-476c-4857-08dd35fc9c16
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 07:08:42.3073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zupSQ5iC6sghhjxyxEwAh0INSoNMh9kC7Up9QArH+4p6Gq6cRrHm6EZtsTMbAaofovXV8u1YBkqD05j/tdqDsg==
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

> On Fri, Jan 10, 2025 at 01:15:29AM +0530, Arun R Murthy wrote:
> > Display Histogram is an array of bins and can be generated in many
> > ways referred to as modes.
> > Ex: HSV max(RGB), Wighted RGB etc.
> >
> > Understanding the histogram data format(Ex: HSV max(RGB)) Histogram is
> > just the pixel count.
> > For a maximum resolution of 10k (10240 x 4320 =3D 44236800)
> > 25 bits should be sufficient to represent this along with a buffer of
> > 7 bits(future use) u32 is being considered.
> > max(RGB) can be 255 i.e 0xFF 8 bit, considering the most significant 5
> > bits, hence 32 bins.
> > Below mentioned algorithm illustrates the histogram generation in
> > hardware.
> >
> > hist[32] =3D {0};
> > for (i =3D 0; i < resolution; i++) {
> > 	bin =3D max(RGB[i]);
> > 	bin =3D bin >> 3;	/* consider the most significant bits */
> > 	hist[bin]++;
> > }
> > If the entire image is Red color then max(255,0,0) is 255 so the pixel
> > count of each pixels will be placed in the last bin. Hence except
> > hist[31] all other bins will have a value zero.
> > Generated histogram in this case would be hist[32] =3D
> > {0,0,....44236800}
> >
> > Description of the structures, properties defined are documented in
> > the header file include/uapi/drm/drm_mode.h
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  include/uapi/drm/drm_mode.h | 59
> > +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index
> >
> c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..7a7039381142bb5dba269bda
> ec42
> > c18be34e2d05 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -1355,6 +1355,65 @@ struct drm_mode_closefb {
> >  	__u32 pad;
> >  };
> >
> > +/*
> > + * Maximum resolution at present 10k, 10240x4320 =3D 44236800
> > + * can be denoted in 25bits. With an additional 7 bits in buffer each
> > +bin
> > + * can be a u32 value.
> > + * Maximum value of max(RGB) is 255, so max 255 bins.
>=20
> HDR planes have higher max value for a component.
> Likewise even in an RGB24 case there are 256 possible values. It's not cl=
ear why
> 0 gets excluded.
>=20
This applies to only SDR and excludes HDR.
RGB in hex can have a maximum value of 0xFF { RGB (255, 255, 255) }

> > + * If the most significant 5 bits are considered, then bins =3D 0xff >=
>
> > + 3
> > + * will be 32 bins.
>=20
> If 5 bits are considered, there will be 2^5 bins, no matter of 0xff >> 3.
>=20
Agree!

> > + * For illustration consider a full RED image of 10k resolution
> > +considering all
> > + * 8 bits histogram would look like hist[255] =3D {0,0,....44236800}
> > +*/
> > +#define DRM_MODE_HISTOGRAM_HSV_MAX_RGB			(1 <<
> 0)
>=20
> Why do you have a bitshift here?
>=20
Bitwise notification is used to differentiate multiple histogram modes.
Currently we have max(RGB), upon adding other histogram modes the
same can be included here.

> > +
> > +/**
> > + * struct drm_histogram_caps
> > + *
> > + * @histogram_mode: histogram generation modes, defined in the above
> > +macros
> > + * @bins_count: number of bins for a chosen histogram mode. For
> illustration
> > + *		refer the above defined histogram mode.
> > + */
> > +struct drm_histogram_caps {
> > +	u8 histogram_mode;
> > +	u32 bins_count;
> > +};
> > +
> > +/**
> > + * struct drm_histogram_config
> > + *
> > + * @enable: flag to enable/disable histogram
> > + * @hist_mode: histogram mode(HSV max(RGB), RGB, LUMA etc)
> > + * @reserved1: Reserved for future use
> > + * @reserved2: Reserved for future use
> > + * @reserved3: Reserved for future use
> > + * @reserved4: Reserved for future use  */ struct
> > +drm_histogram_config {
> > +	bool enable;
> > +	u8 hist_mode;
> > +	u32 reserved1;
> > +	u32 reserved2;
> > +	u32 reserved3;
> > +	u32 reserved4;
>=20
> What for? Also this struct leaves a 3-byte hole, which might be not so
> beneficial.
>=20
This is kept for future use. If weighted RGB mode is used for histogram gen=
eration
then we need 3 variables to get the weightage. For any other new histogram
modes or for future usage this is kept reserved.
Regarding the padding, will re-oder the elements in the struct.

> > +};
> > +
> > +/**
> > + * struct drm_histogram
> > + *
> > + * @config: histogram configuration data pointed by struct
> > +drm_histogram_config
> > + * @data_ptr: pointer to the array of histogram.
> > + *	      Histogram is an array of bins. Data format for each bin depen=
ds
> > + *	      on the histogram mode. Refer to the above histogram modes for
> > + *	      more information.
> > + * @nr_elements: number of bins in the histogram.
> > + */
> > +struct drm_histogram {
> > +	struct drm_histogram_config config;
> > +	__u64 data_ptr;
> > +	__u32 nr_elements;
> > +};
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> >
> > --
> > 2.25.1
> >
>=20
Thanks and Regards,
Arun R Murthy
--------------------
