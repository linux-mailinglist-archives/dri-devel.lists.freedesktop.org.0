Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03A71185AC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 11:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9496E8B7;
	Tue, 10 Dec 2019 10:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26F66E8B7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 10:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytvz8DSDPaDR/IOg3l/u5voLt3QV6DCkNIVI1J3nv48=;
 b=uNvdK6oSNvj62ggeV+b1iXZV/pXO1ztWGXuWfkMWRBF8eIGxUKj49Uy3gKpTMI4AfMpp5Mzk2LdmdMo1gJQ5de0+IXL5gXIY7QiRhhwC0S3XnYbFm/r1RJ2tfV1K9DAYcE78VL//pPdUS6a/yJ8D2/NZVh6kf8sBSSTF6tPCEAA=
Received: from VI1PR0801CA0075.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::19) by VE1PR08MB4767.eurprd08.prod.outlook.com
 (2603:10a6:802:a6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.17; Tue, 10 Dec
 2019 10:59:14 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::204) by VI1PR0801CA0075.outlook.office365.com
 (2603:10a6:800:7d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Tue, 10 Dec 2019 10:59:14 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 10:59:14 +0000
Received: ("Tessian outbound 45a30426f8e4:v37");
 Tue, 10 Dec 2019 10:59:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 55660954bc9469ef
X-CR-MTA-TID: 64aa7808
Received: from bc3c463dcc9e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C6E77F35-77F1-448C-8153-83DEA7532D5E.1; 
 Tue, 10 Dec 2019 10:59:09 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bc3c463dcc9e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Dec 2019 10:59:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWV2wj/Xiy3820dBLcGgnhSjfgBKp4V0z73F2JwaOQXihe2ynje4dGSXQ30K2Shz2WQFgvcdsS1AO0CxTvRFWn6eB+beVzJ2HFTSAuT7xAdrZig5TT9b327RCUyIgrxRXnFjOrAmEegfbHawTyQTjo8k5v8pQOT2NsdoeNo8X6fSbc1xh4h+Q5mFnXMuvemPyKGs90mKiJejetZwGI/f2/ff61AVbg57YFzs5VXeqK52VycZNQOipJTH9caG9LjY9IXm4OLFEnbzhNexyZhfrIgyvHNY9nKvZ36Cleg7CcZ7LR+XjvqRANMHR6yg6m77EqSO1F4a9B+8prLjJWjEcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91Jn69yJi89nKdAbpMBvIKLR/1UM0kZlDjbuVm/YMf8=;
 b=kVpzb71TRfpe84ZdI9jQJb/Qrsr0BDBEolgObSlsXnPshInMrrNDilnGFongLqPt7PAmi/7X6XkJ25CNY39a6S20SUr3+LjZmIKa45B5bDO5yF5c24fA8jbstZ+uha7aQO4IzT6aOR794ddDaYBIhSyDPDkimSFyo9FLkvocMjBSC7CBhJMQfv5lyW5JB1PBMgoX7bUAxDY3FajBGA80BJpXrFdU03dhxw+efScgfprIOc4eat/j5RXqEBfBoPOhCc2xYyycExHfIvM21oWMol0t+JW9E4fkMeneBmes8ja8Tr+oAo2RF+GnXr7qFejQae03WChs4lobSem0HSQFEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91Jn69yJi89nKdAbpMBvIKLR/1UM0kZlDjbuVm/YMf8=;
 b=60HhnbSZ5/M7mNkS9mmLso3gi2Cmv9+6BDfMVtHBZs2ZLCjAEKdrx2GtHdMOO8HdybJJhRjHwE/K3bkgUtkY6ejPz/Ck6a4ayd2fWf/5jdUq88OASOjvaoQgwz9DACl9i7kjG2+gUsd3Y9OCMzl6nCBYhCpJkb0thbcJaCU5Bq8=
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4974.eurprd08.prod.outlook.com (10.255.158.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Tue, 10 Dec 2019 10:59:07 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e%2]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 10:59:07 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, Mihail Atanassov
 <Mihail.Atanassov@arm.com>, nd <nd@arm.com>, "Oscar Zhang (Arm Technology
 China)" <Oscar.Zhang@arm.com>, "Tiannan Zhu (Arm Technology China)"
 <Tiannan.Zhu@arm.com>, "Jonathan Chai (Arm Technology China)"
 <Jonathan.Chai@arm.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Julien Yin (Arm Technology China)"
 <Julien.Yin@arm.com>, "Channing Chen (Arm Technology China)"
 <Channing.Chen@arm.com>, "Thomas Sun (Arm Technology China)"
 <thomas.Sun@arm.com>, "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Subject: Re: [PATCH v1 2/2] drm/komeda: Refactor sysfs node "config_id"
