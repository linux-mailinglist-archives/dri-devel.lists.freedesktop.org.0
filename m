Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAD355B9D8
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 15:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309181136F1;
	Mon, 27 Jun 2022 13:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346D21136F1;
 Mon, 27 Jun 2022 13:20:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4StscwISwSUXkzswdKAEYTYS07Nl81syxCh5REbAmJ8JVSUPwtX8Rh1KK9dJ8aBSiQJK5sdGVflcS+3DmYuFyXya/DiqMTkATGv5BQ8TAYpRMT/p5UwCyp1i7L0uqsQrSovJlb/S7M65b4PeFVuNNIdPg2HaC4+AtTJMLg7/3dbPf00RXvcvCleWeS54gKc9u7ROGq5t+VhdvDdoRWFUz/H09dblFoC2q6Wu8PpfYEZLCRSvekDxBFCdLxWqdU5qNR3H5u7UlANw9e1zeOVSFL7zYg+AmLQRN07e9L5FVyexeI1OJXo0Lm488WMy0AcY+tn0zhVfAnhlw4eEqjyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q20C6SnQHqMPznC6Z28Vvkmn6wOMcf61p22+fnjcnhA=;
 b=BraPfVsCDhdhxJm/23r/lhu8oXo0jc5loUMLKGyrDI67Obi693tdzvrfB2WOFYGwL54lwnc+Cv64orSbkgl+p8Ql/Wlb3M5o+yTfR3hhiso83xjagXKecbSn4DMIdFnDtgZRih2ZNPH79H2gniZqY6NB1U8ovXdKltl8qZQB2po3wirel0A3HOK4ioAGJV8NvRTEpMXDPVg0Ce+TyWsgoOH83cuSnaSguZqgIkwh5yz6zN6olcLqyulcPLN5VYhlXtEqUHmv/hGyKObwd1C6njI2k/Gh8ji8Cw+VAqxGMqMTi+j6/c7xaji2L8Em0popJuwDCzFuTQg4csWFMG25zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q20C6SnQHqMPznC6Z28Vvkmn6wOMcf61p22+fnjcnhA=;
 b=g718TmgTCgDqE5OmBWNmDEhxjVdoFNi87lImkQd3kicelsDtmmEQgVlvd+w3vWT+gv/t/mT7eTR77AWhcYWxSJZO7aD2h2xVyKZC3R6MGdHTexsjaqkl1uDXAHNBPWTAxoLbJ37NISlNi1ODRFfhkgxN+R+MlPQxalEBgf7uBp4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by DM6PR12MB2953.namprd12.prod.outlook.com (2603:10b6:5:189::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Mon, 27 Jun
 2022 13:20:15 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::1563:b9e5:78e3:5c15]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::1563:b9e5:78e3:5c15%5]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 13:20:15 +0000
Message-ID: <34b5c26c-bf3f-4b7c-3dd8-9e1317968c28@amd.com>
Date: Mon, 27 Jun 2022 09:20:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/amd/display: change to_dal_irq_source_dnc32() storage
 class specifier to static
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, Qingqing.Zhuo@amd.com, mario.limonciello@amd.com,
 nicholas.kazlauskas@amd.com, maira.canal@usp.br
