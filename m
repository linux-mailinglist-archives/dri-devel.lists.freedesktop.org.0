Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CB22F4DA1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459176EA70;
	Wed, 13 Jan 2021 14:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565B76EA64
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id 190so1852193wmz.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RvwJoM6XPaTXW+swhyuXIxTf/L820o0O05r3Nn2BahU=;
 b=nid9QSSJw0nnYpdBxWNfeDxySbsTdIoMqZnUcmEnH52+LjrzqEPdVxtuCSQU+wNDQp
 62FqX/weiPQySDiuQC9amofCPbG5004lDcrdnsnbkZYpzAuZJWvH09KtuoWBDRa2aWSO
 AocjLmQI+CLfzX2ZsW6YPb2EJJtPlz/GlBtg1LtWbQlVwwHB11QS8Mte86K91VCLTbrK
 fFJLvGRnloBApapS2VcH6Q1I7KdGDGhrjWmsEMB+WKoFpwYMTT3bIWKLWXdKJxr7Xn8w
 cAkIudEJcSr3GiCxwMMFUlqXuSrqw8ck0D0hkmDyZxfdnSB9sa3sIlBp8zjyERLJw0nR
 orsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RvwJoM6XPaTXW+swhyuXIxTf/L820o0O05r3Nn2BahU=;
 b=H107GFbTdJwsAKJ7lw/+pyrXGaqATBF5F/gThTtiwRJZDMrIGaJoGoN83R9QIWfVF1
 6tSJF91QEgBx4tmsa9g8bFO4Bpbcn0ov5masRYVKxzLMNY7PVv2e3u1x5sP5+WmFj2Y6
 f5xfUnqAwtC1Bvrqba2sS+7pS+o/yIELnlq+6HsHlZkx8rciQRiQmEXkDmhcDN12ZP0Q
 nh+tIgv00IKYfT229l+/VNK//Ig2wft8xb1dc9L9a4y3k49j9zY7H6cxeWlJbRIF3U5a
 8Ts1dv0djbDgyzeVaIcjlACTSdlwcN7zu6MAFbT+lvtwUJKrM0XE97d8Lyv9HgbiSvaP
 9kbg==
X-Gm-Message-State: AOAM532fs4RZycLe1ASlQKCmHGUmNDfGGVO1iIERie6+QMuXpf0DzWgo
 pCf6VuBbfgIb//9/6raXfQXxDQ==
X-Google-Smtp-Source: ABdhPJxfLq1AkB7CSlngKBkLh9QrvLjSYsWJajt2KPoiRKEuRYNd2u3c5lDCPhIKbXF1gj4rQNYUUA==
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr2464833wml.160.1610549452072; 
 Wed, 13 Jan 2021 06:50:52 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:51 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 27/31] video: fbdev: sis: init: Remove unused variables
 'cr_data2', 'VT' and 'HT'
