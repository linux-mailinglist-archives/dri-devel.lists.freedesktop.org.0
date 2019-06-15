Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7E4474F8
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40182891C7;
	Sun, 16 Jun 2019 14:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FDC892A6
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 18:46:16 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id i2so2400612plt.1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 11:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=Q9xlD/PMmlRpTb0ClhryMiAZbh/ulahVS83HmPg/ll0=;
 b=GbMTWA1B0bw1XwV/yFD633B/HSIU7ZmuJn4Pqtaye9fyxtcUmDRxjZQw49KS/6x4kU
 wH7tMIcgOmyoN6w63LwbxgFIieN55TA/NPUz/30IylX/WtpE1Wf117NhV3Yvl94t3aGx
 OKXUiRJTv9GvyDKOC7a4GFl4B6GeKXqBlJM26fXLBRqZRr2/at/n3qkqsbKqh71PALkc
 Gmhqp4K+wV9oD7Dix+YnxKt8Kf4beCQpxXgVwRd+OxOjiqtJDzKPGdGxc6o/ljKCc7a2
 svq84M87Nvzfw3kCFrmU5kOyZ8UWL3cIlKI5S5Qyc68UaizwKO19CMfMeDyekV6BbNRM
 ulXQ==
X-Gm-Message-State: APjAAAU5zuMX98RzhmlCY/GXPoN0bTHV5konEwuRm8T4eEQlJ7Q22SAk
 fEGx+Vg0vzjx35HUKWyepaY=
X-Google-Smtp-Source: APXvYqwof/KsTSgkJK+UHE5W1/WJWDmcbF7iZNu03WZhoyF6SCt9d5fX/4h9xflcy6Ja/WDgMMjqXQ==
X-Received: by 2002:a17:902:1003:: with SMTP id
 b3mr100910157pla.172.1560624376144; 
 Sat, 15 Jun 2019 11:46:16 -0700 (PDT)
Received: from ahmlpt0706 ([106.222.0.33])
 by smtp.gmail.com with ESMTPSA id e127sm6904708pfe.98.2019.06.15.11.46.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 15 Jun 2019 11:46:15 -0700 (PDT)
Date: Sun, 16 Jun 2019 00:16:05 +0530
From: Saiyam Doshi <saiyamdoshi.in@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v1] staging: android: fix style problem
Message-ID: <20190615184605.GA7671@ahmlpt0706>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=Q9xlD/PMmlRpTb0ClhryMiAZbh/ulahVS83HmPg/ll0=;
 b=f9DMJRaoP422r3TGdX0uSeRtbGx1LPK+2y6lr/3+UjelE6sQdpsqigsJyqbLi2dp+0
 BQJfJ54nZQKUvbRQLAvhvCccIv059jlCKg3pm5iCxXTr0dIZ60a1qSxJFflbVKV+4VsA
 4Wd0k+O+l/qGeJQ7WFCwVNUZU9tgQ5YUdXRBHZhe7El3jgrJVpxEFswtor5s/DVuOAIC
 kIVkMzUXIR/J/6qS0pJm0Zt2IDvJT1lAQfPdXWpaNf2iHxxksf4n6rXC/COKjil4V4/n
 hcAgLNB7fhptlcaaDVbnU5ZBJsHYmOEXugajBmuKiH/wzDK0zpXrMCK+aHsJMIknJVbf
 l7zg==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y2hlY2twYXRjaCByZXBvcnRlZCAiV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMiLgpU
aGlzIHBhdGNoIGZpeGVzIGl0IGJ5IGFsaWduaW5nIGZ1bmN0aW9uIGFyZ3VtZW50cy4KClNpZ25l
ZC1vZmYtYnk6IFNhaXlhbSBEb3NoaSA8c2FpeWFtZG9zaGkuaW5AZ21haWwuY29tPgotLS0KQ2hh
bmdlcyBpbiB2MToKKiBVcGRhdGVkIGFzIHBlciByZXZpZXcgY29tbWVudC4gTm93IGZ1bmN0aW9u
IGFyZ3VtZW50cwogIHVzZXMgdHdvIGxpbmVzLCBvbmUgbGVzcyBsaW5lIHRoYW4gcHJldmlvdXMg
c3VibWlzc2lvbi4KCiBkcml2ZXJzL3N0YWdpbmcvYW5kcm9pZC9pb24vaW9uX2NodW5rX2hlYXAu
YyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbl9jaHVua19oZWFw
LmMgYi9kcml2ZXJzL3N0YWdpbmcvYW5kcm9pZC9pb24vaW9uX2NodW5rX2hlYXAuYwppbmRleCAz
Y2RkZTljMWE3MTcuLjFlODY5ZjRiYWQ0NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2Fu
ZHJvaWQvaW9uL2lvbl9jaHVua19oZWFwLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQv
aW9uL2lvbl9jaHVua19oZWFwLmMKQEAgLTEwNyw3ICsxMDcsOCBAQCBzdGF0aWMgc3RydWN0IGlv
bl9oZWFwX29wcyBjaHVua19oZWFwX29wcyA9IHsKIAkudW5tYXBfa2VybmVsID0gaW9uX2hlYXBf
dW5tYXBfa2VybmVsLAogfTsKIAotc3RydWN0IGlvbl9oZWFwICppb25fY2h1bmtfaGVhcF9jcmVh
dGUocGh5c19hZGRyX3QgYmFzZSwgc2l6ZV90IHNpemUsIHNpemVfdCBjaHVua19zaXplKQorc3Ry
dWN0IGlvbl9oZWFwICppb25fY2h1bmtfaGVhcF9jcmVhdGUocGh5c19hZGRyX3QgYmFzZSwgc2l6
ZV90IHNpemUsCisJCQkJICAgICAgIHNpemVfdCBjaHVua19zaXplKQogewogCXN0cnVjdCBpb25f
Y2h1bmtfaGVhcCAqY2h1bmtfaGVhcDsKIAlpbnQgcmV0OwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
