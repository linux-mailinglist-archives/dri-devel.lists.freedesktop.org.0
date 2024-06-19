Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 159C990F630
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 20:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4BA10ED82;
	Wed, 19 Jun 2024 18:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ic2fOF60";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E47310ED82
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 18:41:27 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a6fb341a7f2so9600166b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 11:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718822485; x=1719427285; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dSqD4s0oKeS160Bk5oAmxRvLIpuOHndQWJncNmEnmSY=;
 b=ic2fOF60Xa5slnzsZjjOF3z9FRaDGfeOfuWxCCZujUdHG3B6V6nQG3OseLYDydfKBl
 SorfQitAgnqnYY+Kt3Xy35avYjf8pd6nghklyRYb75L/lWBU1rYai2qPTmoJ3cq4OVNr
 lEgV41F4X+FwWKRBU5+cPMp04wqSqYZs3LGNc4+vzQ5rcP+vkLpNP7MN6AZE2sFTD+ph
 5sWFksMcocBIwB6Yj0AoEg3A64N4a99URQeHKnZw1oyYXsOHFZtM2hy20mpyDREZezWb
 MdPO8oJPJROlQ11dBmqFgw8LRVz/BUZZzzuHp62y/oEB6FarspiFaqqp7gGgJteYTtjf
 D/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718822485; x=1719427285;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dSqD4s0oKeS160Bk5oAmxRvLIpuOHndQWJncNmEnmSY=;
 b=qytG2iVbuIyXO3dgD/y+hYGCS0HR0zYQTNjY+c1t4FRWHvxdGCzkbdr3530FvPYaqN
 idwGG/oo8CEJ327aCCBmUGKzM9MO2UyQxaIFyVvi8Q/8y9T6h9DGKR51KusA+J+1kUd1
 FRPizZ48UPhx/o4h5epXf200fOkNuktvb2kgBFVFvlDqMBdqiZ1w/57O5wNkQtstDTdi
 EYl05iEkrkdUSpIpByQhdIBkdFrAw4GEh/HHTk7dTlh4TaMQErQ2wtJ289SyC1GbGITh
 gPNf06E5CYj0wwzGPR4JSlSUG+2OxcspF/k7EiZN8psQOz8PRCqylckmAE+jdj+6cXxL
 HSGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXmLt2Nnu7wobiE5jM01F8vn3Ma1dmN1jjylaqPnMl3zHltQU8yYnaQHimaIQ/c7bJPpFeu3d5pXQcUEVr6qHuSR44+g40x77/do3ZHM4d
X-Gm-Message-State: AOJu0YxQ8sLyeHexWXULkE72SzqCtUA/Iyg9bQZ09RQbZNBVxUY6e0JD
 ySZZv0iJPDKCFAJT+/Q/wmmq//RYEj4T+1wY5nHT3vb4KQxud/rHtGXXzBpNF0Ngn99rdgjx9hJ
 NZmsNYAIM5dJrvcVh/X0ke/R7RRU=
X-Google-Smtp-Source: AGHT+IGxO9CcjOfxtNixmB++0l1KwFT74GK/qY1IZm5VAKPDnaWQBLsd55e7+N+oK0E+RUmrqUFKJ6fvwlcQ57zpjsU=
X-Received: by 2002:a17:906:5814:b0:a6e:d339:c09c with SMTP id
 a640c23a62f3a-a6fab7790f1mr196534866b.48.1718822485211; Wed, 19 Jun 2024
 11:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A7qK1-b5g1RR-GJ+QTLEr_OxEr9vcZGEOkZY9yLOFLb5w@mail.gmail.com>
 <5f4c828c-8564-4e4e-a418-3250fadb660a@suse.de>
In-Reply-To: <5f4c828c-8564-4e4e-a418-3250fadb660a@suse.de>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 19 Jun 2024 14:40:48 -0400
Message-ID: <CAAxE2A4QBteFPpYgd9N+D+TPdjvHDmtLBf5YsaNw9xB09CtAYQ@mail.gmail.com>
Subject: Re: "firmware/sysfb: Set firmware-framebuffer parent device" breaks
 lightdm on Ubuntu 22.04 using amdgpu
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, pjones@redhat.com, deller@gmx.de, ardb@kernel.org, 
 dri-devel <dri-devel@lists.freedesktop.org>, linux-fbdev@vger.kernel.org, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="000000000000a9e7ef061b428b82"
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

--000000000000a9e7ef061b428b82
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Attached is the revert commit that works for me. Tested with Radeon
6800 and Radeon 7900XTX.

Marek


Marek

