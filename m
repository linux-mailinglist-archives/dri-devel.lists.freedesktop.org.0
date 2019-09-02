Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C60A527D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 11:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E4A89AB6;
	Mon,  2 Sep 2019 09:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E799889AB6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 09:06:46 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y23so1047421lje.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 02:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ayhIrTq0dYD1crX4bCnYCwEQ3J9YxfxzkKpNwwOjRhU=;
 b=k4pY183rK8rCH7WcibyG+cAXFAUQDHOu4H3fIBZeeNr+scFAi4Eu5axuPvWF11pH6X
 oxfDRtTLShr1yXfZlgNy+lP7gXavOicIc/GO3eYLRjvGxAAn1B1ewAlwSUjP6wmZjts0
 sngClHG7G0sbkGJ98Y/dSKe0s4d4H8dHwEyCL5OKdp5YoMbHK1T+oTSewNseiiNt1uwq
 +D/0ovC+M4yrcGPYUZFVHQnEA7naR+Uav8hfU1xi1vqQnRnYO3ZTWx61oIH1HIBvd6vq
 POgwNX6f3bF3ll88l3iYJOoAWE1pq0X9Z1tqWAviUJSbZ/aVEab/lHVkblw3fK75hGSO
 bXcw==
X-Gm-Message-State: APjAAAVD9j4rgR0ewWHHacxQznAC6DJcpArdpcGE8UbUPF/uu1XkdbQ1
 CgcS7UIZkHGLuwWBSgNbNlntCg==
X-Google-Smtp-Source: APXvYqxinO7cywWMdvwtgixZqruPokLKVNsJL4WagBKMUJnVPQ/plMIqS+6vYQCJqv1xk5igpllCVQ==
X-Received: by 2002:a2e:42c9:: with SMTP id h70mr6166391ljf.88.1567415204890; 
 Mon, 02 Sep 2019 02:06:44 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id m3sm725034ljc.29.2019.09.02.02.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 02:06:43 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/panel: Add DT bindings for Sony ACX424AKP
Date: Mon,  2 Sep 2019 11:06:32 +0200
Message-Id: <20190902090633.24239-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ayhIrTq0dYD1crX4bCnYCwEQ3J9YxfxzkKpNwwOjRhU=;
 b=pvdgSVsXnsmLoeqY7Acklfd5TL4BuMOQzRiz9/n8bYqW+jPlVz5jH7EIr7BIzvsn8v
 JUazHV+FJyUTc0opXUX4sf98fM3ChTEKHZYALqUc1C2H/MQlFC55mIBgHCZ8K9ajBWDG
 yez4FnfzEldnSL3xTTNj1MYoUV4x7G7qSmzpZmfHT+aQq1lvqZ/itvyvaQ8NApStUn/l
 oZ5iSq4gf/HGsc4C9VMV/7jjjyBEGm0IKuigSdFkhVi5rqKU6GPo2O3RCydmzMQbi6Hd
 38zMhHDRH0M2RGp+X8wZKExfwGHHILxKtM+YzA39xp9MtGTC1W34QWhFThFDvGSWVD4J
 el0g==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgU29ueSBBQ1g0MjRBS1AgcGFu
ZWwuCkxldCdzIHVzZSBZQU1MLgoKQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnClNpZ25l
ZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0tCiAu
Li4vZGlzcGxheS9wYW5lbC9zb255LGFjeDQyNGFrcC55YW1sICAgICAgICAgfCA1MyArKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVs
L3NvbnksYWN4NDI0YWtwLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zb255LGFjeDQyNGFrcC55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc29ueSxhY3g0MjRha3AueWFt
bApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjI5ZjQxZmVlMWI2OQot
LS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3NvbnksYWN4NDI0YWtwLnlhbWwKQEAgLTAsMCArMSw1MyBAQAorIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAx
LjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVs
L3NvbnksYWN4NDI0YWtwLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IFNvbnkgQUNYNDI0QUtQIDQiIDQ4MHg4NjQg
QU1PTEVEIHBhbmVsCisKK21haW50YWluZXJzOgorICAtIExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4KKworYWxsT2Y6CisgIC0gJHJlZjogcGFuZWwtY29tbW9uLnlhbWwj
CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IHNvbnksYWN4NDI0YWtw
CisgIHJlZzogdHJ1ZQorICBwb3J0OiB0cnVlCisgIHJlc2V0LWdwaW9zOiB0cnVlCisgIHZkZGkt
c3VwcGx5OgorICAgICBkZXNjcmlwdGlvbjogcmVndWxhdG9yIHRoYXQgc3VwcGxpZXMgdGhlIHZk
ZGkgdm9sdGFnZQorICBkc2ktY29tbWFuZC1tb2RlOgorICAgICB0eXBlOiBib29sZWFuCisgICAg
IGRlc2NyaXB0aW9uOgorICAgICAgIElmIHRoaXMgaXMgc3BlY2lmaWVkLCB0aGUgcGFuZWwgd2ls
bCBiZSB1c2VkIGluIGNvbW1hbmQKKyAgICAgICBtb2RlIGluc3RlYWQgb2YgdmlkZW8gbW9kZS4K
KworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIHBvcnQKKyAgLSByZXNl
dC1ncGlvcworICAtIHBvd2VyLXN1cHBseQorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UK
KworZXhhbXBsZXM6CisgIC0gfAorICAgIHBhbmVsQDAgeworICAgICAgICBjb21wYXRpYmxlID0g
InNvbnksYWN4NDI0YWtwIjsKKyAgICAgICAgcmVnID0gPDA+OworICAgICAgICB2ZGRpLXN1cHBs
eSA9IDwmZm9vPjsKKyAgICAgICAgcmVzZXQtZ3Bpb3MgPSA8JmZvb19ncGlvIDAgR1BJT19BQ1RJ
VkVfTE9XPjsKKworICAgICAgICBwb3J0IHsKKyAgICAgICAgICAgIHBhbmVsX2luOiBlbmRwb2lu
dCB7CisgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZkc2lfb3V0PjsKKyAgICAg
ICAgICAgIH07CisgICAgICAgIH07CisgICAgfTsKKworLi4uClwgTm8gbmV3bGluZSBhdCBlbmQg
b2YgZmlsZQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
