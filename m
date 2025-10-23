Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F9BC03A0D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 00:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD1710E969;
	Thu, 23 Oct 2025 22:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WiYdzLC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA22510E965;
 Thu, 23 Oct 2025 22:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761256970; x=1792792970;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mWNiPMndKjsF0yFOCmbMRvAh3+tf1nNOKFT7/7VLwnc=;
 b=WiYdzLC5ABUvXinnoAAClZdK5D/NWXFI6wjXmmtQ4QHqyVqAkISRMrOS
 QeF0Qr82Z0ypx7+oUS9t60m5IykTW5zg/9hC1GdRL+VZgwQ4LoJsUtwuB
 hJJrUzO9h7NbTivigqQCxQ2qZCmhGy5JxaFg6b3KT5l1uXAa62+qUylUA
 U+DHMHusZODIzHkIYzIuN+35WtQhSh4/oTX0vs0xVo24MAuPJGqj9KNfT
 WRx2SFO1bHek22zx+8fo1omEyH12c2EETUrYtRCwj0CCVyLFjIyjoT2Hb
 VLP29nkepWqoI8LVHr56NwcnbgDW5OyoZNnZ++490i02yE1YKdqHd8LLQ A==;
X-CSE-ConnectionGUID: U6X1lR3TQ1GZi8LOBUSIVg==
X-CSE-MsgGUID: v9iFkYo5RtSy3IPvNvSp7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80874890"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="80874890"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 15:02:50 -0700
X-CSE-ConnectionGUID: mvt1mqYfTXypcik/RKtbJw==
X-CSE-MsgGUID: IBO0tliGRAmBXv+HP6MoFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184750195"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 15:02:49 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 15:02:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 15:02:48 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 15:02:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLfnsm7cHW66Ngd4fBBEXgfgQceGds2kvSBU1Y8E+eMg8NjovuU8+aSz+BiFWdlDERzZ97PJSKtP8rwNiiaeqMkPON9P9IBOn2t7kgmcgSMZX+0yY1Jo3ONJJTNUw/FaJuhaXnXJJIwFyyQAOMUMs+vhK/GAhJ3tUoPIhF65aelac5dsURQaEk6FD3Qy6C8dbRwQ3vmWEPx99Bn/qgmeaiEt/DmzJk8MtQbmEPOJ+8diFwXuwviryz/gYHSedWiDLzg0TlheJZcL9tgh86C0djAW/LnHVQfSLV5EX94qUWnTV4BiNulWydNXhjBzmwUKik+one99AwvVgbZvPpg6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMW6SaO0TKCGeN+8YLK1C8n86HbCa1CbsMO1fQYZsW4=;
 b=Ed8mO8khJllUX2ooDKNuqDe79NF5jEHm5grySCHOT/Kb0Sj/w7KuCfsT7x2bIo6sWME2vgSPKfXk0e3YkKDD+JWjTkumafAMK9YdJHmTwOrjC1/CPLP/im1c8p8C3/z45Nm38HxvUDGbX0AmSsOwDJsmgAXlNMVd5m0XIMncLCOrQwDRbXLz5FzGZNjJiyMkAyngXqxcvWK+Vc7k/FGvNc2CsbXTEkthsi1E+hdTfzzjuD4XUdCss+Z9ZXkN2NXyx5ZbQlQe3MTQ0O6uMp0wkxBd9l1ETOQFsRXg9RXh4gUQ6c8NaPQ+zzvI/mSIghttZDBD+q8dv5Y0FjsTUNmIHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH3PPFFA27DACA6.namprd11.prod.outlook.com (2603:10b6:518:1::d63)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 22:02:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 22:02:46 +0000
Date: Thu, 23 Oct 2025 17:02:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Alex Deucher <alexander.deucher@amd.com>,
 <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "Michael J . Ruhl" <mjruhl@habana.ai>, Andi Shyti
 <andi.shyti@linux.intel.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 00/11] PCI: Resizable BAR improvements
Message-ID: <w35eozxuh3netnt5kdwuqp7bespytvsyn2smznlrcigjb24eeh@amk26j7ihnpl>
References: <20251022133331.4357-1-ilpo.jarvinen@linux.intel.com>
 <20251023212943.GA1323026@bhelgaas>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251023212943.GA1323026@bhelgaas>
