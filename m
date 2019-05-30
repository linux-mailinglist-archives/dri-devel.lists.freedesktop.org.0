Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDDE30052
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 18:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97516E3B2;
	Thu, 30 May 2019 16:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B036E39E;
 Thu, 30 May 2019 16:00:51 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id a3so2278378pgb.3;
 Thu, 30 May 2019 09:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bYX12SEdJ0+DHu8wxAtEZ8Fdfnu9OWYVoolYKJBBX5M=;
 b=kHZCJbOX+HLfoEh4IhAJOBBF+Ymlhw6H3eb9Apb22QxDr3g4HeDohTLOhvmfEEQk7k
 MriVV47lVQwSaHCOhPy6C841uPzbtY8bwaynVxao2YNj9VElh2dV93Vhduz6RSzDSVfT
 B+H0TbWoz1gzke+RziFty5pq/VDT6lZh41snwXUT2BZhqTC/wRxP8lP2V0k2v2d1o2Sd
 PSu/V+Rk6LBe4DKS1NTpUeZgNI0qM52Jy3pByx/onSpUhN4otB/01a4olk/8g0pxogyk
 8DBMDBP5U37UZetepUvGQnxVbhe590dS633HxyOOvh71zn8ewlbGe0yZAInO04MTR39i
 wdDA==
X-Gm-Message-State: APjAAAVRdPqGgtwo9D6YP13DxWG5OPvEa1whK9VrXTr9VC8IHeO0CAbx
 81ARxGmfNsmkvgLQUw0yupY=
X-Google-Smtp-Source: APXvYqysOKCOhCojeHwYxBOMCe4rHwNECRGRzxfWNp0uuC7W40HVOZjFuuMxStftmA8yZiZ7ntzKbw==
X-Received: by 2002:a63:3d0b:: with SMTP id k11mr4443677pga.349.1559232051303; 
 Thu, 30 May 2019 09:00:51 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id r4sm2908452pjd.25.2019.05.30.09.00.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 09:00:50 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 3/4] drm/msm/dsi: Add old timings quirk for 10nm phy
Date: Thu, 30 May 2019 09:00:49 -0700
Message-Id: <20190530160049.2875-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
References: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
X-Mailman-Approved-At: Thu, 30 May 2019 16:46:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bYX12SEdJ0+DHu8wxAtEZ8Fdfnu9OWYVoolYKJBBX5M=;
 b=CxyJXw9GaV/yEztJ4aVVjjKXAOrymLn4J69zfT3A1qWRFzbYwW29CWT7CYjoyRvqau
 ikWpqpXttJDArpReLOOGIVH5+PE2r+5v9lo7MkDefbOh0gIYJ+d9pAN1UgZ/6WEfpbAO
 U4A1gizRnrw00eVfJre0b+Xd5qRFLDSLM+T9obvc6e9OhrCV07y1niqgmsBmvQuS5yE7
 w2KCBzFbWQ/rNzTl5oEY5pvgVdtnd5nLusdUgxSGPqDriOYtVWfVjR++mWRFFaFxwYuP
 vSDt5Eb7W80gjt5+3cWAB8UQGW/rYpFXPMdV3rhr7sKCgCSfMdePhkVcpMMex4B0Wkaa
 dexQ==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marc.w.gonzalez@free.fr,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 sibis@codeaurora.org, freedreno@lists.freedesktop.org, chandanu@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHYzLjAuMCAxMG5tIHBoeSBoYXMgdHdvIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbnMgYmV0
