Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9867E4904
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 20:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4C510E664;
	Tue,  7 Nov 2023 19:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85CD10E664;
 Tue,  7 Nov 2023 19:12:35 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1dd71c0a41fso3668991fac.2; 
 Tue, 07 Nov 2023 11:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699384355; x=1699989155; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lsEdx/pIpd6VjBja4BomNRJwG3m9TGb0lvZz2SQW1wc=;
 b=VC88MqXAdy14vE5bQ4I/8QVVxyuZo6REd82Mr1M28GLhkV1AtoFhOvQeX0OI8AoHDD
 q74/Cj1V7/qgJ/3S9+bznh8o+WQnzdHs03ylBB04Xevql+UTTBgQ97jkmBFD6YqxNMjQ
 ySn+frEaAoqu586NRwIVXN/E/0Ke2BYj89XI9mk+JAT+HEkL//r1ZZDGpqhK0LYKaNv/
 F7U1EuhdQUPpCHZ271HdJfzL+TzLrNSjA8Sfuvigda1BUV/jH7tpCzn0emJPbykWpF1F
 zB4prNl25tawxdg2CuliVJsJkMGYrCE4EtbF2X2QXnrfxfGAHbi7MjXbd+oyIY2NTM8P
 e3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699384355; x=1699989155;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lsEdx/pIpd6VjBja4BomNRJwG3m9TGb0lvZz2SQW1wc=;
 b=vsQJhT4YkQCzZH4F7RkEUXPnepYFTQh1GNfXTmV9UJ835tLjHjvAqqJSFshR5meP9u
 VxlV0IO2ZSLW+NQamNaqFNFtdW2nYyGJCQX9lDvvZUtd82/eHGY0dTgcbnBjWM1UH4Re
 zcvco5ouU3bMVFQHCby7iWRFyuRZjCB/nh9287U1JZM4dmooUCUEKaRs2qlEwAeQzKMz
 PCWNgYDIizeLgJExjWfcqtf5YS1c8mrt8dhoeeOj7+jSm8nlfrOrAikD0rehg/1EIalS
 WIFq6LvTXNPumNe93jwaCtq5NUfcjqLj+yeakKF6iRKMHCyqjbmTU+DzLCFrfDmYZmEI
 tm1Q==
X-Gm-Message-State: AOJu0YzuOtBpUT9HHlPXTYmIXQyJloIKJ6BK0LwscexuyjPcyu7EohrM
 0/HXC8R3onNUttuoxhDELwSPnqj2mIl81e9ilgc=
X-Google-Smtp-Source: AGHT+IG+3D6S4x+KeUoSLWLApvR8786kj4CCLxuWT4VuKzXK7JqPn4epd1YE9SwAOtXBbZnPlUMwIr/iJMYt2/Ts5Eg=
X-Received: by 2002:a05:6870:ff0b:b0:1e9:9989:33a5 with SMTP id
 qn11-20020a056870ff0b00b001e9998933a5mr3730885oab.5.1699384354949; Tue, 07
 Nov 2023 11:12:34 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsNsDLvZR8RGf9ji5938QreSix89FCpGHju+9in2x6OfDw@mail.gmail.com>
 <CADnq5_ObMvxN4pFAsWU7OM3SAtYCNHKE_fHsLqizGm0p1ubp=w@mail.gmail.com>
 <CABXGCsPXp_pWZcyVQajYSTZKeViRqjfXK2=jmuRXh0yug_OoWQ@mail.gmail.com>
