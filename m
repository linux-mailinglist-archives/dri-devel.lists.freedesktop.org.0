Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE5D68024A
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 23:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD52B10E081;
	Sun, 29 Jan 2023 22:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E3A10E063;
 Sun, 29 Jan 2023 22:36:18 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id z9so8620418qtv.5;
 Sun, 29 Jan 2023 14:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fFrh0pKgZJpJJGzsGCczy6pWPp4yact3E0+EfHTzMNw=;
 b=hnvlVNOjrI+AvOzslffuR1SuQniLkMRo+KVfz8SIXleBn4oyaRo9ILzvwX3RucBYjF
 VTNMVG2011Yaue4fwXArSMl+UXvNvTZvN/fECB8qfmMOqnhlnOeNtoB7S7IXXOfTfvWA
 9KoOjuEruHQwGshB3DZvjxje10Ur1aq2CDjwRWkVgGx4N9tKpGQX254t/P2ZFPLZlyB5
 /iw4UPwX0KgJ2Ww/dHzhLB3WWmgr7TVjtzSeALS1Pwf/7veGz3TgLfS12kBRt+pYVgsv
 lQ0Q6lMBml/bv9JVcg5Cc1qHAW2sajyMheLPRUF5wLz9g2LHrHOsQLeG8xfFffosIe68
 Uudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fFrh0pKgZJpJJGzsGCczy6pWPp4yact3E0+EfHTzMNw=;
 b=eFid1rkmoFf1dqVApZJQI5La7N4qrYQJmwtl2HSw1vj8AA3zohlf16KxSdWdgHk0ph
 davxV9C7S3ZRuuvns31VgOXqv8le7aZ0WhWfLmsrhNzaUyrWNH6LgrgjaF8iWX3ZTUmo
 f3sFOrOpOUvQKbF0VyhH0ChL0RxS7/sG77x73X4+hhSn412vJnMrx1zj+tIIRHR+0+YO
 SDrASr9lLlwUkpnQ4aCbrd5NsALlxMzxdWvGQlglwvDgHFE/tDNS+ruBaj+u+Y2xe2EE
 6JK2QRNMsKFufgQlkd/OzWnxyYmch+ywCd5qyp3Xx3BcxzeXIPuJD9078Y1uE3l3+lCQ
 vibQ==
X-Gm-Message-State: AO0yUKVFccuTuISrlmCr7F5rGseXkndew9JIJTifLJR594car/7K6YwQ
 JK3XKqoiVsu4eOmq3HNwZhheU6fl3ArgKOV4q28=
X-Google-Smtp-Source: AK7set/DSZ+qZ9zPwwft+8UYO6LW4i0sH3FWdbd0fn7nbj3vChP2x8bfT36nlqLzIbGOuIG5cAE71jtS4Wn3QYPDn+A=
X-Received: by 2002:ac8:5e0e:0:b0:3b8:6577:8c31 with SMTP id
 h14-20020ac85e0e000000b003b865778c31mr187218qtx.339.1675031777858; Sun, 29
 Jan 2023 14:36:17 -0800 (PST)
MIME-Version: 1.0
References: <CACAvsv4_XJLSwnA-s0BXLVbBCESDfnK7kx5-WUPd2+vdJuMojg@mail.gmail.com>
 <20230127103959.5nqk57sb7qchtaw6@wslaptop>
