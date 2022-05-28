Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B676536E05
	for <lists+dri-devel@lfdr.de>; Sat, 28 May 2022 20:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B29410E79D;
	Sat, 28 May 2022 18:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C9B10E79D
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 18:09:09 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id f21so13979530ejh.11
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 11:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iGqp3sqIQ6D1oqU2b3UQ+JQ14av/DX22LG0p5NM1mUo=;
 b=Px8PhLWYRiqNg8y87VlDUDsLJH2RoVnLN8Jl2LVu1LymXQyB5v2VGxblVmbq7n6ao8
 VU3hqglYO5WBsoT19tAqis2S52THyYxULaMlPuhCVc+o+wPTrAjTjNWJDkwjJ3dtGVFj
 8QZXFAV7pfp7xwqlA1vAGNq2rUWHaa1b3lzak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iGqp3sqIQ6D1oqU2b3UQ+JQ14av/DX22LG0p5NM1mUo=;
 b=6Hx3JuKIZPb1Ml3WQa4t5vCi5RZ7s3/yz7pdFcSCw9zK28LsQ225/Je2xpfpcIuwpk
 Qvop84dn4DidO9mdFnYKGYxjA/MnwwzieuIV9idS3cFHmslbEFcPgc8ilU5G7e+9Y4hV
 4BcJTucygn0eUhcVGsKXsHn3m43rbSWdHRu3L5/MJhXX6/19I+3X+g9g0SdI6tKU3BgZ
 dDm23e6GmN0rpAFgwUqMbjDfKma/qUecbNxRzCT+OCLvhOfL+RYEEkijlBrcqTGvqME5
 fu/640dTey99xKshVoILU6B0qWmu1SZAWNTEtNig4fPrQD3AM+EsQhf/eqU9AOZLpIZr
 g/mw==
X-Gm-Message-State: AOAM532cLtI3oVZ//+rxJvhv1TefRhHL4OF3nGdaClKsaf5ysODBseFM
 rznLDCbinE87gTfLLSqMUrcdIomES9yTfkqN
X-Google-Smtp-Source: ABdhPJzgV68iCjipRfb9cTBuczhfoWvmfxyqJsynjP1RVJRs75BLXl7OEqYx4WD55VS5rjvUtLTegA==
X-Received: by 2002:a17:907:8a1c:b0:6fe:e53b:22ca with SMTP id
 sc28-20020a1709078a1c00b006fee53b22camr27864738ejc.407.1653761347720; 
 Sat, 28 May 2022 11:09:07 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45]) by smtp.gmail.com with ESMTPSA id
 bo17-20020a170906d05100b006fe98fb9523sm2538345ejb.129.2022.05.28.11.09.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 May 2022 11:09:05 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id p10so9695043wrg.12
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 11:09:05 -0700 (PDT)
X-Received: by 2002:a05:6000:16c4:b0:20f:cd5d:4797 with SMTP id
 h4-20020a05600016c400b0020fcd5d4797mr28588153wrf.193.1653761344659; Sat, 28
 May 2022 11:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <YpCUzStDnSgQLNFN@debian>
 <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian>
 <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
In-Reply-To: <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 28 May 2022 11:08:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
Message-ID: <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <vireshk@kernel.org>, 
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Content-Type: multipart/mixed; boundary="0000000000007e28af05e01651d2"
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, SoC Team <soc@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000007e28af05e01651d2
Content-Type: text/plain; charset="UTF-8"

On Sat, May 28, 2022 at 10:40 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So digging a bit deeper - since I have am arm compiler after all - I
> note that 'sizeof(detailed_timings)' is 88.

Hmm.

sizeof() both

    detailed_timings[0].data.other_data.data.range.formula.gtf2

and

    detailed_timings[0].data.other_data.data.range.formula.cvt

is 7.

But the *union* of those things is

    detailed_timings[0].data.other_data.data.range.formula

and its size is 8 (despite having an alignment of just 1).

The attached patch would seem to fix it for me.

Not very much tested, and I have no idea what it is that triggers this
only on spear3xx_defconfig.

Some ARM ABI issue that is triggered by some very particular ARM
compiler flag enabled by that config?

Adding some ARM (and SPEAR, and SoC) people in case they have any idea.

This smells like a compiler bug triggered by "there's a 16-bit member
field in that gtf2 structure, and despite it being packed and aligned
to 1, we somehow still align the size to 2".

I dunno. But marking those unions packed too doesn't seem wrong, and
does seem to fix it.

                  Linus

--0000000000007e28af05e01651d2
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_l3q6oh0p0>
X-Attachment-Id: f_l3q6oh0p0

IGluY2x1ZGUvZHJtL2RybV9lZGlkLmggfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
ZWRpZC5oIGIvaW5jbHVkZS9kcm0vZHJtX2VkaWQuaAppbmRleCBjMzIwNGE1OGZiMDkuLmIyNzU2
NzUzMzcwYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2VkaWQuaAorKysgYi9pbmNsdWRl
L2RybS9kcm1fZWRpZC5oCkBAIC0xMjEsNyArMTIxLDcgQEAgc3RydWN0IGRldGFpbGVkX2RhdGFf
bW9uaXRvcl9yYW5nZSB7CiAJCQl1OCBzdXBwb3J0ZWRfc2NhbGluZ3M7CiAJCQl1OCBwcmVmZXJy
ZWRfcmVmcmVzaDsKIAkJfSBfX2F0dHJpYnV0ZV9fKChwYWNrZWQpKSBjdnQ7Ci0JfSBmb3JtdWxh
OworCX0gX19hdHRyaWJ1dGVfXygocGFja2VkKSkgZm9ybXVsYTsKIH0gX19hdHRyaWJ1dGVfXygo
cGFja2VkKSk7CiAKIHN0cnVjdCBkZXRhaWxlZF9kYXRhX3dwaW5kZXggewpAQCAtMTU0LDcgKzE1
NCw3IEBAIHN0cnVjdCBkZXRhaWxlZF9ub25fcGl4ZWwgewogCQlzdHJ1Y3QgZGV0YWlsZWRfZGF0
YV93cGluZGV4IGNvbG9yOwogCQlzdHJ1Y3Qgc3RkX3RpbWluZyB0aW1pbmdzWzZdOwogCQlzdHJ1
Y3QgY3Z0X3RpbWluZyBjdnRbNF07Ci0JfSBkYXRhOworCX0gX19hdHRyaWJ1dGVfXygocGFja2Vk
KSkgZGF0YTsKIH0gX19hdHRyaWJ1dGVfXygocGFja2VkKSk7CiAKICNkZWZpbmUgRURJRF9ERVRB
SUxfRVNUX1RJTUlOR1MgMHhmNwpAQCAtMTcyLDcgKzE3Miw3IEBAIHN0cnVjdCBkZXRhaWxlZF90
aW1pbmcgewogCXVuaW9uIHsKIAkJc3RydWN0IGRldGFpbGVkX3BpeGVsX3RpbWluZyBwaXhlbF9k
YXRhOwogCQlzdHJ1Y3QgZGV0YWlsZWRfbm9uX3BpeGVsIG90aGVyX2RhdGE7Ci0JfSBkYXRhOwor
CX0gX19hdHRyaWJ1dGVfXygocGFja2VkKSkgZGF0YTsKIH0gX19hdHRyaWJ1dGVfXygocGFja2Vk
KSk7CiAKICNkZWZpbmUgRFJNX0VESURfSU5QVVRfU0VSUkFUSU9OX1ZTWU5DICgxIDw8IDApCg==
--0000000000007e28af05e01651d2--
