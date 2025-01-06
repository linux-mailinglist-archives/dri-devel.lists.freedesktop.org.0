Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C57A01F14
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 07:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A36510E590;
	Mon,  6 Jan 2025 06:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HhIa69Av";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9F210E58A;
 Mon,  6 Jan 2025 06:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736143529; x=1767679529;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YzVDmlt7eSdI97jcX86cJRA1ggoamA3G5BC6mt2FD7Y=;
 b=HhIa69Avy+uttatsgpQJc8hkCWPRHrqcU1eMFIouv8TMBQnIoTQ/3rSS
 UrbZrDhDsgP4F0mo+ZB2qQE/2XJBCbkHr9pEPgxoiwc+oAGm++IUu6IKY
 mOP5ljGABuOmhsj0ppTgLbh5NF+qvJlT0qZMPUbofYRTG6OJvoD39Fvd+
 Tnz0DsyRYw3r/hCHR2hUm8Mn9SEENJr6PWHiTb2ydPbiz2mHBWSErrviu
 cIV/EdBkPae2AMqq65uhmb/0leuOl73Pr7ETJtRFeh1QJzesxaz0aQKGC
 vFNLROenHDY8mWHVNuviqsv6l715VVdrOuJErCdlZvZOJAxF3pzfbM/pC Q==;
X-CSE-ConnectionGUID: htvTgZ5VRnmEfJnRsLnxTg==
X-CSE-MsgGUID: g7d6T6vFT9Ow/9k8eL1g0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36302459"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="36302459"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 22:05:28 -0800
X-CSE-ConnectionGUID: w+gRts04RXi7Zc4hsUTwsQ==
X-CSE-MsgGUID: PmVvv/NlQ9OnVDJlZpnlZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106386371"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2025 22:05:27 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 5 Jan 2025 22:05:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 5 Jan 2025 22:05:27 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 5 Jan 2025 22:05:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSLR651pY6kBlev/mbi6XIWUiH0Qc2jed3RD2KBmaB6/YJ8EEVuB56H42sOJz2wihrqMM5oweTeINdvc0XHW9Ti1EcS5mGhRzL8EZz4WNgAaIVYN10FqcUvkBjUt3hiX0O2Wz/y9vx4BX+hrgodwGIMB3fnEIVOoaHab6fgkhqRNAJyivPVlzRZ5LKLq8pyLupK0bnX0hmZNo4MADUcup93bria1GK3gaZhHNnkbzNptnLgVqtOzRsxzSPVojYQQzV5Ujp0Fhz114n9HTGYbnB1FjSsnT9B4kyP9ANCvyU898PS9Bf6ZXq41Uwk+A/0h6CrqIfR/PCC7aYizLO6Vnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzVDmlt7eSdI97jcX86cJRA1ggoamA3G5BC6mt2FD7Y=;
 b=ooUKq24eX2kIFo9/ECxFzIFLh1PBdVxmTKA/CWTzzjX+DQlaK6b5daDMP6jx0Gz5ok48FTFfZu6SadGWmU7D7RpBCAYzDeK7OgmNUsomTtfGNt4fQ+a5R5PBlNaDhvyYZXr83gORoBwctGOfvq4ImIo0Oui89D1iNLWAB5VnFgWQRfJ7Dz0xhicW4aDoGSKC8HMFVVYcWCoNyDtNDojmVJJjEjx+VasfqIeaIM0/y6a84WmVSrfgeX9hJXg6FIIoG7LO56Wa/Hv1LiWIVMrNiFKyPr/Cd4Vbt21lQI8UdBMzyqtBWkzKHGJHBwhU3qPpCw+1yJvoJaYZFoWlM8Vldw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 06:05:21 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 06:05:20 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv3 01/10] drm/crtc: Add histogram properties
Thread-Topic: [PATCHv3 01/10] drm/crtc: Add histogram properties
Thread-Index: AQHbSlhPV7QoPwvZL02lhyw6ED9XxLLen34AgAB/+QCAAEl9gIAAWYJggARCvgCAJVq48A==
Date: Mon, 6 Jan 2025 06:05:20 +0000
Message-ID: <IA0PR11MB7307CFDE4E689B1C53572249BA102@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
 <20241209162504.2146697-2-arun.r.murthy@intel.com>
 <7tho6j262nzbu6nvjgzelsu3ljjipxdhazjlzdfa3xi2lbn3vs@bx55yrrbmshg>
 <IA0PR11MB7307E1C101F417CFAE3B114ABA3D2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <l6dpikqfgwlio5rungx4ckvw524woz4mybkiqfp4k5fpkokj2c@zox6yfhxnzeh>
 <IA0PR11MB73078417607420EC685A4C73BA3D2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <cn63on775l35olcywzhwx3hzivve4ch7h7edp7mvnn3l5x6e2i@z34t36lr2ktj>