d2VlbiBNU004OTk4IGFuZApTRE04NDUsIHdoaWNoIHJlcXVpcmUgZGlmZmVyZW50IHRpbWluZ3Mg
Y2FsY3VsYXRpb25zLiAgVW5mb3J0dW5hdGVseSwgdGhlCmhhcmR3YXJlIGRlc2lnbmVycyBkaWQg
bm90IGNob29zZSB0byByZXZpc2UgdGhlIHZlcnNpb24gdG8gYWNjb3VudCBmb3IgdGhpcwpkZWx0
YSBzbyBpbXBsZW1lbnQgYSBxdWlyayBpbnN0ZWFkLgoKU2lnbmVkLW9mZi1ieTogSmVmZnJleSBI
dWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9k
c2kvcGh5L2RzaV9waHkuaCAgICAgIHwgIDQgKysrKwogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kv
cGh5L2RzaV9waHlfMTBubS5jIHwgMTIgKysrKysrKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuaCBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9k
c2lfcGh5LmgKaW5kZXggNzE2MWJlYjIzYjAzLi4zYzUxZGYxYWEyZWUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9kc2kvcGh5L2RzaV9waHkuaApAQCAtMjEsNiArMjEsOSBAQAogI2RlZmluZSBkc2lfcGh5
X3JlYWQob2Zmc2V0KSBtc21fcmVhZGwoKG9mZnNldCkpCiAjZGVmaW5lIGRzaV9waHlfd3JpdGUo
b2Zmc2V0LCBkYXRhKSBtc21fd3JpdGVsKChkYXRhKSwgKG9mZnNldCkpCiAKKy8qIHYzLjAuMCAx
MG5tIGltcGxlbWVudGF0aW9uIHRoYXQgcmVxdWlyZXMgdGhlIG9sZCB0aW1pbmdzIHNldHRpbmdz
ICovCisjZGVmaW5lIFYzXzBfMF8xME5NX09MRF9USU1JTkdTX1FVSVJLCUJJVCgwKQorCiBzdHJ1
Y3QgbXNtX2RzaV9waHlfb3BzIHsKIAlpbnQgKCppbml0KSAoc3RydWN0IG1zbV9kc2lfcGh5ICpw
aHkpOwogCWludCAoKmVuYWJsZSkoc3RydWN0IG1zbV9kc2lfcGh5ICpwaHksIGludCBzcmNfcGxs
X2lkLApAQCAtNDEsNiArNDQsNyBAQCBzdHJ1Y3QgbXNtX2RzaV9waHlfY2ZnIHsKIAlib29sIHNy
Y19wbGxfdHJ1dGh0YWJsZVtEU0lfTUFYXVtEU0lfTUFYXTsKIAljb25zdCByZXNvdXJjZV9zaXpl
X3QgaW9fc3RhcnRbRFNJX01BWF07CiAJY29uc3QgaW50IG51bV9kc2lfcGh5OworCWNvbnN0IGlu
dCBxdWlya3M7CiB9OwogCiBleHRlcm4gY29uc3Qgc3RydWN0IG1zbV9kc2lfcGh5X2NmZyBkc2lf
cGh5XzI4bm1faHBtX2NmZ3M7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9w
aHkvZHNpX3BoeV8xMG5tLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeV8x
MG5tLmMKaW5kZXggYjFlN2RiYzY5ZmE2Li5lYjI4OTM3ZjRiMzQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2RzaS9waHkvZHNpX3BoeV8xMG5tLmMKQEAgLTQyLDYgKzQyLDkgQEAgc3RhdGljIHZv
aWQgZHNpX3BoeV9od192M18wX2xhbmVfc2V0dGluZ3Moc3RydWN0IG1zbV9kc2lfcGh5ICpwaHkp
CiAJdTggdHhfZGN0cmxbXSA9IHsgMHgwMCwgMHgwMCwgMHgwMCwgMHgwNCwgMHgwMSB9OwogCXZv
aWQgX19pb21lbSAqbGFuZV9iYXNlID0gcGh5LT5sYW5lX2Jhc2U7CiAKKwlpZiAocGh5LT5jZmct
PnF1aXJrcyAmIFYzXzBfMF8xME5NX09MRF9USU1JTkdTX1FVSVJLKQorCQl0eF9kY3RybFszXSA9
IDB4MDI7CisKIAkvKiBTdHJlbmd0aCBjdHJsIHNldHRpbmdzICovCiAJZm9yIChpID0gMDsgaSA8
IDU7IGkrKykgewogCQlkc2lfcGh5X3dyaXRlKGxhbmVfYmFzZSArIFJFR19EU0lfMTBubV9QSFlf
TE5fTFBUWF9TVFJfQ1RSTChpKSwKQEAgLTc0LDkgKzc3LDExIEBAIHN0YXRpYyB2b2lkIGRzaV9w
aHlfaHdfdjNfMF9sYW5lX3NldHRpbmdzKHN0cnVjdCBtc21fZHNpX3BoeSAqcGh5KQogCQkJICAg
ICAgdHhfZGN0cmxbaV0pOwogCX0KIAotCS8qIFRvZ2dsZSBCSVQgMCB0byByZWxlYXNlIGZyZWV6
ZSBJLzAgKi8KLQlkc2lfcGh5X3dyaXRlKGxhbmVfYmFzZSArIFJFR19EU0lfMTBubV9QSFlfTE5f
VFhfRENUUkwoMyksIDB4MDUpOwotCWRzaV9waHlfd3JpdGUobGFuZV9iYXNlICsgUkVHX0RTSV8x
MG5tX1BIWV9MTl9UWF9EQ1RSTCgzKSwgMHgwNCk7CisJaWYgKCFwaHktPmNmZy0+cXVpcmtzICYg
VjNfMF8wXzEwTk1fT0xEX1RJTUlOR1NfUVVJUkspIHsKKwkJLyogVG9nZ2xlIEJJVCAwIHRvIHJl
bGVhc2UgZnJlZXplIEkvMCAqLworCQlkc2lfcGh5X3dyaXRlKGxhbmVfYmFzZSArIFJFR19EU0lf
MTBubV9QSFlfTE5fVFhfRENUUkwoMyksIDB4MDUpOworCQlkc2lfcGh5X3dyaXRlKGxhbmVfYmFz
ZSArIFJFR19EU0lfMTBubV9QSFlfTE5fVFhfRENUUkwoMyksIDB4MDQpOworCX0KIH0KIAogc3Rh
dGljIGludCBkc2lfMTBubV9waHlfZW5hYmxlKHN0cnVjdCBtc21fZHNpX3BoeSAqcGh5LCBpbnQg
c3JjX3BsbF9pZCwKQEAgLTIzOCw0ICsyNDMsNSBAQCBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9waHlf
Y2ZnIGRzaV9waHlfMTBubV84OTk4X2NmZ3MgPSB7CiAJfSwKIAkuaW9fc3RhcnQgPSB7IDB4Yzk5
NDQwMCwgMHhjOTk2NDAwIH0sCiAJLm51bV9kc2lfcGh5ID0gMiwKKwkucXVpcmtzID0gVjNfMF8w
XzEwTk1fT0xEX1RJTUlOR1NfUVVJUkssCiB9OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
