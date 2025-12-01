Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A42C9900F
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 21:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E9C10E485;
	Mon,  1 Dec 2025 20:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUSOxMXK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCD510E485;
 Mon,  1 Dec 2025 20:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764620687; x=1796156687;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MGGMGoj6egKcD7OiT8KRTfcquf0VjnxJ74DeyPRo2rs=;
 b=SUSOxMXKL0iCpR/dERm1sjtpOtBedC9+e5GxNcD1+ZtHYMPvYtarEdZf
 f/2ZEgygWl1m/j5JDh+vmIQWXNybxUkL+wv0m3+5ebNBk/GcqpgeK2GdX
 88K4yeu1s3nzlvIN7qnQkwrTkGDhd0uyDqEantoqtBmA0vv5pDz4qldl6
 3VxQIVsQoispNKYc8u1vtqCY++3nfdsmwIe/PySerszf6PGioLVF06aZX
 357jiQdmSeTSge9R9OiRUp6nj01Mil/o82Deyg17wXUIhMJAYU6pCOs6+
 Nzp/4hjeqOV0ypyib/jQJAsXXY3+vVDhrg1zLQ+sb814Y8UMXzGR/FH9c g==;
X-CSE-ConnectionGUID: E+Oe4Jj3RjiVp6QhCQMP1Q==
X-CSE-MsgGUID: CGc8sjVbRS+KwLLuVSWUxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66532391"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66532391"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 12:24:46 -0800
X-CSE-ConnectionGUID: shi8DT0MRceVlidxYSZ1Lg==
X-CSE-MsgGUID: 3DR0V84/Sv6V87gicDN2mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193444409"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 12:24:46 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 12:24:44 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 12:24:44 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 12:24:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVQJnV93/WhceambfqkWEZwWaCYfJkPuXwpwExiV81QIMZLUlaI8HPq1mke2rlj0fwjo4J6KzKiqmrvusWk6GU2RvU+G8YZ3Zf5ueleh8Iw+wid8VOeok9PHIFqzo34XV4L1YGliCKxCV60Mlv+DHsqsZAmZUU8zukZzso0peDHGYDy3oJj9tbjrsPbXaDWO2XiCw84Y8IWm1I2G6n6yX0+nxlY2VFegGAILA5N9aEXDkoWayj0uxFZJ6stb7fr4vrr40T/9QY5Ii5q9pwc7gPp7NfWpB9IPiwIJO5hyCb5T5MMlX8IHsqfoCka6mlYhUQfbfpFrPH5AUJrGoHAgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WQ3sT2PFqGyYrxBo1x22A/E9h2kj5lsI1oweVoiF4w=;
 b=d/9RLo7EVpdIR2QmYrCfxr2LO8TW2amW3bNmBp1AF9WGDS2O8aqLRrBok9u5hNpn4NWfc5WBPwp8H5cRpTqLvmFuYdRmS0IJ/kIpYU1EwJ1V4o2NBZBGvjXX//oqLI4+taD8KpHMKmZd+nYo8ICyFbntI+aZA8lGTyIr+Vh9s6U/B+irGQBNPKNO5M16Py0BMm5Y+f+Oqh/JB2GN/rsbqd5RVh6VthDG58Igi55UaPKrqUe3nKgxsN3eaWX/TW+PHT72GRvIzolgWmlTtUbHC+Ph4UIeaUsNo8p+JSEIU2b16Kwdb7Ds4x2cOWHIBJO39+rBzNjVYztBXbBY/Zi+Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 20:24:38 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 20:24:38 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Zhang,
 Jianxun" <jianxun.zhang@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "john.c.harrison@intel.com"
 <john.c.harrison@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Hirschfeld, Dafna"
 <dafna.hirschfeld@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v27 3/4] drm/xe/xe_vm: Add per VM fault info
