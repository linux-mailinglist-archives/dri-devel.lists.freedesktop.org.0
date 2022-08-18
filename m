Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D4C597F57
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 09:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EC6BF801;
	Thu, 18 Aug 2022 07:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70054.outbound.protection.outlook.com [40.107.7.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1A9B59BF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 05:25:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mh0i1tJWMMGJ/SAwHCSSU12lJD3vlaI8Jk+B0h0JxzknBC0KfhYxYETryHzSRCXX59I7sMVZfP/Fe8fotcS08E55CQxekI2WZp55cRd/s8ocNgQFU1kOio6R4zkc0k1dW3xBjGzo50VWyePmZuWxbjXYdnw1XujigvHAdH4Qn9br9wBJEojnMusqfDCjF2w1dlgisnWPxUx8qk63AfqHuwCt74u7oKtZf6n2hsXmn4+mEZlUs3YQMX7uToGM3YPms/4eosTJhLCGcWNqdTVtgvdi0qosV+Wu9aCzi8YhmpcBI98BRtZ00dDzVT3dNL7vQnHHfPmPEuRcbqrJzAmgcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aoWtvM6uSLpvqj9J5mtnXFmaJwxNXQLzv43nqWnnGw=;
 b=cd7ialmshx+Nu/Jr50rMP5kOmxJVMLsSh2AEh9XKkH3DjmRy5WE+77D+L44CciRiU771EA8UzW8oHoTiEDVtPCX86eQvuT/4+gX7E10L8gK0xrgTbF9e73dBxih33gKl4JphPYuSx0P4fN/L6xQsk0Hu3az2jOKVOvwjPwaXYgNBQ8eMcj7M0Rb2OkhTqWOy1i3w83m6eIxcSJ5AXaN6gb8UGStFH83Xxg7RbSrrmbxX8hoRw5ERJWHgu4dopBsQ1o+pFaVML8eBvoQAoi7Ul4a332sBGCeXSxySUivrrKvrK+GIpIcT0myGi9X4qhbXP5bmUNEQs0NAZND57XY2KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aoWtvM6uSLpvqj9J5mtnXFmaJwxNXQLzv43nqWnnGw=;
 b=JJx1j3AM6kyoe+FuKjKw6MN70Mv95x7K0NHnqX/MXlN+X1qRUc+/lX7hCLnuNLNMWsw74BF6S0vmJ/jrsLF7L+J2SInaV7GLoeAL+vW6FWeFLJ0JjdMmOejtZeJUYSfLkKUH7pVokkRZEeCUNp3PT7azdYxLKzmsY6u7I6+jPFI=
Received: from AS8PR04MB7511.eurprd04.prod.outlook.com (2603:10a6:20b:23f::5)
 by VE1PR04MB6720.eurprd04.prod.outlook.com (2603:10a6:803:123::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 05:25:54 +0000
Received: from AS8PR04MB7511.eurprd04.prod.outlook.com
 ([fe80::38a3:f13:e15d:f94a]) by AS8PR04MB7511.eurprd04.prod.outlook.com
 ([fe80::38a3:f13:e15d:f94a%9]) with mapi id 15.20.5525.019; Thu, 18 Aug 2022
 05:25:53 +0000
From: Cyrille Fleury <cyrille.fleury@nxp.com>
To: Olivier Masse <olivier.masse@nxp.com>, "nicolas@ndufresne.ca"
 <nicolas@ndufresne.ca>, "brian.starkey@arm.com" <brian.starkey@arm.com>
Subject: RE: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Topic: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Index: AQHYqNLEB1kEEMDN2EiJXHn7b90D762gcg6AgASkiYCABmvpAIAF7/SAgAHHYgCAAAWHgIAA1G/g
Date: Thu, 18 Aug 2022 05:25:53 +0000
Message-ID: <AS8PR04MB75119C61E3222786A5BBF1D6886D9@AS8PR04MB7511.eurprd04.prod.outlook.com>
References: <20220805135330.970-1-olivier.masse@nxp.com>
 <20220805135330.970-2-olivier.masse@nxp.com>
 <20220805154139.2qkqxwklufjpsfdx@000377403353>
 <7e61668164f8bf02f6c4ee166e85abc42b5ee958.camel@nxp.com>
 <20220812163922.v7sf3havi5dpgi5u@000377403353>
 <de46324d8fa8fb6a8dda4641e531d30842410744.camel@nxp.com>
 <eef2fc413695cb96a5071627bfe44830f80cfe9e.camel@ndufresne.ca>
 <fb022db983aa44a5b1a8478d340198ecc52c4e11.camel@nxp.com>
In-Reply-To: <fb022db983aa44a5b1a8478d340198ecc52c4e11.camel@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a523923-e998-4e2e-7dae-08da80da1efe
x-ms-traffictypediagnostic: VE1PR04MB6720:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YqykJ6aAR6dyWkIhyYbIlbXHukxwpa3GqhYDcHokk5x3XJcOFRuHew72NYA5QdW2xxWvPGhcEPoV3d4OcT0SlVVcDmjQtGh8thL4nwe4cHnDfTzjxe3HcRG7XzhDonVv61Wxhp+RTGnPBr+rupo8Ks7s2qQs4VUfBJzH+pkgoyqTFbpe2xZhzCkuRDFTp2VFDCmXnGxJamX07gPJiZ1UH6uV5QU7bqBwlGp1jDN/1z+Q0dGC941yzFNE5YSNxLNfaMgHQTKQsd5gJUB/ESdh8+wXVOKUPGax+BZjuXtlqjBgE4c7FbjBSgI8+M19aoMRasrHdaKk6n8JdBIzQ+z3zHPOGfPT4gkI1gBwNT7uY8Z2SY+9YwnSaZgbFk4cjQ/d1feZlj7GljqMu2RgotCfXmSOKki9drEaC8wsBaA0StdTmbX11lTaTZYNqLIEd7Ri6wNNanwMsHL6OOLgvl1NXtQbUJEagtCcf4fP+jX1aD238qmsy9qQjlVG+PwKnrs1TQxmKvqqS0EII+SOo6AE7EadzgDa+bn2shYXeKx5uXdn8aPxV8jMuvH91Zz5/CcT65ZZhlFqKwNJANbwa6q0ocnt8eQUUaQAJzlFUK1qkIWMwh7EA7v1aGptEvO2/ELwAqRjqhMRqjfWN/w/c4/y/C1+hsMlaK76w4yVWso/QgQpIeTKrxbgGz0gqT/l15jHd8UZ/AvNQWiFOIEXRIvI/x9PE2apQnEKnPJTDuNHAuSTFb25PEicvlY3d5tZr+NblrNaA5vrOfEc1wLAWFr++8l0fR5JpvVNRTgOmTdlHpo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB7511.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(7696005)(33656002)(38070700005)(186003)(71200400001)(7416002)(9686003)(478600001)(53546011)(26005)(41300700001)(86362001)(83380400001)(6506007)(66574015)(45080400002)(966005)(4326008)(66946007)(76116006)(54906003)(110136005)(8676002)(64756008)(55016003)(66446008)(52536014)(66476007)(66556008)(5660300002)(122000001)(44832011)(2906002)(8936002)(316002)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?qXpVuqUs/FrjaTDX57IHIpngcyW+awPRCSjl1iyuV7Bx/YR9+g6q71/SWt?=
 =?iso-8859-1?Q?VJzet7qUyscnwqcPZgIhUZjGfxLT2SvkWNlZ+j5AYvI2LwqJFCHnDLN3uC?=
 =?iso-8859-1?Q?CaHw6i2kA2gTM2igcFlWSYoJ4Rdn6nD0z+6s52OzHuPBv2iyN2BWJdizmV?=
 =?iso-8859-1?Q?Bx246yW6x2FsNDJowYPUd+UbeNXKsodvDALa7kq7sE57gCem6xCkP4qKGQ?=
 =?iso-8859-1?Q?dntzi8E6qaXk1tR4wHAEEwk7ARWpttluBPb2XgVhiOQxlGHe/xWZMsb8nL?=
 =?iso-8859-1?Q?D7/2IWVM1Zs3yGqp0aXM7+qsZySFbeTufBEvycpv9ihfkdFHQ1NfpYrHer?=
 =?iso-8859-1?Q?BT4eaKleTiHg9j+Te6fLEG2D9F7zU2eOMxl85Cv79w2JXjNbGkEbDptAQr?=
 =?iso-8859-1?Q?WfRY+l6UGiR/DoTdG+NJyaXUracdx6nlGw7ENRgHXnUTjU5xZDDbMW6bXy?=
 =?iso-8859-1?Q?XX+LYgd6Z0g4hFchTFky4JCpGQW2QIiCRAtfUynLL1nNzv98gqPzgMiBZB?=
 =?iso-8859-1?Q?xll8HOMd+nmQW0DmzvAAO8EnOfo59yQz4g1xzTJPhfrtd7tECewH5BjseY?=
 =?iso-8859-1?Q?PfFJOakgZy9DjNQ3a8iUQVgnFSvYT4PlbsZkv7/0uMYpyPDYqPpey45WnH?=
 =?iso-8859-1?Q?RnSQ3YEAwrX4U1bX8IgfeFBygE6by4yd4EXk/Xncfqpk1DYMhmd4uS7YaM?=
 =?iso-8859-1?Q?g6Qg14RNNz1TrtXph6vRb9nZpsqUVoNq9Egdm2EgJz1wkyx+xnf6kfB3lG?=
 =?iso-8859-1?Q?cpM1cxUfX0VeutcOAPm2zVxs2KtvWHSnb6QFNpKe36DlnuMLpjlTqtilJv?=
 =?iso-8859-1?Q?FZMBevtpUH6us92Kpy7/XPasEjE1wyoetuVlt4bqASUG5jfC6muGudZ3lw?=
 =?iso-8859-1?Q?lxLkU/g1MQwVky4/sYHigmHpkfywsEyGzvYzkDD+QWCMiW+NkfldyrwQUX?=
 =?iso-8859-1?Q?CZYu5gqWDqtgljlbSI3M500Zu0oWZ8kaDMKs/xd03P/rkH2sMPhykroBjH?=
 =?iso-8859-1?Q?SKj7mbJVM5ZRyieavEU6q5dnWxFv1lxJdEta4xXfdzQc5elSOMUelITb++?=
 =?iso-8859-1?Q?BM2kHI1Pm/ZtaP+mg1LihyCDShXLOCU4TzS6z1C0h5grSsyxobckh+3EM9?=
 =?iso-8859-1?Q?iEQE7SDCJZZBIDnv4E5M5+QHM2PHCVRTBUdKatAIraqVUtoI9KvkW/lHhX?=
 =?iso-8859-1?Q?lAMQ5hPfXON1+IVM7tZvqzM5h7hAsnPh+ztB+AVgpQ+IUEJKNBKG+lsTYX?=
 =?iso-8859-1?Q?MC7VV8Mg53rcHOLqRQUsSFcYYMApQNMX9uGZATNQDjvC14V4B4TqFGWMzp?=
 =?iso-8859-1?Q?WH20egAG2/HW++RaTACWdXoEWf54NB5SNJAGw5bT/t1RvRIsxebWEwrZC6?=
 =?iso-8859-1?Q?aHtHWMm2mcoM2ekYY9Dd2oeG88mngGBDunXX5NbiTOIhT3TVim41oIb4C7?=
 =?iso-8859-1?Q?CFJvTrBfAGlEW9OoBgFmKzs7Pq4NcosXHxPGrbAmR02tYPVmk3pEVP53BV?=
 =?iso-8859-1?Q?u3aJmg9TWW95DWSN5aYsPCDkmtCWVmP2Ob1XdGot/O8bID+/FvkwQXt/aB?=
 =?iso-8859-1?Q?atVb6P9sAP1cLWVdS3SMyJbFBe5qoFTtf8gbkqKCY35/xDDNZ9gjx78Ka5?=
 =?iso-8859-1?Q?C+oIEaM0WVMhx3fjsF42aWy3j3ICa2kO3k?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB7511.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a523923-e998-4e2e-7dae-08da80da1efe
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 05:25:53.7411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B3Bq46s65+TeUseoICEgB9WDsQJlgWtO+y+q3Nuwg4+vujAprs0nyQitJTyWDNYEjoUAXqwzetWQJQCteSGqmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6720
X-Mailman-Approved-At: Thu, 18 Aug 2022 07:38:53 +0000
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
Cc: =?iso-8859-1?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "nd@arm.com" <nd@arm.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicolas, all,

 The short reply:
      - For DRM, gstreamer, ffmeg, ... we don't use anymore NXP VPU proprie=
tary API=20
      - We need secure dma-buf heaps to replace secure ion heaps

  The more detailed reply to address concerns below in the thread:
      - NXP doesn't design VPU, but rely on third party VPU hardware IP we =
integrate in our soc.  NXP proprietary API are for legacy applications our =
customers did without using gstreamer or ffmpeg, but we are now relying on =
V4L2 API for WPE/gstreamer, chromium/ffmpeg ...
      - Even with NXP legacy BSP, there was no API impact for WPE (or chrom=
ium) due to NXP VPU API. We use WPE/gstreamer, then a gstreamer pluging rel=
ying on NXP VPU proprietary API. But now we use V4L2. So we can forget NXP =
VPU proprietary API, and I'm very happy with that.
      - We have moved from ion buffer to dma buff to manage secure memory m=
anagement. This is why we need secure dma-buf heaps, we protect with NXP ha=
rdware as we did with ion heaps in the presentation Olivier shared.       =
=20
      - For secure video playback, the changes we need to do are in user sp=
ace world (gstreamer, WPE, ...), to update our patches managing secure ion =
heaps by secure dma-buf heaps. But dma-buf is file descriptor based as ion =
heap are.
      - What will change between platforms, is how memory is protected. Thi=
s is why we requested to have dtb in OPTEE for secure memory, to be able to=
 provide a common API to secure DDR memory, and  then to rely on proprietar=
y code in OPTEE to secure it.
      - We don't have a display controller or VPU decoder running in TEE. T=
hey remain under the full control of Linux/REE Word. If Linux/REE ask somet=
hing breaking Widevine/PlayReady security rules, for example decode secure =
memory to non-secure memory, read from secure memory will return 0, write t=
o secure memory will be ignored. Same with keys, certificates ...
      - i.MX8 socs have a stateless VPU and there is no VPU firmware. i.MX9=
 socs have a stateful VPU with firmware. In secure memory context, with sec=
ure memory, at software level, stateful VPU are even more simple to manage =
->  less read/write operations performed by Linux world to parse the stream=
, so less patch to be done in the video framework. But for memory managemen=
t, stateful/stateless, same concern: we  need  to provide support of secure=
 dma heaps to Linux, to allocate secure memory for the VPU and the display =
controller, so it is just a different dma-buf heaps, so a different file de=
scriptor.
      - i.MX9 VPU will support "Virtual Machine VPU". Till now I don't see =
why it will not work. I'm not an expert in VM, but from what I understood f=
rom my discussions with NXP VPU team integrating the new VPU hardware IP, f=
rom outside world, VPU is seen as multiple VPUs, with multiple register ban=
ks. So virtualized OS will continue to read/write registers as today, and a=
t software level, secure memory is as non-secure memory, I mean at this end=
, it is physical DDR memory. Of course hardware shall be able to read/write=
 it, but this is not software related, this is hardware concern. And even w=
ithout VM, we target to dedicate one virtual VPU to DRM,  so one register b=
ank, to setup dedicated security rules for DRM.
     =20
  I'm on vacation until end of this week. I can setup a call next week to d=
iscuss this topic if more clarifications are needed.

Regards.

-----Original Message-----
From: Olivier Masse <olivier.masse@nxp.com>=20
Sent: Wednesday, August 17, 2022 4:52 PM
To: nicolas@ndufresne.ca; Cyrille Fleury <cyrille.fleury@nxp.com>; brian.st=
arkey@arm.com
Cc: sumit.semwal@linaro.org; linux-kernel@vger.kernel.org; linaro-mm-sig@li=
sts.linaro.org; christian.koenig@amd.com; linux-media@vger.kernel.org; nd@a=
rm.com; Cl=E9ment Faure <clement.faure@nxp.com>; dri-devel@lists.freedeskto=
p.org; benjamin.gaignard@collabora.com
Subject: Re: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf=
 heap support

+Cyrille

Hi Nicolas,

On mer., 2022-08-17 at 10:29 -0400, Nicolas Dufresne wrote:
> Caution: EXT Email
>=20
> Hi Folks,
>=20
> Le mardi 16 ao=FBt 2022 =E0 11:20 +0000, Olivier Masse a =E9crit :
> > Hi Brian,
> >=20
> >=20
> > On ven., 2022-08-12 at 17:39 +0100, Brian Starkey wrote:
> > > Caution: EXT Ema
> > >=20
>=20
> [...]
>=20
> > >=20
> > > Interesting, that's not how the devices I've worked on operated.
> > >=20
> > > Are you saying that you have to have a display controller driver=20
> > > running in the TEE to display one of these buffers?
> >=20
> > In fact the display controller is managing 3 plans : UI, PiP and=20
> > video. The video plan is protected in secure as you can see on slide
> > 11:
> >=20
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fstatic.=
linaro.org%2Fconnect%2Fsan19%2Fpresentations%2Fsan19-107.pdf&amp;data=3D05%=
7C01%7Colivier.masse%40nxp.com%7Ce0e00be789a54dff8e5208da805ce2f6%7C686ea1d=
3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637963433695707516%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00%7C%7C%7C&amp;sdata=3DGHjEfbgqRkfHK16oyNaYJob4LRVqvoffRElKR%2F7Rtes%3D&am=
p;reserved=3D0
>=20
>=20
>=20
> just wanted to highlight that all the WPE/GStreamer bit in this=20
> presentation is based on NXP Vendor Media CODEC design, which rely on=20
> their own i.MX VPU API. I don't see any effort to extend this to a=20
> wider audience. It is not explaining how this can work with a mainline=20
> kernel with v4l2 stateful or stateless drivers and generic=20
> GStreamer/FFMPEG/Chromium support.

Maybe Cyrille can explain what it is currently done at NXP level regarding =
the integration of v4l2 with NXP VPU.

>=20
> I'm raising this, since I'm worried that no one cares of solving that=20
> high level problem from a generic point of view. In that context, any=20
> additions to the mainline Linux kernel can only be flawed and will=20
> only serves specific vendors and not the larger audience.
>=20
> Another aspect, is that this design might be bound to a specific (NXP
> ?)
> security design. I've learn recently that newer HW is going to use=20
> multiple level of MMU (like virtual machines do) to protect the memory=20
> rather then marking pages. Will all this work for that too ?

our fire-walling hardware is protecting memory behind the MMU and so rely o=
n physical memory layout.
this work is only relying on a reserved physical memory.

Regards,
Olivier

>=20
> regards,
> Nicolas
