Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 175F3253E4F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEAF6EB2E;
	Thu, 27 Aug 2020 06:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2043 seconds by postgrey-1.36 at gabe;
 Wed, 26 Aug 2020 16:12:59 UTC
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5DA6E0ED
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 16:12:59 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07QFWCR8016616; Wed, 26 Aug 2020 08:38:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=Iks/89sCLZb1I39kpAZAwA+Wq9U5osJsBx1Fj5mdZeE=;
 b=ZtMzBKYRgk3uVwHpYPVe9otyGVdNTPq3fhF61cgTR0ouneralnEJ7quyvMO1g28stRgl
 qiT6OvwLSfUqpRUfHH4nQZ6PqQXqFer/1v85q6TnAXo49OybXbTZSgq4hzGjSecvEfhx
 0F2EFShLourwLVTOnobmKQPhexMeu6Yq0Rabj3b3tKWRaYKsShKfRK9Or5IOxTjdvl2S
 YyBcHH+keXgXaoPnC8HAYYrFh+HBz0vatZMiBfsFHjpTTlkC5PLTtYIEEh3/U6iXRL9L
 mT/ihLNNQMuIo2UUv+K6H/aJffHrlM7FNIzAR3jggU0ErztNeuNxMMJx/fteTzSjDGZK wQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by mx0a-0014ca01.pphosted.com with ESMTP id 332ywvynfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 08:38:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncAbJVrM+6v9WQ7SttM0Xlf7mx4QI2BLVJnh6vtubTHwTRgayqlR0fbuMTuMW0d1qR/OQ8UNySJX784ybMP3aKA43GpKXh9LOgImmJNSIQt2Pu4ha7lJrdWWRg099VEXWahaSW8OGo5ihGREWwg+NlHyFi8KNh9gieRdeJ5UBYUBcJQih05N/eXMJSWiS5njE0I5tnr+HUIFtxMRB3RKrArlPHqVSZtZsCe/zu2v3Tx2IQBFCD6KOh8JWPimWyWTAIzETPrit8psJmMefZIb9xBk1k6SkptpULByC1U/LntcTYq4dWtQD7KNWxLhiK8/8ND9VBzPG57Vtim85un3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iks/89sCLZb1I39kpAZAwA+Wq9U5osJsBx1Fj5mdZeE=;
 b=dRqq6ZVv9197xo9RpZ7DgBodykiUPkDZZBYnKSXRBsABRZ8bpg5yd0mwqNb6WVoSWQcmRMuf7yvWp08f80bg8EP8Xl1sA9zAIVkkkhm4Dxm3MveO6HoeR3upwaikAhGve9yH8Y7RTJCgbBGEC0jhIXhxycGDzZnPf39NlT4RrjEORSoveaTig/RmuECsXSqQqEbqAllIieo7vDS5WnUNzBlbRqtzrSrcbdgScLMld5n+qBx3w30BI14VskHTwnVWep/DHSXij3Nx4dyGg/P/pzqEJAHKH8AiHvPH6G0uZ2qwkkpQ7NsUyOVCmU+RfJmBerHAvoYPENflJ2FsPOsp2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iks/89sCLZb1I39kpAZAwA+Wq9U5osJsBx1Fj5mdZeE=;
 b=INtohWl6+NCvyah4khkGkTRWgJvXLascwPuq24nsEDlIrNYWrsxEnoagV994owA4qfPFkmJNdtdoSARbNHH+Wk7Q5d9u+J/jO0PHV71o0HdIajfIsFcWP4O/kmMrwWj/vwtEqNrmRhzxX1qNkEXy959KlU3P/RtrQaUkpD/UxCU=
Received: from BN7PR07MB5281.namprd07.prod.outlook.com (2603:10b6:408:32::17)
 by BN7PR07MB4276.namprd07.prod.outlook.com (2603:10b6:406:b1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Wed, 26 Aug
 2020 15:38:29 +0000
Received: from BN7PR07MB5281.namprd07.prod.outlook.com
 ([fe80::79be:468f:451:6531]) by BN7PR07MB5281.namprd07.prod.outlook.com
 ([fe80::79be:468f:451:6531%7]) with mapi id 15.20.3305.032; Wed, 26 Aug 2020
 15:38:29 +0000
From: Yuti Suresh Amonkar <yamonkar@cadence.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v6 2/3] drm: bridge: Add support for Cadence MHDP DPI/DP
 bridge
Thread-Topic: [PATCH v6 2/3] drm: bridge: Add support for Cadence MHDP DPI/DP
 bridge
Thread-Index: AQHV7I7OC211GrpNqUqSCe/gQ+wPLqhEDYmAgE8gAICAn94YgIAYiJKQ
Date: Wed, 26 Aug 2020 15:38:27 +0000
Message-ID: <BN7PR07MB52817608C85307214783BEA8D2540@BN7PR07MB5281.namprd07.prod.outlook.com>
References: <1582712579-28504-1-git-send-email-yamonkar@cadence.com>
 <1582712579-28504-3-git-send-email-yamonkar@cadence.com>
 <20200311222053.GE4863@pendragon.ideasonboard.com>
 <BYAPR07MB4792CB8042B3F78B38B37920D2AB0@BYAPR07MB4792.namprd07.prod.outlook.com>
 <20200811000007.GA13513@pendragon.ideasonboard.com>
