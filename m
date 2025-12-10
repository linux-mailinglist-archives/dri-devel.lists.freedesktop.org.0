Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743C2CB1AE8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 02:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC4A10E644;
	Wed, 10 Dec 2025 01:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXnDgNiX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BAE210E641;
 Wed, 10 Dec 2025 01:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765331910; x=1796867910;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PiEb5FLD0kdYDz3yfIvS0KmzNs8efUNZXB2+gDHeC+I=;
 b=IXnDgNiXaKGg+0oY0WEhZ8fIijB+9PYGxVrFr6A+A2DZrDgyvewvvDS5
 gy1B8iOFnnr/sqatNur9FJ6XEVpj+YolxKY8MhKkbV9RCXaXwyS+VRMFp
 6bt5dOR7NeRKbUYEOCkfrcGNcDkfm+MhfGM7WCfSb8cfyg2MRVeu8YBcj
 YIOTITHpuJxYI5ZikMVKn1YpK71tnJLjee08zxzjAeK74jUmmgO4o9HW3
 FYVP/dTTLtvjUtYNtrC+QZulmABrhszclhtQqAFmSPTVxrlp0qEh2pmwk
 pBQFy5tBnk01KCx92PjK7vFZuis2vqcAY+BiyDF1Yv/q5DL856wsWaO9g A==;
