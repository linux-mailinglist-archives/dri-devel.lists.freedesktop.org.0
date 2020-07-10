Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E3F21E8CB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7566E8DD;
	Tue, 14 Jul 2020 07:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991BA6EC4E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 13:45:44 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s9so6481402ljm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 06:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Ermy1NiTIasCWgG8l4eJfsbME3tGp4LPfrJcemoGPXM=;
 b=KwyEeodt5NpEMJq67fztoSxejY3rRcicqAiurh9lc72Cg5Ikpu26p2wVaQGvfoljnj
 83gkOAzdgb2aGHuW44nzRzMIkT1efKtlsV00Iiho5AMFMAwX+mCweGEIa15yvNmTJvg7
 6UHxoilcxq+PEubjb8kD8dw6BKqzZXWcXaaevZu9o71tiU7UZPhy9qCIo9hrsIuj/F/O
 G/O0xg5oLTGXJ6UX0/u8+NKWs47dVwckSRicO+xDS6y79M6NZCuk+4EnQe9QZjnsewLq
 IsLO59TwzeXeEgJ0rLb9bf0+qihOsn9J30sTyFJJj9Nrq29gUyRIJUaJthzVBL/cl/R6
 DN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Ermy1NiTIasCWgG8l4eJfsbME3tGp4LPfrJcemoGPXM=;
 b=DbnOAwa17Fr9gcKmy6NmvJ6hsiWudhoqndZ6IrqmtiIjlU1DwXYB4a+hrTLUSxAyQP
 Wwe9YAVkPKLC2U6uEIugXhXXpA1CEe1U5O/gSLRq6XCSsXsuIvtxIjndeNEMvKISSf6M
 TiiKM3+yL11NfKkcelNKLgfMa5jsQziGlbR/N0oeJsadE8i3yZnPCc0CDY6ATh6jd7Ad
 PsYoaXlxrgzyY/Q1QRJiCi8373zXQdReksmb/Httm7gGuWDyaSzqAXwo2OIvEXhFt/+u
 zTWpDLHfqYqAzBrU2Zzui3nHImozTC4cij27Lh2qK3XmZqgRBdWdL14SmCqIt7a6IYZ2
 kt1w==
X-Gm-Message-State: AOAM533S6RF1PATmxl/m0Pq1fA8au/V4RN6RTHiV+ODmO6ztIUhFwHX+
 dRTAWBsKtITbB7f3yRWvirg=
X-Google-Smtp-Source: ABdhPJzDAXSMmQbiDz211yKlpNny0wSp8Rj9t2dBvyUNJmVxp4Pqdj6NKm6Hw1sjGZOphNEUTFIUqg==
X-Received: by 2002:a2e:9996:: with SMTP id w22mr2932963lji.446.1594388742977; 
 Fri, 10 Jul 2020 06:45:42 -0700 (PDT)
Received: from [127.0.0.1] (84-10-202-70.dynamic.chello.pl. [84.10.202.70])
 by smtp.gmail.com with ESMTPSA id m9sm2213915lfb.5.2020.07.10.06.45.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Jul 2020 06:45:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 13/14] [DO NOT MERGE] arm64: dts: allwinner: h6: Add
 GPU OPP table
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20200709140322.131320-14-peron.clem@gmail.com>
Date: Fri, 10 Jul 2020 15:45:40 +0200
Message-Id: <0A3B73FE-0732-4024-9729-1FCE02006C27@gmail.com>
References: <20200709140322.131320-1-peron.clem@gmail.com>
 <20200709140322.131320-14-peron.clem@gmail.com>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 dri-devel@lists.freedesktop.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Price <steven.price@arm.com>, "wens@csie.org" <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IFdpYWRvbW/Fm8SHIG5hcGlzYW5hIHByemV6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xl
