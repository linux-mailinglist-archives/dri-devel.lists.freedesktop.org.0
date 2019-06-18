Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 186314AB2A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 21:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86346E231;
	Tue, 18 Jun 2019 19:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4C06E231
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:47:22 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id j19so16730487otq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 12:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KdzTI56/zG61CRTFghoJgUKFV1Q8B4zDnAoIv6r27HM=;
 b=Smmg5ERNaoMOzMEJlErAkiOgGinQoy/gN3vH/pBLiJUQDXFOp6TO2AXzOTGn/M/HEj
 RxBy3tDU4nhB3+oBXAk6rlK5UFrULbHOcElj9Iwolbukag2/z8CEv75fMCvonyKzY0M2
 qW0MW7grYMdpTQULC6HHVAoH1VJCqInfGfme5Exr6HhVLM1eUSy1qDmq6IH1timO1L5s
 xdgo46RlD8v39bruzpaTDvHYR4wytIzkWKFGQuk4YzE6tFmVHWXxi0pZxa7z4HqA+iuI
 ub1ZBXSC0VDxkinq8GANnuiwc23pAguinYO41NPd59xNvfbhbhPSv6yG8yJvCZPquPuq
 vM0g==
X-Gm-Message-State: APjAAAUyVpOV8RN40bIeaIPdZEdb0tux2ZaNAE1MGrFLTlmByxMBKz99
 a8slm+b6BkGgBKSSQoVG4yJrzHxNhhuZC43tSclY5Q==
X-Google-Smtp-Source: APXvYqySF7rQ3CS5aYa5WUQws2eei8Wnpe7WRTBg73J6Btkx3UaxdRnRh4Rn6PBOGuhYC6vnCKHCnWzCQAn50NUniuI=
X-Received: by 2002:a9d:7b48:: with SMTP id f8mr6127462oto.207.1560887240878; 
 Tue, 18 Jun 2019 12:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190617122733.22432-1-hch@lst.de>
In-Reply-To: <20190617122733.22432-1-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 18 Jun 2019 12:47:10 -0700
Message-ID: <CAPcyv4hBUJB2RxkDqHkfEGCupDdXfQSrEJmAdhLFwnDOwt8Lig@mail.gmail.com>
Subject: Re: dev_pagemap related cleanups v2
To: Christoph Hellwig <hch@lst.de>
Content-Type: multipart/mixed; boundary="000000000000872d5f058b9e614c"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=KdzTI56/zG61CRTFghoJgUKFV1Q8B4zDnAoIv6r27HM=;
 b=s2Uy7F2zSbJmvMOmCMRUi/PHWSrNmkd+yGx8fJ35yqjrx0VA2g4YYc0V0vIwh56Z/0
 BKgsgx566zdN/soUBM+hoVSPg0Mh339pfKaZgnXQ9whOVS/VisWHxVN9WcoYYav3yECk
 Ij61J5BrFPqR+ChgqtjTrxSj+HZo/Wi3cxewVxCzA6SdioZEqsUUz0FjTzFcjq5+jDL3
 W2eJpXAWBAeQDuOHPPDjWTeepbZZcaK0bwqBN0lAn86Q+NQi6cXesdKLyg5ZhJ+PKQWL
 ILFMB95thwvXk8Yhg5TY/3cQLZfeRvv7FWwXv8GnfNwMUDdeT8DHF2iVNEmofRWm0l1+
 BWaw==
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000872d5f058b9e614c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 5:27 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi Dan, J=C3=A9r=C3=B4me and Jason,
>
> below is a series that cleans up the dev_pagemap interface so that
> it is more easily usable, which removes the need to wrap it in hmm
> and thus allowing to kill a lot of code
>
> Note: this series is on top of the rdma/hmm branch + the dev_pagemap
> releas fix series from Dan that went into 5.2-rc5.
>
> Git tree:
>
>     git://git.infradead.org/users/hch/misc.git hmm-devmem-cleanup.2
>
> Gitweb:
>
>     http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/hmm-d=
evmem-cleanup.2
>
> Changes since v1:
>  - rebase
>  - also switch p2pdma to the internal refcount
>  - add type checking for pgmap->type
>  - rename the migrate method to migrate_to_ram
>  - cleanup the altmap_valid flag
>  - various tidbits from the reviews

