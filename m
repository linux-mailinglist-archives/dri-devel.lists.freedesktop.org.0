Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2512512FB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 09:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526E76E870;
	Tue, 25 Aug 2020 07:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD9C6E1A8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 07:16:46 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07O79aFH008968; Mon, 24 Aug 2020 00:16:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=s0MO86uKg0AEwyPRUKpy1h0YcPjju4XNV100Pgi8UeI=;
 b=YITY/iDc3+jSnJ7OXia7tm1VwcUf08qBeVqU3oeZUlGRLXo0CXtwjebB0fXMwrMW9pzt
 L9B4VZjJxnpiEq2FL7zO5wYmFaotKcK4H0p6BO3MngBl9FpnkxaW26CYi7ix55KqF8fT
 CUfqIwVSBozH1dLkE2uPtJ0h1aqdEMsnP72gr9FLb9uokeMVJHwbhgQ8hM3wbwwMlWR+
 5TcmyzkOSjs888A40mAKbkRMxLceACzJAHJS6T+B6JqO4bAs9WkZhRsDkJVzg4SFjjok
 EMd4ly1c/LYY2EdPHjeIpwVlMGuwXvZDqU/kFyu6ReAL2lA1exoL/KxYJf+OCbTVI+N1 zA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0b-0014ca01.pphosted.com with ESMTP id 332xxwwqhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Aug 2020 00:16:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGPJied689QJ1QAVXTmY7WRGh8oi4YPoxnZuWuIqFMn/eu3p2x/MV04js/27/X+j2l39CBaezkOcGoiKwHl+atJSosTRKOLIyMgca3pDs8FbS88Z3K3aejQpu9BaZe4X6QXtQNiBDPsv8iTAxcwYqSNU+9y1LK12HwlEgVfkpQpda4WPExMIoOOnkUqKFHn8D5y7yhbSE8BMHitpHWw29pMNJAcb5R2m6GnPeWnJsXS0F9X1Mhl+hnYTPn5ImJjkjg5lMGnoZ55Eud/ZoZ3t0GtuLN0ABNfEttgivE3rIF6iWPw4C3HC6Drq4zcsbK7nVi8mXwIhlOm3DJoP/+R4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0MO86uKg0AEwyPRUKpy1h0YcPjju4XNV100Pgi8UeI=;
 b=hmX5BjUCUUJPKsAblQ+s+YL9rC0PWjJrgs7MPDOJ1FLoGYWxgsSm0o2ugISiWjWRRcnd0g2cAutS/AmFbUtHdPn4xfSA+k/mVWkPze7KePAbWgHVUV9qnCtY8dNLAULc0datvbN2XT7vTYx0/VsanqtQFWsLu6lTPLVjpqFkPZ8GGAPnvgHWm9WxYzvuqQUhTePzZP8s4H/qKA7xQBPqVomg2DRnVNIZfMdJQxsn+MIPby3pTLyGtvvKA0CMf68ZTn+PpZlvTlw2GjAZK9RntAoMr57FYGHfZUGhvw56B2qxda4bILvkauoucKs+mOTaYKY9AzZyupTy9dMhb/QnPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0MO86uKg0AEwyPRUKpy1h0YcPjju4XNV100Pgi8UeI=;
 b=Wt9TpZCMQ9oXPvbopAYFhXX12ofNOJjm+c1vF0ZGt0BmASNev4mpPyW8zGpY+drcf1hNQVXNz5dlsIyMyMu0Et/Wd9Z9xDhPw0qZta2BzXnabfHizap/Vuq/Qecpd7hbeXaMH7adIqukIwssE1MUtN4+/JCowE1x0OhxePW2nQo=
