Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27199D895D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 16:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DB510E686;
	Mon, 25 Nov 2024 15:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6/PG7/M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FF010E682;
 Mon, 25 Nov 2024 15:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732548577; x=1764084577;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wvblXh9kpCTpP9S1/dz6TtSFmxQghilt1gzzthJu5LA=;
 b=R6/PG7/MJY6KuUO29cni2iJvFjLX8XVDzZq0TYC1Ckk/Z4hkYnqzFVPe
 IK74pz59HwSmtufn6X3ekAxGSVBD5Dz7W/dKr4TrjaRnDfj+949k83LHN
 rEmO0jVh2Of5rVaBt+h10AGPYzwl87ZfOSyDxmS2VfVcAZoKFSmTFB879
 3qXevVIu1IYmwlofgScDZYeWc79nvSw3diPWlJ7TFToHeuMoB8TZlc4SC
 eCVOdLJs8VhmQW+8i6r6lcDwSpaBaBIad3eQ+LmMln5OHPm2WlaqG6hAK
 VWHMOdq4OELm+/5DR7r2PfXy9T2j2mP8EYdGPZllkF98j+C9K2oy13GNQ g==;
X-CSE-ConnectionGUID: H6c6CYb8SruVbmlMw31KIQ==
X-CSE-MsgGUID: MJE7HunLQv2vL6a6D+gLbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="43728228"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="43728228"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 07:29:27 -0800
X-CSE-ConnectionGUID: L0g0K6cYTJeoegVQKivlNg==
X-CSE-MsgGUID: //6U/4PwS9a2ICVM0t9oaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="91082520"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 07:29:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 07:29:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 07:29:26 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 07:29:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2JwbamBEGhk4VnpCuI2+RJSV0TiQThMxqqUNmK0aHzAuDFogSTMnRrSN8fKWiRr6Nly0KZDWSlWc+qb2Uxh/rbUfI2Eo6GhTnSu/4DwRl3azfLcFvKqCRUJvaNxEp7KHVwOcZ0+UukPpSIcubZVogqalgmHb5BLZXvtN+UOs6yNO71xfjKz8h7jTFbB+qNu1du5fhVu7e0jVV1dkEQuSMM1d1NUdkrbSebdRveKjUlebWfyk4GSmssDyiUmZTgGwlbf/k+2jcsAKc/1fUGnAH4nw3ohwByADSgWzAduTeJP9dltZibl3DPBn1FL7+wjBJSnTV5TP4/7Um5gEYIilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xktraipnvnUCiW1V1PK6/mmBijo3lskHEM1i/q2Sar8=;
 b=Ex0kRFvL9u18+rEuRImt2jbbp3ad8uhMzpoLfqnttQTKR3hJLb4L6/Qi55uuySoJARNXtO4N+qfMaKkqoUz66Q26ocaEb9hBKoID5RYvMHBUu3xA6xqBGUrJ+LSFaD53pf2K1M5BUk9Mf/3ANHnNHMavsQaX+e/ZmLqkVwhDuprxbdnAH06fNpcptYbny7tWb+FyRoDKsQdNj16d0bge2dawEZQmZGtoNCU/C86LNMt54SK0xXP1uRAAI32SU2xfTnt2GBxDLYluBgrMFYP/MGg0U71ieXCKYFnrhn0jQkXQksbhU04D2Nb3qBBXyIFJ67v9FgNiYrewml9TBO0DjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 15:29:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 15:29:22 +0000
Date: Mon, 25 Nov 2024 07:29:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui
 <ray.huang@amd.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <matthew.auld@intel.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
