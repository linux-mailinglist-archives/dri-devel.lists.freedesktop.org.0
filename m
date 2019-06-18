Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C952D49797
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 04:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A116F6E0D0;
	Tue, 18 Jun 2019 02:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1E76E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 02:43:54 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id d15so7606046qkl.4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 19:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nX4Lct0hRbElfJ7uVhNvumeaI9+AxXzXyu4vjSUGo1M=;
 b=NyW8uNsvoBAo9ol7oW8It9hZpcW9GdasMk+1oHnrK57Fe4XObA77kkdRbRGhFSfJzq
 JGx687YDlp+NCm9kDX9F4XqpL6JHLRqNflN1sH9IMNiAY2XdJpBaQG0kZAj4Vq5Oq3ku
 urX/r+K8HqnCRVZ1l1em1h1NUKhQlhhZCW1DD4cE6ysxKh82lT8PBQ88AXpZbLLC2OF4
 v+hVErysCUClSdIBjq0AbjRi017HUrp20S3gZzGudLHMKzluYgOreHhqgCrY5gYzdGPP
 T/GKn27Nm5e8+ffflNEulGI6FzkY3LLhWGDHfYGIJccY0odC1zto/y0MHBcMT/LGbjXh
 4SNg==
X-Gm-Message-State: APjAAAUT65cejgkpWymbIsGwr6bZ1LM9HuSM6as/RthEjgRgiJwEgDXr
 oBojzoyqw3PR22NjTlTSp1w=
X-Google-Smtp-Source: APXvYqxaHjMOISQ9guRRmzpA9K7fPxEPwKahaqRJEEU3Oyiu+UsHUkxZRTlsd8Vnef+dSkF65wG1AA==
X-Received: by 2002:a05:620a:1407:: with SMTP id
 d7mr80111271qkj.20.1560825833481; 
 Mon, 17 Jun 2019 19:43:53 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id n10sm7926370qke.72.2019.06.17.19.43.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 19:43:53 -0700 (PDT)
Date: Mon, 17 Jun 2019 23:43:48 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Brian Starkey <brian.starkey@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simon Ser <contact@emersion.fr>
Subject: [PATCH V2 2/5] drm/vkms: Rename crc_enabled to composer_enabled
Message-ID: <1ac8e97f5884ad441e849c0399cd48ed8b6df5cb.1560820888.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1560820888.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1560820888.git.rodrigosiqueiramelo@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nX4Lct0hRbElfJ7uVhNvumeaI9+AxXzXyu4vjSUGo1M=;
 b=j8VmLcSzvjdb/VBg88RycwCMFYoVkDiyB70BREVjLnI/rS6u7tf/YgKFXMOIV7OKHB
 8VPlv8dGUplv7FJGFKjN0ABKXZMTHe41UEEUvXk6p7BtBJZ1D6szk37oWN7ZKgb6Qpgs
 14eohDBOf87aorOYeSkujUDc9oX9h/+dDCOLawoClLJ1qfRQdTMak3OFX9iG9F0V/0c8
 pr4tRwousOtxRo2gbdlnWu2B/kvd0Zb8f3dUepLMfPlrKHRceNrLX1w8uGZm8u3G7ics
 lXf2VT2u2YBom8lUs7lotfXTJ+wwuUioh1iqUgoaA2DrZoztAYGlDE7lMHuMIs+cmOAj
 FSZQ==
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

UmVuYW1lIGNyY19lbmFibGVkIHRvIGNvbXBvc2VyX2VuYWJsZWQgc2luY2UgaXQgZG9lcyBtb3Jl
IHRoYW4ganVzdApjb21wdXRlIGEgQ1JDLgoKU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBTaXF1ZWly
YSA8cm9kcmlnb3NpcXVlaXJhbWVsb0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Zr
bXMvdmttc19jcmMuYyAgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NydGMuYyB8
IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmggIHwgMiArLQogMyBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNf
Y3JjLmMKaW5kZXggM2M2YTM1YWJhNDk0Li44YjIxNTY3NzU4MWYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS92a21zL3ZrbXNfY3JjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmtt
c19jcmMuYwpAQCAtMTY1LDcgKzE2NSw3IEBAIGludCB2a21zX3NldF9jcmNfc291cmNlKHN0cnVj
dCBkcm1fY3J0YyAqY3J0YywgY29uc3QgY2hhciAqc3JjX25hbWUpCiAJcmV0ID0gdmttc19jcmNf
cGFyc2Vfc291cmNlKHNyY19uYW1lLCAmZW5hYmxlZCk7CiAKIAlzcGluX2xvY2tfaXJxKCZvdXQt
PmxvY2spOwotCW91dC0+Y3JjX2VuYWJsZWQgPSBlbmFibGVkOworCW91dC0+Y29tcG9zZXJfZW5h
YmxlZCA9IGVuYWJsZWQ7CiAJc3Bpbl91bmxvY2tfaXJxKCZvdXQtPmxvY2spOwogCiAJcmV0dXJu
IHJldDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3J0Yy5jIGIvZHJp
dmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMKaW5kZXggMTQxNTZlZDcwNDE1Li4yNGEzZmYw
ZjdmZjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3J0Yy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3J0Yy5jCkBAIC0yNSw3ICsyNSw3IEBAIHN0YXRp
YyBlbnVtIGhydGltZXJfcmVzdGFydCB2a21zX3ZibGFua19zaW11bGF0ZShzdHJ1Y3QgaHJ0aW1l
ciAqdGltZXIpCiAJCURSTV9FUlJPUigidmttcyBmYWlsdXJlIG9uIGhhbmRsaW5nIHZibGFuayIp
OwogCiAJc3RhdGUgPSBvdXRwdXQtPmNyY19zdGF0ZTsKLQlpZiAoc3RhdGUgJiYgb3V0cHV0LT5j
cmNfZW5hYmxlZCkgeworCWlmIChzdGF0ZSAmJiBvdXRwdXQtPmNvbXBvc2VyX2VuYWJsZWQpIHsK
IAkJdTY0IGZyYW1lID0gZHJtX2NydGNfYWNjdXJhdGVfdmJsYW5rX2NvdW50KGNydGMpOwogCiAJ
CS8qIHVwZGF0ZSBmcmFtZV9zdGFydCBvbmx5IGlmIGEgcXVldWVkIHZrbXNfY3JjX3dvcmtfaGFu
ZGxlKCkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmggYi9kcml2
ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5oCmluZGV4IDRlNzQ1MDExMWQ0NS4uYTg4N2MwNWZm
NzBlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmgKQEAgLTcyLDcgKzcyLDcgQEAgc3RydWN0IHZr
bXNfb3V0cHV0IHsKIAlzcGlubG9ja190IGxvY2s7CiAKIAkvKiBwcm90ZWN0ZWQgYnkgQGxvY2sg
Ki8KLQlib29sIGNyY19lbmFibGVkOworCWJvb2wgY29tcG9zZXJfZW5hYmxlZDsKIAlzdHJ1Y3Qg
dmttc19jcnRjX3N0YXRlICpjcmNfc3RhdGU7CiAKIAlzcGlubG9ja190IGNyY19sb2NrOwotLSAK
Mi4yMS4wCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
