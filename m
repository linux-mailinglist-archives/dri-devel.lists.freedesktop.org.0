Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492D46E96D7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 16:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80ABF10E9A0;
	Thu, 20 Apr 2023 14:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48BC10EC65;
 Thu, 20 Apr 2023 14:17:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiLyFGYSpYFqZfes6WiOhzuHo3nk543Z1QCvb5WenEWlpy6cQ0kBVsdN4qgE1T1ycf+knrT52tTXCAUM529ghlyX6MV+hXSWj5zOIr//z4sEfJeb+FUlttJ089QxnWsZfHfghfvDu6WHxxUH5+TOPOR2h3OlszpAMx9Nbgu8ZLOy84PDR3+2TA7wRFg9VNW/phlAA8RwYofBr28GpdlkBrFFwte+4o1jdYkF8MlV7peJfee9QttnROZ80pJhLbgubnrRhvNokUsiDEvpmg94cApSKBDozha57hJESH5YxbvjCli7yOqkEdiISNXJZUw+13Gb3l4gRwaBjHMGw24/bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwMN8LpAhzz0Vl0MrsNNBFUEN1kKGyKyN1qyh7FisFE=;
 b=Pq5VjT33BDtwR21F0ddb630pAgyhP3KxYAfYWK5wLBRjzo3ntj8XYsUrf+cCOy86kVIbh36hhuvSn0D7iyp2qMQC6MeHjVSmg/w8Sb3vsMa3YCvlVxewF8vdbfnoNselWebvsXlNFg31la3kkwGAEOlXDCyS2rhTKVc3VO50uXItOFiW1DioRkiwC6m2vFHw/t7AlmzZDfCX29ipXJqCqblDr7xRQh5OtQKNh9WE6HlUq2emUQ5z/posPDxQ4H8JHQcasZRLTNJFPRQ7U4XuTdfeYlUSTcPxHH3ioEqs+auc+4NwxQ1GkKH49/bJsJpOO38jm1YLJgm00K8LU/KXJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwMN8LpAhzz0Vl0MrsNNBFUEN1kKGyKyN1qyh7FisFE=;
 b=ExniKPgFrR72ZrY93x+i/ELCYLjo89a8eROt+gf7AqkO/CdCFIzdgoPLVoITok5P3F26f+XCxQlc1vDXTnxGZ010XfD3v8ZbjEwoAx37rXmzdEq7Hx1ZRTAgrqZ+152CGPal6AlXOvn+3WOlHPZ/JQUVqNgDA+hKiEs5wBL8X0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DS0PR12MB6557.namprd12.prod.outlook.com (2603:10b6:8:d3::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Thu, 20 Apr 2023 14:17:40 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 14:17:40 +0000
Message-ID: <0b01ff9d-95c0-02d6-ba77-9af234e02a2f@amd.com>
Date: Thu, 20 Apr 2023 10:19:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/amd/display: remove unused variables otg_inst and cmd
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, qingqing.zhuo@amd.com, wenjing.liu@amd.com,
 Jun.Lei@amd.com, Josip.Pavic@amd.com, Leon.Huang1@amd.com,
 Nicholas.Kazlauskas@amd.com
References: <20230420020422.3256782-1-trix@redhat.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230420020422.3256782-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0191.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::24) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DS0PR12MB6557:EE_
X-MS-Office365-Filtering-Correlation-Id: 82bcb6dc-989a-4194-0218-08db41a9ffe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YzUzig4hysDdLn8srpoNrOyWrg20iend1l0iC5K2znoUr4ON1xh16D716aHspVUVGODB+JNliN0pmAIT2Pq0pPyc2TbCJETCZr+t1zeF04X1Bdo3Faq0h46jCQAypt2GKETtfsS0FaXciac3635d0AXwRfc7cJKg88GSnGctoHv7Ly+TdjhIKIdsTANF56f6Z3UbIoVO7UzBnjhF2e8V5YS99fGaQCDHvHKD46Up+yPzgz6Nne1eeNWVWiEfqvAz7QIf0XI8UyjDfkUpz1Qh/GoDCMo3DuD/Oy7hPy7o8Bs0IUUE+m0BpT2+b3J75A528NbYHyYTfLNc+ZquUPjJ+af4Qs+t21rhS0VRDKVf4ex2IuCGdXSC8tUzaN+5GI4eUlFao2HlgP9XYF0kvrE/A6z6/Qf7ElT6P6U3zuIaNKUm3BMyfzzAjwswzgWeO65gdDYUcBhbPnkkZBDTomRD/IxuhwW3oA/m+YG0RWKqZVhfY1/Ky7B+2PA2EF0A5xNkKHuXoL0zxUKLgyRYQHCNdC1h8gnJCwY6gRUnpiS7iJtnYf1P9x0p2lLGQB9SC+LZzdGXI8vrI1mmmAeqZdjPADGgdejAV9LjeCDjax5YshJ/0XJugaNEIK+xQUr9v/aTVJ5UpZRFfeAkyZSVKcTJGwJ7TrfYoQ5hBPZe4lD9C+o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199021)(36756003)(478600001)(6636002)(38100700002)(44832011)(5660300002)(8676002)(8936002)(66946007)(66476007)(66556008)(2906002)(921005)(41300700001)(316002)(4326008)(2616005)(31686004)(6512007)(6506007)(26005)(31696002)(53546011)(86362001)(186003)(6486002)(6666004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHZaZzJrTUtKTG5qakhOcy9lVlFyczRDY2pFUlg2MTZXbUhhcHA5cW9WT1Rs?=
 =?utf-8?B?eFJmZWxUVE9aeGNqQSs5dFB5VjJjNmcyRmc4Y2FwUzdlREpRdVVPanZ3MWJk?=
 =?utf-8?B?YWV2Rnp6L3hDLzY5Rk9WeklhOVFLWTVwQi9sWjBqTDliYTN1V1J3cFB6Mm1S?=
 =?utf-8?B?SXBvQllEc3dmUStmcXJGNmlNNjc4WXVDVWxqZyt4dGN4alUyc1Bsdk02d0Jp?=
 =?utf-8?B?K3JrWmtpWE5tNmJLbkVZUE9uVmsyblBET2dWeGE5QWllM3l3RGZ3VU5JeTgy?=
 =?utf-8?B?alVjRElXdWhrVnBmL05TbTlyTzBjODhaVnpUbW1FdXhua280RjU1UFEzT2ZN?=
 =?utf-8?B?RlNXdHR3elc2UURSNWtkTmdOZC8xSE1mZmFJbC83MkpWSGpSSHZNVkhBR2Y2?=
 =?utf-8?B?WE05dXgrS0tZdmNOb2FwYTJxaU9JT2hHMzBPM0ZBdGhKMFVBcTE2SDBzbTBN?=
 =?utf-8?B?U1hUMWtieUtxK1BKQUdRY1JyY2tNRXluT1R6UDB5V1BXT01Rd3psdDNhRlhp?=
 =?utf-8?B?RE4rWnFjbEtTQWFGOFN3OFVFNytobVYrcHFkNldhcmNUZnBIelVpcllZWnZx?=
 =?utf-8?B?WmRZRVhtRUFKNXJNbFFqeTZSYVVqaGZ6ejB5ZmczTDN2STRmQTVNUUNBOGMx?=
 =?utf-8?B?UklQcmdiVjd5NVpCclF0R3lXaWNDcWFWMTg3bjJQSmR4WHlnVUg5SU8rNGxh?=
 =?utf-8?B?S3lPcjJPaGZaU2pISEFZRG0xLzYrY2xmUmFzUnRuYXpuZzNtd2ljMlV3UGo4?=
 =?utf-8?B?MkxhTFliYmJyRkE4TUovOWc1dm1rMythRVUwNHR2YVRKRm9lTE1NV050NEJZ?=
 =?utf-8?B?c1RRcXd1TXVobzkzMGx3bEZRYnFNakJTOGozeUh1cUtEMjcwREgvQ2NYZVVK?=
 =?utf-8?B?eGVpMVVlR3ROVDBuMGV0ZEVmcHJ2dEdDRkZNMTF3Mkg1Q0o1cTdjOXhDSXlh?=
 =?utf-8?B?VTVrWFFpMkxIMU81Zy9iUWhoNWdocXFVWndBTHY2UkQ5cjRFdkZHWTBqT1FB?=
 =?utf-8?B?enBqTjNLaGVUOGl3WkUwQ09NRWhxSm54Q29PM3VMOGQ0WTU1dU0rOFI1MEkv?=
 =?utf-8?B?dHIzc1NCZGUxQ1o3bEJiVW9nUXI5Uk1BQ0Y3cTZ6Z3ZqaDZNTkxBMWN5VGh5?=
 =?utf-8?B?cWRha1crUFZMUXNQSTFLL0drK0N0U2F4RnlRVTFIcVIrNnd1NkRPNFh0bVdo?=
 =?utf-8?B?K1hiWkl3SzVCUVA4OFAveFFZT3ZCQ2FMd0VLTXRJYnFVVUR4azdCNG5EbjBT?=
 =?utf-8?B?eSs4R1M1TkRyRzBaNGxSd1kxZHBpSzNPNGxEelJmbGZWcGk1VGRoNWsySmFh?=
 =?utf-8?B?aUV2SjV5MDBZRFM5bklvYXZXZnljcnhVUlIraG00cmtSR0NzdHRxY2lSYk50?=
 =?utf-8?B?S0xKc1UyU0RPczIzME1xeWZsNHJQbDRLMTdmZnpMemZKZURycTZxRFNOSkgx?=
 =?utf-8?B?a29PemJueTZUaXNXOFVaZTYwYW5yY2g1SFNNL25rOFp4cnc3TXNaRWtCYmJJ?=
 =?utf-8?B?ZEJLVGxUVWV6N0FQRVpjMmEvd3JkU3RXaHAybVpDTWU5dVZsbTIwY1V6aG80?=
 =?utf-8?B?d2NzMEtnUFlUNThoVS9vRHc1bDNrcXI2MEd6WStJVW5LUjI5Z0JneTZPU3lr?=
 =?utf-8?B?ejh0NEFtZVVrcWpEU3M1YzlnclpXZzRsMWRBY05Pa1Z5S0Z5R0FTbG5mWU9i?=
 =?utf-8?B?MFQzQkNvRjFHcGhxc1YrMW5pdWd1U2htUW9rdWY0eUpLNlZ4NUZQMFhWWHkw?=
 =?utf-8?B?T01rVElVNFlFTXZkMWt2RmdyL1h6WEpjVzhFbFlnNFd5cGZPMnU1YVlqbU16?=
 =?utf-8?B?RE5kU3dxaWMrT2cyNkRiWE1QUzF3ZTdBcVdJeTUwb0NxRjdiTmNvdll1clY0?=
 =?utf-8?B?amFkQ3pSaUF5eVlCbVZaTFA0OExrTkYybHovRHovWFlRVGMvM2tBeHpSOGdG?=
 =?utf-8?B?d1hnakxMeU9VcUF2SVRCMkVpWWFEckgzaklXL2d5ZDVmQkgvOW5UcU5IdTlL?=
 =?utf-8?B?Zmowbk1XYmNMZzNYcHJKSWwwUEZtSGFDN0hpRm1tRzV4MFhtaVJpZ2hlL21k?=
 =?utf-8?B?cmo4NDluSWN0dWN2aVhCeHdEdklpVjlVRlhSMW5vS0VrQkNycjBQMTRoeFZH?=
 =?utf-8?Q?3QJEDAhOrBa2XRP1yrj2F1Msl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bcb6dc-989a-4194-0218-08db41a9ffe6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 14:17:40.4063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyDexukq4uKYYhYEQBubZ1dtCOWeVparYz6CsnkCKH87eD85gt7/uGZ2hfnloFHYmNRtaFw/It2DQHdkcWWWAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6557
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/19/23 22:04, Tom Rix wrote:
> gcc reports
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:
>    In function ‘dcn21_set_backlight_level’:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:229:18:
>    error: unused variable ‘otg_inst’ [-Werror=unused-variable]
>    229 |         uint32_t otg_inst = pipe_ctx->stream_res.tg->inst;
>        |                  ^~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:226:27:
>    error: unused variable ‘cmd’ [-Werror=unused-variable]
>    226 |         union dmub_rb_cmd cmd;
>        |                           ^~~
> 
> These variables are not used, so remove them.
> 
> Fixes: e97cc04fe0fb ("drm/amd/display: refactor dmub commands into single function")
> Signed-off-by: Tom Rix <trix@redhat.com>

This has already been fixed, as of commit 1adb4dd5bd4b
("drm/amd/display: Remove unused variables in dcn21_hwseq.c") in
amd-staging-drm-next.

> ---
>   drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c
> index 55a464a39529..43463d08f21b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c
> @@ -223,10 +223,8 @@ bool dcn21_set_backlight_level(struct pipe_ctx *pipe_ctx,
>   		uint32_t backlight_pwm_u16_16,
>   		uint32_t frame_ramp)
>   {
> -	union dmub_rb_cmd cmd;
>   	struct dc_context *dc = pipe_ctx->stream->ctx;
>   	struct abm *abm = pipe_ctx->stream_res.abm;
> -	uint32_t otg_inst = pipe_ctx->stream_res.tg->inst;
>   	struct panel_cntl *panel_cntl = pipe_ctx->stream->link->panel_cntl;
>   
>   	if (dc->dc->res_pool->dmcu) {
-- 
Hamza