In-Reply-To: <20200811000007.GA13513@pendragon.ideasonboard.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNceWFtb25rYXJcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0wYWVhMjMzZS1lN2IxLTExZWEtYWU4MS0xNGFiYzUzOWE4NjNcYW1lLXRlc3RcMGFlYTIzM2YtZTdiMS0xMWVhLWFlODEtMTRhYmM1MzlhODYzYm9keS50eHQiIHN6PSIxMTE0NzIiIHQ9IjEzMjQyOTI5NDE3NzA1MzIxMiIgaD0iY2dHVzV3dmVZM0VYb3ZZS3hIUjVQVU4vSE1FPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
x-dg-rorf: true
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=cadence.com;
x-originating-ip: [59.145.174.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af409717-7550-41e2-f827-08d849d614bc
x-ms-traffictypediagnostic: BN7PR07MB4276:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR07MB4276AF88AC1630628E113763D2540@BN7PR07MB4276.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:765;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ucaFyk0IkrBTvFWQYfhHl+arVT615MrY43G+qqDcW3lLGHHclQodBEaing0kFeobgCadzAl0QJOh7M9ryW0jhOeGhsAJtRiqlzddP+cUhOIyu1cj/LMkc/ahLw0A0uuI+Re8ECQjHrZRaT+SirU31K3Y6gS1HGZ8cAOhtuAO49cr/21yU2l3N1M2PCfr4F/RU4R2VyKYIRN7M06D81yIaskRSiVOCSheAn9O8azw1iC24rJpz6yDXtS9MtijhlsIMJBaQHoteirQdXaS5ZBU/D6JbnhboLQRxyAeHUudARj1DdLBo2EmbZyfCSukwjCLaMFBP8EDVr8Ap5dNTQXVybrrKU8pe+fqtyzyRjumUJA3ECFbN6O+65xOSQ0GIejwH9IF+PGM7WC9ClldxEVvL0paoXqBye1ekZid/DLW5GI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR07MB5281.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(36092001)(71200400001)(186003)(66446008)(66556008)(66946007)(76116006)(30864003)(33656002)(8936002)(52536014)(53546011)(5660300002)(54906003)(66476007)(26005)(64756008)(107886003)(4326008)(8676002)(2906002)(7696005)(478600001)(9686003)(316002)(7416002)(86362001)(6506007)(55016002)(83380400001)(6916009)(21314003)(579004)(569008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: nfSzq05ZsTR+nuB5QL9Oc++v7QmMNrAZrT49+/1DTIUTnTkF0J2Pbh9XBzpJYckWZZR6rxJzi8vocrjjhoXgdTX6qiQHEkylzkRG5TqrGQY//+sf6eq+e1gGox6VIH8Pqh3XG/T+DDq5kJuvUJxZ+tqAk5/WbpKfP5CnlWwY2fjE3Ws3CVlZLKiK+bNLYlezEc4XfACbFuHESzE8KzS+IZfB2q2vZR5IUgHkn7JWFwL+iVdxwN8qhAxeGPZRo8v1pvdVktXpQ1V1ZhoEzgQ6Zm/hKD1hGdtJ2trStF7n6MlRACztIqnFAtHMKcgRnXbDEpDbn1FZeeKqJ963rm6lPmcMYsVBizbVo/fpIP8xz25VUQtuLksZEIKvPFAE8Mi0BQfSaX6U+yhmrMvqcxTdOAEtHq/Uash+kQ7nWCYLTCmtUEq+VF4Mk/M+0mCQmT3CrsCWPEmwt+HJKgjPPlYPss7GgQbjioaV1utgCOoTqHlVhAt6tcftzx+FAsvyhnEwVhEyLeT+bq0rbFAWrCSyxZ+tIZqeP93uf/iHHB/Tif1TKrDn3kAfWfGYDBpDBGHMMf5FzhyGfcXZxETAIACLmZFsholUwJW7vf7mzLKn0o0N142Uj8ngIUFcROkccaMPwnMMmtFd+27aPHgtfatzAA==
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR07MB5281.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af409717-7550-41e2-f827-08d849d614bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2020 15:38:27.2194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xMX3ibpoR1HYqJfkzja6OLdv5X4D5ZVKKriYzpTkyRhbTJOjWjh/UpnpYJAcFlHfXQGVnxJ4Si8l6H28Dvv7ZZb1fdvqPkM0Piak5gcSUi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB4276
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_09:2020-08-26,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 phishscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1011 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008260116
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:36 +0000
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "praneeth@ti.com" <praneeth@ti.com>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "tomi.valkeinen@ti.com" <tomi.valkeinen@ti.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jsarha@ti.com" <jsarha@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>,
 Milind Parab <mparab@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent, 

> -----Original Message-----
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Sent: Tuesday, August 11, 2020 5:30
> To: Yuti Suresh Amonkar <yamonkar@cadence.com>
> Cc: linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org;
> devicetree@vger.kernel.org; robh+dt@kernel.org; maxime@cerno.tech;
> airlied@linux.ie; daniel@ffwll.ch; mark.rutland@arm.com;
> a.hajda@samsung.com; narmstrong@baylibre.com; jonas@kwiboo.se;
> jernej.skrabec@siol.net; praneeth@ti.com; jsarha@ti.com;
> tomi.valkeinen@ti.com; Milind Parab <mparab@cadence.com>; Swapnil
> Kashinath Jakhade <sjakhade@cadence.com>
> Subject: Re: [PATCH v6 2/3] drm: bridge: Add support for Cadence MHDP
> DPI/DP bridge
> 
> EXTERNAL MAIL
> 
> 
> Hi Yuti,
> 
> On Fri, May 01, 2020 at 07:32:58AM +0000, Yuti Suresh Amonkar wrote:
> > Hi Laurent,
> >
> > Thank you so much for reviewing the patch and providing valuable
> > comments. Apologies for the delayed response. We are working on your
> > review comments and will send the next version of the driver for
> > review soon. Please see the responses to comments inline below.
> 
> Thank you for the answers. I was reviewing v8 and realized there were a
> few things I didn't fully understand related to communication with the
> firmware, so I have a few questions here.
> 
> > On Thursday, March 12, 2020 3:51, Laurent Pinchart wrote:
> > > On Wed, Feb 26, 2020 at 11:22:58AM +0100, Yuti Amonkar wrote:
> > > > This patch adds new DRM driver for Cadence MHDP DPTX IP used on
> J721e SoC.
> > >
> > > s/DRM driver/DRM bridge driver.
> > >
> > > > MHDP DPTX IP is the component that complies with VESA DisplayPort
> (DP) and
> > > > embedded Display Port (eDP) standards. It integrates uCPU running the
> > > > embedded Firmware(FW) interfaced over APB interface.
> > > > Basically, it takes a DPI stream as input and output it encoded in DP
> > >
> > > s/output/outputs/
> > >
> > > > format. Currently, it supports only SST mode.
> > > >
> > > > Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> > > > Signed-off-by: Jyri Sarha <jsarha@ti.com>
> > > > Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
> > > > Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> > > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/Kconfig          |   11 +
> > > >  drivers/gpu/drm/bridge/Makefile         |    2 +
> > > >  drivers/gpu/drm/bridge/cdns-mhdp-core.c | 2196
> +++++++++++++++++++++++
> > > >  drivers/gpu/drm/bridge/cdns-mhdp-core.h |  380 ++++
> > > >  4 files changed, 2589 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-core.c
> > > >  create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-core.h
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/Kconfig
> b/drivers/gpu/drm/bridge/Kconfig
> > > > index 20a439199cb8..3bfabb76f2bb 100644
> > > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > > @@ -27,6 +27,17 @@ config DRM_CDNS_DSI
> > > >  	  Support Cadence DPI to DSI bridge. This is an internal
> > > >  	  bridge and is meant to be directly embedded in a SoC.
> > > >
> > > > +config DRM_CDNS_MHDP
> > > > +	tristate "Cadence DPI/DP bridge"
> > > > +	select DRM_KMS_HELPER
> > > > +	select DRM_PANEL_BRIDGE
> > > > +	depends on OF
> > > > +	help
> > > > +	  Support Cadence DPI to DP bridge. This is an internal
> > > > +	  bridge and is meant to be directly embedded in a SoC.
> > > > +	  It takes a DPI stream as input and output it encoded
> > >
> > > s/output/outputs/
> > >
> > > > +	  in DP format.
> > > > +
> > > >  config DRM_DUMB_VGA_DAC
> > > >  	tristate "Dumb VGA DAC Bridge support"
> > > >  	depends on OF
> > > > diff --git a/drivers/gpu/drm/bridge/Makefile
> b/drivers/gpu/drm/bridge/Makefile
> > > > index b0d5c3af0b5a..2e2c5be7c714 100644
> > > > --- a/drivers/gpu/drm/bridge/Makefile
> > > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > > @@ -16,6 +16,8 @@ obj-$(CONFIG_DRM_TOSHIBA_TC358768) +=
> tc358768.o
> > > >  obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511/
> > > >  obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
> > > >  obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
> > > > +obj-$(CONFIG_DRM_CDNS_MHDP) += cdns-mhdp.o
> > >
> > > Should this be kept alphabetically sorted ?
> > >
> > > > +cdns-mhdp-objs := cdns-mhdp-core.o
> > > >
> > > >  obj-y += analogix/
> > > >  obj-y += synopsys/
> > > > diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-core.c
> b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
> > > > new file mode 100644
> > > > index 000000000000..cc642893baa8
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
> > > > @@ -0,0 +1,2196 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Cadence MHDP DP bridge driver.
> > > > + *
> > > > + * Copyright: 2019 Cadence Design Systems, Inc.
> > > > + *
> > > > + * Author: Quentin Schulz <quentin.schulz@free-electrons.com>
> > > > + */
> > > > +
> > > > +#include <linux/clk.h>
> > > > +#include <linux/delay.h>
> > > > +#include <linux/err.h>
> > > > +#include <linux/firmware.h>
> > > > +#include <linux/io.h>
> > > > +#include <linux/iopoll.h>
> > > > +#include <linux/irq.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/of.h>
> > > > +#include <linux/of_device.h>
> > > > +#include <linux/of_irq.h>
> > >
> > > I think of_irq.h isn't needed.
> > >
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/phy/phy.h>
> > > > +#include <linux/phy/phy-dp.h>
> > >
> > > phy comes before platform.
> > >
> > > > +#include <linux/slab.h>
> > > > +
> > > > +#include <drm/drm_atomic_helper.h>
> > > > +#include <drm/drm_bridge.h>
> > > > +#include <drm/drm_connector.h>
> > > > +#include <drm/drm_crtc_helper.h>
> > > > +#include <drm/drm_dp_helper.h>
> > > > +#include <drm/drm_modeset_helper_vtables.h>
> > > > +#include <drm/drm_print.h>
> > > > +#include <drm/drm_probe_helper.h>
> > > > +
> > > > +#include <asm/unaligned.h>
> > > > +
> > > > +#include "cdns-mhdp-core.h"
> > > > +
> > > > +static const struct of_device_id mhdp_ids[] = {
> > > > +	{ .compatible = "cdns,mhdp8546", },
> > > > +	{ /* sentinel */ }
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, mhdp_ids);
> > >
> > > Small detail, this is usually put at at or towards the end of the file.
> > >
> > > > +
> > > > +static inline u32 get_unaligned_be24(const void *p)
> > > > +{
> > > > +	const u8 *_p = p;
> > > > +
> > > > +	return _p[0] << 16 | _p[1] << 8 | _p[2];
> > > > +}
> > > > +
> > > > +static inline void put_unaligned_be24(u32 val, void *p)
> > > > +{
> > > > +	u8 *_p = p;
> > > > +
> > > > +	_p[0] = val >> 16;
> > > > +	_p[1] = val >> 8;
> > > > +	_p[2] = val;
> > > > +}
> > > > +
> > > > +static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
> > > > +{
> > > > +	int val, ret;
> > >
> > > I would rename val to empty.
> > >
> > > > +
> > > > +	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
> > > > +
> > > > +	ret = readx_poll_timeout(readl, mhdp->regs +
> CDNS_MAILBOX_EMPTY,
> > > > +				 val, !val, MAILBOX_RETRY_US,
> > > > +				 MAILBOX_TIMEOUT_US);
> > >
> > > 2 seconds is an awfully long amount of time to wait for in a poll loop,
> > > especially with a lock held. Is the firmware interface *that*
> > > inefficient ? Every single register write takes 10 mailbox writes (and
> > > I'm not even talking about register reads). Someone really needs to have
> > > a good discussion with the firmware interface designers, this is pretty
> > > insane. Nothing that the driver can help of course :-(
> >
> > 2 Second is the worst case wait period. This unusually long wait period in
> firmware interface is
> > for worst case response on cable from a slow monitor. The timeout is given
> such that the driver
> > does not wait endlessly on a faulty case. The firmware implements the
> Tx/Rx sequences with
> > timeouts as per specification which are in the range of 500us.
> 
> Just to make sure I understand this correctly, do you mean that the
> firmware will provide data quickly in the mailbox, but that it first
> needs to wait for the monitor to reply, which can be slow ?
> 
> I'm wondering if we really need to wait for each read operation. How
> large is the mailbox ? When we get the first byte, could we read the
> whole message without polling for !empty on each byte ? Or maybe with a
> much shorter timeout for the subsequent bytes ?
> 
> And I know this would require a bit of refactoring, but could we use the
> mailbox interrupts to avoid the busy-loop ? Or is the response time so
> short in practice that it would actually hinder performances ?
> 
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	return readl(mhdp->regs + CDNS_MAILBOX_RX_DATA) & 0xff;
> > > > +}
> > > > +
> > > > +static int cdns_mhdp_mailbox_write(struct cdns_mhdp_device
> *mhdp, u8 val)
> > > > +{
> > > > +	int ret, full;
> > > > +
> > > > +	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
> > > > +
> > > > +	ret = readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_FULL,
> > > > +				 full, !full, MAILBOX_RETRY_US,
> > > > +				 MAILBOX_TIMEOUT_US);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	writel(val, mhdp->regs + CDNS_MAILBOX_TX_DATA);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int cdns_mhdp_mailbox_validate_receive(struct
> cdns_mhdp_device *mhdp,
> > > > +					      u8 module_id, u8 opcode,
> > > > +					      u16 req_size)
> > > > +{
> > > > +	u32 mbox_size, i;
> > > > +	u8 header[4];
> > > > +	int ret;
> > > > +
> > > > +	/* read the header of the message */
> > > > +	for (i = 0; i < 4; i++) {
> > > > +		ret = cdns_mhdp_mailbox_read(mhdp);
> > > > +		if (ret < 0)
> > > > +			return ret;
> > > > +
> > > > +		header[i] = ret;
> > > > +	}
> > > > +
> > > > +	mbox_size = get_unaligned_be16(header + 2);
> > > > +
> > > > +	if (opcode != header[0] || module_id != header[1] ||
> > > > +	    req_size != mbox_size) {
> > > > +		/*
> > > > +		 * If the message in mailbox is not what we want, we need to
> > > > +		 * clear the mailbox by reading its contents.
> > >
> > > Can this happen in practice, or does it mean that something went
> > > seriously wrong and everything will explode ?
> >
> > In practical scenario the read from external display devices over the cable
> may be misaligned.
> > Example could be a EDID block read after skipping few initial bytes. This
> check is for cleaning up
> > buffer for such reads.
> 
> I'm not sure to follow you here. The code above validates the header of
> the mailbox message. If the EDID sent by the monitor is transmitted
> misaligned, its data will be incorrect, but the mailbox message that
> wraps the EDID data shouldn't be misaligned, should it ?
> 

We have added module id and opcode checks to be on the safe side, but size check is added as few FW commands on error returns different sizes than requested.
For example, read_edid, read_dpcd commands respond with a different size than requested in case of an error.

> > > > +		 */
> > > > +		for (i = 0; i < mbox_size; i++)
> > > > +			if (cdns_mhdp_mailbox_read(mhdp) < 0)
> > > > +				break;
> > > > +
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int cdns_mhdp_mailbox_read_receive(struct cdns_mhdp_device
> *mhdp,
> > > > +					  u8 *buff, u16 buff_size)
> > > > +{
> > > > +	u32 i;
> > > > +	int ret;
> > > > +
> > > > +	for (i = 0; i < buff_size; i++) {
> > > > +		ret = cdns_mhdp_mailbox_read(mhdp);
> > > > +		if (ret < 0)
> > > > +			return ret;
> > > > +
> > > > +		buff[i] = ret;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int cdns_mhdp_mailbox_send(struct cdns_mhdp_device *mhdp,
> u8 module_id,
> > > > +				  u8 opcode, u16 size, u8 *message)
> > > > +{
> > > > +	u8 header[4];
> > > > +	int ret, i;
> > > > +
> > > > +	header[0] = opcode;
> > > > +	header[1] = module_id;
> > > > +	put_unaligned_be16(size, header + 2);
> > > > +
> > > > +	for (i = 0; i < 4; i++) {
> > > > +		ret = cdns_mhdp_mailbox_write(mhdp, header[i]);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +	}
> > > > +
> > > > +	for (i = 0; i < size; i++) {
> > > > +		ret = cdns_mhdp_mailbox_write(mhdp, message[i]);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static
> > > > +int cdns_mhdp_reg_read(struct cdns_mhdp_device *mhdp, u32 addr,
> u32 *value)
> > >
> > > None of the caller of this function check the return value, you can as
> > > well remove it, and return the read value by value instead of through
> > > the *value pointer. There's no point in faking error handling.
> > >
> > > > +{
> > > > +	u8 msg[4], resp[8];
> > > > +	int ret;
> > > > +
> > > > +	if (addr == 0) {
> > > > +		ret = -EINVAL;
> > > > +		goto err_reg_read;
> > >
> > > Unbalanced mutex_unlock(). I see no reason to check for addr == 0, the
> > > caller shouldn't do that.
> > >
> > > > +	}
> > > > +
> > > > +	put_unaligned_be32(addr, msg);
> > > > +
> > > > +	mutex_lock(&mhdp->mbox_mutex);
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,
> > > > +				     GENERAL_REGISTER_READ,
> > > > +				     sizeof(msg), msg);
> > > > +	if (ret)
> > > > +		goto err_reg_read;
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_validate_receive(mhdp,
> MB_MODULE_ID_GENERAL,
> > > > +						 GENERAL_REGISTER_READ,
> > > > +						 sizeof(resp));
> > > > +	if (ret)
> > > > +		goto err_reg_read;
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_read_receive(mhdp, resp, sizeof(resp));
> > > > +	if (ret)
> > > > +		goto err_reg_read;
> > > > +
> > > > +	/* Returned address value should be the same as requested */
> > > > +	if (memcmp(msg, resp, sizeof(msg))) {
> > > > +		ret = -EINVAL;
> > > > +		goto err_reg_read;
> > > > +	}
> > > > +
> > > > +	*value = get_unaligned_be32(resp + 4);
> > > > +
> > > > +err_reg_read:
> > > > +	mutex_unlock(&mhdp->mbox_mutex);
> > > > +	if (ret) {
> > > > +		DRM_DEV_ERROR(mhdp->dev, "Failed to read register.\n");
> > > > +		*value = 0;
> > > > +	}
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static
> > > > +int cdns_mhdp_reg_write(struct cdns_mhdp_device *mhdp, u16 addr,
> u32 val)
> > > > +{
> > > > +	u8 msg[6];
> > > > +	int ret;
> > > > +
> > > > +	put_unaligned_be16(addr, msg);
> > > > +	put_unaligned_be32(val, msg + 2);
> > > > +
> > > > +	mutex_lock(&mhdp->mbox_mutex);
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> > > > +				     DPTX_WRITE_REGISTER, sizeof(msg), msg);
> > > > +
> > > > +	mutex_unlock(&mhdp->mbox_mutex);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static
> > > > +int cdns_mhdp_reg_write_bit(struct cdns_mhdp_device *mhdp, u16
> addr,
> > > > +			    u8 start_bit, u8 bits_no, u32 val)
> > > > +{
> > > > +	u8 field[8];
> > > > +	int ret;
> > > > +
> > > > +	put_unaligned_be16(addr, field);
> > > > +	field[2] = start_bit;
> > > > +	field[3] = bits_no;
> > > > +	put_unaligned_be32(val, field + 4);
> > > > +
> > > > +	mutex_lock(&mhdp->mbox_mutex);
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> > > > +				     DPTX_WRITE_FIELD, sizeof(field), field);
> > > > +
> > > > +	mutex_unlock(&mhdp->mbox_mutex);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static
> > > > +int cdns_mhdp_dpcd_read(struct cdns_mhdp_device *mhdp,
> > > > +			u32 addr, u8 *data, u16 len)
> > > > +{
> > > > +	u8 msg[5], reg[5];
> > > > +	int ret;
> > > > +
> > > > +	put_unaligned_be16(len, msg);
> > > > +	put_unaligned_be24(addr, msg + 2);
> > > > +
> > > > +	mutex_lock(&mhdp->mbox_mutex);
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> > > > +				     DPTX_READ_DPCD, sizeof(msg), msg);
> > > > +	if (ret)
> > > > +		goto err_dpcd_read;
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_validate_receive(mhdp,
> MB_MODULE_ID_DP_TX,
> > > > +						 DPTX_READ_DPCD,
> > > > +						 sizeof(reg) + len);
> > > > +	if (ret)
> > > > +		goto err_dpcd_read;
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_read_receive(mhdp, reg, sizeof(reg));
> > > > +	if (ret)
> > > > +		goto err_dpcd_read;
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_read_receive(mhdp, data, len);
> > > > +
> > > > +err_dpcd_read:
> > > > +	mutex_unlock(&mhdp->mbox_mutex);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static
> > > > +int cdns_mhdp_dpcd_write(struct cdns_mhdp_device *mhdp, u32
> addr, u8 value)
> > > > +{
> > > > +	u8 msg[6], reg[5];
> > > > +	int ret;
> > > > +
> > > > +	put_unaligned_be16(1, msg);
> > > > +	put_unaligned_be24(addr, msg + 2);
> > > > +	msg[5] = value;
> > > > +
> > > > +	mutex_lock(&mhdp->mbox_mutex);
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> > > > +				     DPTX_WRITE_DPCD, sizeof(msg), msg);
> > > > +	if (ret)
> > > > +		goto err_dpcd_write;
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_validate_receive(mhdp,
> MB_MODULE_ID_DP_TX,
> > > > +						 DPTX_WRITE_DPCD,
> sizeof(reg));
> > > > +	if (ret)
> > > > +		goto err_dpcd_write;
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_read_receive(mhdp, reg, sizeof(reg));
> > > > +	if (ret)
> > > > +		goto err_dpcd_write;
> > > > +
> > > > +	if (addr != get_unaligned_be24(reg + 2))
> > > > +		ret = -EINVAL;
> > > > +
> > > > +err_dpcd_write:
> > > > +	mutex_unlock(&mhdp->mbox_mutex);
> > > > +
> > > > +	if (ret)
> > > > +		DRM_DEV_ERROR(mhdp->dev, "dpcd write failed: %d\n",
> ret);
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static
> > > > +int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device
> *mhdp, bool enable)
> > > > +{
> > > > +	u8 msg[5];
> > > > +	int ret, i;
> > > > +
> > > > +	msg[0] = GENERAL_MAIN_CONTROL;
> > > > +	msg[1] = MB_MODULE_ID_GENERAL;
> > > > +	msg[2] = 0;
> > > > +	msg[3] = 1;
> > > > +	msg[4] = enable ? FW_ACTIVE : FW_STANDBY;
> > > > +
> > > > +	mutex_lock(&mhdp->mbox_mutex);
> > > > +
> > > > +	for (i = 0; i < sizeof(msg); i++) {
> > > > +		ret = cdns_mhdp_mailbox_write(mhdp, msg[i]);
> > > > +		if (ret)
> > > > +			goto err_set_firmware_active;
> > > > +	}
> > > > +
> > > > +	/* read the firmware state */
> > > > +	for (i = 0; i < sizeof(msg); i++)  {
> > > > +		ret = cdns_mhdp_mailbox_read(mhdp);
> > > > +		if (ret < 0)
> > > > +			goto err_set_firmware_active;
> > > > +
> > > > +		msg[i] = ret;
> > > > +	}
> > > > +
> > > > +	ret = 0;
> > > > +
> > > > +err_set_firmware_active:
> > > > +	mutex_unlock(&mhdp->mbox_mutex);
> > > > +
> > > > +	if (ret < 0)
> > > > +		DRM_DEV_ERROR(mhdp->dev, "set firmware active
> failed\n");
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static
> > > > +int cdns_mhdp_get_hpd_status(struct cdns_mhdp_device *mhdp)
> > > > +{
> > > > +	u8 status;
> > > > +	int ret;
> > > > +
> > > > +	mutex_lock(&mhdp->mbox_mutex);
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> > > > +				     DPTX_HPD_STATE, 0, NULL);
> > > > +	if (ret)
> > > > +		goto err_get_hpd;
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_validate_receive(mhdp,
> MB_MODULE_ID_DP_TX,
> > > > +						 DPTX_HPD_STATE,
> > > > +						 sizeof(status));
> > > > +	if (ret)
> > > > +		goto err_get_hpd;
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_read_receive(mhdp, &status,
> sizeof(status));
> > > > +	if (ret)
> > > > +		goto err_get_hpd;
> > > > +
> > > > +	mutex_unlock(&mhdp->mbox_mutex);
> > > > +
> > > > +	return status;
> > > > +
> > > > +err_get_hpd:
> > > > +	mutex_unlock(&mhdp->mbox_mutex);
> > > > +
> > > > +	DRM_DEV_ERROR(mhdp->dev, "get hpd status failed: %d\n", ret);
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static
> > > > +int cdns_mhdp_get_edid_block(void *data, u8 *edid,
> > > > +			     unsigned int block, size_t length)
> > > > +{
> > > > +	struct cdns_mhdp_device *mhdp = data;
> > > > +	u8 msg[2], reg[2], i;
> > > > +	int ret;
> > > > +
> > > > +	mutex_lock(&mhdp->mbox_mutex);
> > > > +
> > > > +	for (i = 0; i < 4; i++) {
> > > > +		msg[0] = block / 2;
> > > > +		msg[1] = block % 2;
> > > > +
> > > > +		ret = cdns_mhdp_mailbox_send(mhdp,
> MB_MODULE_ID_DP_TX,
> > > > +					     DPTX_GET_EDID, sizeof(msg),
> msg);
> > > > +		if (ret)
> > > > +			continue;
> > > > +
> > > > +		ret = cdns_mhdp_mailbox_validate_receive(mhdp,
> > > > + MB_MODULE_ID_DP_TX,
> > > > +							 DPTX_GET_EDID,
> > > > +							 sizeof(reg) + length);
> > > > +		if (ret)
> > > > +			continue;
> > > > +
> > > > +		ret = cdns_mhdp_mailbox_read_receive(mhdp, reg,
> sizeof(reg));
> > > > +		if (ret)
> > > > +			continue;
> > > > +
> > > > +		ret = cdns_mhdp_mailbox_read_receive(mhdp, edid, length);
> > > > +		if (ret)
> > > > +			continue;
> > > > +
> > > > +		if (reg[0] == length && reg[1] == block / 2)
> > > > +			break;
> > > > +	}
> > > > +
> > > > +	mutex_unlock(&mhdp->mbox_mutex);
> > > > +
> > > > +	if (ret)
> > > > +		DRM_DEV_ERROR(mhdp->dev, "get block[%d] edid failed:
> %d\n",
> > > > +			      block, ret);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static
> > > > +int cdns_mhdp_read_event(struct cdns_mhdp_device *mhdp)
> > > > +{
> > > > +	u8 event = 0;
> > > > +	int ret;
> > > > +
> > > > +	mutex_lock(&mhdp->mbox_mutex);
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> > > > +				     DPTX_READ_EVENT, 0, NULL);
> > > > +	if (ret)
> > > > +		goto out;
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_validate_receive(mhdp,
> > > > +						 MB_MODULE_ID_DP_TX,
> > > > +						 DPTX_READ_EVENT,
> > > > +						 sizeof(event));
> > > > +	if (ret < 0)
> > > > +		goto out;
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_read_receive(mhdp, &event,
> > > > +					     sizeof(event));
> > > > +out:
> > > > +	mutex_unlock(&mhdp->mbox_mutex);
> > > > +
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	return event;
> > > > +}
> > > > +
> > > > +static
> > > > +int cdns_mhdp_adjust_lt(struct cdns_mhdp_device *mhdp,
> > > > +			u8 nlanes, u16 udelay, u8 *lanes_data, u8
> *link_status)
> > > > +{
> > > > +	u8 payload[7];
> > > > +	u8 hdr[5]; /* For DPCD read response header */
> > > > +	u32 addr;
> > > > +	u8 const nregs = 6; /* Registers 0x202-0x207 */
> > > > +	int ret;
> > > > +
> > > > +	if (nlanes != 4 && nlanes != 2 && nlanes != 1) {
> > > > +		DRM_DEV_ERROR(mhdp->dev, "invalid number of lanes:
> %d\n",
> > > > +			      nlanes);
> > > > +		ret = -EINVAL;
> > > > +		goto err_adjust_lt;
> > > > +	}
> > > > +
> > > > +	payload[0] = nlanes;
> > > > +	put_unaligned_be16(udelay, payload + 1);
> > > > +	memcpy(payload + 3, lanes_data, nlanes);
> > > > +
> > > > +	mutex_lock(&mhdp->mbox_mutex);
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> > > > +				     DPTX_ADJUST_LT,
> > > > +				     sizeof(payload), payload);
> > > > +	if (ret)
> > > > +		goto err_adjust_lt;
> > > > +
> > > > +	/* Yes, read the DPCD read command response */
> > > > +	ret = cdns_mhdp_mailbox_validate_receive(mhdp,
> MB_MODULE_ID_DP_TX,
> > > > +						 DPTX_READ_DPCD,
> > > > +						 sizeof(hdr) + nregs);
> > > > +	if (ret)
> > > > +		goto err_adjust_lt;
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_read_receive(mhdp, hdr, sizeof(hdr));
> > > > +	if (ret)
> > > > +		goto err_adjust_lt;
> > > > +
> > > > +	addr = get_unaligned_be24(hdr + 2);
> > > > +	if (addr != DP_LANE0_1_STATUS)
> > > > +		goto err_adjust_lt;
> > > > +
> > > > +	ret = cdns_mhdp_mailbox_read_receive(mhdp, link_status, nregs);
> > > > +
> > > > +err_adjust_lt:
> > > > +	mutex_unlock(&mhdp->mbox_mutex);
> > > > +
> > > > +	if (ret)
> > > > +		DRM_DEV_ERROR(mhdp->dev, "Failed to adjust Link
> Training.\n");
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +/**
> > > > + * cdns_mhdp_link_power_up() - power up a DisplayPort link
> > > > + * @aux: DisplayPort AUX channel
> > > > + * @link: pointer to a structure containing the link configuration
> > > > + *
> > > > + * Returns 0 on success or a negative error code on failure.
> > > > + */
> > > > +static
> > > > +int cdns_mhdp_link_power_up(struct drm_dp_aux *aux, struct
> cdns_mhdp_link *link)
> > > > +{
> > > > +	u8 value;
> > > > +	int err;
> > > > +
> > > > +	/* DP_SET_POWER register is only available on DPCD v1.1 and later
> */
> > > > +	if (link->revision < 0x11)
> > > > +		return 0;
> > > > +
> > > > +	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
> > > > +	if (err < 0)
> > > > +		return err;
> > > > +
> > > > +	value &= ~DP_SET_POWER_MASK;
> > > > +	value |= DP_SET_POWER_D0;
> > > > +
> > > > +	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
> > > > +	if (err < 0)
> > > > +		return err;
> > > > +
> > > > +	/*
> > > > +	 * According to the DP 1.1 specification, a "Sink Device must exit the
> > > > +	 * power saving state within 1 ms" (Section 2.5.3.1, Table 5-52, "Sink
> > > > +	 * Control Field" (register 0x600).
> > > > +	 */
> > > > +	usleep_range(1000, 2000);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * cdns_mhdp_link_power_down() - power down a DisplayPort link
> > > > + * @aux: DisplayPort AUX channel
> > > > + * @link: pointer to a structure containing the link configuration
> > > > + *
> > > > + * Returns 0 on success or a negative error code on failure.
> > > > + */
> > > > +static
> > > > +int cdns_mhdp_link_power_down(struct drm_dp_aux *aux,
> > > > +			      struct cdns_mhdp_link *link)
> > > > +{
> > > > +	u8 value;
> > > > +	int err;
> > > > +
> > > > +	/* DP_SET_POWER register is only available on DPCD v1.1 and later
> */
> > > > +	if (link->revision < 0x11)
> > > > +		return 0;
> > > > +
> > > > +	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
> > > > +	if (err < 0)
> > > > +		return err;
> > > > +
> > > > +	value &= ~DP_SET_POWER_MASK;
> > > > +	value |= DP_SET_POWER_D3;
> > > > +
> > > > +	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
> > > > +	if (err < 0)
> > > > +		return err;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * cdns_mhdp_link_configure() - configure a DisplayPort link
> > > > + * @aux: DisplayPort AUX channel
> > > > + * @link: pointer to a structure containing the link configuration
> > > > + *
> > > > + * Returns 0 on success or a negative error code on failure.
> > > > + */
> > > > +static
> > > > +int cdns_mhdp_link_configure(struct drm_dp_aux *aux,
> > > > +			     struct cdns_mhdp_link *link)
> > > > +{
> > > > +	u8 values[2];
> > > > +	int err;
> > > > +
> > > > +	values[0] = drm_dp_link_rate_to_bw_code(link->rate);
> > > > +	values[1] = link->num_lanes;
> > > > +
> > > > +	if (link->capabilities & DP_LINK_CAP_ENHANCED_FRAMING)
> > > > +		values[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
> > > > +
> > > > +	err = drm_dp_dpcd_write(aux, DP_LINK_BW_SET, values,
> sizeof(values));
> > > > +	if (err < 0)
> > > > +		return err;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static unsigned int mhdp_max_link_rate(struct cdns_mhdp_device
> *mhdp)
> > > > +{
> > > > +	return min(mhdp->host.link_rate, mhdp->sink.link_rate);
> > > > +}
> > > > +
> > > > +static u8 mhdp_max_num_lanes(struct cdns_mhdp_device *mhdp)
> > > > +{
> > > > +	return min_t(u8, mhdp->sink.lanes_cnt, mhdp->host.lanes_cnt);
> > > > +}
> > > > +
> > > > +static u8 mhdp_eq_training_pattern_supported(struct
> cdns_mhdp_device *mhdp)
> > > > +{
> > > > +	return fls(mhdp->host.pattern_supp & mhdp->sink.pattern_supp);
> > > > +}
> > > > +
> > > > +static bool mhdp_get_ssc_supported(struct cdns_mhdp_device
> *mhdp)
> > > > +{
> > > > +	/* Check if SSC is supported by both sides */
> > > > +	return (mhdp->host.ssc) && (mhdp->sink.ssc);
> > > > +}
> > > > +
> > > > +static int mhdp_fw_activate(const struct firmware *fw,
> > > > +			    struct cdns_mhdp_device *mhdp)
> > > > +{
> > > > +	unsigned int reg;
> > > > +	int ret = 0;
> > > > +
> > > > +	dev_dbg(mhdp->dev, "%s\n", __func__);
> > > > +
> > > > +	if (!fw || !fw->data) {
> > > > +		dev_err(mhdp->dev, "%s: No firmware.\n", __func__);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	spin_lock(&mhdp->start_lock);
> > > > +	if (mhdp->hw_state != MHDP_HW_INACTIVE) {
> > > > +		spin_unlock(&mhdp->start_lock);
> > > > +		if (mhdp->hw_state != MHDP_HW_STOPPED)
> > > > +			dev_err(mhdp->dev, "%s: Bad HW state: %d\n",
> > > > +				__func__, mhdp->hw_state);
> > > > +		return -EBUSY;
> > > > +	}
> > > > +	mhdp->hw_state = MHDP_HW_LOADING;
> > > > +	spin_unlock(&mhdp->start_lock);
> > > > +
> > > > +	/* Release uCPU reset and stall it. */
> > > > +	writel(CDNS_CPU_STALL, mhdp->regs + CDNS_APB_CTRL);
> > > > +
> > > > +	memcpy_toio(mhdp->regs + CDNS_MHDP_IMEM, fw->data, fw-
> > > >size);
> > > > +
> > > > +	/* Leave debug mode, release stall */
> > > > +	writel(0, mhdp->regs + CDNS_APB_CTRL);
> > > > +
> > > > +	/*
> > > > +	 * Wait for the KEEP_ALIVE "message" on the first 8 bits.
> > > > +	 * Updated each sched "tick" (~2ms)
> > > > +	 */
> > > > +	ret = readl_poll_timeout(mhdp->regs + CDNS_KEEP_ALIVE, reg,
> > > > +				 reg & CDNS_KEEP_ALIVE_MASK, 500,
> > > > +				 CDNS_KEEP_ALIVE_TIMEOUT);
> > > > +	if (ret) {
> > > > +		dev_err(mhdp->dev,
> > > > +			"device didn't give any life sign: reg %d\n", reg);
> > > > +		goto error;
> > > > +	}
> > > > +
> > > > +	/* Init events to 0 as it's not cleared by FW at boot but on read */
> > > > +	readl(mhdp->regs + CDNS_SW_EVENT0);
> > > > +	readl(mhdp->regs + CDNS_SW_EVENT1);
> > > > +	readl(mhdp->regs + CDNS_SW_EVENT2);
> > > > +	readl(mhdp->regs + CDNS_SW_EVENT3);
> > > > +
> > > > +	/* Activate uCPU */
> > > > +	ret = cdns_mhdp_set_firmware_active(mhdp, true);
> > > > +	if (ret) {
> > > > +		dev_err(mhdp->dev, "%s: Failed to activate FW: %d\n",
> > > > +			__func__, ret);
> > > > +		goto error;
> > > > +	}
> > > > +
> > > > +	spin_lock(&mhdp->start_lock);
> > > > +
> > > > +	mhdp->hw_state = MHDP_HW_READY;
> > > > +
> > > > +	/*
> > > > +	 * Here we must keep the lock while enabling the interrupts
> > > > +	 * since it would otherwise be possible that interrupt enable
> > > > +	 * code is executed after the bridge is detached. The similar
> > > > +	 * situation is not possible in attach()/detach() callbacks
> > > > +	 * since the hw_state changes from MHDP_HW_READY to
> > > > +	 * MHDP_HW_STOPPED happens only due to driver removal when
> > > > +	 * bridge should already be detached.
> > > > +	 */
> > > > +	if (mhdp->bridge_attached) {
> > > > +		/* enable interrupts */
> > > > +		writel(0, mhdp->regs + CDNS_APB_INT_MASK);
> > > > +		writel(0, mhdp->regs + CDNS_MB_INT_MASK);
> > > > +	}
> > > > +
> > > > +	spin_unlock(&mhdp->start_lock);
> > > > +
> > > > +	dev_dbg(mhdp->dev, "DP FW activated\n");
> > > > +
> > > > +	return 0;
> > > > +error:
> > > > +	spin_lock(&mhdp->start_lock);
> > > > +	mhdp->hw_state = MHDP_HW_INACTIVE;
> > > > +	spin_unlock(&mhdp->start_lock);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static void mhdp_fw_cb(const struct firmware *fw, void *context)
> > > > +{
> > > > +	struct cdns_mhdp_device *mhdp = context;
> > > > +	bool bridge_attached;
> > > > +	int ret;
> > > > +
> > > > +	dev_dbg(mhdp->dev, "firmware callback\n");
> > > > +
> > > > +	ret = mhdp_fw_activate(fw, mhdp);
> > > > +
> > > > +	release_firmware(fw);
> > > > +
> > > > +	if (ret)
> > > > +		return;
> > > > +
> > > > +	/*
> > > > +	 *  XXX how to make sure the bridge is still attached when
> > > > +	 *      calling drm_kms_helper_hotplug_event() after releasing
> > > > +	 *      the lock? We should not hold the spin lock when
> > > > +	 *      calling drm_kms_helper_hotplug_event() since it may
> > > > +	 *      cause a dead lock. FB-dev console calls detect from the
> > > > +	 *      same thread just down the call stack started here.
> > > > +	 */
> > > > +	spin_lock(&mhdp->start_lock);
> > > > +	bridge_attached = mhdp->bridge_attached;
> > > > +	spin_unlock(&mhdp->start_lock);
> > > > +	if (bridge_attached)
> > > > +		drm_kms_helper_hotplug_event(mhdp->bridge.dev);
> > > > +}
> > > > +
> > > > +static int load_firmware(struct cdns_mhdp_device *mhdp)
> > >
> > > s/load_firmware/mhdp_load_firmware/
> > >
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	ret = request_firmware_nowait(THIS_MODULE, true, FW_NAME,
> mhdp->dev,
> > > > +				      GFP_KERNEL, mhdp, mhdp_fw_cb);
> > > > +	if (ret) {
> > > > +		dev_err(mhdp->dev, "failed to load firmware (%s), ret:
> %d\n",
> > > > +			FW_NAME, ret);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static void mhdp_check_link(struct cdns_mhdp_device *mhdp)
> > > > +{
> > > > +	struct drm_connector *conn = &mhdp->connector;
> > > > +	u8 status[DP_LINK_STATUS_SIZE];
> > > > +	bool hpd_state;
> > > > +	int hpd_event;
> > > > +	int ret;
> > > > +
> > > > +	/* Nothing to check if there is no link */
> > > > +	if (!mhdp->link_up)
> > > > +		return;
> > > > +
> > > > +	hpd_event = cdns_mhdp_read_event(mhdp);
> > > > +
> > > > +	/* Geting event bits failed, bail out */
> > > > +	if (hpd_event < 0) {
> > > > +		dev_warn(mhdp->dev, "%s: read event failed: %d\n",
> > > > +			 __func__, hpd_event);
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	hpd_state = !!(hpd_event & DPTX_READ_EVENT_HPD_STATE);
> > > > +
> > > > +	/* No point the check the link if HPD is down (cable is unplugged) */
> > > > +	if (!hpd_state)
> > > > +		return;
> > > > +
> > > > +	/*
> > > > +	 * Prevent display reconfiguration between link check and link
> > > > +	 * status property setting. We must use the legacy giant-lock
> > > > +	 * since drm_connector_set_link_status_property()'s fine
> > > > +	 * grained DRM locking implementation is broken.
> > > > +	 */
> > > > +	mutex_lock(&conn->dev->mode_config.mutex);
> > > > +
> > > > +	/* Check if the link is still up */
> > > > +	ret = drm_dp_dpcd_read_link_status(&mhdp->aux, status);
> > > > +
> > > > +	if (ret < 0 || /* If dpcd read fails, assume the link is down too */
> > > > +	    !drm_dp_channel_eq_ok(status, mhdp->link.num_lanes) ||
> > > > +	    !drm_dp_clock_recovery_ok(status, mhdp->link.num_lanes))
> > > > +		/* Link is broken, indicate it with the link status property */
> > > > +		drm_connector_set_link_status_property(conn,
> > > > + DRM_MODE_LINK_STATUS_BAD);
> > > > +
> > > > +	mutex_unlock(&conn->dev->mode_config.mutex);
> > > > +}
> > > > +
> > > > +static irqreturn_t mhdp_irq_handler(int irq, void *data)
> > > > +{
> > > > +	struct cdns_mhdp_device *mhdp = (struct cdns_mhdp_device
> *)data;
> > > > +	u32 mbox_stat, apb_stat, sw_ev0, sw_ev1, sw_ev2, sw_ev3;
> > > > +	bool bridge_attached;
> > > > +
> > > > +	apb_stat = readl(mhdp->regs + CDNS_APB_INT_STATUS);
> > > > +	mbox_stat = readl(mhdp->regs + CDNS_MB_INT_STATUS);
> > > > +	sw_ev0 = readl(mhdp->regs + CDNS_SW_EVENT0);
> > > > +	sw_ev1 = readl(mhdp->regs + CDNS_SW_EVENT1);
> > > > +	sw_ev2 = readl(mhdp->regs + CDNS_SW_EVENT2);
> > > > +	sw_ev3 = readl(mhdp->regs + CDNS_SW_EVENT3);
> > > > +
> > > > +	/*
> > > > +	 *  Calling drm_kms_helper_hotplug_event() when not attached
> > > > +	 *  to drm device causes an oops because the drm_bridge->dev
> > > > +	 *  is NULL. See mhdp_fw_cb() comments for details about the
> > > > +	 *  problems related drm_kms_helper_hotplug_event() call.
> > > > +	 */
> > > > +	spin_lock(&mhdp->start_lock);
> > > > +	bridge_attached = mhdp->bridge_attached;
> > > > +	spin_unlock(&mhdp->start_lock);
> > > > +
> > > > +	if (bridge_attached && (sw_ev0 & CDNS_DPTX_HPD)) {
> > > > +		mhdp_check_link(mhdp);
> > > > +
> > > > +		drm_kms_helper_hotplug_event(mhdp->bridge.dev);
> > > > +	}
> > > > +
> > > > +	return IRQ_HANDLED;
> > > > +}
> > > > +
> > > > +static ssize_t mhdp_transfer(struct drm_dp_aux *aux,
> > > > +			     struct drm_dp_aux_msg *msg)
> > > > +{
> > > > +	struct cdns_mhdp_device *mhdp = dev_get_drvdata(aux->dev);
> > > > +	int ret;
> > > > +
> > > > +	if (msg->request != DP_AUX_NATIVE_WRITE &&
> > > > +	    msg->request != DP_AUX_NATIVE_READ)
> > > > +		return -ENOTSUPP;
> > > > +
> > > > +	if (msg->request == DP_AUX_NATIVE_WRITE) {
> > > > +		const u8 *buf = msg->buffer;
> > > > +		int i;
> > > > +
> > > > +		for (i = 0; i < msg->size; ++i) {
> > > > +			ret = cdns_mhdp_dpcd_write(mhdp,
> > > > +						   msg->address + i, buf[i]);
> > > > +			if (!ret)
> > > > +				continue;
> > > > +
> > > > +			DRM_DEV_ERROR(mhdp->dev, "Failed to write
> DPCD\n");
> > > > +
> > > > +			return ret;
> > > > +		}
> > > > +	} else {
> > > > +		ret = cdns_mhdp_dpcd_read(mhdp, msg->address,
> > > > +					  msg->buffer, msg->size);
> > > > +		if (ret) {
> > > > +			DRM_DEV_ERROR(mhdp->dev, "Failed to read
> DPCD\n");
> > > > +
> > > > +			return ret;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	return msg->size;
> > > > +}
> > > > +
> > > > +static int cdns_mhdp_get_modes(struct drm_connector *connector)
> > > > +{
> > > > +	struct cdns_mhdp_device *mhdp = connector_to_mhdp(connector);
> > > > +	struct edid *edid;
> > > > +	int num_modes;
> > > > +
> > > > +	edid = drm_do_get_edid(connector, cdns_mhdp_get_edid_block,
> mhdp);
> > >
> > > Out of curiosity, with the mailbox interface, how long does it actually
> > > take to read the EDID ?
> > >
> > > > +	if (!edid) {
> > > > +		DRM_DEV_ERROR(mhdp->dev, "Failed to read EDID\n");
> > > > +
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	drm_connector_update_edid_property(connector, edid);
> > > > +	num_modes = drm_add_edid_modes(connector, edid);
> > > > +	kfree(edid);
> > > > +
> > > > +	/*
> > > > +	 * HACK: Warn about unsupported display formats until we deal
> > > > +	 *       with them correctly.
> > > > +	 */
> > > > +	if (connector->display_info.color_formats &&
> > > > +	    !(connector->display_info.color_formats &
> > > > +	      mhdp->display_fmt.color_format))
> > > > +		dev_warn(mhdp->dev,
> > > > +			 "%s: No supported color_format found (0x%08x)\n",
> > > > +			__func__, connector->display_info.color_formats);
> > > > +
> > > > +	if (connector->display_info.bpc &&
> > > > +	    connector->display_info.bpc < mhdp->display_fmt.bpc)
> > > > +		dev_warn(mhdp->dev, "%s: Display bpc only %d < %d\n",
> > > > +			 __func__, connector->display_info.bpc,
> > > > +			 mhdp->display_fmt.bpc);
> > > > +
> > > > +	return num_modes;
> > > > +}
> > > > +
> > > > +static int cdns_mhdp_detect(struct drm_connector *conn,
> > > > +			    struct drm_modeset_acquire_ctx *ctx,
> > > > +			    bool force)
> > > > +{
> > > > +	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
> > > > +	bool hw_ready;
> > > > +	int ret;
> > > > +
> > > > +	dev_dbg(mhdp->dev, "%s\n", __func__);
> > > > +
> > > > +	spin_lock(&mhdp->start_lock);
> > > > +
> > > > +	hw_ready = mhdp->hw_state == MHDP_HW_READY;
> > > > +
> > > > +	spin_unlock(&mhdp->start_lock);
> > > > +
> > > > +	if (!hw_ready || WARN_ON(!mhdp->bridge_attached))
> > > > +		return connector_status_disconnected;
> > > > +
> > > > +	ret = cdns_mhdp_get_hpd_status(mhdp);
> > > > +	if (ret > 0) {
> > > > +		mhdp->plugged = true;
> > > > +		return connector_status_connected;
> > > > +	}
> > > > +	if (ret < 0)
> > > > +		dev_err(mhdp->dev, "Failed to obtain HPD state\n");
> > > > +
> > > > +	mhdp->plugged = false;
> > > > +
> > > > +	return connector_status_disconnected;
> > > > +}
> > > > +
> > > > +static
> > > > +bool cdns_mhdp_bandwidth_ok(struct cdns_mhdp_device *mhdp,
> > > > +			    const struct drm_display_mode *mode,
> > > > +			    int lanes, int rate)
> > > > +{
> > > > +	u32 max_bw, req_bw, bpp;
> > > > +
> > > > +	bpp = cdns_mhdp_get_bpp(&mhdp->display_fmt);
> > > > +	req_bw = mode->clock * bpp / 8;
> > > > +
> > > > +	max_bw = lanes * rate;
> > > > +
> > > > +	if (req_bw > max_bw) {
> > > > +		dev_dbg(mhdp->dev, "%s: %s (%u * %u/8 =) %u > %u (= %u *
> %u)\n",
> > > > +			__func__, mode->name, mode->clock, bpp, req_bw,
> > > > +			max_bw, lanes, rate);
> > > > +
> > > > +		return false;
> > > > +	}
> > > > +
> > > > +	return true;
> > > > +}
> > > > +
> > > > +static
> > > > +enum drm_mode_status cdns_mhdp_mode_valid(struct
> drm_connector *conn,
> > > > +					  struct drm_display_mode *mode)
> > > > +{
> > > > +	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
> > > > +
> > > > +	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->host.lanes_cnt,
> > > > +				    mhdp->host.link_rate))
> > > > +		return MODE_CLOCK_HIGH;
> > > > +
> > > > +	return MODE_OK;
> > > > +}
> > > > +
> > > > +static const struct drm_connector_helper_funcs
> cdns_mhdp_conn_helper_funcs = {
> > > > +	.detect_ctx = cdns_mhdp_detect,
> > > > +	.get_modes = cdns_mhdp_get_modes,
> > > > +	.mode_valid = cdns_mhdp_mode_valid,
> > > > +};
> > > > +
> > > > +static const struct drm_connector_funcs cdns_mhdp_conn_funcs = {
> > > > +	.fill_modes = drm_helper_probe_single_connector_modes,
> > > > +	.atomic_duplicate_state =
> drm_atomic_helper_connector_duplicate_state,
> > > > +	.atomic_destroy_state =
> drm_atomic_helper_connector_destroy_state,
> > > > +	.reset = drm_atomic_helper_connector_reset,
> > > > +	.destroy = drm_connector_cleanup,
> > > > +};
> > > > +
> > > > +static int cdns_mhdp_attach(struct drm_bridge *bridge)
> > > > +{
> > > > +	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
> > > > +	u32 bus_format = MEDIA_BUS_FMT_RGB121212_1X36;
> > > > +	struct drm_connector *conn = &mhdp->connector;
> > > > +	bool hw_ready;
> > > > +	int ret;
> > > > +
> > > > +	dev_dbg(mhdp->dev, "%s\n", __func__);
> > > > +
> > > > +	if (&mhdp->bridge != bridge)
> > > > +		return -ENODEV;
> > > > +
> > > > +	conn->polled = DRM_CONNECTOR_POLL_HPD;
> > > > +
> > > > +	ret = drm_connector_init(bridge->dev, conn,
> &cdns_mhdp_conn_funcs,
> > > > +				 DRM_MODE_CONNECTOR_DisplayPort);
> > > > +	if (ret) {
> > > > +		dev_err(mhdp->dev, "failed to init connector\n");
> > > > +		return ret;
> > > > +	}
> > >
> > > How about converting to connector bridge operations and avoiding
> > > creation of a connector in this driver ? See the recent changes to the
> > > omapdrm driver in mainline. At the very least
> > >
> > > You should implement support for the bridge connector operations and
> > > make connector creation optional (supporting the
> > > DRM_BRIDGE_ATTACH_NO_CONNECTOR flag). I would go one step
> further
> > > and
> > > only supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR, removing
> > > connector
> > > creation completely.
> >
> > This driver does not support the new model of converting to connector
> bridge operations.
> > This is because of the dependency on TIDSS driver which has some
> limitations in supporting
> > new model.
> 
> Very good point :-) I plan to work on tidss to fix that.
> 
> > > > +
> > > > +	drm_connector_helper_add(conn,
> &cdns_mhdp_conn_helper_funcs);
> > > > +
> > > > +	ret = drm_display_info_set_bus_formats(&conn->display_info,
> > > > +					       &bus_format, 1);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	conn->display_info.bus_flags = mhdp->conn_bus_flags_defaults;
> > > > +
> > > > +	if (!(strcmp(mhdp_ids->compatible, "ti,j721e-mhdp8546")))
> > >
> > > I think you meant to compare the compatible string of mhdp->dev, not
> the
> > > compatible string of the first entry in the mhdp_ids table.
> > >
> > > > +	/*
> > > > +	 * DP is internal to J7 SoC and we need to use DRIVE_POSEDGE
> > > > +	 * in the display controller. This is achieved for the time being
> > > > +	 * by defining SAMPLE_NEGEDGE here.
> > > > +	 */
> > > > +		conn->display_info.bus_flags |=
> > > > + 	DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> > > > + 	DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE;
> > > > +
> > > > +	ret = drm_connector_attach_encoder(conn, bridge->encoder);
> > > > +	if (ret) {
> > > > +		dev_err(mhdp->dev, "failed to attach connector to
> encoder\n");
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	spin_lock(&mhdp->start_lock);
> > > > +
> > > > +	mhdp->bridge_attached = true;
> > > > +	hw_ready = mhdp->hw_state == MHDP_HW_READY;
> > > > +
> > > > +	spin_unlock(&mhdp->start_lock);
> > > > +
> > > > +	if (hw_ready) {
> > > > +		/* enable interrupts */
> > > > +		writel(0, mhdp->regs + CDNS_APB_INT_MASK);
> > > > +		writel(0, mhdp->regs + CDNS_MB_INT_MASK);
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int mhdp_link_training_init(struct cdns_mhdp_device *mhdp)
> > > > +{
> > > > +	u32 reg32;
> > > > +	u8 i;
> > > > +	union phy_configure_opts phy_cfg;
> > > > +	int ret;
> > > > +
> > > > +	drm_dp_dpcd_writeb(&mhdp->aux, DP_TRAINING_PATTERN_SET,
> > > > +			   DP_TRAINING_PATTERN_DISABLE);
> > > > +
> > > > +	/* Reset PHY configuration */
> > > > +	reg32 = CDNS_PHY_COMMON_CONFIG |
> CDNS_PHY_TRAINING_TYPE(1);
> > > > +	if (!mhdp->host.scrambler)
> > > > +		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
> > > > +
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
> > > > +
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DP_ENHNCD,
> > > > +			    mhdp->sink.enhanced & mhdp->host.enhanced);
> > > > +
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DP_LANE_EN,
> > > > +			    CDNS_DP_LANE_EN_LANES(mhdp-
> > > >link.num_lanes));
> > > > +
> > > > +	cdns_mhdp_link_configure(&mhdp->aux, &mhdp->link);
> > > > +	phy_cfg.dp.link_rate = (mhdp->link.rate / 100);
> > > > +	phy_cfg.dp.lanes = (mhdp->link.num_lanes);
> > > > +	for (i = 0; i < 4; i++) {
> > > > +		phy_cfg.dp.voltage[i] = 0;
> > > > +		phy_cfg.dp.pre[i] = 0;
> > > > +	}
> > > > +	phy_cfg.dp.ssc = mhdp_get_ssc_supported(mhdp);
> > > > +	phy_cfg.dp.set_lanes = true;
> > > > +	phy_cfg.dp.set_rate = true;
> > > > +	phy_cfg.dp.set_voltages = true;
> > > > +	ret = phy_configure(mhdp->phy,  &phy_cfg);
> > > > +	if (ret) {
> > > > +		dev_err(mhdp->dev, "%s: phy_configure() failed: %d\n",
> > > > +			__func__, ret);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG,
> > > > +			    CDNS_PHY_COMMON_CONFIG |
> > > > +			    CDNS_PHY_TRAINING_EN |
> > > > +			    CDNS_PHY_TRAINING_TYPE(1) |
> > > > +			    CDNS_PHY_SCRAMBLER_BYPASS);
> > > > +
> > > > +	drm_dp_dpcd_writeb(&mhdp->aux, DP_TRAINING_PATTERN_SET,
> > > > +			   DP_TRAINING_PATTERN_1 |
> DP_LINK_SCRAMBLING_DISABLE);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static void mhdp_get_adjust_train(struct cdns_mhdp_device *mhdp,
> > > > +				  u8 link_status[DP_LINK_STATUS_SIZE],
> > > > +				  u8
> lanes_data[CDNS_DP_MAX_NUM_LANES],
> > > > +				  union phy_configure_opts *phy_cfg)
> > > > +{
> > > > +	unsigned int i;
> > > > +	u8 adjust, max_pre_emph, max_volt_swing;
> > > > +	u8 set_volt, set_pre;
> > > > +
> > > > +	max_pre_emph = CDNS_PRE_EMPHASIS(mhdp->host.pre_emphasis)
> > > > +			   << DP_TRAIN_PRE_EMPHASIS_SHIFT;
> > > > +	max_volt_swing = CDNS_VOLT_SWING(mhdp->host.volt_swing);
> > > > +
> > > > +	for (i = 0; i < mhdp->link.num_lanes; i++) {
> > > > +		/* Check if Voltage swing and pre-emphasis are within limits
> */
> > > > +		adjust = drm_dp_get_adjust_request_voltage(link_status, i);
> > > > +		set_volt = min_t(u8, adjust, max_volt_swing);
> > > > +
> > > > +		adjust =
> drm_dp_get_adjust_request_pre_emphasis(link_status, i);
> > > > +		set_pre = min_t(u8, adjust, max_pre_emph)
> > > > +			  >> DP_TRAIN_PRE_EMPHASIS_SHIFT;
> > > > +
> > > > +		/* Voltage swing level and pre-emphasis level combination is
> > > > +		 * not allowed: leaving pre-emphasis as-is, and adjusting
> > > > +		 * voltage swing.
> > > > +		 */
> > > > +		if (set_volt + set_pre > 3)
> > > > +			set_volt = 3 - set_pre;
> > > > +
> > > > +		phy_cfg->dp.voltage[i] = set_volt;
> > > > +		lanes_data[i] = set_volt;
> > > > +
> > > > +		if (set_volt == max_volt_swing)
> > > > +			lanes_data[i] |= DP_TRAIN_MAX_SWING_REACHED;
> > > > +
> > > > +		phy_cfg->dp.pre[i] = set_pre;
> > > > +		lanes_data[i] |= (set_pre <<
> DP_TRAIN_PRE_EMPHASIS_SHIFT);
> > > > +
> > > > +		if (set_pre == (max_pre_emph >>
> DP_TRAIN_PRE_EMPHASIS_SHIFT))
> > > > +			lanes_data[i] |=
> DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
> > > > +	}
> > > > +}
> > > > +
> > > > +static
> > > > +void mhdp_set_adjust_request_voltage(u8
> link_status[DP_LINK_STATUS_SIZE],
> > > > +				     int lane, u8 volt)
> > > > +{
> > > > +	int i = DP_ADJUST_REQUEST_LANE0_1 + (lane >> 1);
> > > > +	int s = ((lane & 1) ?
> > > > +		 DP_ADJUST_VOLTAGE_SWING_LANE1_SHIFT :
> > > > +		 DP_ADJUST_VOLTAGE_SWING_LANE0_SHIFT);
> > > > +	int idx = i - DP_LANE0_1_STATUS;
> > > > +
> > > > +	link_status[idx] &= ~(DP_ADJUST_VOLTAGE_SWING_LANE0_MASK <<
> s);
> > > > +	link_status[idx] |= volt << s;
> > > > +}
> > > > +
> > > > +static
> > > > +void mhdp_set_adjust_request_pre_emphasis(u8
> link_status[DP_LINK_STATUS_SIZE],
> > > > +					  int lane, u8 pre_emphasis)
> > > > +{
> > > > +	int i = DP_ADJUST_REQUEST_LANE0_1 + (lane >> 1);
> > > > +	int s = ((lane & 1) ?
> > > > +		 DP_ADJUST_PRE_EMPHASIS_LANE1_SHIFT :
> > > > +		 DP_ADJUST_PRE_EMPHASIS_LANE0_SHIFT);
> > > > +	int idx = i - DP_LANE0_1_STATUS;
> > > > +
> > > > +	link_status[idx] &= ~(DP_ADJUST_PRE_EMPHASIS_LANE0_MASK <<
> s);
> > > > +	link_status[idx] |= pre_emphasis << s;
> > > > +}
> > > > +
> > > > +static void mhdp_adjust_requested_eq(struct cdns_mhdp_device
> *mhdp,
> > > > +				     u8 link_status[DP_LINK_STATUS_SIZE])
> > > > +{
> > > > +	unsigned int i;
> > > > +	u8 volt, pre, max_volt = CDNS_VOLT_SWING(mhdp-
> > > >host.volt_swing),
> > > > +		      max_pre = CDNS_PRE_EMPHASIS(mhdp-
> > > >host.pre_emphasis);
> > > > +
> > > > +	for (i = 0; i < mhdp->link.num_lanes; i++) {
> > > > +		volt = drm_dp_get_adjust_request_voltage(link_status, i);
> > > > +		pre =
> drm_dp_get_adjust_request_pre_emphasis(link_status, i);
> > > > +		if (volt + pre > 3)
> > > > +			mhdp_set_adjust_request_voltage(link_status, i,
> > > > +							3 - pre);
> > > > +		if (mhdp->host.volt_swing & CDNS_FORCE_VOLT_SWING)
> > > > +			mhdp_set_adjust_request_voltage(link_status, i,
> > > > +							max_volt);
> > > > +		if (mhdp->host.pre_emphasis &
> CDNS_FORCE_PRE_EMPHASIS)
> > > > + 	mhdp_set_adjust_request_pre_emphasis(link_status, i,
> > > > +							     max_pre);
> > > > +	}
> > > > +}
> > > > +
> > > > +static bool mhdp_link_training_channel_eq(struct cdns_mhdp_device
> *mhdp,
> > > > +					  u8 eq_tps,
> > > > +					  unsigned int training_interval)
> > > > +{
> > > > +	u8 lanes_data[CDNS_DP_MAX_NUM_LANES], fail_counter_short = 0;
> > > > +	u8 link_status[DP_LINK_STATUS_SIZE];
> > > > +	u32 reg32;
> > > > +	union phy_configure_opts phy_cfg;
> > > > +	int ret;
> > > > +	bool r;
> > > > +
> > > > +	dev_dbg(mhdp->dev, "Starting EQ phase\n");
> > > > +
> > > > +	/* Enable link training TPS[eq_tps] in PHY */
> > > > +	reg32 = CDNS_PHY_COMMON_CONFIG | CDNS_PHY_TRAINING_EN |
> > > > +		CDNS_PHY_TRAINING_TYPE(eq_tps);
> > > > +	if (eq_tps != 4)
> > > > +		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
> > > > +
> > > > +	drm_dp_dpcd_writeb(&mhdp->aux, DP_TRAINING_PATTERN_SET,
> > > > +			   (eq_tps != 4) ? eq_tps |
> DP_LINK_SCRAMBLING_DISABLE :
> > > > +			   CDNS_DP_TRAINING_PATTERN_4);
> > > > +
> > > > +	drm_dp_dpcd_read_link_status(&mhdp->aux, link_status);
> > > > +
> > > > +	do {
> > > > +		mhdp_get_adjust_train(mhdp, link_status, lanes_data,
> &phy_cfg);
> > > > +		phy_cfg.dp.lanes = (mhdp->link.num_lanes);
> > > > +		phy_cfg.dp.ssc = mhdp_get_ssc_supported(mhdp);
> > > > +		phy_cfg.dp.set_lanes = false;
> > > > +		phy_cfg.dp.set_rate = false;
> > > > +		phy_cfg.dp.set_voltages = true;
> > > > +		ret = phy_configure(mhdp->phy,  &phy_cfg);
> > > > +		if (ret) {
> > > > +			dev_err(mhdp->dev, "%s: phy_configure() failed:
> %d\n",
> > > > +				__func__, ret);
> > > > +			goto err;
> > > > +		}
> > > > +
> > > > +		cdns_mhdp_adjust_lt(mhdp, mhdp->link.num_lanes,
> > > > +				    training_interval, lanes_data, link_status);
> > > > +
> > > > +		r = drm_dp_clock_recovery_ok(link_status, mhdp-
> > > >link.num_lanes);
> > > > +		if (!r)
> > > > +			goto err;
> > > > +
> > > > +		if (drm_dp_channel_eq_ok(link_status, mhdp-
> > > >link.num_lanes)) {
> > > > +			dev_dbg(mhdp->dev, "EQ phase succeeded\n");
> > > > +			return true;
> > > > +		}
> > > > +
> > > > +		fail_counter_short++;
> > > > +
> > > > +		mhdp_adjust_requested_eq(mhdp, link_status);
> > > > +	} while (fail_counter_short < 5);
> > > > +
> > > > +err:
> > > > +	dev_dbg(mhdp->dev, "EQ phase failed for %d lanes and %d rate\n",
> > > > +		mhdp->link.num_lanes, mhdp->link.rate);
> > > > +
> > > > +	return false;
> > > > +}
> > > > +
> > > > +static void mhdp_adjust_requested_cr(struct cdns_mhdp_device
> *mhdp,
> > > > +				     u8 link_status[DP_LINK_STATUS_SIZE],
> > > > +				     u8 *req_volt, u8 *req_pre)
> > > > +{
> > > > +	const u32 max_volt = CDNS_VOLT_SWING(mhdp->host.volt_swing),
> > > > +		  max_pre = CDNS_PRE_EMPHASIS(mhdp-
> > > >host.pre_emphasis);
> > > > +	unsigned int i;
> > > > +
> > > > +	for (i = 0; i < mhdp->link.num_lanes; i++) {
> > > > +		unsigned int val;
> > > > +
> > > > +		val = mhdp->host.volt_swing & CDNS_FORCE_VOLT_SWING ?
> > > > +		      max_volt : req_volt[i];
> > > > +		mhdp_set_adjust_request_voltage(link_status, i, val);
> > > > +
> > > > +		val = mhdp->host.pre_emphasis &
> CDNS_FORCE_PRE_EMPHASIS ?
> > > > +		      max_pre : req_pre[i];
> > > > +		mhdp_set_adjust_request_pre_emphasis(link_status, i, val);
> > > > +	}
> > > > +}
> > > > +
> > > > +static void mhdp_validate_cr(struct cdns_mhdp_device *mhdp, bool
> *cr_done,
> > > > +			     bool *same_before_adjust, bool
> *max_swing_reached,
> > > > +			     u8 before_cr[DP_LINK_STATUS_SIZE],
> > > > +			     u8 after_cr[DP_LINK_STATUS_SIZE], u8 *req_volt,
> > > > +			     u8 *req_pre)
> > > > +{
> > > > +	const u8 max_volt = CDNS_VOLT_SWING(mhdp->host.volt_swing),
> > > > +		 max_pre = CDNS_PRE_EMPHASIS(mhdp-
> > > >host.pre_emphasis);
> > >
> > > Please make that two separate variable declarations.
> > >
> > > > +	bool same_pre, same_volt;
> > > > +	unsigned int i;
> > > > +
> > > > +	*same_before_adjust = false;
> > > > +	*max_swing_reached = false;
> > > > +	*cr_done = drm_dp_clock_recovery_ok(after_cr, mhdp-
> > > >link.num_lanes);
> > > > +
> > > > +	for (i = 0; i < mhdp->link.num_lanes; i++) {
> > > > +		u8 tmp;
> > >
> > > No variable named tmp please. If they're meant to hold an arbitrary
> > > register value, val or value ar better names.
> > >
> > > > +
> > > > +		tmp = drm_dp_get_adjust_request_voltage(after_cr, i);
> > > > +		req_volt[i] = min_t(u8, tmp, max_volt);
> > >
> > > You can use
> > >
> > > 		reg_volt[i] = min(tmp, max_volt);
> > >
> > > as both are of u8 type. Same below.
> > >
> > > > +
> > > > +		tmp = drm_dp_get_adjust_request_pre_emphasis(after_cr, i)
> > > >>
> > > > +		      DP_TRAIN_PRE_EMPHASIS_SHIFT;
> > > > +		req_pre[i] = min_t(u8, tmp, max_pre);
> > > > +
> > > > +		same_pre = (before_cr[i] &
> DP_TRAIN_PRE_EMPHASIS_MASK) ==
> > > > +			   req_pre[i] << DP_TRAIN_PRE_EMPHASIS_SHIFT;
> > > > +		same_volt = (before_cr[i] &
> DP_TRAIN_VOLTAGE_SWING_MASK) ==
> > > > +			    req_volt[i];
> > > > +		if (same_pre && same_volt)
> > > > +			*same_before_adjust = true;
> > > > +
> > > > +		/* 3.1.5.2 in DP Standard v1.4. Table 3-1 */
> > > > +		if (!*cr_done && req_volt[i] + req_pre[i] >= 3) {
> > > > +			*max_swing_reached = true;
> > > > +			return;
> > > > +		}
> > > > +	}
> > > > +}
> > > > +
> > > > +static bool mhdp_link_training_cr(struct cdns_mhdp_device *mhdp)
> > > > +{
> > > > +	u8 lanes_data[CDNS_DP_MAX_NUM_LANES],
> > > > +	fail_counter_short = 0, fail_counter_cr_long = 0;
> > > > +	u8 link_status[DP_LINK_STATUS_SIZE];
> > > > +	bool cr_done;
> > > > +	union phy_configure_opts phy_cfg;
> > > > +	int ret;
> > > > +
> > > > +	dev_dbg(mhdp->dev, "Starting CR phase\n");
> > > > +
> > > > +	ret = mhdp_link_training_init(mhdp);
> > > > +	if (ret)
> > > > +		goto err;
> > > > +
> > > > +	drm_dp_dpcd_read_link_status(&mhdp->aux, link_status);
> > > > +
> > > > +	do {
> > > > +		u8
> requested_adjust_volt_swing[CDNS_DP_MAX_NUM_LANES] = {};
> > > > +		u8
> requested_adjust_pre_emphasis[CDNS_DP_MAX_NUM_LANES] = {};
> > > > +		bool same_before_adjust, max_swing_reached;
> > > > +
> > > > +		mhdp_get_adjust_train(mhdp, link_status, lanes_data,
> &phy_cfg);
> > > > +		phy_cfg.dp.lanes = (mhdp->link.num_lanes);
> > > > +		phy_cfg.dp.ssc = mhdp_get_ssc_supported(mhdp);
> > > > +		phy_cfg.dp.set_lanes = false;
> > > > +		phy_cfg.dp.set_rate = false;
> > > > +		phy_cfg.dp.set_voltages = true;
> > > > +		ret = phy_configure(mhdp->phy,  &phy_cfg);
> > > > +		if (ret) {
> > > > +			dev_err(mhdp->dev, "%s: phy_configure() failed:
> %d\n",
> > > > +				__func__, ret);
> > > > +			goto err;
> > > > +		}
> > > > +
> > > > +		cdns_mhdp_adjust_lt(mhdp, mhdp->link.num_lanes, 100,
> > > > +				    lanes_data, link_status);
> > > > +
> > > > +		mhdp_validate_cr(mhdp, &cr_done, &same_before_adjust,
> > > > +				 &max_swing_reached, lanes_data,
> link_status,
> > > > +				 requested_adjust_volt_swing,
> > > > +				 requested_adjust_pre_emphasis);
> > > > +
> > > > +		if (max_swing_reached) {
> > > > +			dev_err(mhdp->dev, "CR: max swing reached\n");
> > > > +			goto err;
> > > > +		}
> > > > +
> > > > +		if (cr_done) {
> > > > +			dev_dbg(mhdp->dev, "CR phase succeeded\n");
> > > > +			return true;
> > > > +		}
> > > > +
> > > > +		/* Not all CR_DONE bits set */
> > > > +		fail_counter_cr_long++;
> > > > +
> > > > +		if (same_before_adjust) {
> > > > +			fail_counter_short++;
> > > > +			continue;
> > > > +		}
> > > > +
> > > > +		fail_counter_short = 0;
> > > > +		/*
> > > > +		 * Voltage swing/pre-emphasis adjust requested
> > > > +		 * during CR phase
> > > > +		 */
> > > > +		mhdp_adjust_requested_cr(mhdp, link_status,
> > > > +					 requested_adjust_volt_swing,
> > > > +					 requested_adjust_pre_emphasis);
> > > > +	} while (fail_counter_short < 5 && fail_counter_cr_long < 10);
> > > > +
> > > > +err:
> > > > +	dev_dbg(mhdp->dev, "CR phase failed for %d lanes and %d rate\n",
> > > > +		mhdp->link.num_lanes, mhdp->link.rate);
> > > > +
> > > > +	return false;
> > > > +}
> > > > +
> > > > +static void lower_link_rate(struct cdns_mhdp_link *link)
> > > > +{
> > > > +	switch (drm_dp_link_rate_to_bw_code(link->rate)) {
> > > > +	case DP_LINK_BW_2_7:
> > > > +		link->rate =
> drm_dp_bw_code_to_link_rate(DP_LINK_BW_1_62);
> > > > +		break;
> > > > +	case DP_LINK_BW_5_4:
> > > > +		link->rate =
> drm_dp_bw_code_to_link_rate(DP_LINK_BW_2_7);
> > > > +		break;
> > > > +	case DP_LINK_BW_8_1:
> > > > +		link->rate =
> drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
> > > > +		break;
> > > > +	}
> > > > +}
> > > > +
> > > > +static int mhdp_link_training(struct cdns_mhdp_device *mhdp,
> > > > +			      unsigned int training_interval)
> > > > +{
> > > > +	u32 reg32;
> > > > +	const u8 eq_tps = mhdp_eq_training_pattern_supported(mhdp);
> > > > +
> > > > +	while (1) {
> > > > +		if (!mhdp_link_training_cr(mhdp)) {
> > > > +			if (drm_dp_link_rate_to_bw_code(mhdp->link.rate)
> !=
> > > > +			    DP_LINK_BW_1_62) {
> > > > +				dev_dbg(mhdp->dev,
> > > > +					"Reducing link rate during CR
> phase\n");
> > > > +				lower_link_rate(&mhdp->link);
> > > > +
> > > > +				continue;
> > > > +			} else if (mhdp->link.num_lanes > 1) {
> > > > +				dev_dbg(mhdp->dev,
> > > > +					"Reducing lanes number during CR
> phase\n");
> > > > +				mhdp->link.num_lanes >>= 1;
> > > > +				mhdp->link.rate =
> mhdp_max_link_rate(mhdp);
> > > > +
> > > > +				continue;
> > > > +			}
> > > > +
> > > > +			dev_dbg(mhdp->dev,
> > > > +				"Link training failed during CR phase\n");
> > > > +			goto err;
> > > > +		}
> > > > +
> > > > +		if (mhdp_link_training_channel_eq(mhdp, eq_tps,
> > > > +						  training_interval))
> > > > +			break;
> > > > +
> > > > +		if (mhdp->link.num_lanes > 1) {
> > > > +			dev_dbg(mhdp->dev,
> > > > +				"Reducing lanes number during EQ
> phase\n");
> > > > +			mhdp->link.num_lanes >>= 1;
> > > > +
> > > > +			continue;
> > > > +		} else if (drm_dp_link_rate_to_bw_code(mhdp->link.rate) !=
> > > > +			   DP_LINK_BW_1_62) {
> > > > +			dev_dbg(mhdp->dev,
> > > > +				"Reducing link rate during EQ phase\n");
> > > > +			lower_link_rate(&mhdp->link);
> > > > +			mhdp->link.num_lanes =
> mhdp_max_num_lanes(mhdp);
> > > > +
> > > > +			continue;
> > > > +		}
> > > > +
> > > > +		dev_dbg(mhdp->dev, "Link training failed during EQ
> phase\n");
> > > > +		goto err;
> > > > +	}
> > > > +
> > > > +	dev_dbg(mhdp->dev, "Link training successful\n");
> > > > +
> > > > +	drm_dp_dpcd_writeb(&mhdp->aux, DP_TRAINING_PATTERN_SET,
> > > > +			   mhdp->host.scrambler ? 0 :
> > > > +			   DP_LINK_SCRAMBLING_DISABLE);
> > > > +
> > > > +	cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG,
> &reg32);
> > > > +	reg32 &= ~GENMASK(1, 0);
> > > > +	reg32 |= CDNS_DP_NUM_LANES(mhdp->link.num_lanes);
> > > > +	reg32 |= CDNS_DP_WR_FAILING_EDGE_VSYNC;
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG,
> reg32);
> > >
> > > Given how expensive read operations are, you should cache the value of
> > > this register in the cdns_mhdp_device structure and remove all the
> > > reads (unless the register contains volatile bits, but that doesn't seem
> > > to be the case).
> >
> > These registers does not contain volatile bits, and can be cached, however
> we have these
> > register read only few times in the driver and which is minimal and hence
> this read is not
> > considered expensive.
> >
> > > > +
> > > > +	/* Reset PHY config */
> > > > +	reg32 = CDNS_PHY_COMMON_CONFIG |
> CDNS_PHY_TRAINING_TYPE(1);
> > > > +	if (!mhdp->host.scrambler)
> > > > +		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
> > > > +
> > > > +	return 0;
> > > > +err:
> > > > +	/* Reset PHY config */
> > > > +	reg32 = CDNS_PHY_COMMON_CONFIG |
> CDNS_PHY_TRAINING_TYPE(1);
> > > > +	if (!mhdp->host.scrambler)
> > > > +		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
> > > > +
> > > > +	drm_dp_dpcd_writeb(&mhdp->aux, DP_TRAINING_PATTERN_SET,
> > > > +			   DP_TRAINING_PATTERN_DISABLE);
> > > > +
> > > > +	return -EIO;
> > > > +}
> > > > +
> > > > +static void cdns_mhdp_disable(struct drm_bridge *bridge)
> > > > +{
> > > > +	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
> > > > +	u32 resp;
> > > > +
> > > > +	dev_dbg(mhdp->dev, "%s\n", __func__);
> > > > +
> > > > +	cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG,
> &resp);
> > > > +	resp &= ~CDNS_DP_FRAMER_EN;
> > > > +	resp |= CDNS_DP_NO_VIDEO_MODE;
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG,
> resp);
> > > > +
> > > > +	mhdp->link_up = false;
> > > > +
> > > > +	if (mhdp->plugged)
> > > > +		cdns_mhdp_link_power_down(&mhdp->aux, &mhdp->link);
> > > > +
> > > > +	/* Disable VIF clock for stream 0 */
> > > > +	cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
> > >
> > > Same here, can you cache the value, or does the register contain
> > > volatile bits ?
> > >
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
> > > > +			    resp & ~(CDNS_VIF_CLK_EN |
> CDNS_VIF_CLK_RSTN));
> > > > +
> > > > +	if (mhdp->ops && mhdp->ops->disable)
> > > > +		mhdp->ops->disable(mhdp);
> > > > +}
> > > > +
> > > > +static u32 get_training_interval_us(struct cdns_mhdp_device *mhdp,
> > > > +				    u32 interval)
> > > > +{
> > > > +	if (interval == 0)
> > > > +		return 400;
> > > > +	if (interval < 5)
> > > > +		return 4000 << (interval - 1);
> > > > +	dev_err(mhdp->dev,
> > > > +		"wrong training interval returned by DPCD: %d\n", interval);
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static void mhdp_fill_sink_caps(struct cdns_mhdp_device *mhdp,
> > > > +				u8 dpcd[DP_RECEIVER_CAP_SIZE])
> > > > +{
> > > > +	mhdp->sink.link_rate = mhdp->link.rate;
> > > > +	mhdp->sink.lanes_cnt = mhdp->link.num_lanes;
> > > > +	mhdp->sink.enhanced = !!(mhdp->link.capabilities &
> > > > +				 DP_LINK_CAP_ENHANCED_FRAMING);
> > > > +
> > > > +	/* Set SSC support */
> > > > +	mhdp->sink.ssc = !!(dpcd[DP_MAX_DOWNSPREAD] &
> > > > +				  DP_MAX_DOWNSPREAD_0_5);
> > > > +
> > > > +	/* Set TPS support */
> > > > +	mhdp->sink.pattern_supp = CDNS_SUPPORT_TPS(1) |
> CDNS_SUPPORT_TPS(2);
> > > > +	if (drm_dp_tps3_supported(dpcd))
> > > > +		mhdp->sink.pattern_supp |= CDNS_SUPPORT_TPS(3);
> > > > +	if (drm_dp_tps4_supported(dpcd))
> > > > +		mhdp->sink.pattern_supp |= CDNS_SUPPORT_TPS(4);
> > > > +
> > > > +	/* Set fast link support */
> > > > +	mhdp->sink.fast_link = !!(dpcd[DP_MAX_DOWNSPREAD] &
> > > > +				  DP_NO_AUX_HANDSHAKE_LINK_TRAINING);
> > > > +}
> > > > +
> > > > +static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
> > > > +{
> > > > +	u32 resp;
> > > > +	u8 dpcd[DP_RECEIVER_CAP_SIZE], amp[2];
> > > > +	u8 ext_cap_chk = 0;
> > > > +	unsigned int addr;
> > > > +	int err;
> > > > +
> > > > +	drm_dp_dpcd_readb(&mhdp->aux,
> DP_TRAINING_AUX_RD_INTERVAL,
> > > > +			  &ext_cap_chk);
> > > > +
> > > > +	if (ext_cap_chk & DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT)
> > > > +		addr = DP_DP13_DPCD_REV;
> > > > +	else
> > > > +		addr = DP_DPCD_REV;
> > > > +
> > > > +	err = drm_dp_dpcd_read(&mhdp->aux, addr, dpcd,
> DP_RECEIVER_CAP_SIZE);
> > > > +	if (err < 0) {
> > > > +		dev_err(mhdp->dev, "Failed to read receiver capabilities\n");
> > > > +		return err;
> > > > +	}
> > > > +
> > > > +	mhdp->link.revision = dpcd[0];
> > > > +	mhdp->link.rate = drm_dp_bw_code_to_link_rate(dpcd[1]);
> > > > +	mhdp->link.num_lanes = dpcd[2] & DP_MAX_LANE_COUNT_MASK;
> > > > +
> > > > +	if (dpcd[2] & DP_ENHANCED_FRAME_CAP)
> > > > +		mhdp->link.capabilities |=
> DP_LINK_CAP_ENHANCED_FRAMING;
> > > > +
> > > > +	dev_dbg(mhdp->dev, "Set sink device power state via DPCD\n");
> > > > +	cdns_mhdp_link_power_up(&mhdp->aux, &mhdp->link);
> > > > +	mdelay(100);
> > > > +
> > > > +	mhdp_fill_sink_caps(mhdp, dpcd);
> > > > +
> > > > +	mhdp->link.rate = mhdp_max_link_rate(mhdp);
> > > > +	mhdp->link.num_lanes = mhdp_max_num_lanes(mhdp);
> > > > +
> > > > +	/* Disable framer for link training */
> > > > +	cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG,
> &resp);
> > > > +	resp &= ~CDNS_DP_FRAMER_EN;
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG,
> resp);
> > > > +
> > > > +	/* Spread AMP if required, enable 8b/10b coding */
> > > > +	amp[0] = mhdp_get_ssc_supported(mhdp) ? DP_SPREAD_AMP_0_5 :
> 0;
> > > > +	amp[1] = DP_SET_ANSI_8B10B;
> > > > +	drm_dp_dpcd_write(&mhdp->aux, DP_DOWNSPREAD_CTRL, amp,
> 2);
> > > > +
> > > > +	if (mhdp->host.fast_link & mhdp->sink.fast_link) {
> > > > +		dev_err(mhdp->dev, "fastlink not supported\n");
> > > > +		err = -ENOTSUPP;
> > > > +		goto error;
> > > > +	} else {
> > > > +		const u32 interval = dpcd[DP_TRAINING_AUX_RD_INTERVAL]
> &
> > > > +				     DP_TRAINING_AUX_RD_MASK;
> > > > +		const u32 interval_us = get_training_interval_us(mhdp,
> > > > +								 interval);
> > > > +		if (!interval_us ||
> > > > +		    mhdp_link_training(mhdp, interval_us)) {
> > > > +			dev_err(mhdp->dev, "Link training failed.
> Exiting.\n");
> > > > +			err = -EIO;
> > > > +			goto error;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	mhdp->link_up = true;
> > > > +
> > > > +	return 0;
> > > > +error:
> > > > +	return err;
> > > > +}
> > > > +
> > > > +u32 cdns_mhdp_get_bpp(struct cdns_mhdp_display_fmt *fmt)
> > > > +{
> > > > +	u32 bpp;
> > > > +
> > > > +	if (fmt->y_only)
> > > > +		return fmt->bpc;
> > > > +
> > > > +	switch (fmt->color_format) {
> > > > +	case DRM_COLOR_FORMAT_RGB444:
> > > > +	case DRM_COLOR_FORMAT_YCRCB444:
> > > > +		bpp = fmt->bpc * 3;
> > > > +		break;
> > > > +	case DRM_COLOR_FORMAT_YCRCB422:
> > > > +		bpp = fmt->bpc * 2;
> > > > +		break;
> > > > +	case DRM_COLOR_FORMAT_YCRCB420:
> > > > +		bpp = fmt->bpc * 3 / 2;
> > > > +		break;
> > > > +	default:
> > > > +		bpp = fmt->bpc * 3;
> > > > +		WARN_ON(1);
> > > > +	}
> > > > +	return bpp;
> > > > +}
> > > > +
> > > > +static int cdns_mhdp_sst_enable(struct drm_bridge *bridge)
> > > > +{
> > > > +	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
> > > > +	u32 rate, vs, vs_f, required_bandwidth, available_bandwidth;
> > > > +	u32 tu_size = 30, line_thresh1, line_thresh2, line_thresh = 0;
> > > > +	struct drm_display_mode *mode;
> > >
> > > This should be const.
> > >
> > > > +	int pxlclock;
> > > > +	u32 bpp, bpc, pxlfmt;
> > > > +
> > > > +	pxlfmt = mhdp->display_fmt.color_format;
> > > > +	bpc = mhdp->display_fmt.bpc;
> > > > +
> > > > +	mode = &bridge->encoder->crtc->state->mode;
> > >
> > > You shouldn't poke directly in the CRTC state like this, it's only for
> > > legacy helpers. The right way, from a KMS atomic point of view, is to
> > > implement the atomic version of the bridge enable and disable
> > > operations, and do
> > >
> > > 	const struct drm_crtc_state *crtc_state
> > > 	struct drm_connector *connector;
> > > 	struct drm_crtc *crtc;
> > >
> > > 	connector = drm_atomic_get_new_connector_for_encoder(state,
> > > 							     bridge->encoder);
> > > 	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
> > > 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> > > 	mode = &crtc_state->adjusted_mode;
> > >
> > > As you need the mode in two different locations, here and in
> > > cdns_mhdp_configure_video(), I would retrieve it in cdns_mhdp_enable()
> > > and pass it to cdns_mhdp_enable().
> > >
> > > > +	pxlclock = mode->crtc_clock;
> > > > +
> > > > +	mhdp->stream_id = 0;
> > > > +
> > > > +	rate = mhdp->link.rate / 1000;
> > > > +
> > > > +	bpp = cdns_mhdp_get_bpp(&mhdp->display_fmt);
> > > > +
> > > > +	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp-
> > > >link.num_lanes,
> > > > +				    mhdp->link.rate)) {
> > > > +		dev_err(mhdp->dev, "%s: Not enough BW for %s (%u lanes at
> %u Mbps)\n",
> > > > +			__func__, mode->name, mhdp->link.num_lanes,
> > > > +			mhdp->link.rate / 100);
> > > > +		return -EINVAL;
> > > > +	}
> > >
> > > This should be caught at atomic_check time. The enable operation must
> > > not fail except in the case of a hardware failure.
> > >
> > > > +
> > > > +	/* find optimal tu_size */
> > > > +	required_bandwidth = pxlclock * bpp / 8;
> > > > +	available_bandwidth = mhdp->link.num_lanes * rate;
> > > > +	do {
> > > > +		tu_size += 2;
> > > > +
> > > > +		vs_f = tu_size * required_bandwidth / available_bandwidth;
> > > > +		vs = vs_f / 1000;
> > > > +		vs_f = vs_f % 1000;
> > > > +		/* Downspreading is unused currently */
> > > > +	} while ((vs == 1 || ((vs_f > 850 || vs_f < 100) && vs_f != 0) ||
> > > > +		  tu_size - vs < 2) && tu_size < 64);
> > > > +
> > > > +	if (vs > 64) {
> > > > +		dev_err(mhdp->dev,
> > > > +			"%s: No space for framing %s (%u lanes at %u
> Mbps)\n",
> > > > +			__func__, mode->name, mhdp->link.num_lanes,
> > > > +			mhdp->link.rate / 100);
> > > > +		return -EINVAL;
> > > > +	}
> > >
> > > Same here. You can do all these computation in the .atomic_check()
> > > handler, subclass the bridge state, and cache the values in the
> > > subclassed state.
> > >
> > > All validation checks that are not related to hardware operations must
> > > be performed at atomic check time.
> > >
> > > > +
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_TU,
> > > > +			    CDNS_DP_FRAMER_TU_VS(vs) |
> > > > +			    CDNS_DP_FRAMER_TU_SIZE(tu_size) |
> > > > +			    CDNS_DP_FRAMER_TU_CNT_RST_EN);
> > > > +
> > > > +	line_thresh1 = ((vs + 1) << 5) * 8 / bpp;
> > > > +	line_thresh2 = (pxlclock << 5) / 1000 / rate * (vs + 1) - (1 << 5);
> > > > +	line_thresh = line_thresh1 - line_thresh2 / mhdp->link.num_lanes;
> > > > +	line_thresh = (line_thresh >> 5) + 2;
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DP_LINE_THRESH(0),
> > > > +			    line_thresh & GENMASK(5, 0));
> > > > +
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DP_STREAM_CONFIG_2(0),
> > > > +			    CDNS_DP_SC2_TU_VS_DIFF((tu_size - vs > 3) ?
> > > > +						   0 : tu_size - vs));
> > > > +
> > > > +	cdns_mhdp_configure_video(bridge);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +void cdns_mhdp_configure_video(struct drm_bridge *bridge)
> > > > +{
> > > > +	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
> > >
> > > You can pass a struct cdns_mhdp_device pointer directly to this
> > > function.
> > >
> > > > +	unsigned int dp_framer_sp = 0, msa_horizontal_1,
> > > > +		msa_vertical_1, bnd_hsync2vsync, hsync2vsync_pol_ctrl,
> > > > +		misc0 = 0, misc1 = 0, pxl_repr,
> > > > +		front_porch, back_porch, msa_h0, msa_v0, hsync, vsync,
> > > > +		dp_vertical_1;
> > > > +	struct drm_display_mode *mode;
> > > > +	u32 bpp, bpc, pxlfmt;
> > > > +	u32 tmp;
> > >
> > > No tmp here either.
> > >
> > > > +	u8 stream_id = mhdp->stream_id;
> > > > +
> > > > +	mode = &bridge->encoder->crtc->state->mode;
> > > > +
> > > > +	pxlfmt = mhdp->display_fmt.color_format;
> > > > +	bpc = mhdp->display_fmt.bpc;
> > > > +
> > > > +	/* If YCBCR supported and stream not SD, use ITU709
> > > > +	 * Need to handle ITU version with YCBCR420 when supported
> > > > +	 */
> > > > +	if ((pxlfmt == DRM_COLOR_FORMAT_YCRCB444 ||
> > > > +	     pxlfmt == DRM_COLOR_FORMAT_YCRCB422) && mode-
> > > >crtc_vdisplay >= 720)
> > > > +		misc0 = DP_YCBCR_COEFFICIENTS_ITU709;
> > > > +
> > > > +	bpp = cdns_mhdp_get_bpp(&mhdp->display_fmt);
> > > > +
> > > > +	switch (pxlfmt) {
> > > > +	case DRM_COLOR_FORMAT_RGB444:
> > > > +		pxl_repr = CDNS_DP_FRAMER_RGB <<
> CDNS_DP_FRAMER_PXL_FORMAT;
> > > > +		misc0 |= DP_COLOR_FORMAT_RGB;
> > > > +		break;
> > > > +	case DRM_COLOR_FORMAT_YCRCB444:
> > > > +		pxl_repr = CDNS_DP_FRAMER_YCBCR444 <<
> CDNS_DP_FRAMER_PXL_FORMAT;
> > > > +		misc0 |= DP_COLOR_FORMAT_YCbCr444 |
> DP_TEST_DYNAMIC_RANGE_CEA;
> > > > +		break;
> > > > +	case DRM_COLOR_FORMAT_YCRCB422:
> > > > +		pxl_repr = CDNS_DP_FRAMER_YCBCR422 <<
> CDNS_DP_FRAMER_PXL_FORMAT;
> > > > +		misc0 |= DP_COLOR_FORMAT_YCbCr422 |
> DP_TEST_DYNAMIC_RANGE_CEA;
> > > > +		break;
> > > > +	case DRM_COLOR_FORMAT_YCRCB420:
> > > > +		pxl_repr = CDNS_DP_FRAMER_YCBCR420 <<
> CDNS_DP_FRAMER_PXL_FORMAT;
> > > > +		break;
> > > > +	default:
> > > > +		pxl_repr = CDNS_DP_FRAMER_Y_ONLY <<
> CDNS_DP_FRAMER_PXL_FORMAT;
> > > > +	}
> > > > +
> > > > +	switch (bpc) {
> > > > +	case 6:
> > > > +		misc0 |= DP_TEST_BIT_DEPTH_6;
> > > > +		pxl_repr |= CDNS_DP_FRAMER_6_BPC;
> > > > +		break;
> > > > +	case 8:
> > > > +		misc0 |= DP_TEST_BIT_DEPTH_8;
> > > > +		pxl_repr |= CDNS_DP_FRAMER_8_BPC;
> > > > +		break;
> > > > +	case 10:
> > > > +		misc0 |= DP_TEST_BIT_DEPTH_10;
> > > > +		pxl_repr |= CDNS_DP_FRAMER_10_BPC;
> > > > +		break;
> > > > +	case 12:
> > > > +		misc0 |= DP_TEST_BIT_DEPTH_12;
> > > > +		pxl_repr |= CDNS_DP_FRAMER_12_BPC;
> > > > +		break;
> > > > +	case 16:
> > > > +		misc0 |= DP_TEST_BIT_DEPTH_16;
> > > > +		pxl_repr |= CDNS_DP_FRAMER_16_BPC;
> > > > +		break;
> > > > +	}
> > > > +
> > > > +	bnd_hsync2vsync = CDNS_IP_BYPASS_V_INTERFACE;
> > > > +	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> > > > +		bnd_hsync2vsync |= CDNS_IP_DET_INTERLACE_FORMAT;
> > > > +
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_BND_HSYNC2VSYNC(stream_id),
> > > > +			    bnd_hsync2vsync);
> > > > +
> > > > +	hsync2vsync_pol_ctrl = 0;
> > > > +	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> > > > +		hsync2vsync_pol_ctrl |=
> CDNS_H2V_HSYNC_POL_ACTIVE_LOW;
> > > > +	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> > > > +		hsync2vsync_pol_ctrl |=
> CDNS_H2V_VSYNC_POL_ACTIVE_LOW;
> > > > +	cdns_mhdp_reg_write(mhdp,
> CDNS_HSYNC2VSYNC_POL_CTRL(stream_id),
> > > > +			    hsync2vsync_pol_ctrl);
> > > > +
> > > > +	cdns_mhdp_reg_write(mhdp,
> CDNS_DP_FRAMER_PXL_REPR(stream_id), pxl_repr);
> > > > +
> > > > +	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> > > > +		dp_framer_sp |= CDNS_DP_FRAMER_INTERLACE;
> > > > +	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> > > > +		dp_framer_sp |= CDNS_DP_FRAMER_HSYNC_POL_LOW;
> > > > +	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> > > > +		dp_framer_sp |= CDNS_DP_FRAMER_VSYNC_POL_LOW;
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_SP(stream_id),
> dp_framer_sp);
> > > > +
> > > > +	front_porch = mode->crtc_hsync_start - mode->crtc_hdisplay;
> > > > +	back_porch = mode->crtc_htotal - mode->crtc_hsync_end;
> > > > +	cdns_mhdp_reg_write(mhdp,
> CDNS_DP_FRONT_BACK_PORCH(stream_id),
> > > > +			    CDNS_DP_FRONT_PORCH(front_porch) |
> > > > +			    CDNS_DP_BACK_PORCH(back_porch));
> > > > +
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DP_BYTE_COUNT(stream_id),
> > > > +			    mode->crtc_hdisplay * bpp / 8);
> > > > +
> > > > +	msa_h0 = mode->crtc_htotal - mode->crtc_hsync_start;
> > > > +	cdns_mhdp_reg_write(mhdp,
> CDNS_DP_MSA_HORIZONTAL_0(stream_id),
> > > > +			    CDNS_DP_MSAH0_H_TOTAL(mode->crtc_htotal) |
> > > > +			    CDNS_DP_MSAH0_HSYNC_START(msa_h0));
> > > > +
> > > > +	hsync = mode->crtc_hsync_end - mode->crtc_hsync_start;
> > > > +	msa_horizontal_1 = CDNS_DP_MSAH1_HSYNC_WIDTH(hsync) |
> > > > +			   CDNS_DP_MSAH1_HDISP_WIDTH(mode-
> > > >crtc_hdisplay);
> > > > +	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> > > > +		msa_horizontal_1 |= CDNS_DP_MSAH1_HSYNC_POL_LOW;
> > > > +	cdns_mhdp_reg_write(mhdp,
> CDNS_DP_MSA_HORIZONTAL_1(stream_id),
> > > > +			    msa_horizontal_1);
> > > > +
> > > > +	msa_v0 = mode->crtc_vtotal - mode->crtc_vsync_start;
> > > > +	cdns_mhdp_reg_write(mhdp,
> CDNS_DP_MSA_VERTICAL_0(stream_id),
> > > > +			    CDNS_DP_MSAV0_V_TOTAL(mode->crtc_vtotal) |
> > > > +			    CDNS_DP_MSAV0_VSYNC_START(msa_v0));
> > > > +
> > > > +	vsync = mode->crtc_vsync_end - mode->crtc_vsync_start;
> > > > +	msa_vertical_1 = CDNS_DP_MSAV1_VSYNC_WIDTH(vsync) |
> > > > +			 CDNS_DP_MSAV1_VDISP_WIDTH(mode-
> > > >crtc_vdisplay);
> > > > +	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> > > > +		msa_vertical_1 |= CDNS_DP_MSAV1_VSYNC_POL_LOW;
> > > > +	cdns_mhdp_reg_write(mhdp,
> CDNS_DP_MSA_VERTICAL_1(stream_id),
> > > > +			    msa_vertical_1);
> > > > +
> > > > +	if ((mode->flags & DRM_MODE_FLAG_INTERLACE) &&
> > > > +	    mode->crtc_vtotal % 2 == 0)
> > > > +		misc1 = DP_TEST_INTERLACED;
> > > > +	if (mhdp->display_fmt.y_only)
> > > > +		misc1 |= CDNS_DP_TEST_COLOR_FORMAT_RAW_Y_ONLY;
> > > > +	/* Use VSC SDP for Y420 */
> > > > +	if (pxlfmt == DRM_COLOR_FORMAT_YCRCB420)
> > > > +		misc1 = CDNS_DP_TEST_VSC_SDP;
> > > > +
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_MISC(stream_id),
> > > > +			    misc0 | (misc1 << 8));
> > > > +
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DP_HORIZONTAL(stream_id),
> > > > +			    CDNS_DP_H_HSYNC_WIDTH(hsync) |
> > > > +			    CDNS_DP_H_H_TOTAL(mode->crtc_hdisplay));
> > > > +
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DP_VERTICAL_0(stream_id),
> > > > +			    CDNS_DP_V0_VHEIGHT(mode->crtc_vdisplay) |
> > > > +			    CDNS_DP_V0_VSTART(msa_v0));
> > > > +
> > > > +	dp_vertical_1 = CDNS_DP_V1_VTOTAL(mode->crtc_vtotal);
> > > > +	if ((mode->flags & DRM_MODE_FLAG_INTERLACE) &&
> > > > +	    mode->crtc_vtotal % 2 == 0)
> > > > +		dp_vertical_1 |= CDNS_DP_V1_VTOTAL_EVEN;
> > > > +
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DP_VERTICAL_1(stream_id),
> dp_vertical_1);
> > > > +
> > > > +	cdns_mhdp_reg_write_bit(mhdp, CDNS_DP_VB_ID(stream_id), 2, 1,
> > > > +				(mode->flags &
> DRM_MODE_FLAG_INTERLACE) ?
> > > > +				CDNS_DP_VB_ID_INTERLACED : 0);
> > > > +
> > > > +	cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG,
> &tmp);
> > > > +	tmp |= CDNS_DP_FRAMER_EN;
> > > > +	tmp &= ~CDNS_DP_NO_VIDEO_MODE;
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG,
> tmp);
> > > > +}
> > > > +
> > > > +void cdns_mhdp_enable(struct drm_bridge *bridge)
> > > > +{
> > > > +	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
> > > > +	u32 resp;
> > > > +
> > > > +	dev_dbg(mhdp->dev, "bridge enable\n");
> > > > +
> > > > +	if (mhdp->ops && mhdp->ops->enable)
> > > > +		mhdp->ops->enable(mhdp);
> > > > +
> > > > +	/* Enable VIF clock for stream 0 */
> > > > +	cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
> > > > +	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
> > > > +			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
> > > > +
> > > > +	if (!mhdp->link_up)
> > > > +		cdns_mhdp_link_up(mhdp);
> > > > +
> > > > +	cdns_mhdp_sst_enable(bridge);
> > > > +}
> > > > +
> > > > +static void cdns_mhdp_detach(struct drm_bridge *bridge)
> > > > +{
> > > > +	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
> > > > +
> > > > +	dev_dbg(mhdp->dev, "%s\n", __func__);
> > > > +
> > > > +	spin_lock(&mhdp->start_lock);
> > > > +
> > > > +	mhdp->bridge_attached = false;
> > > > +
> > > > +	spin_unlock(&mhdp->start_lock);
> > > > +
> > > > +	writel(~0, mhdp->regs + CDNS_APB_INT_MASK);
> > > > +	writel(~0, mhdp->regs + CDNS_MB_INT_MASK);
> > > > +}
> > > > +
> > > > +static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
> > > > +	.enable = cdns_mhdp_enable,
> > > > +	.disable = cdns_mhdp_disable,
> > > > +	.attach = cdns_mhdp_attach,
> > > > +	.detach = cdns_mhdp_detach,
> > > > +};
> > > > +
> > > > +static int mhdp_probe(struct platform_device *pdev)
> > > > +{
> > > > +	const struct of_device_id *match;
> > > > +	struct resource *regs;
> > > > +	struct cdns_mhdp_device *mhdp;
> > > > +	struct clk *clk;
> > > > +	int ret;
> > > > +	unsigned long rate;
> > > > +	int irq;
> > > > +	u32 lanes_prop;
> > > > +	unsigned int link_rate;
> > > > +
> > > > +	mhdp = devm_kzalloc(&pdev->dev, sizeof(struct cdns_mhdp_device),
> > >
> > > sizeof(*mhdp)
> > >
> > > > +			    GFP_KERNEL);
> > > > +	if (!mhdp)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	clk = devm_clk_get(&pdev->dev, NULL);
> > > > +	if (IS_ERR(clk)) {
> > > > +		dev_err(&pdev->dev, "couldn't get clk: %ld\n", PTR_ERR(clk));
> > > > +		return PTR_ERR(clk);
> > > > +	}
> > > > +
> > > > +	mhdp->clk = clk;
> > > > +	mhdp->dev = &pdev->dev;
> > > > +	mhdp->conn_bus_flags_defaults = DRM_BUS_FLAG_DE_HIGH;
> > >
> > > This is set here and nowhere else. How about hardcoding
> > > DRM_BUS_FLAG_DE_HIGH in the location where this field is used, and
> > > dropping the conn_bus_flags_defaults for now ?
> > >
> > > > +	mutex_init(&mhdp->mbox_mutex);
> > > > +	spin_lock_init(&mhdp->start_lock);
> > > > +	dev_set_drvdata(&pdev->dev, mhdp);
> > > > +
> > > > +	drm_dp_aux_init(&mhdp->aux);
> > > > +	mhdp->aux.dev = &pdev->dev;
> > > > +	mhdp->aux.transfer = mhdp_transfer;
> > > > +
> > > > +	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > +	mhdp->regs = devm_ioremap_resource(&pdev->dev, regs);
> > >
> > > You can use
> > >
> > > 	mhdp->regs = devm_platform_ioremap_resource(&pdev->dev, 0);
> > >
> > > > +	if (IS_ERR(mhdp->regs))
> > > > +		return PTR_ERR(mhdp->regs);
> > > > +
> > > > +	mhdp->phy = devm_of_phy_get_by_index(&pdev->dev, pdev-
> > > >dev.of_node, 0);
> > > > +	if (IS_ERR(mhdp->phy)) {
> > > > +		dev_err(&pdev->dev, "no PHY configured\n");
> > > > +		return PTR_ERR(mhdp->phy);
> > > > +	}
> > > > +
> > > > +	platform_set_drvdata(pdev, mhdp);
> > > > +
> > > > +	clk_prepare_enable(clk);
> > >
> > > You should handle errors.
> > >
> > > Not very nice from a power management point of view :-( Couldn't this be
> > > done in the runtime PM resume handler ?
> >
> > Yes, power management (PM) in itself is a large functionality which would
> function along with
> > runtime suspend/resume handlers. We will take up the PM functions in
> next stage once we have
> > a stable driver in upstream. We are planning to implement driver
> optimization features in the
> > next stage of upstreaming.
> 
> OK, that's nice to hear :-)
> 
> > > > +
> > > > +	match = of_match_device(mhdp_ids, &pdev->dev);
> > > > +	if (!match)
> > > > +		return -ENODEV;
> > >
> > > Here you leave the clock enabled. Just move this block, including the
> > > next line, before clk_prepare_enable().
> > >
> > > > +	mhdp->ops = (struct mhdp_platform_ops *)match->data;
> > > > +
> > > > +	pm_runtime_enable(&pdev->dev);
> > > > +	ret = pm_runtime_get_sync(&pdev->dev);
> > > > +	if (ret < 0) {
> > > > +		dev_err(&pdev->dev, "pm_runtime_get_sync failed\n");
> > > > +		pm_runtime_disable(&pdev->dev);
> > > > +		goto clk_disable;
> > > > +	}
> > >
> > > And of course runtime PM needs to be handled at runtime too, not just at
> > > probe time :-)
> > >
> > > > +
> > > > +	if (mhdp->ops && mhdp->ops->init) {
> > > > +		ret = mhdp->ops->init(mhdp);
> > > > +		if (ret != 0) {
> > > > +			dev_err(&pdev->dev, "MHDP platform initialization
> failed: %d\n",
> > > > +				ret);
> > > > +			goto runtime_put;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	rate = clk_get_rate(clk);
> > > > +	writel(rate % 1000000, mhdp->regs + CDNS_SW_CLK_L);
> > > > +	writel(rate / 1000000, mhdp->regs + CDNS_SW_CLK_H);
> > > > +
> > > > +	dev_dbg(&pdev->dev, "func clk rate %lu Hz\n", rate);
> > > > +
> > > > +	writel(~0, mhdp->regs + CDNS_MB_INT_MASK);
> > > > +	writel(~0, mhdp->regs + CDNS_APB_INT_MASK);
> > > > +
> > > > +	irq = platform_get_irq(pdev, 0);
> > > > +	ret = devm_request_threaded_irq(mhdp->dev, irq, NULL,
> mhdp_irq_handler,
> > > > +					IRQF_ONESHOT, "mhdp8546",
> mhdp);
> > > > +	if (ret) {
> > > > +		dev_err(&pdev->dev, "cannot install IRQ %d\n", irq);
> > > > +		ret = -EIO;
> > > > +		goto plat_fini;
> > > > +	}
> > > > +
> > > > +	/* Read source capabilities, based on PHY's device tree properties. */
> > > > +	ret = device_property_read_u32(&mhdp->phy->dev, "cdns,num-
> lanes",
> > > > +				       &(lanes_prop));
> > >
> > > No need for parentheses.
> > >
> > > Ouch, you're reading DT properties of a different node, that's pretty
> > > bad. This driver can't assume what PHY will be used, and what DT
> > > properties it will have. The number of lanes and link rate need to be
> > > queried from the PHY, using the kernel PHY API. phy_get_bus_width()
> > > seems to be a candidate for the number of lanes. For the link frequency,
> > > you may need to extend the PHY API, but I haven't really looked at how
> > > this is used.
> > >
> > > > +	if (ret)
> > > > +		mhdp->host.lanes_cnt = CDNS_LANE_4;
> > > > +	else
> > > > +		mhdp->host.lanes_cnt = lanes_prop;
> > >
> > > If not for the fact that you shouldn't read this property from DT, you
> > > could write
> > >
> > > 	mhdp->host.lanes_cnt = CDNS_LANE_4;
> > > 	device_property_read_u32(&mhdp->phy->dev, "cdns,num-lanes",
> > > 				 &lanes_prop);
> > >
> > > > +
> > > > +	ret = device_property_read_u32(&mhdp->phy->dev, "cdns,max-bit-
> rate",
> > > > +				       &(link_rate));
> > > > +	if (ret)
> > > > +		link_rate =
> drm_dp_bw_code_to_link_rate(DP_LINK_BW_8_1);
> > > > +	else
> > > > +		/* PHY uses Mb/s, DRM uses tens of kb/s. */
> > > > +		link_rate *= 100;
> > > > +
> > > > +	mhdp->host.link_rate = link_rate;
> > > > +	mhdp->host.volt_swing = CDNS_VOLT_SWING(3);
> > > > +	mhdp->host.pre_emphasis = CDNS_PRE_EMPHASIS(3);
> > > > +	mhdp->host.pattern_supp = CDNS_SUPPORT_TPS(1) |
> > > > +				  CDNS_SUPPORT_TPS(2) |
> CDNS_SUPPORT_TPS(3) |
> > > > +				  CDNS_SUPPORT_TPS(4);
> > > > +	mhdp->host.lane_mapping = CDNS_LANE_MAPPING_NORMAL;
> > > > +	mhdp->host.fast_link = false;
> > > > +	mhdp->host.enhanced = true;
> > > > +	mhdp->host.scrambler = true;
> > > > +	mhdp->host.ssc = false;
> > >
> > > I would split intialization of mhdp->host to a separate function, probe
> > > is too large and hard to read.
> > >
> > > > +
> > > > +	/* The only currently supported format */
> > > > +	mhdp->display_fmt.y_only = false;
> > > > +	mhdp->display_fmt.color_format = DRM_COLOR_FORMAT_RGB444;
> > > > +	mhdp->display_fmt.bpc = 8;
> > > > +
> > > > +	mhdp->bridge.of_node = pdev->dev.of_node;
> > > > +	mhdp->bridge.funcs = &cdns_mhdp_bridge_funcs;
> > > > +
> > > > +	ret = phy_init(mhdp->phy);
> > > > +	if (ret) {
> > > > +		dev_err(mhdp->dev, "Failed to initialize PHY: %d\n", ret);
> > > > +		goto runtime_put;
> > > > +	}
> > > > +
> > > > +	ret = load_firmware(mhdp);
> > > > +	if (ret)
> > > > +		goto phy_exit;
> > > > +
> > > > +	drm_bridge_add(&mhdp->bridge);
> > >
> > > What if someone starts using the bridge before the firmware is
> > > operational ? It seems that you should delay bridge registration until
> > > the firmware is loaded. It may make it possible to remove
> > > bridge_attached and solve the problem you mention in mhdp_fw_cb().
> > >
> > > > +
> > > > +	return 0;
> > > > +
> > > > +phy_exit:
> > > > +	phy_exit(mhdp->phy);
> > > > +plat_fini:
> > > > +	if (mhdp->ops && mhdp->ops->exit)
> > > > +		mhdp->ops->exit(mhdp);
> > > > +runtime_put:
> > > > +	pm_runtime_put_sync(&pdev->dev);
> > > > +	pm_runtime_disable(&pdev->dev);
> > > > +clk_disable:
> > > > +	clk_disable_unprepare(mhdp->clk);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +MODULE_FIRMWARE(FW_NAME);
> > >
> > > You can move this to the end of the file with the other MODULE_*
> macros.
> > >
> > > > +
> > > > +static int mhdp_remove(struct platform_device *pdev)
> > > > +{
> > > > +	struct cdns_mhdp_device *mhdp = dev_get_drvdata(&pdev->dev);
> > > > +	unsigned int timeout = 10;
> > > > +	bool stop_fw = false;
> > > > +	int ret = 0;
> > > > +
> > > > +	drm_bridge_remove(&mhdp->bridge);
> > > > +
> > > > +wait_loading:
> > > > +	spin_lock(&mhdp->start_lock);
> > > > +	if (mhdp->hw_state == MHDP_HW_LOADING && timeout-- > 0) {
> > > > +		spin_unlock(&mhdp->start_lock);
> > > > +		msleep(100);
> > > > +		goto wait_loading;
> > > > +	} else if (mhdp->hw_state == MHDP_HW_READY) {
> > > > +		stop_fw = true;
> > > > +		timeout = 1; /* We were successful even if counter reached 0
> */
> > > > +	}
> > > > +	mhdp->hw_state = MHDP_HW_STOPPED;
> > > > +	spin_unlock(&mhdp->start_lock);
> > > > +
> > > > +	if (timeout == 0)
> > > > +		dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
> > > > +			__func__);
> > >
> > > How about using a wait queue instead of this manual loop ?
> > >
> > > > +
> > > > +	if (stop_fw) {
> > > > +		ret = cdns_mhdp_set_firmware_active(mhdp, false);
> > > > +		if (ret)
> > > > +			dev_err(mhdp->dev, "%s: De-activate FW failed:
> %d\n",
> > > > +				__func__, ret);
> > > > +	}
> > > > +
> > > > +	phy_exit(mhdp->phy);
> > > > +
> > > > +	if (mhdp->ops && mhdp->ops->exit)
> > > > +		mhdp->ops->exit(mhdp);
> > > > +
> > > > +	pm_runtime_put_sync(&pdev->dev);
> > > > +	pm_runtime_disable(&pdev->dev);
> > > > +
> > > > +	clk_disable_unprepare(mhdp->clk);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static struct platform_driver mhdp_driver = {
> > > > +	.driver	= {
> > > > +		.name		= "cdns-mhdp",
> > > > +		.of_match_table	= of_match_ptr(mhdp_ids),
> > > > +	},
> > > > +	.probe	= mhdp_probe,
> > > > +	.remove	= mhdp_remove,
> > > > +};
> > > > +module_platform_driver(mhdp_driver);
> > > > +
> > > > +MODULE_AUTHOR("Quentin Schulz <quentin.schulz@free-
> electrons.com>");
> > > > +MODULE_AUTHOR("Swapnil Jakhade <sjakhade@cadence.com>");
> > > > +MODULE_DESCRIPTION("Cadence MHDP DP bridge driver");
> > > > +MODULE_LICENSE("GPL");
> > > > +MODULE_ALIAS("platform:cdns-mhdp");
> > > > diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-core.h
> b/drivers/gpu/drm/bridge/cdns-mhdp-core.h
> > > > new file mode 100644
> > > > index 000000000000..f8df54917816
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/bridge/cdns-mhdp-core.h
> > > > @@ -0,0 +1,380 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +/*
> > > > + * Cadence MHDP DP bridge driver.
> > > > + *
> > > > + * Copyright: 2019 Cadence Design Systems, Inc.
> > > > + *
> > > > + * Author: Quentin Schulz <quentin.schulz@free-electrons.com>
> > > > + *         Swapnil Jakhade <sjakhade@cadence.com>
> > > > + */
> > > > +
> > > > +#ifndef CDNS_MHDP_CORE_H
> > > > +#define CDNS_MHDP_CORE_H
> > > > +
> > > > +#include <drm/drm_bridge.h>
> > > > +#include <drm/drm_connector.h>
> > > > +#include <drm/drm_dp_helper.h>
> > >
> > > You also need
> > >
> > > #include <linux/bits.h>
> > > #include <linux/mutex.h>
> > > #include <linux/spinlock.h>
> > >
> > > and a forward declaration of
> > >
> > > struct clk;
> > > struct device;
> > > struct phy;
> > >
> > > to make sure this header is self-contained.
> > >
> > > > +
> > > > +/* Register offsets */
> > > > +#define CDNS_APB_CFG				0x00000
> > > > +#define CDNS_APB_CTRL				(CDNS_APB_CFG +
> 0x00)
> > >
> > > I would define registers with a full address:
> > >
> > > #define CDNS_APB_CTRL				0x0000
> > > ...
> > > #define CDNS_MAILBOX_FULL			0x0008
> > > ...
> > > #define CDNS_DP_FRAMER_TU			0x2208
> > >
> > > Using bases and offsets doesn't add much, but makes it more difficult to
> > > find the register macro from the numerical address when debugging.
> > >
> > >
> > > > +#define CDNS_CPU_STALL				BIT(3)
> > > > +
> > > > +#define CDNS_MAILBOX_FULL			(CDNS_APB_CFG +
> 0x08)
> > > > +#define CDNS_MAILBOX_EMPTY			(CDNS_APB_CFG +
> 0x0c)
> > > > +#define CDNS_MAILBOX_TX_DATA
> 	(CDNS_APB_CFG + 0x10)
> > > > +#define CDNS_MAILBOX_RX_DATA
> 	(CDNS_APB_CFG + 0x14)
> > > > +#define CDNS_KEEP_ALIVE
> 	(CDNS_APB_CFG + 0x18)
> > > > +#define CDNS_KEEP_ALIVE_MASK			GENMASK(7,
> 0)
> > > > +
> > > > +#define CDNS_MB_INT_MASK			(CDNS_APB_CFG +
> 0x34)
> > > > +#define CDNS_MB_INT_STATUS			(CDNS_APB_CFG +
> 0x38)
> > > > +
> > > > +#define CDNS_SW_CLK_L
> 	(CDNS_APB_CFG + 0x3c)
> > > > +#define CDNS_SW_CLK_H
> 	(CDNS_APB_CFG + 0x40)
> > > > +#define CDNS_SW_EVENT0
> 	(CDNS_APB_CFG + 0x44)
> > > > +#define CDNS_DPTX_HPD				BIT(0)
> > > > +
> > > > +#define CDNS_SW_EVENT1
> 	(CDNS_APB_CFG + 0x48)
> > > > +#define CDNS_SW_EVENT2
> 	(CDNS_APB_CFG + 0x4c)
> > > > +#define CDNS_SW_EVENT3
> 	(CDNS_APB_CFG + 0x50)
> > > > +
> > > > +#define CDNS_APB_INT_MASK			(CDNS_APB_CFG +
> 0x6C)
> > > > +#define CDNS_APB_INT_MASK_MAILBOX_INT		BIT(0)
> > > > +#define CDNS_APB_INT_MASK_SW_EVENT_INT		BIT(1)
> > > > +#define CDNS_APB_INT_STATUS			(CDNS_APB_CFG +
> 0x70)
> > > > +
> > > > +#define CDNS_DPTX_CAR
> 	(CDNS_APB_CFG + 0x904)
> > > > +#define CDNS_VIF_CLK_EN				BIT(0)
> > > > +#define CDNS_VIF_CLK_RSTN			BIT(1)
> > > > +
> > > > +#define CDNS_SOURCE_VIDEO_IF(s)			(0x00b00 +
> ((s) * 0x20))
> > > > +#define CDNS_BND_HSYNC2VSYNC(s) 	(CDNS_SOURCE_VIDEO_IF(s)
> + \
> > > > +						 0x00)
> > > > +#define CDNS_IP_DTCT_WIN			GENMASK(11, 0)
> > > > +#define CDNS_IP_DET_INTERLACE_FORMAT		BIT(12)
> > > > +#define CDNS_IP_BYPASS_V_INTERFACE		BIT(13)
> > > > +
> > > > +#define CDNS_HSYNC2VSYNC_POL_CTRL(s)
> 	(CDNS_SOURCE_VIDEO_IF(s) + \
> > > > +						 0x10)
> > > > +#define CDNS_H2V_HSYNC_POL_ACTIVE_LOW		BIT(1)
> > > > +#define CDNS_H2V_VSYNC_POL_ACTIVE_LOW		BIT(2)
> > > > +
> > > > +#define CDNS_DPTX_PHY_CONFIG			0x02000
> > > > +#define CDNS_PHY_TRAINING_EN			BIT(0)
> > > > +#define CDNS_PHY_TRAINING_TYPE(x)		(((x) & GENMASK(3,
> 0)) << 1)
> > > > +#define CDNS_PHY_SCRAMBLER_BYPASS		BIT(5)
> > > > +#define CDNS_PHY_ENCODER_BYPASS			BIT(6)
> > > > +#define CDNS_PHY_SKEW_BYPASS			BIT(7)
> > > > +#define CDNS_PHY_TRAINING_AUTO			BIT(8)
> > > > +#define CDNS_PHY_LANE0_SKEW(x)			(((x) &
> GENMASK(2, 0)) << 9)
> > > > +#define CDNS_PHY_LANE1_SKEW(x)			(((x) &
> GENMASK(2, 0)) << 12)
> > > > +#define CDNS_PHY_LANE2_SKEW(x)			(((x) &
> GENMASK(2, 0)) << 15)
> > > > +#define CDNS_PHY_LANE3_SKEW(x)			(((x) &
> GENMASK(2, 0)) << 18)
> > > > +#define CDNS_PHY_COMMON_CONFIG 	(CDNS_PHY_LANE1_SKEW(1)
> | \
> > > > +						CDNS_PHY_LANE2_SKEW(2) |
> \
> > > > +						CDNS_PHY_LANE3_SKEW(3))
> > > > +#define CDNS_PHY_10BIT_EN			BIT(21)
> > > > +
> > > > +#define CDNS_DPTX_FRAMER			0x02200
> > > > +#define CDNS_DP_FRAMER_GLOBAL_CONFIG
> 	(CDNS_DPTX_FRAMER + 0x00)
> > > > +#define CDNS_DP_NUM_LANES(x)			((x) - 1)
> > > > +#define CDNS_DP_MST_EN				BIT(2)
> > > > +#define CDNS_DP_FRAMER_EN			BIT(3)
> > > > +#define CDNS_DP_RATE_GOVERNOR_EN		BIT(4)
> > > > +#define CDNS_DP_NO_VIDEO_MODE			BIT(5)
> > > > +#define CDNS_DP_DISABLE_PHY_RST			BIT(6)
> > > > +#define CDNS_DP_WR_FAILING_EDGE_VSYNC		BIT(7)
> > > > +
> > > > +#define CDNS_DP_FRAMER_TU 	(CDNS_DPTX_FRAMER + 0x08)
> > > > +#define CDNS_DP_FRAMER_TU_SIZE(x)		(((x) & GENMASK(6,
> 0)) << 8)
> > > > +#define CDNS_DP_FRAMER_TU_VS(x)			((x) &
> GENMASK(5, 0))
> > > > +#define CDNS_DP_FRAMER_TU_CNT_RST_EN		BIT(15)
> > > > +
> > > > +#define CDNS_DPTX_STREAM(s)			(0x03000 + (s) * 0x80)
> > > > +#define CDNS_DP_MSA_HORIZONTAL_0(s)
> 	(CDNS_DPTX_STREAM(s) + 0x00)
> > > > +#define CDNS_DP_MSAH0_H_TOTAL(x)		(x)
> > > > +#define CDNS_DP_MSAH0_HSYNC_START(x)		((x) << 16)
> > > > +
> > > > +#define CDNS_DP_MSA_HORIZONTAL_1(s)
> 	(CDNS_DPTX_STREAM(s) + 0x04)
> > > > +#define CDNS_DP_MSAH1_HSYNC_WIDTH(x)		(x)
> > > > +#define CDNS_DP_MSAH1_HSYNC_POL_LOW		BIT(15)
> > > > +#define CDNS_DP_MSAH1_HDISP_WIDTH(x)		((x) << 16)
> > > > +
> > > > +#define CDNS_DP_MSA_VERTICAL_0(s) 	(CDNS_DPTX_STREAM(s) +
> 0x08)
> > > > +#define CDNS_DP_MSAV0_V_TOTAL(x)		(x)
> > > > +#define CDNS_DP_MSAV0_VSYNC_START(x)		((x) << 16)
> > > > +
> > > > +#define CDNS_DP_MSA_VERTICAL_1(s) 	(CDNS_DPTX_STREAM(s) +
> 0x0c)
> > > > +#define CDNS_DP_MSAV1_VSYNC_WIDTH(x)		(x)
> > > > +#define CDNS_DP_MSAV1_VSYNC_POL_LOW		BIT(15)
> > > > +#define CDNS_DP_MSAV1_VDISP_WIDTH(x)		((x) << 16)
> > > > +
> > > > +#define CDNS_DP_MSA_MISC(s) 	(CDNS_DPTX_STREAM(s) + 0x10)
> > > > +#define CDNS_DP_STREAM_CONFIG(s) 	(CDNS_DPTX_STREAM(s) +
> 0x14)
> > > > +#define CDNS_DP_STREAM_CONFIG_2(s)
> 	(CDNS_DPTX_STREAM(s) + 0x2c)
> > > > +#define CDNS_DP_SC2_TU_VS_DIFF(x)		((x) << 8)
> > > > +
> > > > +#define CDNS_DP_HORIZONTAL(s) 	(CDNS_DPTX_STREAM(s) +
> 0x30)
> > > > +#define CDNS_DP_H_HSYNC_WIDTH(x)		(x)
> > > > +#define CDNS_DP_H_H_TOTAL(x)			((x) << 16)
> > > > +
> > > > +#define CDNS_DP_VERTICAL_0(s) 	(CDNS_DPTX_STREAM(s) +
> 0x34)
> > > > +#define CDNS_DP_V0_VHEIGHT(x)			(x)
> > > > +#define CDNS_DP_V0_VSTART(x)			((x) << 16)
> > > > +
> > > > +#define CDNS_DP_VERTICAL_1(s) 	(CDNS_DPTX_STREAM(s) +
> 0x38)
> > > > +#define CDNS_DP_V1_VTOTAL(x)			(x)
> > > > +#define CDNS_DP_V1_VTOTAL_EVEN			BIT(16)
> > > > +
> > > > +#define CDNS_DP_FRAMER_PXL_REPR(s)
> 	(CDNS_DPTX_STREAM(s) + 0x4c)
> > > > +#define CDNS_DP_FRAMER_6_BPC			BIT(0)
> > > > +#define CDNS_DP_FRAMER_8_BPC			BIT(1)
> > > > +#define CDNS_DP_FRAMER_10_BPC			BIT(2)
> > > > +#define CDNS_DP_FRAMER_12_BPC			BIT(3)
> > > > +#define CDNS_DP_FRAMER_16_BPC			BIT(4)
> > > > +#define CDNS_DP_FRAMER_PXL_FORMAT		0x8
> > > > +#define CDNS_DP_FRAMER_RGB			BIT(0)
> > > > +#define CDNS_DP_FRAMER_YCBCR444			BIT(1)
> > > > +#define CDNS_DP_FRAMER_YCBCR422			BIT(2)
> > > > +#define CDNS_DP_FRAMER_YCBCR420			BIT(3)
> > > > +#define CDNS_DP_FRAMER_Y_ONLY			BIT(4)
> > > > +
> > > > +#define CDNS_DP_FRAMER_SP(s) 	(CDNS_DPTX_STREAM(s) +
> 0x50)
> > > > +#define CDNS_DP_FRAMER_VSYNC_POL_LOW		BIT(0)
> > > > +#define CDNS_DP_FRAMER_HSYNC_POL_LOW		BIT(1)
> > > > +#define CDNS_DP_FRAMER_INTERLACE		BIT(2)
> > > > +
> > > > +#define CDNS_DP_LINE_THRESH(s) 	(CDNS_DPTX_STREAM(s) +
> 0x64)
> > > > +#define CDNS_DP_ACTIVE_LINE_THRESH(x)		(x)
> > > > +
> > > > +#define CDNS_DP_VB_ID(s)
> 	(CDNS_DPTX_STREAM(s) + 0x68)
> > > > +#define CDNS_DP_VB_ID_INTERLACED		BIT(2)
> > > > +#define CDNS_DP_VB_ID_COMPRESSED		BIT(6)
> > > > +
> > > > +#define CDNS_DP_FRONT_BACK_PORCH(s)
> 	(CDNS_DPTX_STREAM(s) + 0x78)
> > > > +#define CDNS_DP_BACK_PORCH(x)			(x)
> > > > +#define CDNS_DP_FRONT_PORCH(x)			((x) << 16)
> > > > +
> > > > +#define CDNS_DP_BYTE_COUNT(s) 	(CDNS_DPTX_STREAM(s) +
> 0x7c)
> > > > +#define CDNS_DP_BYTE_COUNT_BYTES_IN_CHUNK_SHIFT	16
> > > > +
> > > > +#define CDNS_DP_MST_STREAM_CONFIG(s)
> 	(CDNS_DPTX_STREAM(s) + 0x14)
> > > > +#define CDNS_DP_MST_STRM_CFG_STREAM_EN		BIT(0)
> > > > +#define CDNS_DP_MST_STRM_CFG_NO_VIDEO		BIT(1)
> > > > +
> > > > +#define CDNS_DP_MST_SLOT_ALLOCATE(s)
> 	(CDNS_DPTX_STREAM(s) + 0x44)
> > > > +#define CDNS_DP_S_ALLOC_START_SLOT(x)		(x)
> > > > +#define CDNS_DP_S_ALLOC_END_SLOT(x)		((x) << 8)
> > > > +
> > > > +#define CDNS_DP_RATE_GOVERNING(s) 	(CDNS_DPTX_STREAM(s) +
> 0x48)
> > > > +#define CDNS_DP_RG_TARG_AV_SLOTS_Y(x)		(x)
> > > > +#define CDNS_DP_RG_TARG_AV_SLOTS_X(x)		((x) << 4)
> > > > +#define CDNS_DP_RG_ENABLE			BIT(10)
> > > > +
> > > > +#define CDNS_DP_MTPH_CONTROL			0x2264
> > > > +#define CDNS_DP_MTPH_ECF_EN			BIT(0)
> > > > +#define CDNS_DP_MTPH_ACT_EN			BIT(1)
> > > > +#define CDNS_DP_MTPH_LVP_EN			BIT(2)
> > > > +
> > > > +#define CDNS_DP_MTPH_STATUS			0x226C
> > > > +#define CDNS_DP_MTPH_ACT_STATUS			BIT(0)
> > > > +
> > > > +#define CDNS_DPTX_GLOBAL			0x02300
> > > > +#define CDNS_DP_LANE_EN
> 	(CDNS_DPTX_GLOBAL + 0x00)
> > > > +#define CDNS_DP_LANE_EN_LANES(x)		GENMASK((x) - 1, 0)
> > > > +#define CDNS_DP_ENHNCD
> 	(CDNS_DPTX_GLOBAL + 0x04)
> > > > +
> > > > +/* mailbox */
> > > > +#define MAILBOX_RETRY_US			1000
> > > > +#define MAILBOX_TIMEOUT_US			2000000
> > > > +
> > > > +#define MB_OPCODE_ID				0
> > > > +#define MB_MODULE_ID				1
> > > > +#define MB_SIZE_MSB_ID				2
> > > > +#define MB_SIZE_LSB_ID				3
> > > > +#define MB_DATA_ID				4
> > > > +
> > > > +#define MB_MODULE_ID_DP_TX			0x01
> > > > +#define MB_MODULE_ID_HDCP_TX			0x07
> > > > +#define MB_MODULE_ID_HDCP_RX			0x08
> > > > +#define MB_MODULE_ID_HDCP_GENERAL		0x09
> > > > +#define MB_MODULE_ID_GENERAL			0x0a
> > > > +
> > > > +/* firmware and opcodes */
> > > > +#define FW_NAME 	"cadence/mhdp8546.bin"
> > > > +#define CDNS_MHDP_IMEM				0x10000
> > > > +
> > > > +#define GENERAL_MAIN_CONTROL			0x01
> > > > +#define GENERAL_TEST_ECHO			0x02
> > > > +#define GENERAL_BUS_SETTINGS			0x03
> > > > +#define GENERAL_TEST_ACCESS			0x04
> > > > +#define GENERAL_REGISTER_READ			0x07
> > > > +
> > > > +#define DPTX_SET_POWER_MNG			0x00
> > > > +#define DPTX_SET_HOST_CAPABILITIES		0x01
> > > > +#define DPTX_GET_EDID				0x02
> > > > +#define DPTX_READ_DPCD				0x03
> > > > +#define DPTX_WRITE_DPCD				0x04
> > > > +#define DPTX_ENABLE_EVENT			0x05
> > > > +#define DPTX_WRITE_REGISTER			0x06
> > > > +#define DPTX_READ_REGISTER			0x07
> > > > +#define DPTX_WRITE_FIELD			0x08
> > > > +#define DPTX_TRAINING_CONTROL			0x09
> > > > +#define DPTX_READ_EVENT				0x0a
> > > > +#define DPTX_READ_LINK_STAT			0x0b
> > > > +#define DPTX_SET_VIDEO				0x0c
> > > > +#define DPTX_SET_AUDIO				0x0d
> > > > +#define DPTX_GET_LAST_AUX_STAUS			0x0e
> > > > +#define DPTX_SET_LINK_BREAK_POINT		0x0f
> > > > +#define DPTX_FORCE_LANES			0x10
> > > > +#define DPTX_HPD_STATE				0x11
> > > > +#define DPTX_ADJUST_LT				0x12
> > > > +
> > > > +#define FW_STANDBY				0
> > > > +#define FW_ACTIVE				1
> > > > +
> > > > +/* HPD */
> > > > +#define DPTX_READ_EVENT_HPD_TO_HIGH             BIT(0)
> > > > +#define DPTX_READ_EVENT_HPD_TO_LOW              BIT(1)
> > > > +#define DPTX_READ_EVENT_HPD_PULSE               BIT(2)
> > > > +#define DPTX_READ_EVENT_HPD_STATE               BIT(3)
> > > > +
> > > > +/* general */
> > > > +#define CDNS_DP_TRAINING_PATTERN_4		0x7
> > > > +
> > > > +#define CDNS_KEEP_ALIVE_TIMEOUT			2000
> > > > +
> > > > +#define CDNS_LANE_1				1
> > > > +#define CDNS_LANE_2				2
> > > > +#define CDNS_LANE_4				4
> > >
> > > These really don't add anything, just use 1, 2 and 4 directly in the
> > > code.
> > >
> > > > +
> > > > +#define CDNS_VOLT_SWING(x)			((x) & GENMASK(1,
> 0))
> > > > +#define CDNS_FORCE_VOLT_SWING			BIT(2)
> > > > +
> > > > +#define CDNS_PRE_EMPHASIS(x)			((x) & GENMASK(1,
> 0))
> > > > +#define CDNS_FORCE_PRE_EMPHASIS			BIT(2)
> > > > +
> > > > +#define CDNS_SUPPORT_TPS(x)			BIT((x) - 1)
> > > > +
> > > > +#define CDNS_FAST_LINK_TRAINING			BIT(0)
> > > > +
> > > > +#define CDNS_LANE_MAPPING_TYPE_C_LANE_0(x)	((x) &
> GENMASK(1, 0))
> > > > +#define CDNS_LANE_MAPPING_TYPE_C_LANE_1(x)	((x) &
> GENMASK(3, 2))
> > > > +#define CDNS_LANE_MAPPING_TYPE_C_LANE_2(x)	((x) &
> GENMASK(5, 4))
> > > > +#define CDNS_LANE_MAPPING_TYPE_C_LANE_3(x)	((x) &
> GENMASK(7, 6))
> > > > +#define CDNS_LANE_MAPPING_NORMAL		0xe4
> > > > +#define CDNS_LANE_MAPPING_FLIPPED		0x1b
> > > > +
> > > > +#define CDNS_DP_MAX_NUM_LANES			4
> > > > +#define CDNS_DP_TEST_VSC_SDP			BIT(6) /* 1.3+
> */
> > > > +#define CDNS_DP_TEST_COLOR_FORMAT_RAW_Y_ONLY	BIT(7)
> > > > +
> > > > +#define CDNS_MHDP_MAX_STREAMS   4
> > > > +
> > > > +#define connector_to_mhdp(x) container_of(x, struct
> cdns_mhdp_device, connector)
> > > > +#define bridge_to_mhdp(x) container_of(x, struct cdns_mhdp_device,
> bridge)
> > >
> > > These two macros should go below the definition of the
> cdns_mhdp_device
> > > structure.
> > >
> > > > +
> > > > +#define DP_LINK_CAP_ENHANCED_FRAMING BIT(0)
> > > > +
> > > > +struct cdns_mhdp_link {
> > > > +	unsigned char revision;
> > > > +	unsigned int rate;
> > > > +	unsigned int num_lanes;
> > > > +	unsigned long capabilities;
> > > > +};
> > > > +
> > > > +struct cdns_mhdp_host {
> > > > +	unsigned int link_rate;
> > >
> > > If I'm not mistaken, this is the maximum link rate, not the actual link
> > > rate. Should it be renamed to max_link_rate ?
> > >
> > > > +	u8 lanes_cnt;
> > > > +	u8 volt_swing;
> > > > +	u8 pre_emphasis;
> > > > +	u8 pattern_supp;
> > > > +	u8 lane_mapping;
> > > > +	u8 fast_link : 1;
> > > > +	u8 enhanced : 1;
> > > > +	u8 scrambler : 1;
> > > > +	u8 ssc : 1;
> > > > +};
> > > > +
> > > > +struct cdns_mhdp_sink {
> > > > +	unsigned int link_rate;
> > > > +	u8 lanes_cnt;
> > > > +	u8 pattern_supp;
> > > > +	u8 fast_link : 1;
> > > > +	u8 enhanced : 1;
> > > > +	u8 ssc : 1;
> > > > +};
> > > > +
> > > > +struct cdns_mhdp_display_fmt {
> > > > +	u32 color_format;
> > > > +	u32 bpc;
> > > > +	u8 y_only : 1;
> > > > +};
> > > > +
> > > > +/*
> > > > + * These enums present MHDP hw initialization state
> > > > + * Legal state transitions are:
> > > > + * MHDP_HW_INACTIVE <-> MHDP_HW_LOADING ->
> MHDP_HW_READY
> > > > + *        |                                     |
> > > > + *        '----------> MHDP_HW_STOPPED <--------'
> > > > + */
> > > > +enum mhdp_hw_state { MHDP_HW_INACTIVE = 0, /* HW not
> initialized */
> > > > +		     MHDP_HW_LOADING,	   /* HW initialization in
> progress */
> > > > +		     MHDP_HW_READY,	   /* HW ready, FW active*/
> > > > +		     MHDP_HW_STOPPED };	   /* Driver removal FW to be
> stopped */
> > >
> > > That's weird indentation, following the kernel coding style it should
> > > become
> > >
> > > enum mhdp_hw_state {
> > > 	MHDP_HW_INACTIVE = 0,	/* HW not initialized */
> > > 	MHDP_HW_LOADING,	/* HW initialization in progress */
> > > 	MHDP_HW_READY,		/* HW ready, FW active*/
> > > 	MHDP_HW_STOPPED,	/* Driver removal FW to be stopped */
> > > };
> > >
> > > > +
> > > > +struct cdns_mhdp_device;
> > > > +
> > > > +struct mhdp_platform_ops {
> > > > +	int (*init)(struct cdns_mhdp_device *mhdp);
> > > > +	void (*exit)(struct cdns_mhdp_device *mhdp);
> > > > +	void (*enable)(struct cdns_mhdp_device *mhdp);
> > > > +	void (*disable)(struct cdns_mhdp_device *mhdp);
> > > > +};
> > > > +
> > > > +struct cdns_mhdp_device {
> > > > +	void __iomem *regs;
> > > > +
> > > > +	struct device *dev;
> > > > +	struct clk *clk;
> > > > +	struct phy *phy;
> > > > +
> > > > +	const struct mhdp_platform_ops *ops;
> > > > +
> > > > +	/* This is to protect mailbox communications with the firmware */
> > > > +	struct mutex mbox_mutex;
> > > > +
> > > > +	struct drm_connector connector;
> > > > +	struct drm_bridge bridge;
> > > > +
> > > > +	struct cdns_mhdp_link link;
> > > > +	struct drm_dp_aux aux;
> > > > +
> > > > +	struct cdns_mhdp_host host;
> > > > +	struct cdns_mhdp_sink sink;
> > > > +	struct cdns_mhdp_display_fmt display_fmt;
> > > > +	s8 stream_id;
> > > > +
> > > > +	u8 link_up : 1;
> > > > +	u8 plugged : 1;
> > > > +
> > > > +	/*
> > > > +	 * "start_lock" protects the access to bridge_attached and
> > > > +	 * hw_state data members that control the delayed firmware
> > > > +	 * loading and attaching the bridge. They are accessed from
> > > > +	 * both the DRM core and mhdp_fw_cb(). In most cases just
> > > > +	 * protecting the data members is enough, but the irq mask
> > > > +	 * setting needs to be protected when enabling the FW.
> > > > +	 */
> > > > +	spinlock_t start_lock;
> > > > +	u8 bridge_attached : 1;
> > >
> > > Do we really need to make this a single bit ? How about a bool ? Same
> > > for the two flags above. Don't try to over-optimise, in the end, due to
> > > field alignment, this will consume more than one bit, and a single-bit
> > > value will be slower to access.
> > >
> > > > +	enum mhdp_hw_state hw_state;
> > > > +	enum drm_bus_flags conn_bus_flags_defaults;
> > > > +};
> > > > +
> > > > +u32 cdns_mhdp_get_bpp(struct cdns_mhdp_display_fmt *fmt);
> > > > +void cdns_mhdp_configure_video(struct drm_bridge *bridge);
> > > > +void cdns_mhdp_enable(struct drm_bridge *bridge);
> > >
> > > I don't see any reason to expose those three functions, they should be
> > > made static. That will involve reordering them in the .c file to avoid
> > > forward declarations.
> > >
> > > > +
> > > > +#endif
> 
> --
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