In-Reply-To: <20230127103959.5nqk57sb7qchtaw6@wslaptop>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 30 Jan 2023 08:36:06 +1000
Message-ID: <CACAvsv5sA8pmhYEVhJk9PEAWyKRZYvcsSHa-04CsJxgu7+YEiw@mail.gmail.com>
Subject: Re: [REGRESSION] GM20B probe fails after commit 2541626cfb79
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Content-Type: multipart/mixed; boundary="0000000000001b9a0b05f36eba2d"
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
Cc: regressions@lists.linux.dev, kherbst@redhat.com, kwizart@gmail.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000001b9a0b05f36eba2d
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Jan 2023 at 20:42, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
>
> On Fri, Jan 27, 2023 at 04:00:59PM +1000, Ben Skeggs wrote:
> > On Fri, 20 Jan 2023 at 21:37, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
> > >
> > > On Wed, Jan 18, 2023 at 11:28:49AM +1000, Ben Skeggs wrote:
> > > > On Mon, 16 Jan 2023 at 22:27, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
> > > > > On Mon, Jan 16, 2023 at 07:45:05AM +1000, David Airlie wrote:
> > > > > > As a quick check can you try changing
> > > > > >
> > > > > > drivers/gpu/drm/nouveau/nvkm/core/firmware.c:nvkm_firmware_mem_target
> > > > > > from NVKM_MEM_TARGET_HOST to NVKM_MEM_TARGET_NCOH ?
> > >
> > > > In addition to Dave's change, can you try changing the
> > > > nvkm_falcon_load_dmem() call in gm20b_pmu_init() to:
> > > >
> > > > nvkm_falcon_pio_wr(falcon, (u8 *)&args, 0, 0, DMEM, addr_args,
> > > > sizeof(args), 0, false);
> > >
> > > Chiming in just to say that with this change I see the same as Nicolas
> > > except that the init message size is 255 instead of 0:
> > >
> > > [    2.196934] nouveau 57000000.gpu: pmu: unexpected init message size 255 vs 42
> > I've attached an entirely untested patch (to go on top of the other
> > hacks/fixes so far), that will hopefully get us a little further.
>
> Hello,
>
> Thank you for the patch! I can confirm that it fixes the problem
> on the Pixel C, and everything works as before the regression.
> With this, for the combination of patches
>
> Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>
> which I can resend after testing the final patch version.
Thank you (both!) for testing!

I've attached a "final" version of a patch that I'll send (assuming it
still works ;)) after re-testing.  There's only a minor change to
avoid breaking the non-Tegra path, so I expect it should be fine.

Ben.
>
> Thanks,
> Diogo

--0000000000001b9a0b05f36eba2d
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-nouveau-acr-gm20b-regression-fixes.patch"
Content-Disposition: attachment; 
	filename="0001-drm-nouveau-acr-gm20b-regression-fixes.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ldhynvap0>
X-Attachment-Id: f_ldhynvap0

