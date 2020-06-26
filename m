Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A73220B464
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 17:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB1B6E2BC;
	Fri, 26 Jun 2020 15:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30080.outbound.protection.outlook.com [40.107.3.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477856E2BC
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 15:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDgj3DVRoJ5RrtFO+L0QKopADogIxFsGCbZdKK54aUs=;
 b=uHbnNenxrzu77DCALQ9VM24o5bYJnp9u4CxPkBohwGq+Uku68yXW8Pcu6eGWz11ulOAL+gURe0VmymAy9UzZMMtzG26aaVGZUFxtO8QSivwMGl5bh6WHOvj5Hb9Hw+YfkRTanV/o3QRYsxlmvWI8wAlkSdwK6QtEb8QOLcZeOFM=
Received: from DB6PR0202CA0015.eurprd02.prod.outlook.com (2603:10a6:4:29::25)
 by VI1PR08MB5488.eurprd08.prod.outlook.com (2603:10a6:803:137::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Fri, 26 Jun
 2020 15:21:54 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::db) by DB6PR0202CA0015.outlook.office365.com
 (2603:10a6:4:29::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend
 Transport; Fri, 26 Jun 2020 15:21:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Fri, 26 Jun 2020 15:21:53 +0000
Received: ("Tessian outbound cea5956745d7:v60");
 Fri, 26 Jun 2020 15:21:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f616660e4e32bbc0
X-CR-MTA-TID: 64aa7808
Received: from e1c0686678e1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3279B832-E2CB-460E-B2D7-DD8FDF617488.1; 
 Fri, 26 Jun 2020 15:21:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e1c0686678e1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 26 Jun 2020 15:21:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLDWQDfMZlA1SkYLrNc+X+qwOA53eRckEzMEk6AmACYDHJFzTcyFtnKjv1pYfZTS2un6oLvCwbtYRDLzbHI+mw0Q2m9qRzqOsjAvMOn7seNcA63T5n03W/xLF2PnvmhGJU1zuYHIBo5k6JJ+iV7iruCjvEkQI62xVWQbyhRUqxDrfVqJJTeouqoMWnkEMvAr/OBnHPxNAh2gxzeLIp/o+Rt9z5EcfnrZW5oRCWTLTJKuGqYPXV9EV9ZR4eEBy2CRJIcgVawncOqmZ6edWLUHSrJb9csJehJ3BKMyKkTsWDMxtHW9yYffCGlk3AoSaChcregFWfnjGtiIZkQGRPZLEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDgj3DVRoJ5RrtFO+L0QKopADogIxFsGCbZdKK54aUs=;
 b=mavGzvrvASQIDmkA1SVL78oqpwMkOranMCL1UB//QIEhznTqovqj/B1eRoT99J6u0B+9Im49Qd2tG9btqWOaICH6llyxit52qnol84Ou0dSBATN3ai2q+ik5hS2DwO9a12a2qYrt5UZE9K6va/sEPiPEgS0L4Vb/AafqtXqWweNRNc9PWb1DqOS+RPFcwDLP+yi1k/9UqX7w1mFJBEWToLTvglhp0OtZkwSalPTUOxJ0zUD/flPwLbwpLldaTgj0RB6/E+Vc3IUdb3cKxJhzZ3A0vgClEnW+OVd2Vu7vlFOmrMNGklDwdsv0aUOSqZC0ps/7ZlkEmCNzG/pswIn96Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDgj3DVRoJ5RrtFO+L0QKopADogIxFsGCbZdKK54aUs=;
 b=uHbnNenxrzu77DCALQ9VM24o5bYJnp9u4CxPkBohwGq+Uku68yXW8Pcu6eGWz11ulOAL+gURe0VmymAy9UzZMMtzG26aaVGZUFxtO8QSivwMGl5bh6WHOvj5Hb9Hw+YfkRTanV/o3QRYsxlmvWI8wAlkSdwK6QtEb8QOLcZeOFM=
Authentication-Results-Original: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR08MB2842.eurprd08.prod.outlook.com (2603:10a6:7:34::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.26; Fri, 26 Jun 2020 15:21:46 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::18de:2773:77b4:4ce2]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::18de:2773:77b4:4ce2%7]) with mapi id 15.20.3131.024; Fri, 26 Jun 2020
 15:21:46 +0000
Date: Fri, 26 Jun 2020 16:21:44 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: drm_fourcc: Add generic alias for 16_16_TILE modifier
Message-ID: <20200626152144.5e4pe3y4nw44mf2d@DESKTOP-E1NTVVP.localdomain>
References: <20200626135233.32137-1-brian.starkey@arm.com>
 <CAKMK7uGCQV7XptAAycHG_XOW-VOtHpUB2qqp2Kvo+3oUhkmOQA@mail.gmail.com>
 <20200626141557.g7vhzfyre764otr4@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uFy59UegLzWhrx3a1u1Hiv3+0iDhViHC+SecPJBo+O0mA@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAKMK7uFy59UegLzWhrx3a1u1Hiv3+0iDhViHC+SecPJBo+O0mA@mail.gmail.com>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO2P265CA0339.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::15) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LO2P265CA0339.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:d::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.21 via Frontend Transport; Fri, 26 Jun 2020 15:21:45 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e35b6b38-ae6a-4954-782d-08d819e4a844