X-CSE-ConnectionGUID: APwIEy2ETCmPonmjvji/dg==
X-CSE-MsgGUID: vzTLydCOR6WGCe/evGV//Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66302880"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="66302880"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 17:58:29 -0800
X-CSE-ConnectionGUID: BmtCs1EJSvmCPXBl3CjUvQ==
X-CSE-MsgGUID: LGKv0D8wQn63tSRFqMMQFw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 17:58:29 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 17:58:28 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 17:58:28 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 17:58:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jl26WpAE0gn4caQYegYndJ5atQSknUpUjS8tLDc3bCqEUmg4V5r+fmmkQ3aIUQetew45kY8UcP6RRfRGGQzeF5/hT+yaHIF+A3zZVltqp/iaRZ5VKOZ5GLzv6KNWYpeClCGlOizLlh+RYiOesfZKoOQbGcElBgHzVF4JuwHYEGMuUToGZr/kAbj/IDFkuq5Xx9qmqXJTT2Zr6IH6RG5KiBYrPkjLuxJxSpy1MiFc+Q+OhkL+PPxtiKXhNd43EmKZIlLfa6jPgvpF8uuF96xWyI3+/X6b2ZQe4POn0FFc+Y3SzMi02bx1mqvtEzIUZoPeKLG4iAK1NQ/73kO2poNxhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mz4ABAD0oQGXUUxXCH3MYUpl3k1n1DbRfr5Di1LDoE=;
 b=kC1J73YhcJW563RkHcdDCWiy++2qJV1SYVXkHhlhCEwgFR9ZlyF6JjKG8bTZMBdi+ziBQhIrfYeWOiqVU+2FBATnN46eMwp/lztmegOT2NX1QUBbgyMOzyj8I/0uuFTvh2QO6xvk9P7ZvgmyLpD1FM/oaaf9RJD50Ft4EszwfAXGfVmv9ja7G+w2oY8xdLtWiPErOZ1VA3YOM3OaLFbCO3DLYdMEarCxeFOrC8z/hOPFBUOBw4PEtd7JLryS+r1jylgmZcdnfqN59T49e/N39QkbBUTolt/UGFWX+xxq3AWxOdYPDZiPWRDHcP3bAgB/L02CxSBzkyqjYDcwVAz/vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8552.namprd11.prod.outlook.com (2603:10b6:510:2fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.13; Wed, 10 Dec
 2025 01:58:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 01:58:20 +0000
Date: Tue, 9 Dec 2025 17:58:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <phasta@kernel.org>, <vitaly.prosyak@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, <dakr@kernel.org>, Boris Brezillon
 <boris.brezillon@collabora.com>, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
Message-ID: <aTjTucrVHe8TR/gN@lstrano-desk.jf.intel.com>
References: <aTMW0UCGQuE+MXLk@lstrano-desk.jf.intel.com>
 <21699026216379f294d6597ed6febd187229ffb9.camel@mailbox.org>
 <aTcf4o0huubgUPIQ@lstrano-desk.jf.intel.com>
 <aTcguvAQCZ07xD/C@lstrano-desk.jf.intel.com>
 <212ecf88-b175-44cc-af3f-7371340ed480@amd.com>
 <aTdFgVM5s/H5tc4G@lstrano-desk.jf.intel.com>
 <b0781c7fd90c51394ec60faa71222fc3af06bb0c.camel@mailbox.org>
 <e99a2e97-3058-4501-ad22-457ede493a59@amd.com>
 <3e780e52dc0a7f1267e814c895e9d5e840a8c913.camel@mailbox.org>
 <d846a1dd-a705-410a-a043-ffae43bada57@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d846a1dd-a705-410a-a043-ffae43bada57@amd.com>
X-ClientProxiedBy: MW4PR03CA0045.namprd03.prod.outlook.com
 (2603:10b6:303:8e::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: d8919ae6-039c-4003-f88a-08de378f97fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGJhVlF5UXV6TDBqbUlReGoyZzllVldQak5jdWFvNU1zQjBzc2dFSFBFVjFV?=
 =?utf-8?B?UTJKQWRmN0pWUFdPSC9vMDJPSGdJUDdMdEhxRFY1Z3VSZTUxbUVTUFM4RWtU?=
 =?utf-8?B?dDlUS0pzNnZvaytxc3drR2JVOWVRcGxBQ0RmbCs5UWlLR2RDT2NQY1BnU3ha?=
 =?utf-8?B?d0Z3VlhGMnhzMC96NEh5emc0Wnl6azdqanlqSm5UUFNFTHBxMjVTbEs0TFJS?=
 =?utf-8?B?ZWk1LzlhWWNuM2Q0QTE1QktPZEJ0Y3ExM3pmWTlET2MzMjRTUnkweFZQcXA4?=
 =?utf-8?B?ZUVqTi8xblBMRi8ra2U3YXZZeSs2dk5ZWVVQZ2Y2czdVdmZDRFFuOVlpRzBl?=
 =?utf-8?B?Mk1TMzdJdlFidC9adlBJYXIrNGYwYmlEMGEzQ0pPcVdpTFRrR2o1Y0hoRlRv?=
 =?utf-8?B?MEVlNy9xS0ZxdUFtcTEwYjMrQ1lvN25jc0lURFlyV0NBTC9jK1NNaTlhWWRm?=
 =?utf-8?B?WFp2Sks2M3ZRRTBiaXQxT3ExemJSUittYXhiNVhWWTFqYWxjM0VGbTFZT1Rj?=
 =?utf-8?B?RkF2NWxhYXlPY2tFZ0tNYUdHNVhRVXlmbWFKVjQ4ZXRBYU1uWHV0UmZDSWFv?=
 =?utf-8?B?V1BjVW5yaVFqcUpFejhFYlVLZUlFK2lDS0s2czBWZlFBM2N1NDg1azVBcG0y?=
 =?utf-8?B?S2Jmd0VCOVFnUmpvL1VEYjU3NmJCNlZLdXk5b1gzUjhhWEQ5aWxsWllNOTEv?=
 =?utf-8?B?SUc5MmNUTllEcFk0Q29rUEdLWWlJRE9KTHdOaFpIREEvWFFEWTVNU000Q3A5?=
 =?utf-8?B?TWVVd3RiNHFlU1hRNnRlYzdKNFZpS08rOXF2S1hNMGxZSzVqcjF4NDNQeVlV?=
 =?utf-8?B?dC9tdm1LallZRzhCYWFsN2IxTjlneWFrRW9yK1orU2pVTVpWRExIVVJnOWRz?=
 =?utf-8?B?dm9idjV1cUpJM2NReEVuMWwrK3B5c1AweTB4NWIzaUxCS3psOXFpQTlnaXcx?=
 =?utf-8?B?eDQ3Q1RqT01FalFlYmF3Z1FoRk5IUzJ6NHJ6cUhwdk1JWlh1bFg2cFk4aU1u?=
 =?utf-8?B?ZERiVzRlMUxKejNxTkR6R2RQVlF1eU1OMDlZblB0NmtRWWZENDUyeVhLdUZS?=
 =?utf-8?B?bnBTQktHSmdTbE04alFKZUU2cWdRWjFVZ1ZMODNaSFJmdWpYbVZnYVRQYyta?=
 =?utf-8?B?VFRkdFVxNStHTFAyUnRRbndUOFhCMFNvclF4M3BrUXJ5RytOaE9wOCtZREh1?=
 =?utf-8?B?ZkhobUNlcC84VlNZSWNhMVVBZVgyUnZ5Y2t2enNINHJIdWd5TlJBallmanNj?=
 =?utf-8?B?b0JlOElTalFrYlFOTmdBMmNZNDkzbUJkZDR6Ym5SRXdIcFhoREtvUkNhRkdB?=
 =?utf-8?B?enJwb1VQd0NVMW9JUHdCYllQQ3BOZnd6VmUrV2VwWjJmR0V0Y1lvMWV2S2kx?=
 =?utf-8?B?OG5iY0YxSEY1OW41NVozRld6Z0tadFpOY3I4bWkvTUI0b25mYWV1YVp2WFAr?=
 =?utf-8?B?d3A1VXZPUzlNaWlpVXpYMnllcDVGcVlyd0tZWnlCTjlERkdSd3NYWlVIOXpX?=
 =?utf-8?B?bVFQM0tYdnJUTW1Xc3J4VTNiYWdQYytLa1RSdlcwZEdaNVBjZWpZOHdMbnBr?=
 =?utf-8?B?RVBBSGtwUXFPUHNmWUdrM0FpQlRPOG1iRHRncVRQYnBmN3lkb2Z3ZjFYS0FK?=
 =?utf-8?B?SEczUXZ4OUtPZVNIajQ1WS9BdE1POU4zYlh5RWdBbEVqdS9ZVHQxSHpDUUp4?=
 =?utf-8?B?eXhNLzF5NGRhL3NzN08wbFFJZm56eFAzeEpZRzBzSTJHWU5talFDeWh2Q3gv?=
 =?utf-8?B?WTR4NHlBZnlmUSsyQVNUM2JZMFFmOWs1VVBnOTNtWTVKR25Md2c5TDJ1VTN3?=
 =?utf-8?B?OURwTWtKR2t5VUV3eWlsL0J0YjE4VXUvclMrNStHVDd4Nm12c0xDUVpGZEZV?=
 =?utf-8?B?UFBETE9kQkoveGlsWlpTRHJQbDEwT2R6NFcrQkZHZHlrNlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjFET2dRNGFoSHVSeDEvRXNLR2RhMk5PbDRuK2wvWXQxZDNlTWJsOEpFNzc1?=
 =?utf-8?B?cVhDUGZxMllzdkt0eVJ2NVhldFc1aWQyNlNRaUwrZWVQUXYwd2I2SStSdzA4?=
 =?utf-8?B?Um5XRHF3OElpbE1mY1p2M2p4VGh5SVluZWdpdW1xWkhvcFdLK2FZOTNnOURY?=
 =?utf-8?B?QmlVcEM4ZkFDZHdJclVXV2dPSWJ0NVNPN0R3RjhuTWl2Q1poTUtDY0lMY1Fv?=
 =?utf-8?B?OHRCbTNBbEZheTZud0pTRVFlRnh3bnBBUDBZc09uZWNRNXR4Nkcrd2pCNmM1?=
 =?utf-8?B?aWJMcXRKNU40WFdtOFViUExFZXdlNEt2M1dIK1E0dXAxOEZkNC9ucEVYUnph?=
 =?utf-8?B?Wnlka2JLSnF6WW9RNlpTMjlCVU50bkN4YUp4QnI1TmFJdUYxTHVrakYvNGRY?=
 =?utf-8?B?MmdOVU5WamFkeXN5Ry84NURieE1xQzFzQnRYbm5pVDF6b2p1U2lGWWQ1RXV3?=
 =?utf-8?B?UVRZYjlmWDVGbHVEa1FCSFRxOGx3eGdwNFNSWk1mSkJiMlVGYWwrcm1wcjQ4?=
 =?utf-8?B?V2l1bTRyUXhVdSt6aS9GM2xYY29iazNzKzZqOVV3cUMxVHpIMjU0dW5GZ0FJ?=
 =?utf-8?B?TGpleisrWlpuWnkrSnBFa0crZkhIRkN5RzJWci8xODhVV3VBZTFZSERkZXZt?=
 =?utf-8?B?VDBhUC9aWlpLSGx6SkM3WmpsSGtnSzk2ZlRzZzFtY3VzaVkycTYxc3RtN0pt?=
 =?utf-8?B?U1FaOWw5cjRmaVlDT3h4dU1HRW5GaVo0akNZcVpXOFZ0QnU2YXhGQjRtUGF6?=
 =?utf-8?B?bkhLbkhNNlkwZkgwTEdrS3VzcDJFSFoxeUpLaUhjTkJyZGswaXJscW92TXRO?=
 =?utf-8?B?bW80QmVrOUN4YVRSTCtRQWNsYXpNTEhEejBzVXQzUC9aV29UN1lOeGltbXE2?=
 =?utf-8?B?clM3cTFmU1JVZ1ZvRjVFVTV3NHVqSWtLZU9hY2F2SzNRc3JXaGhiTUd3WTFu?=
 =?utf-8?B?VDNhc3c2TXFOMlFra1c0QkhRd2FHVzEzNTluODlXaXJpQXVQTFBXNGY5MUVX?=
 =?utf-8?B?cEw2VEFhSzZJSU5UeEFHSFZ4eVpaKzZjSVlTa1dRMGZoZmdocTdlUWFFQjJJ?=
 =?utf-8?B?MXpTclN2bUh4b0N2bm9ESzNreXl3bzRRQkg5Q3IzSlNnZDROdFJpNGVmTWNB?=
 =?utf-8?B?NVZNRWYvWFk3RDNmcldnWmZ5dDB5Nit5VXpRYWlXYk1lTXNtVlBiVmQ1RlM3?=
 =?utf-8?B?SDcrYVRnMlFQaSs0Z2lEbjJiSmpyQVBLTUVFeVRvM25QMGplWVpNR0x4K3RH?=
 =?utf-8?B?OTBFUncxYkdSbjBpU2NxQ01xOE9pU29tQ2NtbDFmRnRhZERaN0V3bEpjQlhD?=
 =?utf-8?B?NjN2d2h2MFJMUmx0cHJ0WlJveTJLTVN4aVhHMWhEN2ViOUVqNVZlcE1YSmY3?=
 =?utf-8?B?ejB6cFlJUzBaN3NSajdWN0h6MEtNdUdHZVVENFpoMERFdEVZdkhESjBhNHhB?=
 =?utf-8?B?V1dHVXpZMkd6eFZpYjRKS3hCK3lUdm5mYTFXN1E4M2I3RjVtdTVFOHpacys0?=
 =?utf-8?B?RG9XVDZHSTlONnlvYWVjZFNSNktEUTZWbjJ1cytva0hKa2RCbjVGQjByY3BF?=
 =?utf-8?B?SGphSDBqQmxCdFI1RHZZMm1NNkdNVFpSL1M3L2txU3pMYVFqNUExUExnSmZq?=
 =?utf-8?B?RWp0WDBMVUNxZ1VPbmkzZlY1bzE4a1hSa0cxQ1V0UFhXYUJFYjFYYUVtczY4?=
 =?utf-8?B?eFhoOHkxeEloY2RQNjNHYVVCUXBZazlubFpBMVBmVUtqeXc4R2tLTDhlTnBO?=
 =?utf-8?B?RWpZcWNHYUUxNlUxZkoxQWJPK0ZXZ1RnY3h0UHM2dGpLc2QwQ1VkeXhOMjNX?=
 =?utf-8?B?NXBRVHZxVjdBLzR6aUNlMTh1NnZSTlRkMFpsNEtIRVdNemJsVHRySGpaMXAw?=
 =?utf-8?B?UnNvTHBJLzVQSEwvRjBMRHJYY3ZVc3N5Y3BQWTlYNjFTcUUyVXNkeWxJQWFy?=
 =?utf-8?B?cnVyMHdLQVYvTERlWjZTbERYdzllN1hOamJTUk16aFNTVU0yM2plUWpYWFpi?=
 =?utf-8?B?TDJsK0F1SHI0VjdTYm42K2xVTU44RGczQ0tHamtMRU01UFRTbThZcDQ0UFNE?=
 =?utf-8?B?MDljYlhXSG5RYVlYbkZFWjhsZmdHNGhaeHlhb3A2WEhGUVJQQXZzTFRyWUw4?=
 =?utf-8?B?VzdNaFVFMCtrRXkyK0dGV0xQMGJkbmt2Nk9rQ2dQZEp3T2VMZ0FUd2Y2WWw1?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8919ae6-039c-4003-f88a-08de378f97fc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 01:58:20.4441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KCwE+8GrwDm+hQz0JdnAx9UyFOknoxqLrm1LLCjYsL5aEgcJz7jD17LJEflGcMwJbNTt1FpXl6DfvLTAA+sWWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8552
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

On Tue, Dec 09, 2025 at 03:19:40PM +0100, Christian König wrote:

Hey all, apologies for the stream of replies today. I looked into this a
bit more after finishing up my day job and having several “WTF” moments.
Trying to unify from this reply [1].

[1] https://patchwork.freedesktop.org/patch/691101/?series=158224&rev=1#comment_1273453 

> On 12/9/25 14:51, Philipp Stanner wrote:
> ...
> >>>>>>>> How can free_job_work, through drm_sched_get_finished_job(), get and
> >>>>>>>> free the same job?
> >>>>>>>>
> >>>>>>>
> >>>>>>> It can't.
> >>>>>
> >>>>> But exactly that happens somehow. Don't ask me how, I have no idea.
> >>>
> >>> *Philipp refuses to elaborate and asks Christian*
> >>>
> >>> How are you so sure about that's what's happening? Anyways, assuming it
> >>> is true:
> >>
> >> [  489.134585] ==================================================================
> >> [  489.141949] BUG: KASAN: slab-use-after-free in amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
> >> [  489.151339] Read of size 4 at addr ffff88a0d5f4214c by task kworker/u128:0/12
> >> [  489.158686] 
> >> [  489.160277] CPU: 11 UID: 0 PID: 12 Comm: kworker/u128:0 Tainted: G            E       6.16.0-1289896.3.zuul.0ec208edc00d48a9bae1719675cb777f #1 PREEMPT(voluntary) 
> >> [  489.160285] Tainted: [E]=UNSIGNED_MODULE
> >> [  489.160288] Hardware name: TYAN B8021G88V2HR-2T/S8021GM2NR-2T, BIOS V1.03.B10 04/01/2019
> >> [  489.160292] Workqueue: amdgpu-reset-dev drm_sched_job_timedout [gpu_sched]
> >> [  489.160306] Call Trace:
> >> [  489.160308]  <TASK>
> >> [  489.160311]  dump_stack_lvl+0x64/0x80
> >> [  489.160321]  print_report+0xce/0x630
> >> [  489.160328]  ? _raw_spin_lock_irqsave+0x86/0xd0
> >> [  489.160333]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> >> [  489.160337]  ? amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
> >> [  489.161044]  kasan_report+0xb8/0xf0
> >> [  489.161049]  ? amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
> >> [  489.161756]  amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
> >> [  489.162464]  ? __pfx_amdgpu_device_gpu_recover+0x10/0x10 [amdgpu]
> >> [  489.163170]  ? amdgpu_coredump+0x1fd/0x4c0 [amdgpu]
> >> [  489.163904]  amdgpu_job_timedout+0x642/0x1400 [amdgpu]
> >> [  489.164698]  ? __pfx__raw_spin_lock+0x10/0x10
> >> [  489.164703]  ? __pfx_amdgpu_job_timedout+0x10/0x10 [amdgpu]
> >> [  489.165496]  ? _raw_spin_lock+0x75/0xc0
> >> [  489.165499]  ? __pfx__raw_spin_lock+0x10/0x10
> >> [  489.165503]  drm_sched_job_timedout+0x1b0/0x4b0 [gpu_sched]
> > 
> > That doesn't show that it's free_job() who freed the memory.
> 
> [  489.405936] Freed by task 2501:
> [  489.409175]  kasan_save_stack+0x20/0x40
> [  489.413122]  kasan_save_track+0x14/0x30
> [  489.417064]  kasan_save_free_info+0x3b/0x60
> [  489.421355]  __kasan_slab_free+0x37/0x50
> [  489.425384]  kfree+0x1fe/0x3f0
> [  489.428547]  drm_sched_free_job_work+0x50e/0x930 [gpu_sched]
> [  489.434326]  process_one_work+0x679/0xff0
>  
> > @Vitaly: Can you reproduce the bug? If yes, adding debug prints
> > printing the jobs' addresses when allocated and when freed in
> > free_job() could be a solution.
> 
> We can reproduce this pretty reliable in our CI now.
> 
> > I repeat, we need more info :)
> > 
> >>
> >>>
> >>>>>
> >>>>> My educated guess is that the job somehow ends up on the pending list again.
> >>>
> >>> then the obvious question would be: does amdgpu touch the pending_list
> >>> itself, or does it only ever modify it through proper scheduler APIs?
> >>
> >> My educated guess is that drm_sched_stop() inserted the job back into the pending list, but I still have no idea how it is possible that free_job is running after the scheduler is stopped.

I believe I found your problem, referencing amdgpu/amdgpu_device.c here.

6718                 if (job)
6719                         ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);

