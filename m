Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BAEA85AF3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 13:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0826A10EB6C;
	Fri, 11 Apr 2025 11:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="o0FnLgeg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2069.outbound.protection.outlook.com [40.107.95.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E845F10EB71;
 Fri, 11 Apr 2025 11:05:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYKmBIK46FvSt6aN2W49FTBYq0POUnOJzphCE24IYsLiRi/NMT1lLybegLzx0ZHc6hGvCyjk2MEsdFml8b6HN0M2rcTv+mKw379GgwkpbyrDNXm/YgPMb272TT3cn5+BrGh4N3gk+c1fAbW4OPytz4dhH4yaXlNiyCu3OODsrEi8qhMfzsitBR6B8qlMQ6emXLku/iGyWPp5DIWHhgryU2xcqsFlBpn2F+JE/LPIHOvY3dIoY00CumXzt+b36LZHgFNq1OMNuvj8BnZRUKyfr9eMPW5ujBMa1hMqFJZbcuH6l9N2LOZ+OE8QT1XdPO3h6tVIF4aYOQezAmN86m7O2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+vnu5bo0+oLO7h16NXiaHyQ//TD+6nJXA0SQNHOFCE=;
 b=eI99zlA99Lel8dj0uAEMEHChVsp/mCO75GiOVJBM1/vWztcfzniyeqVPF7nx8PlZeg57a8HI8KE2JsOKFLs6kDuLHq6RqxRlKtzCboMfYz+7ysKx1C/nw/Wk6X0Iofj3M0QV+VU5oOMhbco8D7demaVyibktHqPbCdGOyB+45cP4dnGOfit6IPjL3eeiwgPh/mdnAYzrBTLRKv7okFZvDh7S4EQbG8Tr5kJqKCdFapf5rHGKZqxi+rI1HT9jPhzUGTT7g9O4gKiVTJCR09NXe366U8MQWwaCLCocTTAM1bHvKgwkP2nZ0oX/Y0Kg+Cn7zsgMAkc8YxG9JvrETjQRYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+vnu5bo0+oLO7h16NXiaHyQ//TD+6nJXA0SQNHOFCE=;
 b=o0FnLgegG6+x6YP/9/h++MWBi/uZl9rL+vcv8BSpR4NYzq9XKr5LiT1ByubyImoN9i0/ZVNWbSrj/v3WPgr+poPRzH8BeKnC2qbruN1GC2aYfOwu0CyOQEQFk+QdVMozhOfbFxueVKa7fFtBPMQLGL1cUlL/2Bxhgm7jAXP0Wkg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4316.namprd12.prod.outlook.com (2603:10b6:5:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 11:05:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 11:05:07 +0000
Content-Type: multipart/alternative;
 boundary="------------M0ol96SFa6ecnoacdIKMfCh4"
Message-ID: <81a70ba6-94b1-4bb3-a0b2-9e8890f90b33@amd.com>
Date: Fri, 11 Apr 2025 13:05:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
References: <20250410092418.135258-2-phasta@kernel.org>
 <20250410092418.135258-3-phasta@kernel.org>
 <8583665a-6886-4245-be49-fd8839cfe212@amd.com>
 <c737c89c7ce9174e349c61ab4e5712eee8946f13.camel@mailbox.org>
 <50c9530d-e274-4f89-8620-16afe0981239@amd.com>
 <1a73e5fe4350d6ee4b7d807612264eb637c4f2a9.camel@mailbox.org>
 <d3dee321cd6b70d6ca98768fbcf6f1e6134c43a1.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d3dee321cd6b70d6ca98768fbcf6f1e6134c43a1.camel@mailbox.org>
X-ClientProxiedBy: FR3P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4316:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eede885-e744-4ce9-8f11-08dd78e8b802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnRzQ0Y3elIxaGdLamdaUHhXT2h3b1RCL3JRSnR1OVpiU2VUc0ZCbzlKQURs?=
 =?utf-8?B?SVAvekc0TGFnR0hGWnFBLzV4Z1dpLzNRYnV0S3hERWVoS1B1L2l2dEZMYUVp?=
 =?utf-8?B?eXk2OWJzazhENndkTTFhcXZFQ0xUUGtyTllkWU1Yc2FFdTI0VEE0VE9BWkxZ?=
 =?utf-8?B?VzkrTFdzaEVZbWdaMmtvK3NzbWNCamF0QklLb2E5VDl3SGtHVzQxTERJZG9j?=
 =?utf-8?B?S2VzRm5zQkN4QXhQSkYrSWJwTVphSG5Tbnc3NUxtckVackxKbXZDbW5zdkRS?=
 =?utf-8?B?bGxQVWZYTDhwS3dxa1FxM2Iwd2NEVTNKeDArS05KSklSS2NldGU0aEZocWZv?=
 =?utf-8?B?OE5hOGZ2Z1liMjZqSUgzcTNWTmUzZS9lU25Kb0tiZUZmQzJPdktZc0lRY0x6?=
 =?utf-8?B?QVBxZ1Zqczc3RUJUaXpFRU1wbGdHbERaTlN5WG00cE83VDlLcTdqMDVUUFdL?=
 =?utf-8?B?V3ZMa2Z1aXVsd3d0Q3VjN01BVjZPRGdFcFp5V3U2cGpzV1ZUdHQyVlBZVkxo?=
 =?utf-8?B?a0hEWGZ3SFNiYU5nUWhhZUdqMktGL2Y0Y0dXbk5xNFo3cTY5M2hLclQ5eXFh?=
 =?utf-8?B?ZlIvL3dFNkIybThzZUpMUEtpUFNJTy9Mb0p5QWIzSlFIcncvSFFQV0lWQUtq?=
 =?utf-8?B?d0ZhTU9mMGlvVmNybHB5c043SHhQTUtjTUJlUDFXam1ZWTk0L3hVbUlNQzly?=
 =?utf-8?B?aHBRNGk0L2JKY2hzUkxXZVhDTURDOWJCV0ZBYVdTay9nQ2VtbkRDOEttbkt1?=
 =?utf-8?B?Mi85V3dUdjEvczJKL0ZGL3hpVHhjb2tZMEM1UWZXdnVpblQ0dFhBUzFoQS9I?=
 =?utf-8?B?WWZzR3hQYk9HbHdqa0NpNzFEZnNjRmQ2QlJTNlNXT3dnWkx6ZEk3ME1UUGNi?=
 =?utf-8?B?MmdTeDJqUHM4TEN1eDdoTlVRNExsTVpkcXIxMmRKcEt3T01YMzVPWmRWak9i?=
 =?utf-8?B?bkdEZENMTHprejgwU0ovMDJUcFRLWitTKzk1dXI1bGJtdnZCTkVsMStKQnd1?=
 =?utf-8?B?Z3hrVGVLS2xNelQ2TmdJV1A5WTg3TnI0UE5aY2NFSTM1blU5QVZ2ZWRxdmtB?=
 =?utf-8?B?VHJxVHFhT2o1RXhDTVFISDdZcG12WDYrNlVyZUoxOWFza3NsT09pWGtzdHFQ?=
 =?utf-8?B?aU9XbkE1RVBLakdPU3ZkMGNuV2N5NnpHQ0VZTWJqdU5PYkEwOFUwZGtRenVV?=
 =?utf-8?B?V2pJYng2VFhRbVJ0SDcwTVhZR0pWNkNKb3AyQjVPNEp1YnJJMmxDNDVqd1ZP?=
 =?utf-8?B?SWh6RnBQVXVVL3ZHcGtYMHV4cm5wdEF1LzJSTlJ2TlJnRTdEcTZ5OXRKelFZ?=
 =?utf-8?B?TDR3UGpOZjMrMkFoU2VadmJoendGclk5bzJGU2V1SDhPTjNxRXhvdVVNY1Z2?=
 =?utf-8?B?NnZvU3p5cXczRnJVbm9veHBaNlpjWTY1OGFxdmRZWWw2Rll1RWtBdGh3amNJ?=
 =?utf-8?B?STZEWC9kQ2xzNlRZVk5QanNEaFIrRDIrdllTNE5GZ1Rab3d2b0pLTGFVcS9y?=
 =?utf-8?B?aUZZRjhzdlJjbU9vVmdhYVY5TWNTNTN6K1JVWjhwL3orc3M4QmlmZUhjRGUr?=
 =?utf-8?B?M3hTVGp5aFRBWEY5K1haU0VYa0ViVEd5SnpsOXVDVWdJTHA5dHpjZkJHNHdr?=
 =?utf-8?B?QmxaaWx3NzRsSytrU25rdEd2WjdBbEJCOU8zRXIzN2p0WWYwbjMzand5L3lp?=
 =?utf-8?B?T0JGRnlTdzRTQU1NdGFydDIrcDcvVHRJWjVINUllNGdhZE9jcVExRkFJZFpr?=
 =?utf-8?B?TGxEQWVxcmxtWE9KM2VtQm5hS2pLUnNrQjdCQUFRWlBIQ1Nqc1RSVFJjMmpx?=
 =?utf-8?B?a295a20vNEYrWkdoelMrS05UcENaME5RUzZEbStFdGFqZDNzeEhncWZrVmxL?=
 =?utf-8?B?L3N5NUdpcUdaS0w2MlNZRUw4QldKRzBPTVpCbnA4MWprcFdsekxXS2F6VDdv?=
 =?utf-8?Q?oBCKgZ8eH5U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1lKbWMvVXVMOHFHMFlpVG10RThSQVc5OXFhVVIvekdqdkovQVNlcHBoQVlQ?=
 =?utf-8?B?ZUJUSlArV1c5VTBjbXhXMEJmNk4rd09FRmhydGhWNm5URXkvTzd3R05VQkts?=
 =?utf-8?B?bG9CVHdjaGJUSjBudUxVZDBrV3ordzREdEJEUnhBc3c1RWxZcjc2LzlGMUZo?=
 =?utf-8?B?SWU5N1N4YkswVkxvekk1Znc1VWswNlB1RWxoTXhaSFNEYWhFZ0syV09aOWRn?=
 =?utf-8?B?ZExuWUZDWkIwSUhRQ3I2TlRhbVUvTXY0bFljdklUWUpHYi9zZlpsRG9SRUtq?=
 =?utf-8?B?b3JodDZmMWd4NnBlQ2VNa21JRXNNU0tIY0grdzBkbEs1ZmZpM2xRVG85V2JY?=
 =?utf-8?B?bWJuNmpxVWJzL0Z6dERKdjJvOUhlVTl3L3dLWHJIUENEeWl4L3pieWdIQ085?=
 =?utf-8?B?OUd1OUtnbVhRZ05taFl2SlorbDRWN1lZOWdOdUtYUGtpRXNyUHpYU2ZvSENy?=
 =?utf-8?B?TnpPZ0dGTXBETm50RmhyckpYUEhsOGE3UTYvU3NDb0lFUFVueDM5NjhqemYy?=
 =?utf-8?B?S094a2xQeEtBNGZybm5rL1hQSGUwME9xVzdiMHRhWkRTVkNBNGJsQ2FWMzMz?=
 =?utf-8?B?S1RYd1pnMmUzSnpDejlYWkJKSmVCemJacG80QkJzdjdHdnNrQjlDRC9MZGxk?=
 =?utf-8?B?dHNTbnd2RCtIUEpqczYrRHdNZ0VoKzF6OXpaYTloMXF1M3hLR1VabFIyMXB6?=
 =?utf-8?B?S3FCSzdpUFQzaldqSjlndWZkckx2SVZrN2t5Qzh5eVI0UlB2YlJ5Nk1FUll5?=
 =?utf-8?B?ZW4zOFBjS3lHV2xMSkFjSEp4dXdFa2Yrbyt5QjVNQis4Qk1JM3QrWmtwVjhP?=
 =?utf-8?B?MGx2U0ZXNEJScjJuUzE2MEZZSERCRTFkRFRtaVJoZ0QzSmo1MGt6aUdXM3ZU?=
 =?utf-8?B?YTlSK05EQmVEc05jcCtrZE5ldjc5aDZFaWU2KzByUHM0S2JtYW1Rd0YwT1Fm?=
 =?utf-8?B?VWpOY2Y3bVYxOVRrMnBiM0grWkROVWRjR0k5ckxueXZ6RGN1RDVsL2ppd1l2?=
 =?utf-8?B?R0VIaWgweDlqNzNiT2IzeXBoVEkvMDVXejBNclMvaGVHM2p2T1lVUGRJV3py?=
 =?utf-8?B?N2ZzSlhCNmdZSnJwTlVibHA0MUhVNWlvV21iNUVnM2prUE8yYVlDUkFJWWNm?=
 =?utf-8?B?L1FCd1FxQmNUOWdGSzRLNnlUSlZ0bG5NY2t0YmthOHBNZklUU0NEbWp6bEk1?=
 =?utf-8?B?WW9GdHZhQXZmTXEzRUEyaWtJZHMzVFRyY2RqNHpjakdzU2MyNVArNzRjZ2JM?=
 =?utf-8?B?MmFTcnFkdkZDakdCR3dMSUVPM0VGZTBwRVNqR1NXSFY0TDNRaW03Njl3U0Rp?=
 =?utf-8?B?QnI3d1NsZ1NwMEs4WWdUZG1vVUpjR3dwS1Vxd0xhaVVjY3IzbmdTazgyMElq?=
 =?utf-8?B?cmVVaG4weG14UUkxSUt1UXVyek56SmxHVEcvbTFkb0VRRVlQcWtjcXBqRzFx?=
 =?utf-8?B?Zk55bkJzbnMyRk9aeTBkSys2NGdzODJ0TmM2VDYzNlZkZEpMVkhpUHJRUGVv?=
 =?utf-8?B?T2FlSEdyQmk2SVl6TWkzWlQwOE5TdkZiWnFQeDNzbmpNN2tJaHRpZGVvZndO?=
 =?utf-8?B?a29NTWE0cWNPalFHZktYS292d2hPeFFDYk53V1RGK2l5a3hnTnFuUkkxZEVV?=
 =?utf-8?B?RXFUcjBSL1ZYUGpoLzlXQzZlbWt5VEVpaDF2cG1EMlNBeHpCbFovYUIrbnpX?=
 =?utf-8?B?NTVNU3lPSmZxVFBRNUk1VmFXSHNGSG84RFNJUTJoMFNZR0tDaHJJWVVYZkNO?=
 =?utf-8?B?dytjV1dkdTNrY1QyZGtkVFgzRXZOdlpFL2cyVkdLUWhVejRqVWpJYnBURHhY?=
 =?utf-8?B?YXNIS09uTVV6UG1IZitITnFMSFJaamdlelovcTFaallLMjZSSURXYy95c005?=
 =?utf-8?B?R2xqTi91Tkd4VktGeDV4Y0ljb2NrQWMwY2oxQ0IzaUpIQlpCL1lCYUJEcWtT?=
 =?utf-8?B?NjRxbVZ6VVBVZlZabmxSVEtuNHJ0VngwVEdkdlZaQ2tnYzV2MnNCLzZrS3h1?=
 =?utf-8?B?L29MNjkyNXFKS2ZKRmgyL0JQdjMrdEpNRVVpL1N3anIxNEZzK0puS2oxT1lx?=
 =?utf-8?B?eVRrSnNQbGYyVDAxa0Rvc0JROTBVc2FkNFZTamhoSERmcGZkTURHMVBZUFcw?=
 =?utf-8?Q?ReLv9GALq11zAKfT+kClzA17L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eede885-e744-4ce9-8f11-08dd78e8b802
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 11:05:07.3774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tg9VfeQMU2qDU/TqRP2ddUpOtQCDpKIv1WEKx+YRuCcY1ysIqo2GZFtzm6YqEnsV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4316
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

--------------M0ol96SFa6ecnoacdIKMfCh4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 11.04.25 um 11:29 schrieb Philipp Stanner:
> [SNIP]
> It could be, however, that at the same moment nouveau_fence_signal() is
> removing that entry, holding the appropriate lock.
>
> So we have a race. Again.

Ah, yes of course. If signaled is called with or without the lock is actually undetermined.

> You see, fixing things in Nouveau is difficult :)
> It gets more difficult if you want to clean it up "properly", so it
> conforms to rules such as those from dma_fence.
>
> I have now provided two fixes that both work, but you are not satisfied
> with from the dma_fence-maintainer's perspective. I understand that,
> but please also understand that it's actually not my primary task to
> work on Nouveau. I just have to fix this bug to move on with my
> scheduler work.

