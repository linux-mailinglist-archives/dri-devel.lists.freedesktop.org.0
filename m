Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B24DB8B5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 22:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD00A6EAC4;
	Thu, 17 Oct 2019 20:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A4A6EABE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 20:57:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o18so3847796wrv.13
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 13:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bwyoXQ4jJ4Q5almIdl345BmuxoSl8eF1qmSvscrD0n0=;
 b=i7y3suoQEn+8mY3eoKtlojUcRUBRIdSARZmsyxJqgaoKYsQ9mgDN9o9PGIUM5U5yp+
 MZdJ6a9FpPuuYXTVTzn/MGMQdRZOSM8Fhu8kNRoFgJHi1aFYdPv1IBwxdJ43OVXI+vaE
 JIkTJLSPYUKLeU3jjqXBKk22S9HX/k7pNHdQyPDZQlczPgksTmNmq+nFwmmV0FZwd8Dn
 qGCcCKofxaFx0XoY7WX9mxOBUbxm5kGFkRIsnYkjrgwCiGXS4ojzAoAFlEyqurkFOL+R
 lm830Z117ZqnauOnTftgTqKq3lLlhu2szA1H4o2xC24ES+mcJhYKsYBrv/eq1yj7W688
 JL6Q==
X-Gm-Message-State: APjAAAVoyeiDb9uDSU7DNUq60rtS04f2LB/BrUF0lduOtSN70QKBT/BX
 If7FlzPiqLx8U4IQeLLG6t6srA69zh/2w/QG01XnEIQL
X-Google-Smtp-Source: APXvYqxk1Vk38cij+hG08v9miH0CcUvMZrabHnfYeHSE3g3zvLP1lq8tbCLWWPfKrCnK3BUl+XaMDXrmNdKLu8CH8S8=
X-Received: by 2002:a5d:50c9:: with SMTP id f9mr4527964wrt.36.1571345877272;
 Thu, 17 Oct 2019 13:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <CAO_48GFHx4uK6cWwJ4oGdJ8HNZNZYDzdD=yR3VK0EXQ86ya9-g@mail.gmail.com>
 <20190924162217.GA12974@arm.com> <20191009173742.GA2682@arm.com>
 <f4fb09a5-999b-e676-0403-cc0de41be440@ti.com>
 <20191014090729.lwusl5zxa32a7uua@DESKTOP-E1NTVVP.localdomain>
 <a213760f-1f41-c4a3-7e38-8619898adecd@ti.com>
 <CALAqxLV6EBHKPEaEkyfhEYyw0TXayTeY_4AWXfuASLLyxZh5+Q@mail.gmail.com>
 <a3c66479-7433-ec29-fbec-81aef60cb063@ti.com>
