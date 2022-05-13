Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D73A525A48
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 05:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE1110E0D0;
	Fri, 13 May 2022 03:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAB610E0D0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 03:43:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laQ5G0dtGaZ5rCGKVOAEXhmQaYsyTvovRLUFJsjU4zGb95dWXJ9EUmYE4DDzQptpEd4+d1HCjMwtT06FQw9uuvgNwxV/Gl8Wy7xETVZ+EyVkOAoHujZ4SE2m+kDOGa0quTs7GOUHjFBDWDWSJsBunzHX4nCd5c6EFmhokDrW2CtC+WJ3k3Tk/QPmZGQkloutXdpWz92nJPwKNTOpGgnZPUy36+JIv0AUaoQkV+Q61fRzqpGXtWfgbwWlTUpC5y3FzWjAGPYCNn2vRPc9TQpu6cP4upbM6Pjtrn9ffF42+3pL3TLPal2ulucqdJ9Pz6oiGDdOgDCrpYlEwF+amdJ0GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M88u3fCwGRGv+x6gSUJtmDnCraUFoRRyrAMgUcWaBxs=;
 b=LNIZqa/rnARQDMiQ9SGHu1SzJdCfJMHKwM3vtUuUKqRuZQrNSWMzqRG3Xq3dlrIUNZwq6kkqFhyH2p1a1P1Q8LahRrwNMweHh/z7aXnwaKE+SdhEDFwq2YqF1XsrChx0U/IyhkrjYR3OlpDbcITskZgt1n6JOfUfO/psjXh+d9h4m+gNiTnhor9HkR5yoXGLAeionyXKRh/qNlWcac3zYxRfWJr/kpzpiONYcUSKvu3mZabzbfAaUQzQvWZfFLZgmUlg1BDclr5Auw0HJmXKwHTKhHl+0XYnSlu2/FIKmrYljtPVwfVhLkKeBTZZyKlII5DhmbJjLM2GCSMfoQjhqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M88u3fCwGRGv+x6gSUJtmDnCraUFoRRyrAMgUcWaBxs=;
 b=ONeejBf5eHX16Gjs+qeqDwi48Jf9OgSyaEtBQXqTCBz9MATz2tOY0rXtM3mjIgOExhspX6/8eY+duIR9+gi19zNUKXOkiV1dsVeklw+G9aw7Qh7ouhxfQDHzQKGSdsQPnIArwc/0rLuuOLz52e54mhbPaCnX4vVx95ZURPPuv5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MN2PR12MB3727.namprd12.prod.outlook.com (2603:10b6:208:15a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Fri, 13 May
 2022 03:43:41 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::588c:699c:71b:b6f2]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::588c:699c:71b:b6f2%6]) with mapi id 15.20.5227.023; Fri, 13 May 2022
 03:43:41 +0000
