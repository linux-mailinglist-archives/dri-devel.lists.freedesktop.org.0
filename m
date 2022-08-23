Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6F759F456
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD2D112BB7;
	Wed, 24 Aug 2022 07:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F3C10E3FC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 15:58:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjNtx5kxnnRkGQbGm4FvEz7JBh+uKPk4kELBPKTFFKJCvK8baaQKKIUNwQyTTLOmhnUYChiIuQwlf0LhphHQSa555PI52pELWIdpumlvn1yrwSyaHb/kh+d81HfouMktFQZbOCxxnZoH7QX3/4MCdEjej3efCX6WsBUknEQNajNkX8m8ZT9X04FWC4ZcE4UyTNoH/9lfdfuWsSO47PkqWcAShHgayJvCG9R7qSO1YR6me7UMWw27SMGIFOT6pI6tHIzvYrUuaYWmreNeeNfv+f2x5al+qkjJpzCGg0YzQLN/T6SvVCkMeLLPPdDVMCiqr6GLz0X+0qJrogoXKSubzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUB6GYyOfawOilTxyY6P50eVZhVgib9uTYszQ2BXJnQ=;
 b=j5o+376Qykk8GKQY69HJvLecOAWa4QwAJhoKOdcXlxJ9AMOj5teSfSNYP/36/uxsFxLtS1XmQ1wReGfA9TgTO6a1z0wPR3W1EpAU0aGGIvunU4iyk8aToYDG0UlfyVhenqAJV6exHJR4lCUwDIuaN51YV9FRHokOaHMJWuMVrQBizPARna+45FA75ZpRtsD2PPmBVzviGB7QX9Rj5T5aRD0MEoZNF+i+CmEkS1yVIAs8XbZrle0q5eUf/39XofvUfBf/HlyxFwnyYaChNy28Ye/MRlpiv0r7WxemR4+j2NKGabGYkXsm0ebuLdgMQDGdDVrMsEFDdBoi2l4gXVB8gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUB6GYyOfawOilTxyY6P50eVZhVgib9uTYszQ2BXJnQ=;
 b=kDy1zdt+kmcOuM3sm0rBJJbXNRQhYC7wv7zvj82ojKKqHyiSmN6WtYBoJxbSgDScUoGM7daeZgb4hb0H2wNiuAExgpfh9SlReANLMgzjkA0eXu8Cn/olrDgF5u01kntl9uLLp5WVYk4SMqTNSdo1dTS4PFaxyteZBVrL0r/ovj0=
