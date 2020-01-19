Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C296142662
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 09:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FFE6E885;
	Mon, 20 Jan 2020 08:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150134.outbound.protection.outlook.com [40.107.15.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B145B6E450
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2020 21:25:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPTsFFIDlQYrMIxOeD6IB79ZKZWZDRXLXFb9WXsu3/BRiy71o5tBh73qfuUy0eBfqEpklJdKXa5PppkgWrIOPFOEvRoI4thVa6j5ciBlDgjadIBtu2i5oQIGeThMf4bTqhIRPKYIiyL2kJWxp/7oEDtf7M8yghLLU62FOvysd+pYTud1CmQ2XpcqxBk7K36YdouoeOUJcRU3S4MHjMX8eJC63bDtVd39oMra7+kVfseGizLwk4trAxSk2wBwDHcnOMWyDK7kcp62KWpz93hy2w9nk2Dv7AovMhlCPF8BqEHPnI9UjjfE89H6FITnfGGKZPpPJ07VTV0PgV74umCPjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMs1m2QepKV+cB+yfxuaFuoya2sVNkan0tua7pA9n18=;
 b=bzcC6X9agtLhduVmdiEMouEE5he4eL+qUdT1BS4V3oNnSpmXwixFhJJI5BdIS/eGDFs77FMx5d2mwlDeeaW8WQU0jPDN/5bk7N5s1oA0oQaJZmldxaOrLhecDrM7SlhR4orQ5088r/CizSR+rpGpoNc13osnUorGoP4XHQafyK+dJe944izr05T6AJ4jsnux3SpE4N7lquS5kc8u7TVwrJzC2tWFtRgBDQ6eH2xyMm+xywOhY1+qLQPyA0AIF3IVfEwioGbZAhWi94iitQG6BdZfJwT7s/oxMqKMAvUY+OlrXWMK9duhOhfCaHzUmDhXtQryryVMX2uVmRpCeorscA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMs1m2QepKV+cB+yfxuaFuoya2sVNkan0tua7pA9n18=;
 b=j3MKV1yLN1LBgHdJEkmxOzx0oL04VqmSVK4BQALmy/lEMm/VJuz/U1nnCpO9ID1Vr60pcfRzXSvJEUA01aNRU/xCNfrunOvq7dayAgSzbphuYnFSoScooXhNnvSWv9sL7zCFjxpb2NCyt1OMktcEPiTR2DFqfKZt86TnM3XquyA=
Received: from VI1PR05MB6845.eurprd05.prod.outlook.com (10.186.163.80) by
 VI1PR05MB5375.eurprd05.prod.outlook.com (20.178.10.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.22; Sun, 19 Jan 2020 21:25:03 +0000
Received: from VI1PR05MB6845.eurprd05.prod.outlook.com
 ([fe80::9192:77a8:62cf:c098]) by VI1PR05MB6845.eurprd05.prod.outlook.com
 ([fe80::9192:77a8:62cf:c098%3]) with mapi id 15.20.2644.024; Sun, 19 Jan 2020
 21:25:03 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: panel: add bindings for
 logic technologies displays
Thread-Topic: [PATCH v2 3/3] dt-bindings: display: panel: add bindings for
 logic technologies displays
Thread-Index: AQHVjNKZdd5XHtZGzk6i73CvPQ4gHKdzQvqAgH/BMgA=
Date: Sun, 19 Jan 2020 21:25:02 +0000
Message-ID: <db84ef6c90a9f327bc32c4948109c759b572a2af.camel@toradex.com>
References: <20191027142609.12754-1-marcel@ziswiler.com>
 <20191027142609.12754-3-marcel@ziswiler.com> <20191030142835.GA31293@bogus>
In-Reply-To: <20191030142835.GA31293@bogus>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marcel.ziswiler@toradex.com; 
x-originating-ip: [81.221.128.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 203ef583-470a-4005-64a9-08d79d260bff
x-ms-traffictypediagnostic: VI1PR05MB5375:
x-microsoft-antispam-prvs: <VI1PR05MB537597D778D1A2246F93FE78FB330@VI1PR05MB5375.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0287BBA78D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(39840400004)(346002)(396003)(376002)(199004)(189003)(66556008)(91956017)(66476007)(66946007)(76116006)(4326008)(478600001)(6916009)(66446008)(2906002)(316002)(2616005)(36756003)(64756008)(6506007)(5660300002)(71200400001)(4001150100001)(54906003)(7416002)(6486002)(81166006)(6512007)(44832011)(186003)(81156014)(86362001)(8936002)(966005)(8676002)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB5375;
 H:VI1PR05MB6845.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M6LXWo5rFjM6MtrJURihhiPIjK02fOnFD2npc4FFa1E3cKABmSnCvPBSmzld2+5L5YfHhxXI9ZU7qiCWVe6ChWZTXtGlUrp5XXJtzQ6zODPqd0SznyVKWuUvlzTWGFQJApSYhrrM7WzZoIQHvGBBz2dA4IVg3iWs2oTI0Si6VTzubL4j260r/3mTStiJfl0s+PYFPdZQ1bmxS/lZ5wIHfeMhFa882XDr7GFgxYZlUYDLbc2sW1CtYlH9yIRxfZJMUL10rdiqgkk2g8yqOER6HBPdwksEZHlwGNclUh0PuN/TdEn+QeV39ercIrEjcPEHnnaxL51JGtJUG5pp3v6acR6ZfdaZ/XH01SRX5AuH4N1u4KPLJDBWv5jXCckRRsgbR/lRdUzSup55gk/T8XBYfrVmMQZbzFFAKE2/fRBLSFVhIy4X8epqLyphhr2dt1y2OqQTnP51432rI9lIwKQZRlU4T6jj/jj23htlbIxP2tPh/vYYe/e38UXvVWn+RVqRTJ0XzkunSA9fNC6FXS9qNw==
x-ms-exchange-transport-forked: True
Content-ID: <886853856403844FA968D4E169C09836@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 203ef583-470a-4005-64a9-08d79d260bff
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2020 21:25:02.9579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o4DHorglhEq4JmUHMEOYvSt9AfAeNa1TW5+u5LM/6RQLWMmW73decpyuRbBQ/0yfYzvUyATx2YXA/2+ozpR1xmepLqRGCFhm8z7p4H2UOn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5375
X-Mailman-Approved-At: Mon, 20 Jan 2020 08:58:36 +0000
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
 "airlied@linux.ie" <airlied@linux.ie>,
 "j.bauer@endrich.com" <j.bauer@endrich.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "info@logictechno.com" <info@logictechno.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry, just noticed that this has not gone through yet.

On Wed, 2019-10-30 at 09:28 -0500, Rob Herring wrote:
> On Sun, Oct 27, 2019 at 03:26:09PM +0100, Marcel Ziswiler wrote:
> > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > 
> > Add bindings for the following 3 previously added display panels
> > manufactured by Logic Technologies Limited:
> > 
> > - LT161010-2NHC e.g. as found in the Toradex Capacitive Touch
> > Display
> > 7" Parallel [1]
> > - LT161010-2NHR e.g. as found in the Toradex Resistive Touch
> > Display 7"
> > Parallel [2]
> > - LT170410-2WHC e.g. as found in the Toradex Capacitive Touch
> > Display
> > 10.1" LVDS [3]
> > 
> > Those panels may also be distributed by Endrich Bauelemente
> > Vertriebs
> > GmbH [4].
> > 
> > [1] 
> > https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
> > [2] 
> > https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
> > [3] 
> > https://docs.toradex.com/105952-10-1-inch-lvds-capacitive-touch-display-1280x800-datasheet.pdf
> > [4] 
> > https://www.endrich.com/isi50_isi30_tft-displays/lt170410-1whc_isi30
> > 
> > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > 
> > ---
> > 
> > Changes in v2:
> > - New patch adding display panel bindings as well as suggested by
> > Rob.
> > 
> >  .../panel/logictechno,lt161010-2nhc.yaml      | 44
> > +++++++++++++++++++
> >  .../panel/logictechno,lt161010-2nhr.yaml      | 44
> > +++++++++++++++++++
> >  .../panel/logictechno,lt170410-2whc.yaml      | 44
> > +++++++++++++++++++
> >  3 files changed, 132 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/panel/logictechno,lt16101
> > 0-2nhc.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/panel/logictechno,lt16101
> > 0-2nhr.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/panel/logictechno,lt17041
> > 0-2whc.yaml
> 
> I would just put these into 1 document as the compatible is the only 
> difference.

No, not quite just the compatible are different as the first and last
panel feature capacitive touch while the middle one is resistive and
the first two panels are parallel RGB ones while the last one is an
LVDS panel.

> Either way:
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
