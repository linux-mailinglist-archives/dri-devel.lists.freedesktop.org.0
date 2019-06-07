Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BABEB3A5BC
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A1D8932E;
	Sun,  9 Jun 2019 12:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0D2890E8;
 Fri,  7 Jun 2019 22:10:57 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id i21so3019799ljj.3;
 Fri, 07 Jun 2019 15:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KJ2BLcajVixF67CJRoLG0re1JrYiYqxErMSXYl0tsRw=;
 b=lePog0geU/Qrx2seMZlqtoIVPjt+5SP1dxqiQlD6s0Qn9MlKV8IvH7e8ZjoeaonNwa
 bwfwIU4uisUvRW5b91AsppzB6zjDHaJgz65vLZp1EC0NkNxxORbz6bMUY3T0oUbXI/dp
 EgGn8tGgoeWbthO58M8ef4PK4dhMZ4H8coN81mtxoPPglaXhQhHyhuQydI2PmsLKGYg/
 ZFUctR73K5gmRuv+dkcbWIepZVQgdHNTHr3E+zqD/NU3BHk4dtMTKjBb5HbdQ19XHjVr
 js8KL5ZGB4r8xTBHkbSeuNMIpmBiBb8J0yTOqdz0Oa9tC3wPlDePjrssb1Gs0Zq5um39
 QJiw==
X-Gm-Message-State: APjAAAUzc59nVFMy8odzYE2pX7cj81udPbaaNnJzwAZ5m7vUP1+gZ262
 i5ZOOeIJPtmeVlsueWmfPJQjajtZMZOpYPlWRdE=
X-Google-Smtp-Source: APXvYqziLCb0F1leUAaa1UiZwsg3YnrP4quS0pn+HDEfTbgIMU+w+qLFrO34EBW5m2sppHV711BE8EPBCVYV8kHdz3g=
X-Received: by 2002:a2e:3912:: with SMTP id g18mr20425063lja.38.1559945456292; 
 Fri, 07 Jun 2019 15:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-8-jgg@ziepe.ca>
In-Reply-To: <20190606184438.31646-8-jgg@ziepe.ca>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Sat, 8 Jun 2019 03:46:00 +0530
Message-ID: <CAFqt6zbPYWiV+2d7-o8EYACKKM2s_M7U=9j3pRux1OWsEqrQAQ@mail.gmail.com>
Subject: Re: [PATCH v2 hmm 07/11] mm/hmm: Use lockdep instead of comments
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KJ2BLcajVixF67CJRoLG0re1JrYiYqxErMSXYl0tsRw=;
 b=XuBNVLdgbcY56Ud4pdH5EXvxmGUKkACohMhQU5klJr5o3160jnTXt0fFBjrUYI8cwP
 qecWlqIvuoz0yWBNmcfBXRagMuyCN57WmUDAmyLBAoGU/vidUSxhCkBsLMXMAH3gz4EM
 tWZ1AvPkv98MPJtshU6r4aCzmSJMbti0XAF/zuBjkobX6oY2h/G+vb0ik5Hw5N96rvpl
 6I3l+tkrVJzURiq0H50JHF2DmIxfH/WItDgvQ/p6+kMn6jvKrdwRXX3GqUJ8EGr+IbP6
 8uKRI0Z+Ms/ak/i4ugiXOgxFVoAHcF4ZSdzDMKgNGJtjX6zHgettmLUAxF9t1zYsva3u
 aXCQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, Linux-MM <linux-mm@kvack.org>,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gNywgMjAxOSBhdCAxMjoxNSBBTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+
Cj4KPiBTbyB3ZSBjYW4gY2hlY2sgbG9ja2luZyBhdCBydW50aW1lLgoKTGl0dGxlIG1vcmUgZGVz
Y3JpcHRpdmUgY2hhbmdlIGxvZyB3b3VsZCBiZSBoZWxwZnVsLgpBY2tlZC1ieTogU291cHRpY2sg
Sm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24g
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IFJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlz
c2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiAtLS0KPiB2Mgo+IC0gRml4IG1pc3NpbmcgJiBpbiBs
b2NrZGVwcyAoSmFzb24pCj4gLS0tCj4gIG1tL2htbS5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbW0v
aG1tLmMgYi9tbS9obW0uYwo+IGluZGV4IGY2N2JhMzI5ODNkOWYxLi5jNzAyY2Q3MjY1MWI1MyAx
MDA2NDQKPiAtLS0gYS9tbS9obW0uYwo+ICsrKyBiL21tL2htbS5jCj4gQEAgLTI1NCwxMSArMjU0
LDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX29wcyBobW1fbW11X25vdGlm
aWVyX29wcyA9IHsKPiAgICoKPiAgICogVG8gc3RhcnQgbWlycm9yaW5nIGEgcHJvY2VzcyBhZGRy
ZXNzIHNwYWNlLCB0aGUgZGV2aWNlIGRyaXZlciBtdXN0IHJlZ2lzdGVyCj4gICAqIGFuIEhNTSBt
aXJyb3Igc3RydWN0Lgo+IC0gKgo+IC0gKiBUSEUgbW0tPm1tYXBfc2VtIE1VU1QgQkUgSEVMRCBJ
TiBXUklURSBNT0RFICEKPiAgICovCj4gIGludCBobW1fbWlycm9yX3JlZ2lzdGVyKHN0cnVjdCBo
bW1fbWlycm9yICptaXJyb3IsIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ICB7Cj4gKyAgICAgICBs
b2NrZGVwX2Fzc2VydF9oZWxkX2V4Y2x1c2l2ZSgmbW0tPm1tYXBfc2VtKTsKPiArCj4gICAgICAg
ICAvKiBTYW5pdHkgY2hlY2sgKi8KPiAgICAgICAgIGlmICghbW0gfHwgIW1pcnJvciB8fCAhbWly
cm9yLT5vcHMpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+IC0tCj4gMi4yMS4w
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
