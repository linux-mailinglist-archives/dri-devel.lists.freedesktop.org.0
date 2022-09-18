Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330D95BC375
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 09:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D1410E54A;
	Mon, 19 Sep 2022 07:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 368 seconds by postgrey-1.36 at gabe;
 Sun, 18 Sep 2022 17:16:08 UTC
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com
 [162.62.57.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B0A10E5BE;
 Sun, 18 Sep 2022 17:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1663521364; bh=dEAf6yNmWJKwq20++XNOsYNIfeZ+EWFczEkClbSCGHI=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date;
 b=N4EyLuodpcsUkXkVboaM5mlBrEwkFDD0o3BT28XzxF1Kdn4j7hEaI5ff++XptpffK
 cwusYJ4xhSQeDKzjHO7pzq+mU1S6M+h0qUMuENuTESHDmBVdUCdEH7L8Ku6/DxwJtO
 IotGqv2KIVE0dERGXmkXNQ/vym8zAENvE8WNgWbU=
X-QQ-FEAT: oHWrrGTW1dCGJEu1CuC8+nIWkvSYK6n9
X-QQ-SSF: 00000000000000F0000000000000
X-QQ-XMAILINFO: OW5zxOp0HHYw+UwB0vls+WkchsAZAy70/n2fIJTFUZGzUjUou4lyh/Ca5hLvhT
 l6dQxfJp4vRtLy+CXAyczXhvGHLDBp/nQ3gOhxxUninx7fI6TdKVCCIwMae+12wkLUH0IrgSc42kk
 rjnqRxSjkoyPwHLh1f4xquvQXrjODTqZS6Ep4iiiP5yFgXDz2EftlOHlmMnfuWFEi/8LhnewESxGP
 56dsfuRLP8d1A8/liuaoC6QUZSGkJ61jAoc3X1CjszT7ZsE1FsCIgtKfwIudrsGIY7jbbNbNRHMfe
 JIVqjTI3Ehqx93kJc/h1bJgJg7dxVinA225fQYjVX+GAmxkVXUpANXgWfkjKtwQS/mzM8UciYAQc3
 8foP61gNKLJ6uesx6R5Jj/l5NRK/B48SxDmpgkxu2UNape1CZlJbvbZvdcjlzxA2K14M1Rx9cDsnJ
 YHMTce7eZ1IoqYQQOT+EqPhiWUEcu25/zeWlCzYpx1Sa6oSbvB+Ocfmst5C6rGQ5eWmepATR/uJ86
 9ojcWOflIjgCdDSx4KphCz8IJiyjEzr8pPHg70N2f9zmHUYhbbsepgWuZhBKH4h2c0L1Ttr25fSb1
 qT/ob5ibcJjTcSiN6sNejouXr7qfMxWTo6836utbCXSS9Cwb6AtyqlqDTwWMhT2OT7uwJOBW6+os5
 3pROdDZFNEl8kOzN2IMHftITxlUsRUICO3JY8PHvNgkXHUdzFQfiLdQgS7QG/bptl2fXHh83UkGJJ
 U9b0aruI4J4GnvkdW35LYk0eQCMkWJTw81KXyyM5o/zGUjLy2wffQ8seU0v2ZbHA7hxk41/0Q8YOL
 eKLCKG8M8yKY5NDoWejpUafOCbEe8mCfnSqSOBkpP0LHb/7fVuU0Dl8msm8fafTXvVyfieSxnOjP4
 wM+PNyhQM6hvu8CrX+8ZwKOowTVOvXEgqcQruZjNlinP/mEnpz3CeEkv3Xr8FT17ealAid+ATNG0k
 kms1bSqQ==
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 114.249.151.134
In-Reply-To: <YyWOh+jGvmSdrHqz@kroah.com>
References: <CAJedcCweHjD78F7iydiq6Xc2iH=t_3m=H9JKnaCooToUk32FvQ@mail.gmail.com>
 <YxWtfjfpNsoPUrgh@kroah.com>
 <CAJedcCzMo51aiy=Dv7zn7VmL3gwkw7JgzwAPAB2Z27C9CnhoYA@mail.gmail.com>
 <20220907030754.GU1089@zhen-hp.sh.intel.com>
 <CAJedcCxO_Rq0qMeLiHtY5+FuN1A1pDGsZd3gMtvUpm1xbAK3aA@mail.gmail.com>
 <Yxmzj2nCoTKurCY8@kroah.com>
 <CAJedcCwVC6Rg+wF7h6GhFvL6BGkKV=DS9Mo9fOf-gfDAk9VqPg@mail.gmail.com>
 <CAJedcCxRQ4h-ChNsD4OWpDMUJd3JNaQrvD=uVKxMpYONGFUgzA@mail.gmail.com>
 <YyQzDlM5n7mOLh5Q@kroah.com>
 <CAJedcCzt_1ZRV5egMLdoFVZ4hBDE+nDu9fLkBuGY0A=uYicvQA@mail.gmail.com>
 <YyWOh+jGvmSdrHqz@kroah.com>
X-QQ-STYLE: 
X-QQ-mid: webmail646t1663520924t6827357
From: "=?gb18030?B?s68=?=" <1002992920@qq.com>
To: "=?gb18030?B?R3JlZyBLSA==?=" <gregkh@linuxfoundation.org>,
 "=?gb18030?B?WmhlbmcgSGFja2Vy?=" <hackerzheng666@gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry.
Mime-Version: 1.0
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64
Date: Mon, 19 Sep 2022 01:08:44 +0800
X-Priority: 3
Message-ID: <tencent_36196E8CD75A09D21A47CE65C842E97EF805@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-Mailman-Approved-At: Mon, 19 Sep 2022 07:18:40 +0000
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
Cc: =?gb18030?B?YWxleDAwMHlvdW5nQGdtYWlsLmNvbQ==?= <alex000young@gmail.com>,
 =?gb18030?B?c2VjdXJpdHlAa2VybmVsLm9yZw==?= <security@kernel.org>,
 =?gb18030?B?dHZydGtvLnVyc3VsaW5AbGludXguaW50ZWwuY29t?=
 <tvrtko.ursulin@linux.intel.com>,
 =?gb18030?B?YWlybGllZEBsaW51eC5pZQ==?= <airlied@linux.ie>,
 =?gb18030?B?aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw==?=
 <intel-gfx@lists.freedesktop.org>,
 =?gb18030?B?bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw==?=
 <linux-kernel@vger.kernel.org>,
 =?gb18030?B?ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw==?=
 <dri-devel@lists.freedesktop.org>,
 =?gb18030?B?cm9kcmlnby52aXZpQGludGVsLmNvbQ==?= <rodrigo.vivi@intel.com>,
 =?gb18030?B?aW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc=?=
 <intel-gvt-dev@lists.freedesktop.org>,
 =?gb18030?B?emhpLmEud2FuZ0BpbnRlbC5jb20=?= <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbSBhZmU3OTg0OGNiNzRjYzhlNDVhYjQyNmQxM2ZhMjM5NGM4N2UwNDIyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiB4bXp5c2h5cG5jICZsdDsxMDAyOTkyOTIwQHFxLmNv
bSZndDsKRGF0ZTogRnJpLCAxNiBTZXAgMjAyMiAyMzo0ODoyMyArMDgwMApTdWJqZWN0OiBb
UEFUQ0hdIGRybS9pOTE1L2d2dDogZml4IGRvdWJsZS1mcmVlIGJ1ZyBpbiBzcGxpdF8yTUJf
Z3R0X2VudHJ5CgpUaGVyZSBpcyBhIGRvdWJsZS1mcmVlIHNlY3VyaXR5IGJ1ZyBpbiBzcGxp
dF8yTUJfZ3R0X2VudHJ5LgoKSGVyZSBpcyBhIGNhbGxpbmcgY2hhaW4gOgpwcGd0dF9wb3B1
bGF0ZV9zcHQtJmd0O3BwZ3R0X3BvcHVsYXRlX3NoYWRvd19lbnRyeS0mZ3Q7c3BsaXRfMk1C
X2d0dF9lbnRyeS4KCklmIGludGVsX2d2dF9kbWFfbWFwX2d1ZXN0X3BhZ2UgZmFpbGVkLCBp
dCB3aWxsIGNhbGwKcHBndHRfaW52YWxpZGF0ZV9zcHQsIHdoaWNoIHdpbGwgZmluYWxseSBj
YWxsIHBwZ3R0X2ZyZWVfc3B0IGFuZAprZnJlZShzcHQpLiBCdXQgdGhlIGNhbGxlciBkb2Vz
IG5vdCBub3RpY2UgdGhhdCwgYW5kIGl0IHdpbGwgY2FsbApwcGd0dF9mcmVlX3NwdCBhZ2Fp
biBpbiBlcnJvciBwYXRoLgoKRml4IHRoaXMgYnkgb25seSBmcmVlaW5nIHNwdCBpbiBwcGd0
dF9pbnZhbGlkYXRlX3NwdCBpbiBnb29kIGNhc2UuCgpTaWduZWQtb2ZmLWJ5OiB4bXp5c2h5
cG5jICZsdDsxMDAyOTkyOTIwQHFxLmNvbSZndDsKLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZ3R0LmMgfCAxNiArKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwpp
bmRleCBjZTBlYjAzNzA5YzMuLjU1MDUxOWYwYWNjYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9n
dHQuYwpAQCAtOTU5LDcgKzk1OSw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IHBwZ3R0X3B1dF9z
cHQoc3RydWN0IGludGVsX3ZncHVfcHBndHRfc3B0ICpzcHQpCiAJcmV0dXJuIGF0b21pY19k
ZWNfcmV0dXJuKCZhbXA7c3B0LSZndDtyZWZjb3VudCk7CiB9CiAKLXN0YXRpYyBpbnQgcHBn
dHRfaW52YWxpZGF0ZV9zcHQoc3RydWN0IGludGVsX3ZncHVfcHBndHRfc3B0ICpzcHQpOwor
c3RhdGljIGludCBwcGd0dF9pbnZhbGlkYXRlX3NwdChzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0
dF9zcHQgKnNwdCwgaW50IGlzX2Vycm9yKTsKIAogc3RhdGljIGludCBwcGd0dF9pbnZhbGlk
YXRlX3NwdF9ieV9zaGFkb3dfZW50cnkoc3RydWN0IGludGVsX3ZncHUgKnZncHUsCiAJCXN0
cnVjdCBpbnRlbF9ndnRfZ3R0X2VudHJ5ICplKQpAQCAtOTk1LDcgKzk5NSw3IEBAIHN0YXRp
YyBpbnQgcHBndHRfaW52YWxpZGF0ZV9zcHRfYnlfc2hhZG93X2VudHJ5KHN0cnVjdCBpbnRl
bF92Z3B1ICp2Z3B1LAogCQkJCW9wcy0mZ3Q7Z2V0X3BmbihlKSk7CiAJCXJldHVybiAtRU5Y
SU87CiAJfQotCXJldHVybiBwcGd0dF9pbnZhbGlkYXRlX3NwdChzKTsKKwlyZXR1cm4gcHBn
dHRfaW52YWxpZGF0ZV9zcHQocywgMCk7CiB9CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBwcGd0
dF9pbnZhbGlkYXRlX3B0ZShzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQgKnNwdCwKQEAg
LTEwMTYsNyArMTAxNiw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwcGd0dF9pbnZhbGlkYXRl
X3B0ZShzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQgKnNwdCwKIAlpbnRlbF9ndnRfZG1h
X3VubWFwX2d1ZXN0X3BhZ2UodmdwdSwgcGZuICZsdDsmbHQ7IFBBR0VfU0hJRlQpOwogfQog
Ci1zdGF0aWMgaW50IHBwZ3R0X2ludmFsaWRhdGVfc3B0KHN0cnVjdCBpbnRlbF92Z3B1X3Bw
Z3R0X3NwdCAqc3B0KQorc3RhdGljIGludCBwcGd0dF9pbnZhbGlkYXRlX3NwdChzdHJ1Y3Qg
aW50ZWxfdmdwdV9wcGd0dF9zcHQgKnNwdCwgaW50IGlzX2Vycm9yKQogewogCXN0cnVjdCBp
bnRlbF92Z3B1ICp2Z3B1ID0gc3B0LSZndDt2Z3B1OwogCXN0cnVjdCBpbnRlbF9ndnRfZ3R0
X2VudHJ5IGU7CkBAIC0xMDU5LDkgKzEwNTksMTEgQEAgc3RhdGljIGludCBwcGd0dF9pbnZh
bGlkYXRlX3NwdChzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQgKnNwdCkKIAkJfQogCX0K
IAotCXRyYWNlX3NwdF9jaGFuZ2Uoc3B0LSZndDt2Z3B1LSZndDtpZCwgInJlbGVhc2UiLCBz
cHQsCisJaWYgKCFpc19lcnJvcikgeworCQl0cmFjZV9zcHRfY2hhbmdlKHNwdC0mZ3Q7dmdw
dS0mZ3Q7aWQsICJyZWxlYXNlIiwgc3B0LAogCQkJIHNwdC0mZ3Q7Z3Vlc3RfcGFnZS5nZm4s
IHNwdC0mZ3Q7c2hhZG93X3BhZ2UudHlwZSk7Ci0JcHBndHRfZnJlZV9zcHQoc3B0KTsKKwkJ
cHBndHRfZnJlZV9zcHQoc3B0KTsKKwl9CiAJcmV0dXJuIDA7CiBmYWlsOgogCWd2dF92Z3B1
X2VycigiZmFpbDogc2hhZG93IHBhZ2UgJXAgc2hhZG93IGVudHJ5IDB4JWxseCB0eXBlICVk
XG4iLApAQCAtMTIxNSw3ICsxMjE3LDcgQEAgc3RhdGljIGludCBzcGxpdF8yTUJfZ3R0X2Vu
dHJ5KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LAogCQlyZXQgPSBpbnRlbF9ndnRfZG1hX21h
cF9ndWVzdF9wYWdlKHZncHUsIHN0YXJ0X2dmbiArIHN1Yl9pbmRleCwKIAkJCQkJCSAgIFBB
R0VfU0laRSwgJmFtcDtkbWFfYWRkcik7CiAJCWlmIChyZXQpIHsKLQkJCXBwZ3R0X2ludmFs
aWRhdGVfc3B0KHNwdCk7CisJCQlwcGd0dF9pbnZhbGlkYXRlX3NwdChzcHQsIDEpOwogCQkJ
cmV0dXJuIHJldDsKIAkJfQogCQlzdWJfc2UudmFsNjQgPSBzZS0mZ3Q7dmFsNjQ7CkBAIC0x
MzkzLDcgKzEzOTUsNyBAQCBzdGF0aWMgaW50IHBwZ3R0X2hhbmRsZV9ndWVzdF9lbnRyeV9y
ZW1vdmFsKHN0cnVjdCBpbnRlbF92Z3B1X3BwZ3R0X3NwdCAqc3B0LAogCQkJcmV0ID0gLUVO
WElPOwogCQkJZ290byBmYWlsOwogCQl9Ci0JCXJldCA9IHBwZ3R0X2ludmFsaWRhdGVfc3B0
KHMpOworCQlyZXQgPSBwcGd0dF9pbnZhbGlkYXRlX3NwdChzLCAwKTsKIAkJaWYgKHJldCkK
IAkJCWdvdG8gZmFpbDsKIAl9IGVsc2UgewotLSAKMi4yNS4x
ù
