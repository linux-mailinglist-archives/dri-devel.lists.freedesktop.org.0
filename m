Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF89D70F2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 10:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2656E62E;
	Tue, 15 Oct 2019 08:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F336E62E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 08:28:18 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id u28so13774581lfc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 01:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3e4wGHkKDRH8I24Is4pDzwzrCPwhPGcWqf5noRqU7Cw=;
 b=A9y1AKI2lyf6yaIcJPL4dADF5LH2GYh9WKyxFpEx1fYpiIxjXPL4FArsmCv81e3c6H
 xcfpCFRKO/9slmSWeyf+YZBsvDWYCW5rc06hp4jheWpq3KCf7JlQupXjbJA/zm2Jb0mx
 X+py/ByDe+5s35CcmUfR5bLxDxZcrH6NRyR1PJY3ZwrIT9xsAEsDOdR/HdZ0/5Tj9itG
 WDuQgZIAybICIz7m6zQeDU+4+WD+4u9zMOSMEu1oy8tZXmjK0deb6M10UYNeVyydVZvM
 jOYkS6p+r8vU6SCcKScEuiieiINPlmHLLpYAscmczRoP3tAvqKS05L67ETuMg/sO7oOT
 dOnw==
X-Gm-Message-State: APjAAAVmGpt/N8gKB+QKp5XC+L1UddWyNERb85YRcnV6ovpfUHc3VcQK
 Aq5UXyF/Z86JiMcoihi65bHpWQ==
X-Google-Smtp-Source: APXvYqz5hcTLh23u/b+a5MlY7e21oRto6xRmRRmoe8ytkJURyTYHQIs0XNDnkGy7MFEGV9cxFnJUrw==
X-Received: by 2002:ac2:46d9:: with SMTP id p25mr7820952lfo.174.1571128096556; 
 Tue, 15 Oct 2019 01:28:16 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id y3sm4795141lji.53.2019.10.15.01.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 01:28:15 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3 v2] drm/panel: Add generic DSI panel YAML bindings
Date: Tue, 15 Oct 2019 10:28:09 +0200
Message-Id: <20191015082811.29497-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3e4wGHkKDRH8I24Is4pDzwzrCPwhPGcWqf5noRqU7Cw=;
 b=lGu2KQCBiaXwnAgxjn2XnQyZ29VvWDTfwyj851G8PR7/zGv+5q2Nb0meitSa/yPavC
 5UP9jjecA1XSqKtKpA4uv9RzVqYV00H+W/svuhcGSLkjA2KoZIfev2NzXdLV0+6THABP
 K3Qi1CaiQ1WRYVSDuehnYYX7/xrlpbcHrTYnfPUDkr2L9LPhKtL7oioCT0H8/+DtMYxn
 ydTJdH9gptFk+yY7Q+MTQIrtTU/d7chqngxsySdZl8lmbo2IRbT2PcFXcIMQYXpN3ejt
 LUcHDOYM827MBHAjZnBgesbQZiwZmGuOF0PXnbEnj407rGcZNErbM1lxMAdznFjXlmlq
 0upw==
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

VGhpcyBhZGRzIGEgc3RhcnRpbmcgcG9pbnQgZm9yIHByb2Nlc3NpbmcgYW5kIGRlZmluaW5nIGdl
bmVyaWMKYmluZGluZ3MgdXNlZCBieSBEU0kgcGFuZWxzLiBXZSBqdXN0IGRlZmluZSBvbmUgc2lu
Z2xlIGJvb2wKcHJvcGVydHkgdG8gZm9yY2UgdGhlIHBhbmVsIGludG8gdmlkZW8gbW9kZSBmb3Ig
bm93LgoKQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnClN1Z2dlc3RlZC1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGlu
dXMud2FsbGVpakBsaW5hcm8ub3JnPgotLS0KQ2hhbmdlTG9nIHYxLT52MjoKLSBOZXcgcGF0Y2gg
YWZ0ZXIgZmVlZGJhY2suCi0tLQogLi4uL2Rpc3BsYXkvcGFuZWwvcGFuZWwtZHNpLWNvbW1vbi55
YW1sICAgICAgIHwgMzEgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMxIGlu
c2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1kc2ktY29tbW9uLnlhbWwKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1k
c2ktY29tbW9uLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9wYW5lbC1kc2ktY29tbW9uLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMDAwLi40MjQyZGMyNWM5MTcKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1kc2ktY29tbW9uLnlh
bWwKQEAgLTAsMCArMSwzMSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAor
JVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxh
eS9wYW5lbC9wYW5lbC1kc2ktY29tbW9uLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IENvbW1vbiBQcm9wZXJ0aWVz
IGZvciBEU0kgRGlzcGxheSBQYW5lbHMKKworbWFpbnRhaW5lcnM6CisgIC0gTGludXMgV2FsbGVp
aiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgorCitkZXNjcmlwdGlvbjogfAorICBUaGlzIGRv
Y3VtZW50IGRlZmluZXMgZGV2aWNlIHRyZWUgcHJvcGVydGllcyBjb21tb24gdG8gRFNJLCBEaXNw
bGF5CisgIFNlcmlhbCBJbnRlcmZhY2UgcGFuZWxzLiBJdCBkb2Vzbid0IGNvbnN0aXR1ZSBhIGRl
dmljZSB0cmVlIGJpbmRpbmcKKyAgc3BlY2lmaWNhdGlvbiBieSBpdHNlbGYgYnV0IGlzIG1lYW50
IHRvIGJlIHJlZmVyZW5jZWQgYnkgZGV2aWNlIHRyZWUKKyAgYmluZGluZ3MuCisKKyAgV2hlbiBy
ZWZlcmVuY2VkIGZyb20gcGFuZWwgZGV2aWNlIHRyZWUgYmluZGluZ3MgdGhlIHByb3BlcnRpZXMg
ZGVmaW5lZCBpbgorICB0aGlzIGRvY3VtZW50IGFyZSBkZWZpbmVkIGFzIGZvbGxvd3MuIFRoZSBw
YW5lbCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBhcmUKKyAgcmVzcG9uc2libGUgZm9yIGRlZmluaW5n
IHdoZXRoZXIgZWFjaCBwcm9wZXJ0eSBpcyByZXF1aXJlZCBvciBvcHRpb25hbC4KKworcHJvcGVy
dGllczoKKworICBlbmZvcmNlLXZpZGVvLW1vZGU6CisgICAgdHlwZTogYm9vbGVhbgorICAgIGRl
c2NyaXB0aW9uOgorICAgICAgVGhlIGJlc3Qgb3B0aW9uIGlzIHVzdWFsbHkgdG8gcnVuIGEgcGFu
ZWwgaW4gY29tbWFuZCBtb2RlLCBhcyB0aGlzCisgICAgICBnaXZlcyBiZXR0ZXIgY29udHJvbCBv
dmVyIHRoZSBwYW5lbCBoYXJkd2FyZS4gSG93ZXZlciBmb3IgZGlmZmVyZW50CisgICAgICByZWFz
b25zIGxpa2UgYnJva2VuIGhhcmR3YXJlLCBtaXNzaW5nIGZlYXR1cmVzIG9yIHRlc3RpbmcsIGl0
IG1heSBiZQorICAgICAgdXNlZnVsIHRvIGJlIGFibGUgdG8gZm9yY2UgYSBjb21tYW5kIG1vZGUt
Y2FwYWJsZSBwYW5lbCBpbnRvIHZpZGVvCisgICAgICBtb2RlLgotLSAKMi4yMS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
