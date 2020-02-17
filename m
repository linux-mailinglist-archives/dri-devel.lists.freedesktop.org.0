Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F12DE16112A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 12:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003676E931;
	Mon, 17 Feb 2020 11:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9AE6E8A4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 11:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dD586cmQIjaN9QcDIpxIM2/2EZ0rYI/DBoMs5DZNdWY=;
 b=LzoCZpajUy22Ie7ElM42I41xbSji6lVe7SQOFZ0ym8MClCUdCPVwt75kQbf29HR9A4Q10zxWN1A3Mb7ahP3IgVyqt/hTEGamYo4QrZF+Geu8QofI2eageNP0Iz/QkKXgkW93nzRVhbC4pKQT4CBMahkjavtZ2ncvYp9cl9FIkIg=
Received: from VI1PR08CA0226.eurprd08.prod.outlook.com (2603:10a6:802:15::35)
 by DB8PR08MB5211.eurprd08.prod.outlook.com (2603:10a6:10:ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.27; Mon, 17 Feb
 2020 11:34:50 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::203) by VI1PR08CA0226.outlook.office365.com
 (2603:10a6:802:15::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.24 via Frontend
 Transport; Mon, 17 Feb 2020 11:34:50 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.18 via Frontend Transport; Mon, 17 Feb 2020 11:34:49 +0000
Received: ("Tessian outbound 1f9bda537fdc:v42");
 Mon, 17 Feb 2020 11:34:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8632d28409ec4e00
X-CR-MTA-TID: 64aa7808
Received: from 96436f44a05d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 131F2131-9064-452A-89C4-30C091238D1B.1; 
 Mon, 17 Feb 2020 11:34:44 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 96436f44a05d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Feb 2020 11:34:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4FVDpSEAKoLow4SyIGGq1h02nSU22DsFekRKBZcMsH9g6XpM/LvBhMbTDP3U2z6ZYDoEbDLeXlEoKCF9M11O/13nEM0vcdRoyo5WCInSz05yo89dfB0L47C78VYNTdOTfDQD8DIXo0OqMEOXnQvESTCp7v4EtmJeJE9gNoD2oYvtxtpw8fhnbHnfAE39tU62XCLqt3uU40bw2K193OT2abgCFUIMn53zDYPKoj0af83CP+ewHmyDS3W7Lj3s7fIkgNHDzeAnP4gC0ZPS1Jy44yUu/jfheukNWDj0P8f74CXEABjnQAurS0Ta0C51d0HJf+keslTa5yVISsmgtlSBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dD586cmQIjaN9QcDIpxIM2/2EZ0rYI/DBoMs5DZNdWY=;
 b=OcFyJQzQIrce/fNM6OrpOzBQ533V+u5vH2E6Z/9euab/9LA6lGHKWq6tWt3rd4aA5nWLkwaFRUMDibBSmfbazS3zRUX7A8gX4ODmKJm0tGeFcPE8p67o+4JblVJcRoDwAn4q8hq8ZfC0mSvS/064luHeOkQL9f8ShixXojTYir0Yil+3B8SokIwNoMU/8miF81qHpYI12dO6v/eGdlNFCmbS7li3PVYAaCjUvyyn25J51l1nZPIKYv0mYWgYbjGbu+zsZzckAN9N7oPxBZaoqXV2g7AgwB2oB0P4+Ad3tKoIyPP19TAinDPXdf4GRNDiUHbR+h8X9p+Xej34abhRUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dD586cmQIjaN9QcDIpxIM2/2EZ0rYI/DBoMs5DZNdWY=;
 b=LzoCZpajUy22Ie7ElM42I41xbSji6lVe7SQOFZ0ym8MClCUdCPVwt75kQbf29HR9A4Q10zxWN1A3Mb7ahP3IgVyqt/hTEGamYo4QrZF+Geu8QofI2eageNP0Iz/QkKXgkW93nzRVhbC4pKQT4CBMahkjavtZ2ncvYp9cl9FIkIg=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5277.eurprd08.prod.outlook.com (20.179.31.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 17 Feb 2020 11:34:40 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520%7]) with mapi id 15.20.2729.032; Mon, 17 Feb 2020
 11:34:40 +0000
