Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D9F2DB1B
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 12:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843766E0A5;
	Wed, 29 May 2019 10:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7CF6E0A5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:56:42 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 20so276106pgr.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 03:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QlH+bdDvrGkuMtx4C8zLdS+VSlbI3yCzUmJWnWewlAQ=;
 b=Mii4PC6QrfzRNDS7v1zTMp49IPRIsIniv80mbvATR13NTvAxHlXI9KLHlbG+nauSlD
 Q2QYMueHrVCn1LA8TkBIXd8DUNFidFZEZ/nm2vApKRXfKos6pfjlhrXX42zzLzn3Q3ui
 Pjcxvkq1Eem8VvYtpFbLLE4H3AtG4Vfp8GrHv6P89Jjk0SPStS9JRL7RuBNavLPTPsb5
 x1X8uj+Z/hNtPWB+QVqIZ6MCfTrjfNN7xVU+bX/ygcLo6LQ26DZjg/ezRLwnbbujx7MG
 nYLTAGW5kjgKixcpltPDuPOkWnvKx5ocFJcHGQxBhEfjdcOHDzEALnALbAe3+FPER3dQ
 pFbw==
X-Gm-Message-State: APjAAAUXQD3Y4i8jKfj/OssKdK+0gMFYXjUPEJDVq9Cta17zL+9SkBwd
 vQrVDhhyRL7yKYbMapqa7GTD8g==
X-Google-Smtp-Source: APXvYqxDCqXNYYDrNO19C8eevIbe90q34Fw+quaxpak9TU0mVV/bwLX0fPihzSEx0Ivy40x8IOR0eQ==
X-Received: by 2002:a65:5347:: with SMTP id w7mr81611008pgr.375.1559127401755; 
 Wed, 29 May 2019 03:56:41 -0700 (PDT)
Received: from localhost.localdomain ([49.206.202.218])
 by smtp.gmail.com with ESMTPSA id 184sm18974479pfa.48.2019.05.29.03.56.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 03:56:41 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/9] drm/sun4i: Allwinner A64 MIPI-DSI support
Date: Wed, 29 May 2019 16:26:06 +0530
Message-Id: <20190529105615.14027-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QlH+bdDvrGkuMtx4C8zLdS+VSlbI3yCzUmJWnWewlAQ=;
 b=kfGgahWwlz5uJSHrLWZExXhJWc3KlK4MMXhmTTh+sXSy+X+iDvCc5QAhKKrMul3hax
 A06X6vN8umwMZrLMbJigUxxvoiTdMo+G+G+zXKocEc+mu6DeVbKjcbgn9OkfVFbM7Fmz
 EhJ6p3maCAEB1pecz9FsYfm3piVA8gqN4OxNs=
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
Cc: devicetree@vger.kernel.org, Ryan Pannell <ryan@osukl.com>,
 bshah@mykolab.com, linux-sunxi@googlegroups.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Sergey Suloev <ssuloev@orpaltech.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyB2OSB2ZXJzaW9uIGZvciBBbGx3aW5uZXIgQTY0IE1JUEktRFNJIHN1cHBvcnQKYW5k