Message-ID: <750ebec4-d192-6fdd-c991-7705b6acc794@amd.com>
Date: Thu, 12 May 2022 23:43:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Improve TTMs empty object handling
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 bob.beckett@collabora.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
References: <20220509130951.486344-1-christian.koenig@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20220509130951.486344-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::28) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8980d2d8-d62c-4b9e-7bb6-08da3492c5a6
X-MS-TrafficTypeDiagnostic: MN2PR12MB3727:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3727E8C4137C55546E0B97E799CA9@MN2PR12MB3727.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cqI2o2/4tF3Cb4urBLtG8917xIlK2AZL/yKnTwKb2R5C5KyaZcxuzIPxBvovRUykunf8d0XacA8Jk4c9k2KptHZDgPNHB2vHilLuYLgYLi7xBydoDRr/GW6rT9CjQC6BSN0OlcvguVjkXPhsnRbO8DnfHig9X6mNOiOpwrgIix6cvWV+ti5Ka4BlZGGxZYnlIlLHyshv7wl+PicWBSf6bPRHJjzPdgBy7wXckuXzQKCCilwzSxs0qPKYXPbKoK44OVRqGqeDXZbNt0dJUjp9haPSbJJtmqobFxA+0qmr3P2Hw+Uqn2F03yqeCVb1eLc/89fSeQo+UhSI2DD75szjext8uGtAq9oRGB/MnSjlVRe4LjD8EpgymPE4xoR/Oo3TTsYLzzDAIYTEKXzWqkyc1ZkoZoGWdyB3OYRVsP6jVpYGwLlWCazL/cmAWXlI7XAVhPFTLMXtqKCdWARcrFjpNyatecHFwo8Y5b5JNCmjzUnsIfy23IQtJa76RwaQiMBfzYcLesx3sEViDsfbyVe1xcsXBiYYah0+HXObQq7X5WR5iRQQvxQPc/VXTugOOxSKPvc4BNVvhXJVEBPXmSKC0s13Nxask+XxXMLGsKzVhlSC6WvynG7ANWj43AtagfZCRXE6gHCGEyXju4nUvJxlosk7tGk1SW/89L3fKclGtCi7IG0UmT/M8KazqDiajtc4TpQrTWwtcvcb3GRmdti+hE0TsAWAhkusbRISclGEwxM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(44832011)(4744005)(5660300002)(8936002)(53546011)(316002)(6506007)(66476007)(66946007)(66556008)(8676002)(186003)(6486002)(38100700002)(508600001)(86362001)(2616005)(26005)(2906002)(36756003)(31696002)(6512007)(6666004)(66574015)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUZ5QlpCM1VRSTZDbTV6bmtkTWhPYUZQTTBNREFwdHE0YlBPNXhjTzV1R2pt?=
 =?utf-8?B?NjQ1cnhXUDNZbnJZTTFYcEg0c1prbVMzMGFhWWd6eEllay9HVndqS2MrZmJ3?=
 =?utf-8?B?d296dkdVbndTeXc1NENLbFR5aFRZNGFnMWNhYlFLMVFRWHlKUVl0RDlQQkJX?=
 =?utf-8?B?akw1anV2NitEVGxBSUxlRFMwdkU0YXlTbktPSUwrZ1BKMy90Z2ExTERBczJU?=
 =?utf-8?B?L29WZ2tsQWdHNENvSHhGWnlFd1hzeldITE1ucGlmTlhleGN3ODZhUkgwNVRZ?=
 =?utf-8?B?MTBjckhtN3I5ZjlCVW5aaXExaEdPWWNzbkhIZ3JseHR1VnZMQm9DbVp2Ym5H?=
 =?utf-8?B?QVVjdjNQUW1vYXRIZnF6cUJVWURNbXhJT3ZQeXpTL0VPdGZDaFN3QUFYQ0Ja?=
 =?utf-8?B?OXBVWXlibmM2dU9idmlTbE1TQkVreWxkQTNtaWtxRGg3TTZQNnNmOVBzSnlr?=
 =?utf-8?B?ZGphRnJ3Tm15WWdiTVBJVnhkcFluYjliMzJZdm1LRE9weWp1WDlWZ3NXWDdo?=
 =?utf-8?B?NXQ5VUNRZWNpUUgrVGkwYWJSN0Z4dGJub3Qrb0xBNHRuSldLbWJtQnVrRkFU?=
 =?utf-8?B?N1pYbUpSemt1QUtEcDJ6Rm5TTERaendITk1ndFh3ZXJ0TXhOYjBjSVk4K2Vx?=
 =?utf-8?B?RnpiNlI0RzJIZXB1a1Z1YUErTWdsYjJkK2dpSDZ0SVAvbm9VUHhBc3ZVaWdG?=
 =?utf-8?B?YkdmbmdVbzFkQTgzSnlpVWhKUHc1L3A5UFZXdUJyaDFjTWQ3U2JrL0pPbFRa?=
 =?utf-8?B?RE0xOUJsdStxK2o4TkZkanBpR2wxR3FJa0FEeXZJc2FGOFlYL3Z2OHdlK0dV?=
 =?utf-8?B?ZUduSGJiRlJMTEtnbys4Uzd2UlZ0d3M1S2RUbkt2MHNVTUhCcmF2VHZVMk1K?=
 =?utf-8?B?R3Zic01wcU1LOTVIb0pjMS96MHBoRXlKSHJOV0NOeGszYTBrbWdFaDduOTVK?=
 =?utf-8?B?b0hEeGJoNXJqcjZyVnMyakpIKzVZamVoMTlRN21vdWN5S0FHczlud2FZZzlm?=
 =?utf-8?B?dHVEUWdDVUdVY0xSdkxmNFN1VlhBMzkwYU1FV0ZRbnZMdTVINEJYbkYwNGlw?=
 =?utf-8?B?WjFRUktpYlBqbzVJTVVQS2oxYmNLWEhSL1lNWGhqRFJzaHIzN2JtM0ZMQW9B?=
 =?utf-8?B?OHRWakYwQzlRdFRRWS8vRmVoN2RRazh3b05MbXE1QzdMbFJNOGFCUUk5enRF?=
 =?utf-8?B?QURZVFdBMjQ2UlpEMm0xcVh2bm5sQU5OSGI1TE9EbjhEdWs2NnFYb09DZmlm?=
 =?utf-8?B?c0tBWnN1UENqVFJlSUFwRE00MVlsdmVzcnVlc0hJZTNiY05kalZjdk5VUnZN?=
 =?utf-8?B?WUF1MXFLb1VzUGpDa3hGYUFYSGQ0bHJSOFlFbzhMeHFFMTl6bmR2bmgxU1M4?=
 =?utf-8?B?bFBNcTRvUEhRR1lvT1RuR0lXQ1FzY3JsWW4yZk8zK2lsaWR6aG15djFyOUoy?=
 =?utf-8?B?RUNFZjNZbnJ3ZWpXVkZ3OGxyOERRTVY3TklKb2RFdjZIMTdzNDlKUHh3U0lG?=
 =?utf-8?B?UnJwRTIxZjVVUm8xNjg0T0pzbUQyMHVEa2J1SGJXeHJ3bjRDMVJtYWx2ZDh4?=
 =?utf-8?B?VmVyUk9mblRvSHF3TnhPclFtS2NXalB5QWI5VXlGdUU0bnV2bVJYMXc5d0U5?=
 =?utf-8?B?TytNN2sxV1VhWkQ4ZER6S3l4WmZZWVl6QnR1VWIwbW5QUTdXM3FjWlFmOWxs?=
 =?utf-8?B?cTk0WkVBMXA4NkRBV3Z4cTZDeWtCcmhsN1lDb0ZtbnNCcTE4LzJJbTE1L2ln?=
 =?utf-8?B?VzFLaU9VNjk0SDFHUUNJWW1wbjZkalY4S21WNmhLeTJKSnJQNEM5TWVyUE5p?=
 =?utf-8?B?RDJHYXQ2TzMyOU4yVmZ4c2ErWWgrK2wycm44M2JSMzRUT3lKTGkrYytsUWNX?=
 =?utf-8?B?TWo0bWtWcDlnQ0R1b0pXNzFGdnR0dEF0dFExWUl1ZkJHbzEvbksvM0d2Mm5r?=
 =?utf-8?B?TnFua0YyTG1YZDFUeXRObGk1Zzh1MTFPYmlqZVhybU42akdQZnkzdmJtWE03?=
 =?utf-8?B?QWJZRkZVOEZ3azZVOVU1M1VRWC9vK0liaUUxUHgvOTFxRWtnZW0yaGpBNGZQ?=
 =?utf-8?B?cEFkbTB4MDByNkVuYW4zL2FuaDhyd2liM1hZbzZobVAyZzBNaUZQd2JjZlBn?=
 =?utf-8?B?ZThqdStPUTJBL2NNTHoyOWVRQzJRbnpHd0hZVmVMMHZhYWd5VzQwdUVtU0R6?=
 =?utf-8?B?RVlyTlZmdDc5Zy9pdFh3MVBkeW5pWHJRR25wQ1RMNWI1RWs5NE9BazhVb0VC?=
 =?utf-8?B?QUQyOWlOVUdzRHIyYllzUkNHMlF2cjMrQXRockJUdGs5djZPUzNZWlFXRTlR?=
 =?utf-8?B?SW1jZjRhNldEK0wrQ0ltcHpVQ1BiUnZDb1l5NE9TZFl5TmNHeTVlUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8980d2d8-d62c-4b9e-7bb6-08da3492c5a6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 03:43:41.4581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glUeGCxnZr7r9VYG2ugZH+aqK9yvheHTEj4Idk/uYyLZjaTGPvEUtDWyPtdTlUm5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3727
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

Patch set reviewed. Good stuff.

Acked-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

On 2022-05-09 09:09, Christian König wrote:
> Hi everyone,
> 
> re-sending this because Daniel was requesting a background why this is
> useful.
> 
> When TTM creates a buffer this object initially should not have any
> backing store and there no resource object associated with it. The same
> can happen when a driver requests that the backing store of an object is
> destroyed without allocating a new one.
> 
> This is really useful during initial buffer creation as well as temporary
> buffers and page tables which content doesn't need to be preserved when
> they are evicted.
> 
> Currently TTM allocates dummy system resources for that because drivers
> couldn't handle a NULL pointer there. Audit the drivers and then clean
> up TTM to stop making those dummy allocations.
> 
> Please review and comment,
> Christian.
> 
> 