Thread-Topic: [PATCH v1 2/2] drm/komeda: Refactor sysfs node "config_id"
Thread-Index: AQHVpEfreeFjBGX9KE2GMbcm5nukJKedW8GAgBXtVgA=
Date: Tue, 10 Dec 2019 10:59:06 +0000
Message-ID: <20191210105900.GA20614@jamwan02-TSP300>
References: <20191126105412.5978-1-james.qian.wang@arm.com>
 <20191126105412.5978-3-james.qian.wang@arm.com>
 <20191126120805.GU29965@phenom.ffwll.local>
In-Reply-To: <20191126120805.GU29965@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0106.apcprd03.prod.outlook.com
 (2603:1096:203:b0::22) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b9e0f1f3-4cfc-4d65-5979-08d77d5ffec7
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:|VE1PR08MB4974:|VE1PR08MB4767:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB47675642360F494427C3D6B3B35B0@VE1PR08MB4767.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 02475B2A01
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(376002)(346002)(366004)(39860400002)(396003)(199004)(189003)(6512007)(9686003)(81166006)(8936002)(478600001)(81156014)(33656002)(6486002)(8676002)(5660300002)(71200400001)(33716001)(966005)(2906002)(52116002)(64756008)(55236004)(316002)(6506007)(26005)(66556008)(1076003)(66476007)(66446008)(86362001)(6636002)(186003)(110136005)(66946007)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4974;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: DpEMBemi4H5UyidYVPothgjVtIqSF5ZC1HWWN34/9++HjUMGlpeaM+n1PDatds/d7chMUVnzYMs9nKPNwP5OJBPBdXUNPUlRbBG4KlUqlSss5T2bpCsHAahncFQunNI52tv+UIW1DUOcyvsZJaAtz0TEp/pBX2ddIlOT2yBTy3ZHV9JANdAOVwPXBtFU4YTW2tr8e0EWLnq22aJ7nTbPWBuuwSj+cFCc3SaeHz00rTQ9sP/+jIHY9Zyn/cTlFdqVOmCLqYIviCcCMa1PRRb8cuDr4iaT5QwMvQq/f7P2BqbM4btSL6pyVghkSyn0GwQ92bkFSwfvDStKDrSJT6Muzy5zS+YSu09qliQNLTEg9QwDNGagAAe98LHGhcX0E+XwByC2qHilBfzYjCgouWSGSkxLkrxycGYbilC/q8MQuvtgwsvOXp8Uwsx7imOXpqDNJKNw8doFJ5+ACKKZNlZilOqjdnM+DA/48ucKIxW0yPZN08IRl5mRJGRliRZkA/QrHKqXntspNGVjno3gEEjNE7WGKdgVknMnWwwJBpCoqRs=
Content-ID: <7D7C92B8BE3F044A9F0F2407F6CFE94D@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4974
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(346002)(376002)(136003)(39860400002)(40434004)(199004)(189003)(1076003)(316002)(8676002)(86362001)(478600001)(5660300002)(76130400001)(26826003)(966005)(33656002)(186003)(70586007)(81166006)(70206006)(356004)(6636002)(33716001)(81156014)(2906002)(9686003)(6512007)(336012)(8936002)(110136005)(26005)(6486002)(6506007)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4767;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 58e72cc8-2662-4720-a086-08d77d5ffa10
X-Forefront-PRVS: 02475B2A01
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4pf7F1w3MnQuwATwnNYiiop4RptIC1aXvEl+Rxo2aq4+NmVoVbQ2gowMLk8+Z7U/VsgRrziCu4U93KipU+cWEuJ3l/lP2xckvj3t7hqMy4yK35sN/kgl+99mZUf8s0mhJJonaPjhrup1SGJ8ia1+zgDMjljw5WIAMZNJnxkC98CFOgvOP+2o5UxccLCiBqZjV/vTr90xs5zacQX7Z46hYjNS8iaOpnsWrmJXY0kgscZHTsQ2cyjfb1NCuNH2tKM1KPsbbGJVFBWV/OYGk31UqeyDc208/DFalNuVlC+OwbxO0tERZVHZgOsfEoP3D4nkWkMJ/DNZdTkW/K0bvsaTmfScN4eMaSx4lDEMWYgVgA4tSUrs9cJcuIOECJDXtiZ9EU2siqfQnHrPjIeTVQxgkLMXnQoEyqGAyx/YUyR8akVqbdDIsHHXS/aKtZHoQlSQY6KYfyFWv4Nvl1BsHAQ4Qs+AG6qnU/cES+0zcA8Iqdfqdl3RPNgtb7p05av83VvPW13+QXF7MABr+y3pVuGwcn3tSf8Bw9WWO0ufe2Vs8yIf97wbasY2d+UsBNwa9H4Y
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 10:59:14.5516 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e0f1f3-4cfc-4d65-5979-08d77d5ffec7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4767
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 26, 2019 at 01:08:05PM +0100, Daniel Vetter wrote:
> On Tue, Nov 26, 2019 at 10:54:47AM +0000, james qian wang (Arm Technology China) wrote:
> > From: "James Qian Wang (Arm Technology China)" <james.qian.wang@arm.com>
> >
> > Split sysfs config_id bitfiles to multiple separated sysfs files.
> >
> > Signed-off-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>
>
> I guess Dave&my questions werent quite clear, this looks like uapi that's
> consumed by hwc, so the userspace needs to be open source. Plus it needs
> to be discussed/reviewed like any other kms uapi extensions, with a
> critical eye whether this makes sense to add to a supposedly cross-vendor
> interface.
>

