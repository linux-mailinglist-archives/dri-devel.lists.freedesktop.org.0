Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4757FB41B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 09:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8129B10E452;
	Tue, 28 Nov 2023 08:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3745410E454
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 08:30:38 +0000 (UTC)
Received: from i53875bf8.versanet.de ([83.135.91.248] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1r7tUD-0002DK-Ck; Tue, 28 Nov 2023 09:30:29 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 04/12] drm/rockchip: vop2: clear afbc en and transform
 bit for cluster window at linear mode
Date: Tue, 28 Nov 2023 09:30:28 +0100
Message-ID: <15178289.EVyyLHbfrO@diego>
In-Reply-To: <ebe46d19-954d-4dbb-82ba-a443058e9f4e@rock-chips.com>
References: <20231122125316.3454268-1-andyshrk@163.com>
 <3927498.QCnGb9OGeP@diego>
 <ebe46d19-954d-4dbb-82ba-a443058e9f4e@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: devicetree@vger.kernel.org, s.hauer@pengutronix.de,
 chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, 28. November 2023, 09:03:46 CET schrieb Andy Yan:
> Hi Heiko:
>=20
> On 11/27/23 23:02, Heiko St=FCbner wrote:
> > Am Mittwoch, 22. November 2023, 13:54:25 CET schrieb Andy Yan:
> >> From: Andy Yan <andy.yan@rock-chips.com>
> >>
> >> The enable bit and transform offset of cluster windows should be
> >> cleared when it work at linear mode, or we may have a iommu fault
> >> issue.
> >>
> >> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> > I guess same here?
> >
> > Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
>=20
>=20
> I'm not sure if we need a Fixes tag here,  in fact this issue never happe=
ns on
>=20
> rk3566/8 , because the cluster windows of rk356x only support afbc format,
>=20
> they don't have a chance to switch between afbc and linear mode.
>=20
> Of course, the lack support of linear mode of rk356x cluster windows is a=
 thoughtless
>=20
> of IC design, if it really support both afbc and linear format, we indeed=
 need this fix.
>=20
> The situation is the same as patch 03/12.
>=20
> So I hope follow your advice, if it need a Fixes tag here.

ah ok, thanks for the explanation. Then I guess we don't need a fixes tag
when the rk3568 is not affected by this.

Same for the other patch. If you're re-sending you could add this informati=
on
to the commit message though. (existing support for rk3568 only supports
afbc cluster windows and is therefore not affected)


Thanks
Heiko


