Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 315F949B1BD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 11:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A6C10F1D2;
	Tue, 25 Jan 2022 10:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF8310F1CC;
 Tue, 25 Jan 2022 10:36:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKuxz1LJu4jexXOGSvNoI4xP8waG0nS8ckJddjF43kzlwsfqBaIC2Vzk9ViDpjjS3whPf06frNYrIHJJIAF6WJEYSspYER9o1BSFZv+2pJqlloAoApQvI81MWtFcSvv1AwPBziKyMSS3GOZAdbc/7sCefKbuSmV8zzN88fxz5H9KUKXrIJADrfVkGomK+SzUz1/0gQXeL+Z4+iL81W2Zek0BwsgG7pCJiywbIR+CUd7naIxdvis9l10PrbYJgK+gvrPwqrIXIz/IfrcpnQ/AfLQeQaKcQEq9/X37sEvRreLEKB0MQ/vdP+aRgtjBELOOHH6v/EDKJQxCOVr2cEPB7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6lzkW+bWHDj6bRAWfgvdfGtyyyUHohRrLAvyrbOvpc=;
 b=EKTKLobVKovPDvCS9+oaRwtWISbnkd7pPvNk3Kg1HwqpIbbVe2ahNFz7KXVQmgzywKfvjKVxKJPYPKYsYH3+TEGZ7sBc4VdJoB8BPeZZlg0F3LzEG+b9ESQV5Yum1Z0ruMB7dZAVt+n/C2wdy1eJ9Dvn9PUVfG5YS25eMS5iPo6SnKoSLUWjKHC7NOEQzj5wcdpXArEMfYCjRH+C2fBDfyiRR9J+bGLvQ3ZozxvGr40zp0os0cwePixmeZICt93f+Kvrp8LWVIGpUDy1CuSV+3aTEfRqRWCDxE8evhCjr06crpYnpFgsOHVCVfiH+qmlyWXRfvWqj+oHrinnLqVK2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6lzkW+bWHDj6bRAWfgvdfGtyyyUHohRrLAvyrbOvpc=;
 b=XyE11Rne4t5xrEB/qnImVoT4Vy4lTVnzy+aEC+j399Dx2tVB5+ptMAaNqOmsNexvaNQEd7yfasGKTAaCWn5eUf9ptt4k8CLTi7dFlVMuoY3LoHwmvjzMXC19xEaZtpTGqQ6pbpz/W2RIQ0imhlCwD+MOIhQVHP881emVXJDZpXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR12MB1872.namprd12.prod.outlook.com (2603:10b6:300:10d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Tue, 25 Jan
 2022 10:36:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21%5]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 10:36:41 +0000
Message-ID: <8fb3178d-00ce-e738-fdff-bf014e09e78f@amd.com>
Date: Tue, 25 Jan 2022 11:36:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 6/7] drm: Document fdinfo format specification
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20220106165536.57208-1-tvrtko.ursulin@linux.intel.com>
 <20220106165536.57208-7-tvrtko.ursulin@linux.intel.com>
 <YegpiY3MU15RsEfk@phenom.ffwll.local>
 <CAF6AEGs58S7U=1nso=0BAURUuobeUam4V0j1W7ZsrK5W7MqRvw@mail.gmail.com>
 <423c8ff1-3a4b-3e69-8561-3056c7d2d20f@linux.intel.com>
 <fb6f1a2c-6e23-cfdf-2ce5-80209a005227@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <fb6f1a2c-6e23-cfdf-2ce5-80209a005227@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0075.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa0fadf6-013f-4690-a6ef-08d9dfee92d7
