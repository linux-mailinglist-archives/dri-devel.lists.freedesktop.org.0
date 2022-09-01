Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A185A93B1
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 11:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410AE10E673;
	Thu,  1 Sep 2022 09:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547E010E673;
 Thu,  1 Sep 2022 09:56:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRTGwSfxzCfn4Yfi+ObEuu4QoMiAQaHug0IpK2BzinEL7Nv7a8nWBsiOYy+Nxc62KsxscOR2eupXlZIidOrgJE8OnUco0pg4CzkZ2UVtuXFmHUZo21ND3Nom39Vwx8DVulrmsPdDlSG8PTDh4hiKf/IOkEzP1HZTZf8SXOiBt4ZZ0hvWCNPPbA5j4vecxRGyTFPhS7ijDvm/PZGO6BKC1J9RdtIxbbjMsIIebw8Ums4gLuTCEmsCiNHnV2VfiWmd1H1gsAvx1B6bmZ48pYZIdPpSrRE5BCZY1HGzrWxVebYx8UBs+eEdlivF00kEWwElJb1U0L3RpxyDQvLjrfS55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oq/sWupacDq0pDiRREUCxvKvKE/KOQtXMSAwSCkCT0M=;
 b=Mn+rDmK6Ie+cPAuzQSLuXlf2q6Ic4YGbycyiV4MIJK2u5Srsg9VIzff5pp+TgP/5NUz/15n+5jgYeIcxXIwNjSHxb4Zk0PWHFO1fZWD05XW19+jqGS9BbkdIdw6D1xd0hNB678fV9LgB4b9SXG4YFUb3LBQYW91sdEzD5VjQR5hvkE0ViGF8Cdhdl14P/T8wEE2T6k5ZaA0bdsEIUdn6SIbP/4K1YlIQkb9akTA4WbmrS+fFT1lqRTX+vjoYttHt8pqu/Doh7r7Vys3h0nEiCtdujUc29IqPWear8ogZrbDSxmzeFJ4BEpWI0Tg0Xpha8QO+GGlpFP+sO0T5CQURrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oq/sWupacDq0pDiRREUCxvKvKE/KOQtXMSAwSCkCT0M=;
 b=t0JP1FF5emvE3pY5IifUB0bo5WO4J80UnEXdkAsRSiYTMoLt37I5XVYeFuzAqUp9yzqv2Xy5x5Fmf2pONy7/5Wdt4YtyUCWRExBdAcBQcRRhuB1VoHJeva9uiJISMh+r0eTAq9N4PqTrUKDWqblmltY5YdWEC8VWs1Ccn9HPIcY=