X-MS-TrafficTypeDiagnostic: HE1PR08MB2842:|VI1PR08MB5488:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB54884BAB42C8E30F9EC2D078F0930@VI1PR08MB5488.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: FF/rdLvEWYqeUKwzJCn0I5Lwf8u1cZdQBLBbBJlQibmZAR1OJ6eMTflY4vkY0lJb5ZHHo3B+qWOFKKuEUHU/MHQROpX/ivpXiJ6GuUytkVEy6p7lCF8ZiJWIJX7PRZOVGYYhAxeRph3Tb/eUOlKLarZYQa4o8J12AQeIhtT+a/dU3qOSK8+3RiegQA8RkCCHEwECJPurOCv/9/2htwd8TINgVpVCEZepQvmvJ7l7w/bvxP47JO8jomXkUkZCj/v1DU9NdM0UszWjqfzjMxgC8r6bBQ9wYhjoxQwVWPy5+rXrDkMy7NQViSRLSAe/UBCTbv3gCRpc9tsV8AmUClSbVDMkoFDQVCmWShDezxRIDnodJYOxP299HHMSI/8ErHe33l+ZWaAkBOCG5HpPmxserrixjFbsSJ2YKZZ/7Opi30bgqUOuRw+8ErSPlEVnXIYh
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(66946007)(53546011)(55016002)(316002)(26005)(54906003)(966005)(6506007)(8936002)(52116002)(2906002)(1076003)(478600001)(5660300002)(7696005)(83080400001)(66476007)(956004)(9686003)(86362001)(66556008)(186003)(16526019)(8676002)(6916009)(4326008)(44832011)(83380400001)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: dbas2/KaYumVie5OwnRpP8V3aOaMORJ5F1GqBlIbeH68xCRl8BSge/xF6dRlLGd+kHKAXMbPlmDAkKCaHdO6T8hDegatGHVDjvqr7BLsDmTwYSeqDr0cZvUcuCK12mf2m4rUWAy6wjzryqUvcwMB6f7/qx2kE+2tiE6imnKMXi5+LhR67gqlI1e7p6ElQPM1aPjuyvzFGs5yjDWooLgsCMKOMxD/3LXyPPqHpMOhHUt32xHQ0Wb1ZgfYxgdBaazIlrM+4OPW71illIe2Dd//leZ2i6CRoZXGhokOisODZnKCSW5tsORk5a3uTXZA7sZ6cO20Tu9kWnjAs3SZY92LXa7a0P6+/uSL4vlN+//BQPbgtfciN6t9CoGfMq91CE1oDAwIuye3tEvc8koDQxJktvUufCyBXP2WY39fQrgwa9BoEPT1TcPqr8kYMR5IZUOsBgf4og3RCR53hcSowcV85BYcTB0rOjYH3zn4pBTKhP0UqmCnNhxou1WJhC9tX7ZG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2842
Original-Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966005)(81166007)(336012)(356005)(54906003)(82740400003)(83380400001)(316002)(5660300002)(86362001)(55016002)(70206006)(2906002)(83080400001)(9686003)(186003)(16526019)(70586007)(82310400002)(26005)(7696005)(478600001)(8936002)(966005)(44832011)(6862004)(956004)(47076004)(8676002)(1076003)(4326008)(53546011)(6506007)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: aacd473e-1849-4bdb-bc69-08d819e4a3aa
X-Forefront-PRVS: 0446F0FCE1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w8ByCcLcS24yZUdV1IhGS2WWnQVz7y/kuaZDv9X0TL7H0iMQFsqMf+hqV/KuKwJygaaShMdjmIAylwakfDhVeKeWdrp4bqQNf+yq9BfcC3mqX27Tb0/hslZ0l+xjXpAR7A9aENouVr4lWXMbRDfGwcfmt7CGucmyq02sdGSKTWjO6nlCACtl7Y1JYzWs4EKvJV3r91gtx+4Lpe90u4OGq3m9M8caGsSuy3GRl1qqyysApi5hYWOJH0yqTjnY8hsATjNvI0BrX47/NozxYvZCOmGtfhh5dfkbZYfAPJi+KyqUdZ6L/FONdS3bXMIFyoYYyypmaFXHXjyXCCtgu+ycYvIpTUOptECXZh2JeYNOS5BL64SdDlpj8Zs57NzNrRPLZU3yxlJBLbWK9Rgs+ZKQ5heyfrFRAsYYhjqHYv51lV5UNKSspgXgQnLbYzBk/GoXPVBFHHqGsXLi998ZwGaWP6/xKVLMN/kw7BSCK7f+S1FJJjn+2drPg5yAqMrqimXx
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:21:53.9152 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e35b6b38-ae6a-4954-782d-08d819e4a844
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5488
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
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, nd <nd@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, matteo.franchin@arm.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 05:16:53PM +0200, Daniel Vetter wrote:
> On Fri, Jun 26, 2020 at 4:16 PM Brian Starkey <brian.starkey@arm.com> wrote:
> >
> > Hi Daniel,
> >
> > On Fri, Jun 26, 2020 at 04:07:43PM +0200, Daniel Vetter wrote:
> > > On Fri, Jun 26, 2020 at 3:52 PM Brian Starkey <brian.starkey@arm.com> wrote:
> > > >
> > > > In cases such as DRM_FORMAT_MOD_SAMSUNG_16_16_TILE, the modifier
> > > > describes a generic pixel re-ordering which can be applicable to
> > > > multiple vendors.
> > > >
> > > > Define an alias: DRM_FORMAT_MOD_GENERIC_16_16_TILE, which can be
> > > > used to describe this layout in a vendor-neutral way, and add a
> > > > comment about the expected usage of such "generic" modifiers.
> > > >
> > > > Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> > > > ---
> > > >
> > > > This is based off a suggestion from Daniel here:
> > > > https://lore.kernel.org/dri-devel/20200529115328.GC1630358@phenom.ffwll.local/
> > > >
> > > > If there are future cases where a "generic" modifier is identified
> > > > before merging with a specific vendor code, perhaps we could use
> > > > `fourcc_mod_code(NONE, n)` or add a DRM_FORMAT_MOD_VENDOR_GENERIC.
> > > >
> > > > However, I also think we shouldn't try and "guess" what might be generic
> > > > up-front and end up polluting the generic namespace. It seems fine to
> > > > just alias vendor-specific definitions unless it's very clear-cut.
> > >
> > > I think the above two things would also be good additions to the comment.
> > >
> > > A totally different thing: I just noticed that we don't pull in all
> > > the comments for modifiers. I think we could convert them to
> > > kerneldoc, and then pull them into a separate section in drm-kms.rst.
> > > Maybe even worth to pull out into a new drm-fourcc.rst document, since
> > > these are officially shared with gl and vk standard extensions. Then
> > > this new modifier's doc could simply point at teh existing one (and
> > > the generated kerneldoc would make that a hyperlink for added
> > > awesomeness).
> > >
> > > Aside from that makes sense to me, maybe just add it to your patch
> > > series that will start making use of these.
> >
> > This is only supported by the GPU, so we wouldn't be using this on the
> > Display side.
> 
> I mean the patch to add the NV15 fource, it mentions "suitable for 16
> by 16 tile layout", would be nice to just put the generic modifier in
> that comment.
> -Daniel

