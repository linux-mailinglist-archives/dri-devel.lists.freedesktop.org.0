Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B93CC0641
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 15:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E3C6E0CA;
	Fri, 27 Sep 2019 13:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87806E07B;
 Fri, 27 Sep 2019 13:25:01 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f22so6167141wmc.2;
 Fri, 27 Sep 2019 06:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hqb9k7CsU/G/nVYRGrmqBtdjrD4Otzmj8zLAjpaRg4I=;
 b=qT0D27TaY7VYubQwB0xYTiy2GWfWaPU/JWlIM6pdXslT+ojrTWoeWQT5HSwiEVkzei
 d86NmHqVk/IxkteUMsggm3otlf3LynmtLxR0ua7tJNHNg3Mtl/W6Fwe483iWpvKLiHMu
 BEOMzcuTRbfI5idjl58/T+W3jHWKckiFZosw6++2Sls93kjpOGwJE3f36mqGmieb0iHE
 AH+CRakJCXjVCx76H4eGu+35094By+gvty/iduHmIh2/U2BqfPOhM9THyVtQOQ55yGjw
 jOGcNxol2WlJWzIwX+6QY1DATACoKHMeWC4NUW8aw3w9VrRWWnWqG/RfZ8y1Lb6s/E3m
 zMvQ==
X-Gm-Message-State: APjAAAU+bixpiaxgygasVji3wwA2j8C7BvPmcPn4KLAz9LhhhLUU3gUp
 4CdOxucdRg6t2mGYy56MXZI=
X-Google-Smtp-Source: APXvYqxEoZGnO1+n0+Vq/UvgJhTpTguJmPPHgyx5aP+8nWVrR0zZhBCNmCtrt+uo5iqP23Htuno/BA==
X-Received: by 2002:a05:600c:2:: with SMTP id g2mr7206199wmc.111.1569590700582; 
 Fri, 27 Sep 2019 06:25:00 -0700 (PDT)
Received: from baker.fritz.box ([2a02:908:1252:fb60:2d04:d861:e9c6:56ab])
 by smtp.gmail.com with ESMTPSA id z3sm4917181wmi.30.2019.09.27.06.24.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 06:25:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: airlied@redhat.com, kraxel@redhat.com, daniel@ffwll.ch,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/ttm: stop exporting ttm_mem_io_* functions
Date: Fri, 27 Sep 2019 15:24:58 +0200
Message-Id: <20190927132458.4359-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20190927132458.4359-1-christian.koenig@amd.com>
References: <20190927132458.4359-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hqb9k7CsU/G/nVYRGrmqBtdjrD4Otzmj8zLAjpaRg4I=;
 b=MIKKt3ECzcv4htc0rEcnds1akEDo7vZDI8/l0IQaeNFKvrflzzHIoPNdOwcB8d9iuI
 t+3e8qVpSqL4DkpVNiDJjL8TJghlfTJQJxhjqFlrVOkI6eVRPtEEYnwCl1/3f9qa/hjD
 FNPg0yDQUv+6l3+Osqs9CU6CpC3noXS2ebv02riq8b/Q5SnT0dTxggw1F6pouZWU2CnF
 D3LsMMtud5pfl1sFK2HPx49sb1lxel2N/lXSQBHiYxjDBj4v6scRlgeakuYUgp6+a/Eu
 PdQfVsN2o4rMhXWhsWDyn54vRMhe09k5nXVMgZDHXXPjvHvJh29XxnzGtEkIGM9CX/17
 Ew/Q==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhvc2UgYXJlIG5vdCBzdXBwb3NlZCB0byBiZSB1c2VkIGJ5IGRyaXZlcnMuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jIHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191
dGlsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKaW5kZXggMDg2YmEyYzJm
NjBiLi4yZWNhNzUyYzM5ZTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3V0aWwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKQEAgLTEwMiw3
ICsxMDIsNiBAQCBpbnQgdHRtX21lbV9pb19sb2NrKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdl
ciAqbWFuLCBib29sIGludGVycnVwdGlibGUpCiAJbXV0ZXhfbG9jaygmbWFuLT5pb19yZXNlcnZl
X211dGV4KTsKIAlyZXR1cm4gMDsKIH0KLUVYUE9SVF9TWU1CT0wodHRtX21lbV9pb19sb2NrKTsK
IAogdm9pZCB0dG1fbWVtX2lvX3VubG9jayhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1h
bikKIHsKQEAgLTExMSw3ICsxMTAsNiBAQCB2b2lkIHR0bV9tZW1faW9fdW5sb2NrKHN0cnVjdCB0
dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuKQogCiAJbXV0ZXhfdW5sb2NrKCZtYW4tPmlvX3Jlc2Vy
dmVfbXV0ZXgpOwogfQotRVhQT1JUX1NZTUJPTCh0dG1fbWVtX2lvX3VubG9jayk7CiAKIHN0YXRp
YyBpbnQgdHRtX21lbV9pb19ldmljdChzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbikK
IHsKQEAgLTE1Myw3ICsxNTEsNiBAQCBpbnQgdHRtX21lbV9pb19yZXNlcnZlKHN0cnVjdCB0dG1f
Ym9fZGV2aWNlICpiZGV2LAogCX0KIAlyZXR1cm4gcmV0OwogfQotRVhQT1JUX1NZTUJPTCh0dG1f
bWVtX2lvX3Jlc2VydmUpOwogCiB2b2lkIHR0bV9tZW1faW9fZnJlZShzdHJ1Y3QgdHRtX2JvX2Rl
dmljZSAqYmRldiwKIAkJICAgICBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSkKQEAgLTE2OSw3ICsx
NjYsNiBAQCB2b2lkIHR0bV9tZW1faW9fZnJlZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwK
IAkJYmRldi0+ZHJpdmVyLT5pb19tZW1fZnJlZShiZGV2LCBtZW0pOwogCiB9Ci1FWFBPUlRfU1lN
Qk9MKHR0bV9tZW1faW9fZnJlZSk7CiAKIGludCB0dG1fbWVtX2lvX3Jlc2VydmVfdm0oc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0ICpibykKIHsKLS0gCjIuMTQuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
