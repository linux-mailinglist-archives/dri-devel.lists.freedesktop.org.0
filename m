Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841C0142659
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 09:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDF06E879;
	Mon, 20 Jan 2020 08:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150128.outbound.protection.outlook.com [40.107.15.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3628C6E450
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2020 21:27:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g76VSn7ayUHyc+rYTf8PSXmR93Xs89ISOyVhaMqah65MxxS57TKyvy6r0px4qWm+p2Psu8WQQqmBjEku6ZLvWexupH9L4d4hLwR+dcH1mjHn/KNEh7/hLX9RJHDnlHxwJWAI1DCglcCPfLd5al7RQLtgr22bmztyfLj/tRBD33lN0234zZ0lTbaqlYS/Rk1Z6EDOsS9qZVTSJ1BUaUo+KnxcGJNIe2OLgV0Fjy5iVBb2uOATORXN6pITd32SifGF7KQMOQ9y7jgXYAZzYwqwBdPsva9m3q1NwQ/czmRLBjMSG6exzSr2b9qKYjudegygbNkoXYj407ARobbYIi2Vcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcQjn/IMLieVVfiZOaCwmeErIV6abILgivBFrT4Hm+k=;
 b=Nqmt94iCOmh2ABQRvlBj8OSZR7GHjDcXhC/dkbifWC9T+0sosjQ4MRrOduZo17OlZHbXRWRb0RCpElfGiJJAmhaGwOOrGXOJjyux/UNmVI6V4Od8glZaJg7Xdp+81ot90ahwRHT9SRWwTcTNLjvKbstW7y3kRXVUTlSggyPFwwxmiSiYmvv7wIulxeCEtHQArPqR3AeXQ0r7jYIZswFHSr/jfkAnblk+QnF+hNRBzXOMJebeoEkhyFzCVoSbA3jy7Fzv0yoMPvzkrQXqwuF3hlTo1sdl8IFBghJcOPA064zCQiY4fr0+rirPl9cWY11LbsGU9SudfAoyK4ARgv+sXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcQjn/IMLieVVfiZOaCwmeErIV6abILgivBFrT4Hm+k=;
 b=oAa7nXvMSvPFfylXQQ1D4C0GkaGtwFu09o9zCUZCIwgG3AvfdFiTrMfIAzIoIHS4n1xF76cpmAUqXdKJ2PzlPh99Y72+BOJAQzI+ytzAelu1kZxWOhYEf3W4uRIm6WJigkFAblcwZ8aHkddPCDMQc0c9Co8N3+jJLj3D3Z91Y4g=
Received: from VI1PR05MB6845.eurprd05.prod.outlook.com (10.186.163.80) by
 VI1PR05MB5375.eurprd05.prod.outlook.com (20.178.10.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.22; Sun, 19 Jan 2020 21:27:35 +0000
Received: from VI1PR05MB6845.eurprd05.prod.outlook.com
 ([fe80::9192:77a8:62cf:c098]) by VI1PR05MB6845.eurprd05.prod.outlook.com
 ([fe80::9192:77a8:62cf:c098%3]) with mapi id 15.20.2644.024; Sun, 19 Jan 2020
 21:27:35 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: panel: add bindings for
 logic technologies displays
Thread-Topic: [PATCH v2 3/3] dt-bindings: display: panel: add bindings for
 logic technologies displays
Thread-Index: AQHVjNKZdd5XHtZGzk6i73CvPQ4gHKdzQ1YAgH/BiwA=
Date: Sun, 19 Jan 2020 21:27:35 +0000
Message-ID: <ef61eb4e34e5fe4c8540ea82cb2c4de61086e21c.camel@toradex.com>
References: <20191027142609.12754-1-marcel@ziswiler.com>
 <20191027142609.12754-3-marcel@ziswiler.com> <20191030142952.GB31293@bogus>
In-Reply-To: <20191030142952.GB31293@bogus>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marcel.ziswiler@toradex.com; 
x-originating-ip: [81.221.128.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 150fbf4f-c52e-466e-997f-08d79d2666cc
x-ms-traffictypediagnostic: VI1PR05MB5375:
x-microsoft-antispam-prvs: <VI1PR05MB537540DFBE3F3AE3A60AB20AFB330@VI1PR05MB5375.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0287BBA78D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(199004)(189003)(66556008)(91956017)(66476007)(66946007)(76116006)(4326008)(478600001)(6916009)(66446008)(2906002)(316002)(2616005)(36756003)(64756008)(6506007)(5660300002)(71200400001)(4001150100001)(54906003)(7416002)(6486002)(81166006)(6512007)(44832011)(186003)(81156014)(86362001)(8936002)(966005)(8676002)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB5375;
 H:VI1PR05MB6845.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TbtcDC0WMngEfqWJ1XUZYINB1OtiF9zgRvbIFnxgBcSSz0b8CloU2OW6ppRw1bJK20By5ibjHyyc0R7xhI16UzTo1OsT0IPlr3auQ5X7W0A7deEHMccyhpMw74Kuivj5paCN+f6va7hJU2XpJS2MguvxMqJKOB0uYqeXjFlYTw+hdnV/d/bjFUkxQ6maALrC7rDd4ibrvbswgBpW4SEOs5VwqWFExrGqzFiP29URfWqHA4HxKSGhawfZzVnGeWRDIAmnssL97S9GYN9773FcwXUtqeQN5WETplC7kUFUVm1lFGWL2/NS/FhxLIL3gIKOAdvT/z6s0JlL0Z/BZmOFus3f6oeg6FfT6jFGoDo3ruPAwRFcxuOGxyuomCcycqvYbVe8VAp1IxV09abONup79Lo0W6kRamBqKmpMRRNhVbtlQOCoAKJp72nsBAfXNhuoG4eQZSjdpLoCyPohx+4OJu2DPoo0jgyWySoDs0NP0nO7K3AtesyK5wRZgzr1BQ668eP35ZSRQ9kf2DlttPPnVg==
x-ms-exchange-transport-forked: True
Content-ID: <9E0087ACC9050C4EBAA050500C087FD2@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 150fbf4f-c52e-466e-997f-08d79d2666cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2020 21:27:35.2837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jv9vIfhjZ+K7DN7I1RJgCQ4hnNwYEtVUYu5grdCDf5dIUiIm0sislmvHklen3I6QADWTkAw8es9QJlwg9SxZP4adJuESmy+1iQkItovbYBE=
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

On Wed, 2019-10-30 at 09:29 -0500, Rob Herring wrote:
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
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/panel/logictechno,lt161
> > 010-2nhc.yaml
> > b/Documentation/devicetree/bindings/display/panel/logictechno,lt161
> > 010-2nhc.yaml
> > new file mode 100644
> > index 000000000000..0dfe94d38a47
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/panel/logictechno,lt161
> > 010-2nhc.yaml
> > @@ -0,0 +1,44 @@
> > +# SPDX-License-Identifier: GPL-2.0
> 
> Except the license for new bindings should be: 
> 
> (GPL-2.0-only OR BSD-2-Clause)

OK, will send a v3 shortly.

> Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
