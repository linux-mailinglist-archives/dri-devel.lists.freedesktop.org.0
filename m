Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6B210F024
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC44B6E2D5;
	Mon,  2 Dec 2019 19:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EA76E2CF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:20 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id l18so806552lfc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bDB+ry94KK7oIL0OpHG93ZpwaWVw2/vv2p+DvmVNoo8=;
 b=Zoko64DJaqf8afjDCxIXBDgSd/6Y164LOBuCRzBjB0DWRl5gh+s8A1cfwdml9ZK5uF
 l3LivvwSD05uSuixfOnZELEq646hQrOQmkmLF/eWUeOF/X1VgajVOwmsYqbbbvLyqbAe
 p5TLEqpu/pofKXhoVkdXbh8x6NTIvmomGCCQUkV1Re6rrhbQdqTXHi/9qMzKF9scSMaD
 vUi+qo/TIHdSnccnrT2H0dibRZYtKx5SDvGCk5LkWjSmiYyusdgm4nqQXISzPb6Yg0tm
 g/D6wulNMW4ZHSl5KdTTYe6e3WTnSdAffBZYhZN2oC7VVxmd6/pZ3vV5v94ub4Viz52d
 YxlA==
X-Gm-Message-State: APjAAAWnKlGVx60whOOtT3kvOQMH6AcL9mCgpK01JQVVRwWymG8mRAWr
 0U7UJXF6Qi3oI+JQt0+BepDVKF8gu1FmKQ==
X-Google-Smtp-Source: APXvYqzTYsasNQayRM2nLXydOk+hJmtyoXsoit7N2AFCfkwcqCook4x6ElJIboXFRkeIVoP8hTsVxw==
X-Received: by 2002:ac2:54b4:: with SMTP id w20mr427722lfk.67.1575315198474;
 Mon, 02 Dec 2019 11:33:18 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:17 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 07/26] drm/panel: remove get_timings
Date: Mon,  2 Dec 2019 20:32:11 +0100
Message-Id: <20191202193230.21310-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bDB+ry94KK7oIL0OpHG93ZpwaWVw2/vv2p+DvmVNoo8=;
 b=kYgunyP2i9Ayet6lMKznMH5w9Pw1O3NwrHR40KkICtQXJ3n05r24HPZlE8IzGRf5a0
 ZG4Tl1j433To0AdI3WsdBWEf3ixsvYYMLiMNuYRUGjVr1ZEoLW9kIXxObCZXvo0LBV3I
 uyYZwhH9eUe9ip5HifF3lUn6zJtOb5aRrpxrz+zHWhri4kqYBP+iEdsJ40go/mhOhemc
 ODCOjP6ah+7Ejf44pkVobctv8DtFUcklLHvQP8JicNshzMziVHkryicGKhTNG/O2wwwl
 ZRBNKeT34tVwDMKtPegTjSWzBNwEQbBzUvZ2JtPBuY5wTFhGtLRrXB0z7FtxsIZFhvkO
 4hDw==
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
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

