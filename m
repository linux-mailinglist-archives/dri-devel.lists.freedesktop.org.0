Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5633DBD9F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 08:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3DF6E105;
	Fri, 18 Oct 2019 06:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E18D6E105
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 06:22:04 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id g13so4020237otp.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 23:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UkjADtH3OoY5PrcZf8XHmujRh7ZLWGmK8dpbgj0S1eU=;
 b=fEQMmet9pjxqgv+wLs1wcozlh8Rf2HZgg1wWQE9bisImX4j3OriTeBbgCT/AnI+mU5
 OgJ6tcbX5DpJL+/yzVlLq1wJ4UKZSlA3kN6sJNjNVEshr4O44aiHR1LPBJfv+lTY8vI7
 XydDJIJFr5e8+feti09i27wkzTGK9tvd3p5UNHBCi0KKn5hAU4EctE5bsop1IT1QpCPW
 QwzMI+B/BNk1JIFbQ3cfxgnGI9Ve318gVKrht6qSiVppfYK7kbkzpQM9x0q5XjJb/Fq7
 9Z+pNuzyeZnBWp8pAx3Zu89z3v1/qL0T790RPpiHUyQs5sIGslCoAHyTrGLu9/bF9aJi
 iN7w==
X-Gm-Message-State: APjAAAW/YM1ocrTe5WyC03OyS/vUCBxdEu42hYiYYOaXRc3M7S+PT8L5
 uEFGupIWae+lWtNdGqPY5hU6wjK2eKFdaOge5//JGQ==
X-Google-Smtp-Source: APXvYqwR7wbX4kwVFy183PKeDVFgPtoHxkXUCA+0LYtY5cckYxlTVfALoIDf9uoz66/ikzHu7GzRuAckqDtoyy0C35M=
X-Received: by 2002:a9d:3e17:: with SMTP id a23mr6485132otd.105.1571379723521; 
 Thu, 17 Oct 2019 23:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20191018052323.21659-1-john.stultz@linaro.org>