In-Reply-To: <CABXGCsPXp_pWZcyVQajYSTZKeViRqjfXK2=jmuRXh0yug_OoWQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Nov 2023 14:12:23 -0500
Message-ID: <CADnq5_ND_aBmsD3X=tx2==EM7VOz4EBwid4hRVZ79mbi6bWq1w@mail.gmail.com>
Subject: Re: 6.7/regression/KASAN: null-ptr-deref in
 amdgpu_ras_reset_error_count+0x2d6
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000d09337060994c062"
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000d09337060994c062
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 7, 2023 at 1:18=E2=80=AFPM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> On Mon, Nov 6, 2023 at 8:29=E2=80=AFPM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
> >
> > Already fixed in this commit:
> > https://gitlab.freedesktop.org/agd5f/linux/-/commit/d1d4c0b7b65b7fab2bc=
6f97af9e823b1c42ccdb0
> > Which is in included in last weeks PR.
> >
>
> Thanks, it fixed the issue above.
> But, unfortunately this is not the only problem which I see on my laptop.
> Now I am observing 100% GPU loading all the time.
> And it looks as I show on this screenshot: https://postimg.cc/QHLQncMg
>
> And another bisect round says that this commit is blame:
> =E2=9D=AF git bisect good
> de59b69932e64d77445d973a101d81d6e7e670c6 is the first bad commit
> commit de59b69932e64d77445d973a101d81d6e7e670c6
> Author: Alex Deucher <alexander.deucher@amd.com>
> Date:   Wed Sep 20 13:27:58 2023 -0400
>
>     drm/amdgpu/gmc: set a default disable value for AGP
>
>     To disable AGP, the start needs to be set to a higher
>     value than the end.  Set a default disable value for
>     the AGP aperture and allow the IP specific GMC code
>     to enable it selectively be calling amdgpu_gmc_agp_location().
>
>     Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c           | 27 ++++++++++++++++-=
------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h           |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c        |  3 +++
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c            |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c            |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c             |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c             |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c             |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c             |  3 ++-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
>  10 files changed, 37 insertions(+), 18 deletions(-)
>
> I checked twice and ensure that it not happens on commit
> 29495d81457a483c2859ccde59cc063034bfe47d

The attached patch should fix it.  Not sure why your GPU shows up as
busy.  The AGP aperture was just disabled.

Alex

--000000000000d09337060994c062
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-fix-AGP-init-order.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-fix-AGP-init-order.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_loopk5uf0>
X-Attachment-Id: f_loopk5uf0

