Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E4B6E8591
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 01:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF15110EB58;
	Wed, 19 Apr 2023 23:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EF310EB58;
 Wed, 19 Apr 2023 23:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681945226; x=1713481226;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QcMM+F1W5PEGU8J4x4rojtZwjaHd7fCcd2SR3kXq0lc=;
 b=avJKonI8dhGhE2ymUBwUiIwt6UreADz32rES3LWXWueKmu+WUsA6Ek0E
 hrq+1M5SH42GAguji/w3981+Q+RxhoSrBqem6Mr5YIJ6htspS2XybxEMN
 AYnc8BJCH1ahmyl2OizuQ56vAdkdNxf1ou4KO3yal0/mGfLeR8A3urLf0
 rwcgBfe+iS8ueCJncaBmC62PlHJPUVQ+FOaAv2jdDcI+zP+so4Xy25VVv
 Smh0kOKLDRTrIFjytI+HqTx6bzvzOIFSVTq81ivuk0dQUTUc3+CaGCOe3
 VYJ/fkSHG3ZfEIS4zKG4IpFH1MLNoct4mgqQcagt/sAn3J1VzSHE7qfoy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325193156"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="325193156"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 16:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="803097907"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="803097907"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2023 16:00:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 16:00:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 16:00:25 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 16:00:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSIHS3J7qU/3azJJg79Fj0izi7+6vH74OKrlJidCAcmooQcHhoO3mBdQG70PD/pVjuBvgQ7Z2NeGwWB8ZUgDrLsPumh/aJIQECAOnMkYygzjcA48qYZTzJxBd+dUPm2wAzJvgytEoaSpHGIj/R4wFKyeUQDtdXsJK+Vo3SBxMriclNbRTeBDNXhYwvLq2fNK7gkhB+AwONleH8agDlw3fM66slxi+vMce25U5zlxdU/WUCeHAcYKvuX9bfE2NPKF/eqNdHD5sCmiQchQAgEXW90rwHroEb5uQYgMNwW5y9yfPd6lLe2tcRkzOxnPLIvkrxg6uRbEsYhSh9gfROCFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4/MTy2QqYMFXJRd+gyyx5oFSN5yCvv/xoMFbNLa94E=;
 b=DKWH8lAku5wsdSVskkdkXJctBjuAXQ16bWYVKP0Xxyt0RzZYY84jyl1LgkDqdhJDvsrQ+cd0WzYEIheDlvLRdLsJOILskaLqF4yX50rQF3kRoJZ7OnbpqGARp9aVUJQWqDK0CJuwiYL1PtGGsAW/djQWLMLSbpZ7W+Kxa8413hk0WQZERAJQvpHV279zOgD/vNk0RIlL9MkXJhs8EqerOwNRNHAIEaml9VTwrvnzwKNQIdKeslUeVrHjuu05KSVLAKVTNCqRWg7W62VDgST2DZr56IBEBIQnmbJ/M52p2Px6dnA6Tv1y5kh8S/hbV6dB5rHSNFX2aoXcpXDFsd1THg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by SJ1PR11MB6108.namprd11.prod.outlook.com (2603:10b6:a03:489::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 23:00:23 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee%4]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 23:00:23 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: RE: [Intel-gfx] [PATCH 2/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Topic: [Intel-gfx] [PATCH 2/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Index: AQHZcwOH/kDjy980z0uez++Ey+kzBK8zK00AgAARjfA=
Date: Wed, 19 Apr 2023 23:00:23 +0000
Message-ID: <BYAPR11MB256764399193463678A000329A629@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230419211219.2574008-1-fei.yang@intel.com>
 <20230419211219.2574008-3-fei.yang@intel.com>
 <ZEBhqBGTrNRfz0NK@ashyti-mobl2.lan>
In-Reply-To: <ZEBhqBGTrNRfz0NK@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|SJ1PR11MB6108:EE_
x-ms-office365-filtering-correlation-id: 48bcc648-1ac0-42c3-d6ee-08db4129db59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P8cQaHwLD3YG0exhws1y+8NQCU7MhWOpyywED3EyfaZ7Ri52H3EEsXr+rkS15CC+SJMztRhPpVWXRTkJ18J9Nxbrw1XTlZoMt/d0jpZWd3Cs7+zblnvm9sUkmb3xBl5y5YvUmg+OodK1nIPvM6YbNDfUaZtrxcfgNEZYQIuLBH+M0lYsBynGkSVYDo7amTEyqlkJdkRPUnY2JzXxsdA7H5vUDxbnB/sEWWz/jo7+Ea2Onz+n+JukzI5cz90/zBt/tpzt9Sc6QlLEB/bwp99oQebkmiviSrVs5QSAjVFKlTMrXXk1KGbIwlYglihDrEX5FyCBXrP5DB9soQNspoJOuN7KjnhFO2kc2rhp4xzrO6L2EYRbvInm0jP3W2YEO++13zJ/l1ovQsJO+Qfh/eum+r53CX18U4OTJbJP5FxVasfuJTa+rlInw8lKb0oirGdE6PR6v5jPxy6lCJMj+fWbbdtqq6vvs5YtPIeO5dpzGIkQpWGnBHOPaf6F8bnY6oB9BTbbJ2WS3OMjmsI6MS7VUP8PAvGIpxpACFV8vdRb2d/t4a9UPqwpbvSGRtojpMJA63gyJUcWaM9DJUz6nHKBuXhbdkY8HMY5QYrJWlUjeirtFnTDr7AkoUKflz3exDib
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199021)(55016003)(66446008)(316002)(41300700001)(4326008)(66946007)(66476007)(64756008)(66556008)(6916009)(478600001)(76116006)(82960400001)(54906003)(8936002)(8676002)(5660300002)(122000001)(52536014)(38100700002)(186003)(7696005)(71200400001)(26005)(6506007)(9686003)(86362001)(33656002)(38070700005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H79/KtAbM5C0sBctTDxwUoT7gYLMuQtrI/lKlEiFAEBGE/YULcoXlr2IQJTS?=
 =?us-ascii?Q?3Ojg1VhG7AV6xLtPsagA1AJl50o0VZDH1szeaCp0TDdsTOqH/ABzJ7TStcBG?=
 =?us-ascii?Q?HKlyyILc8n9N1sljvrKOEqkKZ4c4Hwp25ioZF/cM8thhAsbC4RVWmDFU4S4j?=
 =?us-ascii?Q?uOMrdeyiGFUR/kB223HxE7lfvC6wYszvg+5Ol9EQb4V6sgX3aDr9NfxqoIKp?=
 =?us-ascii?Q?LuhgKKZOjffi07a6LV6ox8vFA7yKmjFAaBi+QzRM+lZX6jDA1PL7ik5KQZD3?=
 =?us-ascii?Q?EHCFhxdANZQRvaR7/7uv4k4s2uOdG1a+9CbP+8KBDm7QLuH3tmdmJZoyP33c?=
 =?us-ascii?Q?dUi7woYC7VfXKk5sgbcyVNLl+bQrZid0vks3IZHr+apEu0hBWUve99vAeQR7?=
 =?us-ascii?Q?VUIS2DYlsYMpLYgUYD+d3OsjJzlG0SWplwjcjLsvZHaiQKGbxU/X0bzLND21?=
 =?us-ascii?Q?lxZHv9kGCmIWxsKj6UjHZuuHXJWV4C8KPY4R/EfpBAXXpFnQnvWOJ3+LHXbY?=
 =?us-ascii?Q?EaN7kyvizEnCcx2nyBrUGmkV6cq7YRQ36BQyotSDG8JC3vYs7NPgdwM2LqAO?=
 =?us-ascii?Q?p8bCYZ1Lu7PA1prI+HofQwuKg0sXtNzz6HnjR72m1iKYRN+WUtDXyEpC/2hB?=
 =?us-ascii?Q?lAnHssxeXQx6yamrF0XC6+BCaiLC0VvqltyyOMARM1mrbk/GR5ZtxpWEsKeZ?=
 =?us-ascii?Q?50jrC6KcwWbiOw5nkbVnwrwQWn3K7XNKj8ottOJBnu5+/IYN6TKb4PbdaCxH?=
 =?us-ascii?Q?QrU7gIO1oeMwf6zPTK+b6dzGC5Pt6sH7wLK8pIHabzCXLniLt2Zat1+feVpm?=
 =?us-ascii?Q?yVNi9RGaCJeLL9K1MHYvajuiWmJYd2FkVCWoOiQzGIZJFSGQlNOF5Nxnynrq?=
 =?us-ascii?Q?gjbdsrcXYhG+hsgYZ/0IgnVv0pf0G83CzY5V+CdWOx4hfHcpwP8QMLkCQc1E?=
 =?us-ascii?Q?2uPzRyV0gfw5gmGbkVph/UAkD5VF3e04paKN3JKI1Qe+jtbL2lfZJyw5z4Qg?=
 =?us-ascii?Q?RuWJEcnvimDj8wQ1gRwMoK5uDfvCuYv3D+PXHY3Y12v9edHN9trRvthhtc7L?=
 =?us-ascii?Q?LIsv/vJhWWnH8iXBkn3vcIJjgxCtA6eM//+QY7TgUNWdvbNfHiXLjei31wb/?=
 =?us-ascii?Q?1BH/W0S6vYcrH3d1yd2GsIb7VTe5p1nQ4EibieclcyaWCPH4nPQnJKjz3H2i?=
 =?us-ascii?Q?cMcjcK39RC3iI9tybJvPJ8caZX0bQCKHT6Htqz9BwGbyXHlIg5PKDT/JKd65?=
 =?us-ascii?Q?xEuOPHNbBZztMLxZ7HNe/8wb51Ue7bEaIUAEHFvCXWIEEFvR+3P0yJ/eJrub?=
 =?us-ascii?Q?khP+UIjfWahxJ7shNgqoVd7PySA2XmCNJbnR/qLlX1Grz05K49OpvtgtJagO?=
 =?us-ascii?Q?bsGE5A0zq/L3ACpJPqsucQ3JjeHrV3xwW4aEpvOrwv894w1R1OuJwGkBcpDw?=
 =?us-ascii?Q?ZibqoPOIQ1Gt56wuS1qvw0ShdOmh1uQv2VI8lTvvoQ+vubtbkEGiMVsHrSwv?=
 =?us-ascii?Q?4clXN8j15IUjda7K+OsqLBXzSeGnJf6W92keauMgMFoPWxr1Nej9FQHeYgNV?=
 =?us-ascii?Q?3r9TOFUuSHJD9CFeQpDXkEvg/9fjXqp60FOIqDIo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48bcc648-1ac0-42c3-d6ee-08db4129db59
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 23:00:23.2057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HiKN/YnQylM/xlf2rwUQLbbT7CpBu/Yk5KE8ShQK+ZycFGfTOPT3RSsocDUmfw8ZOObqq0GlKyiWLUkmL8xLRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6108
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>,
 Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Hi Fei,
>
>> +#define MTL_PPGTT_PTE_PAT3  BIT_ULL(62)
>>  #define GEN12_PPGTT_PTE_LM  BIT_ULL(11)
>> +#define GEN12_PPGTT_PTE_PAT2        BIT_ULL(7)
>> +#define GEN12_PPGTT_PTE_NC  BIT_ULL(5)
>> +#define GEN12_PPGTT_PTE_PAT1        BIT_ULL(4)
>> +#define GEN12_PPGTT_PTE_PAT0        BIT_ULL(3)
>>
>> -#define GEN12_GGTT_PTE_LM   BIT_ULL(1)
>> +#define GEN12_GGTT_PTE_LM           BIT_ULL(1)
>> +#define MTL_GGTT_PTE_PAT0           BIT_ULL(52)
>> +#define MTL_GGTT_PTE_PAT1           BIT_ULL(53)
>> +#define GEN12_GGTT_PTE_ADDR_MASK    GENMASK_ULL(45, 12)
>> +#define MTL_GGTT_PTE_PAT_MASK               GENMASK_ULL(53, 52)
>>
>>  #define GEN12_PDE_64K BIT(6)
>>  #define GEN12_PTE_PS64 BIT(8)
>> @@ -147,6 +156,15 @@ typedef u64 gen8_pte_t;  #define GEN8_PDE_IPS_64K
>> BIT(11)
>>  #define GEN8_PDE_PS_2M   BIT(7)
>>
>> +#define MTL_PPAT_L4_CACHE_POLICY_MASK       REG_GENMASK(3, 2)
>> +#define MTL_PAT_INDEX_COH_MODE_MASK REG_GENMASK(1, 0)
>> +#define MTL_PPAT_L4_3_UC    REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MAS=
K, 3)
>> +#define MTL_PPAT_L4_1_WT    REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MAS=
K, 1)
>> +#define MTL_PPAT_L4_0_WB    REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MAS=
K, 0)
>> +#define MTL_3_COH_2W        REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK,=
 3)
>> +#define MTL_2_COH_1W        REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK,=
 2)
>> +#define MTL_0_COH_NON       REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK,=
 0)
>
> BTW, are all these defines needed? Not all of them look to be used.

Yes, these are all being used, not in this patch though, but in the next pa=
tch defining pte_encode functions.
I think the only one that might not be used is MTL_GGTT_PTE_PAT_MASK, becau=
se I ended up checking each bit instead of taking the PAT bits out and comp=
aring against possible values.

-Fei

> Andi
