Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 352D8135AB2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 14:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F1D6E40F;
	Thu,  9 Jan 2020 13:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C0B6E40C;
 Thu,  9 Jan 2020 13:53:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjsvu4cQLisUzoDa/5cX4EwPSbYT75KjpuyYp6VR02SuOkFWJ5bxR/o+pbwp5aznE2VdobG20/pUkgOU7xGNBQQBAansEEHTKkVVIPQJFbaASkPdp5kwLiG07xnNfK70WLZsDE8elqpcqZXoRmW8QozCH7qSH/NGqUt0Wg6D10E96GQ5Eis2L0Vm3755VjjKbSLp12a8Fhg4BTMFVDuB2ZNdxjMzaDUx5oHVLbxiVpV1N4gD6UglP/pLmLLepB/rmWzdIZ2FaQ0x6HFek54znd8vNsaxwB3zFVn9uIh+3qbaEtTot/GQYDT5ZGr0vOVhlm9T/TMEjxtfSulI+vws3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZ/fB1wjgyW/jeiQtZPl1gCSSczT7+TTlfsJ3Qn6RGg=;
 b=gS1Srp9xI2sOqfXcsYQaaL2001CxrkQ9ZOHcgMrTYKAS8MidTrNbF7qt71xpLSzLpCHl7WU4FD8QoHUOtgEAvosMMe4GGWX7HARUSu7/2DN/96+EFq+bmMPgkGeFDFN8n1J6x9hJ80TKV1lNsLJlLvFel3CYpLSo9rBEqGhscc4cedeOsFWBaGJk72qyFHMZYwNP+7pAaO55a3lJFxjG2LEL31JPkZMqIivaA02eAnML9Ezp6Y8XtGPOkt54DTpuTnTvcZnyecz52P05rlECTWplozZkIlBtuTd2BL/kfehLkv2fLoZmZHFil2jQu/+0deIabxnCpeeiTu10G3PSUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZ/fB1wjgyW/jeiQtZPl1gCSSczT7+TTlfsJ3Qn6RGg=;
 b=zXhMNIObEBFPGJTV5H60cQ6Yk+OHHk3sqA6NnufBmT4IdlO0brCCEXmRpp5ViWYp6GupOfw64miLUqNjPJvrtP0wH9qHSC+TaZ2oAFlZYDyYKLvEcnjNMJ49riTVZmzwxNQln+yNxtGt0/ymwyxkr0hp67vIQwECi0ZtaOhwAuw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikita.Lipski@amd.com; 
Received: from BYAPR12MB3013.namprd12.prod.outlook.com (20.178.55.219) by
 BYAPR12MB2918.namprd12.prod.outlook.com (20.179.94.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10; Thu, 9 Jan 2020 13:53:26 +0000
Received: from BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::25a3:31ea:5c8a:a50c]) by BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::25a3:31ea:5c8a:a50c%4]) with mapi id 15.20.2623.008; Thu, 9 Jan 2020
 13:53:26 +0000
Subject: Re: [PATCH] drm/dp_mst: fix documentation of
 drm_dp_mst_add_affected_dsc_crtcs
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20200109032412.364214-1-alexander.deucher@amd.com>
From: Mikita Lipski <mlipski@amd.com>
Organization: AMD
Message-ID: <b2a3f7d9-5939-eec9-6f29-7b9115ad0679@amd.com>
Date: Thu, 9 Jan 2020 08:53:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
In-Reply-To: <20200109032412.364214-1-alexander.deucher@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::28) To BYAPR12MB3013.namprd12.prod.outlook.com
 (2603:10b6:a03:a9::27)
MIME-Version: 1.0
Received: from [172.29.224.72] (165.204.55.250) by
 YTOPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Thu, 9 Jan 2020 13:53:25 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 44474fb2-2d5c-40eb-dd31-08d7950b4c61
X-MS-TrafficTypeDiagnostic: BYAPR12MB2918:|BYAPR12MB2918:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB29181DE1EF7DD7DC4D3C978EE4390@BYAPR12MB2918.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 02778BF158
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(189003)(199004)(53546011)(36916002)(26005)(5660300002)(52116002)(186003)(316002)(16526019)(36756003)(2906002)(4326008)(16576012)(8676002)(31686004)(81166006)(31696002)(66476007)(81156014)(66556008)(956004)(66946007)(6486002)(2616005)(478600001)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2918;
 H:BYAPR12MB3013.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6kGuzGEtanKJcOundP3feV+4Cfr9nZMHIqcvyg7V2ke0t7VGuAs2knSZ7CD77P+ukm+UqtwXyZi0jCqGhRkNFcfFMSLSdYMR0BtW19USr5PjBbt/0zrHPx1Kog3e7AEr8G+Wv6IdaV0h3MP4t4Rxvfaa1yuG7VDGFEfXR9P3xMz/RR2JgZkd0tFOz+9xYdVYHfI8XTH8Dki/28CXlzW1d4Ih9RRNEJD72e/ovKxzsu77QpxTdz6zC8EJ4BpG03jp6Z60lVh84EprnCQYuQt9zl/j1mxpC2/I1J/f2Fzg62rXEh8UZnjyNBwoPOwHqlB7Uldz+RmMF/WH3WA45PaUz7a45vY7DS9ZTm3XmGsotR8jg/8hCG7HK0xLU+cMKbI1hy/HTj+88DUGv0VU0ZpotjUvdt/SsLeg01meJbwuhzD+wMOF4c0mGIgwLPXVSXk1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44474fb2-2d5c-40eb-dd31-08d7950b4c61
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 13:53:25.8163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BaAxD/1Vvo73edQPu1cwSxgBmNdXCQNoJqcKWlEfA7Iw9e4Term+MA8ph9IWbbzB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2918
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you,
Reviewed-by: Mikita Lipski <mikita.lipski@amd.com>

On 1/8/20 10:24 PM, Alex Deucher wrote:
> the parameter is the mst manager, not the port.
> 
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>   drivers/gpu/drm/drm_dp_mst_topology.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 7e9b9b7e50cf..a4be2f825899 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4781,7 +4781,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
>   /**
>    * drm_dp_mst_add_affected_dsc_crtcs
>    * @state: Pointer to the new struct drm_dp_mst_topology_state
> - * @port: Port pointer of connector with new state
> + * @mgr: MST topology manager
>    *
>    * Whenever there is a change in mst topology
>    * DSC configuration would have to be recalculated
> 

-- 
Thanks,
Mikita Lipski
Software Engineer, AMD
mikita.lipski@amd.com
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
