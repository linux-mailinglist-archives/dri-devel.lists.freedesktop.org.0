Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 740C7ED4FB
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2019 21:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CC16E0A1;
	Sun,  3 Nov 2019 20:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E536E0A1
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2019 20:57:14 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k15so3292695lja.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Nov 2019 12:57:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OWmTkgG+DdmOGUyUmLEDg8JGs6+s+lKtM+lwb24iwj8=;
 b=friDa8ImHX38nhzE1NoregCOVLXZIjydfwqxVjWjzIvIni535ps1po59azdMVfE8An
 KjmFm4nSlRh3j1b6xLyILA53nau7+oJJP16YEhHxP/5J1SdW/rp9KzBlYospNhOU+Eqn
 Sm1O4dl1Pkqph56MWwPayFUIRH+GlP99QAAUzm7EWN0DvlTe7T69azNB7RmcaL/XUc+Y
 ho2gUlnCT3y3WdWo++HOhyq1NpsiWz03ZIroe7d3yoeHsvNustDa3mW/d1AiHecdycxu
 gWr2A0b0Q49M+v4fgQ71nWZGGBWsXV5LvFt8hPCp37LvOrkAfHGRn/E+W86Kvkn7CD8+
 AYkQ==
X-Gm-Message-State: APjAAAUc98HsFiMHXXgQHo5ksEWef0lKYKoeD3g/s+tBsyABUB6fZmhp
 Z+FXKi9sjtLtw5odC16dy8RzEw==
X-Google-Smtp-Source: APXvYqyl+jVTdA9oYmr5lDEn5dTrROBCisuGIRKXHjUxr/01TErtFXyfrYuZm5A7G816KZBN8pHP6Q==
X-Received: by 2002:a2e:9119:: with SMTP id m25mr11530357ljg.24.1572814633241; 
 Sun, 03 Nov 2019 12:57:13 -0800 (PST)
Received: from localhost.localdomain
 (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
 by smtp.gmail.com with ESMTPSA id v203sm6936784lfa.25.2019.11.03.12.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Nov 2019 12:57:12 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 2/2 v5] drm/panel: Add DT bindings for Sony ACX424AKP
