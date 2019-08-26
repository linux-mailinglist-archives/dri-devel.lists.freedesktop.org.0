Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B813C9D74A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 22:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFC188E33;
	Mon, 26 Aug 2019 20:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F00888AE
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 20:14:33 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id m44so28129013edd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 13:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MEWFNP9G9XRQyNplR93hNjA88jcDbmmCg7h8xD2JEzU=;
 b=iaCQsNsAR0IxAn6qif5hlCNHm0OCqsiHy6+nKkPBz6XFPcA32w6ed8KbAga4/VrW70
 0QEHpqTP/9OvUFVO8o7cqSON0z8nLesG8qmg9HVg8H5wvKbVM4iCJ89h3bvuTbw79400
 +ms6r/K3OzsaRVcjQCTgwzifp57ccNiFryIKBir5ePu4Bf5zzN/nIpN6PdlQjPgbk5r7
 ED1VtxZszFLdU/URQPYoKLRWYLBvzQDgd43zACRZx82ZPh3d8EB1H4AtJcwURYKe3rRv
 ViTr1YGXStyLUB32skAj8a8L5EbDMvmEQfLozzLqCbcPQVsOfToV2SIj67v1BYZ2PEH/
 m13w==
X-Gm-Message-State: APjAAAVB6B7gzYDXZlQAzEjU78jebLRFTzQgEZ/vs2m3LhWALIviiaen
 Ba0fH3fdEGO5Vwfs78i3xg4NJg==
X-Google-Smtp-Source: APXvYqxLqEPD0/LdFMncbAYamThZ56ARg99koHGS0Ym61r97PqUdd+AzAX9vwScKfOBYaciZi35XAg==
X-Received: by 2002:a50:cc99:: with SMTP id q25mr20152694edi.207.1566850471666; 
 Mon, 26 Aug 2019 13:14:31 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j25sm3000780ejb.49.2019.08.26.13.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 13:14:30 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/5] mmu notifer debug annotations
Date: Mon, 26 Aug 2019 22:14:20 +0200
Message-Id: <20190826201425.17547-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MEWFNP9G9XRQyNplR93hNjA88jcDbmmCg7h8xD2JEzU=;
 b=KsRq9jvc8+HnjknGWkm6taWVUdOk9oNM+c04XJIBVUYGcOP0MJNkQx9WOTX/WpSWMR
 VDHNqXxPNfx5r7fkM9tldZ4RH+WNleFaR3gLttKhoLCHbB76RNSX9LZcPAWgXMLWGZdX
 CA567cCQXUiG7iZja4mZg3jSGGXg0k9TiOMdw=
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
Cc: Linux MM <linux-mm@kvack.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKTmV4dCByb3VuZC4gQ2hhbmdlczoKCi0gSSBrZXB0IHRoZSB0d28gbG9ja2RlcCBh
bm5vdGF0aW9ucyBwYXRjaGVzIHNpbmNlIHdoZW4gSSByZWJhc2VkIHRoaXMKICBiZWZvcmUgcmV0
ZXN0aW5nIGxpbnV4LW5leHQgZGlkbid0IHlldCBoYXZlIHRoZW0uIE90aGVyd2lzZSB1bmNoYW5n
ZWQKICBleGNlcHQgZm9yIGEgdHJpdmlhbCBjb25mbGljdC4KCi0gQWNrIGZyb20gUGV0ZXIgWi4g
b24gdGhlIGtlcm5lbC5oIHBhdGNoLgoKLSBBZGRlZCBhbm5vdGF0aW9ucyBmb3Igbm9uX2Jsb2Nr
IHRvIGludmFsaWRhdGVfcmFuZ2VfZW5kLiBJIGNhbid0IHRlc3QKICB0aGF0IHJlYWRpbHkgc2lu
Y2UgaTkxNSBkb2Vzbid0IHVzZSBpdC4KCi0gQWRkZWQgbWlnaHRfc2xlZXAgYW5ub3RhdGlvbnMg
dG8gYWxzbyBtYWtlIHN1cmUgdGhlIG1tIHNpZGUga2VlcHMgdXAKICBpdCdzIHNpZGUgb2YgdGhl
IGNvbnRyYWN0IGhlcmUgYXJvdW5kIHdoYXQncyBhbGxvd2VkIGFuZCB3aGF0J3Mgbm90LgoKQ29t
bWVudHMsIGZlZWRiYWNrLCByZXZpZXcgYXMgdXN1YWwgdmVyeSBtdWNoIGFwcHJlY2lhdGVkLgoK
Q2hlZXJzLCBEYW5pZWwKCkRhbmllbCBWZXR0ZXIgKDUpOgogIG1tLCBub3RpZmllcjogQWRkIGEg
bG9ja2RlcCBtYXAgZm9yIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQvZW5kCiAgbW0sIG5vdGlmaWVy
OiBQcmltZSBsb2NrZGVwCiAga2VybmVsLmg6IEFkZCBub25fYmxvY2tfc3RhcnQvZW5kKCkKICBt
bSwgbm90aWZpZXI6IENhdGNoIHNsZWVwaW5nL2Jsb2NraW5nIGZvciAhYmxvY2thYmxlCiAgbW0s
IG5vdGlmaWVyOiBhbm5vdGF0ZSB3aXRoIG1pZ2h0X3NsZWVwKCkKCiBpbmNsdWRlL2xpbnV4L2tl
cm5lbC5oICAgICAgIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrLQogaW5jbHVkZS9saW51
eC9tbXVfbm90aWZpZXIuaCB8IDEzICsrKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvc2NoZWQu
aCAgICAgICAgfCAgNCArKysrCiBrZXJuZWwvc2NoZWQvY29yZS5jICAgICAgICAgIHwgMTkgKysr
KysrKysrKysrKystLS0tLQogbW0vbW11X25vdGlmaWVyLmMgICAgICAgICAgICB8IDMxICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0KIDUgZmlsZXMgY2hhbmdlZCwgODQgaW5zZXJ0aW9u
cygrKSwgOCBkZWxldGlvbnMoLSkKCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
