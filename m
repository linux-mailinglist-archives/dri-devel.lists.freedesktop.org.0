Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A75369B1B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 21:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE9589AEB;
	Mon, 15 Jul 2019 19:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD6A89AEB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 19:00:48 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v18so17346860ljh.6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 12:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wpIdpoGiHes6mc2LinoXCKJJD9MlyiAFmH9AZOOOeHI=;
 b=C+6wJsGnImiLcMeNxg9XRVtVZlCnIscAOBLEY+q2OPV1fEmFW8dIDZYluqqYKI8U6n
 EpO75hUvmsOC9ZeOS5i6GCwcI3bPqO4bEj/Hj1OLxSnjR2cU2InZGJQ9e4IUAWARCBRW
 HdnHonlnHMwK+WFoIYsqUJ36YZHIVb09Fs0Ukt0IIOj84RaqkREjoDcv4zOAAB+vB10D
 07BxeavZDkvGwLMbiu0A+tuE1hdtBweVduQvuZJceEewpzwP1fsEN3f+ItuZXTz91QI6
 PffEjQC9AwxbOYtEQoLOeoeUkcm8nfej0K6a42XuRa1qc2EJjKyJjms0N8s4KOZeAOJi
 doLg==
X-Gm-Message-State: APjAAAVgG5fb91J7+S1/dJvXxNePeRcoUax60WPYrbqIclZfqbsHtaiV
 8jCHk1yGgjLXHhU6Pr8ePsD3tEzZjjA=
X-Google-Smtp-Source: APXvYqw91ZLxN+4v16XywsDY5BbvUOUAUtaS6e6U4SA71douwnPGizi/fUM4HPDIERXOwgBgiTkRIQ==
X-Received: by 2002:a2e:a0d6:: with SMTP id f22mr14574963ljm.182.1563217246364; 
 Mon, 15 Jul 2019 12:00:46 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178])
 by smtp.gmail.com with ESMTPSA id x2sm2402653lfg.12.2019.07.15.12.00.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 12:00:45 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id i21so17366550ljj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 12:00:45 -0700 (PDT)
X-Received: by 2002:a2e:b003:: with SMTP id y3mr15117345ljk.72.1563217244925; 
 Mon, 15 Jul 2019 12:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9tx+CEkzmLZ-93GZmde9xzJ_rw3PJZxFu_pjZJc7KM5f-w@mail.gmail.com>
 <20190715122924.GA15202@mellanox.com>
 <CAHk-=wgEimwxXiDUdp9eSGZn4j6n8g-4KhdEG0kPVgKFQeAXgw@mail.gmail.com>
In-Reply-To: <CAHk-=wgEimwxXiDUdp9eSGZn4j6n8g-4KhdEG0kPVgKFQeAXgw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Jul 2019 12:00:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjZ6kGFJyfXEeOzmw_eZDqvcaZ=FnFpR_c3eUmPS5M5EQ@mail.gmail.com>
Message-ID: <CAHk-=wjZ6kGFJyfXEeOzmw_eZDqvcaZ=FnFpR_c3eUmPS5M5EQ@mail.gmail.com>
Subject: Re: DRM pull for v5.3-rc1
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=wpIdpoGiHes6mc2LinoXCKJJD9MlyiAFmH9AZOOOeHI=;
 b=Wb2cga1SJPgKwZTnU9NbM8DzlnLPO9eDXvY/K+0d4vdG1JGfpMPnXCznlzcBy5RNQB
 FS/S11uVWwNWGBZAZ6Hn4eLuL6NmCbcLwDDdFxBbY9ig0N8X9lHEI0070XzLd2Rd90uA
 jLc/WZwR2T9sZ8IDBc89f96QfjnLc11Riz63Y=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMTE6MTYgQU0gTGludXMgVG9ydmFsZHMKPHRvcnZhbGRz
QGxpbnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVsIDE1LCAyMDE5IGF0
IDU6MjkgQU0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPiB3cm90ZToKPiA+Cj4g
PiBUaGUgJ2htbScgdHJlZSBpcyBzb21ldGhpbmcgSSByYW4gdG8gdHJ5IGFuZCBoZWxwIHdvcmtm
bG93IGlzc3VlcyBsaWtlCj4gPiB0aGlzLCBhcyBpdCBjb3VsZCBiZSBtZXJnZWQgdG8gRFJNIGFz
IGEgdG9waWMgYnJhbmNoIC0gbWF5YmUgY29uc2lkZXIKPiA+IHRoaXMgZmxvdyBpbiBmdXR1cmU/
Cj4gPgo+ID4gTGludXMsIGRvIHlvdSBoYXZlIGFueSBhZHZpY2Ugb24gaG93IGJlc3QgdG8gaGFu
ZGxlIHNoYXJpbmcgbW0KPiA+IHBhdGNoZXM/Cj4KPiBJIGRvbid0IGhhdmUgYSBsb3Qgb2YgYWR2
aWNlIGV4Y2VwdCBmb3IgInZlcnkgdmVyeSBjYXJlZnVsbHkiLgo+Cj4gSSB0aGluayB0aGUgaG1t
IHRyZWUgd29ya2VkIHJlYWxseSB3ZWxsIHRoaXMgbWVyZ2Ugd2luZG93LCBhdCBsZWFzdAo+IGZy
b20gbXkgc3RhbmRwb2ludC4KClNpZGUgbm90ZTogSSBzdXNwZWN0IHRoYXQgaGF2aW5nIGEgc2Vw
YXJhdGUgYnJhbmNoIG1haW50YWluZWQgYnkgYQpzZXBhcmF0ZSBwZXJzb24gYWN0dWFsbHkgZG9l
cyBoZWxwIHRoZSAidmVyeSBjYXJlZnVsbHkiIHBhcnQuCgpJIHRoaW5rIHRoZSBobW0gYnJhbmNo
IGVuZGVkIHVwIGdldHRpbmcgbW9yZSAiaW5jaWRlbnRhbCByZXZpZXciCnNpbXBseSBiZWNhdXNl
IG9mIGhvdyBpdCB3YXMgZG9uZS4gU28gZXZlbiBpZiB0aGUgb3JpZ2luYWwgcmVhc29uIGZvcgp0
aGUgc2VwYXJhdGUgYnJhbmNoIHdhcyB0byByZXNvbHZlIHNvbWUgcXVpbHQvZ2l0IGludGVncmF0
aW9uIGlzc3VlcywKSSB3b3VsZCBub3QgYmUgYXQgYWxsIHN1cnByaXNlZCBpZiBqdXN0IHRoZSBl
eHRyYSBpbmRpcmVjdGlvbiB0aHJvdWdoCmFub3RoZXIgcGVyc29uIGVuZGVkIHVwIG1ha2luZyBi
b3RoIHRoZSBzZW5kaW5nIGFuZCByZWNlaXZpbmcgc2lkZQp0aGluayBtb3JlIGFib3V0IGVhY2gg
cGF0Y2ggYW5kIHRoaW5rIG1vcmUgYWJvdXQgdGhlIGFic3RyYWN0aW9uLgoKVGhlIGhtbSBicmFu
Y2ggZGlkbid0IGFjdHVhbGx5IHNlZW0gdG8gaGF2ZSBhbnkgb2YgdGhlIGNvcmUgVk0gcGVvcGxl
CnJldmlld2luZyBpdCBlaXRoZXIsIGJ1dCBpdCBkaWQgaGF2ZSByZXZpZXdlcnMgYWNyb3NzIGNv
bXBhbmllcyBmb3IKYWxsIHRoZSBwYXRjaGVzLCBhbmQgSSBkbyB0aGluayB0aGF0IHRoYXQgbWFr
ZXMgYSBkaWZmZXJlbmNlLgoKSXQncyBfc29vXyBlYXN5IGZvciBhIHBhdGNoIHNlcmllcyB0byBi
ZSBkZXZlbG9wZWQgaW5zaWRlIG9uZSBjb21wYW55CmJ5IGEgY291cGxlIG9mIHBlb3BsZSB3aG8g
YXJlIHByb2JhYmx5IGluIHRoZSBzYW1lIGdyb3VwLCBhbmQgaGF2ZSB0aGUKZXhhY3Qgc2FtZSBv
YmplY3RpdmVzLCB0byBiZSBhIGxvdCBtb3JlIGJpYXNlZCAoYW5kIGxpa2VseSBiaWFzZWQgbm90
CnRvd2FyZHMgdGhlIG1tIGdvYWxzLCBidXQgdGhlIGdvYWxzIG9mIHRoZSBjb2RlIF9vdXRzaWRl
XyB0aGUgbW0pLgoKVGhpcyBpcyBqdXN0IGEgbG9uZy13aW5kZWQgd2F5IHRvIHNheSAiSSBkbyB0
aGluayB0aGF0IHRoZSBzZXBhcmF0ZQphbmQgZXh0ZXJuYWwgYnJhbmNoIHdpdGggbXVsdGlwbGUg
aW50ZXJlc3RlZCBwYXJ0aWVzIiBjYW4gaGF2ZSBzb21lCmluaGVyZW50IGFkdmFudGFnZXMsIHdo
ZW4geW91IGFjdHVhbGx5IGhhdmUgbXVsdGlwbGUgcGVvcGxlIGxvb2tpbmcgYXQKaXQgd2l0aCBj
YXJlIGFuZCBpbnRlbnQuCgooQW5kIGhlcmUgdGhlIGZhY3QgdGhhdCB5b3UgaGF2ZSBtdWx0aXBs
ZSBzdWJzeXN0ZW1zIGxvb2tpbmcgYXQgdGhlCmNvZGUgaXMgdmVyeSBtdWNoIHBhcnQgb2Ygd2hh
dCBtYWtlcyBpdCBhIGdvb2QgbW9kZWwgLSBpZiBpdCB3YXMganVzdAphbiBleHRlcm5hbCBicmFu
Y2ggZm9yIG9uZSBzaW5nbGUgdXNlciAtIHRoZSB2bXdhcmUgZ2Z4IGRyaXZlciAtIHlvdQp3b3Vs
ZG4ndCBnZXQgdGhlIHNhbWUga2luZCBvZiBhZHZhbnRhZ2VzLiBTbyBpdCdzIG5vdCB0aGUgImV4
dGVybmFsCmJyYW5jaCIgcGFydCBpdHNlbGYsIGl0J3MgdGhlICJtdWx0aXBsZSB1c2VycyB3aG8g
Y2FyZSIgcGFydCB0aGF0Cmxpa2VseSBjYXVzZXMgcGVvcGxlIHRvIHRoaW5rIG1vcmUgYWJvdXQg
dGhlIGVuZCByZXN1bHQpCgpBZ2FpbiAtIG1heWJlIEknbSByYXRpb25hbGl6aW5nLCBhbmQgdGhl
IGhtbSBicmFuY2gganVzdCByYW5kb21seQpoYXBwZW5lZCB0byB3b3JrIHdlbGwgdGhpcyB0aW1l
LiBJIGRvIGxpa2UgaGF2aW5nIG11bHRpcGxlIHBlb3BsZSBmcm9tCmRpZmZlcmVudCBncm91cHMg
bG9vayBhdCB0aGluZ3MsIHRob3VnaC4KCiAgICAgICAgICAgICAgICAgICAgTGludXMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
