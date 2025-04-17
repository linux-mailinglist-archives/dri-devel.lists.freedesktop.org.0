Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9780DA91414
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 08:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7E110EA04;
	Thu, 17 Apr 2025 06:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJLHiO/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866FF10E98F;
 Thu, 17 Apr 2025 06:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744871487; x=1776407487;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WzDhXNmC1SflAoQ/UV7nBbyf9KwMDhVfnb8PWbQEnLQ=;
 b=YJLHiO/F65UmH4AD9RtMV9xPoqa49cl/AJPoolnFZ6f1U0f1RaKw6aog
 MrRqPzH92/Jn6PMlM4uaiac4wOlZD38WOEGXX3E9xAGC7vnLVz7jmwhkM
 uwmkrKrTG4GceqyyAFYTT/8KVAPADWySizakJAIa1whf1C0QX5knAM7AS
 Y91IC6yravLQM/mBKnDc5a6zq5YWxlCElN5G2t9sBDAs6uIG6+CJq4cfg
 X00l3tktntrHDWESX4CKYaN+ISwR4G7fUdZhcu9g2tfg+hZFIDzGMU2jC
 8Bsl73op+LJdVceVd8mLFYAkx55LqMVxkvHiKC1MeKwAt+eW943NZCokc A==;
X-CSE-ConnectionGUID: WanuAWdaQ8qOR6dOUW/0xg==
X-CSE-MsgGUID: fo5pGk/8Qlmdzj9az0iHzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50092212"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="50092212"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 23:31:25 -0700
X-CSE-ConnectionGUID: W3TwDEPaQaajopbRjw6mkw==
X-CSE-MsgGUID: Pa+MX0ElTBaBuwa8nHR98Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="131259930"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 23:31:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 23:31:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 23:31:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 23:31:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njpBUtT02mWoZ+216xQD0cpWw3kt5lJSVKOGElX76k7v8GLS3qR8DpFvkHxLtPpdrVH417aDBbUUbkSjZxsO7GSHMfHaR/lS5sdbvJ9eAZYWFZI0OpDOphNqbXs9MH58OP/zDb2R5CCyBV2otQOLmnLOWSmFn1f75o5Yxa4YnABrKmmw9CZlC3lIiMhiYvxMPZeejfQ9cr2X8d/WjVsaT0BTm0kzQQ5qPbrMYjdhCjcn5j0g4voeDXnB8pS1sIfnlruL7jGZlrUBLQGQUxSTGQ0bW8oVlIUJcQkDy3LfdlG57yrkxJ5XOluTRarYYaivXeF0I6zcFQSMvcUHH8K2pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlnUHYqWkwTI5tFDh1WK+tpqvB/46sSxBtb7kJ5fkA4=;
 b=dN2EC8u5mvhGFpjbRqqTMMotY+dELjcnojlLza1s8ivIWMOb2woodyYtcLWnKiOWY5nrwjjRu7y3t5++fQIBuE7DiY2Wm5HSGugqLYi8wpdFlp0ecKvUqNSR2e3GOp5UEGtTcrQ1XMwrmvGgZL/FK2HkwmNeZTJuN7fChk87Z80G7slQ3yyk5uvzfpOgYLFtqwNp9hZGr+Tkuhp9/jSR5WasUeAKpfei0j0V6m+2Y7OjeV8YWFXBUsjZTZoXvjOeQDBpx/8rA/y0ZYA0tC2dX4IqEYXME8aZWP1XSdCSyZh/Uq6H6nNJ3kZUDj1WWLkbrLGddLWYKPWD6oYJgRlAvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SN7PR11MB7092.namprd11.prod.outlook.com (2603:10b6:806:29b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.37; Thu, 17 Apr
 2025 06:31:22 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%2]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 06:31:22 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, Pekka Paalanen
 <pekka.paalanen@haloniitty.fi>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "alex.hung@amd.com" <alex.hung@amd.com>, "Vetter,
 Simona" <simona.vetter@intel.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: RE: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Thread-Topic: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Thread-Index: AQHbcZ6jXhYSgYOyEEKLl41inbOvPbNLZHIAgAFIb4CAALFTgIAAw7qAgAJZPoCAEMRaAIAAGCgAgBlURICAAWQ0gIAJNjGAgAHDf4CAAVEvgIAfdQmQ