Which is after:

6695 skip_hw_reset:
6696         r = amdgpu_device_sched_resume(&device_list, reset_context, job_signaled);
6697         if (r)
6698                 goto reset_unlock;

The job is likely added back into this free list here:

6676         amdgpu_device_halt_activities(adev, job, reset_context, &device_list,
6677                                       hive, need_emergency_restart);

So free_job runs and 'job->pasid' explodes.

Save off the pasid on the stack at top of this function and I suspect
your UAF goes away. This won't untangle this hair ball of code but I
believe this at least prevent explosions.

But let’s dig in further—amdgpu_device_halt_activities calls
drm_sched_stop (Xe just calls drm_sched_wqueue_stop for reference). This
function stops the work items, then adds the offending job back to the
pending list, iterates over each job, removes the CB, leaving the job in
the pending list. If the CB can be removed, it removes the job from
pending, maybe calls free_job if it’s not a guilty job, and if it is a
guilty job, defers the free_job to the timed-out job so it doesn’t
disappear. Like WTF?

Oh, it gets better—amdgpu_device_sched_resume calls drm_sched_start,
which iterates over the pending list and reinserts the same CB that
drm_sched_stop removed, then starts the scheduler. So the guilty job had
its CB successfully removed, and now it can immediately disappear—also
like WTF?

