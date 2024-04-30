Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077368B7FFB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 20:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A3A112E40;
	Tue, 30 Apr 2024 18:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xecZi7dk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E8C112E40;
 Tue, 30 Apr 2024 18:43:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gv9Es2xgJ1LgRBQ69VMBAAItlWGZ50AtfT/2Ry9DxLT3cRIjWFMnhojahqrjOifCt+EtU9f3uQQFbjWTUSjTseRb175zj2XfBJjrxwqTjWseN13DMZj+/kx57z07gF9NavjC0N0wtM8F8ShwQfJo74QJDC2n0+ul/+JzMoa3Qbc7fdlrDx59Wb0eB2cDCc9ENJ0+ropVmbGzE5p8ergpcKYNIT6H4jIplXm6hyg8xRrPa7S/VeQty5Kw0XUrFP+efpV8mHGZtYdT2FjOrzIrGojYSohR7FiscOhysxktk55+zaoNc3B3Qi6ntePfF3iGO+9qI9hPQwdtrkvvnTnO9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPOYEOlfDD0RmvXb5Gj6PWeJh4MJiJc8xJ5IDdgw5Ss=;
 b=n2NPr5ygKtPztMlJUEl7n8Yc6xcBgngwHcmHWDS0mF/u1uc43ehhdCDPau4YkTH+j996WOyRLhBz6JmBjJ0R7Mr33DIhm/rlJp8S5UlyjWhugncMBAZvcQ7hhabdi/l0+6FZUjp5cJAxMquQug7+G2kvRm4B+xGtc8FEDuNqmolITeJ27stQaXeKVhjgs/akFfhaT/kYNrT8M4emCi3hO7FGNKDee3h88rLdf5zAgof0GmxlRsP0kcehsGFqelVo2WlkQcx3xCL0EaIVRSXIOS4SjOw/5oIhPq4JXg3VU5Z2LPypuFw9FwTMjmvjNCD9IH7d9sdcoo0EiIKwaPuVtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPOYEOlfDD0RmvXb5Gj6PWeJh4MJiJc8xJ5IDdgw5Ss=;
 b=xecZi7dkiD6q9i3XaK5+ku4wGl9NFs5azy41iQpUo1gAvxHmbzKJPwm6qmuFZUrJoY4XIStgmDH8KoBWI1/ahGfI2/JUhru6OF0mfYhKFwQKlRyK5sXGjyQRRQZ9T83E+hrNIAP6Ih0SVIcN/8vI2Ss9nUT7e47B7ilQDKzZSLc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL3PR12MB6619.namprd12.prod.outlook.com (2603:10b6:208:38e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 18:43:48 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.7519.035; Tue, 30 Apr 2024
 18:43:48 +0000
Message-ID: <be5adbf9-1277-4753-9b8a-efadeb5b019e@amd.com>
Date: Tue, 30 Apr 2024 14:43:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/amd/display: Fix spelling various spelling
 mistakes
To: Colin Ian King <colin.i.king@gmail.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240424162809.3948457-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240424162809.3948457-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::12) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BL3PR12MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: 769084dc-3b2d-4b65-b6f6-08dc69457923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUh1bURtUVFSbEhMWU4zQjFtcDZoQTcrQ2VRbm9VTGJyLzZtcjRtMlp6QTB4?=
 =?utf-8?B?T3N6cVVqd1QyYzRwUmxaaDRHMEdLUVRkZTZ4eWdzVmdwZzR6Umlzb0dDbGYw?=
 =?utf-8?B?ei9sRzd6bWc1QmZqandlZE9EMS8xb2xQNlpoaTROajAvWnpSNnZxdm1jbC9t?=
 =?utf-8?B?UkdMUVJSdXI0N2RhL3FBNHZ0RGUvQWNLU3d1NUpnSktFVEhqYWFRMkwrb3B1?=
 =?utf-8?B?VENyaHhlNEQ1R3hmQkJxdXlRL1cxU2Fkck9OMGdIRmZOcHZTOFdxRWVlUitn?=
 =?utf-8?B?WGZheVlIT1JiaTFXOHdoRVYyQUJSa0w5ZVBENi9uNDdaSlNJOGNPYXc4L0xL?=
 =?utf-8?B?ZStyMXNmTytlTWpvWUcwbHFZazNJek40a0dJT1Z6YmtXb0VVTDcwR0R2UXJP?=
 =?utf-8?B?VmVjR1BRSmtOMGhOeEphZ0t0eVVPdUdzWVZIdVk0Ni9YRFlLTFUrV0pIdkxU?=
 =?utf-8?B?STc5SThaYWdEbG9kZmRoM3c4YVRXeGcvR1l0NVAwZ3dCTUtwclhDN3dnSUdT?=
 =?utf-8?B?U2VnelhQUm4rL044YUJVQ0ZSa09FSWJNUUdkTk0wSk0rVHZYcjZ4QzVSR0Rt?=
 =?utf-8?B?TG85cDUzMTI1bGhMQjlKSlNNRFJRUHQ0Y2FBVG90OXgxd2FIVDNIUHU0VFUr?=
 =?utf-8?B?bUh2ZnE1Mlc3OXpORXAvZVp3Z1lGYzl6eWxTVWZDUlhlYjVUNG8rYkNqN2FW?=
 =?utf-8?B?NXc5bG0raFNmRjJJUGIwcDVJUHlOOWQvdklQTHdnRW13b2g3RkZZUVBOZDRX?=
 =?utf-8?B?TzJZSm40MVpNbXh6c3VwOWNMTTlJVTVkVDA0V1dZQVd5a0Z0OXVzaFhtWEQv?=
 =?utf-8?B?SElhOC9JUHZWVWN3R1EzQVFEVUpvbGtWTU4wdUVHQ2xMTURXZ2dSMzVpNlVT?=
 =?utf-8?B?eGtPNjVRUlJHbUczQ2NpZkJzZEZqZUdvNnFPMXFkTnM1bW9OenZyWmMzYjlR?=
 =?utf-8?B?YnFQT0VmODhsYWkwanJWSldDczJNRS90VjIwRXBnWUJ1TjJyNDBZeHZwVlgz?=
 =?utf-8?B?SkVVNDFndC8xayt1V1pBNVl5bnlNbTFydUtzZHRYMTNuVXZ2UVhmN3hRMmNX?=
 =?utf-8?B?enFWZkplV2hmQ3Y5Y0k1VU5COFZyR0Uwd0JQRkc0YjZ5aTc3Z2RXQTAvUFhK?=
 =?utf-8?B?aXRORUJrcFZaS1MzTDN5eXF6bm1mV1dZNjVXRDdPMjgvVWlFQ2FxYlNmdldH?=
 =?utf-8?B?T3ljY2JlU1h2ZDlNSEcxY3NXalZZN3lOM2pjOTUwcnM1Y3FiTnBWZzJuQ1Rs?=
 =?utf-8?B?ZTMwNDljNFo5d2t5R0M5b1RSaWNiUXVSL21uaEs1cDM4RXJ1eWJUaDlKOFB6?=
 =?utf-8?B?d0FwMEl6UExBbnNacHFjM3d6WTgvOGpPbnBHOEJESDFwd0UzQ1RvOWVIc2pI?=
 =?utf-8?B?Zm5WUG8wS1hDTFN1ZVVqQ0VoUmY4KzVrQ1hDdVpFQjZvYXhuQ1RnNytDaFgz?=
 =?utf-8?B?VWVqVTBWZW8rWjdoWHVkMUhmT1Y4SEFnQmZXSXpFQkpzSFZ5RDEwVnVVS2Nm?=
 =?utf-8?B?Q3R5d3ZYL2FadEM2cEFaQ2JNMWhwQXFLYlN0QVB5VTNVcmRXelV0MHI3cWNF?=
 =?utf-8?B?Q0lDNk54anYxMnZhVWFnc3g2b0JDTGhzbEM3UStVaGQ0eVZQVDdRQXEvRDB5?=
 =?utf-8?B?cXZSQnE0eEhNR2JtbTZ5dWF1bGZJd25ZYUNHK0U0S1FHQ2xmdkF2RDl1cU1D?=
 =?utf-8?B?SGhhMXpENEdsUzJYRnh4SmkwM2JQTnZvcTBJckw2Tlgwcm5WaSs3cWtBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0pKQ0t2blNGVHgyemhHZWpBTE11bVRqSkNCODJySWNoT1EvbHRQWnpDQzJ0?=
 =?utf-8?B?eGUwMFFlaFBLQ3hnRGVXRVhiL0NBRkFTR1AzNUFKa29kTHZkbC8zWlNTV0Fv?=
 =?utf-8?B?YzJpVlRJbWlqVEY0NGtvVXBZeEpqZ2FQWU5LTW90cy9sTzRYK1p4RzRrY0h4?=
 =?utf-8?B?YjJmMCtzM1hEZ3VVa1JuNkQ4TnM5dHlxSkM2WGVsWXBGTUpnZWdjaU1LbUZW?=
 =?utf-8?B?YUhGOEJNSE1uendETTRwUlBQemo1L1VJcVo0Zm9mR3ZBeVd1VmxuL3FYT3RB?=
 =?utf-8?B?UktVc0Q0bzJwbWlTMjhQcFBCbGxWNTFLQWE1ZTVMZ3l2UFN5M2o1dTBsa0RE?=
 =?utf-8?B?RE9qdkNJdEpRR3ZJaHRkQXZPVVJpUmRwK3BYeGlHQlZVbmRIMEpyR3c4ZTVn?=
 =?utf-8?B?QnFMVlRkNVJIWTlwSW1odkdXaTA4QU03aFk1TGc2WVN2Zjd5aGpxUjdlRnQv?=
 =?utf-8?B?MDFldWg1Z3BxWE51VGExelpaSzJYQjA0cEdLMTBjRGM3M2pGdjRsS20wNlBP?=
 =?utf-8?B?SWtFOHZ6aktZZjNlMmgxZzF6VkhFUkJqYlBuQ1E1aXFjbkR4YzVrL0NvaWRw?=
 =?utf-8?B?QTFvcWJ1d245RENmdkxqbUlzdlhia3RsVUk2c3BVdGVhdGxjQnlScHBQN2lz?=
 =?utf-8?B?TEM0Vkk1QkJ6L2ViQnVvOEczL1hDbUNWMFNHU3lCVmtSeEFUM2c0bnR5VmdC?=
 =?utf-8?B?cTVYSUdGUW42TnlVOWdsUEN3OEV2UTNoeVVMMUFYOUxPd1FrU2lMeUZxa0Ex?=
 =?utf-8?B?eGREWVV4c0dob2g4ZWM0eVZLcmVKRk81NzlHcU54aFF4OCtBa3RFL1VZRFNn?=
 =?utf-8?B?SXRiQnA1RkVIMEMzTS95VEluVzdnejNMelV3em5EYUs4YWFqd3Z6RExHengz?=
 =?utf-8?B?bTFHM0s5VENUUW8rV2k1ZlpkcEYwOVlZZkxMWHpmNnd4WHRkaGNKb2ZaS2d3?=
 =?utf-8?B?KzFsRFVlWkhuZ3lla1U1Zk8ybm1NTmpteHRiWVhZbXRZUUFCSWdzcUp3Z0wv?=
 =?utf-8?B?alcxd1gyUllHY01DYzFhaTB1dEVFQzNEL3hPQjgxZVlGNi9OR3dUbTA3dS9E?=
 =?utf-8?B?bjR3a2I3ZFY0bGpKemEvMnZMTUpOWEo2QkxwVTU5TEdHS1pLU2VHaFc1eldz?=
 =?utf-8?B?aGJpRzRhb2lvK1NJb09ObzFDa1I3KytrVHA3TVFETTVoRDlac0tsdlQ3ZENu?=
 =?utf-8?B?a2VlOVpuSlBWc2dsaXhTam9VM2M1NlFIbHJVRjAwVnowZllyUmpyeEtIVmll?=
 =?utf-8?B?d3lXM3lOT2JhazNsTGdXSlM1TTlQRlpCN2xkdWdOTkNYRE5raDNyYitEdXor?=
 =?utf-8?B?dUF3eS9VN2pDRHN5OExLeS91dTdiRmVZOXhURmliRExkRkVLckltZXpmMDRJ?=
 =?utf-8?B?WXR3SlhBWlVTZ3dHUXYvWGx2T0hwYVNuWmIvaVhnSXFzdE5wamtjOG5JNmhw?=
 =?utf-8?B?eGh0aU1ZUzBncXI2dkk1WWxreU5jLzB0MEVRSW1maFVpYkxJYUllTUp3Uis0?=
 =?utf-8?B?RU8yOWpOVGNaa1M5TFBTNTFwTzFoaytVbFoySHBDQjZqS2w4V05HNmRYU2tZ?=
 =?utf-8?B?TUdBMXdNdDFLbUtsTzY4YUg5V2hEdlRGRnRmNGo1dmp6Wk5PM0xtalBocFYy?=
 =?utf-8?B?QVZZZnVZWVZFbU9GVDRBMlEyUWVpbmtpMVNvdlhIUzhoVUN4MDNxdTVmMVRp?=
 =?utf-8?B?RERsK1ZjSzc0dW1rYXpBNTlTQ2hVSXhLYjhHdW1XYVp5OUNoblJxV1I0YlBY?=
 =?utf-8?B?S3QzcDd2SE5UeXhPLzhUbkdGVnI0WFVqRXVhbVpCOVhvbmxRU3NwMlloUDhm?=
 =?utf-8?B?MGJ4b09ON3RmY2FqenJCMXhsUHVGRnNrY212MXdMUWRYcUhDelZHSGNmcXFM?=
 =?utf-8?B?djVtZXhraE41MzNOS1VOamZrUDVTZmZncHJkaE1GMzJkb2NuNGFkd0F4Rnpm?=
 =?utf-8?B?dS9JSjBqNVVGUVEveDdTSHRCalB5VWI5ejRLN2Z1QmZWSkwrWktDUS8vMytQ?=
 =?utf-8?B?aUcySDVCNXQwb0Nnejh2NUVRM1JOS3plL1ZZa2E1RHptR0R2MUxWY0RBRFM2?=
 =?utf-8?B?cVJaaFZFelNBVFdUanpNWGtLSzZHK0pubS92bFpsa3FuOHVhYTUxT1JzZnpX?=
 =?utf-8?Q?ME7dAxg0+xGlwdBnslQ0uWcx6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 769084dc-3b2d-4b65-b6f6-08dc69457923
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 18:43:48.7368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pr/KARK8iaWLRt/bqFqt7dDZiBRWg82ywma8Rg2Xlfrk5IKEQDT8TKOg7/N9D3hJvrXSPpLcZKRGdoumds85dQ==
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