Received: from MW4P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::8) by
 CY5PR12MB6406.namprd12.prod.outlook.com (2603:10b6:930:3d::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Thu, 1 Sep 2022 09:56:06 +0000
Received: from CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::4) by MW4P221CA0003.outlook.office365.com
 (2603:10b6:303:8b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12 via Frontend
 Transport; Thu, 1 Sep 2022 09:56:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT108.mail.protection.outlook.com (10.13.175.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 09:56:06 +0000
Received: from [10.65.149.18] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 1 Sep
 2022 04:56:04 -0500
Message-ID: <7d5f73db-7882-c333-c471-ee84e69e5c42@amd.com>
Date: Thu, 1 Sep 2022 17:55:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] drm/ttm: update bulk move object of ghost BO
To: ZhenGuo Yin <zhenguo.yin@amd.com>, <amd-gfx@lists.freedesktop.org>
References: <20220901092946.2030744-1-zhenguo.yin@amd.com>
From: JingWen Chen <jingwech@amd.com>
In-Reply-To: <20220901092946.2030744-1-zhenguo.yin@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a24d86a-a24c-4a9b-3eee-08da8c003047
X-MS-TrafficTypeDiagnostic: CY5PR12MB6406:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LKsndBg1Bz9G8XbJu8KioPr7tmtJ7KAJo29FuZ1Lj9vDZKQ32+63U9/oEBRfv6KjwKRdr7bR2MCmqMp25vSbtYV/0qydBgUrbkZ7UJJ+8Ghj1t1l+UCF8WJ+sEWs0ETmoEaF5/4JG+hYozAMWEDAi2qJ14PYRBa359ciFLZuD7cpfK5FoOL44fGM6RMTrtHwxCNIwO03xKjJ3ntQQMEPBCS85Jk6H0uFF95VZJd4h4feCSGwnUtiJw0bVKUppEQ/LITEdrixvxpi27C0CdcLTSA3qZoQyt/OhTeYbaoFGRipLr0FmBDsAx5bxItrGsPQvf9/QoL56WeIr8Snr95+5hWSa0wCVX0wAMMoI/QluY0n/G5OwUJRAOUBFWwzxwNG1dxC64Pu2NjF17cJTrIvkZhvDXgU/GTsrU1QK3Lbqomwds6MyzIYZ4cfXoO0cR3XmZlcj/wkimGlXHnysvom5pe5UWPueoPst1tAL79Uwoluub3MHCoMRjQDwdefikKpKk9lxIR6PWwPdwNHmmVO9Anl4fqFJI88wgbC0ql5eteMRGyV9R+TcCcwyZB18AlcV1hx+pLTZ7RcLP4YGnQuuEhUEhmLhAO/Ob36kcmNMxoZ/vci69znF8bmp6Nc3FSH5IP6j6AL9eDk0+TpQZBwwmIosNTogKBK0qjwVFTgJ77ZyD7oxNkH7cAqpv4LqkqJjQ9fBu6cZLlQZfDxvYn5vwl1vSjFcylYNNx0UqDGqDz6tYEy6CBzsqqwJuSAI1iwPGurmr+ZEAYrFL6Q2Rm4it2D/6XzIIA99+PN6IpIWl9p+JaY0hCcuorRsgrMgr64hNynfCJ1YlBj2OB3UVfejw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(136003)(36840700001)(46966006)(40470700004)(70586007)(450100002)(70206006)(53546011)(4326008)(8676002)(6666004)(16576012)(316002)(8936002)(36860700001)(40480700001)(26005)(478600001)(40460700003)(81166007)(110136005)(31696002)(54906003)(41300700001)(356005)(47076005)(336012)(82740400003)(16526019)(186003)(2616005)(2906002)(83380400001)(36756003)(82310400005)(31686004)(5660300002)(426003)(36900700001)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 09:56:06.2492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a24d86a-a24c-4a9b-3eee-08da8c003047
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6406
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
Cc: jingwen.chen2@amd.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Jingwen Chen <Jingwen.Chen2@amd.com>

still need confirmation from Christian

On 9/1/22 5:29 PM, ZhenGuo Yin wrote:
> [Why]
> Ghost BO is released with non-empty bulk move object. There is a
> warning trace:
> WARNING: CPU: 19 PID: 1582 at ttm/ttm_bo.c:366 ttm_bo_release+0x2e1/0x2f0 [amdttm]
> Call Trace:
>   amddma_resv_reserve_fences+0x10d/0x1f0 [amdkcl]
>   amdttm_bo_put+0x28/0x30 [amdttm]
>   amdttm_bo_move_accel_cleanup+0x126/0x200 [amdttm]
>   amdgpu_bo_move+0x1a8/0x770 [amdgpu]
>   ttm_bo_handle_move_mem+0xb0/0x140 [amdttm]
>   amdttm_bo_validate+0xbf/0x100 [amdttm]
>
> [How]
> The resource of ghost BO should be moved to LRU directly, instead of
> using bulk move. The bulk move object of ghost BO should set to NULL
> before function ttm_bo_move_to_lru_tail_unlocked.
>
> Fixed:·5b951e487fd6bf5f·("drm/ttm:·fix·bulk·move·handling·v2")
> Signed-off-by: ZhenGuo Yin <zhenguo.yin@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 1cbfb00c1d65..a90bbbd91910 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -238,6 +238,7 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>  
>  	if (fbo->base.resource) {
>  		ttm_resource_set_bo(fbo->base.resource, &fbo->base);
> +		ttm_bo_set_bulk_move(&fbo->base, NULL);
>  		bo->resource = NULL;
>  	}
>  
