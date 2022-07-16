Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 058845771BB
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 00:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC39112FF4;
	Sat, 16 Jul 2022 22:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B6F112F57
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 22:09:01 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id x91so10632213ede.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 15:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AcjWh/Vyv/p487/TiHDxM9foCDPT53sV1cJadscCohE=;
 b=PgN9wmVjO3lR3KoSzFAY1iWb2IFmaxa116V4LWyxcRywTrML/HZOcILWc+leY52aWj
 D1DdypmH28pNlpnSvS8eWcv5N65gLyHTT9NsoIE3FS1bYMyYqlKVpJ8x7p+ob0ZtLJV8
 szWud/nfhwbnu0JcZmnJ7/ClpeGR8eTdIZxbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AcjWh/Vyv/p487/TiHDxM9foCDPT53sV1cJadscCohE=;
 b=QY2xyHqwAXE1wBc2ZDJXGdfUl86/hXATFIHp+4q+0zA7XNVpBU1o6vMWkoAjPyZZx4
 LixBv6QmN5hn7e10gp10iW9tpqLFcBuLD4RDfzr3aOmeDVNKocPqkYkFyf85e+FTDkNm
 g8B6yW0sAtTcuIRsgfilEWEMt63r3wXWNnd8mOT5phQGdHiApEpqmFvonr0XSZawcRS3
 iLg/LrLqLLpBG8kKoDu+MiJU3mZTvi81BqhJHxXzyFmOtzyXm+mGGM1YK1iO3Sn2Y8sg
 +y+RRMIdfyhPWmRB8YdwcZFo6aX0oEpFWSPrnWrFWVtMmde/Kg9YhlIL6wFveGPsAc6+
 yz5w==
X-Gm-Message-State: AJIora8PbUVwoiMisasT0asOmPID5w90kCRlx67gbaoTJJRcewlWWJK9
 b+buo+g0Px2nR6C9Dh85DFvo9WYJFZ2QUZ9R
X-Google-Smtp-Source: AGRyM1vhs+dGRdNPQVqBgAWmfFx6dJxWPQrsm4jmlboywXi8VFWncwgs7PaSjKd9OmZQhF8ZNR+niQ==
X-Received: by 2002:a05:6402:368e:b0:43a:c074:ac7b with SMTP id
 ej14-20020a056402368e00b0043ac074ac7bmr27808246edb.139.1658009339567; 
 Sat, 16 Jul 2022 15:08:59 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48]) by smtp.gmail.com with ESMTPSA id
 l5-20020aa7c3c5000000b0043575ae2051sm5440955edr.62.2022.07.16.15.08.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jul 2022 15:08:57 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id q9so11710878wrd.8
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 15:08:56 -0700 (PDT)
X-Received: by 2002:a05:6000:1f8c:b0:21d:7e98:51ba with SMTP id
 bw12-20020a0560001f8c00b0021d7e9851bamr16864641wrb.442.1658009335873; Sat, 16
 Jul 2022 15:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twM75GDM9t+9-CSCPDZG3QdcEpQ-X+FzQ4CLUCM7cKLkw@mail.gmail.com>
 <YtHXe4PcWXfihF9Q@dev-arch.thelio-3990X>
 <CAHk-=wh5DB+OL2QvWPqRhpLLCqW7u_bLucFJpm4v6rZT3T5+zQ@mail.gmail.com>
In-Reply-To: <CAHk-=wh5DB+OL2QvWPqRhpLLCqW7u_bLucFJpm4v6rZT3T5+zQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 16 Jul 2022 15:08:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgcECb3cwnB=7Zgf8CBfEYaTWcSzAjfQpTM75_Q5aO7dA@mail.gmail.com>
Message-ID: <CAHk-=wgcECb3cwnB=7Zgf8CBfEYaTWcSzAjfQpTM75_Q5aO7dA@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.19-rc7
To: Nathan Chancellor <nathan@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>, 
 Nirmoy Das <nirmoy.das@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: multipart/mixed; boundary="00000000000080390c05e3f36106"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000080390c05e3f36106
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 16, 2022 at 2:35 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> That said, even those type simplifications do not fix the fundamental
> issue. That "DIV_ROUND_UP()" still ends up being a 64-bit divide,
> although now it's at least a "64-by-32" bit divide.

Hmm. The "DIV_ROUND_UP()" issue could be solved by just making the
rule be that the max_segment size is always a power of two.

Then you don't need the (expensive!) DIV_ROUND_UP(), and can just use
the regular "round_up()" that works on powers-of-two.

And the simplest way to do that is to just make "max_segments" be 2GB.

The whole "round_down(UINT_MAX, page_alignment)" seems entirely
pointless. Do you really want segments that are some odd number just
under the 4GB mark, and force expensive divides?

