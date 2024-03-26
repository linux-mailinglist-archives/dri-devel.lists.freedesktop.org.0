Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C4988CD36
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 20:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F77510F218;
	Tue, 26 Mar 2024 19:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFBC10F218
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 19:29:47 +0000 (UTC)
Received: from i53875aaf.versanet.de ([83.135.90.175] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rpCUM-00073Q-7n; Tue, 26 Mar 2024 20:29:38 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: hjc@rock-chips.com, andy.yan@rock-chips.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: rockchip: add missing
 #sound-dai-cells to dw-hdmi
Date: Tue, 26 Mar 2024 20:29:37 +0100
Message-ID: <1994969.8hb0ThOEGa@diego>
In-Reply-To: <5fb55234-4afd-4e6a-9763-4d2e344e0ce6@linaro.org>
References: <20240326172801.1163200-1-heiko@sntech.de>
 <edc0bfa2-7984-4d9d-ba25-4805ee0be679@linaro.org>
 <5fb55234-4afd-4e6a-9763-4d2e344e0ce6@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, 26. M=E4rz 2024, 18:50:37 CET schrieb Krzysztof Kozlowski:
> On 26/03/2024 18:50, Krzysztof Kozlowski wrote:
> > On 26/03/2024 18:28, Heiko Stuebner wrote:
> >> The #sound-dai-cells DT property is required to describe link between
> >> the HDMI IP block and the SoC's audio subsystem.
> >>
> >> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> >> ---
> >>  .../devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockch=
ip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockch=
ip,dw-hdmi.yaml
> >> index af638b6c0d21..3768df80ca7a 100644
> >> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-h=
dmi.yaml
> >> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-h=
dmi.yaml
> >> @@ -124,6 +124,9 @@ properties:
> >>      description:
> >>        phandle to the GRF to mux vopl/vopb.
> >> =20
> >> +  "#sound-dai-cells":
> >> +    const: 0
> >> +
> >=20
> > Then you miss $ref in allOf to /schemas/sound/dai-common.yaml
>=20
> I meant, except your change you should add also above $ref.

sorry about that, will fix that.

Thanks for the pointer
Heiko



