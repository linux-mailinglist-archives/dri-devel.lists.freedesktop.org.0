Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D72B21E975
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138B76E930;
	Tue, 14 Jul 2020 07:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD23D6EBBD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:54:13 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 17so5262504wmo.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uS74RW3R7oVrVUcdeGz+IwEJ/hodNEH2pQb2ItCjHlw=;
 b=ejILNa5rnxbthqxA80AceNynfoEltSRLhAzv3sLbCnMZ3ljvh7YG1dB3RObjmrMZB0
 Ybjqg1o+Y/+eMN7Vf24D9gGIJpgdEw+TFrvoDAazs/6Coh5Jps3SyomJ3lzbnBh9lyax
 nG821Fpjz5ip2XIC7uXG5jccFddLtu6mJf8kf5pvRPndMhvu4ksp58uFqDhMRhoDaQcF
 GEmiLMiQkFMlVW7t1iAvXORhIzwFsU7/NgF0Lx39EaJFJkaqQ22KxIIWerrLHemTpf7y
 hrKNIVRKjOGjRKgUFUdV7SPxZFkaPhDGTTNjKSP0n0OPp01RKahEH5DXfjhieLQ4d9RY
 eqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uS74RW3R7oVrVUcdeGz+IwEJ/hodNEH2pQb2ItCjHlw=;
 b=W8Iaj0+HtiKZaLzC1WQegeajPfjXzwg8ShVeWadp0H92O/oCcdrjNlmipQnBRF/xiE
 n8dxiygNsPAW8OJYzci2PbASU4GSLfrmydryXeZa+v/hYR4WgwTOHyeYx6H/gQl2C1/z
 D9sIi/oidpzCHZJUpvQx9ZW4ibssQ/EqOOEqLJlO4h80n7H4Ze6JKXnJMf16A5dBhv7t
 R3i0pcFarcRob6jLGPz2U7H8PjfUtA+9wvKmzGbDsRqW5CuO/gOmLjW0Csv/D72CWxHa
 nmMk9SFGy+/S6LnnhYEyEK2Y51hS852FHlbe4Y1jbI+JF1Rkp4M4j0VzTIfF8PoVVoFv
 f3jQ==
X-Gm-Message-State: AOAM5318Cl5SorSvXAPAYhs7c1fLM/GwKKXitkDcrj/4ZMmtjaiHLth0
 LpGWo9AYfpQ20a9Zj6xbecNRTbW6AhU=
X-Google-Smtp-Source: ABdhPJzrC/ZiUbGKpJ84xvjFBKwLntuX+nYt1kRH1Pkpr10cGiOjqiIDkFm8v2CTnAcrKHwkKQMaCA==
X-Received: by 2002:a7b:cc91:: with SMTP id p17mr4620435wma.90.1594374852364; 
 Fri, 10 Jul 2020 02:54:12 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id u23sm10176092wru.94.2020.07.10.02.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 02:54:11 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v5 00/14] Add regulator devfreq support to Panfrost