bUBnbWFpbC5jb20+IHcgZG5pdSAwOS4wNy4yMDIwLCBvIGdvZHouIDE2OjAzOgo+IAo+IEFkZCBh
biBPcGVyYXRpbmcgUGVyZm9ybWFuY2UgUG9pbnRzIHRhYmxlIGZvciB0aGUgR1BVIHRvCj4gZW5h
YmxlIER5bmFtaWMgVm9sdGFnZSAmIEZyZXF1ZW5jeSBTY2FsaW5nIG9uIHRoZSBINi4KPiAKPiBU
aGUgdm9sdGFnZSByYW5nZSBpcyBzZXQgd2l0aCBtaW5pdmFsIHZvbHRhZ2Ugc2V0IHRvIHRoZSB0
YXJnZXQKPiBhbmQgdGhlIG1heGltYWwgdm9sdGFnZSBzZXQgdG8gMS4yVi4gVGhpcyBhbGxvdyBE
VkZTIGZyYW1ld29yayB0bwo+IHdvcmsgcHJvcGVybHkgb24gYm9hcmQgd2l0aCBmaXhlZCByZWd1
bGF0b3IuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdt
YWlsLmNvbT4KPiAtLS0KPiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYu
ZHRzaSB8IDgwICsrKysrKysrKysrKysrKysrKysrCj4gMSBmaWxlIGNoYW5nZWQsIDgwIGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIv
c3VuNTBpLWg2LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYu
ZHRzaQo+IGluZGV4IDhmNTE0YTIxNjlhYS4uYTY5ZjllMDlhODI5IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi5kdHNpCj4gKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kKPiBAQCAtMTc0LDYgKzE3NCw3
IEBAIGdwdTogZ3B1QDE4MDAwMDAgewo+IAkJCWNsb2NrcyA9IDwmY2N1IENMS19HUFU+LCA8JmNj
dSBDTEtfQlVTX0dQVT47Cj4gCQkJY2xvY2stbmFtZXMgPSAiY29yZSIsICJidXMiOwo+IAkJCXJl
c2V0cyA9IDwmY2N1IFJTVF9CVVNfR1BVPjsKPiArCQkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwm
Z3B1X29wcF90YWJsZT47Cj4gCQkJI2Nvb2xpbmctY2VsbHMgPSA8Mj47Cj4gCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsKPiAJCX07Cj4gQEAgLTEwMzYsNCArMTAzNyw4MyBAQCBtYXAwIHsKPiAJCQl9
Owo+IAkJfTsKPiAJfTsKPiArCj4gKwlncHVfb3BwX3RhYmxlOiBncHUtb3BwLXRhYmxlIHsKPiAr
CQljb21wYXRpYmxlID0gIm9wZXJhdGluZy1wb2ludHMtdjIiOwo+ICsKPiArCQlvcHBAMjE2MDAw
MDAwIHsKPiArCQkJb3BwLWh6ID0gL2JpdHMvIDY0IDwyMTYwMDAwMDA+Owo+ICsJCQlvcHAtbWlj
cm92b2x0ID0gPDgxMDAwMCA4MTAwMDAgMTIwMDAwMD47Cj4gKwkJfTsKPiArCj4gKwkJb3BwQDI2
NDAwMDAwMCB7Cj4gKwkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8MjY0MDAwMDAwPjsKPiArCQkJb3Bw
LW1pY3Jvdm9sdCA9IDw4MTAwMDAgODEwMDAwIDEyMDAwMDA+Owo+ICsJCX07Cj4gKwo+ICsJCW9w
cEAzMTIwMDAwMDAgewo+ICsJCQlvcHAtaHogPSAvYml0cy8gNjQgPDMxMjAwMDAwMD47Cj4gKwkJ
CW9wcC1taWNyb3ZvbHQgPSA8ODEwMDAwIDgxMDAwMCAxMjAwMDAwPjsKPiArCQl9Owo+ICsKPiAr
CQlvcHBAMzM2MDAwMDAwIHsKPiArCQkJb3BwLWh6ID0gL2JpdHMvIDY0IDwzMzYwMDAwMDA+Owo+
ICsJCQlvcHAtbWljcm92b2x0ID0gPDgxMDAwMCA4MTAwMDAgMTIwMDAwMD47Cj4gKwkJfTsKPiAr
Cj4gKwkJb3BwQDM2MDAwMDAwMCB7Cj4gKwkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8MzYwMDAwMDAw
PjsKPiArCQkJb3BwLW1pY3Jvdm9sdCA9IDw4MjAwMDAgODIwMDAwIDEyMDAwMDA+Owo+ICsJCX07
Cj4gKwo+ICsJCW9wcEAzODQwMDAwMDAgewo+ICsJCQlvcHAtaHogPSAvYml0cy8gNjQgPDM4NDAw
MDAwMD47Cj4gKwkJCW9wcC1taWNyb3ZvbHQgPSA8ODMwMDAwIDgzMDAwMCAxMjAwMDAwPjsKPiAr
CQl9Owo+ICsKPiArCQlvcHBANDA4MDAwMDAwIHsKPiArCQkJb3BwLWh6ID0gL2JpdHMvIDY0IDw0
MDgwMDAwMDA+Owo+ICsJCQlvcHAtbWljcm92b2x0ID0gPDg0MDAwMCA4NDAwMDAgMTIwMDAwMD47
Cj4gKwkJfTsKPiArCj4gKwkJb3BwQDQyMDAwMDAwMCB7Cj4gKwkJCW9wcC1oeiA9IC9iaXRzLyA2
NCA8NDIwMDAwMDAwPjsKPiArCQkJb3BwLW1pY3Jvdm9sdCA9IDw4NTAwMDAgODUwMDAwIDEyMDAw
MDA+Owo+ICsJCX07Cj4gKwo+ICsJCW9wcEA0MzIwMDAwMDAgewo+ICsJCQlvcHAtaHogPSAvYml0
cy8gNjQgPDQzMjAwMDAwMD47Cj4gKwkJCW9wcC1taWNyb3ZvbHQgPSA8ODYwMDAwIDg2MDAwMCAx
MjAwMDAwPjsKPiArCQl9Owo+ICsKPiArCQlvcHBANDU2MDAwMDAwIHsKPiArCQkJb3BwLWh6ID0g
L2JpdHMvIDY0IDw0NTYwMDAwMDA+Owo+ICsJCQlvcHAtbWljcm92b2x0ID0gPDg3MDAwMCA4NzAw
MDAgMTIwMDAwMD47Cj4gKwkJfTsKPiArCj4gKwkJb3BwQDUwNDAwMDAwMCB7Cj4gKwkJCW9wcC1o
eiA9IC9iaXRzLyA2NCA8NTA0MDAwMDAwPjsKPiArCQkJb3BwLW1pY3Jvdm9sdCA9IDw4OTAwMDAg
ODkwMDAwIDEyMDAwMDA+Owo+ICsJCX07Cj4gKwo+ICsJCW9wcEA1NDAwMDAwMDAgewo+ICsJCQlv
cHAtaHogPSAvYml0cy8gNjQgPDU0MDAwMDAwMD47Cj4gKwkJCW9wcC1taWNyb3ZvbHQgPSA8OTEw
MDAwIDkxMDAwMCAxMjAwMDAwPjsKPiArCQl9Owo+ICsKPiArCQlvcHBANTc2MDAwMDAwIHsKPiAr
CQkJb3BwLWh6ID0gL2JpdHMvIDY0IDw1NzYwMDAwMDA+Owo+ICsJCQlvcHAtbWljcm92b2x0ID0g
PDkzMDAwMCA5MzAwMDAgMTIwMDAwMD47Cj4gKwkJfTsKPiArCj4gKwkJb3BwQDYyNDAwMDAwMCB7
Cj4gKwkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8NjI0MDAwMDAwPjsKPiArCQkJb3BwLW1pY3Jvdm9s
dCA9IDw5NTAwMDAgOTUwMDAwIDEyMDAwMDA+Owo+ICsJCX07Cj4gKwo+ICsJCW9wcEA3NTYwMDAw
MDAgewo+ICsJCQlvcHAtaHogPSAvYml0cy8gNjQgPDc1NjAwMDAwMD47Cj4gKwkJCW9wcC1taWNy
b3ZvbHQgPSA8MTA0MDAwMCAxMDQwMDAwIDEyMDAwMDA+Owo+ICsJCX07Cj4gKwl9Owo+IH07CgpD
bGVtZW50LAoKSSBnYXZlIHJ1biBmb3IgdjMgb24gSDYgR1MxIFRWYm94IGFuZCB3aGF0IGkgZGlz
Y292ZXJlZDogCgoxLiBJIGhhdmUgZnJlcXVlbnQgaGFyZCBoYW5ncyBpZiBEVkZTIGlzIGVuYWJs
ZWQgKGhhcmQgcmVzZXQgcmVxdWlyZWQpLAoKMi4gaGFuZ3Mgc2VlbXMgdG8gYmUgcmVsYXRlZCB0
byBvcGVyYXRpbmcgcG9pbnRzIGNoYW5naW5nIC0gYXMgbGltaXRpbmcgT1BQIHRhYmxlIHRvIGFu
eSBzaW5nbGUgZW50cnkgKHRlc3RlZCBvbiA1IGhpZ2hlc3QgT1BQICkgbWFrZXMgbXkgR1MxIHN0
YWJsZSB3b3JraW5nLAoKMy4gaGFuZyBzZWVtcyB0byBiZSBleGFjdGx5IHJlbGF0ZWQgdG8gT1BQ
IGNoYW5nZXMgYXMgaGF2aW5nIE9QUCB0YWJsZSBldmVuIHdpdGgganVzdCAyIGVudHJpZXMgYWxy
ZWFkeSBnaXZlcyBoYW5ncywKCjQuIHR1bmluZ3Mgd2l0aCA8cmVndWxhdG9yLXJhbXAtZGVsYXk+
IG1ha2VzIG5vIGRpZmZlcmVuY2UgKHRlc3RlZCB3aXRoIDAsIDI1MDAgYW5kIDI1MDAwKS4gQWxz
byBpbmNyZWFzaW5nIDxyZWd1bGF0b3ItZW5hYmxlLXJhbXAtZGVsYXk+IDIgdGltZXMgdXAgKHRv
IDY0MDAwKSBtYWtlcyBubyBjaGFuZ2UuCgpOb3cgSSBoYXZlIDIgaHlwb3RoZXNpczogCgphLiBp
c3N1ZSBpcyBTVyByZWxhdGVkOiBzb2Z0d2FyZSBvcGVyYXRpb25zIGluIERWRlMgYXJlIHNvbWVo
b3cgInVuc2FmZSIgYXQgdG91Y2hpbmcgaGFyZHdhcmUgKGlzIGl0IHBvc3NpYmxlIHdlIGhhdmUg
aS5lLiBjb25jdXJyZW5jeSBpc3N1ZSBoZXJlPyk7IAoKYi4gaXNzdWUgaXMgSFcgcmVsYXRlZDog
aS5lLiBpbiBzdGVlcC11cCBPUFAsIHRpbWUgYmV0d2VlbiBzZW5kaW5nIGNoYW5nZSBWZGQtZ3B1
IGNvbW1hbmQgdG8gSFcgZm9yIGluY3JlYXNpbmcgVmRkIGFuZCBzZW5kaW5nIGNvbW1hbmQgdG8g
SFcgZm9yIGluY3JlYXNpbmcgR1BVIGZyZXEgaXMgdG9vIHNob3J0LgoKVG8gaW52ZXN0aWdhdGUg
ZnVydGhlciBJIGRvbmUgZm9sbG93aW5nIHRlc3Q6IGxpbWl0IE9QUCB0YWJsZSB0byA0IGVudHJp
ZXMrYWxsIDQgZW50cmllcyBoYXZlIHRoZSBzYW1lIFZkZC4gCgpJZiB0aGlzIHRlc3Qgd2lsbCBw
YXNzIHRoZSB3ZSBrbm93IGlzc3VlIGlzIGJcLiAKSWYgaXQgd2lsbCBmYWlsIC0gdGhlbiBpc3N1
ZSBpcyBhXC4gCgpBbmQgb24gbXkgR1MxIHRoaXMgdGVzdCBmYWlscy4uLi5zbyBmb3IgbWUgaXNz
dWUgaXMgYVwgbGlrZWx54oCmLgoKbGV0IG1lIGtub3cgaG93IGkgY2FuIGhlbHAhCgpicgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
