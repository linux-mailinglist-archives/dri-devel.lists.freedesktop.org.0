Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC962D0C2B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D04D89DC1;
	Mon,  7 Dec 2020 08:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792F36E0B7
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 13:34:10 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id dk8so7928927edb.1
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 05:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XzfD+8x/gl2vij+zxF0vgPJlMvOnmt8qPR/mutEO1AU=;
 b=YdnQLiCBK/wBANdCyVFkDIuYa/Owf4imk6/kuZS+qLWOfNAnswRN6psvtJ+xR0sEmt
 ATVRfxNf+UUyiETI3QWMjzXJpGSoB5x0PF4tOzzbpLjuBtI3pBsExo8hF/wendpfC1Ls
 G50g+Gh6D1SAaAgkjYElwb5rF7b5wvXUkO9vFy/fzd/XkZgd+Zc/HqnAoH6PVb8m6saR
 QbtwHR4HI471Ws4jqKUEBawrQDuKmQrjASR3CWaScxinx7qj7hwrObD//yqNrmxiawgC
 rPBMHlrH8dTfgBoq1q84zAdYk8H9J0yq8MjmlJaPa/TvqPsIoqgkycNFhCNKwFNL/oGN
 4PxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XzfD+8x/gl2vij+zxF0vgPJlMvOnmt8qPR/mutEO1AU=;
 b=J+epWUJaj2UT3V8N8+s7FKVFN5COrUE9poEbPQXNmX/6BEXsI6TIZvPBYkDB7ykaf7
 AyhbJmYTicoMZVAJXsdcbxf8ICR45ignP2BWWhRDnezs1wfHsujRvUEHpjGUm2I5hKmj
 9YhAc8NG5gOzFUFN4noesKyfrtAye0JvQsktyDRraTy+nHKuX0Pi/SI9x2iawbWc5fod
 6zZUTnVo0qfY9xTKf6vncpBKl8TEPQGyWAtEcpSc2Vs1U5L7tvTab79fFl37HEr/78wo
 /c6UITcXokMPsEGSOliKob0KB6LyL/LXrHKQpjnmqUerSIVVv8N6p99CNu+7KGihghka
 1hJQ==
X-Gm-Message-State: AOAM532Cdst75CAuT74FjX7aI8ap0AhUkqDGXKKiZcs0AdwgXsFPN95u
 Pwf4f7fos93evSs1lYf1Rv8=
X-Google-Smtp-Source: ABdhPJyTcga5ryTaOcjxeErZN0uSNiSlX+EAdf/VgZlWQgBUllwgGITJy/IVUbE7EtRHuBbkau4EpQ==
X-Received: by 2002:aa7:d784:: with SMTP id s4mr15760934edq.215.1607261649141; 
 Sun, 06 Dec 2020 05:34:09 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id qh23sm7770129ejb.71.2020.12.06.05.34.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 06 Dec 2020 05:34:08 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v6 3/5] ARM: dts: rockchip: rk3066a: add #sound-dai-cells to
 hdmi node
Date: Sun,  6 Dec 2020 14:33:53 +0100
Message-Id: <20201206133355.16007-4-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201206133355.16007-1-jbx6244@gmail.com>
References: <20201206133355.16007-1-jbx6244@gmail.com>
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, broonie@kernel.org, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
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
