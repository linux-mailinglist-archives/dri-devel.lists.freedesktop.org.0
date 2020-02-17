Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A76531610AC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 12:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17A26E925;
	Mon, 17 Feb 2020 11:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456386E925;
 Mon, 17 Feb 2020 11:09:33 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z3so19234520wru.3;
 Mon, 17 Feb 2020 03:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=nCvwbV766cLDdu4MMPb9bpS5KdpBsW9doCMnz9Y5aTg=;
 b=YD1NQSb/LXUNGXwLe2n01/e5+Djum6juj89r7OKnWdxW9TNg2piX3BlcMueAzLl+rW
 Leb36++GXkeIGHgD056klwcA/IRBt0RVxmaMG0tl4KSHUDKpHytmeFp61KWz1aORcLmH
 tQvJm9uNOd28r8aHkhTgNyU70PFXnNfagi5WGrbGRETB+NLnh+jdwcsTvZdB8eapG59E
 NKCW6l3SYKLpW+CR+tGuoEaWtMI/Kff5XyyZj57Rh0+1LDgaKid/GIyLPcj4KjUGqTRz
 38hTGbyoHFHfigdW6IhQRLzfNASpoEc0qQSXdSAQU8YH2xoS73QsljW9Nxu8vFxsTaQS
 42IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=nCvwbV766cLDdu4MMPb9bpS5KdpBsW9doCMnz9Y5aTg=;
 b=XLt/kP2IxVFacXa5qxH7dhH1JP7AZvIRsmOv8dcJDkDegt2L690My8S8+aBaVsyZCu
 W6No5oBYp9g9k3iJpQO+rfv9Jz9nyuUREh2UisUWTTAi7JcappgjVR9uMh8XAYqwA4b0
 mCuMUbmlK9sRnwdgDpIA8kmJ+ZcsSHQ5yDdd4YVoIAkHYZStgR9p6GbL+t/pZ1JRx/CN
 R3z/mHyV2kdLumQd7QDOyUX8D3A/Dlvas/sgcuEbpTfQmbX2QcT7sIQUfH4mAOoSGhMP
 jxhzZcC0yDdyPX1Fd14Dcd0dkJ5RuhLyRUgviNx8jjlLme9kXCXmQiLi79VYnjELO/R0
 7kFA==
X-Gm-Message-State: APjAAAXSVvwx1qkEXz3B65oP2hNvbKcXb6yXXdWhWPz2cJrDfjDJ7aI6
 OUqG5rFaajBxNX4O4TOpsw8=
X-Google-Smtp-Source: APXvYqy4DugfwvWkg1j+zzen41ntxqZUB977D/8EzG1Ft9ce7+q2Eg6TGgBwIx7tZu0rzOxKSuYJow==
X-Received: by 2002:adf:ee0b:: with SMTP id y11mr21349208wrn.62.1581937771885; 
 Mon, 17 Feb 2020 03:09:31 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e18sm427881wrw.70.2020.02.17.03.09.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Feb 2020 03:09:31 -0800 (PST)
Subject: Re: [PATCH 3/7] drm/vmwgfx: don't use ttm bo->offset
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200217101841.7437-1-nirmoy.das@amd.com>
 <20200217101841.7437-4-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <19509316-9673-a435-6e74-ab4f43344d94@gmail.com>