Received: from DM6PR07MB6154.namprd07.prod.outlook.com (2603:10b6:5:17e::20)
 by DM6PR07MB7130.namprd07.prod.outlook.com (2603:10b6:5:1f1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 07:16:32 +0000
Received: from DM6PR07MB6154.namprd07.prod.outlook.com
 ([fe80::c0af:c085:c7a8:4bb6]) by DM6PR07MB6154.namprd07.prod.outlook.com
 ([fe80::c0af:c085:c7a8:4bb6%5]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 07:16:32 +0000
From: Swapnil Kashinath Jakhade <sjakhade@cadence.com>
To: =?iso-8859-1?Q?Guido_G=FCnther?= <agx@sigxcpu.org>, Tomi Valkeinen
 <tomi.valkeinen@ti.com>
Subject: RE: [PATCH v8 0/3] drm: Add support for Cadence MHDP DPI/DP bridge
 and J721E wrapper.
Thread-Topic: [PATCH v8 0/3] drm: Add support for Cadence MHDP DPI/DP bridge
 and J721E wrapper.
Thread-Index: AQHWa+WTEwtNX0P6gUmV+Pdy9yg1i6k0MG2AgAAjygCAADTIgIASaj8A
Date: Mon, 24 Aug 2020 07:16:31 +0000
Message-ID: <DM6PR07MB61542D7CC2B319142CC5E0CAC5560@DM6PR07MB6154.namprd07.prod.outlook.com>
References: <1596713672-8146-1-git-send-email-sjakhade@cadence.com>
 <20200812083937.GA8816@bogon.m.sigxcpu.org>
 <3bcbbb0b-ee04-0f1e-6c54-97b01c552d82@ti.com>
 <20200812135637.GA107602@bogon.m.sigxcpu.org>
In-Reply-To: <20200812135637.GA107602@bogon.m.sigxcpu.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc2pha2hhZGVcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1iOGE0ZDZmNi1lNWQ5LTExZWEtODUyNy1jOGY3NTA0NDIyZDhcYW1lLXRlc3RcYjhhNGQ2ZjctZTVkOS0xMWVhLTg1MjctYzhmNzUwNDQyMmQ4Ym9keS50eHQiIHN6PSI0ODQ1IiB0PSIxMzI0MjcyNjk4NjcxMjk5NDYiIGg9IjV0clowWmdYWHMyUmFveUtIdHZWbUc4Zkg5VT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: sigxcpu.org; dkim=none (message not signed)
 header.d=none;sigxcpu.org; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [59.145.174.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ac4358e-fe45-4a51-2cb9-08d847fda0a3
x-ms-traffictypediagnostic: DM6PR07MB7130:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR07MB7130F078BCE89E27004249CCC5560@DM6PR07MB7130.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GMNDERc3txybZChKEoiPVqrctnpT35EA+ula98y2S64a1y6XqRzqSR5Ri0W1RSZY4rt8zf5kjN0L4fbL+E3FSGcIXA5a8KyVCqKLuX+vbqJjMbakKhBUY541hVmEBMY4YC2MGm+vVHahtinaH8ao9nCZV9+JH24tuR1o8nbKn/qB7aGlRG2auiasDQRs3OzHgKCy0RAUezJMWsSvqDePq2e9adaCkM+zIgX+8FunY7mckuqcLcXVah6ZOCQRS7abA8Qm3L25uvo4M+pMpVgZ0t1KcI+eRwffrlMO7ds3Pka9tYRo4PeF6D5Ps+yaAEClnC42vLdFzS0sOkNoQbG0K/qJM3xKSF2rFf9guL3IFBlcGd+k64Ik3eF0vr4ODQptrML1TNAgUPQwEA1IK1r6Jn16i0Mhj/d9dPtADMkaBYb7ETb5OetPL0dFkn+rcSPLVQbCzzBYAdaab1zhSi5chg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR07MB6154.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(36092001)(4326008)(55016002)(7416002)(33656002)(64756008)(71200400001)(66556008)(66476007)(66946007)(76116006)(86362001)(83380400001)(9686003)(66446008)(7696005)(52536014)(5660300002)(966005)(8676002)(8936002)(2906002)(186003)(316002)(53546011)(6506007)(26005)(110136005)(54906003)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: v0w0x1mrrD2AIwgnf7KabXU47cdSnFqkVfiZg0O8pHiHTU2wIe9XnYPjiMfMLeMVKFU04PBfXCdNuLeE7mCI7DosvublL6GkyWQX9qUCT9oNqi09CrpcTWlvp7q7qwJoK9baThISU6r6diQFza58fPk/J/7HfG9o8CF+xktIzICSXbDD9WdlUSx/EyMNr3E6pnaTLl2Lc7ifsPpNrDf2Pq/TeQugL4XxHcLE8U69MlEKFN+HHOZTxlkFY277qxUIkvyNTGZdmVN2x5cWj3gYpC84srKgbvvrmGQgRoDKZFHHwbX3al065ZHJA52WIe8ciBPc2F3gk9996zVThgoQj7eO6RMD9KntFXn4cSJ0f/vPlnG81SfPlKcpLBbmAL7P6QkI2K9vaRjzXQYJLfMp9I6Om6EUtEm+Qz4ndsE0N7hmk6VGDpn2oI8J8a8th8KuTQoa0YONeoPakm0ud/yYUwk4uBdHsnS9Pmk34ta7DT3qaq1erJNcgKJ5iKqHleemZ1dQ9cjiqFcPy4OHn6dHyD/1UjWm4l+hFIJeHLBi8HY5liZKMbZCkP3jOSk6EAMW9GBQKIu2bK7K2Lybh2ujCay7T6RHKaRdEWr5a39edf5nncxoiN083eoXLjHOpYO9luC04Eitf272H0oWPs+NBA==
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB6154.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac4358e-fe45-4a51-2cb9-08d847fda0a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 07:16:31.8042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5L4ThGam/SCFXkFyRVb9jitImoLiNRhx3ylg8XuRDkTMpNJ1CH9jU00uS/bdwZSIesBqIf5XB1qiBU7IJQZjbcVDPPOm+33vqGUYkqPtktA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB7130
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-24_06:2020-08-24,
 2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 bulkscore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 clxscore=1011 mlxscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008240051
X-Mailman-Approved-At: Tue, 25 Aug 2020 07:21:33 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "praneeth@ti.com" <praneeth@ti.com>,
 Yuti Suresh Amonkar <yamonkar@cadence.com>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "sandor.yu@nxp.com" <sandor.yu@nxp.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "nsekhar@ti.com" <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jsarha@ti.com" <jsarha@ti.com>, Milind Parab <mparab@cadence.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guido,

> -----Original Message-----
> From: Guido G=FCnther <agx@sigxcpu.org>
> Sent: Wednesday, August 12, 2020 7:27 PM
> To: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Swapnil Kashinath Jakhade <sjakhade@cadence.com>; airlied@linux.ie;
> daniel@ffwll.ch; Laurent.pinchart@ideasonboard.com; robh+dt@kernel.org;
> a.hajda@samsung.com; narmstrong@baylibre.com; jonas@kwiboo.se;
> jernej.skrabec@siol.net; dri-devel@lists.freedesktop.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Milind Parab
> <mparab@cadence.com>; Yuti Suresh Amonkar <yamonkar@cadence.com>;
> praneeth@ti.com; nsekhar@ti.com; jsarha@ti.com; sandor.yu@nxp.com
> Subject: Re: [PATCH v8 0/3] drm: Add support for Cadence MHDP DPI/DP
> bridge and J721E wrapper.
> =

> EXTERNAL MAIL
> =

> =

> Hi,
> On Wed, Aug 12, 2020 at 01:47:42PM +0300, Tomi Valkeinen wrote:
> > Hi Guido,
> >
> > On 12/08/2020 11:39, Guido G=FCnther wrote:
> > > Hi,
> > > On Thu, Aug 06, 2020 at 01:34:29PM +0200, Swapnil Jakhade wrote:
> > >> This patch series adds new DRM bridge driver for Cadence MHDP
> > >> DPI/DP bridge. The Cadence Display Port IP is also referred as MHDP
> > >> (Mobile High Definition Link, High-Definition Multimedia Interface,
> Display Port).
> > >> Cadence Display Port complies with VESA DisplayPort (DP) and
> > >> embedded Display Port (eDP) standards.
> > >
> > > Is there any relation to the cadence mhdp ip core used inthe imx8mq:
> > >
> > >
> > > https://urldefense.com/v3/__https://lore.kernel.org/dri-devel/cover.
> > >
> 1590982881.git.Sandor.yu@nxp.com/__;!!EHscmS1ygiU1lA!QIVUQ0JEY1Wz4
> gM
> > > qV3HYGyyp5m4r_Fje6dL5ptUdhSzeqzzqBBR0Jo-BC9arK-g$
> > >
> > > It looks very similar in several places so should that use the same d=
river?
> > > Cheers,
> > >  -- Guido
> >
> > Interesting.
> >
> > So the original Cadence DP patches for TI SoCs did create a common
> > driver with Rockchip's older mhdp driver. And looks like the IMX series
> points to an early version of that patch ("drm/rockchip:
> > prepare common code for cdns and rk dpi/dp driver").
> >
> > We gave up on that as the IPs did have differences and the firmwares
> > used were apparently quite different. The end result was very
> > difficult to maintain, especially as (afaik) none of the people involve=
d had
> relevant Rockchip HW.
> =

> Is the `struct mhdp_platform_ops` a leftover from that? Can that be
> dropped?
> =

> > The idea was to get a stable DP driver for TI SoCs ready and upstream,
> > and then carefully try to create common parts with Rockchip's driver in
> small pieces.
> =

> I wonder how imx8 would best blend into this? First thing will likely be =
to
> upstream the phy code in driveres/phy/ so a modified version of this brid=
ge
> driver could call into that, then go and look for common patterns.
> =

> > If the Rockchip and IMX mhdp have the same IP and same firmware, then
> > they obviously should share code as done in the series you point to.
> =

> I'm pretty sure they use different firmware though - the imx8mq additiona=
lly
> supports HDMI with a different firmware on the same IP core
> (13.4 and 13.5 in the imx8mq ref manual).
> =

> > Perhaps Cadence can clarify the differences between IMX, TI and
> > Rockchip IPs and FWs?
> =

> That would be great!
>  -- Guido
> =


Following are the differences between MHDP IPs from Cadence for Rockchip, T=
I and NxP:

The Rockchip and NXP MHDP Core shares the same part (IP8501) which is DP v1=
.3 SST
Controller with HDCP 2.2/1.x. NXP's version additionally supports HDMI.
TI uses a different part (IP8546A), which is DP v1.4 with HDCP 2.2/1.x.
TI DP Controller adds support for additional features such as Multi Stream =
Support (MST),
Forward Error Correction (FEC) and Compression (DSC).

Also, FW used for TI has significant differences than FW used for Rockchip =
or NXP.
NxP and TI firmware are developed and maintained separately by Cadence and =
are in
active support.

From the Linux driver perspective, given the differences, it would make sen=
se to have
TI driver maintained separately.

Thanks,
Swapnil

> =

> > I'm worried that if there are IP differences, even if not great ones,
> > and if the FWs are different and developed separately, it'll be a
> > constant "fix X for SoC A, and accidentally break Y for SoC B and C",
> especially if too much code is shared.
> >
> > In the long run I'm all for a single driver (or large shared parts),
> > but I'm not sure if we should start with that approach.
> =

> =

> =

> =

> >
> >  Tomi
> >
> > --
> > Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> > Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
