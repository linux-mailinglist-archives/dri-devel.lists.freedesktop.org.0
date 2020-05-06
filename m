Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 722F01C7C57
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 23:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0CD6E8F0;
	Wed,  6 May 2020 21:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2942489DE1;
 Wed,  6 May 2020 21:23:06 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id s9so3784710qkm.6;
 Wed, 06 May 2020 14:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qNVPSRr79n4Sobwm/zyYhlPQDqHPi4669U8xZbc4YxQ=;
 b=gx6MV1cnmgFggEMtNkWG5BtScSs61248hDjhUfv2zXlqlrlQ263ZPK4Xbq9pX/aoR6
 Jgyz6vsKTrtVgv0kGMF7TIJe9tn3G+GV7TNpo7lEKBQCsBCUwhpXrr/ReM37KmUbIF+1
 wJ38F449t+s4CxLwT/d1foS2+S0DeUvc3WO1oqZvXRr7ZoSPsfaJuMnATB0CxdkJ0LkY
 mgKz9lMy/Wri5lus2TdGDHmiV2BHLaggAmhCiYaEWtDqcIbSIOxPy5+xrXP74QB+ZMRK
 lyb3mXUl8Cd/cswTdG6MbrwVi7m9yIVCUokluUdtyJLJqncgYqdPnEKaqECY9QiBaarq
 hVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qNVPSRr79n4Sobwm/zyYhlPQDqHPi4669U8xZbc4YxQ=;
 b=peC7ihGjIe3kw2mkJb5S+NvHutWLLB0m0SuO+eCGMlRhz/oKGWJI92iQNDSsUp2ZsL
 7Dx4XMKMXwEQJQtnr11eZiR0RIX1n2At0q44vSVWhn/tAR2mkEYPRwP04rkOMUzfEhyp
 91iG2JqsbkusCWI/lTc3xAyj182J8qR7v9+CbGanEu2SVm+DAuOY8ZUwy7XRKZAvUZ3v
 ESpVZu6Tqi9/sxxMmS/F5sFv3VeCUveAsEO1HHnTwYygXozcAU295a+7SUM68/piFOSE
 /4KyqMeHowRjmpJsBD99UKCqXNf2/9r/usPOmvO0qu636kFOX71uNJ7iNKdKiq86sSNw
 3XbQ==
X-Gm-Message-State: AGi0PuY7R7z4b2CsNPSyWmCGufZVACVcnE7dHIM+5/waO0JtqPsRG7ii
 itAmug07+aV9clsxEVj8EbbZ1G+u
X-Google-Smtp-Source: APiQypJ8BGemRB+A3XM722zImLae3axPYrQNpRtrfdai4myrcVFgzI3LrcPRGqr6zIU5JV+3xAOukg==
X-Received: by 2002:a05:620a:568:: with SMTP id
 p8mr11154280qkp.311.1588800185097; 
 Wed, 06 May 2020 14:23:05 -0700 (PDT)
Received: from localhost.localdomain ([71.219.37.167])
 by smtp.gmail.com with ESMTPSA id i42sm2786311qtc.83.2020.05.06.14.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 14:23:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.7
Date: Wed,  6 May 2020 17:22:57 -0400
Message-Id: <20200506212257.3893-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKRml4ZXMgZm9yIDUuNy4KClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBz
aW5jZSBjb21taXQgZTNkY2Q4NmIzYjRjMDQ1YTRkYjE3YzAyMzQwMTM4YTRjNTE0ZmUyMDoKCiAg
TWVyZ2UgdGFnICdhbWQtZHJtLWZpeGVzLTUuNy0yMDIwLTA0LTI5JyBvZiBnaXQ6Ly9wZW9wbGUu
ZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eCBpbnRvIGRybS1maXhlcyAoMjAyMC0wNS0wMSAx
MToxOTo1NSArMTAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoK
ICBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eCB0YWdzL2FtZC1kcm0t
Zml4ZXMtNS43LTIwMjAtMDUtMDYKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBlNjE0
MmRkNTExNDI1Y2I4MjdiNWRiODY5ZjQ4OWViODFmNWY5OTRkOgoKICBkcm0vYW1kL2Rpc3BsYXk6
IFByZXZlbnQgZHBjZCByZWFkcyB3aXRoIHBhc3NpdmUgZG9uZ2xlcyAoMjAyMC0wNS0wNSAxNjox
Mzo1NyAtMDQwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KYW1kLWRybS1maXhlcy01LjctMjAyMC0wNS0wNjoKCmFtZGdw
dToKLSBSdW50aW1lIFBNIGZpeGVzCi0gREMgZml4IGZvciBQUEMKLSBNaXNjIERDIGZpeGVzCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCkF1cmFiaW5kbyBQaWxsYWkgKDEpOgogICAgICBkcm0vYW1kL2Rpc3BsYXk6IFByZXZl
bnQgZHBjZCByZWFkcyB3aXRoIHBhc3NpdmUgZG9uZ2xlcwoKRGFuaWVsIEtvbGVzYSAoMSk6CiAg
ICAgIGRybS9hbWQvZGlzcGxheTogd29yayBhcm91bmQgZnAgY29kZSBiZWluZyBlbWl0dGVkIG91
dHNpZGUgb2YgRENfRlBfU1RBUlQvRU5ECgpFdmFuIFF1YW4gKDIpOgogICAgICBkcm0vYW1kZ3B1
OiBtb3ZlIGtmZCBzdXNwZW5kIGFmdGVyIGlwX3N1c3BlbmRfcGhhc2UxCiAgICAgIGRybS9hbWRn
cHU6IGRyb3AgcmVkdW5kYW50IGNnL3BnIHVuZ2F0ZSBvbiBydW5wbSBlbnRlcgoKTWljaGVsIETD
pG56ZXIgKDEpOgogICAgICBkcm0vYW1kZ3B1L2RjOiBVc2UgV0FSTl9PTl9PTkNFIGZvciBBU1NF
UlQKClJvbWFuIExpICgxKToKICAgICAgZHJtL2FtZC9kaXNwbGF5OiBmaXggY291bnRlciBpbiB3
YWl0X2Zvcl9ub19waXBlc19wZW5kaW5nCgpTdW5nIExlZSAoMSk6CiAgICAgIGRybS9hbWQvZGlz
cGxheTogVXBkYXRlIERDTjIuMSBEViBDb2RlIFJldmlzaW9uCgogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jICAgICAgICAgfCAgNyArKy0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyAgfCAxNyArKysrKysrLS0tLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgICAgICAgICAgIHwgIDUg
KystLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyAg
fCAzMSArKysrKysrKysrKysrKysrLS0tLS0tCiAuLi4vZGlzcGxheS9kYy9kbWwvZGNuMjEvZGlz
cGxheV9ycV9kbGdfY2FsY18yMS5jICB8ICA4ICsrKy0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL29zX3R5cGVzLmggICAgICAgICAgfCAgMiArLQogNiBmaWxlcyBjaGFuZ2VkLCA0
MyBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
