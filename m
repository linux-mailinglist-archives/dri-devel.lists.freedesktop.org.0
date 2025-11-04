Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 084E0C3267F
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 18:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC96B10E2A1;
	Tue,  4 Nov 2025 17:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COfBEkfe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58A110E29C;
 Tue,  4 Nov 2025 17:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762278122; x=1793814122;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MSvF1EFvz27BQXln675LMSXQlWLzWyeZybrHjR+kikI=;
 b=COfBEkfeKpfLE/TVzDinWSrgP5GlPVTEbmG2ztoZXgz4IKJQg3KqhFiV
 mRqpeXF9zTJW3OqlVAlYwaG9EXERzMZfTbfT4r2ROZ6MAhsYvFSuWu6YE
 55m8NQhdJUNFDxwvcQzC6KM281cRTW9TxCVd8oERAW9AzyfwX5dLPv9pu
 rTDCASTt0FQDXc7ZwPYVGI9wOFp5EwdfnjcLn2VtKBY9v1l0gCixwA6SW
 zyQO3TR46VFES8/2vT0I3T+/2VCmtUkFi3ShhiFCP6Uxhhgl+BgVHGszJ
 iWPDsTTzR5QD3sq3kYcvbD9jaWDhxX+lalYcIbfC0v3WUnMToDbK9eSWo w==;
X-CSE-ConnectionGUID: Wi8x/PATRJK146d5/i7UYQ==
X-CSE-MsgGUID: dN7M0lAwQMixChnfvzTCSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68218881"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="68218881"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 09:42:01 -0800
X-CSE-ConnectionGUID: vp+3yagiSz+v5RAZ/PHKtw==
X-CSE-MsgGUID: updpShTWS9eBxnJVuuhEpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="210716253"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 09:42:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 09:42:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 09:42:00 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 09:42:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ll+uOnIgj3nsxkFZAeofVIsBsEGXfBKi2Ixg7H3Ht372aMR00gcgkYvK5ZIi4a2TZ9aR+4SZ6Km24b3yLu3xo9ZrbfEyy3sUFHhiHWVFAJd95lEUsZ2ICMRiFETGYOAd0cfgvcNxAVLK980I73kn0Yzyv0+YlVIOVerbSCg5bJEHVke3pdhMWiCUnL8roJ0GitcgJVEFpFQHD2rblWiK9/kXjvTBrpBWPE95ebMXDQ0JdOUMeKanSGTG+2CvKOQlsWOsQaIPwhDDksexp9ROyutWjdYcQy0Y2PF/WHYN8nm1M3T38TNIsvId3ax3EZQ61jQVUQ5o3r1ihxprvDokZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1i93F0lApODizGlfDpHgb6f+cKSKuKPTPizII4nwrxs=;
 b=aKREvfYRBrj11uxzgJxlX+Wf3GiTAHv0lFbDBucHJoy4Vmunf5PwFYEh+NPirB+tUlf3da3WcWJTBI/VphP/wzvFnc/DZfZNOcpd4tgqZl5j5gDOuUZhD4G1PT4eQ0okG5casST8Mai4ymHLgGW9j7HxuhiBNnypy/N5bEodMIuBAswcg9zawxiCcpavsVrco/IXjanSezH7UvpSG0MXIFAFpmB4nmiQzUYD5vDnXmcF6uW7GAslD86yEKZR2izfpNGxLMEpShl4YFjsBMv3RfELBY4fAQy6bNG9yBz97zMPKpfxHsQRFTKb+0WejkH9r/XmfVikReZqyYKKUrDbHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB8246.namprd11.prod.outlook.com (2603:10b6:208:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 17:41:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 17:41:57 +0000
Date: Tue, 4 Nov 2025 11:41:53 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: Alex Williamson <alex@shazbot.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 27/28] drm/intel/pciids: Add match with VFIO override
Message-ID: <3y2rsj2r27htdisspmulaoufy74w3rs7eramz4fezwcs6j5xuh@jzjrjasasryz>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-28-michal.winiarski@intel.com>
 <cj3ohepcobrqmam5upr5nc6jbvb6wuhkv4akw2lm5g3rms7foo@4snkr5sui32w>
 <xewec63623hktutmcnmrvuuq4wsmd5nvih5ptm7ovdlcjcgii2@lruzhh5raltm>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xewec63623hktutmcnmrvuuq4wsmd5nvih5ptm7ovdlcjcgii2@lruzhh5raltm>
