Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDF39EB8B7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 18:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F85610E943;
	Tue, 10 Dec 2024 17:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IU9kN3Af";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6762B10E943;
 Tue, 10 Dec 2024 17:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733853163; x=1765389163;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cuCCY7RP5xfx0oqn8+eoI5mqFyLyYcfT8xqIOS6jPfE=;
 b=IU9kN3AfOOjrySQmsMQAnRARweHcOeOUEeqi5sFYzEJdiqJ32rdLgi9x
 IoX773knmDPXy4QPKeReCEOvGBFI/E0Rmm8Z63uhogmenFLVf7Kq8E8KA
 4YKNx3z8ZPngOn4l4GzUg8AXlJewFkjTx/7UCUbuanpcxHbX8FJOoaBIv
 vFtERKiKlPqCA+KK0xGS8XxTB+q+QXczpML2wTHh0uZgrN7U5S8XDo9vG
 e3NkXsS2YzfAXTDNpokuhaPaciNd7NKwSGWgi6mCjzNMWMfzt/3naxI/0
 cjAJQhzHRn/c8zMAFNbUF9PRU75UXOl7QgTkasQmO+GmXCylbPvkCwvq3 A==;
X-CSE-ConnectionGUID: o3zSfL/0TCaEYYVYx40rMg==
X-CSE-MsgGUID: lnc4FJ2uRo+g2Egs0UK30w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38137434"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="38137434"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 09:52:43 -0800
X-CSE-ConnectionGUID: Lu0G8YK1TfaE/XvBf2kXSQ==
X-CSE-MsgGUID: ym477vX2T4+lmqo+3TAgdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="100526544"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 09:52:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 09:52:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 09:52:42 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 09:52:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h62Ml9CTafKHNKv7Iq698egdXUs0ci0lzRYYGvVsWXo7VhyP3mfOl2M1mdfUD+/nOaeVdohuYyFgLXScC26YCqoq/3PH/MJSO5X0+jXWJHg6/cEj95dF84qfTLacDF+PU6nTGpBDr09XVvfPpi+u20uBnzjXBwEqVFOWlXii6H6hkYpoUZT61R1ML+OhhUn6gnYGIR972OXOJJzc/heu3aCIjq18brOS3Ex3/Xe6SEFrSB8FaXk3V8YTGSNGpGPz5jsjanLO5sVPcfrVffatPHaWeGTorZ2tn9CvBXq8sXPiUi61g9JEsixZaN+J5B4HYQ1rigIVMrKGGWgiIDfmSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuCCY7RP5xfx0oqn8+eoI5mqFyLyYcfT8xqIOS6jPfE=;
 b=ZbmSaXeLKxhPeZaoI2ltBTm0FU7ltD5QgU/1o439G0m2F0kuXER/6tTB94dx6McuMzblDmvQzXF9EfGRBZH5JsSrBVqNXTWgrjwixN+XNGj6J7zcOL9Dr8TZbm2aQQr9mkDs9x5EhIFHXm/EZP6VIdYsPpSMTvLC7EeaXvorJolqmsHzYq4O+1E0DoJ71/dbJz3tSCjXVpn3IjYJB9b2AaL1CLjSiSDwCfyuEuwvR8TuiIPi9BofO97uvk1hI8Y1L/Fg0AzW0Cspf7+cy/OtPAUvecxOR5hCTSdAzTAqtk99yV0GedMuYLbywqk44jpk9e6p1ZQJmqdJMZtGukgoYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM3PR11MB8684.namprd11.prod.outlook.com (2603:10b6:0:4a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 17:52:39 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Tue, 10 Dec 2024
 17:52:39 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv3 01/10] drm/crtc: Add histogram properties
