Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E153C4FC426
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 20:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006B510EB90;
	Mon, 11 Apr 2022 18:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168EF10EB90;
 Mon, 11 Apr 2022 18:34:49 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-d6ca46da48so18194212fac.12; 
 Mon, 11 Apr 2022 11:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hKeAd9Mr0PigPXy0tzq3X1NpRqwxAItO7Z7TSKVnWIc=;
 b=neGNALJM8WTGbSOrE8u2cIBizinV/y8dw4/rzahCKVrxSS391UlvO10RAV489aL7VK
 +uaSATzf7rrAsblSH4qwFnmrQqxkMCpRjydaezPKjV+kjViHWLhEKXQ14A+0FJ+rvfl3
 OJFn6IFRxFKP/nPDaBU/ouZXVDAKUx5Lv1/+q2aU2lA6EfOrBjvI13YW2sofZ/V1qYmv
 JBXkSd6n78ECU7T4m9W32gURxcsNdseoR5gPqtkX04eT0MNSWwMBGS72lImUGqzdSJ3l
 BtP+zbdI49z2A+Z+ZZYlUWrCYTRL/krBOT3yBb2SzP5DnPyuQW0RVLRk3fa83WCmbbVm
 LWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hKeAd9Mr0PigPXy0tzq3X1NpRqwxAItO7Z7TSKVnWIc=;
 b=SltOih1sscEEQb5Knyc1xe6db8efQUz63dDkN4pO2obIha+qNiihPojmsupLudwfhh
 8+tkmakkO0zrhNlaA9pTwUrSTATOm2Nu71JehVJWmbwPrwKsqikl9zrXznAw57byEfL1
 uPCLWSC0P3aDbmA9EKQT8LGOY8TtOcAyNdwJ3E6+kBRqsUDnvjrUbSOSEXb7pFcxskAH
 jKLeDYJkH3fwelkk5MQy7O46puBklBOD4CtTk2cwfEalbquVKs7mEKblai6SAHy97VS7
 pDW8ecY60TEPZeqZWQxxlioghMXJpt5NRCp/McEwTRgJEoEKT0RamaYAMoGpt0t9qHdt
 RuXw==
X-Gm-Message-State: AOAM533JKnDgC+8T3vBJPDNMd84tUeaFkYVtaR2mlHwjYIz5Ru6ALgk+
 hruXEjawOgunPWojaGAC00Gl24D5c2806escU7gy4tDv
X-Google-Smtp-Source: ABdhPJw8I+4TAsBZva0xobAu5qLFHcMJH0F7S/+Eo9VY0cEMRaYwlKaPizrqfFLInGAY6yxckbwi8fsA3MlI350gkPY=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr299181oaa.200.1649702088390; Mon, 11
 Apr 2022 11:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220403132322.51c90903@darkstar.example.org>
 <CADnq5_M+M_iykM0Ag6RF+kxzgpEopUBtp82h7tRM3G+B3AWZ2w@mail.gmail.com>
 <20220404213940.09a56d15@darkstar.example.org>
 <CADnq5_PhaFbVCb=-AUCx4L-sCyPCPOsY3tNpiAg=gfCN7hFcJA@mail.gmail.com>
 <20220409182831.185e5d92@darkstar.example.org>