X-ClientProxiedBy: BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH3PPFFA27DACA6:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca525ed-bc2c-4421-b475-08de127fe5c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wdTgsEkuNcC8WF24OhT3tc5mY9i0ZweCsSeGKaSaU1udgMbpxoLnXaJ10o?=
 =?iso-8859-1?Q?nhJhQC8ZNyMI8uErMuqoJN2srHAm1/acygsQ85802NcEPxD+pvDQLbXEKr?=
 =?iso-8859-1?Q?R4Bvn6jSgsqzDtycWOGwfYD6KHNUKDjjOluLkZAsCFGI+QjdyAa2voEfYC?=
 =?iso-8859-1?Q?zENkcumZuTgEf5Z4W/ymUUcZEtPyAj61kDznbfFaxa7k6dzCQQv2mWpNLe?=
 =?iso-8859-1?Q?qAA41vw20yACkeC5GM6MJfuyJ+ZfwV5TKvUdBRtxgyVR27G0T5oNSV8qtu?=
 =?iso-8859-1?Q?wtJRWPmku1NtM95EmMFqxGs4iF814WDH3NY4gjEiIEtV73VaRdr4QrGhOd?=
 =?iso-8859-1?Q?shs3bTbJhytJ0bqw4bpBtVv03wNkU2H64Pkz3IovPkE+37Hvgr/25W+MMo?=
 =?iso-8859-1?Q?j4GyzSzebddAMMPR4sd0s2bhXw17/LrnLBJAIj8wHRnoSGj1JQUd6mFbcP?=
 =?iso-8859-1?Q?Z6Wn8Lc78YgDwTXki2aXSsW66niADv0Cz3yyg1SgK41jjxrPmtanIe8W1b?=
 =?iso-8859-1?Q?HRnExBb/swDn6+9LV+DpOwXrE8S65yR+HcfzVp+6BHBprj7NuNzFAWrjB6?=
 =?iso-8859-1?Q?SteYtrWnVGO0xxOZBnu9A0BZGJoNR3U/I4UIzj24VpotNNrKDwby9R69sy?=
 =?iso-8859-1?Q?f3PDDbfVKn3xIQ9gRCBxsctpGnLbd/cs+L5NYzqCCwbqegGy0p64TFJRGb?=
 =?iso-8859-1?Q?h2ktx+W77PowcSsTT+lLOGuf71QuNedB8e67IDVDvW4uBWw34npamfYfa2?=
 =?iso-8859-1?Q?beoheD7OBZd50oH+1tfsco4cdPu6CDVPXVRSfdsYtwN9wFQASzk50uuQm6?=
 =?iso-8859-1?Q?EpHHdVaDUb1MHXiyDJPKdErgYD9OF7sYmJxI04s48vEbCtmgOh+Wbwg+SH?=
 =?iso-8859-1?Q?SBcmHHRCx2jfUznD6CpD/mtmh9NZiBZdoV9RIYgTEptNNTtZuLj0nTExXD?=
 =?iso-8859-1?Q?pdAn9udOPtjrgrJVk+cGwc1Lhh+o5UJoNBsQBxsjZ8cZ0IOmV23SqTgJnu?=
 =?iso-8859-1?Q?mFq8/DLCaT0hmLmbvyDOz3QHgDGC5tHWKtTil/EHIxBkcqW2cfkQfk8pRa?=
 =?iso-8859-1?Q?JasMWS8kY+NFIzVqkfOUz9qCx3COyBvv1bWx8QaT0/ZXK6rZZ8qgVzX931?=
 =?iso-8859-1?Q?IUdWsJYhroFAuESlxhrotx+oxC62wtguY66NWEu2jbL+uqLySaVQUuaxDg?=
 =?iso-8859-1?Q?FBtgAqKD4cYFB5NFfX3KZBIQ/PQevXE2vBG4vkfEvlB+Fc5DRsIRXoD0X0?=
 =?iso-8859-1?Q?W6xNLmkZBmaumRmHgYd2wYVnA0wcxm9tV/H+dAPaY1rwWOLtBs63WUjhkm?=
 =?iso-8859-1?Q?zWvvzX5U3DkER41pPIK9l/oithP7+XWi7BVdl2QQWPrGk0kmvpUliAnJDV?=
 =?iso-8859-1?Q?TO24k//88yhmNYVfOsoh5452SsBCTyyxnQwrNYNOeiPSMVIjPUPrVH/AZ3?=
 =?iso-8859-1?Q?2zlO0Qi9lcnIgsGxTnceld1mV2E5NH+wjYtqzzCAG9N0IOc/URHkWqUvOD?=
 =?iso-8859-1?Q?/gqyB4LGMsAkvVSxmLII7zaChEAuTCzO3ibGlRQ2HkYQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xx8URrOg3v9/dxpVreVBGhBpM2Q6XVfIH/pMJEHd1yJuLbmJe1HBl1Gpg1?=
 =?iso-8859-1?Q?27RZPfVGUqrZiJvfVIagWgAdnJV/nG0Mo58b8HJZm59aLYL86eh0LiTUyV?=
 =?iso-8859-1?Q?Hv2qCBcxKYAh/69092Cg9jw1fvt4Wj32r9SnSGHbTmMvyBuVB7Rtb3icCX?=
 =?iso-8859-1?Q?dbCkw9DvyohyJObVggqUBo643pPCZwbc7svCmxPm4Kb1IkbeOPRD825nE+?=
 =?iso-8859-1?Q?KyMcGSmTSDw3uMBZupH7yxocmAgyziuJhL9telMQ2qKdxvyTmzIuDIeTOc?=
 =?iso-8859-1?Q?/zzY4+DGa2DzT06OXSFr9YKYHTcSvqmakBE+qHbtc2jL7qA3s9W514dU09?=
 =?iso-8859-1?Q?wuuPJSekvCi+EZEl1p52G9Z4eRak6l5P1enqokNZUWamvBZyDmgZRgkQR8?=
 =?iso-8859-1?Q?4qdmRpjIyt6VESXviPb1o/HW5+RW2Nu7wLpIfKnL8sX7w/5/RadblPuyRY?=
 =?iso-8859-1?Q?ta1oeqNWW7FSIGOo0lftoOJ2u1IGHBoZdB5Xp6MYor8L+MBsgGgyIxKJQB?=
 =?iso-8859-1?Q?NlkgKHr7MRRyHVGEtO4BGNKn7FeyGuv62JIZPFYpyscuXwYYCpL3s8Jh9K?=
 =?iso-8859-1?Q?OW82m2iKpUwpq2DAWVNFZUknr23+6jU9WgOk9xpvKiIsXG2E8mwyQWcBVl?=
 =?iso-8859-1?Q?rttFb7xWePuX7roOVurCl0IxCd1dXan3moJUIl+Me3tAjIdCb0igcRYwk+?=
 =?iso-8859-1?Q?4XGD7bLDz8KFxqDkz3xfTflCVJwdn8BFGZIwSKW/FMFor8f57nSWO3RFzu?=
 =?iso-8859-1?Q?L6brDL0hhqugGbvI0dhCtik38Wtqi3pihhp7g3oogNEGF6dfcInCZIsKeu?=
 =?iso-8859-1?Q?fKgYvm7C8KC6NO9ZkqNnzR6bKEN8keKYWalrk+jw+5r/cNbuSZzHsS0gjq?=
 =?iso-8859-1?Q?XXhceGONg2NL2BmDOXThOvdGRqQFTpsTMQq9ojX+qQ3h/yS0wuhdae9T2G?=
 =?iso-8859-1?Q?ucDHDmI8hjIzzF8bFj9mU1wJ/pA8vge0jylj0ncxRnKI7jqQ9tuzbKNpcy?=
 =?iso-8859-1?Q?uctvN2okITgJEsrUnVzpj0qPURy/7EDiPU01mE8IY7FEZ4Km14xDeuV3rl?=
 =?iso-8859-1?Q?NwtbZpNH379jHsprVR9MDwh11YZS/elVa2dXXTA6kClw3JW/X6ALQzDCtd?=
 =?iso-8859-1?Q?eCucw/U8cZuDNDAwafRuWfuyaw/TpnHG5taT6Xdmq04i2Eyec86ei2C++V?=
 =?iso-8859-1?Q?B5sYqPjVk5u0mGMtG7NW5YFvb8UEJ01BOgcQ8hCUsu2WMd1Dl30La6uZLZ?=
 =?iso-8859-1?Q?wIx7rUEfc6E6dpQRHVkr7bAw1J/ICVcVtciHg0FDSVPOiu24oZHvhWzKAp?=
 =?iso-8859-1?Q?14JBsVT1s4mF2aOuLvh+mqOVaHFCjiRK7yyGO0XhvlZtiDI3nMCkFpw+OO?=
 =?iso-8859-1?Q?TLErWTJA1ksS0OCVd6WUhDVWS3eA8Ur+bZu2SLN3QL4jEh6Gw0XWDjtWLq?=
 =?iso-8859-1?Q?y4z9MHDyuWw157bfvnkMdMDd62uYkY0IJIHteikRmGI0eG+4gOe0OLa+Yo?=
 =?iso-8859-1?Q?X9O0Zy98mh5vSyH2WIiBqLXlggIsGlPXVKGnATcds+tFMU/3o+T2MfZpsc?=
 =?iso-8859-1?Q?4xyC9m/148/2JU8DJwfu8BCaUaaRiY1igSn3FWfk36stg0ztNCMZJBRBnd?=
 =?iso-8859-1?Q?+PcMkhbz63eCNr1HswMAK5E2EQWE/ULTeW2fq7Y0gZ/YBb4zHnck4kpA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca525ed-bc2c-4421-b475-08de127fe5c9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 22:02:46.0155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4p6/TnUAdOQ2CF7I3BY9sCzuaWolzrFTyFgrTocO+Sja9yYuWWNFlI+8iu5LMLTri9760JqiE/Zw0jR8g/HYqXdYQoegOTNukW0LLhUhlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFFA27DACA6
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

