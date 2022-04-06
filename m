Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2AE4F59B8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 11:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA2C10F2AB;
	Wed,  6 Apr 2022 09:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2047.outbound.protection.outlook.com [40.107.21.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB9710F2AB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 09:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1t0nEOQkwLs7xW6ArjE7M/kMg+2GkTmYLzd2EW91/U=;
 b=2dzGAq/X5FaPqcRSkRFGfhHxBA1e9Wxd77y7O1J6XWfbF3fyu48pzvwYcTivncWbIham52Y6R2hs7UaojrqNUmwX2Azxx7kEL/zyzHnMqJP1yDm04AmN90+MeKCE/JZW+y/d83Z7aRGDocF+oqvbD7pSGheWO5aQpnM7XpyAj3U=
Received: from DB8PR06CA0058.eurprd06.prod.outlook.com (2603:10a6:10:120::32)
 by AM6PR08MB3512.eurprd08.prod.outlook.com (2603:10a6:20b:4f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 09:27:14 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::b7) by DB8PR06CA0058.outlook.office365.com
 (2603:10a6:10:120::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21 via Frontend
 Transport; Wed, 6 Apr 2022 09:27:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Wed, 6 Apr 2022 09:27:14 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Wed, 06 Apr 2022 09:27:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2121cf8f3e36a0a9
X-CR-MTA-TID: 64aa7808
Received: from d2c5bf162a18.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8CBC6821-1B77-48C6-9AE6-51E68C370A4B.1; 
 Wed, 06 Apr 2022 09:27:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d2c5bf162a18.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Apr 2022 09:27:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8SmK37msD1zbNWI1a1raSA2LltAxZwRodx5UsyyU8KQsyEE4wITWP0lv5/dOAnTs8Q/NHA92ntWf2ntR/P6SIM3YuGspiyv9Zp+fwViiuWuG5/lqFRDHzrLb2ZkttiWruLt8tLst5dKZvZOeNI3lJkrzI99tDF8Q9/k1aF77nib52D/oYrvUoDJb2aErv+F2SQ6F2/CqiwDOezg5UEttdw3LNVaPqTbGMVRgIO9Em6Z1fOpKjMWaDCLLKG6NcLzv+gs/5iB0RffHo2wyxG6oQ0+0myLNXI/xfnyfjGGlImSf+hgQHoNfu2YcRFsnPHGaaqzdDDf+38i+8ZeCkIF2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1t0nEOQkwLs7xW6ArjE7M/kMg+2GkTmYLzd2EW91/U=;
 b=QgXXNhXQ7cM4FDPRA9vJNKOXXUb/J4JilwFoRPgB56A63de4FHKhD6QPHWi89LhrcDqRLCPLaBKgrGXxQ3FyDWR3FDfqOcts8GdiqaO3/uFTXXapdxGAME/tBWI46VGagc7fB8+9EUtDDyu7t7CPy3XgvHWr8CsnX8mWFtI6M9r/g0tH/OLJ6RDTTSOyq9CmZ7tX+tEyM77rKE2c+KGpPnKujUIUJoZrWntg7wrRSBSgkHlm4GMreLHSrfr/fbVVAKPT42WNLSLfFeb433xA4MW1R6d+LGLvg45w3FMhoT2HqCKiKANiy6dyFmx8V8PQD2azycerkvplAqobkOIZZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1t0nEOQkwLs7xW6ArjE7M/kMg+2GkTmYLzd2EW91/U=;
 b=2dzGAq/X5FaPqcRSkRFGfhHxBA1e9Wxd77y7O1J6XWfbF3fyu48pzvwYcTivncWbIham52Y6R2hs7UaojrqNUmwX2Azxx7kEL/zyzHnMqJP1yDm04AmN90+MeKCE/JZW+y/d83Z7aRGDocF+oqvbD7pSGheWO5aQpnM7XpyAj3U=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB6812.eurprd08.prod.outlook.com (2603:10a6:10:2a2::15)
 by VE1PR08MB5789.eurprd08.prod.outlook.com (2603:10a6:800:1b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 09:27:01 +0000
Received: from DB9PR08MB6812.eurprd08.prod.outlook.com
 ([fe80::7d18:6735:d37c:23c4]) by DB9PR08MB6812.eurprd08.prod.outlook.com
 ([fe80::7d18:6735:d37c:23c4%8]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 09:27:01 +0000
Date: Wed, 6 Apr 2022 10:27:00 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] drm/arm/malidp: Stop using iommu_present()
Message-ID: <20220406092700.t7o7ujk4eqn7ckgr@000377403353>
References: <5049994e6c2ba92c2f30d51850c8929136d0f8ca.1649167878.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5049994e6c2ba92c2f30d51850c8929136d0f8ca.1649167878.git.robin.murphy@arm.com>
X-ClientProxiedBy: LNXP265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::19) To DB9PR08MB6812.eurprd08.prod.outlook.com
 (2603:10a6:10:2a2::15)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 20c7a9f5-0f61-4b03-f4e1-08da17afa2ef
X-MS-TrafficTypeDiagnostic: VE1PR08MB5789:EE_|DB5EUR03FT045:EE_|AM6PR08MB3512:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB3512C93F4FB5F937A787B84CF0E79@AM6PR08MB3512.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rEjoPHpObQAzMcadS1OY3D4pBS8hnfT80z+In3PhGOVm0KFIFcIF48zlUiupPVQN30pLCk8WkUnDh428l3T8TcXjhrTIx+PUwnJbl6J1TA/RxCaqklKnfoWu+9t3O8aCul676zTwlinQcZWnHfNbGsAqpZOpCpP8RfL6Z1LwhqjiP/0rkVe/k7l6rMjck4aH+6AK4jS8T3PsIrGHaSUpGVJTEXxk3l11pO0+psDFOOlm6A9R+puBreInG8lwYfG0obGmEyawE0tbKyuWOgtIths8KsjLq6YIp+6yE/luKY9kZKB9JLxFGo+BN5ToK/pDL37YcuFs0pZfxfpUzO9WJfrfbqsszR5HbiMzpFYXiaZffcbWTDKxJE6rP92OYrhPeaSjDaTz/4KuIlOzdW89Rqv58l9ZdkqyCTUGqp8ubOhFHyaVEmWfJiL9vMMKY8APb6Sdkt++la+xaci2M5v8Pj7oxl+MM2phz4CR4ioZUb5eNoAofudBqJ6t52WOXMJEQPicp22a2937BsRasyxFqXu+QFkSAw10rTti8eYAU6IiKTOGwnctzJQg93+NHEDeTjyVwzGBQViyB9+1V3FU7UtSMTZNzkCsPJ2K5JGwWIIyuX6fBlTItiDJj2WEcoF2ypl79HcxgHIF6plfySdS6A==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB9PR08MB6812.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(1076003)(83380400001)(2906002)(86362001)(186003)(26005)(44832011)(33716001)(6486002)(6636002)(6506007)(38100700002)(9686003)(5660300002)(8936002)(508600001)(6512007)(66946007)(316002)(6862004)(66556008)(4326008)(66476007)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5789
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 858a0126-0d02-472c-567f-08da17af9a77
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C85OFPylbs+KtoNseMUcOxF/Qq9r3kmO0GW7QirlKUDWvU45EnQd2gvPSdRYaGLVdYtR90RK3gVDZIVganSGMNNMQETM9J3MCKgSErdVohP//e0GF1oijeHalTyAEbD6ZFQlOgE5wk3frQE9g2VisVASJ8n5W/i7jT5s+Dp6wW09PLgv8F/YPVI6tVU4ehsLd7seEYejoRlyyPGH9CBZLhPWuKp6e9czeugYmgO8wyb/ihiX3zLxuiFRhGgnFKiDbNnyAcgJEINFKOOszpJTn8NGl8+Ij+oqutwbYlUwBQeBxfJh+QNoyYdRzXjMz78OvEG0qtkVxcaN7+zPBVyLU5079r67iPnrbZqgSQRUm7m/rDVXnWXUJfzy2ZiM4pCT0VD1XrkCbUedZ9lDdR01ui7Mv0wrRpIHLpolsstvpAc/CovrT2fMq9m3nw/fOBdvETBxTLgoaB3fGxPto6xrZ1w99JDMv9pmFcFT6XzAmManhHAKwomdbIdtkri4UDJP5A4euVINBwklpeAbNp3ZJXcmCqj9kcVQJn8Po+5KHH5YZftsiuLOFGMjPtJ357fsFU/UwOBgx35xNUbxYofgadgzfQneJFeMCqSzeBOVnQQLAXvmPGKMhbfvYd5X6+Nex4O3CkoghpGBaePeMOHh0xuNSVEhJqDHo4LtzzCK3o1f+Y7qrxdWXULHkvTl1bfC
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(40470700004)(46966006)(36840700001)(82310400005)(186003)(47076005)(26005)(36860700001)(9686003)(8936002)(6512007)(2906002)(44832011)(1076003)(86362001)(6506007)(40460700003)(83380400001)(508600001)(336012)(70206006)(70586007)(81166007)(33716001)(6636002)(8676002)(316002)(5660300002)(4326008)(6486002)(6862004)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 09:27:14.6540 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c7a9f5-0f61-4b03-f4e1-08da17afa2ef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3512
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
Cc: iommu@lists.linux-foundation.org, nd@arm.com, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robin,

On Tue, Apr 05, 2022 at 03:11:18PM +0100, Robin Murphy wrote:
> iommu_get_domain_for_dev() is already perfectly happy to return NULL
> if the given device has no IOMMU. Drop the unnecessary check.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

LGTM, Acked-by: Brian Starkey <brian.starkey@arm.com>

I'll have to leave it to Liviu to push though.

Thanks,
-Brian

> ---
>  drivers/gpu/drm/arm/malidp_planes.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
> index 0562bdaac00c..81d9f5004025 100644
> --- a/drivers/gpu/drm/arm/malidp_planes.c
> +++ b/drivers/gpu/drm/arm/malidp_planes.c
> @@ -310,17 +310,13 @@ static int malidp_se_check_scaling(struct malidp_plane *mp,
>  
>  static u32 malidp_get_pgsize_bitmap(struct malidp_plane *mp)
>  {
> -	u32 pgsize_bitmap = 0;
> +	struct iommu_domain *mmu_dom;
>  
> -	if (iommu_present(&platform_bus_type)) {
> -		struct iommu_domain *mmu_dom =
> -			iommu_get_domain_for_dev(mp->base.dev->dev);
> +	mmu_dom = iommu_get_domain_for_dev(mp->base.dev->dev);
> +	if (mmu_dom)
> +		return mmu_dom->pgsize_bitmap;
>  
> -		if (mmu_dom)
> -			pgsize_bitmap = mmu_dom->pgsize_bitmap;
> -	}
> -
> -	return pgsize_bitmap;
> +	return 0;
>  }
>  
>  /*
> -- 
> 2.28.0.dirty
> 
