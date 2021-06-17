Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FC43ABC01
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 20:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3FA6E1BD;
	Thu, 17 Jun 2021 18:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C08B6E1BD;
 Thu, 17 Jun 2021 18:42:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DU5v00txmtuJ/g4cnKoro/LJZs8SzzKsX6oThUrJ0v3SKjUvVfSHLuzt3jhnE3ctBszDFfXRzP8PwhR1snpFxad6K/ssjQv9Ms3x1mGQ3iv7NleUOazuJjfi7nDN+TVZXnLBD9xK6BHpaooDdR3rku7dZv7ANKMxTdivex0EYVsQhNApADwQv2lHH7/wm4AUIddOB7SvVcrdBYYXz4pk4p8B9sUrxFJXQZE2oftiGpbYYfzdkd1VWk/V5Vde7gURwEGuUdiRAxYDehKPMUFIDPXBMyI5lX+QozvgIRAlxuMbeggDgNdk9wFkOrbk/Mr4Ze6VLq8SqBZKNU7RRz5RhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+G8ji8N3Ie5TtSQ1lDISlZq5+SiUFbbF7n4u+Ay2Qo=;
 b=DYLOnYwEti56JeGLkDw3mC57V47Eo/GXFKaXwIIa/ZVFyeAKp5dKWcdTEoIv05MkoDIGYcfgl2+DlB1FC/5F1cj4Cplewxkrmwc9ISVe33giupD/mLNozzgwrrWqkwRgx5+mbZQwanlaYQw2KWIp6qnFiVaLbRPmc+Mk/pwyrElV7XIc3c0OnHbu83UnW0OVBpYdza1sxZ+SM+XD3AYLvW34FM8eYZq82e7RfwtaO5Q+5GwO0hv0s9LFf8wuCpn8EHJ64+bVzrfsm+o8PDG8zAOx5QfxilGe7eWqvHuO5zU4MJJ+OOnbAICmqt5KVAgoaDQ7CcMkb+7oRl0OORySTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+G8ji8N3Ie5TtSQ1lDISlZq5+SiUFbbF7n4u+Ay2Qo=;
 b=IOnQDLPTF55ml1JGER+CuJ7WntzS2DlWt7ydIEnoKKD5HkMCdlOknlNMiOECxzDvk9LeXTzDJIPoqldW8XW16IF4yVBbGSE71RCIKMft27QXvFYGyNJ77SbADKr3DXH3ax2ZAAu2+pxr5WiQH8U68VaWONdnvORwRTS5kSxhwdM=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5476.namprd12.prod.outlook.com (2603:10b6:303:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Thu, 17 Jun
 2021 18:42:57 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::401d:c7a2:6495:650b]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::401d:c7a2:6495:650b%3]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 18:42:57 +0000
Subject: Re: [PATCH -next] drm/amd/display: Fix gcc unused variable warning
To: Pu Lehui <pulehui@huawei.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, Jun.Lei@amd.com, wenjing.liu@amd.com,
 Anson.Jacob@amd.com, qingqing.zhuo@amd.com, Wesley.Chalmers@amd.com,
 Jimmy.Kizito@amd.com, aric.cyr@amd.com, martin.tsai@amd.com,
 jinlong.zhang@amd.com
