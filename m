Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10E6A252DC
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 08:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C06F10E2AE;
	Mon,  3 Feb 2025 07:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7nie8/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646B310E2AE;
 Mon,  3 Feb 2025 07:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738566804; x=1770102804;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=udBABZtzaEDXKBgkGycw97oFqyIJ1dM2DjDgCYHA+X4=;
 b=c7nie8/nJhybG7sKIIz45yEUTqbnirWIe+2xZ6nc42Yq5HBFqjMBwvuF
 sADrA8LWRmtkmVlEgxy+aToRJP/swvsWGTTjIkbIFIxAolil1Qr0pvpwy
 55/fGtypHwSMmnMTMJUk2FJ3owZcDSW0qOSfG2qc7RCcktabMF5//kSrk
 Fsdw62r29DK6Lfatd13lj/UcjxJCjJXc6Xm3xxYnqhZwogGazJi63K/5/
 wk9Rn1eoS9nB7UxzjwijCxbqNakSyvzrVGsPv2/BHmzxBbCcbaHb4Q5OE
 NRCya0SQ2G0QIo15So8PIEnJXaEIM/UPcSVp8b5mngl8467Azf+amgjB0 w==;
X-CSE-ConnectionGUID: cOtT6OW2TvudOKSfjqsiDA==
X-CSE-MsgGUID: GBy2Wba8QjatnhVZjNDHLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49306452"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="49306452"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 23:13:24 -0800
X-CSE-ConnectionGUID: 2I03TI4fRDmM5DXG8iUCqA==
X-CSE-MsgGUID: 1qpO59HQRZimJ6aEd+aC9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="115188455"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2025 23:13:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Feb 2025 23:13:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Feb 2025 23:13:22 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Feb 2025 23:13:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBtcgw2gVgob9/bJckZOn41jQHIMUcUFYk4q6dL4VydXvI/y48MVTXcOSWv6s5cmNL9D7/3nORsmEvCEX3JKyTojHDQVpgFUJk+RgELkIW2ewdpBeGwG9kNKXSLRQ7jLT8lrLNXAxqQKW9t2t6XdlPJItJDKxZVg8jLCMy8Vh1vAZSfhos4zfn9yJEbscrt9WDwDl+5FYvQZsys1eu45Ed5bbaYiN88exEYGh5OiQGmITgGX7c+AJTKyrCxMgHGteQZZvYgV7PqR7tK0DBfWt/5hTyYJB7tm2EUjJ06DatB/RdoOI8mxuBuxD5CaMV2fdWn/ecCbI2zoXqy++K5kdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udBABZtzaEDXKBgkGycw97oFqyIJ1dM2DjDgCYHA+X4=;
 b=alibwewNN6tvXSofd2Jtvuj2KRxnQcDxasYMK5JmPfNaj0P9ORIPwQzmlTWuObEBUhzFkpG6YO+HOMkQDd+9tTraWuxhz16UKGNeHQuEb1pvcPoZvPmdLggDHtSRBTNk6wdd7jGK1PW6ETkA1RD7xakMzAYy0fqsf2F2ZSEGd1un+j3d5nsAHpLCgOetjalhNxYbmjMKcsVGCeiSLx/XB3hB5N8auKychFHkvT1rRqlJz0v3R8+x+Z0qz7qSfgmR4HGLlX4NMFkWX3BgLeYUd7jlORbQ9vihfW4bvk7VcplBIFbVc64D7fcOrL4OJPpEi0ky4UZsAgmtjAH3IDIeDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7343.namprd11.prod.outlook.com (2603:10b6:208:424::21)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 07:13:07 +0000
Received: from IA1PR11MB7343.namprd11.prod.outlook.com
 ([fe80::8fd2:c734:bda9:b14b]) by IA1PR11MB7343.namprd11.prod.outlook.com
 ([fe80::8fd2:c734:bda9:b14b%6]) with mapi id 15.20.8398.018; Mon, 3 Feb 2025
 07:13:07 +0000
From: "Kao, Ben" <ben.kao@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH 7/7] drm/i915/backlight: Enable Nits based brightness
Thread-Topic: [PATCH 7/7] drm/i915/backlight: Enable Nits based brightness
Thread-Index: AQHbbiN9NAP5+THlP0iqfN1NS+QE1LM1OdCQ
Date: Mon, 3 Feb 2025 07:13:07 +0000
Message-ID: <IA1PR11MB7343E35123E102051D9708F2EDF52@IA1PR11MB7343.namprd11.prod.outlook.com>
References: <20250124054631.1796456-1-suraj.kandpal@intel.com>
 <20250124054631.1796456-8-suraj.kandpal@intel.com>
