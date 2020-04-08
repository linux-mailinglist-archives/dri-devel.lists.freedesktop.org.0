Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4696D1A1D84
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 10:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADAC6E9CC;
	Wed,  8 Apr 2020 08:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60085.outbound.protection.outlook.com [40.107.6.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F066E9B4;
 Wed,  8 Apr 2020 08:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLF+LEZx4UuXHwkKq+HBt6c0vTTTsPxTNj4ypLLXMic=;
 b=7o5xbVM7hTMgbVwpu5dJWLtd8fa0xDzWLQl2/VpbqwrHXcZzn3UIfo1BGLWU/2cl+qdT2sXbScdJZDfWeaO+m2drqvcIA4mhJBKvnsnOdEI0odhPcb2S4OzoOXw1gGTpGkaiWLJATwUMO7eX/MCq1E/YwNi0y2CAt9SbitbbEFA=
Received: from AM6PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:20b:92::21)
 by DBBPR08MB4885.eurprd08.prod.outlook.com (2603:10a6:10:f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Wed, 8 Apr
 2020 08:41:01 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::62) by AM6PR04CA0008.outlook.office365.com
 (2603:10a6:20b:92::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Wed, 8 Apr 2020 08:41:01 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Wed, 8 Apr 2020 08:41:01 +0000
Received: ("Tessian outbound 4b84da486446:v50");
 Wed, 08 Apr 2020 08:41:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3d698a30c40bc3c6
X-CR-MTA-TID: 64aa7808
Received: from da7338242e05.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0C8128F2-198D-46AD-A87D-FE140FCD19E7.1; 
 Wed, 08 Apr 2020 08:40:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da7338242e05.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Apr 2020 08:40:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9hKmQoJ4E5Vkoo3DaSQHNo1FQbKGPpVRng15g/W7mS3YoqBFY2MJVXX8ZOMRcE1mErcr9SeppSMbvRvFLVuZgPH9n9J7jW0OaB5ns4LeofHXMe0eTLQ2ZyZTAWLxnLBU2UY2h006mIhW4V22ydpkvOPS8J4LHE9bS4mHaMV9s2lwcE7I/KUkjYFIj6QQJvFlzDqNXzxMAsLBiWeurWx5JIencEk4djNd5T0m3xKXT6uv+QKxkqQAgKgaaVXeRdeuq+T2HsnS4f15gkcA0AmN9kqsGP5Fk227DLzJifxNCM384EDl4l6h/YqQQ1E/ED3R1vxzGXvixu3TPDHtH7gcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLF+LEZx4UuXHwkKq+HBt6c0vTTTsPxTNj4ypLLXMic=;
 b=ALFlFZmaZDi/gkRbs6dFTqmuqst6C0/lTAdOBNqsuUnafJsZBEXZHj56WbpvPxMJ7iLGZihaiR9q1hA2d8vBrDzr7rVtgsh64kXRWckVoTScvSkb8T24niFDOOTz6U59ljoqsZs8VG3a4KXymrNiGjCSKPdT0nlHsjYiZVMycuVBLhXXZVYn7C57Nl6fIRooah+kHyEX/GI6ZYGtCZFbVz1aQGq9++zH0lvI9cw1txRqQ56tDrbcE1J7ChWgvY8PqPioYqBtc95bcbkiyH+kGndTxuA7kQ3J8f9C1eSPV6m0NGynu2P1U+UYZ2HbhpbU/hwTzxVzRZt7YMvQ+D17FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLF+LEZx4UuXHwkKq+HBt6c0vTTTsPxTNj4ypLLXMic=;
 b=7o5xbVM7hTMgbVwpu5dJWLtd8fa0xDzWLQl2/VpbqwrHXcZzn3UIfo1BGLWU/2cl+qdT2sXbScdJZDfWeaO+m2drqvcIA4mhJBKvnsnOdEI0odhPcb2S4OzoOXw1gGTpGkaiWLJATwUMO7eX/MCq1E/YwNi0y2CAt9SbitbbEFA=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com (2603:10a6:4:3a::18)
 by DB6PR0801MB1960.eurprd08.prod.outlook.com (2603:10a6:4:76::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Wed, 8 Apr
 2020 08:40:48 +0000
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::44e5:174:41c3:8ee2]) by DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::44e5:174:41c3:8ee2%6]) with mapi id 15.20.2878.022; Wed, 8 Apr 2020
 08:40:48 +0000
