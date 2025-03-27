Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1849A73384
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 14:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC8810E0DA;
	Thu, 27 Mar 2025 13:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HAMdzEDa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA7510E0DA;
 Thu, 27 Mar 2025 13:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743083058; x=1774619058;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=Q3H6lP7VUvyftkAF3UTn2XwBpb7CH3OSYHMcyONFQPc=;
 b=HAMdzEDalYsg1S59HeHXasX0t/d+FAcE4EPtRrqjP7Eum1N4QIPe+p71
 fh6byjCR81taM0ZH4grDrlcmWVhs154GlaitX5adxsXcE7opLpApvqGaF
 WFgY9jRVeEZgwZAmyGqlvI30idT37x3HgzQmiozBPbVi4V23GebtLNlti
 wnmoDqDyOPJK2MV8dJRuOaTxaQ6wBBLZIBUyMShEkeKKlFwKEt2fb7Ns2
 9Vu2T5wtaWZCenzXwz5SaJR53yA9Q+abVQyT3bhRG9DI5bZQYz3JhVMud
 QAqIPiHE/6XSVAr0fI6qaSVcwpQ98YkAissrlLQ3bF9YxC2SfUlaTETjA w==;
X-CSE-ConnectionGUID: BB0ID2RMRSq1wZebwjsCJw==
X-CSE-MsgGUID: AZVcbKDMRbKw4qUDbW0sww==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48289868"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208,217";a="48289868"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 06:44:15 -0700
X-CSE-ConnectionGUID: JhISf4OBR963vr2i+RUSVg==
X-CSE-MsgGUID: d5mSmpWeR7yg4KsFcQe2zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
 d="scan'208,217";a="125595156"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 06:44:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 06:44:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 06:44:14 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 06:44:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsezVEEz7mKU04NvyGQOj3hkXjyGtvceb9/DCoY3hyFUPo4b+nLdT8b3M/xPn1cBtVAbazNSoB7NAAHuvXIOHFq6VLJ82mjYwL3/5t49r7JGhsWhZwdI/Qdila2h/qNgIi+A7h3a3aSb5agfeXOiNiZLzju94NrXwOs8dEss/ACqr9XgRNTcfFhyyXaRvT019kS3+jtz4WXBITc1EHU4psBsPi8UCfXrmd36WzuljnkiI93GEIlG3DK5LUR4gDcbIcBrkqXAXsfWnN9siAjdW3DEPBfxTTUNLEIP/u34nR/2pL2r92CfrsKWfNVig/3auF/pi+VVUdsKNvfJwIEkAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tNRSFI3NgpwT+vfuF6K75YIeuMATloVN9IBbsKpNhw=;
 b=LuIO/jCd8QsH4/wY88EgEkKWQvc9hLM14lDKSr1Wg2LzAodwWknnlw30JIXiUob2m18EQwtsis+O4l8AeoQaRI85YCNkvANeUzjgrcY5iDry6Nx80419c+NXL9eDomdD6ZiYOUBAnjd6JVShYhxVbAOcGt1TYFu+oBGZUcDbpm4tCkJjhrWcxI3PzBx31yymNJv/RmNrho5OuHAiKc5vBDWUvJsNLVPfskVor4RIZqbqB4ugg0h9+pCl8W92+/qc8R8yzFgqnhGlnhKy+pZoAozUyiDV37PrmSpm6pakZAO2qBn+uRMU62lBHJDLT+Zf9MLMkPVY4nsdpYurtfkd6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB7635.namprd11.prod.outlook.com (2603:10b6:510:28e::14)
 by BL1PR11MB5222.namprd11.prod.outlook.com (2603:10b6:208:313::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 13:44:11 +0000
Received: from PH0PR11MB7635.namprd11.prod.outlook.com
 ([fe80::ae0b:2c4d:8957:25bc]) by PH0PR11MB7635.namprd11.prod.outlook.com
 ([fe80::ae0b:2c4d:8957:25bc%7]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 13:44:11 +0000
From: "Ayyalasomayajula, Usharani" <usharani.ayyalasomayajula@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: Tvrtko Ursulin <tursulin@ursulin.net>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 "Mehmood, Arshad" <arshad.mehmood@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v4 00/15] CCS static load balance
Thread-Topic: [PATCH v4 00/15] CCS static load balance
Thread-Index: AQHbnWjGmOzqdRvy90eI/0ADf7FoDrOGs+gE
Date: Thu, 27 Mar 2025 13:44:11 +0000
Message-ID: <PH0PR11MB7635D14362CEFEC16235E2A9EDA12@PH0PR11MB7635.namprd11.prod.outlook.com>
References: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
In-Reply-To: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7635:EE_|BL1PR11MB5222:EE_
x-ms-office365-filtering-correlation-id: 0ca21e8a-ccdf-471f-cd28-08dd6d35748c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|13003099007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?2SRwknjN78DSP4VnG9BJJEkUgV8QOduPWHWHDPhouq74vdrbiYvu9klPi4?=
 =?iso-8859-1?Q?BwgRwimdTXRC6hKSwTH01QNG6I/lsQgsmlpFyA6FH1jWgYlCRXRyVkWEvg?=
 =?iso-8859-1?Q?bhtwyJ8R14nwMsB5B+TL9l55nwDqTjGlPA+wGHeL3eibrIJcx0h57pSiPu?=
 =?iso-8859-1?Q?0dxLzmZXOWA3hChmwoZ5okU/g11cEOdfzb4JB8oFQnM3Tr+5zBRZHp1+G2?=
 =?iso-8859-1?Q?g/JamGWD6+Itq+iOq+IlXB67oD/VtxsI62GyYwtWKng1jZYqoEgLnDssG6?=
 =?iso-8859-1?Q?v40o3S2EgsR1EMlgpoiiI3dJW2Zf94zCvJwETJTbFiqsIxVpfRg59zGZgg?=
 =?iso-8859-1?Q?xVbBjdEWd+Zv92Go+6yeRtxuNkwbgdY95/5w4Bo8J1i7lcvnnRWg02uj0m?=
 =?iso-8859-1?Q?es5uTR+wsB5i1WMXGHr/bV808zhxk6i/Kisx4sIVMljsSBn5ab1V+HhATZ?=
 =?iso-8859-1?Q?yIFfGkEmggxvzAQpDoURoN6fUNyarQk3OvVwLqA98qPj660yQP+mKiMZLV?=
 =?iso-8859-1?Q?O2gpFDf8MFTfjyY9WrudD3wkuzyglbUubeoaeJsdVXMQpEXodwEVHqdj0x?=
 =?iso-8859-1?Q?YpfqwPhvf62rgs4scrgLKLpbXCalxCvZVcYK1fOwMO2bWIhhMQCmrqvA4E?=
 =?iso-8859-1?Q?hIpCmLgSVYBkhk1QGqsvpsDH7gMCICKJw5kcligwMPcIcnq+CtPbQrk+ye?=
 =?iso-8859-1?Q?+Mxho9fIcZ6jgrCRbu81cnULxUblBSPJl8fK9IsRHdQXEM46x1/YpWF1jy?=
 =?iso-8859-1?Q?gys/k8tMDZcIwQyX2ndF2dNqCRwX4fmCAqnw8L1VuD7BCTaqkNQOxTkuTW?=
 =?iso-8859-1?Q?zeOS1bi/ca8R8Reb1ziPykdF3GMSb4D2Vn79oxeC9iM2qR5VcG1kwHIWiN?=
 =?iso-8859-1?Q?DHMdxaznpsW/KW7bJV1nBC9XXSuhxGP/Dqax8/KCIMyrWHzGVvrYarn5MH?=
 =?iso-8859-1?Q?ub788Ao0OSWEo99mGPC2pdqLT3GasiekzOL0Id0WwAlyFxt5BVipcaWSaC?=
 =?iso-8859-1?Q?55O3Hh/5kY+pn7kdIrEL6EZ0UZjGFTclVNlTgZmryE5RXX7RB6TwG4dhN5?=
 =?iso-8859-1?Q?qFzkBmsDi1F12IG95vxC953fC5l5IvyndbT42JHZzMbzY9U6AV2iP9NHBR?=
 =?iso-8859-1?Q?Wv5c7ghexqPGL8NvguxknkbsehoK0mPA3vUb6U9VSbrV1x95tXSFRKQyzG?=
 =?iso-8859-1?Q?2fa8Q+bxOojcilQgi2/1fU6c/xA0YSryUL0GAfVUD1/kRReoKfwuFA5C+r?=
 =?iso-8859-1?Q?31zyTE/2nID11Ek/7RpzKT3Q6u7qLY8uXzApqoiqrONZrWU4jdro7nYmJl?=
 =?iso-8859-1?Q?+3qpATzeZLD5V++6B6HJSOGiWN2hXKi1pXqDEcZtrn204NyzePTDYqbV2y?=
 =?iso-8859-1?Q?zwjPAYZH1Sw31q7g8sfpS4eMbesHRncJCsgkttndB2P9CB7drQ3OA6p+SC?=
 =?iso-8859-1?Q?0BbPwiBfr0Q3EiVKgPlwi06rUl1hLKIHG7q5YrmxHxRiJ43/eLv0q9IvkP?=
 =?iso-8859-1?Q?sJMftt3o9YpptlTLpN3ybq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7635.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(13003099007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QCm1GyilR24huKvPd9CldHvZ6gKBWJUlXUvpi0m3RcoWYTdDH8FFBsN7wb?=
 =?iso-8859-1?Q?eCNSa7DARzPztNBPG/82nrb9U3dRyFsPEbWkEBMV/yZLd7o1PQZRnc4C5b?=
 =?iso-8859-1?Q?H4+2+EJbdQvdZak0PAtjsjZtDBsD+GF8gmmNbFj4Sdd6nqVzg2poMMFVnI?=
 =?iso-8859-1?Q?QcTp03e2b6GjP2tt5mCzveCQ+qdDskgHDyF9OpY1gK0H9oqp4SB8lMI7bS?=
 =?iso-8859-1?Q?aG/zzw2NX0kBVHc7ZlKCxrgOxTEOGK2eS0O/HfgXl2QEK7jCSUzRm7F0i/?=
 =?iso-8859-1?Q?jvJgcD/PHHP4xr+IL9GXGLr9iXyEOPfzCVEtIFi2mdQyPc9lYmOKwISqNw?=
 =?iso-8859-1?Q?P7fbCfpAOVC9cr27eXyYG/K6IYWrM1I9Hpg2rZHyNqBzr7GcVUIXSJ/nfV?=
 =?iso-8859-1?Q?DUnCBMUELQ/u/vDABbH3tfEKrmr5AhQHf9EMtCPOvpKKmfaLEbGLljT9xh?=
 =?iso-8859-1?Q?U5Ls2kdWMJmEKrnPYdTnynCK8GgKaSyihdY5dSPWDDvNNJvfQkhp2TD+K3?=
 =?iso-8859-1?Q?FneuR380sof0Dj09By27kSKRp67ZrBV38lBH98xlhHRvk+gpm2RMA3Zvsq?=
 =?iso-8859-1?Q?dBvnWa/TE0kjL/a9wZQiFkRimRlAy4aYgr4JMQFWpX4j8QF73h2Z3Vxnn7?=
 =?iso-8859-1?Q?JUIBrPQ8dYPHTPVfoB2YLK+7Ar5oSKgPChyFN3PQQmdi1gXRcAjASLnb/2?=
 =?iso-8859-1?Q?QiZpvXEt2UJi2+6kB5pKoGMlF9yCTj7V9G7SXGqVIsWJCv8JbuvdbZRVUV?=
 =?iso-8859-1?Q?EOiAdOC5LaJ+CswI5vXv7ZgYMI8NX8QNY2nSd0QohXmOnoFvbmdUS5E7Zn?=
 =?iso-8859-1?Q?zaB4gQP02+0LScIIMrdTLi88VkgNgGZ14s9bRve1eIooTCzqI9i6lqjYZ+?=
 =?iso-8859-1?Q?XUkygUDYSEiqVI+IONJSd0kwBK0a8OohqW/IKKblzvR10SIav7FwDaW/C7?=
 =?iso-8859-1?Q?tZ96N/RoU/Zco5W9Z8dGMVZBNstCkd8DrbBaWaqKstLzwqPUAyLtbKOx7V?=
 =?iso-8859-1?Q?+qRwghvCJ1jkw+EvvRmvQn6ly9Cl3V/FrpnBjRg/uhsIXWJsZOSTl9yTbZ?=
 =?iso-8859-1?Q?2OhjypIhuMHSv3gR4c5J8V/N8G/Q5VLDXj0nfuDXRi1ef7nTwl0s9tXJet?=
 =?iso-8859-1?Q?4QT7KsSB8NSokuLCIwdRA51d4UPFGs6W8D9ER1urWCGEPvP7+aYKXSBy0p?=
 =?iso-8859-1?Q?2tVzlBWqHkFtT6UlHPSy7vCRyy/zLqXC7HtOB24HjHbPb6HjyT/oUqiWyq?=
 =?iso-8859-1?Q?C5K4bgJAvSOYqwyGNJqIn/cWALqrn3cAVA/II7nfy64PKr+T1P3HZYY/Fu?=
 =?iso-8859-1?Q?JM3ApezacSZQWReW6vQO9LtjnJiGfL+hMXRtgahNIAOsQSQi1QvPZoDeOb?=
 =?iso-8859-1?Q?kR8ixf99SRTFBqvUuhZ1MVCj2kq8w/Wj7MxKuyZeBTvoVZL4HaKEN9DGwF?=
 =?iso-8859-1?Q?05qB+MIzz1L7pQEuhSVM67RFjecynE0/WuPI1lU1lgHNkrB2F5bc+FQWRE?=
 =?iso-8859-1?Q?Ru+OjKrCbzNGE7mVjGKcVmQZrTORfL/LULSE7PAhbRkm8A8t6FfpbMe36g?=
 =?iso-8859-1?Q?itJaFCJjubjun1zxut20q9t+BhkqkdmA/+dxXTMNHZ1QNp+HgP5caMAZZ4?=
 =?iso-8859-1?Q?b4U1GLrngxlvOrpAlEZfDrUStgvdChr0J9AYBepncvCfo85/MyqNeEJ7Jg?=
 =?iso-8859-1?Q?Ee1Lbg0ECdteDqTAyxU=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PH0PR11MB7635D14362CEFEC16235E2A9EDA12PH0PR11MB7635namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7635.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca21e8a-ccdf-471f-cd28-08dd6d35748c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 13:44:11.2059 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cia8AHRVfyUfCOz/pwLSgNI2wTwWGZ2cE/ET9Vg5q1Q7LzaY2ISlnzYPQcpYiwaG3DTWzhKYWvJVEy0bNx3BIBayBxASZK5V8hcb5FYT8139e0dHSeYBys/roSklULUW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5222
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

--_000_PH0PR11MB7635D14362CEFEC16235E2A9EDA12PH0PR11MB7635namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Justification: To address a hardware bug causing stability issues when RCS =
and multiple CCS operate simultaneously in dynamic load balancing mode, CCG=
 limited the CCS count to 1 as a software workaround. Many ECG customers ru=
n compute-only workloads without requiring rendering tasks. Therefore, it i=
s important to provide customers with a runtime configuration option to inc=
rease the CCS count for compute-only workloads, in order to meet the perfor=
mance requirements.


Acked-by: Usharani Ayyalasomayajula <usharani.ayyalasomayajula@intel.com>

Thanks,
Usha.
________________________________
From: Andi Shyti
Sent: Monday, March 24, 2025 18:59
To: intel-gfx; dri-devel
Cc: Tvrtko Ursulin; Joonas Lahtinen; Chris Wilson; Simona Vetter; Mehmood, =
Arshad; Mrozek, Michal; Andi Shyti; Andi Shyti
Subject: [PATCH v4 00/15] CCS static load balance

Hi,

Back in v3, this patch series was turned down due to community
policies regarding i915 GEM development. Since then, I have
received several requests from userspace developers, which I
initially declined in order to respect those policies.

However, with the latest request from UMD users, I decided to
give this series another chance. I believe that when a feature
is genuinely needed, our goal should be to support it, not to
dismiss user and customer needs blindly.

Here is the link to the userspace counterpart, which depends on
this series to function properly[*].

I've been refreshing and testing the series together with Arshad.

This patchset introduces static load balancing for GPUs with
multiple compute engines. It's a relatively long series.

To help with review, I've broken the work down as much as
possible in multiple patches.

To summarise:
- Patches 1 to 14 introduce no functional changes, aside from
  adding the 'num_cslices' interface.
- Patch 15 contains the core of the CCS mode setting, building
  on the earlier groundwork.

The updated approach focuses on managing the UABI engine list,
which controls which engines are exposed to userspace. Instead
of manipulating physical engines and their memory directly, we
now control exposure via this list.

Since v3, I've kept the changes in v4 to a minimum because there
wasn't a real technical review on the previous posting. I would
really appreciate it if this time all technical concerns could be
raised and discussed on the mailing list.

IGT tests for this work exist but haven't been submitted yet.

Thanks to Chris for the reviews, to Arshad for the work we've
done together over the past few weeks, and to Michal for his
invaluable input from the userspace side.

Thanks,
Andi

[*] https://github.com/intel/compute-runtime

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PATCHv3 -> PATCHv4
------------------
 - Rebase on top of the latest drm-tip
 - Do not call functions inside GEM_BUG_ONs, but call them
   explicitly (thanks Arshad).

PATCHv2 -> PATCHv3
------------------
 - Fix a NULL pointer dereference during module unload.
   In i915_gem_driver_remove() I was accessing the gt after the
   gt was removed. Use the dev_priv, instead (obviously!).
 - Fix a lockdep issue: Some of the uabi_engines_mutex unlocks
   were not correctly placed in the exit paths.
 - Fix a checkpatch error for spaces after and before parenthesis
   in the for_each_enabled_engine() definition.

PATCHv1 -> PATCHv2
------------------
 - Use uabi_mutex to protect the uabi_engines, not the engine
   itself. Rename it to uabi_engines_mutex.
 - Use kobject_add/kobject_del for adding and removing
   interfaces, this way we don't need to destroy and recreate the
   engines, anymore. Refactor intel_engine_add_single_sysfs() to
   reflect this scenario.
 - After adding engines to the rb_tree check that they have been
   added correctly.
 - Fix rb_find_add() compare function to take into accoung also
   the class, not just the instance.

RFCv2 -> PATCHv1
----------------
 - Removed gt->ccs.mutex
 - Rename m -> width, ccs_id -> engine in
   intel_gt_apply_ccs_mode().
 - In the CCS register value calculation
   (intel_gt_apply_ccs_mode()) the engine (ccs_id) needs to move
   along the ccs_mask (set by the user) instead of the
   cslice_mask.
 - Add GEM_BUG_ON after calculating the new ccs_mask
   (update_ccs_mask()) to make sure all angines have been
   evaluated (i.e. ccs_mask must be '0' at the end of the
   algorithm).
 - move wakeref lock before evaluating intel_gt_pm_is_awake() and
   fix exit path accordingly.
 - Use a more compact form in intel_gt_sysfs_ccs_init() and
   add_uabi_ccs_engines() when evaluating sysfs_create_file(): no
   need to store the return value to the err variable which is
   unused. Get rid of err.
 - Print a warnging instead of a debug message if we fail to
   create the sysfs files.
 - If engine files creation fails in
   intel_engine_add_single_sysfs(), print a warning, not an
   error.
 - Rename gt->ccs.ccs_mask to gt->ccs.id_mask and add a comment
   to explain its purpose.
 - During uabi engine creation, in
   intel_engines_driver_register(), the uabi_ccs_instance is
   redundant because the ccs_instances is already tracked in
   engine->uabi_instance.
 - Mark add_uabi_ccs_engines() and remove_uabi_ccs_engines() as
   __maybe_unused not to break bisectability. They wouldn't
   compile in their own commit. They will be used in the next
   patch and the __maybe_unused is removed.
 - Update engine's workaround every time a new mode is set in
   update_ccs_mask().
 - Mark engines as valid or invalid using their status as
   rb_node. Invalid engines are marked as invalid using
   RB_CLEAR_NODE(). Execbufs will check for their validity when
   selecting the engine to be combined to a context.
 - Create for_each_enabled_engine() which skips the non valid
   engines and use it in selftests.

RFCv1 -> RFCv2
--------------
Compared to the first version I've taken a completely different
approach to adding and removing engines. in v1 physical engines
were directly added and removed, along with the memory allocated
to them, each time the user changed the CCS mode (from the
previous cover letter).

Andi Shyti (15):
  drm/i915/gt: Avoid using masked workaround for CCS_MODE setting
  drm/i915/gt: Move the CCS mode variable to a global position
  drm/i915/gt: Allow the creation of multi-mode CCS masks
  drm/i915/gt: Refactor uabi engine class/instance list creation
  drm/i915/gem: Mark and verify UABI engine validity
  drm/i915/gt: Introduce for_each_enabled_engine() and apply it in
    selftests
  drm/i915/gt: Manage CCS engine creation within UABI exposure
  drm/i915/gt: Remove cslices mask value from the CCS structure
  drm/i915/gt: Expose the number of total CCS slices
  drm/i915/gt: Store engine-related sysfs kobjects
  drm/i915/gt: Store active CCS mask
  drm/i915: Protect access to the UABI engines list with a mutex
  drm/i915/gt: Isolate single sysfs engine file creation
  drm/i915/gt: Implement creation and removal routines for CCS engines
  drm/i915/gt: Allow the user to change the CCS mode through sysfs

 drivers/gpu/drm/i915/gem/i915_gem_context.c   |   3 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  28 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  23 --
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |   2 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |  62 ++-
 drivers/gpu/drm/i915/gt/intel_gt.c            |   3 +
 drivers/gpu/drm/i915/gt/intel_gt.h            |  12 +
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c   | 357 +++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h   |   5 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c      |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  19 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |   8 +-
 drivers/gpu/drm/i915/gt/selftest_context.c    |   6 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c  |   4 +-
 .../drm/i915/gt/selftest_engine_heartbeat.c   |   6 +-
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c  |   6 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  52 +--
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c      |   2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  22 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  18 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c       |   6 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c        |   4 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |   8 +-
 .../drm/i915/gt/selftest_ring_submission.c    |   2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c        |  14 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |  14 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c        |   2 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  14 +-
 drivers/gpu/drm/i915/gt/sysfs_engines.c       |  80 ++--
 drivers/gpu/drm/i915/gt/sysfs_engines.h       |   2 +
 drivers/gpu/drm/i915/i915_cmd_parser.c        |   2 +
 drivers/gpu/drm/i915/i915_debugfs.c           |   4 +
 drivers/gpu/drm/i915/i915_drv.h               |   5 +
 drivers/gpu/drm/i915/i915_gem.c               |   4 +
 drivers/gpu/drm/i915/i915_perf.c              |   8 +-
 drivers/gpu/drm/i915/i915_pmu.c               |  11 +-
 drivers/gpu/drm/i915/i915_query.c             |  21 +-
 37 files changed, 648 insertions(+), 193 deletions(-)

--
2.47.2

--_000_PH0PR11MB7635D14362CEFEC16235E2A9EDA12PH0PR11MB7635namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Justification: To address a hardware bug causing stability issues when RCS =
and multiple CCS operate simultaneously in dynamic load balancing mode, CCG=
 limited the CCS count to 1 as a software workaround. Many ECG customers ru=
n compute-only workloads without
 requiring rendering tasks. Therefore, it is important to provide customers=
 with a runtime configuration option to increase the CCS count for compute-=
only workloads, in order to meet the performance requirements.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Acked-by: <span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif=
;">Usharani Ayyalasomayajula &lt;usharani.ayyalasomayajula@intel.com&gt;</s=
pan></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Usha.</div>
<hr style=3D"display: inline-block; width: 98%;">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Andi Shyti<br>
<b>Sent:</b>&nbsp;Monday, March 24, 2025 18:59<br>
<b>To:</b>&nbsp;intel-gfx; dri-devel<br>
<b>Cc:</b>&nbsp;Tvrtko Ursulin; Joonas Lahtinen; Chris Wilson; Simona Vette=
r; Mehmood, Arshad; Mrozek, Michal; Andi Shyti; Andi Shyti<br>
<b>Subject:</b>&nbsp;[PATCH v4 00/15] CCS static load balance </span>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">Hi,<br>
<br>
Back in v3, this patch series was turned down due to community<br>
policies regarding i915 GEM development. Since then, I have<br>
received several requests from userspace developers, which I<br>
initially declined in order to respect those policies.<br>
<br>
However, with the latest request from UMD users, I decided to<br>
give this series another chance. I believe that when a feature<br>
is genuinely needed, our goal should be to support it, not to<br>
dismiss user and customer needs blindly.<br>
<br>
Here is the link to the userspace counterpart, which depends on<br>
this series to function properly[*].<br>
<br>
I've been refreshing and testing the series together with Arshad.<br>
<br>
This patchset introduces static load balancing for GPUs with<br>
multiple compute engines. It's a relatively long series.<br>
<br>
To help with review, I've broken the work down as much as<br>
possible in multiple patches.<br>
<br>
To summarise:<br>
- Patches 1 to 14 introduce no functional changes, aside from<br>
&nbsp; adding the 'num_cslices' interface.<br>
- Patch 15 contains the core of the CCS mode setting, building<br>
&nbsp; on the earlier groundwork.<br>
<br>
The updated approach focuses on managing the UABI engine list,<br>
which controls which engines are exposed to userspace. Instead<br>
of manipulating physical engines and their memory directly, we<br>
now control exposure via this list.<br>
<br>
Since v3, I've kept the changes in v4 to a minimum because there<br>
wasn't a real technical review on the previous posting. I would<br>
really appreciate it if this time all technical concerns could be<br>
raised and discussed on the mailing list.<br>
<br>
IGT tests for this work exist but haven't been submitted yet.<br>
<br>
Thanks to Chris for the reviews, to Arshad for the work we've<br>
done together over the past few weeks, and to Michal for his<br>
invaluable input from the userspace side.<br>
<br>
Thanks,&nbsp;<br>
Andi<br>
<br>
[*] <a href=3D"https://github.com/intel/compute-runtime" id=3D"OWA2e6aef7c-=
7fd5-0d1c-0a12-c8b20bf1fe82" class=3D"OWAAutoLink" data-auth=3D"NotApplicab=
le">
https://github.com/intel/compute-runtime</a><br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
PATCHv3 -&gt; PATCHv4<br>
------------------<br>
&nbsp;- Rebase on top of the latest drm-tip<br>
&nbsp;- Do not call functions inside GEM_BUG_ONs, but call them<br>
&nbsp;&nbsp; explicitly (thanks Arshad).<br>
<br>
PATCHv2 -&gt; PATCHv3<br>
------------------<br>
&nbsp;- Fix a NULL pointer dereference during module unload.<br>
&nbsp;&nbsp; In i915_gem_driver_remove() I was accessing the gt after the<b=
r>
&nbsp;&nbsp; gt was removed. Use the dev_priv, instead (obviously!).<br>
&nbsp;- Fix a lockdep issue: Some of the uabi_engines_mutex unlocks<br>
&nbsp;&nbsp; were not correctly placed in the exit paths.<br>
&nbsp;- Fix a checkpatch error for spaces after and before parenthesis<br>
&nbsp;&nbsp; in the for_each_enabled_engine() definition.<br>
<br>
PATCHv1 -&gt; PATCHv2<br>
------------------<br>
&nbsp;- Use uabi_mutex to protect the uabi_engines, not the engine<br>
&nbsp;&nbsp; itself. Rename it to uabi_engines_mutex.<br>
&nbsp;- Use kobject_add/kobject_del for adding and removing<br>
&nbsp;&nbsp; interfaces, this way we don't need to destroy and recreate the=
<br>
&nbsp;&nbsp; engines, anymore. Refactor intel_engine_add_single_sysfs() to<=
br>
&nbsp;&nbsp; reflect this scenario.<br>
&nbsp;- After adding engines to the rb_tree check that they have been<br>
&nbsp;&nbsp; added correctly.<br>
&nbsp;- Fix rb_find_add() compare function to take into accoung also<br>
&nbsp;&nbsp; the class, not just the instance.<br>
<br>
RFCv2 -&gt; PATCHv1<br>
----------------<br>
&nbsp;- Removed gt-&gt;ccs.mutex<br>
&nbsp;- Rename m -&gt; width, ccs_id -&gt; engine in<br>
&nbsp;&nbsp; intel_gt_apply_ccs_mode().<br>
&nbsp;- In the CCS register value calculation<br>
&nbsp;&nbsp; (intel_gt_apply_ccs_mode()) the engine (ccs_id) needs to move<=
br>
&nbsp;&nbsp; along the ccs_mask (set by the user) instead of the<br>
&nbsp;&nbsp; cslice_mask.<br>
&nbsp;- Add GEM_BUG_ON after calculating the new ccs_mask<br>
&nbsp;&nbsp; (update_ccs_mask()) to make sure all angines have been<br>
&nbsp;&nbsp; evaluated (i.e. ccs_mask must be '0' at the end of the<br>
&nbsp;&nbsp; algorithm).<br>
&nbsp;- move wakeref lock before evaluating intel_gt_pm_is_awake() and<br>
&nbsp;&nbsp; fix exit path accordingly.<br>
&nbsp;- Use a more compact form in intel_gt_sysfs_ccs_init() and<br>
&nbsp;&nbsp; add_uabi_ccs_engines() when evaluating sysfs_create_file(): no=
<br>
&nbsp;&nbsp; need to store the return value to the err variable which is<br=
>
&nbsp;&nbsp; unused. Get rid of err.<br>
&nbsp;- Print a warnging instead of a debug message if we fail to<br>
&nbsp;&nbsp; create the sysfs files.<br>
&nbsp;- If engine files creation fails in<br>
&nbsp;&nbsp; intel_engine_add_single_sysfs(), print a warning, not an<br>
&nbsp;&nbsp; error.<br>
&nbsp;- Rename gt-&gt;ccs.ccs_mask to gt-&gt;ccs.id_mask and add a comment<=
br>
&nbsp;&nbsp; to explain its purpose.<br>
&nbsp;- During uabi engine creation, in<br>
&nbsp;&nbsp; intel_engines_driver_register(), the uabi_ccs_instance is<br>
&nbsp;&nbsp; redundant because the ccs_instances is already tracked in<br>
&nbsp;&nbsp; engine-&gt;uabi_instance.<br>
&nbsp;- Mark add_uabi_ccs_engines() and remove_uabi_ccs_engines() as<br>
&nbsp;&nbsp; __maybe_unused not to break bisectability. They wouldn't<br>
&nbsp;&nbsp; compile in their own commit. They will be used in the next<br>
&nbsp;&nbsp; patch and the __maybe_unused is removed.<br>
&nbsp;- Update engine's workaround every time a new mode is set in<br>
&nbsp;&nbsp; update_ccs_mask().<br>
&nbsp;- Mark engines as valid or invalid using their status as<br>
&nbsp;&nbsp; rb_node. Invalid engines are marked as invalid using<br>
&nbsp;&nbsp; RB_CLEAR_NODE(). Execbufs will check for their validity when<b=
r>
&nbsp;&nbsp; selecting the engine to be combined to a context.<br>
&nbsp;- Create for_each_enabled_engine() which skips the non valid<br>
&nbsp;&nbsp; engines and use it in selftests.<br>
<br>
RFCv1 -&gt; RFCv2<br>
--------------<br>
Compared to the first version I've taken a completely different<br>
approach to adding and removing engines. in v1 physical engines<br>
were directly added and removed, along with the memory allocated<br>
to them, each time the user changed the CCS mode (from the<br>
previous cover letter).<br>
<br>
Andi Shyti (15):<br>
&nbsp; drm/i915/gt: Avoid using masked workaround for CCS_MODE setting<br>
&nbsp; drm/i915/gt: Move the CCS mode variable to a global position<br>
&nbsp; drm/i915/gt: Allow the creation of multi-mode CCS masks<br>
&nbsp; drm/i915/gt: Refactor uabi engine class/instance list creation<br>
&nbsp; drm/i915/gem: Mark and verify UABI engine validity<br>
&nbsp; drm/i915/gt: Introduce for_each_enabled_engine() and apply it in<br>
&nbsp;&nbsp;&nbsp; selftests<br>
&nbsp; drm/i915/gt: Manage CCS engine creation within UABI exposure<br>
&nbsp; drm/i915/gt: Remove cslices mask value from the CCS structure<br>
&nbsp; drm/i915/gt: Expose the number of total CCS slices<br>
&nbsp; drm/i915/gt: Store engine-related sysfs kobjects<br>
&nbsp; drm/i915/gt: Store active CCS mask<br>
&nbsp; drm/i915: Protect access to the UABI engines list with a mutex<br>
&nbsp; drm/i915/gt: Isolate single sysfs engine file creation<br>
&nbsp; drm/i915/gt: Implement creation and removal routines for CCS engines=
<br>
&nbsp; drm/i915/gt: Allow the user to change the CCS mode through sysfs<br>
<br>
&nbsp;drivers/gpu/drm/i915/gem/i915_gem_context.c&nbsp;&nbsp; |&nbsp;&nbsp;=
 3 +<br>
&nbsp;.../gpu/drm/i915/gem/i915_gem_execbuffer.c&nbsp;&nbsp;&nbsp; |&nbsp; =
28 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_engine_cs.c&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 23 --<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_engine_types.h&nbsp; |&nbsp;&nbsp; 2 +<=
br>
&nbsp;drivers/gpu/drm/i915/gt/intel_engine_user.c&nbsp;&nbsp; |&nbsp; 62 ++=
-<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_gt.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_gt.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 12 +<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c&nbsp;&nbsp; | 357 +++++++=
++++++++++-<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h&nbsp;&nbsp; |&nbsp;&nbsp;=
 5 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_gt_sysfs.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 2 +<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_gt_types.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 19 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/intel_workarounds.c&nbsp;&nbsp; |&nbsp;&nbsp;=
 8 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_context.c&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 6 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_engine_cs.c&nbsp; |&nbsp;&nbsp; 4 +-=
<br>
&nbsp;.../drm/i915/gt/selftest_engine_heartbeat.c&nbsp;&nbsp; |&nbsp;&nbsp;=
 6 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_engine_pm.c&nbsp; |&nbsp;&nbsp; 6 +-=
<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_execlists.c&nbsp; |&nbsp; 52 +--<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_gt_pm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 2 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_hangcheck.c&nbsp; |&nbsp; 22 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_lrc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 18 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_mocs.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 6 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_rc6.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 4 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_reset.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 8 +-<br>
&nbsp;.../drm/i915/gt/selftest_ring_submission.c&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 2 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_rps.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 14 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_timeline.c&nbsp;&nbsp; |&nbsp; 14 +-=
<br>
&nbsp;drivers/gpu/drm/i915/gt/selftest_tlb.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;.../gpu/drm/i915/gt/selftest_workarounds.c&nbsp;&nbsp;&nbsp; |&nbsp; =
14 +-<br>
&nbsp;drivers/gpu/drm/i915/gt/sysfs_engines.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 80 ++--<br>
&nbsp;drivers/gpu/drm/i915/gt/sysfs_engines.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 2 +<br>
&nbsp;drivers/gpu/drm/i915/i915_cmd_parser.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 2 +<br>
&nbsp;drivers/gpu/drm/i915/i915_debugfs.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +<br>
&nbsp;drivers/gpu/drm/i915/i915_drv.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 5 +<br>
&nbsp;drivers/gpu/drm/i915/i915_gem.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +<br>
&nbsp;drivers/gpu/drm/i915/i915_perf.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 +-<br>
&nbsp;drivers/gpu/drm/i915/i915_pmu.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 11 +-<br>
&nbsp;drivers/gpu/drm/i915/i915_query.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 21 +-<br>
&nbsp;37 files changed, 648 insertions(+), 193 deletions(-)<br>
<br>
--<br>
2.47.2<br>
</div>
</body>
</html>

--_000_PH0PR11MB7635D14362CEFEC16235E2A9EDA12PH0PR11MB7635namp_--