X-ClientProxiedBy: SJ0PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: 937116e0-2484-477b-a3ab-08de1bc9738f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yk5HQisvMVYwQUNQWXFCZzVvSmVzTEdlMEpwbTFBUXovSGhad3JQVURydXhL?=
 =?utf-8?B?NGtnbkpUelQxTmR3SEFYZjQ1cVZKM3BWbUZObmphNDVBRjByU2dkRkxWbVlB?=
 =?utf-8?B?azhTcHlIZHN3SkJDdHA0OHU3d2hxTFZwbmRzLzFuZ2lFZTFCbVJMR1daUlN2?=
 =?utf-8?B?T3RJdlU2dEZPdjZDZnJvazhhTVI1TDZsWnkwSXp2VXNUT29YYnFHV3AxaDVF?=
 =?utf-8?B?REQ4OHBoblNiUklqWGNtbExkTFpmN2xabXV5dlBJSzFmaFhtYzcranhGblFz?=
 =?utf-8?B?OVFjS0x3Tmw2QVlkRkR6K2VmQ2hEV1lUaEJHbkVwVVZXQmpSalBCd0Y4bXh5?=
 =?utf-8?B?TGtHSWpUdkZlZVUwL1ZvaHdKSUJoSVRhUjB4djluVjRvWjl6MmxNVzVnQVM0?=
 =?utf-8?B?ZDBYcDcrVjFQS2JGRGxLQ1ZQTlFjQTJxcG9tTVpoMFl2UnlCRmRNWS9nNkpR?=
 =?utf-8?B?NzcvOEV4T1k1d1FSU3UxdHgyWDJoY2p0Mk9scXNZZjhYUmVmdkwyOEZ3d1R1?=
 =?utf-8?B?Sk91cWRSVWJvbzZScGIybnFudktMTE1rOUtYcStkWk1lZEQvZGR6RkVIc3dB?=
 =?utf-8?B?N3ZMOS9tYUd0ajE0Q3FFSXJVcmk1YzM1RStmTU45QmdzNjJoZlBpWXpIK2tt?=
 =?utf-8?B?anRUKzI5NHoyZXVrWUxheUcwUUY3eUFOeGxUMUdIWS9xbGNJMm1Kbm1FcUZl?=
 =?utf-8?B?V2JmcnJwcGxPeW9IWldQNlBBcCtQNTFnV1hHTFI0Z0E1NUFKOEdKaEo0cFNT?=
 =?utf-8?B?ZGZGM0Nsbmo0U1Y0Q1Iwd0dKb05HaDBxdmpsS2JVM25BMXRQeVZhU0N6K0tq?=
 =?utf-8?B?YUhVZ0NyQUFhSGJPZ0hVNlRSSHFKOTl6MmM0ekt0TXByQ1hpbmVIbWR5RmVJ?=
 =?utf-8?B?S1QzWFRsRSs2L0RCSUpNd1pON2duN2tGckgwWTF3UmYwRExzU1YyeVpHRG8z?=
 =?utf-8?B?WUQrTUphQ0hFYjNXdVlZNUUrek5PdllLUzBWQVJLM2NsaC9CcVdoeDBtQVZF?=
 =?utf-8?B?Mzdja3Zla2doTU9EYm53T1BKOFJnSTZpeXFWTHVHbVhudm1MbG93KzY0V1V0?=
 =?utf-8?B?d0dHYnFOTFBOTjFpaDkzSURkUHpFZnZFUUd0YkkvRUdzRDNuRWovS1ErT2FM?=
 =?utf-8?B?UThVckJCKzRlS2wvSG1hTmlZUWVmd09GdVVZS3ExdzZ0dHJtaFd0amVFMndF?=
 =?utf-8?B?aDlWcGpzazJ2L2F3NFdUcjNxaWZ4OXhpekFqL0ZQakJrRzhrMGIxN1YxY1Zs?=
 =?utf-8?B?U1ltdmpxV3lwSW5IMDVLemJmN3Rad01SWmV0YW1RdVQ3MWpsK2E1cUxFc2Nh?=
 =?utf-8?B?MTlFZndXQytHV0NzMXgvV0kwTEhKNDhteUtHc2xnQTJadnR2ZlJDbmhuM1BC?=
 =?utf-8?B?azZKcGJ3cEZuZnA4Q29QOFpCV3ovMXlkK0RPSnBhTW4yc25FOEJvdmVRcmZP?=
 =?utf-8?B?cUIvbzFQdzJaQzdpUXk0bWRBYS9PbDBkb2ZiTjZPRjNNajZ4ZElyK1JnRk8y?=
 =?utf-8?B?WEU0cTBpMzRZVjdXNWNEbnJVMURSRE5XQlh6aWJBZUZSeFF2VXJZKzJmczQw?=
 =?utf-8?B?TVR0cnlOWk5xb2NabWJGYW1nblg3U251Z2lxN3gwU05MNG8wYjJXc1pFSjdw?=
 =?utf-8?B?ZXBCWS8yeVFxUWV1cFFxam9tN2pQZGJSSkt6bTF5QXZqNnJoUkxGa0VnSG45?=
 =?utf-8?B?UjZ1Q09paGpBamxwQnNKcVUyNTJxays4OEVQdk16UlFTSjNMNGxwLzZjNzd2?=
 =?utf-8?B?MVBzRTlPdFhWYktuRGlGeHoyRFQ3b0dTT0kwWFpoKzl5Vk9GZis3c29uRjRs?=
 =?utf-8?B?VDc4UEFzeFJXbytpUXNwcnR5aTVDYzBROU90TnlITU9CR0dLbEZxWjNhdWpG?=
 =?utf-8?B?SGVhQmx5bVZQMGJWZHpyUTZnaXdKdVV3MlMwQXVpenltSEhpK3VKdUZydURH?=
 =?utf-8?Q?touH0bVsR8aqh/4ZYMnlMJT+nA9ZP6zI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWJiMnBGa25EQi9WVDlGTnNjUTF3bUszWktEQ0ZoeVZtdlRaWGVGMjRzTG1h?=
 =?utf-8?B?SXoyM0p1WGpwZUYwc1JrMDBnUUF4TUNmbVRjd1JZbFRSNUtDbEtxbnJ2QlJx?=
 =?utf-8?B?TWdOK1l1bVVDR0JTUXpvdzNldmpPYUVVNFBjUldwa3dQVFRiSG0vTFNkdVY5?=
 =?utf-8?B?MmpSK1JIZ2FXbU5xZGpPNVlRSDJjNnEyUHM0aWpEN2o5RVkwL1RHaGxwbklH?=
 =?utf-8?B?Sy8yaERhdWZ2YVJDeWxBU2k0TkpydHBLc0Z5TFNSYVdSWlZzTk94MjBLMkMr?=
 =?utf-8?B?NlFNME44TmdNaUdCRzFVSU5hVWdCdDU1Y21IQUtHOUlkS2J2cXFSWlpXQU9o?=
 =?utf-8?B?ajBJSzU4VlRMQlpQMWx4N1RCRitjV25NMDhEbkRZb2J3TkNneFloQnpqQU5W?=
 =?utf-8?B?OFk5NGZPS21GUnRQRGthTVRwMXBMUlQwMFhJZUFUZEJBWlFWVFhhZExKbWs1?=
 =?utf-8?B?S3BsTEtiNS9xb1FiQlNNQ1B2L3BUdDhZNGFob0VUbC90RzBSdDdrUlZtcXM4?=
 =?utf-8?B?d05xcUZOUVRrRUFWcm5YdU5UK2daRVZSTkd2UTg5b1doTTJoS0xIMlMvdVRu?=
 =?utf-8?B?blBzRElSVFBEV3QvWlRmdnNrNGNHdmU4a0dadDNES0tzZDFxUWFydlN0c25q?=
 =?utf-8?B?bmdaWFh5SFk1Z2NpTGxUZTVjYmx2QTc0UVpqb0FSTDNjOGtvdkNySlhnd2Fh?=
 =?utf-8?B?R0x3RXpwMGFSaFNuY1FpV2ZwWlJuQnp0WCtJTDhCZHJ4ZEN2b1JXOVhJWHV5?=
 =?utf-8?B?endVaXNCbzM0TUVvR3RMaFlhUENaNVFUUG9iV3FtSDkyV0JsOHl4REFDcmtV?=
 =?utf-8?B?TElTTHNOemxncE9Bb1k4K3o3S3JPWVpPNnFFMHFKWW9sOHR3enRxSm5kR2dj?=
 =?utf-8?B?RGZNMHpQSnFMMzFLSmZJNzRRY3JJN0xTZUhkT0lSb1daeWxEREJCYkNBV0My?=
 =?utf-8?B?VjBjZEFiWXFEL0tXeUovSTZJeWpiL2dMcXduTUdiWEZRRDRQaFdYc2FrZWdv?=
 =?utf-8?B?L0pONEt1NFhsZ21iVTZQSmZyU3JocmZST1hVL3dCRlJrT0Q5ZFh6dlA0WXRX?=
 =?utf-8?B?akdOUTQxbnZYdHBkTmVHeVcrN1ZYUERUak44UmYyM2pUVUZrb05ZWm14U1Ro?=
 =?utf-8?B?TE4wUExHejIzTnFoYXVsaFpTcTk3aWJWeWpZdzNtT0tIbXNhd0R2QzRkWVQw?=
 =?utf-8?B?VXdhcmZOQkhSUnZ0Q25XRUcvR1VrNTJoTXJEMUZ4UkQ4RExPYUMxd1RiS3pW?=
 =?utf-8?B?UGxVOFVXSUF5SEdZSTJaRFAyd25JcDFid3ZKSitCWmNja1hzUnl1NHhQM0R0?=
 =?utf-8?B?S1NkY3daaGMrdEluN3FFRDVrd0RhVndCUkRmM1dzMy9SUHV3Mkk0ZzR6QXJy?=
 =?utf-8?B?MDgxUURDaUoxSDlRMy9JMUJWNXF4ckRNdWZ3RnVNYitaMWJhQXIyZVFZaVpP?=
 =?utf-8?B?emhNYlJWWnVxYjlLWXFyckhKcmpkeVhyTDh0Q2lKZWZ3RU9hRGxZVGVtLzhu?=
 =?utf-8?B?VHFVQ0Jqd1QzVkR5OC9XNGczazhkdXV4ejJGMWkvS1UwOG1ZTk5xV09Bd04r?=
 =?utf-8?B?MHZBSFJENjNNaTU1NzJyeVVjMFBwZURUeHBYcDZJQStOTTRoWTk1SnU2VHI3?=
 =?utf-8?B?MytJMllET1AwZ25SaE5YRTU0RzdJWkF1OXRpbEZzMXFsN0NnaXZMam9tdC95?=
 =?utf-8?B?SXZUbGxDbG5XZHIxYmtIY0NJVzVkYTl2Wkp4dXVveHFBQ0lqZEdKa2pSSTVM?=
 =?utf-8?B?MlIwa2FwWU55Z2xrWk1iVlRuQStPYXByaG83NGlaSS9ENVU2Z2JMUEVLMDZQ?=
 =?utf-8?B?UWFjbEl0aXdkQjQvN3NnMHhmOUtPdDlDWUtPanpHUzBKSWhXdm5obHFmYlJ4?=
 =?utf-8?B?NWpTL1hCMjk5NG1xS3NvOHg5a2hhWFlPTE1uSHpYL1k2a1BTNHI3QmZtTWVk?=
 =?utf-8?B?czFTWUVENkVmRWd4VmpCRXg1RFBnRy9obzFEVzZXV29TOWJ2b3V1SFJ3cGNS?=
 =?utf-8?B?OE05OE5laDhZcWMySDZ1OGo5cVpYeE5zekpoaWhFZGQvTHBBd0Y4TmhlUUk1?=
 =?utf-8?B?NTgzbEUvUVJPSGxrdVpQR3lqN2prVnd6RmdiZUM1QlpSZld2VDBJb1hkbXMr?=
 =?utf-8?B?bGovZm5EOFRWRlRwMXFrMGpsN0JaOHhML2VwTVR2MmpzNUozUUEzZHRVMjV0?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 937116e0-2484-477b-a3ab-08de1bc9738f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 17:41:57.6342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJO3zw6C4ir+lsZ5Z8nvdgIjRa22ZY9oqOEpeipk5yCHY/hR/qP+u98EpBXdF34JSTKQTM6ePopp9jAGjarzFiz+ePnUjSzwzS7MhVFymvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8246
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

