Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE927EEB2
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415CE6ECF1;
	Fri,  2 Aug 2019 08:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F166E5C7
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 12:48:49 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id w10so34157891pgj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2019 05:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ATAFhJly7oayn4QwVxAmF/cKx18eZXYIEq5cLXvpdzg=;
 b=UAmUzY2tR5Vu3mSa9xOFQH37Ps95DL6akpdtgtfoCb+tbLNARfcufV/aNET/D8ZBaf
 4Iie9/MzImP6OEAuP42XkJySyXYQxSi8B5XymwuScA0r0mWLbvmojiC9SlUSK0x8Roc9
 jLYipDO2DrkdMtFB0cJaGgX9X016a8CF/AQT+Mw6yuxOm6j4Mc1yjmV1Rpu0z2aOG9am
 RroqhwNQcbhYsZSCuODuvpyGERcLeF3Jcy9Cf88qJ6qvs1gUbvimejlZPmH2EemTrVCO
 YnLmSH+YP9YZMofodM5pNMMGijZo8tH4GEuR+ZlBvjiHaiLwMhE30Xdhp0Xo1n5sf3Vi
 C57A==
X-Gm-Message-State: APjAAAXj84Llh+ZKlbPTBn9QdxBA6sOpPY3s8PD8mAyfBLwecKR2eIC+
 5r83yVEt4mUHVHxdh3asrmxrXHMHRcIkAipsubBykA==
X-Google-Smtp-Source: APXvYqyuYmWo+CP2FzNWYkHFT0ZLT3W5Y5OJQeMQdVh76HiNmdD4jPQ2fznL3kD7gDek9Cqsx8/zBcK9HOnHQgVpStE=
X-Received: by 2002:a65:4b8b:: with SMTP id
 t11mr118476394pgq.130.1564663728917; 
 Thu, 01 Aug 2019 05:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
 <8c618cc9-ae68-9769-c5bb-67f1295abc4e@intel.com>
 <13b4cf53-3ecb-f7e7-b504-d77af15d77aa@arm.com>
In-Reply-To: <13b4cf53-3ecb-f7e7-b504-d77af15d77aa@arm.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Thu, 1 Aug 2019 14:48:37 +0200
Message-ID: <CAAeHK+zTFqsLiB3Wf0bAi5A8ukQX5ZuvfUg4td-=r5UhBsUBOQ@mail.gmail.com>
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
To: Kevin Brodsky <kevin.brodsky@arm.com>
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ATAFhJly7oayn4QwVxAmF/cKx18eZXYIEq5cLXvpdzg=;
 b=mjC+j0aaEEkkMHnLNHs9TEJqIdScFWRlkAZG8TbiBl3AyUZ8l5nLaU29ZLHSb7WvwH
 X3OlQDdgsBZjncfM3ONy8Dqcuih1q2WnbLztoEOKMtf5vefqmMIHHwchJuo+ue+DCVka
 b9rui+0AvY5PeeX+qJY2jvBZQab/NzRkSsMupCgkTdlEDxE6K7Nu5zDKiMeGfnD3hicf
 2VPYUTHD9bJKAQWesHnbiPWY9rwW/eF7WIHmcnvL9DkrJEokfA1mnjx39I+4RQdt1WLM
 ieuyPRr8iw6XMHiEGmpinxm+wGAydMTsA6N4zI0Tg/WWtENcJ84NKdjINucR3C9EQWXN
 EQGw==
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>, Dave Hansen <dave.hansen@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCAyOjExIFBNIEtldmluIEJyb2Rza3kgPGtldmluLmJyb2Rz
a3lAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiAzMS8wNy8yMDE5IDE3OjUwLCBEYXZlIEhhbnNlbiB3
cm90ZToKPiA+IE9uIDcvMjMvMTkgMTA6NTggQU0sIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4g
Pj4gVGhlIG1tYXAgYW5kIG1yZW1hcCAob25seSBuZXdfYWRkcikgc3lzY2FsbHMgZG8gbm90IGN1
cnJlbnRseSBhY2NlcHQKPiA+PiB0YWdnZWQgYWRkcmVzc2VzLiBBcmNoaXRlY3R1cmVzIG1heSBp
bnRlcnByZXQgdGhlIHRhZyBhcyBhIGJhY2tncm91bmQKPiA+PiBjb2xvdXIgZm9yIHRoZSBjb3Jy
ZXNwb25kaW5nIHZtYS4KPiA+IFdoYXQgdGhlIGhlY2sgaXMgYSAiYmFja2dyb3VuZCBjb2xvdXIi
PyA6KQo+Cj4gR29vZCBwb2ludCwgdGhpcyBpcyBzb21lIGphcmdvbiB0aGF0IHdlIHN0YXJ0ZWQg
dXNpbmcgZm9yIE1URSwgdGhlIGlkZWEgYmVpbmcgdGhhdAo+IHRoZSBrZXJuZWwgY291bGQgc2V0
IGEgdGFnIHZhbHVlIChzcGVjaWZpZWQgZHVyaW5nIG1tYXAoKSkgYXMgImJhY2tncm91bmQgY29s
b3VyIiBmb3IKPiBhbm9ueW1vdXMgcGFnZXMgYWxsb2NhdGVkIGluIHRoYXQgcmFuZ2UuCj4KPiBB
bnl3YXksIHRoaXMgcGF0Y2ggc2VyaWVzIGlzIG5vdCBhYm91dCBNVEUuIEFuZHJleSwgZm9yIHYy
MCAoaWYgYW55KSwgSSB0aGluayBpdCdzCj4gYmVzdCB0byBkcm9wIHRoaXMgbGFzdCBzZW50ZW5j
ZSB0byBhdm9pZCBhbnkgY29uZnVzaW9uLgoKU3VyZSwgdGhhbmtzIQoKPgo+IEtldmluCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
