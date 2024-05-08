Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2D38BFD0E
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 14:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3FA10FB8C;
	Wed,  8 May 2024 12:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fp3+9PMz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2420910FB8C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 12:22:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rh+wFljY+1UUMpgVHQi+sYNHG91/PxV8Emyb3u6kTg7xit7zctx+b/+peRAIPJ2ERK7EJVCO3BruVRULtpkSuV+z7Nevx4q9BCeRscSb2jQsDI00QlTVTv43GCRZ27VX7KTc3ZWAx/DyzGI867ApYHM2/IXiRiuqKQt8IDh/dm3lht1yMynog02UnBI985V46Xju9dDK2klLQmsHKEh971E+/ON9LUtSEKX5o8tfx4eR09GenUh3KotTaCN8l80Wm/CGzGexWMMovWlm4LvElfSI7EF853J/3KFbSHv8I+itF+BsO7pBbr7bRarcN6+2HjNjdzOomBa8pWg+LzJWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8voy6oaEH+U6LAL3exko8Sn2j7x7CxBU0t7bx5isO8=;
 b=QhVJjIAMR86/vFx6c6AM4/V+XKP2Z/xPGHwXXsvLgOKs8HOlyHmM9tqkAGBdGlDOFl9Jmcd0zdVlXgTMMElRtwUp33TQJX5ig1Cr5vKTHMSBNZOmJ8Z/vBDd8+v6XWYCpSp8I++qmzigOTBhctVVRRyUq7RpPTDC1BQWqRV+QuWs1S8gK5qTnPtTBeRhOeskp2EEVGwtVBP4cy6YuM1IAS/IaKOQKAD2Q+mXX4jDzBYbbhxjFvsx9dSp9IBJk46DX+KR9DV6CC43gs5Uixd4Y5L3AYN+HYU4kFnHcJK7o6TxCQFS668ZmsYBlr/d8BgkdTXyETudPtfAoDjYRXjJDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8voy6oaEH+U6LAL3exko8Sn2j7x7CxBU0t7bx5isO8=;
 b=fp3+9PMzAZQqdSmJM1HxPcLvidob7fYepna3gFN0GNxBGsKbu/mXv7YJyhWpTgwioip0cD5KwkyNBufAOi82Vj3itAwCY52sW2rKkDdSwa7iy61g7rJ3wF6/i9LuC0uLCqj8oYCfw6MgCo8rrTl/IiJt6MyDe0lHaIWXufk7r54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8755.namprd12.prod.outlook.com (2603:10b6:610:17e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 12:22:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 12:22:08 +0000
Content-Type: multipart/alternative;
 boundary="------------1ZwzVE4eoGd2lFKru0aC4Zl0"
Message-ID: <facb101b-3535-421d-bffb-c4ea675c9107@amd.com>
Date: Wed, 8 May 2024 14:21:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: David Laight <David.Laight@ACULAB.COM>,
 "T.J. Mercier" <tjmercier@google.com>,
 Charan Teja Kalla <quic_charante@quicinc.com>,
 zhiguojiang <justinjiang@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <4fedd80c-d5b6-4478-bfd3-02d1ee1a26e5@vivo.com>
 <aab5ec51-fcff-44f2-a4f5-2979bd776a03@amd.com>
 <2ebca2fd-9465-4e64-b3cc-ffb88ef87800@vivo.com>
 <d4209754-5f26-422d-aca0-45cccbc44ad0@amd.com>
 <289b9ad6-58a3-aa39-48ae-a244fe108354@quicinc.com>
 <CABdmKX3Zu8LihAFjMuUHx4xzZoqgmY7OKdyVz-D26gM-LECn6A@mail.gmail.com>
 <8ca45837-cbed-28da-4a6f-0dcec8294f51@quicinc.com>
 <83605228-92ee-b666-d894-1c145af2e5ab@quicinc.com>
 <CABdmKX2MWU9-9YN46PXx-Jy-O9CHMv8hCkvArd7BbWUBs=GPnw@mail.gmail.com>
 <8915fcc1-d8f1-48c2-9e51-65159aaa5a3b@amd.com>
 <ZjovD5WaWjknd-qv@phenom.ffwll.local>
 <44b08793-cf44-4cbd-a3bb-583af351ab9e@amd.com>
 <c0fe95949d4f41449f17add8300270b9@AcuMS.aculab.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c0fe95949d4f41449f17add8300270b9@AcuMS.aculab.com>
X-ClientProxiedBy: VI1PR0102CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: 80af52e4-a9a2-45e5-5205-08dc6f597abe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|1800799015|7416005|376005|921011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFFIZ2xtNGZpYXZZbi9vTlcwdDlKTnZLekJKSkpXbmkvQ3l1RjU5UUYvT2Zn?=
 =?utf-8?B?aGxMQVVhOVR1SWNmNlp2MGVGdHdscXpUU0oydlBVM3hrbHB5RDJpM0ttbmNw?=
 =?utf-8?B?cGYwamZweWpRTUcyVlJ0ZHhqSFY4dGNzS3Z4SDk0NlQzaCtkSUZYQVViSDR0?=
 =?utf-8?B?dFJlM3RXcS9VK1B0WWhKZnZnWkNEWGVESDBQaDd6a0wxUHZaS2lmcHBFUFlv?=
 =?utf-8?B?ZjZJZklmWE10dUgxeUlabEJJNzhWdnhSMDRPT0g4Y3RrQm1OMFQ4UUVldWdS?=
 =?utf-8?B?N0drU0dCTDhFQXZYRUlFSEVld2xEb2grbzltNytmeTVxaWZLZTcxMzVxeCtt?=
 =?utf-8?B?cE1wSi91a1RmYWt0KzA4QWN0cm5YRlVvZ3ZVWVhZc0gzLzAyaUxCM25hek1L?=
 =?utf-8?B?RzVMOUhteXozQm5MOWVKN2pFUmZLZTBMbU9YRTk5dW5TZW5tRFpRQ3RvZm9L?=
 =?utf-8?B?LzhmSzZDTGo1TFg5cWJzdWNqWmhWNG96VndVVXNCVmFNcTRSazI2MFZyZ1or?=
 =?utf-8?B?R09UMnhhZEdHK1V3M0pjakFLT2FuZS9XcmppNUtBK0padXBmVXlWUEdseG0x?=
 =?utf-8?B?cm1ZcW1nS3ByTmJubHRCSlpSYkFMUm9YNGFBT1NBZUxvK3FaU1NFNFZKc2hP?=
 =?utf-8?B?VTYyQ2VZdm1JTmNZMkh6UENaNWlxcWgyNnZRY09MdkZ6Z3k1NzBkV01qSEs2?=
 =?utf-8?B?NnJ3ZVBjVXRoeE96bHFmU2VMYmpTK0dQZHFFOGo1cG9qOGtZVEpXeUV5MHc2?=
 =?utf-8?B?K2hVcTU2Qkg1WXJqWkhydjdBQ1kydFdONnlLRlBodnJBU3VBZFJCTnVxQUV3?=
 =?utf-8?B?cC9BUDV0UUxXNXgyWFgydUsxZnlnV3ZZcHY1UFNYK05nWW9RUVB6NEM1QlFB?=
 =?utf-8?B?bDhPSENFMTk2ejZlVkNTMFhzYWJHb1JrM1BZR0RzQitsQmtIWkJYdUp2bU4v?=
 =?utf-8?B?d1BCQlR1WHJodmNxLzB3U0o5cENoZERxMXp1eUhOV0pTNG53aHlhNHM0M1VU?=
 =?utf-8?B?YVhaeEM3STJuaUw1Tzk1MnRGc1hIaG5ZT2JUMWNtZVl1TUJoMHhuS2JvUmVD?=
 =?utf-8?B?QUhOQUh4L0ppOXMzdmtrajZ3bG5wQ2xWQ0VZWXJZVEltc3VOUFlQYkJPRjMx?=
 =?utf-8?B?V3NLYTZIdFB2WU5SbHByR1hGaTdoeG16ei84TndlSXZIN0V6MFhBcDJWZ0NU?=
 =?utf-8?B?b1JDNS9QcGZiZ0xsblRtOGRRQjMyL2l2c2xIeklHWE9lRnNoS0t2TFg0S1dh?=
 =?utf-8?B?WHA1VlBzU2poR1hzZ1hFOVNiSTVYcGRRYzk2eG5VWUtoaXlBVm14bUxGZ2JJ?=
 =?utf-8?B?bTVtRXlHWmZHcjRTVHdTUlhTeitrL0ZndmtIbVVQdW5BQzYydk1BbTlJSGxx?=
 =?utf-8?B?MkcwMTRRTFYycmdDV1BPbjh5dFhzbHphd0FJZE5XMGFYSU1PbW1hUWRTY2l5?=
 =?utf-8?B?TjhWeWgrMkZZMWdQNVplQm5lcjJkN0JYUGpwOHQ1QUlQN2hQaDNEWkIyMWZB?=
 =?utf-8?B?WkIzZXhETTViald4VDRsQVdiejFOWWg5di9YNVk0eXFzNmpwZUJCRDBaUXVr?=
 =?utf-8?B?cnQxMHgwZGxzL3FIazdBUmtsTFdKREtISFl1SVYweVFwT0RWdzJRT3BKMUxj?=
 =?utf-8?B?c0gxREtUcjBMaXFhb25XUjJGL21Gd1hIS1NBbmxQMncycG1vNm8rVno1Mnpt?=
 =?utf-8?B?RGI5eEdGT3hhWXNsakdiRXpaWHJGMDFKVWJuc0MzRzJab1hhYWtJa2RaUG4y?=
 =?utf-8?Q?BqV5LI2GTnNgXht2WkweX/FBiPk7zexOsbDBlg6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1BlUXJMckd3eHp2MytwWFVnVjRhVVFRc3pNNkZwVE1uTFBqdjZuRld4ZnRn?=
 =?utf-8?B?L056VUdUU21xN3JWWWFVdkFITEMwaXRsWGVOMDRxMHAvQUpqRkVUOXdERzR3?=
 =?utf-8?B?N1BQMjlVVy8wdGF0dlA2bitKdkxFc3ZTWEEvMStONjB6OXpoMy9DMUpQRm04?=
 =?utf-8?B?TGh0cWtHb1lTeUNLR1ozblNsdldpWTFxMHZuNUdQMktWUFJwYnlqZWFQeGVH?=
 =?utf-8?B?SDk5RU8vY3BFUFVjdHlYYTcrUmdiYmNLV25Ia0hLNkpLaEk1MHVSZlBGWk5q?=
 =?utf-8?B?eUJJc0JPRUlDRFpITFVybDdRVFFFT2dBenZ0cExtZjRUcGM0Wkp1N0JPWi8x?=
 =?utf-8?B?aitYQnFscXFSWGFkVWNhcEpsS2paQVlUaGVDSHhQQjNnYVRTSm9IWlZBdldt?=
 =?utf-8?B?Zm03dDcwa0tCL0UwOVkwQVpPS0Iwa3NFazA2Q2JLVGJ2ajU2d1ZOSXN1a01H?=
 =?utf-8?B?U3ByZ2x6Ymp2bHVhOWEveWU5ODVpd2d4eHQ2NklDQVJybE5aQWt4L0hjOTZX?=
 =?utf-8?B?K2hMRHhEMlpJZlI2dkordmo5MHU0d3lhRmJZckVab1AreHJHdFNhWWhZYW8r?=
 =?utf-8?B?NlQxL0swVUExdFltTEttUmhkRitvNmNJRnZiK2NUVklxSE9tbjg1N0FKZ0E3?=
 =?utf-8?B?aitKS1JDYXFyczc5b2ZPYXNlNzc0K3BzWTRIN09scXNrMUFrOXZtZVJjWnJN?=
 =?utf-8?B?eG1mL1BZY2VUL1N1bWlZU3hNanFBNHA5R3BKaVZMTmNDNTllaUExUWdFQWFO?=
 =?utf-8?B?M0pYNHRITEZWOTFsNTJGNFIrUTdkWk9lR05OOE5oRS9SQXhPZ3BickY4SDRo?=
 =?utf-8?B?L0NBQUxNeVVtRndUR0luOWc4UVpiZEU1ZmpLU1c0NFNlaEpobDRuK3k0QnBT?=
 =?utf-8?B?NnFpNEt1TUFsUHRWNURocTZUQmltcDh6UlIxcllYNmMrUXFUZnY1YTBQK3Zi?=
 =?utf-8?B?U1FZK1NRYkNVNndLRTVEWENCdjZwclg5OGlHUWExYWdzZ05vVTRNRG1MR0dY?=
 =?utf-8?B?R0c3MkRNZDhkSWNMTVI5TkFYTXJMSWQ5ZTc3UU1oWlVCZDk5UmNmWEJleFFp?=
 =?utf-8?B?a0loNGNtQ3hiMnAwUkxGSFhjd0NVSnVVSTd2d2RVdE01RXY5b05YeGRkK0Vr?=
 =?utf-8?B?Y0plNnVUL1Q3ZXQyLzNNa1dWYllPdmZQcDNpWlRFbWdERmZkUWsyVTBDaGtm?=
 =?utf-8?B?KzNDd1JjSXJQM1FuazkrK3F5eXVueUdNM1dra3dJdnZOZEw0a1RQTVEvNmdH?=
 =?utf-8?B?dTA3WG12Nm1ZcWgvSVM3czFsUlZHaXdJWmk4dGN6OVBnWnZhK3MxVXM2bXFm?=
 =?utf-8?B?R1AxVDJzVVpQUEQxUFY3bXNZZXZoNTd1RzZCb056M210Z3l0RUpyOGJzbWd1?=
 =?utf-8?B?UGlHWjAvNGQydy9jN2ZzYmx2ZWc2aEYvYjFhVCt2S0lWZkhjLzZnRkdKcjJU?=
 =?utf-8?B?NXNoUXNjTkkxdUVwcUZCVTlKVkFJMVFrZDdSb09SRnc2YmxyOEhnUENLdGNW?=
 =?utf-8?B?NUFUYUl3ZVM0aVQzMmVobXlMSnBTQjVnb2g3ZlFlU0xnS08yWmRkWUpkL09t?=
 =?utf-8?B?SVhvNGFOZXFpdzc5VTFkRFpzVjAzOFVYdXFLVkJCalplbXlGMDFMNm11eUJC?=
 =?utf-8?B?TWo4aDFsMFZBNW5ZM0I3NGhDdTlIV2FTRnJ5NzZFbmk0ZklHWUtuWHUva0dy?=
 =?utf-8?B?UVovZnBBVDdwbDMxTHRYNFFVUXNYQXVDZzVNVnpvK0dnNFlrTWtmbGpUT3ln?=
 =?utf-8?B?a3lhRjRQeFVPYzgzMjdMTEFHN0RKcENaUlNWNFRpVkJ0eEV5S2cweXVTSklr?=
 =?utf-8?B?ZlVoZWJTem80Q0ROZmFub0JxeUxGeHR2QktmQ2lHdU5uSm5HZlNHOTcvUzhR?=
 =?utf-8?B?R04zdHpBWVVtMmpzdVdXZ0VLZUhMZGd5WnZkQjJqSGF0UjZZSmRLWWQwcUlK?=
 =?utf-8?B?OXRoREhOVzF3citMY3YyZ3FHakl3dy9SY2R1dm04S0RGc3lpeWVpWHNDaHVR?=
 =?utf-8?B?YjRUL2ttMTQ0U2pUVlc1ZEhtZnFlTlVxTGc0VW9LUTBFM1ZjRjdzdnhLWU9W?=
 =?utf-8?B?bXM1YkhKa2hJeEs4RDArK3lBampxK2V3cjh1SzIxTUwvanhyTWNiTEI2cVFR?=
 =?utf-8?Q?CwpiEPTlJtoW1ObtW0axNZcdj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80af52e4-a9a2-45e5-5205-08dc6f597abe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 12:22:08.2916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYC1peof3w3fxOtUJgFQzvAPep3NO1XFTDnbw1T1DcWyDHLIa3b8dtKCOWAtmkRC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8755
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

--------------1ZwzVE4eoGd2lFKru0aC4Zl0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 08.05.24 um 13:51 schrieb David Laight:
> From: Christian König
>> Sent: 07 May 2024 15:05
> ...
>> I actually have been telling people to (ab)use the epoll behavior to
>> check if two file descriptors point to the same underlying file when
>> KCMP isn't available.
> In what way?

Something like this:

fd_e = epoll_create1(EPOLL_CLOEXEC);

tmp = dup(fd_A)
epoll_ctl(fd_e, EPOLL_CTL_ADD, tmp, ....);
dup2(fd_B, tmp);

/* If this return -EEXISTS then the fd_A and fd_B are pointing to the 
same struct file */
epoll_ctl(fd_e, EPOLL_CTL_ADD, tmp, ....);

close (tmp);
close (fd_e


> You can add both fd to the same epoll fd.
> Relying on the implicit EPOLL_CTL_DEL not happening until both fd are
> closed is a recipe for disaster.
> (And I can't see an obvious way of testing it.)
>
> Q6/A6 on epoll(7) should always have had a caveat that it is an
> 'implementation detail' and shouldn't be relied on.
> (it is written as a 'beware of' ...)
>
> The other point is that there are two ways to get multiple fd that
> reference the same underlying file.
> dup() fork() etc share the file offset, but open("/dev/fd/n") adds
> a reference count later and has a separate file offset.

No it doesn't.

Accessing /dev/fd/n or /proc/*/fd/n ideally accesses the same inode, but 
gives you a new struct file.

dup(), fork() etc.. make you actually reference the same struct file 
inside the kernel.

That turned out to be a rather important distinction when working with 
device drivers and DMA-buf.

Regards,
Christian.

>
> I don't know which structure epoll is using, but I suspect it is
> the former.
> So it may not tell you what you want to know.
>
> 	David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

--------------1ZwzVE4eoGd2lFKru0aC4Zl0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 08.05.24 um 13:51 schrieb David Laight:<br>
    <blockquote type="cite" cite="mid:c0fe95949d4f41449f17add8300270b9@AcuMS.aculab.com">
      <pre class="moz-quote-pre" wrap="">From: Christian König
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Sent: 07 May 2024 15:05
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">...
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I actually have been telling people to (ab)use the epoll behavior to
check if two file descriptors point to the same underlying file when
KCMP isn't available.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
In what way?</pre>
    </blockquote>
    <br>
    Something like this:<br>
    <span><span class="ui-provider eb blt avv blu blv blw blx bly blz bma bmb bmc bmd bme bmf bmg bmh bmi bmj bmk bml bmm bmn bmo bmp bmq bmr bms bmt bmu bmv bmw bmx bmy bmz" dir="ltr">
        <p>fd_e = epoll_create1(EPOLL_CLOEXEC);</p>
        <p>tmp = dup(fd_A)<br>
          epoll_ctl(fd_e, EPOLL_CTL_ADD, tmp, ....);<br>
          dup2(fd_B, tmp);</p>
        <p>/* If this return -EEXISTS then the fd_A and fd_B are
          pointing to the same struct file */<br>
          epoll_ctl(fd_e, EPOLL_CTL_ADD, tmp, ....);</p>
        <p>close (tmp);<br>
          close (fd_e</p>
      </span></span><br>
    <blockquote type="cite" cite="mid:c0fe95949d4f41449f17add8300270b9@AcuMS.aculab.com">
      <pre class="moz-quote-pre" wrap="">
You can add both fd to the same epoll fd.
Relying on the implicit EPOLL_CTL_DEL not happening until both fd are
closed is a recipe for disaster.
(And I can't see an obvious way of testing it.)

Q6/A6 on epoll(7) should always have had a caveat that it is an
'implementation detail' and shouldn't be relied on.
(it is written as a 'beware of' ...)

The other point is that there are two ways to get multiple fd that
reference the same underlying file.
dup() fork() etc share the file offset, but open(&quot;/dev/fd/n&quot;) adds
a reference count later and has a separate file offset.</pre>
    </blockquote>
    <br>
    No it doesn't.<br>
    <br>
    Accessing /dev/fd/n or /proc/*/fd/n ideally accesses the same inode,
    but gives you a new struct file.<br>
    <br>
    dup(), fork() etc.. make you actually reference the same struct file
    inside the kernel.<br>
    <br>
    That turned out to be a rather important distinction when working
    with device drivers and DMA-buf.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:c0fe95949d4f41449f17add8300270b9@AcuMS.aculab.com">
      <pre class="moz-quote-pre" wrap="">

I don't know which structure epoll is using, but I suspect it is
the former.
So it may not tell you what you want to know.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------1ZwzVE4eoGd2lFKru0aC4Zl0--