For consistency, I used the same value in
i915_rsgt_from_buddy_resource(). I have no idea if that makes sense.

Anyway, the attached patch is COMPLETELY UNTESTED. But it at least
seems to compile. Maybe.

                  Linus

--00000000000080390c05e3f36106
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_l5ofxmky0>
X-Attachment-Id: f_l5ofxmky0

IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfc2NhdHRlcmxpc3QuYyB8IDggKysrKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9zY2F0dGVybGlzdC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9zY2F0dGVybGlzdC5jCmluZGV4IGY2M2I1MGI3MWUxMC4uODMwZGNkODMz
ZDRlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3NjYXR0ZXJsaXN0LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9zY2F0dGVybGlzdC5jCkBAIC04MSw3ICs4
MSw5IEBAIHN0cnVjdCBpOTE1X3JlZmN0X3NndCAqaTkxNV9yc2d0X2Zyb21fbW1fbm9kZShjb25z
dCBzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGUsCiAJCQkJCSAgICAgIHU2NCByZWdpb25fc3RhcnQs
CiAJCQkJCSAgICAgIHU2NCBwYWdlX2FsaWdubWVudCkKIHsKLQljb25zdCB1NjQgbWF4X3NlZ21l
bnQgPSByb3VuZF9kb3duKFVJTlRfTUFYLCBwYWdlX2FsaWdubWVudCk7CisJLy8gTWFrZSBzdXJl
IG1heF9zZWdtZW50IChhbmQgdGh1cyBzZWdtZW50X3BhZ2VzKSBpcworCS8vIGEgcG93ZXIgb2Yg
dHdvIHRoYXQgZml0cyBpbiAzMiBiaXRzLgorCWNvbnN0IHU2NCBtYXhfc2VnbWVudCA9IDF1bCA8
PCAzMTsKIAl1NjQgc2VnbWVudF9wYWdlcyA9IG1heF9zZWdtZW50ID4+IFBBR0VfU0hJRlQ7CiAJ
dTY0IGJsb2NrX3NpemUsIG9mZnNldCwgcHJldl9lbmQ7CiAJc3RydWN0IGk5MTVfcmVmY3Rfc2d0
ICpyc2d0OwpAQCAtOTYsNyArOTgsNyBAQCBzdHJ1Y3QgaTkxNV9yZWZjdF9zZ3QgKmk5MTVfcnNn
dF9mcm9tX21tX25vZGUoY29uc3Qgc3RydWN0IGRybV9tbV9ub2RlICpub2RlLAogCiAJaTkxNV9y
ZWZjdF9zZ3RfaW5pdChyc2d0LCBub2RlLT5zaXplIDw8IFBBR0VfU0hJRlQpOwogCXN0ID0gJnJz
Z3QtPnRhYmxlOwotCWlmIChzZ19hbGxvY190YWJsZShzdCwgRElWX1JPVU5EX1VQKG5vZGUtPnNp
emUsIHNlZ21lbnRfcGFnZXMpLAorCWlmIChzZ19hbGxvY190YWJsZShzdCwgcm91bmRfdXAobm9k
ZS0+c2l6ZSwgc2VnbWVudF9wYWdlcyksCiAJCQkgICBHRlBfS0VSTkVMKSkgewogCQlpOTE1X3Jl
ZmN0X3NndF9wdXQocnNndCk7CiAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwpAQCAtMTU5LDcg
KzE2MSw3IEBAIHN0cnVjdCBpOTE1X3JlZmN0X3NndCAqaTkxNV9yc2d0X2Zyb21fYnVkZHlfcmVz
b3VyY2Uoc3RydWN0IHR0bV9yZXNvdXJjZSAqcmVzLAogewogCXN0cnVjdCBpOTE1X3R0bV9idWRk
eV9yZXNvdXJjZSAqYm1hbl9yZXMgPSB0b190dG1fYnVkZHlfcmVzb3VyY2UocmVzKTsKIAljb25z
dCB1NjQgc2l6ZSA9IHJlcy0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQ7Ci0JY29uc3QgdTY0IG1h
eF9zZWdtZW50ID0gcm91bmRfZG93bihVSU5UX01BWCwgcGFnZV9hbGlnbm1lbnQpOworCWNvbnN0
IHU2NCBtYXhfc2VnbWVudCA9IDF1IDw8IDMxOwogCXN0cnVjdCBkcm1fYnVkZHkgKm1tID0gYm1h
bl9yZXMtPm1tOwogCXN0cnVjdCBsaXN0X2hlYWQgKmJsb2NrcyA9ICZibWFuX3Jlcy0+YmxvY2tz
OwogCXN0cnVjdCBkcm1fYnVkZHlfYmxvY2sgKmJsb2NrOwo=
--00000000000080390c05e3f36106--