On Tue, Nov 04, 2025 at 01:59:45PM +0100, Michał Winiarski wrote:
>On Mon, Nov 03, 2025 at 03:30:49PM -0600, Lucas De Marchi wrote:
>> On Thu, Oct 30, 2025 at 09:31:34PM +0100, Michał Winiarski wrote:
>> > In order to allow VFIO users to choose the right driver override, VFIO
>> > driver variant used for VF migration needs to use Intel Graphics PCI
>> > IDs.
>> > Add INTEL_VGA_VFIO_DEVICE match that sets VFIO override_only.
>> >
>> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>> > ---
>> > include/drm/intel/pciids.h | 7 +++++++
>> > 1 file changed, 7 insertions(+)
>> >
>> > diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
>> > index b258e79b437ac..d14ce43139a28 100644
>> > --- a/include/drm/intel/pciids.h
>> > +++ b/include/drm/intel/pciids.h
>> > @@ -43,6 +43,13 @@
>> > 	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
>> > 	.driver_data = (kernel_ulong_t)(_info), \
>> > }
>> > +
>> > +#define INTEL_VGA_VFIO_DEVICE(_id, _info) { \
>> > +	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
>> > +	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
>> > +	.driver_data = (kernel_ulong_t)(_info), \
>> > +	.override_only = PCI_ID_F_VFIO_DRIVER_OVERRIDE, \
>>
>> why do we need this and can't use PCI_DRIVER_OVERRIDE_DEVICE_VFIO()
>> directly? Note that there are GPUs that wouldn't match the display class
>> above.
>>
>> 	edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
>> 	5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")
>>
>> Lucas De Marchi
>>
>
>I'll define it on xe-vfio-pci side and use

but no matter where it's defined, why do you need it to match on the
class? The vid/devid should be sufficient.

Lucas De Marchi
