Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FED8FC720
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 14:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A016E231;
	Thu, 14 Nov 2019 13:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2603C6E231
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 13:15:32 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id q5so5012431lfo.10
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 05:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9z7rkpJrlLoeMh05t6y+nlPabQrExaTPME734tIxvFk=;
 b=C7fNuRUPiGqHr5psgYVhJUSRha3xjvx3fs1l6Iv2SS16f/3tgf4Jv9eUIAEsSsLjkB
 5r5uQBexHT23gAD0cSAjPlyHGs/WeHMwAn3WgiN1FGUjAyMHpKkr2X5pR43rtfs6GVNJ
 ua+/omBzNWa8t4AMiFbnGXaOsyii8aqChvGcdIjbuQkU110NIvV1U8hCPFPbLrwCj2+4
 11xKwg4QQ9WMfO4IbJbj+oX/chaf7deQp9+8XjN4SmWs+3RnFX6l+gIIQe//MT5Y//0k
 rFptSnSS4JoBShg7AE7eLyquq8XzSGNPjhZosmGwMSJZmYuItAMhqFNA4IDxKKWAT12w
 DZ1A==
X-Gm-Message-State: APjAAAVXsmWQqeJWP0vJb7VvdsCrkjTTXOuI+WocRYrYF7tFHvBdrl3N
 hVqOTPpcwdFNWVLrE/1YV2Pmo1Q+tJQ=
X-Google-Smtp-Source: APXvYqyLvQwj/9KZhmJKicBOORuxSGsmg5QitV8pjk7lCdvZe6Eq79RBq4cmVB6dAzMCrExjfmFEYA==
X-Received: by 2002:ac2:498a:: with SMTP id f10mr6832516lfl.170.1573737330426; 
 Thu, 14 Nov 2019 05:15:30 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id r7sm2283515ljc.74.2019.11.14.05.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 05:15:28 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 1/2 v6] drm/panel: Add DT bindings for Sony ACX424AKP