In-Reply-To: <20191018052323.21659-1-john.stultz@linaro.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 18 Oct 2019 11:51:51 +0530
Message-ID: <CAO_48GGCgtA4U1CU6KV7N2m=RrwAiKgAPYghmYwirM9RJU4YTA@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] DMA-BUF Heaps (destaging ION)
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UkjADtH3OoY5PrcZf8XHmujRh7ZLWGmK8dpbgj0S1eU=;
 b=TQ3ny8Ae1igp5m/vKmUDvMb4mX4I6kYGW4WLCXlpHo5hjFym6sUlALfnk9H0K0xuZw
 vxntYIkvzjqSKTwAXiTzTZnIEyP4s30APVsVmNv2qbF+6NVR4v+/w3djWQdk1IjXooOj
 byLtBC067wmsJzz2JSOUEIYd73PRAERcbELduLBIHJXs0RVC1OJSejk8tIMkmtMeeY3J
 flFsZmb0hzwMKhSqc1Y2S1qkpyohRMMFbrKyeBMeyfdeegC5eLwi+qffuYiEuZaWE/iY
 nxYCxGqa/zScFUKxexHNhjf0pr4Whqqwj1CL70BNoBVs7T+B0FyIigYwib10DOPIWdpu
 6p4w==
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
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9obiwgQW5kcmV3cywKCk9uIEZyaSwgMTggT2N0IDIwMTkgYXQgMTA6NTMsIEpvaG4gU3R1
bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEFuZHJldyBicm91Z2h0IHVw
IGEgcmVhc29uYWJsZSBjb25jZXJuIHdpdGggdGhlIENNQSBoZWFwCj4gZW51bWVyYXRpb24gaW4g
dGhlIHByZXZpb3VzIHBhdGNoIHNldCwgYW5kIEkgaGFkIGEgZmV3IG90aGVyCj4gbWlub3IgY2xl
YW51cHMgdG8gYWRkLCBzbyBoZXJlIGlzIHlldCBhbm90aGVyIHBhc3MgYXQgdGhlCj4gZG1hLWJ1
ZiBoZWFwcyBwYXRjaHNldCBBbmRyZXcgYW5kIEkgaGF2ZSBiZWVuIHdvcmtpbmcgb24gd2hpY2gK
PiB0cmllcyB0byBkZXN0YWdlIGEgZmFpciBjaHVuayBvZiBJT04gZnVuY3Rpb25hbGl0eS4KClRo
YW5rcyBtdWNoIGZvciBhbGwgeW91ciBoYXJkd29yayBpbiBnZXR0aW5nIHRoZXNlIHBhdGNoZXMg
cmVhZHkuIEl0Cmxvb2tzIGxpa2UgYSBzYW5lIGFwcHJvYWNoIHRvIG1lIHRvIGZpcnN0IGp1c3Qg
YWRkIHRoZSBkZWZhdWx0IGNtYQpoZWFwIGFuZCB3b3JrIG91dCB0aGUgc2VsZWN0aW9uIG9mIG90
aGVyIGhlYXBzIGxhdGVyIG9uLgoKSSB3aWxsIHdhaXQgb3V0IHRoaXMgd2Vla2VuZCBmb3IgYW55
IG9iamVjdGlvbnMgZnJvbSBvdGhlcnMsIGFuZCBpZiBJCmhlYXIgbm9uZSwgd2lsbCBtZXJnZSB0
aGlzIHNlcmllcyBvbiBNb25kYXkuCkhvcGUgdGhhdCBzb3VuZHMgcmVhc29uYWJsZT8KCj4KPiBU
aGUgcGF0Y2hzZXQgaW1wbGVtZW50cyBwZXItaGVhcCBkZXZpY2VzIHdoaWNoIGNhbiBiZSBvcGVu
ZWQKPiBkaXJlY3RseSBhbmQgdGhlbiBhbiBpb2N0bCBpcyB1c2VkIHRvIGFsbG9jYXRlIGEgZG1h
YnVmIGZyb20gdGhlCj4gaGVhcC4KPgo+IFRoZSBpbnRlcmZhY2UgaXMgc2ltaWxhciwgYnV0IG11
Y2ggc2ltcGxlciB0aGVuIElPTnMsIG9ubHkKPiBwcm92aWRpbmcgYW4gQUxMT0MgaW9jdGwuCj4K
PiBBbHNvLCBJJ3ZlIHByb3ZpZGVkIHJlbGF0aXZlbHkgc2ltcGxlIHN5c3RlbSBhbmQgY21hIGhl
YXBzLgo+Cj4gSSd2ZSBib290ZWQgYW5kIHRlc3RlZCB0aGVzZSBwYXRjaGVzIHdpdGggQU9TUCBv
biB0aGUgSGlLZXk5NjAKPiB1c2luZyB0aGUga2VybmVsIHRyZWUgaGVyZToKPiAgIGh0dHBzOi8v
Z2l0LmxpbmFyby5vcmcvcGVvcGxlL2pvaG4uc3R1bHR6L2FuZHJvaWQtZGV2LmdpdC9sb2cvP2g9
ZGV2L2RtYS1idWYtaGVhcAo+Cj4gQW5kIHRoZSB1c2Vyc3BhY2UgY2hhbmdlcyBoZXJlOgo+ICAg
aHR0cHM6Ly9hbmRyb2lkLXJldmlldy5nb29nbGVzb3VyY2UuY29tL2MvZGV2aWNlL2xpbmFyby9o
aWtleS8rLzkwOTQzNgo+Cj4gQ29tcGFyZWQgdG8gSU9OLCB0aGlzIHBhdGNoc2V0IGlzIG1pc3Np
bmcgdGhlIHN5c3RlbS1jb250aWcsCj4gY2FydmVvdXQgYW5kIGNodW5rIGhlYXBzLCBhcyBJIGRv
bid0IGhhdmUgYSBkZXZpY2UgdGhhdCB1c2VzCj4gdGhvc2UsIHNvIEknbSB1bmFibGUgdG8gZG8g
bXVjaCB1c2VmdWwgdmFsaWRhdGlvbiB0aGVyZS4KPiBBZGRpdGlvbmFsbHkgd2UgaGF2ZSBubyB1
cHN0cmVhbSB1c2VycyBvZiBjaHVuayBvciBjYXJ2ZW91dCwKPiBhbmQgdGhlIHN5c3RlbS1jb250
aWcgaGFzIGJlZW4gZGVwcmVjYXRlZCBpbiB0aGUgY29tbW9uL2FuZG9pZC0qCj4ga2VybmVscywg
c28gdGhpcyBzaG91bGQgYmUgb2suCj4KPiBJJ3ZlIGFsc28gcmVtb3ZlZCB0aGUgc3RhdHMgYWNj
b3VudGluZywgc2luY2UgYW55IHN1Y2gKPiBhY2NvdW50aW5nIHNob3VsZCBiZSBpbXBsZW1lbnRl
ZCBieSBkbWEtYnVmIGNvcmUgb3IgdGhlIGhlYXBzCj4gdGhlbXNlbHZlcy4KPgo+IE5ldyBpbiB2
MTI6Cj4gKiBUbyBhZGRyZXNzIEFuZHJldydzIGNvbmNlcm4gYWJvdXQgYWRkaW5nIGFsbCBDTUEg
YXJlYXMsIHRoZQo+ICAgQ01BIGhlYXAgb25seSBhZGRzIHRoZSBkZWZhdWx0IENNQSByZWdpb24g
Zm9yIG5vdy4KPiAqIE1pbm9yIGNsZWFudXBzIGFuZCBwcmVwIGZvciBsb2FkaW5nIGhlYXBzIGZy
b20gbW9kdWxlcwo+ICogSSBoYXZlIHBhdGNoZXMgdG8gYWRkIG90aGVyIHNwZWNpZmllZCBDTUEg
cmVnaW9ucywgYXMgd2VsbCBhcwo+ICAgbG9hZGluZyBoZWFwcyBmcm9tIG1vZHVsZXMgaW4gbXkg
V0lQIHRyZWUsIHdoaWNoIEkgd2lsbCBzdWJtaXQKPiAgIG9uY2UgdGhpcyBzZXQgaXMgcXVldWVk
LCBoZXJlOgo+ICAgICBodHRwczovL2dpdC5saW5hcm8ub3JnL3Blb3BsZS9qb2huLnN0dWx0ei9h
bmRyb2lkLWRldi5naXQvbG9nLz9oPWRldi9kbWEtYnVmLWhlYXAtV0lQCj4KPiB0aGFua3MKPiAt
am9obgoKPHNuaXA+CgpCZXN0LApTdW1pdC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
