Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED968B0A88
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 15:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFDA10FE7D;
	Wed, 24 Apr 2024 13:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rXGHFIDr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFE110FE7D;
 Wed, 24 Apr 2024 13:11:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAEq9jIarYELECyhkYMiUySXsOe47yeHaUfG7OG77cd6N/zKjuv8i7+zgIXe+7qdOIcjKgH0T93P+37huZCRP9ZqNaP4+WZYJenZkFcyXJ9GkKdI1RL4EFAx5L8sYZM19JMEzDWj3/PWkOjF01No8Tj3L9oUX7MC6tP0G1As60zk5/T1SmkGzAL6z6oCYcObf/G4Gqfx0FOhveMOI81Z6+oZ0cPRShz1Z3Eoa4KHxCkuH5uRD07AJHRWlYCXRLoVUwqBk2QMVuIYdsShvWX8erIQaFUxrEazGF79dPpTDoZCoV/mKHTRQA8NbjneBD0c/wm1HUKJyYDpAknzby71KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaJMtQRcbmea5CJ4vdJLFqYBQ6OWpMrpcKdMleg7WOc=;
 b=GgsKhBFySxEARf6EZK9P4r70Sww+TrrTSqXMXvM46nUCILt5HXJt2E577CjFPVwJMZIt3bppzVDNai4eBJMuzOJOUhfdfp7aty+q9Z4Vh/PRBgYjPezz6YsnPa5MdvF/jvtcsjV6Waod41lfCjqQLV0I45enbslRZSQqjUPfvCcwTGeGpvhhIfg39mrpBBh5PK2+oXmr0A//X4DmgtTGd7I//EDhCRjmjxO6mVpZxLH3z2cchbHEaCSvxe57KnKzw7RF4BEY/Sb7XzhQpLEyKSRNHlhYVfQjSSdz4cD6rNx8d2cLPOiGyrTZ1XzVs4qLzuhXrdY9ppV5U0r6g31P7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaJMtQRcbmea5CJ4vdJLFqYBQ6OWpMrpcKdMleg7WOc=;
 b=rXGHFIDrTjFkGnZvxC2wk+iKj2o1OJ3acd3ncFqNzZcmagPRx1GTYRHC3YGfsMVKqHQntDMOoJCnsrPpdBUFmzNwb2r3ow3glIpCWAgAhfr8gPG9NAB9+4u5MXi22GKjhP0Z69OV6X1Z/tDsNx4Js6g/Q/mwat/O9MsuO7u45R8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB4088.namprd12.prod.outlook.com (2603:10b6:610:a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 13:11:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 13:11:20 +0000
Message-ID: <bbc315ed-3482-4abb-b3f6-88c335dcf9d2@amd.com>
Date: Wed, 24 Apr 2024 15:11:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: re-indent dc_power_down_on_boot()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Harry Wentland <harry.wentland@amd.com>, Charlene Liu <charlene.liu@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alvin Lee <alvin.lee2@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Jun Lei <jun.lei@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <e5f538ab-ebc8-400b-8104-4642b8089b4f@moroto.mountain>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e5f538ab-ebc8-400b-8104-4642b8089b4f@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0012.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB4088:EE_
X-MS-Office365-Filtering-Correlation-Id: a7e155d2-4f33-4b9f-a2fc-08dc6460084d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWdQZDEwLzdYVmkrQWRySjB1ejdDa2F3K0o4STkzRzFjYTh2akRuQXFYUXF2?=
 =?utf-8?B?b3hNdDR6cFJ6MEdDQmUrcW13RmsxWGlKV2RzZG1ZdXFyaXF4aS9zRzllMm5X?=
 =?utf-8?B?V0pDVHVrNHg4bUJETXZBbEFmUXBKeVg5ZTFrNHF4Vkt5QzkvSmhWdXdvU0lk?=
 =?utf-8?B?bHIyMGlZQWNmREw2bWFXVm9ZVElYa2UySlZlN05JSFl5ZHVIbUVNMGh2QWl0?=
 =?utf-8?B?eWI5NGl2ZjY2WXREcmJ1K3pzalpwY3hqTzhZVWplSkdvTllIaEpJRkpUSytC?=
 =?utf-8?B?bW1MNnBIQnFWTkZYMHNST05Xb1RYLzdZWE1MZ1Jmb1AzVzY0ODY1SHRuOFlH?=
 =?utf-8?B?SmJvSnF0MmdJeWVKcTFXSnNFNTJkdWlnNlM3WW1kdXBGVjAxMUhGWjlwYW1P?=
 =?utf-8?B?bkNVa2RGL1oxKzVsS3ZON0EzTnBxSFdYVE9DdXNqbkVFL0tBbWpVdGE3VENP?=
 =?utf-8?B?N0xGQXUwR2FLK2p4bWJCUVVEa3ZmSlo2Y1BWM3QxN0ROcmluT2hGVG1LUWVD?=
 =?utf-8?B?NTJ5Ti9zL0xVWlMrRHRwZ2RRY3hHekVuV2VmdzhwMVg1cDNaN2pBNTFMWmFw?=
 =?utf-8?B?QStkME5rT0pkSDN4b3VKZ2w2TkdRenJnSFFNaE5wTmZ4RVpUazdia2t4eFlv?=
 =?utf-8?B?YzRwQSs3YWlxSnZyam9kQ3cwazJUTEw5M3RIVHl5djQ0K250WmFDSVR0V1Ba?=
 =?utf-8?B?RlBXdGFFUFhKWE1rR1hhd1ZoM0JSM3ZFeVdaWmlrUW5SNGk0VVR5dkFHdzlr?=
 =?utf-8?B?ZmIxMWtBR01Fem5CWlF0RVJNR0F4Rzc1UWg1cE1DUXVuY3FxSTFGYnBwTnpi?=
 =?utf-8?B?Zm5vTFNsYUVJL3c5YTNrd0JEd2p0TU5ueEJ4aEdQa1FLUk1CazhZK1NTY1dG?=
 =?utf-8?B?OGJHWndFSHZmVm1CWUtHTVlBZkx0Sm0yUXVHL2t5YlV4ZWkxUHhhRy9RcG8w?=
 =?utf-8?B?K3BPRnFlMWlTLzZiZ1lPSkY2WmljejNFM01qL1Y5ano1dDJESHZjNVVHd1Jv?=
 =?utf-8?B?VFY0T3AwaWpvZDdQVjBRenFDVjZFUWlMQzY4VFlURG9IRjNWOE5BSEg2anFR?=
 =?utf-8?B?MVlVb004WGJnY09nSGs5REZQYWYzZWs4czNnd0JhdmJYVTF2aVhTMi9Rcjha?=
 =?utf-8?B?RUtoSWRMWGFQK1F4WnRlM3ByY1plYkZyNFVOd2JSWGVFSG9Xd2paM2tIQ25x?=
 =?utf-8?B?TU5LVStwWUlNZkxmRjZMZ3hibE96K0N1M0dDeWJzcmdiSUR6L2M5MHFTTzl2?=
 =?utf-8?B?U2QxbDBnZFk1QkdtMHhIVGJvdXVIT1VxV0xVUDk0NFkramZFRzkyVmJuYWM1?=
 =?utf-8?B?U0puck8zMWUxN1lhRWxEaUR6bmQ0bzl6dGVTb28wZ0ZBbjFiOGNLVHk5VndD?=
 =?utf-8?B?cER6QkpycUV1L3dlTTN5QVBPb3R3enUxSHE1SmZvTVZmZnlZSGtUY2l3dkVZ?=
 =?utf-8?B?VDJraHpmQm90L0hzOGt3WitJZllGOFp4TFB4Wjh6Zng2ek1vWnZmeWRzd3pp?=
 =?utf-8?B?YXBHL2VkdnFsZ0tUMlI5b0pPQ2hzRndpUm5pbU1TeHFzSXREZmlPMnZESkR0?=
 =?utf-8?B?WWIvSkxHKzlJcU10Mm4vVlhqQVI1RG1OM1ZpZ1paUSs4RmJJNUppZGVGUkRS?=
 =?utf-8?B?Mzh1TldqY0c5OGdKalVjTjV2b0V4T05lL3BlOVRLUjRuQi9yczcrOXFTOHR2?=
 =?utf-8?B?MFFzSEVvSjcwbFJnUGZoUitIbEhZajZyK3dHb0xaLzNLTWhjbDc0RlpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzhVc2dSLzNsck5RWnN5QnJ6UGF5ZGhDM2s2TXhiRVBMZXhubzNma2VJb0RT?=
 =?utf-8?B?RU9HMm9OTVVKM1pQNUNJMnkyYXRnM3pIdWVHWFZDOEpOSmU4RnI2Mi9MWGd2?=
 =?utf-8?B?MGVXWjV2dkdrbmZLR2NnMU1CbE01cllSZkFiR0ZBWm9mY0k4OU1MaG5rdWxr?=
 =?utf-8?B?OVdDMUZXbnExOVFPeDhNQjM5NkRaekJyRXBvWnVEZ1lnd1FXRWNjZGx5Y2hy?=
 =?utf-8?B?TGJCMlo2QWsvMldoT1I2QmRhV2RlR1VyV3E1MUptcW5mM2hxU0xlbERtZWg5?=
 =?utf-8?B?Q0pCa0Y0V1Z6eURpTEJtd2ZkNjFFS0NGdVdxaWNCcXlUMGN4RDVMMkRDWGlH?=
 =?utf-8?B?UVg3K2xhT0s0eTNDTzVVMGhqY0VocVptR0RQSXdtY3U0cmxRU2FDaXR4L1ZW?=
 =?utf-8?B?RmZFTzVpc2tTenRvWjFXM3N6d3ZCVW00RHFWc2l0ZkV5Kzg5QlhaYUtUU3VC?=
 =?utf-8?B?UkxScG5qTDluaFhOMSsrNndvdG93MW5LanJ6S09wZnBRa0h2QVI3SjYrVjlO?=
 =?utf-8?B?SDVZQjI3MUd1eVJDeUNjMG5LakI2SzRlL1duV0ZyK0tYV05KSkR5RmNFTXVm?=
 =?utf-8?B?VzVWNnVRN2xZVWZuTzRPV0g3bEVlaTFKay80Sk9uaGJISTgrMXpVdHYxT1lM?=
 =?utf-8?B?Nm9wd2c4VDh4UXI2WldSOHhYdjExeklvY0hIU2dJRDNvc3VUZjFHUjNMQWZF?=
 =?utf-8?B?d0RqRjJ1Z0xzNER2ZGRyTWw4ajVSWG1xY3c5WDNUSVlzSUdtRDBleEVNVDE3?=
 =?utf-8?B?UzNYeGFuQnRCMituVEpTamFnY3J2c05vbnZBYUxDeWtQTnpOL1NHYktZa3Y5?=
 =?utf-8?B?djE3aWdUdUZ4azlXSmUvTXJjK1RiMDZMaFBOdy84aDY0UHd6Ym8wUnRiN2Vi?=
 =?utf-8?B?R2JDcDZNT1R1UHBiOWwzRmdKaEl0OVNNKytGbWRYNVFtL1I0UFJNWFo5ekJ1?=
 =?utf-8?B?NkhkU3k4MndOL0tJdzY4QmVpdDlBOHRtMkFhRGhwT1BVMG5PQlA3L2FhVDFO?=
 =?utf-8?B?ckxWMlRZS2g2TktDSm9YZmx0VUJ0c2pzVm1FRm1PZzhsaWJyRFUySEJmZnVL?=
 =?utf-8?B?NkJZVmlFa1E5T0c1bDcrS0VtUXlWOG5KdXJ4RHA2REgzTXFBKzUzdkJwNGZE?=
 =?utf-8?B?Si9TWnVRRUZSWS81MGdDQVRqeVhYd1NKT0N6Q0o1TWJiV0RvMDlvaDRXRGxm?=
 =?utf-8?B?M2ltSUExYWpYMC9aUWo4US9KVEYvbnc0QVFjTVFqUGZNbW1tZ0ZsSW1KbWV4?=
 =?utf-8?B?V3l0bHVyR2lOckNQTFY1KytleTdUQ285RU1rc1RqLzdBOG9GaUJjamxhemNV?=
 =?utf-8?B?WTZnN3dwRXdTbzU0V1pORUZPNGlIV3VaUmY3bmxCRnpDTTZmL2MrRnA4YVNM?=
 =?utf-8?B?dzRCWXlkZEsxd2NCWVAvWFJNS1ZFejFwL3gxcFhRU3VYcGI1VmN2VHVZSko4?=
 =?utf-8?B?UmYvS2NCZGNFcU00a2Q5SlRVZERvbEI4YmNzZ3VIa3crK1l6eWd3cXBtSUwr?=
 =?utf-8?B?YmFIRjhIMng2MU42dEl3V3VaKzhqaGg0bFpNUnNLSUtQTC94WVorY0FiVGcz?=
 =?utf-8?B?L1dyQ3c2OC9TTHMrNkIva0dqdTJhMDA1bDNYRWQ0Mjg0bkM3ZFc2U0EydEpr?=
 =?utf-8?B?d0pGWTlib21mOTkxKzVWcWNJaUFvZmpwckZMMFlRdDR3TVpCVTU0TSttejVD?=
 =?utf-8?B?ZG8ycFp5QVk1NG4xSmxCMDlscVpxcnRPUUpnc1ZvMkY0M0djYjNXV0drSjlF?=
 =?utf-8?B?RlBWZTVldkJBVGJaaUxiTjJxSDkrMzJIbVRjTHRlcmRDNVQrSmpSMnRTY1FO?=
 =?utf-8?B?d3RWclNIOGFwMG4vL0pzK3NXaWsreXZCRHpmSlpJY09kVHpxd2dBUDRlWlFW?=
 =?utf-8?B?OG5CMkk3TlgxSnc0bU54V3dSV2JjRmx6NDhua2xIQXRDSmcxNzhqancxZFNL?=
 =?utf-8?B?M01hQUZraXNnUzJrU1NWS0E4Y2xuMHl5djZFTk0wYTFSOUpBbkRlWHUxM0lo?=
 =?utf-8?B?NWR0RHBTS2k1cHgxdEVtM1htZ2FSMEVVT2FIcmZWY1VyV0EvUG8zaEhaRUFF?=
 =?utf-8?B?N1B0b1Z2NDNjdnRCakxtL1hYTmY2WWJYVU5maDdoMTR2SU1KQzFjZktkNVFF?=
 =?utf-8?Q?AhOXwG4MfSG3qWf7YLg4tbY3k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e155d2-4f33-4b9f-a2fc-08dc6460084d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 13:11:20.2898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhZcmhjeyCyDGfawcLoMRwzXFBpBGi/oxGSawFsusTJizgWW3Df6dSci25/3cH6M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4088
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

Am 24.04.24 um 13:41 schrieb Dan Carpenter:
> These lines are indented too far.  Clean the whitespace.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/gpu/drm/amd/display/dc/core/dc.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 8eefba757da4..f64d7229eb6c 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -5043,11 +5043,10 @@ void dc_interrupt_ack(struct dc *dc, enum dc_irq_source src)
>   void dc_power_down_on_boot(struct dc *dc)
>   {
>   	if (dc->ctx->dce_environment != DCE_ENV_VIRTUAL_HW &&
> -			dc->hwss.power_down_on_boot) {
> -
> -			if (dc->caps.ips_support)
> -				dc_exit_ips_for_hw_access(dc);
> +	    dc->hwss.power_down_on_boot) {
>   
> +		if (dc->caps.ips_support)
> +			dc_exit_ips_for_hw_access(dc);

Well while at it can't the two ifs be merged here?

(I don't know this code to well, but it looks like it).

Regards,
Christian.

>   		dc->hwss.power_down_on_boot(dc);
>   	}
>   }

