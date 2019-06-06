Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7824438540
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934F589A57;
	Fri,  7 Jun 2019 07:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62170896EC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 09:47:08 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j29so1050328lfk.10
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 02:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZUJtTHTXNxu11uFgApSggUR6FUDtGDSUrwD5+2c4fw4=;
 b=E31JyVFsjbYhPFNKxxJoAGNKKVpaGz4/l71YD9SFpFijaVIlx0HQZjcRZgDNHLGo0A
 FWccD9dYZZzrNkLTnmQs4PFyis4wemVEdLBCf60n2HUiPsZcY16dk3NmjoaQQX2m76It
 c8fCBP7R9T0INJZQzaxvPS6AWbEwYtOpkZ1rD4LUFhLGH2gDAcQmD1PJRDIT3GL6Z4Dv
 PqPG6L9jNeEhNxUtT6LWtBrCCh6SrsOHbKn62tvya71SsE0y7lDRKFnoaoKFPlH8+Rfn
 np8WZlE7ENPWLCtVaTJir0sCgUeeGWtUYNGolu4SFblfT/TzcuJvjLIveqEP6emgQFY8
 alPA==
X-Gm-Message-State: APjAAAXEr0DJUpilR9NClh5X2Ap3/9Ijp7AWRN9rlw1r2JmpS8IE/m/M
 FSpWLVUt9ET0L2ftZN8VvVEx8Q==
X-Google-Smtp-Source: APXvYqyfSm4WZqLlK2FuAsUFqx7p2Ew9DH+2Np2QIeyhi9dQlGG8JR0BxiRPugpDfNWGd0YdYSALPA==
X-Received: by 2002:ac2:5609:: with SMTP id v9mr15271221lfd.27.1559814426775; 
 Thu, 06 Jun 2019 02:47:06 -0700 (PDT)
Received: from localhost (c-1c3670d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.54.28])
 by smtp.gmail.com with ESMTPSA id e8sm241763lfc.27.2019.06.06.02.47.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 02:47:06 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
 marex@denx.de, stefan@agner.ch, airlied@linux.ie, daniel@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, b.zolnierkie@samsung.com,
 a.hajda@samsung.com, mchehab@kernel.org, p.zabel@pengutronix.de,
 hkallweit1@gmail.com, lee.jones@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, davem@davemloft.net
