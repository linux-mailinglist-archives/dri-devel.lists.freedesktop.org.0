Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0D6AE5BD3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 07:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F357E10E4D0;
	Tue, 24 Jun 2025 05:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRUFT3FV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A18810E4CC;
 Tue, 24 Jun 2025 05:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750742450; x=1782278450;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dGPrcM1g+T9rDuy2+KpQo6R3y+BRWNiiOURdYvH3X7I=;
 b=KRUFT3FVcvqDWhCsaRcglBEPtkcDH+HcKpm8JAlysYunDtmKotOTR03I
 Jp/GsRnxyF+GRvCgUUji0kCVZySr73NSs9oHSVrX/Z6Yh0wMAME9zU4FH
 8gPk4yihW6sUIOxqb56UIwFZTcNMmiSGCAeJQyms0uHmhnsmFyhwfWoFE
 er9zfjRuI3/E1NyE7vA+LCN4S7L1JRcnTOLoixitqtyOYGoIug9IHMOrA
 I9cPalM/8+rR1ZcaDv8akb0AjcDks8zA1ifnewS1PGhQqpjppEyrTpmLc
 +sMX/a07bSpTHjvB/Q3PwQbFUnJ9uXEY9vtbKi4hVxr7H+ldBYce41Dbf A==;
X-CSE-ConnectionGUID: rzwK35GbQPqiuae643vnkQ==
X-CSE-MsgGUID: K6xdiaUMTlq3ijjUNfXEgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52086569"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="52086569"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 22:20:49 -0700
X-CSE-ConnectionGUID: kc7ExyoUQO2To90cLThc7A==
X-CSE-MsgGUID: R2YZ3H5BQrmY38QVSmEr1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="152108691"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 22:20:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 22:20:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 22:20:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 22:20:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUlmh7n20S048CAQPqK8djx4q56adv6B0rRF3SYTFkMxyN5zSXRwkIbdnRoqBO/ObIUklBJ3SZNwDqPSYJ5YGq+k043yMGbjQvExj9GIhuz0ctkSeAQ4t3r5PxipakWj+ciDczzqsEDiY4ZfTxo3KnLNiySgt0kNZnpQoB6nLzVzB4eyv9pUkwTEntWRkNz2QEUaY476Vjhpgb1wlj4vyBIhgFDfCfantyVtkXFMNto1ZYu/i5tg9kzX0VmspZZKXR5DA0AYK8rJzyve7dMYQbI8b38dVGZkUs/+xCki9gAPSyApb6/h5OD476JpgdqwRMQB5PUSVWvZj/JOwlgm7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYn31/W+LS/CggUZuj96jvapieSxr5Dh6k/wlA83Hy0=;
 b=D+dKB2u6TGfTTdXdi5ufU199bCEhzb9gzviSRW8gN5t+FzWP6U3pspHXuHbAAge/LGQA3u6ectttbSsH9+W3AG5Ul4CjGQv6gmitjDFrPcvkRJiiNSGDqN6hNbKFWqD8Df8AD7JaEf5wd3iDLd9ibUr6Tvjnn2f5bmc4koK5qBCClpHRzM1JURpMXuT2OQahKHrjb+TtwdhdclJzNwKQKXYggKUsfRoIXa7OllB2LsLi36lA8plC7JVYxY8Y5r/SUIIKU1EfV2gs9hR3cd8CFl9CgkJuT3sHBs4HaDR84TreK5y17kM2ScfpNQ+BOBF+Z/BYGlA9Cqvvf4IENbKgEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CY5PR11MB6257.namprd11.prod.outlook.com
 (2603:10b6:930:26::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 05:20:31 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 05:20:31 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: RE: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to initialize
 edp backlight
Thread-Topic: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to
 initialize edp backlight
Thread-Index: AQHb4a2VslIhNy7FZk+I2ydD2jRb1bQRwteAgAABONCAAAKTAIAABP4w
Date: Tue, 24 Jun 2025 05:20:31 +0000
Message-ID: <DM3PPF208195D8D6BB5A99A1245AAB61F3AE378A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250620063445.3603086-1-suraj.kandpal@intel.com>
 <20250620063445.3603086-12-suraj.kandpal@intel.com>
 <IA0PR11MB7307746E548211C22AEE96A6BA78A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <DM3PPF208195D8DC0A3BFD202B0AB765727E378A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <IA0PR11MB7307EC4666FD32BD780FCF8CBA78A@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7307EC4666FD32BD780FCF8CBA78A@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CY5PR11MB6257:EE_
x-ms-office365-filtering-correlation-id: 63bb8b90-f7b4-4d02-d78a-08ddb2ded70b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?nQ6S+gNjX8PABPrRLU41KnWdK3XGNwoNt5EyFeYu0GlAVLpZNsKYPgAsOkEo?=
 =?us-ascii?Q?rKKgV/w9mx2I0A0cg8n57jODrTSuzG8g5hIPrQJwoqHlw5ByOJ85TOUttqo7?=
 =?us-ascii?Q?vRTefXHbnf9wVbATwKfxaf5ZA1PdveQwHkks39DLj6RR3pyTxxODzC7pFjct?=
 =?us-ascii?Q?6NpNUZWEtUv+VM3IvHGiTqkmO8Zf9ClHabaNTE4Wja8WZd/qC/56LJ8qAGxD?=
 =?us-ascii?Q?6ILG2LS8JCPiuvGBPOpHAGhIdWqheoHrHHRuCtuzoIVmUgG/RnERpaFmnnxA?=
 =?us-ascii?Q?Q96Xfr01Nv7DxAf4PYnec7DdxX93Rs7yMuTGqfNJbSh9mk2CjeN7Gw6WmW1r?=
 =?us-ascii?Q?K8vPwmNpujT0MtiUX/ViEmygC+uWTBneTbzVYlRKI/MaJr3VS2DnIvPP2BXb?=
 =?us-ascii?Q?Fwdm81ThRHxayexAGIS775y7wEDN0UNgqQhgz3QHp+Qus5KqFI4nM1TxZnaq?=
 =?us-ascii?Q?lI3zoPse4C3/Y/MmuHgmGTYdbabz2mVxmPRaKwvJJgfsTWHCghYmZ2/wOq7e?=
 =?us-ascii?Q?kC6hoeK6K3Mm1jI9d+ByIP2H5mSk4kFptyGm61DcY9+q5AGuiWAmf+sfAPAX?=
 =?us-ascii?Q?9BHWHIWthLpHwtCCE2wBw0NQqYawQ4iUD9yXCoGwpmzT4+VjvLzzDqJy85Jv?=
 =?us-ascii?Q?J/lnuxRLxDbH14ooPmV0eFPbS/GeLqhimWxvjgHB2mRDY02BY+/MWVbUcKIx?=
 =?us-ascii?Q?ASeAO+ePqp+jAvMvtkWvnrvgwM/4+q2jKWpm5AatPrasK++WEg+0zT0WF1vc?=
 =?us-ascii?Q?7q2NejUhVEHxdjEbbWavVs67lD0WrZPO9B6Osc458m4xwYkHEeaYjU3GMsMn?=
 =?us-ascii?Q?o4s5pCgtuUaDNTvUUMk7pKLD+Ful0UIvJt7lxfjalttqjUfbTzKbhnexxk3G?=
 =?us-ascii?Q?QFkOe0nNDcped200/Ko3KENifxCJnDSDKlpHkvFobTgtLEl4VIoyXFEWzFgl?=
 =?us-ascii?Q?EYfvveagOclgygtFJvZS6orkoyZfdRf0Z5EGWuFxY/5A9xPShluB3RP/p+V/?=
 =?us-ascii?Q?fWKR9lEjYvvCjjie2HRTHxekJOq6OiEidNVltPeuOje/qKocPG5UpqqlYUBN?=
 =?us-ascii?Q?Xhtn0cBwivzQMfK58/h4KgHdZfIdll/s3HGXtxXOMxFFod5sUGYq5dgBbN9D?=
 =?us-ascii?Q?8pUaE48f1O8DlerJU6fu+S3a6588ncXDMKzq9Wd4MujWfZC1sz7mgEFd6Esr?=
 =?us-ascii?Q?43XDjn2zN3lSa0R/vZnM0F40HcTFgPDz3JZ2UJxOPMDwPGsqGrUGRx2HCGiT?=
 =?us-ascii?Q?y80Ux8x4eJIeZqxfcR+f5Xlp+DFd8KVI3mYrhZLI+idQXw3Z8ZvXGz80OpqV?=
 =?us-ascii?Q?1EMwV2iMHwuJzpn463FhektqLMzweGsg82GkSzyY7l4+DRPYa7gQoo1Go7Tl?=
 =?us-ascii?Q?vcW9G7UY8m6CKeRCnfp4n1EXcze9rfG00KWham9+ytwBkFQCe5TTTBYnHNlb?=
 =?us-ascii?Q?omnccD7h2OtIepSvcr0KZnOvSa3bfzeU+Y54Ux6JaG8M5MEnsqxQQxtPmBR2?=
 =?us-ascii?Q?DRjJ2tEPcscp06k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QsaZPyI94W68oww5KZ3VWn3ugFD34nxiiurEHzcRVzy8VMM4HCsIjEvUIruN?=
 =?us-ascii?Q?3AN2e67jWVRTn3e23W3CKb9QUXXxNb8hm1HOXgV8ZdxFkJW63aefIte9fbnY?=
 =?us-ascii?Q?HpJSckLQ1Je4Oos7evjWkKVahckxKJva3BcBr5jdKqHJX8mOg15ZQUMuXa2h?=
 =?us-ascii?Q?lpz6PU+any5SV0PoE0v/t6v5gXISrdO8qp+3d2ZjGdytJ7s/0W/dA+UeiZVq?=
 =?us-ascii?Q?12S4kX0FX+h58bh/eSRdUz6uhVYlc8XCLEHal1VbOr1G1veEr3E7IpUq7/yh?=
 =?us-ascii?Q?nnBbO7fV7SWs4/NbxJzV3RLjQEcDHQHLRytqt3BIglw4ecHuPLqSR2pvi1Bt?=
 =?us-ascii?Q?qnSuV7fYQNz1U7CcZsIqK0c5VoPNzy9+oZJqfJsv67zafkyGVXy+g/qIM+l1?=
 =?us-ascii?Q?RSOIVz4Q6w8OEjZQzWg569jOA/Y6/4XF512apO/lA3BoAzvaGG6i99S4tpYz?=
 =?us-ascii?Q?pkF7oHJXjezzs8nccFlnDtUF9kycTb7OTE/ioUVKjs8e70+xAiflaYWA9Y1G?=
 =?us-ascii?Q?c0kykDlCCzLOqW+oMUI6f6PP+B24WdvYdCJdwxfP7MDcDEyxUWcKMAqGvnm0?=
 =?us-ascii?Q?xhnj+tQNzGzLk2uUBu4Wzh1/EpSk9VbkA0nnilxCXYOZe3igpC9yCq0wiUWp?=
 =?us-ascii?Q?hIHe2lzoAE/bYJxyUBRWjQ7Lka3PPMTGdkJrOwrCWlK0UJesPc8r0q7dIHSM?=
 =?us-ascii?Q?tFsEiR5UJNhz+H0hgi3NhvwC0ihr9EuF8+/v4vzEDNZkfRF/6Bpd1pXzbYdM?=
 =?us-ascii?Q?Zhao1x+fns/mVXvTVe4S5LzghCiATbRFKAbQE47u+0aqQVdxv+advFQZDdjA?=
 =?us-ascii?Q?Ealj+ny24lKe2IFrtRjT9EgHLWVR5VIjVUgo1KMRaeFtalnxRBevte1M9M4b?=
 =?us-ascii?Q?AcKJvqU6MEKAVvPFVcUGZQvoaLRwzmFrunyK+n7x3zdnJohEV8m8QxNCDkGr?=
 =?us-ascii?Q?3W9lTJBIUP7rRFHtzPM+6avrY51g2BnMQ9S09AueCGSdYkLnQWxnoTEtaFxb?=
 =?us-ascii?Q?FI7n9r7hQdz6uE7JQPIE2axPIQFjbK76pWqiikjYP1icxzKlzWaNPfJXDLhU?=
 =?us-ascii?Q?HQMnAQ+28RBWRc1BySMPBIuigWz+cTczlmEkbAH27gvuGDTl392dfy+DkMhB?=
 =?us-ascii?Q?TJYHkbNlwVpiDc71UH4xGkHpvq6xuG9ugXLB8mJzFxRLepHwpA6outhmDVoI?=
 =?us-ascii?Q?9mLlIITiBW1Z/eNagbg8p+aJxp+olD6lF/DEH0ltptHrnerdz3kFwsh/eO88?=
 =?us-ascii?Q?PQYQP6uPIxaEvZmGmvbYKSRXwZJ+zUsWr80hw0nyzun+iG4QgXP1HwRTfDZB?=
 =?us-ascii?Q?2CpMQhZD28Shzd1mA7GruzDJxZTZQmRllfcBRssXKFUghnnwnyLwaBB/WMV/?=
 =?us-ascii?Q?BCcsfSOL6kr4PxUPAibzdrgski2bG01cpF8sVVJaq0+5h+hZJFJSA1GPlWwZ?=
 =?us-ascii?Q?bndu2iI8mzzhYS9FaTpMVMpgL/xeX0w3YaLgJdxxNwfTW/lGshXMEW/nkdth?=
 =?us-ascii?Q?MM2yuTzjsaZ9irU15TR/plyh/FM5p58R806I/VKyIEXQF39pzxKyNMOW+oqJ?=
 =?us-ascii?Q?kHF6C1Ji3rbO6BmlZOd+/4seHzvql16ZUoZy1W/Y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bb8b90-f7b4-4d02-d78a-08ddb2ded70b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 05:20:31.6746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ebmWcCgY011COhUi4mQFKTqQ9QBagk3IwDSi+wX91WLyBM9l5OqMMaSdW4dWLDKrAjgbST7Cpp3HcBrcEoJhBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6257
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
> Sent: Tuesday, June 24, 2025 10:31 AM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> nouveau@lists.freedesktop.org
> Subject: RE: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to initi=
alize
> edp backlight
>=20
> > > > -----Original Message-----
> > > > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > > > Sent: Friday, June 20, 2025 12:05 PM
> > > > To: intel-xe@lists.freedesktop.org;
> > > > intel-gfx@lists.freedesktop.org;
> > > > dri- devel@lists.freedesktop.org; nouveau@lists.freedesktop.org
> > > > Cc: Murthy, Arun R <arun.r.murthy@intel.com>; Kandpal, Suraj
> > > > <suraj.kandpal@intel.com>
> > > > Subject: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to
> > > > initialize edp backlight
> > > >
> > > > Now that drm_edp_backlight init has been modified to take into
> > > > account the setup of lumininace based brightness manipulation we
> > > > can just use
> > > that.
> > > >
> > > > --v2
> > > > -Fix commit message [Arun]
> > > >
> > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > ---
> > > >  .../drm/i915/display/intel_dp_aux_backlight.c | 98
> > > > +++++++++----------
> > > >  1 file changed, 48 insertions(+), 50 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > > index 800d07c7f041..117c762fa2fe 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > > @@ -584,9 +584,37 @@ static int
> > > > intel_dp_aux_vesa_setup_backlight(struct
> > > > intel_connector *connector,
> > > >  	u8 current_mode;
> > > >  	int ret;
> > > >
> > > > -	if (panel->backlight.edp.vesa.luminance_control_support) {
> > > > +	ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel-
> > > > >backlight.edp.vesa.info,
> > > > +				     luminance_range->max_luminance,
> > > > +				     panel->vbt.backlight.pwm_freq_hz,
> > > > +				     intel_dp->edp_dpcd, &current_level,
> > > > &current_mode,
> > > > +				     false);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	drm_dbg_kms(display->drm,
> > > > +		    "[CONNECTOR:%d:%s] AUX VESA backlight enable is
> > > > controlled through %s\n",
> > > > +		    connector->base.base.id, connector->base.name,
> > > > +		    dpcd_vs_pwm_str(panel-
> > > > >backlight.edp.vesa.info.aux_enable));
> > > > +	drm_dbg_kms(display->drm,
> > > > +		    "[CONNECTOR:%d:%s] AUX VESA backlight level is
> > > controlled
> > > > through %s\n",
> > > > +		    connector->base.base.id, connector->base.name,
> > > > +		    dpcd_vs_pwm_str(panel-
> > > >backlight.edp.vesa.info.aux_set));
> > > > +
> > > Can these both debug prints be combined?
> > >
> >
> > One talks about backlight enable and other about backlight level do
> > you still Want to combine them ?
> >
> Yes, can replace with "enable and level controlled by"

Could be that it is enabled through DPCD but controlled through PWM that's =
why it uses
Aux_enable and aux_set to decide when to print dpcd vs pwm

Regards,
Suraj Kandpal

>=20
> Thanks and Regards,
> Arun R Murthy
> --------------------