Message-ID: <Z0SX8WJCPADGLVE5@lstrano-desk.jf.intel.com>
References: <ZzKJHxaMnWKQ5mzV@lstrano-desk.jf.intel.com>
 <31b16d78-708d-4f19-9b33-891e31be5480@gmail.com>
 <173141886970.132411.13400253861916730373@jlahtine-mobl.ger.corp.intel.com>
 <27f8bd540ac1f04daf8a7786f4ae7828017d061b.camel@linux.intel.com>
 <c62e5298-1ca6-4cd0-a558-3d2a91175fa0@amd.com>
 <d469ab3509a1b875ad0c44d01569675682d6c61c.camel@linux.intel.com>
 <6ab9e754-6f4a-48ec-b143-02585bc40291@amd.com>
 <5a16ef4ff06a530c52df7633833db19aaa15b33e.camel@linux.intel.com>
 <8d17a8a2-9a44-4f80-92b5-a8aa3efe6bf2@amd.com>
 <ZzeSr5ut6GVEwSJY@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzeSr5ut6GVEwSJY@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:303:b5::9) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0cb036-b3a2-4c87-08e4-08dd0d65ef30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTNNc2dnekpMaGRSWTZ3RWsvQUYvUGRaUWh6WUl6ZklRMnpzbmlDdmpmL3lW?=
 =?utf-8?B?WmoyOWRabHBPZ2RMNy9INThDak9BOGJoK2FxOVpyTEs1UUJEeUV0TmVIMHN0?=
 =?utf-8?B?QjdwRXU0T1pqdXF1Yk43MjFhZFZSSEgvQXFaVndURjdvR2g4cXZzMFpUdk5O?=
 =?utf-8?B?N0JTQmZwVytQbzlxekNBUkp5VW5ZZjJwbnBZUjhuWS9oZGFMaHJ6NTNSRi8y?=
 =?utf-8?B?a1pTYmFqSnJqL2VVbGx1ZFI1SEc2RjhrQnV5bmZxYXBjRzdWWEZDcWM0eU9H?=
 =?utf-8?B?Mm9NS1cyMzlwT1I5NTQ0Z05NT2h3SXE1WFlNUzdRMWUySnZrWlZLTkdOUGRy?=
 =?utf-8?B?ckcyaW9jOVN6KzY0TTU1U1VaSkNuZkNJVzVDZG9jbG5wbVRtNDYweEkyQTFE?=
 =?utf-8?B?WER5VDhIYmJJZWhUV0dvdE1Fcy8zTDBGNDZ2ZDZSQmNwYldNWjlwU0ZsS0ZS?=
 =?utf-8?B?MkVWa2FENVRRblFzQm51M0FWWkhXeTkvTzlYbEFrWjIraUFUR1Q4Sldnbzdz?=
 =?utf-8?B?YktzV0hKaEdrUkF1Q2hGbTZMZVJQL0h1ZXBmeEJoTFJqckhxUXdRUXh0aUVs?=
 =?utf-8?B?WWViNWs0VkZsREw3WUt0b1Jqck9zUEREOWZjU2x3emphK1k2SlNlU1pnSEEv?=
 =?utf-8?B?L0FOa0RrSExtMlVFVkwzUlhHakRMMTlTR0t2UUtFOVlRQ3dvS3FZUXA0VFh2?=
 =?utf-8?B?c0R5aUFFOFZqTnNieG81ZW43ZTRRSFRJQTd2cUs0L2x1VndtZ0VXU3ZIOW5v?=
 =?utf-8?B?ZEJTWVMzUEN4UjJtNktodEF3aFVaMnkrYVFkdzkyb3hONWxLdjdWTmJrbGZ4?=
 =?utf-8?B?S2hISXVCYUZkdGNRdlQxcHJpekhvS2JpLzcyWVNLNzlDbkpXOUVOd3h4YTkw?=
 =?utf-8?B?OU51TFJMS1ZVQjNqZmRRcm9TcXRWN1E2bk9YeDFmSGNaWDFmT2pmbkcwYXRS?=
 =?utf-8?B?TlUyb29kNko5WVpBNjQ2MVR0ZWtSZ0JxazJwUUd0aEIrWHpyR0pQK3h2dHNQ?=
 =?utf-8?B?Umpwb3NZTmRTZXovTjVZS0x4SlpYMFA2R3Z4K1UzU3V2cU9ncmdaWCtaR0ds?=
 =?utf-8?B?akdMbTBuYndFTkJQSGYyQXFRbjFwNmdJRnhhVnV0QTI5dEJJQ1BzUWdtKy9M?=
 =?utf-8?B?RFFtRGZ5ajErV3hIUi93MzY2SVhPMEdadDM2dW5BQlRhc2RyRFdheUJtdTFY?=
 =?utf-8?B?Y0NOWHRrMlhNZGN6ZEFMNDhtdFA1Z1BrWldZK293YTdnUlZkRUtCQjV0UFZH?=
 =?utf-8?B?WkZBeVdPN293cStDQ3lCaHZsOG5qN2l3TTJ4MHk0M0taNUV4NzlRdlAwOU5N?=
 =?utf-8?B?MkJOM0RwUWQ1Q1F5emg3WElObUhEY2E5MFRJM2p2Qko5NXZtYmdhMU5aQW1Y?=
 =?utf-8?B?UGxsc0lOc1VkVXpCaUNJR3Y2dUI1dkF3TVJ1UGZNc2tyT2dXZHd3RmkvSEV4?=
 =?utf-8?B?OC9MRTZQQ0I3cmVVZjdFMmxHVEN4M2gvK1BmWXZsT1huOHZBZGJPanBHYXlD?=
 =?utf-8?B?SkpGS3BmbHNaTnJNRlRLQXlNODVOWWhvYkltNGJsaEtLY1dlNVk5NGVJWjVL?=
 =?utf-8?B?eXZnWjQyNFZVUUFtKzY3RGxVSG5ZejdSWmQyaWR4UGQ1aHQ4ekIxQ3lNdlNs?=
 =?utf-8?B?MHVhSXRDK2luUmNRK2FPc0JSWHRma1dYbnk1K2djM0J0dVVsYXJCNkJaN2Y3?=
 =?utf-8?B?R2l6RlI2aExXM3FpUUZVN1VHdFpNUGZndTdGRmdLTVNDckIxVG5uTklRcVlQ?=
 =?utf-8?Q?VCpJFAIxKmEipQo/Q9YxG5lmGwDUdP5SRK59OG7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1RiQmF2M1B3c0QvZGk5R05VZWxYZitvZU0zUnduREc1UXF6bDhZM05vYXBQ?=
 =?utf-8?B?S2JkNlJDd0NtcjJCK25zZFMycGpjcXV5UG1iK2V1aU41UG5Rd3VERFdUSHdM?=
 =?utf-8?B?S0w0cjdQOHVsdXpkamkwb1JvQmdtZ05OclNGMFo3V2RMRWl0OWV1WVZYMWVY?=
 =?utf-8?B?WkRycjBWUHEwQ0Ftd3NMZEc3VnZJb2tnL0xzWno5aUthNlVvRWFkRTRRQXpl?=
 =?utf-8?B?QnF2QTlIeC80U1BsWEJmV0xUamFBNjlCQVE4b2hTbWtwY2EzbUx1cGszdW9T?=
 =?utf-8?B?Y3BGOXZVc0oreklkaXU1Mmhnck9PQzRBUFlxNVdTbUwzSUlpM0FzRlFmRTJn?=
 =?utf-8?B?RkZZRU9mMUE0eEtDU2ZWRzhCMllvY3hCR2ovTnZZbHNKWTlSNTVmZXkwZzRD?=
 =?utf-8?B?c3VqSDA1ZFVWTVJaTFNYRFRnTEN6Z2dKTGQ4QjEzQUd3Q3VhVTlsSFhiTXgy?=
 =?utf-8?B?UXdseWZEd2VWL2FEK0U0eDJ2ZEVQY0xiMkhBeHUwSVdGTTVhOTJWS1pRNzY0?=
 =?utf-8?B?dUtEU3NjbHJWZWx5QVdyY3VGT004dG5lRTZOSWo4dWdUd3B2M2QrTEFLZmxt?=
 =?utf-8?B?WWN3SXZnUVVmdVdON2kzQStVbmMxMzBocFVzcHNKVk41enJ2dXRKU1V3NlpS?=
 =?utf-8?B?VzdGU2YxS0NtSWtCVE5IVk5rWFg3OFp1NVBVUm5xVkRsdEpsS3cvYnpBdjFj?=
 =?utf-8?B?MzZEc3NwRjV1SVplTzZBOGFxYWo0RmdkdXdpRTZjT0gxd21WZ293NngyMGlT?=
 =?utf-8?B?b2cvT1UwMWNrRGVaT3h0QTAzWWl3SGRlU3k1Q1JZWGs2bTc3VDFNdUdhT3Jn?=
 =?utf-8?B?cXhvdkMrYngwSUh1RWdIbzRQODV5WGZLY09BUEN4YzI3cm45S3FVQ0pneVRM?=
 =?utf-8?B?NWJPSXJwc1Bld1pzcFludURldnkrSG9kdTJKaVJ2M0tLNStEZFJ3aDRHM1pK?=
 =?utf-8?B?azhrMXdwbTFNSVVXSDk0WHVQVnEyaFRHall3bDZ2Q3ozYXdKd2R4QVhyYTFq?=
 =?utf-8?B?Z2pJTGFXWUJaWlFyUzdoV3ZmOG1OdktrcVRxRThIMmxtSE4wZkJTdUJpd1ZJ?=
 =?utf-8?B?UThWZm5VZjNCWDcwN1hJTDNnSjhFUTJlT053NEdtTVVHdFFKR3JOcmFrdVo4?=
 =?utf-8?B?MzVNSHRYYXJ1ZC9nK0ZCTWordWFqZjNvU2xOaVhYN3B2Y29RNEw0TTk4UjZk?=
 =?utf-8?B?T1JJOVArLy9YTmJuOTBaYVR0c2JDZkVLSmpMb24zZW8vdHNNdFovODNxTXIy?=
 =?utf-8?B?RHhzdms4YlBscW5oVHRmZGM1dmJwMEVnT3B0RzFDU0pDVHlTUU1LdGRpeWIw?=
 =?utf-8?B?eGV0bnBQNnFzWmkwYTkvdHFETndTRGtReHJVRjQ3RDQzajZMUVZPTnV6dUc5?=
 =?utf-8?B?UUpBQkZQRlIxNGF2WTJCOWc3ZDlzbFU5TTZsTjZwM0RKNnR0U0k3ajl4bUsy?=
 =?utf-8?B?akEzSE9vOUtjZUFJMzZ6SnpXc1lsaHhlMkVlTVR4T2JqcFlmUEthL3dmZ09R?=
 =?utf-8?B?M2xybktqV0NpbmZoMVZrZWNXakF3WnNnb2JSNWhhbndDS0l1SlhJRWxZeUg2?=
 =?utf-8?B?YzcrV3dyUXlkK0J3K3M0YTlBVE9IczlDWDlMQkt1MERzd3Z5eURIbUJKWGxw?=
 =?utf-8?B?TDFRS3hRVDNaem9LazlKWW9zd0dlZ24zakg1cEp2TTVQS3FhcE9xY3pMd0hu?=
 =?utf-8?B?dkhUbldlRWs2NEUyOWVrMmFTTlFMUVdaNnhFbmVQeDBuQ0I1VWExWWl4YWVq?=
 =?utf-8?B?NXlneVNiY1JwT0hQTFUraE5UUzRSQU5BK2lXR0wrNmRRTTNWUHV3RjlNWlRl?=
 =?utf-8?B?NmVhcUlYNnZzV3VsT0k4bWVOVXZPVDBrZFh2RENIT2s3ZmFuV1dPWUhjWW9r?=
 =?utf-8?B?cmZpQ2s2cHhEN1hucTNBNGxYb0ZBL3JLL1JXcThxRXZqZ1FiN0hYaE50Y1Rr?=
 =?utf-8?B?UzlaMVE5b0FvQ0RQSkxZOG1JUXo3WWorNFpWUnNocG5rSmNnOU1oZCtMSHJH?=
 =?utf-8?B?RnB2K0loRUhvZytOT2IvdjFhRUJQelV0aVgyZUJIZDV0QVJrNDNtRTZrMnpH?=
 =?utf-8?B?STBOdEx5aWo3RDkwYm9NVS9jRUxnRWluaThoZkVub2hxdzVGT0lvalNRZE1S?=
 =?utf-8?B?Zm4rUmRlSExUSFpYRzNPZjFYUDZvejJQRUxHUXZpUXU1YkNYRE1oUFFTKzdk?=
 =?utf-8?B?N2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0cb036-b3a2-4c87-08e4-08dd0d65ef30
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 15:29:22.7865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJ5G9JjpWIiosPox8izT23Q+M+IBOMUJ2uxDIbre72mL0AvQ7nIQpEMEAfm1LrPq073/1C1qSJrksup77lj9GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
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