Well I'm happy with whatever solution as long as it works, but as far as I can see the approach with the callback simply doesn't.

You just can't drop the fence reference for the list from the callback.

> So if you have another idea, feel free to share it. But I'd like to
> know how we can go on here.

Well the fence code actually works, doesn't it? The problem is rather that setting the error throws a warning because it doesn't expect signaled fences on the pending list.

Maybe we should fix that instead.

> I'm running out of ideas. What I'm wondering if we couldn't just remove
> performance hacky fastpath functions such as
> nouveau_fence_is_signaled() completely. It seems redundant to me.

That would work for me as well.

>
> Or we might add locking to it, but IDK what was achieved with RCU here.
> In any case it's definitely bad that Nouveau has so many redundant and
> half-redundant mechanisms.

Yeah, agree messing with the locks even more won't help us here.

Regards,
Christian.

>
>
> P.
>
>>
>> P.
>>
>>> Regards,
>>> Christian.
>>>
>>>> P.
>>>>
>>>>
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Replace the call to dma_fence_is_signaled() with
>>>>>> nouveau_fence_base_is_signaled().
>>>>>>
>>>>>> Cc: <stable@vger.kernel.org> # 4.10+, precise commit not to
>>>>>> be
>>>>>> determined
>>>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>>>> ---
>>>>>>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>>>> b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>>>> index 7cc84472cece..33535987d8ed 100644
>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>>>> @@ -274,7 +274,7 @@ nouveau_fence_done(struct nouveau_fence
>>>>>> *fence)
>>>>>>  			nvif_event_block(&fctx->event);
>>>>>>  		spin_unlock_irqrestore(&fctx->lock, flags);
>>>>>>  	}
>>>>>> -	return dma_fence_is_signaled(&fence->base);
>>>>>> +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence-
>>>>>>> base.flags);
>>>>>>  }
>>>>>>  
>>>>>>  static long

