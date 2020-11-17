Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E489F2B77F0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E176E416;
	Wed, 18 Nov 2020 08:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9006E09C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 19:45:23 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id oq3so31095381ejb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 11:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XzfD+8x/gl2vij+zxF0vgPJlMvOnmt8qPR/mutEO1AU=;
 b=inLULAMdL/crFcKk/opBy24CIVw5O1FrAWbNTOXuWYPxS7W1sK/ue9rhC+EUcZvv8x
 5oK71otzs3JGFWd3SPpaJyZzCe+g2Af+lbI1sgA9iD90rw8hHV/K54bYfrCnNTLCHdpB
 uR7n38MCdhSdQIQyEdezQ6fVHTEyA15pMbbgwIJ/S55HlI49y0V/45KRI3roAtO84qu+
 4yiFI6gV9z4ZSTXBQNTQIyc4lj3nk32hDXocZyw9tUger/J7P14i6H3/zEJJdxtMARTg
 5aKaPeXDmT41dmOZAWuB37/c18WCDKfK8pdANfnvoFLNwg8X8+If65Uh6awTlUyFgDKF
 nXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XzfD+8x/gl2vij+zxF0vgPJlMvOnmt8qPR/mutEO1AU=;
 b=LmfblSo1u9xDemCk5LXEXQ466Ebls6dgeN2YGypt8EyiGIN/WiKT9ofCqx/Bkig7Fg
 U/icKJTEHw+U1/4N6GZBh112cVA9Ev6QswTGUOwzArWcYAoEPpIn8qD5oGMrBVbkCAWE
 XMq3WMDaaYCh6/hO0gvNDqhp0io1EKTnDyh76n6tn3DpSKWrORxNopGsOZDeXAo0O+qI
 yMPohpYyse5tRdfmoFp6tf4SSv4emswqO3mnM9nnyWhwJzkAd6keVj2P99Rj8qkIoawr
 HAIBEHyBKS3ovkv82awcWJy7HX/eM1Mv5g3L/tZRFtkWSM8n0FsNflh555xAAWFehdgJ
 Da4A==
X-Gm-Message-State: AOAM531blCfYzQh36LBK1ppDGjpRYwI3w8r+294BAx/OcTJ3W2sRgLfv
 zcPjLRr0F67fPFnMSncmagA=
X-Google-Smtp-Source: ABdhPJwr+w87CiPQMS+gZT4E2SCcWJAhpf3wLEmXdGSKKFZjrhCgeFmYqXwu6gLajtyK923OBX5Law==
X-Received: by 2002:a17:906:3a1a:: with SMTP id
 z26mr20294782eje.519.1605642322124; 
 Tue, 17 Nov 2020 11:45:22 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id w2sm727972ejc.109.2020.11.17.11.45.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:45:21 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v4 5/7] ARM: dts: rockchip: rk3066a: add #sound-dai-cells to
 hdmi node
Date: Tue, 17 Nov 2020 20:45:05 +0100
Message-Id: <20201117194507.14843-6-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201117194507.14843-1-jbx6244@gmail.com>
References: <20201117194507.14843-1-jbx6244@gmail.com>
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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
Cc: alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org, mturquette@baylibre.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 sboyd@kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'#sound-dai-cells' is required to properly interpret
the list of DAI specified in the 'sound-dai' property,
so add them to the 'hdmi' node for 'rk3066a.dtsi'.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3066a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index 252750c97..67fcb0dc9 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -124,6 +124,7 @@
 		pinctrl-0 = <&hdmii2c_xfer>, <&hdmi_hpd>;
 		power-domains = <&power RK3066_PD_VIO>;
 		rockchip,grf = <&grf>;
+		#sound-dai-cells = <0>;
 		status = "disabled";
 
 		ports {
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
