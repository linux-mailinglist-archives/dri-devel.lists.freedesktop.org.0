Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705D0115CCD
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BB76E1B9;
	Sat,  7 Dec 2019 14:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738A56E1B9
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:54 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z17so10643563ljk.13
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SbAZsoLI4xe9I1FggVPS6JxgD/wZYj776xJ1KOhYNIk=;
 b=NsqCxYtx66VQOX6tMsrOaCS9UlAGpJ/hMgCYW7HKxPkP2ooTFGmw7XxeBtzV9V4vgY
 1p5/5ffxg/cIR3jhjAi0B4sfygCqlAy/n7bt4jSp8cca8Goa1WfbwbK/sAmFJtZyjpJm
 W3ZXVuM3KjaDJ1nDRm2FJSEaG1JaFRbAPNoG9x27sJfYaID7PQmCn5l+GIvRGlUnnVHE
 v1PVC05z6jDYu8yRwKgEEXmw4OITfzi5oQCRgGOT/S/yZuNBskinInQv8MpZS0g+ShKQ
 hyl3b2SI0/thkFlF2jj42mE8fimq8C/UfcTuq5ZE0eGq01fbXjmR1LobG4lLQqk5+9ja
 V4Lg==
X-Gm-Message-State: APjAAAX7vYQruINXwE4XleLFB2dP+gQZXdRF0qaCTJxBva+2L4jhLw/Q
 lE0JngI0MTuUK3t5lHh2yOBXKGVGxEdI0w==
X-Google-Smtp-Source: APXvYqyueXqxzfVF1B9uqOsm+QnSO4hj8wBzhQU9+hnmAtFQMkiDT971EwDtMKEqiCRZcigJkrKh8A==
X-Received: by 2002:a2e:9e16:: with SMTP id e22mr4087572ljk.220.1575727492532; 
 Sat, 07 Dec 2019 06:04:52 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:52 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 24/25] drm/panel: tpo-td028ttec1: use drm_panel backlight
 support
Date: Sat,  7 Dec 2019 15:03:52 +0100
Message-Id: <20191207140353.23967-25-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SbAZsoLI4xe9I1FggVPS6JxgD/wZYj776xJ1KOhYNIk=;
 b=DCzX7740hQWDvyui4A8ga8DkYDCncQFz4GDyBUZdgaMJdfBOLfab/YXEKbqNxeNt15
 3tHZkpiTr/zuL6N3ZElvYBLM+CewDl04mfT5TD53GI0I0rsUs+yrDHc7ZwmEvlvVgLcn
 Sh1p51fhuIU9LaCeS7pZRZt/EGRmsq2zDF56PCT8PQX0dh0SOe7piwguDWq3xVxCh+1+
 YOynvNp9Vpl9YGZRC9ZB1L8Oc0/NBQNlmtAoxgBtKnG2Tg2IZcYjOkRp8hVxt0WChfIi
 9FaIqOlPVaofR8kankX4QZE3AbRYT2FdIbF6MztPJ6s25nfdKHjJFl1UwUOdY5WHme4Q
 2ixg==
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
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtdHBvLXRkMDI4dHRlYzEuYyB8IDE0ICsrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRkMDI4dHRlYzEuYyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC10cG8tdGQwMjh0dGVjMS5jCmluZGV4IDM3MjUyNTkwYjU0MS4uY2YyOTQwNWEy
ZGJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRkMDI4dHRl
YzEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRkMDI4dHRlYzEuYwpA
QCAtMTcsNyArMTcsNiBAQAogICogSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28u
Y29tPgogICovCiAKLSNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQuaD4KICNpbmNsdWRlIDxsaW51
eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L3Nw
aS9zcGkuaD4KQEAgLTgzLDcgKzgyLDYgQEAgc3RydWN0IHRkMDI4dHRlYzFfcGFuZWwgewogCXN0
cnVjdCBkcm1fcGFuZWwgcGFuZWw7CiAKIAlzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpOwotCXN0cnVj
dCBiYWNrbGlnaHRfZGV2aWNlICpiYWNrbGlnaHQ7CiB9OwogCiAjZGVmaW5lIHRvX3RkMDI4dHRl
YzFfZGV2aWNlKHApIGNvbnRhaW5lcl9vZihwLCBzdHJ1Y3QgdGQwMjh0dGVjMV9wYW5lbCwgcGFu
ZWwpCkBAIC0yNDMsOCArMjQxLDYgQEAgc3RhdGljIGludCB0ZDAyOHR0ZWMxX2VuYWJsZShzdHJ1
Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JYmFja2xp
Z2h0X2VuYWJsZShsY2QtPmJhY2tsaWdodCk7Ci0KIAlyZXR1cm4gMDsKIH0KIApAQCAtMjUyLDgg
KzI0OCw2IEBAIHN0YXRpYyBpbnQgdGQwMjh0dGVjMV9kaXNhYmxlKHN0cnVjdCBkcm1fcGFuZWwg
KnBhbmVsKQogewogCXN0cnVjdCB0ZDAyOHR0ZWMxX3BhbmVsICpsY2QgPSB0b190ZDAyOHR0ZWMx
X2RldmljZShwYW5lbCk7CiAKLQliYWNrbGlnaHRfZGlzYWJsZShsY2QtPmJhY2tsaWdodCk7Ci0K
IAlqYnRfcmV0X3dyaXRlXzAobGNkLCBKQlRfUkVHX0RJU1BMQVlfT0ZGLCBOVUxMKTsKIAogCXJl
dHVybiAwOwpAQCAtMzM0LDEwICszMjgsNiBAQCBzdGF0aWMgaW50IHRkMDI4dHRlYzFfcHJvYmUo
c3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKIAlzcGlfc2V0X2RydmRhdGEoc3BpLCBsY2QpOwogCWxj
ZC0+c3BpID0gc3BpOwogCi0JbGNkLT5iYWNrbGlnaHQgPSBkZXZtX29mX2ZpbmRfYmFja2xpZ2h0
KCZzcGktPmRldik7Ci0JaWYgKElTX0VSUihsY2QtPmJhY2tsaWdodCkpCi0JCXJldHVybiBQVFJf
RVJSKGxjZC0+YmFja2xpZ2h0KTsKLQogCXNwaS0+bW9kZSA9IFNQSV9NT0RFXzM7CiAJc3BpLT5i
aXRzX3Blcl93b3JkID0gOTsKIApAQCAtMzUwLDYgKzM0MCwxMCBAQCBzdGF0aWMgaW50IHRkMDI4
dHRlYzFfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKIAlkcm1fcGFuZWxfaW5pdCgmbGNk
LT5wYW5lbCwgJmxjZC0+c3BpLT5kZXYsICZ0ZDAyOHR0ZWMxX2Z1bmNzLAogCQkgICAgICAgRFJN
X01PREVfQ09OTkVDVE9SX0RQSSk7CiAKKwlyZXQgPSBkcm1fcGFuZWxfb2ZfYmFja2xpZ2h0KCZs
Y2QtPnBhbmVsKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCiAJcmV0dXJuIGRybV9wYW5l
bF9hZGQoJmxjZC0+cGFuZWwpOwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