Date: Wed, 8 Apr 2020 16:40:40 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 36/44] drm/komeda: use devm_drm_dev_alloc
Message-ID: <20200408084040.GA11347@jamwan02-TSP300>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-37-daniel.vetter@ffwll.ch>
Content-Disposition: inline
In-Reply-To: <20200403135828.2542770-37-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: DM6PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:5:40::22) To DB6PR0801MB1719.eurprd08.prod.outlook.com
 (2603:10a6:4:3a::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (113.29.88.7) by
 DM6PR03CA0009.namprd03.prod.outlook.com (2603:10b6:5:40::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15 via Frontend Transport; Wed, 8 Apr 2020 08:40:47 +0000
X-Originating-IP: [113.29.88.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 771e41ed-e6be-44dc-3b7e-08d7db98913e
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1960:|DB6PR0801MB1960:|DBBPR08MB4885:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB48856F3C4FCB89BA7C30FC17B3C00@DBBPR08MB4885.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-Forefront-PRVS: 0367A50BB1
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB6PR0801MB1719.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(10009020)(4636009)(7916004)(396003)(346002)(376002)(39860400002)(136003)(366004)(54906003)(5660300002)(956004)(316002)(33716001)(2906002)(66946007)(66476007)(66556008)(6486002)(26005)(8936002)(9686003)(478600001)(33656002)(8676002)(81156014)(1076003)(6916009)(81166007)(52116002)(16526019)(6666004)(86362001)(186003)(55236004)(6496006)(4326008);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: WTI6RKDaYJNPlcMbkXpFDyBQuQ78mdCjFXKA8AenX5XRxMPEOrmVSacBLe8S5SjV7eyxUd7uB2AUxUIyZ+7FXqCgjpPl8Kv7YfQMfsBqENxA93Yn3Xj2hStsmEc/dXPJs1sDPF68ZZNtPAAn1v9wHGflHc/F7rGto21FooINfw8UMU2XPVhRjxHI8cSOqZ2W7AslYDjCRdQ85mEJ5RauHTqu0IMXfryGQZNtCYP9CtjW1ObapSvjV39av8r/8nFPi+glpq+PMqnx4B6HdM7l+yQPSX0Uow3kDIB2jzA9bfCrXd4MKGJme4dgDbNRTyYlSjXH1eQRZeg4X5F5kK//RGHBMQ+H0N9eOhWvpBcKjhiRIhM/HK8DIxAbun4f9UST8eIRuDQL5MWVF+pSeonI+uIARfXa1XG9z7IFenBxsa0/8gbdjblgCpdi1Y5FPAHA
X-MS-Exchange-AntiSpam-MessageData: kTvygzbRPtkcEbl5auuoQXfECa4qz9DP4pQtoGIibRwxyuPRGrfDfxNOBZnP3y4TJUHimBXjqE/nem6UK+pM2mxcjl14wAF0OkTdQLH9f6Pm64ZFd+/mKiSwosLkmtf+L2pMzHX2B6Mhvf/nGxXmGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1960
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(10009020)(4636009)(7916004)(376002)(346002)(136003)(39850400004)(396003)(46966005)(316002)(16526019)(9686003)(4326008)(6862004)(6486002)(186003)(450100002)(8676002)(81156014)(5660300002)(336012)(478600001)(8936002)(36906005)(26826003)(956004)(33656002)(86362001)(26005)(6496006)(6666004)(356004)(81166007)(70206006)(54906003)(1076003)(47076004)(2906002)(70586007)(82740400003)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1e5307bc-fc04-413a-c9a7-08d7db98893a
X-Forefront-PRVS: 0367A50BB1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5oPhW3tYjbuulZaaXA2BcAAG7m0lmusjIs9Al0NuKGW/vvtoZiBtz+RvQfL4bfax3mqRz77mIi3h1TfIg3TU4/cX2QYgq53yoIEZ4gLw5mhB9hRPLwKnOyiTPE0hhftun4pcd7rVxGSwZo9BrPxI6MtO32qohVX9F+gSzmJtppX4O/8dk8SHGJFsjmnRi61VCTGbOaR7YZ+tU6fnVHKw5FWFXKTrGvBoTPK4ESfdtOWv1rYvTEaMWyo3pir72sQ/Zo8IAd4VwUATLSnImXTnhKtW99HYo5JQMnpTwuoQT92AqpJfrQhNaXc0kufBg0YWenFixP7rXRiLGHQpCgowxiKeIT0nvvJHHoVqrflyee3EzPXdfLQwqEEsv1r2MfutHvhfxuIOUHu1PjBjx2ciHAchY+66lH30h0tguXoaFDiS98q5se8cWIdfsUs3WnqVvp6iN04ErxRGBc2YAiRWyDe79ePKm5r346zo2jycV2YADKfyODeUXE+QqBYetrIAMIYe2VPatmDHV3cuW4pMog==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2020 08:41:01.3690 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 771e41ed-e6be-44dc-3b7e-08d7db98913e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4885
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, nd@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 03, 2020 at 09:58:20PM +0800, Daniel Vetter wrote:
> Komeda uses the component framework, which does open/close a new
> devres group around all the bind callbacks. Which means we can use
> devm_ functions for managing the drm_device cleanup, with leaking
> stuff in case of deferred probes or other reasons to unbind
> components, or the component_master.
> 
> Also note that this fixes a double-free in the probe unroll code, bot
> drm_dev_put and kfree(kms) result in the kms allocation getting freed.
> 
> Aside: komeda_bind could be cleaned up a lot, devm_kfree is a bit
> redundant. Plus I'm not clear on why there's suballocations for
> mdrv->mdev and mdrv->kms. Plus I'm not sure the lifetimes are correct
> with all that devm_kzalloc usage ... That structure layout is also the
> reason why komeda still uses drm_device->dev_private and can't easily
> be replaced with a proper container_of upcasting. I'm pretty sure that
> there's endless amounts of hotunplug/hotremove bugs in there with all
> the unprotected dereferencing of drm_device->dev_private.

Hi Daniel:

Thank you for the patch.

Reviewed-by: James Qian Wang <james.qian.wang@arm.com>

For why komeda has two devices komeda_dev and komeda_kms_dev. 
That because komeda treats drm_crtc/plane as virtual, which pick the real
komeda resources to satify the user's requirement. In the initial driver
design we want to clear the difference of these two class structures
so we defined two devices:

- komeda_dev:
  managing the real komeda device and resources.

- komeda_kms_dev
  the virtual device managing the drm related stuff like
  komeda_crtc/plane.

And yes, even for that we don't need two sub-allocations, we are planing
to move the komeda_dev into the komeda_kms_dev or just merge two devices
together.

Thanks
James

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> index 16dfd5cdb66c..6b85d5f4caa8 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> @@ -261,18 +261,16 @@ static void komeda_kms_mode_config_init(struct komeda_kms_dev *kms,
>  
>  struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
>  {
> -	struct komeda_kms_dev *kms = kzalloc(sizeof(*kms), GFP_KERNEL);
> +	struct komeda_kms_dev *kms;
>  	struct drm_device *drm;
>  	int err;
>  
> -	if (!kms)
> -		return ERR_PTR(-ENOMEM);
> +	kms = devm_drm_dev_alloc(mdev->dev, &komeda_kms_driver,
> +				 struct komeda_kms_dev, base);
> +	if (IS_ERR(kms))
> +		return kms;
>  
>  	drm = &kms->base;
> -	err = drm_dev_init(drm, &komeda_kms_driver, mdev->dev);
> -	if (err)
> -		goto free_kms;
> -	drmm_add_final_kfree(drm, kms);
>  
>  	drm->dev_private = mdev;
>  
> @@ -329,9 +327,6 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
>  	drm_mode_config_cleanup(drm);
>  	komeda_kms_cleanup_private_objs(kms);
>  	drm->dev_private = NULL;
> -	drm_dev_put(drm);
> -free_kms:
> -	kfree(kms);
>  	return ERR_PTR(err);
>  }
>  
> @@ -348,5 +343,4 @@ void komeda_kms_detach(struct komeda_kms_dev *kms)
>  	drm_mode_config_cleanup(drm);
>  	komeda_kms_cleanup_private_objs(kms);
>  	drm->dev_private = NULL;
> -	drm_dev_put(drm);
>  }
> -- 
> 2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