Ah right. I saw that one went out in Maarten's pull request this
morning.

-Brian

> 
> >
> > Thanks,
> > -Brian
> >
> > > -Daniel
> > >
> > > >
> > > > I typed a version which was s/GENERIC/COMMON/, other suggestions
> > > > welcome.
> > > >
> > > > Cheers,
> > > > -Brian
> > > >
> > > >  include/uapi/drm/drm_fourcc.h | 19 +++++++++++++++++++
> > > >  1 file changed, 19 insertions(+)
> > > >
> > > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > > > index 299f9ac4840b..ef78dc9c3fb0 100644
> > > > --- a/include/uapi/drm/drm_fourcc.h
> > > > +++ b/include/uapi/drm/drm_fourcc.h
> > > > @@ -345,8 +345,27 @@ extern "C" {
> > > >   * When adding a new token please document the layout with a code comment,
> > > >   * similar to the fourcc codes above. drm_fourcc.h is considered the
> > > >   * authoritative source for all of these.
> > > > + *
> > > > + * Generic modifier names:
> > > > + *
> > > > + * DRM_FORMAT_MOD_GENERIC_* definitions are used to provide vendor-neutral names
> > > > + * for layouts which are common across multiple vendors. To preserve
> > > > + * compatibility, in cases where a vendor-specific definition already exists and
> > > > + * a generic name for it is desired, the common name is a purely symbolic alias
> > > > + * and must use the same numerical value as the original definition.
> > > > + *
> > > > + * Note that generic names should only be used for modifiers which describe
> > > > + * generic layouts (such as pixel re-ordering), which may have
> > > > + * independently-developed support across multiple vendors.
> > > > + *
> > > > + * Generic names should not be used for cases where multiple hardware vendors
> > > > + * have implementations of the same standardised compression scheme (such as
> > > > + * AFBC). In those cases, all implementations should use the same format
> > > > + * modifier(s), reflecting the vendor of the standard.
> > > >   */
> > > >
> > > > +#define DRM_FORMAT_MOD_GENERIC_16_16_TILE DRM_FORMAT_MOD_SAMSUNG_16_16_TILE
> > > > +
> > > >  /*
> > > >   * Invalid Modifier
> > > >   *
> > > > --
> > > > 2.17.1
> > > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
> 
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
