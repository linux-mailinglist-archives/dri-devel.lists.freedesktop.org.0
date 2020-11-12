Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF4C2B0D13
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D226E323;
	Thu, 12 Nov 2020 19:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59F76E323
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:00:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p1so7125095wrf.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zw4/3H58DclPUryUYajc25e3NyANX/uApXUC9a6irt8=;
 b=bgWa0+Br46K2f9cJcIoWiHatx+XZjXt4+HVAL0qFLplwDys63qQgg/LK5a21NfQA9L
 8EAXKlgh7nQTW1R6FD75ZYHnq+8lTfi4DGRZOb5hdMaVAYkTaJjlHCq0BLmMKRR7TpNi
 bMnmV9WWrZ5QkUV2JGlo2bCMHfEKU2jQbtRCQwzwkBh1Czg55uoMo3Wtf03L8QeFwL6u
 Hy8qH5DZrhrRvRC24d68W5iNxZYnREggOEp30K/dHyOd1CHMrsR999bt1rHU5mPMNqJY
 SSH69rINO6PADc5ZiszGLW5qNqlHrE+8zjyzXAEVUHz479E1gjQtFaQqlYkxy3lNI6Xx
 SXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zw4/3H58DclPUryUYajc25e3NyANX/uApXUC9a6irt8=;
 b=psM5Nb+rmGrRJ4RIVswoLhaAjxaxwuVggdYBhpfZDv9/vESc+JJ/nQhYht53zl++AN
 kTXikF9uMBSHIMTyWBCLvMLWSsyNgZN8cOwczvyvqlK9ITntwbzZZIPNfQuGMDC6uKIx
 bWVnWcbOQo8CCaP8XsBK+OTvzohBaF0yqiJ7FMEPlP+fr1MqNe+dDxNQND1uHXqaF/W6
 YhP5E5sKIJjJM82UgQMhModWtedXOJvUD6ygphtdrm5HDnH6XZAN+HlqTzG+CY2XMSsT
 sYvKzCAUh/AOJ84xlh3TXUklf4AqTSrpFTbqr8qiV63pifo02EgA3mV8gKCMji//tmCl
 reVA==
X-Gm-Message-State: AOAM532SOWCeOG/kvdZiP2DymfvFz+6Bg032rIFD3ul/YpS9ml2Frhyq
 lQ2nB68eV+QYZdQT7OLkdT0+M9GirlnTHx2m
X-Google-Smtp-Source: ABdhPJxxwFYZtMQX5DH7hJKIUrjEBbmXGyRjjXYs/MLIPQVaWJDaZogWWz8Cc5Qz/4L83VgvX/sopg==
X-Received: by 2002:adf:f90f:: with SMTP id b15mr1062991wrr.343.1605207645290; 
 Thu, 12 Nov 2020 11:00:45 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:00:44 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 01/30] drm/savage/savage_bci: Remove set but never used
 'aper_rsrc' and 'fb_rsrc'