--------------M0ol96SFa6ecnoacdIKMfCh4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 11.04.25 um 11:29 schrieb Philipp Stanner:<br>
    <blockquote type="cite" cite="mid:d3dee321cd6b70d6ca98768fbcf6f1e6134c43a1.camel@mailbox.org">[SNIP]<span style="white-space: pre-wrap">
</span>
      <pre class="moz-quote-pre" wrap="">It could be, however, that at the same moment nouveau_fence_signal() is
removing that entry, holding the appropriate lock.

So we have a race. Again.</pre>
    </blockquote>
    <br>
    Ah, yes of course. If signaled is called with or without the lock is
    actually undetermined.<br>
    <br>
    <blockquote type="cite" cite="mid:d3dee321cd6b70d6ca98768fbcf6f1e6134c43a1.camel@mailbox.org">
      <pre class="moz-quote-pre" wrap="">You see, fixing things in Nouveau is difficult :)
It gets more difficult if you want to clean it up &quot;properly&quot;, so it
conforms to rules such as those from dma_fence.

I have now provided two fixes that both work, but you are not satisfied
with from the dma_fence-maintainer's perspective. I understand that,
but please also understand that it's actually not my primary task to
work on Nouveau. I just have to fix this bug to move on with my
scheduler work.</pre>
    </blockquote>
    <br>
    Well I'm happy with whatever solution as long as it works, but as
    far as I can see the approach with the callback simply doesn't.<br>
    <br>
    You just can't drop the fence reference for the list from the
    callback.<br>
    <br>
    <blockquote type="cite" cite="mid:d3dee321cd6b70d6ca98768fbcf6f1e6134c43a1.camel@mailbox.org">
      <pre class="moz-quote-pre" wrap="">So if you have another idea, feel free to share it. But I'd like to
