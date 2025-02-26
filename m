Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A223EA4549F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 05:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35BF10E204;
	Wed, 26 Feb 2025 04:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HsCfzMll";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE2B10E204;
 Wed, 26 Feb 2025 04:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740545162; x=1772081162;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jnxy6ga6BubTIGtNNQO5nGyGQ9DGWPubMdygymKpSgk=;
 b=HsCfzMllCe/gEWjlk9zmQdxMtrVgvosDH57e0tfY35lg9Bh1jzKPdPmJ
 0LKsf+ufV5PtpfWeYEYDStO5oCnqGVmO7+RNMgbfWoCpnsTPJivNpoPKE
 WzsVGxAAVZV/EjcRV2j21jVDD1Y8Ctnl6rTM+MocOoaywBcxLO/ptMCM1
 C00knUDeieUsK0gLErDNXvZvEjakq2I7z56BmDWo/yqKdXFa0XVoUXmzK
 5G4FABt35VHwTo9IPZsmZL+ys85RQ9JLoUxP7EBjOj2mrAPlwL1hfgRPF
 7fixHHVs+tz1go7KGNkPeUiZlBtBA5aMscoOD7YoS3rieP0nz6vEuU61Y Q==;
X-CSE-ConnectionGUID: DNLOTcu7S7ayDQ6dk0/OjA==
X-CSE-MsgGUID: KNLQfqHkTk+XfrrKnS3OyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45027556"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="45027556"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 20:46:01 -0800
X-CSE-ConnectionGUID: 62Y4m79nT0Guo3wqlO8Faw==
X-CSE-MsgGUID: hsgDZ8/tS7WU18CWAhh9NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="147417887"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 20:46:01 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 25 Feb 2025 20:46:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Feb 2025 20:46:00 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 20:45:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFCiJ//amuYX5hgALlqbAWu8bItUWcmlklrTUxxz8+sKMSY6XaxoSCjXU1PJRYoJEuGMbJv3HbNUaiyMISBW9GN5QlH4eg7TDFc43ClbQ/aic/ddR67F0azCQ/6siVXSerukbDotJI6qTq29Jsut19WvvWTUxMHCVPu1Pu2hcByLwpKtxGC2DPZMtgw9dJykNjg406FvgBSZYxvYSBvSPohUFRuYfDz9JKwQq8430riYbhs0yoAVuKx10Zdq6HDME6Sa03qG6W3YPOJJmlE4NkZKj+49HDYvYxb7UK1TrIZAmQQxsUwfMbCUrG/51axMKw+b1/0koixT225aGvrZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZyqS15CT1Qk6liFSUfb7GL1z4wIbdR2c0hZFx21voY=;
 b=KTk0Pi9ewTErRaS9PNQVhgu+H45j6AiEB2fYweXqI+8QXe8X3rxg3yfDF+1us0kNOWNEkKemNOP2ssredIEMvCpLFF3zfK9vD0wKBRlnZ4c66hsh+XzmKFusxci286FiluSHf/49cKZeQWSApjbESIMLj/05DTPpMj8Esh2rXQeFs1U3rcrJiqfMZbbUCUsyJiuYDDAsBs05DO16+Wl5vEABli4vRtSINacztl92MedQVu2C46TvAgRZBzK1TMonApLItWtCiI4rdYcXycP1gJmCc560nAirPmI/0w1UI64uW3+ODp/1oah5IG9my8v3qmtpxfGXiTF0Q8LmlSB6pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5804.namprd11.prod.outlook.com (2603:10b6:806:237::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 04:45:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 04:45:15 +0000
Date: Tue, 25 Feb 2025 20:46:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <jeffbai@aosc.io>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>, Francois Dugast <francois.dugast@intel.com>, "Alan
 Previn" <alan.previn.teres.alexis@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Mateusz
 Naklicki" <mateusz.naklicki@intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Kexy
 Biscuit" <kexybiscuit@aosc.io>, Shang Yatsen <429839446@qq.com>,
 <stable@vger.kernel.org>, Haien Liang <27873200@qq.com>, Shirong Liu
 <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>
Subject: Re: [PATCH 2/5] drm/xe/guc: use SZ_4K for alignment
Message-ID: <Z76cmt5mKFU1akX6@lstrano-desk.jf.intel.com>
References: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
 <20250226-xe-non-4k-fix-v1-2-80f23b5ee40e@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250226-xe-non-4k-fix-v1-2-80f23b5ee40e@aosc.io>
X-ClientProxiedBy: MW2PR16CA0039.namprd16.prod.outlook.com
 (2603:10b6:907:1::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: a6029fa1-3b39-4312-8246-08dd56205c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGlKdEhwTng2Q3JtUHBEMXBURURZM2JwSDZvYWJQczl4Y2dQMHJYeFBFTkZj?=
 =?utf-8?B?Ni9McG8xV2R6MHRLSmN5RFlXaHdFNms0cFZPOW4rVmNCaHhRSnFzQUxRaVhQ?=
 =?utf-8?B?bVFzNWZiclYrNUI0cTFMQjV5TGZEY00wNDBVRXh5Vk1kbG1NMS9XODExRzZl?=
 =?utf-8?B?dnN6VXNjb0J2WUQyL0xWYjc2ZlgySmZIbFZkaTh4bjl2RXpKd1BKVENWL3BX?=
 =?utf-8?B?MDkxQU5RZXRlVTFCWFFJRVZXU2xrSmpqTlpQV3RzUDluSzR1VnBqWUNGQ3lL?=
 =?utf-8?B?ODZYY05BYXF0TkNYRyttVFErL0NlSHpINmpvaElEUDc4VE52SGtrRzYzZkdL?=
 =?utf-8?B?Z3dnNVM1a1dVQlAzZXBWclNhUFVGQXI1OEo4MWZTbDVIRndXK21rMTVVRCtZ?=
 =?utf-8?B?cmJzRys2WnRqeG13VUkzWDkzcGw5S2FFVURIZ3QvR3BlTEdOUGxaR1gzY1Zs?=
 =?utf-8?B?UVg4MU9ETXB5SWZSUTBUV3VxZjRoWVVwUXU5Q1NaVkR1OFVpRlF6UDUzMHZz?=
 =?utf-8?B?dDRBT1UxQTRTR0JmQURxTW5YV2RTNno2eUd3M1o3MmE3ZGY0b2ZBUWp3N0Vj?=
 =?utf-8?B?eU11OHY4ZjFibjlRNEFNL2lSRHphcjg5NU92RTRsT0wySStSL3dxSFE4Zi9Z?=
 =?utf-8?B?Q2RSV1BtS3ZpZys2RXJBNEY2THJyY0dqMnFlUzVGU2hqbEJZQStISFc3Q2pO?=
 =?utf-8?B?MmY4U2tVSXF0NHBmdXZoSC96a3FxR3dOR0FJdytEMDNFcm5VZHFYK2pLYlp2?=
 =?utf-8?B?TUdQN0NvUFM1REx5Mk1jZDZER2M0cllETDB3MHg3VzFGZDhlTnM0aUU3bHFN?=
 =?utf-8?B?ZEVpK1J1QUVHS0JSajhDTTZ3T3RSRnhUaXVvN28zcXJWRm44TmtEeDlJSStX?=
 =?utf-8?B?Vng2MlBaS1FoalQ5REZWdEJORUJmUG9LdTJodHlWWm5KUnVuaXpia0JYeFRh?=
 =?utf-8?B?NFdjeDZzaDE3bWh5SWl0dmIxZHBrTDFMNTFHcm4rT3dZSkMzN3dXODdUYWNt?=
 =?utf-8?B?ZGJndGE5Qk41U1d4UnlNUmY4cDJycnMzeGtpRysrSytxNzcxcS9BMVoxVDkz?=
 =?utf-8?B?d2tHUXJ4WW52TWJMU05FT0ozcCtzaG5LaW5vR2xuZmtLbFljVE5QNFdqZHJW?=
 =?utf-8?B?K2UwZUNBRk5KQVFhMjk0L2xRVFpVdkVDbFlYZTRuekFuMWdFR2k0Y29GSlN4?=
 =?utf-8?B?THZEMThKT3JlOTJJVEJnKzB5SmlFMXBoRjVCdCsxV1FaMG12Y3NKWlVnSFhm?=
 =?utf-8?B?SUdobzhEbFRYdTVqeG4venFPeWJEQWdpeTMrZ1ZacE9URjZLV1VHcktQajc0?=
 =?utf-8?B?bUI4NzIvcTljSWNiaWtxbjhXUEdHVnZFMHFTTS9ZNytwQ0JVY2l6Ty91cms1?=
 =?utf-8?B?ZDR0S1RUK0dUNmxwTW0rTnRSOVhlTVdiM2NmOERzeitGWmFSU0l4dndaNVh2?=
 =?utf-8?B?KzRnK2VzSTFacTV2dm13alRBOFFJRE1uU1lnM2pzV2tpUThwMGZ1QUl1Mklh?=
 =?utf-8?B?VEhKNzlPd3ROVEQwK2RPYWZKR2picVRjY05BRTFNU3VEY0N5Z2hOYUw2ei81?=
 =?utf-8?B?ZWZxaGFZTDFtRnhIb0kzM2JVdTM2cmppSm9ydG40OWRqU0ZJbEk3SWRSbElI?=
 =?utf-8?B?Qk40Q0JvKzlQVlNXenE2N0p0Nk1zWkx0TklMRkdiUUcxck8wNGxUWksvOG5N?=
 =?utf-8?B?RGpwT1ZxSjBXc1ZFMEM4RCtoSGRXU25GSmNpVUxpd2NOQ2Y5TGlpVDMxTHJJ?=
 =?utf-8?B?ZlZkVmQzRUs1RXpFNGlEKzh3VjJvODBDTkdxRkd4K1drRFZ3TDNrYXpWcEpJ?=
 =?utf-8?B?bHBWSzBEU2JtWTdSWFVlQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDcyYzgzY0ZkQVB0ck1nT3ZwL2lZNStzdTM4N2hxeTQzK0VlVHZEaUtqVkxR?=
 =?utf-8?B?dUJsc0EraEg2U0tTWHE1T0hRcWcxdXBnd0hIQ3ZEckV6ZmMxQXN5WlYyVnQ1?=
 =?utf-8?B?SXZhQWw3cW1xUEJaR0pNWUVsNFJKbHhGS0Z2ckN2Nko2dXE0WHVWTzltTkJ4?=
 =?utf-8?B?UFhRVVB5ZFN3WkIwZzkrYmFXV3hLRWdDUXkzZDZtTDZLOGhlTG12OEY5T0ts?=
 =?utf-8?B?YWsrYng0UElpSXdqVW93TDNXN21oR3JxdEN0T0VmVXgvdW1Xbnp2Nmpmb2cw?=
 =?utf-8?B?QVYvU2dtcUtvRWlmVTJJMkZhU2Q2YWVoUnNkSjd0V0I0ZU5kaEx3ZGY2NkE2?=
 =?utf-8?B?aHdOb1VzVWl0THgvaWI4RGQxYUxMeUFoRC9rQzRNcXFOK0NjRFpkSkRXd29l?=
 =?utf-8?B?QVluWnJndk1HTlVnSEtqaGNuMFRiZzgzRkd5U1ZvQ0NLVFVPdVVmVVMwekVE?=
 =?utf-8?B?VlVzejlIcC8wb1dnN3Z5WjZjRmxETlNYeVFXS3J3MndFaU5TcnEzWngwNVMy?=
 =?utf-8?B?M1BzV09DZXFXNnpReGZxNHEzdmUrK2tRZjlydTVXdXhZbVBpcXovTEp0bWZX?=
 =?utf-8?B?aVdMZThkQUZFNXZ4Z1JHNHZBbHFYQk1ucDBoNjBCaGI2UGNEbHIwMXFvU2t5?=
 =?utf-8?B?WHhkb1NJSFVXd2s0UDhYS0RrN0NWdy81ZTRLNksxc21TbDZLSlpiTEFEUXJQ?=
 =?utf-8?B?WlJrUUhNK01sS3FrLzdteW45VE91a04wZUdJYzNSQUpqSDloWENsWndoK3Vm?=
 =?utf-8?B?RTFuTlJGeXhkT0gySjI2QUE4U1dLT09QUUJCV0ovWlhKUUlOV3ozd3hJZTV4?=
 =?utf-8?B?Q2o2OHY4bnpyd0VsTlVkd1orYURUV093TmhadmxMZHVHa01NQ3NteDRHOGdq?=
 =?utf-8?B?TUtWSXgrcU1RWmxnb2Iyd1VsMVAwZkpRZGQwbmRlbkU1cmZPZjQxUjBDc0xo?=
 =?utf-8?B?aXlDM1VoZlN2M0prcjJVNG8yRjZSQmprTHNSeHc5Z1l0bEdUSkd3NmxJMlZi?=
 =?utf-8?B?OHA0S1B6aHBSUS8vOEU1K0hObGtFN3FUQUFaWXdFUVdlMU50NHVIOW1Jemc5?=
 =?utf-8?B?aUxwTFhHWHJqRFR5RU9KT0RDRGJhQzBHTWFiL3BHc0xhLzBDZ054ZVdweDZN?=
 =?utf-8?B?elg4NlRiaVlYSGdyMDlCRnoweFJTU1dDYlpOeFBQVkVmN2xKZmtzV0VkWlZW?=
 =?utf-8?B?eVNrUVhoY1NsbWFVUmhHcDUvbnlLZXhaYVJzRTVTL2xTZEN2UW1GVlpiWnpy?=
 =?utf-8?B?NCtqSDRrekl5ZnNnN0IwNmo2cUFVYmxSajV6bUU0UnlRK0ptUTd1TFhpYmNv?=
 =?utf-8?B?TllPNDJoYk9OeUhzQnM2VTZpaGJtMHJjMy8xMnpXOTBCQ0Y5cmVkMjRrNFRH?=
 =?utf-8?B?cklaUDNUd2lWYThDUVZQWmxmNXAvT0JFTURLU1BSTVBHbXJkcFE2Q0NFelVC?=
 =?utf-8?B?RHJ0S2tPU2pPNjJyTmlFNnNFT0VkSkZSYkJjeTN0NnV6T20yWmgveTlmTVVS?=
 =?utf-8?B?dDBiOW5FM3N4QUk2S0UwLzVzYWN5dTN3blBEL09raHdTSTFQUnQ2MVFEMUxz?=
 =?utf-8?B?c3I1MXhadFIzdTBaL0dodHhyS0pUSzEzU2syZVlQQVkvZUpBSzlIWWY1T2pR?=
 =?utf-8?B?NkcrT29TK1hJMjNxa3lWUlhiNlFCNTIvWUsrU1l1Uy9ESzVneWZhblIvWnl0?=
 =?utf-8?B?Vk9BQmt6MnpIamFPV1dDMitIc2x5MGR4ZlJ0RXoySWFhSnFJRUZmWVZCSjYy?=
 =?utf-8?B?a2djZHhwbTIrVzIreGhOVXVYWitRRWdOUHRteE5ockdOcTIrR3hHTXJyQ1Iz?=
 =?utf-8?B?OVBiTEpLSzBjbWJFdW9aM1dPT1FYZThTRlc5Y20raG5aT0FsTjcwdXlTRVdT?=
 =?utf-8?B?SlRlM3hydng4elhQTzBEdm9ZQTV2RitoZDZYcHhCMkFFL1N4ZDBkQ2FaYVVo?=
 =?utf-8?B?aEwyaTJnUUJkK0J2ZGd6ZjRsbkJGRnlGazhFMm9lV3krdWtlRkV1bUlEblJN?=
 =?utf-8?B?L25xTWl4TXl6NXoyZzh1OHRQRzhvdWx4OFlFSHVpaEFvUDM4RVhoTmErT0hm?=
 =?utf-8?B?SVVSajdxcnU5QmdDZjIrRUFwWHRNTXk2WTkxWC9ScU9pemZPeGg1by9zWlhB?=
 =?utf-8?B?aHkzQjhqVnh5bFhHY0lwQkpvdUduYkF2OXlhVS9YVDl0b3gxbFpsTithVzA5?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6029fa1-3b39-4312-8246-08dd56205c99
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 04:45:15.0190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1I9UcQisaU740Y8DI8Gkda6fjKiMa3BejYyXbOHpQP2pG6Df+luF626aOR057Jdljeoc/BTG4gQ1ZqRW6gH6hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5804
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

On Wed, Feb 26, 2025 at 10:00:19AM +0800, Mingcong Bai via B4 Relay wrote:
> From: Mingcong Bai <jeffbai@aosc.io>
> 
> Per the "Firmware" chapter in "drm/xe Intel GFX Driver", as well as
> "Volume 8: Command Stream Programming" in "Intel® Arc™ A-Series Graphics
> and Intel Data Center GPU Flex Series Open-Source Programmer's Reference
> Manual For the discrete GPUs code named "Alchemist" and "Arctic Sound-M""
> and "Intel® Iris® Xe MAX Graphics Open Source Programmer's Reference
> Manual For the 2020 Discrete GPU formerly named "DG1"":
> 
>   "The RINGBUF register sets (defined in Memory Interface Registers) are
>   used to specify the ring buffer memory areas. The ring buffer must start
>   on a 4KB boundary and be allocated in linear memory. The length of any
>   one ring buffer is limited to 2MB."
> 
> The Graphics micro (μ) Controller (GuC) really expects command buffers
> aligned to 4K boundaries.
> 
> Current code uses `PAGE_SIZE' as an assumed alignment reference but 4K
> kernel page sizes is by no means a guarantee. On 16K-paged kernels, this
> causes driver failures after loading the GuC firmware:
> 
> [    7.398317] xe 0000:09:00.0: [drm] Found dg2/g10 (device ID 56a1) display version 13.00 stepping C0
> [    7.410429] xe 0000:09:00.0: [drm] Using GuC firmware from i915/dg2_guc_70.bin version 70.36.0
> [   10.719989] xe 0000:09:00.0: [drm] *ERROR* GT0: load failed: status = 0x800001EC, time = 3297ms, freq = 2400MHz (req 2400MHz), done = 0
> [   10.732106] xe 0000:09:00.0: [drm] *ERROR* GT0: load failed: status: Reset = 0, BootROM = 0x76, UKernel = 0x01, MIA = 0x00, Auth = 0x02
> [   10.744214] xe 0000:09:00.0: [drm] *ERROR* CRITICAL: Xe has declared device 0000:09:00.0 as wedged.
>                Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new
> [   10.828908] xe 0000:09:00.0: [drm] *ERROR* GT0: GuC mmio request 0x4100: no reply 0x4100
> 
> Correct this by revising all instances of `PAGE_SIZE' to `SZ_4K' and
> revise `PAGE_ALIGN()' calls to `ALIGN()' with `SZ_4K' as the second
> argument (overriding `PAGE_SIZE').
> 
> Cc: stable@vger.kernel.org
> Fixes: 84d15f426110 ("drm/xe/guc: Add capture size check in GuC log buffer")
> Fixes: 9c8c7a7e6f1f ("drm/xe/guc: Prepare GuC register list and update ADS size for error capture")
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Tested-by: Mingcong Bai <jeffbai@aosc.io>
> Tested-by: Haien Liang <27873200@qq.com>
> Tested-by: Shirong Liu <lsr1024@qq.com>
> Tested-by: Haofeng Wu <s2600cw2@126.com>
> Link: https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c32410a077b3ddb6dca3f28223360
> Co-developed-by: Shang Yatsen <429839446@qq.com>
> Signed-off-by: Shang Yatsen <429839446@qq.com>
> Co-developed-by: Kexy Biscuit <kexybiscuit@aosc.io>
> Signed-off-by: Kexy Biscuit <kexybiscuit@aosc.io>
> Signed-off-by: Mingcong Bai <jeffbai@aosc.io>

Reviewd-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c         |  4 ++--
>  drivers/gpu/drm/xe/xe_guc_ads.c     | 32 ++++++++++++++++----------------
>  drivers/gpu/drm/xe/xe_guc_capture.c |  8 ++++----
>  drivers/gpu/drm/xe/xe_guc_ct.c      |  2 +-
>  drivers/gpu/drm/xe/xe_guc_log.c     |  4 ++--
>  drivers/gpu/drm/xe/xe_guc_pc.c      |  4 ++--
>  6 files changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 408365dfe4eed02336bbd208b60491aea27a8a6e..595873780a5774501f04b2f01ebdf8a45c7ac931 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -88,7 +88,7 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>  
>  static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>  {
> -	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
> +	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> XE_PTE_SHIFT;
>  	u32 flags;
>  
>  	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
> @@ -141,7 +141,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>  
>  static u32 guc_ctl_ads_flags(struct xe_guc *guc)
>  {
> -	u32 ads = guc_bo_ggtt_addr(guc, guc->ads.bo) >> PAGE_SHIFT;
> +	u32 ads = guc_bo_ggtt_addr(guc, guc->ads.bo) >> XE_PTE_SHIFT;
>  	u32 flags = ads << GUC_ADS_ADDR_SHIFT;
>  
>  	return flags;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index fab259adc380be28c79fae5946e123427359ec60..65e88ad43e8adef752889300abd0197a0ac4a1a3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -143,17 +143,17 @@ static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
>  
>  static size_t guc_ads_golden_lrc_size(struct xe_guc_ads *ads)
>  {
> -	return PAGE_ALIGN(ads->golden_lrc_size);
> +	return ALIGN(ads->golden_lrc_size, SZ_4K);
>  }
>  
>  static u32 guc_ads_waklv_size(struct xe_guc_ads *ads)
>  {
> -	return PAGE_ALIGN(ads->ads_waklv_size);
> +	return ALIGN(ads->ads_waklv_size, SZ_4K);
>  }
>  
>  static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
>  {
> -	return PAGE_ALIGN(ads->capture_size);
> +	return ALIGN(ads->capture_size, SZ_4K);
>  }
>  
>  static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
> @@ -168,7 +168,7 @@ static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
>  
>  static size_t guc_ads_private_data_size(struct xe_guc_ads *ads)
>  {
> -	return PAGE_ALIGN(ads_to_guc(ads)->fw.private_data_size);
> +	return ALIGN(ads_to_guc(ads)->fw.private_data_size, SZ_4K);
>  }
>  
>  static size_t guc_ads_regset_offset(struct xe_guc_ads *ads)
> @@ -183,7 +183,7 @@ static size_t guc_ads_golden_lrc_offset(struct xe_guc_ads *ads)
>  	offset = guc_ads_regset_offset(ads) +
>  		guc_ads_regset_size(ads);
>  
> -	return PAGE_ALIGN(offset);
> +	return ALIGN(offset, SZ_4K);
>  }
>  
>  static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
> @@ -193,7 +193,7 @@ static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
>  	offset = guc_ads_golden_lrc_offset(ads) +
>  		 guc_ads_golden_lrc_size(ads);
>  
> -	return PAGE_ALIGN(offset);
> +	return ALIGN(offset, SZ_4K);
>  }
>  
>  static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
> @@ -203,7 +203,7 @@ static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
>  	offset = guc_ads_waklv_offset(ads) +
>  		 guc_ads_waklv_size(ads);
>  
> -	return PAGE_ALIGN(offset);
> +	return ALIGN(offset, SZ_4K);
>  }
>  
>  static size_t guc_ads_um_queues_offset(struct xe_guc_ads *ads)
> @@ -213,7 +213,7 @@ static size_t guc_ads_um_queues_offset(struct xe_guc_ads *ads)
>  	offset = guc_ads_capture_offset(ads) +
>  		 guc_ads_capture_size(ads);
>  
> -	return PAGE_ALIGN(offset);
> +	return ALIGN(offset, SZ_4K);
>  }
>  
>  static size_t guc_ads_private_data_offset(struct xe_guc_ads *ads)
> @@ -223,7 +223,7 @@ static size_t guc_ads_private_data_offset(struct xe_guc_ads *ads)
>  	offset = guc_ads_um_queues_offset(ads) +
>  		guc_ads_um_queues_size(ads);
>  
> -	return PAGE_ALIGN(offset);
> +	return ALIGN(offset, SZ_4K);
>  }
>  
>  static size_t guc_ads_size(struct xe_guc_ads *ads)
> @@ -276,7 +276,7 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>  			continue;
>  
>  		real_size = xe_gt_lrc_size(gt, class);
> -		alloc_size = PAGE_ALIGN(real_size);
> +		alloc_size = ALIGN(real_size, SZ_4K);
>  		total_size += alloc_size;
>  	}
>  
> @@ -612,12 +612,12 @@ static int guc_capture_prep_lists(struct xe_guc_ads *ads)
>  					 offsetof(struct __guc_ads_blob, system_info));
>  
>  	/* first, set aside the first page for a capture_list with zero descriptors */
> -	total_size = PAGE_SIZE;
> +	total_size = SZ_4K;
>  	if (!xe_guc_capture_getnullheader(guc, &ptr, &size))
>  		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr, size);
>  
>  	null_ggtt = ads_ggtt + capture_offset;
> -	capture_offset += PAGE_SIZE;
> +	capture_offset += SZ_4K;
>  
>  	/*
>  	 * Populate capture list : at this point adps is already allocated and
> @@ -681,10 +681,10 @@ static int guc_capture_prep_lists(struct xe_guc_ads *ads)
>  		}
>  	}
>  
> -	if (ads->capture_size != PAGE_ALIGN(total_size))
> +	if (ads->capture_size != ALIGN(total_size, SZ_4K))
>  		xe_gt_dbg(gt, "ADS capture alloc size changed from %d to %d\n",
> -			  ads->capture_size, PAGE_ALIGN(total_size));
> -	return PAGE_ALIGN(total_size);
> +			  ads->capture_size, ALIGN(total_size, SZ_4K));
> +	return ALIGN(total_size, SZ_4K);
>  }
>  
>  static void guc_mmio_regset_write_one(struct xe_guc_ads *ads,
> @@ -928,7 +928,7 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
>  		xe_gt_assert(gt, gt->default_lrc[class]);
>  
>  		real_size = xe_gt_lrc_size(gt, class);
> -		alloc_size = PAGE_ALIGN(real_size);
> +		alloc_size = ALIGN(real_size, SZ_4K);
>  		total_size += alloc_size;
>  
>  		/*
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index f6d523e4c5feb7f07d695af90f4c44c7a9072c2d..dac51f8720fc6c7d27baa31a1b5c567f560e8c1f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -590,8 +590,8 @@ guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type,
>  		return -ENODATA;
>  
>  	if (size)
> -		*size = PAGE_ALIGN((sizeof(struct guc_debug_capture_list)) +
> -				   (num_regs * sizeof(struct guc_mmio_reg)));
> +		*size = ALIGN((sizeof(struct guc_debug_capture_list)) +
> +			      (num_regs * sizeof(struct guc_mmio_reg)), SZ_4K);
>  
>  	return 0;
>  }
> @@ -738,7 +738,7 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
>  	 * sequence, that is, during the pre-hwconfig phase before we have
>  	 * the exact engine fusing info.
>  	 */
> -	total_size = PAGE_SIZE;	/* Pad a page in front for empty lists */
> +	total_size = SZ_4K;	/* Pad a page in front for empty lists */
>  	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
>  		for (j = 0; j < GUC_CAPTURE_LIST_CLASS_MAX; j++) {
>  			if (xe_guc_capture_getlistsize(guc, i,
> @@ -758,7 +758,7 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
>  		total_size += global_size;
>  	}
>  
> -	return PAGE_ALIGN(total_size);
> +	return ALIGN(total_size, SZ_4K);
>  }
>  
>  static int guc_capture_output_size_est(struct xe_guc *guc)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 72ad576fc18eb583110b44b118abeba4c6be936a..a58c58e599122f3e9ebd1e8374c17c3b4663a5ed 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -212,7 +212,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	struct xe_bo *bo;
>  	int err;
>  
> -	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
> +	xe_gt_assert(gt, !(guc_ct_size() % SZ_4K));
>  
>  	ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", WQ_MEM_RECLAIM);
>  	if (!ct->g2h_wq)
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 0ca3056d8bd3fa37bdb79a7a71ef671270771657..9975005732f645b4735f95fbae8ebe431e793ebe 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -58,7 +58,7 @@ static size_t guc_log_size(void)
>  	 *  |         Capture logs          |
>  	 *  +===============================+ + CAPTURE_SIZE
>  	 */
> -	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
> +	return SZ_4K + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
>  		CAPTURE_BUFFER_SIZE;
>  }
>  
> @@ -331,7 +331,7 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
>  u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
>  {
>  	enum guc_log_buffer_type i;
> -	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
> +	u32 offset = SZ_4K;	/* for the log_buffer_states */
>  
>  	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>  		if (i == type)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index df7f130fb663fc2fd170a94cc1b835b4b4cca167..0f97c6310a3a5696490aaa4827eb3aa0d45ea6d6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1000,7 +1000,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  {
>  	struct xe_device *xe = pc_to_xe(pc);
>  	struct xe_gt *gt = pc_to_gt(pc);
> -	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
> +	u32 size = ALIGN(sizeof(struct slpc_shared_data), SZ_4K);
>  	unsigned int fw_ref;
>  	int ret;
>  
> @@ -1110,7 +1110,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_bo *bo;
> -	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
> +	u32 size = ALIGN(sizeof(struct slpc_shared_data), SZ_4K);
>  	int err;
>  
>  	if (xe->info.skip_guc_pc)
> 
> -- 
> 2.48.1
> 
> 
