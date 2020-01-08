Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B11BF133EB0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 10:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF22A6E87E;
	Wed,  8 Jan 2020 09:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80089.outbound.protection.outlook.com [40.107.8.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4A76E87E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+w71O1B8I/FLxgtZh0WW0nnu8m6HWiI043KF8ePzeM=;
 b=UuAjNeiP++fnDhdYh9EspoOZyxeqR7eCcb9YW126YFIGJxRbhgcE1pDJ4GUKKSH3MYUmPpWh7a1Gj54TQD3Me5k55eLLelWt+6lvbx1u+z+kb0RGt6TefGXqMpaTiRQqWr/U3WjJqj5xzv3bc/68a3WvokZdoyFEaKYkrmFuhCg=
Received: from VI1PR0802CA0008.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::18) by VI1PR08MB3773.eurprd08.prod.outlook.com
 (2603:10a6:803:bb::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9; Wed, 8 Jan
 2020 09:56:25 +0000
Received: from DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::206) by VI1PR0802CA0008.outlook.office365.com
 (2603:10a6:800:aa::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Wed, 8 Jan 2020 09:56:25 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT041.mail.protection.outlook.com (10.152.21.4) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11 via Frontend Transport; Wed, 8 Jan 2020 09:56:25 +0000
Received: ("Tessian outbound ba41a0333779:v40");
 Wed, 08 Jan 2020 09:56:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0f1338ad4cc7e510
X-CR-MTA-TID: 64aa7808
Received: from 5817b7abe1fc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 58417BD4-60EF-4857-9F2B-D2060D145412.1; 
 Wed, 08 Jan 2020 09:56:19 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5817b7abe1fc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Jan 2020 09:56:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYLkg5Sxok6EmdjKMrAAWJN10ddHhmAJNDug2BRD4jHmOXg5d0Z/IuoxHUptUjyP27+jK7v0Vnx+zAM1XcIVqGkaoHRaWpwbt2VDnSGZqV3V5KmpjVH2yDsiz0SITHVGY047VYmizeyskEbcYDRyvTSj/zR9FCVPozFj97Ck0t/h+j95FFCqQvzu12ldFD7KP6vQWvATMlZL4lig5USOCXOsk/uSWQt2UvCbt2DzVljP4PaaM2WV/2xNcpiou5ZZISzb3ZBZpbJ7Mc2VRQWEMswZyEoi54zod7NEJdWyoo0FFrJwp8ZS8oQn6H/5Gx4LMEKSGt8K3PtftCJo+mXv3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+w71O1B8I/FLxgtZh0WW0nnu8m6HWiI043KF8ePzeM=;
 b=jUgWw4X2nljniLEx/621j4gWD3SWV4U6YB4aagxKi8RUIhIr/wgjoiMaYIULb2cKQONYeGKk/gmLoghXtqTyJ0gHrYqAsJ5JoHyWQTOWWPvKAnhKEJJTllWfFcOB2OwnspTGPc56t/D8WVLNxt0jN81D/6X8uiFOZ9lNysYhrATboiEWH4ktgCXzhCEztTet04rf/5f8zHnSMwRrDTJXm+m6IDm1yWbRedehdJNHnJ7KicAOGhemEUtLyfWbexkk7VWABgqQB3u3AB7C3Zsl6BN/oyi8P8iQb+9JBSGuSoU653bP0+7MGz0o+lmXWNk1Ll/aF5MKbv7/6NpcCMhf2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+w71O1B8I/FLxgtZh0WW0nnu8m6HWiI043KF8ePzeM=;
 b=UuAjNeiP++fnDhdYh9EspoOZyxeqR7eCcb9YW126YFIGJxRbhgcE1pDJ4GUKKSH3MYUmPpWh7a1Gj54TQD3Me5k55eLLelWt+6lvbx1u+z+kb0RGt6TefGXqMpaTiRQqWr/U3WjJqj5xzv3bc/68a3WvokZdoyFEaKYkrmFuhCg=
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4638.eurprd08.prod.outlook.com (10.255.27.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12; Wed, 8 Jan 2020 09:56:17 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::5865:5862:26bf:84f0]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::5865:5862:26bf:84f0%7]) with mapi id 15.20.2623.008; Wed, 8 Jan 2020
 09:56:17 +0000
