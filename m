Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEF148A3E0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 00:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC7110E430;
	Mon, 10 Jan 2022 23:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2069.outbound.protection.outlook.com [40.107.96.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7768B10E430;
 Mon, 10 Jan 2022 23:46:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5Ots1zfBsOnkGAiAyhcz89IGFRtBqO6d6sIbGKYtxnyifed1HStBCa1rmoLEcCrP4ofPsTlEM+f4bLcQX9UNoNqiAIr1nm1NhXh4M5T1LEpT71/SfZ7RUr1pkCfLIuKxdQZQ/30YCjtDipGYWscxsm7/7n+H62EJvEki5MPwb+RTO3tRF7qT9Jhoofmdpgg93djkarXYEp8ePaz40GyDuJdj50XSY6w/zSnBQWu3gFFJQTD20ajE5yhVS0RKDyo0qIdUWmLoWjFdalNbqrOZ3rzh7ax7jDvbpTgAKBKccYNb4JnyBWFkqR+up3I81bjlbXWflipfp9n7cHdwaQeCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbl2dHxda5Sc89ymFLkzGOzpciUGQ+SaAfW/heUc8rU=;
 b=i22RG2dVs63QUyU5/MXTg8U3tESgUvCFxeMIgDlK+HfGJj18Iv0AjjSV6sNcw4b3coXQFZBqNlP2PAhy75bniG0qOgPeh1NWoliRtqx1T7CtUCwma73DgsKBFmQPhZZ0pZozsIHZZriLTERLUp0nSdUSmJpT2GASdUNigCzqvCckOBmXCC2XsV0KRHzktbsuFJF0hLDmBOUJp8tYDLcAajg0f1VoDRhd+xq+3tyRcwCQXouAjAdwQOywPABPAXoKQojtsOiNMgQM00djLEfWh5b1PpEGI5YnoiVXkYgNuFshplZyos4Am932imjIsk+cQ7a8Bz0ZgyBXMjBXx2LOYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbl2dHxda5Sc89ymFLkzGOzpciUGQ+SaAfW/heUc8rU=;
 b=UbD3lbxa1H4+1JUonTWNah0CzQepSRpmWQMn0aVMJAH750v2WEKgjXev1WCjukerPf93ZhD3b3xPEghLp30556frqpaplJvJN2rB0UskwqpTaDurnwHowaN0TCXIWSq6DL0dy5HWoQ4LsTFuQ/6LLYGePJBILftXYMk08oWKHk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5292.namprd12.prod.outlook.com (2603:10b6:408:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 23:46:54 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 23:46:54 +0000
Subject: Re: [PATCH 1/1] Add test for hsaKmtAvailableMemory available memory
 inquiry
To: Daniel Phillips <daniel.phillips@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20220110214822.3175297-1-daniel.phillips@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <8c93c26b-df12-6c73-5f52-5ff717bb61da@amd.com>
Date: Mon, 10 Jan 2022 18:46:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220110214822.3175297-1-daniel.phillips@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BL0PR02CA0107.namprd02.prod.outlook.com
 (2603:10b6:208:51::48) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f635f1e1-045d-4934-8793-08d9d4937ac9
X-MS-TrafficTypeDiagnostic: BN9PR12MB5292:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB529221EB4C4A66A2AE4D2EFA92509@BN9PR12MB5292.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SkXHO8Jd1mRGEzJAhoguiRh5NvcQsiNPqO+946BPRB08eiTZKudwITmN0ArCpDz/CAPKsR6guKT4+96zsWoN29AJVEvNfDw1cFJxcX+5svzskoOQYMVY6P/4ZRZlhTVElRy7XfC9XMhDImwh0RtrdlTB8FqnmJ0bgpNzKi8HgY++Qim/sLwubeeRIOj8Yu+3SUUH5NR+lwu1CJOAyOS1+PYVplTUe3L/0uzjm5kKEneva4Lun2pp5KXFe22AfGbOoVv1IPpv9K5WjH8UA/Re2srC6BzkWBj1mcMmqkupD8OSY1GUJpR6cwc5kigMw5xjJcYYQxU7O/OOynURe+Hev5Q9VbeRklmY6hjRRq457Qa6bl4zct/UEPR5vIiQlH4OoLww6g5BA9doSSGY0sqVxt95WEwzDHX/bLKWyliIjTf+o/zdutirvNwLJoogbylkLEkSas7XIv1o8kAavq4RKCvXLw4Egjcw+gQjB6U6HRxvH0Ojc5oeix2oOzxO0UK/hwMFVKODJprRjRfogzUvddcGKzMDue6Uv5ojGUQau+unDeOwO72/n1U8C/Xv0kzTtiyH64Rt+JRQMSXQmx/J6DihLWGEQ2A+GrLQSwvQfFezwXrlyMlggVeLV/4NXeA/Nk9SW5JPNgQQx9Q7FVnO39BJ4b7hhIMYwh2CPod3RtWiMXZGijEqR1wWjQnNLIH5GAwljoMxD1dgt9wmvDWmDZH2lYc95at/Oqq1v0YT2GJ1n9bBiJxg1GdpO8k64J16K7quZ37ed8EVPyxY2vlRk3GUIdPb9hz+fjy1mJ5dBQM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(2906002)(44832011)(2616005)(66476007)(53546011)(86362001)(66556008)(19627235002)(26005)(316002)(6512007)(83380400001)(6486002)(186003)(5660300002)(38100700002)(66946007)(36756003)(31686004)(31696002)(8936002)(36916002)(450100002)(6506007)(508600001)(131093003)(145543001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajMwVUJRdVpONFU2RlpIT3dnMllIdXF6aHZkRXJqSjdpUnlMQkN3cHMrbEpC?=
 =?utf-8?B?NEF3NWlwT2VwRTVROGVjOC80NUxOZ1BMcFVqTTlzUGF4SUJLbXdPa2xJSjBC?=
 =?utf-8?B?RmxLb2FJekRhWjdTZVEyTmYwL1dVLytVWkpkQW42QTZoRDFvTjcyelBTN1o5?=
 =?utf-8?B?QU1WYktLb0hmYUNzVkRlRmZQT3RFWGNsaHQ4ZkVMeFl0ZW5YY2tzWCtrdGt4?=
 =?utf-8?B?dWg5ZTFiZjl3YjYzSFZwWEI2SlhwcUNsbVpRekJaWnQ3YXdHYlVqNnd5ejhz?=
 =?utf-8?B?ajRBUFlsc3ExTHdoZHJzMC9DQmhUM0ZiWUhSVTViS2Q1bFExaU0zdmlscUNZ?=
 =?utf-8?B?WVZKem1DVFU0TmdsMkVQMkM3dzkwNVltWHczb1NDcUFsT1VUcGJjYUR0RWx0?=
 =?utf-8?B?bDh0YXVjZGJ3OGpDbG04K0VjOXFzTElybXFablk2MmM1aFlzTTNQQVVvd0RL?=
 =?utf-8?B?SjVVbUJBS1pXYzl2ZlNvSFRJSUE0SDlKMGxQSyt3NU51UHJUTE5tc2ZBeFI5?=
 =?utf-8?B?enJpTklyYnNvTEk2ZGVXQXpWYU02UDFWb2J6cjJoQlVhWVhkT0VKVC9NMVB6?=
 =?utf-8?B?eVRxVnRTa25nb2hOSXN0R3ErSUNDZnJ5b2d6ckVhcUZaZm4xOS9jNFZqcDJ2?=
 =?utf-8?B?NlVBN3ZaaUhvbkVoaEsrY2xkMWtyTko4ZXdnSE5BWGVwNmwvTmdQR3IxMVQy?=
 =?utf-8?B?YmpYUUdhd2Q1WURKeFpJV3l6ZE9RYzJFR085eUdudThlYUY3VlRSZ3FjckEr?=
 =?utf-8?B?L1ZXZjBRdlFPRmxTSGtBRXFkTjNNR3JXajZWejUwKzc1alJwODRoS3E5dC8w?=
 =?utf-8?B?NlY3Umxrb2p4RkVPekkzYll0dy9hamliazVoM0R0cjIrejRTb3JNamQwd2RM?=
 =?utf-8?B?SkxSSkpGckdSWW45cDZsZGR4bVFwaUxnNGtsUlF5MkRraUhmcWRkWXpRSFRY?=
 =?utf-8?B?MzNaV1kyZXMwVW5WTVA1bzMraEhHMTI5aDJMN282MGptaFRjdXVpbjNxdTVp?=
 =?utf-8?B?WG5KWDhWMCtNYkpXWTFpL1RSTFF4QWpsY2hibDgvUkxneDNnSkJXZ2kxZ1ZD?=
 =?utf-8?B?NE85NU5TNHVzOVJMZUNYSGFLbGpYRVFXMmhUZWNvUkhJUWUrNDFzcS9QK1BG?=
 =?utf-8?B?TW5JUWFxbWRlekJSN0NwR215Y0NRYzVVSHlQczRWQUhWRlN6M25ZakEwR2cx?=
 =?utf-8?B?amg4c3h1elpkWDVNK0gxVnpWZVR3eW5MWnVWbHlPNW1MQ2NuMThRUmlNZXY4?=
 =?utf-8?B?emRmeHpCc3ZxWFdDNC9zOWxacE4vdHhXU0lOUFJxQTNXL0I3NDJrYUY2U1Ir?=
 =?utf-8?B?a0pzT2J5QWdRWDVGMER0bW05a1VLSzNNcFFLRERRcmFSU0ltMG43MEJPdngx?=
 =?utf-8?B?ZEhqeWQ4QkY5UXphVlhwbCt3R011WThQS3YrU2hjcnNMSURtaVN3Tjh0YW1B?=
 =?utf-8?B?VjBncjJNQUxxaDRHNTdFdU5Da1hreTRNMzNWdE5DYWZCajliQ1llZS8zZTI5?=
 =?utf-8?B?dW5ycUFvU1l6RC8rMUhYUkZZRkFmUXoreDdmNmFTbTg3MEd4MWV1cy9kWFZI?=
 =?utf-8?B?TzllaVNHN1lXUi9mVnl1S20zY2pORGhwb0dMQ0xwTFJseEIwLzZEd0tERGhS?=
 =?utf-8?B?Y0QxaTczOEFxSVJiVURUd21rN1R2TnhSUGF5NlJOeXNmdVk0RDRYV0VQWnN4?=
 =?utf-8?B?NmtlTHdxVHRzU0cwYVd4WDUwZGUwS0JhVkpnVTd5S3RXU09wWHZ5emZKR2ZB?=
 =?utf-8?B?MFlwUFd2RGNIWHp0bjN4ZXFBRldHZExSc1d6SnVaS0JpOGE0bzR3Mk5QQUJL?=
 =?utf-8?B?WFRjbHNaRFd6S2ovVDdtMnp1SlFlTFZRSWF1bUU1cFVENU4zLzk5UHNRcGlw?=
 =?utf-8?B?TkI2djNlMm81TUQ2UXpYOUd3ZGNVWjhhc1pRVHM2cm1KalBKTHQvK3lmcWJq?=
 =?utf-8?B?VkcyQ1lYa1hGVkRhdEdlaUVyQ25vNktmc2M2aVZsbFhHVjlaZWlNcjNadUpH?=
 =?utf-8?B?S3hHS2RDS0RDbzViQW9CeE1BOENjRFZoNmp6MFdvK29GRkNnSUlxa29tNE5W?=
 =?utf-8?B?cnd0dHRab1E3a3ZTNTZNb2RQZmxhM2w1d3o5WjZOMnJGcFE0SFljcGZNRGY4?=
 =?utf-8?B?OTdsUWVidXcyVWtMM1NGUDJET0o2dnF0c0gvRHUra3F0Zjd5S1NEWVhkWlZ1?=
 =?utf-8?Q?Enp6w3rPgRqWIvcdnMgVJ3w=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f635f1e1-045d-4934-8793-08d9d4937ac9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 23:46:54.0436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXn0ISfTqbaskTRUHRNDMLsOcuEA5/CfNES4rJLd5f+DtAQCe2GZHVOVgdf25dRUh3N9SfWEVLH0KKfmnpA+fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5292
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

On 2022-01-10 4:48 p.m., Daniel Phillips wrote:
> Basic test for the new hsaKmtAvailableMemory library call. This is
> a standalone test, does not modify any of the other tests just to
> be on the safe side. More elaborate tests coming soon.
>
> Change-Id: I738600d4b74cc5dba6b857e4c793f6b14b7d2283
> Signed-off-by: Daniel Phillips <daniel.phillips@amd.com>
> ---
>   tests/kfdtest/src/KFDMemoryTest.cpp | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/tests/kfdtest/src/KFDMemoryTest.cpp b/tests/kfdtest/src/KFDMemoryTest.cpp
> index 9f62727..1f93928 100644
> --- a/tests/kfdtest/src/KFDMemoryTest.cpp
> +++ b/tests/kfdtest/src/KFDMemoryTest.cpp
> @@ -595,6 +595,23 @@ TEST_F(KFDMemoryTest, MemoryAlloc) {
>       TEST_END
>   }
>   
> +// Basic test for hsaKmtAllocMemory
> +TEST_F(KFDMemoryTest, MemoryAllocAll) {
> +    TEST_START(TESTPROFILE_RUNALL)
> +
> +    unsigned int* pBig = NULL;
> +    unsigned int* pSmall = NULL;
> +    m_MemoryFlags.ui32.NoNUMABind = 1;
> +    HSAuint64 available;
> +    EXPECT_SUCCESS(hsaKmtAvailableMemory(0 /* system */, &available));
I don't think you've even implemented this API for system memory. The 
system memory node doesn't have a valid GPUID, so the ioctl will fail.

I'd expect this test to work only for VRAM.


> +    EXPECT_SUCCESS(hsaKmtAllocMemory(0 /* system */, available, m_MemoryFlags, reinterpret_cast<void**>(&pBig)));
> +    EXPECT_NE(HSAKMT_STATUS_SUCCESS, hsaKmtAllocMemory(0 /* system */, PAGE_SIZE, m_MemoryFlags, reinterpret_cast<void**>(&pSmall)));
> +    EXPECT_SUCCESS(hsaKmtFreeMemory(pBig, available));
> +    EXPECT_SUCCESS(hsaKmtAllocMemory(0 /* system */, PAGE_SIZE, m_MemoryFlags, reinterpret_cast<void**>(&pSmall)));

You're leaking pSmall here.

Regards,
   Felix


> +
> +    TEST_END
> +}
> +
>   TEST_F(KFDMemoryTest, AccessPPRMem) {
>       TEST_START(TESTPROFILE_RUNALL)
>   
