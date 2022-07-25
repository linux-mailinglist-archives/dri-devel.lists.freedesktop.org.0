Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F373D58073A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 00:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF4D10F5C2;
	Mon, 25 Jul 2022 22:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 365 seconds by postgrey-1.36 at gabe;
 Mon, 25 Jul 2022 22:20:40 UTC
Received: from de-smtp-delivery-113.mimecast.com
 (de-smtp-delivery-113.mimecast.com [194.104.111.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0FA10F53F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 22:20:40 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2047.outbound.protection.outlook.com [104.47.22.47]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-EnOrU_A3NcabtOfxJ0gtTQ-1; Tue, 26 Jul 2022 00:14:29 +0200
X-MC-Unique: EnOrU_A3NcabtOfxJ0gtTQ-1
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR0P278MB0441.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:25::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Mon, 25 Jul 2022 22:14:27 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3510:6f55:f14a:380f]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3510:6f55:f14a:380f%6]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 22:14:27 +0000
Date: Tue, 26 Jul 2022 00:14:26 +0200
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH 1/8] dt-bindings: display: ti,am65x-dss: Add port
 properties for DSS
Message-ID: <20220725221426.GB9665@francesco-nb.int.toradex.com>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
 <20220719080845.22122-2-a-bhatia1@ti.com>
 <20220720232845.GA4164694-robh@kernel.org>
 <a2e5037c-22c0-8424-4031-0bf587120990@ti.com>
In-Reply-To: <a2e5037c-22c0-8424-4031-0bf587120990@ti.com>
X-ClientProxiedBy: MR2P264CA0185.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::24)
 To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f9eff03-f9cc-42a3-cdb5-08da6e8b0a17