Date: Thu, 14 Nov 2019 14:15:24 +0100
Message-Id: <20191114131525.3988-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9z7rkpJrlLoeMh05t6y+nlPabQrExaTPME734tIxvFk=;
 b=md/291ChpFviyMAUZIlcGt3q0RQpQVAPh1nV50LkwPIHao9OcbRJZ6W/TvXCoWfYA5
 2njAgUZZlrUYnZW9brNA+ODs3TAytW5uIjZA7/NZtLWdvgiFccEoyfXr2/Ntlo8D+WoR
 KzSlKVtwPNxYWB5fdxwpLRy3VdnnIfPExb/FqEXK8JcqonZJjq+eqM1Rie+dPqPuOzTz
 1gboA7mZlGXDBzGSoSYIdgg5oZzxEQQf4WXLSFJbSf6k5eHlvKVnMHtP73KIYWdSu6DC
 /kUJssZ2/Dp9tv6BpEQhJgWvYA2Own2Q+gBp7IIxJbqlsXQO4sKidSulAHOce0ZwykGP
 OSAQ==
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
YW5nZUxvZyB2NS0+djY6Ci0gRml4IHRoZSBiaW5kaW5nIGJ5IHNpbXBseSBub3QgcmVmZXJlbmNp
bmcgdGhlIGRpc3BsYXkgY29udHJvbGxlcgogIGJpbmRpbmdzIGZyb20gYSBwYW5lbCBiaW5kaW5n
LgpDaGFuZ2VMb2cgdjQtPnY1OgotIEZpeCB1cCBhbGwgd2FybmluZ3MgZXRjIGluY3VycmVkIGZy
b20gdGhlIG5vdyB3b3JraW5nIHNjaGVtYSBjaGVjawogIGFuZCBEVFMgY29tcGlsYXRpb24uCi0g
SSBzdGlsbCBoYXZlIGEgdmVydCBhbm5veWluZyBlcnJvciBtZXNzYWdlIGluIHRoZSBTb255CiAg
cGFuZWwgYmluZGluZ3MgdGhhdCB1c2VzIHRoaXMgc2NoZW1hOgogIHNvbnksYWN4NDI0YWtwLmV4
YW1wbGUuZHQueWFtbDogcGFuZWxAMDogJG5vZGVuYW1lOjA6ICdwYW5lbEAwJyBkb2VzIG5vdCBt
YXRjaCAnXmRzaS1jb250cm9sbGVyKEAuKik/JCcKICBBcyB0aGlzIGlzIG1vZGVsZWQgdmVyeSBj
bG9zZWx5IHRvCiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9tZGlvLnlh
bWwKICBhbmQgdGhhdCBvbmUgZG9lc24ndCBlbWl0IHRoaXMgdHlwZSBvZiB3YXJuaW5nIGZvciBp
dHMgZXRoZXJuZXQtcGh5QDAKICBldGMgSSBhbSBwcmV0dHkgbXVjaCBjbHVlbGVzcyBhbmQganVz
dCBjYW4ndCBzZWUgd2hhdCB0aGUgcHJvYmxlbQogIGlzLgotIElmIEkgY2FuJ3QgZmlndXJlIHRo
aXMgb3V0IHRoZSBvbmx5IHZpYWJsZSBuZXh0IHN0ZXAgaXMgdG8gZHJvcCB0aGUKICBhbWJpdGlv
biB0byBjcmVhdGUgeWFtbCBiaW5kaW5ncyBzaW1wbHkgYmVjYXVzZSBJJ20gdW5hYmxlIHRvIGRv
CiAgaXQsIGFuZCBnbyBiYWNrIHRvIHRyYWRpdGlvbmFsIHRleHQgYmluZGluZ3MgOigKQ2hhbmdl
TG9nIHYzLT52NDoKLSBBZGp1c3QgdG8gYWRqdXN0ZWQgRFNJIGJpbmRpbmdzLgpDaGFuZ2VMb2cg
djItPnYzOgotIFB1dCB0aGUgZXhhbXBsZSBpbnNpZGUgYSBkc2ktY29udHJvbGxlciBzbyB3ZSBo
YXZlIGEgY29tcGxldGUKICBleGFtcGxlIHRoYXQgdmVyaWZpZXMgdG8gdGhlIERTSSBwYW5lbCBn
ZW5lcmljIGJpbmRpbmcuCkNoYW5nZUxvZyB2MS0+djI6Ci0gU3VnZ2VzdCBhIHN0YW5kLWFsb25l
IFlBTUwgYmluZGluZ3MgZmlsZSBmb3IgRFNJIHBhbmVscyBpbgogIGEgc2VwYXJhdGUgcGF0Y2gs
IGFuZCB1c2UgdGhhdCB0byByZWZlcmVuY2UgdGhlCiAgYm9vbGVhbiAiZW5mb3JjZS12aWRlby1t
b2RlIiBhdHRyaWJ1dGUgZm9yIERTSSBwYW5lbHMKLS0tCiAuLi4vZGlzcGxheS9wYW5lbC9zb255
LGFjeDQyNGFrcC55YW1sICAgICAgICAgfCA0OSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NvbnksYWN4NDI0YWtwLnlhbWwK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9zb255LGFjeDQyNGFrcC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvc29ueSxhY3g0MjRha3AueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwMDAuLjE4NWRjYzhmZDFmOQotLS0gL2Rldi9udWxsCisrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NvbnksYWN4NDI0
YWtwLnlhbWwKQEAgLTAsMCArMSw0OSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL3NvbnksYWN4NDI0YWtwLnlhbWwj
Ciskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMK
KwordGl0bGU6IFNvbnkgQUNYNDI0QUtQIDQiIDQ4MHg4NjQgQU1PTEVEIHBhbmVsCisKK21haW50
YWluZXJzOgorICAtIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KKwor
YWxsT2Y6CisgIC0gJHJlZjogcGFuZWwtY29tbW9uLnlhbWwjCisKK3Byb3BlcnRpZXM6CisgIGNv
bXBhdGlibGU6CisgICAgY29uc3Q6IHNvbnksYWN4NDI0YWtwCisgIHJlZzogdHJ1ZQorICByZXNl
dC1ncGlvczogdHJ1ZQorICB2ZGRpLXN1cHBseToKKyAgICAgZGVzY3JpcHRpb246IHJlZ3VsYXRv
ciB0aGF0IHN1cHBsaWVzIHRoZSB2ZGRpIHZvbHRhZ2UKKyAgZW5mb3JjZS12aWRlby1tb2RlOiB0
cnVlCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSByZXNldC1ncGlv
cworCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAg
ICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KKworICAgIGRzaS1jb250cm9sbGVy
QGEwMzUxMDAwIHsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJzdGUsbWNkZS1kc2kiOworICAgICAg
ICByZWcgPSA8MHhhMDM1MTAwMCAweDEwMDA+OworICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwx
PjsKKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47CisKKyAgICAgICAgcGFuZWxAMCB7CisgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInNvbnksYWN4NDI0YWtwIjsKKyAgICAgICAgICAgIHJlZyA9
IDwwPjsKKyAgICAgICAgICAgIHZkZGktc3VwcGx5ID0gPCZmb28+OworICAgICAgICAgICAgcmVz
ZXQtZ3Bpb3MgPSA8JmZvb19ncGlvIDAgR1BJT19BQ1RJVkVfTE9XPjsKKyAgICAgICAgfTsKKyAg
ICB9OworCisuLi4KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