On Fri, Nov 15, 2024 at 10:27:59AM -0800, Matthew Brost wrote:
> On Wed, Nov 13, 2024 at 12:42:35PM +0100, Christian König wrote:
> > Am 13.11.24 um 11:44 schrieb Thomas Hellström:
> > > On Wed, 2024-11-13 at 09:37 +0100, Christian König wrote:
> > > > Am 12.11.24 um 17:33 schrieb Thomas Hellström:
> > > > > [SNIP]
> > > > > > > > This has been extensively discussed already, but was expected
> > > > > > > > to
> > > > > > > > really
> > > > > > > > only be needed for low-on-memory scenarios. However it now
> > > > > > > > seems
> > > > > > > > like
> > > > > > > > the need is much earlier due to the random userptr page
> > > > > > > > joining
> > > > > > > > by
> > > > > > > > core
> > > > > > > > mm.
> > > > > > > Just to clarify here:
> > > > > > > In Long-Running mode with recoverable pagefaults enabled we
> > > > > > > don't
> > > > > > > have
> > > > > > > any preempt-fences, but rather just zap the PTEs pointing to
> > > > > > > the
> > > > > > > affected memory and flush TLB. So from a memory resource POW a
> > > > > > > breakpoint should be safe, and no mmu notifier nor shrinker
> > > > > > > will be
> > > > > > > blocked.
> > > > > > That sounds like a HMM based approach which would clearly work.
> > > > > > 
> > > > > > But where is that? I don't see any HMM based approach anywhere in
> > > > > > the
> > > > > > XE
> > > > > > driver.
> > > > > This is a mode that uses recoverable pagefaults to fault either
> > > > > full
> > > > > userptr or full bos, and used with DRM_XE_VM_CRATE_FLAG_FAULT_MODE.
> > > > > (not SVM)!
> > > > > 
> > > > > userptrs in xe are bo-less, and using the vm's resv, but otherwise
> > > > > using hmm similar to amdgpu: xe_hmm.c
> > > > Yeah, I have seen that one.
> > > > 
> > > > > fault servicing:
> > > > > xe_gt_pagefault.c
> > > > > 
> > > > > PTE zapping on eviction and notifier:
> > > > > xe_vm_invalidate_vma(), xe_vm.c
> > > > Ah, that was the stuff I was missing.
> > > > 
> > > > So the implementation in xe_preempt_fence.c is just for graphics
> > > > submissions? That would make the whole thing much easier to handle.
> > > Actually it's not, it's intended for long-running mode, but as a
> > > consequence the debugger would be allowed only in fault mode.
> > 
> > Make sense, yes.
> > 
> > > > The only remaining question I can then see is if long running
> > > > submissions with DRM_XE_VM_CRATE_FLAG_FAULT_MODE could potentially
> > > > block
> > > > graphics submissions without this flag from accessing the hardware?
> > > Yes and no. We have a mechanism in place that allows either only fault
> > > mode jobs or non-faulting jobs on the same, what we call "engine
> > > group".
> > > A pagefault on an engine group would block or hamper progress of other
> > > jobs on that engine group.
> > > 
> > > So let's say a dma-fence job is submitted to an engine group that is
> > > currently running a faulting job. We'd then need to switch mode of the
> > > engine group and, in the exec ioctl we'd (explicitly without preempt-
> > > fences) preempt the faulting job before submitting the dma-fence job
> > > and publishing its fence. This preemption will incur a delay which is
> > > typically the delay of servicing any outstanding pagefaults. It's not
> > > ideal, but the best we can do, and it doesn't affect core memory
> > > management nor does it affect migration blits.
> > > 
> > > In the debugger case, this delay could be long due to breakpoints, and
> > > that's why enabling the debugger would sit behind a flag and not
> > > something default (I think this was discussed earlier in the thread).
> > > Still, core memory management would be unaffected, and also ofc the
> > > migration blits are completely independent.
> > 
> > Yeah, that sounds totally sane to me.
> > 
> 
> Nice, glad to see this part of the thread resolved.
> 
> Setting aside the peek/poke and FD PID duplication issues (which seem to
> be part of a larger discussion, with Joonas as the point of contact for
> that), we have another use case for this helper in my current series.
> 
> We use this interface to read a BO marked with a dumpable flag during a
> GPU hang in our error capture code. This is an internal KMD feature, not
> directly exposed to user space. Would adding this helper be acceptable
> for this use case? I can add kernel indicating the current restrictions
> of the helper (do not directly expose to user space) too if that would
> help.
> 

