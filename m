Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AA48B7FFE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 20:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2ED7112E41;
	Tue, 30 Apr 2024 18:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OwJUZ6VS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D65112E41;
 Tue, 30 Apr 2024 18:44:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWn7DAAGbYRE0riY6F7IvG2MUDSShfzUvLSqjdqsq9X8U0YmIMq8bKLZnDxeY/B83uc+FFt6sp3abBU2CygUPm+5UUOd3qFvHTacpBNfvLxwl9Uz7/gq5MTvGgAGHH4YNahxphvOS01mA0GcPREKSQ6yfAheGiemS9Pc0f4eokAky8pUdzLyn7qdbIUqI2a1oM8VeFfl0vpPQTrtI/QcPiZKCUlPHXL+YgXNWdnYRxO7uMxl3qeB1o7OZfrXEcEen7bfUEJP7Lde5LMLupi6XiYZeDOikYSYXhCxg6IT2+8xDjh7v6Cdl/PRh9xMp6gkB+rfgcIEfvDUmODLxnf8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1PxNiLk7EZkfJob9xNrgaSlZV2ynVkv4pyEEhBaEW8=;
 b=IQ+kIlaNfhZ1f4oLx9pFnLlb+pOz1bEHbwpMlklBrTtDjP3UYhHe9cu7BYWJit4rUTBGdyAHTHgit15uLdXeb/1H7iGZdTZ4iJqv8OmxtevwaGBRO5OjaLmZKwCOytemcsuZMYZzbvrAxJX0DRQ7hVT60dK5lRSixdQJ3BU0Jw+n0PSK/zzbrUxEwcFsYkbcYoYIf1Sp3/S15TRGXL7kwdlpTqfA5D84ETmVkbsqEMjKxxCTxQxAe7WRWP2NCyydZ3LO6g9b0kxfhs28XM1+SQuW8LwpryNmgWBb8OJJoVxbAsTBeT+w9vdXWcNddYZokjkcQkZh+Rw1gEt4kEH/ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1PxNiLk7EZkfJob9xNrgaSlZV2ynVkv4pyEEhBaEW8=;
 b=OwJUZ6VSbU+AsHhYy7SE7ZgtPifckNZIQFVRR9ibuqaf3Cx6uvHB7yK9+RJ1YzO4WhQ+axr5Shm9WRtqdAT20ltTbAcHQRQtPkpzBOgf/vbv6zyQAdFR9It/mZNj37NqZM85ZBwjMupArNYYkSJIWrs+/mKyYlqlqaCZXht9Awk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL3PR12MB6619.namprd12.prod.outlook.com (2603:10b6:208:38e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 18:44:02 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.7519.035; Tue, 30 Apr 2024
 18:44:02 +0000
Message-ID: <c1d339ef-7ba9-4ef9-ae46-1b6b61743a92@amd.com>
Date: Tue, 30 Apr 2024 14:43:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: re-indent dc_power_down_on_boot()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alvin Lee <alvin.lee2@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Jun Lei <jun.lei@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <ad54bf29-cb70-49bd-a89f-c51ef7abb3ee@moroto.mountain>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <ad54bf29-cb70-49bd-a89f-c51ef7abb3ee@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::21) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BL3PR12MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: 773fe295-66e0-477a-93c0-08dc6945816b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzdrcFNSR2c4aXRuQTV6eng5Yk9ZbFdIL0czZk5EWlBjMGxXdStlUWZGY2Fm?=
 =?utf-8?B?aVVwbnlMTDkrZThwcnhoOHBaVUtQem9ZdFhIaFVSSStWWDYvaG53WDkwZEhB?=
 =?utf-8?B?QityV1kxRFZmN1VOOEpuaityWkxFYzdoUDFvdjhrYkxYMS9POUtuWVNmSkEr?=
 =?utf-8?B?STFvQnd6TEtTVnBkYWl3bTlkK1RjeWk0TGcyM2hjbWhaYi9GVWJ1cFFId3BD?=
 =?utf-8?B?L0J4cnVRQisyTEIxUzBuVUw2V0NEYjFURXcyRmtRVXlwVDR0bXJFc1lBcEdH?=
 =?utf-8?B?ODZkRzBBM2N6UE0vYnV1NCtaUUdxWWtuM2xlc3l1bXcyNlhueHhNRWZ5Y0ZL?=
 =?utf-8?B?M1VnWHJKZTkvS20xV3cwK1F3RXVxYUQvUk5NRkdTaEJ6RFRCMkdLUUZqVVpx?=
 =?utf-8?B?VzVMSTQ0RDhkcjA3SDhVTDFuQUIreWQvM3dLMzhLK2dXRGNGOXpMam93NDFs?=
 =?utf-8?B?Vm40VndMcTJ0T3k1eXdGaXRVNU9TVmtDamp3OFpRZldPVVduQzdRcElwNFJw?=
 =?utf-8?B?THZoaXYwU012dVBTRUNteGRqcTYrZGxOQW5iSTA3ZWN2WkhBTUR4S2c5WFhv?=
 =?utf-8?B?ZnpJdW9DUUtTcUorQU1YMm5VcHVmR0F3WlBtQTRIdkxjNzVOQUFmRjFYYnZz?=
 =?utf-8?B?QzJlcWJEdEdQTmxuQXZiSGc4eTlNSk90QjFCYjhrTEtZeTZoNGE2elNLS1lV?=
 =?utf-8?B?dGl3ZnJjelRSb0ZyRFpRNlYxOURtcTE5ajQ2UXRuNjQzWDZPMUxCcnArYmRF?=
 =?utf-8?B?Q0tRVjRHRGZKK0c1a2NoNUVUVStmcCtWUU4rdEJ6VjB2R1p0TzFPQlVOUDFL?=
 =?utf-8?B?MURMMCtPdkpBR3BHTFYrbElWRmd5cDFiSW1VcDFocGp5Yzh4aFB5WVA5UC9O?=
 =?utf-8?B?bmhqQi9hZVdEdEdBMXI2cm42WDZVRERLeVBnQ0xiSWNaTVVqbHZmamp2dUVQ?=
 =?utf-8?B?aUkyQkFHZ3NybkVlVDBLd0VnYmd0MlJnL3l4MGFJcmEzZ1JHeGNOQ2xsTXBv?=
 =?utf-8?B?c2haaUMxSGYzYUMyS05PMlQxT0NpRlBkUWQ2bGFVRjJxZTBlSHNKTmZzRWNF?=
 =?utf-8?B?MThObmJ0UURSNU50MDhNT1hVcVlsTXNIaFh2OFFqZ1ZNN3UxcDV4YXM1UVNG?=
 =?utf-8?B?L0xvdDI2TFI4VzFRZWpyZTlqS1N3SzhIUlpPNndRak56TGtNRG1XblhxdExn?=
 =?utf-8?B?eUwwMityUDk5d3V6MlU1aTF1OWVhZHVLWlJ3MVFqZGg5VG0vMmVSM1hpd2k5?=
 =?utf-8?B?MjBvQXpXVXUyUlp3em4weko5aU1tbEZWRnMwN3BYTzBhdzZqVU03aWF2ajlT?=
 =?utf-8?B?VlMwRElRbEZrR2xMSDVUYVV1T1IrN21NdFlVbkdOSEx6TWY3SmZZRlh6dDZ6?=
 =?utf-8?B?YVpndzVaSXI3ZjIvdk5qcUVldzdENWJIQ2dhd1R5YTZjRHpBMkpqNndoSU91?=
 =?utf-8?B?dTZwMVlyTzVmaGJzdTdpeStIVFZIbGxqL0cweldTTWgzOVBKU3ZkalpPb2hn?=
 =?utf-8?B?RmZLZHZWeEpJdktjMENHcUVLSjRxc0plcUgxUHpGYlA4QzFnenlWNWRnM29i?=
 =?utf-8?B?eWZVc3RmK3RQTEJtNjAwOUQzWWxoeTNKdDFaSGtVK1lQYjZnRk1nYXFxd0RW?=
 =?utf-8?B?ZCtIWitDaEdXWmN6V1JkL25NbVR5UlV6L1ZlY3pXTUxJaWNISTMvdUdxeXFR?=
 =?utf-8?B?Unp5ZWFNSnVsODdRclkyTzJTZENpUUQ3YjNOUVFCZWVVQ1o4Z2dDK0R3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1FLT3FHUHZBWlllaENWMEhJQzg4Wk1xbjBleVZWcHdZZlY3c05DSXlRcmhE?=
 =?utf-8?B?ZHhIM2Y5dHpLbkhTNDJ0UnJKWHQvbEV1cDBFTlRnVDVaa2J5S1ZjKzJ5dnNn?=
 =?utf-8?B?QkNLdUZqRVFlSXJ2OXgrK1N6WHZhZlBMeTZZTXd3cDNrMjZSUkc5Q3IvR2Fl?=
 =?utf-8?B?NVlCNG9HelZ4T2hNdHlUMGJPR25UVlVSeDZlS21mRk0yTWl0L1pzMFlBQ0tw?=
 =?utf-8?B?Mm5pTFVPdkdUZEEvVXpPdW1abm45RlB2am9FQjVSSnB5ZWRmUE84TWVqNzQ5?=
 =?utf-8?B?UlhiMjBLQVU2TzdwamZ2cVVUTlVSTnU5TXJoNVo0TlMycTZaMStIdFJwSC9l?=
 =?utf-8?B?QlFCMENmREdSMFdXRW1UYmkrWHFWQlZYSDhlQklHSnZZL3RMaDg4KzVKTFpv?=
 =?utf-8?B?QjlSV1gwd3BuUGx2TFhFMGh0ZnVHL2I5bG5INlBrVyt3NE9LdUtBaWphY3N3?=
 =?utf-8?B?MlJUdFIvTVRFY0JrSEFEcjV2ZktvNE15aG5uYjdmb3U0UUY0aFRFQUdVN2w5?=
 =?utf-8?B?R2E4eXpCa2NacDBvYmFmVTlMdzMvaDNrRVlMRTZoM1RDYUdMcWhlQitnRDg3?=
 =?utf-8?B?a3dxSzI5YVZrenZ5R2s5blVWMU5FTTMwRGhINHNIbjM3TkJNemxMb3VJRmZo?=
 =?utf-8?B?Y1ZWbGpzN3hxTzVLOFRIRTVWRThoZ0wvRHBFekVhQTQ4TXAySjZIN0c2MnZO?=
 =?utf-8?B?RjF2YzVKNE12Tit3SmtYMUZvbytjZkg5eVJkK2hGWk5KbEVuNms2RldKYmsr?=
 =?utf-8?B?VlA4cmF3V3NEZmlmQlZkelk4ckZnM1VSLzlHYm96elVLaUVlK3l2MFppRGlM?=
 =?utf-8?B?MDFhNTZUN1dnc0wyR2tzcGxuWjh4Z0tLY0RlcFNMN3RaZHZhNVk4Nzh6Mk9i?=
 =?utf-8?B?WUZTZkxla1NObVNydVptZitQRnZEdGpBZFhwR1l1a1V3M1krQTQ5bHVWY1Zp?=
 =?utf-8?B?ZElOQjN2Y2NpamVyMnlqdGtlRVM0Zll0ZGszeUxzNmswUUs5emVDUyt0ZVYx?=
 =?utf-8?B?U3ZiT3NqcUNkQUs5NTZlWUpaU0pPY3NGdXFZWFdmM3ZaSjk5SlVDVXljYjNR?=
 =?utf-8?B?QXkxMnBkZFZyV3Z1TEpRb2Q4bUlYclZYaThhNFNPN0N2UVFUSkZMZ0lwRHU1?=
 =?utf-8?B?T25hTFNseFBQWTJPVWVnd0Y1Q0ZnZWJkcVA4WHVDYkZUQU43UVp3dVJScUhH?=
 =?utf-8?B?dGtySENXSHdkTUtGOW41UEtheTlsZmpSbWcrdHZMZm1TQndoM0ZEWGZRTVho?=
 =?utf-8?B?WHRaNERvWU9sYS9ENllJSTNDUVErUElvNHZCaUQ3OEVOYlFSMktrbFpvZ3dh?=
 =?utf-8?B?TlNqUUZpT0g5MlVtY05QZS9wd25kci9uOHRmRXBQb1EySlN4Y3FvMmwvcmtr?=
 =?utf-8?B?RnNDM3YzUzF4ODRmd2xqTXVSQmp5SlloT2hyZTJvNkI3QkhkNXl6UDl0MktP?=
 =?utf-8?B?VXczOWFsMy9zaUxRVk9vL1Z2OEsxbkxvUS90Q2FEalhPcE5iemViVGx2b1gy?=
 =?utf-8?B?MUdWdEd2bkRmM3dkRGFqVHRGaDZnK21HY2JsRFhaT0ZmQUEveFNPdUhhOEVi?=
 =?utf-8?B?c2xHMXhBcXN6MXN0STlRK293WDI2d0Y3RVE5RGZhMENHZXJ5VTh3N1BWOHNE?=
 =?utf-8?B?OTgrYWZUK1VVdEZ4L0lZd1NiR0NEQlhNSVlrRUNPVXJZVzh1YWlZZEw0SDk4?=
 =?utf-8?B?eGJmYlhNYStzc3A3bzRMWHZSZnFSQXZsNzVGaHVFczRHdGxqOTluM2ZLZFRM?=
 =?utf-8?B?d0RuUitRaStVb3BLL0luWExickorTytFK0xjSXFLVTgwUXBadnU0bFB1WlBv?=
 =?utf-8?B?ZDMvWW5CMExleTBRalJLNUJua2trSkhXWVpRQ1MxU2pBckIxc2NYWlNkYTVl?=
 =?utf-8?B?ZDAyUzJZaUJsYkY4dStvY3JOamY5dC9PVFpMTjJNRllwUjRlN0lvQ1h3Z1JZ?=
 =?utf-8?B?TllucUtlR2E5d0pCTk81UDBVdnV2RXAyRzBIRXlEVzhVRGhBVW95a0MvSUx1?=
 =?utf-8?B?dDluSHg2Z21yeUkreUFYd0IwdXRPZCtMNDhIYVZUZm9sQy85R3VFYnlhbi9C?=
 =?utf-8?B?V2lxSkRiaUNOQTJOUnpiZ0FMazFXUUFrNjdEei9JZkl2YkNXU0ltSWIxaUd4?=
 =?utf-8?Q?IpeIE80kHvymHL9yyWggg/5Nc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 773fe295-66e0-477a-93c0-08dc6945816b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 18:44:02.6560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrtWn11ltGpHIdiOy4c/sMu3WLYPKS5mFFciKslc0VHGO/BHRC5P9riN2CtVawQ2yX0zCQ0Q91rVtv1BWCfRxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6619
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



On 2024-04-25 07:21, Dan Carpenter wrote:
> These lines are indented too far.  Clean the whitespace.
> 

Thanks.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

In the process of merging it into amd-staging-drm-next.

Harry

> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: Delete another blank line (checkpatch.pl --strict).
> 
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 3e16041bf4f9..5a0835f884a8 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -5192,11 +5192,9 @@ void dc_interrupt_ack(struct dc *dc, enum dc_irq_source src)
>  void dc_power_down_on_boot(struct dc *dc)
>  {
>  	if (dc->ctx->dce_environment != DCE_ENV_VIRTUAL_HW &&
> -			dc->hwss.power_down_on_boot) {
> -
> -			if (dc->caps.ips_support)
> -				dc_exit_ips_for_hw_access(dc);
> -
> +	    dc->hwss.power_down_on_boot) {
> +		if (dc->caps.ips_support)
> +			dc_exit_ips_for_hw_access(dc);
>  		dc->hwss.power_down_on_boot(dc);
>  	}
>  }

