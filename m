Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21BFF1307
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 10:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F387D6EC93;
	Wed,  6 Nov 2019 09:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6027D6EC93
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 09:56:25 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q13so24961132wrs.12
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 01:56:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=QnEMdj3fupXGGXOBQFacjqqx0uIwSvmqr2MHnVkS/98=;
 b=m3LzrjxYnVdheN906UEPE3sKkqj4qRVyiVezBqXqT6tQiRgezHwheYHi4S9DIvevN8
 A98np7Z2ZjbBFW24bdNiZXbA4CgnQJEGxSFvNrjn6xSWa6IZamFmZ25fpug2wy8ih4fF
 P4QBZF2OqygzknnWKnDr4ojbAeEYfAUCGErnXBbsyxghJEwuckZjWJv7Nukm0s+T7m5U
 xeqOe49+wumVfmK4ACXGZW6T2gcMXkV9yne1KMH945CR2tull+BU1AZzMRr1a0xry24Q
 myxqSNQaOhozQJxy6XxKJc1dYw3aS+lnsK82sLK2quJWKUSMa8r2eBrc+ubHRULIA6v5
 h9qw==
X-Gm-Message-State: APjAAAUeBT47DN6oXNk/Wy9NsUdWy0y+qR2328R3xo6WxlCIhWSiC1kU
 kJRYDiImdSjfkbN5LXW3Gvz4jw==
X-Google-Smtp-Source: APXvYqzeNhcbjI/P66aFKIK7o4mZyxq5FTaaYg/Zktzgi0V/xNoocR+KY116lLmLIi1UhRKscrYdMA==
X-Received: by 2002:adf:eb48:: with SMTP id u8mr1724449wrn.225.1573034183989; 
 Wed, 06 Nov 2019 01:56:23 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id g184sm2938346wma.8.2019.11.06.01.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 01:56:22 -0800 (PST)
Date: Wed, 6 Nov 2019 10:56:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Yiwei Zhang <zzyiwei@google.com>
Subject: Re: Proposal to report GPU private memory allocations with sysfs
 nodes [plain text version]
Message-ID: <20191106095620.GB23790@phenom.ffwll.local>
References: <20191028152602.GA5057@redhat.com>
 <CAKT=dDnXwa76_aOVhTaKyE2=2HT2qGHvP9HGqnMzArr-Jt3A+Q@mail.gmail.com>
 <CAKT=dDnhth-6giOWgym7qpLNeH=86=XhQmPcgHM2J8B_L3myRQ@mail.gmail.com>
 <CAOWid-c_5+Z438kHpgn-h9KGt12kzoSD43nRfg0-v10NUKa+tw@mail.gmail.com>
 <CAKT=dD=Jyqn25hrZycQu96pwqcEWepjJFy2yVMyAp2RL42b+Hw@mail.gmail.com>
 <CAOWid-cy3LWHP5JZK1y_GiO_D1ioH2e4LVN-H4MruPr=dU-u=A@mail.gmail.com>
 <20191101103657.2107c6e1@eldfell.localdomain>
 <CAKT=dDmLao+P-hHrc2fsQ-7yyViFm-QFKKOEZ4D2EFobvAJLhg@mail.gmail.com>
 <20191105094719.GY10326@phenom.ffwll.local>
 <CAKT=dDk1UQmhq6zYa0XCHwJU3utmtoymTa0DPHj195ETJvQfiw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKT=dDk1UQmhq6zYa0XCHwJU3utmtoymTa0DPHj195ETJvQfiw@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QnEMdj3fupXGGXOBQFacjqqx0uIwSvmqr2MHnVkS/98=;
 b=O1b0B1kbWJCYpaweiRj7xjBd9BpgqPr9CVzhBpvybNIlJ865auj2bDzRrJqtQzRw93
 sIWiYynXB7bqBZNgH8E5FRi0H6SAyA0+3tXXzxGzeg5k5Js4JZLdgvzjEmp9p2PKAUhc
 +GJDF/k0/E8SXszJ2Spmj1xT4ZRWeyu9JDV9I=
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
Cc: Alistair Delva <adelva@google.com>, Rohan Garg <rohan.garg@collabora.com>,
 Prahlad Kilambi <prahladk@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Kenny Ho <y2kenny@gmail.com>,
 kraxel@redhat.com, Jerome Glisse <jglisse@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, Chris Forbes <chrisforbes@google.com>,
 kernel-team@android.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMTE6NDU6MjhBTSAtMDgwMCwgWWl3ZWkgWmhhbmcgd3Jv
