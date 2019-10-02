Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E202BC8D28
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 17:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC94E6E250;
	Wed,  2 Oct 2019 15:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2036E250
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 15:44:31 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q9so1451201wrm.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 08:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:to:from:subject:cc:message-id:date
 :user-agent:mime-version:content-transfer-encoding:content-language;
 bh=wYtsAl9CB4RBRC4P+P4qz8ByycXD3GrxiKiEeVGdy40=;
 b=L2LOM/T79Juq7Lv1wDIXzjMKQgc7ZKhe7uxsmDdrFdj4YSaomWkgx+MFyx3kdfQpj4
 w8HjtkWFDzd+qiJuo9JbXi794fNgKjk76X6YblSElfBtEMajjSLJLD8qDWLiPlPrud15
 L4s+jU8/dLaWNz0fRFCgfpnwhdJyrcTQq+TUaR/dXhMAK6zkhf+36hlHf2E8xAFVv0aq
 SEg+XBh225C5n9n/0d5wd4m1xk14GRBsKr8MKpPwMiMEjfTGf5i0qdLEH3EpEiXaY2qj
 0uMmG3/YHldc+Oa2xB4ers3mb/1wPXqBZHUPal6xodfkriu8nNszW3A0lLHJts0seB67
 ygzg==
X-Gm-Message-State: APjAAAUuOyrZkSfOCArN/1mRfyuqR2wXjtaD7TmzGiu7lPO+VbpTgZb/
 NrDIgZpzQ4vB4LSGnySWMNw=
X-Google-Smtp-Source: APXvYqx5cQRrOF/zG2UYIhxr7GwngfALCQHvRIvVRrI1Ba1pU9lxZjGaQw/tOx4dKYhWVtL3zjTc0A==
X-Received: by 2002:a5d:60c8:: with SMTP id x8mr844279wrt.107.1570031069954;
 Wed, 02 Oct 2019 08:44:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id a18sm29842123wrh.25.2019.10.02.08.44.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Oct 2019 08:44:29 -0700 (PDT)
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: [pull] ttm drm-fixes-5.4
Message-ID: <1eba1bc0-ba0c-b948-6a3d-51a98f4e5c27@gmail.com>
Date: Wed, 2 Oct 2019 17:44:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:to:from:subject:cc:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=wYtsAl9CB4RBRC4P+P4qz8ByycXD3GrxiKiEeVGdy40=;
 b=ieGE6qaHF9SiiJCaxNgxaW6GtIqoT8ENaq6g2xeiUJQzdB/mjGwlO/TI8FxLKDELGT
 /7TCidaxGnTvWoLI4pd+V+vZ89QKKChMhhmiXyEMecTPEoNf8EADQn2JAVe6dqA2HKu2
 xrEcviwwqmutIMpHyr+I+doVfc6/ILmdche8JvyO4Wy2C3stZU/xxlaTC8hPZOSk2+G9
 7dOLGPph+OsROYdUKrx4coJom8D++nSiME5jBbygHG1Lf9snY2JRYkqK9tgoAVr7pnby
 rCWz7kKhZJmTTEHUWlwvlePTfIoWqP+JqhCZOUtsjETM8I4CyFk8lu+alcwHkMe88UXv
 59VA==
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
Reply-To: christian.koenig@amd.com
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKd2UgaGFkIHNvbWUgcHJvYmxlbXMgdGhpcyBjeWNsZSBzZW5kaW5n
IG91dCBUVE0gZml4ZXMgYmVjYXVzZSBvZiBsYWNrIG9mIAp0aW1lIHRvIHJlYmFzZSBhbWQtc3Rh
Z2luZy1kcm0tbmV4dC4KCkJlY2F1c2Ugb2YgdGhpcyBBbGV4IGFuZCBJIGRlY2lkZWQgdGhhdCBJ
J20gZ29pbmcgdG8gc2VuZCBvdXQgVFRNIHB1bGwgCnJlcXVlc3RzIHNlcGFyYXRlbHkgbm93LiBT
byB0aGlzIGlzIHRoZSBmaXJzdCBzbWFsbCBidW5jaCBvZiBmaXhlcyBmb3IgNS40LgoKVGhlIGZv
bGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA1NGVjYjhmNzAyOGM1ZWIzZDc0MGJiODJiMGYx
ZDkwZjJkZjYzYzVjOgoKIMKgIExpbnV4IDUuNC1yYzEgKDIwMTktMDktMzAgMTA6MzU6NDAgLTA3
MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiDCoCBodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvY2tvZW5pZy9saW51eC1kcm0uZ2l0IGRybS10dG0tZml4
ZXMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAzZWVmY2ZlOWE2NDRiZTQ0MDk2OTFi
NDRjM2IyZDYyOWQxNzdmYjlhOgoKIMKgIGRybS90dG06IFJlc3RvcmUgdHRtIHByZWZhdWx0aW5n
ICgyMDE5LTEwLTAyIDE1OjU3OjM0ICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpDaHJpc3RpYW4gS8O2bmlnICgx
KToKIMKgwqDCoMKgwqAgZHJtL3R0bTogZml4IGJ1c3kgcmVmZXJlbmNlIGluIHR0bV9tZW1fZXZp
Y3RfZmlyc3QKClRob21hcyBIZWxsc3Ryb20gKDEpOgogwqDCoMKgwqDCoCBkcm0vdHRtOiBSZXN0
b3JlIHR0bSBwcmVmYXVsdGluZwoKIMKgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uY8KgwqDC
oCB8wqAgNCArKy0tCiDCoGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgfCAxNiArKysr
KysrLS0tLS0tLS0tCiDCoDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMSBkZWxl
dGlvbnMoLSkKClJlZ2FyZHMsCkNocmlzdGlhbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
