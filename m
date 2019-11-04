Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 713AEEE55A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 17:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311BB6E62C;
	Mon,  4 Nov 2019 16:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EEF6E626
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 16:58:31 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id e9so5138460ljp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 08:58:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SGFVtZgIuY0pmc+VyfR5bHjFuWMXBLC+PFqq5aHuIEo=;
 b=C9cDaoqz7WSvjyj1jebWgjM2vnwq6oi4tq41TIHAKdwDxtc4Db7ULMsUbnu1BZil2i
 +tyXQwQBbQ8IOr6oTsJ/JcbPYqZ13FZdciIsqUVzPLWGzD6YRlMZmCR2aollgGObRdnG
 k0f0L0c1jGnLuTgh8h78G3w7xw4kCDbYCFF+ZxG/GDr7YdzdvMcZW+epfucMBPpiOjeo
 1Wx1F8Ud71vlH1uUTMx0wQJxtVymJq06jLzUUmWFzDZl0lmpU2c/VMtODnIlICgvlNHe
 HZF44xjtOo4QscuagdczQogRmsllUhf/U3AB+RtCahFwsONwOfLzs1P8kHgq6rCyj9JR
 Xb1w==
X-Gm-Message-State: APjAAAUbLC4ZnoE9xRZQMJ12MXd5oG1h5koDPwK24gV+2HkxHtMsa8/X
 2+CVKnBTRvW0tHYVqLyWdYnd+vv44w0oSvGHiWA=
X-Google-Smtp-Source: APXvYqyBWwpRhXathfjT9hiPrrapwsHBwEDmHstXjiCXSgsgfip5FT8iGRYWufzdrTu4WxJtt0TXzz7d5co/N0t+/2w=
X-Received: by 2002:a2e:7c12:: with SMTP id x18mr10417952ljc.130.1572886709180; 
 Mon, 04 Nov 2019 08:58:29 -0800 (PST)
MIME-Version: 1.0
References: <20191101214238.78015-1-john.stultz@linaro.org>
 <20191101214238.78015-2-john.stultz@linaro.org>
 <20191104102410.66wlyoln5ahlgkem@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20191104102410.66wlyoln5ahlgkem@DESKTOP-E1NTVVP.localdomain>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 5 Nov 2019 02:58:17 +1000