Thread-Topic: [PATCHv3 01/10] drm/crtc: Add histogram properties
Thread-Index: AQHbSlhPV7QoPwvZL02lhyw6ED9XxLLen34AgAB/+QCAAEl9gIAAWYJg
Date: Tue, 10 Dec 2024 17:52:38 +0000
Message-ID: <IA0PR11MB73078417607420EC685A4C73BA3D2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
 <20241209162504.2146697-2-arun.r.murthy@intel.com>
 <7tho6j262nzbu6nvjgzelsu3ljjipxdhazjlzdfa3xi2lbn3vs@bx55yrrbmshg>
 <IA0PR11MB7307E1C101F417CFAE3B114ABA3D2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <l6dpikqfgwlio5rungx4ckvw524woz4mybkiqfp4k5fpkokj2c@zox6yfhxnzeh>
In-Reply-To: <l6dpikqfgwlio5rungx4ckvw524woz4mybkiqfp4k5fpkokj2c@zox6yfhxnzeh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DM3PR11MB8684:EE_
x-ms-office365-filtering-correlation-id: 752ddcd0-5768-431b-233c-08dd1943700c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?nKhwtUYzq3J4aS4C07MM7tLUm1CNCQ59ehNEtNT/E7wxAod1rANG4Vo4jBeS?=
 =?us-ascii?Q?8582B13phPHCsKq8HnfM2oAjWwwuF58n1e+2MI6UvfyG0jCGfeHxmrmJK7CE?=
 =?us-ascii?Q?rw33CqsWyf+lhyWb+X0Yp+AjlBih4EPR5s6eXuR78TWOTnsynjXjssVsdgYT?=
 =?us-ascii?Q?h7i9tf3QKk9O7+vT5j1Imq/5PKHIX0P7NziOCDk28CHe51hW8q8WzrRxUebe?=
 =?us-ascii?Q?BzE/D3MQ96qsAJFTsJTQXDzdaK0V+9sDGnDS6G7GuTowKJTeSyPhCRtb4m8o?=
 =?us-ascii?Q?R0d1b9+okMVQnZUcgu07rlXOFk+YP/hDlm/dL8qW6koClQ2dpOt62Lf71yzw?=
 =?us-ascii?Q?7ISOokg8AWJ12upn9PkIwwKSEIWAc9a13LXwBIliBo2cfy+rgpa6TzpI3+YD?=
 =?us-ascii?Q?Von/xwQaIVkIWVbvxeqi2k0a77bmcupUw0G4hKT0aHbuEI385J7Lt6ADjbn5?=
 =?us-ascii?Q?bMFzFky3Q6rZNNQ0X8OchzcKgctv4Z5C7czNqC3nP7SeQpaApylcpbB5Hy0C?=
 =?us-ascii?Q?GnPyborS1lSSvwexfFP3FdbjIqab4dLQ+tZq0XzY/dXNmWQtWdqAVvDoB7Tt?=
 =?us-ascii?Q?z6oKdBZjiSkIoopT/T213njsiMRnZLPfk3twcFz0tyf4F8SKu512jX0S2bIB?=
 =?us-ascii?Q?vvmRULFeH31XXG3zq1giMBn2KhSL/QyQ2mDTW0jBppannkDZaJr5UdW0qiPC?=
 =?us-ascii?Q?rmPTEu3IjI5nt61EX4GX4+UXshFIopErWfdZrisbWmGu4HJzfjMkskUX3wUm?=
 =?us-ascii?Q?bjHjdI5KvYcyUhnRpsr+Mf8Cq3aqGSxis4IHXbluKx33eTc7WW5S/gDVMbtA?=
 =?us-ascii?Q?/J2Ph3jY0UWGFVtkB81RbiM2v29HbzDgOIkkbym6l2nxXR4JM2/1l9b4ZUCN?=
 =?us-ascii?Q?4VoH56tGjltP1XV0dSfgTufHb2fkvTKamVhv8HZwvKvV36lGn5AaI5Sr3zLU?=
 =?us-ascii?Q?AH8bCqpOTRP4ULx9GTbExntEFiZIOSzIInlCgzBBlArFkiDZtJm7IELDaTol?=
 =?us-ascii?Q?cxTNAJvP/gvrkUIyJjnCi3X4oC0gmGkdl4d5voBHeqEZ6hN6WchHSUsFinB9?=
 =?us-ascii?Q?ikLNuVdSoHVlOKWh7O+Tujgc5oyfY3jJ4DdW/F3KH/HB4rQe9aQrZnLwY1sH?=
 =?us-ascii?Q?c6MDMls12GBylmQT8hIjJONC5FKfHtfH9BHzYGJp2w/mNaaYCl6RA4A2Jy8H?=
 =?us-ascii?Q?LdJSj45RhZgI2lWE24ajYJHmyLqBuOLmeoUZFheZmq9R80t26bB9j9QEaXiu?=
 =?us-ascii?Q?ZodxYsZxerH8Mi/g3nwuWR6hnynYZFCP4qaIZz7/dUzLhvDztHLb/A5YaoWO?=
 =?us-ascii?Q?uOozt+KJEfUKN/PKLmdRjjgy9aZXcP5nSICfq2l0N7FDepmZZNHOiBf46ida?=
 =?us-ascii?Q?7JiluYBwZLQkYhkd3P7ZX72b07FYW7f4aNEDJ7BfqRA+lxzGUQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dvq9fJRty4lFpQLkyfOy6LzNkX5wMOTgQpnZ3pS6rQ46FO/rNUH16vH+SXD2?=
 =?us-ascii?Q?35K8jMXXQ+zS6d3Q26XPDw/gCFogBlvYfnycnqU/lUlOpiyI1eUO1t/y/nYV?=
 =?us-ascii?Q?Q50t91ZOOGSAP2il746JSgtXxGb4enZxg1EvLcftSE0/ecW8tZ7aAHZ/hj1m?=
 =?us-ascii?Q?pcYiFMWgiy2QzA4O0iCZluUWIfwp9wquyCptmKMy9tPUWYdvjS7Hn5xEk1NW?=
 =?us-ascii?Q?p+zpF3mU1Wr21aUkTkWly3P8kqVEdQR+HFZ1Tf9pk9VTqcDEJRt8owfnJc51?=
 =?us-ascii?Q?xfwbhJ1x1ldX5elrLStygxGzEvpdU9wY97sJhL2rdToqSGTu6lIszLxiFN0x?=
 =?us-ascii?Q?YjZeFKF6/f5BhZkIP9YKlfBjn2JOTjP+hm+8sbnRDkeMMY8FHkGG0AX6F5ui?=
 =?us-ascii?Q?O0yLCIZOINMkK4n/x0djTysCA1i9qKWiqW5aEpi22KRGTTMsyFYZza7Vb+pf?=
 =?us-ascii?Q?/UvrRD46M5pbz5cC/rEQelzXddd+QZ14b1NXPd7lCH+LcaN3vqupgCsDp8p2?=
 =?us-ascii?Q?D26oVZ1jXgq7k96hdSNEUXjWkxmvgeTPEVEYDMyPJqwpqhbZ9Kwqrk6j+oT7?=
 =?us-ascii?Q?WwqoFWxstX6zfIIi4JeSO6ddO6vkqo66JowY2RVIm14Z1zNgKBx1EEc+D+6s?=
 =?us-ascii?Q?xW4Lh/anK4lCppFShCPTD4d4n/me4skC16ZmOvtO4SHSIGRJ0+FI9KDSKutk?=
 =?us-ascii?Q?9yvJHVTJWvWzdDWy6s2Ca52EnVe9Ah6LxVDWBqM2LG3UqRpLgx92iDBJ6Y5d?=
 =?us-ascii?Q?IhUxnXUhkIN/GzFrQ56DY80wJgS254K8E1ZvP8U1VQClj2X+AUmFH3+d1xlB?=
 =?us-ascii?Q?vRo4YL8h9rG96kODW8Bpyq5o3aTx0R8vrtad38iAHWqeKQLBjp1m7NJdKNoz?=
 =?us-ascii?Q?A5SrG2JBSdU8NvsaLx4qPEgacHQyb/04BKXXSkqDFv4CvhE0GZ2dftfWcDzk?=
 =?us-ascii?Q?FJPCsoCcFTtvkQBHb6rXoptMhxp9LJphPDFM1QXUgns3SbckmNK/cdbUuj+S?=
 =?us-ascii?Q?s4Tp6KQ8lN5mhegHXfDMb7ZYuDe/edav1z4v/hlGvN7xFj3Rw0uFq4SgYr1a?=
 =?us-ascii?Q?FClbyQfWeYmFoe7uyQk5GWhyTsqGbDvEP9J1qEfPAxUnsAD8Hlow6r9XF61g?=
 =?us-ascii?Q?Pyumiq/5Xj9sdVCtz1uGXJx5V8MWrXXf5urGdYVmJPAbEmiIz6HtTb5s1JIi?=
 =?us-ascii?Q?LvIF5VNRBCyV0Zl/zO79albdvWnvZuHhRmXCoz16UyVIAaQ6vE67eO2JpHdk?=
 =?us-ascii?Q?Xpd19uIJ7xipTYL/S5AatW6qWltL6jgXd4Krz9/I7jYThSqe9+1F8cWed55e?=
 =?us-ascii?Q?NukwKZXLZaYBLD723zQZy/Q+ThtgaRzxuEv9DOxqpc3N1RkXvhirb52wGd47?=
 =?us-ascii?Q?r+809h9W4Zafx69jkgAuuWmeTRIf7G6w3u0pcvbCtiEgSjV0fuvITnPkPzC9?=
 =?us-ascii?Q?aiRCU4mIoDx49rZ5rSbMuzYs5KemiKrkL4hgpk4vxfqGlWgn42wQVgezPSJ2?=
 =?us-ascii?Q?R8iZClncqdtC/N/zxWpN6kVx6/k96hwwTquuYTs4Rg/s7AtyPJ4no5gfOrYj?=
 =?us-ascii?Q?8xXmf8hVgNZamm74cbpONAldOwP4REqgoOImP13B?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752ddcd0-5768-431b-233c-08dd1943700c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 17:52:38.9242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Yy1nzbpz4f5NoNbGXeGI7WmJxayHbHT+qWYk35gCmZlNBFQRLKbBZKlRa3oYi6Wcid9nGa2BsjoiOkhB0cotQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8684
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