Received: from DBBPR04MB7514.eurprd04.prod.outlook.com (2603:10a6:10:1f7::15)
 by AS4PR04MB9652.eurprd04.prod.outlook.com (2603:10a6:20b:4cf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 15:58:16 +0000
Received: from DBBPR04MB7514.eurprd04.prod.outlook.com
 ([fe80::8df7:c378:ce65:d286]) by DBBPR04MB7514.eurprd04.prod.outlook.com
 ([fe80::8df7:c378:ce65:d286%4]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 15:58:16 +0000
From: Cyrille Fleury <cyrille.fleury@nxp.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Olivier Masse
 <olivier.masse@nxp.com>, "brian.starkey@arm.com" <brian.starkey@arm.com>
Subject: RE: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Topic: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Index: AQHYqNLEB1kEEMDN2EiJXHn7b90D762gcg6AgASkiYCABmvpAIAF7/SAgAHHYgCAAAWHgIAA1G/ggAJXJICABFH3gA==
Date: Tue, 23 Aug 2022 15:58:16 +0000
Message-ID: <DBBPR04MB7514E006455AEA407041E4F788709@DBBPR04MB7514.eurprd04.prod.outlook.com>
References: <20220805135330.970-1-olivier.masse@nxp.com>
 <20220805135330.970-2-olivier.masse@nxp.com>
 <20220805154139.2qkqxwklufjpsfdx@000377403353>
 <7e61668164f8bf02f6c4ee166e85abc42b5ee958.camel@nxp.com>
 <20220812163922.v7sf3havi5dpgi5u@000377403353>
 <de46324d8fa8fb6a8dda4641e531d30842410744.camel@nxp.com>
 <eef2fc413695cb96a5071627bfe44830f80cfe9e.camel@ndufresne.ca>
 <fb022db983aa44a5b1a8478d340198ecc52c4e11.camel@nxp.com>
 <AS8PR04MB75119C61E3222786A5BBF1D6886D9@AS8PR04MB7511.eurprd04.prod.outlook.com>
 <09942d325e3b3c3149ebd9787794b065554f6064.camel@ndufresne.ca>
In-Reply-To: <09942d325e3b3c3149ebd9787794b065554f6064.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7b63403-ded9-4d69-23b0-08da85204aa6
x-ms-traffictypediagnostic: AS4PR04MB9652:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kgX7x7JqEV82i6NEfSP6v4XZN7kFYnHcwtF10XmTB8JoVTeTdKLeW9RlZ+gySvBWRygy4UDnISqtcjI+1JxjJE3HMLNfRfI7wzdLHzvlM/WtXkOcH0RokI7F6787+GRBMO9Drvr6GWmSQcvXTcyS4nlXfw8VWzYY8HX34/xHpP9TBWxq/bryIsZ0QNYBbmRJvCAeY2hOq+yu3L1G4g7uWl8CRU/yYp333HOXvVPnmbVidgN82JFd+Sp/nEB76ia35OZiPK8+Th60Dmoj8ekZrbtCQ47WYFAHVDu549FYddFozV5uzJd7boQMIM/OPIIu0USMQ956Czeh6XCfwfBhCvC7wrVi7oaLpPm4DDcplQ9mRC/WPhOCIkhhtw8/AzqRqg5D1SFQCDK/XIjgyTmaz2ZsqwyVBvuSWW/Rqz6MEilWXW7wdiO+cpErjKKXNp1RibdyAau0RwHxlb/M+cxqgAJqyu1LyYoktaGNvcr4DBQhj+Eo+PB8//lRNWK1SoUmVFZ4XZSHe3fUpkkUt/+VOhbG/MCyJt2uUuVq5d+JIEG+cSu6PZ27PsKKv29SN6G7Ky2/x8DW9hIaCAUo5b0JbhP4183OEPq5zvXlx3yyy1LPYhlCTfD8UjpSWT5/ibaGTTk3yUnkG/57cXl+YrwgMYDS0lWOUj2x13fYth6XDeHpFpWuM6Cadxr10FaulmWRHQbuVeR4fv0a2N641AbyRFeVObkeWHuIifxJ1VOAMUMZCoVwcjyPMSKMQEWN2XVITkD9eig3odMFUXKW+RGGaXbJ+FpdEj1RwksDZ7u+E2s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7514.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(30864003)(76116006)(64756008)(66476007)(66556008)(4326008)(66446008)(66946007)(8676002)(110136005)(45080400002)(122000001)(38100700002)(54906003)(38070700005)(33656002)(86362001)(966005)(478600001)(83380400001)(6506007)(26005)(55236004)(9686003)(186003)(8936002)(5660300002)(7696005)(41300700001)(71200400001)(7416002)(2906002)(53546011)(66574015)(52536014)(55016003)(44832011)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wUiOavMS7JroN3YcjNAMF045REPuZpalq5IkhWvttnjVZZ/Le5XfvOHeN4?=
 =?iso-8859-1?Q?9WyFCZx5lcok03ZoEwaBp2YBX9RIWO5dfxda4OlGZ1QmbJCkpVvNGzgVgS?=
 =?iso-8859-1?Q?yTTHTveVpIzG4Cs1jxiPZpr1Rd6n9QIX3+17R/L+1/pMu8CdKdDJ+KOo0b?=
 =?iso-8859-1?Q?YlrXKhnhJWHtJrMnt5fDQrStKbiCGbtchDM4X9xexL/1sUsgH3Q9alK53n?=
 =?iso-8859-1?Q?izvcxNIqDjtXSECDRnWOlfLIx2z+ouszW5JHeIBD2PhV697Li/ri0dHh1u?=
 =?iso-8859-1?Q?l+8MWk/Gz/jVIJbHc8q4PzpFwnSx7ITu2QhY/0mayzUgTzrZfThcdHpDDT?=
 =?iso-8859-1?Q?jXKWD0dw7wRiH5TgdkPTHjNkKzd4n9pevr+BuV1VpDATQGnKlHKeIaz3YU?=
 =?iso-8859-1?Q?A47TAIgstY31/xUm39b0EMImqvlt/4WoFfAkHpmrmpF5Frj3wLWfs6oLuq?=
 =?iso-8859-1?Q?Eb0Z1Yajy2EizkL5Vlnk7UIEsIjoGWYjZ52VGYWeUdnPUpD4aNREpTu9px?=
 =?iso-8859-1?Q?EtBumrJ2i8xWSbJ5VKyDWtFd9niQq9ZTO4ZpqUcBPkd+qhQmc273fJ3AUJ?=
 =?iso-8859-1?Q?gp1r8xnU2CbMgXZp4Bw1NBo3V9DjbL/oBpLo3nZxdmmc+GHp6sSIIA3njv?=
 =?iso-8859-1?Q?UA+15zVktCTA5hIZNhHeoZJSktwqjUoPkxMRAHazivO+/gjAB77DhAgjme?=
 =?iso-8859-1?Q?xXyWvWSSdfWZJak+l+G1eJkfei5qOMnhJXCxvw8LqOf74b22mq1VkNDjxM?=
 =?iso-8859-1?Q?5GDiFjASNMB8PiwSUAizGAVhiciHCmC0rhtQlJGAqrevCNVmr19gl+PB4D?=
 =?iso-8859-1?Q?uHs+M1E4WcwITJM8rNylV8InrgPckqtbtpnsPO9ggtN4Z6l15Fk34AQtHd?=
 =?iso-8859-1?Q?1poJonAe9jIvxs17kSxChcRhEyinfiwmz4AFuONKl6h1SNrgYlNmCI4yBm?=
 =?iso-8859-1?Q?FVhcNXIgM4MS5EybcnvX2t3QfZer/zYynRvD2Lx8AIrhLGcRzbSKndRJ5v?=
 =?iso-8859-1?Q?+68ICjpmd0lTo36cMnJZvJYgCRQ7bWtjcXX1RIQLKuRnjOezTnfHKvG5Hb?=
 =?iso-8859-1?Q?OKwv3S8h5uzUc/XSe6ErTQJQLjmpkiWIy1jf8KopB1EEB+Gg7etbfkM/c5?=
 =?iso-8859-1?Q?OpXTfzJCpvbpjPxheOhqN1oQ2W6xDK67RzfNXFKLLP01YPB0xYV/GK2l7Q?=
 =?iso-8859-1?Q?1GCIIvaGHTu4LLWJ+aMPx99l7jRZWyg8fdeR7Pwr/j/jeFCqjhe5ynJc4j?=
 =?iso-8859-1?Q?+nhnmiy/T72Zv1/QX4zdsXG6eNIlcKKC82k8T9jkobrUcrVQoaiZp89CBY?=
 =?iso-8859-1?Q?3YaW70ssS41gkz0fXFnMsGs+l7/07FfC1FVLMlF8BUfqjDxCZ6mR4SDTYU?=
 =?iso-8859-1?Q?L0vkCiCmo/X4YpRJUjFWcBR0wNc/Wg2pQY3rty2nte8BkG6NORmMaCMMJH?=
 =?iso-8859-1?Q?aTmuPoIw31jg4KieX5zlFO+474CGP+eLwnFWf/FoLv95kEMRoS3lXZC/tF?=
 =?iso-8859-1?Q?qttHGbbpoQbxm+PI5S+JN+OKWaBq8MWUYcJAtBcitRWtNeB/SwiM4mrksv?=
 =?iso-8859-1?Q?ZXWmfmeg2sLyVK/CJJeT0R3CwbN/QrZQmdbuzI39vRLxhgNngqMH1dg9Om?=
 =?iso-8859-1?Q?XoJM4THUoVNYpQ5NdBfMl+hzlp59Ev4d1F?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7514.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b63403-ded9-4d69-23b0-08da85204aa6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 15:58:16.3883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zUSxRgwHfToLBIcxEIPVQU9LGSREipRP6HrNbe43ocPahM73BKSXG67G3l62ajPXXqffe/77G2Ags2K/LqbrsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9652
X-Mailman-Approved-At: Wed, 24 Aug 2022 07:28:14 +0000
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
Cc: Phi Bang Nguyen <phibang.nguyen@nxp.com>,
 =?iso-8859-1?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>,
 Antoine Boiteau <antoine.boiteau@nxp.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Joakim Bech <joakim.bech@linaro.org>, "nd@arm.com" <nd@arm.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicolas, all

Nicolas,  please see below in the thread for your concerns regarding video =
decoding and hdmi receivers with secure memory.

But i can also propose to setup calls to discuss about that. We are almost =
done with a proposal to add support of Linaro secure dmabuff heaps in V4L2.=
 Today It is functional with Linux 5.15 + i.MX8MQ evk board,  I mean we can=
 playback video using a secure dmabuf heap memory Linux can't read/write, b=
ut we still need some time to clean the code and have something ready for a=
 code review.

So maybe 2 different calls could happen:
    1) A first one to define a generic mechanism for Linux to manage (alloc=
ate/free) secure memory. By secure memory i mean a memory Linux can't read =
and write with the cpu running in non-secure mode.
          - Linaro secure dmabuf heaps seems to be a reasonable approach an=
d is available
          - Secure OS in charge of the hardware management to protect the s=
ecure memory, without any action to be done from Linux side, I mean when Li=
nux kernel starts, a secure dmabuf heap is already protected ,seems a reaso=
nable approach
          - then Linux Kernel needs to read device tree to know such secure=
 heaps exist and will expose them to user space world.
          - For memory isolation/sandboxing use cases, we may need differen=
t secure heaps.  For example, one secure heap, the  video decoder is allowe=
d to access (Secure Video Path like applications),and second secure heap Vi=
deo heap decoder is not allowed to access (secure payment like applications=
), but this is under responsibility of secure OS to configure such memory s=
ecurity rules before Linux kernel starts.=20

          - Using current Linux CMA, and ask dynamically the secure OS to a=
llocate and secure memory from existing CMA heap doesn't seem to be a right=
 approach to me. I think we should be more or less all aligned with that.
              Why is it not the right approach:
                 - when you release secure memory, you need to "memset" it =
to 0, because this memory can potentially  be reuse by non-secure world. It=
 can take a long time with 4K video buffers and during that time, the Linux=
 process calling the secure OS is stuck. Not good for real time or smooth v=
ideo playback.
                 - we need direct interaction between Linux and Secure OS f=
or each allocate/free of secure memory:
		   - different secure OS means different API to be called from Linux.
                                - it takes time for the CPU to switch from =
non-secure  Linux-> secure OS -> non-secure Linux. From what I have in mind=
, something like 1ms with a arm a53 cpu running at 1.5 Ghz, so max 1000 all=
oc/free per seconds, and again during that time, the Linux process calling =
the secure OS is stuck, waiting secure OS.
	                  - Linux and secure OS shall be in sync regarding memory =
allocation in CMA. Seems a very complex mechanism to maintain.
         =20
              ->  It is why we need dedicated dma buf heaps for secure memo=
ry, and why  Linaro secure dmabuf heap support is needed in Linux Kernel.

    2) A second call to discuss V4L2 using Linaro secure dmabuff heap, when=
 we will be ready for the code review.

