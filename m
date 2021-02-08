Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C27231413B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 22:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59586E9FD;
	Mon,  8 Feb 2021 21:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628C46E9FD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 21:06:10 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id h6so17154232oie.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 13:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vQz50O/ktJ04W7QSg0aQ+K5LizhyaY13N/jjRfnL8MQ=;
 b=VrgGYFARM6Ani9Qes+VGPFt+MtqItSmYYxUeYwlIhRCQqMDqT5A5dW9uoAuc4n4Lmb
 HOzyq4tL31RhQQ2JNHlodj/G4uJ9HJyq5nE93+DiaCDyo79ticWaFtY/q5J/LQvrS8Qq
 tWCIL98eTNQBCIg5qB9ZFRe7q0paeE3NdXwbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vQz50O/ktJ04W7QSg0aQ+K5LizhyaY13N/jjRfnL8MQ=;
 b=uWHn5lv+mzA3qPFImsQBf06p1sl5h66UwRFskf0e+HlAq2Gl6gxn5nTZmpnPpwet87
 a2pweo8C3iG5X/1f1ES+xF0nxiw9VET/qS8xG231n/BcIDeVKrzQclo1urEmnaNT7nUF
 PwG5Ffu8MCouU0fu09PcRp2riBfGG53x6kV2qTL2bUPzKSdgtUb0JflNItC4AwPNlmBb
 nyIskao3HH16N3OGTdxuEvmwOZWGcwOvB1t0B+gR2UxS9Awz/xCUhfWa5ch2v22sTfGf
 hq+NgF4RNuzZJ1n0+ibNrQV7qZudMzxV9/TfuDpNVAjH/UsDsXgJT+Nwt8IUCOs98U+l
 dVnw==
X-Gm-Message-State: AOAM532QOTZLr11gKhE4i9un32rkc/zoAXXWCvIeempjvWir0hfsng59
 5klULg34+RntakX8GiRbE1cr1c4WKQlQAzm4z0ZZVA==
X-Google-Smtp-Source: ABdhPJxXb5B/81zAt68xBP4U4swR34xTMrllQbQD2cTBMCEgDgID6RHPJmVY8X+xFjUiEHTQz30hepiShmiZprp8dv8=
X-Received: by 2002:aca:1906:: with SMTP id l6mr410002oii.101.1612818369680;
 Mon, 08 Feb 2021 13:06:09 -0800 (PST)
MIME-Version: 1.0
References: <20210206054748.378300-1-john.stultz@linaro.org>
 <20210206054748.378300-2-john.stultz@linaro.org>
 <YCENrGofdwVg2LMe@phenom.ffwll.local>
 <CALAqxLV2Sikxnr3-k94nqcF5vz+jsekhhUrmXEKkwzwwu4up8g@mail.gmail.com>
In-Reply-To: <CALAqxLV2Sikxnr3-k94nqcF5vz+jsekhhUrmXEKkwzwwu4up8g@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 8 Feb 2021 22:05:58 +0100
Message-ID: <CAKMK7uECMOO5jx4433uDuMq=MBaBEYaLe6ysrT_pshrr6Bf9dA@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/2] dma-buf: heaps: Fix the name used when exporting
 dmabufs to be the actual heap name
