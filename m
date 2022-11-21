Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6CB632F24
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 22:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0597E10E1B5;
	Mon, 21 Nov 2022 21:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2040.outbound.protection.outlook.com [40.107.96.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6DE10E049;
 Mon, 21 Nov 2022 21:42:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qt9zklW3K7iloEWX3bJFgCQDFmayWLQxKwnJrlbnT4b5l9w7eHNe1DqgHlluQ2z0+NFEhn6z4I/kyqIqGYrY4EB9pCglpw24ECOYebqE1dz/rxBSnc6bKgAn/eLR+wGfa6TK8oBhDT5j3WIWKBPWdoDQ5Lss0KOZ+9vJj5wGHSoESrt5wMEvaTVJQSlvY50UoVMafDQXkvekmU1+1lDeBc403KNAOD+EKCoE4BsSY+aFFYTQ8Vlg18EQ0d8Omc/onhMQZwefZM/ODx6cJm34QQre9GZrpu0nUFPLcf2mjLI/2tKpmUgl0m0cr13eNLSoiC1iLYllpLLzySvg8ksQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YaEU63k5xulTkJQPP/YlBAy31O1uFuUNrXRaDb77h3E=;
 b=QKkV7TC253/LHUH0IXzFLAZXkdnEWqbH/mInhTAmR8oo6w718vVoSCqGO+znFw24R7qcqfDLbBnre7Y2C8EG+54L6dZFDf0kPdnswG3ARXRGVAg1CfbDXuEzY7OcQdwQkpZnzamuZkDFodqnVxyoxDSErCs3BTdHuxVKfCymlag0oRBX2F9h3ymcGl1PNFkNdK79MfjQxjxkJqH9imNFWOJzq50ZDbKB1ywd8lmLcuEsV2Xd+bLAgzlddZE+cLhDDcC8SB1qrI0gR9w8vZR5R1yqrazuB65tOT8Rnx7Mg9FtQUK3ahWutJEmb6I4XtmuWI0GBcBPRgmf1xE0PU9lMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaEU63k5xulTkJQPP/YlBAy31O1uFuUNrXRaDb77h3E=;
 b=w2sT4C25d0/Nf1xBXIFpoQcWL0BD8F7Wy2nVvlh2OWAWUjryWmyJjQbAUQgtkDge4nltkPMMBojDAh1b44dCM90dTIDZ+OXpXAt0VSVSFZ8hB+39/3M4kG/bBhGQtkK29rj3p6O6UHVzMqap7x1Ty0iR7mN2fZeu3OKOuOu0BhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SA1PR12MB5658.namprd12.prod.outlook.com (2603:10b6:806:235::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.9; Mon, 21 Nov 2022 21:42:36 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178%3]) with mapi id 15.20.5834.009; Mon, 21 Nov 2022
 21:42:35 +0000
Message-ID: <c374e84a-ee07-e55c-76f4-3c3ccd42ebd2@amd.com>
Date: Mon, 21 Nov 2022 16:42:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/amdgpu: Partially revert "drm/amdgpu: update
 drm_display_info correctly when the edid is read"