Please let me know if you agree with this proposal to setup 2 different cal=
ls, as they are 2 different topics to be addressed.

Regards.

-----Original Message-----
From: Nicolas Dufresne <nicolas@ndufresne.ca>=20
Sent: Friday, August 19, 2022 5:14 PM
To: Cyrille Fleury <cyrille.fleury@nxp.com>; Olivier Masse <olivier.masse@n=
xp.com>; brian.starkey@arm.com
Cc: sumit.semwal@linaro.org; linux-kernel@vger.kernel.org; linaro-mm-sig@li=
sts.linaro.org; christian.koenig@amd.com; linux-media@vger.kernel.org; nd@a=
rm.com; Cl=E9ment Faure <clement.faure@nxp.com>; dri-devel@lists.freedeskto=
p.org; benjamin.gaignard@collabora.com
Subject: Re: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf=
 heap support

Caution: EXT Email

Hi,

thanks for the additional information, we are starting to have a (still par=
tial) overview of your team goals.

Le jeudi 18 ao=FBt 2022 =E0 05:25 +0000, Cyrille Fleury a =E9crit :
> Hi Nicolas, all,
>
>  The short reply:
>       - For DRM, gstreamer, ffmeg, ... we don't use anymore NXP VPU=20
> proprietary API
>       - We need secure dma-buf heaps to replace secure ion heaps
>
>   The more detailed reply to address concerns below in the thread:
>       - NXP doesn't design VPU, but rely on third party VPU hardware=20
> IP we integrate in our soc.  NXP proprietary API are for legacy=20
> applications our customers did without using gstreamer or ffmpeg, but=20
> we are now relying on
> V4L2 API for WPE/gstreamer, chromium/ffmpeg ...
>       - Even with NXP legacy BSP, there was no API impact for WPE (or
> chromium) due to NXP VPU API. We use WPE/gstreamer, then a gstreamer=20
> pluging relying on NXP VPU proprietary API. But now we use V4L2. So we=20
> can forget NXP VPU proprietary API, and I'm very happy with that.
>       - We have moved from ion buffer to dma buff to manage secure=20
> memory management. This is why we need secure dma-buf heaps, we=20
> protect with NXP hardware as we did with ion heaps in the presentation Ol=
ivier shared.
>       - For secure video playback, the changes we need to do are in=20
> user space world (gstreamer, WPE, ...), to update our patches managing=20
> secure ion heaps by secure dma-buf heaps. But dma-buf is file descriptor =
based as ion heap are.