Subject: [PATCH 0/8] fix warnings for same module names
Date: Thu,  6 Jun 2019 11:46:57 +0200
Message-Id: <20190606094657.23612-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZUJtTHTXNxu11uFgApSggUR6FUDtGDSUrwD5+2c4fw4=;
 b=fjWTs+v9sRcacPTkE7/eRu/9lwuTPBz6IVARKm6m4Eq7OW7fr63Dg12tQgHVVCRbol
 X9xJuP/JqN3cXHjJiC6f8ejkT+eMEcvNjqmDsSgH22spBK04YFEiIlwrHageUyfQp0xt
 Dr0W1fN4Dhoc4Vs0e2dMfi84pDucPLYspHEx1qyBDNLoCiJIDHxXk89F7LxCZQIsKONd
 8my/z5+M+Fr/vICw5e12GUeEZWFVwbkdPpr56GF9RuHraCzJOfRPTERnTkxQX5WMo6cS
 EP4xY+CInGYsGcd/8/b+F6qjYG5PezinP4T3p0CCu/MDQ46QsZOu/D1w+p5MJ3axD+dR
 KU2g==
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
Cc: linux-fbdev@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpUaGlzIHBhdGNoIHNldCBhZGRyZXNzZXMgd2FybmluZ3MgdGhhdCBtb2R1bGUgbmFtZXMg
YXJlIG5hbWVkIHRoZQpzYW1lLCB0aGlzIG1heSBsZWFkIHRvIGEgcHJvYmxlbSB0aGF0IHdyb25n
IG1vZHVsZSBnZXRzIGxvYWRlZCBvciBpZiBvbmUKb2YgdGhlIHR3byBzYW1lLW5hbWUgbW9kdWxl
cyBleHBvcnRzIGEgc3ltYm9sLCB0aGlzIGNhbiBjb25mdXNlIHRoZQpkZXBlbmRlbmN5IHJlc29s
dXRpb24uIGFuZCB0aGUgYnVpbGQgbWF5IGZhaWwuCgoKUGF0Y2ggImRyaXZlcnM6IG5ldDogZHNh
OiByZWFsdGVrOiBmaXggd2FybmluZyBzYW1lIG1vZHVsZSBuYW1lcyIgYW5kCiJkcml2ZXJzOiBu
ZXQ6IHBoeTogcmVhbHRlazogZml4IHdhcm5pbmcgc2FtZSBtb2R1bGUgbmFtZXMiIHJlc29sdmVz
IHRoZQpuYW1lIGNsYXRjaCByZWFsdGVrLmtvLgoKd2FybmluZzogc2FtZSBtb2R1bGUgbmFtZXMg
Zm91bmQ6CiAgZHJpdmVycy9uZXQvcGh5L3JlYWx0ZWsua28KICBkcml2ZXJzL25ldC9kc2EvcmVh
bHRlay5rbwoKClBhdGNoICAiZHJpdmVyczogKHZpZGVvfGdwdSk6IGZpeCB3YXJuaW5nIHNhbWUg
bW9kdWxlIG5hbWVzIiByZXNvbHZlcwp0aGUgbmFtZSBjbGF0Y2ggbXhzZmIua28uCgp3YXJuaW5n
OiBzYW1lIG1vZHVsZSBuYW1lcyBmb3VuZDoKICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L214c2ZiLmtv
CiAgZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiLmtvCgpQYXRjaCAiZHJpdmVyczogbWVkaWE6
IGkyYzogZml4IHdhcm5pbmcgc2FtZSBtb2R1bGUgbmFtZXMiIHJlc29sdmVzIHRoZQpuYW1lIGNs
YXRjaCBhZHY3NTExLmtvIGhvd2V2ZXIsIGl0IHNlYW1zIHRvIHJlZmVyIHRvIHRoZSBzYW1lIGRl
dmljZQpuYW1lIGluIGkyY19kZXZpY2VfaWQsIGRvZXMgYW55b25lIGhhdmUgYW55IGd1aWRhbmNl
IGhvdyB0aGF0IHNob3VsZCBiZQpzb2x2ZWQ/Cgp3YXJuaW5nOiBzYW1lIG1vZHVsZSBuYW1lcyBm
b3VuZDoKICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5rbwogIGRyaXZl
cnMvbWVkaWEvaTJjL2Fkdjc1MTEua28KCgpQYXRjaCAiZHJpdmVyczogbWVkaWE6IGNvZGE6IGZp
eCB3YXJuaW5nIHNhbWUgbW9kdWxlIG5hbWVzIiByZXNvbHZlcyB0aGUKbmFtZSBjbGF0Y2ggY29k
YS5rby4KCndhcm5pbmc6IHNhbWUgbW9kdWxlIG5hbWVzIGZvdW5kOgogIGZzL2NvZGEvY29kYS5r
bwogIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY29kYS9jb2RhLmtvCgoKUGF0Y2ggImRyaXZlcnM6
IG5ldDogcGh5OiBmaXggd2FybmluZyBzYW1lIG1vZHVsZSBuYW1lcyIgcmVzb2x2ZXMgdGhlCm5h
bWUgY2xhdGNoIGFzaXgua28uCgp3YXJuaW5nOiBzYW1lIG1vZHVsZSBuYW1lcyBmb3VuZDoKICBk
cml2ZXJzL25ldC9waHkvYXNpeC5rbwogIGRyaXZlcnMvbmV0L3VzYi9hc2l4LmtvCgpQYXRjaCAi
ZHJpdmVyczogbWZkOiA4OHBtODAwOiBmaXggd2FybmluZyBzYW1lIG1vZHVsZSBuYW1lcyIgYW5k
CiJkcml2ZXJzOiByZWd1bGF0b3I6IDg4cG04MDA6IGZpeCB3YXJuaW5nIHNhbWUgbW9kdWxlIG5h
bWVzIiByZXNvbHZlcwp0aGUgbmFtZSBjbGF0Y2ggODhwbTgwMC5rby4KCndhcm5pbmc6IHNhbWUg
bW9kdWxlIG5hbWVzIGZvdW5kOgogIGRyaXZlcnMvcmVndWxhdG9yLzg4cG04MDAua28KICBkcml2
ZXJzL21mZC84OHBtODAwLmtvCgoKQ2hlZXJzLApBbmRlcnMKCkFuZGVycyBSb3hlbGwgKDgpOgog
IGRyaXZlcnM6IG5ldDogZHNhOiByZWFsdGVrOiBmaXggd2FybmluZyBzYW1lIG1vZHVsZSBuYW1l
cwogIGRyaXZlcnM6IG5ldDogcGh5OiByZWFsdGVrOiBmaXggd2FybmluZyBzYW1lIG1vZHVsZSBu
YW1lcwogIGRyaXZlcnM6ICh2aWRlb3xncHUpOiBmaXggd2FybmluZyBzYW1lIG1vZHVsZSBuYW1l
cwogIGRyaXZlcnM6IG1lZGlhOiBpMmM6IGZpeCB3YXJuaW5nIHNhbWUgbW9kdWxlIG5hbWVzCiAg
ZHJpdmVyczogbWVkaWE6IGNvZGE6IGZpeCB3YXJuaW5nIHNhbWUgbW9kdWxlIG5hbWVzCiAgZHJp
dmVyczogbmV0OiBwaHk6IGZpeCB3YXJuaW5nIHNhbWUgbW9kdWxlIG5hbWVzCiAgZHJpdmVyczog
bWZkOiA4OHBtODAwOiBmaXggd2FybmluZyBzYW1lIG1vZHVsZSBuYW1lcwogIGRyaXZlcnM6IHJl
Z3VsYXRvcjogODhwbTgwMDogZml4IHdhcm5pbmcgc2FtZSBtb2R1bGUgbmFtZXMKCiBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvTWFrZWZpbGUgfCAxMCArKysrKy0tLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbXhzZmIvTWFrZWZpbGUgICAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL21lZGlh
L2kyYy9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgMyArKy0KIGRyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vY29kYS9NYWtlZmlsZSAgICB8ICA0ICsrLS0KIGRyaXZlcnMvbWZkL01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgICB8ICA3ICsrKysrLS0KIGRyaXZlcnMvbmV0L2RzYS9NYWtlZmlsZSAgICAg
ICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvbmV0L3BoeS9NYWtlZmlsZSAgICAgICAgICAg
ICAgICB8ICA2ICsrKystLQogZHJpdmVycy9yZWd1bGF0b3IvTWFrZWZpbGUgICAgICAgICAgICAg
IHwgIDMgKystCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L01ha2VmaWxlICAgICAgICAgICAgfCAgMyAr
Ky0KIDkgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
