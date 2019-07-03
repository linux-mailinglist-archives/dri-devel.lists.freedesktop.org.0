Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E8D5F37D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D386E276;
	Thu,  4 Jul 2019 07:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4662A6E1CE
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 23:02:15 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id cl9so1993070plb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 16:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1ZrZzCDWL8uR9GukOyNtVnJ0nmZVvvWXcGkMP18atyY=;
 b=lVlu1rnN0VgRPrXq+R523ezV0WWPJQieCI4wv5e7Fx1t/raye/c++jXHyUJceIGsCF
 6IEGuyPaItGAKLskDU+e0/XlrhehR9F2NhoznpERtQiQHdZ8QO9DIUTa1EPx2yNIXh1z
 doHHK4+Ge8aZIoFqnSizFs06EBLNg4i5pIJn3iduebGNX6Qe1bmB1YKrnS4Xk4//WM/Z
 hOvED/WXSwa5l8n6oh9v8kND58jXISA1+Ck/diQMzSotpwuzSl1jepqJv6t1ziDbcT3y
 y+mOpsKta7VA7RM35bylz3aj2fJZYzUDqYqZ/YY/KwaryJehnFGlFVPBZ2ZPpCHx1WCz
 d33g==
X-Gm-Message-State: APjAAAWuX9XtG88bYWM3+QrLRMuZV4hqIXeDfCLb2B0z2YEUQ9frkx74
 kKuOoeIJWFokt+lx9ETtnZ4IHg==
X-Google-Smtp-Source: APXvYqwM3KsV4pYEtclP2v6OFHEPEkTQxv4xInN46kPm5Ul21is2Kyu5NnJ0VVIbZBrV9EgR7m7IMw==
X-Received: by 2002:a17:902:16f:: with SMTP id
 102mr43528588plb.94.1562194934905; 
 Wed, 03 Jul 2019 16:02:14 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id t8sm4245171pfq.31.2019.07.03.16.02.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 16:02:13 -0700 (PDT)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] Panel rotation patches
Date: Wed,  3 Jul 2019 16:02:06 -0700
Message-Id: <20190703230210.85342-1-dbasehore@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1ZrZzCDWL8uR9GukOyNtVnJ0nmZVvvWXcGkMP18atyY=;
 b=mtOVyYmG2IzpmlsHOH/bFwJl21qcA8lVJRKpae+DMHwii9l1x+40yEervyi7qpqpr4
 hB3hlY3oPRMK55uHK1HYswgIkYyVHxU6REHY5Rgc5rlePiDU4gDvgc2YkR5l77Prg3Cc
 W/Ejps3fU5hazueodIieCVdr1ZyHbm6gx14qQ=
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
Cc: Derek Basehore <dbasehore@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-mediatek@lists.infradead.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIHRoZSBwbHVtYmluZyBmb3IgcmVhZGluZyBwYW5lbCByb3RhdGlvbiBmcm9tIHRo
ZSBkZXZpY2V0cmVlCmFuZCBzZXRzIHVwIGFkZGluZyBhIHBhbmVsIHByb3BlcnR5IGZvciB0aGUg
cGFuZWwgb3JpZW50YXRpb24gb24KTWVkaWF0ZWsgU29DcyB3aGVuIGEgcm90YXRpb24gaXMgcHJl
c2VudC4KCnY1IGNoYW5nZXM6Ci1yZWJhc2VkCgp2NCBjaGFuZ2VzOgotZml4ZWQgc29tZSBjaGFu
Z2VzIG1hZGUgdG8gdGhlIGk5MTUgZHJpdmVyCi1jbGFyaWZpZWQgY29tbWVudHMgb24gb2Ygb3Jp
ZW50YXRpb24gaGVscGVyCgp2MyBjaGFuZ2VzOgotY2hhbmdlZCBmcm9tIGF0dGFjaC9kZXRhY2gg
Y2FsbGJhY2tzIHRvIGRpcmVjdGx5IHNldHRpbmcgZml4ZWQgcGFuZWwKIHZhbHVlcyBpbiBkcm1f
cGFuZWxfYXR0YWNoCi1yZW1vdmVkIHVwZGF0ZSB0byBEb2N1bWVudGF0aW9uCi1hZGRlZCBzZXBh
cmF0ZSBmdW5jdGlvbiBmb3IgcXVpcmtlZCBwYW5lbCBvcmllbnRhdGlvbiBwcm9wZXJ0eSBpbml0
Cgp2MiBjaGFuZ2VzOgpmaXhlZCBidWlsZCBlcnJvcnMgaW4gaTkxNQoKRGVyZWsgQmFzZWhvcmUg
KDQpOgogIGRybS9wYW5lbDogQWRkIGhlbHBlciBmb3IgcmVhZGluZyBEVCByb3RhdGlvbgogIGRy
bS9wYW5lbDogc2V0IGRpc3BsYXkgaW5mbyBpbiBwYW5lbCBhdHRhY2gKICBkcm0vY29ubmVjdG9y
OiBTcGxpdCBvdXQgb3JpZW50YXRpb24gcXVpcmsgZGV0ZWN0aW9uCiAgZHJtL210azogYWRkIHBh
bmVsIG9yaWVudGF0aW9uIHByb3BlcnR5CgogZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3Iu
YyAgICB8IDQ1ICsrKysrKysrKysrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWwu
YyAgICAgICAgfCA3MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2ludGVsX2RwLmMgICAgfCAgNCArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvdmx2
X2RzaS5jICAgICB8ICA1ICstLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8
ICA4ICsrKysKIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCAgICAgICAgfCAgMiArCiBpbmNs
dWRlL2RybS9kcm1fcGFuZWwuaCAgICAgICAgICAgIHwgMjEgKysrKysrKysrCiA3IGZpbGVzIGNo
YW5nZWQsIDEzOCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCi0tIAoyLjIyLjAuNDEw
LmdkOGZkYmUyMWI1LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