References: <20210617023109.204591-1-pulehui@huawei.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <fa86062f-cb45-245b-1bf0-494ffcd33908@amd.com>
Date: Thu, 17 Jun 2021 14:42:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210617023109.204591-1-pulehui@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [198.200.67.154]
X-ClientProxiedBy: QB1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::31) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 QB1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:2d::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 18:42:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e33c9223-13b9-4054-4711-08d931bfb9ca
X-MS-TrafficTypeDiagnostic: CO6PR12MB5476:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB5476A76C5B0F3355EEA97B1B8C0E9@CO6PR12MB5476.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OiFbC5H6bIZHDDw1eYDXSPQySlTMdrWwC624sJsHUfHjqB+v71uaZYhZUra0okFxWkwDJrZR2rJhckgv+/2mxmz0/W8vQcY/34scasp03mun/oGowuT2flLvhZzdYHx1Z7rctVaYS3YZQRRFD7zL7EOwmxKg/9VFpDBXMkqm0QlBZhv6qp4mXEP1LDrR8tYjZPnTk9pTMT2GMRq+5dMZTGNQSchaeFwJ68y2b9dBKio3TYQMjpklTpngoQU4bI2PkNvh+wzXJiT5pB6PJ9YR+glN0MY2gTw5thzTTgvj8wMZHSAyv1hm8tKePwWH/vAS5BB7OBmiZHGQ7hFQVM13JOAT9Vb4Six3EF6jtibBUgnFb0sMddNgBsB61gKasrrPuNuzMXFcZQfOF7r1+3ozfV7+IC8PM18DzgvNIeE58lA1OoROhAgBELjkRJEkOXD0wAV7wdMX9MKP/uGJT/+eUeMOtVH0BRTCp45WBROcS6q+sarDCmR91DufFUDk9z2tqR9aQ/auZ3O9cfD6Y3xaewf+p2hRY5zd3Ddx+CPJQCoWwDm+PY8SUJXScE2Mlfal5RuXtF5WnFtifqegPXuUqTHgLoGRjUzHIifS8gfnPF/z90OOUip2ZKW1FYMJKDjwbGu7Q5gOUn0M+Y14L4lp3Zg5stLqbSc1jfkF1fU+IRRy/u8439qXApNT3cv7rkv6L3Srki+L3tUOgG+CkIzROg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(2616005)(956004)(31696002)(478600001)(8676002)(26005)(5660300002)(921005)(186003)(38100700002)(36756003)(4326008)(2906002)(6636002)(44832011)(66476007)(16526019)(66556008)(53546011)(316002)(31686004)(6666004)(86362001)(6486002)(83380400001)(66946007)(16576012)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODhqZWtPWGhCZlF6MGo0cVI3YURUajN0UUVoZkhFVzlob3JCd09NM3RSUHlR?=
 =?utf-8?B?eXZKL01EYThKMU95aHNmRkVMTGNub1VXbXJMMDEvb1NoQTJtMXBRSWZMWGsr?=
 =?utf-8?B?T2s4VzNQejNvbmtrbHpTVVBjMWFITFBNSjVTRjJqWUFuZEtxWStodHNnRmRN?=
 =?utf-8?B?NDRiazBWWDBHK0VhUFVhdzB1RENRd1FKZGdjR0xHYmpIWDBDY2kzUkNSYVd0?=
 =?utf-8?B?VjZHTXhKdGdOd2RGSnY4TlpvVmtzcndjNjE3OG9aR1pKamV2MGZ3bGRGenBK?=
 =?utf-8?B?anUwMUh3bHNhdFhBTUF0Um16Z2IrZkFUS1QwMG1aSENBS1c1SUlEb1pQd2th?=
 =?utf-8?B?MWt5Q1JJSnBQWVh4WkgyMHo0OUJ5NloydmFZbS9hNHRHWVpEemRaYitINFdT?=
 =?utf-8?B?NGx1OEYrSjdlTlpWYk45eUpIbUh3QjFORzJ2VnQrb3lqQXZ5QmVRRmYzMVdQ?=
 =?utf-8?B?RVZML2JrVW80akNEK2FKYUtaRkhMeStYYVU0ZHdhMk0wVWlyVzRXRlYzUW5Y?=
 =?utf-8?B?T1gxR01TK1lGNncyL0xFT2ZBbHljZWVhczdydDljWjkvZzdxZzFFb0gwSnlx?=
 =?utf-8?B?YlRVNHV1YlE4T3J4Ky9ZZTE2S2RSakVFOTNIbksrci9SMCs4YnppV095ZWx2?=
 =?utf-8?B?Z2owZUdldTE0MXFnVGN5UFpETHlTNmpnbkNKWjk5bThTUlhpWkJ6Ym9xTzha?=
 =?utf-8?B?Z2xIa3V1QjVPSzV0aHltc1piV2dDbmliWVhvZHA2RnVTNEtja2ZrS0d3RVNU?=
 =?utf-8?B?T041Wmh5Wkh3RFNIZXFZYXRHeU9YTHZIZFQrVkZmOXpnbTQzaTRycHZUZFJx?=
 =?utf-8?B?cVdCYWF2UWI3d2VzWWpqbERWT0Vja2RjU0Rnem9xSHRGSmxNaC9qN2Q4bmpO?=
 =?utf-8?B?YWptbVdYYkJnaktJUGdiSWVYS0k5L0pEQi9YNTlqTHVzeTNjUFV1Z2RwdEtG?=
 =?utf-8?B?ZFVwUGJJd0hXMjZpaFNXaEN2bkZQWGJmMVBZblFHUWF1eVV3OUF5NE0vcjJn?=
 =?utf-8?B?ZzJ2Wjk3RTRGM3ErSkpkOTJFcDgzaTErRkZlQ1RwMmlGVmpNQmtxZkJVWmRp?=
 =?utf-8?B?RjlTL3ZuUG4rc2JQcU84YWhCdTZEcGpZWVhkK0FBMytaYko3ZnB5TE9pb3E3?=
 =?utf-8?B?UWJoNDRzUU9uaGFzaFkyMk4rNmpuZGN2b0Vzd1ZUTTBvRW5kU0c2UGFVMGt3?=
 =?utf-8?B?cFoyeE5NUDhOTzdHZGY0UmJwNmx4NFY4ZEhiVy9rQ2xtVDdwd1JPVHdjK3ZD?=
 =?utf-8?B?Rm1sRWR6REtmRUgrRWhVWXB3U21OYS8yWE5zVktRb1hSN3FWNmtraXZjaER6?=
 =?utf-8?B?Q05BOHFyaW9OQ2NZVndsdWlwZlFaY3FWbnBGTHgyTFVGYm5jd1J2U2M0R3RY?=
 =?utf-8?B?cjFXeW5kTDV6WVNoSUpVZFZIR1BUeDNTUFBPcUQrSTU5cFRxaVl3dUVPZW9T?=
 =?utf-8?B?MkIzN2lUYjF3VjBiYlU4TkdnQzlUQlNvNFdmME5tN0JTb2ZJYWpWRXVHZkx3?=
 =?utf-8?B?WFNzdy9CUHJaSmc0UUwvRm9maEExRHJ1R0pFQlNLeE0wVFB6czljbXl3RVpL?=
 =?utf-8?B?WXJUNlZPYkRnTVNGeURSZXVPdjYwZXV3bUpoSDlxSkhPK001VW5WTmNqcmU0?=
 =?utf-8?B?bnlrblVpSXR4RXQ3b1Zqb29KVCt4cTZFNzYyZnUxdTBqc0RNR05jdlNFekty?=
 =?utf-8?B?dHRaanV3eTBVRFVRRFFIY2lyakplTi9RT0Y5NmF4ZitLN1h3enVQUlVvOGFl?=
 =?utf-8?Q?+owcren1vR0g7rYEwsifFe0Z/mEUy+Hjf+urTre?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e33c9223-13b9-4054-4711-08d931bfb9ca
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 18:42:57.7830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: We6Zbbi91ovJidUhO5cc0MQouqBnlulgc5YzCAdtTITJuSXdqu8CmAiBM9NALmEDPk7dzL0BG8WNprvwmnpKHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5476
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
Cc: zhangjinhao2@huawei.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-16 10:31 p.m., Pu Lehui wrote:
> GCC reports the following warning with W=1:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:3635:17:
> warning:
>  variable ‘status’ set but not used [-Wunused-but-set-variable]
>   3635 |  enum dc_status status = DC_ERROR_UNEXPECTED;
>        |                 ^~~~~~
> 
> The variable should be used for error check, let's fix it.
> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index fcb635c85330..cf29265870c8 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -3681,6 +3681,10 @@ bool dp_retrieve_lttpr_cap(struct dc_link *link)
>  				DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV,
>  				lttpr_dpcd_data,
>  				sizeof(lttpr_dpcd_data));
> +		if (status != DC_OK) {
> +			dm_error("%s: Read LTTPR caps data failed.\n", __func__);
> +			return false;
> +		}
>  
>  		link->dpcd_caps.lttpr_caps.revision.raw =
>  				lttpr_dpcd_data[DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV -
> 