In-Reply-To: <20220409182831.185e5d92@darkstar.example.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Apr 2022 14:34:37 -0400
Message-ID: <CADnq5_MvGGONvAvhwgokDxRpTbnsGEFROcgsZteJby9Bya81Nw@mail.gmail.com>
Subject: Re: AMDGPU: regression on 5.17.1
To: Michele Ballabio <ballabio.m@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000f6e26505dc653287"
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 regressions@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000f6e26505dc653287
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 9, 2022 at 12:28 PM Michele Ballabio <ballabio.m@gmail.com> wrote:
>
> On Tue, 5 Apr 2022 10:23:16 -0400
> Alex Deucher <alexdeucher@gmail.com> wrote:
>
> > On Mon, Apr 4, 2022 at 3:39 PM Michele Ballabio
> > <ballabio.m@gmail.com> wrote:
> > >
> > > On Mon, 4 Apr 2022 13:03:41 -0400
> > > Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > > On Sun, Apr 3, 2022 at 10:19 AM Michele Ballabio
> > > > <ballabio.m@gmail.com> wrote:
> > > > >
> > > > > Hi,
> > > > >         I've hit a regression on 5.17.1 (haven't tested 5.17.0,
> > > > > but 5.16-stable didn't have this problem).
> > > > >
> > > > > The machine is a Ryzen 5 1600 with AMD graphics (RX 560).
> > > > >
> > > > > The regression I hit seems to trigger when the machine is left
> > > > > idle at boot (I don't boot straight to X, I boot to a tty, login
> > > > > and then start X). The machine after a while blanks the screen.
> > > > > Usually, the screen unblanks as the keyboard is hit or the mouse
> > > > > moves, but with kernel 5.17.1 the screen does not wake up. The
> > > > > machine seems to run mostly fine: I can login from ssh, but I
> > > > > cannot reboot or halt it: a sysrq sequence is needed for that.
> > > > > Note that if the screen goes blank under X, it wakes up fine.
> > > > >
> > > > > Below a dmesg and two traces from syslog (they're quite
> > > > > similar).
> > > >
> > > > Can you bisect?  Does setting amdgpu.runpm=0 help?
> > >
> > > I can try to bisect, should I narrow the search to drivers/gpu/drm/
> > > ?
> >
> > I would just do a full bisect if possible in case the change happens
> > to be outside of drm.
> >
> > >
> > > Setting amdgpu.runpm=0 works, the display now unblanks without
> > > problems.
> >
>
> Hi,
>     I bisected this, and the first bad commit is
> [087451f372bf76d971184caa258807b7c35aac8f] drm/amdgpu: use generic fb
> helpers instead of setting up AMD own's.
>
> Let me know if you need some more testing.

Thanks.  Do the attached patches fix the issue?

Thanks,

Alex

--000000000000f6e26505dc653287
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-don-t-runtime-suspend-if-there-are-displa.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-don-t-runtime-suspend-if-there-are-displa.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l1v20q2o1>
X-Attachment-Id: f_l1v20q2o1

