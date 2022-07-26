Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F2B58128C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 14:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85918E411;
	Tue, 26 Jul 2022 12:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 367 seconds by postgrey-1.36 at gabe;
 Tue, 26 Jul 2022 12:00:08 UTC
Received: from de-smtp-delivery-113.mimecast.com
 (de-smtp-delivery-113.mimecast.com [194.104.109.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F5F8E44E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 12:00:07 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2049.outbound.protection.outlook.com [104.47.22.49]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-44-Fz5yqYjmM3q_rJRSFJSXpg-1; Tue, 26 Jul 2022 13:53:55 +0200
X-MC-Unique: Fz5yqYjmM3q_rJRSFJSXpg-1
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 GV0P278MB0402.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:31::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.18; Tue, 26 Jul 2022 11:53:53 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3510:6f55:f14a:380f]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3510:6f55:f14a:380f%6]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 11:53:53 +0000
Date: Tue, 26 Jul 2022 13:53:52 +0200
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Max Krummenacher <max.oss.09@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>, Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Nikita Kiryanov <nikita@compulab.co.il>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/4] drm/panel: simple: add bus-format support for
 panel-dpi
Message-ID: <20220726115352.GA25619@francesco-nb.int.toradex.com>
References: <20220628181838.2031-1-max.oss.09@gmail.com>
In-Reply-To: <20220628181838.2031-1-max.oss.09@gmail.com>
X-ClientProxiedBy: ZR0P278CA0035.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::22) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76a85f7d-415e-4a37-7fd2-08da6efd8312
X-MS-TrafficTypeDiagnostic: GV0P278MB0402:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 1T41ishksomgfRVChM26EAAfuzue6L7xN57hB1y67gSsr2U7vgONc1KzMBB7A23e96wIXFzZUUTL7ZeOZDlGAyf/IxMK1AZR28GA9dVn5GQzNILAulXPURbmhdFmJ2/eTx5kaIUZ00egx3d3Hc34DVedp824Z/PvcNYBfrvXNR6EPVau/f9Pl2VIaI7YwcNfunX6oHGnFaTMDGpIF79gqL55du5O6zt1aq44Ee2//LHZMnLJSLOVwTRwOyFBUPu3tvInDnC6kfGJh2FBUE4WTwEBoCPtQCh78IzxrfjtbbiAmvddxXDaVErGufAPB1tqPzuZyJn2OKaSc3ZMEJGh8ezx2W7YfezGUrxCKivupeUpU0IBUsd0xnh7WMABD2C6B0DxEp5/CSIk3yLVQl839Zfj1Nn7Zt5y21stcZ0aIxlRuOSpzMw7zGWUXXOirnbMF4p5geNcsnZpiKi7eA1r07Fh1RVq5H832sKpD8HgqF2NniroFv5KfwMRAlGSjkOm8RunNjMq+UkmZbys62Knr1AsOtca61fGbVJ4o5MOhKnf35xvjCajKH7b/ctulhOnVn0j/l1D9qaZ6UGVWnBd3xygxkPRCkVLN+2OWNoqgbgtjpwy0vGYF1R2qKCDUJd0rULlNsU/T+UeRrXEQCqbO4x9kOxoo+NGiAgCIG7bNwEyPC5IL4GTBIcsJ5KRcPp2HzajWMYOmseeZVpq1t+n8SXoPbNLVCD6wqNgQ42wpaLTPUns2kjv+DubMQnkE6Zc+TO2hOGfSZ9g2NxV9D6SzJ3T3WQahCPFKOoAhLBD6S0TGT+T7BMWeBLjvytFpLe4d2x/acy2vJ543a7FTmSrJOUKc/DnGeR+A8J+LFlUfdE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(136003)(366004)(396003)(346002)(376002)(83380400001)(478600001)(6486002)(966005)(86362001)(2906002)(38100700002)(44832011)(38350700002)(4744005)(5660300002)(8936002)(33656002)(7416002)(26005)(4326008)(6506007)(52116002)(6512007)(41300700001)(921005)(8676002)(66946007)(66556008)(66476007)(110136005)(186003)(1076003)(316002);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B0NC/LrCItkIfBC+hMJajq/pM+Jf2OMXDQpFyDZztQU0zMt35oNe1Aw9SE7+?=
 =?us-ascii?Q?O2B5m7hAqXMwX7yicSEec6hcREFUQZoVfVUXPENOLzHxsc4obTtLQxLUu82b?=
 =?us-ascii?Q?RrbKplmh9FPEKZRHlgbS/q4+1yQYxjy+dCOr83vrYimcgZQ57MN0iKN3qBuQ?=
 =?us-ascii?Q?SZib/HHb0mHGXF0QFrwnEpfSUK+qSRLlvskYELVpTC1OPIxVLuSqBvE0c2bs?=
 =?us-ascii?Q?BOXQLXD1VS3T9WPIrb5prVbOz95LdTN2TobvIEZMyShPxUOJutbC/MrF+XC2?=
 =?us-ascii?Q?rj+zBi6cMOFWeWcqgStskt2u7jn/aSjvkRtpXt+/VcjOI5LoI8epfcHWBwmh?=
 =?us-ascii?Q?5QpJlosbsJNOHrHX1MjIh+WJE0kSlf/pn+mpJtMJYU6ImVtjY1S5eHnab/QG?=
 =?us-ascii?Q?qY2KbFkethhj9+WpiW6zB1v2pyt8d2HQmoKxxjbiiRAo+pVHylHqz0/YrZCY?=
 =?us-ascii?Q?69b7CDd0dXKZ3+hY3QNkdRwBH1iNYfJi575f0HMU5XKtAqdM0b35btbD/I1G?=
 =?us-ascii?Q?HFo8jm4zPREouCeJoiPM7WEeQR3XoPTTy6t6GkYDpguIFcY9wOSNj1K1N84L?=
 =?us-ascii?Q?mzy+WR3fbg0Ahoj0CXgkuflnm/o28h8A+P0WND5F5NwqpC16wsIykpNBId8S?=
 =?us-ascii?Q?X8mYs8L7wmHdSEouOWOW+s3mVjUXBZqUFhYkMQcqC09jSkwx4gCMoQ3ggRk5?=
 =?us-ascii?Q?3mIQdzIPDxXC7x8jti9wqEydilgHdmKeTGezavUZjcZmftT4C0caCpDQXcKH?=
 =?us-ascii?Q?ijcOJ4Wg/Y0aJYOaZknlCRRVY7/8/O6+JbygZVCzceIDVRa0wbZt/XQ7o8u6?=
 =?us-ascii?Q?bdnTtS1DK+EWwZXa5UcCvcYfdQEd5M2gMmdypcpy96CEaR7cmiVkSyZWYUPi?=
 =?us-ascii?Q?JFT6ARAAF+wXN2dResUQ6nw/V+4OUIP5s0Cl4YuGY9zqQnuOsvFmBGsqswk7?=
 =?us-ascii?Q?sRCzgdCRxm9gzBvM81bXLMWQpj0jqWdUJduvgWM3lLo7+EYbL3rsUkhy05ds?=
 =?us-ascii?Q?gkyaAbVYTQuebcvIeR2P33WVoG6NYTJI+a17t2ZfDMLSBTeOnUHleQs98xJD?=
 =?us-ascii?Q?qcHcWAUTU6Aq2A3GPuc3y/t2Te38BQkVvV9BBmzcIcxbunDfaQKEtv9dinXk?=
 =?us-ascii?Q?jNTDzdIcsg3CNLB81+ArnYi5pqMwO2p5KgcbNI0KKfteI4Vpp2JRbhQUzSBw?=
 =?us-ascii?Q?RPe7OdghQf2L/iJKVtu2SWObC0FHPuxiYYoDR0lnIXBumg02DFNT8fsLoLWj?=
 =?us-ascii?Q?Yjns31K61NfwMul+SiQcGnnhc9QGGPiNxt/tD0IAba6xBfBGNmT3H5FA1AEL?=
 =?us-ascii?Q?NZrfJFLeiy95KiCzZSSIYUCB0pxp1m85ZwBvWk53lkTD1N04dexx5BIdfFOM?=
 =?us-ascii?Q?frF2ENzaVj8lFpbbZ6Pt85McAkoRzPIQvAuKJ+ffcJ0M1Tb/Ry4F3pGByE5X?=
 =?us-ascii?Q?Baks7ePLRRpf0nxhKa4uYifrzOva26ntoPiL/8GtPkggUFyN6c8CGUhwuUnU?=
 =?us-ascii?Q?9scL9cpJBZEzsnJhaZAnRXBMP7Gwv9Cwj/e90kGTiYzZqGDjSrDse2rDlbGd?=
 =?us-ascii?Q?Wg68eaXvX0fQiaaPCkHDipwjrHst77le9h8xg1ZVLLt2Fe/7Smv6Bdsf1gw9?=
 =?us-ascii?Q?kg=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a85f7d-415e-4a37-7fd2-08da6efd8312
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 11:53:53.2405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WE4uD0ZjK0z8UWLmbgJGyHiP7WRwjZ5DfYHLJLyKt/YdFBB81hegTkFTUKRjfOhaKzpLrP0PozQGUMrpEvLKmgkNDco976dZPR6jtzUagDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0402
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
Cc: linux-kernel@vger.kernel.org, max.krummenacher@toradex.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello all,

On Tue, Jun 28, 2022 at 08:18:34PM +0200, Max Krummenacher wrote:
> Commit 4a1d0dbc8332 ("drm/panel: simple: add panel-dpi support") added
> support for defining a panel from device tree provided data.
>=20
> However support for setting the bus format is missing, so that with
> the current implementation a 'panel-dpi' panel can only be used
> if the driver of the display interface connected can cope with a
> missing bus_format.
>=20
> This patch series defines the new property bus-format and adds it to
> the panel-dpi implementation.
>=20
> Check initial discussions [1] and [2].
> [1] https://lore.kernel.org/all/20220201110717.3585-1-cniedermaier@dh-ele=
ctronics.com/
> [2] https://lore.kernel.org/all/20220222084723.14310-1-max.krummenacher@t=
oradex.com/

Any blocker to move this series forward? Apart the valuable feedback
from Rob no comments in the last month.

Thanks,
Francesco