RnJvbSA4NDRkNmQ5MDk4ZDY1YzJmZDhlNzg3NDFjNzlmZmMyZmI2ZTZjMmU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFR1ZSwgNyBOb3YgMjAyMyAxNDowNzo0NCAtMDUwMApTdWJqZWN0OiBbUEFUQ0hd
IGRybS9hbWRncHU6IGZpeCBBR1AgaW5pdCBvcmRlcgoKVGhlIGRlZmF1bHQgQUdQIHNldHRpbmdz
IHdlcmUgb3ZlcndyaXRpbmcgdGhlIElQIHNlbGVjdGVkCm9uZXMgc2luY2UgdGhlIGRlZmF1bHQg
d2FzIGdldHRpbmcgc2V0IGFmdGVyIHRoZSBJUCBvbmVzCndlcmUgc2VsZWN0ZWQuCgpGaXhlczog
ZGU1OWI2OTkzMmU2ICgiZHJtL2FtZGdwdS9nbWM6IHNldCBhIGRlZmF1bHQgZGlzYWJsZSB2YWx1
ZSBmb3IgQUdQIikKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgpDYzogTWlraGFpbCBHYXZyaWxvdiA8bWlraGFpbC52LmdhdnJpbG92QGdtYWls
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMgfCAz
IC0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgICAgIHwgMSArCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjExXzAuYyAgICAgfCAxICsKIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192Nl8wLmMgICAgICB8IDEgKwogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y3XzAuYyAgICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjhfMC5jICAgICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192OV8wLmMgICAgICB8IDIgKysKIDcgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3Qu
YwppbmRleCAwZGNiNmMzNmIwMmMuLmNlZjkyMGE5MzkyNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwpAQCAtMTA2Miw5ICsxMDYyLDYgQEAgc3RhdGljIGNv
bnN0IGNoYXIgKiBjb25zdCBhbWRncHVfdnJhbV9uYW1lc1tdID0gewogICovCiBpbnQgYW1kZ3B1
X2JvX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7Ci0JLyogc2V0IHRoZSBkZWZh
dWx0IEFHUCBhcGVydHVyZSBzdGF0ZSAqLwotCWFtZGdwdV9nbWNfc2V0X2FncF9kZWZhdWx0KGFk
ZXYsICZhZGV2LT5nbWMpOwotCiAJLyogT24gQStBIHBsYXRmb3JtLCBWUkFNIGNhbiBiZSBtYXBw
ZWQgYXMgV0IgKi8KIAlpZiAoIWFkZXYtPmdtYy54Z21pLmNvbm5lY3RlZF90b19jcHUgJiYgIWFk
ZXYtPmdtYy5pc19hcHBfYXB1KSB7CiAJCS8qIHJlc2VydmUgUEFUIG1lbW9yeSBzcGFjZSB0byBX
QyBmb3IgVlJBTSAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYwppbmRleCBk
OGE0ZmRkYWI5YzEuLmVmODBlYTA5MjlmZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3YxMF8wLmMKQEAgLTY3Miw2ICs2NzIsNyBAQCBzdGF0aWMgdm9pZCBnbWNfdjEwXzBfdnJhbV9n
dHRfbG9jYXRpb24oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJLyogYWRkIHRoZSB4Z21p
IG9mZnNldCBvZiB0aGUgcGh5c2ljYWwgbm9kZSAqLwogCWJhc2UgKz0gYWRldi0+Z21jLnhnbWku
cGh5c2ljYWxfbm9kZV9pZCAqIGFkZXYtPmdtYy54Z21pLm5vZGVfc2VnbWVudF9zaXplOwogCisJ
YW1kZ3B1X2dtY19zZXRfYWdwX2RlZmF1bHQoYWRldiwgbWMpOwogCWFtZGdwdV9nbWNfdnJhbV9s
b2NhdGlvbihhZGV2LCAmYWRldi0+Z21jLCBiYXNlKTsKIAlhbWRncHVfZ21jX2dhcnRfbG9jYXRp
b24oYWRldiwgbWMsIEFNREdQVV9HQVJUX1BMQUNFTUVOVF9CRVNUX0ZJVCk7CiAJaWYgKCFhbWRn
cHVfc3Jpb3ZfdmYoYWRldikpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTFfMC5jCmlu
ZGV4IDQ3MTNhNjJhZDU4Ni4uNWY3OTRhOTA3OTQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nbWNfdjExXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjExXzAuYwpAQCAtNjM3LDYgKzYzNyw3IEBAIHN0YXRpYyB2b2lkIGdtY192MTFfMF92
cmFtX2d0dF9sb2NhdGlvbihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAogCWJhc2UgPSBh
ZGV2LT5tbWh1Yi5mdW5jcy0+Z2V0X2ZiX2xvY2F0aW9uKGFkZXYpOwogCisJYW1kZ3B1X2dtY19z
ZXRfYWdwX2RlZmF1bHQoYWRldiwgbWMpOwogCWFtZGdwdV9nbWNfdnJhbV9sb2NhdGlvbihhZGV2
LCAmYWRldi0+Z21jLCBiYXNlKTsKIAlhbWRncHVfZ21jX2dhcnRfbG9jYXRpb24oYWRldiwgbWMs
IEFNREdQVV9HQVJUX1BMQUNFTUVOVF9ISUdIKTsKIAlpZiAoIWFtZGdwdV9zcmlvdl92ZihhZGV2
KSB8fApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y2XzAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192Nl8wLmMKaW5kZXggN2Y2Njk1NGZkMzAy
Li40MmUxMDNkNzA3N2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192Nl8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y2XzAuYwpAQCAt
MjExLDYgKzIxMSw3IEBAIHN0YXRpYyB2b2lkIGdtY192Nl8wX3ZyYW1fZ3R0X2xvY2F0aW9uKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCiAJYmFzZSA8PD0gMjQ7CiAKKwlhbWRncHVfZ21j
X3NldF9hZ3BfZGVmYXVsdChhZGV2LCBtYyk7CiAJYW1kZ3B1X2dtY192cmFtX2xvY2F0aW9uKGFk
ZXYsIG1jLCBiYXNlKTsKIAlhbWRncHVfZ21jX2dhcnRfbG9jYXRpb24oYWRldiwgbWMsIEFNREdQ
VV9HQVJUX1BMQUNFTUVOVF9CRVNUX0ZJVCk7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3Y3XzAuYwppbmRleCA2MWNhMWE4MmI2NTEuLmVmYzE2ZTU4MGYxZSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjdfMC5jCkBAIC0yMzksNiArMjM5LDcgQEAgc3RhdGljIHZvaWQgZ21j
X3Y3XzBfdnJhbV9ndHRfbG9jYXRpb24oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAli
YXNlIDw8PSAyNDsKIAorCWFtZGdwdV9nbWNfc2V0X2FncF9kZWZhdWx0KGFkZXYsIG1jKTsKIAlh
bWRncHVfZ21jX3ZyYW1fbG9jYXRpb24oYWRldiwgbWMsIGJhc2UpOwogCWFtZGdwdV9nbWNfZ2Fy
dF9sb2NhdGlvbihhZGV2LCBtYywgQU1ER1BVX0dBUlRfUExBQ0VNRU5UX0JFU1RfRklUKTsKIH0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjhfMC5jCmluZGV4IGZhNTk3NDljMmFlZi4uZmY0
YWU3M2QyN2VjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjhf
MC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMKQEAgLTQxMyw2
ICs0MTMsNyBAQCBzdGF0aWMgdm9pZCBnbWNfdjhfMF92cmFtX2d0dF9sb2NhdGlvbihzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKIAkJYmFzZSA9IFJSRUczMihtbU1DX1ZNX0ZCX0xPQ0FUSU9O
KSAmIDB4RkZGRjsKIAliYXNlIDw8PSAyNDsKIAorCWFtZGdwdV9nbWNfc2V0X2FncF9kZWZhdWx0
KGFkZXYsIG1jKTsKIAlhbWRncHVfZ21jX3ZyYW1fbG9jYXRpb24oYWRldiwgbWMsIGJhc2UpOwog
CWFtZGdwdV9nbWNfZ2FydF9sb2NhdGlvbihhZGV2LCBtYywgQU1ER1BVX0dBUlRfUExBQ0VNRU5U
X0JFU1RfRklUKTsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4IGI2
NmM1ZjdlMWM1Ni4uZmU1MmQxMzJiNjI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMKQEAgLTE2MTQsNiArMTYxNCw4IEBAIHN0YXRpYyB2b2lkIGdtY192OV8wX3ZyYW1fZ3R0
X2xvY2F0aW9uKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogewogCXU2NCBiYXNlID0gYWRl
di0+bW1odWIuZnVuY3MtPmdldF9mYl9sb2NhdGlvbihhZGV2KTsKIAorCWFtZGdwdV9nbWNfc2V0
X2FncF9kZWZhdWx0KGFkZXYsIG1jKTsKKwogCS8qIGFkZCB0aGUgeGdtaSBvZmZzZXQgb2YgdGhl
IHBoeXNpY2FsIG5vZGUgKi8KIAliYXNlICs9IGFkZXYtPmdtYy54Z21pLnBoeXNpY2FsX25vZGVf
aWQgKiBhZGV2LT5nbWMueGdtaS5ub2RlX3NlZ21lbnRfc2l6ZTsKIAlpZiAoYWRldi0+Z21jLnhn
bWkuY29ubmVjdGVkX3RvX2NwdSkgewotLSAKMi40MS4wCgo=
--000000000000d09337060994c062--