In-Reply-To: <a3c66479-7433-ec29-fbec-81aef60cb063@ti.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 17 Oct 2019 13:57:45 -0700
Message-ID: <CALAqxLWrsXG0XysL7RmhApbuZukDdG5VhdHOTS5odkG9f1ezwA@mail.gmail.com>
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
To: "Andrew F. Davis" <afd@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=bwyoXQ4jJ4Q5almIdl345BmuxoSl8eF1qmSvscrD0n0=;
 b=IVTXzhWtbuaLfp8YXz+L8gLII5lGU1ebkqAd/xq4aWHP7GLdwF3jh8hD75ka45BcYR
 rMlTQmTIYEORbZKcfGUU0zRRfOhV/1Ych2oGyZQYB3wTcIuNaCMcK7gtLCw51zOewVDi
 ZNbpv0SXBn6FlgHTtfDp1kqeGPlilmqew5qKv1KWSyknezR9kbPQX0hj+knIhu66dcAF
 IoMGc0cU07u/AZ9fl5fX3dlKUhOZw1tdXjRu/KbPXEzvoy/4gviKn1aWohsq84E0Idhg
 op6109z7y4WdcTVtIZbbk70O8gufTDYPo04gLFpqRnpRkt3uteetCciSl6heWBVHrDca
 Coyw==
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
Cc: Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Ayan Halder <Ayan.Halder@arm.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, nd <nd@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTI6MjkgUE0gQW5kcmV3IEYuIERhdmlzIDxhZmRAdGku
Y29tPiB3cm90ZToKPiBPbiAxMC8xNy8xOSAzOjE0IFBNLCBKb2huIFN0dWx0eiB3cm90ZToKPiA+
IEJ1dCBpZiB0aGUgb2JqZWN0aW9uIHN0YW5kcywgZG8geW91IGhhdmUgYSBwcm9wb3NhbCBmb3Ig
YW4gYWx0ZXJuYXRpdmUKPiA+IHdheSB0byBlbnVtZXJhdGUgYSBzdWJzZXQgb2YgQ01BIGhlYXBz
Pwo+ID4KPiBXaGVuIGluIHN0YWdpbmcgSU9OIGhhZCB0byByZWFjaCBpbnRvIHRoZSBDTUEgZnJh
bWV3b3JrIGFzIHRoZSBvdGhlcgo+IGRpcmVjdGlvbiB3b3VsZCBub3QgYmUgYWxsb3dlZCwgc28g
Y21hX2Zvcl9lYWNoX2FyZWEoKSB3YXMgYWRkZWQuIElmCj4gRE1BLUJVRiBoZWFwcyBpcyBub3Qg
aW4gc3RhZ2luZyB0aGVuIHdlIGNhbiBkbyB0aGUgb3Bwb3NpdGUsIGFuZCBoYXZlCj4gdGhlIENN
QSBmcmFtZXdvcmsgcmVnaXN0ZXIgaGVhcHMgaXRzZWxmIHVzaW5nIG91ciBmcmFtZXdvcmsuIFRo
YXQgd2F5Cj4gdGhlIENNQSBzeXN0ZW0gY291bGQgZGVjaWRlIHdoYXQgYXJlYXMgdG8gZXhwb3J0
IG9yIG5vdCAobWF5YmUgYmFzZWQgb24KPiBhIERUIHByb3BlcnR5IG9yIHNpbWlsYXIpLgoKT2su
IFRob3VnaCB0aGUgQ01BIGNvcmUgZG9lc24ndCBoYXZlIG11Y2ggc2Vuc2Ugb2YgRFQgZGV0YWls
cyBlaXRoZXIsCnNvIGl0IHdvdWxkIHByb2JhYmx5IGhhdmUgdG8gYmUgZG9uZSBpbiB0aGUgcmVz
ZXJ2ZWRfbWVtIGxvZ2ljLCB3aGljaApkb2Vzbid0IGZlZWwgcmlnaHQgdG8gbWUuCgpJJ2QgcHJv
YmFibHkgZ3Vlc3Mgd2Ugc2hvdWxkIGhhdmUgc29tZSBzb3J0IG9mIGR0IGJpbmRpbmcgdG8gZGVz
Y3JpYmUKYSBkbWFidWYgY21hIGhlYXAgYW5kIGZyb20gdGhhdCBub2RlIGxpbmsgdG8gYSBDTUEg
bm9kZSB2aWEgYQptZW1vcnktcmVnaW9uIHBoYW5kbGUuIEFsb25nIHdpdGggbWF5YmUgdGhlIGRl
ZmF1bHQgaGVhcCBhcyB3ZWxsPyBOb3QKZWFnZXIgdG8gZ2V0IGludG8gYW5vdGhlciBiaW5kaW5n
IHJldmlldyBjeWNsZSwgYW5kIEknbSBub3Qgc3VyZSB3aGF0Cm5vbi1EVCBzeXN0ZW1zIHdpbGwg
ZG8geWV0LCBidXQgSSdsbCB0YWtlIGEgc2hvdCBhdCBpdCBhbmQgaXRlcmF0ZS4KCj4gVGhlIGVu
ZCByZXN1bHQgaXMgdGhlIHNhbWUgc28gd2UgY2FuIG1ha2UgdGhpcyBjaGFuZ2UgbGF0ZXIgKGl0
IGhhcyB0bwo+IGNvbWUgYWZ0ZXIgRE1BLUJVRiBoZWFwcyBpcyBpbiBhbnl3YXkpLgoKV2VsbCwg
SSdtIGhlc2l0YW50IHRvIG1lcmdlIGNvZGUgdGhhdCBleHBvc2VzIGFsbCB0aGUgQ01BIGhlYXBz
IGFuZAp0aGVuIGFkZCBwYXRjaGVzIHRoYXQgYmVjb21lcyBtb3JlIHNlbGVjdGl2ZSwgc2hvdWxk
IGFueW9uZSBkZXBlbmQgb24KdGhlIGluaXRpYWwgYmVoYXZpb3IuIDovCgpTbywgPHNpZ2g+LCBJ
J2xsIHN0YXJ0IG9uIHRoZSByZXdvcmsgZm9yIHRoZSBDTUEgYml0cy4KClRoYXQgc2FpZCwgSSdt
IGRlZmluaXRlbHkgd2FudGluZyB0byBtYWtlIHNvbWUgcHJvZ3Jlc3Mgb24gdGhpcyBwYXRjaApz
ZXJpZXMsIHNvIG1heWJlIHdlIGNhbiBzdGlsbCBtZXJnZSB0aGUgY29yZS9oZWxwZXJzL3N5c3Rl
bSBoZWFwIGFuZApqdXN0IGhvbGQgdGhlIGNtYSBoZWFwIGZvciBhIHJld29yayBvbiB0aGUgZW51
bWVyYXRpb24gYml0cy4gVGhhdCB3YXkKd2UgY2FuIGF0IGxlYXN0IGdldCBvdGhlciBmb2xrcyB3
b3JraW5nIG9uIHN3aXRjaGluZyB0aGVpciB2ZW5kb3IKaGVhcHMgZnJvbSBJT04uCgpTdW1pdDog
RG9lcyB0aGF0IHNvdW5kIG9rPyBBc3N1bWluZyBubyBvdGhlciBvYmplY3Rpb25zLCBjYW4geW91
IHRha2UKdGhlIHYxMSBzZXQgbWludXMgdGhlIENNQSBoZWFwIHBhdGNoPwoKdGhhbmtzCi1qb2hu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