Date: Thu, 17 Apr 2025 06:31:21 +0000
Message-ID: <DM4PR11MB63600B85A21E03A5E6938652F4BC2@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com>	<20250217120808.708b9b4d@eldfell>
 <c423efcb-5ab8-41c2-af0a-621007c6175d@intel.com>
 <20250218181819.11ca41ab@eldfell>
 <cd095fd7-3043-402a-9e21-c0c85c53f8e3@intel.com>
 <20250220175047.412ee8d4@eldfell>
 <95a3e35d-2c5e-4861-b7bf-f38815a44e14@intel.com>
 <20250303112010.469b9685@eldfell>
 <IA0PR11MB7307CCBB82AF958121A6B3A9BAD92@IA0PR11MB7307.namprd11.prod.outlook.com>
 <20250320112309.1d9c3e09@eldfell>
 <IA0PR11MB73070374E14C44DA1C7EDFA3BAA62@IA0PR11MB7307.namprd11.prod.outlook.com>
 <20250327105925.1e9e8609@eldfell>
 <IA0PR11MB7307082B787829CA3569F25FBAA02@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7307082B787829CA3569F25FBAA02@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SN7PR11MB7092:EE_
x-ms-office365-filtering-correlation-id: 68ea3503-46c7-4c87-3bb6-08dd7d797860
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?up1SN6lwGlbIA4dsIIaBQtS3F68TLo3aoSxjwWmSsyyWkoN7+kXNulKAGZDQ?=
 =?us-ascii?Q?JHGFmnyj6k/dYrNHygV1EwVDL8jtrN26mWnA8Na6Bxkcgw6m46GY+WL7oi3c?=
 =?us-ascii?Q?VzPqLIbU194ncbb9qX80y3kMLj9kHBen044KljMlrN03Ku27i9UYmhtuQZmE?=
 =?us-ascii?Q?rK+GBwkhQ7VYhRAS2Bwl5z1XvvtSzDcUlYWn4KHG0eRYAiwQHQXcz8eadJp0?=
 =?us-ascii?Q?n5yJVPl1EVCsFr2c3xLystXbucxx4jDQ7c4cafrbLkRutBcEZjKEjHVC4YoW?=
 =?us-ascii?Q?FdeUJvIPWBfHLXAESxReSkmbxj5o/iHVsDFedjiSsgcQUXwnf4ofNm+k13/H?=
 =?us-ascii?Q?VlpAKPrHS9QJ0Bf+lEXy2uZ50kwhb1Co7MrKycqocpv/YtliyzsMLMo56P8q?=
 =?us-ascii?Q?RPkatxiWpdXioMkKK8S8oSRFiprxjmfTPrie16el7l0ox6GTO6e/JmmMzq+O?=
 =?us-ascii?Q?4j9M9JmRG9gPWOmSckW/WFuvc+M1b/XDqdQNsqffXMpcMS1VNUtpeVSM1oAj?=
 =?us-ascii?Q?gZD2zGIDgABGcAeh1hiBphviWtAN38l9prHiB8oRdzJ4y22PNtsKKqzVjGdJ?=
 =?us-ascii?Q?vOmMfI4GM+obcJ/LD0n3IDoU/ogxj8AYJfmkG3nW0yBbhgzMR4ibzLTkuWZR?=
 =?us-ascii?Q?k8A6QJzkKUlTBookx+/2cEe5r/fB0IFk5ccOUG4LtSDBcPF5ZRgC1C06YHlJ?=
 =?us-ascii?Q?utnurQ7+1wDSjtG1MjST0lwqIlJIcggjh4LxlO64T/CEjryTQu9wmbj7QONm?=
 =?us-ascii?Q?xsexlxi1/lr02dLNCTBs+gCfWNNUDui0OsE3g7m0ORLgOviPontUBDRJNl1z?=
 =?us-ascii?Q?BCc4CiBHVbyyplhpo+qIdXbEM4vuRVzUnq+406Nzr8mQQ7OweaFmlJDxwC8Y?=
 =?us-ascii?Q?zCbaC9L3gzhkjmHfW59AFraNjpb+rR4IgQwnMVI7i26AjkNn+eP5gH31LTRh?=
 =?us-ascii?Q?vH7iBFe4Vlksv9xLIOk00GUi5mqoxv43WRv8/0hpAPYveP4rZt7e3R6Hzp0f?=
 =?us-ascii?Q?r33NlVRouxQeTyhTW0uLmG5P7VwoAQlWhmfZxIYw2aw/3VKaIzekJTt62c9G?=
 =?us-ascii?Q?jtz4tc0HhIMP739ORI31eNYWhUuHriGTYirBmqP5wIeJCkA7SYlSdGQ33TNY?=
 =?us-ascii?Q?TL2H//lKdk+ttkojU5MUrgPd21zjW9w/i+gXeJiSZ48QebXoGfYjKydAxc6Z?=
 =?us-ascii?Q?z9rUY4WDJfCL7TbUsZGzte06fkrYwguINMqF4zqFlJRHPjsPLXTAAS5Bzo24?=
 =?us-ascii?Q?+dTZwfwxRkcEkX5lAfl1H5oq/r5JTqjNGOi0eTJgIG1PqV87ZRCIDrR4i6i9?=
 =?us-ascii?Q?GDHi1F08IzAOTJtvw0Py5YzExFgvNhV7u9hXsZ2kcIoKxXWskyzs9MSZ5inw?=
 =?us-ascii?Q?XEVOBtmsxbghHNBCq/8VBVFsWXqe3SEIj+bBoOcsUzNePfkrTtxpI8tcgl5P?=
 =?us-ascii?Q?8F60IUS8kbpiIIEh8X9t21nMq4cmkAapMFCYOzGbnDZJJ2hAdWgrk/F1/DgG?=
 =?us-ascii?Q?fZ+CUKo2qUoLxq4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7VV4ZNXZZ5g0mlVsYjGOGUwX6cGXn9Rujxt1O0zEYxN8I2HvvXfp+5ZI2Dir?=
 =?us-ascii?Q?mkMwZ6b+TjRzRGKEijOpgi2KHtJcr/5CmMOgBOyLaVWhHVxMN9BpRKvKuhdy?=
 =?us-ascii?Q?YLA1gDMX/Z4PEOEaE352uWyvJss4NfM6Woylklm3Wr2w7cfzNzl18Br3H58o?=
 =?us-ascii?Q?jtxq31R71hMDyIGNg20u6psp4AkXEyl3zR1wLQskZwKQZwM4uEjfwzwPSaiB?=
 =?us-ascii?Q?O+52QbxlSyolH6Wk8p11WvuV8ZNwpjKoCh5egmdlwslwe/dqzqJ4y8DvxFrt?=
 =?us-ascii?Q?VpRzd0BvW1ObHKRobPcV2AiSN0UnptdaVvlw8WEkDf+QXCYZ4JnW9t1ZwssY?=
 =?us-ascii?Q?7Xl64Gi8raaSh/ubslR7EW6f1HUqE8QxyI2aDT1+hkGYM0uDiIbhGpTmjT5A?=
 =?us-ascii?Q?+D6X/qnmUomrzky4jc9fJqzxicu8MT5AfBv6j9ttQhUE+ZtVSGRnZvjKqGSi?=
 =?us-ascii?Q?7xhALgQ4Aj9mLWrAeX1WeL3ST1iS3ZLQ0/fIQYKSxjt5suX45SEez1l4IL7S?=
 =?us-ascii?Q?w3kw6mfJo8IjyoH06KeVGjJ8ix1rAKtt8Fzf0xoYsmwKQW2eniboJMMvb/Ad?=
 =?us-ascii?Q?uVQxVMPgVw9Ew/9bbRHZ4CEjAKyguM7sT49NclRFUA9b57lKfQvDNfS2Bvte?=
 =?us-ascii?Q?cvaqp3QlNDgyvO6Fi/ghrhPGmmD6DVP6s863X0fEFzVt95pAJy8RYgkwWoZK?=
 =?us-ascii?Q?7Z78OON8X4D8KceNEUb6vM1CrI1FvlEY2H9HE/lXpWqul2pECZ5BPj7s7Ff/?=
 =?us-ascii?Q?CdO0wYUIImcxv3KYOoWxWTHsxNKgMCWqWXiUNm+6Dq34w3C/8YRH+CmjFif/?=
 =?us-ascii?Q?pSuecxsoMveVIUTR5jmCr7Gx+PvQJe9tISGqjD7GCGJQZpzwGhSLEK3kz61q?=
 =?us-ascii?Q?w+RE9t494Kyf6MbmSzySerZ6/QWXAuEk3S4klK6mzWA3IHDXbHgijFBBZnYm?=
 =?us-ascii?Q?kBlxx+Yj7sLCJ4+jy9pvouh8hLf/CCQ7KvLYk+FP/aglOJ1WQhGF/d0YJ/Yn?=
 =?us-ascii?Q?fkH++5rEGsXyat642eVYVp5b95fACd5nE/SmonXl6wwDwBbURSAnZrBAPvJw?=
 =?us-ascii?Q?ke/zyKtDBm2QFvyfx3qALSrJrkC7QPeTsHkeXUf5cY96amnE9+czzSMDONu9?=
 =?us-ascii?Q?bZtqz/Qt1ajvslRhH8Duh6bPFfdcR6NnDlz8ejXYsC3c35Lam8MRGTqGDlOf?=
 =?us-ascii?Q?E1pW/1E9PkUWK0a5jzUhh3Ed5c08/Id3/SIbxDlffNGphhRF6jydC3VcY+Xb?=
 =?us-ascii?Q?+4mjt3fNU2m1s0+lxxOjySOlYApAjC3no1LbVhlPO0f8pdl3RCGLD15N6z0L?=
 =?us-ascii?Q?MG1p5b2gU3OqjnEMfNVe+sVPG3HZhADnEqgA+ETwYTjaCq2P5jX+o3iNyD+Z?=
 =?us-ascii?Q?8IrFc4D87XcQUDIZ7G5buQQZfdSniTPP3XbGhPSeMTal9t3x5faYP2zSDw4z?=
 =?us-ascii?Q?r7crU4c4kRTSRJZZex8ghe6m1hRfLYtH7Kbha4oINqIP65Ov7Au0JiyCA7Sm?=
 =?us-ascii?Q?Zl+KHXN0mW8x73FtLr0Pi4ZPQOewDtb8ieI57I0dLPCLdvn5Qp9fJBHDfMZp?=
 =?us-ascii?Q?QjP5QaLJH+X8VZnAzqllRs6nsgF5j9AscZ0+vqV8Csa+p6k3fsudMQhYO08F?=
 =?us-ascii?Q?BskgUjQGn4cX8r5LetPKu6FF9hSVZp41YPeNTGISAwU2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ea3503-46c7-4c87-3bb6-08dd7d797860
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 06:31:22.0198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2xqCSWNWF5PcpXcAKogVpep+dUw5OrZpzaHjjcp1gHsy39OBjAzZYcFiBibeyz1R4uJcv8cABv5F+D5aok3QJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7092
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Murt=
hy,
> Arun R
> Sent: Friday, March 28, 2025 10:36 AM
> To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> Cc: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; Kandpal, Suraj <suraj.kandpal@intel.com>;
> harry.wentland@amd.com; alex.hung@amd.com; Vetter, Simona
> <simona.vetter@intel.com>; airlied@gmail.com
> Subject: RE: [PATCH v8 01/14] drm: Define histogram structures exposed to=
 user
