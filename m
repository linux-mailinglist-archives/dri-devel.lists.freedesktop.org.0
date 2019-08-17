Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DEE90BDA
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 03:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B136E9BB;
	Sat, 17 Aug 2019 01:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42AC6E9BB
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2019 01:05:47 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id v12so2422535oic.12
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 18:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z8ENTg05csYFB6EnyO7TkyjuL36iJBl01ajqYg4+H7c=;
 b=el5IP+72xXMiMG6wZboY6TpuP8NyuRVB05HyBEeJvHPNW3kyjVfPm4Gnu10A3pn9/Y
 FTWVVN7zkoGFaJ1PQeMUraSuU6Xrxt3SoY0XhMaB+ro59qB21pfLKZXEPn1XSpmI+N4C
 aVI+g0E7+QNvyNaPI+1JVA7X0wgQlkDCZndMux6cpvpf0r1yMhtP8apUIEDuMxCQBJTs
 l2ygQrX4HY3ehc0FGxJanMIIOz1Iw+1vmlS4sAfP2O0unmmxQKoi0JUZ4NRETKG1eviW
 Y42XNgZBiREpjYlhpHl992JK7uuboy0jsy3MBDknYxxQXQp0kj6PqMc++ezWpFg19FHO
 Q6nA==
X-Gm-Message-State: APjAAAUdJwr5t7F0pFz8hOC6JThMoqFXWzDQyuIyRlfjMo8T+w/iwh5U
 nDNBHAwKb7LZyuDaLW1ydXfKbvgB1kCiqx0kSOLE5A==
X-Google-Smtp-Source: APXvYqxAF+wfaMajL9Gg1WX4ibGOmCi7WYnh2/AlAm+7FMG2H8BiEHyYTuL/n4V5iTSQD2enFfVICFERyTQ8sCv5yDA=
X-Received: by 2002:aca:c453:: with SMTP id u80mr7036181oif.8.1566003946880;
 Fri, 16 Aug 2019 18:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190807150214.3629-1-rcampbell@nvidia.com>
 <20190808070701.GC29382@lst.de>
 <0b96a8d8-86b5-3ce0-db95-669963c1f8a7@nvidia.com>
 <20190810111308.GB26349@lst.de>
 <1a84e6b6-31e6-6955-509f-9883f4a7a322@nvidia.com>
 <20190816071132.GA7513@lst.de>
In-Reply-To: <20190816071132.GA7513@lst.de>
From: Ben Skeggs <bskeggs@redhat.com>
Date: Sat, 17 Aug 2019 11:05:36 +1000
Message-ID: <CABDvA=n4Y0QticHZowEWFOqiEB3p99nV71GvHAySYdkcgw-Aow@mail.gmail.com>
Subject: Re: [PATCH] nouveau/hmm: map pages after migration
To: Christoph Hellwig <hch@lst.de>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgNToxMSBQTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBPbiBNb24sIEF1ZyAxMiwgMjAxOSBhdCAxMjo0MjozMFBNIC0wNzAw
LCBSYWxwaCBDYW1wYmVsbCB3cm90ZToKPiA+Cj4gPiBPbiA4LzEwLzE5IDQ6MTMgQU0sIENocmlz
dG9waCBIZWxsd2lnIHdyb3RlOgo+ID4+IE9uIHNvbWV0aGluZyB2YWd1ZWx5IHJlbGF0ZWQgdG8g
dGhpcyBwYXRjaDoKPiA+Pgo+ID4+IFlvdSB1c2UgdGhlIE5WSUZfVk1NX1BGTk1BUF9WMF9WKiBk
ZWZpbmVzIGZyb20gbnZpZi9pZjAwMGMuaCwgd2hpY2ggYXJlCj4gPj4gYSBsaXR0bGUgb2RkIGFz
IHdlIG9ubHkgZXZlciBzZXQgdGhlc2UgYml0cywgYnV0IHRoZXkgYWxzbyBkb24ndCBzZWVtCj4g
Pj4gdG8gYXBwZWFyIHRvIGJlIGluIHZhbHVlcyB0aGF0IGFyZSBkaXJlY3RseSBmZWQgdG8gdGhl
IGhhcmR3YXJlLgo+ID4+Cj4gPj4gT24gdGhlIG90aGVyIGhhbmQgbW11L3ZtbS5oIGRlZmluZXMg
YSBzZXQgb2YgTlZJRl9WTU1fUEZOTUFQX1YwXyoKPiA+Cj4gPiBZZXMsIEkgc2VlIE5WS01fVk1N
X1BGTl8qCj4gPgo+ID4+IGNvbnN0YW50cyB3aXRoIHNpbWlsYXIgbmFtZXMgYW5kIGlkZW50aWNh
bCB2YWx1ZXMsIGFuZCB0aG9zZSBhcmUgdXNlZAo+ID4+IGluIG1tdS92bW1ncDEwMC5jIGFuZCB3
aGF0IGFwcGVhcnMgdG8gZmluYWxseSBkbyB0aGUgbG93LWxldmVsIGRtYQo+ID4+IG1hcHBpbmcg
YW5kIHRhbGtpbmcgdG8gdGhlIGhhcmR3YXJlLiAgQXJlIHRoZXNlIHR3byBzZXRzIG9mIGNvbnN0
YW50cwo+ID4+IHN1cHBvc2VkIHRvIGJlIHRoZSBzYW1lPyAgQXJlIHRoZSBhY3R1YWwgaGFyZHdh
cmUgdmFsdWVzIG9yIGp1c3QgYQo+ID4+IGRyaXZlciBpbnRlcm5hbCBpbnRlcmZhY2U/Cj4gPgo+
ID4gSXQgbG9va3MgYSBiaXQgb2RkIHRvIG1lIHRvby4KPiA+IEkgZG9uJ3QgcmVhbGx5IGtub3cg
dGhlIHN0cnVjdHVyZS9oaXN0b3J5IG9mIG5vdXZlYXUuCj4gPiBQZXJoYXBzIEJlbiBTa2VnZ3Mg
Y2FuIHNoZWQgbW9yZSBsaWdodCBvbiB5b3VyIHF1ZXN0aW9uLgo+Cj4gQmVuLCBkbyB5b3UgaGF2
ZSBhbnkgaW5zaWdodHMgb24gdGhlc2UgY29uc3RhbnRzPwpUaG9zZSBzZXRzIG9mIGNvbnN0YW50
cyBhcmUgKGN1cnJlbnRseSkgc3VwcG9zZWQgdG8gYmUgdGhlIHNhbWUgdmFsdWUuClRoZXkgZG9u
J3QgbmVjZXNzYXJpbHkgbWFwIHRvIHRoZSBIVyBkaXJlY3RseSBhdCB0aGlzIHN0YWdlLCBhbmQK
c29tZXRoaW5nIGRpZmZlcmVudCB3aWxsIGxpa2VseSBiZSBkb25lIGluIHRoZSBmdXR1cmUgYXMg
SFcgY2hhbmdlcy4KCkJlbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