X-MS-TrafficTypeDiagnostic: MWHPR12MB1872:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB187261865440576FBDF98AF6835F9@MWHPR12MB1872.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cTdrednNbqJYA0KyXGM9HwGktl4H2XthgSTI2pDrQDbp2g/XIFr1zr/Phyv4CplVK3CIqyGBWfBD71M2q44kpTR7+J8clJed9zm4B/HyFIjBnX5Th/hEdKB71s1Kv4O9/naAsZ+vqbsjufiHFPq2PddteCY/Wdyscx/CYAVEByiYNkHNle7t6YzGKNXdJzmiVb00ofdRbTMjWRD1BnsGpAlaszUv1WguH/SlCJiLe1RIQzmLI0wqGuQiZyR1wmcQbm3rPEjP6Mqy1/Jdjdref0yT3GTkwwvDra+BQ+CTrnXuYIKTw2ph8bOF++5w61Pd15SvPhrjPv3U5udQ463JtOhTxK/MDOQg6y2PCtqrbcGFjKO5tEvmKMSqMXUdcakaS2uQ12qmoK9Uk3GwytV3po4CX2HFA9ncv+R8rAXgxNjpLGzoLjueJQDJyRchlebkh955ecrN+vRE9eVokfTP0SBRbFIRFfc5dwQSdPy5lto25wnKhuPYSTylo6/c2vxaK+Qqf4t+/qYC2o04ykB11D9lmopGBAYCPXTGEgW9eT3ARf26L686VhnUiNL9tFsziFhi2v6xCXqUcdm9LkOYSKyKTFG3Lfbssq9xGP14i/tesLPAAaAwos6Q74ADFQNbzJrRQbISCcjaTGS1Eun+VlfK2vrysz275CKzNlAUkj9JcU+jM8GjQmlhcE5lK7Apum2f7EuJN5GB3EBswHvnmMxYe4vlJONQUb74D8LMh+ORZUDPzSQ0JfKf9BCJ1KdX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(8676002)(4326008)(54906003)(31686004)(110136005)(2906002)(66476007)(5660300002)(86362001)(316002)(45080400002)(508600001)(66556008)(53546011)(66946007)(6512007)(38100700002)(8936002)(31696002)(6506007)(6486002)(6666004)(2616005)(966005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFFyUGVuWU45WjQvaVpDM0xrbHI4M21RY0l3QkRiTUxoK05rcnBYbHAzLzlr?=
 =?utf-8?B?QytsOHp1SlU3dEVZNDRMMzN5RXBLck03dW9DVkNqRFlBL3dtTTVUT2hOcnFE?=
 =?utf-8?B?SFFDdGJ2eVIvMlA0NGsyMThnN3NFaWZGekMrcHNIdmY3L2JPTUpQOGpQKzZv?=
 =?utf-8?B?K1Q5SEloS0RwVmFFYkxxbCt2WC9jY3dQNFJUL3NYMGJwN2llMUcrSExiajRM?=
 =?utf-8?B?SCtscDA2QjJXaGNmdWhGa2ZDNHZwVnZ5cHgzWCtPRnpFMUpMOEN5NnpMTXBM?=
 =?utf-8?B?S0FvZ0Z5RkZPOGhHYmMvZFNpQTI5eENQME84UmlZVEdRcCsxcGNDVEQvRFdF?=
 =?utf-8?B?eVRIaWdlTUVuYUcvdW1ybkR5Y0FEaktkYlhHeXlwdFdUSXkxV3dmNjk2c0po?=
 =?utf-8?B?ZEFvTXZPbkV1WnNRR1NTWjdJMDZ5a2RaaUxibWk3K010QmNlSnFKYXIwbGgw?=
 =?utf-8?B?aXJBc3FTcHNheDBVQzN2WkNSZEN1UmtSR052NERrYTQ1T2dGU3lmTzhsYStu?=
 =?utf-8?B?WEQ1aGczUjRMUmxYSC9BSGVsTzRlanNrY0laM0ZtOFUzQ25jWkhvd1MxK2RD?=
 =?utf-8?B?MlRpYmJNK2VTYVlhM2hTK0c2N2JCWk9PNGtJeXZLWjhwdTVySENFeDEzbk91?=
 =?utf-8?B?QUxGWkt5bnVjT3FzRmZyUTlsQnVHUk5WNzNPSXFoeWVaLzBDMzkrV2ZTaUZo?=
 =?utf-8?B?QmZqdGFqR0NRQUQ0RTF3Um13RDlYY3c3TlQ0eENLc29Ka05EZDRsbytkVWkv?=
 =?utf-8?B?M2NsbWFxS0Rwc3NoZlZ1NGQ3NUNqMkMzV3ZSdytIcVNNaUVqOGRZeW1rZk43?=
 =?utf-8?B?c0FqREFmeE9WbjQyZXY0MVZVdlRZSFBaT0NTVWE5VS9pQ3pzTlRHcWQ0STBR?=
 =?utf-8?B?cWxNYnB3UEdiUGdxQmJrVTRHakdVdzBZT1pvYnhSaSt6TGhweXNoZXlyZ0VT?=
 =?utf-8?B?aDBIWW1iV2pvN3dqN1BDRE5UdDlxNWJtRlZENXBtaVllVlNFSE9Rd0dCOVhx?=
 =?utf-8?B?YXgybXZxMVdscitkb2FncS9LZHp1RWFmM2tlOHNqYm9BTStzd25HRHlmcDRY?=
 =?utf-8?B?dXhRMmtYSFh6a0dvenVGRE11YzVTQnFUTjJleFo4Uml6WC9sUGt3aVhzMUly?=
 =?utf-8?B?bWRRT3VwRXNwMDdzdzY3VFB3VndLcVJDQ2crV2FuZU9GVFlYc2xIaGVYQ0Np?=
 =?utf-8?B?S01EczhMV2hPc0M3VUpLeUs5dTM3bFVlWnpjcDUrRU0rMi9NRDJIQ2VtK2FN?=
 =?utf-8?B?R0J6MGc0dWh1L0tlYmVNc2ZYMld1bklkL2xDNVR0ZDBwL0FGYlBPNGtQWHZJ?=
 =?utf-8?B?RmtibktRa2xyWVhnSzhCamZYb1lqVVBnbE5jMnFlYU0xK0Q1MGFsenVQN0Rs?=
 =?utf-8?B?aitiMU1MZThZdllvL25WcFEzNk90ZEVxMzV0Q2EwYUVFYThpT3E4Q2JRd0My?=
 =?utf-8?B?K1Y5VEw5d21NWFJqZnRMYmtMZ1pxdVJzZkZIUDExMk92Q3ZwOGQ4L2FiSWlO?=
 =?utf-8?B?SmF6TVBRTmtSUkJlQk9QbkI4czhPUlFqN21WcW1xaWZEWXJwc0J1elI0dFFI?=
 =?utf-8?B?bjdOQlI0MEF3UG9HMkZjeXVETkQ1NTFlR2hVN2cvRTg3S3FBMlZUYnlqbFJi?=
 =?utf-8?B?R3pCRzhvdWlTNno2K2ZqUis3WGtmOUl5L3ZYYUxGTVVkdFBCbG9sSzRPcXZV?=
 =?utf-8?B?TGVKZXduT0FuV1AxcDl6YWRSQWRLaDdMZjZDRDNYeEg5MHd1NjBmK1BXamFo?=
 =?utf-8?B?dGRWeWFsaURYM3RoQjF1enhPWmZOUnluVktzUVBYMnRZNW0zL0RoTVFYVHBu?=
 =?utf-8?B?VkJ5Umo3WjgxVHk5UkIwNlNEZXFuRlVsZlNGZG8vcGQ3RWsvSUV0TXFuN1Nx?=
 =?utf-8?B?YlFTZW44UzNLZnJPZ2d3ODUvUTRDM0pwV202Wm11TlRvTjhac0cvRDNuZUQ5?=
 =?utf-8?B?UDdkWlBZemFFSVFLZXhHQ3UvK0hXVWwzOWppUXlhR0FjS2lOc1paajVvU1d2?=
 =?utf-8?B?OFAySE5HRmVuZFhZRGZmTEJSRkFUNGJqbzZsNEFTSUpxZzRuanZrakthbUlq?=
 =?utf-8?B?OUdCM0dXRjIxbVdCWFErMm1YNzJmZ1pteVluV3k0SFJldWpEOXR2bDJyWnZE?=
 =?utf-8?B?ejJDa01mYlArMEJlbUtpSklDaEh4b2RpeTl6M21PUndFVkg2WDZrRHFqeHV4?=
 =?utf-8?Q?OsS6FoaRMp0SkX+1u55TMHo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0fadf6-013f-4690-a6ef-08d9dfee92d7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 10:36:41.0640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5OdxskwPsxqfsncGuWsfySEPo4r7SUJKlrXOLE+mojAOQGLHtD6CHKF/+ZH1X9j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1872
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Chris Healy <cphealy@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 David M Nieto <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wow, nice.

Certainly +1 from my side to have that generalized, documented and 
uniform among all drivers.

Regards,
Christian.

Am 25.01.22 um 11:24 schrieb Tvrtko Ursulin:
>
> On 21/01/2022 11:50, Tvrtko Ursulin wrote:
>> On 20/01/2022 16:44, Rob Clark wrote:
>
> [snip]
>
>>> If there is a tool somewhere that displays this info, that would be
>>> useful for testing my implementation.
>>
>> I have a patch to Intel specific intel_gpu_top (see 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F468491%2F%3Fseries%3D98555%26rev%3D1&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C99e7138493364003d3e908d9dfece57f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637787030821307243%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=X5Qa7rZkyvplRJ5fJwaKjwa%2FtII9EZmg5PIYMOcqKiA%3D&amp;reserved=0). 
>> I'll have a look to see how much work would it be to extract common 
>> bits into a library and write a quick agnostic tool using it.
>
> I factored out some code from intel_gpu_top in a quick and dirty 
> attempt to make it generic and made a very rudimentary tools/gputop:
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2F~tursulin%2Fintel-gpu-tools%2Flog%2F%3Fh%3Dgputop&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C99e7138493364003d3e908d9dfece57f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637787030821307243%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=FBhSRN8vyl6zgT8vGZ8kRhWFtt59dZUCHMmeCl9gdnI%3D&amp;reserved=0 
>
>
> If you manage to export the right fdinfo tags (basically 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F468502%2F%3Fseries%3D92574%26rev%3D6&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C99e7138493364003d3e908d9dfece57f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637787030821307243%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=a0aBjo%2B2WyfzSfrjWkHteEuZAmncLbO8Z%2F5ypZKumlU%3D&amp;reserved=0)*, 
> with the only local addition I have being the optional 
> "drm-engine-capacity-<str>: <uint>" tag, we may get lucky and tool 
> might even work. Let me know when you try. If it will work you should 
> see something like this:
>
> DRM minor 0
>    PID              NAME    render       copy       video
>   3838          kwin_x11 |█         ||          || ||          |
> 327056               mpv |          ||          ||▌ ||          |
> 327056               mpv |▌         ||          || ||          |
>      1           systemd |▍         ||          || ||          |
>   3884       plasmashell |          ||          || ||          |
>   4794           krunner |          ||          || ||          |
>   4836       thunderbird |          ||          || ||          |
> 296733         GeckoMain |          ||          || ||          |
>
> Regards,
>
> Tvrtko
>
> *) Or for more reference this is how the i915 output looks like:
>
> $ sudo cat /proc/7296/fdinfo/10
> pos:    0
> flags:  02100002
> mnt_id: 26
> ino:    501
> drm-driver:     i915
> drm-pdev:       0000:00:02.0
> drm-client-id:  22
> drm-engine-render:      196329331 ns
> drm-engine-copy:        0 ns
> drm-engine-video:       0 ns
> drm-engine-capacity-video:      2
> drm-engine-video-enhance:       0 ns
>
> P.S. There is no AMD support in the current code, or nothing for 
> memory either. Both can be added later.