X-MS-TrafficTypeDiagnostic: ZR0P278MB0441:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: kQj8HQSeb9F2rxMOCLCuDYctJv8jbQOuWor0FauY0DJCuLAujT/3IRsd0PzxZfunTJHdENSb0ExzTqCyR4lXaqiqertSfB+H/TQlz4JQ48QhvcubYJRQL4MSFv8Kon7CIFl85ZUzG3tGIs7rtq45xx3jXAXT4MJxfHHw0zTxqpeAhuZzEyEAa4BN0kCD/WSSSngrPwioqDIxXz3kpXOcQKDv3ddHSSbpg2iIGHdOVB6DZSJnH0zmTRjM584/oCqvJBLagov6h8q8FNwmfaAoAod9Dou58EIVrh4EO37B4/ilLLCr4A5/ar+DHIGBj3oicxygFoJRUZTFfvmCbeArReu3kTCJT5MgnxW6gotdK30FOnQz+9SIatVVHblA4vSRhh6ycimdjquRXTILtGnBiu19rHV9O6lB7LezdIYTjmL4dLm0mM2GeoBqpjJivf7XgUH37ausOtjvyyz4IlmGjdSXf+pYxnxEFOAb2+TD5cXjfg6ou8SDcqcbJMs9yNBmYx2YY/trztUwhd7NieTpszv/haF7Xbk7vYyFeYosovsNQB3U8CRHlw9VbHWblUXLSPykPlrTwyV1kvUql0zY2XIHVgdvLXgi1oyFp7ixrlICLTiuGUaTl+TfoNKjmscfaK/G9sdx0WYByKOqIW7nWoc6CugEz8igLUDN5dEZyY9/dy1YTQ+0VHwNT+BwdCHsuD8wl+HXma/QWeVHZ4XOJlNSyEH7dg9gU/ioNHKLwWtGJ1Q1wqb/nSE/MB83mfMUJ4EoqrCYn1hNtLPDO9x3yZlHdMGUzqDeYMfNmFSNX9IOYUt0kt3Y0+na7WljtTLg/2Ck9yYinc85GWd6ivUskg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39840400004)(376002)(366004)(346002)(136003)(38100700002)(1076003)(38350700002)(186003)(66946007)(4326008)(8676002)(6916009)(316002)(66556008)(66476007)(54906003)(6486002)(6506007)(966005)(53546011)(33656002)(52116002)(2906002)(41300700001)(86362001)(5660300002)(6512007)(26005)(44832011)(8936002)(7416002)(83380400001)(478600001);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cE5ySfIv8wS4PYwb4RfSHpvriMLmOn0ScX24YjG9r9RoXnvOVjeQztoAzAhN?=
 =?us-ascii?Q?EfToapspThoAgmFkYt37WxvMbD/VOkxl1RsHp8qKICuapdmkkFlxY/fDxX4o?=
 =?us-ascii?Q?W3XCQSPZkDEkD0mq9WMp+KiKJxrC5VsnlJbjPotpK38ySR66PHm+JgwHj37x?=
 =?us-ascii?Q?godX0d1vLGqEV+QNppNRMBtvvfKH2q/9Qbr6sppW5W0HY5Lyn7jnaNGkfgZR?=
 =?us-ascii?Q?uQg7C6OEGFZAeiDy2bXWCMYerTwekNjmcqX9EjTW1X8IWHFMc4z4ju4KbJO3?=
 =?us-ascii?Q?t/bJfh5T3BXZg6zpeRJXJ+kIrf50+aSPE1idrkPkdrBvtng5B/CiAhAbtOBs?=
 =?us-ascii?Q?CtJnHTbJxz9nyxd5G+zRrkKuhfkcRAfzUfKlsXb/5brLwUYdyTAA6MiJjwwc?=
 =?us-ascii?Q?LwxL18mChJb4MaJfKyiBzc2NGzEEuVfggStCZkbMstNT85Mw2xrFyFG/e8/p?=
 =?us-ascii?Q?1tNcCHJppk90pnhtGOF88oBeIMIS68RwBku+3NXoPgzjKCNUrK8M5MGctTfv?=
 =?us-ascii?Q?smbffR1Y/Olii9MPL+vR87yyXf+gGxkt66eejfdXUSiqBhnPVeBLB9/5fxyM?=
 =?us-ascii?Q?Gkls19MZLANzS7ywpfjpZUb6CglWx5Np0DXZGwEgU0TXFM97DvzOzAhOX0Y4?=
 =?us-ascii?Q?IO+jPPEuNrpnni1FZ0k/e0gdJdx3SNUIg1F2g1rn3xX5peJmojqSJ8IK3DcR?=
 =?us-ascii?Q?eMBU8glDFRRLdZyQNF6FSvWsnU6UT7YPDPK/HW9Pp8jcXyylpFGFVsKrANEU?=
 =?us-ascii?Q?blGcKIyVUFfTgyPmeDj+k+muCm58/GEx1ArhDxzikAmtu62Rjg1A8ychTTA7?=
 =?us-ascii?Q?/Td3pV5VueVjcpPHzTbMHH/WaBsveyZfFH4iQUeo9dfmmtxXj8uOTpQt1xR+?=
 =?us-ascii?Q?yTurnr+z3fR7XK3xzdz6CJERXvzI0ZYnWO0rANkuG/GNjs8mBVkjEC4XWbrM?=
 =?us-ascii?Q?xY9TboEw3U29moLAvbxvq8G5HNTH/Lg3elv7PcKlvPKoA6IgX/qOUiMv713P?=
 =?us-ascii?Q?goVVxULf0EqGWeApNhQCGaWvX8CQqLoYhTJiAMtE6U0FFuO6+CV0s7YB2clV?=
 =?us-ascii?Q?MSdU1ghzS2YDTvQzm4MTUvJEXuFgox7FP60qENrjVo2Mw3/2nlu2x7Zkmzgl?=
 =?us-ascii?Q?XV8tPe7Sro6G++wVKMbGkoQMli23xEMOSk0bPw4nQ8yLOULKk43w4wgTUnjf?=
 =?us-ascii?Q?gUHOC7L2uK0fU6i12Rc9VEU5ji0ECU9Z+C++RPCpbPMt0GTr6ursG4VA+nY7?=
 =?us-ascii?Q?TBtY4mcVREWB5RRlJnPPGz2bUaLrglLQYyowKFozbhANbSjhai3xlTxTGHCW?=
 =?us-ascii?Q?FnDhY0pneco78fXRdyOWvb77vREu8HKo5xtbJNFF9HLtGuB9u7fEdsvIiHK5?=
 =?us-ascii?Q?NWSU5OUOrrydfCy/XG1kznHbmcYOW+gB01J0zWyV4ncPrLuNxsHxNHv4r3KC?=
 =?us-ascii?Q?zQuN20yBjbALHyVGTzlcNYbBMga6fJKtO4f+BQoblHCwF7AhfPDoZG5SivlM?=
 =?us-ascii?Q?jrva8SfI4arWpt43ssSx1SM0t5M0prdx87MCYI0xpGnQ8S49qX9b/t3TYazK?=
 =?us-ascii?Q?agpsZDkNkz3dotqObIxKBXOwfJlyTaf/7bvz3DsHzYiiwuhXk+ylFovJlTwD?=
 =?us-ascii?Q?1Q=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9eff03-f9cc-42a3-cdb5-08da6e8b0a17
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 22:14:27.5813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86UFHkkCU4kWqBbDdE3//xVZwj/tqEdQTvSOCgBV+jO4H+rjODWx7rEjZIR1B5B/vRfQOGzQTvHXbw03GrvoktNxPmN4Ts4U3+p0HJPo5mU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0441
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CDE13A77 smtp.mailfrom=francesco.dolcini@toradex.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
Cc: Nishanth Menon <nm@ti.com>, Krunal Bhargav <k-bhargav@ti.com>,
 Tomi Valkeinen <tomba@kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Darren Etheridge <detheridge@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 25, 2022 at 04:56:15PM +0530, Aradhya Bhatia wrote:
> On 21-Jul-22 04:58, Rob Herring wrote:
> > On Tue, Jul 19, 2022 at 01:38:38PM +0530, Aradhya Bhatia wrote:
> > > +
> > >         port@1:
> > > -        $ref: /schemas/graph.yaml#/properties/port
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > >           description:
> > >             The DSS DPI output port node from video port 2
> > > +        properties:
> > > +          ti,rgb565-to-888:
> > > +            description:
> > > +              property to override DPI output to 16bit for 24bit bri=
dge
> > > +            type: boolean
> >=20
> > There's work underway for standard way to handle interface formats[1].
> > Please help/comment on that to make sure it works for you.
> >=20
> > Rob
> >=20
> > [1] https://lore.kernel.org/all/20220628181838.2031-3-max.oss.09@gmail.=
com/
>=20
> I also followed what this patch series is implementing. This seems to be
> applicable for cases where the DPI pins are drawn and forwarded towards
> a simple panel capable of accepting the raw parallel data.

It would be great to have that patch move forward and eventually get it
merged, only Rob commented weeks ago.

Francesco