Attached is my incremental fixups on top of this series, with those
integrated you can add:

Tested-by: Dan Williams <dan.j.williams@intel.com>

...to the patches that touch kernel/memremap.c, drivers/dax, and drivers/nv=
dimm.

You can also add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

...for the series.

--000000000000872d5f058b9e614c
Content-Type: text/x-patch; charset="US-ASCII"; name="incremental.diff"
Content-Disposition: attachment; filename="incremental.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_jx27x1rf0>
X-Attachment-Id: f_jx27x1rf0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZGF4L2RldmljZS5jIGIvZHJpdmVycy9kYXgvZGV2aWNlLmMK
aW5kZXggYTlkN2M5MGVjZjFlLi4xYWY4MjNiMmZlNmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZGF4
L2RldmljZS5jCisrKyBiL2RyaXZlcnMvZGF4L2RldmljZS5jCkBAIC00MjgsNiArNDI4LDcgQEAg
aW50IGRldl9kYXhfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2KQogCQlyZXR1cm4gLUVCVVNZOwog
CX0KIAorCWRldl9kYXgtPnBnbWFwLnR5cGUgPSBNRU1PUllfREVWSUNFX0RFVkRBWDsKIAlhZGRy
ID0gZGV2bV9tZW1yZW1hcF9wYWdlcyhkZXYsICZkZXZfZGF4LT5wZ21hcCk7CiAJaWYgKElTX0VS
UihhZGRyKSkKIAkJcmV0dXJuIFBUUl9FUlIoYWRkcik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL252
ZGltbS9LY29uZmlnIGIvZHJpdmVycy9udmRpbW0vS2NvbmZpZwppbmRleCA1NDUwMDc5OGYyM2Eu
LjU3ZDNhNmMzYWM3MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9udmRpbW0vS2NvbmZpZworKysgYi9k
cml2ZXJzL252ZGltbS9LY29uZmlnCkBAIC0xMTgsNCArMTE4LDE1IEBAIGNvbmZpZyBOVkRJTU1f
S0VZUwogCWRlcGVuZHMgb24gRU5DUllQVEVEX0tFWVMKIAlkZXBlbmRzIG9uIChMSUJOVkRJTU09
RU5DUllQVEVEX0tFWVMpIHx8IExJQk5WRElNTT1tCiAKK2NvbmZpZyBOVkRJTU1fVEVTVF9CVUlM
RAorCWJvb2wgIkJ1aWxkIHRoZSB1bml0IHRlc3QgY29yZSIKKwlkZXBlbmRzIG9uIENPTVBJTEVf
VEVTVAorCWRlZmF1bHQgQ09NUElMRV9URVNUCisJaGVscAorCSAgQnVpbGQgdGhlIGNvcmUgb2Yg
dGhlIHVuaXQgdGVzdCBpbmZyYXN0cnVjdHVyZS4gIFRoZSByZXN1bHQgb2YKKwkgIHRoaXMgYnVp
bGQgaXMgbm9uLWZ1bmN0aW9uYWwgZm9yIHVuaXQgdGVzdCBleGVjdXRpb24sIGJ1dCBpdAorCSAg
b3RoZXJ3aXNlIGhlbHBzIGNhdGNoIGJ1aWxkIGVycm9ycyBpbmR1Y2VkIGJ5IGNoYW5nZXMgdG8g
dGhlCisJICBjb3JlIGRldm1fbWVtcmVtYXBfcGFnZXMoKSBpbXBsZW1lbnRhdGlvbiBhbmQgb3Ro
ZXIKKwkgIGluZnJhc3RydWN0dXJlLgorCiBlbmRpZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9udmRp
bW0vTWFrZWZpbGUgYi9kcml2ZXJzL252ZGltbS9NYWtlZmlsZQppbmRleCA2ZjJhMDg4YWZhZDYu
LjQwMDgwYzEyMDM2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9udmRpbW0vTWFrZWZpbGUKKysrIGIv
ZHJpdmVycy9udmRpbW0vTWFrZWZpbGUKQEAgLTI4LDMgKzI4LDcgQEAgbGlibnZkaW1tLSQoQ09O
RklHX0JUVCkgKz0gYnR0X2RldnMubwogbGlibnZkaW1tLSQoQ09ORklHX05WRElNTV9QRk4pICs9
IHBmbl9kZXZzLm8KIGxpYm52ZGltbS0kKENPTkZJR19OVkRJTU1fREFYKSArPSBkYXhfZGV2cy5v
CiBsaWJudmRpbW0tJChDT05GSUdfTlZESU1NX0tFWVMpICs9IHNlY3VyaXR5Lm8KKworVE9PTFMg
Oj0gLi4vLi4vdG9vbHMKK1RFU1RfU1JDIDo9ICQoVE9PTFMpL3Rlc3RpbmcvbnZkaW1tL3Rlc3QK
K29iai0kKENPTkZJR19OVkRJTU1fVEVTVF9CVUlMRCkgOj0gJChURVNUX1NSQykvaW9tYXAubwpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZW1yZW1hcC5oIGIvaW5jbHVkZS9saW51eC9tZW1y
ZW1hcC5oCmluZGV4IDdlMGYwNzJkZGNlNy4uNDcwZGU2OGRhYmQ2IDEwMDY0NAotLS0gYS9pbmNs
dWRlL2xpbnV4L21lbXJlbWFwLmgKKysrIGIvaW5jbHVkZS9saW51eC9tZW1yZW1hcC5oCkBAIC01
NSwxMiArNTUsMTkgQEAgc3RydWN0IHZtZW1fYWx0bWFwIHsKICAqIE1FTU9SWV9ERVZJQ0VfUENJ
X1AyUERNQToKICAqIERldmljZSBtZW1vcnkgcmVzaWRpbmcgaW4gYSBQQ0kgQkFSIGludGVuZGVk
IGZvciB1c2Ugd2l0aCBQZWVyLXRvLVBlZXIKICAqIHRyYW5zYWN0aW9ucy4KKyAqCisgKiBNRU1P
UllfREVWSUNFX0RFVkRBWDoKKyAqIEhvc3QgbWVtb3J5IHRoYXQgaGFzIHNpbWlsYXIgYWNjZXNz
IHNlbWFudGljcyBhcyBTeXN0ZW0gUkFNIGkuZS4gRE1BCisgKiBjb2hlcmVudCBhbmQgc3VwcG9y
dHMgcGFnZSBwaW5uaW5nLiBJbiBjb250cmFzdCB0bworICogTUVNT1JZX0RFVklDRV9GU19EQVgs
IHRoaXMgbWVtb3J5IGlzIGFjY2VzcyB2aWEgYSBkZXZpY2UtZGF4CisgKiBjaGFyYWN0ZXIgZGV2
aWNlLgogICovCiBlbnVtIG1lbW9yeV90eXBlIHsKIAlNRU1PUllfREVWSUNFX1BSSVZBVEUgPSAx
LAogCU1FTU9SWV9ERVZJQ0VfUFVCTElDLAogCU1FTU9SWV9ERVZJQ0VfRlNfREFYLAogCU1FTU9S
WV9ERVZJQ0VfUENJX1AyUERNQSwKKwlNRU1PUllfREVWSUNFX0RFVkRBWCwKIH07CiAKIHN0cnVj
dCBkZXZfcGFnZW1hcF9vcHMgewpkaWZmIC0tZ2l0IGEva2VybmVsL21lbXJlbWFwLmMgYi9rZXJu
ZWwvbWVtcmVtYXAuYwppbmRleCA2MDY5M2ExZThlOTIuLjUyYjQ5NjhlNjJjZCAxMDA2NDQKLS0t
IGEva2VybmVsL21lbXJlbWFwLmMKKysrIGIva2VybmVsL21lbXJlbWFwLmMKQEAgLTE3Myw2ICsx
NzMsNyBAQCB2b2lkICpkZXZtX21lbXJlbWFwX3BhZ2VzKHN0cnVjdCBkZXZpY2UgKmRldiwgc3Ry
dWN0IGRldl9wYWdlbWFwICpwZ21hcCkKIAl9OwogCXBncHJvdF90IHBncHJvdCA9IFBBR0VfS0VS
TkVMOwogCWludCBlcnJvciwgbmlkLCBpc19yYW07CisJYm9vbCBnZXRfb3BzID0gdHJ1ZTsKIAog
CXN3aXRjaCAocGdtYXAtPnR5cGUpIHsKIAljYXNlIE1FTU9SWV9ERVZJQ0VfUFJJVkFURToKQEAg
LTE5OSw2ICsyMDAsOCBAQCB2b2lkICpkZXZtX21lbXJlbWFwX3BhZ2VzKHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IGRldl9wYWdlbWFwICpwZ21hcCkKIAkJfQogCQlicmVhazsKIAljYXNlIE1F
TU9SWV9ERVZJQ0VfUENJX1AyUERNQToKKwljYXNlIE1FTU9SWV9ERVZJQ0VfREVWREFYOgorCQln
ZXRfb3BzID0gZmFsc2U7CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCVdBUk4oMSwgIkludmFsaWQg
cGdtYXAgdHlwZSAlZFxuIiwgcGdtYXAtPnR5cGUpOwpAQCAtMjIyLDcgKzIyNSw3IEBAIHZvaWQg
KmRldm1fbWVtcmVtYXBfcGFnZXMoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2X3BhZ2Vt
YXAgKnBnbWFwKQogCQl9CiAJfQogCi0JaWYgKHBnbWFwLT50eXBlICE9IE1FTU9SWV9ERVZJQ0Vf
UENJX1AyUERNQSkgeworCWlmIChnZXRfb3BzKSB7CiAJCWVycm9yID0gZGV2X3BhZ2VtYXBfZ2V0
X29wcyhkZXYsIHBnbWFwKTsKIAkJaWYgKGVycm9yKQogCQkJcmV0dXJuIEVSUl9QVFIoZXJyb3Ip
OwpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9udmRpbW0vdGVzdC9pb21hcC5jIGIvdG9vbHMv
dGVzdGluZy9udmRpbW0vdGVzdC9pb21hcC5jCmluZGV4IDhjZDliOTg3M2E3Zi4uOTAxOWRkOGFm
YmMxIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL252ZGltbS90ZXN0L2lvbWFwLmMKKysrIGIv
dG9vbHMvdGVzdGluZy9udmRpbW0vdGVzdC9pb21hcC5jCkBAIC0xMDYsNyArMTA2LDcgQEAgRVhQ
T1JUX1NZTUJPTChfX3dyYXBfZGV2bV9tZW1yZW1hcCk7CiAKIHN0YXRpYyB2b2lkIG5maXRfdGVz
dF9raWxsKHZvaWQgKl9wZ21hcCkKIHsKLQlXQVJOX09OKCFwZ21hcCB8fCAhcGdtYXAtPnJlZikK
KwlzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBnbWFwID0gX3BnbWFwOwogCiAJaWYgKHBnbWFwLT5vcHMg
JiYgcGdtYXAtPm9wcy0+a2lsbCkKIAkJcGdtYXAtPm9wcy0+a2lsbChwZ21hcCk7CkBAIC0xMjEs
MjAgKzEyMSw0NSBAQCBzdGF0aWMgdm9pZCBuZml0X3Rlc3Rfa2lsbCh2b2lkICpfcGdtYXApCiAJ
fQogfQogCitzdGF0aWMgdm9pZCBkZXZfcGFnZW1hcF9wZXJjcHVfcmVsZWFzZShzdHJ1Y3QgcGVy
Y3B1X3JlZiAqcmVmKQoreworCXN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXAgPQorCQljb250YWlu
ZXJfb2YocmVmLCBzdHJ1Y3QgZGV2X3BhZ2VtYXAsIGludGVybmFsX3JlZik7CisKKwljb21wbGV0
ZSgmcGdtYXAtPmRvbmUpOworfQorCiB2b2lkICpfX3dyYXBfZGV2bV9tZW1yZW1hcF9wYWdlcyhz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXApCiB7CisJaW50IGVy
cm9yOwogCXJlc291cmNlX3NpemVfdCBvZmZzZXQgPSBwZ21hcC0+cmVzLnN0YXJ0OwogCXN0cnVj
dCBuZml0X3Rlc3RfcmVzb3VyY2UgKm5maXRfcmVzID0gZ2V0X25maXRfcmVzKG9mZnNldCk7CiAK
LQlpZiAobmZpdF9yZXMpIHsKLQkJaW50IHJjOworCWlmICghbmZpdF9yZXMpCisJCXJldHVybiBk
ZXZtX21lbXJlbWFwX3BhZ2VzKGRldiwgcGdtYXApOwogCi0JCXJjID0gZGV2bV9hZGRfYWN0aW9u
X29yX3Jlc2V0KGRldiwgbmZpdF90ZXN0X2tpbGwsIHBnbWFwKTsKLQkJaWYgKHJjKQotCQkJcmV0
dXJuIEVSUl9QVFIocmMpOwotCQlyZXR1cm4gbmZpdF9yZXMtPmJ1ZiArIG9mZnNldCAtIG5maXRf
cmVzLT5yZXMuc3RhcnQ7CisJcGdtYXAtPmRldiA9IGRldjsKKwlpZiAoIXBnbWFwLT5yZWYpIHsK
KwkJaWYgKHBnbWFwLT5vcHMgJiYgKHBnbWFwLT5vcHMtPmtpbGwgfHwgcGdtYXAtPm9wcy0+Y2xl
YW51cCkpCisJCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKKworCQlpbml0X2NvbXBsZXRpb24o
JnBnbWFwLT5kb25lKTsKKwkJZXJyb3IgPSBwZXJjcHVfcmVmX2luaXQoJnBnbWFwLT5pbnRlcm5h
bF9yZWYsCisJCQkJZGV2X3BhZ2VtYXBfcGVyY3B1X3JlbGVhc2UsIDAsIEdGUF9LRVJORUwpOwor
CQlpZiAoZXJyb3IpCisJCQlyZXR1cm4gRVJSX1BUUihlcnJvcik7CisJCXBnbWFwLT5yZWYgPSAm
cGdtYXAtPmludGVybmFsX3JlZjsKKwl9IGVsc2UgeworCQlpZiAoIXBnbWFwLT5vcHMgfHwgIXBn
bWFwLT5vcHMtPmtpbGwgfHwgIXBnbWFwLT5vcHMtPmNsZWFudXApIHsKKwkJCVdBUk4oMSwgIk1p
c3NpbmcgcmVmZXJlbmNlIGNvdW50IHRlYXJkb3duIGRlZmluaXRpb25cbiIpOworCQkJcmV0dXJu
IEVSUl9QVFIoLUVJTlZBTCk7CisJCX0KIAl9Ci0JcmV0dXJuIGRldm1fbWVtcmVtYXBfcGFnZXMo
ZGV2LCBwZ21hcCk7CisKKwllcnJvciA9IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIG5m
aXRfdGVzdF9raWxsLCBwZ21hcCk7CisJaWYgKGVycm9yKQorCQlyZXR1cm4gRVJSX1BUUihlcnJv
cik7CisJcmV0dXJuIG5maXRfcmVzLT5idWYgKyBvZmZzZXQgLSBuZml0X3Jlcy0+cmVzLnN0YXJ0
OwogfQogRVhQT1JUX1NZTUJPTF9HUEwoX193cmFwX2Rldm1fbWVtcmVtYXBfcGFnZXMpOwogCg==
--000000000000872d5f058b9e614c
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--000000000000872d5f058b9e614c--
