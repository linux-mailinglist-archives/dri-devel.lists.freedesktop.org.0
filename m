Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FC4206D20
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 08:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFB788DE5;
	Wed, 24 Jun 2020 06:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300092.outbound.protection.outlook.com [40.107.130.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351276E466
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 21:59:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYTmYD4vXx4KbwhbB2n8cdcUKeLis2WjLv7U/t2728PmQBzST8bB0vuxaefvgNYRHWD59Ovb8xcnWSyg53Dk6K8Jqbb7RX4NTPCOhGwvzC+VmOkoltcFmlv6kCGC4v9w9ZAV8yC11yPjJ1V1IQcSliTAcWTZvWtmGoxoA+dKJ7iQfYfSFZaJW4ghI15/y4HVP/WDbUKHcBmWgBO0A5BLPuQc8fWWcTDjBpa4uW3sLguwk2jqeHfAIqO7q5zFBmuAHm3FNxZAVx8fE6B28me0c3kBSPquCN9aBd+PXyT/CBTbalCbJ1QodXMxIkGdN0LhusRM5pJWHe2PlHTwxosXag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUUw8kj4pMit4w++oiP2XnejfkjWpoQoPWXxynRs9qk=;
 b=dJCXLJ6pBUYyxhNeVRIay7nTjRx0hVQ3Fq52WzO1/Cv4WtoOc10LLXPJ0QHHRAL6vynu4fXaexw/qdc1DXk81cq7NunPzHL5WAWW8fpbv+Mk0Zj6HdxY+X7VwnUXvCwLS6O2YDTIhBx9j31KwIATvTFfsbPpkPiXsruuVg5b36C7VGCWDSFJXqwLne+kxnBLD9MqmSV1LpH1UJuB8t2wgj7xI13t4UXlIuM89pBH27fezBz9xJUlxCXkvJVOSg8/AB+1H7cDINsoIAkC9qIWzuMt4qTcLSlFyCKmjureTnbcjgqUiMcSLAoGbI/R0sJfg9gjKfmedZGwNIhnAgyogA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUUw8kj4pMit4w++oiP2XnejfkjWpoQoPWXxynRs9qk=;
 b=LqpcGiG/0B6knSbukSbXOQzYaZau1qRg2+6w5KpyYN9fjdESVuY1pEtjJqoJq+M/eDgj1Y027KFuVqg0BIMzr9RxiHlvm71BDRsg0VQzOZQQhFbl6MaOpHypqEOta685kAWAYl51zH87xxrsnmLEYFaLm3LyL7Vdkp/FiTMRI7E=
Received: from HK0P153MB0322.APCP153.PROD.OUTLOOK.COM (2603:1096:203:b5::19)
 by HK2P15301MB0226.APCP153.PROD.OUTLOOK.COM (2603:1096:202:28::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.2; Tue, 23 Jun
 2020 21:58:58 +0000
Received: from HK0P153MB0322.APCP153.PROD.OUTLOOK.COM
 ([fe80::e567:3a32:6574:8983]) by HK0P153MB0322.APCP153.PROD.OUTLOOK.COM
 ([fe80::e567:3a32:6574:8983%7]) with mapi id 15.20.3153.009; Tue, 23 Jun 2020
 21:58:58 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Deepak Rawat <drawat.floss@gmail.com>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
Thread-Topic: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
Thread-Index: AQHWSIVPTyd7nwDoi0OeDECzal8UNajldhsQgABNjYCAAPRs4A==
Date: Tue, 23 Jun 2020 21:58:57 +0000
Message-ID: <HK0P153MB03226AB1A353EDFD62EA4ECDBF940@HK0P153MB0322.APCP153.PROD.OUTLOOK.COM>
References: <20200622110623.113546-1-drawat.floss@gmail.com>
 <20200622110623.113546-2-drawat.floss@gmail.com>
 <HK0P153MB03224C17D736FF164209F6DABF940@HK0P153MB0322.APCP153.PROD.OUTLOOK.COM>
 <aa7ab349ff502390edea4fd5721dbd64a0997216.camel@gmail.com>
In-Reply-To: <aa7ab349ff502390edea4fd5721dbd64a0997216.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-06-23T21:58:55Z; 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=ef24b0c2-13b3-48e5-a3f6-ad284d7dad1a;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [2601:600:a280:7f70:6076:3614:38fb:cfca]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d86f8fe1-e901-4e40-7b20-08d817c0a173
x-ms-traffictypediagnostic: HK2P15301MB0226:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2P15301MB02269F9AE9183636F1FE16B6BF940@HK2P15301MB0226.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04433051BF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NBeLxK3oZxyGGhW5qVvsCtNdwLAZL3wNyDa7LMVRzq1nkM82fI/647qVwZ2K0joFF6kaOxYGvLWGPlaAJ3Qca+0SP6lu5Anjc9YzVHCPNbgdMh8QLOUbMlu0WXrSEHxe44qjZmOFJcotU9PwsQiURgVUkgpkwLGcOIbZjPgUwREgSsH3A+68qeohsQrorVPd22jJ5zSXB24HVxh7b5cG1JuxG/dSnKaAq+4mDGUelpW+1Cd9IekE3vlpTrO8sk0MtaQ9lH5ugUpIEDeBg5n1TnCUo9Oy51XJvt/iYoX6fYw4c8xTzgmRmpRabtUZSrba4AgXzVav7GMPEuh8W2sDww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0P153MB0322.APCP153.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(8990500004)(76116006)(66446008)(83380400001)(82950400001)(82960400001)(66476007)(71200400001)(66946007)(66556008)(7696005)(186003)(33656002)(86362001)(6506007)(316002)(110136005)(64756008)(54906003)(478600001)(5660300002)(2906002)(9686003)(107886003)(8676002)(10290500003)(4326008)(52536014)(55016002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 6eDNq0Y0datH7Vl6Pici0RDU0GEp8hjvRC5RyQoXUJCB7PI5wo3nYnDSlCqS8mm2oRn4WhdmFf+gcMcLs8c4/ZxD8zwLxwqgpPJmARkFcQIdDlN2dd73uw7zt9ucMFDfgIiVb1sKJrF32npEUhQkyOyylQcmXKYm0BhMODt/3HeLyj6uGYnbT80RoDhM7w5fLDi0wjHh63NgExrbH7l7BXlQSP299xinWBiuBLy2YMP+HxvXRa+3LtcM5HzXjJFoL8zR0HK4gTpzDVxeTOfFEoKqu8Q3dXrVMOhNvNnk1Ee0YBFtLmQx/jvvS4mtharZCeUx3TvtyWoK4+n82ut/OcORUG8MXXHxhRW0llM+D0GWDDTWgIVoky4oOhgYeyWRd2+zrNYg+aQkU9sjP9u9Jr9ok8nlOk8ZVKAVg5bfpjwzcBJ+ThfOjC+GKCASjWoW8oD2jUt6IUeN1vqNAIjS/CNzB1zagIdOT2Ilbpn46DgCLdt2zk5qjbxcrHQtC+3IwHVPSxNNje8uSWRFNgs4HY6HTMDoRwo/IEaNfHu43yJSiTNYcPqscO1Gyp4+9/d8
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0P153MB0322.APCP153.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d86f8fe1-e901-4e40-7b20-08d817c0a173
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2020 21:58:57.7997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: my7K4gViMY7HTeJ4BBM88R3FaiZa8yVMSbb+O1mVHZKH/hlrut1rfhUb8aX/daQPhG6YwVS0opNQfe8enkd17g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2P15301MB0226
X-Mailman-Approved-At: Wed, 24 Jun 2020 06:58:05 +0000
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
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 David Airlie <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Jork Loeser <Jork.Loeser@microsoft.com>, Wei Hu <weh@microsoft.com>,
 KY Srinivasan <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: linux-hyperv-owner@vger.kernel.org
> <linux-hyperv-owner@vger.kernel.org> On Behalf Of Deepak Rawat
> Sent: Monday, June 22, 2020 11:49 PM
> > [...]
> > Some quick comments:
> > 1. hyperv_vmbus_probe() assumes the existence of the PCI device,
> > which
> > is not true in a Hyper-V Generation-2 VM.
> 
> I guess that mean for Gen-2 VM need to rely on vmbus_allocate_mmio to
> get the VRAM memory? From what I understand the pci interface anyway
> maps to vmbus.

In a Hyper-V Generaton-2 VM, there is not the legacy Hyper-V PCI framebuffer
device, so we have to call vmbus_allocate_mmio() to get a proper MMIO 
range and use that as the VRAM memory.

BTW, what's the equivlent of FB_DEFERRED_IO in DRM? Have the patch
implemented the similar thing for DRM like this for FB in this patch:
d21987d709e8 ("video: hyperv: hyperv_fb: Support deferred IO for Hyper-V frame buffer driver")

There is also another important performance improvement patch:
3a6fb6c4255c ("video: hyperv: hyperv_fb: Use physical memory for fb on HyperV Gen 1 VMs.")
Is the same idea applicable to this DRM patch?

The pci-hyperv FB driver and this DRM driver should not try to load at
the same time. Not sure what should be done to make sure that won't happen.

> > 2. It looks some other functionality in the hyperv_fb driver has not
> > been
> > implemented in this new driver either, e.g. the handling of the
> > SYNTHVID_FEATURE_CHANGE msg.
> 
> I deliberately left this and things seems to work without this, maybe I
> need to do more testing. I don't really understand the use-case
> of SYNTHVID_FEATURE_CHANGE. I observed this message was received just
> after vmbus connect and DRM is not yet initialized so no point updating
> the situation. Even otherwise situation (mode, damage, etc.) is
> triggered from user-space, not sure what to update. But will definitely
> clarify on this.

When Linux VM updates the VRAM, Linux should notify the host of the
dirty rectangle, and then the host refreshes the rectangle in the VM
Connectin window so the user sees the updated part of the screen.

I remember when the user closes the VM Connection window, the host
sends the VM a msg with msg->feature_chg.is_dirt_needed=0, so the VM
doesn't have to notify the host of the dirty rectangle; when the VM
Connection program runs again, the VM will receive a msg with
msg->feature_chg.is_dirt_needed=1.

Thanks,
-- Dexuan

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
