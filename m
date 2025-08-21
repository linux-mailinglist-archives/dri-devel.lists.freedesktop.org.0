Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF92B2FCF5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 16:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F2E10E9B6;
	Thu, 21 Aug 2025 14:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jvwlOyU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C12710E9B3;
 Thu, 21 Aug 2025 14:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755787162; x=1787323162;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XoNQJo3vre54zEtUA2PfXKJU2R072thT/Iww92PhKmo=;
 b=jvwlOyU+yecmnPGTUSVS0DHMcTNszgtUuvPK0jfWk9sE0xPLSvrVVo+D
 Ba+oJOV5i/MYHtAfHSr7bPbC5Il5ZNo3u4h/bgYHdHNvDrZzsurx/gId5
 MSNBH2tv6czljw8hcNiLEid+4u0T/CwA8yEB7Y4JlnIp2W+kFt/Ekt2wN
 j209Vw2G6j3HzeiluLBaCJuPOr+F6qxmhN8DBClu0F9LiLk3keadKvFrz
 AOjABfMa1r8u/01VciDUouts7/481J4B+RcRmfWAbtr73Y8Efg/3BGiQE
 l5Olp8oTw6vooMAcsRiPoqv1at5ay0bE8h4cTnZxYTuucfgsgONWc+nUO g==;