Christian - ping on above.


> Matt
> 
> > Sorry for the noise then. I didn't realized that you have two separate modes
> > of operation.
> > 
> > Going to reply on the other open questions separately.
> > 
> > Regards,
> > Christian.
> > 
> > > 
> > > /Thomas
> > > 
> > > > Thanks a lot for pointing this out,
> > > > Christian.
> > > > 
> > > > > Thanks,
> > > > > Thomas
> > > > > 
> > > > > > Regards,
> > > > > > Christian.
> > > > > > 
> > > > > > > Nor will there be any jobs with published dma-fences depending
> > > > > > > on
> > > > > > > the
> > > > > > > job blocked either temporarily by a pagefault or long-term by a
> > > > > > > debugger breakpoint.
> > > > > > > 
> > > > > > > /Thomas
> > > > > > > 
> > > > > > > 
> > > > > > > > If that is done and the memory pre-empt fence is serviced
> > > > > > > > even
> > > > > > > > for
> > > > > > > > debuggable contexts, do you have further concerns with the
> > > > > > > > presented
> > > > > > > > approach
> > > > > > > > from dma-buf and drm/sched perspective?
> > > > > > > > 
> > > > > > > > Regards, Joonas
> > > > > > > > 
> > > > > > > > > Regards,
> > > > > > > > > Christian.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >            This means that a breakpoint or core dump doesn't
> > > > > > > > > halt
> > > > > > > > > GPU
> > > > > > > > > threads, but
> > > > > > > > >            rather suspends them. E.g. all running wave data
> > > > > > > > > is
> > > > > > > > > collected into a state
> > > > > > > > >            bag which can be restored later on.
> > > > > > > > > 
> > > > > > > > >            I was under the impression that those long
> > > > > > > > > running
> > > > > > > > > compute
> > > > > > > > > threads do
> > > > > > > > >            exactly that, but when the hardware can't switch
> > > > > > > > > out
> > > > > > > > > the
> > > > > > > > > GPU thread/process
> > > > > > > > >            while in a break then that isn't the case.
> > > > > > > > > 
> > > > > > > > >            As long as you don't find a way to avoid that
> > > > > > > > > this
> > > > > > > > > patch
> > > > > > > > > set is a pretty
> > > > > > > > >            clear NAK from my side as DMA-buf and TTM
> > > > > > > > > maintainer.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >        I believe this is addressed above.
> > > > > > > > > 
> > > > > > > > >        Matt
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >            What might work is to keep the submission on the
> > > > > > > > > hardware
> > > > > > > > > in the break state
> > > > > > > > >            but forbid any memory access. This way you can
> > > > > > > > > signal
> > > > > > > > > your
> > > > > > > > > preemption fence
> > > > > > > > >            even when the hardware isn't made available.
> > > > > > > > > 
> > > > > > > > >            Before you continue XE setups a new pre-emption
> > > > > > > > > fence
> > > > > > > > > and
> > > > > > > > > makes sure that
> > > > > > > > >            all page tables etc... are up to date.
> > > > > > > > > 
> > > > > > > > >            Could be tricky to get this right if completion
> > > > > > > > > fence
> > > > > > > > > based
> > > > > > > > > submissions are
> > > > > > > > >            mixed in as well, but that gives you at least a
> > > > > > > > > direction
> > > > > > > > > you could
> > > > > > > > >            potentially go.
> > > > > > > > > 
> > > > > > > > >            Regards,
> > > > > > > > >            Christian.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                Regards, Joonas
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                    Regards,
> > > > > > > > >                    Christian.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                        Some wash-up thoughts from me below,
> > > > > > > > > but
> > > > > > > > > consider them fairly irrelevant
> > > > > > > > >                        since I think the main driver for
> > > > > > > > > these
> > > > > > > > > big
> > > > > > > > > questions here should be
> > > > > > > > >                        gdb/userspace.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                            Quoting Christian König (2024-11-
> > > > > > > > > 07
> > > > > > > > > 11:44:33)
> > > > > > > > > 
> > > > > > > > >                                Am 06.11.24 um 18:00 schrieb
> > > > > > > > > Matthew
> > > > > > > > > Brost:
> > > > > > > > > 
> > > > > > > > >                                      [SNIP]
> > > > > > > > > 
> > > > > > > > >                                      This is not a generic
> > > > > > > > > interface
> > > > > > > > > that anyone can freely access. The same
> > > > > > > > >                                      permissions used by
> > > > > > > > > ptrace
> > > > > > > > > are
> > > > > > > > > checked when opening such an interface.
> > > > > > > > >                                      See [1] [2].
> > > > > > > > > 
> > > > > > > > > [1]
> > > > > > > > > https://patchwork.freedesktop.org/patch/617470/?series=136572&r
> > > > > > > > > e
> > > > > > > > > v=2
> > > > > > > > > [2]
> > > > > > > > > https://patchwork.freedesktop.org/patch/617471/?series=136572&r
> > > > > > > > > e
> > > > > > > > > v=2
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                                Thanks a lot for those
> > > > > > > > > pointers,
> > > > > > > > > that
> > > > > > > > > is exactly what I was looking for.
> > > > > > > > > 
> > > > > > > > >                                And yeah, it is what I
> > > > > > > > > feared. You
> > > > > > > > > are
> > > > > > > > > re-implementing existing functionality,
> > > > > > > > >                                but see below.
> > > > > > > > > 
> > > > > > > > >                            Could you elaborate on what this
> > > > > > > > > "existing
> > > > > > > > > functionality" exactly is?
> > > > > > > > >                            I do not think this functionality
> > > > > > > > > exists at
> > > > > > > > > this time.
> > > > > > > > > 
> > > > > > > > >                            The EU debugging architecture for
> > > > > > > > > Xe
> > > > > > > > > specifically avoids the need for GDB
> > > > > > > > >                            to attach with ptrace to the CPU
> > > > > > > > > process or
> > > > > > > > > interfere with the CPU process for
> > > > > > > > >                            the debugging via parasitic
> > > > > > > > > threads or
> > > > > > > > > so.
> > > > > > > > > 
> > > > > > > > >                            Debugger connection is opened to
> > > > > > > > > the
> > > > > > > > > DRM
> > > > > > > > > driver for given PID (which uses the
> > > > > > > > >                            ptrace may access check for now)
> > > > > > > > > after
> > > > > > > > > which the all DRM client of that
> > > > > > > > >                            PID are exposed to the debugger
> > > > > > > > > process.
> > > > > > > > > 
> > > > > > > > >                            What we want to expose via that
> > > > > > > > > debugger
> > > > > > > > > connection is the ability for GDB to
> > > > > > > > >                            read/write the different GPU VM
> > > > > > > > > address
> > > > > > > > > spaces (ppGTT for Intel GPUs) just like
> > > > > > > > >                            the EU threads would see them.
> > > > > > > > > Note
> > > > > > > > > that
> > > > > > > > > the layout of the ppGTT is
> > > > > > > > >                            completely up to the userspace
> > > > > > > > > driver
> > > > > > > > > to
> > > > > > > > > setup and is mostly only partially
> > > > > > > > >                            equal to the CPU address space.
> > > > > > > > > 
> > > > > > > > >                            Specifically as part of
> > > > > > > > > reading/writing the
> > > > > > > > > ppGTT for debugging purposes,
> > > > > > > > >                            there are deep flushes needed:
> > > > > > > > > for
> > > > > > > > > example
> > > > > > > > > flushing instruction cache
> > > > > > > > >                            when adding/removing breakpoints.
> > > > > > > > > 
> > > > > > > > >                            Maybe that will explain the
> > > > > > > > > background. I
> > > > > > > > > elaborate on this at the end some more.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                                              kmap/vmap are
> > > > > > > > > used
> > > > > > > > > everywhere in the DRM subsystem to access BOs, so I’m
> > > > > > > > >                                              failing to see
> > > > > > > > > the
> > > > > > > > > problem with adding a simple helper based on existing
> > > > > > > > >                                              code.
> > > > > > > > > 
> > > > > > > > >                                          What#s possible and
> > > > > > > > > often
> > > > > > > > > done is to do kmap/vmap if you need to implement a
> > > > > > > > >                                          CPU copy for
> > > > > > > > > scanout for
> > > > > > > > > example or for copying/validating command buffers.
> > > > > > > > >                                          But that usually
> > > > > > > > > requires
> > > > > > > > > accessing the whole BO and has separate security
> > > > > > > > >                                          checks.
> > > > > > > > > 
> > > > > > > > >                                          When you want to
> > > > > > > > > access
> > > > > > > > > only
> > > > > > > > > a few bytes of a BO that sounds massively like
> > > > > > > > >                                          a peek/poke like
> > > > > > > > > interface
> > > > > > > > > and we have already rejected that more than once.
> > > > > > > > >                                          There even used to
> > > > > > > > > be
> > > > > > > > > standardized GEM IOCTLs for that which have been
> > > > > > > > >                                          removed by now.
> > > > > > > > > 
> > > > > > > > >                            Referring to the explanation at
> > > > > > > > > top:
> > > > > > > > > These
> > > > > > > > > IOCTL are not for the debugging target
> > > > > > > > >                            process to issue. The peek/poke
> > > > > > > > > interface
> > > > > > > > > is specifically for GDB only
> > > > > > > > >                            to facilitate the emulation of
> > > > > > > > > memory
> > > > > > > > > reads/writes on the GPU address
> > > > > > > > >                            space as they were done by EUs
> > > > > > > > > themselves.
> > > > > > > > > And to recap: for modifying
> > > > > > > > >                            instructions for example
> > > > > > > > > (add/remove
> > > > > > > > > breakpoint), extra level of cache flushing is
> > > > > > > > >                            needed which is not available to
> > > > > > > > > regular
> > > > > > > > > userspace.
> > > > > > > > > 
> > > > > > > > >                            I specifically discussed with
> > > > > > > > > Sima on
> > > > > > > > > the
> > > > > > > > > difference before moving forward with this
> > > > > > > > >                            design originally. If something
> > > > > > > > > has
> > > > > > > > > changed
> > > > > > > > > since then, I'm of course happy to rediscuss.
> > > > > > > > > 
> > > > > > > > >                            However, if this code can't be
> > > > > > > > > added,
> > > > > > > > > not
> > > > > > > > > sure how we would ever be able
> > > > > > > > >                            to implement core dumps for GPU
> > > > > > > > > threads/memory?
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                                          If you need to
> > > > > > > > > access
> > > > > > > > > BOs
> > > > > > > > > which are placed in not CPU accessible memory then
> > > > > > > > >                                          implement the
> > > > > > > > > access
> > > > > > > > > callback
> > > > > > > > > for ptrace, see amdgpu_ttm_access_memory for
> > > > > > > > >                                          an example how to
> > > > > > > > > do
> > > > > > > > > this.
> > > > > > > > > 
> > > > > > > > >                            As also mentioned above, we don't
> > > > > > > > > work
> > > > > > > > > via
> > > > > > > > > ptrace at all when it comes
> > > > > > > > >                            to debugging the EUs. The only
> > > > > > > > > thing
> > > > > > > > > used
> > > > > > > > > for now is the ptrace_may_access to
> > > > > > > > >                            implement similar access
> > > > > > > > > restrictions
> > > > > > > > > as
> > > > > > > > > ptrace has. This can be changed
> > > > > > > > >                            to something else if needed.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                                      Ptrace access via
> > > > > > > > > vm_operations_struct.access → ttm_bo_vm_access.
> > > > > > > > > 
> > > > > > > > >                                      This series renames
> > > > > > > > > ttm_bo_vm_access to ttm_bo_access, with no code changes.
> > > > > > > > > 
> > > > > > > > >                                      The above function
> > > > > > > > > accesses
> > > > > > > > > a BO
> > > > > > > > > via kmap if it is in SYSTEM / TT,
> > > > > > > > >                                      which is existing code.
> > > > > > > > > 
> > > > > > > > >                                      This function is only
> > > > > > > > > exposed to
> > > > > > > > > user space via ptrace permissions.
> > > > > > > > > 
> > > > > > > > >                            Maybe this sentence is what
> > > > > > > > > caused the
> > > > > > > > > confusion.
> > > > > > > > > 
> > > > > > > > >                            Userspace is never exposed with
> > > > > > > > > peek/poke
> > > > > > > > > interface, only the debugger
> > > > > > > > >                            connection which is its own FD.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                                      In this series, we
> > > > > > > > > implement
> > > > > > > > > a
> > > > > > > > > function [3] similar to
> > > > > > > > > amdgpu_ttm_access_memory for
> > > > > > > > > the
> > > > > > > > > TTM vfunc access_memory. What is
> > > > > > > > >                                      missing is non-visible
> > > > > > > > > CPU
> > > > > > > > > memory
> > > > > > > > > access, similar to
> > > > > > > > > amdgpu_ttm_access_memory_sdma.
> > > > > > > > > This will be addressed in a follow-up and
> > > > > > > > >                                      was omitted in this
> > > > > > > > > series
> > > > > > > > > given
> > > > > > > > > its complexity.
> > > > > > > > > 
> > > > > > > > >                                      So, this looks more or
> > > > > > > > > less
> > > > > > > > > identical to AMD's ptrace implementation,
> > > > > > > > >                                      but in GPU address
> > > > > > > > > space.
> > > > > > > > > Again,
> > > > > > > > > I fail to see what the problem is here.
> > > > > > > > >                                      What am I missing?
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                                The main question is why
> > > > > > > > > can't you
> > > > > > > > > use
> > > > > > > > > the existing interfaces directly?
> > > > > > > > > 
> > > > > > > > >                            We're not working on the CPU
> > > > > > > > > address
> > > > > > > > > space
> > > > > > > > > or BOs. We're working
> > > > > > > > >                            strictly on the GPU address space
> > > > > > > > > as
> > > > > > > > > would
> > > > > > > > > be seen by an EU thread if it
> > > > > > > > >                            accessed address X.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                                Additional to the peek/poke
> > > > > > > > > interface
> > > > > > > > > of ptrace Linux has the pidfd_getfd
> > > > > > > > >                                system call, see
> > > > > > > > > here
> > > > > > > > > https://man7.org/linux/man-pages/man2/pidfd_getfd.2.html.
> > > > > > > > > 
> > > > > > > > >                                The pidfd_getfd() allows to
> > > > > > > > > dup()
> > > > > > > > > the
> > > > > > > > > render node file descriptor into your gdb
> > > > > > > > >                                process. That in turn gives
> > > > > > > > > you
> > > > > > > > > all the
> > > > > > > > > access you need from gdb, including
> > > > > > > > >                                mapping BOs and command
> > > > > > > > > submission
> > > > > > > > > on
> > > > > > > > > behalf of the application.
> > > > > > > > > 
> > > > > > > > >                            We're not operating on the CPU
> > > > > > > > > address
> > > > > > > > > space nor are we operating on BOs
> > > > > > > > >                            (there is no concept of BO in the
> > > > > > > > > EU
> > > > > > > > > debug
> > > > > > > > > interface). Each VMA in the VM
> > > > > > > > >                            could come from anywhere, only
> > > > > > > > > the
> > > > > > > > > start
> > > > > > > > > address and size matter. And
> > > > > > > > >                            neither do we need to interfere
> > > > > > > > > with
> > > > > > > > > the
> > > > > > > > > command submission of the
> > > > > > > > >                            process under debug.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                                As far as I can see that
> > > > > > > > > allows
> > > > > > > > > for the
> > > > > > > > > same functionality as the eudebug
> > > > > > > > >                                interface, just without any
> > > > > > > > > driver
> > > > > > > > > specific code messing with ptrace
> > > > > > > > >                                permissions and peek/poke
> > > > > > > > > interfaces.
> > > > > > > > > 
> > > > > > > > >                                So the question is still why
> > > > > > > > > do
> > > > > > > > > you
> > > > > > > > > need the whole eudebug interface in the
> > > > > > > > >                                first place? I might be
> > > > > > > > > missing
> > > > > > > > > something, but that seems to be superfluous
> > > > > > > > >                                from a high level view.
> > > > > > > > > 
> > > > > > > > >                            Recapping from above. It is to
> > > > > > > > > allow
> > > > > > > > > the
> > > > > > > > > debugging of EU threads per DRM
> > > > > > > > >                            client, completely independent of
> > > > > > > > > the
> > > > > > > > > CPU
> > > > > > > > > process. If ptrace_may_acces
> > > > > > > > >                            is the sore point, we could
> > > > > > > > > consider
> > > > > > > > > other
> > > > > > > > > permission checks, too. There
> > > > > > > > >                            is no other connection to ptrace
> > > > > > > > > in
> > > > > > > > > this
> > > > > > > > > architecture as single
> > > > > > > > >                            permission check to know if PID
> > > > > > > > > is
> > > > > > > > > fair
> > > > > > > > > game to access by debugger
> > > > > > > > >                            process.
> > > > > > > > > 
> > > > > > > > >                            Why no parasitic thread or
> > > > > > > > > ptrace:
> > > > > > > > > Going
> > > > > > > > > forward, binding the EU debugging to
> > > > > > > > >                            the DRM client would also pave
> > > > > > > > > way for
> > > > > > > > > being able to extend core kernel generated
> > > > > > > > >                            core dump with each DRM client's
> > > > > > > > > EU
> > > > > > > > > thread/memory dump. We have similar
> > > > > > > > >                            feature called "Offline core
> > > > > > > > > dump"
> > > > > > > > > enabled
> > > > > > > > > in the downstream public
> > > > > > > > >                            trees for i915, where we
> > > > > > > > > currently
> > > > > > > > > attach
> > > > > > > > > the EU thread dump to i915 error state
> > > > > > > > >                            and then later combine i915 error
> > > > > > > > > state
> > > > > > > > > with CPU core dump file with a
> > > > > > > > >                            tool.
> > > > > > > > > 
> > > > > > > > >                            This is relatively little amount
> > > > > > > > > of
> > > > > > > > > extra
> > > > > > > > > code, as this baseline series
> > > > > > > > >                            already introduces GDB the
> > > > > > > > > ability to
> > > > > > > > > perform the necessary actions.
> > > > > > > > >                            It's just the matter of kernel
> > > > > > > > > driver
> > > > > > > > > calling: "stop all threads", then
> > > > > > > > >                            copying the memory map and memory
> > > > > > > > > contents
> > > > > > > > > for GPU threads, just like is
> > > > > > > > >                            done for CPU threads.
> > > > > > > > > 
> > > > > > > > >                            With parasitic thread injection,
> > > > > > > > > not
> > > > > > > > > sure
> > > > > > > > > if there is such way forward,
> > > > > > > > >                            as it would seem to require to
> > > > > > > > > inject
> > > > > > > > > quite
> > > > > > > > > abit more logic to core kernel?
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                                It's true that the AMD KFD
> > > > > > > > > part
> > > > > > > > > has
> > > > > > > > > still similar functionality, but that is
> > > > > > > > >                                because of the broken KFD
> > > > > > > > > design
> > > > > > > > > of
> > > > > > > > > tying driver state to the CPU process
> > > > > > > > >                                (which makes it inaccessible
> > > > > > > > > for
> > > > > > > > > gdb
> > > > > > > > > even with imported render node fd).
> > > > > > > > > 
> > > > > > > > >                                Both Sima and I (and
> > > > > > > > > partially
> > > > > > > > > Dave as
> > > > > > > > > well) have pushed back on the KFD
> > > > > > > > >                                approach. And the long term
> > > > > > > > > plan
> > > > > > > > > is to
> > > > > > > > > get rid of such device driver specific
> > > > > > > > >                                interface which re-implement
> > > > > > > > > existing
> > > > > > > > > functionality just differently.
> > > > > > > > > 
> > > > > > > > >                            Recapping, this series is not
> > > > > > > > > adding
> > > > > > > > > it
> > > > > > > > > back. The debugger connection
> > > > > > > > >                            is a separate FD from the DRM
> > > > > > > > > one,
> > > > > > > > > with
> > > > > > > > > separate IOCTL set. We don't allow
> > > > > > > > >                            the DRM FD any new operations
> > > > > > > > > based on
> > > > > > > > > ptrace is attached or not. We
> > > > > > > > >                            don't ever do that check even.
> > > > > > > > > 
> > > > > > > > >                            We only restrict the opening of
> > > > > > > > > the
> > > > > > > > > debugger connection to given PID with
> > > > > > > > >                            ptrace_may_access check for now.
> > > > > > > > > That
> > > > > > > > > can
> > > > > > > > > be changed to something else,
> > > > > > > > >                            if necessary.
> > > > > > > > > 
> > > > > > > > >                        Yeah I think unnecessarily tying gpu
> > > > > > > > > processes
> > > > > > > > > to cpu processes is a bad
> > > > > > > > >                        thing, least because even today all
> > > > > > > > > the
> > > > > > > > > svm
> > > > > > > > > discussions we have still hit
> > > > > > > > >                        clear use-cases, where a 1:1 match is
> > > > > > > > > not
> > > > > > > > > wanted (like multiple gpu svm
> > > > > > > > >                        sections with offsets). Not even
> > > > > > > > > speaking
> > > > > > > > > of
> > > > > > > > > all the gpu usecases where
> > > > > > > > >                        the gpu vm space is still entirely
> > > > > > > > > independent
> > > > > > > > > of the cpu side.
> > > > > > > > > 
> > > > > > > > >                        So that's why I think this entirely
> > > > > > > > > separate
> > > > > > > > > approach looks like the right
> > > > > > > > >                        one, with ptrace_may_access as the
> > > > > > > > > access
> > > > > > > > > control check to make sure we
> > > > > > > > >                        match ptrace on the cpu side.
> > > > > > > > > 
> > > > > > > > >                        But there's very obviously a bikeshed
> > > > > > > > > to
> > > > > > > > > be had
> > > > > > > > > on what the actual uapi
> > > > > > > > >                        should look like, especially how gdb
> > > > > > > > > opens
> > > > > > > > > up a
> > > > > > > > > gpu debug access fd. But I
> > > > > > > > >                        also think that's not much on drm to
> > > > > > > > > decide,
> > > > > > > > > but whatever gdb wants. And
> > > > > > > > >                        then we aim for some consistency on
> > > > > > > > > that
> > > > > > > > > lookup/access control part
> > > > > > > > >                        (ideally, I might be missing some
> > > > > > > > > reasons
> > > > > > > > > why
> > > > > > > > > this is a bad idea) across
> > > > > > > > >                        drm drivers.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                                So you need to have a really
> > > > > > > > > really
> > > > > > > > > good explanation why the eudebug interface
> > > > > > > > >                                is actually necessary.
> > > > > > > > > 
> > > > > > > > >                            TL;DR The main point is to
> > > > > > > > > decouple
> > > > > > > > > the
> > > > > > > > > debugging of the EU workloads from the
> > > > > > > > >                            debugging of the CPU process.
> > > > > > > > > This
> > > > > > > > > avoids
> > > > > > > > > the interference with the CPU process with
> > > > > > > > >                            parasitic thread injection.
> > > > > > > > > Further
> > > > > > > > > this
> > > > > > > > > also allows generating a core dump
> > > > > > > > >                            without any GDB connected. There
> > > > > > > > > are
> > > > > > > > > also
> > > > > > > > > many other smaller pros/cons
> > > > > > > > >                            which can be discussed but for
> > > > > > > > > the
> > > > > > > > > context
> > > > > > > > > of this patch, this is the
> > > > > > > > >                            main one.
> > > > > > > > > 
> > > > > > > > >                            So unlike parasitic thread
> > > > > > > > > injection,
> > > > > > > > > we
> > > > > > > > > don't unlock any special IOCTL for
> > > > > > > > >                            the process under debug to be
> > > > > > > > > performed by
> > > > > > > > > the parasitic thread, but we
> > > > > > > > >                            allow the minimal set of
> > > > > > > > > operations to
> > > > > > > > > be
> > > > > > > > > performed by GDB as if those were
> > > > > > > > >                            done on the EUs themselves.
> > > > > > > > > 
> > > > > > > > >                            One can think of it like the
> > > > > > > > > minimal
> > > > > > > > > subset
> > > > > > > > > of ptrace but for EU threads,
> > > > > > > > >                            not the CPU threads. And thus,
> > > > > > > > > building on
> > > > > > > > > this it's possible to extend
> > > > > > > > >                            the core kernel generated core
> > > > > > > > > dumps
> > > > > > > > > with
> > > > > > > > > DRM specific extension which
> > > > > > > > >                            would contain the EU
> > > > > > > > > thread/memory
> > > > > > > > > dump.
> > > > > > > > > 
> > > > > > > > >                        It might be good to document (in that
> > > > > > > > > debugging
> > > > > > > > > doc patch probably) why
> > > > > > > > >                        thread injection is not a great
> > > > > > > > > option,
> > > > > > > > > and why
> > > > > > > > > the tradeoffs for
> > > > > > > > >                        debugging are different than for for
> > > > > > > > > checkpoint/restore, where with CRIU
> > > > > > > > >                        we landed on doing most of this in
> > > > > > > > > userspace,
> > > > > > > > > and often requiring
> > > > > > > > >                        injection threads to make it all
> > > > > > > > > work.
> > > > > > > > > 
> > > > > > > > >                        Cheers, Sima
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                            Regards, Joonas
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                                Regards,
> > > > > > > > >                                Christian.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                                      Matt
> > > > > > > > > 
> > > > > > > > > [3]
> > > > > > > > > https://patchwork.freedesktop.org/patch/622520/?series=140200&r
> > > > > > > > > e
> > > > > > > > > v=6
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                                          Regards,
> > > > > > > > >                                          Christian.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                                              Matt
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > >                                                  Regards,
> > > > > > > > >                                                  Christian.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > 