Free_guilty is clearly a hack around the job not being reference
counted, and it doesn’t even work in some cases. Putting that
aside, I think calling free_job shouldn’t really ever happen in TDR.
Imagine if drm_sched_job_timedout just took a reference to the job like
normal kernel code—free_guilty could be dropped, and immediately this
all becomes safe. Likewise, if the run_job work item had a reference to
the job, which it takes before adding to the pending list and drops
after it’s done touching it in this function, then run_job and free_job
work items could safely execute in parallel rather than relying on an
ordered workqueue to keep that part of the code safe.

> >>
> > 
> > And my uneducated guess is that it's happening in amdgpu. It seems a
> > sched_job lives inside an amdgpu_job. Can the latter be freed at other
> > places than free_job()?
> 
> Nope, except for error handling during creation and initialization.
> 
> > timedout_job() and free_job() cannot race against each other regarding
> > jobs. It's locked.
> > 
> > But maybe investigate Matthew's suggestion and look into the guilty
> > mechanism, too.
> 
> That looks just like a leftover from earlier attempts to fix the same problem.
> 
> I mean look at the git history of how often that problem came up...
> 
> Regards,
> Christian.
> 
> >>>>>>> At line 1269, the run_job work item is interrupted. Timed-out jobs run,
> >>>>>>> call free_job, which performs the final put. Then the run_job work item
> >>>>>>> resumes—and boom, UAF. Using the same reasoning, I think moving free_job
> >>>>>>> to the timed-out work queue could also cause issues.
> >>>>>>>
> >>>>>>> If run_job work item took a reference to the job before adding it to the
> >>>>>>> pending list and dropped it after it was done touching it in this
> >>>>>>> function, then yes, that would be safe. This is an argument for moving
> >>>>>>> reference counting into the base DRM scheduler class, it would make
> >>>>>>
> >>>>>> typo: s/DRM scheduler class/DRM job class
> >>>>>
> >>>>> That strongly sounds like re-inventing the scheduler fence.
> >>>>>
> >>>>
> >>>> Perhaps.
> >>>>
> >>>>> What if we completely drop the job object? Or merge it into the scheduler fence?
> >>>>>
> >>>>> The fence has reference counting, proper state transitions and a well defined lifetime.
> >>>>>
> >>>>> We would just need ->schedule and ->finished functions instead of ->run_job and ->free_job. Those callbacks would then still be called by the scheduler in work item context instead of the irq context of the dma_fence callbacks.
> >>>>
> >>>> Yes, definitely no IRQ contexts.
> >>>>
> >>>>>
> >>>>> The job can then be a void* in the scheduler fence where drivers can put anything they want and also drivers control the lifetime of that. E.g. they can free it during ->schedule as well as during ->finished.
> >>>>>
> >>>>
> >>>> I think this is a reasonable idea, but it would require major surgery
> >>>> across the subsystem plus the 11 upstream drivers I’m counting that use
> >>>> DRM scheduler. This would be a huge coordinated effort.
> >>>>
> >>>> So I see three options:
> >>>>
> >>>> 1. Rename free_job to put_job and document usage. Rip out free_guilty.
> >>>>    Likely the easiest and least invasive.
> >>>
> >>> I think I can live with that. It's work-effort wise the best we can do
> >>> right now. However, that does need proper documentation.
> >>
> >> I think that is the worst of all options.
> >>
> >> It basically says to the driver that the job lifetime problems created by the scheduler is the driver problem and need to be worked around there.
> >>
> > 
> > My POV still mostly is that (with the current design) the driver must
> > not use jobs after free_job() was invoked. And when that happens is
> > unpredictable.
> > 