On Wed, Jun 19, 2024 at 9:50=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 13.06.24 um 07:59 schrieb Marek Ol=C5=A1=C3=A1k:
> > Hi Thomas,
> >
> > Commit 9eac534db0013aff9b9124985dab114600df9081 as per the title
> > breaks (crashes?) lightdm (login screen) such that all I get is the
> > terminal. It's also reproducible with tag v6.9 where the commit is
> > present.
>
> I was able to reproduce the problem with Ubutu 22.04 and later under
> qemu plus qxl, sort of. I login via gdm3 and then the quest machine
> switches off entirely.
>
> >
> > Reverting the commit fixes lightdm. A workaround is to bypass lightdm
> > by triggering auto-login. This is a bug report.
>
> The problem is that reverting the commit doesn't fix the issue for me.
> I'll try to do my own bisecting.
>
> Best regards
> Thomas
>
> >
> > (For AMD folks: It's also reproducible with amd-staging-drm-next.)
> >
> > Marek
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>

--000000000000a9e7ef061b428b82
Content-Type: application/x-patch; 
	name="0001-Revert-firmware-sysfb-Set-firmware-framebuffer-paren.patch"
Content-Disposition: attachment; 
	filename="0001-Revert-firmware-sysfb-Set-firmware-framebuffer-paren.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lxm6gbhu0>
X-Attachment-Id: f_lxm6gbhu0

RnJvbSAyNDMxOTc4YmViMDRlYTRmM2JlZmU4ZDZlMGFhODllNzIwN2YxYjVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/TWFyZWs9MjBPbD1DNT1BMT1DMz1BMWs/PSA8
bWFyZWsub2xzYWtAYW1kLmNvbT4KRGF0ZTogVGh1LCAxMyBKdW4gMjAyNCAwMTozMjozNSAtMDQw
MApTdWJqZWN0OiBbUEFUQ0hdIFJldmVydCAiZmlybXdhcmUvc3lzZmI6IFNldCBmaXJtd2FyZS1m
cmFtZWJ1ZmZlciBwYXJlbnQKIGRldmljZSIKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBl
OiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhi
aXQKClRoaXMgcmV2ZXJ0cyBjb21taXQgOWVhYzUzNGRiMDAxM2FmZjliOTEyNDk4NWRhYjExNDYw
MGRmOTA4MS4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIE9sxaHDoWsgPG1hcmVrLm9sc2FrQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9maXJtd2FyZS9zeXNmYi5jICAgICAgICAgIHwgNTEgKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9maXJtd2FyZS9zeXNmYl9zaW1wbGVmYi5j
IHwgIDUgKy0tCiBpbmNsdWRlL2xpbnV4L3N5c2ZiLmggICAgICAgICAgICAgfCAgNiArKy0tCiAz
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNTggZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9maXJtd2FyZS9zeXNmYi5jIGIvZHJpdmVycy9maXJtd2FyZS9zeXNmYi5j
CmluZGV4IDg4MGZmY2I1MDA4OC4uZGVmZDdhMzZjYjA4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Zp
cm13YXJlL3N5c2ZiLmMKKysrIGIvZHJpdmVycy9maXJtd2FyZS9zeXNmYi5jCkBAIC0yOSw3ICsy
OSw2IEBACiAjaW5jbHVkZSA8bGludXgvaW5pdC5oPgogI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5o
PgogI2luY2x1ZGUgPGxpbnV4L21tLmg+Ci0jaW5jbHVkZSA8bGludXgvcGNpLmg+CiAjaW5jbHVk
ZSA8bGludXgvcGxhdGZvcm1fZGF0YS9zaW1wbGVmYi5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRm
b3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3NjcmVlbl9pbmZvLmg+CkBAIC03MCw0OSAr
NjksOSBAQCB2b2lkIHN5c2ZiX2Rpc2FibGUodm9pZCkKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKHN5
c2ZiX2Rpc2FibGUpOwogCi0jaWYgZGVmaW5lZChDT05GSUdfUENJKQotc3RhdGljIF9faW5pdCBi
b29sIHN5c2ZiX3BjaV9kZXZfaXNfZW5hYmxlZChzdHJ1Y3QgcGNpX2RldiAqcGRldikKLXsKLQkv
KgotCSAqIFRPRE86IFRyeSB0byBpbnRlZ3JhdGUgdGhpcyBjb2RlIGludG8gdGhlIFBDSSBzdWJz
eXN0ZW0KLQkgKi8KLQlpbnQgcmV0OwotCXUxNiBjb21tYW5kOwotCi0JcmV0ID0gcGNpX3JlYWRf
Y29uZmlnX3dvcmQocGRldiwgUENJX0NPTU1BTkQsICZjb21tYW5kKTsKLQlpZiAocmV0ICE9IFBD
SUJJT1NfU1VDQ0VTU0ZVTCkKLQkJcmV0dXJuIGZhbHNlOwotCWlmICghKGNvbW1hbmQgJiBQQ0lf
Q09NTUFORF9NRU1PUlkpKQotCQlyZXR1cm4gZmFsc2U7Ci0JcmV0dXJuIHRydWU7Ci19Ci0jZWxz
ZQotc3RhdGljIF9faW5pdCBib29sIHN5c2ZiX3BjaV9kZXZfaXNfZW5hYmxlZChzdHJ1Y3QgcGNp
X2RldiAqcGRldikKLXsKLQlyZXR1cm4gZmFsc2U7Ci19Ci0jZW5kaWYKLQotc3RhdGljIF9faW5p
dCBzdHJ1Y3QgZGV2aWNlICpzeXNmYl9wYXJlbnRfZGV2KGNvbnN0IHN0cnVjdCBzY3JlZW5faW5m
byAqc2kpCi17Ci0Jc3RydWN0IHBjaV9kZXYgKnBkZXY7Ci0KLQlwZGV2ID0gc2NyZWVuX2luZm9f
cGNpX2RldihzaSk7Ci0JaWYgKElTX0VSUihwZGV2KSkgewotCQlyZXR1cm4gRVJSX0NBU1QocGRl
dik7Ci0JfSBlbHNlIGlmIChwZGV2KSB7Ci0JCWlmICghc3lzZmJfcGNpX2Rldl9pc19lbmFibGVk
KHBkZXYpKQotCQkJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7Ci0JCXJldHVybiAmcGRldi0+ZGV2
OwotCX0KLQotCXJldHVybiBOVUxMOwotfQotCiBzdGF0aWMgX19pbml0IGludCBzeXNmYl9pbml0
KHZvaWQpCiB7CiAJc3RydWN0IHNjcmVlbl9pbmZvICpzaSA9ICZzY3JlZW5faW5mbzsKLQlzdHJ1
Y3QgZGV2aWNlICpwYXJlbnQ7CiAJc3RydWN0IHNpbXBsZWZiX3BsYXRmb3JtX2RhdGEgbW9kZTsK
IAljb25zdCBjaGFyICpuYW1lOwogCWJvb2wgY29tcGF0aWJsZTsKQEAgLTEyNiwxNiArODUsMTAg
QEAgc3RhdGljIF9faW5pdCBpbnQgc3lzZmJfaW5pdCh2b2lkKQogCiAJc3lzZmJfYXBwbHlfZWZp
X3F1aXJrcygpOwogCi0JcGFyZW50ID0gc3lzZmJfcGFyZW50X2RldihzaSk7Ci0JaWYgKElTX0VS
UihwYXJlbnQpKSB7Ci0JCXJldCA9IFBUUl9FUlIocGFyZW50KTsKLQkJZ290byB1bmxvY2tfbXV0
ZXg7Ci0JfQotCiAJLyogdHJ5IHRvIGNyZWF0ZSBhIHNpbXBsZS1mcmFtZWJ1ZmZlciBkZXZpY2Ug
Ki8KIAljb21wYXRpYmxlID0gc3lzZmJfcGFyc2VfbW9kZShzaSwgJm1vZGUpOwogCWlmIChjb21w
YXRpYmxlKSB7Ci0JCXBkID0gc3lzZmJfY3JlYXRlX3NpbXBsZWZiKHNpLCAmbW9kZSwgcGFyZW50
KTsKKwkJcGQgPSBzeXNmYl9jcmVhdGVfc2ltcGxlZmIoc2ksICZtb2RlKTsKIAkJaWYgKCFJU19F
UlIocGQpKQogCQkJZ290byB1bmxvY2tfbXV0ZXg7CiAJfQpAQCAtMTU4LDggKzExMSw2IEBAIHN0
YXRpYyBfX2luaXQgaW50IHN5c2ZiX2luaXQodm9pZCkKIAkJZ290byB1bmxvY2tfbXV0ZXg7CiAJ
fQogCi0JcGQtPmRldi5wYXJlbnQgPSBwYXJlbnQ7Ci0KIAlzeXNmYl9zZXRfZWZpZmJfZndub2Rl
KHBkKTsKIAogCXJldCA9IHBsYXRmb3JtX2RldmljZV9hZGRfZGF0YShwZCwgc2ksIHNpemVvZigq
c2kpKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvc3lzZmJfc2ltcGxlZmIuYyBiL2Ry
aXZlcnMvZmlybXdhcmUvc3lzZmJfc2ltcGxlZmIuYwppbmRleCA3NWExODZiZjhmOGUuLjc0MzYz
ZWQ3NTAxZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9maXJtd2FyZS9zeXNmYl9zaW1wbGVmYi5jCisr
KyBiL2RyaXZlcnMvZmlybXdhcmUvc3lzZmJfc2ltcGxlZmIuYwpAQCAtOTEsOCArOTEsNyBAQCBf
X2luaXQgYm9vbCBzeXNmYl9wYXJzZV9tb2RlKGNvbnN0IHN0cnVjdCBzY3JlZW5faW5mbyAqc2ks
CiB9CiAKIF9faW5pdCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpzeXNmYl9jcmVhdGVfc2ltcGxl
ZmIoY29uc3Qgc3RydWN0IHNjcmVlbl9pbmZvICpzaSwKLQkJCQkJCSAgICAgY29uc3Qgc3RydWN0
IHNpbXBsZWZiX3BsYXRmb3JtX2RhdGEgKm1vZGUsCi0JCQkJCQkgICAgIHN0cnVjdCBkZXZpY2Ug
KnBhcmVudCkKKwkJCQkJCSAgICAgY29uc3Qgc3RydWN0IHNpbXBsZWZiX3BsYXRmb3JtX2RhdGEg
Km1vZGUpCiB7CiAJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGQ7CiAJc3RydWN0IHJlc291cmNl
IHJlczsKQEAgLTE0NCw4ICsxNDMsNiBAQCBfX2luaXQgc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
c3lzZmJfY3JlYXRlX3NpbXBsZWZiKGNvbnN0IHN0cnVjdCBzY3JlZW5faW5mbyAqcwogCWlmICgh
cGQpCiAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwogCi0JcGQtPmRldi5wYXJlbnQgPSBwYXJl
bnQ7Ci0KIAlzeXNmYl9zZXRfZWZpZmJfZndub2RlKHBkKTsKIAogCXJldCA9IHBsYXRmb3JtX2Rl
dmljZV9hZGRfcmVzb3VyY2VzKHBkLCAmcmVzLCAxKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvc3lzZmIuaCBiL2luY2x1ZGUvbGludXgvc3lzZmIuaAppbmRleCBjOWNiNjU3ZGFkMDguLjE5
Y2I4MDNkZDVlYyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9zeXNmYi5oCisrKyBiL2luY2x1
ZGUvbGludXgvc3lzZmIuaApAQCAtOTEsOCArOTEsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc3lz
ZmJfc2V0X2VmaWZiX2Z3bm9kZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZCkKIGJvb2wgc3lz
ZmJfcGFyc2VfbW9kZShjb25zdCBzdHJ1Y3Qgc2NyZWVuX2luZm8gKnNpLAogCQkgICAgICBzdHJ1
Y3Qgc2ltcGxlZmJfcGxhdGZvcm1fZGF0YSAqbW9kZSk7CiBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpzeXNmYl9jcmVhdGVfc2ltcGxlZmIoY29uc3Qgc3RydWN0IHNjcmVlbl9pbmZvICpzaSwKLQkJ
CQkJICAgICAgY29uc3Qgc3RydWN0IHNpbXBsZWZiX3BsYXRmb3JtX2RhdGEgKm1vZGUsCi0JCQkJ
CSAgICAgIHN0cnVjdCBkZXZpY2UgKnBhcmVudCk7CisJCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBz
aW1wbGVmYl9wbGF0Zm9ybV9kYXRhICptb2RlKTsKIAogI2Vsc2UgLyogQ09ORklHX1NZU0ZCX1NJ
TVBMRSAqLwogCkBAIC0xMDMsOCArMTAyLDcgQEAgc3RhdGljIGlubGluZSBib29sIHN5c2ZiX3Bh
cnNlX21vZGUoY29uc3Qgc3RydWN0IHNjcmVlbl9pbmZvICpzaSwKIH0KIAogc3RhdGljIGlubGlu
ZSBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpzeXNmYl9jcmVhdGVfc2ltcGxlZmIoY29uc3Qgc3Ry
dWN0IHNjcmVlbl9pbmZvICpzaSwKLQkJCQkJCQkgICAgY29uc3Qgc3RydWN0IHNpbXBsZWZiX3Bs
YXRmb3JtX2RhdGEgKm1vZGUsCi0JCQkJCQkJICAgIHN0cnVjdCBkZXZpY2UgKnBhcmVudCkKKwkJ
CQkJCQkgICAgY29uc3Qgc3RydWN0IHNpbXBsZWZiX3BsYXRmb3JtX2RhdGEgKm1vZGUpCiB7CiAJ
cmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7CiB9Ci0tIAoyLjM0LjEKCg==
--000000000000a9e7ef061b428b82--