Do you have some links to these changes to user-space code that demonstrate=
 the usage of this new heap in its real context ?

[Cyrille] We have a proposal for V4L2 + secure dma-buff heaps. Pull request=
 should be available soon. We added an allocator in drivers/media/common/vi=
deobuf2/videobuf2-dma-heap.c, following what has been done in videobuf2-dma=
-contig.c. With this new allocator, we can playback H264 and HEVC streams w=
ith gstreamer and secure dma heaps (memory Linux can't read/write, and prot=
ected by TZASC + NXP equivalent of Arm TZMP technology (RDC/TRDC for i.MX8M=
 family)). OPTEE is in charge of protecting memory, through a device tree a=
nd dedicated drivers in OPTEE, but OPTEE could be replaced by any other sec=
ure OS, as we don't rely on OPTEE to allocate memory.

>       - What will change between platforms, is how memory is=20
> protected. This is why we requested to have dtb in OPTEE for secure=20
> memory, to be able to provide a common API to secure DDR memory, and =20
> then to rely on proprietary code in OPTEE to secure it.
>       - We don't have a display controller or VPU decoder running in=20
> TEE. They remain under the full control of Linux/REE Word. If=20
> Linux/REE ask something breaking Widevine/PlayReady security rules,=20
> for example decode secure memory to non-secure memory, read from=20
> secure memory will return 0, write to secure memory will be ignored. Same=
 with keys, certificates ...

