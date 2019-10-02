Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA893C8A0B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 15:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1702089BAE;
	Wed,  2 Oct 2019 13:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D9689B9A;
 Wed,  2 Oct 2019 13:44:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a11so19770770wrx.1;
 Wed, 02 Oct 2019 06:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=swletV/9Ea56z3ErdxOJ1Fe6ppq+ypIuhlo7LrZAw5c=;
 b=NBIhkJ1SsyyuVQNI1C4v3KqzztfdPYA941D2/8uMbVowOf1l8Z3DA7s0szSCMlKxfX
 hjUFrUXugpWLTCcdzMK9vPoYp8WoZYjblFG9Ea7C+os5J1LdQxnIPXa61aI+oSK3kBjN
 eSbXVhMZ2YcITqCirGFRzlaIes7juAfK3bpoEvyLTliB5B0q0dE8smgFw+u7FF+2VTHM
 6AZ0lmYZdPTKNwyjr6DnRIXiB+ysM5fLDx2nkkaw/P3dJebQNK0CJy60o/e+zRUVtRDi
 cYBBFwQt4HAkeswLxtJjZ/LjVPYHXYmdizXl6+gY0E4lkEkgpfHa2TTbz8VmwCrKCbkY
 YMkw==
X-Gm-Message-State: APjAAAX7mF1tVNZ00RdwwtUJgx9WeV1lDAMRKEsTvtNu7OfE2Qr7Iw7D
 vWWVofCYADILtOkLT6hdXT961zNM4av2vvCMa/k=
X-Google-Smtp-Source: APXvYqxKTxhnpg2AyMrL2X4XJUMdK2yC+342yEmFWr4ij0AFYB9EWXT7uvSApKEavuLbpY+9fKxm56f7a1bxynvf9nQ=
X-Received: by 2002:adf:f287:: with SMTP id k7mr2961045wro.206.1570023883610; 
 Wed, 02 Oct 2019 06:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <1569760723-119944-1-git-send-email-yukuai3@huawei.com>
In-Reply-To: <1569760723-119944-1-git-send-email-yukuai3@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Oct 2019 09:44:31 -0400
Message-ID: <CADnq5_N9a+s5stOOX8QaMZXWJ680povytY975QvO0Eu7Y=UBYA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove set but not used variable 'pipe'
To: yu kuai <yukuai3@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=swletV/9Ea56z3ErdxOJ1Fe6ppq+ypIuhlo7LrZAw5c=;
 b=Ye/pTVYQXw0AJTkJOM/7eWunxdVfn+VJBs+aoSIrLsjH37amOhRXQKPOAfPqAiSEwS
 fnX+0VGR7GNJhVkHUcwZfFRQ0GH21d5pbZyKi14d5T3IK9JNUbopSmrSOMBmlw1W18Fh
 4ur8+qPD/INvDydn/E3apOl4MyGPUoWnGX17W7nNUBYg1qrrSaVvGbGymwGvz0Gnd0V7
 Ds2CdaKAx7XloBIGaNYR0n4+aYRK5UAmJNRcUeGvQfnswWt36doe450Rc3XtuwWVzeSn
 q4wdIOh3j2ZzDGG/tVeeqnc4iCb8K8+mfDTSoZh3w4aboySiXWFiEZHifXeVTy+g5kO/
 t0FA==
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
Cc: yi.zhang@huawei.com, Dave Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 zhengbin13@huawei.com, amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMzowMyBBTSB5dSBrdWFpIDx5dWt1YWkzQGh1YXdlaS5j
b20+IHdyb3RlOgo+Cj4gRml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJu
aW5nOgo+Cj4gcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmM6IEluIGZ1bmN0
aW9uCj4g4oCYYW1kZ3B1X2dmeF9ncmFwaGljc19xdWV1ZV9hY3F1aXJl4oCZOgo+IGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYzoyMzQ6MTY6IHdhcm5pbmc6Cj4gdmFyaWFi
bGUg4oCYcGlwZeKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxl
XQo+Cj4gSXQgaXMgbmV2ZXIgdXNlZCwgc28gY2FuIGJlIHJlbW92ZWQuCj4KPiBSZXBvcnRlZC1i
eTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogeXUga3Vh
aSA8eXVrdWFpM0BodWF3ZWkuY29tPgoKQXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYyB8IDQgKy0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jCj4gaW5kZXggZjliZWYzMS4uYzEwMzVhMyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMKPiBAQCAtMjMxLDEyICsy
MzEsMTAgQEAgdm9pZCBhbWRncHVfZ2Z4X2NvbXB1dGVfcXVldWVfYWNxdWlyZShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKPgo+ICB2b2lkIGFtZGdwdV9nZnhfZ3JhcGhpY3NfcXVldWVfYWNx
dWlyZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgewo+IC0gICAgICAgaW50IGksIHF1
ZXVlLCBwaXBlLCBtZTsKPiArICAgICAgIGludCBpLCBxdWV1ZSwgbWU7Cj4KPiAgICAgICAgIGZv
ciAoaSA9IDA7IGkgPCBBTURHUFVfTUFYX0dGWF9RVUVVRVM7ICsraSkgewo+ICAgICAgICAgICAg
ICAgICBxdWV1ZSA9IGkgJSBhZGV2LT5nZngubWUubnVtX3F1ZXVlX3Blcl9waXBlOwo+IC0gICAg
ICAgICAgICAgICBwaXBlID0gKGkgLyBhZGV2LT5nZngubWUubnVtX3F1ZXVlX3Blcl9waXBlKQo+
IC0gICAgICAgICAgICAgICAgICAgICAgICUgYWRldi0+Z2Z4Lm1lLm51bV9waXBlX3Blcl9tZTsK
PiAgICAgICAgICAgICAgICAgbWUgPSAoaSAvIGFkZXYtPmdmeC5tZS5udW1fcXVldWVfcGVyX3Bp
cGUpCj4gICAgICAgICAgICAgICAgICAgICAgIC8gYWRldi0+Z2Z4Lm1lLm51bV9waXBlX3Blcl9t
ZTsKPgo+IC0tCj4gMi43LjQKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
