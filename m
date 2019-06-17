Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5984C49A01
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3845E6E0ED;
	Tue, 18 Jun 2019 07:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C19B89ED6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 21:59:42 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id a97so4078030uaa.9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EAhatab0HAVyw+PnT7+3nUVy3uXQEI6O1vd8Cnx2LKk=;
 b=N54wUxjj94A9IosYqyxL8OZUzTm3oH3jkvUe16E0vOQ79OpLBLqYtdqdV8la+jBeTV
 aJWqYJBPYaZYx3PmS+KOD7w+jWFGKB2KEJZk3TqJ2lQpYcDGrZG5KXguGICKl5FtFKnw
 oKFMe/c0k9tYn3Opd5IUluEoQAU0fJCbu1YCHLx7ZilN0ptUneBTZGv63f0SJYbj/DEn
 Z1YJjnkUcUsRh/mPCCGYMUk8ds2UK9i7JFkUBcfgPRBFWp8RCo53zYsVlp08BBK6wXCU
 lDAbjCALxVcn2YFc63cjG3Ymr+pdmfocKrcCLjikSAaXxwMfJbZw6F0/kcDTK5skxNSl
 Rm1A==
X-Gm-Message-State: APjAAAV8GAN7DQi3QS7MM8TcbIe53nPLOaei+YmV3Cf36xB210rEpM7Q
 6HzR9/IMV4T2Q+Nwvu8jbUQVXl7e31jTuZUt+1j0Wg==
X-Google-Smtp-Source: APXvYqx2nWcd1UUVmxVOfqTdpy/EjWGEE63D+8CgDq6wsvkYXGUtTG/eldJ/84K4uXpb1xaJ0VQplOCTsiiUpsYmcEg=
X-Received: by 2002:ab0:234e:: with SMTP id h14mr10788176uao.25.1560808781025; 
 Mon, 17 Jun 2019 14:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
 <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
 <20190617135636.GC1367@arrakis.emea.arm.com>
 <CAFKCwrjJ+0ijNKa3ioOP7xa91QmZU0NhkO=tNC-Q_ThC69vTug@mail.gmail.com>
 <20190617171813.GC34565@arrakis.emea.arm.com>