Can you explain how you would manage to make VP9 stateless decoding work ? =
On IMX8MQ you have a chip that will produce a feedback binary, which contai=
ns the probability data. The mainline driver will merge the forward probabi=
lity to prepare the probability for the next decode.

This basically means at least 1 output of the decoder needs to be non-secur=
e (for CPU read-back). That breaks the notion of secure memory domain, whic=
h is global to the HW. One could think you could just ask the TEE to copy i=
t back for you, but to do that safely, the TEE would need to control the CO=
DEC programming, hence have a CODEC driver in the secure OS.

I'm not familiar with it, but may that have impact on HDMI receivers, which=
 may need some buffers for CPU usage (perhaps HDR metadata, EDID, etc.).

 [Cyrille] We indeed got issues with VP9 codec with i.MX 8M stateless VPU, =
but not with vp9 continuity counters/feedback binary. There is no really se=
cret in those feedback information ( I mean you cannot build an image from =
them), so they can be expose through non-secure memory to Linux. Issue we g=
ot is related to amount of video meta data Widevine encrypt, because some m=
eta data not supported by i.MX8 stateless VPU (Hantro G2 decoder) shall be =
parsed by CPU, but they are encrypted by Widevine. Widevine is not followin=
g CENC specification regarding those meta data. So we informed Widevine but=
 they are afraid to change the encryption model they use for VP9. So to sup=
