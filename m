Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D2B285DD3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 13:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB2E6E0A1;
	Wed,  7 Oct 2020 11:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728046E0A1
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 11:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ps3ELCrVTLAP80aZ1X+PNliYGY47NA595zJk5ZpTQ7g=;
 b=Aa5zCKt0+kJd+coViK764sE/rF+D14R0loa+2ZzaCWbghpUG1goEOo3SiMHlhxQEUOyFP7G4do+8eJ/Kvpnik7rK/ylUZOZMeSBBxtgXe3g4wtqpiCL/EYcaqJEBGMOVGmzKw5LCSU/rRGSR7mDnZ0e4XOE/KxSG/wSZF2PaXJ4=
Received: from DB6PR0501CA0046.eurprd05.prod.outlook.com (2603:10a6:4:67::32)
 by AM0PR08MB3875.eurprd08.prod.outlook.com (2603:10a6:208:104::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Wed, 7 Oct
 2020 11:07:43 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::82) by DB6PR0501CA0046.outlook.office365.com
 (2603:10a6:4:67::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Wed, 7 Oct 2020 11:07:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Wed, 7 Oct 2020 11:07:43 +0000
Received: ("Tessian outbound bac899b43a54:v64");
 Wed, 07 Oct 2020 11:07:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0dfa2ac6042014f5
X-CR-MTA-TID: 64aa7808
Received: from 1863444d075c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A3D467DD-60D3-4597-98F2-AF42D5411C97.1; 
 Wed, 07 Oct 2020 11:07:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1863444d075c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Oct 2020 11:07:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMo87+wQd6pW/homA+0Im2Io6L2rLl2CWOIP18TIis75dvtQXExHliaTJlUloQyfa8UjWhXB9ozFsn3txlYaPEsncAvHPZ6wkgrrWGGbXdBSAh33+0oe7n6OO0DUQ4v8A41cxAXq8rap39p8BqLa7ALDXtLWd57sTYfiEGonW4O4KRjBWum4VHF/RJ2rS/p+mhaycJnp6mlaWYAjffbwHpHmgyecdA6k1m6jTQ6LXe1a58D/9u7+Fy41ZTa3eKTmD7i9V4+xIl9bjG3j1yV33EoX9fdfUuQH5C4M2xrS4uQsstZP7BRe5PHR7si5ggqSLUae9qf1/S4Jk0TCuBd7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ps3ELCrVTLAP80aZ1X+PNliYGY47NA595zJk5ZpTQ7g=;
 b=S6zBjyMv/jnvtduCC/tOXnbafNSTKD4tBLK54VdN8frLCpQv3et/NGFbuisEc5hgibxjv5pvbMu951CySxVxWw5ky2oT+G8KPx8FzhIg60Q5UlRF+daAeHIkpZzJLfFW/emna2a92GGWNXbrVqx9Jq4pbSi6Q1QybVhWvCieiQa2RjDCEiaymEtlV0dXMLIr47wRVB2hAz4gSCcbNl9rQI/I09lKRU0eXDeFkYawRQpNB3NZIwRKxvAG9OvMNVc6iJb33ujpo89uTb12tNVjQrm1KD9nkH8Uj882EV2Yfkk+PAPa0HITPHV6blik1j/4wqxJIsXQm1+7W8ZovYGAgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ps3ELCrVTLAP80aZ1X+PNliYGY47NA595zJk5ZpTQ7g=;
 b=Aa5zCKt0+kJd+coViK764sE/rF+D14R0loa+2ZzaCWbghpUG1goEOo3SiMHlhxQEUOyFP7G4do+8eJ/Kvpnik7rK/ylUZOZMeSBBxtgXe3g4wtqpiCL/EYcaqJEBGMOVGmzKw5LCSU/rRGSR7mDnZ0e4XOE/KxSG/wSZF2PaXJ4=
Authentication-Results-Original: linux.intel.com; dkim=none (message not
 signed) header.d=none;linux.intel.com; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3653.eurprd08.prod.outlook.com (2603:10a6:20b:4c::22)
 by AS8PR08MB6136.eurprd08.prod.outlook.com (2603:10a6:20b:292::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 7 Oct
 2020 11:07:37 +0000
Received: from AM6PR08MB3653.eurprd08.prod.outlook.com
 ([fe80::d0be:76bf:3d2f:8c56]) by AM6PR08MB3653.eurprd08.prod.outlook.com
 ([fe80::d0be:76bf:3d2f:8c56%6]) with mapi id 15.20.3433.044; Wed, 7 Oct 2020
 11:07:37 +0000
Date: Wed, 7 Oct 2020 12:07:36 +0100
From: Matteo Franchin <matteo.franchin@arm.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/fourcc: Add AXBXGXRX106106106106 format
Message-ID: <20201007110736.GA13842@lagrange>
References: <20201007092725.13300-1-matteo.franchin@arm.com>
 <20201007103539.GA6112@intel.com>
Content-Disposition: inline
In-Reply-To: <20201007103539.GA6112@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [217.140.106.49]
X-ClientProxiedBy: LO2P265CA0406.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::34) To AM6PR08MB3653.eurprd08.prod.outlook.com
 (2603:10a6:20b:4c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (217.140.106.49) by
 LO2P265CA0406.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.22 via Frontend Transport; Wed, 7 Oct 2020 11:07:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c60092b2-7341-4e2d-05a9-08d86ab13702
X-MS-TrafficTypeDiagnostic: AS8PR08MB6136:|AM0PR08MB3875:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3875A6EE5DC36E2B7765E250F40A0@AM0PR08MB3875.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: pGIlxItK39Un4KJpESNrYr/IiOF4vElSUIUWHGu2R8+vF0r5L7ldHhLosj8DRdEv56qIcI1xsJI+YeOcjwXa149OwKUe0BVgT1pLxABtdGij+6DkLC0AwGKdxBad1oeoeeBYkgGpRGFod/5hm4/wjT2LOqidv31tRff8fT0M3J9fb8i405U+5DwFKBQDxLdLlkxMr4r9TxMoRcwGS11CmKSRYDlqaUQqYyPyQTbOXuOurPmQyQOavReNn8MO4jkt8HsJPQEyuNQd8sVFZkkWSTXVjmMF1pTg2SIdUVuPDBmmfH7X6JgF9RQBK96kYUT12qiQIzziBmALOQJ1J6oenyPNzuBbw/XJE73gMiLIVXA=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3653.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(396003)(39850400004)(376002)(346002)(136003)(366004)(5660300002)(6486002)(478600001)(33656002)(66946007)(66556008)(4326008)(6916009)(66476007)(44832011)(2906002)(52116002)(16526019)(26005)(6496006)(186003)(316002)(956004)(86362001)(9686003)(8676002)(1076003)(8936002)(33716001)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: JFFAAzOq5ZuFX58vPuTEMiEvv5NqCbYt9pJjDUU/XS61V9HNg8dYLco9grVdI5/gzZqgAvaCnxh+/P/dZx/IFtU55lucVs688U9tusUqecqwQjXzBI6pR3a7KMTom4Mj3YjxcTTmQUbdhGkA22tOCDVhlWml6zTcTBhS+Zr6Vg1mgmDKjQyLHnfHeuqIq9PDY+NxyFa/JWEijtYCgDWx5ilhEyd/yrkaW2DGZRP27FGlhV1KBkdeip6CQqc3peXl7cxwYSnUKd1eHwHDMl48znZPjnG8ersGzC/WNzPxc6fXzIGuM/nvATtJWmAQjcp5TyYWt3bBZLFEdBK86GB9dQUqn8SZXlXtFZmLRHodQdAtbYabJBfLmqOxRqeXurUbrqoQwJk0GDK1HQh4UesiJyXX2U843L1tqZH/freiQ8DtlfZOE/RmBKAj0p13VoMph4ZigpZ5qHMVA+sBVKbBlhZROxKnj9+S5HaK1tPrOxT47ahHxzxSoN3yeUyDLURkyN5Kl+izPcOHgs/A19j+knrkzqp8C3nfOALn8X8wGJRNXrkrFT8Z7QW3BAmNmaXrZ7t33L1VUVBpv+U9VDsjHfI9CEQycR+lShjWIeNvIx9QjtGq7+asBtRtf0R4b1br/22jxjzSMCqiNFkjC2B4lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6136
Original-Authentication-Results: linux.intel.com;
 dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 20154023-e1fe-45ef-fee8-08d86ab1330d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NdmHPjUe7OCNRDqKipSGGWG0UR2B5GlnJjmg7nyZ9ACGSXLkvHCw/gsCJOWxYtXXPmsX464MlD9rdplvI1nRl0+mA/zBglfNOW6yOPkiYqgTnkpwr78uA9jfMJGTOSfSXB38BZDubNis++btD8c3C0duOZqwv0mAXwP1LkPI7ATxWeKyIOAoKoZRelBsoB6Zl1MG2ArhFgctUGpfOH7bnWgOqo6kylyhtw5g0QTSaM/wep1APSYgEenRcYI1qZaaxtrJhl91SH9ZLTSHyP+oWRHTbrjujB8lL19iIXp8zMrI1oC3IaZOx0dDsWq/p9VH7FZ1ooPs8X3j4dtfvoz8jQicKlomJS7UGu17qzJk8gAmWf+/oUCZvkLwANS7cdPikUGJvhppH5VISOCThDLMl6DhP3xgnd5auFJMu9TTuroRaNuYnQ7myDFDkqUVXGcs
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(7916004)(4636009)(346002)(39850400004)(376002)(396003)(136003)(46966005)(966005)(44832011)(9686003)(2906002)(86362001)(82310400003)(336012)(316002)(4326008)(478600001)(956004)(5660300002)(8936002)(356005)(186003)(16526019)(1076003)(70586007)(8676002)(6496006)(26005)(6486002)(82740400003)(33656002)(47076004)(6862004)(33716001)(81166007)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 11:07:43.7480 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c60092b2-7341-4e2d-05a9-08d86ab13702
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3875
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, nd@arm.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,

On Wed, Oct 07, 2020 at 01:35:39PM +0300, Ville Syrj=EF=BF=BDl=EF=BF=BD wro=
te:
> On Wed, Oct 07, 2020 at 10:27:25AM +0100, Matteo Franchin wrote:
> > Add ABGR format with 10-bit components packed in 64-bit per pixel.
> > This format can be used to handle
> > VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16 on little-endian
> > architectures.
> > =

> > Signed-off-by: Matteo Franchin <matteo.franchin@arm.com>
> > ---
> >  drivers/gpu/drm/drm_fourcc.c  | 1 +
> >  include/uapi/drm/drm_fourcc.h | 7 +++++++
> >  2 files changed, 8 insertions(+)
> > =

> > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> > index 722c7ebe4e88..bba03fcb016d 100644
> > --- a/drivers/gpu/drm/drm_fourcc.c
> > +++ b/drivers/gpu/drm/drm_fourcc.c
> > @@ -202,6 +202,7 @@ const struct drm_format_info *__drm_format_info(u32=
 format)
> >  		{ .format =3D DRM_FORMAT_XBGR16161616F,	.depth =3D 0,  .num_planes =
=3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
> >  		{ .format =3D DRM_FORMAT_ARGB16161616F,	.depth =3D 0,  .num_planes =
=3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true =
},
> >  		{ .format =3D DRM_FORMAT_ABGR16161616F,	.depth =3D 0,  .num_planes =
=3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true =
},
> > +		{ .format =3D DRM_FORMAT_AXBXGXRX106106106106,	.depth =3D 0,  .num_p=
lanes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D=
 true },
> >  		{ .format =3D DRM_FORMAT_RGB888_A8,	.depth =3D 32, .num_planes =3D 2=
, .cpp =3D { 3, 1, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
> >  		{ .format =3D DRM_FORMAT_BGR888_A8,	.depth =3D 32, .num_planes =3D 2=
, .cpp =3D { 3, 1, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
> >  		{ .format =3D DRM_FORMAT_XRGB8888_A8,	.depth =3D 32, .num_planes =3D=
 2, .cpp =3D { 4, 1, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourc=
c.h
> > index 82f327801267..76eedba52b77 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -155,6 +155,13 @@ extern "C" {
> >  #define DRM_FORMAT_ARGB16161616F fourcc_code('A', 'R', '4', 'H') /* [6=
3:0] A:R:G:B 16:16:16:16 little endian */
> >  #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [6=
3:0] A:B:G:R 16:16:16:16 little endian */
> >  =

> > +/*
> > + * RGBA format with 10-bit components packed in 64-bit per pixel, with=
 6 bits
> > + * of unused padding per component:
> > + * [63:0] A:x:B:x:G:x:R:x 10:6:10:6:10:6:10:6 little endian
> =

> I think we usually put that last bit at the end of the fourcc define.
> In theory it makes grepping a bit nicer. The exceptions are all planar
> formats where each plane can have different component packing.

Makes sense, I'll change the patch as suggested.

Thanks,
Matteo

> =

> > + */
> > +#define DRM_FORMAT_AXBXGXRX106106106106 fourcc_code('A', 'B', '1', '0')
> > +
> >  /* packed YCbCr */
> >  #define DRM_FORMAT_YUYV		fourcc_code('Y', 'U', 'Y', 'V') /* [31:0] Cr0=
:Y1:Cb0:Y0 8:8:8:8 little endian */
> >  #define DRM_FORMAT_YVYU		fourcc_code('Y', 'V', 'Y', 'U') /* [31:0] Cb0=
:Y1:Cr0:Y0 8:8:8:8 little endian */
> > -- =

> > 2.17.1
> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

> -- =

> Ville Syrj=EF=BF=BDl=EF=BF=BD
> Intel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
