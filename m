Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C57B58671AA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 11:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3A210F046;
	Mon, 26 Feb 2024 10:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vPeo52Hm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B658A10E54D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 10:43:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wma5GPktG39hnfShX5ZxRyJ3j+/NsykkDcN2lZktl3YsoCejMSy3BJEDBQMyfNxRKRptmki1szrD2kH2NUMBpz2sPu4eoVMBC4nU+sct3xNFyrYK9Kx7yd40IkDmU+RqQe2iU+LVJND3P3LAdQhyt557prjwBLBFBGJliZ+2hZkwVQ3BWhSuyCM8fZ6rnEAWcU0fsz9lVPbkbPIP8k/Dv3R468eFF5xSNYwOc67hbHngiRoNgLnyYAkU5jC12jpRwC1VoqXXnMbS0mVp2PA4wqJaOjrKCTSkvgGnTJ+SjVO8+o2ypEgBMfjpdcS3NmLL7QaST5hS7KOkfTNA9QVA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlkIOCegAYbNszH0qapbxzZU2lu448+l43CIUaeJPD4=;
 b=dNUR/ZiJZwl5SK8AxfJ01ZRrREo4PQ+ihEJjEntiGutEoJ9aalDWK22IrzFd3HD8fDtFG45PmEvJjlsVoNS4LHL1NT2/1QMHRZjV9iJTfKrb5Hqi4aXY7CD8nHV3DGzc0EoNX/24JLVwKTOVc66i9d3tVnhrD4pJHgyoT92GH/PKcE+qwffCm/fdqDF9ypCv2Bk7CvxXbO1oScaKQY/7f+PdmN+xKHXpA/b0fiUbqrjsNQwuKkR+Hu25ABxu9gKA9WlkzJuAhtdxfysXx2NGt4Y7VcYVomveESXkpAFBOgDkVa2p82fAsFbF1FcLZz3UsToH2193a/r83n/TNKwoWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlkIOCegAYbNszH0qapbxzZU2lu448+l43CIUaeJPD4=;
 b=vPeo52Hm1syfAuWNG03FTvfWfcreDUyHFNJPgD8tFdc9+hDDH772O7FBBXv1MTloFokgmOplC0x4+xtVJQchE1r2Qj+sWWy2ax9PfjSzUgoR1rgYGSF5ucSn2+FFzIDuphxKGoplO1hi21GMbVBfOjfIn/DKDDZMB402TJ65JxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8791.namprd12.prod.outlook.com (2603:10b6:806:32a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Mon, 26 Feb
 2024 10:43:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7316.031; Mon, 26 Feb 2024
 10:43:46 +0000
Message-ID: <debc8ab7-5648-4cff-9f70-b53eb7443597@amd.com>
Date: Mon, 26 Feb 2024 11:43:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: ttm usage inconsistency
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <CAPM=9txLf5E2G-afpq54A3uRVkgdjxfUznXqhXHZ_7jNrQNfEw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9txLf5E2G-afpq54A3uRVkgdjxfUznXqhXHZ_7jNrQNfEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: 5041d94c-a579-4408-19a3-08dc36b7cf54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U2nsmgQgqGOexFWJ6LiWfi+rodlaOLD1lDuPz+D+9ntPFfYWNyfAEIqTvWuO8sJuMBXebhet8kAFi0oMZwtd3OI1oFsAZXp7hTbY0xV53TShmQqTYfUYrZZBCUWVcFSlQ9Ey0QmE4MX/oks8iXmEcxWbMbOCZe6NoV6jrLA1o48Oyk40yEkfCbC6iT+cdD/5TEkM8EADz4NqlTOA04/10n2nLZColk9VEbfmU9zXyND4XgJPqcTGgq9x5gu1eoW3eGTt51KuubHnFE0mjRoWvP8oTHfuXSA/z82NekWyozwYdyh6GSIlyFvU41mIwawR1mVlarNHL5tVEchbiFOm2Xs6yqVxQCH8QdvjXZlkDI0sKhL1/GqwKZBoa0+K/kT7P8urYt110aM71kE53IXELU5oOcSGG78pTQIBPw6SiQ5QXTBsiHKEGHvzxkLSlM6I5SS39vLtuccSSeJhVKEsY3tQ7Mkri7iQMt2XAZtmSgy57ITr08bmBbCidWry9J24bUZjV5FBrrE1C+0sL/ruCjRBrLZ5nmlCsEgWHo9f2tGrDVC5oD1x5znFKVRd/KcXL1oRieZoU0r4tMe+qeZNWSVDsOP9+C+hVfGjlNOCHQbEDaVPhG4KUkqZkVWdFGq+mW9sSRfIWX/4no7YOfy3iA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU0yZWxEcHhoSlI5R2g0TW5NMm9Qb2l5SnQ3M3FUbTl3SlZpdk4vZTRlaXVM?=
 =?utf-8?B?SDBLb1RPdzhiYUlRc0w5QTV0TmNGN1k4VHpxNk91NngxMzJYekQ2Ynp6ZHZa?=
 =?utf-8?B?WkE5S3p6QUVJaTk0bDZOUm9SSkVOak85dGVxSlA3SnEyYmR0aGFoQnNWckJH?=
 =?utf-8?B?Wm95ZDY4Q014YTRYMHd5dlZiNW9IUVhFU0grZWhYZFcxaFppS3pKMEgzSG8y?=
 =?utf-8?B?VHpKU2JNdFlFenZXaUQ1eUFaNSswS2ZCVnBLejZPbE84THlBem83MElqOUFM?=
 =?utf-8?B?YkpVK01wU1YzTWl0NTE2d1lZRU16QzRjZGVYMFg2K1haKzhUWk80eHVUWGIx?=
 =?utf-8?B?a1dUU3BEVHQ1dmFaNGhCNk4rVXByckhtT0RoQ1RHUjl3TlR3MndJVStlK0d6?=
 =?utf-8?B?dWx1UTAxQkd6Zll1VDBoRVFsL2lXUWthc0k5M0FwWm5heUpheGtpTTZTZmk3?=
 =?utf-8?B?M3NpZVVlazQxVUZHUmlOMVlIYXpYZ21SYmVRYnZqaG5pN1d0SEtjSjJoWVVU?=
 =?utf-8?B?T0JHUndENjQ1OXBYalFWZ2p3WWhaWjNONzRoUTg3cU9aaUFTYXRrZlNlNDdE?=
 =?utf-8?B?TC9DUnByQ1EvdGtDLzkzWURpczBpZ2NmaTRRSUFDc2ZuNlNDZ2I3am1QNmpQ?=
 =?utf-8?B?U0N6bXpOT0JETzNKUk5UZkw0R1BxWGNKd3luTnJLWHFnWUhSczRQQnZGVmk2?=
 =?utf-8?B?QXk5R280OWlxc1ppYXNrWnpMUGIrajNmMW05VTVJNGtTNVRsS1hYOUpCOHg3?=
 =?utf-8?B?SG1HZWk2RXgvZTd1SHNPOXZ1Q2VHVldlTE4zN1FZOEozWVJvbzdsaXhOc3R3?=
 =?utf-8?B?SFI1Skt5akZRamw2TjZqSXlLdE43WG9rVmRUdUdTSmk0SW5vZkkrTmZkQnc0?=
 =?utf-8?B?QXlXcGR6RjgrV1luSlgwRXdlajhpS3FIWjlFaHBTaDNzNDhWNmdXZzRNSEFP?=
 =?utf-8?B?UXNPWStia2UveVFtREtNcWkzMUtCaDNWbkVFMTJWVytRTU5rWDZmd05zUnRC?=
 =?utf-8?B?c2xiQWI3RE1DdG9RZWpvMjhCanVCQTg3d0JiUVc4V3JGbktCelRtSzV4V2pp?=
 =?utf-8?B?UmJIc2t1aXZ1aXRkOXZLaFJhaFFZM3BvcGI1YndvK3d5TUdBbmh2aW1WUnpK?=
 =?utf-8?B?NC9oNkJMd3BUanNFaU1ON1IvblpydGpVeE00dmNKanh6ekZqVEZCMVBNZ3Bw?=
 =?utf-8?B?TFg5c1huVGhHU2F1WWk2NkdLSmNLQkFTaHZwWUIreWNWQ09aWjNQNkVMWkxG?=
 =?utf-8?B?b1pCTDZQZWFRcVdSN3Myb1ZUUlRuMjdxeDBkaEtodzJqWWs4U3ZMVndYSzhw?=
 =?utf-8?B?Vk40bUYzd2doQkJSd3B0SHVuK05lU2FoN013SnZaTFVTbCt4UXZWNHdSaGxh?=
 =?utf-8?B?NnhISDdXVWM1eHJYbXUrUHh2K3hTOTJKT2c2dHJEa0RwSUZSaFpJaU5CaFNz?=
 =?utf-8?B?WkJTZlNrREptazI3MXQvTWRqdi9uV3BWcTNVbSs4ODhSNWpLK0hhd0RlVTFj?=
 =?utf-8?B?dmlqOVJsYXlJTUlGZGkzWWdFSHRvTG1NYVR0c09ZT1EwT04vajFqVkF4YlZl?=
 =?utf-8?B?L2xSOWlnTUtod1F1dFpieUdIWmk5b0kvdUlYcEdKMGhGOWNud090dWV3R1hV?=
 =?utf-8?B?TW1nRmJiSUNvM3gzS2RqWkZrM0hCenNaY29XUmR4dXNQS3hPYWMrZWNoN1FN?=
 =?utf-8?B?RnVwc0VJcTV2TDFHS0R0K1JkaGpRU2JGNWN0aVR2WUlNK1FwLzE3bDhLVzZP?=
 =?utf-8?B?NjJvNDdDVUhNSEpFbTBwd0ZVYVJHR1cvVkdaV1BXR0RJalB2MzdnRmlDNXhV?=
 =?utf-8?B?R01WcElZMnZYQ2l5akpzZVRBall4OC93Q0FKTVovcFZ3MWtJalM3VGpQdEhw?=
 =?utf-8?B?V1oxSHhHTFZTdGNNVVlETDkwYlRXTU8ySmUrU3FETmdQNnhFZTFvVG5weE9J?=
 =?utf-8?B?TFJzTmt5dzROLytJNG9YbzhWVXBZU1J6RjdqU2NhMjlkaE9wcjU2RTg1eDJm?=
 =?utf-8?B?TDZacDFZcWpER2tzL0UwWjRkOHBWWWw4VjhoMVdYa2hYamo2cUt1ZXJvaUFO?=
 =?utf-8?B?M3JlTlQvMkhhVE5KMnFLVEVoN1ZDSkUva1RsK3NKZlNlVVd4WHpYeGd4eTlD?=
 =?utf-8?Q?O+qfz+Jw8Q2sF0Rp9A78N2o/7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5041d94c-a579-4408-19a3-08dc36b7cf54
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 10:43:46.7716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8chepLMarWSZ2xdG75Vk1XlhhN/34Mq77ExjJQKIkt6QYDK7hG+LPCTXrTeVQ1Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8791
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

Oh, I though we have fixed all of those.

Basic idea is that TTM always only works with bytes or rather arbitrary 
units in the resource backend instead of pages. Background is that we 
have resources like GDS, GWS and OA which are allocated in units of 4 
bytes (GDS) or arbitrary hardware engine units (GWS, OA).

Because of this  Amar, Thomas and me have been working on removing all 
references to PAGE_SHIFT and PAGE_SIZE from this part, but looks like we 
have missed Nouveau.

So yes, Nouveau needs a change here.

Regards,
Christian.

Am 26.02.24 um 08:34 schrieb Dave Airlie:
> This is probably something I knew about and forgot, but I'll ask if
> anyone has considered cleaning it up (or maybe I should fix nouveau).
>
> nouveau sets up the resource manager using vram_size >> PAGE_SHIFT as
> the bounds, but the bo sizes are in bytes, hence usage ends up being
> accounted in bytes, so we have usage > size which looks wierd and also
> caused me to screw up adding an ioctl for userspace.
>
> Should I just make nouveau use vram_size instead?
>
> Dave.