Thread-Topic: [PATCH v27 3/4] drm/xe/xe_vm: Add per VM fault info
Thread-Index: AQHcYuo1LRVeBLM3YUGnI2LefzW2+rUNKKMAgAAPYNA=
Date: Mon, 1 Dec 2025 20:24:38 +0000
Message-ID: <CH0PR11MB54440A4D690DE5A8730EF7C3E5DBA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251201174443.139151-6-jonathan.cavitt@intel.com>
 <20251201174443.139151-9-jonathan.cavitt@intel.com>
 <aS3p9Cwhwu8tWFNb@lstrano-desk.jf.intel.com>
In-Reply-To: <aS3p9Cwhwu8tWFNb@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB8717:EE_
x-ms-office365-filtering-correlation-id: 84887d88-8825-44fa-a263-08de3117a699
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?OcJCSQuiv1dTa0yfM7AytmowSVj3Gz4OcbLZca2OLndXFCh4bHug2GGNOhbz?=
 =?us-ascii?Q?m6QaSOQfJ0lv9x53OesbObomFVZsSyJ2yluiqbEAgtbeTsDTQBjOQxx3svhq?=
 =?us-ascii?Q?DXdy9G415Y+z63rjF++eZbs+OoUI6/fDtsPAnNsWFixArWD0BX1aU0LNcPtQ?=
 =?us-ascii?Q?xgs78UH5mpx1fkiNqv7Zo/3r0lFHpDeZaBGN2hRwjAj8mnNabLKjJ3/JENVj?=
 =?us-ascii?Q?b7Ae3R+cNXpVskDKlBpCT1X0a1JxWTlsvDdVWN36FIi2HlhtvxTdHDDcOY3d?=
 =?us-ascii?Q?RTUW7LlKhBdJwnUnaLbA5faqw5XmJJuNllLLF95RH9HDmBODqalAmtg6VN18?=
 =?us-ascii?Q?ghsCfgAKkqA+vv2umQxOD5wBS4LRe7kgTievgNr0fJCx+48/o0WY0TJT6NuJ?=
 =?us-ascii?Q?q97uDLz0KpsJkJLTg6cvqb9ux4c782cL236maYbl6SkxYUaQUCRSPs9uNNIy?=
 =?us-ascii?Q?YdWN9BUJUVxUvtEFzDZWMQ8oEHhHabBKErUh+yFy79VHoFCmVqf8V6rWs5Yc?=
 =?us-ascii?Q?Dc189PUQuf3xps7bxbebChH1YalYBDUZrEhcJORXOF0bcXAO4DSunnkM+OET?=
 =?us-ascii?Q?9T0Sx7LEXSeiftCg3xzdKE90JImTjBe2mI9YCj2aFUpWCRLP4IH+zUsCNiUp?=
 =?us-ascii?Q?UPopCBGJconsCVlsWLNqOO7ZK1Q3eVvdxfHjHE8mxyVgns0vsREvEDTMc8ZH?=
 =?us-ascii?Q?WA//I7zZw+xMpCudsB/P8YI9vYwQXWi2TYj95Xc4TlV8PWvsNtGRaC0MKq/y?=
 =?us-ascii?Q?k/7zvt018Hs8y7GBTtrMzdV9w4y8h8i1Zj1o4uT+INDJKPvq5qr6AhKgOUPW?=
 =?us-ascii?Q?E4baErZAJc7sm2OLPhcXJBeI6nHQouxodmVLV/Qvd8fnaoGnPoW6UQoGadaW?=
 =?us-ascii?Q?qBJPV1Lb3TOF3VSSCVdOXbL//Px4L44kGzrQUc/0R4qmw/qRGx/vl17lMS+Y?=
 =?us-ascii?Q?hyJ3VHIsk4soU2hpZb2JBbxQUhN4yrcpEanbg0f3LUroaS7sNry5ghnQZvpX?=
 =?us-ascii?Q?rh7RZjhq/xGnD2NU+J6wrgA9Eb7Lytq/bwgeUay4hQBZC3fHLXDnKxju81Tx?=
 =?us-ascii?Q?bIeJPvkJwOCx9VfXpFlfv/NPUpcSIRxPafMjcpKWP0pQYM0Esn2HdsJ7YapQ?=
 =?us-ascii?Q?YO0m940XtvbS80wDREvfrOvmiymie0MzatDXyFhENzyhiiEhtf/Fiow/oOms?=
 =?us-ascii?Q?NG+eiXCECrK8305akjiRZoskU+S5WZpjmq5nt9qO46CvIBF13rOYAWH7eXE4?=
 =?us-ascii?Q?h8c17HmJYzs+KdUDXfvbYFjVOklLlI4fi5vR++FM7s9TBnpVh66g0GOeNNwJ?=
 =?us-ascii?Q?b7nRL+yj5rddHO38gKjoG6JzMdqiUONXPS1b7xr/lNUFueOEzN1T3Yn1Sm2L?=
 =?us-ascii?Q?zmoyZ6njbqQrOiCeSxbtspM4+3S774yS9t42IoAOHssEjGz1KDz2YG6dZw6Q?=
 =?us-ascii?Q?3vp7ic/MUVfyxO7c7xjeM7l8d8JIrtU9MI/sJU3dt1TueuO9/3y0a9ubJKRo?=
 =?us-ascii?Q?8YEeYdKe8WVUt2KxYcs15yCQ8Q+/WWTwibja?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ogwl+QMUbl/PU7Vuf3HLjs/kqoYGO74KTED7I8njS5Kvl3aFdIX+UrDEQ1OL?=
 =?us-ascii?Q?IKOWk3c1PRNyNZw+mP/xOmPZ5wYHE6521219XP+8QdmH8cp6aVLW1ONvCfAl?=
 =?us-ascii?Q?Eej/YHXDKLgjoX/UOvIArpb+m3oVcy3D7lwjkiGkVxWbnuKLPg6O81ytYEHh?=
 =?us-ascii?Q?IPvl1j1yVrQk7Fc/7mGaJCwmwM/OUwbRibYevT1kJRE68mHEAN5C+BFx3dXP?=
 =?us-ascii?Q?f3lW6N6P3w6FDX0wIAKcJr133r5+fgPoH/dlDMpfzQOC1Xwi2wTpqL27c/A7?=
 =?us-ascii?Q?g8wgwqoErYyHSPD5P/JHOVJJY7yBXAXcJWy+jKKUrUxxJzfKCrv89gSj8xnJ?=
 =?us-ascii?Q?bxMmil1CVq66/oZGvRusH78+/2AP58qpyz6aAqE1c2dXiU4vWwdrHxITMtiR?=
 =?us-ascii?Q?QqwhQl1HQqS2lJQruAewAZIKasr/axuAqQ2Hh3wOQKLX87CTueGIulynvdD2?=
 =?us-ascii?Q?RZRKWvbayd4WpbaTt1R/XUVHATebCQeCs2sNhEkj4Ms7RB5LXKYPD+Vo0XvL?=
 =?us-ascii?Q?sHJQt4aRV2lQjnNkzree4TVPswU9ZrfRdiP4JGIR+f5Ao+u0hY7bklLMtLvR?=
 =?us-ascii?Q?Kg6IYfelaBSUEDAigHv4BTw4UC5/yPf1l0F9M67FdMwwQS4CCP1T1j6hnbcU?=
 =?us-ascii?Q?JZeuv+l9UWa6Y16Gc6vwWVyBVR6BnrsBd15PhuUk+i0vwAsTNsMU+SSCt3go?=
 =?us-ascii?Q?Umkxb1XKTBMZ310etfdkFrPLzGUs5jucJQzC0TzZaCGnZQt1tgtgwSDTuHSs?=
 =?us-ascii?Q?zOpazu7HtCaR26qJsTxZv3dMz4zPBNquXOqHCuFAcvLwL+d9+vGGmDnIgYv0?=
 =?us-ascii?Q?Af1oFKpFyvSZglarw7PZrYpYjd+kOkC6VrHjnl7c6r/c2mEiErMA/rPuwNks?=
 =?us-ascii?Q?zdE46N8XSCkEinZcjRKf5AfN8VGX6kY3ujSbAHsWOMFEtxhfokmOu3c4F1oI?=
 =?us-ascii?Q?JrBkrUFZBysyPJmwm5GXYNsj5C1ZkhFJB2qr+hljkWcfURr7RzKw/M9HjwJe?=
 =?us-ascii?Q?B8GBAkMr77ARrpk4cF3hKtqaE26Oh1/ap0IBSIXLz0R7gkP9h0+QhTbT6A5M?=
 =?us-ascii?Q?buKu0k2PmCCIaJsXBnFGb/rg182ja/Nw5lDRJm3JW1ykI+A9jyKi1AFcxUHY?=
 =?us-ascii?Q?XP+GR7ItpAcJlRArgmBZjixJSZJ/uLGyY9k05BeaAAIwfZ6FNgzZNlGCUW6D?=
 =?us-ascii?Q?0Uhy9JqE1zsXNdYiBWHrDQJXrvlyaSqwQYO5Wqzck6B+SCovWAp3uK2On42W?=
 =?us-ascii?Q?BvKmbdcE+y1FTbYIGjqQ6EWf7T7bDm6dxmiE8AUlv4dvNsDW7bPxKull2kOy?=
 =?us-ascii?Q?tLq5RWkvh9o67ZAckJFzB4+143eu1qSbX8kbJ7RPvroddQj+WogT87e4K63L?=
 =?us-ascii?Q?7E3VXVClBs+DBlgPi2IDKO1f58S25K5j18cum3OFxj0f3JEQJFBpccaSFWH7?=
 =?us-ascii?Q?XNUASIjGs67DDYDjoNU3BsZuz4CZOk4/+44flkMzV/ECnUHadvZImgXhez+1?=
 =?us-ascii?Q?Ckd1Vw9gJQmytdoV2Sbl8o722UiapZN1ANMvdWVPygjpF2s26fM5NFF9oQt4?=
 =?us-ascii?Q?a9OEFm8L7uQWetIo6/I5g/cHi5xCm8MDtPJv769x?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84887d88-8825-44fa-a263-08de3117a699
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 20:24:38.1851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mg8n1iISZOE49SOxiyfmI+YGNAPUj+/0vqQ2zfIffrbcPSpqSfZRKICqaJNdLuN+QoyuKTrGns6DrRobm83WJqV2XOjsm46H/BlQiQkIM5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
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