know how we can go on here.</pre>
    </blockquote>
    <br>
    Well the fence code actually works, doesn't it? The problem is
    rather that setting the error throws a warning because it doesn't
    expect signaled fences on the pending list.<br>
    <br>
    Maybe we should fix that instead.<br>
    <br>
    <blockquote type="cite" cite="mid:d3dee321cd6b70d6ca98768fbcf6f1e6134c43a1.camel@mailbox.org">
      <pre class="moz-quote-pre" wrap="">I'm running out of ideas. What I'm wondering if we couldn't just remove
performance hacky fastpath functions such as
nouveau_fence_is_signaled() completely. It seems redundant to me.</pre>
    </blockquote>
    <br>
    That would work for me as well.<br>
    <br>
    <blockquote type="cite" cite="mid:d3dee321cd6b70d6ca98768fbcf6f1e6134c43a1.camel@mailbox.org">
      <pre class="moz-quote-pre" wrap="">

Or we might add locking to it, but IDK what was achieved with RCU here.
In any case it's definitely bad that Nouveau has so many redundant and
half-redundant mechanisms.</pre>
    </blockquote>
    <br>
    Yeah, agree messing with the locks even more won't help us here.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:d3dee321cd6b70d6ca98768fbcf6f1e6134c43a1.camel@mailbox.org">
      <pre class="moz-quote-pre" wrap="">


P.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

P.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
P.



</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Replace the call to dma_fence_is_signaled() with
nouveau_fence_base_is_signaled().

Cc: <a class="moz-txt-link-rfc2396E" href="mailto:stable@vger.kernel.org">&lt;stable@vger.kernel.org&gt;</a> # 4.10+, precise commit not to
be
determined
Signed-off-by: Philipp Stanner <a class="moz-txt-link-rfc2396E" href="mailto:phasta@kernel.org">&lt;phasta@kernel.org&gt;</a>
---
&nbsp;drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 7cc84472cece..33535987d8ed 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -274,7 +274,7 @@ nouveau_fence_done(struct nouveau_fence
*fence)
&nbsp;			nvif_event_block(&amp;fctx-&gt;event);
&nbsp;		spin_unlock_irqrestore(&amp;fctx-&gt;lock, flags);
&nbsp;	}
-	return dma_fence_is_signaled(&amp;fence-&gt;base);
+	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &amp;fence-
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">base.flags);
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">&nbsp;}
&nbsp;
&nbsp;static long
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------M0ol96SFa6ecnoacdIKMfCh4--