port VP9, we need to parse those VP9 meta data in OPTEE, in a dedicated Tru=
sted Application, to detect and expose them to Linux. There is no secret in=
 those meta data, the only risk is a bug in our parsing algorithm, and I ag=
ree this is not very good at secure video path level, but we have no other =
solution for VP9 codec with 8M family having Hantro stateless VPU. H264 and=
 H265 streams don't have such issues.
=20
I don't think HDMI receivers are an issue: data bitrate is just too big for=
 a cpu, and so for the kind of information you mentioned (meta data, audio =
codec, audio clock, number of audio channels....) we rely on interruption a=
nd registers exposed by the HDMI controller receivers to notify changes in =
the hdmi flow, in order to reconfigure the hardware/software accordingly. E=
DID use a slow I2C bus like, but there is no sensible data there at DRM poi=
nt of view. So cpu can parse it if not already managed by the HDMI receiver=
 hardware and shared through registers.


>       - i.MX8 socs have a stateless VPU and there is no VPU firmware.=20
> i.MX9 socs have a stateful VPU with firmware. In secure memory=20
> context, with secure memory, at software level, stateful VPU are even=20
> more simple to manage -> less read/write operations performed by Linux=20
> world to parse the stream, so less patch to be done in the video=20
> framework. But for memory management, stateful/stateless, same=20
> concern: we  need  to provide support of secure dma heaps to Linux, to=20
> allocate secure memory for the VPU and the display controller, so it=20
> is just a different dma-buf heaps, so a different file descriptor.

i.MX8 boards may have stateless or stateful CODEC (Hantro chips are used in=
 stateless fashion, while Amphion chips are driven by a stateful firmware).=
 I would have hoped NXP folks would know that, as this is what their users =
have to deal with on day-to-day.

[Cyrille] Correct, I should have mentioned i.MX 8M  family (Hantro VPU only=
), and not i.MX 8 to avoid confusion.

May I interpret this as NXP is giving up on i.MX8 memory protection (or per=
haps your team is only caring about i.MX9 ?), and this solution is on usabl=
e for stateful (less flexible) CODECs ?

[Cyrille] We target both stateless and stateful VPU. For 8, it is i.MX 8MPl=
us and 8MQ, for 9 it will depends what customer request for DRM. It doesn't=
 make sense to support Secure Video Path for all socs.=20

>       - i.MX9 VPU will support "Virtual Machine VPU". Till now I don't=20
> see why it will not work. I'm not an expert in VM, but from what I=20
> understood from my discussions with NXP VPU team integrating the new=20
> VPU hardware IP, from outside world, VPU is seen as multiple VPUs,=20
> with multiple register banks. So virtualized OS will continue to=20
> read/write registers as today, and at software level, secure memory is=20
> as non-secure memory, I mean at this end, it is physical DDR memory.=20
> Of course hardware shall be able to read/write it, but this is not=20
> software related, this is hardware concern. And even without VM, we=20
> target to dedicate one virtual VPU to DRM,  so one register bank, to setu=
p dedicated security rules for DRM.