Date: Fri, 10 Jul 2020 11:53:55 +0200
Message-Id: <20200710095409.407087-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpUaGlzIHNlcmllIGNsZWFucyBhbmQgYWRkcyByZWd1bGF0b3Igc3VwcG9ydCB0byBQYW5m
cm9zdCBkZXZmcmVxLgpUaGlzIGlzIG1vc3RseSBiYXNlZCBvbiBjb21tZW50IGZvciB0aGUgZnJl
c2hseSBpbnRyb2R1Y2VkIGxpbWEKZGV2ZnJlcS4KCldlIG5lZWQgdG8gYWRkIHJlZ3VsYXRvciBz
dXBwb3J0IGJlY2F1c2Ugb24gQWxsd2lubmVyIHRoZSBHUFUgT1BQCnRhYmxlIGRlZmluZXMgYm90
aCBmcmVxdWVuY2llcyBhbmQgdm9sdGFnZXMuCgpGaXJzdCBwYXRjaGVzIFswMS0wN10gc2hvdWxk
IG5vdCBjaGFuZ2UgdGhlIGFjdHVhbCBiZWhhdmlvcgphbmQgaW50cm9kdWNlIGEgcHJvcGVyIHBh
bmZyb3N0X2RldmZyZXEgc3RydWN0LgoKUmVnYXJkcywKQ2zDqW1lbnQKCkNoYW5nZXMgc2luY2Ug
djQ6CiAtIEZpeCBtaXNzZWQgYSBwZmRldiB0byAmcGZkZXYtPmRldmZyZXEgZHVyaW5nIHJlYmFz
ZQoKQ2hhbmdlcyBzaW5jZSB2MzoKIC0gQ29sbGVjdCBTdGV2ZW4gUHJpY2UgcmV2aWV3ZWQtYnkg
dGFncwogLSBSZWJhc2Ugb24gbmV4dC9tYXN0ZXIgKG5leHQtMjAyMDA3MDkpCgpDaGFuZ2VzIHNp
bmNlIHYyOgogLSBDb2xsZWN0IEFseXNzYSBSb3Nlbnp3ZWlnIHJldmlld2VkLWJ5IHRhZ3MKIC0g
Rml4IG9wcF9zZXRfcmVndWxhdG9yIGJlZm9yZSBhZGRpbmcgb3BwX3RhYmxlIChpbnRyb2R1Y2Ug
aW4gdjIpCiAtIENhbGwgZXJyX2ZpbmkgaW4gY2FzZSBvcHBfYWRkX3RhYmxlIGZhaWxlZAoKQ2hh
bmdlcyBzaW5jZSB2MToKIC0gQ29sbGVjdCBTdGV2ZW4gUHJpY2UgcmV2aWV3ZWQtYnkgdGFncwog
LSBGaXggc3BpbmxvY2sgY29tbWVudAogLSBEcm9wIE9QUCBjbG9jay1uYW1lIHBhdGNoCiAtIERy
b3AgZGV2aWNlX3Byb3BlcnR5X3Rlc3QgcGF0Y2gKIC0gQWRkIHJlbmFtZSBlcnJvciBsYWJlbHMg
cGF0Y2gKCkNsw6ltZW50IFDDqXJvbiAoMTQpOgogIGRybS9wYW5mcm9zdDogYXZvaWQgc3RhdGlj
IGRlY2xhcmF0aW9uCiAgZHJtL3BhbmZyb3N0OiBjbGVhbiBoZWFkZXJzIGluIGRldmZyZXEKICBk
cm0vcGFuZnJvc3Q6IGRvbid0IHVzZSBwZmRldmZyZXEuYnVzeV9jb3VudCB0byBrbm93IGlmIGh3
IGlzIGlkbGUKICBkcm0vcGFuZnJvc3Q6IGludHJvZHVjZSBwYW5mcm9zdF9kZXZmcmVxIHN0cnVj
dAogIGRybS9wYW5mcm9zdDogdXNlIHNwaW5sb2NrIGluc3RlYWQgb2YgYXRvbWljCiAgZHJtL3Bh
bmZyb3N0OiBwcm9wZXJseSBoYW5kbGUgZXJyb3IgaW4gcHJvYmUKICBkcm0vcGFuZnJvc3Q6IHJl
bmFtZSBlcnJvciBsYWJlbHMgaW4gZGV2aWNlX2luaXQKICBkcm0vcGFuZnJvc3Q6IG1vdmUgZGV2
ZnJlcV9pbml0KCkvZmluaSgpIGluIGRldmljZQogIGRybS9wYW5mcm9zdDogZHluYW1pY2FsbHkg
YWxsb2MgcmVndWxhdG9ycwogIGRybS9wYW5mcm9zdDogYWRkIHJlZ3VsYXRvcnMgdG8gZGV2ZnJl
cQogIGFybTY0OiBkZWZjb25maWc6IEVuYWJsZSBkZXZmcmVxIGNvb2xpbmcgZGV2aWNlCiAgYXJt
NjQ6IGR0czogYWxsd2lubmVyOiBoNjogQWRkIGNvb2xpbmcgbWFwIGZvciBHUFUKICBbRE8gTk9U
IE1FUkdFXSBhcm02NDogZHRzOiBhbGx3aW5uZXI6IGg2OiBBZGQgR1BVIE9QUCB0YWJsZQogIFtE
TyBOT1QgTUVSR0VdIGFybTY0OiBkdHM6IGFsbHdpbm5lcjogZm9yY2UgR1BVIHJlZ3VsYXRvciB0
byBiZSBhbHdheXMKCiAuLi4vZHRzL2FsbHdpbm5lci9zdW41MGktaDYtYmVlbGluay1nczEuZHRz
ICAgfCAgIDEgKwogYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kg
IHwgMTAyICsrKysrKysrKysKIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgICAgICAgICAg
ICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJl
cS5jICAgfCAxNzUgKysrKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZGV2ZnJlcS5oICAgfCAgMzAgKystCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZGV2aWNlLmMgICAgfCAgNjEgKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfZGV2aWNlLmggICAgfCAgMTQgKy0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kcnYuYyAgICAgICB8ICAxNSArLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2pvYi5jICAgICAgIHwgIDEwICstCiA5IGZpbGVzIGNoYW5nZWQsIDI5NiBpbnNl
cnRpb25zKCspLCAxMTMgZGVsZXRpb25zKC0pCgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
