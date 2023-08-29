Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B95178C553
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 15:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0507010E114;
	Tue, 29 Aug 2023 13:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECA18924F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 13:30:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ie9NuBZcm6fu5QqZWztO/D1ynYJL4yRyyObdQHPnDFH/MZzqXU+UW/+SUSg+Vg779e7nySUeYzADDSwZOkE3M7vYV9vMUhx8wDLoFtnGZaD2TuqkRuXQmpSMl7/kh4t+mYYf0ntP/9nkxxfZdDCL23OxCEYRVp6xNRvyyC1E0jczcrkSw5X5YMg29JrKNkvS3S7N4CX3hv2nAvJjwadD4lFnIEI19pcZ6cH3kHRH1/WPX5BpkUtf6DDaZ99r6EeQpiJ5TIUf5nsE+mSvXDJXDBU5E6d2KWUjeFStT/CKgjz5dQ2G/bO1i3Tyfyy0zTaJ47h6kZhPh0l9RltnPaJSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WbpTfMnPzAdOhLTRAxf0tnMEhOMkNd5WUJXSVKSlWw=;
 b=bb7g4w8ZBNwB0OBRb3Enc4ESWkxkYSLERc6d2zTErod/vkbKgUbB1QtdTwj9m6i6QItxE5KoqtKk7ZgGVARX+4kp3g9ipIdrNbl0eUOsoCfhvY+LiDiVKlWRgXp0oxWscGHeoWLGom0ElgjQx1glFlZUWfxvHLtnaqs8t7EhFWe/nWbpYIDucyDHWynm8YVxq40dHEgcOpo1E+p9fNBzTONI6gBkyanS4ehfB6bKjhNQCtFMuLSMvyR/QmGDjzWk8g9m2RIWglDi+AzlUij0fu76RfI3DR2aVsZL1kxxdbODvisVJi5SjtNpy6Ujv9JDn7Q/kXJ5SYNHI69iuV2PSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WbpTfMnPzAdOhLTRAxf0tnMEhOMkNd5WUJXSVKSlWw=;
 b=SXnmxi+/AwXpOKC//SF7pSqC0tfwJRByrBeLF3OkKORlIIwEO4MoXhSlc3B3OaHi0BfSOxmO++2saSTR+aaZKXtOtGfFYrtxvZgNlbigv30KMaMPnD2QbLbBnzypNkPQPKwf6hGMTBYqiblY6vfTsq/fTsuF3ILlAD90z2J+QyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4159.namprd12.prod.outlook.com (2603:10b6:208:1da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 13:30:18 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 13:30:18 +0000
Message-ID: <0c62edf8-9f73-ac87-b894-7bd7ee589307@amd.com>
Date: Tue, 29 Aug 2023 15:30:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Linaro-mm-sig] [PATCH v2 0/2] doc: uapi: Document dma-buf
 interop design & semantics