In-Reply-To: <cn63on775l35olcywzhwx3hzivve4ch7h7edp7mvnn3l5x6e2i@z34t36lr2ktj>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|PH7PR11MB5861:EE_
x-ms-office365-filtering-correlation-id: 25b65521-e1da-4d76-2ced-08dd2e181a13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7055299003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Gb/HinDmaqS5FCsXkLte+t6X1zvZtOAl/vsNPq/rU8gEcfDs4pR2VUtY0Y21?=
 =?us-ascii?Q?wEXGyZ9vWSHq3BhHNLvVve/U9ZlhoqFqNcfqjsPLkgRe0kmsIkOW5dLxfnOb?=
 =?us-ascii?Q?eW8HHkVx3AFWTJa/JYO5oyfD+KPQYiD90spSVv4BiNFu4bYCioCcEAlJM33N?=
 =?us-ascii?Q?zxWUUhqwymUkXd/zWd8OIctBtP+TFKlbIen4C1Sx4+AU5UDUHUAvYJnxFpa1?=
 =?us-ascii?Q?Ab2Z2p30fPyzWkZ1fo4pdtis2jNl/6+vud43nxmTrkVX49W93IrFLHTD9Okh?=
 =?us-ascii?Q?YcOWtfmCWtOyj+I7qOuFUGpYnasu8vnV9A14JTYY+NKcrwQxGyvYXqoieS/5?=
 =?us-ascii?Q?QIbMQ2oQHe52B+BxTdlpB+hjpN1QXOlRSXtnXiFsWxGOBHMhsQa7bMOWeld3?=
 =?us-ascii?Q?rv3/pHC67djNCnPHlLvhkUmLSp/dJRo6l/4ucEju5oebK9/knsLjtwF2YsQU?=
 =?us-ascii?Q?N0U9DWP7FN//QRrCMYw5BxymNG6rd515ma7ehFk2EkyEB91zmXnajjlS+0I/?=
 =?us-ascii?Q?m1O3IT+rt8jH48FUgYoOmigfOkj+vXWzWv+N+2HEUu5uQHcUunBf9s/vsOie?=
 =?us-ascii?Q?CMCe2Ej7szYaF+aG6zWdph8WuotWQCTO/EfqHX6uLWPaSr9HfEPrvdDW3ksE?=
 =?us-ascii?Q?E0vtvGOOoHyfHMD2uvpmKbLeyWrVYPz7j3LVDDZ8iOwtaYF0aAqo176ozcHW?=
 =?us-ascii?Q?JPuzx7BX8mG3unhQeY8n7fo+ZOpMaaIKRpC4eTrnZCPcecdaKdZdHOn0olxF?=
 =?us-ascii?Q?UEzb/OFdHZriRTcmzVQi/o6AEx2PDARfXzKY7lwDnc0Wndz4/kDeNdG7xcD9?=
 =?us-ascii?Q?Z4T07xWuD1+jB6ymIx4tiFKLHNcyd5Q585bkinaklctP6BNIOBIXk3JZfpny?=
 =?us-ascii?Q?E3IvSw8uKAZLf0kBj0+9LhEfW5fjv0zK67IP0u0+GYqDxzM4ZskP8oQlkrtD?=
 =?us-ascii?Q?fZTa2bJ4nsXR5ujwYfoc59BKci7o9KSQhiQF3jC9UNb/ENzUGAkYgiu9WNE9?=
 =?us-ascii?Q?gHMrfOyHTLO8v7Xx/11SAhmXon/SHL+CZiVbnn37q1i/Imy7j+QulmXrqH3H?=
 =?us-ascii?Q?sBedy6F2kMAQmbMBxYwq+5Q6eFRgU2MW7GqZE5lCnDqX8EImS/+C43fU3KKH?=
 =?us-ascii?Q?Z2Ir90ebOcVYn+4dWVwVdIZ6lD2rwBnID02QRoYQfbminpdmss0rR8sHaRQK?=
 =?us-ascii?Q?E0RAd+7O6/P87TywcO8P4EHM1Ae4n+a6vn+k3jkSZfpfMh4xxYIuUcQGLp5V?=
 =?us-ascii?Q?xhamTCp6JY98iwQgIgWX4wDhJdkc3qY1XzxZc0NZihA/V2zGFPM/Yp8l8DLP?=
 =?us-ascii?Q?AwPUh4J9GE3xlxFlQ+lq05EJoGbQ3E5d8ZCYdGsmbdUkHEnFFgWcVgUppmAC?=
 =?us-ascii?Q?ldSnJjjjIPKAWYJ+y/+QK3150YcrMIAIthtBP3zR111tweDCUSNnaBJnbHiN?=
 =?us-ascii?Q?kr+xPWlAjrc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7055299003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mNTM+PvgX/QvErh5G/DzMhbXUvm7OhIfWRFb2YQEXUht6LFzYrndsrAa0LZA?=
 =?us-ascii?Q?f1kscgw3/wtFtQsQRQA56roslnirMgM/RoPrPzmSQy3edzFXHbbkqlKFu9O3?=
 =?us-ascii?Q?M4kqAsM3Qa7dE0AGkPzzeYsYzvMlIokN0qzVG2w/gUQjo3cAsz5L8CWJtSbH?=
 =?us-ascii?Q?MWA3d6divQvDlC0oxetn8VdejzWTT5cCn1P2tQZygzrPLwoFWqYLLnjlA+bF?=
 =?us-ascii?Q?OIHHVFDuLW2MLkBOvGC3qQ3S4GTp6v1v1POYKBGgS2Q527Jc/6PKLRmNnjhL?=
 =?us-ascii?Q?hY1ntPgNBi09UDZlJ3ePDE2bPfSfZnosn3GNE8tZplWtTbZYR96GdsVMv61J?=
 =?us-ascii?Q?prktR/gn/P1acbsARtp+BnXr7TOpAQOf4G/fVY3H9J9TRHbZEkIFIhzmWYFA?=
 =?us-ascii?Q?s3G53pGcEdL1LvIoRuHSuCUYr9B6gMGfQHtSq6zIuDXy0qH1IyDqmL51pnhB?=
 =?us-ascii?Q?Qn+Po9htB5f43r8NliASqbSth3smjCRmFuBs8L6EqZiE93/8HPNsjpwuL3Ag?=
 =?us-ascii?Q?zJX2P+dkLWJSWnPRWE//QAa97ZuYlrocwZEDAuuDPjYfd2rYupiKvG7Igue4?=
 =?us-ascii?Q?1ITglHuFFWkxCstCoJC5YepfXbX0udxhtJmLdim4bFakEqt+/Lof469RjPFG?=
 =?us-ascii?Q?JXNLeX3xuNRQPJBNDzKQ8zryHCCqhMP88RjPkEW64Jd0QE7ra+DMBjz4ysdF?=
 =?us-ascii?Q?p7/UzQkkt2jVVVswAgPoD3C64XDMgh7kLz6LLPVB9Ndg4D69lodU/o1OLQ68?=
 =?us-ascii?Q?++qWZyD9XxI/MLkly/l9L9gVYWYioPVDHaQqs6tTAp5KdkYPmO5tmPLBGnlS?=
 =?us-ascii?Q?vBYCxhFJ2uROm6FuxXMj/q2GPxb5DyZja50fjKxcgM3eHXdcF+Y9EsSNCvCv?=
 =?us-ascii?Q?Efug3JSPW0+dRtCICpE64UeMvH1IrA4gNQORmEhc+nzkLPBL+6l21gOptlj0?=
 =?us-ascii?Q?m9VD5mFet94eUgxTPRF37oEuZZGPre2tBPXW0/axmWQPgx3ilWTSI3FsEiOS?=
 =?us-ascii?Q?fzvPMKvZnOQt0r6N81zFxW5n954d5wrkGf4kkksYXfArGbVG+UHG3uR8SJyV?=
 =?us-ascii?Q?Y/8+YRo1fUjvefjjJJZPJ/H+8P31CJoAgsXtZUwPUcVxRF2A66gwEb2sgmCU?=
 =?us-ascii?Q?8n4JkCIYLTKdHyRXnav6cCUCGEFKWiBLgntZumqBWCUpKfuhLgyva0Rj1qxz?=
 =?us-ascii?Q?/FgsJ0WWOWiIAZfdKON0zszTapONgfXf3FQDYuGy3D9ZT9aHx1nSAAAgcAYj?=
 =?us-ascii?Q?n18T0DtATt4hHp5px8x4XFHNBhSsN/SKCQ7ajbT6ni/btdGL8ZU2cBrUUACN?=
 =?us-ascii?Q?YgXmPGqee5ZyvTlLZzp1Qvp8uvHZXh04b5u3hBuped80b3P34dsngPvZvNRc?=
 =?us-ascii?Q?QVVLTXCiLiNfvdBREPrMrYAwjo7jy25AjtxsdB8KM/RjVoLlRvPD6tNVRCuT?=
 =?us-ascii?Q?aqDWj3NeOlXHbpI+AcAJH3v607VEVnLyRt1jfCKUCqRgSdCzfZhcNXPp/fit?=
 =?us-ascii?Q?N3upEhS8RwuWtdCmB8T3DSVxyt37qFjzeOFnG4Lyti7RR/1Zi89HTVlrvNoZ?=
 =?us-ascii?Q?MuD+9KJoTYeJuoTAJbmEu8arr6HmnkcXg0buKHMH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b65521-e1da-4d76-2ced-08dd2e181a13
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 06:05:20.7901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WAsjxL8NGdKW2pQVd4hNuNyiO7MJJ8URM/Bm1Ma39vB8GCZ2wmjwHj8w+22vqUDepd3TT7XU5IcN65u9576ong==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5861
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