-----Original Message-----
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Monday, December 1, 2025 11:18 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Zhang=
, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.co=
m>; dri-devel@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczko@in=
tel.com>; Mrozek, Michal <michal.mrozek@intel.com>; Jadav, Raag <raag.jadav=
@intel.com>; john.c.harrison@intel.com; Briano, Ivan <ivan.briano@intel.com=
>; Auld, Matthew <matthew.auld@intel.com>; Hirschfeld, Dafna <dafna.hirschf=
eld@intel.com>
Subject: Re: [PATCH v27 3/4] drm/xe/xe_vm: Add per VM fault info
>=20
> On Mon, Dec 01, 2025 at 05:44:47PM +0000, Jonathan Cavitt wrote:
> > Add additional information to each VM so they can report up to the firs=
t
> > 50 seen faults.  Only pagefaults are saved this way currently, though i=
n
> > the future, all faults should be tracked by the VM for future reporting=
.
> >=20
> > Additionally, of the pagefaults reported, only failed pagefaults are
> > saved this way, as successful pagefaults should recover silently and no=
t
> > need to be reported to userspace.
> >=20
> > v2:
> > - Free vm after use (Shuicheng)
> > - Compress pf copy logic (Shuicheng)
> > - Update fault_unsuccessful before storing (Shuicheng)
> > - Fix old struct name in comments (Shuicheng)
> > - Keep first 50 pagefaults instead of last 50 (Jianxun)
> >=20
> > v3:
> > - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> > - Fix double-locking error (jcavitt)
> > - Assert kmemdump is successful (Shuicheng)
> >=20
> > v4:
> > - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> > - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> > - Store address, address type, and address precision per fault (jcavitt=
)
> > - Store engine class and instance data per fault (Jianxun)
> > - Add and fix kernel docs (Michal W)
> > - Properly handle kzalloc error (Michal W)
> > - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> > - Store fault level per fault (Micahl M)
> >=20
> > v5:
> > - Store fault and access type instead of address type (Jianxun)
> >=20
> > v6:
> > - Store pagefaults in non-fault-mode VMs as well (Jianxun)
> >=20
> > v7:
> > - Fix kernel docs and comments (Michal W)
> >=20
> > v8:
> > - Fix double-locking issue (Jianxun)
> >=20
> > v9:
> > - Do not report faults from reserved engines (Jianxun)
> >=20
> > v10:
> > - Remove engine class and instance (Ivan)
> >=20
> > v11:
> > - Perform kzalloc outside of lock (Auld)
> >=20
> > v12:
> > - Fix xe_vm_fault_entry kernel docs (Shuicheng)
> >=20
> > v13:
> > - Rebase and refactor (jcavitt)
> >=20
> > v14:
> > - Correctly ignore fault mode in save_pagefault_to_vm (jcavitt)
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > Cc: Jianxun Zhang <jianxun.zhang@intel.com>
> > Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> > Cc: Michal Mzorek <michal.mzorek@intel.com>
> > Cc: Ivan Briano <ivan.briano@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pagefault.c | 26 +++++++++
> >  drivers/gpu/drm/xe/xe_vm.c        | 88 +++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm.h        |  9 ++++
> >  drivers/gpu/drm/xe/xe_vm_types.h  | 29 ++++++++++
> >  4 files changed, 152 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_=
pagefault.c
> > index 0b625a52a598..5997023a5889 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -247,6 +247,31 @@ static void xe_pagefault_print(struct xe_pagefault=
 *pf)
