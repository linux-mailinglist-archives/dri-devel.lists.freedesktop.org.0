Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA711115CBE
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80CC6E1B1;
	Sat,  7 Dec 2019 14:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9556E1A5
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:43 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id f15so6583756lfl.13
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VaBvhdhNtObbqsxPerTgXU57K3m4iUiAmX6XWjRdma8=;
 b=ZWYUKA8EKL75iwoakYhJKRbmiIKzHTyFSO57hdV3YYfcR5lf0vICrmSX1TVo7bUtvt
 +jNcdcGBkhd1spbsc332P0CTMMSufmCYXjto6dVxpso9GMwq0z5XJ2nrV4i+maGK+uBa
 wbuwI8xNcF3PqqjVkNjnZo/oE5ZwEsQn3v3VclvBEAy+Zr1EZDSNVawUmgPazPMowQZN
 4wy4LPc6JFpONisgVnN0Rj23qbUQZerxR/MMiIGkUvtTLGgbtkgF9NfzY0kgFsLjSB8l
 C23od7ZdVuF5URsffZEPTBfz5QKKegna/+UEJuth1Txtnd0nJYLLEv/v2GCd/ttxN7b2
 tyYg==
X-Gm-Message-State: APjAAAUN0EoDuIT2WLz6+XiTXTQnXkpf3rnkZrLVWDkYMtNYN8KbS1kA
 pXCALP4Woe9I03Xq8PTiI3MgeI3Qc+YqIQ==
X-Google-Smtp-Source: APXvYqwM0erZxo6LOlySak2aMfBaSTmHMVITDmR/sT0HyMLyvaaqCnJATLGaFQPO9c/qhW5jo19sYg==
X-Received: by 2002:a19:ac08:: with SMTP id g8mr11551704lfc.112.1575727480871; 
 Sat, 07 Dec 2019 06:04:40 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:40 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 17/25] drm/panel: rocktech-jh057n00900: use drm_panel
 backlight support