Date: Thu, 12 Nov 2020 19:00:10 +0000
Message-Id: <20201112190039.2785914-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNvbW1lbnQgYWJvdXQgdGhlbSAoYWxzbyByZW1vdmVkKSBzYXlzOgoKIC8qIGZiX3JzcmMg
YW5kIGFwZXJfcnNyYyBhcmVuJ3QgcmVhbGx5IHVzZWQgY3VycmVudGx5LCBidXQgc3RpbGwgZXhp
c3QKICAqIGluIGNhc2Ugd2UgZGVjaWRlIHdlIG5lZWQgaW5mb3JtYXRpb24gb24gdGhlIEJBUiBm
b3IgQlNEIGluIHRoZQogICogZnV0dXJlLgogICovCgpXZWxsIHRoYXQgd2FzIHdyaXR0ZW4gMTIg
eWVhcnMgYWdvIGluIDIwMDguICBXZSBhcmUgbm93IGluIHRoZSBmdXR1cmUKYW5kIHRoZXkgYXJl
IHN0aWxsIHN1cGVyZmx1b3VzLiAgV2UgY2FuIGFsd2F5cyBhZGQgdGhlbSBhZ2FpbiBhdCBhCmxh
dGVyIGRhdGUgaWYgdGhleSBhcmUgZXZlciByZXF1aXJlZC4KCkZpeGVzIHRoZSBmb2xsb3dpbmcg
Vz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgoKIGRyaXZlcnMvZ3B1L2RybS9zYXZhZ2Uvc2F2
YWdlX2JjaS5jOiBJbiBmdW5jdGlvbiDigJhzYXZhZ2VfZHJpdmVyX2ZpcnN0b3BlbuKAmToKIGRy
aXZlcnMvZ3B1L2RybS9zYXZhZ2Uvc2F2YWdlX2JjaS5jOjU4MDoyNDogd2FybmluZzogdmFyaWFi
bGUg4oCYYXBlcl9yc3Jj4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFy
aWFibGVdCiBkcml2ZXJzL2dwdS9kcm0vc2F2YWdlL3NhdmFnZV9iY2kuYzo1ODA6MTU6IHdhcm5p
bmc6IHZhcmlhYmxlIOKAmGZiX3JzcmPigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0
LXNldC12YXJpYWJsZV0KCkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3NhdmFnZS9zYXZhZ2VfYmNpLmMgfCAxMSAtLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9zYXZhZ2Uvc2F2YWdlX2JjaS5jIGIvZHJpdmVycy9ncHUvZHJtL3NhdmFnZS9zYXZh
Z2VfYmNpLmMKaW5kZXggNjg4OWQ2NTM0ZWJhYi4uNjA2ZTViODA3YTZlNyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3NhdmFnZS9zYXZhZ2VfYmNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3NhdmFnZS9zYXZhZ2VfYmNpLmMKQEAgLTU3MywxOSArNTczLDEyIEBAIGludCBzYXZhZ2VfZHJp
dmVyX2ZpcnN0b3BlbihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogewogCWRybV9zYXZhZ2VfcHJp
dmF0ZV90ICpkZXZfcHJpdiA9IGRldi0+ZGV2X3ByaXZhdGU7CiAJdW5zaWduZWQgbG9uZyBtbWlv
X2Jhc2UsIGZiX2Jhc2UsIGZiX3NpemUsIGFwZXJ0dXJlX2Jhc2U7Ci0JLyogZmJfcnNyYyBhbmQg
YXBlcl9yc3JjIGFyZW4ndCByZWFsbHkgdXNlZCBjdXJyZW50bHksIGJ1dCBzdGlsbCBleGlzdAot
CSAqIGluIGNhc2Ugd2UgZGVjaWRlIHdlIG5lZWQgaW5mb3JtYXRpb24gb24gdGhlIEJBUiBmb3Ig
QlNEIGluIHRoZQotCSAqIGZ1dHVyZS4KLQkgKi8KLQl1bnNpZ25lZCBpbnQgZmJfcnNyYywgYXBl
cl9yc3JjOwogCWludCByZXQgPSAwOwogCiAJaWYgKFMzX1NBVkFHRTNEX1NFUklFUyhkZXZfcHJp
di0+Y2hpcHNldCkpIHsKLQkJZmJfcnNyYyA9IDA7CiAJCWZiX2Jhc2UgPSBwY2lfcmVzb3VyY2Vf
c3RhcnQoZGV2LT5wZGV2LCAwKTsKIAkJZmJfc2l6ZSA9IFNBVkFHRV9GQl9TSVpFX1MzOwogCQlt
bWlvX2Jhc2UgPSBmYl9iYXNlICsgU0FWQUdFX0ZCX1NJWkVfUzM7Ci0JCWFwZXJfcnNyYyA9IDA7
CiAJCWFwZXJ0dXJlX2Jhc2UgPSBmYl9iYXNlICsgU0FWQUdFX0FQRVJUVVJFX09GRlNFVDsKIAkJ
LyogdGhpcyBzaG91bGQgYWx3YXlzIGJlIHRydWUgKi8KIAkJaWYgKHBjaV9yZXNvdXJjZV9sZW4o
ZGV2LT5wZGV2LCAwKSA9PSAweDA4MDAwMDAwKSB7CkBAIC02MDcsMTAgKzYwMCw4IEBAIGludCBz
YXZhZ2VfZHJpdmVyX2ZpcnN0b3BlbihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCX0gZWxzZSBp
ZiAoZGV2X3ByaXYtPmNoaXBzZXQgIT0gUzNfU1VQRVJTQVZBR0UgJiYKIAkJICAgZGV2X3ByaXYt
PmNoaXBzZXQgIT0gUzNfU0FWQUdFMjAwMCkgewogCQltbWlvX2Jhc2UgPSBwY2lfcmVzb3VyY2Vf
c3RhcnQoZGV2LT5wZGV2LCAwKTsKLQkJZmJfcnNyYyA9IDE7CiAJCWZiX2Jhc2UgPSBwY2lfcmVz
b3VyY2Vfc3RhcnQoZGV2LT5wZGV2LCAxKTsKIAkJZmJfc2l6ZSA9IFNBVkFHRV9GQl9TSVpFX1M0
OwotCQlhcGVyX3JzcmMgPSAxOwogCQlhcGVydHVyZV9iYXNlID0gZmJfYmFzZSArIFNBVkFHRV9B
UEVSVFVSRV9PRkZTRVQ7CiAJCS8qIHRoaXMgc2hvdWxkIGFsd2F5cyBiZSB0cnVlICovCiAJCWlm
IChwY2lfcmVzb3VyY2VfbGVuKGRldi0+cGRldiwgMSkgPT0gMHgwODAwMDAwMCkgewpAQCAtNjI2
LDEwICs2MTcsOCBAQCBpbnQgc2F2YWdlX2RyaXZlcl9maXJzdG9wZW4oc3RydWN0IGRybV9kZXZp
Y2UgKmRldikKIAkJfQogCX0gZWxzZSB7CiAJCW1taW9fYmFzZSA9IHBjaV9yZXNvdXJjZV9zdGFy
dChkZXYtPnBkZXYsIDApOwotCQlmYl9yc3JjID0gMTsKIAkJZmJfYmFzZSA9IHBjaV9yZXNvdXJj
ZV9zdGFydChkZXYtPnBkZXYsIDEpOwogCQlmYl9zaXplID0gcGNpX3Jlc291cmNlX2xlbihkZXYt
PnBkZXYsIDEpOwotCQlhcGVyX3JzcmMgPSAyOwogCQlhcGVydHVyZV9iYXNlID0gcGNpX3Jlc291
cmNlX3N0YXJ0KGRldi0+cGRldiwgMik7CiAJCS8qIEF1dG9tYXRpYyBNVFJSIHNldHVwIHdpbGwg
ZG8gdGhlIHJpZ2h0IHRoaW5nLiAqLwogCX0KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
