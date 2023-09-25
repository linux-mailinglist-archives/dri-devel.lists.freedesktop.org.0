Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13AC7AD327
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 10:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D851210E1CA;
	Mon, 25 Sep 2023 08:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F31310E1C7;
 Mon, 25 Sep 2023 08:18:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvmdatgX4CQVCy6LBbFwmoIafqCE1fPegSCAtFsohoAqXI6jrBSAcY4zMxImZZR9jqUUDCyoGgcw/0/TWEl9DhQ8n2NnTMW1lFfn4QmM4OjAJ69jdxQ4CMrtHlnOHtFdMbr0tXKtQlCBAnRyDpkB8Kotvyh8lGx3AetxR1wGs4HJJ2NgQRL+Jo8pUn39PcO4VvyJYIQBI0IlelgSGhVb/gNI4/yrcfrRYK6DkqPNFCH5UroKZkELrrEfMjuFf1Rj4qHko/z01+4dtydUxiuOgdfo6gQFyZZ46OERn2E+L+9nXYdS7rcobGeLkWNN8fcKZTAtqNZp4zbDaZtAZhFmKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzMfrURqQjlqbBcs9MBTXo1dmQpen9EUPgS5JdkirTo=;
 b=LF4SfB/sd7bM9jN98SVUo9IZpUE8MO6lCHWCj8Z96f+qXszy9L2um2I5pVDcuPkAT4kGPMxzPCPAGiCF5+B3sx0F1rk7EQT6ZxGp9HOQIUO0p1IDJVETF+Gb9QbSwckMRF3wRFpAauwcKI0T/zqDZ6e0yxWE/ujh04S9vsN4ctvkbgAQvxINJrKmULXdl9H1k6B6oadKPaUfRaqh8P1HM2XHLJPZRBOM0SEUzUAlaBOpiG24KD5kGB7NPsY6ZSkkweq/YU2t0XxhXMv31v/yTRHiLpttXWqjZRuyWGaaAmzsh1HLu1ytEZk6jA/XGT9NsmOQbYnRE9lGWg6uaSbuvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzMfrURqQjlqbBcs9MBTXo1dmQpen9EUPgS5JdkirTo=;
 b=gj6p7oi3Hv9FNR9IC/3z8GJVeAQbBkgy2o8OyinWzXQLqxhFz0gmjr2VTex+i5FKi4MdeBQVsZsAc35YBpCW4G9iiVTdvAEV8LFyoJoyf79bZOf6HThIRb3k6nk/LLf3lsGD2rUT5FmAUF3oEOk5RQsC+WIddl7v8FkxiHlD69o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8898.namprd12.prod.outlook.com (2603:10b6:303:246::8)
 by DM6PR12MB4926.namprd12.prod.outlook.com (2603:10b6:5:1bb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 08:18:19 +0000
Received: from MW6PR12MB8898.namprd12.prod.outlook.com
 ([fe80::a67a:d5d:8219:56ce]) by MW6PR12MB8898.namprd12.prod.outlook.com
 ([fe80::a67a:d5d:8219:56ce%3]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 08:18:19 +0000
Date: Mon, 25 Sep 2023 16:18:07 +0800
From: Lang Yu <Lang.Yu@amd.com>
To: Juntong Deng <juntong.deng@outlook.com>
Subject: Re: [PATCH] drm/amdgpu: Add description for AMD_IP_BLOCK_TYPE_VPE
Message-ID: <ZRFCP23GbTLjig5u@lang-desktop>
References: <VI1P193MB07528C2081A3A8BBDFAF2BED99FDA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1P193MB07528C2081A3A8BBDFAF2BED99FDA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
X-ClientProxiedBy: PS2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:300:5a::14) To MW6PR12MB8898.namprd12.prod.outlook.com
 (2603:10b6:303:246::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8898:EE_|DM6PR12MB4926:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f8aaaa3-d41c-4852-8543-08dbbd9ff95e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ljQkcsQNwHsHplr36qkKvzteJrOscPShPM7WaCH9F78oo0vxo1SpXZilKoJFlmneSK+JrMOKX0y2nwNuAmeDEJIKo7c/UB1HW8gQ4d4vFDtKzrdy+QGtBfJVMXVkeDSGPOiC4DEHRWbZboauHA0eDOQULuOKPyAAZ3TCRX9kF+pWI0zGtKeIW3HUN2Bc3o2FZ53hr3WqZe1kpw0Xi+wphn01l9Ei/f8AJNCuk48WXiQy1Ell3Mt9DQ7G9EZbxu/t/QOBL117MBiVm1aCbQ8K0GYot8hVxDySQHh7Ybaa5336IsHjQRsFRth1296P8LTqPLUSnOFLwswd31msz6BEyNbzlvLAJfkLoRTR+7pFNO8x9V94g5UujUD4bHEUZOfF08IZU3CJR2OXO0zrfH7x7yIJQNzO4lNIvPkmfQ3GrHlGmmkryccJGZXyZfjlBm+aaQjsJ6h02bSgiyaPW0AXEqVkgoWxLesJcdS4F+gMAefPiV2E9qPSkySzcsvM04ARIELn7A1bX82AyzMLjcq9bywkXbaXAe/GbJe6+ZAFgH3PlWkLRN7hFunAbDC62rv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8898.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(451199024)(186009)(1800799009)(83380400001)(2906002)(5660300002)(316002)(6916009)(41300700001)(8676002)(8936002)(4326008)(66476007)(66556008)(66946007)(86362001)(45080400002)(6486002)(9686003)(6512007)(6666004)(6506007)(26005)(38100700002)(478600001)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pd/u2xLbVcl7C7Gbo8IFaB59z1RWqBUwSBgQEu0jlOC/NDrAF5wfDOGNRIzl?=
 =?us-ascii?Q?UKWB+j1LYFxdW7QB6lD8/RWNzbx30wzPYYkPLVlrtQcj9Yl6VqMwxs8EXNKu?=
 =?us-ascii?Q?rzLgsKv9GCp48+0mQwcjZy4/XbXV4LsV73tNTbV8t5+1fbYsN1NSdvF8TxaM?=
 =?us-ascii?Q?G93Tgu0BR/bJuxC16QB283NoNb3E9zZvt5Zia+9CyIoK8ddvaWwbcohnVOYA?=
 =?us-ascii?Q?DEG+FibidPhEwANUD8idO3+NHgGZ3Xl518UdtWCp1JrAzutvzIOV0NKeDfXm?=
 =?us-ascii?Q?2nHoaFzzwr1NI5BWkYsugFBVLnPsslxcJwTBuqRIbzF+Sg/viasg7GTQNV12?=
 =?us-ascii?Q?kkLVWVgDP6Yng3V01PVxiHnxDB8QgAfP0OTmXO6fWTMTj3VzmW6WxWmuULCr?=
 =?us-ascii?Q?WI/bYGB17rmZoxGU09LP/GhP84YKg6W32hKMyRnoCixzqjicurdIUDWVH7bO?=
 =?us-ascii?Q?yYm4SE2tU7WQjFGojJsl6CUlFMDYDtYT9gURZ+uIIRjYNg5FyXfHB6u4+wYb?=
 =?us-ascii?Q?mT3nkRN1bqmoEC/0WocILe5CTucGEuzckF0voyBDHcLRMveW2+y/WXNL22Fe?=
 =?us-ascii?Q?1Ql97EhrCKwYVsv0u0yYNXvWCP5B1bnyu4CbU3orHegPmeRIK7g48f8+Nld3?=
 =?us-ascii?Q?ofbCKCPbZWpuSzACm8ZoTFJwZZgJSJIqMkG84lUnuXtBgJQHa4whps8R6LEw?=
 =?us-ascii?Q?0LegOm1M19d02H2p+laK/KQCayJlunD2AKiab6pWG9zH/MmRxA5sxJRfXZFv?=
 =?us-ascii?Q?O1u3Cd65XA4R9xNOJYcXWEF3q7aytjlN2/KrEgL57YhwiSKSUGynPzOnzGFU?=
 =?us-ascii?Q?0P20RtfpHyWVkKswsKTZoRjTyDdRCGCC/MZfH0DNS647Pleabea4jdkXth/7?=
 =?us-ascii?Q?5R3AYKR72zpUo8seJzTtQDuN+CtLxcVdSTGdxW5CIi1nu4aZRBqaCdK/YmE/?=
 =?us-ascii?Q?QkP+3g9UuQOY2hu2qI6B1T7m0xyhIY1zXlZQnLUhLyTOH9SevgSdDJ46Pjgs?=
 =?us-ascii?Q?Bgf1r4UmqJX41N4Q07R98ILQEduKaaUdaRmOtys/GBY+WTjdSl4MXp/YiDhG?=
 =?us-ascii?Q?HibGrelIT7HYlOpN39QPI9Spix67K2QZLLYYWJmKVpgi/GYmUQd4HOY7AcxS?=
 =?us-ascii?Q?GZvi1qkK8Rwj3mHI+yVgGRxqF3dPBOGl298CzMzz08KSYJ3lUuTNZkl9VmZ1?=
 =?us-ascii?Q?1zN2OHVRL1/r1MI5+aaqYQuxx3ppuOpO+pvY9b3qFFT/N8JzKFLZobxJVaGx?=
 =?us-ascii?Q?4aRElwelUdS0uGILX1zg4HdF0Bly9bEmmyE13Jrs/qvJVAAunGuo7+6j9PAh?=
 =?us-ascii?Q?7/cOl7phUvNAgnyTjOLG8PDNIh9NFmxEoVnB2FDgyQQkPp9HUxE0tgQch2F3?=
 =?us-ascii?Q?3edQXZg05QDcsfo68MPM+uXx6MzZULQwttFqsVUnlAiTWyRuFXDVq9SU4lRH?=
 =?us-ascii?Q?4ju0zRewI28Q6eCO5XC33j7Repjy4Db2Hbt1A4m+JYqESAqgmimATRNUSA9+?=
 =?us-ascii?Q?CGmHLx7gN5W+tPtOfEt4VXzszmzBObBC3BixDifVKAqtGootTrDSZGAVpYn8?=
 =?us-ascii?Q?YCbfNoGHh/Y/8u0E47XXfZAuwiO+OL+7mlQaO3LE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8aaaa3-d41c-4852-8543-08dbbd9ff95e
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 08:18:18.7280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pmGjq+skjkV9jUlB0GW4YpyGBwgkDnTDerlJLPYslpWQuRJUISIHpurxWU0/nQBB075TxY8y+CtWHdyznsaFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4926
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
Cc: amd-gfx@lists.freedesktop.org, Bhawanpreet.Lakha@amd.com,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org, shiwu.zhang@amd.com,
 aurabindo.pillai@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/24/ , Juntong Deng wrote:
> AMD_IP_BLOCK_TYPE_VPE is a new IP BLOCK type for Video Processing Engine,
> but currently lacks description.
> 
> Fix the documentation warning:
> warning: Enum value 'AMD_IP_BLOCK_TYPE_VPE' not described in
> enum 'amd_ip_block_type'
> 
> Signed-off-by: Juntong Deng <juntong.deng@outlook.com>

Thanks!

Reviewed-by: Lang Yu <lang.yu@amd.com>

> ---
>  drivers/gpu/drm/amd/include/amd_shared.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
> index 63e2153c00c4..314fd44ec018 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -83,6 +83,7 @@ enum amd_apu_flags {
>  * @AMD_IP_BLOCK_TYPE_VCN: Video Core/Codec Next
>  * @AMD_IP_BLOCK_TYPE_MES: Micro-Engine Scheduler
>  * @AMD_IP_BLOCK_TYPE_JPEG: JPEG Engine
> +* @AMD_IP_BLOCK_TYPE_VPE: Video Processing Engine
>  * @AMD_IP_BLOCK_TYPE_UMSCH_MM: User Mode Schduler for Multimedia
>  * @AMD_IP_BLOCK_TYPE_NUM: Total number of IP block types
>  */
> -- 
> 2.39.2
> 
