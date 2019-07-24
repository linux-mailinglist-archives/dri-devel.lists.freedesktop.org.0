Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0386174817
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74536E665;
	Thu, 25 Jul 2019 07:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B676E647
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 19:55:58 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id h6so5645375iom.7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1Sco7/Mcnd83BlhtKzamoEr69UcyH5M4+yy+9bnNAKM=;
 b=cN6yRSkY+R0QHCHNAab8YHuNlsgoSlaxpNqrRDQOX6y8H0uslUJ7EZKDAIkC3q+Bhn
 SR1CHChc+zHxhIPg/MUW+oNleaWXniBbTYbieHnAdXrsWXfId9aq/CYWj35jpEYgkog7
 LhsCAwAWxVICQxBmLMaqKT/1x62zI6lh6SWjd6dCv1i0Si0MmRJeKr/KDbirJ9PobdMk
 gjFExJdgezg2jGoWoDfM0fO9MLr7f16lZ41T67tU3UDr9eRmBIygrr7VqYjc5ARH18rK
 Z3WU9oUZChCmG+lXoTCaEQT0gxZ+pz1Y9qnD/63NNI8yHv8irVzww1DW5XiyJ5iNfLne
 faJQ==
X-Gm-Message-State: APjAAAW+vbg7U0jnW6mWLCjPs0D9OsEtpqE69nTyqkXPyg15eOIVUKw2
 XA60/xEforu6/0c3CzAqVVY=
X-Google-Smtp-Source: APXvYqy2v8zWsqu7uQpMunLNvmoxDbBoaEGUJMoqEkxgsFog2kX+6hzkt9Mg9AnrgdQTxLQiErz9gw==
X-Received: by 2002:a6b:f203:: with SMTP id q3mr29645158ioh.208.1563998158160; 
 Wed, 24 Jul 2019 12:55:58 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id l14sm42949340iob.1.2019.07.24.12.55.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 12:55:57 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: sam@ravnborg.org
Subject: [PATCH v2] drm/panel: check failure cases in the probe func
Date: Wed, 24 Jul 2019 14:55:34 -0500
Message-Id: <20190724195534.9303-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190724185933.GE22640@ravnborg.org>
References: <20190724185933.GE22640@ravnborg.org>
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1Sco7/Mcnd83BlhtKzamoEr69UcyH5M4+yy+9bnNAKM=;
 b=KLk0Wv3SBFPzgoA1kbc2bJqn82kEu4H7BRBV9Q6nO9qDFvRPxVr9CjNrioVEjlpM1Y
 uhq9hWWPqIJ/0sgyTaZ9penAhEgps3wdnKRzoqnlM3l/vpG/K8qQMFs5yCEtPoqbYfLu
 GZxoYREsayfQsYrPSLhKsLnzGJhdzY10XEpwMhGkIT5Tl6ip66gFt94Ajtoi/KxqVcxj
 pT6wUXzjSPSEW3Ppr1EY5vH0r8G/DywVyEBvocKdFIiD6eU16sc4zfMedqFfflmRxSIm
 A9JylbVbRdpg5Sxz1SxweranVQqx0B+l9w+16SZso94edNwK4d/sY7DmKXja4FC3HpxF
 Xrlg==
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
Cc: secalert@redhat.com, David Airlie <airlied@linux.ie>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, smccaman@umn.edu,
 Navid Emamdoost <navid.emamdoost@gmail.com>, emamd001@umn.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZvbGxvd2luZyBmdW5jdGlvbiBjYWxscyBtYXkgZmFpbCBhbmQgcmV0dXJuIE5VTEwsIHNv
IHRoZSBudWxsIGNoZWNrCmlzIGFkZGVkLgpvZl9ncmFwaF9nZXRfbmV4dF9lbmRwb2ludApvZl9n
cmFwaF9nZXRfcmVtb3RlX3BvcnRfcGFyZW50Cm9mX2dyYXBoX2dldF9yZW1vdGVfcG9ydAoKVXBk
YXRlOiBUaGFua3MgdG8gU2FtIFJhdm5ib3JnLCBmb3Igc3VnZ2Vzc2lvbiBvbiB0aGUgdXNlIG9m
IGdvdG8gdG8gYXZvaWQKbGVha2luZyBlbmRwb2ludC4KClNpZ25lZC1vZmYtYnk6IE5hdmlkIEVt
YW1kb29zdCA8bmF2aWQuZW1hbWRvb3N0QGdtYWlsLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9wYW5l
bC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jICAgfCAxMyArKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRvdWNoc2NyZWVuLmMKaW5kZXggMjhjMDYyMGRm
ZTBmLi5iNWIxNGFhMDU5ZWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jCkBAIC0zOTksNyArMzk5LDEzIEBAIHN0YXRp
YyBpbnQgcnBpX3RvdWNoc2NyZWVuX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICppMmMsCiAKIAkv
KiBMb29rIHVwIHRoZSBEU0kgaG9zdC4gIEl0IG5lZWRzIHRvIHByb2JlIGJlZm9yZSB3ZSBkby4g
Ki8KIAllbmRwb2ludCA9IG9mX2dyYXBoX2dldF9uZXh0X2VuZHBvaW50KGRldi0+b2Zfbm9kZSwg
TlVMTCk7CisJaWYgKCFlbmRwb2ludCkKKwkJcmV0dXJuIC1FTk9ERVY7CisKIAlkc2lfaG9zdF9u
b2RlID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9wb3J0X3BhcmVudChlbmRwb2ludCk7CisJaWYgKCFk
c2lfaG9zdF9ub2RlKQorCQlnb3RvIGVycm9yOworCiAJaG9zdCA9IG9mX2ZpbmRfbWlwaV9kc2lf
aG9zdF9ieV9ub2RlKGRzaV9ob3N0X25vZGUpOwogCW9mX25vZGVfcHV0KGRzaV9ob3N0X25vZGUp
OwogCWlmICghaG9zdCkgewpAQCAtNDA4LDYgKzQxNCw5IEBAIHN0YXRpYyBpbnQgcnBpX3RvdWNo
c2NyZWVuX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICppMmMsCiAJfQogCiAJaW5mby5ub2RlID0g
b2ZfZ3JhcGhfZ2V0X3JlbW90ZV9wb3J0KGVuZHBvaW50KTsKKwlpZiAoIWluZm8ubm9kZSkKKwkJ
Z290byBlcnJvcjsKKwogCW9mX25vZGVfcHV0KGVuZHBvaW50KTsKIAogCXRzLT5kc2kgPSBtaXBp
X2RzaV9kZXZpY2VfcmVnaXN0ZXJfZnVsbChob3N0LCAmaW5mbyk7CkBAIC00MjgsNiArNDM3LDEw
IEBAIHN0YXRpYyBpbnQgcnBpX3RvdWNoc2NyZWVuX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpp
MmMsCiAJCXJldHVybiByZXQ7CiAKIAlyZXR1cm4gMDsKKworZXJyb3I6CisJb2Zfbm9kZV9wdXQo
ZW5kcG9pbnQpOworCXJldHVybiAtRU5PREVWOwogfQogCiBzdGF0aWMgaW50IHJwaV90b3VjaHNj
cmVlbl9yZW1vdmUoc3RydWN0IGkyY19jbGllbnQgKmkyYykKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
