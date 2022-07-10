Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C7A56D12F
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 22:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9CE18B27F;
	Sun, 10 Jul 2022 20:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD32818B27F
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 20:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657483313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=3wkh8sBPpAJoWNAudjBg1h1XOpekcxqk1T+FC7QtDxc=;
 b=U2iA1Cx7vUO4rUgvbbak4wBzSuQ1KZzhVLK3099DeWXc0wCJEgMkslmSNERtW5M8n05bko
 9bFQ+gMGZF7ogzn0Fl0CZZQTpTtrw/8Yp4/gq6uLx/RY6s4YJQIyReLZL4q/EnXfAeEA/7
 PWrnuUuOTttyF7PuNMDtgSF8dDlDx4U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-I2HvKvT8Nae49TmWpKC-Lg-1; Sun, 10 Jul 2022 16:01:51 -0400
X-MC-Unique: I2HvKvT8Nae49TmWpKC-Lg-1
Received: by mail-ed1-f72.google.com with SMTP id
 o13-20020a056402438d00b0043aa846b2d2so2900017edc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 13:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject;
 bh=zra+mQ4ykEcn6OM8oY5gZo2+Ft+xLPxuaIVVQKaYf7I=;
 b=4VMkF1ymQSsZOCNJW0Og2Qvv4yDh3HhrIPdaFcg9X8cUBuhjiQpNlrv6ES5NZSbCuc
 K+8zN+/r7JN3X47ZfQcc7MFp2GpchEZpLXAuK/JvvHj4HkRcDOATUMBjMdIjZL1bPtW3
 lp9MjrdX5aDqK1VfFlA7CiVhjLoxyi+Y09jw3LrvwggMa2Mb3/rAuDIYBzwh4sRmKTaC
 v/vb8ZcyDiwNpDLbN7U/SCAS3qFdufyRA7iYBPCWyK+AkRmwyPOo5FZqNRiuYWe76c6y
 /igUfYHdK9fj55DFzbwvnti4lPpwsi1qcx4G6a8umUDF7nLS99QgItlVhdd/qAIB01z/
 s2yA==
X-Gm-Message-State: AJIora+oYh2xitZQ04ldWlI1AZ/npP1kdgMcJDOGhtJMnsXRf3/E3Jdw
 EfWX57ENMlZ5wO9F4i2aSu1k/I2z14EH0sV89BRcfEYkb+phTf23AS57BqqZ8TCk2O3CKXbXdhO
 qCrJ1c5g1ghveaYXm/IcBKmabXwCWdwurWRLkLJlUDFWUrhvlDwd9lfJavpB63bTq2JNArQo+5a
 5wpziy
X-Received: by 2002:a05:6402:d05:b0:425:b7ab:776e with SMTP id
 eb5-20020a0564020d0500b00425b7ab776emr20999121edb.142.1657483310616; 
 Sun, 10 Jul 2022 13:01:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u1PEh3xBSaTMmMgDhFmXzr5817qpvCTmND0TEesTJ/A9k4PwCUd7mQGSdrANcsuP0Sfirmvg==
X-Received: by 2002:a05:6402:d05:b0:425:b7ab:776e with SMTP id
 eb5-20020a0564020d0500b00425b7ab776emr20999093edb.142.1657483310329; 
 Sun, 10 Jul 2022 13:01:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 dm3-20020a05640222c300b0043acddee068sm1432578edb.83.2022.07.10.13.01.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jul 2022 13:01:49 -0700 (PDT)
Message-ID: <0f6dcf69-9709-047c-9a06-bb3b3c507fad@redhat.com>
Date: Sun, 10 Jul 2022 22:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: drm-tip amdgpu not compiling, possible fix attached
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------7KmtGTRgF0dEe1rB2Z0nJ6lD"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------7KmtGTRgF0dEe1rB2Z0nJ6lD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

I've been rebasing my backlight refactor on top of drm-tip to submit
a new version upstream and I noticed that drm-tip does not compile.

This is caused by a mismerge of:

commit 925b6e59138cefa47275c67891c65d48d3266d57 (drm-misc/for-linux-next-fixes, drm-misc/drm-misc-fixes, drm-misc-fixes)Selvam <Arunpravin.PaneerSelvam@amd.com>
Date:   Fri Jul 8 02:30:47 2022 -0700
    Revert "drm/amdgpu: add drm buddy support to amdgpu"
    
    This reverts commit c9cad937c0c58618fe5b0310fd539a854dc1ae95.
    
    This is part of a revert of the following commits:
    commit 708d19d9f362 ("drm/amdgpu: move internal vram_mgr function into the C file")
    commit 5e3f1e7729ec ("drm/amdgpu: fix start calculation in amdgpu_vram_mgr_new")
    commit c9cad937c0c5 ("drm/amdgpu: add drm buddy support to amdgpu")
    
    [WHY]
    Few users reported garbaged graphics as soon as x starts,
    reverting until this can be resolved.
    
    Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