References: <20220626144615.2227149-1-trix@redhat.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20220626144615.2227149-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:208:32b::29) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d03025e-08cf-44a1-90ea-08da583fc5b4
X-MS-TrafficTypeDiagnostic: DM6PR12MB2953:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0v5WqIXv/IgvnzrtBMhQJ9/e2rlFWaai9U7vzvfB/i6Gkws+oAmG9U+TtP+VvCUM76fQtPhABHjw5HVXEMjojQf9Zs3XUPiKD+eTgZfGoRwtUdW7er3UybY56ZQ28/fmnue6JQNWD3NFwhrEZzByGidvo2mKNc693fLklPl/6cAc78TRd+k9cm9DmnXQP5bz+za2NpzB19Q6H1C7Y9shZCLkZoJNO0OfQCPzopHUuKoiRZHIN4BI0vbjYxW5ljO0PPQzjThAoHVTPaNo5l2hbxn27XkNN016ZVsyKHuhNuVtQphMfS3gcrwKgMGhyvqktM7enhrmGnsaniuHWL2sWWzFeBgrYkLoTfe3VxhMhtkf1P/hy0Juy4aynuwxYGZILsQo1blm6SCqjfHJW0bav+DkaaBPmr7xyS6Xeq91w5NOuyp2j1RfEpDI3tsdFTjs5XXfnmrvVG/gA9nmZbuDTijOR0uYlCJNL58Xcm/J1FUGCJS2lToEEt43DQfFBBjqARzH9+EVdho76L33yDmgdvGP6EWyjw2jxMGBwZsc+LiSvlcmij2JPTVaVp6R7Gb9cb/MxCrQh7TmweN4Vkg75r/N1wiX+BAfptRj+LpI4btqRbcb8/xLRmuJLI/BCYWcADu3X1LtShTAkgtb5zYCefhij84+wUZ9QoxlqLu3DzFlRuyRRB6rFrVFuK2oM7FgeHD3ofyKvrhDda+bCaCwTTE+wDw0iI6iKebfAnvdys7jNTsdAseSodv/myDDx3+/hsx189tGNrTIfXaxj6vyz8FuUh5cqKi5owKJ7UGlUOYCeo7Hb+ivzTngTuPq3anKn/NhtU+60qJj1dsqim/5WGU3SA/UtH/CDMies3/X5/A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(921005)(316002)(8936002)(66476007)(2616005)(31686004)(5660300002)(83380400001)(53546011)(36756003)(8676002)(186003)(478600001)(44832011)(2906002)(6512007)(66556008)(38100700002)(41300700001)(26005)(6506007)(31696002)(6486002)(4326008)(66946007)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFNDbWM3Q0VKa3hxWWJmaDdsNWhCL2w5UGhHc0dlc2hlbW5mdno5dDRta3ls?=
 =?utf-8?B?R0JkVEVEOThsUUMxWVZ1V3d2OUZKRXFxSVRDUkIzZ1Y5T0tmOG1xMlFiU2Iy?=
 =?utf-8?B?a2RKa1lNaWt6VlVDbDNVTEFjRVp5bDBWNnZhL3VGMjlsR25qTFFJa1lXU21U?=
 =?utf-8?B?ZUtrYjQ4QWVUaVpHLytqMjdzN3hhVVArVjZ0ZUJkVmQ5aVZFQW1XeXUybDdv?=
 =?utf-8?B?aWgwbFZIRkM3WWZJYy9HZDhKbG9ZamVOSzFSUm9DQkxmWVJuSEpBdnBVOWFL?=
 =?utf-8?B?bEZiSDhpRFJuOThJb2lMb0oyd0RZZXFuZnoxOFMzYjQ4UHlPZkkwbm4xSTFM?=
 =?utf-8?B?aURSTlNLQTVUQ3p5d1hnUmxXQWlTMG0rZm0zZ2U3YW5EOFJQM1FiVklGcXIv?=
 =?utf-8?B?b1k4dW1IUjloLzkzeWVBeGk2azkrd2ZQMGEyVDVmVkhsbUhYQUJheVJYdWRs?=
 =?utf-8?B?OGttUzVGbW84ZUxMcTF0N3BDMWlxZ0lDenI0c2tjVGFvelMyQjZjeHd3RTB5?=
 =?utf-8?B?MlJFRXMyZldPYUJuMU53djhtTXFBemxKaGIrME9nb1kyWlNtbGI0SEpacnZx?=
 =?utf-8?B?SXRmMGlhWG1rdkp0QzErYVRPcDQ5S1dQMndyZTUwbm11RUw0ejdmcDA2cGhX?=
 =?utf-8?B?SVlQLy8zd1dQdERZRVBZTnA2T0ZuZXNXdi85REQySTB4RW1BK1IyUkNmV3d3?=
 =?utf-8?B?dFhYWlE4OWZlSFYvemZxTVZ0aFZFQ1ZxSlNOY2NmRG90a1NGTnRYamRUdHps?=
 =?utf-8?B?a21vTmpBbWpGUVY3MHJKb2E5ZDZyOXJTM3FCRzAyRUJUL0hkUDZjUTZPRmc1?=
 =?utf-8?B?M1FzS0dtNFlTejFHdVFWV2c3V0JDdFVaY3JtT25ydW9ZODBJNmVlTWpCVXlK?=
 =?utf-8?B?dVE5c0ZEYmZlR1E5YUhMMFBhQzVTNUlNZnpKTGVSUWNydXgveVR0MU9tYktD?=
 =?utf-8?B?Y2NuK2x3Y3FPVlJURUJqTXpPVDBaNUJnU1hlem91ZXZSSk8wQWdzY2xDZ294?=
 =?utf-8?B?dis2VDBobFZnQUNCZlVWRi9DM0lJNTJEdkZCSzZqT2g0YkM0VHNGK3dodk1x?=
 =?utf-8?B?L2FFN1VUQlFIVS9RUE14VGpnc1ZJMGZQRUhqUnVWTy9Ibzc5SlNtT1BQcEVj?=
 =?utf-8?B?WUs1UDluS3A4bGFjOGdmZGtZK2VMam9rZmMzbVBQN3o4YlEwUnpFWTRMa2w2?=
 =?utf-8?B?VHo1dFhRTldCWGhCVlVHMkFwaFlKNVp6clVvbkNYUStXMkY5V21pTHJIMVZv?=
 =?utf-8?B?eXA4dU91MENsSS9vclUyT29ZcmRKQXBDT2ZzbU84ck05c0VKaExtZFByMFpK?=
 =?utf-8?B?NGcyK1UvK0NGZEhiUS8xRDRZaTc1WWNYV0RxTi9WekFwYmhOTFZmTWZxU2tQ?=
 =?utf-8?B?M1BneDVyNTE3K3BFT092OEdhZ3pWS3g3bWh3N1o0c0hDazA5YXB4S1ZBRk15?=
 =?utf-8?B?T1pVWGxvcjVMOVFBenpGT1BPaUxuMC9xU1ZwWUFwd2VMTTk2bW96NVArTWp4?=
 =?utf-8?B?TnJZRjZQUTJZUnBReVgrQlgzeXhFaDI0bWdXRmkyWHF6cmdFVWhKRlg4cEQz?=
 =?utf-8?B?eFVHeUZjOVVhWXphNHczR1l2R013Y2lxUklRNktRQm1kVzlEOGI5emIxbmM1?=
 =?utf-8?B?M2ZxTFQydktYUkw3NXJ6UUs4MmFOU2NOWlJuRWJCMkR4VGtDaEVkWDV1ZjNN?=
 =?utf-8?B?TWRCZzcxTzBzNGtMSmtBTWtSc2xmQmRuUkcxUUZVL2xRMm90UzlaT1BzaEpR?=
 =?utf-8?B?dzZpQ1J4L3c1R1FqL01yRzJVQ2FBR000RllFUlE4VHVYUThOd3hDSEJtUThj?=
 =?utf-8?B?aEdUNVVEYkY1SEttQ2k0NEUybERBUkhTMEdYZHdmZHArcXRsd1dEQnBsUDg3?=
 =?utf-8?B?eHU1b3hUdllrY05JalZuenhWdi9aNVpBQThhMHpLZVBGYUkzNmdBRFB2UVZp?=
 =?utf-8?B?R25aZjRWU3JOeXZJL3ZiWUZKcFU3OUhuVzhaT0VOdjdvMWxaaWpVcyswS1FR?=
 =?utf-8?B?bEV1dUN0V1U3UDVyVHZremFHVjh2eXlPL0o0RE5pVjVGZ0pQMUxmR3JkNkUy?=
 =?utf-8?B?b1RxcXNEOUhTYjFPYVlqRVpIOGpVV2xha0R5bVB6T2VDajNOK0lrblVzUGRp?=
 =?utf-8?Q?Nxq6PRJBHlpDnfdGh/M23wRRv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d03025e-08cf-44a1-90ea-08da583fc5b4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 13:20:15.0894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oh+f/K20sjGT4wJRG/zTJ3kxeiiLLmq36LQAntnge8jndNuBC3iq6jZsAMRM3FSKlpK4aygtyMFb5bMK2oBwOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2953
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-06-26 10:46, Tom Rix wrote:
> sparse reports
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn32/irq_service_dcn32.c:39:20: warning: symbol 'to_dal_irq_source_dcn32' was not declared. Should it be static?
> 
> to_dal_irq_source_dnc32() is only referenced in irq_service_dnc32.c, so change its
> storage class specifier to static.
> 
> Fixes: 0efd4374f6b4 ("drm/amd/display: add dcn32 IRQ changes")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c b/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
> index 3a213ca2f077..b1012fa1977b 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
> @@ -36,7 +36,7 @@
>   
>   #define DCN_BASE__INST0_SEG2                       0x000034C0
>   
> -enum dc_irq_source to_dal_irq_source_dcn32(
> +static enum dc_irq_source to_dal_irq_source_dcn32(
>   		struct irq_service *irq_service,
>   		uint32_t src_id,
>   		uint32_t ext_id)

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
