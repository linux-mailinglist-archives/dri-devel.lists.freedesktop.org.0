Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D46F2E072B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 09:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA226E195;
	Tue, 22 Dec 2020 08:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B686E195
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 08:27:33 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id i6so11291891otr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 00:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HH6dKkH7N0LeOFS4YHJ9l4gpGRxGpMpIhRpH9IMPePA=;
 b=lgN8Qms3lTWrD2pPZXdRtj3tAj5dQLtKIAXW32i2L5TYaaSIRCr1UPqzKwllHt9iZF
 nNXHbDbbxgH2cvq5elD7nRioPYZUhfHxRqBK2yIAhxYTeOknsxOVHWSq+ZI2zUhDitkQ
 skri69uwS4RBKVroYCikN8km0IeusgoewFzlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HH6dKkH7N0LeOFS4YHJ9l4gpGRxGpMpIhRpH9IMPePA=;
 b=mQnNcRDqEPW8Wu+/Y9z4bPE/0Tl/QvoE95e6cHQc8acThNMAWLizdAEWCnZZ0tcZZF
 9QwQa5Z0DSgXudPwdhdqbIYcdPxAyWzP6KTsBOfaBNSFME41GdoqtOZoTEGs1GgU3L8D
 PLWXbxofXZ0eF0TO/jRm4Q6uFwO67ZTUHP1aAFL6MQ84Qf2xe2vI1jgPiHzC7EMn1R8e
 Scxfxu9n3ELRVJ7+YJvat7BsAKLPQXXsOFpccEoJ5Rj3G8gjhuEhIHV7nWu7WfZcqoh4
 sVmAkdRn6rdctA/zP7++kYEX+RXvl5B9K7/6z3Ef517wX8EcaXCt6FlcvsZaBdK9uDqv
 Zm3A==
X-Gm-Message-State: AOAM533lZg/KFWn2Cq4BfA1SPSqrA6CwGJ4AuVemBw6nl15sF6mjqkfe
 SPKq8UhYaSADqy7ifC0y2LbX3McpFmzVpmeeengszg==
X-Google-Smtp-Source: ABdhPJwhLCnfjXVOtD+buSzsMZE06m94WU5Rhobb0Jc/MDmLD0eohKXLwL5R0EQlLUX4hl87O0UVsJXY6LQm/NtdTzo=
X-Received: by 2002:a05:6830:1bef:: with SMTP id
 k15mr14694580otb.303.1608625653036; 
 Tue, 22 Dec 2020 00:27:33 -0800 (PST)
MIME-Version: 1.0
References: <1608511522-3100-1-git-send-email-tiantao6@hisilicon.com>
 <X+EbgCy17bUa8X1N@phenom.ffwll.local>
 <aaef6075-eb6c-3fbe-5cb1-2415f96debd9@huawei.com>