In-Reply-To: <20190617171813.GC34565@arrakis.emea.arm.com>
From: Evgenii Stepanov <eugenis@google.com>
Date: Mon, 17 Jun 2019 14:59:29 -0700
Message-ID: <CAFKCwrhuQ+x-KprJV=CPCrnQR9Ky9qL=M5q_pa3fGj27oo4mng@mail.gmail.com>
Subject: Re: [PATCH v17 03/15] arm64: Introduce prctl() options to control the
 tagged user addresses ABI
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:12:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EAhatab0HAVyw+PnT7+3nUVy3uXQEI6O1vd8Cnx2LKk=;
 b=kvgoo1AWJ53ectZxNh7vumo7uHVF3ezzA+dmS6OCiyHy7q38adiyo8Mt48b9s1ecuS
 8vbgSWAHi7F66ZbJb0OnnHkka0SZfIdhx44ptJvkStf7KSPyjOUktnOEWU+P5uVTHP64
 eN+AH0Y198g5GhXwzgWWBTwbfohtVJT/rFQhRmBXLkxVDGhPtni3s7vOLmfSoppPuiMS
 fw+6xL0t8nIg9W/VqAlmea2Xi/QAMj43r70NCnqPKdZOQ+k2pXu+G5fUMaRe8zFdt2fk
 JWWQc2NJ/zMPTaMg9M5+VHQpiaQGfqqosa4YWPSG3qztsQIxZrsszWUCVKNg2vbMMWht
 a6XA==
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
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
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
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

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTA6MTggQU0gQ2F0YWxpbiBNYXJpbmFzCjxjYXRhbGlu
Lm1hcmluYXNAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAxNywgMjAxOSBhdCAwOTo1
NzozNkFNIC0wNzAwLCBFdmdlbmlpIFN0ZXBhbm92IHdyb3RlOgo+ID4gT24gTW9uLCBKdW4gMTcs
IDIwMTkgYXQgNjo1NiBBTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29t
PiB3cm90ZToKPiA+ID4gT24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDE6NDM6MjBQTSArMDIwMCwg
QW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+ID4gPiBGcm9tOiBDYXRhbGluIE1hcmluYXMgPGNh
dGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+ID4gPiA+Cj4gPiA+ID4gSXQgaXMgbm90IGRlc2lyYWJs
ZSB0byByZWxheCB0aGUgQUJJIHRvIGFsbG93IHRhZ2dlZCB1c2VyIGFkZHJlc3NlcyBpbnRvCj4g
PiA+ID4gdGhlIGtlcm5lbCBpbmRpc2NyaW1pbmF0ZWx5LiBUaGlzIHBhdGNoIGludHJvZHVjZXMg
YSBwcmN0bCgpIGludGVyZmFjZQo+ID4gPiA+IGZvciBlbmFibGluZyBvciBkaXNhYmxpbmcgdGhl
IHRhZ2dlZCBBQkkgd2l0aCBhIGdsb2JhbCBzeXNjdGwgY29udHJvbAo+ID4gPiA+IGZvciBwcmV2
ZW50aW5nIGFwcGxpY2F0aW9ucyBmcm9tIGVuYWJsaW5nIHRoZSByZWxheGVkIEFCSSAobWVhbnQg
Zm9yCj4gPiA+ID4gdGVzdGluZyB1c2VyLXNwYWNlIHByY3RsKCkgcmV0dXJuIGVycm9yIGNoZWNr
aW5nIHdpdGhvdXQgcmVjb25maWd1cmluZwo+ID4gPiA+IHRoZSBrZXJuZWwpLiBUaGUgQUJJIHBy
b3BlcnRpZXMgYXJlIGluaGVyaXRlZCBieSB0aHJlYWRzIG9mIHRoZSBzYW1lCj4gPiA+ID4gYXBw
bGljYXRpb24gYW5kIGZvcmsoKSdlZCBjaGlsZHJlbiBidXQgY2xlYXJlZCBvbiBleGVjdmUoKS4K
PiA+ID4gPgo+ID4gPiA+IFRoZSBQUl9TRVRfVEFHR0VEX0FERFJfQ1RSTCB3aWxsIGJlIGV4cGFu
ZGVkIGluIHRoZSBmdXR1cmUgdG8gaGFuZGxlCj4gPiA+ID4gTVRFLXNwZWNpZmljIHNldHRpbmdz
IGxpa2UgaW1wcmVjaXNlIHZzIHByZWNpc2UgZXhjZXB0aW9ucy4KPiA+ID4gPgo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+Cj4g
PiA+Cj4gPiA+IEEgcXVlc3Rpb24gZm9yIHRoZSB1c2VyLXNwYWNlIGZvbGs6IGlmIGFuIGFwcGxp
Y2F0aW9uIG9wdHMgaW4gdG8gdGhpcwo+ID4gPiBBQkksIHdvdWxkIHlvdSB3YW50IHRoZSBzaWdj
b250ZXh0LmZhdWx0X2FkZHJlc3MgYW5kL29yIHNpZ2luZm8uc2lfYWRkcgo+ID4gPiB0byBjb250
YWluIHRoZSB0YWc/IFdlIGN1cnJlbnRseSBjbGVhciBpdCBlYXJseSBpbiB0aGUgYXJtNjQgZW50
cnkuUyBidXQKPiA+ID4gd2UgY291bGQgZmluZCBhIHdheSB0byBwYXNzIGl0IGRvd24gaWYgbmVl
ZGVkLgo+ID4KPiA+IEZvciBIV0FTYW4gdGhpcyB3b3VsZCBub3QgYmUgdXNlZnVsIGJlY2F1c2Ug
d2UgaW5zdHJ1bWVudCBtZW1vcnkKPiA+IGFjY2Vzc2VzIHdpdGggZXhwbGljaXQgY2hlY2tzIGFu
eXdheS4gRm9yIE1URSwgb24gdGhlIG90aGVyIGhhbmQsIGl0Cj4gPiB3b3VsZCBiZSB2ZXJ5IGNv
bnZlbmllbnQgdG8ga25vdyB0aGUgZmF1bHQgYWRkcmVzcyB0YWcgd2l0aG91dAo+ID4gZGlzYXNz
ZW1ibGluZyB0aGUgY29kZS4KPgo+IEkgY291bGQgYXMgdGhpcyBkaWZmZXJlbnRseTogZG9lcyBh
bnl0aGluZyBicmVhayBpZiwgb25jZSB0aGUgdXNlcgo+IG9wdHMgaW4gdG8gVEJJLCBmYXVsdF9h
ZGRyZXNzIGFuZC9vciBzaV9hZGRyIGhhdmUgbm9uLXplcm8gdG9wIGJ5dGU/CgpJIHRoaW5rIGl0
IHdvdWxkIGJlIGZpbmUuCgo+IEFsdGVybmF0aXZlbHksIHdlIGNvdWxkIHByZXNlbnQgdGhlIG9y
aWdpbmFsIEZBUl9FTDEgcmVnaXN0ZXIgYXMgYQo+IHNlcGFyYXRlIGZpZWxkIGFzIHdlIGRvIHdp
dGggRVNSX0VMMSwgaW5kZXBlbmRlbnRseSBvZiB3aGV0aGVyIHRoZSB1c2VyCj4gb3B0ZWQgaW4g
dG8gVEJJIG9yIG5vdC4KPgo+IC0tCj4gQ2F0YWxpbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
