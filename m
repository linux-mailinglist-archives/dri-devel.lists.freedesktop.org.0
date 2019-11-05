Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6572BF0639
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 20:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE3F6E131;
	Tue,  5 Nov 2019 19:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231396E131
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 19:48:08 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id z6so18732612otb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 11:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sqb7GQLcQVbw2N0rPy5gzCBrbUzJToKITpBvRXsoKJk=;
 b=AMJUFJBP8U57msgdTut1srrH9DNW86V/dEWl/dHdDDeoOU4m7etBBBkTFTPzbwR/xy
 YwAbVlNq6S1jlpAqQZWzwRgHUBsZONoSYMcPYrUBQdh4H0kEK3Dx0KlPBAqMRwV356ux
 DXU7sy1DdB7TqWZqnGwTXDWh+od8r3UxKTnOx4d7+XsFWGAAF4ioWHf+XF7BucTMm0ex
 3mII735dtrHEdssBBdY//mdyVGo9K14hVp0+ZrLKWStRTn4Tws3g89Qmw3vzTFc5zk6l
 F1Em+sC/6QRxiKHJywFvXQ9tmvPZxiPZJCYYSx2qP0617cnJf38IirJT12uM4fJO3L9D
 PwZA==
X-Gm-Message-State: APjAAAVS0A+TyqreLg37Nlr+diLPdZJ/DqqCFS+M5N43dyyxNsQiZrPf
 wZJDLcQw42+jMNSaBorlZmf176ugFHPyAn9KW789NQ==
X-Google-Smtp-Source: APXvYqx/5UhLYjy08pWDrSssq4y3azdX7VIiqTt2QeupWH16xoX87fJYkAl89Qva0MNLhr3vdAmwGjb9v53y9mZuS9w=
X-Received: by 2002:a9d:75c7:: with SMTP id c7mr4595580otl.12.1572983285883;
 Tue, 05 Nov 2019 11:48:05 -0800 (PST)
MIME-Version: 1.0
References: <20191025234834.28214-1-john.stultz@linaro.org>
 <20191104095823.GD10326@phenom.ffwll.local>
 <CALAqxLW_CoAn-KXki0dGKK+vo-R4CTnjt1Azrw=mRdL8BUFGWw@mail.gmail.com>
 <20191105094259.GX10326@phenom.ffwll.local>
 <CALAqxLWvNOL=Exybb25GgYQujyJcPNTsFuaBnjLQPKTkVAi6Xw@mail.gmail.com>
 <CAKMK7uFSBNqVWy0N-GH7CzH-R7c9CVb97LgCffdMzGCgvVan4Q@mail.gmail.com>