Content-Language: en-CA
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20221121173823.695615-1-alexander.deucher@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20221121173823.695615-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0102.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::21) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SA1PR12MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f7a6135-1fd4-43ba-1f3a-08dacc094dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mSZQREbdbZpAizlfUWQrCsi83ID6Tx0ejbAyhZOmKPrcMDQ0klDmRbZcZiD6ZHkaoRrJx9UGqh+q1jFkR8+z8DvRmRjuWLMzX5QXQC4tv+8Y6+D132tX62thwbRgv5Ei4V2H7x12CBi91QRU37ttwQ4QWZGmTk66K3J7PF9tyOOvw8gqMod1WYAIgg7YbTErdRM1Y1r3VnshEPiH5WmAmFjEBFchC4o8yrnm13U0c5tYnn91R6eyPSRbnKgfuEyCE89xxGA6z5V5eJUr1CM7iLu2eC/mQahg0hlOTAWtR2FxnCK56s1ZOH00V8wHVuh6idSCURbWfvBpumBHXGPEjftOjPHI6z3LvYGB9XQ5DbkuMuazE+yoVffCJ5jXrwZDfbyfP/icbfKFwaqRMbevJYNOly9eHUnJp/PdZJ2joTU29NBeYVMPEcL9k3ehCfEWliNSywF0dZ81KeFf6TPsz0FEoPgBpLx3zD600Mq78G60hYdZ0UEWYC+bH9GZ0L3i6M4jXQbfTrI6CA/XObH+yMaCcvVdbbveYYRra5LN/A+4Uz0VPItWOAF+cx/ikOUxD4G12XJAG1ZadsB52BfFLErIuKtKRj7behkQDYLp4CJY7CBPxGYUSHuWtqFXnNYDdK7jmHNi6/tf1qZGRl1+p38+xujY5xqVaUMwfp5Sj94=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199015)(36756003)(38100700002)(83380400001)(66946007)(4326008)(8676002)(66476007)(8936002)(4001150100001)(2906002)(5660300002)(44832011)(2616005)(316002)(186003)(66556008)(6506007)(6512007)(53546011)(86362001)(31686004)(31696002)(6486002)(478600001)(966005)(26005)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmNZSk5jQzJTVWN5dGZQSTVxR1h6ZGNBcEptNXFnT0FEVEQ2SGIveDBrNDNj?=
 =?utf-8?B?TXdkZjRXcVg4U3RSQm1IaVkzd1JBcGJWdUVQV3pUOUFiOWZqTXBLdUlGQWE3?=
 =?utf-8?B?S2xham5QeG9sTWNReSswTnJTa2svN0F4bTFGMFhwd2xiajJISG4vN2kwRzVX?=
 =?utf-8?B?NWFmbGtrQ3lGbTVxZmdEZTFJWXF1dE9TcnlZODBTdkFaU04vKzN0b2pRNG5S?=
 =?utf-8?B?b0FhYW15Y2ZRcFBUWEFFWittUEduOTZYVSt1Yk8xaTlYN25hVW53T3lDcGZK?=
 =?utf-8?B?c01GaVE3Z05RV2tJK3JSdXZJTitkbFJVZWZJR0R3dkFTWUFkQ3JkUnBzRVpm?=
 =?utf-8?B?NUxJN0gzSjdlb0hLQUtzb1lHNlgxdytXWnNqekQvYkxRa1V4RXh0Qy9kOVRv?=
 =?utf-8?B?bnI5T0I0UUpMQXRISWt4RFF0SXdzNXdYQXVBeFM3WGJKYXNWc3EzYlh4SWtD?=
 =?utf-8?B?TGxmL0F0bXdFeExzZTM3VEovUFZOQUhZY3M5TFlWa255UHZFM2dNSUROVXNC?=
 =?utf-8?B?VVJuZjhJWllpd0dPc0toWlFhUGpUaktYWWl4SUpSdWhFaWxGWjkzRmxKWitH?=
 =?utf-8?B?TXQwU2RadlJYODRFTmtmcUtXbzhvbXV0a1lvbmczOWNvQ2tGTlpZamVnOXd4?=
 =?utf-8?B?dUtjRkplK204VHV4T0UzWW5FNkJsOUgyWEdycytGRHVNUU5TRm5tNlJZcnJh?=
 =?utf-8?B?ckdLVjY0SThLUm83ZGRVanE2dUNnZy9SZ2Z6YU1vVjkrRUJSTWZFbDJCK0R3?=
 =?utf-8?B?RHpZZlFXUzJWNVIxcTlTYzJManlCUFdMdjB5Znc1WWdFR05GMnlWMm9mMVFR?=
 =?utf-8?B?OTd6U2s5bFE3c3JiZGUwc3RJR3E2dnlReGlhRENLNmM5NzU2R1RjUW1jYkFo?=
 =?utf-8?B?TFhlRStEbmFSdGxCbmEvamhTK01GeEJQMHpobllYdWFZZmxVSm1hck1rSURx?=
 =?utf-8?B?dEpreURVRzBHUXhFcUt0L3pJb1pieGZESmJpbXY4SWM4T0FqMU82L0tidEQ4?=
 =?utf-8?B?MnMvVlcvcXFYaElVekJrT2J4bTZHYkt6WVZtdS9ZZFp2NDBCai96TW5LSW9H?=
 =?utf-8?B?KzV0UWpValJXYzFXSU5iQXFHeFA3d3h3Ylh1K25aTU5TUmt5R2txeEpGT3lF?=
 =?utf-8?B?Uis3TUlBYVVDNXk2OUhSOXBaYktBbS81c25Da1lOUmtma0IrSHFUZE81NnZi?=
 =?utf-8?B?RlJpcEpsVGprb3JJYmU1STN1bnJmOGhMU3JobmlwYWVBQitPbERjb0ZBQWVi?=
 =?utf-8?B?d0xVbmtrZ3dqeUViaEZyeElkOWpmVGUzVVhGVHRyanRxRElJVEdoTERUWC9D?=
 =?utf-8?B?V3FxNi93aHZhSEdUenNQMzJiYTBVZlFXWjgrdzVld3VsaE9vR1l3c1VDbFR0?=
 =?utf-8?B?V0NOVjBiZVdBNDl4K1RTVmNSalpYSHpoclR6a1RzLzUycmFwczdlTHRla2po?=
 =?utf-8?B?VCsrcXRuc2pOVUhUQisrTllLVlBTWUVmQVNKd21FbzZjTlJyNjJUQXJ1QUFG?=
 =?utf-8?B?czRtRGNCaWxqZUJGc2toa1V6QzdHRHNaYzhXVWpsMUN5elVCYmkxOXRQcGNx?=
 =?utf-8?B?VXJwZ25YbngzYlM3aC93U1E1WDU1clhWMlo0RHAxT0g4Rng3T204cDlGaStv?=
 =?utf-8?B?VHJld205dHN6Ui9jYmw4S1JydXk4TndnZU4xdmZEQWxZU1FYVXJ2eVIzZnFG?=
 =?utf-8?B?UUYyZjV3UHZGcVNvRGl3Vzl1VzZrblJDdnM3RStEcGswL2l0WVZMSUVqS0Yv?=
 =?utf-8?B?emN3eG5jMGNCVVdrbEo2d1F4QXVVMWU2UkZob2NqSVFINUtGMzFiN3E3VmVs?=
 =?utf-8?B?NWhiRTJ6cWJyR3g5emlNeWZVNDVuWE5rMmgzUmpXUEtpNDJ5LzJhZmJ3YXFV?=
 =?utf-8?B?a1dXMVplakwySHJrb2U1eGF6TjBIbmROak16MytuQnpGZW0wZWNRb2c1cTYr?=
 =?utf-8?B?N0RGUmJxTFlhWjMwMWo4a3hQTnFsS3JhaTZNSGxMMkgxN2tobzViWlFSZVgx?=
 =?utf-8?B?eDVZajFOb2VBdnVzRTd5WFVYZElrTG95b2UwVURIU2NjejQ0Wi9VS0tJcUY1?=
 =?utf-8?B?dWFhYTIzMm5Wb3FqWUZ1eFpBekNteG1TNEFLMkE4UHYwcWUxeHVnOTFSdW5i?=
 =?utf-8?Q?QcwO/Wk2lkWT8Al+5rul+5rFs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7a6135-1fd4-43ba-1f3a-08dacc094dc6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 21:42:35.9198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iR54q0lpMQElu4gSIIL0uMmCE1qW/dS/Ow3+XVderG6gw/J8q76GConp/1reDbrR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5658
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
Cc: Claudio Suarez <cssk@net-c.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

On 2022-11-21 12:38, Alex Deucher wrote:
> This partially reverts 20543be93ca45968f344261c1a997177e51bd7e1.
> 
> Calling drm_connector_update_edid_property() in
> amdgpu_connector_free_edid() causes a noticable pause in
> the system every 10 seconds on polled outputs so revert this
> part of the change.
> 
> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2257
> Cc: Claudio Suarez <cssk@net-c.es>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index 491d4846fc02..cfb262911bfc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -328,7 +328,6 @@ static void amdgpu_connector_free_edid(struct drm_connector *connector)
>  
>  	kfree(amdgpu_connector->edid);
>  	amdgpu_connector->edid = NULL;
> -	drm_connector_update_edid_property(connector, NULL);
>  }
>  
>  static int amdgpu_connector_ddc_get_modes(struct drm_connector *connector)