> On Tue, Dec 10, 2024 at 05:52:38PM +0000, Murthy, Arun R wrote:
> > > On Tue, Dec 10, 2024 at 08:42:36AM +0000, Murthy, Arun R wrote:
> > > > > On Mon, Dec 09, 2024 at 09:54:55PM +0530, Arun R Murthy wrote:
> > > > > > Add variables for histogram drm_property, its corrsponding
> > > > > > crtc_state variables and define the structure pointed by the bl=
ob
> property.
> > > > > >
> > > > > > struct drm_histogram and drm_iet defined in
> > > > > > include/uapi/drm/drm_mode.h
> > > > > >
> > > > > > The property HISTOGRAM_ENABLE allows user to enable/disable
> > > > > > the histogram feature in the hardware. Upon KMD enabling by
> > > > > > writing to the hardware registers, a histogram is generated.
> > > > > > Histogram is composed of 'n' bins with each bin being an intege=
r(pixel
> count).
> > > > >
> > > > > Is it really a count of pixels that fall into one of the bins?
> > > > It's the statistics generated for each frame that is sent to the
> > > > display and the
> > > value corresponds to 5 bit pixel depth.
> > >
> > > Let me try it once more, but this is becoming tiresome. Please
> > > provide a description of the property good enough so that one can
> > > implement HISTOGRAM support for the VKMS driver. You don't have to
> > > provide Intel- specific details, but the description should be comple=
te
> enough.
> > > "The number of pixels falling into each of the bins, sorted by
> > > luminosity, started from the brighest ones" might be an example of a =
good
> enough desription.
> > > Then one can add such functionality to other drivers. Just saying "st=
atistics"
> > > doesn't give us anything.
> > >
> > This is a hardware feature and hence for other drivers to add support
> > for this means that the hardware should have support for this.
>=20
> OpenGL, OpenGL ES, Vulkan and other libraries also define software interf=
ace
> for hardware features. However they define it in a way that allows at lea=
st
> software implementation. I'm not arguing about the particular feature or =
its
> implementation. I'm not asking for the _hardware_ description or any othe=
r
> kind hardware-related information.
> But I really want to see a good documentation for the userspace interface=
 that
> will allows other vendors to implement it in their drivers (including my
> example, VKMS). Up to now I have not seen a definition of properties that=
 fits
> this criteria.
>=20
> > Each bin consists of 5 bit pixel depth.
> > Example code of how to use this histogram and increase the contrast is =
GHE.
>=20
> Yes, I have taken a look. No, it's not a replacement for the documentatio=
n.
>=20
> I'm really sorry to write that, but until the documentation issue is reso=
lved,
> please consider this patch to be:
>=20
> Nacked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>=20
Hi Dmitry,

I have pushed a new version of the DPST core patches that includes drm-core
changes and the documentation for the new uapi and the blob structures
exposed to the user.
Please let me know for any further documentation to be added?
New patch pushed @ https://patchwork.freedesktop.org/series/135793/

Thanks and Regards,
Arun R Murthy
--------------------