What you wrote here is about as much as I heard about the new security mode=
l coming in newer chips (this is not NXP specific). I think in order to pus=
h forward designs and APIs, it would be logical to first present about thes=
e mechanism, now they work and how they affect drivers and user space. Its =
not clear how this mechanism inforces usage of non-mappable to kernel mmu m=
emory.
Providing Open Source kernel and userland to demonstrate and use this featu=
re is also very helpful for reviewers and adopters, but also a requirement =
in the drm tree.

regards,
Nicolas

>
>   I'm on vacation until end of this week. I can setup a call next week to=
 discuss this topic if more clarifications are needed.
>
> Regards.
>
> -----Original Message-----
> From: Olivier Masse <olivier.masse@nxp.com>
> Sent: Wednesday, August 17, 2022 4:52 PM
> To: nicolas@ndufresne.ca; Cyrille Fleury <cyrille.fleury@nxp.com>;=20
> brian.starkey@arm.com
> Cc: sumit.semwal@linaro.org; linux-kernel@vger.kernel.org;=20
> linaro-mm-sig@lists.linaro.org; christian.koenig@amd.com;=20
> linux-media@vger.kernel.org; nd@arm.com; Cl=E9ment Faure=20
> <clement.faure@nxp.com>; dri-devel@lists.freedesktop.org;=20
> benjamin.gaignard@collabora.com
> Subject: Re: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure=20
> dmabuf heap support
>
> +Cyrille
>
> Hi Nicolas,
>
> On mer., 2022-08-17 at 10:29 -0400, Nicolas Dufresne wrote:
> > Caution: EXT Email
> >
> > Hi Folks,
> >
> > Le mardi 16 ao=FBt 2022 =E0 11:20 +0000, Olivier Masse a =E9crit :
> > > Hi Brian,
> > >
> > >
> > > On ven., 2022-08-12 at 17:39 +0100, Brian Starkey wrote:
> > > > Caution: EXT Ema
> > > >
> >
> > [...]
> >
> > > >
> > > > Interesting, that's not how the devices I've worked on operated.
> > > >
> > > > Are you saying that you have to have a display controller driver=20
> > > > running in the TEE to display one of these buffers?
> > >
> > > In fact the display controller is managing 3 plans : UI, PiP and=20
> > > video. The video plan is protected in secure as you can see on=20
> > > slide
> > > 11:
> > >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fstat
> ic.linaro.org%2Fconnect%2Fsan19%2Fpresentations%2Fsan19-107.pdf&amp;da
> ta=3D05%7C01%7Ccyrille.fleury%40nxp.com%7C13a4dd35018b43f9f63908da81f570
> 30%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637965188416145231%7CU
> nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DcZ7BP3BJXVIBX8kCGcj%2FCNbe
> P4cB%2BaSjgGOfPMh6k4E%3D&amp;reserved=3D0
> >
> >
> >
> > just wanted to highlight that all the WPE/GStreamer bit in this=20
> > presentation is based on NXP Vendor Media CODEC design, which rely=20
> > on their own i.MX VPU API. I don't see any effort to extend this to=20
> > a wider audience. It is not explaining how this can work with a=20
> > mainline kernel with v4l2 stateful or stateless drivers and generic=20
> > GStreamer/FFMPEG/Chromium support.
>
> Maybe Cyrille can explain what it is currently done at NXP level regardin=
g the integration of v4l2 with NXP VPU.
>
> >
> > I'm raising this, since I'm worried that no one cares of solving=20
> > that high level problem from a generic point of view. In that=20
> > context, any additions to the mainline Linux kernel can only be=20
> > flawed and will only serves specific vendors and not the larger audienc=
e.
> >
> > Another aspect, is that this design might be bound to a specific=20
> > (NXP
> > ?)
> > security design. I've learn recently that newer HW is going to use=20
> > multiple level of MMU (like virtual machines do) to protect the=20
> > memory rather then marking pages. Will all this work for that too ?
>
> our fire-walling hardware is protecting memory behind the MMU and so rely=
 on physical memory layout.
> this work is only relying on a reserved physical memory.
>
> Regards,
> Olivier
>
> >
> > regards,
> > Nicolas

