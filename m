Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2A2A773EA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 07:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CCC10E4E9;
	Tue,  1 Apr 2025 05:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YqNIi2pu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3450210E07B;
 Tue,  1 Apr 2025 05:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743485388; x=1775021388;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bO13LoC3A26lVcZPeL2rU+2A3yn5+0iN9uw2k75LWiQ=;
 b=YqNIi2puVJqcz5nYEGnaFStURMR2bD3LPxN56fPRc+9yAtL9wSe4nwPb
 WVAQJIOtqjNfEB5f9M3QhBQ9LPpBomM9J02OjH1StWAyqyVvdIJ9Pv15x
 KjDfYYBZsdkomQ18+uGjhLEBvobpp5bR9YLDP241aybs4+Ajr/FNn7qgI
 dmqFo+Qa43p1Ym0aVNOPdBDM9i3Qay5LSV48VPi5tXuiaUEHZMcNGns6p
 VdGjNOpL/5MF6te4bBy1xR9jFGf32dt8tHhj3aw+3Z5Fn0M/fDtUXL3ay
 QjWusXGHiYU94eVz3qsN4y8H1fUhJ7bu/Wi9QLL9qdKAPgIPuf9JqeQea A==;
X-CSE-ConnectionGUID: lP9Z3MnKS4i870BW/CM8Yg==
X-CSE-MsgGUID: CJyEebV2T1yFQZbBHMmAyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62324385"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="62324385"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 22:29:48 -0700
X-CSE-ConnectionGUID: 0CDEl5gWRNqKSsQkKQQThA==
X-CSE-MsgGUID: TdJwyZTaR/GScJ+4wi742Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="126509016"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 22:29:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 22:29:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 22:29:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 22:29:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSVfopEZvozdbzkBS2JPxjcsk75wosaFXLPDtHBpb//dwyL5ToU7/HXkNpnh/JWilIwuHB1aINqvSEq7yNDVGtmlRlLrvEYSSlJWT8gaiSfsnEp/5h2AozfxF6p7m4udQxOuwto9zl0uegvzuyoIOjJs3F3MyrMbVnjxYcBcf5GlfBYqSb1eongn255VLf+TRvQ+R+H7ZLzpyrlla2t3djgNO1RYwSrvY4OSqr2Ku92uHL3LCjI7XNlAVSHKADrAk9DmAncldDvN/PHVsAAvPjHjqW1ibsaydQaA6jhRCdtKWA2FQ3Z6bd+DfuiTQpNySg0fEqD1xo21x4qBt63pTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1eGmzDcN92JQkwjiAYKPBFNEvJMOK5+reZnhhA6IdA=;
 b=e4JV7r9TeJ+s1MCS7rbGLjM5apFiHWRNfyCaMK4mCgm/Tnicumg6d+Os3bcmyLm3YItBO5aFb3y/22sblSF5PLaUYPIqsAS3TeCC+YNCNwtvkpXXiK4JupHjV5cjnI/wTelXfsfYV/3ogCW+bsoBa+UWoG4mf0S2VikHpyVcljJqIspktjjpJmnhumZTZjOfHiHdCXo30y3qD2rMvVsiNV3oKtoXMBHxSVZNAmYF9SCDtDN1vBWjUeLKod8Hp3Dp8pU9ZYwvALE8K/MJXwtDP8kDiM6GT9NjUx0DpgIA6UPYfnIOvHx49/31li7dJIaJ9XcV6H03BcrT4nSv23PkqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SN7PR11MB6678.namprd11.prod.outlook.com (2603:10b6:806:26a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.53; Tue, 1 Apr
 2025 05:29:13 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 05:29:13 +0000
Message-ID: <a595e02e-7827-4162-806f-09e7767fefef@intel.com>
Date: Tue, 1 Apr 2025 10:59:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] drm/i915/display: Compute the scaler filter
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250321160628.2663912-1-nemesa.garg@intel.com>
 <20250321160628.2663912-6-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250321160628.2663912-6-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::15) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SN7PR11MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 459edbec-06bd-402d-d8ae-08dd70de22f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1BWWGxBSi93My9MVkZIbFRsSE1STm02RWlxRFBtdXcrbithTTdQSlRhL2pm?=
 =?utf-8?B?bFZGTGY2ZWZPYm92b0ZMTjRycFdGRUFNaXJKNXErOTAreFJXRlNSYW50QTh6?=
 =?utf-8?B?citndFhLZ0FGaC9DUWFXd01zQ1pvRUdkcVNUSXkweTI2Q0JZM0d3L0F4aDFm?=
 =?utf-8?B?VERkanBOdVBRak1USFZaMmVUY0lET3pSMlJ6RjZET2NrUko5WnFYbnhYbWQ5?=
 =?utf-8?B?K2s4UnRBbzcxeWhyallsT3dXOEEvbkU2UTl5MTREM3BPVzdPMTRCOXNveE51?=
 =?utf-8?B?ZTI0YjFzb0tsNHR4WDZHMGd6VWtrU1pXdUNQNDVtcTkxM2paR0RiR2JCTUtQ?=
 =?utf-8?B?WWY1NHI0ZVp0NmN1OGlmSjFKMEROM1UzMkkvNWpqWDY5UkF6QVp5VUM5RGwv?=
 =?utf-8?B?aS9sYzNyTjd1QVJUajl1SWozSlptWlR6OUxRMzY1VFZ5M2FCeVhrdHQrMWwv?=
 =?utf-8?B?ZDBKK29wSlR3TFB0QjBheXExWWIyMklRbXhpOHoyQzhmbE9WaUpGc2pMY0Rz?=
 =?utf-8?B?Y09UZ0UwbWJTTjBZQXZZSGJWTkFlVFVscURVdlcvT0hHeHhjQXQvQ1VWRSts?=
 =?utf-8?B?OTZKZmdYSEF3ZjFBL2oyWUFPR2hoenE4NWdBT0pXOVh5K29jb2x3dWpjVi9n?=
 =?utf-8?B?angxdkRIVHhsenZCR1VYbnlVczR6MmpVOG1odWZxWUZJbFVveEVGOG5UbHZQ?=
 =?utf-8?B?U1JLU0VWUEhING5WU0tXSHJUSUtyZmNYZUlxcEh5eWlkVXJvRWNTL0ZsdEho?=
 =?utf-8?B?TDQxOUJ2Y2Q4WkxLQnBLYmNrY1g1d21mMXRGQUpTOWxjazR5MXRxMmxFY2Mz?=
 =?utf-8?B?L1VId3pHUzROTnBQLzZyZ0owL1MySFVmU3Y1M3ZWTHJ0TkpqcFMwOTZXR1Bx?=
 =?utf-8?B?SDNPSlo2SXB3UXFVZHI4MElhTmpyT3Y1OExRUEJYV2lFdUQwNTMyME9ZWjg1?=
 =?utf-8?B?SVNFMlI2eHVIMGtiWmhEb29XcWtjazg4REpnc3F4dW9QbFBRRjAvMnB5a0dS?=
 =?utf-8?B?Yy9maFVHSGwxcXlsM0syQ29JNkhjUUp1MmQvZnI2UUEwV0hBdWF2Zk5pNXZR?=
 =?utf-8?B?K2cwOW1xVWZvUlZ0dzJWdGdwZVZuNFV5N2JqdEZvVERWdSszM1lIYXRwQkdB?=
 =?utf-8?B?RVVFNFVWa25KSXVEd3ZxQ0h2eFRWNXZ6Vyttbm1IaGYycHAyMVZHNDZ3SG1N?=
 =?utf-8?B?STFmVE1aeW81ZExtNUVGNEw4VmlZRGNDM0ZSbW1PQnc5Z1QzS0ZUSi8vMjNR?=
 =?utf-8?B?OW1zMUErZ004VFBua2xtd0JWR2VlUmhkeG1EOFBkYkcrKytyS1VrcU1Oak5M?=
 =?utf-8?B?cGRORHIybzNySkFHS0RscUFJbWFTWmRiR0FBNWZsVmJ1NWJTaEFydG1yMlN2?=
 =?utf-8?B?bU1IUUhsMkh6Rnc3Y0tzRDIyV1pZa2pSTlhKd0ZBUG1sYU9SVnliQnE2eThw?=
 =?utf-8?B?T3hiV244VmZVdHdLTVBVaEo5d3Exd21qVVpJZ1dKd3dsMCs2c0hYbjZkWUNB?=
 =?utf-8?B?dlV3WGNFYXM4YVhraCtaTFJQL3BPOWlSZTh5bzF2MGdnQmptK09DMGl2Z25p?=
 =?utf-8?B?UWJDR1BqcmxXd3JUVTNRKzAwWkhETzRYSDIzSXVvR29hUHpmVjZnV0NrTFVX?=
 =?utf-8?B?Z2hFaGhoNHp1YTFES2I5ZXhxWDE3NWV0MkRza0JSQnFhTFRYT0dmMVRsSjM2?=
 =?utf-8?B?ZTkweUE0UkNQTGt0M0U4TVZVRDROblI1c1RodzZaZUxEUFgwM0RWOERZWEFO?=
 =?utf-8?B?cGZmVjlBVkJyMCtJSnNRZmg5a2s0dmk0WlUyRGk2aGRSNEhhUUpIdndlN05B?=
 =?utf-8?B?NmlPVElsSnVLeDhWQUNKb08xVVBnVmw0azRCZi9UZlVEVkNTY1pMYjdvT1NB?=
 =?utf-8?B?anJKQzhWRG13eCtWa1VBK2NybmsxNnE3azUwMFBINmlmbHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmVZZGFYL0hEZWRvWXZTVlRQelp5ZnVadTljbGhZcXVoMnV5ZTN0SU9XQXJV?=
 =?utf-8?B?cCsxQ09zUWt5a0ZKdllzR2dpdCtTeVczV1hCaEhPRS9FM1c0VGtnWkhrZTl5?=
 =?utf-8?B?Vk14aFVLS0cwbEpzcTM2S2ZLc3F4ZlVFRVRZeWEwNEZpajZQQll3ZmUwYmly?=
 =?utf-8?B?bHpLRzBqZ1hOWGVTdUNaVVE5SWt0eHkvR3BWU09YUkdXQysrb3k5WnVNOWtQ?=
 =?utf-8?B?emM0S3VIMmRDdTFualEyRHBwdUt0alVnTlFEZVpqeTFFK0NnbUxLeUtYVDVs?=
 =?utf-8?B?V1djNWlJQXhVVkhXUHR3WkRkMWltMFZ0cHhLcHR0U2pyOUhkck80MjIwK3J4?=
 =?utf-8?B?V3JBU1B2aWhyMTV1UzJGQkFEWHl5aEIxbnBTcC9mUkxFZjE0Z0dPdytTd0lH?=
 =?utf-8?B?cGNHeUphNkw2NERzZGJIZFhlQlFucDV5Mzh2bHhvRFN0Rm51Z2JHUHNRNDkz?=
 =?utf-8?B?NlFUUjdnVUR0clpTMDFnRFNiV1poQWxyZmY3dzI3MkpLczFUWkFVVjE4WDZV?=
 =?utf-8?B?RkJaTlo2UnN2RUFCQ0xxWSthQVFObHdQanBnYklITWJFaDNiamovRmhyQUVr?=
 =?utf-8?B?a2JkWjRsajlTZlFsVDlMQkRQVjJHOXZpRUliTDU3d0w1OHBUMHdDN0Jtbzg5?=
 =?utf-8?B?azhVa2o4S205LzJ1TmF3b2FXN0p6bTZoQW9lMWVYRXhlbVRLVVByMXlodUxv?=
 =?utf-8?B?TE1nSGhlRnI2ME90SHM2QlV5TUF4cmQyd21kbFJKT1d6UEQwTEtnUG5JdFAr?=
 =?utf-8?B?YmMzeitWWEFTS05nVzRVSXhzZTBaR2EvMitpMmRCUFYreWwydStRTnlLb3FS?=
 =?utf-8?B?TFpCaXY2RXl6VmhhakwxNlhUYVpMSGg0ZXZmQ290Zm1lc1pIV0lxdHFCbVBv?=
 =?utf-8?B?UVVjU3FPRTl0cUMvOG0zZ0V2TFFYTlExQ3dWbFNHdFB4Vy8wQWpJVjNiWlNK?=
 =?utf-8?B?endjcFErQ1RPYUU5eHU5d0ZMWnZyYWJSL2t0WVdWay9YR3J6SkhrKzlJKzhX?=
 =?utf-8?B?WE9rQk1jZ0pjd1lWZXdld0UvdkhNR0pwc2xhMHlLbGpDa0tmZVhjazhrRDNz?=
 =?utf-8?B?dENkcVN0NjZLZjhZWm1YQmw0RFI1VENwRzVJODhIaEpPd1MxbkgrQ2V0Q3dw?=
 =?utf-8?B?c21TaEh1QVhnbUpWdnhqVHNjbEVPNWlQV2xEOUJubE5mbVNOUFJyeDVrTk5h?=
 =?utf-8?B?cmE1Mnh4UWNwMFROdEZYVG9HeUYzVFZVUXIwNDRPSnNnU2I4bmY5aStwTWNu?=
 =?utf-8?B?NGwvOHdENkljNlNkS2VsU09WRDVleEhWblpmVERld2pYaVoxeVFTcWtMZ01Y?=
 =?utf-8?B?N0Q1VnozVC83N1l5Qjh6QnhqUEkzVEVUWFpuZXJSdERZSFlsOFdPKzF0aGtp?=
 =?utf-8?B?QTIvTlZXYWZ1ZjZDV3dpOUl6dzNHT2hYREc1V0djL2RHL3ZFMnZkQiszUVVV?=
 =?utf-8?B?VXdCQWhDMlFmcmZlcE5WTWZobFAxTHliakdwNVZvVFFmbnVEYkdDMUE5eXhm?=
 =?utf-8?B?VGdZUDBXZnNma2xXUnMzUm5Rd0J4NnN5ZVBZWWNZc3QzME5SYlpPZk0zY2w2?=
 =?utf-8?B?d2RzTkwvOW1UZTFJZ3U5N3NKQkJtVE5FRzZNRDdVUVJUNTNBSkRrUkwvZnJs?=
 =?utf-8?B?ditBbW9hYXlXNzhwWmp3VHEvNDVDbmEwRyt1NTdPQ3BZNGJSZ2tqU3Zmc0FU?=
 =?utf-8?B?UXowWWZRM05FL1hpZmFSRkh3cnJTcXZYTzMycnQ5dlQvWnBzWEJ2aDNMOUpS?=
 =?utf-8?B?TzdoQ2E5OEpZZzZXSjNRcWtaV2Q4S2R6UWozRUVHeGNOZWFtdFc4M0p5WXBi?=
 =?utf-8?B?cTRFekFoOWdSM0VGZUN6dUc3VXBwNStnYmpWOEQ5cGhLZjFLZ3pabis0NEZi?=
 =?utf-8?B?cGhnMXhmSW40disxbS9PeXF0MXFCUW1leGlaK0x0eGw2cEtFV1hrSzdnMGU4?=
 =?utf-8?B?eHNTTGRMZ3Q1dXUvRllxMWR6NFRIdElNMVE1ZUtaa3ZCWGhRZVNQY0h6Qzhl?=
 =?utf-8?B?SzBPK05tVFN4eGtDa2pUTSs4THRQNGRJWGxOT2lmQ2k5SjFTc3NlT3ROM0lv?=
 =?utf-8?B?TlNSUjhCK200QmdmRnZVUS9GZjZROVVXVVc3WTdCSTAyM2t1MHl3Vi83bUdy?=
 =?utf-8?B?YVhHbys5WmxDNGFBam1HNkMyNjkyUnRzZEFYVFVvRlJLYVBIVjFFWkRCOCts?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 459edbec-06bd-402d-d8ae-08dd70de22f0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 05:29:12.9164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XwAEb6jgSFYdGOHrw9gomDsbRLvOKfWWMB4ncKfqz9ON9dq647vtUGUjqIC2tYNItAzP+8xmKPAOifWPbVAntq9hcwbhaEPDFaQojkqbO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6678
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