X-CSE-ConnectionGUID: MrDHBWsUTlannq0EWfENcQ==
X-CSE-MsgGUID: 8/HU79JPSVyoUzkIJHK0rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58224989"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="58224989"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:39:21 -0700
X-CSE-ConnectionGUID: s/deiRWGSyi+doUMwjTrUw==
X-CSE-MsgGUID: 37VRuFmqQ8ecRr95CLyfhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="168336250"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:39:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 07:39:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 07:39:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 07:39:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5QoSOx7Thr4AQc2ri/7Tpfil26pK7MfaaQHZOkKzi70Ui6zjIuCioGHyqpye5xy8n+Nn0ehVkVzZ42D9nHYaaeRKeYnKKdjiMaAA6QSJ/L2q2D/lXBGkw6/VW8doLinxzTSXOFB7+r2+SryaHFpYBkrkqGXCwjiJF7yT44KaMs/ixwXyK0hOzNv/zktLRfox9qH2wb+eHwJkL8aVxHlh0fuZzIuOyNShPGq3A6dzOCo4mXGnSQWJ4sWQR3U6ssPSxLsljxaZds3j+n96lWPlhSrl2q+5BxyZxFNSG34P61eouKhVs2iyGLcZ4HBru5KqDQ0VcWmdbtv9W3F438E2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0T30rNCfEBZC5LintRH2kwtzY6qIGUlDueervLzEV9Q=;
 b=cCHWPKVZ5w3C62WFqS6CeLVx/XH5pTVYbILsx/oUqv+ddEXtxWK4mlOko0RrnQGl+k22dbD+qW9m/wPvawo2Oy8xem1Vgy12RMxiBRyCtcGZt0Ic1h0gYhMXX+PpQK2t2OicFw0gxWuwIGP2LXzB/ge8IqWGIZGPIPjXKaHZwoEi8h+2/WU9EsM31CXNrPYZt7GshE27gkdHsonE6GWw7V6CnRzLalx2lmRqFl/hi136bAShPX2Jazi1q+asow2a9Y1/Njupd2XiVE4BckFSwOuP7ygD/R7MF7OIsbnZmLa5lPC1EUfr/eHmLi9SQv7Q/Uu9ME55z2VujThF5EbBNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA3PR11MB7526.namprd11.prod.outlook.com (2603:10b6:806:31c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 14:39:17 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 14:39:17 +0000
Message-ID: <04bea907-5b41-43e3-800b-3041caa3f2b2@intel.com>
Date: Thu, 21 Aug 2025 10:39:14 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/guc: Add synchronization on interrupt enable flag
To: Andi Shyti <andi.shyti@kernel.org>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20250819160010.3386940-1-zhanjun.dong@intel.com>
 <lbmfdys7nox2zaookqtr5abqtd6octniabd63whf6orvhgvgi5@gm6pbo26nzfz>
 <da31eaac-6f84-4e4f-8f18-f2268824f3f8@intel.com>
 <qgxgnqpprpa4n6b7d4ht5jzh56lv5rn7qfo2d5gbp273gfn4hp@grgm7jx2xnd2>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <qgxgnqpprpa4n6b7d4ht5jzh56lv5rn7qfo2d5gbp273gfn4hp@grgm7jx2xnd2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0206.namprd03.prod.outlook.com
 (2603:10b6:303:b8::31) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA3PR11MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 060a48db-271a-43b2-eb4b-08dde0c08182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVNVRjFWUDUrZGtjMmNGaG1ub0M1YW1ST2g1MWVtZ21Sa1llR3kxNDdyWmFa?=
 =?utf-8?B?VFZJSU9YRnJNa2xDMWtHZDdOVzNGQ1dxaU5GK0IraUFwQlB0cEdtZVJwK3JP?=
 =?utf-8?B?OG5KeTFhZXZ4MW15RTZnRTBvTHBBV0hVRHpJcE8ycWt3UlBTSGFnZG15SkxH?=
 =?utf-8?B?QjhseUhNdEx6bjl4czIwSis2REJCY1l1TUZ2RHZZMVNBVUJablZ5dnEyRnFn?=
 =?utf-8?B?VnI4Qnp3Q3M3bUd6TGw0YnhVS29MaXhrclNGUjFTOGt5d2RUNE5vaUd3UEQ2?=
 =?utf-8?B?bWs0azFLVEFkUmE1Q09mQXdvYzBQelJQb2JwckFjYjN5RVVzc0FZd09hLzAr?=
 =?utf-8?B?MmJ5MjF2cWRqMDhLOE9Gd0pESm9pV3kzRWs1T3E2TkdvbWxZQnBjT0g0VWlE?=
 =?utf-8?B?cHIyd0g0Q3l0Q09IQWlWQWJnd09jRVFtVDFaTmRjV3dzeXVQMTFHZEY5Yml2?=
 =?utf-8?B?amgrNTBKbUdaRUNnd1dMYnl2VGhwMFA0ejROZTNZTCtVT2NDOUhWYVoveFZS?=
 =?utf-8?B?SGFZWGFMMFZrM25SWTJOZjUvb3FCSG9KUUt6NlkraTBhbnVsUGQwb1ovL0VD?=
 =?utf-8?B?aXVTdnFKQVBGU2JTb2xlZndiRnhuZmZIQ044S0srNDY1bk9EWmQ0MDNUTXBU?=
 =?utf-8?B?aXFHanFmWWh4UTRwNDlXNlpqazZKUHJqZWdkSFBKMCtmZnlpUGxoK04vdElm?=
 =?utf-8?B?cG50MGVoM3dzbUpmTGhTOHJLV0VEL1FjemJEMjNRcXlPL05RVlJrQ2g3c1Zq?=
 =?utf-8?B?SHNpSUFqdmF2U1IxL3VTQ0NtWXlWMytPWUUzOW84dk9UK3hpNFFFYVY0em5v?=
 =?utf-8?B?T1d1UEpSSVk5b1B6ZGxxOWF6ZDlOTk5DNTdRV2wyV01yWWo5L1VPVTZCQmNQ?=
 =?utf-8?B?cjdHQWxodW5VQlhNazJPakY2T3BtditncGI1Q08zOXFrRU5hTmU0dzZMK3hh?=
 =?utf-8?B?ckUvb01rZVZuWFNBeEw2NzMvUThLTlZGV2ZoRnhtTEJZYXBEcURVY2Q0NEE4?=
 =?utf-8?B?M2QzWWJsMHExVXVnb3Q4eXczZmM3MEJtSy8yRjR3V2JJWEh4SFVBaTNyMWUy?=
 =?utf-8?B?YktzaHJXWHZicDFGMjBtY29rdGVBLzU0UEk5dkJZRURKUDJqa0srWWhrVG8r?=
 =?utf-8?B?OEtkMjdVbGZVV3Z3WldNaEdsbEVIZ2JwanM5WDY2NjFOUkJ4eWNmeXRBT3VU?=
 =?utf-8?B?VE5PM0o2cEhUaE0yd0ZuRzFIUFFaTlMyZ3NCZmhEVkZWVERwbTVMM3RvaFp3?=
 =?utf-8?B?YXBhczV6Wk5tVDVvQ3RMTDN6blFFV2p5dTBqUGtDMmdtdjN0V1pzazBUSXRJ?=
 =?utf-8?B?ODkyMytLOGIwS09oWlFjbk5KOURxMXc2aVJ3cGlPLzVDZUxkWjBsVytrSUdT?=
 =?utf-8?B?M3E0QlVTKzlDWCs0M2JqRnVyUWFWQzZ1c0Q0TnFoYk41OU9aa1crVTVWU1hP?=
 =?utf-8?B?c1YyUVMrcDlKcTFWOVBMcExKbUgxOS95cmNEUXdMbVdaeVhuMHVUbURmVy9Q?=
 =?utf-8?B?eGRnaTVqT1Vmc2FaaG5QZ2VGWFJGaGFlbHBIRjFsRWxqOVRtV3VFOTdCTW9L?=
 =?utf-8?B?c3lVcG9vYlRpRGdSS1JHK0wxdzk0MDRyMDdLMlJST2JXRWRUTkQ5QW9qajZW?=
 =?utf-8?B?bklKZUkyZFZlSVptemFYeUJyZUptRHQ0aG50Y0pRdEJqVUkrNnBzZW40OWZP?=
 =?utf-8?B?elF2NmJvb2NTdisxL1BvWjc3T216U0gyem5ROXNkOU1CTGZTbWpDekZYSXN0?=
 =?utf-8?B?UlZuRmQ3U0FyYWozQ3BXcHh0ZGZuL3dENnJBKzViQU1mNHlWek9uWmFWYTZo?=
 =?utf-8?Q?3uMVYfyrLMfkKb/DGDG9xPsMRAJFkGtELsqyQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTl3ek5LRUNoekk4K2ZQT2dzTTlJZDAwSFZtSUNIVnRqZGlIMkJBaU5RWUJt?=
 =?utf-8?B?ZVc0M3QwNW9pVUJ4Y1A3aDdEUWhLV05DVkpiUUQ1blZKanNBbG9IREUxU0Vm?=
 =?utf-8?B?UGpOakw4Zyt1bTlVUElPR0VwZWVwMFpiQlJMWjlaak54dDZaWDVzUUhjdUZu?=
 =?utf-8?B?bnBnTHN3ZDgrSkpmV2xPU2pZMHdiZVVZaDJEeUdOZWdGaWZSNU9tYzZBTjdB?=
 =?utf-8?B?ZHRUQnRnaEJDaFdFaEpxanNkcUNHaHNrZTFJZXVZMWJLaXNoT2RHQjdBYXFj?=
 =?utf-8?B?S2NWeFNlbURmRmt1YjlVeUtxRGdleFFSc2lrSzNReXNtM0N6dVZXaVpZWWdO?=
 =?utf-8?B?Vzl1WG9WSEllUTh4VmJWdEVmeTZTQUtuSUJjL08xVXZaTmZrVHNnRzhBMnVW?=
 =?utf-8?B?Rk8wSGYyUDB2SVNHekRpQmtycWNrSDBjSnRpUTIwQmRTZ3d4SEFDME1QZ05H?=
 =?utf-8?B?U2JxU0RuK2xobGtXcERRVVEyWkJkK3Z3Z3pQOXRHdDZmdmtudjFud080QXA1?=
 =?utf-8?B?MnBlclF3RGRyT3FrTis5Zkp4NWhzOVpzbTM2OW9Ka3R2alBFZ3hVbUhidVpm?=
 =?utf-8?B?Y0dRNjNwNERxYkc1TVJrL1BZaWxNZXpGWFNrODBhSUJLVzdIZW9kMlM5NXJ6?=
 =?utf-8?B?YVBtSzNCWjlEUU1kRjNnTS9BSHkyNHEzYVJMQVFWYWVBdUdHaHJvcXhHYTBK?=
 =?utf-8?B?NDdLRkhqS3NCcFRGdTZNbW0rYzBEN041WXJSa1RNRWZzMVMyNlc4STEvYXpu?=
 =?utf-8?B?Mk14My8yWDlFQlBFMkJ5UlUzaHZXSEdQckk4WWN4UklHOFBHWk05S29BWkdu?=
 =?utf-8?B?b2VCNDBvUFVaYitlKzl0dWNueUZsd2thR2VjTCttaGNjZXpWL3djSXp3bFJI?=
 =?utf-8?B?YS9ORzZLdlFVTlMvUWRIaThPaEFxV1Z2V3htdVkyTW9ZNGdVMmhKdkU1S2dS?=
 =?utf-8?B?ZG9VdEoyM3pEZVpoVHpBRjgrQTg0WHVKbnJUcmdmckFLRTRvaFZDaVVrZUxk?=
 =?utf-8?B?NDNtMnZzUldmZ25Oelp6YU9wbEg2WGx0RVpHd2g2ZTVnR2ZGdjVBRnhKVjdx?=
 =?utf-8?B?aXEwc1NmUDRmeGdtQm5FcHB5dk1jNldFTXRqOEdtbkFrTk4rOEZ3UjAvRnRX?=
 =?utf-8?B?ZzUrVU1NKzRMVWt6aEU3MXRGTFhSQ0gra2pJQTV4RHloN3ZOdTg0djZVNTR2?=
 =?utf-8?B?eHo2alFhdWFIbEFacU9MRDEvYnZGUzFwZzJ3Z0VsNlVCOWQ4aDVjVGQrb3Zv?=
 =?utf-8?B?RkNhOXkrdU1sbGtHUlhyMWxvWGxDZDBUbjJjNVpZaUE2NUR3TElOdmRVUS9L?=
 =?utf-8?B?aERDdVZscjdpNVhKcUhEQVkxODVaUmlzcUlVbCt1U0UydG5NSzBaa2Z6WVZS?=
 =?utf-8?B?UTZRN09WQS93V0pqbE93TFJ5bERzK2dMT1dBV2JvNTdFY2lCYXRiZlFvaHAz?=
 =?utf-8?B?RVJYazZqOUdreGRyUjYyQkVZMDVxb04rcFBlcWIyOU5GZmNoNW4rdGdoUDdl?=
 =?utf-8?B?RlBMNUY3VUZiN2xXN2Y3Zld2eTJmVjRGYmxPc0NySVE1K0VabHNNZmorR3dq?=
 =?utf-8?B?d1AyRmRXQk5xdC8zaTFvRzdnZnliV1c5dU9CZHBsR25xVDlocDRPUjZwOGJU?=
 =?utf-8?B?VXlwUzIzSXhmRmZ3WUVrai9XakNBRXFvNlFKcWFkd3JtVjg5cUx3MVJYRDZr?=
 =?utf-8?B?U0U4a25ta0JjSGIzdXJBUnM4VmM4cjlBYlRNZjZrMHhhT1pTdWJsWnYrMDFD?=
 =?utf-8?B?NE9GNVFrVHVxSW9nblNCUWRoODRLRjhmSXp3VVRSdS9TOStPNlg3WnZGQ1A2?=
 =?utf-8?B?YlhDVGZkYWdZMkpxOUV2VmJyYTBrSEI1WnBPS3JtK1ovTldLaFBWZXdCSGFM?=
 =?utf-8?B?OGYxalRoUVNERWNuT01kNXdnYjBEckhHVDlOUk83Y1Fxc3ErVG9Kc0x6dGJv?=
 =?utf-8?B?RnRGcDV4Um9NckRGVjlINTIwUTNXVjFaZXFWekk5R1h5WE1DMC9heStiUWR0?=
 =?utf-8?B?cEFpU2E2VjdtaDExaUNLSE5xY2FsVzFic3R5T0l4ZkJQZ2g5emJsTkpWWXdQ?=
 =?utf-8?B?NmVXK0l5a3dDNHRXeFNWRUs1S2lreFdzNEVacGpHT2tmYytTZjRIMkxnMGVk?=
 =?utf-8?B?MndmQ3VwNDlqaGRRR1U3QUhwTHJveHVXY2NmRUNaT3J0M1FLM256ZTRsSDRC?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 060a48db-271a-43b2-eb4b-08dde0c08182
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 14:39:16.9784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3bI6WUbDirGG0LlTCcUVUxTf4UaaRxkXiq+PK7SQgBtGNopZNul/KZAk85l+MeGeycK2CkbciIIXymFbLjyJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7526
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



On 2025-08-20 6:05 p.m., Andi Shyti wrote:
> Hi Zhanjun,
> 
> ...
> 
>>> On Tue, Aug 19, 2025 at 12:00:10PM -0400, Zhanjun Dong wrote:
>>>> Boolean flag access from interrupt context might have synchronous issue on
>>>
>>> /synchronous/synchronization/
>>> /issue/issues/
>>>
>>>> multiple processor platform, flage modified by one core might be read as an
>>>
>>> /flage/flags/
>>>
>>>> old value by another core. This issue on interrupt enable flag might causes
>>>> interrupt missing or leakage.
>>>
>>> /missing/misses/
>>>
>>>> Fixed by change the data type as automic to add memory synchronization.
>>>
>>> This can be re-written: "Change the interrupts.enable type to
>>> atomic to ensure memory synchronization."
>> Will follow all above comments
> 
> No need to resend for this if the patch is fine.
> 
>>>> Fixes: a187f13d51fa0 ("drm/i915/guc: handle interrupts from media GuC")
>>>
>>> What issue are you exactly trying to fix? And have you tested
>> Will add:
>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14834
>>
>>> that this patch is this really fixing it? Where is the flag's
>> CI report this issue about every 1 or 2 months and close it because no
>> reproduce.
>> I can reproduce it in about 1000 rounds(about 9 hours) of IGT test but not
>> at 100% rate, so it is hard to say really fixed because of hard to
>> reproduce.
>> My latest test runs 2200 rounds in total has no reproduce.
>>
>>> misalignment happening?
>>>
>>> Please remember that when in interrupt context you are already
>>> running in atomic, so that probably you don't need to have an
>>> additional atomic access to variables.
>> Interrupt context only read it. When the flag was changed and interrupt was
>> triggered in very short time, the flag read at interrupt context might read
>> out old value, if other core(non interrupt context) set the flag and ISR
>> read out 0, ISR will do simple return and misses interrupt handling, making
>> it appear as lost interrupt; if other core clear the flag and ISR read out
>> 1, ISR will continue to run and not stop as expected, making it appear as an
>> interrupt leak. >
> 
> Heh... it looks to me very unlikely to happen, but if you say
> that this fixes it, then I'm OK with the patch.
> 
> I see still one case missing: the error comes here:
> 
>    ct_try_receive_message+0x336/0xa10
> 
> that is the tasklet that starts after the IRQ. Has the flag
> changed from the irq to the tasklet? :-)
> 
> Would it make sense to add something like:
> 
> @@ -1338,6 +1338,9 @@ static void ct_receive_tasklet_func(struct tasklet_struct *t)
>   {
>          struct intel_guc_ct *ct = from_tasklet(ct, t, receive_tasklet);
> 
> +       if (!atomic_read(&guc->interrupts.enabled))
> +               return;
> +
>          ct_try_receive_message(ct);
>   }
Yes, I did test with this check, result looks the same as not add.
While, consider if the system is under heavy load, tasklet might get 
effected as well, so I will add it in next rev.
> 
> BTW, have you tried adding a simple memory barrier (even though
> in the i915 community people dislike memory barriers, but with a
> proper explanation it might save us all this churn).
Yes, will add it.

New rev to be posted after another 9 hours test.

Regards,
Zhanjun Dong.
> 
> Thanks,
> Andi