To: John Stultz <john.stultz@linaro.org>
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
Cc: Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBGZWIgOCwgMjAyMSBhdCA5OjUxIFBNIEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBs
aW5hcm8ub3JnPiB3cm90ZToKPiBPbiBNb24sIEZlYiA4LCAyMDIxIGF0IDI6MDggQU0gRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+IE9uIFNhdCwgRmViIDA2LCAyMDIx
IGF0IDA1OjQ3OjQ4QU0gKzAwMDAsIEpvaG4gU3R1bHR6IHdyb3RlOgo+ID4gPiBCeSBkZWZhdWx0
IGRtYV9idWZfZXhwb3J0KCkgc2V0cyB0aGUgZXhwb3J0ZXIgbmFtZSB0byBiZQo+ID4gPiBLQlVJ
TERfTU9ETkFNRS4gVW5mb3J0dW5hdGVseSB0aGlzIG1heSBub3QgYmUgaWRlbnRpY2FsIHRvIHRo
ZQo+ID4gPiBzdHJpbmcgdXNlZCBhcyB0aGUgaGVhcCBuYW1lIChpZTogInN5c3RlbSIgdnMgInN5
c3RlbV9oZWFwIikuCj4gPiA+Cj4gPiA+IFRoaXMgY2FuIGNhdXNlIHNvbWUgbWlub3IgY29uZnVz
aW9uIHdpdGggdG9vbGluZywgYW5kIHRoZXJlIGlzCj4gPiA+IHRoZSBmdXR1cmUgcG90ZW50aWFs
IHdoZXJlIG11bHRpcGxlIGhlYXAgdHlwZXMgbWF5IGJlIGV4cG9ydGVkCj4gPiA+IGJ5IHRoZSBz
YW1lIG1vZHVsZSAoYnV0IHdvdWxkIGFsbCBoYXZlIHRoZSBzYW1lIG5hbWUpLgo+ID4gPgo+ID4g
PiBTbyB0byBhdm9pZCBhbGwgdGhpcywgc2V0IHRoZSBleHBvcnRlciBleHBfbmFtZSB0byB0aGUg
aGVhcCBuYW1lLgo+ID4gPgo+ID4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
Pgo+ID4gPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiA+ID4g
Q2M6IExpYW0gTWFyayA8bG1hcmtAY29kZWF1cm9yYS5vcmc+Cj4gPiA+IENjOiBDaHJpcyBHb2xk
c3dvcnRoeSA8Y2dvbGRzd29AY29kZWF1cm9yYS5vcmc+Cj4gPiA+IENjOiBMYXVyYSBBYmJvdHQg
PGxhYmJvdHRAa2VybmVsLm9yZz4KPiA+ID4gQ2M6IEJyaWFuIFN0YXJrZXkgPEJyaWFuLlN0YXJr
ZXlAYXJtLmNvbT4KPiA+ID4gQ2M6IEhyaWR5YSBWYWxzYXJhanUgPGhyaWR5YUBnb29nbGUuY29t
Pgo+ID4gPiBDYzogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KPiA+ID4g
Q2M6IFNhbmRlZXAgUGF0aWwgPHNzcGF0aWxAZ29vZ2xlLmNvbT4KPiA+ID4gQ2M6IERhbmllbCBN
ZW50eiA8ZGFuaWVsbWVudHpAZ29vZ2xlLmNvbT4KPiA+ID4gQ2M6IMOYcmphbiBFaWRlIDxvcmph
bi5laWRlQGFybS5jb20+Cj4gPiA+IENjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0u
Y29tPgo+ID4gPiBDYzogRXplcXVpZWwgR2FyY2lhIDxlemVxdWllbEBjb2xsYWJvcmEuY29tPgo+
ID4gPiBDYzogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPgo+ID4gPiBDYzogSmFtZXMg
Sm9uZXMgPGpham9uZXNAbnZpZGlhLmNvbT4KPiA+ID4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2Vy
bmVsLm9yZwo+ID4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KPiA+Cj4g
PiBMb29rcyByZWFzb25hYmxlIHRvIG1lLgo+ID4KPiA+IEkgZ3Vlc3MgdGhlIG1haW4gd29ycnkg
aXMgImRvZXMgdGhpcyBtZWFuIGhlYXAgbmFtZXMgYmVjb21lIHVhcGkiLCBpbgo+ID4gd2hpY2gg
Y2FzZSBJJ20gbWF5YmUgbm90IHNvIHN1cmUgYW55bW9yZSBob3cgdGhpcyB3aWxsIHRpZSBpbnRv
IHRoZQo+ID4gb3ZlcmFsbCBncHUgbWVtb3J5IGFjY291bnRpbmcgc3RvcnkuCj4gPgo+ID4gU2lu
Y2UgZm9yIGRtYS1idWYgaGVhcHMgb25lIG5hbWUgcGVyIGJ1ZmZlciBpcyBwZXJmZWN0bHkgZmlu
ZSwgc2luY2UKPiA+IGRtYS1idWYgaGVhcHMgYXJlbid0IHZlcnkgZHluYW1pYy4gQnV0IG9uIGRp
c2NyZXRlIGdwdSBkcml2ZXJzIGJ1ZmZlcnMKPiA+IG1vdmUsIHNvIGJha2luZyBpbiB0aGUgYXNz
dW1wdGlvbiB0aGF0ICJleHBvcnRlciBuYW1lID0gcmVzb3VyY2UgdXNhZ2UgZm9yCj4gPiB0aGlz
IGJ1ZmZlciIgaXMgYnJva2VuLgo+Cj4gSSBzdXNwZWN0IEknbSBtaXNzaW5nIGEgc3VidGxldHkg
aW4gd2hhdCB5b3UncmUgZGVzY3JpYmluZy4gTXkgc2Vuc2UKPiBvZiB0aGUgZXhwb3J0ZXIgbmFt
ZSBkb2Vzbid0IGFjY291bnQgZm9yIGEgYnVmZmVyJ3MgdXNhZ2UsIGl0IGp1c3QKPiBkZXNjcmli
ZXMgd2hhdCBjb2RlIGFsbG9jYXRlZCBpdCBhbmQgaW1wbGljaXRseSB3aGljaCBkbWFidWZfb3Bz
Cj4gaGFuZGxlcyBpdC4gIE1heWJlIGNvdWxkIHlvdSBnaXZlIGEgbW9yZSBzcGVjaWZpYyBleGFt
cGxlIG9mIHdoYXQKPiB5b3UncmUgaG9waW5nIHRvIGF2b2lkPwoKSnVzdCBwYXJhbm9pYSByZWFs
bHkgLSBvbiB0aGUgbGludXggc2lkZSB3aGVyZSB3ZSBhbGxvY2F0ZSBtb3N0CmJ1ZmZlcnMgKGV2
ZW4gc2hhcmVkIG9uZXMpIHdpdGggdGhlIGRyaXZlciwgdGhhdCBhbGxvY2F0b3IgaW5mbyBpc24n
dAp0aGF0IG1lYW5pbmdmdWwsIGl0IHJlYWxseSBqdXN0IHRlbGxzIHlvdSB3aGljaCBjb2RlCmFs
bG9jYXRlZC9leHBvcnRlZCB0aGF0IGRtYS1idWYuCgpCdXQgb24gQW5kcm9pZCwgd2hlcmUgYWxs
IHNoYXJlZCBidWZmZXJzIGNvbWUgZnJvbSBzcGVjaWZpYyBoZWFwcywgaXQKaXMgcmF0aGVyIG1l
YW5pbmdmdWwgaW5mb3JtYXRpb24uIFNvIEkgd29uZGVyZWQgd2hldGhlciBlLmcuIHRoZQphbmRy
b2lkIGRtYWJ1ZiBkZWJ1ZyB0b29sIHVzZXMgdGhhdCB0byBjb2xsZWN0IHBlci1oZWFwIHN0YXRz
LCBidXQKc291bmRzIGxpa2Ugbm8gcmlnaHQgbm93LiBQbHVzIHdpdGggdGhlIGNoYXQgd2UndmUg
aGFkIEkgdGhpbmsgd2UgaGF2ZQphIGxvbmctdGVybSBwbGFuIGZvciBob3cgdG8gZXhwb3NlIHRo
YXQgaW5mb3JtYXRpb24gcHJvcGVybHkuCgo+IFRvIG1lIHRoaXMgcGF0Y2ggaXMgbW9zdGx5IGp1
c3QgYSBjb25zaXN0ZW5jeS9sZWFzdC1zdXJwcmlzZSB0aGluZywgc28KPiB0aGUgaGVhcHMgZXhw
b3J0ZXIgbmFtZSBtYXRjaGVzIHRoZSBzdHJpbmcgdXNlZCBmb3IgdGhlIGhlYXAncyBjaGFyZGV2
Cj4gZGV2aWNlICh0aGUgaW50ZXJmYWNlIHVzZWQgdG8gYWxsb2NhdGUgaXQpIGluIG91dHB1dCBs
aWtlCj4gZGVidWdmcy9kbWFfYnVmL2J1ZmluZm8uCgpZZWFoIGZvciBkZWJ1ZyB0aGlzIG1ha2Vz
IHNlbnNlLiBhLWI6IG1lIGlmIHlvdSB3YW50IHRoYXQgc29tZXdoZXJlIG9uCnRoZSBwYXRjaGVz
LgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
