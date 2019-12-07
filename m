Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FFA115CC2
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD2E6E1B6;
	Sat,  7 Dec 2019 14:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F226E1AA
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:47 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id m30so7395826lfp.8
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9uKgoBqJhtrf0FWUc5M51wYfkZmsISTzPDRkC9yTue0=;
 b=U1AYR+EAmAwThQUQZ0Np5M53pwPQxutnCtHCPCS5QsoQeexms1NZsFAR81eOcVyq2b
 FD+SiDYNI7ayvwtYcRxcdqFzDXUduva8wbk6pcNmtDwnIh89rnWhzaOj3oQOCIctk2S6
 i6LUzzJxjs0fdZ2RErugcLGdRQ6oWdInSBnd++CiU/mFnSLb6EBhXlprUDzJMCqNOVB/
 3f6hhIV1v5rMQuC3/CkgFbXyPm4Oi9BALLGEUgB1BI1gi2a9P7Fz3/0g96qVLTBVaTre
 1HJkkvQj9uHk9kGly1sZpWB7Kr5f6C/ztq1TjrqLett1gDhNJJCPO34Lf8gjpvQpd1Mx
 4AeA==
X-Gm-Message-State: APjAAAUy1tlwyskeXrnXftriZDStYvMTcCpulMo2DiAuALS8ek0P/3DA
 7vTHowibTKHNzbBgbW49IBAQzGpVCSQGkw==
X-Google-Smtp-Source: APXvYqy4lENi/Wt/Q68tswRQRbAi0Mnhg0y9s5hIE9FYqSGHRzwnKB+/7xYLTqeFrZoDIkk+/ng3RQ==
X-Received: by 2002:a19:5e16:: with SMTP id s22mr564453lfb.33.1575727486014;
 Sat, 07 Dec 2019 06:04:46 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:45 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 20/25] drm/panel: sharp-lq101r1sx01: use drm_panel
 backlight support
Date: Sat,  7 Dec 2019 15:03:48 +0100
Message-Id: <20191207140353.23967-21-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9uKgoBqJhtrf0FWUc5M51wYfkZmsISTzPDRkC9yTue0=;
 b=BKMslgi7xVleeGecLAw058JIH7yjiJbxL7EUfvDrF7ShlQN3W64dYFsUxPMbZpu2Ua
 rudFkHBfL5wF5rQEL7uQFqEe4tkPUXOk0hOb4gbS0ZD8vtRdMQjsAaUZjU7kJXDwY3WX
 ED7LxMWBBNGf/5bVvUoxDIHKlkBnwGEv27+DfXooZfRNTvADOTMlGhdJjDM4uXxdz+Yz
 mt5GhO3kOfbw55PgQhojY5FYla6MXgjFxa2yOsYgAaB95oQ6zJjkyMPUIHxhvBgOasFY
 MYkm5M2fQ7ZSbYE6H697I/iMLKnnD905ch98WaA6uG1g+S4RDVzHtatnvdhXpB3gGLQy
 EL8g==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBiYWNrbGlnaHQgc3VwcG9ydCBpbiBkcm1fcGFuZWwgdG8gc2ltcGxpZnkgdGhlIGRy
aXZlcgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZp
ZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiAuLi4vZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaGFycC1scTEwMXIxc3gwMS5jICAgfCAyMSArKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2hhcnAtbHExMDFyMXN4MDEuYyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1zaGFycC1scTEwMXIxc3gwMS5jCmluZGV4IDE3ZDQwNmY0OWMz
ZC4uYjVkMTk3NzIyMWE3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
c2hhcnAtbHExMDFyMXN4MDEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2hh
cnAtbHExMDFyMXN4MDEuYwpAQCAtMyw3ICszLDYgQEAKICAqIENvcHlyaWdodCAoQykgMjAxNCBO
VklESUEgQ29ycG9yYXRpb24KICAqLwogCi0jaW5jbHVkZSA8bGludXgvYmFja2xpZ2h0Lmg+CiAj
aW5jbHVkZSA8bGludXgvZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+
CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CkBAIC0yMyw3ICsyMiw2IEBAIHN0cnVjdCBzaGFy
cF9wYW5lbCB7CiAJc3RydWN0IG1pcGlfZHNpX2RldmljZSAqbGluazE7CiAJc3RydWN0IG1pcGlf
ZHNpX2RldmljZSAqbGluazI7CiAKLQlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmFja2xpZ2h0
OwogCXN0cnVjdCByZWd1bGF0b3IgKnN1cHBseTsKIAogCWJvb2wgcHJlcGFyZWQ7CkBAIC05NCw4
ICs5Miw2IEBAIHN0YXRpYyBpbnQgc2hhcnBfcGFuZWxfZGlzYWJsZShzdHJ1Y3QgZHJtX3BhbmVs
ICpwYW5lbCkKIAlpZiAoIXNoYXJwLT5lbmFibGVkKQogCQlyZXR1cm4gMDsKIAotCWJhY2tsaWdo
dF9kaXNhYmxlKHNoYXJwLT5iYWNrbGlnaHQpOwotCiAJc2hhcnAtPmVuYWJsZWQgPSBmYWxzZTsK
IAogCXJldHVybiAwOwpAQCAtMjU4LDggKzI1NCw2IEBAIHN0YXRpYyBpbnQgc2hhcnBfcGFuZWxf
ZW5hYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCWlmIChzaGFycC0+ZW5hYmxlZCkKIAkJ
cmV0dXJuIDA7CiAKLQliYWNrbGlnaHRfZW5hYmxlKHNoYXJwLT5iYWNrbGlnaHQpOwotCiAJc2hh
cnAtPmVuYWJsZWQgPSB0cnVlOwogCiAJcmV0dXJuIDA7CkBAIC0zMTcsNyArMzExLDcgQEAgTU9E
VUxFX0RFVklDRV9UQUJMRShvZiwgc2hhcnBfb2ZfbWF0Y2gpOwogCiBzdGF0aWMgaW50IHNoYXJw
X3BhbmVsX2FkZChzdHJ1Y3Qgc2hhcnBfcGFuZWwgKnNoYXJwKQogewotCXN0cnVjdCBkZXZpY2Ug
KmRldiA9ICZzaGFycC0+bGluazEtPmRldjsKKwlpbnQgcmV0OwogCiAJc2hhcnAtPm1vZGUgPSAm
ZGVmYXVsdF9tb2RlOwogCkBAIC0zMjUsMTQgKzMxOSwxMyBAQCBzdGF0aWMgaW50IHNoYXJwX3Bh
bmVsX2FkZChzdHJ1Y3Qgc2hhcnBfcGFuZWwgKnNoYXJwKQogCWlmIChJU19FUlIoc2hhcnAtPnN1
cHBseSkpCiAJCXJldHVybiBQVFJfRVJSKHNoYXJwLT5zdXBwbHkpOwogCi0Jc2hhcnAtPmJhY2ts
aWdodCA9IGRldm1fb2ZfZmluZF9iYWNrbGlnaHQoZGV2KTsKLQotCWlmIChJU19FUlIoc2hhcnAt
PmJhY2tsaWdodCkpCi0JCXJldHVybiBQVFJfRVJSKHNoYXJwLT5iYWNrbGlnaHQpOwotCiAJZHJt
X3BhbmVsX2luaXQoJnNoYXJwLT5iYXNlLCAmc2hhcnAtPmxpbmsxLT5kZXYsICZzaGFycF9wYW5l
bF9mdW5jcywKIAkJICAgICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9EU0kpOwogCisJcmV0ID0gZHJt
X3BhbmVsX29mX2JhY2tsaWdodCgmc2hhcnAtPmJhc2UpOworCWlmIChyZXQpCisJCXJldHVybiBy
ZXQ7CisKIAlyZXR1cm4gZHJtX3BhbmVsX2FkZCgmc2hhcnAtPmJhc2UpOwogfQogCkBAIC00MDgs
NyArNDAxLDcgQEAgc3RhdGljIGludCBzaGFycF9wYW5lbF9yZW1vdmUoc3RydWN0IG1pcGlfZHNp
X2RldmljZSAqZHNpKQogCQlyZXR1cm4gMDsKIAl9CiAKLQllcnIgPSBzaGFycF9wYW5lbF9kaXNh
YmxlKCZzaGFycC0+YmFzZSk7CisJZXJyID0gZHJtX3BhbmVsX2Rpc2FibGUoJnNoYXJwLT5iYXNl
KTsKIAlpZiAoZXJyIDwgMCkKIAkJZGV2X2VycigmZHNpLT5kZXYsICJmYWlsZWQgdG8gZGlzYWJs
ZSBwYW5lbDogJWRcbiIsIGVycik7CiAKQEAgLTQyOSw3ICs0MjIsNyBAQCBzdGF0aWMgdm9pZCBz
aGFycF9wYW5lbF9zaHV0ZG93bihzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kpCiAJaWYgKCFz
aGFycCkKIAkJcmV0dXJuOwogCi0Jc2hhcnBfcGFuZWxfZGlzYWJsZSgmc2hhcnAtPmJhc2UpOwor
CWRybV9wYW5lbF9kaXNhYmxlKCZzaGFycC0+YmFzZSk7CiB9CiAKIHN0YXRpYyBzdHJ1Y3QgbWlw
aV9kc2lfZHJpdmVyIHNoYXJwX3BhbmVsX2RyaXZlciA9IHsKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
