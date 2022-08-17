Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2701C5971C6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 16:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255DC96A32;
	Wed, 17 Aug 2022 14:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A0E96A25
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 14:52:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kq86fJtVUgElAkfdNHnMnpnmVP8VcNkZH/od8l32KLdIfxqwXM0W2pzQqpgyyJfL5RMElkslRyB8Lh9LL4PPCnJ/2EC5ySahi3i6/V6Zte2j0whIh598zfQb7gN0ijj5opCn/w6ftTuyCPyAnrGKE5Ymfh4JIEFJNlJslgjZnxWvVvJEFizEw6hUEem/V1vPrp2JuYe5/Aew9NMeqxeYm/icRu5KOsZUZP2XOCpns0I9D8jv+Ib+s1BQV7B15iOXq13IP+S0yZ+yyeukXZWjO6SEmE8ohETFPkWabagIx5xiZNQuV7ucVaqLyIgtpSXhfNBlZZ2nksbpjrMJ2RvZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSw0rrIxodzCDT0eY1A489TJyiSPmcHpxev2OZG1/Kc=;
 b=B+BIbciJjZX97dGNQnj6KV89x2Law028ZNRPgmJMNxnFujfRNRWhMeZj22qieKkFCo4B+HZ4LQqB4qhf7XyBfQiXOE8Hf6TJ/djMcpmRan6BwLzN8NqLMBYjD9Fo/VauQgq/x9i5XZ8yNVH4IFTe2Aa9fud9sFCT/c+9podPEVbuCWiwHNsOL8MuY7qKZTmh6w1DqsXHrtZ/CS2IFMcc01tdJm90x3dX0wMBjltJmcpTwxWRVwHG04uWRUnbhs8ceJpN10mNF/UW9/KhWZTnJBPMuwsz250Q66mvqw+gZnCOhexfZZ4A+MweSRuch7L+NqQhrQJKWEAjPjt/lQ4lRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSw0rrIxodzCDT0eY1A489TJyiSPmcHpxev2OZG1/Kc=;
 b=aB738HIbAqVbgQfxe+xYYgDPLn0wN4ShwIuTUx0joi+CDDuR9tX1G0119Z26Fewu9R2srEk95zEmC/ZKY3ILsSVjxTGCFX3/GAfm30Sjt5401y61tJIEyRxh74JKHRZud0GGBJQfEec0Wmrs6dRIveBb5MPN2t/bYhzgxFMwmno=
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by DBAPR04MB7366.eurprd04.prod.outlook.com (2603:10a6:10:1a0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 14:52:13 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6%4]) with mapi id 15.20.5525.011; Wed, 17 Aug 2022
 14:52:13 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>, Cyrille Fleury
 <cyrille.fleury@nxp.com>, "brian.starkey@arm.com" <brian.starkey@arm.com>
Subject: Re: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Topic: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Index: AQHYqNLEB1kEEMDN2EiJXHn7b90D762gcg6AgASkiYCABmvpAIAF7/SAgAHHYgCAAAWHgA==
Date: Wed, 17 Aug 2022 14:52:13 +0000
Message-ID: <fb022db983aa44a5b1a8478d340198ecc52c4e11.camel@nxp.com>
References: <20220805135330.970-1-olivier.masse@nxp.com>
 <20220805135330.970-2-olivier.masse@nxp.com>
 <20220805154139.2qkqxwklufjpsfdx@000377403353>
 <7e61668164f8bf02f6c4ee166e85abc42b5ee958.camel@nxp.com>
 <20220812163922.v7sf3havi5dpgi5u@000377403353>
 <de46324d8fa8fb6a8dda4641e531d30842410744.camel@nxp.com>
 <eef2fc413695cb96a5071627bfe44830f80cfe9e.camel@ndufresne.ca>
