Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E59AE94B5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 05:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2528A10E831;
	Thu, 26 Jun 2025 03:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkopIbdG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1207110E036;
 Thu, 26 Jun 2025 03:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750909811; x=1782445811;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=13FSA1tJcfAW4r61tjxcAKxzvGVLsmSkzzTUfB5vZZE=;
 b=PkopIbdGkdlMvwkWeYixcCzCX20RtfdYLJ5/pKCnsoW2mGiV/NDni6ed
 pXeEcpcpgpbS5uYMUVnQ9Ep9xX7LeUH9r97XgVIBbM7mVRKTnKAn0hoaR
 nKePvtI7MF+QAtb218U7R1H23jczAASaFSTJua38YIC+VCPcs9NlH3oj4
 gEMemJPM6eV1BbxtsMB5Cvd0/E6IPyRgiIp2WpbKfvQKnu83hLCLwgTWk
 Dm1D3Yce3lfkQahXTrdVNSFTEoLJy9ucRrhCd2dHBMnqtdBo/JCxiyxat
 RTXogEyTi80SCl5c/3HztMltNCsKOW3f5lTd+jQ3GR6UToSKlOK2k9ltu A==;
X-CSE-ConnectionGUID: A1CpPL8USS2jobkZ2ChXpg==
X-CSE-MsgGUID: zU4/sCXdSkGwDA51r2YeYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53264812"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="53264812"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 20:50:09 -0700
X-CSE-ConnectionGUID: CVxb29VZRiu8Y3X+z6ZWqQ==
X-CSE-MsgGUID: 7+vQpwyPRUy9vpfSkrcGGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="152894628"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 20:50:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 20:50:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 20:50:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 20:50:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2Ns6aa2jKkGkefbz+ugcvWNXcAGZjfbzvhdHGAw5r6tQXJ4q4s1y80ESyBCahyhxU8GzI01W/jYu1Z+o7j+XywPpvYk0//56tPa+Jz05JFmbW4K90tMIzsDlN3WAKy04KOsbhq/NkwqQ1Bdbnm/14U8Lwqnnq/72tO3V/T0mHVBFZ8+8lnCzn7M8/5RKpZANjiUZaSBFzxdk21I5bOSYcpgZr9NMJ7v3MOB4Znyql4S/K8lCu/92oPsd0sSqOnPteoJmsMJhQO633QbVrlFRrw74uXDWd0gBhzk/tzeX6Qb5BBYZRpqa6Kca2182r8QWzYIZkgNUKwHwjmkm7gfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSFEhLyjZ7MIxIdbunIdyiwWaCc30gfwDpyZbw9nioQ=;
 b=U7Dna7NHutijnXJ840dqzbmxImbxXtm/4qzFxG6JMaMgbkptjCH55uAO5oCiuz2tmzJDFrlA11A3CZ6uyBG3sxjvZ5TPB83b36NcMLteV8dL/mYXm5J9+fJkqsepCm7N+9jQhCVz3mPbd4Z+MHC98fiMJEc/YV+ukFZRAU1ztz9qTsQdAkMQvtA7jgyQ6VrXJzFKleotwsE3WbcPRIYXhNpf9kRmW0rf84Enu9GHRedS6ByBOs4h1JoyH2YRwpzAhiRsWwxAK4KPzYP2L4oc1d6ulYPZh+q98pvRVUwe4RcbAxCdSQ2IdC+aoPBbfUrv4o4AR6uvcPU1HE/JQZRsAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by MN6PR11MB8104.namprd11.prod.outlook.com (2603:10b6:208:46c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 03:50:06 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%4]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 03:50:06 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH v4 02/10] mei: late_bind: add late binding component driver
Thread-Topic: [PATCH v4 02/10] mei: late_bind: add late binding component
 driver
