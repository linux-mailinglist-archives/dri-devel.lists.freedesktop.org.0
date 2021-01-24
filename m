Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7873230197F
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jan 2021 05:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E13C89D1D;
	Sun, 24 Jan 2021 04:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B632589D1D
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 04:40:23 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id m2so7682501wmm.1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Jan 2021 20:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rhg44bLk8YwUZNcfhaZg+ceWvGExFDKu36X7UInozoM=;
 b=qv5UKKsCL2PaW2W9iICDzftCQBA0FaUlDOTH1zd6M4roqRE+eUl7oowslJaTlddx+e
 KVlI7Laf0wPk7p3h89FMPx2iOjF/Y/PNp/gjkSjCSvGMqFkWAr7l7r/so2750rkFnKmK
 XtkWuXVQvgsxpbIEfRM20bXcglwYEeuqeLeQ+jpfpbTm45Vfkd1qfM+L5c42WF1fGQyn
 KHiceiPnR6546MsMADopbKQXlF6v6BSDzbrLHcR1fy1LkPwdEU7y9giTJhFBhjiReKmA
 5e9deE4IEVlbRg+2IVHx0I9ru0zGCvaxqqIP2f85KnSGFK1ctqLuhOQHjxkIs1D3YHOv
 WP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rhg44bLk8YwUZNcfhaZg+ceWvGExFDKu36X7UInozoM=;
 b=SkIgwu368NKa6p4bLe9Yb5pSIXCFiy/A6o45t5NXzRiUYKdLblrwbXSjRBgapCakjg
 V6JNb50h5jToah9irKaJyJYT8dY1JpVWL2YIEId2seNQeagc/Dh8t5dwuBpnEgV81wIe
 uck/NRW8xVaTOmFFuY56aHrhPuzMkmn3hWpD9JxBt82/2z89KHiCQOMyf+vRl/XP3lbN
 B4ypp9xeJhAZIyruMTV8gZu1jqyGP2LDNqmUnPwEsgzAgG7GPCjbuppjtjzXfi/DkJjZ
 JKDv+7GHwbVhrvsENNdHTJeVHtG4wUc0f4a3fN/IXWtulz4++wbZTFbJOtfZHYFwqA/c
 ajYA==
X-Gm-Message-State: AOAM530aAS+iJGp1J9d6GIpCTrF+fUtEnbgf7NMNn0E27erxvYWk2HXz
 MIf+6aJqLNc8kfQHiwGbreIMBrLQ2/8=
X-Google-Smtp-Source: ABdhPJzGQtXLALiKgKXXLCqZ+jkUfcD/YA8VyKoFGcg6KM+qsPNwilgM7S7ItxYXKABomvv+hDBotA==
X-Received: by 2002:a05:600c:198e:: with SMTP id
 t14mr1198914wmq.109.1611463222148; 
 Sat, 23 Jan 2021 20:40:22 -0800 (PST)
Received: from twisty.localdomain
 (dynamic-2a01-0c22-d4ca-c600-6cbb-50d4-b91e-5b37.c22.pool.telefonica.de.
 [2a01:c22:d4ca:c600:6cbb:50d4:b91e:5b37])
 by smtp.gmail.com with ESMTPSA id z130sm16508092wmb.33.2021.01.23.20.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 20:40:21 -0800 (PST)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Fix HDMI_STATIC_METADATA_TYPE1 constant.
Date: Sun, 24 Jan 2021 05:40:10 +0100
Message-Id: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Shashank Sharma <shashank.sharma@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIHRoZSBDVEEgODYxLkcgc3BlYywgSERNSV9TVEFUSUNfTUVUQURBVEFfVFlQ
RTEgaXMKbm90IDEsIGJ1dCB6ZXJvLCBzbyBmaXggdGhpcyBlbnVtLgoKV2hpbGUgdGhpcyBkb2Vz
bid0IGNhdXNlIHByb2JsZW1zIGluIHRoZSBrZXJuZWwgeWV0LCBhcyB0aGUKY29uc3RhbnQgaXNu
J3QgYWN0aXZlbHkgdXNlZCBieSBkcml2ZXJzIHlldCwgaXQgZGlkIGNyZWF0ZQpjb25mdXNpb24g
d2hpbGUgZGVidWdnaW5nIEhEUiBwcm9ibGVtcyBpbiB5b3VycyB0cnVseSwgYW5kCmFsc28gcG90
ZW50aWFsIGJ1Z3MgaW4gdXNlcnNwYWNlIGNvbXBvbmVudHMsIGFzIHRoZSB3cm9uZwplbnVtIHBy
b3BhZ2F0ZXMgdG8gY29tcG9uZW50cywgZS5nLiwgbGlrZSBpdCBkaWQgYWxyZWFkeQppbnRvIGlu
dGVsLWdwdS10b29scyAodGVzdHMva21zX2hkci5jKSBvciBpcyB1c2VkIGFzIHdyb25nCnJlZmVy
ZW5jZSB3aGVuIHdyaXRpbmcgZnV0dXJlIG5ldyB1c2Vyc3BhY2UgSERSIGNvbXBvbmVudHMKbGlr
ZSBjb21wb3NpdG9ycy4KCkZpeGVzOiBmYmI1ZDAzNTNjNjIgKCJkcm06IEFkZCBIRFIgc291cmNl
IG1ldGFkYXRhIHByb3BlcnR5IikKU2lnbmVkLW9mZi1ieTogTWFyaW8gS2xlaW5lciA8bWFyaW8u
a2xlaW5lci5kZUBnbWFpbC5jb20+CkNjOiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwu
Y29tPgpDYzogU2hhc2hhbmsgU2hhcm1hIDxzaGFzaGFuay5zaGFybWFAaW50ZWwuY29tPgpDYzog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBpbmNs
dWRlL2xpbnV4L2hkbWkuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaGRtaS5oIGIvaW5jbHVk
ZS9saW51eC9oZG1pLmgKaW5kZXggOTg1MGQ1OWQ2ZjFjLi5jOGVjOTgyZmY0OTggMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvbGludXgvaGRtaS5oCisrKyBiL2luY2x1ZGUvbGludXgvaGRtaS5oCkBAIC0x
NTYsNyArMTU2LDcgQEAgZW51bSBoZG1pX2NvbnRlbnRfdHlwZSB7CiB9OwogCiBlbnVtIGhkbWlf
bWV0YWRhdGFfdHlwZSB7Ci0JSERNSV9TVEFUSUNfTUVUQURBVEFfVFlQRTEgPSAxLAorCUhETUlf
U1RBVElDX01FVEFEQVRBX1RZUEUxID0gMCwKIH07CiAKIGVudW0gaGRtaV9lb3RmIHsKLS0gCjIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