IGhlcmUgaXMgdGhlIHByZXZpb3VzIHZlcnNpb24gc2V0WzFdLgoKVGhpcyBkZXBlbmRzIG9uIGRz
aSBob3N0IGNvbnRyb2xsZXIgZml4ZXMgd2hpY2ggd2VyZQpzdXBwb3J0ZWQgaW4gdGhpcyBzZXJp
ZXNbMl0uCgpBbGwgdGhlc2UgY2hhbmdlcyBhcmUgdGVzdGVkIGluIEFsbHdpbm5lciBBNjQgd2l0
aAoyLCA0IGxhbmVzIGRldmljZXMgYW5kIHdob3NlIHBpeGVsIGNsb2NrcyBhcmUgMjcuNSBNSHos
CjMwTUh6LCA1NU1IeiBhbmQgMTQ3TUh6LgoKQ2hhbmdlcyBmb3Igdjk6Ci0gbW92ZWQgZHNpIGZp
eGVzIGluIHNlcGFyYXRlIHNlcmllcyBvbiB0b3Agb2YgQTMzIFsyXQotIHJlYmFzZSBvbiBsaW51
eC1uZXh0IGFuZCBvbiB0b3Agb2YgWzJdCkNoYW5nZXMgZm9yIHY4OgotIHJlYmFzZWQgb24gZHJt
LW1pc2MgY2hhbmdlIGFsb25nIHdpdGggbGludXgtbmV4dAotIHJld29ya2VkIHZpZGVvIHN0YXJ0
IGRlbGF5IHBhdGNoCi0gdGVzdGVkIG9uIDQgZGlmZmVyZW50IGRzaSBwYW5lbHMKLSByZXdvcmtl
ZCBjb21taXQgbWVzc2FnZXMKQ2hhbmdlcyBmb3Igdjc6Ci0gbW92ZWQgdmNjLWRzaSBiaW5kaW5n
IHRvIHJlcXVpcmVkIGZpbGVkLgotIGRyb3AgcXVvdGVzIG9uIGZhbGxiYWNrIGRwaHkgYmluZGlu
Z3MuCi0gZHJvcCBtaW5fcmF0ZSBjbG9jayBwbGwtbWlwaSBwYXRjaGVzLgotIGludHJvZHVjZSBk
Y2xrIGRpdmlkZXIgY29tcHV0YXRpb24gYXMgbGlrZSBBNjQgQlNQLgotIGFkZCBBNjQgRFNJIHF1
YXJrIHBhdGNoZXMuCi0gZml4ZWQgQTY0IERTSSBwaXBlbGluZS4KLSBhZGQgcHJvcGVyIGNvbW1p
dCBtZXNzYWdlcy4KLSBjb2xsZWN0IE1lcmxpam4gV2FqZXIgVGVzdGVkLWJ5IGNyZWRpdHMuCkNo
YW5nZXMgZm9yIHY2OgotIGRyb3BwZWQgdW5uZWVkZWQgY2hhbmdlcywgcGF0Y2hlcwotIGZpeGVk
IGFsbCBidXJzdCBtb2RlIHBhdGNoZXMgYXMgcGVyIHByZXZpb3VzIHZlcnNpb24gY29tbWVudHMK
LSByZWJhc2Ugb24gbWFzdGVyCi0gdXBkYXRlIHByb3BlciBjb21taXQgbWVzc2FnZQotIGRyb3Bw
ZWQgdW5uZWVkZWQgY29tbWVudHMKLSBvcmRlciB0aGUgcGF0Y2hlcyB0aGF0IG1ha2UgcmV2aWV3
IGVhc3kKQ2hhbmdlcyBmb3IgdjU6Ci0gY29sbGVjdCBSb2IsIEFja2VkLWJ5Ci0gZHJvcGVkICJG
aXggVkJQIHNpemUgY2FsY3VsYXRpb24iIHBhdGNoCi0gdXBkYXRlZCB2YmxrIHRpbWluZyBjYWxj
dWxhdGlvbi4KLSBkcm9wZWQgdGVjaHN0YXIsIGJhbmFuYXBpIGRzaSBwYW5lbCBkcml2ZXJzIHdo
aWNoIG1heSByZXF1aXJlCiAgYnJpZGdlIG9yIG90aGVyIHNldHVwLiBpdCdzIHVuZGVyIGRpc2N1
c3Npb24uCkNoYW5nZXMgZm9yIHY0OgotIGRyb3Bwb2VkIHVudGVzdGVkIENDVV9GRUFUVVJFX0ZJ
WEVEX1BPU1RESVYgY2hlY2sgY29kZSBpbgogIG5rbSBtaW4sIG1heCByYXRlIHBhdGNoZXMKLSBj
cmVhdGUgdHdvIHBhdGNoZXMgZm9yICJBZGQgQWxsd2lubmVyIEE2NCBNSVBJIERTSSBzdXBwb3J0
IgogIG9uZSBmb3IgaGFzX21vZF9jbGsgcXVpcmsgYW5kIG90aGVyIG9uZSBmb3IgQTY0IHN1cHBv
cnQKLSB1c2UgZXhpc3RpbmcgZHJpdmVyIGNvZGUgY29uc3RydWN0IGZvciBoYmxrIGNvbXB1dGF0
aW9uCi0gZHJvcHBlZCAiSW5jcmVhc2UgaGZwIHBhY2tldCBvdmVyaGVhZCIgcGF0Y2ggWzJdLCB0
aG91Z2ggQlNQIGFkZGVkCiAgdGhpcyBidXQgd2UgaGF2ZSBubyBpc3N1ZXMgYXMgb2Ygbm93Lgog
IChubyBpc3N1ZXMgb24gcGFuZWwgc2lkZSB3L28gdGhpcyBjaGFuZ2UpCi0gY3JlYXRlIHNlcGFy
YXRlIGZ1bmN0aW9uIGZvciB2YmxrIGNvbXB1dGF0aW9uIAotIGVuYWJsZSB2Y2MtZHNpIHJlZ3Vs
YXRvciBpbiBkc2lfcnVudGltZV9yZXN1bWUKLSBjb2xsZWN0IFJvYiwgQWNrZWQtYnkKLSB1cGRh
dGUgTUFJTlRBSU5FUlMgZmlsZSBmb3IgcGFuZWwgZHJpdmVycwotIGNsZWFudXAgY29tbWl0IG1l
c3NhZ2VzCi0gZml4ZWQgY2hlY2twYXRjaCB3YXJuaW5ncy9lcnJvcnMKClsxXSBodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzU3ODM0LwpbMl0gaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MDg0Ny8KCkphZ2FuIFRla2kgKDkpOgogIGR0LWJp
bmRpbmdzOiBzdW42aS1kc2k6IEFkZCBBNjQgTUlQSS1EU0kgY29tcGF0aWJsZQogIGR0LWJpbmRp
bmdzOiBzdW42aS1kc2k6IEFkZCBBNjQgRFBIWSBjb21wYXRpYmxlICh3LyBBMzEgZmFsbGJhY2sp
CiAgZHJtL3N1bjRpOiBkc2k6IEFkZCBoYXNfbW9kX2NsayBxdWlyawogIGRybS9zdW40aTogZHNp
OiBBZGQgQWxsd2lubmVyIEE2NCBNSVBJIERTSSBzdXBwb3J0CiAgYXJtNjQ6IGR0czogYWxsd2lu
bmVyOiBhNjQ6IEFkZCBNSVBJIERTSSBwaXBlbGluZQogIGFybTY0OiBkdHM6IGFsbHdpbm5lcjog
YTY0LWFtYXJ1bGEtcmVsaWM6IEFkZCBUZWNoc3RhciBUUzg1NTBCIE1JUEktRFNJIHBhbmVsCiAg
W0RPIE5PVCBNRVJHRV0gYXJtNjQ6IGR0czogYWxsd2lubmVyOiBiYW5hbmFwaS1tNjQ6IEVuYWJs
ZSBCYW5hbmFwaSBTMDcwV1YyMC1DVDE2IERTSSBwYW5lbAogIFtETyBOT1QgTUVSR0VdIGFybTY0
OiBkdHM6IGFsbHdpbm5lcjogYTY0LXBpbmU2NC1sdHM6IEVuYWJsZSBGZWl5YW5nIEZZMDcwMjRE
STI2QTMwLUQgRFNJIHBhbmVsCiAgW0RPIE5PVCBNRVJHRV0gYXJtNjQ6IGR0czogYWxsd2lubmVy
OiBvY2VhbmljLTUyMDUtNWlubWZkOiBFbmFibGUgTWljcm90ZWNoIE1URjA1MEZIREktMDMgcGFu
ZWwKCiAuLi4vYmluZGluZ3MvZGlzcGxheS9zdW54aS9zdW42aS1kc2kudHh0ICAgICAgfCAgMiAr
CiAuLi4vYWxsd2lubmVyL3N1bjUwaS1hNjQtYW1hcnVsYS1yZWxpYy5kdHMgICAgfCAzNSArKysr
KysrKysrKysrCiAuLi4vZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LWJhbmFuYXBpLW02NC5kdHMg
fCAzMSArKysrKysrKysrKysKIC4uLi9zdW41MGktYTY0LW9jZWFuaWMtNTIwNS01aW5tZmQuZHRz
ICAgICAgICB8IDQ5ICsrKysrKysrKysrKysrKysrKysKIC4uLi9hbGx3aW5uZXIvc3VuNTBpLWE2
NC1zb3BpbmUtYmFzZWJvYXJkLmR0cyB8IDMxICsrKysrKysrKysrKwogYXJjaC9hcm02NC9ib290
L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC5kdHNpIHwgMzggKysrKysrKysrKysrKysKIGRyaXZl
cnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jICAgICAgICB8IDQ1ICsrKysrKysrKysr
Ky0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuaCAgICAgICAgfCAg
NSArKwogOCBmaWxlcyBjaGFuZ2VkLCAyMjUgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
CgotLSAKMi4xOC4wLjMyMS5nZmZjNmZhMGUzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
