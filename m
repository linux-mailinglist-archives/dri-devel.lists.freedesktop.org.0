Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7B96ED1E8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 18:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFE710E02D;
	Mon, 24 Apr 2023 16:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2056.outbound.protection.outlook.com [40.107.101.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24ED410E02D;
 Mon, 24 Apr 2023 16:02:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KR8w1+1TWZkS1oZPiMlfgnC4cr+y9PCIQX6c2qy889YnWK+ksNAyiG5XPZMc5st4B3Jc4gfnVIZy+Fym8AFN0jW49U5tGsXC0t1K8eQiErhov3Z7DTcBeilnzSz6PPiPdUN0xLyhnGNlDNlDh0SlPYvvCp105VxZaAJppVX/wM80X5SGSNJLCe5HDtci2D8xi7qYtBd4kYTOnLQy1d9+QZlKYULVasEsIwFhRSF88+xrSXqstHQvDGvrjgH5I2wOWLTEDL/9vsscgvxZIazyT9O7hJzrWZiR4az7H7czIDwJMM8e0o0Z/zlKtFWJWQVjxhcykgIHZHOM3I+HcsMMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CerWld8UhSC3W7cbD30rsnxTOSiaBINNBx+wGKMn1I=;
 b=VzTxkH9IVAg8PBMHea6VrdActU28aeOZ4JUlYkmVeYeqpV22YHNvcIulYYuML8azRVIWr/uShD18V1vPjK+nuor5aflMY5IoiuXoCCx/axtm/Qe+GE6o2v30EAiC/ojVqYZd1qxQQh6Mpfpnvauez4pOxWot8UozFCfAi4IH0e8Z9GFLj6jBn4Vqk5bgS5yDYpSr8iRFo5nxbmLzO+E5bkDGDijoRVLEnylfJNfr14+9cuDP+pijrdSrcc0WPXNZgmi9NF+gdDzJ2Gs1UCQ80DqMSHtHoeMA2F8CzfKpLxnyFVfa/yUbyscM3mwoFw0Tr/Z8ip5IWxC5+kIRbjlKxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CerWld8UhSC3W7cbD30rsnxTOSiaBINNBx+wGKMn1I=;
 b=rtBBCBz26oMwJjyWUzo1cNf6tAlc6XtIYJ3SZ5BLmlWbR6GUUeyJlFl4MmQ8U1bH4+k8UJJ3Qc3UNWB+UMlve5us96Lz9yXNP5XnGiWMKiTKc7rVUHrxH6jUcKJXTSrin7DEnCFJZda8De38EsEkYR0Mos/NULhK0LmxFDVqwiU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 CY5PR12MB6322.namprd12.prod.outlook.com (2603:10b6:930:21::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.33; Mon, 24 Apr 2023 16:02:49 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 16:02:49 +0000
Message-ID: <dbe9d614-2d8e-9fa1-80e7-b419f08dd78d@amd.com>
Date: Mon, 24 Apr 2023 12:04:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/amd/display: remove unused variables
 dispclk_delay_subtotal and dout
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com, drv@mailo.com,
 roman.li@amd.com, mairacanal@riseup.net, jiapeng.chong@linux.alibaba.com,
 caionovais@usp.br, gabe.teeger@amd.com
References: <20230420180705.3893475-1-trix@redhat.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230420180705.3893475-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0101.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::20) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|CY5PR12MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: 466487c7-fc3e-48a8-6c09-08db44dd59f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TiNicRfkafO7diTHpgjEnjx2tFcZsawtZY7IeKPBAsZUXiQ/WhqyLCASEPuGxUtBaDvdb74KXUSDvivnInhFnyF9n9oFvsJSF38dMrfwhLnqBD9Pr6CMzygcz7QSIugBZ9nqvcQMq8GCdRqSoWj9wg4VwrHKdLKJ8NjP+FKXUeZsOhnO6NkMomV/zQYd09xCngoTZ6Aafxond5/fARkWxi8Zg469vFmVbB3NXcQ6hKISB6nZTzhswa8cjOgPoGwcYK3EgJhZ5653xxlxcG+j4aDcJA/Jj8MdET3RCdvu4ZPN9hp/uMLJamfVLEWGVv9YtkXYVA3IG3KG5HRcCOAvhkiISLJc7cWI/PeBMRJdmPrV+PcN+7a7ry2wMwlj4149Qtq5mvADyZfKhr71CYGFKkIHdwwEcG/kn3anIXin4dyzMvsNNrzcErYzY9BKhob/U5tzKQr0pgoZ5lQu6jFMzENLyAjs/57YMSP0nsHtlwnapW24VoSJrPbJmKzLQwwpFLHKV818j6Zt/hNwlsFziX5AdqYCyy4wE65NE5RAbNWTgOzgS+lfw4E4N5tFRn1+ZgtKp/z4x4gsu2dm3faeaH4zU/XNJN/z9QQH016egxqndXwyuP/yRxvIY8MHhtyZ1+f3IHxaY3vsqU3pvNsTDSmK+i0Z852ZcVYa2LLuWTY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(36756003)(478600001)(316002)(4326008)(6636002)(66476007)(66556008)(66946007)(7416002)(921005)(41300700001)(44832011)(2906002)(8936002)(8676002)(5660300002)(38100700002)(2616005)(31686004)(6512007)(6506007)(26005)(53546011)(86362001)(186003)(31696002)(6666004)(83380400001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUZCTDAwVXNyNHByVlFORzhYT3VMYkRVQkM3dkJjalJNTkptMjJ0c3BZYVN4?=
 =?utf-8?B?T2sySmV0ZHZFc256OThxU3c3SDhzTEVBZnFjTUE2TUR0UEJiVVpJWi9qeTJC?=
 =?utf-8?B?OWV4L1VBbzZGTDJkU2EwYlRxc3hNT2V5cWlYMndTaWxJa0VsaXZSRFpjV0hZ?=
 =?utf-8?B?RWI1V040SmR6NmtEOXJRRzFGS2xta05PL1pvYmw5bWVHWmFVOE9IeDdXMkVq?=
 =?utf-8?B?K3hOdks4WnphdVIvTUtrNmR4dWVQWTVVbkZmN2dGUU9jUWxxUnRGdVpMMzUw?=
 =?utf-8?B?RUVWSGgvQ3h0S1BzeTRaMU5hZmNWMTRsdlE2QzZZL2RFdXE0SGo3OUtxajBn?=
 =?utf-8?B?ZzlXdEs0TkI2TmRldUF2YnVFdEFWTnQyVE9wN0doZGU5dDd6SUJWVFo2aGEx?=
 =?utf-8?B?Y0VJNnU5UEdUakxtUG45bGxQaE5EcGx6RE1pMEg0L29YVUFVN1l1R3lDbFdJ?=
 =?utf-8?B?aVZ5dFFET3JZYS9talJRdE5CaDZXbmFmMERCZUxjVG5TRmFMeUozN2R2c3NL?=
 =?utf-8?B?azE0SThuVk1hbjFQR0ZoS2ZicnZDMTJYeG4yR0w2elJOYXpkOW9pcjVZTER6?=
 =?utf-8?B?WHNKNHZLK2Uxc1NqbHdacnNVRkVacTFxbThiQmZCdFVIL1pZeGVnekgxUHVE?=
 =?utf-8?B?RWNIQ0VpaUNJNGpZLzVneTkxVmg0OXU4bG1meStLRnhWbEJoN1JKSFRTTmdw?=
 =?utf-8?B?OVhTaHl4RVZxenE2MEdoeUVWSlFOT2paTmtIM3hwdmNTWm5xdlU0TWdDMVV4?=
 =?utf-8?B?SlJGVWRTYWFBRlp1dVUxV2x6Unh5cjRmQ1RBcVJCU3dTS2pqUk1qbTVnR2Qw?=
 =?utf-8?B?RENJN092MVFjanNCVlpFbk9CMlJRMGxuUFNid1Z3V2ZLTHZQSG1RZ05tSlF6?=
 =?utf-8?B?UGhMeGpVYVRrMjY4cXBFb1dadTV1RjNJQTZ1SGpsbjJIRCt5OHc2c0RERDll?=
 =?utf-8?B?cS94bGdhQ1VYaHZGTWV5SWkxOUJxeDVsQ1QvNzY1dDN2a0dKR1IzYksyUXc3?=
 =?utf-8?B?L0Y3OUhLNWZTVHdCV0J1WkF2Mk9CSDFicW4xSWI2R0JqTHVEZ1lMTWtPRW9G?=
 =?utf-8?B?dzZNZkxLVGkzTkJoaXpwbjJ4bHVhQU9ZWXhmNC8wT3EyOVFjaVVHTDFJZDRm?=
 =?utf-8?B?bm5MNyt2aEE0Zzc5c1VzUElHL0QrZnU4Z0VPVStkLzZpb0U3a09QV2tCdE1I?=
 =?utf-8?B?TjdNU2dVa3l4ZHpwZW9XYVBVUlBQVlpqTU4rSFhoa0tUWnlOc0tqZXRxdGo1?=
 =?utf-8?B?LzhlQUdMNHZmSDloTEk0TjYwT3pNRzA1aFpibk1WQkRITUd2MVJPY1F5dHNC?=
 =?utf-8?B?M2RLbU9WUzlUK3FyRmNJOFdQbS9oLzdDZndhT1kvVHYrMWRPaXAwQWQ4R2pi?=
 =?utf-8?B?NWFFSUhtM2M4ZUg1WWFYeE1SMnQvam1vNnlGSytTY3R5QmE0NmhZSWpiYnZ3?=
 =?utf-8?B?Y3l2U0thVkZzRzBuSkVCZFFsQzhpL2p2S1VZSzE5NWQ4ZjlaV2NwVzVNVUxJ?=
 =?utf-8?B?RXpLdkFLeHRBSjYxMDdsKzc0Zm5SVUpMZ1M4Yjdxb25wR1dlcnUxTmRWU2lI?=
 =?utf-8?B?QmpOck1VYUI1NktLKzZXT2luWW5sMW1WNUcxTmxRSEZ6dzgreWEvQThGQ0Jq?=
 =?utf-8?B?NllvNDdjUU5QNnRUZmN4c3F1Z3dMM3g1V0RBRWw2cGdGd2tHNXRQSDM4bTl3?=
 =?utf-8?B?TXozbEhCWFF6TXVGQ0ZldmlqVjZDNXpYVThVbFZIRE1IWHRxd0pFdjFVS2Ra?=
 =?utf-8?B?T1Z1TEFFTzNCU1Nib0pyYndWc2dLTkRVbnVYVnFsR2Z3VUhZamREVzZpRXlP?=
 =?utf-8?B?RUJpV3hTSVZYUGxuS0xPQ1Z3djlwMjVoWU1PNldTdDZ2bURXWUs0VHE0OVps?=
 =?utf-8?B?aGkvQmhsd05DbzYrTHlzbUhLcVU4SW5qYVk5YnpHVEllbjI0bzQraHRXblBO?=
 =?utf-8?B?YTRlSFgxSUZPcWlYYk9Hci9Yb2RvUzU3MUNXZWgwdnhpR2NXZmZSQWJaTytZ?=
 =?utf-8?B?c1lmcThwUEJOME1TaFlGOWdqQzRNVEJlbm52aFJmSGFIaWpxMmQwcDJxYnhU?=
 =?utf-8?B?aGttdnd6VHE1em5kNDRWejBRVzNiT3FOZU10VXE4aU8rSkxmYlJMMmkwTDVO?=
 =?utf-8?Q?pG5uHzB9QFjZprxFyPBuAo9+9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 466487c7-fc3e-48a8-6c09-08db44dd59f3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 16:02:49.3603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcBAyX8cVAOXp5yOnRZ9UTaSiIQoOhfeqLrtBY3fY5cAtsycZTT9Opuw2UmGZ6VXHKrP9jGFwCr8JfwaMzgsmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6322
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/20/23 14:07, Tom Rix wrote:
> clang with W=1 reports
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1003:15:
>    error: variable 'dispclk_delay_subtotal' set but not used [-Werror,-Wunused-but-set-variable]
>          unsigned int dispclk_delay_subtotal;
>                       ^
> This variable is not used, so remove it.
> Which made dout unused, so also remove.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied, thanks!

> ---
>   .../display/dc/dml/dcn314/display_rq_dlg_calc_314.c    | 10 ----------
>   1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> index ea4eb66066c4..239cb8160c77 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> @@ -951,7 +951,6 @@ static void dml_rq_dlg_get_dlg_params(
>   {
>   	const display_pipe_source_params_st *src = &e2e_pipe_param[pipe_idx].pipe.src;
>   	const display_pipe_dest_params_st *dst = &e2e_pipe_param[pipe_idx].pipe.dest;
> -	const display_output_params_st *dout = &e2e_pipe_param[pipe_idx].dout;
>   	const display_clocks_and_cfg_st *clks = &e2e_pipe_param[pipe_idx].clks_cfg;
>   	const scaler_ratio_depth_st *scl = &e2e_pipe_param[pipe_idx].pipe.scale_ratio_depth;
>   	const scaler_taps_st *taps = &e2e_pipe_param[pipe_idx].pipe.scale_taps;
> @@ -1000,8 +999,6 @@ static void dml_rq_dlg_get_dlg_params(
>   	unsigned int vupdate_width;
>   	unsigned int vready_offset;
>   
> -	unsigned int dispclk_delay_subtotal;
> -
>   	unsigned int vstartup_start;
>   	unsigned int dst_x_after_scaler;
>   	unsigned int dst_y_after_scaler;
> @@ -1127,13 +1124,6 @@ static void dml_rq_dlg_get_dlg_params(
>   	vupdate_offset = dst->vupdate_offset;
>   	vupdate_width = dst->vupdate_width;
>   	vready_offset = dst->vready_offset;
> -	dispclk_delay_subtotal = mode_lib->ip.dispclk_delay_subtotal;
> -
> -	if (dout->dsc_enable) {
> -		double dsc_delay = get_dsc_delay(mode_lib, e2e_pipe_param, num_pipes, pipe_idx); // FROM VBA
> -
> -		dispclk_delay_subtotal += dsc_delay;
> -	}
>   
>   	vstartup_start = dst->vstartup_start;
>   	if (interlaced) {
-- 
Hamza