Hi Dave & Daniel:

I think some komeda sysfs nodes can be added as cross-vendor.

  - core_id:
    which actually is like vendor_id/subsystem_device_id/revision in
    PCI dev, Maybe we can add a util funcs to fake these sysfs nodes
    for none PCI-dev like komeda

    device_info_sysfs_add(struct device *dev,
        u16 vendor, u16 subsystem_vendor,
        u16 subsystem_device, u8 revision);

    The arguments:
      vendor: I'd like to use the PCI vendor_ID, since with that user
              can see a unique ID, and easy to indentify different devices.
      subsystem_vendor/device/revision: device specific.

  - line_size.
    This actually is mode_config->max_width, but current drm still use
    this value to restrict the fb->width, but our HW supports crop, we
    don't have such limition. we can not set the real line_size to
    max_width.
    And I saw there is a fix:
    https://patchwork.freedesktop.org/patch/333454/
    with this fix, we can directly use mode_config->max_width

Beside that we still needs some komeda specific node like:
 - aclk_hz: for expose display engine clock.
 - num_scalers: per pipeline scalers
 - num_pipes: number of display pipelines.

For the open sourced user space, we're trying to switch to
drm_hwcomposer, and drop our internal hwcomposer. but that may need time.
Can we start from porting our specific test to IGT for komeda private uapi
coverage.