dGU6Cj4gSGkgRGFuaWVsLAo+IAo+ID4gLSBUaGUgbGFiZWxzIGFyZSBjdXJyZW50bHkgZnJlZS1m
b3JtLCBiYWtpbmcgdGhlbSBiYWNrIGludG8geW91ciBzdHJ1Y3R1cmUKPiA+ICB3b3VsZCBtZWFu
IHdlJ2QgbmVlZCB0byBkbyBsb3RzIG9mIGhvdCBhZGQvcmVtb3ZlIG9mIHN5c2ZzIGRpcmVjdG9y
eQo+ID4gIHRyZWVzLiBXaGljaCBzb3VuZHMgbGlrZSBhIHJlYWwgYmFkIGlkZWEgOi0vCj4gR2l2
ZW4gdGhlIGZyZWUgZm9ybSBvZiB0aGF0IGlvY3RsLCB3aGF0J3MgdGhlIHBsYW4gb2YgdXNpbmcg
dGhhdCBhbmQKPiB0aGUgcmVwb3J0aW5nIG9mIHRoZSBsYWJlbGVkIEJPcz8KPiBEbyB5b3UgdGhp
bmsgdXBzdHJlYW0ga2VybmVsIG5lZWQgdG8gaGF2ZSBjZXJ0YWluIHJlc291cmNlIGNhdGVnb3J5
Cj4gYmFzZWQgdHJhY2tpbmcgZm9yIGdwdSBwcml2YXRlIGFsbG9jYXRpb25zPwoKVGhlcmUncyBu
byBwbGFuLCB3ZSBzaW1wbHkgZGlkbid0IGNvbnNpZGVyIG1vcmUgc3RhbmRhcmRpemVkIGJ1Y2tl
dHMgd2hlbgphZGRpbmcgdGhhdCBsYWJlbCBzdXBwb3J0LiBTbyB5ZWFoIG5vdCBzdXJlIHdoYXQg
dG8gZG8gbm93LCBleGNlcHQgSSBkb24ndAp3YW50IDIgZGlmZmVyZW50IHdheXMgZm9yIGxhYmVs
bGluZyBidWZmZXJzLgoKPiA+IC0gQnVmZmVyIG9iamVjdHMgYXJlbid0IGF0dGFjaGVkIHRvIHBp
ZHMsIGJ1dCBmaWxlcy4gQW5kIGZpbGVzIGNhbiBiZQo+ID4gIHNoYXJlZC4gSWYgd2Ugd2FudCB0
byBsaXN0IHRoaXMgc29tZXdoZXJlIG91dHNpZGUgb2YgZGVidWdmcywgd2UgbmVlZCB0bwo+ID4g
IHRpZSB0aGlzIGludG8gdGhlIGZpbGVzIHNvbWVob3cgKHNvIHByb2MpLCBleGNlcHQgdGhlIHVu
ZGVybHlpbmcgZmlsZXMKPiA+ICBhcmUgYWxsIGFub24gaW5vZGVzLCBzbyB0aGlzIGdldHMgcmVh
bGx5IHRyaWNreSBJIHRoaW5rIHRvIG1ha2Ugd29yawo+ID4gIHdlbGwuCj4gU28gdGhlcmUgaXNu
J3QgYW55IGdwdSBwcml2YXRlIGFsbG9jYXRpb25zIG9uIHRoZSB1cHN0cmVhbSBzaWRlPwo+IEhv
dyBkb2VzIHVwc3RyZWFtIGRlYWwgd2l0aCBkdXBsaWNhdGUgYWNjb3VudGluZyBmb3IgdGhlIHNo
YXJlZCBtZW1vcnk/CgpBdG0gd2UgZG9uJ3QgYWNjb3VudCBncHUgbWVtb3J5IGFueXdoZXJlIGF0
IGFsbC4gVGhlcmUncyBhIGxvdCBvZgpkaXNjdXNzaW9uIGdvaW5nIG9uIGhvdyB0byByZW1lZHkg
dGhhdCBpbiB0aGUgY29udGV4dCBvZiBhIGNncm91cApjb250cm9sbGVyLCBhbmQgaG93IHRvIGFj
Y291bnQgYWxsb2NhdGVkIGJ1ZmZlcnMgYWdhaW5zdCBwcm9jZXNzZXMgaXMgYQpodWdlIGRlYWwu
IE1heWJlIGNncm91cHMgaXMgbW9yZSB0aGUga2luZCBvZiBjb250cm9sL3JlcG9ydGluZyB5b3Un
cmUKbG9va2luZyBmb3I/IE9mIGNvdXJzZSB3b3VsZCBtZWFuIHRoYXQgYW5kcm9pZCBjcmVhdGVz
IGEgY2dyb3VwIGZvciBlYWNoCmFwcC4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
