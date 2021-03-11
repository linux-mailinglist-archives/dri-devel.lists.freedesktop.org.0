Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF30B336BA0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 06:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D82E6EAB9;
	Thu, 11 Mar 2021 05:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8C26EAB9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 05:28:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXW4EfwjV69HLssAl2fZTMWaFt/NstGzJZK/LtrWsN5RJUsQmf37SAMFr+nKBYyIIt8z7fzb7Ozk9ukdbNX/mDPHteK2AfVyjWGtG9tijtpk88m6DOPPqMlYpawWhOrru/QqQjQX36kN8LPlM2gnm53dNRXy+PePRGb9tigqaMNOPCei++9ndjdmYek97xbafb2AK0aFhK7uJ61Wc/sLHeF0Txe8rvMp4LdOTaTiS0+sNhadYP6agRUuCxe3KwqJd09UO8iP8uJRUFpsR2cBYSyVwxqAtow3cmPE1xq1B0zYc8sKn7ouAf4etK5dzjc5DWiX2TO0tcH0nnCXGUjqXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0+SYKOtNXr7S6p/6bLcenvHOmpp+rbSBqZRo62KGog=;
 b=UCEX/fDiaiD0+QaijkVsFPZAaSQP8DT6pLx1TOWakMsyWxPWArCZfaiNrJwv9w4KpUDq/CGs4EycYCWQIlttGC7jEo1c1MwvEKmX71LUaP8zK1DYttXD2p+bciJW8gKqe1RxvlcDVJjl164BSwXUYBKIXAWy2LwWOnqaS6Vf7QS9fFP9Rdv3nwz9tvqJr89LPZI1930xcl+muBqE9I8358UQkrA9xVkH2pTpt7n+rVCW4Lmyeq+k4/WXu7k2GZst/qlLWSjMtADMCJXQB7Izvyk4ZVV9qWzgC4TTZJM/skmOJM8To3oUQptxUC9IK7+ZKUtfxtcfJ0qPojKErEB8dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0+SYKOtNXr7S6p/6bLcenvHOmpp+rbSBqZRo62KGog=;
 b=f/E4BoR6hjYhk/cYo+ka3jlLdM6HKUylaFZr6pmFBHLQkkJpDggnjekkOgtBtT8MaITfK0cE6YSeD64gdNX8AItU4V6HXie2p9AckZgJ87ozcvwXs34byzs1zhyX6g5HCMSxRLLuo13FT+1clEae64pJFcrE7+6x2bxUzgBXT6Q=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4592.eurprd04.prod.outlook.com (2603:10a6:803:75::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Thu, 11 Mar
 2021 05:28:29 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.028; Thu, 11 Mar 2021
 05:28:29 +0000
Message-ID: <d44708530dd0ef1d758dee6651779679a22c3dff.camel@nxp.com>
Subject: Re: [PATCH v5 02/14] media: docs: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
From: Liu Ying <victor.liu@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 11 Mar 2021 13:26:51 +0800
In-Reply-To: <YEjIf//ouB1wZss3@pendragon.ideasonboard.com>
References: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
 <1615370138-5673-3-git-send-email-victor.liu@nxp.com>
 <YEjIf//ouB1wZss3@pendragon.ideasonboard.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0205.apcprd02.prod.outlook.com
 (2603:1096:201:20::17) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 HK2PR02CA0205.apcprd02.prod.outlook.com (2603:1096:201:20::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 05:28:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 645dcb27-d1d8-449e-8909-08d8e44e8076
X-MS-TrafficTypeDiagnostic: VI1PR04MB4592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB45920F162DA0D440F2743BD098909@VI1PR04MB4592.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LrjgH4xqVhQfp5k7NQAOVKbfg6wdckzcdqC3fwSFvGECvi3aksv4xy+Jquq0GjuOvrISwclnLwLOam+tJzRFMa8wO/Ix5wn3Yv7s/MLVf8d3a8VIxSqigar+uqOpRwp+TF3uxeBUR0gLSAGLhZpKuyWuN7SdBzF10wZ2V+MMY8KZfsM/QFzXbDIMOGHoABhR2pn/pLdjfqXDXx4jh9L81xv7CM2zhuvgq3Lh/DXNovCUcP8SiTAvlFD/jZX/eFN0dRTa5Gm0R2U4dxiEMgBKExy78QfyyrVtA75TN7DVHZ+uvjhdq7vJYg3w9oiUarhisJ7aP5yTYpMBIVURcZxLGaY0npia8v6/j+0aw0ZMt2h8BwOgZavpfNEZ2zJSu69Sl+tqYQA6s/+Uk++a+ZDHd6Pbc/dtPFMjRMASLSd1lRrrITIFFO0tvYRd0Kg9BhMXujlFx/6/B9dJFFwTqaKNO5JyvyCSAO6itNPs3NIpNfPulfXNWc1kGWoFd7bPPEx9Db2ygZxO6S+1qeu+amxScA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(2906002)(7416002)(316002)(6916009)(478600001)(66946007)(5660300002)(4326008)(86362001)(16526019)(186003)(956004)(52116002)(66476007)(66556008)(6666004)(26005)(36756003)(6506007)(6512007)(2616005)(8676002)(8936002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Rk1VSFFpcW1TWXpSU2RZQTRsaHo0S0ZJQzdweG44NDE4YVpyZU5kMUVFRlVj?=
 =?utf-8?B?U0FXWkFiU1pJaUNHNGdsZEV4M2x1dWVHSndPRkowZzFFaWpXVWM1K2Ribi9B?=
 =?utf-8?B?cHdzamJSTHQ3SnN3bmR4NGV0NElOV29aRXJLb00wL2k4Mk5McXk2K05PMnVo?=
 =?utf-8?B?eW12b2xteW9CSGZQWlNzSERmSUthWjhnT2p4c29OMGpDcngybmlXSlowMlRX?=
 =?utf-8?B?b3JHRUZ1djNoUXFtQWthRWFzdzNnQ3RtOFlUeURuTTZNQ2c3cTFVSnFwTGJX?=
 =?utf-8?B?NTJGMjloWTZFVGdRaG1PRWpVRjN2VVp2Q0VLcGNZclE4N1p1d3I3UW95Nk5w?=
 =?utf-8?B?WUJqQXJNTnA3M3dTZE9hbWpsay9MVEM1cWZocU9URmszY3l5Wk54NjVYT24z?=
 =?utf-8?B?MUVMZXRVRWpQZVlhMXVMYUNPQ1hvcWJuaGlIbi95VFArcWw3OTJETFdhWHVr?=
 =?utf-8?B?US9tZ2duWWR5YWdUQzBCaFAvUWE1Uk5sVFhrUG95WEk3KzhKbFRRbjQrWFJ5?=
 =?utf-8?B?TVVMN3VVbkdGNmZiYitPd2pWTU4zYXdoenVxb0pqalZEeFdWYnppTkNYR2xl?=
 =?utf-8?B?Nkd3WVQxNUQrb3YrTFhydzdJWDhqVFAxdUk1cW93OXJSLzBHUEl1Z0Z6bzJh?=
 =?utf-8?B?UHZtQW51TFl3aEZpUmZnblZJaUlqYnh3eENPalFEZkR3WHphMmhQbldnbEI1?=
 =?utf-8?B?U25DeXd5eUpNZjl1dG1uait3ZkhXeng1ZmJZOXhGeHNQVjNkZmUvWTFlVVc0?=
 =?utf-8?B?UjQrbmdYaUkyN0pFZ2JPZ0dQaUlSNm0ydmJGSzlDUm83QnUraXErM2Z0VnFp?=
 =?utf-8?B?dGpxY20xa1VlSlFNcUhiNGVHM2dQVCs5b0dIdk5EbldOdEgxcVdUd2piSGxK?=
 =?utf-8?B?aGFRSllVQXVNN3hSVHptT3k1YXloRlJLTVhmS2Mya0FKUHdCdUZoKzE3ZEVD?=
 =?utf-8?B?QTdNQldEeGVvT3FWbC82VlZ6TDdCeVlrampWeEI4bXVFTUVoNUx6UHRrU1pm?=
 =?utf-8?B?bHM0c0x1NXhYVUdKaUcrNzVqT0pHM29pMmR0WHpYOS9pKzNuZ0R3RWk4OWs4?=
 =?utf-8?B?ZVYraVBxQ1dLdndhclUyb1J4dHZDK0FJczZhbTZZeDFxRWJiZCs4enpmY2pF?=
 =?utf-8?B?S1VWcStCUExFdFNSL2twcVJzQ0lsVzNzd3djaU5aazZub0FWRUdzalhGV29i?=
 =?utf-8?B?OTduK2dyRy9QVTQ2NVo1SVY2dlVUSGpMZ2pRSmVrUEtNL2lqNUlLeGdXcjNR?=
 =?utf-8?B?eFhQYXU5TWU0bTZyRmlEMVNFOUFBSTVCWFFyR05RSUxKbnVMSjNtV0JJcmhY?=
 =?utf-8?B?VUNyN1VuM0lia2pGcXJ5MElkRG5tT3lUNjlBT0Z6d0VYNUlyWDh4aksxcVhE?=
 =?utf-8?B?Z1NjVGVJak5RSENVOHBDcGh3NGhjOEU3b0JZY1hxbFBWdmlsS255NXhqM0ZO?=
 =?utf-8?B?NHVuMktWbFRNNVR4cjJqZ29QODB1bHBnbHYrVmFIam5pVFI1dE9qYnFZNlQ0?=
 =?utf-8?B?VG1Uazg2ZjR6RFpRdHQzc1VtOFNRWHhkUmpNYWNEKzVrZ2wyb1F3a3Y0aWNG?=
 =?utf-8?B?RTNtVjVOaDh3QXZWWENTRUdDdzRUUkVWbzNrM096S1k3WGwwclNyREFTaWRq?=
 =?utf-8?B?STEzeWtTaDlWSFhmY2xySnJ3NVAxR25leDg3cDZvc2E0U0MwZnU1OGh5ZGlX?=
 =?utf-8?B?RVdmNlJHdmJoeVdaRkpLZGNzeFJwdFhObWpkWi9GOFFidkp1OWVXQ3dYZXdv?=
 =?utf-8?Q?f02xoWphNkiT6Z2gncDM+DXJDXK8v7KchyzkNSB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 645dcb27-d1d8-449e-8909-08d8e44e8076
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 05:28:29.1186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2awz7Gi9qSVq1nmkLS+/BHgynPdTM6pjXfZR1w1bamdypGuyczLclGUn0iUvdbPIEjN+W+tbTgR+BBCEutWvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4592
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, lee.jones@linaro.org, kishon@ti.com, linux-imx@nxp.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, jonas@kwiboo.se,
 s.hauer@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, jernej.skrabec@siol.net,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, vkoul@kernel.org,
 kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, 2021-03-10 at 15:24 +0200, Laurent Pinchart wrote:
> Hi Liu,
> 
> Thank you for the patch.

Thanks for your review.

> 
> On Wed, Mar 10, 2021 at 05:55:26PM +0800, Liu Ying wrote:
> > This patch adds documentations for RGB666_1X30_CPADLO, RGB888_1X30_CPADLO,
> > RGB666_1X36_CPADLO and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp
> > pixel combiner.  The RGB pixels with padding low per component are
> > transmitted on a 30-bit input bus(10-bit per component) from a display
> > controller or a 36-bit output bus(12-bit per component) to a pixel link.
> > 
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v4->v5:
> > * Add Robert's R-b tag.
> > 
> > v3->v4:
> > * No change.
> > 
> > v2->v3:
> > * No change.
> > 
> > v1->v2:
> > * No change.
> > 
> >  .../userspace-api/media/v4l/subdev-formats.rst     | 156 +++++++++++++++++++++
> >  1 file changed, 156 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > index 7f16cbe..201c16d 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > @@ -1488,6 +1488,80 @@ The following tables list existing packed RGB formats.
> >        - b\ :sub:`2`
> >        - b\ :sub:`1`
> >        - b\ :sub:`0`
> > +    * .. _MEDIA-BUS-FMT-RGB666-1X30-CPADLO:
> > +
> > +      - MEDIA_BUS_FMT_RGB666_1X30-CPADLO
> > +      - 0x101e
> > +      -
> > +      - 0
> > +      - 0
> 
> I count 32 bits here. Should these two 0 be replaced by spaces ? Same
> for MEDIA_BUS_FMT_RGB888_1X30-CPADLO.

Indeed, these two 0 should be spaces.  Will fix them in next version.

I see the in-tree MEDIA_BUS_FMT_RGB101010_1X30 has the same issue.
I can send another patch to fix it.

Regards,
Liu Ying

> 
> With this fixed,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > +      - r\ :sub:`5`
> > +      - r\ :sub:`4`
> > +      - r\ :sub:`3`
> > +      - r\ :sub:`2`
> > +      - r\ :sub:`1`
> > +      - r\ :sub:`0`
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - g\ :sub:`5`
> > +      - g\ :sub:`4`
> > +      - g\ :sub:`3`
> > +      - g\ :sub:`2`
> > +      - g\ :sub:`1`
> > +      - g\ :sub:`0`
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - b\ :sub:`5`
> > +      - b\ :sub:`4`
> > +      - b\ :sub:`3`
> > +      - b\ :sub:`2`
> > +      - b\ :sub:`1`
> > +      - b\ :sub:`0`
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +    * .. _MEDIA-BUS-FMT-RGB888-1X30-CPADLO:
> > +
> > +      - MEDIA_BUS_FMT_RGB888_1X30-CPADLO
> > +      - 0x101f
> > +      -
> > +      - 0
> > +      - 0
> > +      - r\ :sub:`7`
> > +      - r\ :sub:`6`
> > +      - r\ :sub:`5`
> > +      - r\ :sub:`4`
> > +      - r\ :sub:`3`
> > +      - r\ :sub:`2`
> > +      - r\ :sub:`1`
> > +      - r\ :sub:`0`
> > +      - 0
> > +      - 0
> > +      - g\ :sub:`7`
> > +      - g\ :sub:`6`
> > +      - g\ :sub:`5`
> > +      - g\ :sub:`4`
> > +      - g\ :sub:`3`
> > +      - g\ :sub:`2`
> > +      - g\ :sub:`1`
> > +      - g\ :sub:`0`
> > +      - 0
> > +      - 0
> > +      - b\ :sub:`7`
> > +      - b\ :sub:`6`
> > +      - b\ :sub:`5`
> > +      - b\ :sub:`4`
> > +      - b\ :sub:`3`
> > +      - b\ :sub:`2`
> > +      - b\ :sub:`1`
> > +      - b\ :sub:`0`
> > +      - 0
> > +      - 0
> >      * .. _MEDIA-BUS-FMT-ARGB888-1X32:
> >  
> >        - MEDIA_BUS_FMT_ARGB888_1X32
> > @@ -1665,6 +1739,88 @@ The following table list existing packed 36bit wide RGB formats.
> >        - 2
> >        - 1
> >        - 0
> > +    * .. _MEDIA-BUS-FMT-RGB666-1X36-CPADLO:
> > +
> > +      - MEDIA_BUS_FMT_RGB666_1X36_CPADLO
> > +      - 0x1020
> > +      -
> > +      - r\ :sub:`5`
> > +      - r\ :sub:`4`
> > +      - r\ :sub:`3`
> > +      - r\ :sub:`2`
> > +      - r\ :sub:`1`
> > +      - r\ :sub:`0`
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - g\ :sub:`5`
> > +      - g\ :sub:`4`
> > +      - g\ :sub:`3`
> > +      - g\ :sub:`2`
> > +      - g\ :sub:`1`
> > +      - g\ :sub:`0`
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - b\ :sub:`5`
> > +      - b\ :sub:`4`
> > +      - b\ :sub:`3`
> > +      - b\ :sub:`2`
> > +      - b\ :sub:`1`
> > +      - b\ :sub:`0`
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +    * .. _MEDIA-BUS-FMT-RGB888-1X36-CPADLO:
> > +
> > +      - MEDIA_BUS_FMT_RGB888_1X36_CPADLO
> > +      - 0x1021
> > +      -
> > +      - r\ :sub:`7`
> > +      - r\ :sub:`6`
> > +      - r\ :sub:`5`
> > +      - r\ :sub:`4`
> > +      - r\ :sub:`3`
> > +      - r\ :sub:`2`
> > +      - r\ :sub:`1`
> > +      - r\ :sub:`0`
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - g\ :sub:`7`
> > +      - g\ :sub:`6`
> > +      - g\ :sub:`5`
> > +      - g\ :sub:`4`
> > +      - g\ :sub:`3`
> > +      - g\ :sub:`2`
> > +      - g\ :sub:`1`
> > +      - g\ :sub:`0`
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - b\ :sub:`7`
> > +      - b\ :sub:`6`
> > +      - b\ :sub:`5`
> > +      - b\ :sub:`4`
> > +      - b\ :sub:`3`
> > +      - b\ :sub:`2`
> > +      - b\ :sub:`1`
> > +      - b\ :sub:`0`
> > +      - 0
> > +      - 0
> > +      - 0
> > +      - 0
> >      * .. _MEDIA-BUS-FMT-RGB121212-1X36:
> >  
> >        - MEDIA_BUS_FMT_RGB121212_1X36

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
