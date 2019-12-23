Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B155129633
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 14:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AF56E2A5;
	Mon, 23 Dec 2019 13:02:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80083.outbound.protection.outlook.com [40.107.8.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5883A6E2A5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 13:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tV2J7i0NzUWJeMSmmkBLfVS6caJfV7KkrGFSGuJON8I=;
 b=Ticiy1F02w8uQ13DEPoQbEm+e30NB7mnH/oatS74yTTPNopCwhALyRSCYG9danLSFEds/Yjqg0k4uswoChmUjonK9Isf58ILHayaCdDJOM0AQR4la/wB8PL4lIocLXyic+ElilpBTsbGEIu5M0ZZRPmUozfs8Ep7Uw6k1n0Mtos=
Received: from AM6PR08CA0003.eurprd08.prod.outlook.com (2603:10a6:20b:b2::15)
 by DBBPR08MB4855.eurprd08.prod.outlook.com (2603:10a6:10:da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14; Mon, 23 Dec
 2019 13:02:23 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::201) by AM6PR08CA0003.outlook.office365.com
 (2603:10a6:20b:b2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.13 via Frontend
 Transport; Mon, 23 Dec 2019 13:02:23 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Mon, 23 Dec 2019 13:02:22 +0000
Received: ("Tessian outbound 1da651c29646:v40");
 Mon, 23 Dec 2019 13:02:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e8a53e6a0195c0d5
X-CR-MTA-TID: 64aa7808
Received: from f05765637ff9.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 31A55EF5-5FAC-46B2-A251-F0059CA6F874.1; 
 Mon, 23 Dec 2019 13:02:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f05765637ff9.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Dec 2019 13:02:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLc2lv+Ce9NYmXNu7CCunyfmodBx9wLQ8Nws/a0EdLxzQZGdnHtP39FLikhlaSUt9AM/Y8AO4MksChJploKhwBW5RfZqgAGQMjdSXSEdOkho+R1O63ZnD90vBNPt2yPzCZregi1ElmKesYqZGZTCabxBXzMtwIBlLRw9ghrsmKgfQyNm1PuuvqP1sdmqTLLUZ/41+uPkpHY8GnJ8C/nYAGV4NIuUP6E3Egr7gDHw59ijLvKmmgKbzAs+W0qUWK3GXEItC1GroYVHmhQDYEH85Y53A6xbVKpNalQcmXBUsfGfWlrEhtbrmtCk0/R3umofTZupOf+pawd3NwupYTHIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tV2J7i0NzUWJeMSmmkBLfVS6caJfV7KkrGFSGuJON8I=;
 b=PW6fulvGvM029GRMEqFqHqfwS0G7m7+3cJ1Pl72Uksh1qiCmLbguHvFjdkiUOW28PYZfCVDeZzzBzgPLwM7ErrDrbVxcGv5JCkdwXW/gdYyAcO5TGNLe1lm79X41bWZE7+dagz5ndZejh44qAT3thuwhNaCoEfyvH5mmAurNq9Isufyg4DibmLlv7d/QEmj3/m8ScOYSNtHZg+2+mVhMLiLbK0qdkexuQ2CksqhUtMwWtohsfCm4oyTKQeXxkQodtQz7LpY/wYWQh/7hyDInoT/MLi7guNCz67hjhBpvmCIVsqS3G0BSon9qyMgzzYsXFpGDm+KNKSGON4aHWDXDhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tV2J7i0NzUWJeMSmmkBLfVS6caJfV7KkrGFSGuJON8I=;
 b=Ticiy1F02w8uQ13DEPoQbEm+e30NB7mnH/oatS74yTTPNopCwhALyRSCYG9danLSFEds/Yjqg0k4uswoChmUjonK9Isf58ILHayaCdDJOM0AQR4la/wB8PL4lIocLXyic+ElilpBTsbGEIu5M0ZZRPmUozfs8Ep7Uw6k1n0Mtos=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3760.eurprd08.prod.outlook.com (20.178.80.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.19; Mon, 23 Dec 2019 13:02:14 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Mon, 23 Dec 2019
 13:02:14 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: james qian wang <james.qian.wang@arm.com>
Subject: Re: [PATCH] drm/komeda: Add runtime_pm support
Thread-Topic: [PATCH] drm/komeda: Add runtime_pm support
Thread-Index: AQHVsMCBN2D7zCEwDUuoMKQ83lPGMqfHnBGA
Date: Mon, 23 Dec 2019 13:02:13 +0000
Message-ID: <1985918.FRP2JxviHk@e123338-lin>
References: <20191212074756.14678-1-james.qian.wang@arm.com>
In-Reply-To: <20191212074756.14678-1-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.53]
x-clientproxiedby: LO2P265CA0372.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::24) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2739472e-4bb7-4013-1f53-08d787a859ff
X-MS-TrafficTypeDiagnostic: VI1PR08MB3760:|VI1PR08MB3760:|DBBPR08MB4855:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB48552D03B9F2CEAC5D7450728F2E0@DBBPR08MB4855.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
x-forefront-prvs: 0260457E99
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(189003)(199004)(478600001)(81166006)(8676002)(2906002)(6512007)(9686003)(8936002)(316002)(4326008)(54906003)(6506007)(81156014)(6862004)(33716001)(6486002)(6636002)(86362001)(52116002)(186003)(5660300002)(66946007)(64756008)(66476007)(66446008)(71200400001)(26005)(66556008)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3760;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: of0FJK0Da8PhkaNI6YCE+1e5/tVw6FKlaIMvYKXu0gLh8UPOO98+D3ygtLUGnh4QlbON6lgXbLm52CznLr6netMQtneDBLQHGLfX5rb+SE+4xcoRpNLqG4kr679uxV1dXikKGQI2JJi/Tri1Q2gOLStkGVKC/XeE01JD6q4u8YisRJL9FSJ5HxLMzwoEhj7NNZkNVCs4VVykazApA77djSorprUCelwO5UxZAijujHk7iFdODFasGswQpGBz3dHggldRXaQezL5VyFwdDqquwcJxPL7/BBYfauz1xJs6TEmqEsiOAbMzw3qOK1RNLbKv9V8PriWCt68aLcMCfqVD6+DxMvtsbYQAojMfG6AslnEyHehB0nuSCCDz2A5WuVzf8X28vR9MRhZIPk8BXIN+rVx89EqILipHE8CJppcS7tVasFcKaF2cXKEDAkxQyYJOSZQFbZ3uugYRFmtt8hh826zmKomS9oFjCQZqvp0nk3CNJ5HtyQtyBDdfR6kYX8wW
Content-ID: <EBFC22F6A14A3A4E90036BBA0C4D2FF7@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3760
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(39860400002)(396003)(376002)(136003)(189003)(199004)(2906002)(478600001)(356004)(70586007)(70206006)(76130400001)(6512007)(9686003)(6636002)(6486002)(26826003)(336012)(86362001)(36906005)(6506007)(186003)(5660300002)(54906003)(4326008)(81156014)(6862004)(8936002)(8676002)(81166006)(33716001)(26005)(316002)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4855;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f3e3eb53-ece9-4b1e-88ae-08d787a85470
NoDisclaimer: True
X-Forefront-PRVS: 0260457E99
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZwYy1gUDrEuhCc3dmDcnA4DDaEWWJ15efUTEd+hmcrqm+En0oXlEFjhouQwsEczrAebFeCi4fIL7x7wCPZbWdPZQkDGQgmsNvb4/+HpwfiCZJmfSSQkD5DiaKOdxAq+EUJeWmoCTmDSVW3hIZXL+IWaGEajVmgE6q6Nn4WS1W6sjutA/iiOeC6Pp97csFXNK/+6urorPKCHOu4dG71pU0BmNW9/yWhxURx50x1EgtvPbpVgzJB1+NsgAMztI3BzCWFiTm5vNL0nJ3NPefEy0UcPEAv6/7dmnssXxoZpDplJwbuc5+wafzwW6qGNHZP9PYUwhyb+eUnS/cFEroBJPt5+r+K6Rw1daVL2gQeenocId5roGFSpbWgcLdAbN6SxJ+H5wI/H8G4avYsVUqvFyb8JUN4QT2cyzaVhpVZMD9kyfmw19zoY1wTmOHsHA9LHBrQeftnPrwXvOwBTLx/Rdg6dWMiyy66ZrqUgDoxlYGzqZ0nsg4o/ZHcRAPfLuPDXC
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2019 13:02:22.8920 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2739472e-4bb7-4013-1f53-08d787a859ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4855
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
Cc: nd <nd@arm.com>, Oscar Zhang <Oscar.Zhang@arm.com>,
 Tiannan Zhu <Tiannan.Zhu@arm.com>, Jonathan Chai <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Channing Chen <Channing.Chen@arm.com>,
 james qian wang <james.qian.wang@arm.com>, Lowry Li <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 12 December 2019 07:48:13 GMT james qian wang (Arm Technology China) wrote:
> - Add pm_runtime_get/put to crtc_enable/disable along with the real
>   display usage
> - Add runtime_get/put to register_show, since register_show() will
>   access register, need to wakeup HW.
> - For the case that PM is not enabled or configured, manually wakeup HW
> 
> Signed-off-by: james qian wang (Arm Technology China) <james.qian.wang@arm.com>
> ---
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  3 +
>  .../gpu/drm/arm/display/komeda/komeda_dev.c   | 55 +++++--------------
>  .../gpu/drm/arm/display/komeda/komeda_drv.c   | 42 ++++++++++++--
>  .../gpu/drm/arm/display/komeda/komeda_kms.c   |  6 --
>  4 files changed, 53 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> index 1c452ea75999..56bd938961ee 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -5,6 +5,7 @@
>   *
>   */
>  #include <linux/clk.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/spinlock.h>
>  
>  #include <drm/drm_atomic.h>
> @@ -274,6 +275,7 @@ static void
>  komeda_crtc_atomic_enable(struct drm_crtc *crtc,
>  			  struct drm_crtc_state *old)
>  {
> +	pm_runtime_get_sync(crtc->dev->dev);
>  	komeda_crtc_prepare(to_kcrtc(crtc));
>  	drm_crtc_vblank_on(crtc);
>  	WARN_ON(drm_crtc_vblank_get(crtc));
> @@ -372,6 +374,7 @@ komeda_crtc_atomic_disable(struct drm_crtc *crtc,
>  	drm_crtc_vblank_put(crtc);
>  	drm_crtc_vblank_off(crtc);
>  	komeda_crtc_unprepare(kcrtc);
> +	pm_runtime_put(crtc->dev->dev);
>  }
>  
>  static void
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> index 38b832804bad..1d767473ba8a 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> @@ -10,6 +10,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/dma-mapping.h>
>  #ifdef CONFIG_DEBUG_FS
>  #include <linux/debugfs.h>
> @@ -27,12 +28,16 @@ static int komeda_register_show(struct seq_file *sf, void *x)
>  
>  	seq_puts(sf, "\n====== Komeda register dump =========\n");
>  
> +	pm_runtime_get_sync(mdev->dev);
> +
>  	if (mdev->funcs->dump_register)
>  		mdev->funcs->dump_register(mdev, sf);
>  
>  	for (i = 0; i < mdev->n_pipelines; i++)
>  		komeda_pipeline_dump_register(mdev->pipelines[i], sf);
>  
> +	pm_runtime_put(mdev->dev);
> +
>  	return 0;
>  }
>  
> @@ -263,15 +268,6 @@ struct komeda_dev *komeda_dev_create(struct device *dev)
>  	if (!mdev->iommu)
>  		DRM_INFO("continue without IOMMU support!\n");
>  
> -	if (mdev->iommu && mdev->funcs->connect_iommu) {
> -		err = mdev->funcs->connect_iommu(mdev);
> -		if (err) {
> -			DRM_ERROR("connect iommu failed.\n");
> -			mdev->iommu = NULL;
> -			goto disable_clk;
> -		}
> -	}
> -
>  	clk_disable_unprepare(mdev->aclk);
>  
>  	err = sysfs_create_group(&dev->kobj, &komeda_sysfs_attr_group);
> @@ -310,11 +306,6 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
>  	if (mdev->aclk)
>  		clk_prepare_enable(mdev->aclk);
>  
> -	if (mdev->iommu && mdev->funcs->disconnect_iommu)
> -		if (mdev->funcs->disconnect_iommu(mdev))
> -			DRM_ERROR("disconnect iommu failed.\n");
> -	mdev->iommu = NULL;
> -
>  	for (i = 0; i < mdev->n_pipelines; i++) {
>  		komeda_pipeline_destroy(mdev, mdev->pipelines[i]);
>  		mdev->pipelines[i] = NULL;
> @@ -343,44 +334,26 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
>  
>  int komeda_dev_resume(struct komeda_dev *mdev)
>  {
> -	int ret = 0;
> -
>  	clk_prepare_enable(mdev->aclk);
>  
> -	if (mdev->iommu && mdev->funcs->connect_iommu) {
> -		ret = mdev->funcs->connect_iommu(mdev);
> -		if (ret < 0) {
> -			DRM_ERROR("connect iommu failed.\n");
> -			goto disable_clk;
> -		}
> -	}
> -
> -	ret = mdev->funcs->enable_irq(mdev);
> +	mdev->funcs->enable_irq(mdev);
>  
> -disable_clk:
> -	clk_disable_unprepare(mdev->aclk);
> +	if (mdev->iommu && mdev->funcs->connect_iommu)
> +		if (mdev->funcs->connect_iommu(mdev))
> +			DRM_ERROR("connect iommu failed.\n");
>  
> -	return ret;
> +	return 0;
>  }
>  
>  int komeda_dev_suspend(struct komeda_dev *mdev)
>  {
> -	int ret = 0;
> -
> -	clk_prepare_enable(mdev->aclk);
> -
> -	if (mdev->iommu && mdev->funcs->disconnect_iommu) {
> -		ret = mdev->funcs->disconnect_iommu(mdev);
> -		if (ret < 0) {
> +	if (mdev->iommu && mdev->funcs->disconnect_iommu)
> +		if (mdev->funcs->disconnect_iommu(mdev))
>  			DRM_ERROR("disconnect iommu failed.\n");
> -			goto disable_clk;
> -		}
> -	}
>  
> -	ret = mdev->funcs->disable_irq(mdev);
> +	mdev->funcs->disable_irq(mdev);
>  
> -disable_clk:
>  	clk_disable_unprepare(mdev->aclk);
>  
> -	return ret;
> +	return 0;
>  }
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> index ad38bbc7431e..ea5cd1e17304 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> @@ -33,6 +33,12 @@ static void komeda_unbind(struct device *dev)
>  		return;
>  
>  	komeda_kms_detach(mdrv->kms);
> +
> +	if (pm_runtime_enabled(dev))
> +		pm_runtime_disable(dev);
> +	else
> +		komeda_dev_suspend(mdrv->mdev);
> +
>  	komeda_dev_destroy(mdrv->mdev);
>  
>  	dev_set_drvdata(dev, NULL);
> @@ -54,6 +60,10 @@ static int komeda_bind(struct device *dev)
>  		goto free_mdrv;
>  	}
>  
> +	pm_runtime_enable(dev);
> +	if (!pm_runtime_enabled(dev))
> +		komeda_dev_resume(mdrv->mdev);
> +
>  	mdrv->kms = komeda_kms_attach(mdrv->mdev);
>  	if (IS_ERR(mdrv->kms)) {
>  		err = PTR_ERR(mdrv->kms);
> @@ -65,6 +75,11 @@ static int komeda_bind(struct device *dev)
>  	return 0;
>  
>  destroy_mdev:
> +	if (pm_runtime_enabled(dev))
> +		pm_runtime_disable(dev);
> +	else
> +		komeda_dev_suspend(mdrv->mdev);
> +
>  	komeda_dev_destroy(mdrv->mdev);
>  
>  free_mdrv:
> @@ -131,15 +146,29 @@ static const struct of_device_id komeda_of_match[] = {
>  
>  MODULE_DEVICE_TABLE(of, komeda_of_match);
>  
> +static int komeda_rt_pm_suspend(struct device *dev)
> +{
> +	struct komeda_drv *mdrv = dev_get_drvdata(dev);
> +
> +	return komeda_dev_suspend(mdrv->mdev);
> +}
> +
> +static int komeda_rt_pm_resume(struct device *dev)
> +{
> +	struct komeda_drv *mdrv = dev_get_drvdata(dev);
> +
> +	return komeda_dev_resume(mdrv->mdev);
> +}
> +
>  static int __maybe_unused komeda_pm_suspend(struct device *dev)
>  {
>  	struct komeda_drv *mdrv = dev_get_drvdata(dev);
> -	struct drm_device *drm = &mdrv->kms->base;
>  	int res;
>  
> -	res = drm_mode_config_helper_suspend(drm);
> +	res = drm_mode_config_helper_suspend(&mdrv->kms->base);
>  
> -	komeda_dev_suspend(mdrv->mdev);
> +	if (!pm_runtime_status_suspended(dev))
> +		komeda_dev_suspend(mdrv->mdev);
>  
>  	return res;
>  }
> @@ -147,15 +176,16 @@ static int __maybe_unused komeda_pm_suspend(struct device *dev)
>  static int __maybe_unused komeda_pm_resume(struct device *dev)
>  {
>  	struct komeda_drv *mdrv = dev_get_drvdata(dev);
> -	struct drm_device *drm = &mdrv->kms->base;
>  
> -	komeda_dev_resume(mdrv->mdev);
> +	if (!pm_runtime_status_suspended(dev))
> +		komeda_dev_resume(mdrv->mdev);
>  
> -	return drm_mode_config_helper_resume(drm);
> +	return drm_mode_config_helper_resume(&mdrv->kms->base);
>  }
>  
>  static const struct dev_pm_ops komeda_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(komeda_pm_suspend, komeda_pm_resume)
> +	SET_RUNTIME_PM_OPS(komeda_rt_pm_suspend, komeda_rt_pm_resume, NULL)
>  };
>  
>  static struct platform_driver komeda_platform_driver = {
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> index e30a5b43caa9..9a7dcf92591a 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> @@ -307,10 +307,6 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
>  	if (err)
>  		goto free_component_binding;
>  
> -	err = mdev->funcs->enable_irq(mdev);
> -	if (err)
> -		goto free_component_binding;
> -
>  	drm->irq_enabled = true;
>  
>  	drm_kms_helper_poll_init(drm);
> @@ -324,7 +320,6 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
>  free_interrupts:
>  	drm_kms_helper_poll_fini(drm);
>  	drm->irq_enabled = false;
> -	mdev->funcs->disable_irq(mdev);
>  free_component_binding:
>  	component_unbind_all(mdev->dev, drm);
>  cleanup_mode_config:
> @@ -346,7 +341,6 @@ void komeda_kms_detach(struct komeda_kms_dev *kms)
>  	drm_kms_helper_poll_fini(drm);
>  	drm_atomic_helper_shutdown(drm);
>  	drm->irq_enabled = false;
> -	mdev->funcs->disable_irq(mdev);
>  	component_unbind_all(mdev->dev, drm);
>  	drm_mode_config_cleanup(drm);
>  	komeda_kms_cleanup_private_objs(kms);
> 

Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>

-- 
Mihail



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