This is somewhat of an absurd statement from my point of view. I have a
valid job pointer, then I call another function (see above for an
example of how drm_sched_start/stop is unsafe) and it disappears behind
my back. The safe way to handle this is to take a local reference before
doing anything that could make it disappear. That is much more
reasonable than saying, “we have five things you can do in the
scheduler, and if you do any of them it isn’t safe to touch the job
afterward.”

> > To be unfair, we already have strange refcount expectations already.
> > But I sort of agree that there is no objectively good solution in
> > sight.
> > 
> >>>
> >>> Let me respin to my documentation series and upstream that soonish,
> >>> than we can build on top of that.
> > 
> >>>
> >>>
> >>> P.
> >>>
> >>>>
> >>>> 2. Move reference counting to the base DRM scheduler job object, provide a
> >>>>    vfunc for the final job put, and document usage. Medium invasive.
> >>
> >> I strongly think that reference counting the job object just because the scheduler needs it is a bad idea.
> >>
> >> With that we are just moving the hot potato from one side of our mouth to the other without really solving the issue.
> >>

See above—I can’t say I agree with this assessment. I think the lack of
reference counting is exactly the problem. I don’t really understand the
pushback on a very well-understood concept (reference counting) in
Linux. I would sign up to fix the entire subsystem if we go this route.

> >> If a driver like XE needs that for some reason than that is perfectly fine.
> > 
> > Nouveau doesn't need it either.
> > 
> >>
> >>>> 3. Move job (driver) side tracking to the scheduler fence and let it
> >>>>    control the lifetime. Very invasive.
> >>
> >> Thinking about it more that is actually not so much of a problem.
> >>
> >> Let me try to code something together by the end of next week or so.
> > 
> > The hero Gotham needs :)
> > 

Are you sure about this one? I think unless the problems around
drm_sched_start/stop and free_guilty are fixed, my feeling is this
entire thing is still badly broken for anyone who wants to use those.

To sum up this whole email: I strongly disagree with option #3, but if
that is the consensus, I will, of course, support the effort.

Matt

> > 
> > P.
> 