Date: Wed, 13 Jan 2021 14:50:05 +0000
Message-Id: <20210113145009.1272040-28-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, Thomas Winischhofer <thomas@winischhofer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy92aWRlby9mYmRldi9zaXMvaW5pdC5jOiBJbiBmdW5jdGlvbiDigJhTaVNfR2VuZXJpY19Db252
ZXJ0Q1JEYXRh4oCZOgogZHJpdmVycy92aWRlby9mYmRldi9zaXMvaW5pdC5jOjM1NDM6Mzc6IHdh
cm5pbmc6IHZhcmlhYmxlIOKAmGNyX2RhdGEy4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGVdCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3Npcy9pbml0LmM6MzU0Mjoz
OTogd2FybmluZzogdmFyaWFibGUg4oCYVlTigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQt
YnV0LXNldC12YXJpYWJsZV0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvc2lzL2luaXQuYzozNTQxOjM5
OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhIVOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQoKQ2M6IFRob21hcyBXaW5pc2NoaG9mZXIgPHRob21hc0B3aW5pc2No
aG9mZXIubmV0PgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgt
ZmJkZXZAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVz
QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9zaXMvaW5pdC5jIHwgMTcgKysr
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDE0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2lzL2luaXQuYyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvc2lzL2luaXQuYwppbmRleCA0NTEwMjcyYWQyOTdhLi5iNzdlYTFh
ODgyNWE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Npcy9pbml0LmMKKysrIGIv
ZHJpdmVycy92aWRlby9mYmRldi9zaXMvaW5pdC5jCkBAIC0zNTM4LDE2ICszNTM4LDEzIEBAIFNp
U19HZW5lcmljX0NvbnZlcnRDUkRhdGEoc3RydWN0IFNpU19Qcml2YXRlICpTaVNfUHIsIHVuc2ln
bmVkIGNoYXIgKmNyZGF0YSwKIAkJCXN0cnVjdCBmYl92YXJfc2NyZWVuaW5mbyAqdmFyLCBib29s
IHdyaXRlcmVzCiApCiB7Ci0gICB1bnNpZ25lZCBzaG9ydCBIUkUsIEhCRSwgSFJTLCBIREUsIEhU
OwotICAgdW5zaWduZWQgc2hvcnQgVlJFLCBWQkUsIFZSUywgVkRFLCBWVDsKLSAgIHVuc2lnbmVk
IGNoYXIgIHNyX2RhdGEsIGNyX2RhdGEsIGNyX2RhdGEyOworICAgdW5zaWduZWQgc2hvcnQgSFJF
LCBIQkUsIEhSUywgSERFOworICAgdW5zaWduZWQgc2hvcnQgVlJFLCBWQkUsIFZSUywgVkRFOwor
ICAgdW5zaWduZWQgY2hhciAgc3JfZGF0YSwgY3JfZGF0YTsKICAgIGludCAgICAgICAgICAgIEIs
IEMsIEQsIEUsIEYsIHRlbXA7CiAKICAgIHNyX2RhdGEgPSBjcmRhdGFbMTRdOwogCi0gICAvKiBI
b3Jpem9udGFsIHRvdGFsICovCi0gICBIVCA9ICBjcmRhdGFbMF0gfCAoKHVuc2lnbmVkIHNob3J0
KShzcl9kYXRhICYgMHgwMykgPDwgOCk7Ci0KICAgIC8qIEhvcml6b250YWwgZGlzcGxheSBlbmFi
bGUgZW5kICovCiAgICBIREUgPSBjcmRhdGFbMV0gfCAoKHVuc2lnbmVkIHNob3J0KShzcl9kYXRh
ICYgMHgwQykgPDwgNik7CiAgICBFID0gSERFICsgMTsKQEAgLTM1ODQsMTIgKzM1ODEsNiBAQCBT
aVNfR2VuZXJpY19Db252ZXJ0Q1JEYXRhKHN0cnVjdCBTaVNfUHJpdmF0ZSAqU2lTX1ByLCB1bnNp
Z25lZCBjaGFyICpjcmRhdGEsCiAgICBzcl9kYXRhID0gY3JkYXRhWzEzXTsKICAgIGNyX2RhdGEg
PSBjcmRhdGFbN107CiAKLSAgIC8qIFZlcnRpY2FsIHRvdGFsICovCi0gICBWVCAgPSBjcmRhdGFb
Nl0gfAotCSAoKHVuc2lnbmVkIHNob3J0KShjcl9kYXRhICYgMHgwMSkgPDwgOCkgfAotCSAoKHVu
c2lnbmVkIHNob3J0KShjcl9kYXRhICYgMHgyMCkgPDwgNCkgfAotCSAoKHVuc2lnbmVkIHNob3J0
KShzcl9kYXRhICYgMHgwMSkgPDwgMTApOwotCiAgICAvKiBWZXJ0aWNhbCBkaXNwbGF5IGVuYWJs
ZSBlbmQgKi8KICAgIFZERSA9IGNyZGF0YVsxMF0gfAogCSAoKHVuc2lnbmVkIHNob3J0KShjcl9k
YXRhICYgMHgwMikgPDwgNykgfApAQCAtMzYwNCw4ICszNTk1LDYgQEAgU2lTX0dlbmVyaWNfQ29u
dmVydENSRGF0YShzdHJ1Y3QgU2lTX1ByaXZhdGUgKlNpU19QciwgdW5zaWduZWQgY2hhciAqY3Jk
YXRhLAogCSAoKHVuc2lnbmVkIHNob3J0KShzcl9kYXRhICYgMHgwOCkgPDwgNyk7CiAgICBGID0g
VlJTICsgMSAtIEU7CiAKLSAgIGNyX2RhdGEyID0gKGNyZGF0YVsxNl0gJiAweDAxKSA8PCA1Owot
CiAgICAvKiBWZXJ0aWNhbCBibGFuayBlbmQgKi8KICAgIFZCRSA9IGNyZGF0YVsxMl0gfCAoKHVu
c2lnbmVkIHNob3J0KShzcl9kYXRhICYgMHgxMCkgPDwgNCk7CiAgICB0ZW1wID0gVkJFIC0gKChF
IC0gMSkgJiA1MTEpOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
