Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEA26510CD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C89A10E2DA;
	Mon, 19 Dec 2022 16:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E03410E2DB
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 16:57:14 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id m21so3285488edc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 08:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kIy5s7RC8AaxDeyaGvZlKmpgc7tJJq7KaYed9ZtIYzo=;
 b=iKglceLNmpm1irnAm5RRAj07Ddb4fMJSondsKNS6Q31RnxA8mjeoWTv6oPmtfqvrXc
 j+ERWlUSshlqypOamf447O77jGgCATSNtECUyqesnW9GNPJEhaQwX3I+3T6c581L1gmR
 rQBBEnGzFmnuS1L7pSOYV8iyuZaOTDG9znMOmEeUkXUT9Xo6UngJSlH4dks4no9bhcNb
 onO+u+VuKPpvBkj/RgVPmB4HjhkufowWX0duOABfKzf7V1GN4asTERAcgrgJstNB8tGa
 YefUQtkW8GN5c4BH0cmiji2JGw4XI4LfieNbIc/GE6E7UJgQ2FNH1XjoF3Sm2AljlgwW
 oMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kIy5s7RC8AaxDeyaGvZlKmpgc7tJJq7KaYed9ZtIYzo=;
 b=yg+gh6VfuCx/G4t1ZUaOzTJUuyXjfT3iSzj0XrGEexgwZlXdLQJVfZq03HfowjbNLS
 QnZwIdapdSTUJWfwuEtWAwvuLeyGcoINXj5Fl1zGoqD5XEVDBxD7tqVv01CLQDqw+hXJ
 SzMA7th+8JhYNWZrl5cG5FieB+Ftfy2iiNtvapngb4OJNaK86sIdUlJU7MczmwAoeTZM
 4S0AHF1tFsMlzDAVevcQf9pYaO8w84JiTEWMAqz8pz3FJ3QsZM9vOTMR7nJC9aMi3qxy
 GhX4LW2qHa9JZl4nLBhgL+uNwKnOsmblxEfD8So8j7HoJnES3H57izeuv/TalTYXfZxb
 AAYQ==
X-Gm-Message-State: ANoB5plKG/D3QL3BQ0h3kj1nkZD/g78mkapX2hUxq8JcOjTnwuaQaCDv
 Kc0CQIp1fTyen2OZWKSFEPQ=
X-Google-Smtp-Source: AA0mqf61S7E1RbeVtjJAtBhuPuDmJprWomDuF86gXwRAGuXm7fqejx+R0qp9CgFeOJLF3abeDp9+qA==
X-Received: by 2002:a05:6402:5511:b0:45c:835c:c6d3 with SMTP id
 fi17-20020a056402551100b0045c835cc6d3mr31251129edb.4.1671469032996; 
 Mon, 19 Dec 2022 08:57:12 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 l20-20020aa7d954000000b0045ce419ecffsm4619030eds.58.2022.12.19.08.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 08:57:12 -0800 (PST)
Message-ID: <460f4012-7a99-ae6a-ccdf-459773944998@gmail.com>
Date: Mon, 19 Dec 2022 17:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v4 4/5] ARM: dts: rockchip: rk3288: add lvds_out node
To: heiko@sntech.de
References: <7f38e245-4fc0-1754-e75c-10c1e31bbd4d@gmail.com>
Content-Language: en-US
In-Reply-To: <7f38e245-4fc0-1754-e75c-10c1e31bbd4d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: kishon@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, vkoul@kernel.org, robh+dt@kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the conversion of rockchip,lvds.yaml a port@1 node
is required, so add a node with label lvds_out.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3288.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 487b0e03d..60207136f 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -1170,6 +1170,10 @@
 					remote-endpoint = <&vopl_out_lvds>;
 				};
 			};
+
+			lvds_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};

--
2.20.1

