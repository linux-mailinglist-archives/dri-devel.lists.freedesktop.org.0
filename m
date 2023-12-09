Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A5980B4C8
	for <lists+dri-devel@lfdr.de>; Sat,  9 Dec 2023 15:05:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF4D10E137;
	Sat,  9 Dec 2023 14:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870A110E137
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 14:04:58 +0000 (UTC)
Received: from i5e860d1d.versanet.de ([94.134.13.29] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rBxws-0003yF-PB; Sat, 09 Dec 2023 15:04:54 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v4 15/17] dt-bindings: iommu: rockchip: Add Rockchip RK3588
Date: Sat, 09 Dec 2023 15:04:53 +0100
Message-ID: <2860437.jE0xQCEvom@diego>
In-Reply-To: <bbf4d7a5-a6f5-447a-9f3e-1cd6f2acc7c9@rock-chips.com>
References: <20231207075906.651771-1-andyshrk@163.com>
 <4012684.R56niFO833@diego>
 <bbf4d7a5-a6f5-447a-9f3e-1cd6f2acc7c9@rock-chips.com>
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Am Samstag, 9. Dezember 2023, 02:26:25 CET schrieb Andy Yan:
> Hi Heiko:
>=20
> On 12/9/23 00:29, Heiko St=FCbner wrote:
> > Am Donnerstag, 7. Dezember 2023, 09:02:35 CET schrieb Andy Yan:
> >> From: Andy Yan <andy.yan@rock-chips.com>
> >>
> >> Add a Rockchip RK3588 compatible
> >>
> >> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> >=20
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> >=20
> > In the next iteration, please split this out into a separate patch and =
send
> > it to the iommu+dt maintainers.
> >=20
> > Supporting the iommus on rk3588 can be realized separately and the
> > patch needs to go through a separate tree anyway.
>=20
> Okay, I will split this patch out of this vop2 series, does this mean that
> I also need to split out the iommu dt node as a separate patch from curre=
nt
> PATCH16 ?

no :-) .

The vop-iommu can stay together with the vop core node.
As adding the actual vop iommu is very much tied to the vop node.

=46or the iommu-compatible it was different. The compatible just declares
that the iommu acts similar to the one on rk3568, so is related to the iommu
driver itself and should go through the iommu tree.

So all is good here.

Heiko