Content-Language: en-US
To: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
References: <20210905122742.86029-1-daniels@collabora.com>
 <20230803154908.105124-2-daniels@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230803154908.105124-2-daniels@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4159:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b07b6e-67a6-4bb5-051a-08dba89415d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZRxwvX10WIUBI8GqWwJUGprWDmqC7Ihq/5h8zRCbcstNEbrjeGlmEiZfuhHKDn/1VrcpfBTSTFc7qLZThtHKbjiV3kZkXF7ooTjx20IbYp+00ZrZyhHmaicfDy2UOqEbj4oxeRv+1yAoFh3zTm5IZMCFd2TgLSwQIII2S2VAeZDs79N6tLcovRdutZhRXKSB6j8LNdHANogXGfwrickVDLlaPCNye3ErsJqn9Aaog5DIr93H7NfwkCbaATMpPuYH/XPRHMNcurugLeLG/aIu6X0OSLWvAxvBoHqaKpd36mbJsei/o0ehGyNUeAzkJfsqAiV9XoUb+eNNZz/yL0coPS8SNYQHSP9VqdgyKUbGkXFNPnnK7nStzI6POc+GcpAqZjxaqUILr9i/HAL2TVwdg2Wj9MUX9QHfIMm+VDqsqSDPHv9RgLWJGZ3PCSV4WCA69Fqk5iWlIT1SR1q6XEaaFfWQu4hHNDVaL+XCWAgk+dMZNG528lAKeTNY9MD0FJpd9J3QuBXUJZuixJOkKcRENeX42hex4PXziagAgR5wt03f8yZbEbKdpjNmf1N99AlufKEsKVLEUrNhCg2veEvKnmyEVSQxIJWt7mYT8D+aAwm/RvQ3pnSUWSLrw5ix4kuPoqkr5ogErdTkxuXhfGixA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199024)(1800799009)(186009)(8936002)(6666004)(66946007)(31686004)(478600001)(6506007)(66476007)(66556008)(6486002)(316002)(38100700002)(41300700001)(66899024)(6512007)(36756003)(26005)(8676002)(5660300002)(31696002)(2906002)(86362001)(2616005)(4744005)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUxYOEhtWlY4aURwQ0hybGtNczVLN0x0emEvb1ZpMnV5K2Vla0R3Z3BMcTJt?=
 =?utf-8?B?cW5qUm1ZRnc0NmRIYSs1djAwcC9wbTNzUk9ncDJTQm00WUVVMjdKQ0k0cWFt?=
 =?utf-8?B?WktBYjhmMnVWRzVOQkN4SzRIYk9CdHRmam1EQ1FpVVFLZjRZOWZyZWNEQzJa?=
 =?utf-8?B?a3ZuVWk2V2dqZXc1M2s1aVJPNU1mYnhaTFY2WGdZSDdRNFVqemlYOElGM09L?=
 =?utf-8?B?dmhnNzhhNXhpM0hIV1VUcFBhelRWZS83V3lDM00xcGl4bXFmY2V3ZTc1aUJh?=
 =?utf-8?B?cHVMcENHQzJ3cnltNlI0WEJHV3lEVjJ0cHlia0NrSlF2THdsVSszN2dQS3pY?=
 =?utf-8?B?WG12dFA1clBiTXFOeDAxWXhhQyt4QTREUWdPWkY1aVlTcU5pM1Nqd0lvZ2tm?=
 =?utf-8?B?Zlg2dVhIU3dzbHhUT0E2cW0yWkw4YkU3c2hwbzl2K3RBWjdhTnJ2d2NiM1ZF?=
 =?utf-8?B?R0p2L3ZaRFNjRGtyTytHZlJacUZmOVc4bm9GVVlhcTlQenYyTzBDd0pIQk16?=
 =?utf-8?B?R1BPdDMwNlp5U3FVQU1pUEZsSzZrbU5yd0p3SG1oUFZOMDBQVmNvSCtDc3RZ?=
 =?utf-8?B?Yy9DOU93ejJJRThGeXN2a3FCcUU4NzZPc29yWmFEQVE0Y1BXdlBEd0ZLOTha?=
 =?utf-8?B?c0NTbjJIT0VBT3dwb3lVQXd4d2labUZ4YkppVjlGdVoxaWE0L3UwSjNjaWZ4?=
 =?utf-8?B?WlRlZ2hUNWIzWUtxUjhYQXJyNTVWUm5tVFBEODdBL0FRNkRCY212Y1IzeG5v?=
 =?utf-8?B?SzBTSndvTUpiaUVGaXhkMnY0TnJUWk80dlhZaDd2TUs4TFNvU1NKcUVlM2ZY?=
 =?utf-8?B?SmZ1WUtYRHArVmdFUlM4bGx0WEtWVGdHOW94bGF3QnIxa2pxbFBsMXBZa1F3?=
 =?utf-8?B?Vi9OS2xsclBmRHA1L2pNQWJzanRFOE56TmJwTkVsSER4SHBHU0lrZ2tLUHov?=
 =?utf-8?B?MXRpNUdlcUh1MjJ3RHB3WXVjM3VOOTh6UE0vU0J2Z25HUjI0WnlkUlJjWVcy?=
 =?utf-8?B?eW5aaXI0bVNnbUZGOFN4Zm9hT2xaUEFuSi9GSkVhZW1pOWZ6cm1ZQWpNUmpO?=
 =?utf-8?B?OWtkaUNlR0JtVFJTVUk3Y2xaOHM1NEs4QU9yZDRFTkIxb1RoWklWOVV0ZWNr?=
 =?utf-8?B?a2ZSVkJqWDJ4QnE1N0o0RzZ2RUt6YmRQbXErMWNsQUsyUjAzTnFpekVNTnNS?=
 =?utf-8?B?cE1FWFNRNTJUd1M5K0Y0YWI4UURNeVlsSkpaMS9mVFkrRHBVVmVPS3loRm5u?=
 =?utf-8?B?ZFlpdDR1M0ZiMDR2QXFGTTdhWDNqaCthcyt4VmNrODRHL3p2amxWSVl5NHRP?=
 =?utf-8?B?aVlYN0ZHazJjVXVpM0ZkRFJyREVDZmI1dWIxRnM3eEVwV29qTVpZbjNNenp1?=
 =?utf-8?B?YjlOUHI1SnUwMkUybTR3ekRUTWVsK0g3ajRWNGh0WGR6NGdlb08zTVZ1UVQr?=
 =?utf-8?B?M0dDZG5rVkRZRXhGWFpMNjlEN0s2ZjBCdGY3QlNsaHZIN1Njd1pSM2dnZ2hR?=
 =?utf-8?B?bjU5cTdPVHA0cFYyYU1ObDcyVTlrZDVzK0RRcUM0emtQaGFCYno1NW1ESWEr?=
 =?utf-8?B?VUhHTUF2UHRFNmRwb2pCcHdaL2J1TUdsekE4V3A3MGsyR00yK2hwdmpuZ2M2?=
 =?utf-8?B?SGt1Q3N2bGJKVGZPNHRsdjFaZlFxb1dZN1AvWThjaUJzeVhpSTN0eVpZVlRJ?=
 =?utf-8?B?bG95Nm9SQzhWT2hJeGFDZTI3eVltNlIzRER2djBLMVBqYTk3cm9RNXJ3ZE5G?=
 =?utf-8?B?a2J5ZHp3ZDJkTXJTVGZPRDYzUEJ6ZjVDTE1UZkdBbXgvZC9hbEdNWXZtMjNp?=
 =?utf-8?B?bzdmN29xdlE0RGMxdkdZWE81bWlFOE1JMHdSdkUrZUQxbmNaRUxBRDJXTVpP?=
 =?utf-8?B?blA5TS92QlptMG5tcVVaUm9DeXR4b2NiQTJDNnZPSUZIaytxTEF3ZktpTXZN?=
 =?utf-8?B?K2tRNzRSd0FjT045cVJpeit3cTc1a2tJOEYzUjdDL1lIaG5hUkxGcjF4MUc5?=
 =?utf-8?B?cVl0TkRyOEVLejQrenZKMFlUU1RuRXppQUM2TC8vcGdtY2Z0Vnd4Q0JZNDN6?=
 =?utf-8?B?RDFCcHI0TXNsYUY1L25saVBZRC9hWnhDdnE2WlJ1aWZSZ2xqUmRqdmNXam1a?=
 =?utf-8?Q?ThOA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b07b6e-67a6-4bb5-051a-08dba89415d7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 13:30:18.4271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1cjohQOEw56q+YpqLlT9F3p34O4S/DQVm8i2lD81+RuyCKOfujMWl5gNAVQgB1l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4159
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
Cc: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.08.23 um 17:47 schrieb Daniel Stone:
> Hi all,
> This is v2 to the linked patch series; thanks to everyone for reviewing
> the initial version. I've moved this out of a pure DRM scope and into
> the general userspace-API design section. Hopefully it helps others and
> answers a bunch of questions.
>
> I think it'd be great to have input/links/reflections from other
> subsystems as well here.

Could you send that one to me once more. My mail client seems to have 
swallowed the patches.

Thanks,
Christian.

>
> Cheers,
> Daniel
>
>
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