> On Tue, Dec 10, 2024 at 08:42:36AM +0000, Murthy, Arun R wrote:
> > > On Mon, Dec 09, 2024 at 09:54:55PM +0530, Arun R Murthy wrote:
> > > > Add variables for histogram drm_property, its corrsponding
> > > > crtc_state variables and define the structure pointed by the blob p=
roperty.
> > > >
> > > > struct drm_histogram and drm_iet defined in
> > > > include/uapi/drm/drm_mode.h
> > > >
> > > > The property HISTOGRAM_ENABLE allows user to enable/disable the
> > > > histogram feature in the hardware. Upon KMD enabling by writing to
> > > > the hardware registers, a histogram is generated. Histogram is
> > > > composed of 'n' bins with each bin being an integer(pixel count).
> > >
> > > Is it really a count of pixels that fall into one of the bins?
> > It's the statistics generated for each frame that is sent to the displa=
y and the
> value corresponds to 5 bit pixel depth.
>=20
> Let me try it once more, but this is becoming tiresome. Please provide a
> description of the property good enough so that one can implement
> HISTOGRAM support for the VKMS driver. You don't have to provide Intel-
> specific details, but the description should be complete enough.
> "The number of pixels falling into each of the bins, sorted by luminosity=
, started
> from the brighest ones" might be an example of a good enough desription.
> Then one can add such functionality to other drivers. Just saying "statis=
tics"
> doesn't give us anything.
>=20
This is a hardware feature and hence for other drivers to add support for t=
his
means that the hardware should have support for this.
Each bin consists of 5 bit pixel depth.
Example code of how to use this histogram and increase the contrast is GHE.

Thanks and Regards,
Arun R Murthy
--------------------
