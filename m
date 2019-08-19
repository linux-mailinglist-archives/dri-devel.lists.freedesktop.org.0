Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6EE95877
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 09:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3056D6E5F9;
	Tue, 20 Aug 2019 07:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8ECF6E1BA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 15:16:49 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id m12so1117185plt.5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 08:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GlFmsxpfwLpG5XFQZcDJGrUJIAXAnOONymKIPYeVWy4=;
 b=Jke34XyGDfY0MZmNJs8+tBNYeZsuMhoy4/hTFf45akn7rUklkwWHfrxPDkZItx33/d
 oQWVdcTb5FKucAc9leFYEvZEQjuijKkwmY95LZlAP/KeN8uAy0zoIaYICV6be1ZrsZtP
 8bbQoGs+fSvBy8kYAyIOHjgwKLQNQ0ZfqoADaaw/KJchRryldc8EK69dXYWrh6YAFN5f
 J/iDeOQu2UPR1zlUKofHTQ2+0v0X+brJ9cS2D83M3ANymShIQM9keOKii66eUSRLSzad
 SlQPlL2CUu3xl0RtI2fYr+cs78xcPIMtBdtAGnw8foBUl2KmzsDjRMsS1hwQw+OkmgcA
 GyaA==
X-Gm-Message-State: APjAAAWDBxwcyypFlW6pESYDucaiuqV+XvM7oLXRkERiji9RGGZv3u/T
 rZs1xVAx9FaCZGL5iDL+/tM1D/q+X+oA8bVb83bscw==
X-Google-Smtp-Source: APXvYqxAVYv/X47htv2GfhrYLw10pOmVgC147AdMR4amTTESkgYjtOO9fvfN54mImyUI3YtolKb0GRqZDtWypE7Vt8Q=
X-Received: by 2002:a17:902:ab96:: with SMTP id
 f22mr23622721plr.147.1566227808825; 
 Mon, 19 Aug 2019 08:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <00eb8ba84205c59cac01b1b47615116a461c302c.1566220355.git.andreyknvl@google.com>
 <20190819150342.sxk3zzxvrxhkpp6j@willie-the-truck>
In-Reply-To: <20190819150342.sxk3zzxvrxhkpp6j@willie-the-truck>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 19 Aug 2019 17:16:37 +0200
Message-ID: <CAAeHK+xP6HnLJt_RKW67x8nbJLJp5A=av57BfwiFrA88eFn60w@mail.gmail.com>
Subject: Re: [PATCH ARM] selftests,
 arm64: fix uninitialized symbol in tags_test.c
To: Will Deacon <will@kernel.org>
X-Mailman-Approved-At: Tue, 20 Aug 2019 07:30:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=GlFmsxpfwLpG5XFQZcDJGrUJIAXAnOONymKIPYeVWy4=;
 b=GASLs+yZnKXgCHGknNLNo71e6UtRt515EbzdpWYm/Hpg75x/UubNKrVS4Ph4uPK+8D
 Ti+bZvb7RwZ8Rgn5diZiCZOC7bC9H+dTrKcVTPMW/pFv9U1AucjO/hRKCCkTBhzRIaU3
 D9sPMjOcAkw+sn0WiouQhRmANU/HoJXNnBPivxMzU2mCd+1bqEU622XIt7CtOkyBUScf
 CddY5regO8tRNMImraZP3DECenQ45DhILnBAxk2TuQ3iyHoyjpEbXWuF3zSR6z/Z8e3z
 D8kAaqFBdLd66b1BOwiK9p1SMntN4cI0JAUQgHjwyJ5ye9BNp3phuuPzg6paxdjmOKUJ
 Bduw==
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
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgNTowMyBQTSBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgQXVnIDE5LCAyMDE5IGF0IDAzOjE0OjQyUE0gKzAyMDAs
IEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBGaXggdGFnZ2VkX3B0ciBub3QgYmVpbmcgaW5p
dGlhbGl6ZWQgd2hlbiBUQkkgaXMgbm90IGVuYWJsZWQuCj4gPgo+ID4gRGFuIENhcnBlbnRlciA8
ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+Cj4gR3Vlc3NpbmcgdGhpcyB3YXMgUmVwb3J0ZWQt
YnksIG9yIGhhcyBEYW4gaW50cm9kdWNlZCBoaXMgb3duIHRhZyBub3c/IDspCgpPb3BzLCB5ZXMs
IFJlcG9ydGVkLWJ5IDopCgo+Cj4gR290IGEgbGluayB0byB0aGUgcmVwb3J0PwoKaHR0cHM6Ly93
d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgta3NlbGZ0ZXN0L21zZzA5NDQ2Lmh0bWwKCj4KPiBX
aWxsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