In-Reply-To: <eef2fc413695cb96a5071627bfe44830f80cfe9e.camel@ndufresne.ca>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9310a809-3542-4fd6-f4ab-08da8060121a
x-ms-traffictypediagnostic: DBAPR04MB7366:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OnQfx/MCatWqjq9xB8J2XksQOZdlY5z8es0yRMzuDNI7KfQz8o7I55cjMBZPrKjynzslYJXcr6C/ev9cTAA9zI14otaIoOGrTjmg8NA3+4z60NW2N/CbQDJ24e6b3ypkA0zmDJOhEKvQyxKiO7ci6tW0atmhhR+M/7ISwt8RzJs1M6mgoYnAZ/mzuWBICoEwdjDynmFtjLNRoeWuXQzOx1VHTZUnn6D/0hLCWReDxGKK/AoocDvU1kNSroAO1y8bpJXjAcNz0Q0sUrbXWH/HKhS6M3uY5937CLza1Mn5X7YK9EHx/08GC8T2hEgsZ50sILWUzeiijxtOx0kzPNgfO8ov0k7bF2W/Bdp85yfZmJttpQkbuOShXdLrDrQ2q+PaYfOuwDFfJuBGjZv8X/UbY3LITLQKy/J86cqKht5j5AOyXNjGnE9JcRfRW16hWoWUtEbUTrzRpwqIZVrxDCjb5NoJ6/R9GecJVMylRLljcHHNxuOye8MVccHrOhf6kzEhh8Bve/Vl5SCcHNz6wr542+lBs0mbpL3qytUywvhKb8HWynhuQSVzyNTfAVayQRvidilEM3shOpNmKC2e54IqlTlaItqt4w1gDrW8ij8YizhoZmEfvl4LRhhuw1wAV4frUDuTX64ADjfcA+tKBk0MBUd9tIvsm2v6CKuWudPXdf0/luGGapLPjVGICV/BJy1IR4wsqdyWp5+mVz8DOLN118DxrwSDvUC+Da+rQ8xcz02yTgvXslGo45wh94ZBWdzC3k6cLhh4Ql90bechdJ0+LKcMEHaSPfu6bg8w/wCGZVZjBBVw5zEZkDA+I4l0/o72IRdQvTsZYgO5YiurURNj4g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(71200400001)(66946007)(44832011)(186003)(54906003)(45080400002)(66574015)(110136005)(83380400001)(6506007)(316002)(41300700001)(26005)(36756003)(6512007)(2616005)(2906002)(38070700005)(6486002)(86362001)(7416002)(122000001)(66476007)(91956017)(64756008)(5660300002)(966005)(66556008)(66446008)(38100700002)(8676002)(4326008)(76116006)(478600001)(8936002)(99106002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?hNxACc8j8Csi8NMCB546cLKI/4dXEPmN7YQF3oY4L7pzzhlk96OVdWPgU?=
 =?iso-8859-15?Q?fkjZdQGmZaZltrMmRagffEjGVNrzp+BsEFZVBxb/cBDkv+uBc4kKd1wwU?=
 =?iso-8859-15?Q?OCbrTCe6G2aJjMAvO38j/UasdoNtCgXUMa4b6ttKcds4y3o4wraZAWW3j?=
 =?iso-8859-15?Q?fjoXtWllQj6puq+HWPSJea6+pDUMsn3QPqp7df5vZ1FDGKx7fRouAQrWZ?=
 =?iso-8859-15?Q?XfMaSr/BmWewzs0pAXEvORx3mdXdEkGglukX3C8gpRb2ofig/AxZXvX5S?=
 =?iso-8859-15?Q?Hec26SdSItnrLCu2PKgAgc0MgU89XihHQLcXOpiHEYB3NYF8Jg45ZI9/r?=
 =?iso-8859-15?Q?X/F+ThHwT9MexrfC3WBTLFf6u6Uw5Urfcf2lBhNqtSM773tqDuWC1f5Au?=
 =?iso-8859-15?Q?a59rG1rgYv4pwq9kYbbc3uZseseXm/wFafCAdJVlfRYQjqrofq+KyAkyc?=
 =?iso-8859-15?Q?BTWRZRtCBRuPuLIoKI6w9/7cMeYLofvBvw2ePPf5qL8SlR+bE3oSTzJe5?=
 =?iso-8859-15?Q?qEpEnCtpxROchNVHZG2mWtvQYkeh+Lobes/9FgeusuC/Ykv3HvfcZsaqa?=
 =?iso-8859-15?Q?ogRjTfjR2DfVNixlsaekBifDsRfTX3bpJ/BHgwwG/2hDP3GGqEsH6Cy98?=
 =?iso-8859-15?Q?1IhgjuSXFNARGv3YN1iNc0lTT3W61qpWwFjEjnNeRNdfijlQiwCm0BpCC?=
 =?iso-8859-15?Q?wM0K5GeFzxrxhiVYfOOcP8ysL17ONHy6JRum3Nip4HVo3o1MsVY1oKD/J?=
 =?iso-8859-15?Q?khf2TJuOXWJ8IMUVPvUPFLP+4KyXS16/iVWM+ld8AUb9vnbD1gICWhhv1?=
 =?iso-8859-15?Q?ORspGqZ7cojfxjz6HeKu6DWlcvMUNeYjp9wrgfwgLjXetv+9chigMw06/?=
 =?iso-8859-15?Q?8Lbx1lqB4W2J9EDlCV8pM1GCdXsSsbdmFdiNTe9WEdXFNolEGKPGbo4Yf?=
 =?iso-8859-15?Q?g1YFDDRA0wrIeb6OF9MOumrrbS0xuDPFA87Hby29YVcahpiCK2/iKC/y7?=
 =?iso-8859-15?Q?MfHvdztEQvo46O0rLj2ancw+1rfU4uOOAFCNGDFZyBvlPS2XwsLNP6GLe?=
 =?iso-8859-15?Q?XLVk0M0nAMAXS69Va7Wv9M6hhHAqPDsxAAndyJcrKt06oey2IPiQOv9jP?=
 =?iso-8859-15?Q?davrT9IBD/dMsaN21uNJxqxUHwhqS6j/pNSr+8YXwd9rw2w1UW/ovhYPg?=
 =?iso-8859-15?Q?sfZexaCELjBxplBYdGuqnhIcXgNcjjeihVxkZUuQFJiFW2D9eHenNeOx1?=
 =?iso-8859-15?Q?nJVrrvK4FPXDo5XQ3B5a34FyFxdCvVL5/jbF4vESuFc6kGY1If7df86RM?=
 =?iso-8859-15?Q?OQtZExoXZIEEpWRCqjChVYCJbjwvrOpagFOUwrEO3Bl9ZtPDdQYBfkWl3?=
 =?iso-8859-15?Q?+xVmzgobxLiFnfLBOHtI18JaFcv5InZhT1IB19A2qzzjHNgSInf+vhQn8?=
 =?iso-8859-15?Q?6iiDT6KpwIM2geMIm5dDpFKkruo2cigWV3SRNYwgjXhAKiR8K6mTxzMvx?=
 =?iso-8859-15?Q?38oVqZc9VFn1dWGcPLbwqwTnUKqVxNDB5f2MUokx00GcPcpcDkafT0pFR?=
 =?iso-8859-15?Q?JMLTeXgebohEpnyNAWaspZAPoQe6Q0H313573YyQtvymIPfRqon9Lhu1U?=
 =?iso-8859-15?Q?IHCoxbWQM+eoBtsShpuqkqALKK59c9NDuxqdDHPRcWjLl9HqWK3WhYhHC?=
 =?iso-8859-15?Q?15DP?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <4ABFF15485189A4C9207CD006FF5C4D6@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9310a809-3542-4fd6-f4ab-08da8060121a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 14:52:13.5162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VIjMtbpP5cMdo5w+c/oLt7oHTGQfi+LyPsQqdja+ct6se+rajNSG6lCC17TYFnb4YkOReC6weRhyi36NKfMIgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7366
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
Cc: =?iso-8859-15?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>,
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
> > > Are you saying that you have to have a display controller driver
> > > running in the TEE to display one of these buffers?
> >=20
> > In fact the display controller is managing 3 plans : UI, PiP and
> > video. The video plan is protected in secure as you can see on
> > slide
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
> just wanted to highlight that all the WPE/GStreamer bit in this
> presentation is
> based on NXP Vendor Media CODEC design, which rely on their own i.MX
> VPU API. I
> don't see any effort to extend this to a wider audience. It is not
> explaining
> how this can work with a mainline kernel with v4l2 stateful or
> stateless drivers
> and generic GStreamer/FFMPEG/Chromium support.

Maybe Cyrille can explain what it is currently done at NXP level
regarding the integration of v4l2 with NXP VPU.

>=20
> I'm raising this, since I'm worried that no one cares of solving that
> high level
> problem from a generic point of view. In that context, any additions
> to the
> mainline Linux kernel can only be flawed and will only serves
> specific vendors
> and not the larger audience.
>=20
> Another aspect, is that this design might be bound to a specific (NXP
> ?)
> security design. I've learn recently that newer HW is going to use
> multiple
> level of MMU (like virtual machines do) to protect the memory rather
> then
> marking pages. Will all this work for that too ?

our fire-walling hardware is protecting memory behind the MMU and so
rely on physical memory layout.
this work is only relying on a reserved physical memory.

Regards,
Olivier

>=20
> regards,
> Nicolas
