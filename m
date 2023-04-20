Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A50D26E96E6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 16:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD1C10EC58;
	Thu, 20 Apr 2023 14:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A29610EC58;
 Thu, 20 Apr 2023 14:20:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9pLZJ2feACLpRxePkFqE3oX7yJQYbOiNQ1kaAncwKdBpHqjHKaoY7r38iqGPkWEWD8bMjsb7/DIfDXLW8NHSjHbFmThCXx8Z+QxMnOXJYgmzxhgRw2mKdCoeBgZuEYCo64UlY0Rywvp4mkuUGVWtpU5EEBzX0wAt7jtqOHwXwtc00Xtfalokt7tPkTpPMEchrA8Ef8esW5ErplXV9bbdKdcj4R5XV6P8lhPDEjs3FhbER3MQNgTHsZZ6bb/oLPXkzZXMSqkNfABWgzKYyGqXRHks0Z0+72a2OottEhGPkdtyBD/SyZt1zUfKBv1XU2DJnJPUOd8mraEJ4WUc00e/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhBLsnPYeYdDvfz/a48CTZ7McFUXi57eObJKWuf695I=;
 b=T2aXf+0abjHiRfIPPKMxNgrc5dpuIpZePFWprCk4TFNA8Ff09l//wEVGbGv23yUcGr5bpHPn756xKSrAKxScqApIuaAOVy9SsRt1bM0RsLoqiRYfv+YoDb+JvfUfCBQfSo2Y6n3lXDUV+QdvLpPabUHI8SFqC5/fZK4nkWg0ewOyNNq8lujzuij1+ATPC2Nf3QBWQ8UAJNAMp2nRyc3QQyYUQVE9Ekk5kSABiOoiW3bh+qh//Jqc/wYfyf8rcJgBqq1jW0WwvVrJyCRxVgwOV0yap118QSo5QNjCoMKrsnKrlsCtqPKQjwAtDrKhTApHqd3wYcX3PHDiazaEcJscmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhBLsnPYeYdDvfz/a48CTZ7McFUXi57eObJKWuf695I=;
 b=lfLmn/Gr+8xxts+TA4Di2B5RFqzsAgqMWvlwd+rys3MkHo2wDauhpOetpSgd1B2bMjTIdQHt8K0F9APIwHjfQHZp0SoJolII+xmP/Hm5TdG0HZG3opwelQRvj3NHsXcTzytQP1aFcUPPmI7ZJi5UjhdMgBCmFKEQ1edsuUMyfDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 CH2PR12MB4248.namprd12.prod.outlook.com (2603:10b6:610:7a::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Thu, 20 Apr 2023 14:20:02 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 14:20:02 +0000
Message-ID: <de66ba4f-52b3-6507-3194-60b894d840c4@amd.com>
Date: Thu, 20 Apr 2023 10:21:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/3] drm/amd/display: remove unused variables in
 dcn21_set_backlight_level
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Leon Huang <Leon.Huang1@amd.com>
References: <20230420084711.3063453-1-arnd@kernel.org>
 <20230420084711.3063453-3-arnd@kernel.org>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230420084711.3063453-3-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0145.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::14) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|CH2PR12MB4248:EE_
