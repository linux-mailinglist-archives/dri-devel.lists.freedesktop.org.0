Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C030EE6E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 09:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A7F6ECFF;
	Thu,  4 Feb 2021 08:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F006EBAC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 20:49:40 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id f63so580232pfa.13
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 12:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc
 :content-transfer-encoding;
 bh=M8lFoGv6mHlkS4pfcEZxXT0GjlBrKSHlOVSDDjgilMk=;
 b=rM1xvLKChJbMhPiPxDWEcePASMy0cf8HeErbywGhn2uz/vxUt3AWciE3Uj63Z9rkey
 3clwXdhoaZ9tcupljd+xCp/yiRwzX/ekcHuZsIbhXa17Qm+44qBkGfi0JFpr2BfLDeUP
 uL4Jo+ge5eJYzKr58jmA5TrlIeovIVSgJdXR6bfIIoYV+m7rgmaz3WLeyQzZxEEjpNnU
 UNyxblr37Vse2cJev1TBfQXLjVuw5otZVV5JNNT8jZRq/IIGsHa9JjamNNJP/gdZTaZo
 +iWKjsNqQHVX2hrRwm0Ki4jIyyS7RT2xYbuq6koIXVc5C5NFulhXVP9qaCbJ3Xt/zb+N
 PvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc:content-transfer-encoding;
 bh=M8lFoGv6mHlkS4pfcEZxXT0GjlBrKSHlOVSDDjgilMk=;
 b=HLxlzrD8tghL3XVWsc/TVcHr9wBgHx+hoycxEddRM2fTLkDAoLqmWLP8I4JB856l1H
 O/mHbcOZUqdQgLTPneVFdyE0MNlBscSJ84TVVaix8GMtM9pknpzkZ3noze+Mo7THE+bm
 hkAhCs1A97iWBIU5HMe+NzkKqu8XPiwTovCyemlJBgQn6fr/uMtqvwp0A5bRJwkkQdZl
 xRL7llKy7MJlU7XxMBjJr3vquncDjkfBgOgktLQuMx+zhVc8jz0FCcEj4HHxhijaiImM
 Fi3/MwNFDTnepgstxmYK83r/8iIVWq2Iu/BhsBP42btfbWxcBsNz9Banrsk8aD+aU1hw
 C1vg==
X-Gm-Message-State: AOAM530dKssSMShtSsWJJINT2AIAItZY+a2tewO4Ht4RperUuTvIio8C
 XGjH24iOS2u0GaAmz9WSx12yueJZ78is+1oZdge0Cg==
X-Received: by 2002:aa7:910a:0:b029:1c8:9947:305c with SMTP id
 10-20020aa7910a0000b02901c89947305cmt3620825pfh.75.1612385380012; Wed, 03 Feb
 2021 12:49:40 -0800 (PST)
MIME-Version: 1.0
References: <20210128182432.2216573-1-kaleshsingh@google.com>
In-Reply-To: <20210128182432.2216573-1-kaleshsingh@google.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Wed, 3 Feb 2021 15:49:27 -0500
Message-ID: <CAC_TJvdUN27PsjnehS03UQB=LdQUo9KJK=q1bgxJnZh2FJzXjw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Allow reading process DMA buf stats from fdinfo
X-Mailman-Approved-At: Thu, 04 Feb 2021 08:32:37 +0000
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Andrei Vagin <avagin@gmail.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Michel Lespinasse <walken@google.com>, Jeffrey Vander Stoep <jeffv@google.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 "Cc: Android Kernel" <kernel-team@android.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Bernd Edlinger <bernd.edlinger@hotmail.de>,
 Suren Baghdasaryan <surenb@google.com>,
 Alexey Gladkov <gladkov.alexey@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, Yafang Shao <laoar.shao@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKYW4gMjgsIDIwMjEgYXQgMToyNCBQTSBLYWxlc2ggU2luZ2ggPGthbGVzaHNpbmdo
QGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gQW5kcm9pZCBjYXB0dXJlcyBwZXItcHJvY2VzcyBzeXN0
ZW0gbWVtb3J5IHN0YXRlIHdoZW4gY2VydGFpbiBsb3cgbWVtb3J5Cj4gZXZlbnRzIChlLmcgYSBm
b3JlZ3JvdW5kIGFwcCBraWxsKSBvY2N1ciwgdG8gaWRlbnRpZnkgcG90ZW50aWFsIG1lbW9yeQo+
IGhvZ2dlcnMuIEluIG9yZGVyIHRvIG1lYXN1cmUgaG93IG11Y2ggbWVtb3J5IGEgcHJvY2VzcyBh
Y3R1YWxseSBjb25zdW1lcywKPiBpdCBpcyBuZWNlc3NhcnkgdG8gaW5jbHVkZSB0aGUgRE1BIGJ1
ZmZlciBzaXplcyBmb3IgdGhhdCBwcm9jZXNzIGluIHRoZQo+IG1lbW9yeSBhY2NvdW50aW5nLiBT
aW5jZSB0aGUgaGFuZGxlIHRvIERNQSBidWZmZXJzIGFyZSByYXcgRkRzLCBpdCBpcwo+IGltcG9y
dGFudCB0byBiZSBhYmxlIHRvIGlkZW50aWZ5IHdoaWNoIHByb2Nlc3NlcyBoYXZlIEZEIHJlZmVy
ZW5jZXMgdG8KPiBhIERNQSBidWZmZXIuCj4KPiBDdXJyZW50bHksIERNQSBidWZmZXIgRkRzIGNh
biBiZSBhY2NvdW50ZWQgdXNpbmcgL3Byb2MvPHBpZD4vZmQvKiBhbmQKPiAvcHJvYy88cGlkPi9m
ZGluZm8gLS0gYm90aCBhcmUgb25seSByZWFkYWJsZSBieSB0aGUgcHJvY2VzcyBvd25lciwKPiBh
cyBmb2xsb3dzOgo+ICAgMS4gRG8gYSByZWFkbGluayBvbiBlYWNoIEZELgo+ICAgMi4gSWYgdGhl
IHRhcmdldCBwYXRoIGJlZ2lucyB3aXRoICIvZG1hYnVmIiwgdGhlbiB0aGUgRkQgaXMgYSBkbWFi
dWYgRkQuCj4gICAzLiBzdGF0IHRoZSBmaWxlIHRvIGdldCB0aGUgZG1hYnVmIGlub2RlIG51bWJl
ci4KPiAgIDQuIFJlYWQvIHByb2MvPHBpZD4vZmRpbmZvLzxmZD4sIHRvIGdldCB0aGUgRE1BIGJ1
ZmZlciBzaXplLgo+Cj4gQWNjZXNzaW5nIG90aGVyIHByb2Nlc3Nlc+KAmSBmZGluZm8gcmVxdWly
ZXMgcm9vdCBwcml2aWxlZ2VzLiBUaGlzIGxpbWl0cwo+IHRoZSB1c2Ugb2YgdGhlIGludGVyZmFj
ZSB0byBkZWJ1Z2dpbmcgZW52aXJvbm1lbnRzIGFuZCBpcyBub3Qgc3VpdGFibGUKPiBmb3IgcHJv
ZHVjdGlvbiBidWlsZHMuICBHcmFudGluZyByb290IHByaXZpbGVnZXMgZXZlbiB0byBhIHN5c3Rl
bSBwcm9jZXNzCj4gaW5jcmVhc2VzIHRoZSBhdHRhY2sgc3VyZmFjZSBhbmQgaXMgaGlnaGx5IHVu
ZGVzaXJhYmxlLgo+Cj4gVGhpcyBzZXJpZXMgcHJvcG9zZXMgbWFraW5nIHRoZSByZXF1aXJlbWVu
dCB0byByZWFkIGZkaW5mbyBsZXNzIHN0cmljdAo+IHdpdGggUFRSQUNFX01PREVfUkVBRC4KPgoK
SGkgZXZlcnlvbmUsCgpJIHdpbGwgc2VuZCB2MiBvZiB0aGlzIHBhdGNoIHNlcmllcy4gUGxlYXNl
IGxldCBtZSBrbm93IGlmIHlvdSBoYXZlCmFueSBvdGhlciBjb21tZW50cyBvciBmZWVkYmFjaywg
dGhhdCBzaG91bGQgYmUgYWRkcmVzc2VkIGluIHRoZSBuZXcKdmVyc2lvbi4KClRoYW5rcywKS2Fs
ZXNoCgo+IEthbGVzaCBTaW5naCAoMik6Cj4gICBwcm9jZnM6IEFsbG93IHJlYWRpbmcgZmRpbmZv
IHdpdGggUFRSQUNFX01PREVfUkVBRAo+ICAgZG1hYnVmOiBBZGQgZG1hYnVmIGlub2RlIG5vIHRv
IGZkaW5mbwo+Cj4gIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgfCAgMSArCj4gIGZzL3Byb2Mv
YmFzZS5jICAgICAgICAgICAgfCAgNCArKy0tCj4gIGZzL3Byb2MvZmQuYyAgICAgICAgICAgICAg
fCAxNSArKysrKysrKysrKysrKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjMwLjAuMzY1LmcwMmJjNjkzNzg5LWdvb2cKPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