> >  		  pf->consumer.engine_instance);
> >  }
> > =20
> > +static void save_pagefault_to_vm(struct xe_device *xe, struct xe_pagef=
ault *pf)
>=20
> Every function in xe_pagefault.c starts with 'xe_pagefault_'
>=20
> So maybe: s/save_pagefault_to_vm/xe_pagefault_save_to_vm
>=20
> > +{
> > +	struct xe_vm *vm;
> > +
> > +	/*
> > +	 * Pagefault may be asociated to VM that is not in fault mode.
> > +	 * Perform asid_to_vm behavior, except if VM is not in fault
> > +	 * mode, return VM anyways.
> > +	 */
> > +	down_read(&xe->usm.lock);
> > +	vm =3D xa_load(&xe->usm.asid_to_vm, pf->consumer.asid);
> > +	if (vm)
> > +		xe_vm_get(vm);
> > +	else
> > +		vm =3D ERR_PTR(-EINVAL);
> > +	up_read(&xe->usm.lock);
> > +
> > +	if (IS_ERR(vm))
> > +		return;
> > +
> > +	xe_vm_add_fault_entry_pf(vm, pf);
> > +
> > +	xe_vm_put(vm);
> > +}
> > +
> >  static void xe_pagefault_queue_work(struct work_struct *w)
> >  {
> >  	struct xe_pagefault_queue *pf_queue =3D
> > @@ -266,6 +291,7 @@ static void xe_pagefault_queue_work(struct work_str=
uct *w)
> >  		err =3D xe_pagefault_service(&pf);
> >  		if (err) {
> >  			xe_pagefault_print(&pf);
> > +			save_pagefault_to_vm(gt_to_xe(pf.gt), &pf);
> >  			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
> >  				  ERR_PTR(err));
> >  		}
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 8ab726289583..e69e10233b00 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -27,6 +27,7 @@
> >  #include "xe_device.h"
> >  #include "xe_drm_client.h"
> >  #include "xe_exec_queue.h"
> > +#include "xe_gt.h"
> >  #include "xe_migrate.h"
> >  #include "xe_pat.h"
> >  #include "xe_pm.h"
> > @@ -578,6 +579,88 @@ static void preempt_rebind_work_func(struct work_s=
truct *w)
> >  	trace_xe_vm_rebind_worker_exit(vm);
> >  }
> > =20
> > +static struct xe_hw_engine *
> > +hw_engine_lookup_class_instance(struct xe_vm *vm,
> > +				enum xe_engine_class class,
> > +				u16 instance)
>=20
> Can we use xe_hw_engine_lookup or xe_gt_hw_engine rather than adding a
> new helper?