On Thu, Oct 23, 2025 at 04:29:43PM -0500, Bjorn Helgaas wrote:
>On Wed, Oct 22, 2025 at 04:33:20PM +0300, Ilpo Järvinen wrote:
>> pci.c has been used as catch everything that doesn't fits elsewhere
>> within PCI core and thus resizable BAR code has been placed there as
>> well. Move Resizable BAR related code to a newly introduced rebar.c to
>> reduce size of pci.c. After move, there are no pci_rebar_*() calls from
>> pci.c indicating this is indeed well-defined subset of PCI core.
>>
>> Endpoint drivers perform Resizable BAR related operations which could
>> well be performed by PCI core to simplify driver-side code. This
>> series adds a few new API functions to that effect and converts the
>> drivers to use the new APIs (in separate patches).
>>
>> While at it, also convert BAR sizes bitmask to u64 as PCIe spec already
>> specifies more sizes than what will fit u32 to make the API typing more
>> future-proof. The extra sizes beyond 128TB are not added at this point.
>>
>> Some parts of this are to be used by the resizable BAR changes into the
>> resource fitting/assingment logic but these seem to stand on their own
>> so sending these out now to reduce the size of the other patch series.
>>
>> v3:
>> - Rebased to solve minor conflicts
>>
>> v2: https://lore.kernel.org/linux-pci/20250915091358.9203-1-ilpo.jarvinen@linux.intel.com/
>> - Kerneldoc:
>>   - Improve formatting of errno returns
>>   - Open "ctrl" -> "control"
>>   - Removed mislead "bit" words (when referring to BAR size)
>>   - Rewrote pci_rebar_get_possible_sizes() kernel doc to not claim the
>>     returned bitmask is defined in PCIe spec as the capability bits now
>>     span across two registers in the spec and are not continuous (we
>>     don't support the second block of bits yet, but this API is expected
>>     to return the bits without the hole so it will not be matching with
>>     the spec layout).
>> - Dropped superfluous zero check from pci_rebar_size_supported()
>> - Small improvement to changelog of patch 7
>>
>> Ilpo Järvinen (11):
>>   PCI: Move Resizable BAR code into rebar.c
>>   PCI: Cleanup pci_rebar_bytes_to_size() and move into rebar.c
>>   PCI: Move pci_rebar_size_to_bytes() and export it
>>   PCI: Improve Resizable BAR functions kernel doc
>>   PCI: Add pci_rebar_size_supported() helper
>>   drm/i915/gt: Use pci_rebar_size_supported()
>>   drm/xe/vram: Use PCI rebar helpers in resize_vram_bar()
>>   PCI: Add pci_rebar_get_max_size()
>>   drm/xe/vram: Use pci_rebar_get_max_size()
>>   drm/amdgpu: Use pci_rebar_get_max_size()
>>   PCI: Convert BAR sizes bitmasks to u64
>>
>>  Documentation/driver-api/pci/pci.rst        |   3 +
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |   8 +-
>>  drivers/gpu/drm/i915/gt/intel_region_lmem.c |  10 +-
>>  drivers/gpu/drm/xe/xe_vram.c                |  32 +-
>>  drivers/pci/Makefile                        |   2 +-
>>  drivers/pci/iov.c                           |   9 +-
>>  drivers/pci/pci-sysfs.c                     |   2 +-
>>  drivers/pci/pci.c                           | 145 ---------
>>  drivers/pci/pci.h                           |   5 +-
>>  drivers/pci/rebar.c                         | 314 ++++++++++++++++++++
>>  drivers/pci/setup-res.c                     |  78 -----
>>  include/linux/pci.h                         |  15 +-
>>  12 files changed, 350 insertions(+), 273 deletions(-)
>>  create mode 100644 drivers/pci/rebar.c
>
>Applied to pci/rebar for v6.18, thanks, Ilpo!

is this for v6.18 or it's a typo and it's going to v6.19?

>
>If we have follow-on resource assignment changes that depend on these,
>maybe I'll rename the branch to be more generic before applying them.
>
>Also applied the drivers/gpu changes based on the acks.  I see the CI
>merge failures since this series is based on v6.18-rc1; I assume the
>CI applies to current linux-next or similar.  I'll check the conflicts

it tries on drm-tip that contains drm-xe-next going to v6.19. We have
some changes there that conflict, but shouldn't be hard.

We also need https://lore.kernel.org/linux-pci/20250918-xe-pci-rebar-2-v1-1-6c094702a074@intel.com/
to actually fix the rebar in some cases. Could you take a look?

thanks
Lucas De Marchi

>later and we can defer those changes if needed.