In-Reply-To: <20250124054631.1796456-8-suraj.kandpal@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7343:EE_|SN7PR11MB6775:EE_
x-ms-office365-filtering-correlation-id: b18d98f4-b6e9-4eb7-6890-08dd44223564
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?CARjGxCnDqf68hQrxQsX5TrpOHSVyK9oKxOLcZ+Jpa01eSlSv7YA9adx/Yhy?=
 =?us-ascii?Q?0ZTxUrvp5bbqTAZAf15awbn0mkhq7rWRVizNQcTxBN3PNp0nJeFsmKzjES1D?=
 =?us-ascii?Q?VDQJym9S8m2fT6eudvVT8p+3SqaSTmaVIQZoTJY7fbdYpeQZTq+5kpjm+aTg?=
 =?us-ascii?Q?DqtrIhPQBeCvbaqSZRkEx7DGtCoqtoUdpikx1ob515MhMfId9xmyZBT20c7c?=
 =?us-ascii?Q?ZB8AZxEUiAgMcX3qbDCBJpT9Oe9ZnZBeRAF6RPVzb7Q6lmUsHopfegoPyfWB?=
 =?us-ascii?Q?Yyk54Uku9OFU3Ip8dj55p7G21RgCamNX6fobVw9qvPRcLtV27Bj7ewqSv9Q7?=
 =?us-ascii?Q?F0gIpYVyqO6jwhiF+6WOsCDRMwsT//gdDTnchc16Zkwdwz6w63Aiq6U3c4Po?=
 =?us-ascii?Q?fyb1nxGHWpYIzeBQ0nrpCG4CeycLMwee5CuOeBTrlDrx6gDU012mAUzqnUSb?=
 =?us-ascii?Q?GSW4SZaVIaXkM22PycYRWOPmiIfXhTFcUlHRfVs/T9YJa6oiqVMrccRQ+/Er?=
 =?us-ascii?Q?kwp2n6klENZVuo7K6B3Tim8Di22exi6+FVq47U/cpw9Z1wpNROFEkF9wTMlR?=
 =?us-ascii?Q?safnonwUtMQUrZyqoMIUUqjce0azXQXc463Ku2HahNzmzyWTz/th0VpIpWwe?=
 =?us-ascii?Q?OUWM0QRNTz0c2L4ab4TX/4cXOrlHsUrNNwnGBjQ76lfCFKuFa3xbFq93rBl5?=
 =?us-ascii?Q?Ml9P/L6dC1zBSx+kdTtqtTMTSPnm3Q30vs3ABUMwsaC34opkVaBudJmJ/VJP?=
 =?us-ascii?Q?2ZHMlS2L5piSrpMUDkXUaTxtdmB60Jqmauj9T0HVrCQ+J+o4mnyFnSM2LJ/S?=
 =?us-ascii?Q?SGl0tn1ATpNBIJWf89zAEWhhSmgNhrJ2wVWICNgMRh8cwmsPXNhhlJbE0vSP?=
 =?us-ascii?Q?n7rD+MC8yg+tyRdgvky3zaMApjC1lLVunHmK2RFyoTAerudpKdCaJ9baJfBt?=
 =?us-ascii?Q?7c0Ra7a2LRO0XBIw8T7tby5uyAAYLBfMHvfXZzUXCEklLuE0NGFlToo6Npu3?=
 =?us-ascii?Q?EaUct9mCIQTkrNPceVEutUjspJleCRr0gTAQk0AUnlG1wgppxiYph95AsJzH?=
 =?us-ascii?Q?SArYda3R3Vlp7VZi8/XJ4givfjmgZ77H7tQjN8es9T3OgGPvmHjcPLaMcKT+?=
 =?us-ascii?Q?TfqJfsVgMBCrIXBnd1LsV0EZ5nOciox+gA7LzQoGe0bbutULU8HV+ZjiXQud?=
 =?us-ascii?Q?UUFa7M53bIWsddnSRBWGUtqFIySP4483lbffdKK12MhMhLHeqfeap/H0NGck?=
 =?us-ascii?Q?SNvy3DTSQ1O7QqU0yORr0pdVnigEGfbe0Iq0uqwovQ9XpR4x+yxtOjw2rc9y?=
 =?us-ascii?Q?bxlBAhtvHcBgIldeXnGT3ThAESYK6aErsCmDxWyQ46uUd5ag7Dl1poDsgZlK?=
 =?us-ascii?Q?7UIVQ56U7CnMVk7ODiUedNlH8MNwoLIz1aTE1fEzgswf/TMS55T8JZZ0S02B?=
 =?us-ascii?Q?n1l9oo1nZUUw0EdSmg2cAk8341+YrvBK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7343.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NcEneWPHSqjeTB3r1XZPc3LQVAMBF1eUWLk1L6DuRmHiNznp4FLEPEx1wGZ6?=
 =?us-ascii?Q?UkwrzM6IINRPCBMkug6xpA6dhwZgeAUkzDp49xoAJ5nDUb/JUDS5DLg2ZJiD?=
 =?us-ascii?Q?TlCM+omfX/TpDnupL62hyWUBcHIELh3sWkxUIQPl5UHMOstIy9SrXbfhDNHz?=
 =?us-ascii?Q?XQeA1o7+deANeWldTaatlqkRlWJ6wTKlq8LzD3+PRzo5/bZXp4irFDImLnZY?=
 =?us-ascii?Q?X9Lw3KNqWnhczgh48Q8bNv5ugJbRdkEwqJ00GWX3NpQAd3V/d91ZYhr5n1D/?=
 =?us-ascii?Q?QS9IY0MFRs83k+bE2uhUNcywDpQ2A2gSl88ct6nzfEuCzGwB1FTMaKuTFWOt?=
 =?us-ascii?Q?ljVCvJmLrf/lGSKgn23Aer0uJQ86d8uqgPgTeQd7I2y66NTQiOCWfMn/EbdS?=
 =?us-ascii?Q?MOk+syldKxRC1LiwOdkThLdS0QuzWgFKjYqLJ8xQx14wZG2gggR0k+UTnZMI?=
 =?us-ascii?Q?gBLwGpUrX81CdSmbSE4cXEdMuhEVfSWT+O10UeVew9tX1bOQr9LM0XeeGgFD?=
 =?us-ascii?Q?svg+YQ1QjN9+sCg2IY6+IKiZ/MlBfAS6lqPQSMwNc0iuxFMIemhVa+SAzxfa?=
 =?us-ascii?Q?gB+bywiUVo8AhEZaBFhJ2T7YEfnNt7zzqRR/kVv83ojpXfc7SEcS1pMulUr0?=
 =?us-ascii?Q?Pb40EVnnC+hvsTcvvfzz2M2WqQo6PKKIOi6A+OZuqHO1pnLKyi0tm4AjpSGe?=
 =?us-ascii?Q?SFjJbjXKIYgt20j64Y0DepjFNYmJYTt2xMDo6tUMAoZFIeAo120esDjvPHAX?=
 =?us-ascii?Q?8rsdDL8L6pLBVJnILMj5sYyMjh1J3tTBuo2YViHMV9f6Qmg5Sptm8XqBVQUE?=
 =?us-ascii?Q?ndeHFLxGrwi/7ASSOiQuT+BxOJ/LmwI1VEt2iA9Be/nO57FOYCBzDiuRqb43?=
 =?us-ascii?Q?SVHFsVSYMdP0tjfK5N40PtwbqOSE5m5db5axCw63X/LGiSgCDHK0vq6XNzeG?=
 =?us-ascii?Q?M29WHT3rmaWh+TR84K/hUxWjp8rZgkA/eb6is88BpmfNukDBOZ8irGqOmFoz?=
 =?us-ascii?Q?D5og8V9pmXB/CZ1NQqZBwGJCwdSotiH83P8QwIBOAVV6iIUv1FsvGwkiuDrK?=
 =?us-ascii?Q?QyFjnBPLXohkCtMf3MdgmymIZad9SfT1GRuPiT8HZtQRJEb6kLKuNvMDoTy4?=
 =?us-ascii?Q?4jB5KGWrfilENQPCiGsBbJSF9gqQy/78CUtbFQaXLOvB6eiCwSlXzNUo2G7j?=
 =?us-ascii?Q?Ahx5WK8MpdbvfCuBYyg9wAtjxfHgSNazPWSbjBjukYWjG+1PldnMtPLfUdUC?=
 =?us-ascii?Q?A9iRvzjQVMkAlcYErXad9UL6X0164k4PF2GRz5MrUzNPUDdTFaAzjHeRMOCE?=
 =?us-ascii?Q?X0W+ddMb21aSgqkwm0+EpS672VCsP/woctMnZWMSAVlbnbCES5lEpXmyb73v?=
 =?us-ascii?Q?yT2U1+bRf/lNGux9NI9akLT0ab0GOUjEZ2E7ynjT9PWUX/hVX/XnJNdxtCb6?=
 =?us-ascii?Q?Z10buEFAWMU0NAblicumqh/PBYq3btdz7c3utY/npmCdj6RDc2ta9UM59udL?=
 =?us-ascii?Q?Z7rG3XFfIrPZgiK5zxvsV/KZQTFMcTGeuWl4Y8FI0KmGe4FtNsqnBTZOFZuw?=
 =?us-ascii?Q?s2grYVsP8TKhYV/sEew=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7343.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18d98f4-b6e9-4eb7-6890-08dd44223564
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 07:13:07.1429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bHf478BFoVhEgK5ONtOahqYGxMtUhVIX8q6eoIKZOQjL8MPr4Qyqi4JX4vQo16uokSpum+J/rJTvHp3fWXa17w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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

This patch works as expected with 6.13.0-rc7 on Dell Bolan.

Tested-by: Ben Kao <ben.kao@intel.com>