Date: Mon, 17 Feb 2020 12:09:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200217101841.7437-4-nirmoy.das@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDIuMjAgdW0gMTE6MTggc2NocmllYiBOaXJtb3kgRGFzOgo+IENhbGN1bGF0ZSBHUFUg
b2Zmc2V0IHdpdGhpbiB2bXdnZnggZHJpdmVyIGl0c2VsZiB3aXRob3V0IGRlcGVuZGluZyBvbgo+
IGJvLT5vZmZzZXQKPgo+IFNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1k
LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmMgICAgICAg
ICB8IDQgKystLQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZXhlY2J1Zi5jICAg
IHwgMiArLQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZmlmby5jICAgICAgIHwg
MiArLQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jIHwgMiAt
LQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8uYyBiL2RyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmMKPiBpbmRleCA4YjcxYmY2YjU4ZWYuLmE3MTQ1
ODJiYjYxYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9iby5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8uYwo+IEBAIC0yNTgsNyAr
MjU4LDcgQEAgaW50IHZtd19ib19waW5faW5fc3RhcnRfb2ZfdnJhbShzdHJ1Y3Qgdm13X3ByaXZh
dGUgKmRldl9wcml2LAo+ICAgCQlyZXQgPSB0dG1fYm9fdmFsaWRhdGUoYm8sICZwbGFjZW1lbnQs
ICZjdHgpOwo+ICAgCj4gICAJLyogRm9yIHNvbWUgcmVhc29uIHdlIGRpZG4ndCBlbmQgdXAgYXQg
dGhlIHN0YXJ0IG9mIHZyYW0gKi8KPiAtCVdBUk5fT04ocmV0ID09IDAgJiYgYm8tPm9mZnNldCAh
PSAwKTsKPiArCVdBUk5fT04ocmV0ID09IDAgJiYgKGJvLT5tZW0uc3RhcnQgPDwgUEFHRV9TSElG
VCkgIT0gMCk7CgpZb3UgY291bGQgZHJvcCB0aGUgKDw8IFBBR0VfU0hJRlQpIHBhcnQgaGVyZS4K
CkFwYXJ0IGZyb20gdGhhdCBmZWVsIGZyZWUgdG8gc3RpY2sgYW4gQWNrZWQtYnk6IENocmlzdGlh
biBLw7ZuaWcgCjxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IG9uIHRoZSBwYXRjaC4KCkNocmlz
dGlhbi4KCj4gICAJaWYgKCFyZXQpCj4gICAJCXZtd19ib19waW5fcmVzZXJ2ZWQoYnVmLCB0cnVl
KTsKPiAgIAo+IEBAIC0zMTcsNyArMzE3LDcgQEAgdm9pZCB2bXdfYm9fZ2V0X2d1ZXN0X3B0cihj
b25zdCBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgewo+ICAgCWlmIChiby0+bWVt
Lm1lbV90eXBlID09IFRUTV9QTF9WUkFNKSB7Cj4gICAJCXB0ci0+Z21ySWQgPSBTVkdBX0dNUl9G
UkFNRUJVRkZFUjsKPiAtCQlwdHItPm9mZnNldCA9IGJvLT5vZmZzZXQ7Cj4gKwkJcHRyLT5vZmZz
ZXQgPSBiby0+bWVtLnN0YXJ0IDw8IFBBR0VfU0hJRlQ7Cj4gICAJfSBlbHNlIHsKPiAgIAkJcHRy
LT5nbXJJZCA9IGJvLT5tZW0uc3RhcnQ7Cj4gICAJCXB0ci0+b2Zmc2V0ID0gMDsKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZXhlY2J1Zi5jIGIvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfZXhlY2J1Zi5jCj4gaW5kZXggNzM0ODlhNDVkZWNiLi43MmMy
Y2Y0MDUzZGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZXhl
Y2J1Zi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZXhlY2J1Zi5jCj4g
QEAgLTMzMTMsNyArMzMxMyw3IEBAIHN0YXRpYyB2b2lkIHZtd19hcHBseV9yZWxvY2F0aW9ucyhz
dHJ1Y3Qgdm13X3N3X2NvbnRleHQgKnN3X2NvbnRleHQpCj4gICAJCWJvID0gJnJlbG9jLT52Ym8t
PmJhc2U7Cj4gICAJCXN3aXRjaCAoYm8tPm1lbS5tZW1fdHlwZSkgewo+ICAgCQljYXNlIFRUTV9Q
TF9WUkFNOgo+IC0JCQlyZWxvYy0+bG9jYXRpb24tPm9mZnNldCArPSBiby0+b2Zmc2V0Owo+ICsJ
CQlyZWxvYy0+bG9jYXRpb24tPm9mZnNldCArPSBiby0+bWVtLnN0YXJ0IDw8IFBBR0VfU0hJRlQ7
Cj4gICAJCQlyZWxvYy0+bG9jYXRpb24tPmdtcklkID0gU1ZHQV9HTVJfRlJBTUVCVUZGRVI7Cj4g
ICAJCQlicmVhazsKPiAgIAkJY2FzZSBWTVdfUExfR01SOgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9maWZvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9maWZvLmMKPiBpbmRleCBlNTI1MmVmMzgxMmYuLjFjZGM0NDViMjRjMyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9maWZvLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9maWZvLmMKPiBAQCAtNjEyLDcgKzYxMiw3IEBAIHN0YXRp
YyBpbnQgdm13X2ZpZm9fZW1pdF9kdW1teV9sZWdhY3lfcXVlcnkoc3RydWN0IHZtd19wcml2YXRl
ICpkZXZfcHJpdiwKPiAgIAo+ICAgCWlmIChiby0+bWVtLm1lbV90eXBlID09IFRUTV9QTF9WUkFN
KSB7Cj4gICAJCWNtZC0+Ym9keS5ndWVzdFJlc3VsdC5nbXJJZCA9IFNWR0FfR01SX0ZSQU1FQlVG
RkVSOwo+IC0JCWNtZC0+Ym9keS5ndWVzdFJlc3VsdC5vZmZzZXQgPSBiby0+b2Zmc2V0Owo+ICsJ
CWNtZC0+Ym9keS5ndWVzdFJlc3VsdC5vZmZzZXQgPSBiby0+bWVtLnN0YXJ0IDw8IFBBR0VfU0hJ
RlQ7Cj4gICAJfSBlbHNlIHsKPiAgIAkJY21kLT5ib2R5Lmd1ZXN0UmVzdWx0LmdtcklkID0gYm8t
Pm1lbS5zdGFydDsKPiAgIAkJY21kLT5ib2R5Lmd1ZXN0UmVzdWx0Lm9mZnNldCA9IDA7Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYwo+IGluZGV4IDNmM2IyYzdh
MjA4YS4uZTcxMzRhZWJlYjgxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X3R0bV9idWZmZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X3R0bV9idWZmZXIuYwo+IEBAIC03NTAsNyArNzUwLDYgQEAgc3RhdGljIGludCB2bXdfaW5pdF9t
ZW1fdHlwZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgdWludDMyX3QgdHlwZSwKPiAgIAlj
YXNlIFRUTV9QTF9WUkFNOgo+ICAgCQkvKiAiT24tY2FyZCIgdmlkZW8gcmFtICovCj4gICAJCW1h
bi0+ZnVuYyA9ICZ0dG1fYm9fbWFuYWdlcl9mdW5jOwo+IC0JCW1hbi0+Z3B1X29mZnNldCA9IDA7
Cj4gICAJCW1hbi0+ZmxhZ3MgPSBUVE1fTUVNVFlQRV9GTEFHX0ZJWEVEIHwgVFRNX01FTVRZUEVf
RkxBR19NQVBQQUJMRTsKPiAgIAkJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9IFRUTV9QTF9GTEFH
X0NBQ0hFRDsKPiAgIAkJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7
Cj4gQEAgLTc2Myw3ICs3NjIsNiBAQCBzdGF0aWMgaW50IHZtd19pbml0X21lbV90eXBlKHN0cnVj
dCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAo+ICAgCQkgKiAgc2xvdHMgYXMg
d2VsbCBhcyB0aGUgYm8gc2l6ZS4KPiAgIAkJICovCj4gICAJCW1hbi0+ZnVuYyA9ICZ2bXdfZ21y
aWRfbWFuYWdlcl9mdW5jOwo+IC0JCW1hbi0+Z3B1X29mZnNldCA9IDA7Cj4gICAJCW1hbi0+Zmxh
Z3MgPSBUVE1fTUVNVFlQRV9GTEFHX0NNQSB8IFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7Cj4g
ICAJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7Cj4gICAJCW1h
bi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfQ0FDSEVEOwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