On 3/21/2025 9:36 PM, Nemesa Garg wrote:
> coefficients

This is part of the subject, need to fix.

Regards,

Ankit

>
> The sharpness property requires the use of one of the scaler
> so need to set the sharpness scaler coefficient values.
> These values are based on experiments and vary for different
> tap value/win size. These values are normalized by taking the
> sum of all values and then dividing each value with a sum.
>
> v2: Fix ifndef header naming issue reported by kernel test robot
> v3: Rename file name[Arun]
>      Replace array size number with macro[Arun]
> v4: Correct the register format[Jani]
>      Add brief comment and expalin about file[Jani]
>      Remove coefficient value from crtc_state[Jani]
> v5: Fix build issue
> v6: Add new function for writing coefficients[Ankit]
> v7: Add cooments and add a scaler id check [Ankit]
> v8: Remove casf_enable from here[Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_casf.c     | 120 ++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h     |   1 +
>   .../gpu/drm/i915/display/intel_casf_regs.h    |   7 +
>   .../drm/i915/display/intel_display_types.h    |   8 ++
>   4 files changed, 136 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index d0bb51cd4b54..eb69c449a2f5 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -12,6 +12,13 @@
>   #define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
>   #define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
>   
> +#define FILTER_COEFF_0_125 125
> +#define FILTER_COEFF_0_25 250
> +#define FILTER_COEFF_0_5 500
> +#define FILTER_COEFF_1_0 1000
> +#define FILTER_COEFF_0_0 0
> +#define SET_POSITIVE_SIGN(x) ((x) & (~SIGN))
> +
>   /**
>    * DOC: Content Adaptive Sharpness Filter (CASF)
>    *
> @@ -33,6 +40,24 @@ static const u16 sharpness_lut[] = {
>   	73, 60, 48, 36, 24, 12, 0
>   };
>   
> +const u16 filtercoeff_1[] = {
> +	FILTER_COEFF_0_0, FILTER_COEFF_0_0, FILTER_COEFF_0_5,
> +	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_0,
> +	FILTER_COEFF_0_0,
> +};
> +
> +const u16 filtercoeff_2[] = {
> +	FILTER_COEFF_0_0, FILTER_COEFF_0_25, FILTER_COEFF_0_5,
> +	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,
> +	FILTER_COEFF_0_0,
> +};
> +
> +const u16 filtercoeff_3[] = {
> +	FILTER_COEFF_0_125, FILTER_COEFF_0_25, FILTER_COEFF_0_5,
> +	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,
> +	FILTER_COEFF_0_125,
> +};
> +
>   void intel_filter_lut_load(struct intel_crtc *crtc,
>   			   const struct intel_crtc_state *crtc_state)
>   {
> @@ -97,6 +122,8 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
>   
>   	intel_casf_compute_win_size(crtc_state);
>   
> +	intel_casf_scaler_compute_config(crtc_state);
> +
>   	return 0;
>   }
>   
> @@ -119,3 +146,96 @@ void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state)
>   			REG_FIELD_GET(FILTER_SIZE_MASK, sharp);
>   	}
>   }
> +
> +static int casf_coeff_tap(int i)
> +{
> +	return i % SCALER_FILTER_NUM_TAPS;
> +}
> +
> +static u16 casf_coeff(struct intel_crtc_state *crtc_state, int t)
> +{
> +	struct scaler_filter_coeff value;
> +	u16 coeff;
> +
> +	value = crtc_state->hw.casf_params.coeff[t];
> +	coeff = SET_POSITIVE_SIGN(0) | EXPONENT(value.exp) | MANTISSA(value.mantissa);
> +	return coeff;
> +}
> +
> +/*
> + * 17 phase of 7 taps requires 119 coefficients in 60 dwords per set.
> + * To enable casf:  program scaler coefficients with the coeffients
> + * that are calculated and stored in hw.casf_params.coeff as per
> + * SCALER_COEFFICIENT_FORMAT
> + */
> +static void intel_casf_write_coeff(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	int id = crtc_state->scaler_state.scaler_id;
> +	int i;
> +
> +	if (id != 1) {
> +		drm_WARN(display->drm, 0, "Second scaler not enabled\n");
> +		return;
> +	}
> +
> +	intel_de_write_fw(display, GLK_PS_COEF_INDEX_SET(crtc->pipe, id, 0),
> +			  PS_COEF_INDEX_AUTO_INC);
> +
> +	for (i = 0; i < 17 * SCALER_FILTER_NUM_TAPS; i += 2) {
> +		u32 tmp;
> +		int t;
> +
> +		t = casf_coeff_tap(i);
> +		tmp = casf_coeff(crtc_state, t);
> +
> +		t = casf_coeff_tap(i + 1);
> +		tmp |= casf_coeff(crtc_state, t) << 16;
> +
> +		intel_de_write_fw(display, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 0),
> +				  tmp);
> +	}
> +}
> +
> +static void convert_sharpness_coef_binary(struct scaler_filter_coeff *coeff,
> +					  u16 coefficient)
> +{
> +	if (coefficient < 25) {
> +		coeff->mantissa = (coefficient * 2048) / 100;
> +		coeff->exp = 3;
> +	} else if (coefficient < 50) {
> +		coeff->mantissa = (coefficient * 1024) / 100;
> +		coeff->exp = 2;
> +	} else if (coefficient < 100) {
> +		coeff->mantissa = (coefficient * 512) / 100;
> +		coeff->exp = 1;
> +	} else {
> +		coeff->mantissa = (coefficient * 256) / 100;
> +		coeff->exp = 0;
> +	}
> +}
> +
> +void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
> +{
> +	const u16 *filtercoeff;
> +	u16 filter_coeff[SCALER_FILTER_NUM_TAPS];
> +	u16 sumcoeff = 0;
> +	u8 i;
> +
> +	if (crtc_state->hw.casf_params.win_size == 0)
> +		filtercoeff = filtercoeff_1;
> +	else if (crtc_state->hw.casf_params.win_size == 1)
> +		filtercoeff = filtercoeff_2;
> +	else
> +		filtercoeff = filtercoeff_3;
> +
> +	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++)
> +		sumcoeff += *(filtercoeff + i);
> +
> +	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++) {
> +		filter_coeff[i] = (*(filtercoeff + i) * 100 / sumcoeff);
> +		convert_sharpness_coef_binary(&crtc_state->hw.casf_params.coeff[i],
> +					      filter_coeff[i]);
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> index 80642809c08b..381d5e10c70d 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -16,5 +16,6 @@ void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
>   void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state);
>   void intel_filter_lut_load(struct intel_crtc *crtc,
>   			   const struct intel_crtc_state *crtc_state);
> +void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
>   
>   #endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> index b96950a48335..f8c3c86f2949 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> @@ -30,4 +30,11 @@
>   #define   INDEX_VALUE_MASK             REG_GENMASK(4, 0)
>   #define   INDEX_VALUE(x)               REG_FIELD_PREP(INDEX_VALUE_MASK, (x))
>   
> +/* Scaler Coefficient structure */
> +#define SIGN                           REG_BIT(15)
> +#define EXPONENT_MASK                  REG_GENMASK(13, 12)
> +#define EXPONENT(x)                    REG_FIELD_PREP(EXPONENT_MASK, (x))
> +#define MANTISSA_MASK                  REG_GENMASK(11, 3)
> +#define MANTISSA(x)                    REG_FIELD_PREP(MANTISSA_MASK, (x))
> +
>   #endif /* __INTEL_CASF_REGS__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 2540a2a1a0e0..b2dcdbc6b81c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -931,7 +931,15 @@ struct intel_csc_matrix {
>   	u16 postoff[3];
>   };
>   
> +struct scaler_filter_coeff {
> +	u16 sign;
> +	u16 exp;
> +	u16 mantissa;
> +};
> +
>   struct intel_casf {
> +#define SCALER_FILTER_NUM_TAPS 7
> +	struct scaler_filter_coeff coeff[SCALER_FILTER_NUM_TAPS];
>   	u8 strength;
>   	u8 win_size;
>   	bool casf_enable;
