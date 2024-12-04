Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 853DF9E36B3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 10:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25AC10ECAE;
	Wed,  4 Dec 2024 09:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P64KiFyD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77C910EC9E;
 Wed,  4 Dec 2024 09:32:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gj9Ir+a8Dzm5PRUA1pSgnwEtof9F7aOkedvLjzQuSXFEYR0hFlzhtVC2MCkHb6bRcnMiYnbX9ov1qu+0k7hFm/UV41YG3FH8fvmfhgAKHE4PUbyjMcO1Hc9jnbcx0+X8U5zxrwfH4PfhyhTVY3ulY2QyAKi2dKGKJF822VOR56z7tw+1xVFFx46GE5q1zQpMBlNOgXiz44SREZd14jeUNk23SOA8fwCHqr+Pwj1NN29/hOoVpemg86jOeXIjJxCnTAeitGa7h3Bb98s3NO4kmAz7W6SFZBfsuHXQwqI14CjGtIXoBiouHQXe/bflBsHsJkpbTXnURYM6Zz38GmKSjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScbC+eEbubwqJmHqoB7hVvdysEjt5xwQ2QGnkHaI9lk=;
 b=UnBAF+5nUF0kWWgqQ5j2mm2+luwsAOaOV301sfmEuvaqeLqUk7WMHm9YfGZ1CuK5hJUBufFq3K3A1C3KQ7td8qbCK3UJ9+swFUD+m7EpRJujKHP5WxBGY4PHtcB7qIVRWoQWndpfmJlJbBE8p3eekEzWfckEAicMvTaFDFVHCSo0SYcj7h2CnaLrUydsGsV1MMHXPT7jMmWhiJlLIhC/BtKfLnfuxFUv3zGn3xGnOm2GGc/gVMYtrLp0uPv/WrAkh+DCPl4/rIBqgPlxboRVEEdkXWczwmjVSPg6W/Cymx5lcK1pvysBBQGO3bM8Wm/vg3AOU4Fne2nAWxC6pfC2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScbC+eEbubwqJmHqoB7hVvdysEjt5xwQ2QGnkHaI9lk=;
 b=P64KiFyDzLThLUBrVEzqE0FUBLGdeUSqNWU70ytH0ZVnrw3si66yC+kpXh1sG9NdVJE+QqACgal/uWqshmZ4GWaJVKcm4U2zw1e8CwrEcc3Bps/tZg6EBRky1BSU7yZnzUHOdFrsDnz/f8pPriF1Gj9n6qXuVhr9wWrO5Jzhx9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4161.namprd12.prod.outlook.com (2603:10b6:a03:209::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 09:32:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 09:32:39 +0000
Content-Type: multipart/alternative;
 boundary="------------CEHA7wKn6DYe3QHcciDmqXgo"
Message-ID: <bfe6a8b7-adcf-40e2-b7a2-4e64dc96862d@amd.com>
Date: Wed, 4 Dec 2024 10:32:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/virtio: Implement device_attach
To: "Zhang, Julia" <Julia.Zhang@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Erik Faye-Lund <kusmabite@gmail.com>,
 "Olsak, Marek" <Marek.Olsak@amd.com>, David Stevens <stevensd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Zhu, Lingshan" <Lingshan.Zhu@amd.com>, 
 "robdclark@chromium.org" <robdclark@chromium.org>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Chen, Jiqian" <Jiqian.Chen@amd.com>
References: <20240129103118.3258781-1-julia.zhang@amd.com>
 <ZbjZJ3qQzdOksnb2@phenom.ffwll.local> <ZbjaebswTCxmlwu0@phenom.ffwll.local>
 <97c50e01-ee33-4ac8-975c-f645c2ed49c6@amd.com>
 <IA1PR12MB653270F7FD75C1B4DF8B90E8F27C2@IA1PR12MB6532.namprd12.prod.outlook.com>
 <638e9cf4-d03f-43a9-89f9-27f63326a8df@amd.com>
 <IA1PR12MB653239AF1851273176779828F22A2@IA1PR12MB6532.namprd12.prod.outlook.com>
 <IA1PR12MB6532BBDDA6B5DC4744E38232F2372@IA1PR12MB6532.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <IA1PR12MB6532BBDDA6B5DC4744E38232F2372@IA1PR12MB6532.namprd12.prod.outlook.com>
X-ClientProxiedBy: FR4P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4161:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce9ae2c-a32b-46c4-7c90-08dd1446983c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|8096899003|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUF4M3RMb1FhQUVjY2E3QmdGUmRmZ2lLUVp4MVRwZldYOWVJZERNeUk0QUtJ?=
 =?utf-8?B?a1ZRdDJuS3Qrd0JDR3NFbVRhOHMvY0Q4L2doR1RwZ3lBcVNzWWVOMkVqbFNk?=
 =?utf-8?B?QnJRN2MyOWN6ZVFTckRvWTNCTnd4SWIvWTYzM3Qyc2Q5RVhHWTBFQ2g5L2ZX?=
 =?utf-8?B?RDBXK2loclFGNkR5RFNZQytBTGpEdm05TzBOTktPTWlwcEhtVTZaUzdFdUVV?=
 =?utf-8?B?NnNlRWFndXhRQ2YwK0RDakNlTkROY1hxOHgxNGtFY0VTMTJHTm9aWU82RVp3?=
 =?utf-8?B?Y0FxTzRQT3FOb1pibkV4L3gvcUphUzB3K3lvVDc1VnAreWpKMEFKem16S1I4?=
 =?utf-8?B?amVFeVdBQk1mYnBPODNjWXJuWXlVeUR0ekU3dlBPaFZvQkZzU1MzcFhOU2ZH?=
 =?utf-8?B?eFY2ZDhiMU1OVWFkUThwMzV2SVlkbk9aV1RoY2FOcmg2ZzMvV3RHQmlQVWdt?=
 =?utf-8?B?L0dybU9YTnIrRm9hQTNuVWFSbGI1Tk1EMk82V3NpUEoyaytFQUFmaGJnbnJS?=
 =?utf-8?B?K2NqVjAzejA2T2xBdU9ZNVhDWWkxZHdHR2JEeSttcUwyK2x6VDlzWVB5SVU5?=
 =?utf-8?B?TmZleERBd1hMZGN5ajE0QlVKRkJCdWh6WTltaTIvWWV4dkpmRENVdC9JUnBo?=
 =?utf-8?B?bGxuZFhoNmJXRXpWOENNd1RhU0pYQ1k1Z1R6QlJScDNHQVA1eTl5Z01lMytI?=
 =?utf-8?B?ZCt1aEVSUGdvU29IeWZSem9uRUtXWmc3cm5XWXg3MFNPaFdrYzQ1QXVMVG5I?=
 =?utf-8?B?Yk1FSjRyQmRXWTRCSm9qWDB3MTAyTk04N25lUVA0SU1YM3BHUjUxQ1FFQ0RZ?=
 =?utf-8?B?QWpUUCtzWTJULy9kT0MyT1RqNXkvVmVKcGhEbG84RSsyRVRxd2NQZ0gxV0Jr?=
 =?utf-8?B?ZW94SzV5MVJOanBjQW5aMnEvRm5kemN5a0U2amNnTm1iL3hiRUVkbzY2S0x1?=
 =?utf-8?B?M2toVGVOVWc4RWEvbDFKaHM1NmZyQjhDNlRpK3hlK0JUajczMk5jaENwU1Iy?=
 =?utf-8?B?aEdyYlZzVUdjTUk2S1FYcmhValpBOEVYUFllLzlUeDhMOFlrTDM5ejRHL3dN?=
 =?utf-8?B?Mjg2a2t0K0N2dkpnZGdocVJYOURsYXFuQWdLNGgyV2I5QmZnRVZBd2daZ1Aw?=
 =?utf-8?B?WEM0amhLMlgyZVBrekpDajUxZnZ2MXluNHM1SGxJOWJMQTdBd1cxZzZ0VnVD?=
 =?utf-8?B?eng1aFFFcFZlcWwwbldxUmJmM0lNdUhEU3Y2ZWw0RVRKNVpVTHU0RmJmOFRM?=
 =?utf-8?B?UTB4SXpYdGlpb0dWc0JMcFNZOVdzOVJ5QVFobzMwZWUxa3dGbEo2NTdnS0hR?=
 =?utf-8?B?c1hwU0pxN3JYRzh3TlV0ZVViVnFTWnJnb1BwRGVSMmRCZHYvTElPMkMvV3pP?=
 =?utf-8?B?NVZMSU92eVNoRzBlSkpSN1Qxb3FTL3MzVUY3WGRjNG1XTER2MVNFYWtZcHo4?=
 =?utf-8?B?amFLK0VLa2h1anBiQUZRbVd2WGpKdHZIRzl5UVpjc1ViaU43R3B4dDNjZjB5?=
 =?utf-8?B?REZEQk5TVW1hekd0eGt3QVNhU0ZMMHZuWndIR04rQ0VOTXIxL0tCbDIvb1o1?=
 =?utf-8?B?c3JHWEQ5WVFFaGNUMzJYYjdCeE9NMTk4Vk9GVGVsYzRJdEw3VXZ5S0t2TGIz?=
 =?utf-8?B?S2RrQThXb0JDZW9kMHp6cHZCWWsxck85NWw2VTBvWHNhM0V3QnhqT016WVlC?=
 =?utf-8?B?ZjBoVkVhdFpaUk1UMExWQUZrdk5POFY3WnJWQXVZVkROd0xaQXVrUXFGK00v?=
 =?utf-8?B?ajVuOG1IYXJhMnhRRVZqVk1IN0dWL3BubGpCTENFYno2clFBR0dGVzRTdkdQ?=
 =?utf-8?B?RFMrcDVVTkR2U2dwUW9HZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(8096899003)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHU4MEdlcUtsNXY1YmtpM2REeU03QTM4RmlNQVM4TGpJenZraERpTFpUdlEw?=
 =?utf-8?B?cmtObFNsK09iVGhjYXM4NFRuVHRyTEtCZnRGRklaYnZ0S2Z5V2pqUTNlZjk1?=
 =?utf-8?B?dTl0dFFRODYvdEVlY0ttQ2FldTR6ZmZhdk5WNllEdXpvQk5xeWVDVVJQajF6?=
 =?utf-8?B?aFVEQTRKN3pTTXExR2VEWlY1R0dMakZxQU9obXdOZWQ5em15NTFFeDhjcnBo?=
 =?utf-8?B?VTZTVlhGRjh5dDFvenhpK3Y0d3VtNHd3ZnV0VjYyTVgyVW1EWnJLRGpTVG9O?=
 =?utf-8?B?MzlGcXpPT29Vc2V6TGxhRmhHMW56Z0RlVEN2MnNteTVnV2lMaS80ckltQWJy?=
 =?utf-8?B?eWxLZnpPZWNqSHV0ejZHKzJnRFNicTFYbENsd3JpbFVTc3ZsN3lDeUd5VEd1?=
 =?utf-8?B?Y1BIVnRFMnlIdGUwd0tUU1ZmMDNGSG5QNXlzRWlXRXh6Q0lEVitqSURsTjdN?=
 =?utf-8?B?OHVncFp0Njl2T2tkeU1CelU0QWkvbTZnTU1aTXRCOUdVN0g3eFNXbDdvb0tU?=
 =?utf-8?B?V0xoUlFiU2lIc2JiVjlVUkZFNElkai9CaW1ERHZ0UHlYRTJrS3JmOXlWb3NJ?=
 =?utf-8?B?WW90NzFKbkpxT25HTWJQaVVWZlFwSEdUazdBTkk3ZC80bmVxcUZwaFl2aVFZ?=
 =?utf-8?B?U1Q1Y1VPR1dIQTFZSXZ2T21uSzdKS2tmc1dySklaektWUHk0d2dqcnRRb0N5?=
 =?utf-8?B?TWZ2UW5IcDNWZ0dLV2NESWhITDVmYThZN21QV2VOM3dUNlBGWGlEUDdHUXgv?=
 =?utf-8?B?UlE3OWVRRE1kUjBiZWdsWW82dXA2ZE1nL1J5MnNNTXBiQU9Ca3BvOXpGb1NL?=
 =?utf-8?B?UWhCcGNZVlRkSno1SnZmY3YxbUxLSERIaFJpUlJTV2Y4am9YSG5mQ2ZsWitL?=
 =?utf-8?B?eWFUZmE2YWFUNDhtY0l2YkM1elgvSTA2ZC85WnMrcGxIR0FCU0tTZ2tucnBH?=
 =?utf-8?B?QWFBYWlKSjN3bkgvUFRKcytWZEc5WGRqSkZPSEg0LzFSOFlvVG5xUVhrOTl4?=
 =?utf-8?B?dDBMaGhYWDFlV2VsRkoxZ0NNcGFnWiszVmtoQ29zeHozaXVhNW5QQTZXZnFS?=
 =?utf-8?B?TU9SczJKU0hKNmxpemhtUjkzZlRGbjVialZ3MVAweDdER2ZoZHVzQ2F6UUZT?=
 =?utf-8?B?SW0xMXppbEMzUEZST09HSkQrK1ZaSW1qNEFIZU00c3BWOFVmOG44c05RZisx?=
 =?utf-8?B?WU43MkZvRm85aFRQaDN2N3dpa3o4L2Y3Ukk1WUlqV3FTZW5UWmRyT0lWTEhI?=
 =?utf-8?B?T0hadDZwNDZjSmpUZk1LWEovZVA1NE91eE8zMnpSWE1tblBRSmtoTnJmdVpD?=
 =?utf-8?B?NVp1ajBNS2hFTjdqN1hLcjMvb2poSlRmbnBpZU16aFlGN3ZTUXpDbWl5TzRX?=
 =?utf-8?B?Y3lmcjB2TThKSmNVUzZzaWs4bk5RdGxaUUZLdDJ0dEs4Zm1BRkdaNk9ZbXpK?=
 =?utf-8?B?ZjRFaGFTa1RvYXpQdHV5KzBBZXMyTW1RMjhsVG1sek1BcFVnMndSM2xnQnAy?=
 =?utf-8?B?SUgvVy9kak92RFhSZi9VUFFMMXJ3bUR1NUxSajEzQ3d5L016eTNNZHdySXFo?=
 =?utf-8?B?VW03Mnc5Y29uQjdKeFBnSFIzR01aNFFCNW16cmtqV0RiNk8rai9Qc1RDY1dy?=
 =?utf-8?B?OFNXbXdkTkhJNFNHa21qeXl4L29ENjlydEtkNDF1SjV4amhnVjkwbGlYMHJQ?=
 =?utf-8?B?TE1relNHRmJhRmh5TVNoQ3JHQzRBQlhYMTNPNEFnSS8xblFpM3EybGhDZHRp?=
 =?utf-8?B?SEdLa3dRNnVQRzY4NFhGN0EvTjhKSzd6ZnNOdkhvQ0o1bE9uQlViRFRzUVF3?=
 =?utf-8?B?TEhNSkZqNGlZR25uVFJHbGZIV0xyY3BhdWExOG4zQ1NsMG54OFN1QXhudjFJ?=
 =?utf-8?B?Z1BISWJQdnE1NHl3MWdJNm1HUXRFWDE2WWZ3WWdteUVURGM1QnZxQmlOOGpG?=
 =?utf-8?B?K2d0Q01Dc1Z2bzF6OE01WW9JblRUTk5MUWpEQStUdkxmaFlOaEVwd1NUZGhk?=
 =?utf-8?B?RzcwbzhMdlN3YTVCNXc0d2cvMlJMdndLWVVsd29KT1FHUDB4aUR1YStDVmJK?=
 =?utf-8?B?K3dpYkFHMFR6aHRSWW51ME9kRWYxVkpHQ09MYllEcUg3V1gxc0YvblFkS2Rq?=
 =?utf-8?Q?7yh9lLQ8SZLR7xHYsqlNFg8TY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce9ae2c-a32b-46c4-7c90-08dd1446983c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 09:32:39.3474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUhDlyUM2Xmsc8rG4/AQdpW5DEFXhL36uIYcui1mhGwcDzuVLS+RH0QhEasUiNms
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4161
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

--------------CEHA7wKn6DYe3QHcciDmqXgo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Julia,

sorry I totally missed your mail.

The basic problem for P2P is what I already described in my previous mail:

> Well the problem is the virtualized environment. pci_p2pdma_distance() 
> checks if two physical PCI devices can communicate with each other 
> (and returns how many hops are in between).
>
> But inside a VM you don't see the physical devices, you can only see 
> passed through devices plus your virtual device and a bunch of virtual 
> bridges.
>
> So what pci_p2pdma_distance() returns inside the VM is actually 
> completely meaningless. It can be that P2P works, but it can also be 
> P2P doesn't work because on the physical system you have a bridge, 
> root complex or whatever which is blacklisted and won't work for some 
> reason.

So the basic problem is that you can't figure out inside the VM if P2P 
is possible or not.

As long as you don't fix this it's irrelevant if you have get_sg_table 
implemented or not, you first need to figure out the basic and not try 
to implement some detail.

Regards,
Christian.

Am 04.12.24 um 04:46 schrieb Zhang, Julia:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
>
> Hi Sima, Christian,
>
> I would like to rediscuss about p2p in guest VM, can you please take a 
> look. Thanks.
>
> Best regards,
>
> Julia
>
> *From:*Zhang, Julia <Julia.Zhang@amd.com>
> *Sent:* Friday, November 29, 2024 3:52 PM
> *To:* Koenig, Christian <Christian.Koenig@amd.com>; Zhang, Julia 
> <Julia.Zhang@amd.com>; Gurchetan Singh <gurchetansingh@chromium.org>; 
> Chia-I Wu <olvaffe@gmail.com>; David Airlie <airlied@redhat.com>; Gerd 
> Hoffmann <kraxel@redhat.com>; linux-kernel@vger.kernel.org; 
> dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; 
> virtualization@lists.linux-foundation.org; Deucher, Alexander 
> <Alexander.Deucher@amd.com>; David Airlie <airlied@gmail.com>; Erik 
> Faye-Lund <kusmabite@gmail.com>; Olsak, Marek <Marek.Olsak@amd.com>; 
> Pelloux-Prayer, Pierre-Eric <Pierre-eric.Pelloux-prayer@amd.com>; 
> Huang, Honglei1 <Honglei1.Huang@amd.com>; Chen, Jiqian 
> <Jiqian.Chen@amd.com>; Huang, Ray <Ray.Huang@amd.com>; David Stevens 
> <stevensd@chromium.org>
> *Cc:* Huang, Ray <Ray.Huang@amd.com>; Zhu, Lingshan 
> <Lingshan.Zhu@amd.com>; robdclark@chromium.org
> *Subject:* Re: [PATCH v2 1/1] drm/virtio: Implement device_attach
>
> Hi all,
>
> Sorry for my late reply. I don't know if you still remember this 
> thread, let me give a quick summary:
>
>  1. We want to implement the dGPU prime feature in guest VM. But we
>     encountered this issue: virtio-gpu doesn’t have ->get_sg_table
>     implemented which is required by drm_gem_map_attach(). This is
>     modified by: 207395da5a97 (“drm/prime: reject DMA-BUF attach when
>     get_sg_table is missing”).
>  2. To fix this, I override the function virtgpu_gem_device_attach()
>     to not call drm_gem_map_attach() for vram object so
>     drm_gem_map_attach() will not return -ENOSYS for not having
>     ->get_sg_table.
>  3. Then you think this is incorrect and drm_gem_map_attach() requires
>     get_sg_table to be implemented is intentional. I should either
>     implement ->attach or ->get_sg_table for virtio-gpu.
>  4. As discussed, I implemented ->attach for virtio-gpu, but you
>     suggested that I should check peer2peer flag first.
>  5. Now I have the implementation to get p2p_distance and check the
>     p2p flag already, but I found that Rob Clark merged a patch to fix
>     above patch: 207395da5a97 (“drm/prime: reject DMA-BUF attach when
>     get_sg_table is missing”)
>      1. Rob’s patch: https://patchwork.freedesktop.org/patch/584318/
>  6. With Rob’s patch, ->get_sg_table isn’t required for virtio-gpu
>     anymore and  it seems p2p flag also doesn’t need to be checked
>     anymore.
>
> So I want to rediscuss if we still need to do p2p checking now?
>
> If so, I will send out my implementation soon.
>
> Best regards,
>
> Julia
>
> On 2024/1/31 22:32, Christian König wrote:
>
>     Am 31.01.24 um 11:20 schrieb Zhang, Julia:
>
>         On 2024/1/30 22:23, Christian König wrote:
>
>             Am 30.01.24 um 12:16 schrieb Daniel Vetter:
>
>                 On Tue, Jan 30, 2024 at 12:10:31PM +0100, Daniel Vetter wrote:
>
>                     [SNIP]
>
>         Hi Sima, Christian,
>
>             Yeah, that is really just speculative. All importers need to set the peer2peer flag just in case.
>
>         I see, I will modify this.
>
>             What happens under the hood is that IOMMU redirects the "VRAM" memory access to whatever address the DMA-buf on the host is pointing to (system, VRAM, doorbell, IOMMU, whatever).
>
>             I'm also not 100% sure if all the cache snooping is done correctly in all cases, but for now it seems to work.
>
>                     Frankly the more I look at the original patch that added vram export
>
>                     support the more this just looks like a "pls revert, this is just too
>
>                     broken".
>
>                 The commit I mean is this one: ea5ea3d8a117 ("drm/virtio: support mapping
>
>                 exported vram"). The commit message definitely needs to cite that one, and
>
>                 also needs a cc: stable because not rejecting invalid imports is a pretty
>
>                 big deal.
>
>             Yeah, I've pointed out that commit in an internal discussion as well. I was just not aware that it's that severely broken.
>
>         Yeah we have mentioned this patch before, but I don't totally understand why this is too broken. Without exporting vram objects, dGPU prime feature would not be realized.
>
>         Would you mind to explain more about it. Thanks!
>
>
>     One reason is that using sg tables without struct pages is
>     actually a hack we came up with because we couldn't hope to clean
>     up the sg table structure any time soon to not include struct page
>     pointers.
>
>     Another reason is that using this with devices which don't expect
>     a DMA address pointing into a virtual PCI BAR. So doing this
>     without checking the peer2peer flag can most likely cause quite a
>     bit of trouble.
>
>     Regards,
>     Christian.
>
>         Best regards,
>
>         Julia
>
>             Regards,
>
>             Christian.
>

--------------CEHA7wKn6DYe3QHcciDmqXgo
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Julia,<br>
    <br>
    sorry I totally missed your mail.<br>
    <br>
    The basic problem for P2P is what I already described in my previous
    mail:<br>
    <br>
    <blockquote type="cite">Well the problem is the virtualized
      environment. pci_p2pdma_distance() checks if two physical PCI
      devices can communicate with each other (and returns how many hops
      are in between).
      <br>
      <br>
      But inside a VM you don't see the physical devices, you can only
      see passed through devices plus your virtual device and a bunch of
      virtual bridges.
      <br>
      <br>
      So what pci_p2pdma_distance() returns inside the VM is actually
      completely meaningless. It can be that P2P works, but it can also
      be P2P doesn't work because on the physical system you have a
      bridge, root complex or whatever which is blacklisted and won't
      work for some reason.
      <br>
    </blockquote>
    <br>
    So the basic problem is that you can't figure out inside the VM if
    P2P is possible or not.<br>
    <br>
    As long as you don't fix this it's irrelevant if you have
    get_sg_table implemented or not, you first need to figure out the
    basic and not try to implement some detail.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 04.12.24 um 04:46 schrieb Zhang,
      Julia:<br>
    </div>
    <blockquote type="cite" cite="mid:IA1PR12MB6532BBDDA6B5DC4744E38232F2372@IA1PR12MB6532.namprd12.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Aptos;}@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	font-size:10.0pt;
	font-family:"Courier New";}span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:"Arial",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}ol
	{margin-bottom:0in;}ul
	{margin-bottom:0in;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <p style="font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;font-style:normal;font-weight:normal;text-decoration:none;" align="Left">
        [AMD Official Use Only - AMD Internal Distribution Only]<br>
      </p>
      <br>
      <div>
        <div class="WordSection1">
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif">Hi
              Sima, Christian,<o:p></o:p></span></p>
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif">I
              would like to rediscuss about p2p in guest VM, can you
              please take a look. Thanks.<o:p></o:p></span></p>
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif">Best
              regards,<o:p></o:p></span></p>
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif">Julia<o:p></o:p></span></p>
          <p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
          <div>
            <div style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in 0in 0in">
              <p class="MsoNormal"><b><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
                  Zhang, Julia <a class="moz-txt-link-rfc2396E" href="mailto:Julia.Zhang@amd.com">&lt;Julia.Zhang@amd.com&gt;</a>
                  <br>
                  <b>Sent:</b> Friday, November 29, 2024 3:52 PM<br>
                  <b>To:</b> Koenig, Christian
                  <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>; Zhang, Julia
                  <a class="moz-txt-link-rfc2396E" href="mailto:Julia.Zhang@amd.com">&lt;Julia.Zhang@amd.com&gt;</a>; Gurchetan Singh
                  <a class="moz-txt-link-rfc2396E" href="mailto:gurchetansingh@chromium.org">&lt;gurchetansingh@chromium.org&gt;</a>; Chia-I Wu
                  <a class="moz-txt-link-rfc2396E" href="mailto:olvaffe@gmail.com">&lt;olvaffe@gmail.com&gt;</a>; David Airlie
                  <a class="moz-txt-link-rfc2396E" href="mailto:airlied@redhat.com">&lt;airlied@redhat.com&gt;</a>; Gerd Hoffmann
                  <a class="moz-txt-link-rfc2396E" href="mailto:kraxel@redhat.com">&lt;kraxel@redhat.com&gt;</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:linux-kernel@vger.kernel.org">linux-kernel@vger.kernel.org</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:virtualization@lists.linux-foundation.org">virtualization@lists.linux-foundation.org</a>; Deucher,
                  Alexander <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a>; David
                  Airlie <a class="moz-txt-link-rfc2396E" href="mailto:airlied@gmail.com">&lt;airlied@gmail.com&gt;</a>; Erik Faye-Lund
                  <a class="moz-txt-link-rfc2396E" href="mailto:kusmabite@gmail.com">&lt;kusmabite@gmail.com&gt;</a>; Olsak, Marek
                  <a class="moz-txt-link-rfc2396E" href="mailto:Marek.Olsak@amd.com">&lt;Marek.Olsak@amd.com&gt;</a>; Pelloux-Prayer,
                  Pierre-Eric
                  <a class="moz-txt-link-rfc2396E" href="mailto:Pierre-eric.Pelloux-prayer@amd.com">&lt;Pierre-eric.Pelloux-prayer@amd.com&gt;</a>; Huang,
                  Honglei1 <a class="moz-txt-link-rfc2396E" href="mailto:Honglei1.Huang@amd.com">&lt;Honglei1.Huang@amd.com&gt;</a>; Chen, Jiqian
                  <a class="moz-txt-link-rfc2396E" href="mailto:Jiqian.Chen@amd.com">&lt;Jiqian.Chen@amd.com&gt;</a>; Huang, Ray
                  <a class="moz-txt-link-rfc2396E" href="mailto:Ray.Huang@amd.com">&lt;Ray.Huang@amd.com&gt;</a>; David Stevens
                  <a class="moz-txt-link-rfc2396E" href="mailto:stevensd@chromium.org">&lt;stevensd@chromium.org&gt;</a><br>
                  <b>Cc:</b> Huang, Ray <a class="moz-txt-link-rfc2396E" href="mailto:Ray.Huang@amd.com">&lt;Ray.Huang@amd.com&gt;</a>; Zhu,
                  Lingshan <a class="moz-txt-link-rfc2396E" href="mailto:Lingshan.Zhu@amd.com">&lt;Lingshan.Zhu@amd.com&gt;</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:robdclark@chromium.org">robdclark@chromium.org</a><br>
                  <b>Subject:</b> Re: [PATCH v2 1/1] drm/virtio:
                  Implement device_attach<o:p></o:p></span></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p>Hi all,<o:p></o:p></p>
          <p>Sorry for my late reply. I don't know if you still remember
            this thread, let me give a quick summary:<o:p></o:p></p>
          <ol type="1" start="1">
            <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;mso-list:l1 level1 lfo3">
              We want to implement the dGPU prime feature in guest VM.
              But we encountered this issue: virtio-gpu doesn’t have
              -&gt;get_sg_table implemented which is required by
              drm_gem_map_attach(). This is modified by: 207395da5a97
              (“drm/prime: reject DMA-BUF attach when get_sg_table is
              missing”).<o:p></o:p></li>
            <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;mso-list:l1 level1 lfo3">
              To fix this, I override the function
              virtgpu_gem_device_attach() to not call
              drm_gem_map_attach() for vram object so
              drm_gem_map_attach() will not return -ENOSYS for not
              having -&gt;get_sg_table.<o:p></o:p></li>
            <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;mso-list:l1 level1 lfo3">
              Then you think this is incorrect and drm_gem_map_attach()
              requires get_sg_table to be implemented is intentional. I
              should either implement -&gt;attach or -&gt;get_sg_table
              for virtio-gpu.<o:p></o:p></li>
            <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;mso-list:l1 level1 lfo3">
              As discussed, I implemented -&gt;attach for virtio-gpu,
              but you suggested that I should check peer2peer flag
              first.<o:p></o:p></li>
            <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;mso-list:l1 level1 lfo3">
              Now I have the implementation to get p2p_distance and
              check the p2p flag already, but I found that Rob Clark
              merged a patch to fix above patch: 207395da5a97
              (“drm/prime: reject DMA-BUF attach when get_sg_table is
              missing”)<o:p></o:p></li>
            <ol type="a" start="1">
              <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;mso-list:l1 level2 lfo3">
                Rob’s patch: <a href="https://patchwork.freedesktop.org/patch/584318/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/patch/584318/</a><o:p></o:p></li>
            </ol>
            <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;mso-list:l1 level1 lfo3">
              With Rob’s patch, -&gt;get_sg_table isn’t required for
              virtio-gpu anymore and &nbsp;it seems p2p flag also doesn’t
              need to be checked anymore.<o:p></o:p></li>
          </ol>
          <p>So I want to rediscuss if we still need to do p2p checking
            now? <o:p></o:p></p>
          <p>If so, I will send out my implementation soon.<o:p></o:p></p>
          <p>Best regards,<o:p></o:p></p>
          <p>Julia<o:p></o:p></p>
          <p><o:p>&nbsp;</o:p></p>
          <div>
            <p class="MsoNormal">On 2024/1/31 22:32, Christian König
              wrote:<o:p></o:p></p>
          </div>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <p class="MsoNormal" style="margin-bottom:12.0pt">Am
              31.01.24 um 11:20 schrieb Zhang, Julia:<o:p></o:p></p>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre>On 2024/1/30 22:23, Christian König wrote:<o:p></o:p></pre>
              <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                <pre>Am 30.01.24 um 12:16 schrieb Daniel Vetter:<o:p></o:p></pre>
                <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                  <pre>On Tue, Jan 30, 2024 at 12:10:31PM +0100, Daniel Vetter wrote:<o:p></o:p></pre>
                  <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                    <p class="MsoNormal">[SNIP] <o:p></o:p></p>
                  </blockquote>
                </blockquote>
              </blockquote>
              <pre>Hi Sima, Christian,<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                <pre>Yeah, that is really just speculative. All importers need to set the peer2peer flag just in case.<o:p></o:p></pre>
              </blockquote>
              <pre>I see, I will modify this.<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                <pre>What happens under the hood is that IOMMU redirects the &quot;VRAM&quot; memory access to whatever address the DMA-buf on the host is pointing to (system, VRAM, doorbell, IOMMU, whatever).<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>I'm also not 100% sure if all the cache snooping is done correctly in all cases, but for now it seems to work.<o:p></o:p></pre>
                <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                  <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                    <pre>Frankly the more I look at the original patch that added vram export<o:p></o:p></pre>
                    <pre>support the more this just looks like a &quot;pls revert, this is just too<o:p></o:p></pre>
                    <pre>broken&quot;.<o:p></o:p></pre>
                  </blockquote>
                  <pre>The commit I mean is this one: ea5ea3d8a117 (&quot;drm/virtio: support mapping<o:p></o:p></pre>
                  <pre>exported vram&quot;). The commit message definitely needs to cite that one, and<o:p></o:p></pre>
                  <pre>also needs a cc: stable because not rejecting invalid imports is a pretty<o:p></o:p></pre>
                  <pre>big deal.<o:p></o:p></pre>
                </blockquote>
                <pre>Yeah, I've pointed out that commit in an internal discussion as well. I was just not aware that it's that severely broken.<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
              </blockquote>
              <pre>Yeah we have mentioned this patch before, but I don't totally understand why this is too broken. Without exporting vram objects, dGPU prime feature would not be realized.<o:p></o:p></pre>
              <pre>Would you mind to explain more about it. Thanks!<o:p></o:p></pre>
            </blockquote>
            <p class="MsoNormal" style="margin-bottom:12.0pt"><br>
              One reason is that using sg tables without struct pages is
              actually a hack we came up with because we couldn't hope
              to clean up the sg table structure any time soon to not
              include struct page pointers.<br>
              <br>
              Another reason is that using this with devices which don't
              expect a DMA address pointing into a virtual PCI BAR. So
              doing this without checking the peer2peer flag can most
              likely cause quite a bit of trouble.<br>
              <br>
              Regards,<br>
              Christian.<br>
              <br>
              <o:p></o:p></p>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre>Best regards,<o:p></o:p></pre>
              <pre>Julia<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                <pre>Regards,<o:p></o:p></pre>
                <pre>Christian.<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------CEHA7wKn6DYe3QHcciDmqXgo--