Received: from localhost (113.29.88.7) by
 SN4PR0401CA0035.namprd04.prod.outlook.com (2603:10b6:803:2a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Wed, 8 Jan 2020 09:56:16 +0000
From: james qian wang <james.qian.wang@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/komeda: mark PM functions as __maybe_unused
Thread-Topic: [PATCH] drm/komeda: mark PM functions as __maybe_unused
Thread-Index: AQHVxaTpM196drNzoU+K8km25bMwD6fgiGmA
Date: Wed, 8 Jan 2020 09:56:17 +0000
Message-ID: <20200108095609.GA23558@jamwan02-TSP300>
References: <20200107215327.1579195-1-arnd@arndb.de>
In-Reply-To: <20200107215327.1579195-1-arnd@arndb.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: SN4PR0401CA0035.namprd04.prod.outlook.com
 (2603:10b6:803:2a::21) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dffc66ee-8529-4863-cec1-08d79421062f
X-MS-TrafficTypeDiagnostic: VE1PR08MB4638:|VE1PR08MB4638:|VI1PR08MB3773:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3773A7C40131E1F45597DB93B33E0@VI1PR08MB3773.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 02760F0D1C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(366004)(376002)(136003)(39860400002)(396003)(346002)(189003)(199004)(8936002)(9686003)(478600001)(5660300002)(956004)(6916009)(64756008)(6486002)(81166006)(2906002)(81156014)(8676002)(86362001)(4326008)(6496006)(52116002)(66446008)(55236004)(186003)(16526019)(1076003)(66946007)(66476007)(71200400001)(26005)(33716001)(54906003)(66556008)(33656002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4638;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: o7UR8rvTMYKozy4v4+ufH7yQJ9j29c9WkVxXtlzuML6KPUH4ML2XSI9kpwnHc6jIa9GGVc0fQSSHFEkkz7Jj792jfhqceykT19LehQeNlbRELbO2qBdJAtUBo8i0HNwTprz5kpLAyyCSUSYZ6ccv5lTaCon42prXpuIMrIs4FnhkO2zpErDHHF1zqApPL+0rDK0blr65XemtDOb2HXQNlqhU3UC4+04I0U54sJfrN4JI8jGzdM6OEAymJPaep2BbQk0tFmHCiasKBMvIGfIiM1F0ynvpE6bZ6mrBMg18VIDR8p7yVmmBvnGZisNDH6y/HX3pn18Mq65iBnOi+pSE+VkXZBGEd3jFLHaAO11wFlUzPIBuBYKihVelLY7BpNsCw4NaKma0Szmt/2nry617hhOQ6mYBhWXcM0aSaEjKbqUDeyyZnvONt0XtEgUjobs7
Content-ID: <610660CE5AAB6A4D8861041D6FE3465B@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4638
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(39860400002)(396003)(376002)(136003)(199004)(189003)(6486002)(26826003)(70586007)(478600001)(81166006)(1076003)(86362001)(8676002)(8936002)(33716001)(2906002)(4326008)(81156014)(70206006)(6496006)(16526019)(54906003)(186003)(316002)(6862004)(9686003)(33656002)(26005)(956004)(336012)(356004)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3773;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5440e4fa-c649-4d27-972d-08d79421013b
X-Forefront-PRVS: 02760F0D1C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vda0IJMTfaFacIoUL3RA5OO3qNz19tQf+y9mAqWO3IRdEN5nHVtpWUa2dMsQV9anpmj+mjcCsi60j1I1+3wXMnbE8D/xl7MP0TP/qV+4vducu8pipAsgSnWf/BW73d0J2ZI3fB8P+H9we4N18T4/YqBjkxr+tVHG5ZOIp673g5ZPEjsKSW+/AhiIF8ymQL4sim2HkE9LOCKtN//mALQ6e9JcSFLYyjk2krECeWEahK/kPV2WNXNBdf0j+WlrCoz9K9I8ONFT9tNRrS/qmsOpDp5u1ySnoksSka27CZgqq6cMp8JrXaMuDH1ZNMdBXcgeHAZZ43w5pna9ai8hZZD8JuX5hkitv8afdyOurg5ijpmnMzCsy7vSFkvBylZpLBS9iL+tLokY4kfEy6ETVHcU5FEvZxjunfBARSSfzMSBGi2dCCbnbYbM5sDOOJvvWm0v
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2020 09:56:25.4152 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dffc66ee-8529-4863-cec1-08d79421062f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3773
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
Cc: nd <nd@arm.com>, Lowry Li <Lowry.Li@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 07, 2020 at 10:53:19PM +0100, Arnd Bergmann wrote:
> Without this, we get a couple of warnings when CONFIG_PM
> is disabled:
> 
> drivers/gpu/drm/arm/display/komeda/komeda_drv.c:156:12: error: 'komeda_rt_pm_resume' defined but not used [-Werror=unused-function]
>  static int komeda_rt_pm_resume(struct device *dev)
>             ^~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/arm/display/komeda/komeda_drv.c:149:12: error: 'komeda_rt_pm_suspend' defined but not used [-Werror=unused-function]
>  static int komeda_rt_pm_suspend(struct device *dev)
>             ^~~~~~~~~~~~~~~~~~~~
> 
> Fixes: efb465088518 ("drm/komeda: Add runtime_pm support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> index ea5cd1e17304..e7933930a657 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> @@ -146,14 +146,14 @@ static const struct of_device_id komeda_of_match[] = {
>  
>  MODULE_DEVICE_TABLE(of, komeda_of_match);
>  
> -static int komeda_rt_pm_suspend(struct device *dev)
> +static int __maybe_unused komeda_rt_pm_suspend(struct device *dev)
>  {
>  	struct komeda_drv *mdrv = dev_get_drvdata(dev);
>  
>  	return komeda_dev_suspend(mdrv->mdev);
>  }
>  
> -static int komeda_rt_pm_resume(struct device *dev)
> +static int __maybe_unused komeda_rt_pm_resume(struct device *dev)
>  {
>  	struct komeda_drv *mdrv = dev_get_drvdata(dev);
>

Hi Arnd:

Thank you for the patch.

Reviewed-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>

James
> -- 
> 2.20.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
