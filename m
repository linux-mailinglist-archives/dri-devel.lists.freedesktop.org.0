Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C389204B9B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6252C6E962;
	Tue, 23 Jun 2020 07:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310135.outbound.protection.outlook.com [40.107.131.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74216E214
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 02:31:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RImAIeglGNT9g4V+9whaZVyptf27TlX9aTXZUinhEyEXykh+4rft5rMe0L9i3jQyhJMzmQNI2haDbzJTq8o1isq1b5T6HgddRgH8uFrZlFpUk1MuTNAsFEpKovOqaQ5+IWRj/Z48WcL+ELJ8JDAevGm1km8PTvz3XJ2lpFf0HDCl3xRAKzOLQRwv/WAZS4H89IsMcTwE1LG7wMb6qCKlG75itJGOTO2hzdLQSnjLICxNh0lCxPI1u+5BmI3By6jN1TU1jinDFzQL/jTP/kmxb5JzB41hX6Hq2YoTRyKgDP6fbms/aM/Mi+YMip0cWV3we5s1J98vBbOerNno5ijKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqkGtlE34Ptsn7f3+oeF0XDtYU1eppsl+F+ijpjUslg=;
 b=ExUUQYbigidw189RG7n2QeA8qZumGMyniLp8Yl3/UrGtL54Xfo1sKVsMKNV5MYDXy6Sa0It6oUdwQP3fygsrpcCxGhlE0kHhxGmZda9pN79QrhrLUNXU1sTKnOpdlHmATCV6001TwNpUjWLk/TjdwLU8IcHTijS0mnwq9jj+T4usRdR/ZI/Ee5za49OhNcyzKAeTgaF8fCk03w7J+G9DuynHCVVwyMfQ0AiRERMhgRxwTCl3rB9Dpxr0ApHnS6Qaxgt4M018QdUIMWE9seHGvkRpPdr5az17GKM71NdJw6JGcg6vgmWTrHfP7q2tORLzYTB8pIECmpxWB5Os1XFrGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqkGtlE34Ptsn7f3+oeF0XDtYU1eppsl+F+ijpjUslg=;
 b=gBXJQfrZIdCxkciS98xjn+coN/Nvnyav+79XFj5VnYc0Pggny8KkCYp/v9+l9NNmRQ8+XUMtXPdqXhvRv8vQX/QtoDKj4k2TwsK8VSVGpQhcGQP2HEAUnsXQLEwiyBsbyoaIjWuMqQRZEuwQKXXiFtuja0vb41ovawj2FpvAAnI=
Received: from HK0P153MB0322.APCP153.PROD.OUTLOOK.COM (2603:1096:203:b5::19)
 by HK0P153MB0148.APCP153.PROD.OUTLOOK.COM (2603:1096:203:1a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.4; Tue, 23 Jun
 2020 02:31:21 +0000
Received: from HK0P153MB0322.APCP153.PROD.OUTLOOK.COM
 ([fe80::e567:3a32:6574:8983]) by HK0P153MB0322.APCP153.PROD.OUTLOOK.COM
 ([fe80::e567:3a32:6574:8983%7]) with mapi id 15.20.3153.005; Tue, 23 Jun 2020
 02:31:21 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Deepak Rawat <drawat.floss@gmail.com>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
Thread-Topic: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
Thread-Index: AQHWSIVPTyd7nwDoi0OeDECzal8UNajldhsQ
Date: Tue, 23 Jun 2020 02:31:20 +0000
Message-ID: <HK0P153MB03224C17D736FF164209F6DABF940@HK0P153MB0322.APCP153.PROD.OUTLOOK.COM>
References: <20200622110623.113546-1-drawat.floss@gmail.com>
 <20200622110623.113546-2-drawat.floss@gmail.com>
In-Reply-To: <20200622110623.113546-2-drawat.floss@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-06-23T02:31:19Z; 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=8c46a189-3137-43db-8b00-88ba04b4d7cd;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [2601:600:a280:7f70:ddf9:ea7a:43e2:c8ff]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 390c5fd0-0021-44f0-f2fc-08d8171d8438
x-ms-traffictypediagnostic: HK0P153MB0148:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0P153MB0148ED564BF424A046F6B42DBF940@HK0P153MB0148.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 04433051BF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6DJC6W8hNMjU5hblhODxwQhEMn3qZTACr2FUDb/w5KqXABKxV//Nl0l2zZkOWiTkIEzfpe2E7AHIym7j/5GFT/PT/wf1OWsUDZW0oPnA4365/k+fDDnBbcM5WPT86f+d50FjeFa1RStkSCyc4wf1C6ogqInsj/fJ3iGcP2ghGyczEEfZRGeCMZF2/gT0dJzoVRofydzrwQrz1LVqY+DOtLidKPlIgFnF2fX8VWoyKbz2ryGWXaBlOlSz4Kc/M1NknsMetzdaTy9H0vCa9lt3PgVPCdGTXc4ZJArY87t8xQFqPCqhnee+8QPqpR90lXyBS9vkNHEkrUaFVl18EAkZWg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0P153MB0322.APCP153.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(107886003)(82950400001)(8676002)(86362001)(186003)(5660300002)(33656002)(82960400001)(4744005)(8990500004)(71200400001)(66946007)(76116006)(6506007)(66446008)(64756008)(7696005)(4326008)(66476007)(66556008)(2906002)(10290500003)(316002)(110136005)(9686003)(55016002)(52536014)(54906003)(478600001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: LwPflNAd4HKx+Wepkg3tzPrWiIM5+ps5l327WJvKxA9DL1+Y6/yt11/b9gs2ViL9s3Ra4TwJKNkT+dQVDhwjhzCw1p30QXszkN/JrhROofiib2cZZUoC+OdQuMttW4nz9VqCEh+YSoz1kI8+DqObYvCDhb2GfVJumcefe0A6tSkX2ImoHbnkByDZY1p1V/PTJwEof47LcDVngzD7zZmuf7/jfjaQu1sEy9bb26AAee6k5t1pJVih7KFPBA8j7WRHTN7o8nG2gCFvPwrgOktCk6LOScRjrhwuEGW7uPuHrOUoWj34VuXdVEhATHQkfbH+04/P1W0w1+H1EYlV6lfHW8SYmHazhA8gcHdntTJWMckbRqgewfXU+jQotq754U5PE7PCfsmKNEk8MIIVz485Z/nDwCJsp8xfmChzIchiq1taHQR22MlWoUHr+Sn3hlJg+IyxrPFbal2rWgXyll2nadqA6P21yrbJZSyQVuvuA7+9zt96TpNO14mYcb8EXi6H9uqqNJwSXATmJ3dNwsFhIBBje13A3633rKpXJJnkIHHAO9PgYdTtKgdofo9HH72s
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0P153MB0322.APCP153.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 390c5fd0-0021-44f0-f2fc-08d8171d8438
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2020 02:31:20.8502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aGvCoqKR9HpeoBAB8n18/v+tNcdT4zmuXb5Imp1KEVurfsOlpP8WkhH6UshOyYF2APqS2DRJ6qXc9mLV2WhAPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0P153MB0148
X-Mailman-Approved-At: Tue, 23 Jun 2020 07:48:47 +0000
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
> Sent: Monday, June 22, 2020 4:06 AM
> 
> DRM driver for hyperv synthetic video device, based on hyperv_fb
> framebuffer driver. Also added config option "DRM_HYPERV" to enabled
> this driver.

Hi Deepak,
I had a quick look and overall the patch as v1 looks good to me. 

Some quick comments:
1. hyperv_vmbus_probe() assumes the existence of the PCI device, which
is not true in a Hyper-V Generation-2 VM.

2. It looks some other functionality in the hyperv_fb driver has not been
implemented in this new driver either, e.g. the handling of the
SYNTHVID_FEATURE_CHANGE msg.

Thanks,
-- Dexuan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