RnJvbSBiZTVjMjY4MGVkNGIzYjQxMjFhZjRmNjkyYzkwNWQ4OGQ3YjZjYzAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFR1ZSwgMjggRGVjIDIwMjEgMTc6MjY6MjQgLTA1MDAKU3ViamVjdDogW1BBVENI
IDEvMl0gZHJtL2FtZGdwdTogZG9uJ3QgcnVudGltZSBzdXNwZW5kIGlmIHRoZXJlIGFyZSBkaXNw
bGF5cwogYXR0YWNoZWQKCldlIG5vcm1hbGx5IHJ1bnRpbWUgc3VzcGVuZCB3aGVuIHRoZXJlIGFy
ZSBkaXNwbGF5cyBhdHRhY2hlZCBpZiB0aGV5CmFyZSBpbiB0aGUgRFBNUyBvZmYgc3RhdGUsIGhv
d2V2ZXIsIGlmIHNvbWV0aGluZyB3YWtlcyB0aGUgR1BVCndlIHNlbmQgYSBob3RwbHVnIGV2ZW50
IG9uIHJlc3VtZSAoaW4gY2FzZSBhbnkgZGlzcGxheXMgd2VyZSBjb25uZWN0ZWQKd2hpbGUgdGhl
IEdQVSB3YXMgaW4gc3VzcGVuZCkgd2hpY2ggY2FuIGNhdXNlIHVzZXJzcGFjZSB0byBsaWdodAp1
cCB0aGUgZGlzcGxheXMgYWdhaW4gc29vbiBhZnRlciB0aGV5IHdlcmUgdHVybmVkIG9mZi4KClBy
aW9yIHRvCmNvbW1pdCAwODc0NTFmMzcyYmY3NiAoImRybS9hbWRncHU6IHVzZSBnZW5lcmljIGZi
IGhlbHBlcnMgaW5zdGVhZCBvZiBzZXR0aW5nIHVwIEFNRCBvd24ncy4iKSwKdGhlIGRyaXZlciB0
b29rIGEgcnVudGltZSBwbSByZWZlcmVuY2Ugd2hlbiB0aGUgZmJkZXYgZW11bGF0aW9uIHdhcwpl
bmFibGVkIGJlY2F1c2Ugd2UgZGlkbid0IGltcGxlbWVudCBwcm9wZXIgc2hhZG93aW5nIHN1cHBv
cnQgZm9yCnZyYW0gYWNjZXNzIHdoZW4gdGhlIGRldmljZSB3YXMgb2ZmIHNvIHRoZSBkZXZpY2Ug
bmV2ZXIgcnVudGltZQpzdXNwZW5kZWQgd2hlbiB0aGVyZSB3YXMgYSBjb25zb2xlIGJvdW5kLiAg
T25jZSB0aGF0IGNvbW1pdCBsYW5kZWQsCndlIG5vdyB1dGlsaXplIHRoZSBjb3JlIGZiIGhlbHBl
ciBpbXBsZW1lbnRhdGlvbiB3aGljaCBwcm9wZXJseQpoYW5kbGVzIHRoZSBlbXVsYXRpb24sIHNv
IHJ1bnRpbWUgcG0gbm93IHN1c3BlbmRzIGluIGNhc2VzIHdoZXJlIGl0IGRpZApub3QgYmVmb3Jl
LiAgVWx0aW1hdGVseSwgd2UgbmVlZCB0byBzb3J0IG91dCB3aHkgcnVudGltZSBzdXNwZW5kIGlu
IG5vdAp3b3JraW5nIGluIHRoaXMgY2FzZSBmb3Igc29tZSB1c2VycywgYnV0IHRoaXMgc2hvdWxk
IHJlc3RvcmUgc2ltaWxhcgpiZWhhdmlvciB0byBiZWZvcmUuCgpGaXhlczogMDg3NDUxZjM3MmJm
NzYgKCJkcm0vYW1kZ3B1OiB1c2UgZ2VuZXJpYyBmYiBoZWxwZXJzIGluc3RlYWQgb2Ygc2V0dGlu
ZyB1cCBBTUQgb3duJ3MuIikKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYyB8IDIyICsrKysrKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYwppbmRleCA0ZWZhYTE4M2FiY2QuLmNmNzk1YTliOGFlZiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwpAQCAtMjUwOCw2ICsyNTA4LDggQEAgc3RhdGljIGlu
dCBhbWRncHVfcG1vcHNfcnVudGltZV9pZGxlKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1
Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCXN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2ID0gZHJtX3RvX2FkZXYoZHJtX2Rldik7CisJc3RydWN0IGRybV9j
b25uZWN0b3IgKmxpc3RfY29ubmVjdG9yOworCXN0cnVjdCBkcm1fY29ubmVjdG9yX2xpc3RfaXRl
ciBpdGVyOwogCS8qIHdlIGRvbid0IHdhbnQgdGhlIG1haW4gcnBtX2lkbGUgdG8gY2FsbCBzdXNw
ZW5kIC0gd2Ugd2FudCB0byBhdXRvc3VzcGVuZCAqLwogCWludCByZXQgPSAxOwogCkBAIC0yNTE2
LDYgKzI1MTgsMjIgQEAgc3RhdGljIGludCBhbWRncHVfcG1vcHNfcnVudGltZV9pZGxlKHN0cnVj
dCBkZXZpY2UgKmRldikKIAkJcmV0dXJuIC1FQlVTWTsKIAl9CiAKKwkvKiBYWFg6IFJldHVybiBi
dXN5IGlmIGFueSBkaXNwbGF5cyBhcmUgY29ubmVjdGVkIHRvIGF2b2lkCisJICogcG9zc2libGUg
ZGlzcGxheSB3YWtlIHVwcyBhZnRlciBydW50aW1lIHJlc3VtZSBkdWUgdG8KKwkgKiBob3RwbHVn
IGV2ZW50cyBpbiBjYXNlIGFueSBkaXNwbGF5cyB3ZXJlIGNvbm5lY3RlZCB3aGlsZQorCSAqIHRo
ZSBHUFUgd2FzIGluIHN1c3BlbmQuICBSZW1vdmUgdGhpcyBvbmNlIHRoYXQgaXMgZml4ZWQuCisJ
ICovCisJbXV0ZXhfbG9jaygmZHJtX2Rldi0+bW9kZV9jb25maWcubXV0ZXgpOworCWRybV9jb25u
ZWN0b3JfbGlzdF9pdGVyX2JlZ2luKGRybV9kZXYsICZpdGVyKTsKKwlkcm1fZm9yX2VhY2hfY29u
bmVjdG9yX2l0ZXIobGlzdF9jb25uZWN0b3IsICZpdGVyKSB7CisJCWlmIChsaXN0X2Nvbm5lY3Rv
ci0+c3RhdHVzID09IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkKSB7CisJCQlyZXQgPSAtRUJV
U1k7CisJCQlicmVhazsKKwkJfQorCX0KKwlkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9lbmQoJml0
ZXIpOworCW11dGV4X3VubG9jaygmZHJtX2Rldi0+bW9kZV9jb25maWcubXV0ZXgpOworCiAJaWYg
KGFtZGdwdV9kZXZpY2VfaGFzX2RjX3N1cHBvcnQoYWRldikpIHsKIAkJc3RydWN0IGRybV9jcnRj
ICpjcnRjOwogCkBAIC0yNTI3LDExICsyNTQ1LDcgQEAgc3RhdGljIGludCBhbWRncHVfcG1vcHNf
cnVudGltZV9pZGxlKHN0cnVjdCBkZXZpY2UgKmRldikKIAkJCWlmIChyZXQgPCAwKQogCQkJCWJy
ZWFrOwogCQl9Ci0KIAl9IGVsc2UgewotCQlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqbGlzdF9jb25u
ZWN0b3I7Ci0JCXN0cnVjdCBkcm1fY29ubmVjdG9yX2xpc3RfaXRlciBpdGVyOwotCiAJCW11dGV4
X2xvY2soJmRybV9kZXYtPm1vZGVfY29uZmlnLm11dGV4KTsKIAkJZHJtX21vZGVzZXRfbG9jaygm
ZHJtX2Rldi0+bW9kZV9jb25maWcuY29ubmVjdGlvbl9tdXRleCwgTlVMTCk7CiAKLS0gCjIuMzUu
MQoK
--000000000000f6e26505dc653287
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-drm-amdgpu-only-check-display-if-the-GPU-has-them-in.patch"
Content-Disposition: attachment; 
	filename="0002-drm-amdgpu-only-check-display-if-the-GPU-has-them-in.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l1v20q220>