Date: Sun,  3 Nov 2019 21:54:59 +0100
Message-Id: <20191103205459.24965-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191103205459.24965-1-linus.walleij@linaro.org>
References: <20191103205459.24965-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OWmTkgG+DdmOGUyUmLEDg8JGs6+s+lKtM+lwb24iwj8=;
 b=B9CBujALEz6KEgHeAHPXYL3qf3J11FjOtj04mnLd2rylkQI9Zw20l+n4oiBXrpsnK3
 efnwnAfTGd2amCVTf8pzC+0s653jji0LnItxsEwUW7IWVQ9PHQyfHG7Bt9+Cb4/HY1tn
 y4adR0kkCbSM85NcvToR98+ZoPJq9QdbJy6qVwkooqJCXafvRV2Wt8u/XJHSNAnnb06k
 8gxhYDK8stBqxaZ01Yk4u/a4F/6JnS0t2jiGMunAeQPauQ/0cwINeIvwEd+Pr1Cz+S8K
 BW2t78NlNqxBMiuartgpO7mPu9JEkrDueT8Jq7X9SNN51Rdh9y0r2MtN0E7X5ThO+q8v
 /KMQ==
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
ZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0tCkNo
YW5nZUxvZyB2NC0+djU6Ci0gRml4IHVwIGFsbCB3YXJuaW5ncyBldGMgaW5jdXJyZWQgZnJvbSB0
aGUgbm93IHdvcmtpbmcgc2NoZW1hIGNoZWNrCiAgYW5kIERUUyBjb21waWxhdGlvbi4KLSBJIHN0
aWxsIGhhdmUgYSB2ZXJ0IGFubm95aW5nIGVycm9yIG1lc3NhZ2UgaW4gdGhlIFNvbnkKICBwYW5l
bCBiaW5kaW5ncyB0aGF0IHVzZXMgdGhpcyBzY2hlbWE6CiAgc29ueSxhY3g0MjRha3AuZXhhbXBs
ZS5kdC55YW1sOiBwYW5lbEAwOiAkbm9kZW5hbWU6MDogJ3BhbmVsQDAnIGRvZXMgbm90IG1hdGNo
ICdeZHNpLWNvbnRyb2xsZXIoQC4qKT8kJwogIEFzIHRoaXMgaXMgbW9kZWxlZCB2ZXJ5IGNsb3Nl
bHkgdG8KICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L21kaW8ueWFtbAog
IGFuZCB0aGF0IG9uZSBkb2Vzbid0IGVtaXQgdGhpcyB0eXBlIG9mIHdhcm5pbmcgZm9yIGl0cyBl
dGhlcm5ldC1waHlAMAogIGV0YyBJIGFtIHByZXR0eSBtdWNoIGNsdWVsZXNzIGFuZCBqdXN0IGNh
bid0IHNlZSB3aGF0IHRoZSBwcm9ibGVtCiAgaXMuCi0gSWYgSSBjYW4ndCBmaWd1cmUgdGhpcyBv
dXQgdGhlIG9ubHkgdmlhYmxlIG5leHQgc3RlcCBpcyB0byBkcm9wIHRoZQogIGFtYml0aW9uIHRv
IGNyZWF0ZSB5YW1sIGJpbmRpbmdzIHNpbXBseSBiZWNhdXNlIEknbSB1bmFibGUgdG8gZG8KICBp
dCwgYW5kIGdvIGJhY2sgdG8gdHJhZGl0aW9uYWwgdGV4dCBiaW5kaW5ncyA6KApDaGFuZ2VMb2cg
djMtPnY0OgotIEFkanVzdCB0byBhZGp1c3RlZCBEU0kgYmluZGluZ3MuCkNoYW5nZUxvZyB2Mi0+
djM6Ci0gUHV0IHRoZSBleGFtcGxlIGluc2lkZSBhIGRzaS1jb250cm9sbGVyIHNvIHdlIGhhdmUg
YSBjb21wbGV0ZQogIGV4YW1wbGUgdGhhdCB2ZXJpZmllcyB0byB0aGUgRFNJIHBhbmVsIGdlbmVy
aWMgYmluZGluZy4KQ2hhbmdlTG9nIHYxLT52MjoKLSBTdWdnZXN0IGEgc3RhbmQtYWxvbmUgWUFN
TCBiaW5kaW5ncyBmaWxlIGZvciBEU0kgcGFuZWxzIGluCiAgYSBzZXBhcmF0ZSBwYXRjaCwgYW5k
IHVzZSB0aGF0IHRvIHJlZmVyZW5jZSB0aGUKICBib29sZWFuICJlbmZvcmNlLXZpZGVvLW1vZGUi
IGF0dHJpYnV0ZSBmb3IgRFNJIHBhbmVscwotLS0KIC4uLi9kaXNwbGF5L3BhbmVsL3NvbnksYWN4
NDI0YWtwLnlhbWwgICAgICAgICB8IDUwICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA1MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc29ueSxhY3g0MjRha3AueWFtbAoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVs
L3NvbnksYWN4NDI0YWtwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9zb255LGFjeDQyNGFrcC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAwMC4uMWMxMjMxMzliODBhCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc29ueSxhY3g0MjRha3Au
eWFtbApAQCAtMCwwICsxLDUwIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwvc29ueSxhY3g0MjRha3AueWFtbCMKKyRz
Y2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0
aXRsZTogU29ueSBBQ1g0MjRBS1AgNCIgNDgweDg2NCBBTU9MRUQgcGFuZWwKKworbWFpbnRhaW5l
cnM6CisgIC0gTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgorCithbGxP
ZjoKKyAgLSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMKKyAgLSAkcmVmOiAuLi9kc2ktY29udHJv
bGxlci55YW1sIworCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiBzb255
LGFjeDQyNGFrcAorICByZWc6IHRydWUKKyAgcmVzZXQtZ3Bpb3M6IHRydWUKKyAgdmRkaS1zdXBw
bHk6CisgICAgIGRlc2NyaXB0aW9uOiByZWd1bGF0b3IgdGhhdCBzdXBwbGllcyB0aGUgdmRkaSB2
b2x0YWdlCisgIGVuZm9yY2UtdmlkZW8tbW9kZTogdHJ1ZQorCityZXF1aXJlZDoKKyAgLSBjb21w
YXRpYmxlCisgIC0gcmVnCisgIC0gcmVzZXQtZ3Bpb3MKKworYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bp
by9ncGlvLmg+CisKKyAgICBkc2ktY29udHJvbGxlckBhMDM1MTAwMCB7CisgICAgICAgIGNvbXBh
dGlibGUgPSAic3RlLG1jZGUtZHNpIjsKKyAgICAgICAgcmVnID0gPDB4YTAzNTEwMDAgMHgxMDAw
PjsKKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAgICNzaXplLWNlbGxzID0g
PDA+OworCisgICAgICAgIHBhbmVsQDAgeworICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzb255
LGFjeDQyNGFrcCI7CisgICAgICAgICAgICByZWcgPSA8MD47CisgICAgICAgICAgICB2ZGRpLXN1
cHBseSA9IDwmZm9vPjsKKyAgICAgICAgICAgIHJlc2V0LWdwaW9zID0gPCZmb29fZ3BpbyAwIEdQ
SU9fQUNUSVZFX0xPVz47CisgICAgICAgIH07CisgICAgfTsKKworLi4uCi0tIAoyLjIxLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