VGhlcmUgd2FzIG5vIHVzZXJzIC0gc28gcmVtb3ZlIGl0LgpUaGUgY2FsbGJhY2sgd2FzIGltcGxl
bWVudGVkIGluIHR3byBkcml2ZXJzIC0gZGVsZXRlZC4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGlu
Z0BnbWFpbC5jb20+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBNYWFy
dGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4
aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zZWlrby00M3d2ZjFnLmMgfCAxOCAtLS0tLS0tLS0tLS0t
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyAgICAgICAgfCAxOCAt
LS0tLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvZHJtL2RybV9wYW5lbC5oICAgICAgICAgICAgICAg
ICAgICAgfCAgOSAtLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgNDUgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNlaWtvLTQzd3ZmMWcuYyBi
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zZWlrby00M3d2ZjFnLmMKaW5kZXggYjg3ODkz
MGIxN2U0Li4zYmNiYTY0MjM1YzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1zZWlrby00M3d2ZjFnLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNl
aWtvLTQzd3ZmMWcuYwpAQCAtMjE3LDMwICsyMTcsMTIgQEAgc3RhdGljIGludCBzZWlrb19wYW5l
bF9nZXRfbW9kZXMoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwsCiAJcmV0dXJuIHNlaWtvX3BhbmVs
X2dldF9maXhlZF9tb2RlcyhwLCBjb25uZWN0b3IpOwogfQogCi1zdGF0aWMgaW50IHNlaWtvX3Bh
bmVsX2dldF90aW1pbmdzKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsLAotCQkJCSAgICB1bnNpZ25l
ZCBpbnQgbnVtX3RpbWluZ3MsCi0JCQkJICAgIHN0cnVjdCBkaXNwbGF5X3RpbWluZyAqdGltaW5n
cykKLXsKLQlzdHJ1Y3Qgc2Vpa29fcGFuZWwgKnAgPSB0b19zZWlrb19wYW5lbChwYW5lbCk7Ci0J
dW5zaWduZWQgaW50IGk7Ci0KLQlpZiAocC0+ZGVzYy0+bnVtX3RpbWluZ3MgPCBudW1fdGltaW5n
cykKLQkJbnVtX3RpbWluZ3MgPSBwLT5kZXNjLT5udW1fdGltaW5nczsKLQotCWlmICh0aW1pbmdz
KQotCQlmb3IgKGkgPSAwOyBpIDwgbnVtX3RpbWluZ3M7IGkrKykKLQkJCXRpbWluZ3NbaV0gPSBw
LT5kZXNjLT50aW1pbmdzW2ldOwotCi0JcmV0dXJuIHAtPmRlc2MtPm51bV90aW1pbmdzOwotfQot
CiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wYW5lbF9mdW5jcyBzZWlrb19wYW5lbF9mdW5jcyA9
IHsKIAkuZGlzYWJsZSA9IHNlaWtvX3BhbmVsX2Rpc2FibGUsCiAJLnVucHJlcGFyZSA9IHNlaWtv
X3BhbmVsX3VucHJlcGFyZSwKIAkucHJlcGFyZSA9IHNlaWtvX3BhbmVsX3ByZXBhcmUsCiAJLmVu
YWJsZSA9IHNlaWtvX3BhbmVsX2VuYWJsZSwKIAkuZ2V0X21vZGVzID0gc2Vpa29fcGFuZWxfZ2V0
X21vZGVzLAotCS5nZXRfdGltaW5ncyA9IHNlaWtvX3BhbmVsX2dldF90aW1pbmdzLAogfTsKIAog
c3RhdGljIGludCBzZWlrb19wYW5lbF9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYsCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKaW5kZXggZDYyOTlmZTZkMjc2Li5lMjI1NzkxYTZmYjIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKQEAgLTMyNiwzMCArMzI2LDEyIEBA
IHN0YXRpYyBpbnQgcGFuZWxfc2ltcGxlX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX3BhbmVsICpwYW5l
bCwKIAlyZXR1cm4gbnVtOwogfQogCi1zdGF0aWMgaW50IHBhbmVsX3NpbXBsZV9nZXRfdGltaW5n
cyhzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCwKLQkJCQkgICAgdW5zaWduZWQgaW50IG51bV90aW1p
bmdzLAotCQkJCSAgICBzdHJ1Y3QgZGlzcGxheV90aW1pbmcgKnRpbWluZ3MpCi17Ci0Jc3RydWN0
IHBhbmVsX3NpbXBsZSAqcCA9IHRvX3BhbmVsX3NpbXBsZShwYW5lbCk7Ci0JdW5zaWduZWQgaW50
IGk7Ci0KLQlpZiAocC0+ZGVzYy0+bnVtX3RpbWluZ3MgPCBudW1fdGltaW5ncykKLQkJbnVtX3Rp
bWluZ3MgPSBwLT5kZXNjLT5udW1fdGltaW5nczsKLQotCWlmICh0aW1pbmdzKQotCQlmb3IgKGkg
PSAwOyBpIDwgbnVtX3RpbWluZ3M7IGkrKykKLQkJCXRpbWluZ3NbaV0gPSBwLT5kZXNjLT50aW1p
bmdzW2ldOwotCi0JcmV0dXJuIHAtPmRlc2MtPm51bV90aW1pbmdzOwotfQotCiBzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9wYW5lbF9mdW5jcyBwYW5lbF9zaW1wbGVfZnVuY3MgPSB7CiAJLmRpc2Fi
bGUgPSBwYW5lbF9zaW1wbGVfZGlzYWJsZSwKIAkudW5wcmVwYXJlID0gcGFuZWxfc2ltcGxlX3Vu
cHJlcGFyZSwKIAkucHJlcGFyZSA9IHBhbmVsX3NpbXBsZV9wcmVwYXJlLAogCS5lbmFibGUgPSBw
YW5lbF9zaW1wbGVfZW5hYmxlLAogCS5nZXRfbW9kZXMgPSBwYW5lbF9zaW1wbGVfZ2V0X21vZGVz
LAotCS5nZXRfdGltaW5ncyA9IHBhbmVsX3NpbXBsZV9nZXRfdGltaW5ncywKIH07CiAKICNkZWZp
bmUgUEFORUxfU0lNUExFX0JPVU5EU19DSEVDSyh0b19jaGVjaywgYm91bmRzLCBmaWVsZCkgXApk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmggYi9pbmNsdWRlL2RybS9kcm1fcGFu
ZWwuaAppbmRleCA0ZmQ2MWNiOWViOTMuLmM0ZTgyYjljZTU4NiAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9kcm0vZHJtX3BhbmVsLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgKQEAgLTEwMiwx
NSArMTAyLDYgQEAgc3RydWN0IGRybV9wYW5lbF9mdW5jcyB7CiAJICovCiAJaW50ICgqZ2V0X21v
ZGVzKShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCwKIAkJCSBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yKTsKLQotCS8qKgotCSAqIEBnZXRfdGltaW5nczoKLQkgKgotCSAqIENvcHkgZGlz
cGxheSB0aW1pbmdzIGludG8gdGhlIHByb3ZpZGVkIGFycmF5IGFuZCByZXR1cm4KLQkgKiB0aGUg
bnVtYmVyIG9mIGRpc3BsYXkgdGltaW5ncyBhdmFpbGFibGUuCi0JICovCi0JaW50ICgqZ2V0X3Rp
bWluZ3MpKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsLCB1bnNpZ25lZCBpbnQgbnVtX3RpbWluZ3Ms
Ci0JCQkgICBzdHJ1Y3QgZGlzcGxheV90aW1pbmcgKnRpbWluZ3MpOwogfTsKIAogLyoqCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