On 2024-04-24 12:28, Colin Ian King wrote:
> There are various spelling mistakes in dml2_printf messages, fix them.
> 

Thanks.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

In the process of merging it into amd-staging-drm-next.

Harry

> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c      | 6 +++---
>  .../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c  | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
> index 846b0ae48596..2dea5965d02f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
> @@ -5566,7 +5566,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
>  		dml2_printf("DML: Tvm: %fus - time to fetch vm\n", s->TimeForFetchingVM);
>  		dml2_printf("DML: Tr0: %fus - time to fetch first row of data pagetables\n", s->TimeForFetchingRowInVBlank);
>  		dml2_printf("DML: Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n", (double)s->LinesToRequestPrefetchPixelData * s->LineTime);
> -		dml2_printf("DML: To: %fus - time for propogation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
> +		dml2_printf("DML: To: %fus - time for propagation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
>  		dml2_printf("DML: Tvstartup - TSetup - Tcalc - TWait - Tpre - To > 0\n");
>  		dml2_printf("DML: Tslack(pre): %fus - time left over in schedule\n", p->VStartup * s->LineTime - s->TimeForFetchingVM - 2 * s->TimeForFetchingRowInVBlank - (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime - p->TWait - p->TCalc - *p->TSetup);
>  		dml2_printf("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %u\n", p->PixelPTEBytesPerRow);
> @@ -7825,7 +7825,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
>  	dml2_printf("DML::%s: mode_lib->ms.FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
>  	dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
>  	dml2_printf("DML::%s: max_urgent_latency_us = %f\n", __func__, mode_lib->ms.support.max_urgent_latency_us);
> -	dml2_printf("DML::%s: urgent latency tolarance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
> +	dml2_printf("DML::%s: urgent latency tolerance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
>  	dml2_printf("DML::%s: ROBSupport = %u\n", __func__, mode_lib->ms.support.ROBSupport);
>  #endif
>  
> @@ -10603,7 +10603,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
>  				if (display_cfg->plane_descriptors[k].immediate_flip && mode_lib->mp.ImmediateFlipSupportedForPipe[k] == false) {
>  					mode_lib->mp.ImmediateFlipSupported = false;
>  #ifdef __DML_VBA_DEBUG__
> -					dml2_printf("DML::%s: Pipe %0d not supporing iflip!\n", __func__, k);
> +					dml2_printf("DML::%s: Pipe %0d not supporting iflip!\n", __func__, k);
>  #endif
>  				}
>  			}
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
> index 0ef77a89d984..d1d4fe062d4e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
> @@ -2023,7 +2023,7 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
>  	dml2_printf("DML::%s: mode_lib->ms.FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
>  	dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
>  	dml2_printf("DML::%s: max_urgent_latency_us = %f\n", __func__, mode_lib->ms.support.max_urgent_latency_us);
> -	dml2_printf("DML::%s: urgent latency tolarance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
> +	dml2_printf("DML::%s: urgent latency tolerance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
>  	dml2_printf("DML::%s: ROBSupport = %u\n", __func__, mode_lib->ms.support.ROBSupport);
>  #endif
>  
> @@ -8174,7 +8174,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
>  		dml2_printf("DML: Tvm: %fus - time to fetch vm\n", s->TimeForFetchingVM);
>  		dml2_printf("DML: Tr0: %fus - time to fetch first row of data pagetables\n", s->TimeForFetchingRowInVBlank);
>  		dml2_printf("DML: Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n", (double)s->LinesToRequestPrefetchPixelData * s->LineTime);
> -		dml2_printf("DML: To: %fus - time for propogation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
> +		dml2_printf("DML: To: %fus - time for propagation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
>  		dml2_printf("DML: Tvstartup - TSetup - Tcalc - TWait - Tpre - To > 0\n");
>  		dml2_printf("DML: Tslack(pre): %fus - time left over in schedule\n", p->VStartup * s->LineTime - s->TimeForFetchingVM - 2 * s->TimeForFetchingRowInVBlank - (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime - p->TWait - p->TCalc - *p->TSetup);
>  		dml2_printf("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %u\n", p->PixelPTEBytesPerRow);
> @@ -10994,7 +10994,7 @@ bool dml2_core_shared_mode_programming(struct dml2_core_calcs_mode_programming_e
>  				if (display_cfg->plane_descriptors[k].immediate_flip && mode_lib->mp.ImmediateFlipSupportedForPipe[k] == false) {
>  					mode_lib->mp.ImmediateFlipSupported = false;
>  #ifdef __DML_VBA_DEBUG__
> -					dml2_printf("DML::%s: Pipe %0d not supporing iflip!\n", __func__, k);
> +					dml2_printf("DML::%s: Pipe %0d not supporting iflip!\n", __func__, k);
>  #endif
>  				}
>  			}

