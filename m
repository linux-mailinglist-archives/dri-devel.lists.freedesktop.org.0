Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC44C795F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 21:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D9D10E859;
	Mon, 28 Feb 2022 20:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5AC10E85D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 20:01:50 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id g39so23210535lfv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 12:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gT/mxIYbzDn15+z84Rt0/ZmLFqIl34ZjMPCseIzUB9o=;
 b=Tm2RrZZp9rg85Q2lAdsba4a3IH+hQMy5xZCbUizCCXmPzyfZ+2VRqEslWXZB4tPt3B
 Xz8lYe63CHEdQCuWSaPC9nNMhFWrnR54Ihwd0u2qPZVZ4zvhHacXKCw+SJS4BR1PfT62
 xCFGBc0xrmrOEo0QPHvZeTHUhXNuWYmty+udI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gT/mxIYbzDn15+z84Rt0/ZmLFqIl34ZjMPCseIzUB9o=;
 b=bi8ksUs7N9sINk78snWQF57t0iBsys80VtpcQqlxlRlpjQ8g2Vv82J7s/wwS729V9z
 4/gSNtkQssJXvA7L7vDI1f9VKRsnArK+ORgC1DpUql88W9DREEnQXH09TW3oRRuYASvs
 x0sKeV1u5m0Gz4OAFvqUvYL7UMKQAFkxOgFWu54r3tP0mvLrlm7Ot5WGCkO8Kiz70s8m
 bqwqxI2CkMm4+xnAcF6/DBQl7u2HWN6FHJpzXgcIwssGI96okNZA0qi1nGp+BgDGMm/l
 YZTDuEihNJBDERjFUuMH4HIbEt+PUo7Dj/iNoFzy/Eqa2AYuk30nrARDBzMV5f1dZx8o
 IadQ==
X-Gm-Message-State: AOAM531BWaSb4aw9fBw8vMLlnufcIIsVd8Z0uYiSYiDjDPwN90xucjcJ
 LcNA/vo95oZxe58RQyJlLUe1NYHpHYCTlXtkapQ=
X-Google-Smtp-Source: ABdhPJxO8b1la+vRUuZ35IiS5TDlY24cEZf851lEx2iH68sPO41SL/T5V7JRsY/810TRZu6IOwe3mA==
X-Received: by 2002:a05:6512:3e4:b0:441:e72e:35a6 with SMTP id
 n4-20020a05651203e400b00441e72e35a6mr13338705lfq.412.1646078508421; 
 Mon, 28 Feb 2022 12:01:48 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177]) by smtp.gmail.com with ESMTPSA id
 y13-20020ac2420d000000b004433cddf621sm1113175lfh.119.2022.02.28.12.01.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 12:01:48 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id u7so18925996ljk.13
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 12:01:48 -0800 (PST)
X-Received: by 2002:ac2:5313:0:b0:443:99c1:7e89 with SMTP id
 c19-20020ac25313000000b0044399c17e89mr13183568lfh.531.1646078183366; Mon, 28
 Feb 2022 11:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
In-Reply-To: <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 11:56:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
Message-ID: <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="00000000000064a3e305d91971a9"
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000064a3e305d91971a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 4:19 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> I don't think that using the extra variable makes the code in any way
> more reliable or easier to read.

So I think the next step is to do the attached patch (which requires
that "-std=3Dgnu11" that was discussed in the original thread).

That will guarantee that the 'pos' parameter of list_for_each_entry()
is only updated INSIDE the for_each_list_entry() loop, and can never
point to the (wrongly typed) head entry.

And I would actually hope that it should actually cause compiler
warnings about possibly uninitialized variables if people then use the
'pos' pointer outside the loop. Except

 (a) that code in sgx/encl.c currently initializes 'tmp' to NULL for
inexplicable reasons - possibly because it already expected this
behavior

 (b) when I remove that NULL initializer, I still don't get a warning,
because we've disabled -Wno-maybe-uninitialized since it results in so
many false positives.

Oh well.

Anyway, give this patch a look, and at least if it's expanded to do
"(pos) =3D NULL" in the entry statement for the for-loop, it will avoid
the HEAD type confusion that Jakob is working on. And I think in a
cleaner way than the horrid games he plays.

(But it won't avoid possible CPU speculation of such type confusion.
That, in my opinion, is a completely different issue)

I do wish we could actually poison the 'pos' value after the loop
somehow - but clearly the "might be uninitialized" I was hoping for
isn't the way to do it.

Anybody have any ideas?

                Linus

--00000000000064a3e305d91971a9
Content-Type: application/octet-stream; name=p
Content-Disposition: attachment; filename=p
Content-Transfer-Encoding: base64
Content-ID: <f_l073sb6w0>
X-Attachment-Id: f_l073sb6w0

ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbGlzdC5oIGIvaW5jbHVkZS9saW51eC9saXN0LmgK
aW5kZXggZGQ2YzIwNDFkMDljLi5iYWI5OTU1OTZhYWEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGlu
dXgvbGlzdC5oCisrKyBiL2luY2x1ZGUvbGludXgvbGlzdC5oCkBAIC02MzQsMTAgKzYzNCwxMCBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgbGlzdF9zcGxpY2VfdGFpbF9pbml0KHN0cnVjdCBsaXN0X2hl
YWQgKmxpc3QsCiAgKiBAaGVhZDoJdGhlIGhlYWQgZm9yIHlvdXIgbGlzdC4KICAqIEBtZW1iZXI6
CXRoZSBuYW1lIG9mIHRoZSBsaXN0X2hlYWQgd2l0aGluIHRoZSBzdHJ1Y3QuCiAgKi8KLSNkZWZp
bmUgbGlzdF9mb3JfZWFjaF9lbnRyeShwb3MsIGhlYWQsIG1lbWJlcikJCQkJXAotCWZvciAocG9z
ID0gbGlzdF9maXJzdF9lbnRyeShoZWFkLCB0eXBlb2YoKnBvcyksIG1lbWJlcik7CVwKLQkgICAg
ICFsaXN0X2VudHJ5X2lzX2hlYWQocG9zLCBoZWFkLCBtZW1iZXIpOwkJCVwKLQkgICAgIHBvcyA9
IGxpc3RfbmV4dF9lbnRyeShwb3MsIG1lbWJlcikpCisjZGVmaW5lIGxpc3RfZm9yX2VhY2hfZW50
cnkocG9zLCBoZWFkLCBtZW1iZXIpCQkJCQlcCisJZm9yICh0eXBlb2YocG9zKSBfX2l0ZXIgPSBs
aXN0X2ZpcnN0X2VudHJ5KGhlYWQsIHR5cGVvZigqcG9zKSwgbWVtYmVyKTsJXAorCSAgICAgIWxp
c3RfZW50cnlfaXNfaGVhZChfX2l0ZXIsIGhlYWQsIG1lbWJlcikgJiYgKCgocG9zKT1fX2l0ZXIp
LDEpOwlcCisJICAgICBfX2l0ZXIgPSBsaXN0X25leHRfZW50cnkoX19pdGVyLCBtZW1iZXIpKQog
CiAvKioKICAqIGxpc3RfZm9yX2VhY2hfZW50cnlfcmV2ZXJzZSAtIGl0ZXJhdGUgYmFja3dhcmRz
IG92ZXIgbGlzdCBvZiBnaXZlbiB0eXBlLgo=
--00000000000064a3e305d91971a9--