RnJvbSBiZmMxYjg0ZDI2Y2EyOGY3OGEwN2Q0OTRiMDgxM2ZlNjQyZTgwYmJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkRhdGU6
IEZyaSwgMjcgSmFuIDIwMjMgMTU6NDI6MjcgKzEwMDAKU3ViamVjdDogW1BBVENIXSBkcm0vbm91
dmVhdS9hY3IvZ20yMGI6IHJlZ3Jlc3Npb24gZml4ZXMKCk1pc3NlZCBzb21lIFRlZ3JhLXNwZWNp
ZmljIHF1aXJrcyB3aGVuIHJld29ya2luZyBBQ1IgdG8gc3VwcG9ydCBBbXBlcmUuCgpGaXhlczog
MjU0MTYyNmNmYjc5ICgiZHJtL25vdXZlYXUvYWNyOiB1c2UgY29tbW9uIGZhbGNvbiBIUyBGVyBj
b2RlIGZvcglBQ1IgRldzIikKU2lnbmVkLW9mZi1ieTogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRo
YXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vY29yZS9maXJtd2FyZS5j
ICAgIHwgIDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2ZhbGNvbi9nbTIwMC5j
ICAgICB8IDE0ICsrKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1
YmRldi9wbXUvZ20yMGIuYyB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bnZrbS9jb3JlL2Zpcm13YXJlLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2NvcmUv
ZmlybXdhcmUuYwppbmRleCBmY2YyYTAwMmY2Y2IuLjkxZmI0OTRkNDAwOSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9jb3JlL2Zpcm13YXJlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbnZrbS9jb3JlL2Zpcm13YXJlLmMKQEAgLTE1MSw2ICsxNTEsOSBA
QCBudmttX2Zpcm13YXJlX21lbV9wYWdlKHN0cnVjdCBudmttX21lbW9yeSAqbWVtb3J5KQogc3Rh
dGljIGVudW0gbnZrbV9tZW1vcnlfdGFyZ2V0CiBudmttX2Zpcm13YXJlX21lbV90YXJnZXQoc3Ry
dWN0IG52a21fbWVtb3J5ICptZW1vcnkpCiB7CisJaWYgKG52a21fZmlybXdhcmVfbWVtKG1lbW9y
eSktPmRldmljZS0+ZnVuYy0+dGVncmEpCisJCXJldHVybiBOVktNX01FTV9UQVJHRVRfTkNPSDsK
KwogCXJldHVybiBOVktNX01FTV9UQVJHRVRfSE9TVDsKIH0KIApkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbnZrbS9mYWxjb24vZ20yMDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L252a20vZmFsY29uL2dtMjAwLmMKaW5kZXggMzkzYWRlOWY3ZTZjLi5iN2RhM2FiNDRj
MjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZmFsY29uL2dtMjAw
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9mYWxjb24vZ20yMDAuYwpAQCAt
NDgsNiArNDgsMTYgQEAgZ20yMDBfZmxjbl9waW9fZG1lbV9yZChzdHJ1Y3QgbnZrbV9mYWxjb24g
KmZhbGNvbiwgdTggcG9ydCwgY29uc3QgdTggKmltZywgaW50IGwKIAkJaW1nICs9IDQ7CiAJCWxl
biAtPSA0OwogCX0KKworCS8qIFNpZ2guICBUZWdyYSBQTVUgRlcncyBpbml0IG1lc3NhZ2UuLi4g
Ki8KKwlpZiAobGVuKSB7CisJCXUzMiBkYXRhID0gbnZrbV9mYWxjb25fcmQzMihmYWxjb24sIDB4
MWM0ICsgKHBvcnQgKiA4KSk7CisKKwkJd2hpbGUgKGxlbi0tKSB7CisJCQkqKHU4ICopaW1nKysg
PSBkYXRhICYgMHhmZjsKKwkJCWRhdGEgPj49IDg7CisJCX0KKwl9CiB9CiAKIHN0YXRpYyB2b2lk
CkBAIC02NCw2ICs3NCw4IEBAIGdtMjAwX2ZsY25fcGlvX2RtZW1fd3Ioc3RydWN0IG52a21fZmFs
Y29uICpmYWxjb24sIHU4IHBvcnQsIGNvbnN0IHU4ICppbWcsIGludCBsCiAJCWltZyArPSA0Owog
CQlsZW4gLT0gNDsKIAl9CisKKwlXQVJOX09OKGxlbik7CiB9CiAKIHN0YXRpYyB2b2lkCkBAIC03
NCw3ICs4Niw3IEBAIGdtMjAwX2ZsY25fcGlvX2RtZW1fd3JfaW5pdChzdHJ1Y3QgbnZrbV9mYWxj
b24gKmZhbGNvbiwgdTggcG9ydCwgYm9vbCBzZWMsIHUzMiBkCiAKIGNvbnN0IHN0cnVjdCBudmtt
X2ZhbGNvbl9mdW5jX3BpbwogZ20yMDBfZmxjbl9kbWVtX3BpbyA9IHsKLQkubWluID0gNCwKKwku
bWluID0gMSwKIAkubWF4ID0gMHgxMDAsCiAJLndyX2luaXQgPSBnbTIwMF9mbGNuX3Bpb19kbWVt
X3dyX2luaXQsCiAJLndyID0gZ20yMDBfZmxjbl9waW9fZG1lbV93ciwKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BtdS9nbTIwYi5jIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcG11L2dtMjBiLmMKaW5kZXggYTcyNDAzNzc3MzI5
Li4yZWQwNGRhMzYyMWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20v
c3ViZGV2L3BtdS9nbTIwYi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3Vi
ZGV2L3BtdS9nbTIwYi5jCkBAIC0yMjUsNyArMjI1LDcgQEAgZ20yMGJfcG11X2luaXQoc3RydWN0
IG52a21fcG11ICpwbXUpCiAKIAlwbXUtPmluaXRtc2dfcmVjZWl2ZWQgPSBmYWxzZTsKIAotCW52
a21fZmFsY29uX2xvYWRfZG1lbShmYWxjb24sICZhcmdzLCBhZGRyX2FyZ3MsIHNpemVvZihhcmdz
KSwgMCk7CisJbnZrbV9mYWxjb25fcGlvX3dyKGZhbGNvbiwgKHU4ICopJmFyZ3MsIDAsIDAsIERN
RU0sIGFkZHJfYXJncywgc2l6ZW9mKGFyZ3MpLCAwLCBmYWxzZSk7CiAJbnZrbV9mYWxjb25fc3Rh
cnQoZmFsY29uKTsKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMzUuMQoK
--0000000000001b9a0b05f36eba2d--