Message-ID: <CAPM=9tydXxV-6++HkkA+JX9GPWE1sN_8CGVCVn-Mwfgfzcn=hg@mail.gmail.com>
Subject: Re: [PATCH v14 1/5] dma-buf: Add dma-buf heaps framework
To: Brian Starkey <Brian.Starkey@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=SGFVtZgIuY0pmc+VyfR5bHjFuWMXBLC+PFqq5aHuIEo=;
 b=MxVs+IVXrO3laQhAsQiIIR5WTvzPZ/rDSAwIl8d3hD2isSoElvZb1eeIAUvCWShIGj
 AL4ZMlA0W548j6VmQp2kjBSfhpSGjPyht0wnnlh12bsw9+yQuPVnVJu2RUMBwMhMVy5g
 hf3tnhDhBsDGNej/dktnaLY/GEIKkwZDDnSwbI07qNU8QmHXmzL0m9QWkz5rihTll3OO
 dWrkOIV4xzOE4za+k3VjKwpvasbbbT2u9vjClU1SCfeqC6mEFeaOSPTEGV+OY7x81Kmm
 GQax7S04EG6zifGn7gE9BzmG99WYZsN0ZGnuxGgM8WhpeBE1fPVStd0rgl+YM8Y7CZGE
 vjpg==
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Sandeep Patil <sspatil@google.com>, Alistair Strachan <astrachan@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCA0IE5vdiAyMDE5IGF0IDIwOjI0LCBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5
QGFybS5jb20+IHdyb3RlOgo+Cj4gSGkgSm9obiwKPgo+IE9uIEZyaSwgTm92IDAxLCAyMDE5IGF0
IDA5OjQyOjM0UE0gKzAwMDAsIEpvaG4gU3R1bHR6IHdyb3RlOgo+ID4gRnJvbTogIkFuZHJldyBG
LiBEYXZpcyIgPGFmZEB0aS5jb20+Cj4gPgo+ID4gVGhpcyBmcmFtZXdvcmsgYWxsb3dzIGEgdW5p
ZmllZCB1c2Vyc3BhY2UgaW50ZXJmYWNlIGZvciBkbWEtYnVmCj4gPiBleHBvcnRlcnMsIGFsbG93
aW5nIHVzZXJsYW5kIHRvIGFsbG9jYXRlIHNwZWNpZmljIHR5cGVzIG9mIG1lbW9yeQo+ID4gZm9y
IHVzZSBpbiBkbWEtYnVmIHNoYXJpbmcuCj4gPgo+ID4gRWFjaCBoZWFwIGlzIGdpdmVuIGl0cyBv
d24gZGV2aWNlIG5vZGUsIHdoaWNoIGEgdXNlciBjYW4gYWxsb2NhdGUKPiA+IGEgZG1hLWJ1ZiBm
ZCBmcm9tIHVzaW5nIHRoZSBETUFfSEVBUF9JT0NfQUxMT0MuCj4gPgo+ID4gQWRkaXRpb25hbGx5
IHNob3VsZCB0aGUgaW50ZXJmYWNlIGdyb3cgaW4gdGhlIGZ1dHVyZSwgd2UgaGF2ZSBhCj4gPiBE
TUFfSEVBUF9JT0NfR0VUX0ZFQVRVUkVTIGlvY3RsIHdoaWNoIGNhbiByZXR1cm4gZnV0dXJlIGZl
YXR1cmUKPiA+IGZsYWdzLgo+Cj4gVGhlIHVzZXJzcGFjZSBwYXRjaCBkb2Vzbid0IHVzZSB0aGlz
IC0gYW5kIHRoZXJlJ3Mgbm8gaW5kaWNhdGlvbiBvZgo+IHdoYXQgaXQncyBpbnRlbmRlZCB0byBh
bGxvdyBpbiB0aGUgZnV0dXJlLiBJIG1pc3NlZCB0aGUgZGlzY3Vzc2lvbgo+IGFib3V0IGl0LCBk
byB5b3UgaGF2ZSBhIGxpbms/Cj4KPiBJIHRob3VnaHQgdGhlIHByZWZlcnJlZCBhcHByb2FjaCB3
YXMgdG8gYWRkIHRoZSBuZXcgaW9jdGwgb25seSB3aGVuIHdlCj4gbmVlZCBpdCwgYW5kIG5ldyB1
c2Vyc3BhY2Ugb24gb2xkIGtlcm5lbHMgd2lsbCBnZXQgIkVOT1NZUyIgdG8ga25vdwo+IHRoYXQg
dGhlIGtlcm5lbCBkb2Vzbid0IHN1cHBvcnQgaXQuCgpUaGlzIHdvcmtzIG9uY2UsIGV4cGFuZCB0
aGUgaW50ZXJmYWNlIDMgb3IgNCB0aW1lcyB3aXRoIG5vIGZlYXR1cmVzCmlvY3RsLCBhbmQgeW91
IHN0YXJ0IGJlaW5nIGhvc3RpbGUgdG8gdXNlcnNwYWNlLCB3aGljaCBmZWF0dXJlIGRvZXMKRU5P
U1lTIG1lYW4gaXNuJ3Qgc3VwcG9ydGVkIGV0Yy4KCk5leHQgdXNlcnNwYWNlIHN0YXJ0cyB0byBy
ZWx5IG9uIGtlcm5lbCB2ZXJzaW9uLCBidXQgdGhlbiBzb21lb25lCmJhY2twb3J0cyBhIGZlYXR1
cmUsIGRvd24gdGhlIHJhYmJpdCBob2xlIHdlIGdvLgoKQmUgbmljZSB0byB1c2Vyc3BhY2UgZ2l2
ZSB0aGVtIGEgZmVhdHVyZXMgaW9jdGwgdGhleSBjYW4gdXNlIHRvIGZpZ3VyZQpvdXQgaW4gYWR2
YW5jZSB3aGljaCBvZiB0aGUgNCB1YXBpcyB0aGUga2VybmVsIHN1cHBvcnRzLgoKRGF2ZS4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