In-Reply-To: <aaef6075-eb6c-3fbe-5cb1-2415f96debd9@huawei.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 22 Dec 2020 09:27:21 +0100
Message-ID: <CAKMK7uEKo6XEHfagk49ugWSmKO7mGQQ-EHpA9swNc9v-s1mtgQ@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon: Use pcim_enable_device()
To: "tiantao (H)" <tiantao6@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <xinliang.liu@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMjIsIDIwMjAgYXQgMTozOCBBTSB0aWFudGFvIChIKSA8dGlhbnRhbzZAaHVh
d2VpLmNvbT4gd3JvdGU6Cj4KPgo+IOWcqCAyMDIwLzEyLzIyIDY6MDIsIERhbmllbCBWZXR0ZXIg
5YaZ6YGTOgo+ID4gT24gTW9uLCBEZWMgMjEsIDIwMjAgYXQgMDg6NDU6MjJBTSArMDgwMCwgVGlh
biBUYW8gd3JvdGU6Cj4gPj4gVXNpbmcgdGhlIG1hbmFnZWQgZnVuY3Rpb24gc2ltcGxpZmllcyB0
aGUgZXJyb3IgaGFuZGxpbmcuIEFmdGVyCj4gPj4gdW5sb2FkaW5nIHRoZSBkcml2ZXIsIHRoZSBQ
Q0kgZGV2aWNlIHNob3VsZCBub3cgZ2V0IGRpc2FibGVkIGFzCj4gPj4gd2VsbC4KPiA+Pgo+ID4+
IFNpZ25lZC1vZmYtYnk6IFRpYW4gVGFvIDx0aWFudGFvNkBoaXNpbGljb24uY29tPgo+ID4+IC0t
LQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMg
fCA2ICsrLS0tLQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29u
L2hpYm1jL2hpYm1jX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMv
aGlibWNfZHJtX2Rydi5jCj4gPj4gaW5kZXggMDJmM2JkMS4uNzE1OTAxOCAxMDA2NDQKPiA+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYwo+ID4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jCj4g
Pj4gQEAgLTMyOSw3ICszMjksNyBAQCBzdGF0aWMgaW50IGhpYm1jX3BjaV9wcm9iZShzdHJ1Y3Qg
cGNpX2RldiAqcGRldiwKPiA+PiAgICAgIGRldi0+cGRldiA9IHBkZXY7Cj4gPj4gICAgICBwY2lf
c2V0X2RydmRhdGEocGRldiwgZGV2KTsKPiA+Pgo+ID4+IC0gICAgcmV0ID0gcGNpX2VuYWJsZV9k
ZXZpY2UocGRldik7Cj4gPj4gKyAgICByZXQgPSBwY2ltX2VuYWJsZV9kZXZpY2UocGRldik7Cj4g
Pj4gICAgICBpZiAocmV0KSB7Cj4gPj4gICAgICAgICAgICAgIGRybV9lcnIoZGV2LCAiZmFpbGVk
IHRvIGVuYWJsZSBwY2kgZGV2aWNlOiAlZFxuIiwgcmV0KTsKPiA+PiAgICAgICAgICAgICAgZ290
byBlcnJfZnJlZTsKPiA+PiBAQCAtMzM4LDcgKzMzOCw3IEBAIHN0YXRpYyBpbnQgaGlibWNfcGNp
X3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAo+ID4+ICAgICAgcmV0ID0gaGlibWNfbG9hZChk
ZXYpOwo+ID4+ICAgICAgaWYgKHJldCkgewo+ID4+ICAgICAgICAgICAgICBkcm1fZXJyKGRldiwg
ImZhaWxlZCB0byBsb2FkIGhpYm1jOiAlZFxuIiwgcmV0KTsKPiA+PiAtICAgICAgICAgICAgZ290
byBlcnJfZGlzYWJsZTsKPiA+PiArICAgICAgICAgICAgZ290byBlcnJfZnJlZTsKPiA+PiAgICAg
IH0KPiA+Pgo+ID4+ICAgICAgcmV0ID0gZHJtX2Rldl9yZWdpc3RlcihkZXYsIDApOwo+ID4+IEBA
IC0zNTQsOCArMzU0LDYgQEAgc3RhdGljIGludCBoaWJtY19wY2lfcHJvYmUoc3RydWN0IHBjaV9k
ZXYgKnBkZXYsCj4gPj4KPiA+PiAgIGVycl91bmxvYWQ6Cj4gPj4gICAgICBoaWJtY191bmxvYWQo
ZGV2KTsKPiA+PiAtZXJyX2Rpc2FibGU6Cj4gPj4gLSAgICBwY2lfZGlzYWJsZV9kZXZpY2UocGRl
dik7Cj4gPj4gICBlcnJfZnJlZToKPiA+PiAgICAgIGRybV9kZXZfcHV0KGRldik7Cj4gPiBUaGUg
ZHJtX2Rldl9wdXQgaGVyZSBhbmQgaW4gaGlibWNfcGNpX3JlbW92ZSBpcyB3cm9uZywgZGV2bV9k
cm1fZGV2X2FsbG9jCj4gPiB0YWtlcyBjYXJlIG9mIHRoYXQgYWxyZWFkeS4gSSdtIGtpbmRhIHN1
cHJpc2VkIHlvdSBkb24ndCBoYXZlIGEgcmVmY291bnQKPiA+IHVuZGVycnVuIGFscmVhZHkgLSBk
byB5b3UgdGVzdCBtb2R1bGUgdW5sb2FkIHdpdGggS0FTQU4gZW5hYmxlZD8KPgo+IFRoYW5rcyBm
b3IgaGVscGluZyB0byByZXZpZXcgdGhlIGNvZGXvvIxhbmQga2luZGx5IGdpdmluZyBtZSBhZHZp
Y2XjgIIKPgo+IHRoaXMgcHJvYmxlbSBoYXZlIGJlZW4gZml4ZWTjgIIKPgo+IGM4NTVhZjJmOWM1
YzYwNzYwZmQxYmVkNzg4OWE4MWJjMzdkMjU5MWQgZHJtL2hpc2lsaWNvbjogRml4IHVzZS1hZnRl
ci1mcmVlCgpTb3JyeSwgSSB3YXMgb24gYW4gb2xkZXIgdHJlZS4gTm90ZSB0aGF0IHRoaXMgZml4
IGlzIGluY29tcGxldGUsIHRoZQpkcm1fZGV2X3B1dCBpbiB0aGUgZXJyb3IgcGF0aCBvZiBoaWJt
Y19wY2lfcHJvYmUgc3RpbGwgZXhpc3RzLgotRGFuaWVsCgo+Cj4gPiBUaGUgcGNpbSBwYXRjaCBs
b29rcyBvaywgc28gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3
bGwuY2g+Cj4gPgo+ID4gQ2hlZXJzLCBEYW5pZWwKPiA+Cj4gPj4KPiA+PiAtLQo+ID4+IDIuNy40
Cj4gPj4KPgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
