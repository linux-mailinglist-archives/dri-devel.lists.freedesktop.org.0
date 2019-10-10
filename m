Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6429DD2A9C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 15:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14226EB33;
	Thu, 10 Oct 2019 13:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3958A6EB31;
 Thu, 10 Oct 2019 13:14:37 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id a22so6201961ljd.0;
 Thu, 10 Oct 2019 06:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XOswBCNwFK4RZCMtfErG3cL4H6/5uv1kqEZjdrVfyDI=;
 b=P3z5PqLKDv0pNd4hYzTBboHElfU/Y8Zzmu4esekZg9QzqmPmHSEjdqG6VSKt4R8QKo
 wlt2CoKFauAir4oo6EMsmjemVQmaMNLiqJi9Xm/dVRUyOGp7XgKtiJ2xg9UFKKaAq8Mr
 425XqkFE19qanwpd8klzOCGW5kakTMRsbYsX07Bfi53wHGP2j2a4iA3z8SrGw1habIUq
 1BZeRlR5Dj/7sdUTVUyPfYp2DQGeAmZ4qyYPE6ZKjz2OmhFXrI0KvaPojVeS03V0NcJp
 vZ+y+Ue5ZTJxwLpqjdIm18CkvylFLr5i6vKXspeF0v0OE2vj7XVehwoVJ88XxskjbO1U
 C60Q==
X-Gm-Message-State: APjAAAWARxnPBelO8KL2AFd0+yqS+tTzwcqKHaUW8zKdGAL2PvKnrWNU
 mTAiY9Ch2K/bjDnbHwIRcrA=
X-Google-Smtp-Source: APXvYqx7rWr//j0nU72LF17c2ZHHfzLol9DG9rI4kOgM1l87fAOHIVImVINHKm3kJUnYijQABR42Bg==
X-Received: by 2002:a05:651c:120b:: with SMTP id
 i11mr2535790lja.123.1570713275622; 
 Thu, 10 Oct 2019 06:14:35 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se.
 [85.224.241.81])
 by smtp.gmail.com with ESMTPSA id j17sm1243951lfb.11.2019.10.10.06.14.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 06:14:34 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
 (envelope-from <johan@xi.terra>)
 id 1iIYHE-0006Ag-JH; Thu, 10 Oct 2019 15:14:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>
Subject: [PATCH 0/4] treewide: fix interrupted release
Date: Thu, 10 Oct 2019 15:13:29 +0200
Message-Id: <20191010131333.23635-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Johan Hovold <johan@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VHdvIG9sZCBVU0IgZHJpdmVycyBoYWQgYSBidWcgaW4gdGhlbSB3aGljaCBjb3VsZCBsZWFkIHRv
IG1lbW9yeSBsZWFrcwppZiBhbiBpbnRlcnJ1cHRlZCBwcm9jZXNzIHJhY2VkIHdpdGggYSBkaXNj
b25uZWN0IGV2ZW50LgoKVHVybnMgb3V0IHdlIGhhZCBhIGZldyBtb3JlIGRyaXZlciBpbiBvdGhl
ciBzdWJzeXN0ZW1zIHdpdGggdGhlIHNhbWUKa2luZCBvZiBidWcgaW4gdGhlbS4KCk5vdGUgdGhh
dCBhbGwgYnV0IHRoZSBzMzkwIHBhdGNoIGhhdmUgb25seSBiZWVuIGNvbXBpbGUgdGVzdGVkLCB3
aGlsZQp0aGUgczM5MCBvbmUgaGFzIG5vdCBldmVuIGJlZW4gYnVpbHQuCgpKb2hhbgoKCkpvaGFu
IEhvdm9sZCAoNCk6CiAgZHJtL21zbTogZml4IG1lbWxlYWsgb24gcmVsZWFzZQogIG1lZGlhOiBi
ZGlzcDogZml4IG1lbWxlYWsgb24gcmVsZWFzZQogIG1lZGlhOiByYWRpbzogd2wxMjczOiBmaXgg
aW50ZXJydXB0IG1hc2tpbmcgb24gcmVsZWFzZQogIHMzOTAvemNyeXB0OiBmaXggbWVtbGVhayBh
dCByZWxlYXNlCgogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZGVidWdmcy5jICAgICAgICAgICAg
IHwgNiArLS0tLS0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RpL2JkaXNwL2JkaXNwLXY0bDIu
YyB8IDMgKy0tCiBkcml2ZXJzL21lZGlhL3JhZGlvL3JhZGlvLXdsMTI3My5jICAgICAgICAgICAg
fCAzICstLQogZHJpdmVycy9zMzkwL2NyeXB0by96Y3J5cHRfYXBpLmMgICAgICAgICAgICAgIHwg
MyArLS0KIDQgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkK
Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
