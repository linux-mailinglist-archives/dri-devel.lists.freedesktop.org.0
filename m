Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF0EB58353
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 19:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B52510E51A;
	Mon, 15 Sep 2025 17:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kk/wIOVo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE8110E51A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 17:20:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4E26D601F3;
 Mon, 15 Sep 2025 17:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2725C4CEF1;
 Mon, 15 Sep 2025 17:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757956840;
 bh=IpDEJIKERU1JCTNIEi7Bdle/d8rWWRqcg2dcv69TTj8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kk/wIOVoJARgFTwbJ31RhqUlmthMISBT5ZrvLG3733qp63L6xV4JuDFUNRObL1T8I
 OluLwHjftnqeqvt/LyM90jqvcD9szTona6pBQ0L8/vwUy9+b4ROeqj2tiBdjwh3qqr
 goV072M3LdPHXlV43F8TQMpBr6addvBsJinTpi0a8IGGGyN33iufCItKg7jyzsM8QS
 HEFAIUr9nl/46ZCc7gmMsvpycJMcnhpYOJnrbVKs93ITomcpQRzz3DJBbI8bNjXhk0
 rRXEhpC5BpqKGcBmEHrMLghe7VjHciHqIsKNFtOUWimaPmm1VEu4lOQWLBjVJb0nOC
 KRYZx0LCiLDaw==
Date: Mon, 15 Sep 2025 12:20:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: minghsiu.tsai@mediatek.com, krzk+dt@kernel.org, kernel@collabora.com,
 linux-bluetooth@vger.kernel.org, louisalexis.eyraud@collabora.com,
 chunkuang.hu@kernel.org, pabeni@redhat.com,
 yunfei.dong@mediatek.com, houlong.wei@mediatek.com,
 airlied@gmail.com, angelogioacchino.delregno@collabora.com,
 linus.walleij@linaro.org, sean.wang@kernel.org,
 linux-mediatek@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, devicetree@vger.kernel.org,
 simona@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 edumazet@google.com, netdev@vger.kernel.org,
 support.opensource@diasemi.com, marcel@holtmann.org,
 broonie@kernel.org, lgirdwood@gmail.com, davem@davemloft.net,
 linux-sound@vger.kernel.org, amergnat@baylibre.com,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 dmitry.torokhov@gmail.com, p.zabel@pengutronix.de,
 andrew+netdev@lunn.ch, mchehab@kernel.org,
 linux-rockchip@lists.infradead.org, jeesw@melfas.com,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, mripard@kernel.org,
 linux-media@vger.kernel.org, flora.fu@mediatek.com, kuba@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, luiz.dentz@gmail.com,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 09/12] dt-bindings: regulator: Convert Dialog DA9211
 Regulators to DT schema
Message-ID: <175795683847.2967801.14952293094675548520.robh@kernel.org>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-10-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-10-ariel.dalessandro@collabora.com>
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


On Thu, 11 Sep 2025 12:09:58 -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Dialog Semiconductor DA9211
> Voltage Regulators family to a DT schema. Examples are simplified, as these
> are all equal.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../devicetree/bindings/regulator/da9211.txt  | 205 ------------------
>  .../bindings/regulator/dlg,da9211.yaml        | 104 +++++++++
>  2 files changed, 104 insertions(+), 205 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/da9211.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/dlg,da9211.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