Thanks
James
> I suspect the right thing to do here is to push the revert. From a quick
> look at git history this landed together with the other kms properties in
> komeda which we reverted already.
> -Daniel
>
> > ---
> >  .../drm/arm/display/include/malidp_product.h  | 13 ---
> >  .../gpu/drm/arm/display/komeda/komeda_sysfs.c | 80 ++++++++++++++-----
> >  2 files changed, 62 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/arm/display/include/malidp_product.h b/drivers/gpu/drm/arm/display/include/malidp_product.h
> > index dbd3d4765065..b21f4aa15c95 100644
> > --- a/drivers/gpu/drm/arm/display/include/malidp_product.h
> > +++ b/drivers/gpu/drm/arm/display/include/malidp_product.h
> > @@ -21,17 +21,4 @@
> >  #define MALIDP_D71_PRODUCT_ID      0x0071
> >  #define MALIDP_D32_PRODUCT_ID      0x0032
> >
> > -union komeda_config_id {
> > -   struct {
> > -           __u32   max_line_sz:16,
> > -                   n_pipelines:2,
> > -                   n_scalers:2, /* number of scalers per pipeline */
> > -                   n_layers:3, /* number of layers per pipeline */
> > -                   n_richs:3, /* number of rich layers per pipeline */
> > -                   side_by_side:1, /* if HW works on side_by_side mode */
> > -                   reserved_bits:5;
> > -   };
> > -   __u32 value;
> > -};
> > -
> >  #endif /* _MALIDP_PRODUCT_H_ */
> > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_sysfs.c b/drivers/gpu/drm/arm/display/komeda/komeda_sysfs.c
> > index 740f095b4ca5..5effab795dc1 100644
> > --- a/drivers/gpu/drm/arm/display/komeda/komeda_sysfs.c
> > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_sysfs.c
> > @@ -18,28 +18,67 @@ core_id_show(struct device *dev, struct device_attribute *attr, char *buf)
> >  static DEVICE_ATTR_RO(core_id);
> >
> >  static ssize_t
> > -config_id_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +line_size_show(struct device *dev, struct device_attribute *attr, char *buf)
> >  {
> >     struct komeda_dev *mdev = dev_to_mdev(dev);
> >     struct komeda_pipeline *pipe = mdev->pipelines[0];
> > -   union komeda_config_id config_id;
> > -   int i;
> > -
> > -   memset(&config_id, 0, sizeof(config_id));
> > -
> > -   config_id.max_line_sz = pipe->layers[0]->hsize_in.end;
> > -   config_id.side_by_side = mdev->side_by_side;
> > -   config_id.n_pipelines = mdev->n_pipelines;
> > -   config_id.n_scalers = pipe->n_scalers;
> > -   config_id.n_layers = pipe->n_layers;
> > -   config_id.n_richs = 0;
> > -   for (i = 0; i < pipe->n_layers; i++) {
> > +
> > +   return snprintf(buf, PAGE_SIZE, "%d\n", pipe->layers[0]->hsize_in.end);
> > +}
> > +static DEVICE_ATTR_RO(line_size);
> > +
> > +static ssize_t
> > +n_pipelines_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +   struct komeda_dev *mdev = dev_to_mdev(dev);
> > +
> > +   return snprintf(buf, PAGE_SIZE, "%d\n", mdev->n_pipelines);
> > +}
> > +static DEVICE_ATTR_RO(n_pipelines);
> > +
> > +static ssize_t
> > +n_layers_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +   struct komeda_dev *mdev = dev_to_mdev(dev);
> > +   struct komeda_pipeline *pipe = mdev->pipelines[0];
> > +
> > +   return snprintf(buf, PAGE_SIZE, "%d\n", pipe->n_layers);
> > +}
> > +static DEVICE_ATTR_RO(n_layers);
> > +
> > +static ssize_t
> > +n_rich_layers_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +   struct komeda_dev *mdev = dev_to_mdev(dev);
> > +   struct komeda_pipeline *pipe = mdev->pipelines[0];
> > +   int i, n_richs = 0;
> > +
> > +   for (i = 0; i < pipe->n_layers; i++)
> >             if (pipe->layers[i]->layer_type == KOMEDA_FMT_RICH_LAYER)
> > -                   config_id.n_richs++;
> > -   }
> > -   return snprintf(buf, PAGE_SIZE, "0x%08x\n", config_id.value);
> > +                   n_richs++;
> > +
> > +   return snprintf(buf, PAGE_SIZE, "%d\n", n_richs);
> > +}
> > +static DEVICE_ATTR_RO(n_rich_layers);
> > +
> > +static ssize_t
> > +n_scalers_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +   struct komeda_dev *mdev = dev_to_mdev(dev);
> > +   struct komeda_pipeline *pipe = mdev->pipelines[0];
> > +
> > +   return snprintf(buf, PAGE_SIZE, "%d\n", pipe->n_scalers);
> > +}
> > +static DEVICE_ATTR_RO(n_scalers);
> > +
> > +static ssize_t
> > +side_by_side_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +   struct komeda_dev *mdev = dev_to_mdev(dev);
> > +
> > +   return snprintf(buf, PAGE_SIZE, "%d\n", mdev->side_by_side);
> >  }
> > -static DEVICE_ATTR_RO(config_id);
> > +static DEVICE_ATTR_RO(side_by_side);
> >
> >  static ssize_t
> >  aclk_hz_show(struct device *dev, struct device_attribute *attr, char *buf)
> > @@ -52,7 +91,12 @@ static DEVICE_ATTR_RO(aclk_hz);
> >
> >  static struct attribute *komeda_sysfs_entries[] = {
> >     &dev_attr_core_id.attr,
> > -   &dev_attr_config_id.attr,
> > +   &dev_attr_line_size.attr,
> > +   &dev_attr_n_pipelines.attr,
> > +   &dev_attr_n_layers.attr,
> > +   &dev_attr_n_rich_layers.attr,
> > +   &dev_attr_n_scalers.attr,
> > +   &dev_attr_side_by_side.attr,
> >     &dev_attr_aclk_hz.attr,
> >     NULL,
> >  };
> > --
> > 2.20.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