In-Reply-To: <CAKMK7uFSBNqVWy0N-GH7CzH-R7c9CVb97LgCffdMzGCgvVan4Q@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 5 Nov 2019 11:47:53 -0800
Message-ID: <CALAqxLV+MfESanq+PenRUNR_w6KZT1KQ7suPjmiT-bdAFx83EA@mail.gmail.com>
Subject: Re: [RFC][PATCH 0/2] Allow DMA BUF heaps to be loaded as modules
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Sqb7GQLcQVbw2N0rPy5gzCBrbUzJToKITpBvRXsoKJk=;
 b=TqEhtOSMPG3KFe2OzLNhU+XMMbv3vQ/UqX1lLqTkWkQHbMfW2xSa8I+ZgpqLZJzmyu
 ncJDa/AGRBUW4mEfDae3GLEC+fv4Z8ax12Y/U/zSO4qDKwd3x8lHX787XzXBGAhOlo60
 EFccP+d8WXqgsnNWQiUXxAUsJ0zmHLBnnuL5roOl4R20eQp6/md4ZSVBWvwAmEWc2NJN
 b7Gw6Cc7NCurX68LC1mDzuTbDIfX50hy9aThsGbd0YypIocJGwv0KMbijNcisjHvwm7b
 GKqgWjpqG6WgtTSZGcB2zqF61YRU572ZtWOEqaItvhdW3gFvfwsMqyC0jG5FZmb2uw57
 xyjQ==
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
Cc: Sandeep Patil <sspatil@google.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>, Yue Hu <huyue2@yulong.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgNSwgMjAxOSBhdCAxMToxOSBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+IE9uIFR1ZSwgTm92IDUsIDIwMTkgYXQgNjo0MSBQTSBKb2huIFN0dWx0
eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiBPbiBUdWUsIE5vdiA1LCAyMDE5
IGF0IDE6NDMgQU0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+ID4K
PiA+ID4gT24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMTA6NTc6NDRBTSAtMDgwMCwgSm9obiBTdHVs
dHogd3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBOb3YgNCwgMjAxOSBhdCAxOjU4IEFNIERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gPiA+ID4gPiBPbiBGcmksIE9jdCAyNSwg
MjAxOSBhdCAxMTo0ODozMlBNICswMDAwLCBKb2huIFN0dWx0eiB3cm90ZToKPiA+ID4gPiBTbyBl
dmVuIGlmIHRoZSBoZWFwcyBhcmUgY29uZmlndXJlZCB2aWEgRFQgKHdoaWNoIGF0IHRoZSBtb21l
bnQgdGhlcmUKPiA+ID4gPiBpcyBubyBzdWNoIGJpbmRpbmcsIHNvIHRoYXQncyBub3QgcmVhbGx5
IGEgdmFsaWQgbWV0aG9kIHlldCksIHRoZXJlJ3MKPiA+ID4gPiBzdGlsbCB0aGUgcXVlc3Rpb24g
b2YgaWYgdGhlIGhlYXAgaXMgbmVjZXNzYXJ5L21ha2VzIHNlbnNlIG9uIHRoZQo+ID4gPiA+IGRl
dmljZS4gQW5kIHRoZSBEVCB3b3VsZCBvbmx5IGNvbnRyb2wgdGhlIGF2YWlsYWJpbGl0eSBvZiB0
aGUgaGVhcAo+ID4gPiA+IGludGVyZmFjZSwgbm90IGlmIHRoZSBoZWFwIGRyaXZlciBpcyBsb2Fk
ZWQgb3Igbm90Lgo+ID4gPgo+ID4gPiBIbSBJIHRob3VnaHQgdGhlIGNtYSByZWdpb25zIGFyZSBj
b25maWd1cmVkIGluIERUPyBIb3cgZG9lcyB0aGF0IHdvcmsgaWYKPiA+ID4gaXQncyBub3QgdXNp
bmcgRFQ/Cj4gPgo+ID4gU28geWVhLCBDTUEgcmVnaW9ucyBhcmUgZWl0aGVyIGNvbmZpZ3VyZWQg
YnkgRFQgb3Igc2V0dXAgYXQgYnVpbGQgdGltZQo+ID4gKEkgdGhpbmsgdGhlcmUncyBhIGNtZGxp
bmUgb3B0aW9uIHRvIHNldCBpdCB1cCBhcyB3ZWxsKS4KPiA+Cj4gPiBCdXQgdGhlIENNQSByZWdp
b25zIGFuZCB0aGUgZG1hYnVmIGNtYSBoZWFwIGRyaXZlciBhcmUgc2VwYXJhdGUKPiA+IHRoaW5n
cy4gVGhlIGxhdHRlciB1c2VzIHRoZSBmb3JtZXIuCj4KPiBIdWgsIEkgYXNzdW1lZCB0aGUgcGxh
biBpcyB0aGF0IHdoZW5ldmVyIHRoZXJlJ3MgYSBjbWEgcmVnaW9uLCB3ZSB3YW50Cj4gdG8gaW5z
dGFudGlhdGUgYSBkbWEtYnVmIGhlYXAgZm9yIGl0PyBXaHkvd2hlbiB3b3VsZCB3ZSBub3Qgd2Fu
dCB0byBkbwo+IHRoYXQ/CgpOb3QgcXVpdGUuIEFuZHJldyBub3RlZCB0aGF0IHdlIG1heSBub3Qg
d2FudCB0byBleHBvc2UgYWxsIENNQSByZWdpb25zCnZpYSBkbWFidWYgaGVhcHMsIHNvIHJpZ2h0
IG5vdyB3ZSBvbmx5IGV4cG9zZSB0aGUgZGVmYXVsdCByZWdpb24uIEkKaGF2ZSBmb2xsb3cgb24g
cGF0Y2hlcyB0aGF0IEkgc2VudCBvdXQgZWFybGllciAod2hpY2ggcmVxdWlyZXMgYQp0by1iZS1m
aW5hbGl6ZWQgRFQgYmluZGluZykgd2hpY2ggYWxsb3dzIHVzIHRvIHNwZWNpZnkgd2hpY2ggb3Ro
ZXIgQ01BCnJlZ2lvbnMgdG8gZXhwb3NlLgoKPiA+ID4gPiBPbiB0aGUgSGlLZXkvSGlLZXk5NjAg
Ym9hcmRzLCB3ZSBoYXZlIHRvIGFsbG9jYXRlIGNvbnRpZ3VvdXMgYnVmZmVycwo+ID4gPiA+IGZv
ciB0aGUgZGlzcGxheSBmcmFtZWJ1ZmZlci4gU28gZ3JhbGxvYyB1c2VzIElPTiB0byBhbGxvY2F0
ZSBmcm9tIHRoZQo+ID4gPiA+IENNQSBoZWFwLiBIb3dldmVyIG9uIHRoZSBkYjg0NWMsIGl0IGhh
cyBubyBzdWNoIHJlc3RyaWN0aW9ucywgc28gdGhlCj4gPiA+ID4gQ01BIGhlYXAgaXNuJ3QgbmVj
ZXNzYXJ5Lgo+ID4gPgo+ID4gPiBXaHkgZG8geW91IGhhdmUgYSBDTUEgcmVnaW9uIGZvciB0aGUg
Mm5kIGJvYXJkIGlmIHlvdSBkb24ndCBuZWVkIGl0Pwo+ID4gPiBfVGhhdF8gc291bmRzIGxpa2Ug
c29tZSBzZXJpb3VzIG1lbW9yeSB3YXN0ZXIsIG5vdCBhIGZldyBsaW5lcyBvZiBjb2RlCj4gPiA+
IGxvYWRlZCBmb3Igbm90aGluZyA6LSkKPiA+Cj4gPiA/Pz8gVGhhdCdzIG5vdCB3aGF0IEkgc2Fp
ZCBhYm92ZS4gIElmIHRoZSBkYjg0NWMgZG9lc24ndCBuZWVkIENNQSBpdAo+ID4gd29uJ3QgaGF2
ZSBhIENNQSByZWdpb24uCj4gPgo+ID4gVGhlIGlzc3VlIGF0IGhhbmQgaXMgdGhhdCB3ZSBtYXkg
d2FudCB0byBhdm9pZCBsb2FkaW5nIHRoZSBkbWFidWYgQ01BCj4gPiBoZWFwIGRyaXZlciBvbiBh
IGJvYXJkIHRoYXQgZG9lc24ndCB1c2UgQ01BLgo+Cj4gU28gdGhlIENNQSBjb3JlIGNvZGUgaXMg
YWxzbyBhIG1vZHVsZSwgb3IgaG93IGRvZXMgdGhhdCB3b3JrPyBOb3QKCk5vLiAgQ01BIGNvcmUg
aXNuJ3QgYXZhaWxhYmxlIGFzIGEgbW9kdWxlLgoKPiBsb2FkaW5nIHRoZSBjbWEgZG1hLWJ1ZiBo
ZWFwLCBidXQga2VlcGluZyBhbGwgdGhlIG90aGVyIGNtYSBjb2RlCj4gYXJvdW5kIGZlZWxzIHNs
aWdodGx5IHNpbGx5LiBEbyB3ZSBoYXZlIG51bWJlcnMgdGhhdCBqdXN0aWZ5IHRoaXMKPiBzaWxs
aW5lc3M/CgpJIGFncmVlIHRoYXQgaXMgbWF5YmUgbm90IHRoZSBtb3N0IGNyaXRpY2FsIGl0ZW0g
b24gdGhlIGxpc3QsIGJ1dCBpdHMKb25lIG9mIG1hbnkgdGhhdCBkbyBhZGQgdXAgb3ZlciB0aW1l
LgoKQWdhaW4sIEknbGwgZGVmZXIgdG8gU2FuZGVlcCBvciBvdGhlciBmb2xrcyBvbiB0aGUgR29v
Z2xlIHNpZGUgdG8gaGVscAp3aXRoIHRoZSBpbXBvcnRhbmNlIGhlcmUuIE1vc3RseSBJJ20gdHJ5
aW5nIHRvIGVuc3VyZSB0aGVyZSBpcwpmdW5jdGlvbmFsIHBhcml0eSB0byBJT04gc28gd2UgZG9u
J3QgZ2l2ZSBmb2xrcyBhbnkgcmVhc29uIHRoZXkgY291bGQKb2JqZWN0IHRvIGRlcHJlY2F0aW5n
IGl0LgoKPiA+IFRoZSBtYWluIHJlYXNvbiBJJ20gb25seSBzdWJtaXR0aW5nIHN5c3RlbSBhbmQg
Q01BIGlzIGJlY2F1c2UgdGhvc2UKPiA+IGFyZSB0aGUgb25seSB0d28gSSBwZXJzb25hbGx5IGhh
dmUgYSB1c2VyIGZvciAoSGlLZXkvSGlLZXk5NjAgYm9hcmRzKS4KPiA+IEl0J3MgbXkgaG9wZSB0
aGF0IG9uY2Ugd2UgZGVwcmVjYXRlIElPTiBpbiBBbmRyb2lkLCB2ZW5kb3JzIHdpbGwKPiA+IG1p
Z3JhdGUgYW5kIHdlJ2xsIGJlIGFibGUgdG8gcHVzaCB0aGVtIHRvIHVwc3RyZWFtIHRoZWlyIGhl
YXBzIGFzCj4gPiB3ZWxsLgo+Cj4gSSB0aGluayBmb3IgdXBzdHJlYW0gSSdkIHdhbnQgdG8gc2Vl
IHRob3NlIG90aGVyIGhlYXBzIGZpcnN0LiBJZgo+IHRoZXkncmUgbW9zdGx5IGRyaXZlciBhbGxv
Y2F0b3JzIGV4cG9zZWQgYXMgaGVhcHMsIHRoZW4gSSB0aGluayB3ZQo+IG5lZWQgc29tZXRoaW5n
IGRpZmZlcmVudCB0aGFuIGhlYXAgbW9kdWxlcywgbWF5YmUgYWxsb3cgZG1hLWJ1ZiB0bwo+IGFs
bG9jYXRlIGZyb20gZHJpdmVycyBpbnN0ZWFkLiBCdXQgYWZhaXVpIGFsbCBzdWNoIGRyaXZlciBh
bGxvY2F0b3JzCj4gd2UgaGF2ZSBpbiB1cHN0cmVhbSBhcmUgY21hIHJlZ2lvbnMgb25seSByaWdo
dCBub3cuCgpJJ20gc29ycnksIEknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVh
biBoZXJlIChJJ20gbm90IHN1cmUKd2hhdCBhY3Rpb24gSSBzaG91bGQgYmUgdGFraW5nKS4gQ291
bGQgeW91IGNsYXJpZnkgdGhpcyBwb2ludD8KCnRoYW5rcwotam9obgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