X-Attachment-Id: f_l1v20q220

RnJvbSA0OTgzMTFhZGM4Y2UwNzQ2YzBjODcxMDk2MWU4ZjZkYmM5Nzc0MjYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFR1ZSwgMjggRGVjIDIwMjEgMTc6MzI6NTUgLTA1MDAKU3ViamVjdDogW1BBVENI
IDIvMl0gZHJtL2FtZGdwdTogb25seSBjaGVjayBkaXNwbGF5IGlmIHRoZSBHUFUgaGFzIHRoZW0g
aW4KIHJ1bnBtIGlkbGUKCkluIHRoZSBydW50aW1lIHBtIGlkbGUgY2FsbGJhY2ssIG9ubHkgY2hl
Y2sgZGlzcGxheSBjb25kaXRpb25zCmlmIHRoZSBHUFUgaGFzIGRpc3BsYXkgaGFyZHdhcmUuICBU
aGlzIHNhdmVzIHNvbWUgY29kZQpleGVjdXRpb24gb24gaGVhZGxlc3MgR1BVcy4KClNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCA3NiArKysrKysrKysrKysrLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCmluZGV4IGNmNzk1YTli
OGFlZi4uZWFjMGEzNWMwY2M5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ry
di5jCkBAIC0yNTE4LDUzICsyNTE4LDU1IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Btb3BzX3J1bnRp
bWVfaWRsZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCXJldHVybiAtRUJVU1k7CiAJfQogCi0JLyog
WFhYOiBSZXR1cm4gYnVzeSBpZiBhbnkgZGlzcGxheXMgYXJlIGNvbm5lY3RlZCB0byBhdm9pZAot
CSAqIHBvc3NpYmxlIGRpc3BsYXkgd2FrZSB1cHMgYWZ0ZXIgcnVudGltZSByZXN1bWUgZHVlIHRv
Ci0JICogaG90cGx1ZyBldmVudHMgaW4gY2FzZSBhbnkgZGlzcGxheXMgd2VyZSBjb25uZWN0ZWQg
d2hpbGUKLQkgKiB0aGUgR1BVIHdhcyBpbiBzdXNwZW5kLiAgUmVtb3ZlIHRoaXMgb25jZSB0aGF0
IGlzIGZpeGVkLgotCSAqLwotCW11dGV4X2xvY2soJmRybV9kZXYtPm1vZGVfY29uZmlnLm11dGV4
KTsKLQlkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9iZWdpbihkcm1fZGV2LCAmaXRlcik7Ci0JZHJt
X2Zvcl9lYWNoX2Nvbm5lY3Rvcl9pdGVyKGxpc3RfY29ubmVjdG9yLCAmaXRlcikgewotCQlpZiAo
bGlzdF9jb25uZWN0b3ItPnN0YXR1cyA9PSBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZCkgewot
CQkJcmV0ID0gLUVCVVNZOwotCQkJYnJlYWs7Ci0JCX0KLQl9Ci0JZHJtX2Nvbm5lY3Rvcl9saXN0
X2l0ZXJfZW5kKCZpdGVyKTsKLQltdXRleF91bmxvY2soJmRybV9kZXYtPm1vZGVfY29uZmlnLm11
dGV4KTsKLQotCWlmIChhbWRncHVfZGV2aWNlX2hhc19kY19zdXBwb3J0KGFkZXYpKSB7Ci0JCXN0
cnVjdCBkcm1fY3J0YyAqY3J0YzsKLQotCQlkcm1fZm9yX2VhY2hfY3J0YyhjcnRjLCBkcm1fZGV2
KSB7Ci0JCQlkcm1fbW9kZXNldF9sb2NrKCZjcnRjLT5tdXRleCwgTlVMTCk7Ci0JCQlpZiAoY3J0
Yy0+c3RhdGUtPmFjdGl2ZSkKLQkJCQlyZXQgPSAtRUJVU1k7Ci0JCQlkcm1fbW9kZXNldF91bmxv
Y2soJmNydGMtPm11dGV4KTsKLQkJCWlmIChyZXQgPCAwKQotCQkJCWJyZWFrOwotCQl9Ci0JfSBl
bHNlIHsKKwlpZiAoYWRldi0+bW9kZV9pbmZvLm51bV9jcnRjKSB7CisJCS8qIFhYWDogUmV0dXJu
IGJ1c3kgaWYgYW55IGRpc3BsYXlzIGFyZSBjb25uZWN0ZWQgdG8gYXZvaWQKKwkJICogcG9zc2li
bGUgZGlzcGxheSB3YWtlIHVwcyBhZnRlciBydW50aW1lIHJlc3VtZSBkdWUgdG8KKwkJICogaG90
cGx1ZyBldmVudHMgaW4gY2FzZSBhbnkgZGlzcGxheXMgd2VyZSBjb25uZWN0ZWQgd2hpbGUKKwkJ
ICogdGhlIEdQVSB3YXMgaW4gc3VzcGVuZC4gIFJlbW92ZSB0aGlzIG9uY2UgdGhhdCBpcyBmaXhl
ZC4KKwkJICovCiAJCW11dGV4X2xvY2soJmRybV9kZXYtPm1vZGVfY29uZmlnLm11dGV4KTsKLQkJ
ZHJtX21vZGVzZXRfbG9jaygmZHJtX2Rldi0+bW9kZV9jb25maWcuY29ubmVjdGlvbl9tdXRleCwg
TlVMTCk7Ci0KIAkJZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXJfYmVnaW4oZHJtX2RldiwgJml0ZXIp
OwogCQlkcm1fZm9yX2VhY2hfY29ubmVjdG9yX2l0ZXIobGlzdF9jb25uZWN0b3IsICZpdGVyKSB7
Ci0JCQlpZiAobGlzdF9jb25uZWN0b3ItPmRwbXMgPT0gIERSTV9NT0RFX0RQTVNfT04pIHsKKwkJ
CWlmIChsaXN0X2Nvbm5lY3Rvci0+c3RhdHVzID09IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVk
KSB7CiAJCQkJcmV0ID0gLUVCVVNZOwogCQkJCWJyZWFrOwogCQkJfQogCQl9Ci0KIAkJZHJtX2Nv
bm5lY3Rvcl9saXN0X2l0ZXJfZW5kKCZpdGVyKTsKLQotCQlkcm1fbW9kZXNldF91bmxvY2soJmRy
bV9kZXYtPm1vZGVfY29uZmlnLmNvbm5lY3Rpb25fbXV0ZXgpOwogCQltdXRleF91bmxvY2soJmRy
bV9kZXYtPm1vZGVfY29uZmlnLm11dGV4KTsKLQl9CiAKLQlpZiAocmV0ID09IC1FQlVTWSkKLQkJ
RFJNX0RFQlVHX0RSSVZFUigiZmFpbGluZyB0byBwb3dlciBvZmYgLSBjcnRjIGFjdGl2ZVxuIik7
CisJCWlmIChhbWRncHVfZGV2aWNlX2hhc19kY19zdXBwb3J0KGFkZXYpKSB7CisJCQlzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGM7CisKKwkJCWRybV9mb3JfZWFjaF9jcnRjKGNydGMsIGRybV9kZXYpIHsK
KwkJCQlkcm1fbW9kZXNldF9sb2NrKCZjcnRjLT5tdXRleCwgTlVMTCk7CisJCQkJaWYgKGNydGMt
PnN0YXRlLT5hY3RpdmUpCisJCQkJCXJldCA9IC1FQlVTWTsKKwkJCQlkcm1fbW9kZXNldF91bmxv
Y2soJmNydGMtPm11dGV4KTsKKwkJCQlpZiAocmV0IDwgMCkKKwkJCQkJYnJlYWs7CisJCQl9CisJ
CX0gZWxzZSB7CisJCQltdXRleF9sb2NrKCZkcm1fZGV2LT5tb2RlX2NvbmZpZy5tdXRleCk7CisJ
CQlkcm1fbW9kZXNldF9sb2NrKCZkcm1fZGV2LT5tb2RlX2NvbmZpZy5jb25uZWN0aW9uX211dGV4
LCBOVUxMKTsKKworCQkJZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXJfYmVnaW4oZHJtX2RldiwgJml0
ZXIpOworCQkJZHJtX2Zvcl9lYWNoX2Nvbm5lY3Rvcl9pdGVyKGxpc3RfY29ubmVjdG9yLCAmaXRl
cikgeworCQkJCWlmIChsaXN0X2Nvbm5lY3Rvci0+ZHBtcyA9PSAgRFJNX01PREVfRFBNU19PTikg
eworCQkJCQlyZXQgPSAtRUJVU1k7CisJCQkJCWJyZWFrOworCQkJCX0KKwkJCX0KKworCQkJZHJt
X2Nvbm5lY3Rvcl9saXN0X2l0ZXJfZW5kKCZpdGVyKTsKKworCQkJZHJtX21vZGVzZXRfdW5sb2Nr
KCZkcm1fZGV2LT5tb2RlX2NvbmZpZy5jb25uZWN0aW9uX211dGV4KTsKKwkJCW11dGV4X3VubG9j
aygmZHJtX2Rldi0+bW9kZV9jb25maWcubXV0ZXgpOworCQl9CisKKwkJaWYgKHJldCA9PSAtRUJV
U1kpCisJCQlEUk1fREVCVUdfRFJJVkVSKCJmYWlsaW5nIHRvIHBvd2VyIG9mZiAtIGNydGMgYWN0
aXZlXG4iKTsKKwl9CiAKIAlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KGRldik7CiAJcG1fcnVu
dGltZV9hdXRvc3VzcGVuZChkZXYpOwotLSAKMi4zNS4xCgo=
--000000000000f6e26505dc653287--