Date: Sat,  7 Dec 2019 15:03:45 +0100
Message-Id: <20191207140353.23967-18-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VaBvhdhNtObbqsxPerTgXU57K3m4iUiAmX6XWjRdma8=;
 b=cZTvjGkjrfyjv3XvlFQLZd1fBYvUwA2F7rgXxqR3m5nmg4z4VuWhpUyxwuWV5mLHFW
 EdupZomTGwmdPvT58sN7eRALuAXX1G0Nf92Bt0sdGN7fHTxOx7iUT0HS0GMmbu4ySvtw
 z1MUgMzIaR7Bwp2VeOeHbW+y77pfYovpN7W+UV2JENCEMJ1WGIHs4myc1V5VnsO2AiKE
 2tga/sY6fV6bOSKUJ3nKwOYkXHC1SOsy0XuCyXv/SWN3wThH9FXB/1CboBK4SmOHKKmO
 SPscZrSICFYQIb1PpbDJJ10R9p2xTo/OvSCjOU7YcPTtvqZD2jvRDV1/q6CSOmLuOh1R
 ldUg==
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
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
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
aXZlci4KV2hpbGUgdG91Y2hpbmcgdGhlIGluY2x1ZGUgZmlsZXMgc29ydCB0aGVtCmFuZCBkaXZp
ZGUgdGhlbSB1cCBpbiBibG9ja3MuCgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+ClJldmlld2VkLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3Jn
PgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPgpDYzogIkd1aWRvIEfDvG50aGVyIiA8YWd4QHNpZ3hjcHUub3JnPgpDYzogUHVy
aXNtIEtlcm5lbCBUZWFtIDxrZXJuZWxAcHVyaS5zbT4KQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGll
cnJ5LnJlZGluZ0BnbWFpbC5jb20+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+
Ci0tLQogLi4uL2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jICAgIHwgMjQg
KysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1y
b2NrdGVjaC1qaDA1N24wMDkwMC5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0
ZWNoLWpoMDU3bjAwOTAwLmMKaW5kZXggM2E0ZjFjMGZjZTg2Li4zOGZmNzQyYmMxMjAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5j
CkBAIC01LDIwICs1LDIyIEBACiAgKiBDb3B5cmlnaHQgKEMpIFB1cmlzbSBTUEMgMjAxOQogICov
CiAKLSNpbmNsdWRlIDxkcm0vZHJtX21pcGlfZHNpLmg+Ci0jaW5jbHVkZSA8ZHJtL2RybV9tb2Rl
cy5oPgotI2luY2x1ZGUgPGRybS9kcm1fcGFuZWwuaD4KLSNpbmNsdWRlIDxkcm0vZHJtX3ByaW50
Lmg+Ci0jaW5jbHVkZSA8bGludXgvYmFja2xpZ2h0Lmg+CiAjaW5jbHVkZSA8bGludXgvZGVidWdm
cy5oPgogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CiAjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25z
dW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L21lZGlhLWJ1cy1mb3JtYXQuaD4KKyNpbmNsdWRlIDxs
aW51eC9tb2RfZGV2aWNldGFibGUuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNs
dWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KKwogI2luY2x1ZGUgPHZpZGVvL2Rpc3Bs
YXlfdGltaW5nLmg+CiAjaW5jbHVkZSA8dmlkZW8vbWlwaV9kaXNwbGF5Lmg+CiAKKyNpbmNsdWRl
IDxkcm0vZHJtX21pcGlfZHNpLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9tb2Rlcy5oPgorI2luY2x1
ZGUgPGRybS9kcm1fcGFuZWwuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+CisKICNkZWZp
bmUgRFJWX05BTUUgInBhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwIgogCiAvKiBNYW51ZmFjdHVy
ZXIgc3BlY2lmaWMgQ29tbWFuZHMgc2VuZCB2aWEgRFNJICovCkBAIC00Nyw3ICs0OSw2IEBAIHN0
cnVjdCBqaDA1N24gewogCXN0cnVjdCBkZXZpY2UgKmRldjsKIAlzdHJ1Y3QgZHJtX3BhbmVsIHBh
bmVsOwogCXN0cnVjdCBncGlvX2Rlc2MgKnJlc2V0X2dwaW87Ci0Jc3RydWN0IGJhY2tsaWdodF9k
ZXZpY2UgKmJhY2tsaWdodDsKIAlzdHJ1Y3QgcmVndWxhdG9yICp2Y2M7CiAJc3RydWN0IHJlZ3Vs
YXRvciAqaW92Y2M7CiAJYm9vbCBwcmVwYXJlZDsKQEAgLTE1Miw3ICsxNTMsNyBAQCBzdGF0aWMg
aW50IGpoMDU3bl9lbmFibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiAJCXJldHVybiByZXQ7
CiAJfQogCi0JcmV0dXJuIGJhY2tsaWdodF9lbmFibGUoY3R4LT5iYWNrbGlnaHQpOworCXJldHVy
biAwOwogfQogCiBzdGF0aWMgaW50IGpoMDU3bl9kaXNhYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBh
bmVsKQpAQCAtMTYwLDcgKzE2MSw2IEBAIHN0YXRpYyBpbnQgamgwNTduX2Rpc2FibGUoc3RydWN0
IGRybV9wYW5lbCAqcGFuZWwpCiAJc3RydWN0IGpoMDU3biAqY3R4ID0gcGFuZWxfdG9famgwNTdu
KHBhbmVsKTsKIAlzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kgPSB0b19taXBpX2RzaV9kZXZp
Y2UoY3R4LT5kZXYpOwogCi0JYmFja2xpZ2h0X2Rpc2FibGUoY3R4LT5iYWNrbGlnaHQpOwogCXJl
dHVybiBtaXBpX2RzaV9kY3Nfc2V0X2Rpc3BsYXlfb2ZmKGRzaSk7CiB9CiAKQEAgLTMyMSwxMCAr
MzIxLDYgQEAgc3RhdGljIGludCBqaDA1N25fcHJvYmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAq
ZHNpKQogCWRzaS0+bW9kZV9mbGFncyA9IE1JUElfRFNJX01PREVfVklERU8gfAogCQlNSVBJX0RT
SV9NT0RFX1ZJREVPX0JVUlNUIHwgTUlQSV9EU0lfTU9ERV9WSURFT19TWU5DX1BVTFNFOwogCi0J
Y3R4LT5iYWNrbGlnaHQgPSBkZXZtX29mX2ZpbmRfYmFja2xpZ2h0KGRldik7Ci0JaWYgKElTX0VS
UihjdHgtPmJhY2tsaWdodCkpCi0JCXJldHVybiBQVFJfRVJSKGN0eC0+YmFja2xpZ2h0KTsKLQog
CWN0eC0+dmNjID0gZGV2bV9yZWd1bGF0b3JfZ2V0KGRldiwgInZjYyIpOwogCWlmIChJU19FUlIo
Y3R4LT52Y2MpKSB7CiAJCXJldCA9IFBUUl9FUlIoY3R4LT52Y2MpOwpAQCAtMzQ3LDYgKzM0Mywx
MCBAQCBzdGF0aWMgaW50IGpoMDU3bl9wcm9iZShzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kp
CiAJZHJtX3BhbmVsX2luaXQoJmN0eC0+cGFuZWwsIGRldiwgJmpoMDU3bl9kcm1fZnVuY3MsCiAJ
CSAgICAgICBEUk1fTU9ERV9DT05ORUNUT1JfRFNJKTsKIAorCXJldCA9IGRybV9wYW5lbF9vZl9i
YWNrbGlnaHQoJmN0eC0+cGFuZWwpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAlkcm1f
cGFuZWxfYWRkKCZjdHgtPnBhbmVsKTsKIAogCXJldCA9IG1pcGlfZHNpX2F0dGFjaChkc2kpOwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
