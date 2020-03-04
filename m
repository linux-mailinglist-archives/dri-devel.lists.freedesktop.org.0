Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50537178E99
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 11:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A496EA4E;
	Wed,  4 Mar 2020 10:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89FC6EA4E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 10:41:06 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r7so1778489wro.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 02:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t/8VSn4BSTxpxifrr9xpvRTdlmzrHeBSw3JBloziieU=;
 b=XcGhPvIsT0kOHFNFSXWK3ZzMv8C4/UFyZ5LndTo1MXYOxVPx1j05mGkqc9FC3we4bK
 lT/qwwtVuTAO0Y4yNF2qNNQj9eEDMm9NGQDPEhzCMPQJpStz5U0u8Vu6qAj21Dv3r5Dz
 j6gwWGbKE+TYPkBcrM/+aPFcXpCFg6yqfVxqQ2vCPiSz/1szy/72S5wzUqs1akUl2wDb
 Vp4Bakgqk6bff6UnSxKng+RT+u48v4bo16TI3vic6gtfvWqH6IdB1JuzlwwzbDkRJnjO
 q7ScHi3ErH7DvyZBOni0R+2M2cWWUxWFbAhxwSWCCUiUHS118MKFQE6RmZjkyMJ3jMXT
 WrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t/8VSn4BSTxpxifrr9xpvRTdlmzrHeBSw3JBloziieU=;
 b=jeKdMmA6t+GvPdT8OQDoi0o36Q6Y7+f907ieH1kwXl92OLueoG2IlIzR7XNJwXq6OJ
 0q7W1Jd29hGyOR52mrmK76c0gEKNcUWj2Dj8bfxvnnonUPEq1sDWQ9WEf+nE8CJOajcE
 8Uu+IZanFJRp1dtqfqVFODhyLvlJVYqpPbzVD71YpTau8AeAEoOqVB7zgd+mqEqDi2G4
 jLwp7EbUtf+O+LjYFBFglYcwmzQoXNsGPAZbqb8veQuFHUutNkZHHSV/syK/H1BbOp3o
 hHkoC/96SXy7vcCHb5WSD7C/YjXQV2AdAJI4GC4wnHqxROd0sVcITdpgml9MnPY61Vfm
 czNg==
X-Gm-Message-State: ANhLgQ01Oa9D1/6jSAoxVLferIl58z0tE5cjy+MTlRwwSVCPQ4I0Vi0Y
 PquycOM2NSJncn7ULToEaNXWdw==
X-Google-Smtp-Source: ADFU+vtfXrxN7a2jFW3uC2w7Gx3F9vuEUPrqanyTm8wR2pFQVZu8Rn/8XgSfGjhXG7zZ/D0PEvMr6g==
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr3338076wrw.47.1583318465253; 
 Wed, 04 Mar 2020 02:41:05 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c14sm24006398wro.36.2020.03.04.02.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 02:41:04 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v5 06/11] drm/meson: venc: make drm_display_mode const
Date: Wed,  4 Mar 2020 11:40:47 +0100
Message-Id: <20200304104052.17196-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200304104052.17196-1-narmstrong@baylibre.com>
References: <20200304104052.17196-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmVmb3JlIHN3aXRjaGluZyB0byBicmlkZ2UgZnVuY3MsIG1ha2Ugc3VyZSBkcm1fZGlzcGxheV9t
b2RlIGlzIHBhc3NlZAphcyBjb25zdCB0byB0aGUgdmVuYyBmdW5jdGlvbnMuCgpTaWduZWQtb2Zm
LWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+ClJldmlld2VkLWJ5
OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgpBY2tlZC1i
eTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpS
ZXZpZXdlZC1ieTogSmVybmVqIMWga3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jIHwgMiArLQogZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX3ZlbmMuaCB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNv
bi9tZXNvbl92ZW5jLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jCmluZGV4
IDRlZmQ3ODY0ZDViZi4uYTlhYjc4OTcwYmZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fdmVuYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5j
LmMKQEAgLTk0Niw3ICs5NDYsNyBAQCBib29sIG1lc29uX3ZlbmNfaGRtaV92ZW5jX3JlcGVhdChp
bnQgdmljKQogRVhQT1JUX1NZTUJPTF9HUEwobWVzb25fdmVuY19oZG1pX3ZlbmNfcmVwZWF0KTsK
IAogdm9pZCBtZXNvbl92ZW5jX2hkbWlfbW9kZV9zZXQoc3RydWN0IG1lc29uX2RybSAqcHJpdiwg
aW50IHZpYywKLQkJCSAgICAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQorCQkJICAg
ICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCiB7CiAJdW5pb24gbWVzb25f
aGRtaV92ZW5jX21vZGUgKnZtb2RlID0gTlVMTDsKIAl1bmlvbiBtZXNvbl9oZG1pX3ZlbmNfbW9k
ZSB2bW9kZV9kbXQ7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVu
Yy5oIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuaAppbmRleCA1NzY3NjhiZGQw
OGQuLjFhYmRjYmRmNTFjMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29u
X3ZlbmMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5oCkBAIC02MCw3
ICs2MCw3IEBAIGV4dGVybiBzdHJ1Y3QgbWVzb25fY3Zic19lbmNpX21vZGUgbWVzb25fY3Zic19l
bmNpX250c2M7CiB2b2lkIG1lc29uX3ZlbmNpX2N2YnNfbW9kZV9zZXQoc3RydWN0IG1lc29uX2Ry
bSAqcHJpdiwKIAkJCSAgICAgICBzdHJ1Y3QgbWVzb25fY3Zic19lbmNpX21vZGUgKm1vZGUpOwog
dm9pZCBtZXNvbl92ZW5jX2hkbWlfbW9kZV9zZXQoc3RydWN0IG1lc29uX2RybSAqcHJpdiwgaW50
IHZpYywKLQkJCSAgICAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKTsKKwkJCSAgICAg
IGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKTsKIHVuc2lnbmVkIGludCBtZXNv
bl92ZW5jaV9nZXRfZmllbGQoc3RydWN0IG1lc29uX2RybSAqcHJpdik7CiAKIHZvaWQgbWVzb25f
dmVuY19lbmFibGVfdnN5bmMoc3RydWN0IG1lc29uX2RybSAqcHJpdik7Ci0tIAoyLjIyLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