Date: Mon, 17 Feb 2020 19:34:32 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv4,04/36] drm/gem-fb-helper: Add special version of
 drm_gem_fb_size_check
Message-ID: <20200217113432.GA6208@jamwan02-TSP300>
References: <20191213155907.16581-5-andrzej.p@collabora.com>
 <20200217081627.GA5151@jamwan02-TSP300>
 <e5b798c2-baf0-deae-b4ae-ac0e19abd710@collabora.com>
Content-Disposition: inline
In-Reply-To: <e5b798c2-baf0-deae-b4ae-ac0e19abd710@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: HK2PR0401CA0005.apcprd04.prod.outlook.com
 (2603:1096:202:2::15) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
MIME-Version: 1.0
Received: from localhost (113.29.88.7) by
 HK2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:202:2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.24 via Frontend
 Transport; Mon, 17 Feb 2020 11:34:39 +0000
X-Originating-IP: [113.29.88.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0e8691e0-4c48-4df3-3b27-08d7b39d65f2
X-MS-TrafficTypeDiagnostic: VE1PR08MB5277:|VE1PR08MB5277:|DB8PR08MB5211:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB5211725788BA3BFEA4D54B17B3160@DB8PR08MB5211.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 0316567485
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(189003)(199004)(33716001)(478600001)(966005)(2906002)(16526019)(52116002)(6916009)(9686003)(66946007)(66556008)(66476007)(956004)(26005)(86362001)(186003)(6666004)(81166006)(54906003)(316002)(55236004)(8676002)(6496006)(4326008)(33656002)(81156014)(1076003)(5660300002)(8936002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5277;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: HhEUN2XG6Aj/r9k5rdh/c0vLyRBhaQ+qqX4CrVvQdiPJXzOqTNMawJCfeV9LxuW0hkRJGWNF+1loiLEzyOwAUE9OHoFnpT0GW4hXGBTPyt1+exBkkSpNbKdT1cQtR6v/jlGjWz11L98vTtD5tMMxbA24V6B+NT3GTWxXq9vFkIm5Ccd/d6bcQdFiyqlrxmrDEdXeDUBM0LuJUOS1V0pPPlsFLWtHyxq70J9vZC+eROBUVv0iiYwPApce2ry4aFsUGQZufzXF7PQTVUpesnznqbqbFjMGIK7k0fu5SZq3Qpz07qxR8GUe+/L16nfe0s0BM7gk6qctyqpc1f98DPMDeQNAqVMS2bQb/653W+YMNnQ6I6goHSWCdbuqW26MIZ4JNIdxzPP0mLVhqAcP+ufvFclruSliK3b1PDh22uk19VovE08OdIm4MrhW2lB5cCdqCYHq/0uABpQApMcPnUAn4maR1mD5k9FBTe5NrcFFNzzkFr3KilcNC+6/xle356h3JnukIqcPrKxyEUISXYHkpA==
X-MS-Exchange-AntiSpam-MessageData: 9fOmYB4Rn/p4WXIfokxzFbGePpzJSnVHjMl0zUoKl7yBG5f2qYbROTB+Ves9xZBf8zhIn3XQEG5I115buAiVGEIW/8bcmy4jSiHtIZ4dpfaIs14GBdihLF8QFfsqCnOt1tK7IvzlXsqQbB58VOaV4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5277
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(136003)(376002)(39860400002)(396003)(199004)(189003)(36906005)(5660300002)(33656002)(316002)(8676002)(2906002)(1076003)(33716001)(81156014)(81166006)(8936002)(54906003)(356004)(6496006)(6666004)(186003)(956004)(16526019)(336012)(26826003)(478600001)(26005)(70206006)(9686003)(6862004)(4326008)(86362001)(70586007)(6486002)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB5211;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: eb69d509-8a8f-4913-16b9-08d7b39d5ff1
X-Forefront-PRVS: 0316567485
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4BDtS+aJjHQnw2pqcNYekYb5Rk9JG+NPq3FAJZKCcZeo3rpYYE7/Vu8tX7ZAMkIBC9inb2taur7nXvCALVaQUu6vPpIOxJ1xvLXqKKwYKiaYlWU27bJy3XJpdqc2DTNuD2Ivh/MBAoyGuzWrhe4kaEKoLdGkUNEnppvi8WqPFUfqI1QDP6tQRVMkJB4TohnpPUj/Et6/CptYhfCowNW3l57VkEmWMDW0PHnoXi9kEfQmiMcG4158SBYodmf5v+jcfUzjXZQfROQ2GhR3F7F+nmk1OGphMfn8CGomYq1hhtpbdOoo2Iq7sCF2mb9wNJstcKAZSJ1/SzPRPMEBq0cnc4iaefQE3T2X49Gj094Zgx4hUP/Zn0AcBMQY4EbCRP5OShLrt/6kmT1GtrvO032d83Wi87B6wuSdydM9QHK3cHeb1hFDSmkw+YzYYeG3gpuxj0e5e1hwfk954YvnNfXPUmNeTazNbRppN0+7ZrbBIqwWqfXf1qwsX6pGRziZpKihXJWq+6if+3SGhGK6PaSKuQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 11:34:49.6464 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8691e0-4c48-4df3-3b27-08d7b39d65f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5211
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
Cc: nd@arm.com, kernel@collabora.com,
 Mihail Atanassov <mihail.atanassov@arm.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, Ayan Halder <Ayan.Halder@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 17, 2020 at 11:55:50AM +0100, Andrzej Pietrasiewicz wrote:
> Hi James,
> =

> Thank you for the review.
> =

> Did you intentionally review patches from the v4 series or you simply
> didn't notice the v5? There are some differences, the most notable one
> is using proper way of subclassing a drm_framebuffer.
> The v5 series was sent on 17th December 2019.

Hi Andrzej:
Sorry, I did the review based pathwork:
https://patchwork.freedesktop.org/series/70889/#rev35
seems it has problem which only have V4.

I will re-do the review for V5 ASAP.

Sorry again.

James.

> Andrzej
> =

> W dniu 17.02.2020 o=EF=BF=BD09:16, james qian wang (Arm Technology China)=
 pisze:
> > Hi Andrzej:
> > =

> > Really a good idea for introducing this custom size check, it's very
> > useful for some Komeda/malidp format, espcially pitch_multiplier, maybe
> > in future we can add it into into the drm_format_info.
> > =

> > On Fri, Dec 13, 2019 at 04:58:35PM +0100, Andrzej Pietrasiewicz wrote:
> > > The new version accepts a struct describing deviations from standard =
way of
> > > doing the size checks. The caller must provide the respective values.
> > > =

> > > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> > > ---
> > >   drivers/gpu/drm/drm_gem_framebuffer_helper.c | 47 ++++++++++++++++-=
---
> > >   include/drm/drm_gem_framebuffer_helper.h     | 16 +++++++
> > >   2 files changed, 55 insertions(+), 8 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/g=
pu/drm/drm_gem_framebuffer_helper.c
> > > index 787edb9a916b..4201dc1f32a5 100644
> > > --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> > > +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> > > @@ -201,8 +201,9 @@ int drm_gem_fb_lookup(struct drm_device *dev,
> > >   EXPORT_SYMBOL_GPL(drm_gem_fb_lookup);
> > >   /**
> > > - * drm_gem_fb_size_check() - Helper function for use in
> > > - *			     &drm_mode_config_funcs.fb_create implementations
> > > + * drm_gem_fb_size_check_special() - Helper function for use in
> > > + *				     &drm_mode_config_funcs.fb_create
> > > + *				     implementations
> > >    * @dev: DRM device
> > >    * @mode_cmd: Metadata from the userspace framebuffer creation requ=
est
> > >    *
> > > @@ -212,9 +213,10 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_lookup);
> > >    * Returns:
> > >    * Zero on success or a negative error code on failure.
> > >    */
> > > -int drm_gem_fb_size_check(struct drm_device *dev,
> > > -			  const struct drm_mode_fb_cmd2 *mode_cmd,
> > > -			  struct drm_gem_object **objs)
> > > +int drm_gem_fb_size_check_special(struct drm_device *dev,
> > =

> > How about name it to drm_gem_fb_custom_size_check()
> > =

> > > +				  const struct drm_mode_fb_cmd2 *mode_cmd,
> > > +				  const struct drm_size_check *check,
> > > +				  struct drm_gem_object **objs)
> > >   {
> > >   	const struct drm_format_info *info;
> > >   	int i;
> > > @@ -227,10 +229,19 @@ int drm_gem_fb_size_check(struct drm_device *de=
v,
> > >   		unsigned int width =3D mode_cmd->width / (i ? info->hsub : 1);
> > >   		unsigned int height =3D mode_cmd->height / (i ? info->vsub : 1);
> > >   		unsigned int min_size;
> > > +		u32 pitch =3D mode_cmd->pitches[i];
> > > +
> > > +		if (check && check->use_pitch_multiplier)
> > > +			if ((pitch * check->pitch_multiplier[i]) %
> > > +			    check->pitch_modulo)
> > > +				return -EINVAL;
> > > -		min_size =3D (height - 1) * mode_cmd->pitches[i]
> > > -			 + drm_format_info_min_pitch(info, i, width)
> > > -			 + mode_cmd->offsets[i];
> > > +		if (check && check->use_min_size)
> > > +			min_size =3D check->min_size[i];
> > > +		else
> > > +			min_size =3D (height - 1) * pitch
> > > +				 + drm_format_info_min_pitch(info, i, width)
> > > +				 + mode_cmd->offsets[i];
> > >   		if (objs[i]->size < min_size)
> > >   			return -EINVAL;
> > > @@ -239,6 +250,26 @@ int drm_gem_fb_size_check(struct drm_device *dev,
> > >   	return 0;
> > >   }
> > > +EXPORT_SYMBOL_GPL(drm_gem_fb_size_check_special);
> > > +
> > > +/**
> > > + * drm_gem_fb_size_check() - Helper function for use in
> > > + *			     &drm_mode_config_funcs.fb_create implementations
> > > + * @dev: DRM device
> > > + * @mode_cmd: Metadata from the userspace framebuffer creation reque=
st
> > > + *
> > > + * This function can be used to verify buffer sizes for all planes.
> > > + * It is caller's responsibility to put the objects on failure.
> > > + *
> > > + * Returns:
> > > + * Zero on success or a negative error code on failure.
> > > + */
> > > +int drm_gem_fb_size_check(struct drm_device *dev,
> > > +			  const struct drm_mode_fb_cmd2 *mode_cmd,
> > > +			  struct drm_gem_object **objs)
> > > +{
> > > +	return drm_gem_fb_size_check_special(dev, mode_cmd, NULL, objs);
> > > +}
> > >   EXPORT_SYMBOL_GPL(drm_gem_fb_size_check);
> > >   /**
> > > diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/d=
rm_gem_framebuffer_helper.h
> > > index c85d4b152e91..74304a268694 100644
> > > --- a/include/drm/drm_gem_framebuffer_helper.h
> > > +++ b/include/drm/drm_gem_framebuffer_helper.h
> > > @@ -11,6 +11,18 @@ struct drm_mode_fb_cmd2;
> > >   struct drm_plane;
> > >   struct drm_plane_state;
> > >   struct drm_simple_display_pipe;
> > > +struct drm_size_check;
> > > +
> > > +/**
> > > + * struct drm_size_check - Description of special requirements for s=
ize checks.
> > > + */
> > > +struct drm_size_check {
> > > +	unsigned int min_size[4];
> > > +	bool use_min_size;
> > > +	u32 pitch_multiplier[4];
> > > +	u32 pitch_modulo;
> > > +	bool use_pitch_multiplier;
> > > +};
> > >   struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *f=
b,
> > >   					  unsigned int plane);
> > > @@ -32,6 +44,10 @@ int drm_gem_fb_lookup(struct drm_device *dev,
> > >   		      struct drm_file *file,
> > >   		      const struct drm_mode_fb_cmd2 *mode_cmd,
> > >   		      struct drm_gem_object **objs);
> > > +int drm_gem_fb_size_check_special(struct drm_device *dev,
> > > +				  const struct drm_mode_fb_cmd2 *mode_cmd,
> > > +				  const struct drm_size_check *check,
> > > +				  struct drm_gem_object **objs);
> > >   int drm_gem_fb_size_check(struct drm_device *dev,
> > >   			  const struct drm_mode_fb_cmd2 *mode_cmd,
> > >   			  struct drm_gem_object **objs);
> > =

> > For this common case can we just define it as a MACRO, or a inline
> > func here in this header.
> > =

> > Thanks
> > James
> > =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