>=20
> > On Wed, 26 Mar 2025 06:03:27 +0000
> > "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
> >
> > > > On Wed, 19 Mar 2025 12:08:15 +0000 "Murthy, Arun R"
> > > > <arun.r.murthy@intel.com> wrote:
> > > >
> > > > > > On Mon, 3 Mar 2025 13:23:42 +0530 "Murthy, Arun R"
> > > > > > <arun.r.murthy@intel.com> wrote:
> > > > > >
> > > > > > > On 20-02-2025 21:20, Pekka Paalanen wrote:
> > > > > > > > On Wed, 19 Feb 2025 09:28:51 +0530 "Murthy, Arun R"
> > > > > > > > <arun.r.murthy@intel.com> wrote:
> > > >
> > > > ...
> > > >
> > > > > > > Hi Pekka,
> > > > > > > Sorry got getting back late on this.
> > > > > > > I totally agree that the UAPI should not be any hardware
> > > > > > > specific and have taken care to get rid of such if any.
> > > > > > > Here we are just exposing the histogram data and what point
> > > > > > > is the histogram generated is out of the scope.
> > > > > >
> > > > > > It's not out of scope. Understanding exactly at what point the
> > > > > > histogram is generated in the KMS pixel pipeline is paramount
> > > > > > to being able to use the results correctly - how it relates to
> > > > > > the
> > framebuffers'
> > > > > > contents and KMS pixel pipeline configuration.
> > > > > >
> > > > >
> > > > > While working around this comment, it looks to be quite
> > > > > challenging to address this comment and agree that this will
> > > > > have to be addressed and is important for the user to know at
> > > > > which point in the pixel pipeline configuration the histogram is =
generated.
> > > > > I can think of 2 options on addressing this.
> > > > >
> > > > > 1.  Have this documented in the driver. Since this can vary on
> > > > > each vendor hardware, can have this documented in the drivers or
> > > > > ReST
> > document.
> > > > >
> > > >
> > > > Hi Arun,
> > > >
> > > > this is not acceptable in KMS, because it requires userspace to
> > > > have code that depends on the hardware revision or identity. When
> > > > new hardware appears, it will not be enough to update the drivers,
> > > > one will also need to update userspace. There currently is no
> > > > userspace "standard KMS library" to abstract all drivers further,
> > > > like there is libcamera
> > and Mesa.
> > > >
> > > > > 2. Maybe have a bitmapping like we have it for histogram_mode.
> > > > > Define user readable macros for that.
> > > > > Ex: CC1_DEGAMMA_HIST_CC2
> > > > > In this case histogram is between the two color conversion
> > > > > hardware block in the pixel pipeline.
> > > > > This macro will have to be defined on need basis and define a
> > > > > u32 variable for this bit manipulation.
> > > >
> > > > This one still has problems in that some hardware may not have all
> > > > the non- HIST elements or not in the same order. It's a better
> > > > abstraction than option 1, but it's still weak.
> > > >
> > > > I can see one solid solution, but it won't be usable for quite
> > > > some time I
> > > > suppose:
> > > >
> > > > https://lore.kernel.org/dri-devel/20241220043410.416867-5-
> > > > alex.hung@amd.com/
> > > >
> > > > The current work on the color pipelines UAPI is concentrated on
> > > > the per-plane operations. The idea is that once those are hashed
> > > > out, the same design is applied to CRTCs as well, deprecating all
> > > > existing CRTC color processing properties. A histogram processing
> > > > element could be exposed as a colorop object, and its position in
> > > > a CRTC color pipeline represents the point where the histogram is c=
ollected.
> > > >
> > > > That would be the best possible UAPI design on current knowledge
> > > > in my opinion.
> > > >
> > > Yes this would be the best design, but looking into the timeline for
> > > this CRTC color pipeline can we proceed with this as in interim solut=
ion.
> > > Once we have the CRTC color pipeline in drm, will rebase this
> > > histogram to make use of the pipeline.
> > > We can also take up the crtc color pipeline and will also start
> > > contributing to get things faster but since there is not timeline
> > > defined for that activity, would it be viable to go ahead with
> > > option2 as in
> > interim solution?
> >
> > Hi Arun,
> >
> > I think that's something the DRM maintainers should chime in on.

As a first step, I think we can expose the Histogram through the property.
We can later hook this into the crtc color pipeline once we implement it.
A userspace implementation showing end to end benefit of the feature and
usecase would be needed. Hope this is ok and no strong objection to this
approach.

Regards,
Uma Shankar

> >
> > Thanks,
> > pq
> >
> drm Maintainers, any inputs on this?
>=20
> Thanks and Regards,
> Arun R Murthy
> --------------------