Both of those functions require the GT ID, which is unknown.

>=20
> > +{
> > +	struct xe_device *xe =3D vm->xe;
> > +	struct xe_hw_engine *hwe;
> > +	enum xe_hw_engine_id id;
> > +	struct xe_gt *gt;
> > +	u8 gt_id;
> > +
> > +	for_each_gt(gt, xe, gt_id)
> > +		for_each_hw_engine(hwe, gt, id)
> > +			if (hwe->class =3D=3D class && hwe->instance =3D=3D instance)
> > +				return hwe;
> > +	return NULL;
> > +}
> > +
> > +/**
> > + * xe_vm_add_fault_entry_pf() - Add pagefault to vm fault list
> > + * @vm: The VM.
> > + * @pf: The pagefault.
> > + *
> > + * This function takes the data from the pagefault @pf and saves it to=
 @vm->faults.list.
> > + *
> > + * The function exits silently if the list is full, and reports a warn=
ing if the pagefault
> > + * could not be saved to the list.
> > + */
> > +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *p=
f)
> > +{
> > +	struct xe_vm_fault_entry *e =3D NULL;
> > +	struct xe_hw_engine *hwe;
> > +
> > +	/* Do not report faults on reserved engines */
> > +	hwe =3D hw_engine_lookup_class_instance(vm, pf->consumer.engine_class=
,
> > +					      pf->consumer.engine_instance);
> > +	if (!hwe || xe_hw_engine_is_reserved(hwe))
> > +		return;
> > +
> > +	e =3D kzalloc(sizeof(*e), GFP_KERNEL);
> > +	if (!e) {
> > +		drm_warn(&vm->xe->drm,
> > +			 "Could not allocate memory for fault!\n");
> > +		return;
> > +	}
> > +
> > +	spin_lock(&vm->faults.lock);
> > +
>=20
> Michal would say use guard(spinlock)(&vm->faults.lock) here. Probably
> a little cleaner as the goto can be avoided.
>=20
> > +	/*
> > +	 * Limit the number of faults in the fault list to prevent
> > +	 * memory overuse.
> > +	 */
> > +	if (vm->faults.len >=3D MAX_FAULTS_SAVED_PER_VM) {
> > +		kfree(e);
> > +		goto out;
> > +	}
> > +
> > +	e->address =3D pf->consumer.page_addr;
> > +	e->address_precision =3D 1;
> > +	e->access_type =3D pf->consumer.access_type;
> > +	e->fault_type =3D pf->consumer.fault_type;
> > +	e->fault_level =3D pf->consumer.fault_level;
> > +
> > +	list_add_tail(&e->list, &vm->faults.list);
> > +	vm->faults.len++;
> > +out:
> > +	spin_unlock(&vm->faults.lock);
> > +}
> > +
> > +static void xe_vm_clear_fault_entries(struct xe_vm *vm)
> > +{
> > +	struct xe_vm_fault_entry *e, *tmp;
> > +
> > +	spin_lock(&vm->faults.lock);
>=20
> Probably a guard here too.
>=20
> Nits aside, overall LGTM.
>=20
> Matt
>=20
> > +	list_for_each_entry_safe(e, tmp, &vm->faults.list, list) {
> > +		list_del(&e->list);
> > +		kfree(e);
> > +	}
> > +	vm->faults.len =3D 0;
> > +	spin_unlock(&vm->faults.lock);
> > +}
> > +
> >  static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_bin=
ds)
> >  {
> >  	int i;
> > @@ -1503,6 +1586,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, =
u32 flags, struct xe_file *xef)
> >  	INIT_LIST_HEAD(&vm->userptr.invalidated);
> >  	spin_lock_init(&vm->userptr.invalidated_lock);
> > =20
> > +	INIT_LIST_HEAD(&vm->faults.list);
> > +	spin_lock_init(&vm->faults.lock);
> > +
> >  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> > =20
> >  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> > @@ -1808,6 +1894,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >  	}
> >  	up_write(&xe->usm.lock);
> > =20
> > +	xe_vm_clear_fault_entries(vm);
> > +
> >  	for_each_tile(tile, xe, id)
> >  		xe_range_fence_tree_fini(&vm->rftree[id]);
> > =20
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 361f10b3c453..e9f2de4189e0 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -12,6 +12,12 @@
> >  #include "xe_map.h"
> >  #include "xe_vm_types.h"
> > =20
> > +/**
> > + * MAX_FAULTS_SAVED_PER_VM - Maximum number of faults each vm can stor=
e before future
> > + * faults are discarded to prevent memory overuse
> > + */
> > +#define MAX_FAULTS_SAVED_PER_VM	50
> > +
> >  struct drm_device;
> >  struct drm_printer;
> >  struct drm_file;
> > @@ -22,6 +28,7 @@ struct dma_fence;
> > =20
> >  struct xe_exec_queue;
> >  struct xe_file;
> > +struct xe_pagefault;
> >  struct xe_sync_entry;
> >  struct xe_svm_range;
> >  struct drm_exec;
> > @@ -309,6 +316,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_sn=
apshot *snap);
> >  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_prin=
ter *p);
> >  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> > =20
> > +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *p=
f);
> > +
> >  /**
> >   * xe_vm_set_validating() - Register this task as currently making bos=
 resident
> >   * @allow_res_evict: Allow eviction of buffer objects bound to @vm whe=
n
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_v=
m_types.h
> > index 3bf912bfbdcc..fff914fb0aa6 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -20,6 +20,7 @@
> >  #include "xe_userptr.h"
> > =20
> >  struct xe_bo;
> > +struct xe_pagefault;
> >  struct xe_svm_range;
> >  struct xe_sync_entry;
> >  struct xe_user_fence;
> > @@ -165,6 +166,24 @@ struct xe_userptr_vma {
> > =20
> >  struct xe_device;
> > =20
> > +/**
> > + * struct xe_vm_fault_entry - Elements of vm->faults.list
> > + * @list: link into @xe_vm.faults.list
> > + * @address: address of the fault
> > + * @address_precision: precision of faulted address
> > + * @access_type: type of address access that resulted in fault
> > + * @fault_type: type of fault reported
> > + * @fault_level: fault level of the fault
> > + */
> > +struct xe_vm_fault_entry {
> > +	struct list_head list;
> > +	u64 address;
> > +	u32 address_precision;
> > +	u8 access_type;
> > +	u8 fault_type;
> > +	u8 fault_level;
> > +};
> > +
> >  struct xe_vm {
> >  	/** @gpuvm: base GPUVM used to track VMAs */
> >  	struct drm_gpuvm gpuvm;
> > @@ -302,6 +321,16 @@ struct xe_vm {
> >  		bool capture_once;
> >  	} error_capture;
> > =20
> > +	/** @faults: List of all faults associated with this VM */
> > +	struct {
> > +		/** @faults.lock: lock protecting @faults.list */
> > +		spinlock_t lock;
> > +		/** @faults.list: list of xe_vm_fault_entry entries */
> > +		struct list_head list;
> > +		/** @faults.len: length of @faults.list */
> > +		unsigned int len;
> > +	} faults;
> > +
> >  	/**
> >  	 * @validation: Validation data only valid with the vm resv held.
> >  	 * Note: This is really task state of the task holding the vm resv,
> > --=20
> > 2.43.0
> >=20
>=20