X-MS-Office365-Filtering-Correlation-Id: 33b4382f-9bc7-478b-c828-08db41aa5497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OVjmaGllzboWl1Udy6OM2EK0Gl518BQ9k/IqyrVpO4/CrbPVYEsJmpaj1pZAZFRnTnB3BYCHcltc5nnHRKf/TBEyElx7WMSQVcD1gxNcZr5ZSdGzRFsa15wShWBnsdTfzl+BIzZV/OmAf3XaFQNFY3j12GiUHEGCAh/AwJA5nyhutitDeooAzPl65kuB9l7lOwmQulQ5bK+SngoThvRyXn50TE7S+0AzXE/XORmngbAAdSNhp3tcdivOuZMRzz3BFde5xEOBAcJIeG4KJEJmVdtcBcngIM7TKYNfP8xzLY2lvjvcZ354HWUeX3wjXDhn6SeuB37PUA+Wry4UZzu5qnjOJDr+Uritv9vbqjlpQWJ7qoNeNVqekName+xJTE+X5oMHgfN81o+E7Ffx971QPCzsl9Efk8Ikcm0jNfRpWvpX1x0V8g+hcQK4+jkkeTQF5IZiE2bGlbG7ELAQP8mr+Oe+k246AX7nTFUwcBB4pv0gBMadestoPrCu6Rt3RsYwDowN3qZt7XXC65/eoliiNufZLJSVpfZZQtD6SMVlc5oszA26O8jQKcv8oN/Gy5gC+Q6BXoUg+hwpfcprYdcsALvI7q+iT9ENipAtfoi2OFMQ0TPxwZSisD8Ihg7A7vQyaVstvd1Xxq3FQuwiJ8tUNQ66Ia+/mNUPye5jBeiXRco=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199021)(8676002)(41300700001)(8936002)(2906002)(44832011)(5660300002)(83380400001)(921005)(54906003)(86362001)(36756003)(110136005)(478600001)(6512007)(2616005)(26005)(6506007)(53546011)(6486002)(38100700002)(186003)(6666004)(31686004)(31696002)(316002)(4326008)(6636002)(66946007)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkhFdXZ0SE1pb0NqN2RwVHRxSXVLWERpTzlVTVFGZElXc2I2S25aTkM1VGxy?=
 =?utf-8?B?K0F1cmNzQkloejRSd2RPRThoSzNZUkUvR1luQTdMMmhRTW50dUVOUHVzZW9F?=
 =?utf-8?B?eTNERTlrVDdTWDBBS1luNjZ2OW5Cd3IxcFh5ZEpHWmFWQmpldXE3d2c3cXYx?=
 =?utf-8?B?N2NHRzdYamxjUFpBOTUxZVU4SHVLaG05SDVHOUVpUVF4SllLcU54aDVCa0c0?=
 =?utf-8?B?eHp3V2hSQngxTDZSeDArU1RoQ3BxYlRXWFZNWENCYnR1RFZDM0VHT0N5ak9E?=
 =?utf-8?B?L0w4czlEanhmcUJDcUFqaWN6UDVwQ2ozUGpiZUN3Tm5WZTFURUtON2RYa3R5?=
 =?utf-8?B?YWQ2V1ZGMFViajZxVDdHK1hUdkdSYXI1eTlweTN4S2kvKzlqVmxmc0xXKzFn?=
 =?utf-8?B?Zkw0MnFzN0I2NVhWLzNrZnZnWVQrZnhNN2ZLTFdMN3hwWnYrZkg5NEdiSk1a?=
 =?utf-8?B?dHRXeWNxclJjSTRpelJ1TXZTWlhvZERyZG5NMHZxMTduRnNYS3NTTzlLYklB?=
 =?utf-8?B?R1V5byt0K2FXNzB4ZmhIbDdMa0JyMDg3VmY4RDVoS0FhN0FRR1ZTVDVvUFcx?=
 =?utf-8?B?K2t1TDN5a1E5TDRJb1UwKzBLSW5mZ3o0MVBaMXJkVDlmYnp6bExzeFU0cjlT?=
 =?utf-8?B?YjZDNEl3ejRWNW1Ha1NMNnNkSDVJd0RGWlU0R0Vmb0lyS09QS3JYTXFSeVdK?=
 =?utf-8?B?c0RGQkpqN1Q5d1prYUZuaytGVlJ2YUhUcTIwWnlBZ0QzTUI0aG1QNHZKN1Fs?=
 =?utf-8?B?RGdYVmVsYnpYR3dnSWtnaGRKQ01zU2wxREN1bmZsZ0ZTbmxKaGhoMnc4bllx?=
 =?utf-8?B?bCsvU2ZFU3JVTml5M2lzSlZlZmVnVUt1SGMrSGdqdXN2Z1VmRmsydWVJN3ZE?=
 =?utf-8?B?U0pWSW1UazBCOWN5b0R1N0NKWjlXMlFNZW1QelFlZWFWa2xQaEtIR1BSK3kw?=
 =?utf-8?B?MVUxVGwvdTRLRkF1ZS9tbkpobUNucVl0djVCTnZRQ3dPb2xaTzZ0cndsakJQ?=
 =?utf-8?B?WndEK0tUVWdUQ2pQV2Z3bUM0N1RZako5Lysza3dEUXR4amFGdFUrbWVDaEVL?=
 =?utf-8?B?dEpGcFB4OHpzODlBSkphM2huUmVvT3RCclNReGJzaWtYUFcrSVY1T0JzbUMx?=
 =?utf-8?B?eE4wSjMwU0JYdjFBM0RVSWlQNFdISVhyMEpGM0dhVnFCRU9iK1BVYnIvOW9D?=
 =?utf-8?B?S3J0NG5vT0JhZ2lMRERYZG1idktaOWJsWFoyb2lLWkFYeHF2NjllYnJENFpX?=
 =?utf-8?B?MlpXVHlZT0RjZitHSXh5c0YrWHhvUGhrYXRvZisyTEdYVEVYd29kY21jb2wv?=
 =?utf-8?B?Ylk4dGIyMXZwOTZHZDZJSDZsUTZmbEFWQy9ZNUxqUGV0VG03U1VGOUhSQnpx?=
 =?utf-8?B?NUNta292UHh0UWtJSSt1OWk2RWhuQWIwZ09MeWN1SFBHUWdZS3g3V2hXeDRS?=
 =?utf-8?B?ZlNGM2ZSZHhRSUZJRFRTS1ZNZjJUdGpSQ1hmYUlTeXJaanBzR1Jaa2xBMXRO?=
 =?utf-8?B?dHhIWlpqYmpxcHR3MW0xSUlnN3RIK21SQnRTWVlIUEJKYU9PV3c3ZUUyK3Az?=
 =?utf-8?B?SUM0cVhLOFhrMXFndDVYOWdaZzMrdktBcWZKSm5Sazd2amNEcXg5YmJXU1pW?=
 =?utf-8?B?Z0Q0TWNYTmZhcGlobUd0blRJWndqdGRxaVp4Q0NOT1NDbDVCcGFJU1hHLzNT?=
 =?utf-8?B?TWUrWkkzaGZSOVZpajE0THJ5M0pkUmcrNGl6SEF3eUpoandEN0Job0NwSTFz?=
 =?utf-8?B?c0RGZzNMUndTNStRRXVSc1VucU9kS0FtRHQ3KzA4OGhnR2tMdkdueS8wU1Q3?=
 =?utf-8?B?RGR2SXk3VEhZU3NLL2VwRW1YaUdBTVBwWUJrNmlCZG9wdDZnb3JUWXRseDBy?=
 =?utf-8?B?eDBwTk0vVDZxSVg5ekhabkJIV1loZmVQRkE1YWxaa284Z0JWYnBOb0NWUE81?=
 =?utf-8?B?cFEzNU4zN29GVjNKOWpmOCtWVTM5YTZWTnRQdTZaL0NVRndPcFRva0xvb2VD?=
 =?utf-8?B?WklJNnlSZzk5RUdkek9odk5NcnVtSnRlem1DVlVNdGRUMGs3NWRZeXZpZ29B?=
 =?utf-8?B?Q29yK0twZmQ5dWt1K3crclpZazBMSUhqWmRXcktFT1JST2JKdVo3MXgybDBM?=
 =?utf-8?Q?I3AtjuzV+eglHxhYR4GlFqYTo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b4382f-9bc7-478b-c828-08db41aa5497
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 14:20:02.4170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hI50g4sxhjlXs2PmmXR8hHEyTbUQPOIOpu/ArMhUZvSKM3yV8oMLQ26zW/7gcorilMsAiRnWawByZBwUdWQxKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4248
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
Cc: Arnd Bergmann <arnd@arndb.de>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/20/23 04:47, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The only references to these variables were removed, so they now cause
> warnings and have to be removed as well:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:226:20: error: unused variable 'cmd' [-Werror,-Wunused-variable]
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:229:11: error: unused variable 'otg_inst' [-Werror,-Wunused-variable]
> 
> Fixes: 6f0ef80a00ad ("drm/amd/display: Fix ABM pipe/backlight issues when change backlight")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

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