From drm-misc/for-linux-next-fixes / drm-misc-fixes

The attached patch on top of drm-tip fixes the mismerge. Note compile-tested
only!

If someone with more rerere experience then me can use this to fix things that
would be great.

Regards,

Hans

--------------7KmtGTRgF0dEe1rB2Z0nJ6lD
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-fix-amdpgu-mismerge.patch"
Content-Disposition: attachment; filename="0001-fix-amdpgu-mismerge.patch"
Content-Transfer-Encoding: base64

RnJvbSA0OWFhY2I4ZDdiMjljOGQ0NDhjZTQ2OWU2NmRkYjMzZjhhMTllNTUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpE
YXRlOiBTdW4sIDEwIEp1bCAyMDIyIDIxOjI3OjQxICswMjAwClN1YmplY3Q6IFtQQVRDSF0gZml4
IGFtZHBndSBtaXNtZXJnZQoKLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dnJhbV9tZ3IuYyB8IDg0ICstLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuaCB8IDYyIC0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDE0NCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuaAoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKaW5kZXggMjU0OTU0YWE5
ODNjLi4wYTc2MTE2NDg1NzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92cmFtX21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92cmFtX21nci5jCkBAIC00OCwzNSArNDgsNiBAQCB0b19hbWRncHVfZGV2aWNlKHN0cnVjdCBh
bWRncHVfdnJhbV9tZ3IgKm1ncikKIAlyZXR1cm4gY29udGFpbmVyX29mKG1nciwgc3RydWN0IGFt
ZGdwdV9kZXZpY2UsIG1tYW4udnJhbV9tZ3IpOwogfQogCi1zdGF0aWMgaW5saW5lIHN0cnVjdCBk
cm1fYnVkZHlfYmxvY2sgKgotYW1kZ3B1X3ZyYW1fbWdyX2ZpcnN0X2Jsb2NrKHN0cnVjdCBsaXN0
X2hlYWQgKmxpc3QpCi17Ci0JcmV0dXJuIGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbChsaXN0LCBz
dHJ1Y3QgZHJtX2J1ZGR5X2Jsb2NrLCBsaW5rKTsKLX0KLQotc3RhdGljIGlubGluZSBib29sIGFt
ZGdwdV9pc192cmFtX21ncl9ibG9ja3NfY29udGlndW91cyhzdHJ1Y3QgbGlzdF9oZWFkICpoZWFk
KQotewotCXN0cnVjdCBkcm1fYnVkZHlfYmxvY2sgKmJsb2NrOwotCXU2NCBzdGFydCwgc2l6ZTsK
LQotCWJsb2NrID0gYW1kZ3B1X3ZyYW1fbWdyX2ZpcnN0X2Jsb2NrKGhlYWQpOwotCWlmICghYmxv
Y2spCi0JCXJldHVybiBmYWxzZTsKLQotCXdoaWxlIChoZWFkICE9IGJsb2NrLT5saW5rLm5leHQp
IHsKLQkJc3RhcnQgPSBhbWRncHVfdnJhbV9tZ3JfYmxvY2tfc3RhcnQoYmxvY2spOwotCQlzaXpl
ID0gYW1kZ3B1X3ZyYW1fbWdyX2Jsb2NrX3NpemUoYmxvY2spOwotCi0JCWJsb2NrID0gbGlzdF9l
bnRyeShibG9jay0+bGluay5uZXh0LCBzdHJ1Y3QgZHJtX2J1ZGR5X2Jsb2NrLCBsaW5rKTsKLQkJ
aWYgKHN0YXJ0ICsgc2l6ZSAhPSBhbWRncHVfdnJhbV9tZ3JfYmxvY2tfc3RhcnQoYmxvY2spKQot
CQkJcmV0dXJuIGZhbHNlOwotCX0KLQotCXJldHVybiB0cnVlOwotfQotCi0KLQogLyoqCiAgKiBE
T0M6IG1lbV9pbmZvX3ZyYW1fdG90YWwKICAqCkBAIC00ODUsNTkgKzQ1Niw4IEBAIHN0YXRpYyBp
bnQgYW1kZ3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiwK
IAl9CiAJc3Bpbl91bmxvY2soJm1nci0+bG9jayk7CiAKLQlpZiAoY3VyX3NpemUgIT0gc2l6ZSkg
ewotCQlzdHJ1Y3QgZHJtX2J1ZGR5X2Jsb2NrICpibG9jazsKLQkJc3RydWN0IGxpc3RfaGVhZCAq
dHJpbV9saXN0OwotCQl1NjQgb3JpZ2luYWxfc2l6ZTsKLQkJTElTVF9IRUFEKHRlbXApOwotCi0J
CXRyaW1fbGlzdCA9ICZ2cmVzLT5ibG9ja3M7Ci0JCW9yaWdpbmFsX3NpemUgPSB2cmVzLT5iYXNl
Lm51bV9wYWdlcyA8PCBQQUdFX1NISUZUOwotCi0JCS8qCi0JCSAqIElmIHNpemUgdmFsdWUgaXMg
cm91bmRlZCB1cCB0byBtaW5fYmxvY2tfc2l6ZSwgdHJpbSB0aGUgbGFzdAotCQkgKiBibG9jayB0
byB0aGUgcmVxdWlyZWQgc2l6ZQotCQkgKi8KLQkJaWYgKCFsaXN0X2lzX3Npbmd1bGFyKCZ2cmVz
LT5ibG9ja3MpKSB7Ci0JCQlibG9jayA9IGxpc3RfbGFzdF9lbnRyeSgmdnJlcy0+YmxvY2tzLCB0
eXBlb2YoKmJsb2NrKSwgbGluayk7Ci0JCQlsaXN0X21vdmVfdGFpbCgmYmxvY2stPmxpbmssICZ0
ZW1wKTsKLQkJCXRyaW1fbGlzdCA9ICZ0ZW1wOwotCQkJLyoKLQkJCSAqIENvbXB1dGUgdGhlIG9y
aWdpbmFsX3NpemUgdmFsdWUgYnkgc3VidHJhY3RpbmcgdGhlCi0JCQkgKiBsYXN0IGJsb2NrIHNp
emUgd2l0aCAoYWxpZ25lZCBzaXplIC0gb3JpZ2luYWwgc2l6ZSkKLQkJCSAqLwotCQkJb3JpZ2lu
YWxfc2l6ZSA9IGFtZGdwdV92cmFtX21ncl9ibG9ja19zaXplKGJsb2NrKSAtIChzaXplIC0gY3Vy
X3NpemUpOwotCQl9Ci0KLQkJbXV0ZXhfbG9jaygmbWdyLT5sb2NrKTsKLQkJZHJtX2J1ZGR5X2Js
b2NrX3RyaW0obW0sCi0JCQkJICAgICBvcmlnaW5hbF9zaXplLAotCQkJCSAgICAgdHJpbV9saXN0
KTsKLQkJbXV0ZXhfdW5sb2NrKCZtZ3ItPmxvY2spOwotCi0JCWlmICghbGlzdF9lbXB0eSgmdGVt
cCkpCi0JCQlsaXN0X3NwbGljZV90YWlsKHRyaW1fbGlzdCwgJnZyZXMtPmJsb2Nrcyk7Ci0JfQot
Ci0JdnJlcy0+YmFzZS5zdGFydCA9IDA7Ci0JbGlzdF9mb3JfZWFjaF9lbnRyeShibG9jaywgJnZy
ZXMtPmJsb2NrcywgbGluaykgewotCQl1bnNpZ25lZCBsb25nIHN0YXJ0OwotCi0JCXN0YXJ0ID0g
YW1kZ3B1X3ZyYW1fbWdyX2Jsb2NrX3N0YXJ0KGJsb2NrKSArCi0JCQlhbWRncHVfdnJhbV9tZ3Jf
YmxvY2tfc2l6ZShibG9jayk7Ci0JCXN0YXJ0ID4+PSBQQUdFX1NISUZUOwotCi0JCWlmIChzdGFy
dCA+IHZyZXMtPmJhc2UubnVtX3BhZ2VzKQotCQkJc3RhcnQgLT0gdnJlcy0+YmFzZS5udW1fcGFn
ZXM7Ci0JCWVsc2UKLQkJCXN0YXJ0ID0gMDsKLQkJdnJlcy0+YmFzZS5zdGFydCA9IG1heCh2cmVz
LT5iYXNlLnN0YXJ0LCBzdGFydCk7Ci0KLQkJdmlzX3VzYWdlICs9IGFtZGdwdV92cmFtX21ncl92
aXNfc2l6ZShhZGV2LCBibG9jayk7Ci0JfQotCi0JaWYgKGFtZGdwdV9pc192cmFtX21ncl9ibG9j
a3NfY29udGlndW91cygmdnJlcy0+YmxvY2tzKSkKLQkJdnJlcy0+YmFzZS5wbGFjZW1lbnQgfD0g
VFRNX1BMX0ZMQUdfQ09OVElHVU9VUzsKKwlpZiAoaSA9PSAxKQorCQlub2RlLT5iYXNlLnBsYWNl
bWVudCB8PSBUVE1fUExfRkxBR19DT05USUdVT1VTOwogCiAJaWYgKGFkZXYtPmdtYy54Z21pLmNv
bm5lY3RlZF90b19jcHUpCiAJCW5vZGUtPmJhc2UuYnVzLmNhY2hpbmcgPSB0dG1fY2FjaGVkOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmgg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuaApkZWxldGVkIGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggNGIyNjdiZjFjNWRiLi4wMDAwMDAwMDAwMDAKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmgKKysrIC9kZXYvbnVsbApA
QCAtMSw2MiArMCwwIEBACi0vKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUCi0gKiBDb3B5
cmlnaHQgMjAyMSBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuCi0gKgotICogUGVybWlzc2lv
biBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWlu
aW5nIGEKLSAqIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0
aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksCi0gKiB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3
aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uCi0gKiB0aGUg
cmlnaHRzIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwg
c3VibGljZW5zZSwKLSAqIGFuZC9vciBzZWxsIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0
byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZQotICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRv
IGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKLSAqCi0gKiBUaGUg
YWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBi
ZSBpbmNsdWRlZCBpbgotICogYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0
aGUgU29mdHdhcmUuCi0gKgotICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJ
VEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKLSAqIElNUExJRUQsIElOQ0xV
RElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZ
LAotICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVO
VC4gIElOIE5PIEVWRU5UIFNIQUxMCi0gKiBUSEUgQ09QWVJJR0hUIEhPTERFUihTKSBPUiBBVVRI
T1IoUykgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IKLSAqIE9USEVSIExJQUJJ
TElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNF
LAotICogQVJJU0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZU
V0FSRSBPUiBUSEUgVVNFIE9SCi0gKiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCi0g
KgotICovCi0KLSNpZm5kZWYgX19BTURHUFVfVlJBTV9NR1JfSF9fCi0jZGVmaW5lIF9fQU1ER1BV
X1ZSQU1fTUdSX0hfXwotCi0jaW5jbHVkZSA8ZHJtL2RybV9idWRkeS5oPgotCi1zdHJ1Y3QgYW1k
Z3B1X3ZyYW1fbWdyIHsKLQlzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgbWFuYWdlcjsKLQlz
dHJ1Y3QgZHJtX2J1ZGR5IG1tOwotCS8qIHByb3RlY3RzIGFjY2VzcyB0byBidWZmZXIgb2JqZWN0
cyAqLwotCXN0cnVjdCBtdXRleCBsb2NrOwotCXN0cnVjdCBsaXN0X2hlYWQgcmVzZXJ2YXRpb25z
X3BlbmRpbmc7Ci0Jc3RydWN0IGxpc3RfaGVhZCByZXNlcnZlZF9wYWdlczsKLQlhdG9taWM2NF90
IHZpc191c2FnZTsKLQl1NjQgZGVmYXVsdF9wYWdlX3NpemU7Ci19OwotCi1zdHJ1Y3QgYW1kZ3B1
X3ZyYW1fbWdyX3Jlc291cmNlIHsKLQlzdHJ1Y3QgdHRtX3Jlc291cmNlIGJhc2U7Ci0Jc3RydWN0
IGxpc3RfaGVhZCBibG9ja3M7Ci0JdW5zaWduZWQgbG9uZyBmbGFnczsKLX07Ci0KLXN0YXRpYyBp
bmxpbmUgdTY0IGFtZGdwdV92cmFtX21ncl9ibG9ja19zdGFydChzdHJ1Y3QgZHJtX2J1ZGR5X2Js
b2NrICpibG9jaykKLXsKLQlyZXR1cm4gZHJtX2J1ZGR5X2Jsb2NrX29mZnNldChibG9jayk7Ci19
Ci0KLXN0YXRpYyBpbmxpbmUgdTY0IGFtZGdwdV92cmFtX21ncl9ibG9ja19zaXplKHN0cnVjdCBk
cm1fYnVkZHlfYmxvY2sgKmJsb2NrKQotewotCXJldHVybiBQQUdFX1NJWkUgPDwgZHJtX2J1ZGR5
X2Jsb2NrX29yZGVyKGJsb2NrKTsKLX0KLQotc3RhdGljIGlubGluZSBzdHJ1Y3QgYW1kZ3B1X3Zy
YW1fbWdyX3Jlc291cmNlICoKLXRvX2FtZGdwdV92cmFtX21ncl9yZXNvdXJjZShzdHJ1Y3QgdHRt
X3Jlc291cmNlICpyZXMpCi17Ci0JcmV0dXJuIGNvbnRhaW5lcl9vZihyZXMsIHN0cnVjdCBhbWRn
cHVfdnJhbV9tZ3JfcmVzb3VyY2UsIGJhc2UpOwotfQotCi0jZW5kaWYKLS0gCjIuMzYuMAoK
--------------7KmtGTRgF0dEe1rB2Z0nJ6lD--

