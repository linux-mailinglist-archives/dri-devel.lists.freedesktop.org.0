Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80C0BC8AC8
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 13:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8735110E209;
	Thu,  9 Oct 2025 11:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gv7w6Sou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CF010E151;
 Thu,  9 Oct 2025 11:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760007739; x=1791543739;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lBYw+smiVFkH/HiA/NIEzS6QZtaMJC2sxAjU0OnnFI0=;
 b=gv7w6SouyoEYFY9uUFsfRwmHg8Y7VCaThmIPT3EIGBSibs0fRNY5trJv
 c/KU1N9W+r3ARCQAGxMHoYjlVXt0i+1CxHZLyxe4Q7CJMtcDErkS5L7gF
 PIHoy5vSLBAPmhvM969sAaWGNRehX6R6TsqwmC/mlliKvULa+WHHqF2P3
 p/ZGdtONdwIdWPWikBTFGYifFuEScwIs+gx4WObfduTf6pVoc0D+ls5MJ
 pURLeTNrqQzNYWJnoF+5q5WjjPzMvkletZvwgs5NgK7ZHgmlkhYa+ZAea
 KCKaL2Ui//bR2jBvx9AvCpNt2kQX6PZF/8PprWZw0lIl7zfCHLMvdZaPM w==;
X-CSE-ConnectionGUID: cunaktNUQe6ghSYtdkpvRg==
X-CSE-MsgGUID: tPwDTdKWR4q+m4ZPAYneyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="84835329"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="84835329"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 04:02:19 -0700
X-CSE-ConnectionGUID: o7D3Lnz8QRW54FE9gr/j0g==
X-CSE-MsgGUID: Gxcj3VCUSNa5Zt/wIWU2Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="180362666"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 04:02:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 04:02:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 04:02:18 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 04:02:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZS9LV7pWpHQETp7fA/sOwlIpiWnXUrK9kuWDqQI2iFrENeO4q55chwRaFHmtcmDiAwUpQxOw9Hq7bu34g2abyhq2odYZheHmFKZ7NOObjWXEzTuyo+a8ce+qDHXG9BjAlURKacj48EoOOSYL0Z11BCNTmb+5cmFbI1uQ/euQsV9Btqx/mG9xHWEhtTITE38tlmN8hl188hdd/2HvPFsVfQ7z8K0J9UVA0tmQgq1WcoXzhpO8GWiQdnnj1h+1/KZ6f4198797XXf34QiGH2zhOci7khtbJHnUsDQ1Uo00B1bPDgsVnywYB1gncYuwMhBFkb53Nioy/KEGGJa1pNu+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUxweYphSQz1hH14OYuyUNnHdSbIyRkljj6JkaZ9ils=;
 b=KVBQUmtnm+k9aO3QU8goVmsflf3QiE+fVu+ht3SpgOgBfZ3KdMxDytlHBcuY/UEW0TLnmVC+bbOpTxKyJMW/g5RJL27TWt0JniSTn9Ejg7sJSH+olMq0dHmuFmNxy0Mme2OW032qHwnsni1YT4NsU93g3s2JLqneZ3T1qyEavVo2wlGK6gZQtHkgwh5WBvM/PgqKzPRwewDnMZdJMHya+icKwEYxsxyJU5uHqNogxhXtEo81AAFIwMEI2R7Mn6ge7X5nIJAK4c3c5rflUtnc3JgpPsQv/P47IsJ0+QNqxgwR5EKeWgHwxzETzKNOGLGzBf8theYFuhJyKjRcbg3maQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB6474.namprd11.prod.outlook.com (2603:10b6:510:1f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 11:02:15 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 11:02:15 +0000
Message-ID: <ca305187-6683-4ed5-8be8-a15df9f9a49c@intel.com>
Date: Thu, 9 Oct 2025 16:32:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Introduce drm sharpness property
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20251001063500.1259687-1-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20251001063500.1259687-1-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0066.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: f692d4ee-13d3-4156-a634-08de07234e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEpIM0lCeUp6R1N6aW1CUDRwRURoSjFKU1RScjF4emFZVVc0Q2p5RmVSUFh0?=
 =?utf-8?B?R0FnYXVyM2t3Sk9IcDVVck5Tbm1kWXMwajNDYzZRV0lLNUxDQ1B6bk5mMnhr?=
 =?utf-8?B?OTU2UmVTU2VISVliT0pWVFVZVWZ1MjhSRVUzMkFZai9YL29FQ1N0eWVFMVZW?=
 =?utf-8?B?WFZyR2gyWHBMYkVrTmlkZm9Rd2xyaTRNMlp0TTJzUnRVclZJTTBZK3o5VnJJ?=
 =?utf-8?B?QlBPMnl2NmVJaW1FcGJFSjIrcW5zbS9tRk9JOFZva0Zzb21NQS9LcllxdFU5?=
 =?utf-8?B?K3JFVzJZdWZMbzQxTmZtSkdxclo4eUxqcTdPZy9QMVg1U0JuaGYyakhOTWZM?=
 =?utf-8?B?RUw3bnl5cnBYVEtxbjBVbmNVT0VMQXJKSjB5eFNHYkNlSkg3QW1keE5wM3BK?=
 =?utf-8?B?alhURmV4eE9PQWhhd3hlWU9rMDc2VXg1bWtZS3dncitMSUV5V2ZWMXk1QjB5?=
 =?utf-8?B?d3l1eDUrMEJKNGFIWTUyVnhpNEJLTHJLb0Y5eTFlM2lHZHphRkE0TEkvRWNp?=
 =?utf-8?B?WGRlWWFMc0k3eHpaNWtRczJaSkk1L1hFb2M3RVJOTmgyRy8xNkRIWUNSNlIw?=
 =?utf-8?B?WXBTOXR3QUtWem1qQ3hCbjg3cXJUZkZ2enNUL2Y3SXkzUU1DR09GWGlZVXlZ?=
 =?utf-8?B?UWltVWlJMjV4WDdRUlZFNlk0d1JBckV3ZjFBZWJvOERpNkV5T2F6VDFZQytV?=
 =?utf-8?B?N1pXZkY3d05DZ0F0MWhiUFZaNXN6SmRJY3hEZ0JlQTY4ZExndHlHSWpZSGhk?=
 =?utf-8?B?Z3RqalR2OTRYcGRjOTlIR0dkRGFGRk8yUDVmRXUzblN5UEM4QWNOaDlLZU1C?=
 =?utf-8?B?Z0VqeUJlRWRVdmwwaEZTdEZvUVkyNGhpRmFGL2QvSEQ4aWFrNG5pL2xSNVg5?=
 =?utf-8?B?bVhVamptL2JYSmkzdjBkczRSSGExMWdUUFZESFNVcDd4bjFtU21Xa0RvTS9Q?=
 =?utf-8?B?V3R5TUh1YlRpeFoxVmpXLyszT2RjbFRIQVRYRzZGNjArQWpSVkc5dmdhVnJw?=
 =?utf-8?B?Yk54d0dXUHRMTm5ibmNSM01RQzlXRi90QkZ4R2RKTUdtOGhPWFdiVGhMUHZ1?=
 =?utf-8?B?QW9CdHpadzJIc3UwU1lYWDhQTXlmWU84TUNNZ0RreGdhNWlMMDRDQ0FGemtu?=
 =?utf-8?B?Y0thMGg0ZmxRVVl4MC9zR3dOYUlsd0RGdmFINzVyTk9vNURSTFk3cDFBaDBF?=
 =?utf-8?B?V2RVOVE0eHdtQkVwRWRqcWlTMVNTVDl5TGdRdytzeGwxZHJ5c0dCc2RBZ29h?=
 =?utf-8?B?eitxalJYb25naUprNFJSTkZBVWNaK1hNcDR0c3B2OW1OcmREdTdwVzNONFpH?=
 =?utf-8?B?R3FhcC84YnJCVkV5eVhML29HRDZNTUxIUU9FaEhaR3FyWVQxY2grOEY1YnVk?=
 =?utf-8?B?MHNQV1RROTRKaHYwOWtOa1pHcUo3M3FSZjgwK3ZyUGs4N2ladEZOa25mQzJ1?=
 =?utf-8?B?SVZLY1I5ZTFiOWtaNi8wUmtGNktkYS9IY2dsRnYyR1YxUmFwblV5Lzk4MmMr?=
 =?utf-8?B?eXZoRTh4RjUxZHIrTklIN0l5ZzFjWUYxcFVPbFZFQ0tHQjVJOUwzYURiMkRG?=
 =?utf-8?B?UUlJdCtWd3RQS0NTOGNyS3M0Yi9ZcEV5blYzOGxrZHYxSTM3Q3VybU1tRnpq?=
 =?utf-8?B?V3g4eTBqdEFCSFdoN0pMUFR2ZVVPcllta3NCS0VxbVAyQ2pvaUYxMVRSWGV0?=
 =?utf-8?B?TUZZVzZTYzFoZzQ0SlRqbHE2eTRrOWc3MUp2K0VuOHNxQ2lJdVpVcktyY3Aw?=
 =?utf-8?B?bXhBczZUYjZCaTg0eW8zZ3MwUFJiRzFrWkxyK21LczJlU2Yrd1FyTS9rNXUv?=
 =?utf-8?B?Q1YwWU9Qc2FYNno0SnlEcDN6K2FSbFJYSVdSTXA5TVc5bmlTa0VHeXd2ZHFq?=
 =?utf-8?B?UzBPaldKWGlNYmhvaG9pWXFGRUtOcGk4MFMwdE9vdUdpTnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0E0cDFWMXg0bmRKMGpldzdNVFM4d3lHVjBFODc1ZlRacklrQ0hTMC9BemFw?=
 =?utf-8?B?UlRtdWI0NWRwS3R2eFgvblV5LzZTOEdSK1ExbHZIY0xXTjRFWjdLeVFieU5a?=
 =?utf-8?B?ZlJUOTJKcWVvbDk2cmNCbk9qYm5sL1BRZ0xuYmNjcStZQXZnWFlERS9iQ3hm?=
 =?utf-8?B?VmVCVEhpMnRpWlh2U1ZYek5XaDlhcjRCYWpnR0dSS0hMVFRKV29USEErOERG?=
 =?utf-8?B?V1hNMXdYME9zQit2TEQ4ZlowUXBtL2ZobmM5S0pzUnZ2VnVrOExXOGR2ZzZi?=
 =?utf-8?B?U01FZHZxRThxempzcU9HR2RCcHVzTnZwajBURXVpck15NkhvbE9sU0RlK2ZW?=
 =?utf-8?B?N3VDTUltU3JBc1hISGJpQlAyT2VBelYzbG8wOWFQdFMrZVUwOG03M2ZzWGli?=
 =?utf-8?B?SGV4TENjSDRWWUF2VTE0NWduVGk5aFZVRUsxb1VRK3VRREhoRjJtdFFwSVAw?=
 =?utf-8?B?V1YzWUMzUGYwU2RDTzEvRUdhTDJJcHpPS0hmU0RCaTVLd1FOaExxdmlUUWIr?=
 =?utf-8?B?cW44WE9BUDJkZjE5RHY1OXRkVXZzMVNwU1hFOU5hNHRVckVBaVNycENBaU8w?=
 =?utf-8?B?L0kxME5OK2dsSlFJYTQvNjhZclVMSlRuNVVkdHY1eE5BSkNSenBlSFN3QWpy?=
 =?utf-8?B?ODN5bjUzd2czcEpwUjNWSVcvWHJTaHdoaXM4YlEva0hod21ueE9DMk1ML1h5?=
 =?utf-8?B?RzVEWmI0SDZXVG80eGt1RmJrS2p1QU1IUnJVQnFrT0xtb2VSalYwdzVkekh1?=
 =?utf-8?B?Rys5LzczdUo1emRQbVRaVHlVNlY2STNNYXdCbElKYllOamIwTlN4Zk1TeURC?=
 =?utf-8?B?SytzUlA0ZzRCeUs3b3VpSnZKL3NBVXRvcklhUlJQaVEwbzhRdjFtV2g2WThP?=
 =?utf-8?B?MUdpR0haQnlvdFNEUG56MHRodkxzOXlLWjdabVR3RGg0Ym1aQTl0QnFxVEd3?=
 =?utf-8?B?azkySCtKTFBraUNXUmxDMWI1R2lNUENqRlVPT2RxMjcvUWVBYktzZHFnSTV5?=
 =?utf-8?B?bmxJZjFaMDdoRG0rS1ovQ2FKNFo1L2lJd1BlOEdyNE1wSlRBUGR4eUJLS1Fo?=
 =?utf-8?B?b3NucGcrT2pxdVVsbFFYN3RTcThDMkRUWWltYXJVNVUyZngva2ZJMEZrN3E0?=
 =?utf-8?B?SUo0NE55T21wRnB2eUZnQlN1aUN4djRSTSs1NXRjd3FwUFVFVk1ldWNvMUkz?=
 =?utf-8?B?cjRjZDh1WEMvN3BjbVpIWVlxVnpnZ0FhazNyVGkvMlpFcWtoYzJFM1c1UVBR?=
 =?utf-8?B?N3dldW56enExMVl6MklwVFhxRHN2SzJRUUIyZXU1Vmc1UGRUMFpadEdkZXJS?=
 =?utf-8?B?cHhmS085QkF4eGhnNWtxOElCRWkvMkg2R1JHZk1GcHgyUUtBeCszL0xyWTNC?=
 =?utf-8?B?cmw5TklLOGg0aUYyQStZTmkxUmk3YU9mSzlZaWkyYkU0UE9sdEpUajY2RXl0?=
 =?utf-8?B?ZVI3cjVvUFRJdzBtWUNRc2dpd0lxOUlmL3Y3VEUxdVQ0dkdNS1NlK2JoS2di?=
 =?utf-8?B?RlIrMzFibi94cU1mdEFvS3lCZFhQcFYwMktlOUZYR2ZHUVMvQk9qY1ZoN1BC?=
 =?utf-8?B?TGtlZTlvTFlwb2Z3M0NHTk5ndFMreWpiOVVhMm5CbDZoNFliK0dTOE9KRlM3?=
 =?utf-8?B?dWszUTRaK2ZFTVFFVGVxeTd4Nk12V01RSzhyV0ZuTW5NU3F5RnZ4bG1aTkND?=
 =?utf-8?B?K296aThYaE5UQWx5cS9YbW5RUXFvU2h6dGhpMnpXdjdDUkRaQ2p0ZWI0UHpN?=
 =?utf-8?B?bytBS3ZWVGw3K3U0S040Vm9icllpTzlObnlRMytQWm03Zmo2RUg0RUtNZnRy?=
 =?utf-8?B?ZW01Q0thN2J5V25QZ05SQzZldm1hSmlHZlJCSlc1T2VCSm1ZVnpZUEJBd2dw?=
 =?utf-8?B?ZHk1OCsxL1Y1bDhpanJhUWhVWTVidldtdXVuUlNPNUNSdCtmWWlrTTJZdzlM?=
 =?utf-8?B?MWY3WUpoR3BCa0RFR25oY1NPVXo1dWFodFdLUmJGenpqSWFQUVQzY0VrRlZB?=
 =?utf-8?B?MHZ4aGY4QWVwYmZ3SEVVUlZ0dTIydTloQ2Z3NjdlbmV1SnhjZURjeDdkN3hK?=
 =?utf-8?B?VlQzMGNmZ0FueDdoRlgzaHNLOTZ4QTd3MGEydTdabWQzN3hQN09LRFhwNzYx?=
 =?utf-8?B?ZjMzUlpkVTZvSzc5N0N0emtvMzhvODJZM1VLVFQrdDk5Q1NCK25CRVkxZnNI?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f692d4ee-13d3-4156-a634-08de07234e1f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 11:02:15.5133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCd+B1ZiRKanB5jW43vcm+jwlHZPU4h0z7RRvI6sintB4Ql8TKo9eTADHKzGn8t4VJKhwE9fs5MX6huUbRnItyAQB9FVHsfo5g5qjSMUkVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6474
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


On 10/1/2025 12:04 PM, Nemesa Garg wrote:
>   Many a times images are blurred or upscaled content is also not as
> crisp as original rendered image. Traditional sharpening techniques often
> apply a uniform level of enhancement across entire image, which sometimes
> result in over-sharpening of some areas and potential loss of natural details.
>
> Intel has come up with Display Engine based adaptive sharpening filter
> with minimal power and performance impact. From LNL onwards, the Display
> hardware can use one of the pipe scaler for adaptive sharpness filter.
> This can be used for both gaming and non-gaming use cases like photos,
> image viewing. It works on a region of pixels depending on the tap size.
>
> This is an attempt to introduce an adaptive sharpness solution which
> helps in improving the image quality. For this new CRTC property is added.
> The user can set this property with desired sharpness strength value with
> 0-255. A value of 1 representing minimum sharpening strength and 255
> representing maximum sharpness strength. A strength value of 0 means no
> sharpening or sharpening feature disabled.
> It works on a region of pixels depending on the tap size. The coefficients
> are used to generate an alpha value which is used to blend the sharpened
> image to original image.
>
> Middleware MR link: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3665
> IGT patchwork link: https://patchwork.freedesktop.org/series/130218/
>
> Continuing discussions from:  https://patchwork.freedesktop.org/series/129888/
>
> https://invent.kde.org/plasma/kwin/-/merge_requests/7689
> Got ack from kwin maintainer on the UAPI patch.
>
> Minor changes in patch 3, 4 and 5 hence require rb.
>
> Nemesa Garg (10):
>    drm/drm_crtc: Introduce sharpness strength property
>    drm/i915/display: Introduce HAS_CASF for sharpness support
>    drm/i915/display: Add CASF strength and winsize
>    drm/i915/display: Add filter lut values
>    drm/i915/display: Compute the scaler coefficients
>    drm/i915/display: Add and compute scaler parameter
>    drm/i915/display: Configure the second scaler
>    drm/i915/display: Set and get the casf config
>    drm/i915/display: Enable/disable casf
>    drm/i915/display: Expose sharpness strength property

Overall series LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>
>   drivers/gpu/drm/drm_atomic_uapi.c             |   4 +
>   drivers/gpu/drm/drm_crtc.c                    |  35 +++
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   drivers/gpu/drm/i915/display/intel_casf.c     | 293 ++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h     |  22 ++
>   .../gpu/drm/i915/display/intel_casf_regs.h    |  33 ++
>   drivers/gpu/drm/i915/display/intel_crtc.c     |   3 +
>   .../drm/i915/display/intel_crtc_state_dump.c  |   5 +
>   drivers/gpu/drm/i915/display/intel_display.c  |  37 ++-
>   .../drm/i915/display/intel_display_device.h   |   1 +
>   .../drm/i915/display/intel_display_types.h    |  15 +
>   drivers/gpu/drm/i915/display/skl_scaler.c     |  91 +++++-
>   drivers/gpu/drm/i915/display/skl_scaler.h     |   2 +
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   include/drm/drm_crtc.h                        |  18 ++
>   15 files changed, 548 insertions(+), 13 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h
>