Thread-Index: AQHb5fIndpRBhJ5fPkCmN63maa21qbQUwi8Q
Date: Thu, 26 Jun 2025 03:50:06 +0000
Message-ID: <CY5PR11MB6211FB957C9078592ABB49C6957AA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
In-Reply-To: <20250625170015.33912-3-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|MN6PR11MB8104:EE_
x-ms-office365-filtering-correlation-id: b20ef4b2-8dd3-48e5-43d0-08ddb4648a5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rDEB/5qtJgWRvqeFJKqY/eBQK397y3eMPgDaGqmvwve5SIFYvwGwAyZCIqdP?=
 =?us-ascii?Q?TwbmvVDPDmNt9DJdRsEicZGjbpI6ZR96S0JKOiwDGsINwf4mfZL/joubeoZU?=
 =?us-ascii?Q?mTqjsWyP/uMenRtp7zh0DzmSeUL7rQxEsFTuLgnUF7xDdzF/PpZRmEhnJXII?=
 =?us-ascii?Q?LphswwOHQxdDnwyrfrqBMFREME7K8Y5ozzIJ6FwRCfPujXoSdbb6kdr44rwY?=
 =?us-ascii?Q?JMka5/KDXolJK+GwUc8gpijbbE4uT/gnSQmpK0h+dmrot/vcF798mu6/GKIu?=
 =?us-ascii?Q?bLUajvrkvtF/5yJCYCbRTKwxFqtFJHUrymW442fUIjZQsXn29vYKlaWG8Dlg?=
 =?us-ascii?Q?np2Ir2KG5aM6W/VgLOVnnUkG0t+M7AApRQBWULl585n5dy+XoODNbDkfcEIa?=
 =?us-ascii?Q?+04K1ml9VG0Kj8qqaJWp8oVO369Q2zXrFNNMBrxZBiIL7qM/wJSInjl8E/YW?=
 =?us-ascii?Q?r+dlw05+7W29vEnsnS6WCQx5M30pqpuFl4PZ5Gis2YgEJH5FXVJDkq7SjEN0?=
 =?us-ascii?Q?zUXR+iD7MVYUBTEnFFKttGuMHl1kF/7f5MiEXvqBJ/x/twNSdaF2HDzhywU5?=
 =?us-ascii?Q?K59bsrtV+ZIZzjus9TVA87NS8okwDRywSE6EdMyheaAOTAEnS0eSuqbqRh5x?=
 =?us-ascii?Q?CvuTYJN/uUKzvfsTK5DS3p6TIXeDWJEzkgUpfR5J4xGz5P8VPgxHXeQN7Lmh?=
 =?us-ascii?Q?di40Xe/29VvKKmENSsQ7aGJPJyLvgs4VBvGYTN21j7blSIBgF8uoad4kzx4x?=
 =?us-ascii?Q?fNDSchACqlhhvMd5kbJOCZF5/0wbO3S+oIV1BPAlNmLAC+chWjmkTtIZ8g1b?=
 =?us-ascii?Q?BFq7OA410ERkcDSEviIjG9wl2mUMzSHLCZXdeJh/YkphQoncl2RP3mdvemO1?=
 =?us-ascii?Q?HtdeUoEva6wbxtV3DLW9rotlGUtVZY9il4oh5/GkwM5QHFeA7pqwnjzgadTj?=
 =?us-ascii?Q?T2kZuL7lC/4TsWIEIHsGEqeTXfMy2MWOqnZujyDKcndj89g9Wjxr4ADSmcGg?=
 =?us-ascii?Q?JoMRn/7VzXmNgjEl2t+/tCvVuwNq2Cu3HiIm/YJ8Ef1/JDWgAKomjdJp83JJ?=
 =?us-ascii?Q?TD4gnIiMZpEcMfZwv8w8vFHu5KQ93IF201sxrUb/piW0yssqyBJiIqiVfBjn?=
 =?us-ascii?Q?Az55VUv9qT6Tj3jScWcz+Xk2dYLcxUO2Jji8cBfu02i1tPWuWHTWcQnq3129?=
 =?us-ascii?Q?Zq+/XjVCGgmJdwPMZxMUHWnEx0a1m4zKJYihuorOU9jUr9traNnEdw4/9z8a?=
 =?us-ascii?Q?ODK7dpNTAEl8faNOhOsQuMywa8nw4qC7y/wXK0301tdjkCcYqyE+DWivQ4/r?=
 =?us-ascii?Q?HBzInJ9ZKFCFDyHV7SBz8D+nlLrOOMsVsvp7kapwjB8YUXDKZ3FDLfnRJ8t1?=
 =?us-ascii?Q?52r4VKkHJgsWdj0cv0AlN16vrXt5bKBDvHnIcP6QxNsE4T2GfS25yBhnvCCx?=
 =?us-ascii?Q?JaJKPz9fSvEVoueQaVxjB8BdEP4I1QW2h+OZPTN8hBLNib7eMN7yoV+HGcsp?=
 =?us-ascii?Q?44VUV2k7EcXh1H0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YNQ9maKw0tKoE+V6u6lglx0A4/XjpQk2nyLMvwRtXO0TAXR3h0r7tEmenWSI?=
 =?us-ascii?Q?N2OncVqk+RmjV0a/gHUBebmZA9tOKARPGOfKXVxjRANEkqWIkIfsUxXTODYU?=
 =?us-ascii?Q?ImCb/28+lW1c4uZSeZ8Au9EjFAaqbpgDK0e564tcHlwtnw7XSJ4PuZIfRXMF?=
 =?us-ascii?Q?Lmkv71slgI6knCMU+NfEIV8ImXS3txqQZR3eDqEH5IehkMkmpM3cGlx0YEjw?=
 =?us-ascii?Q?OQ9MLcUsd6EaERGjSwrbh5JMK2sg1wt0mW0+BXqkhFzJsO3zQALTzqZQj9l+?=
 =?us-ascii?Q?UT1pSbrqP7Vxcss7O4ewnd1LC+b9qa+EorCU6bfNAZ7x4RBl7OUQbYIKR3nV?=
 =?us-ascii?Q?bCnXTAZNqA0YKJ07iY+OhdxQDFRkDx7UqT0Hqp1LNkPetUSuCIZ+pcXxboax?=
 =?us-ascii?Q?LGKduKeH8Qd2YUv9rsFaaHaWd6yXAmNVectHd5nzTg4K5q1aNIgx+UixVxOF?=
 =?us-ascii?Q?BjDYtiYQN5MsyVn+MG+AW1cdZ9y0og9E+ZKmmatNBN0fOD6bS4v2NQFm7+LC?=
 =?us-ascii?Q?6bFoqt6qxtRtYBIM48K0Ytn1FzV/r4V6wLGGWI0Abdh2eNngUrThMzrXZEWQ?=
 =?us-ascii?Q?ubwiBexNhfoyBN8icylFRVX5WeoepXyDmAqr2SLgrL03GUCAipjIHjNjY1vd?=
 =?us-ascii?Q?if7hDigiYufTcVnHSXWXEFZeGnWZGtC3JK3M4uYKd9WhYh4f8W373HCncL/2?=
 =?us-ascii?Q?bnKLv4kFWjXIkSMURgtiyszrLOsYE+JO7N2KgWmjORaCFVOe5trvi42m2qpG?=
 =?us-ascii?Q?2VNSUzZvuPR1EfSceRwBZBqGlTkZ1aErg0NieoyBY68hEi0ud2FftbpqhekI?=
 =?us-ascii?Q?TqZEiUHgxpNOTijN0yV8RnhEVcqjF1AD/qEF07SYvyADwpFl4rLgr3pTnTbI?=
 =?us-ascii?Q?/CjAZV5Aq7FxgAdzBFNbwgzJ+fvJ9x2MrawR97qwscGD6LDF96PlwJ4wIKTJ?=
 =?us-ascii?Q?0MbuGYmV8mGYAy3CeyXN+SVGukycZmTvrNwMiegGfSS3N/MO6Ohu2ynPEGak?=
 =?us-ascii?Q?OZBTJ3H8uZyyAb0CCYhir2oSLCXsF9C8BWif91HVsUR46yVsvbE+ne2vTafo?=
 =?us-ascii?Q?6pQvPb/rGarbPefpnv1uZ8EhChtMrmDAIrPwGwuTEHh9iI9vIlyf+7eRcCln?=
 =?us-ascii?Q?26zxhDrPBRf9ZSaTbxpQM+ZBvXezKcG5tQY4zSaHWCpxsfdBP6pxJh3U6Q1D?=
 =?us-ascii?Q?HIATRgb3/VOJ3N4NzahH6quS503wx6oKIy1SH92wBJnrUjzRri2EspSkJ/6z?=
 =?us-ascii?Q?g1/dMX++Ob4sQNtXgVPkSL413HYuESI5lsO4p+VKif+VafpJu0XVmU+J3+U4?=
 =?us-ascii?Q?DxetosoRGpzjzMY0Rl5TpgWI8k5SsEOcccySaWOfa28IwJEz3yYNXCHmTPUN?=
 =?us-ascii?Q?LcMvwskenPeOkGzKMlpnVw5++ORDxfkQeZnEHYh5IAs9HLQR6lxpNah15f99?=
 =?us-ascii?Q?UAj8EsiFDQldzvyuLEZvlsT1UAkvwAfpFlFa4i9hFG2rGsSw1z3PsVuoHvRL?=
 =?us-ascii?Q?54PUm+h63s73F1RfQCRn1FPkV4o+li+75OM7FN1I6Fs+hfFswsb7VIkMCT/J?=
 =?us-ascii?Q?FsUbl0gE99OrA+TOUHaO/YeC1qY6WRBavUKuYd2F?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20ef4b2-8dd3-48e5-43d0-08ddb4648a5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 03:50:06.7479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p8pEf5SdZCPxGVvxNHCwjJK8rQ0E0zm5JWW0Wtu9cf+CVqjn9eFwr9f7kOdgP8gxnNLVhSn0HxxCMudotMQt1SABcuRtkX8Z10yicYm8F8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8104
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
> From: Nilawar, Badal <badal.nilawar@intel.com>
> Sent: Wednesday, June 25, 2025 10:30 PM
> To: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linu=
x-
> kernel@vger.kernel.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Usyskin, Alexander <alexander.usyskin@intel.com=
>;
> gregkh@linuxfoundation.org; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>
> Subject: [PATCH v4 02/10] mei: late_bind: add late binding component driv=
er
>=20
> From: Alexander Usyskin <alexander.usyskin@intel.com>
>=20
> Add late binding component driver.
> It allows pushing the late binding configuration from, for example, the X=
e
> graphics driver to the Intel discrete graphics card's CSE device.
>=20
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v2:
>  - Use generic naming (Jani)
>  - Drop xe_late_bind_component struct to move to xe code (Daniele/Sasha)
> v3:
>  - Updated kconfig description
>  - Move CSC late binding specific flags/defines to late_bind_mei_interfac=
e.h
> (Daniele)
> v4:
>  - Add match for PCI_CLASS_DISPLAY_OTHER to support headless cards
> (Anshuman)
> v5:
>  - Add fixes in push_config (Sasha)
>  - Use INTEL_ prefix for component, refine doc,
>    add status enum to headerlate_bind_mei_interface.h (Anshuman)
> ---
>  drivers/misc/mei/Kconfig                    |   1 +
>  drivers/misc/mei/Makefile                   |   1 +
>  drivers/misc/mei/late_bind/Kconfig          |  13 +
>  drivers/misc/mei/late_bind/Makefile         |   9 +
>  drivers/misc/mei/late_bind/mei_late_bind.c  | 281 ++++++++++++++++++++
>  include/drm/intel/i915_component.h          |   1 +
>  include/drm/intel/late_bind_mei_interface.h |  64 +++++
>  7 files changed, 370 insertions(+)
>  create mode 100644 drivers/misc/mei/late_bind/Kconfig
>  create mode 100644 drivers/misc/mei/late_bind/Makefile
>  create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
>  create mode 100644 include/drm/intel/late_bind_mei_interface.h
>=20
> diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig index
> 7575fee96cc6..771becc68095 100644
> --- a/drivers/misc/mei/Kconfig
> +++ b/drivers/misc/mei/Kconfig
> @@ -84,5 +84,6 @@ config INTEL_MEI_VSC
>  source "drivers/misc/mei/hdcp/Kconfig"
>  source "drivers/misc/mei/pxp/Kconfig"
>  source "drivers/misc/mei/gsc_proxy/Kconfig"
> +source "drivers/misc/mei/late_bind/Kconfig"
>=20
>  endif
> diff --git a/drivers/misc/mei/Makefile b/drivers/misc/mei/Makefile index
> 6f9fdbf1a495..84bfde888d81 100644
> --- a/drivers/misc/mei/Makefile
> +++ b/drivers/misc/mei/Makefile
> @@ -31,6 +31,7 @@ CFLAGS_mei-trace.o =3D -I$(src)
>  obj-$(CONFIG_INTEL_MEI_HDCP) +=3D hdcp/
>  obj-$(CONFIG_INTEL_MEI_PXP) +=3D pxp/
>  obj-$(CONFIG_INTEL_MEI_GSC_PROXY) +=3D gsc_proxy/
> +obj-$(CONFIG_INTEL_MEI_LATE_BIND) +=3D late_bind/
>=20
>  obj-$(CONFIG_INTEL_MEI_VSC_HW) +=3D mei-vsc-hw.o  mei-vsc-hw-y :=3D vsc-
> tp.o diff --git a/drivers/misc/mei/late_bind/Kconfig
> b/drivers/misc/mei/late_bind/Kconfig
> new file mode 100644
> index 000000000000..65c7180c5678
> --- /dev/null
> +++ b/drivers/misc/mei/late_bind/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025, Intel Corporation. All rights reserved.
> +#
> +config INTEL_MEI_LATE_BIND
> +	tristate "Intel late binding support on ME Interface"
> +	select INTEL_MEI_ME
> +	depends on DRM_XE
> +	help
> +	  MEI Support for Late Binding for Intel graphics card.
> +
> +	  Enables the ME FW interfaces for Late Binding feature,
> +	  allowing loading of firmware for the devices like Fan
> +	  Controller during by Intel Xe driver.
> diff --git a/drivers/misc/mei/late_bind/Makefile
> b/drivers/misc/mei/late_bind/Makefile
> new file mode 100644
> index 000000000000..a0aeda5853f0
> --- /dev/null
> +++ b/drivers/misc/mei/late_bind/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Copyright (c) 2025, Intel Corporation. All rights reserved.
> +#
> +# Makefile - Late Binding client driver for Intel MEI Bus Driver.
> +
> +subdir-ccflags-y +=3D -I$(srctree)/drivers/misc/mei/
> +
> +obj-$(CONFIG_INTEL_MEI_LATE_BIND) +=3D mei_late_bind.o
> diff --git a/drivers/misc/mei/late_bind/mei_late_bind.c
> b/drivers/misc/mei/late_bind/mei_late_bind.c
> new file mode 100644
> index 000000000000..ffb89ccdfbb1
> --- /dev/null
> +++ b/drivers/misc/mei/late_bind/mei_late_bind.c
> @@ -0,0 +1,281 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Intel Corporation  */ #include
> +<drm/intel/i915_component.h> #include
> +<drm/intel/late_bind_mei_interface.h>
> +#include <linux/component.h>
> +#include <linux/pci.h>
> +#include <linux/mei_cl_bus.h>
> +#include <linux/module.h>
> +#include <linux/overflow.h>
> +#include <linux/slab.h>
> +#include <linux/uuid.h>
> +
> +#include "mkhi.h"
> +
> +#define GFX_SRV_MKHI_LATE_BINDING_CMD 0x12 #define
> +GFX_SRV_MKHI_LATE_BINDING_RSP (GFX_SRV_MKHI_LATE_BINDING_CMD
> | 0x80)
> +
> +#define LATE_BIND_SEND_TIMEOUT_MSEC 3000 #define
> +LATE_BIND_RECV_TIMEOUT_MSEC 3000
> +
> +/**
> + * struct csc_heci_late_bind_req - late binding request
> + * @header: @ref mkhi_msg_hdr
> + * @type: type of the late binding payload
> + * @flags: flags to be passed to the firmware
> + * @reserved: reserved field
> + * @payload_size: size of the payload data in bytes
> + * @payload: data to be sent to the firmware  */ struct
> +csc_heci_late_bind_req {
> +	struct mkhi_msg_hdr header;
> +	u32 type;
> +	u32 flags;
> +	u32 reserved[2];
> +	u32 payload_size;
> +	u8  payload[] __counted_by(payload_size); } __packed;
> +
> +/**
> + * struct csc_heci_late_bind_rsp - late binding response
> + * @header: @ref mkhi_msg_hdr
> + * @type: type of the late binding payload
> + * @reserved: reserved field
> + * @status: status of the late binding command execution by firmware
> +*/ struct csc_heci_late_bind_rsp {
> +	struct mkhi_msg_hdr header;
> +	u32 type;
> +	u32 reserved[2];
> +	u32 status;
> +} __packed;
> +
> +static int mei_late_bind_check_response(const struct device *dev, const
> +struct mkhi_msg_hdr *hdr) {
> +	if (hdr->group_id !=3D MKHI_GROUP_ID_GFX) {
> +		dev_err(dev, "Mismatch group id: 0x%x instead of 0x%x\n",
> +			hdr->group_id, MKHI_GROUP_ID_GFX);
> +		return -EINVAL;
> +	}
> +
> +	if (hdr->command !=3D GFX_SRV_MKHI_LATE_BINDING_RSP) {
> +		dev_err(dev, "Mismatch command: 0x%x instead of 0x%x\n",
> +			hdr->command,
> GFX_SRV_MKHI_LATE_BINDING_RSP);
> +		return -EINVAL;
> +	}
> +
> +	if (hdr->result) {
> +		dev_err(dev, "Error in result: 0x%x\n", hdr->result);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * mei_late_bind_push_config - Sends a config to the firmware.
> + * @dev: device struct corresponding to the mei device
> + * @type: payload type
> + * @flags: payload flags
> + * @payload: payload buffer
> + * @payload_size: payload buffer size
> + *
> + * Return: 0 success, negative errno value on transport failure,
> + *         positive status returned by FW
> + */
> +static int mei_late_bind_push_config(struct device *dev, u32 type, u32 f=
lags,
> +				     const void *payload, size_t payload_size) {
> +	struct mei_cl_device *cldev;
> +	struct csc_heci_late_bind_req *req =3D NULL;
> +	struct csc_heci_late_bind_rsp rsp;
> +	size_t req_size;
> +	ssize_t ret;
> +
> +	if (!dev || !payload || !payload_size)
> +		return -EINVAL;
> +
> +	cldev =3D to_mei_cl_device(dev);
> +
> +	ret =3D mei_cldev_enable(cldev);
> +	if (ret < 0) {
> +		dev_dbg(dev, "mei_cldev_enable failed. %zd\n", ret);
> +		return ret;
> +	}
> +
> +	req_size =3D struct_size(req, payload, payload_size);
> +	if (req_size > mei_cldev_mtu(cldev)) {
> +		dev_err(dev, "Payload is too big %zu\n", payload_size);
> +		ret =3D -EMSGSIZE;
> +		goto end;
> +	}
> +
> +	req =3D kmalloc(req_size, GFP_KERNEL);
> +	if (!req) {
> +		ret =3D -ENOMEM;
> +		goto end;
> +	}
> +
> +	req->header.group_id =3D MKHI_GROUP_ID_GFX;
> +	req->header.command =3D GFX_SRV_MKHI_LATE_BINDING_CMD;
> +	req->type =3D type;
> +	req->flags =3D flags;
> +	req->reserved[0] =3D 0;
> +	req->reserved[1] =3D 0;
> +	req->payload_size =3D payload_size;
> +	memcpy(req->payload, payload, payload_size);
> +
> +	ret =3D mei_cldev_send_timeout(cldev, (void *)req, req_size,
> LATE_BIND_SEND_TIMEOUT_MSEC);
> +	if (ret < 0) {
> +		dev_err(dev, "mei_cldev_send failed. %zd\n", ret);
> +		goto end;
> +	}
> +
> +	ret =3D mei_cldev_recv_timeout(cldev, (void *)&rsp, sizeof(rsp),
> LATE_BIND_RECV_TIMEOUT_MSEC);
> +	if (ret < 0) {
> +		dev_err(dev, "mei_cldev_recv failed. %zd\n", ret);
> +		goto end;
> +	}
> +	if (ret < sizeof(rsp.header)) {
> +		dev_err(dev, "bad response header from the firmware: size
> %zd < %zu\n",
> +			ret, sizeof(rsp.header));
> +		goto end;
> +	}
> +	if (ret < sizeof(rsp)) {
> +		dev_err(dev, "bad response from the firmware: size %zd <
> %zu\n",
> +			ret, sizeof(rsp));
> +		goto end;
> +	}
> +
> +	ret =3D mei_late_bind_check_response(dev, &rsp.header);
> +	if (ret) {
> +		dev_err(dev, "bad result response from the firmware:
> 0x%x\n",
> +			*(uint32_t *)&rsp.header);
> +		goto end;
> +	}
> +
> +	ret =3D (int)rsp.status;
> +	dev_dbg(dev, "%s status =3D %zd\n", __func__, ret);
> +
> +end:
> +	mei_cldev_disable(cldev);
> +	kfree(req);
> +	return ret;
> +}
> +
> +static const struct late_bind_component_ops mei_late_bind_ops =3D {
> +	.owner =3D THIS_MODULE,
> +	.push_config =3D mei_late_bind_push_config, };
> +
> +static int mei_component_master_bind(struct device *dev) {
> +	return component_bind_all(dev, (void *)&mei_late_bind_ops); }
> +
> +static void mei_component_master_unbind(struct device *dev) {
> +	component_unbind_all(dev, (void *)&mei_late_bind_ops); }
> +
> +static const struct component_master_ops mei_component_master_ops =3D {
> +	.bind =3D mei_component_master_bind,
> +	.unbind =3D mei_component_master_unbind, };
> +
> +/**
> + * mei_late_bind_component_match - compare function for matching mei
> late bind.
> + *
> + *    The function checks if requester is Intel PCI_CLASS_DISPLAY_VGA or
> + *    PCI_CLASS_DISPLAY_OTHER device, and checks if the parent of reques=
ter
DOC is still wrong dev is requester here, you are checking base =3D=3D dev.
With fixing of that.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>

Thanks,
Anshuman=20
> + *    and the grand parent of mei_if are the same device
> + *
> + * @dev: master device
> + * @subcomponent: subcomponent to match
> (INTEL_COMPONENT_LATE_BIND)
> + * @data: compare data (late_bind mei device on mei bus)
> + *
> + * Return:
> + * * 1 - if components match
> + * * 0 - otherwise
> + */
> +static int mei_late_bind_component_match(struct device *dev, int
> subcomponent,
> +					 void *data)
> +{
> +	struct device *base =3D data;
> +	struct pci_dev *pdev;
> +
> +	if (!dev)
> +		return 0;
> +
> +	if (!dev_is_pci(dev))
> +		return 0;
> +
> +	pdev =3D to_pci_dev(dev);
> +
> +	if (pdev->vendor !=3D PCI_VENDOR_ID_INTEL)
> +		return 0;
> +
> +	if (pdev->class !=3D (PCI_CLASS_DISPLAY_VGA << 8) &&
> +	    pdev->class !=3D (PCI_CLASS_DISPLAY_OTHER << 8))
> +		return 0;
> +
> +	if (subcomponent !=3D INTEL_COMPONENT_LATE_BIND)
> +		return 0;
> +
> +	base =3D base->parent;
> +	if (!base) /* mei device */
> +		return 0;
> +
> +	base =3D base->parent; /* pci device */
> +
> +	return !!base && dev =3D=3D base;
> +}
> +
> +static int mei_late_bind_probe(struct mei_cl_device *cldev,
> +			       const struct mei_cl_device_id *id) {
> +	struct component_match *master_match =3D NULL;
> +	int ret;
> +
> +	component_match_add_typed(&cldev->dev, &master_match,
> +				  mei_late_bind_component_match, &cldev-
> >dev);
> +	if (IS_ERR_OR_NULL(master_match))
> +		return -ENOMEM;
> +
> +	ret =3D component_master_add_with_match(&cldev->dev,
> +					      &mei_component_master_ops,
> +					      master_match);
> +	if (ret < 0)
> +		dev_err(&cldev->dev, "Master comp add failed %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static void mei_late_bind_remove(struct mei_cl_device *cldev) {
> +	component_master_del(&cldev->dev,
> &mei_component_master_ops); }
> +
> +#define MEI_GUID_MKHI UUID_LE(0xe2c2afa2, 0x3817, 0x4d19, \
> +			      0x9d, 0x95, 0x6, 0xb1, 0x6b, 0x58, 0x8a, 0x5d)
> +
> +static struct mei_cl_device_id mei_late_bind_tbl[] =3D {
> +	{ .uuid =3D MEI_GUID_MKHI, .version =3D MEI_CL_VERSION_ANY },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(mei, mei_late_bind_tbl);
> +
> +static struct mei_cl_driver mei_late_bind_driver =3D {
> +	.id_table =3D mei_late_bind_tbl,
> +	.name =3D KBUILD_MODNAME,
> +	.probe =3D mei_late_bind_probe,
> +	.remove	=3D mei_late_bind_remove,
> +};
> +
> +module_mei_cl_driver(mei_late_bind_driver);
> +
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("MEI Late Binding");
> diff --git a/include/drm/intel/i915_component.h
> b/include/drm/intel/i915_component.h
> index 4ea3b17aa143..456849a97d75 100644
> --- a/include/drm/intel/i915_component.h
> +++ b/include/drm/intel/i915_component.h
> @@ -31,6 +31,7 @@ enum i915_component_type {
>  	I915_COMPONENT_HDCP,
>  	I915_COMPONENT_PXP,
>  	I915_COMPONENT_GSC_PROXY,
> +	INTEL_COMPONENT_LATE_BIND,
>  };
>=20
>  /* MAX_PORT is the number of port
> diff --git a/include/drm/intel/late_bind_mei_interface.h
> b/include/drm/intel/late_bind_mei_interface.h
> new file mode 100644
> index 000000000000..ec58ef1ab4e8
> --- /dev/null
> +++ b/include/drm/intel/late_bind_mei_interface.h
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (c) 2025 Intel Corporation  */
> +
> +#ifndef _LATE_BIND_MEI_INTERFACE_H_
> +#define _LATE_BIND_MEI_INTERFACE_H_
> +
> +#include <linux/types.h>
> +
> +struct device;
> +struct module;
> +
> +/**
> + * Late Binding flags
> + * Persistent across warm reset
> + */
> +#define CSC_LATE_BINDING_FLAGS_IS_PERSISTENT	BIT(0)
> +
> +/**
> + * xe_late_bind_fw_type - enum to determine late binding fw type  */
> +enum late_bind_type {
> +	CSC_LATE_BINDING_TYPE_FAN_CONTROL =3D 1, };
> +
> +/**
> + * Late Binding payload status
> + */
> +enum csc_late_binding_status {
> +	CSC_LATE_BINDING_STATUS_SUCCESS           =3D 0,
> +	CSC_LATE_BINDING_STATUS_4ID_MISMATCH      =3D 1,
> +	CSC_LATE_BINDING_STATUS_ARB_FAILURE       =3D 2,
> +	CSC_LATE_BINDING_STATUS_GENERAL_ERROR     =3D 3,
> +	CSC_LATE_BINDING_STATUS_INVALID_PARAMS    =3D 4,
> +	CSC_LATE_BINDING_STATUS_INVALID_SIGNATURE =3D 5,
> +	CSC_LATE_BINDING_STATUS_INVALID_PAYLOAD   =3D 6,
> +	CSC_LATE_BINDING_STATUS_TIMEOUT           =3D 7,
> +};
> +
> +/**
> + * struct late_bind_component_ops - ops for Late Binding services.
> + * @owner: Module providing the ops
> + * @push_config: Sends a config to FW.
> + */
> +struct late_bind_component_ops {
> +	struct module *owner;
> +
> +	/**
> +	 * @push_config: Sends a config to FW.
> +	 * @dev: device struct corresponding to the mei device
> +	 * @type: payload type
> +	 * @flags: payload flags
> +	 * @payload: payload buffer
> +	 * @payload_size: payload buffer size
> +	 *
> +	 * Return: 0 success, negative errno value on transport failure,
> +	 *         positive status returned by FW
> +	 */
> +	int (*push_config)(struct device *dev, u32 type, u32 flags,
> +			   const void *payload, size_t payload_size); };
> +
> +#endif /* _LATE_BIND_MEI_INTERFACE_H_ */
> --
> 2.34.1

