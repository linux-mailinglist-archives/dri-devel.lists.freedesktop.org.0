Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F4A1B6717
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947BB6EA44;
	Thu, 23 Apr 2020 22:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF12E89D1D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 15:51:24 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id o15so3100579pgi.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 08:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=+Lpx84ybnP3CbGO9+hIlMb8pKZvpHlBUCvuaUaL2gSc=;
 b=siyn8fn9dgNTeY0PFfNmf3LQOi0S4q18gLuG/8tqxoJ2xhYIUJtylgFoSPsgXvC62U
 13PR7A6ZHoCHxk6J5LGWsHxwmqAbc9fAL3QpZTmQHXf9lND8mWx5WZsepUSTtHf9ilO7
 iYoWUINohBd88hEZk/vniNzaVSpxQQlBxTzTUaUQwdFnNk1BX0IqjmE0DXZjEPE+BFO4
 o+TOxBANszxYwZg9ETuztp4Z1kS2iy8RSSXxvZKe5QHPZYDg2RfNblXS9svfX0sneC3Q
 Ap0U76J8jIoXqnEHpcJQWa7SFgJBTPm73RPp2csNvjdfbyUffI3AeCGPC6DWelbU6sFA
 eVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+Lpx84ybnP3CbGO9+hIlMb8pKZvpHlBUCvuaUaL2gSc=;
 b=W6RVI6lfekFvfOwoIHZnVtb8F5apQ1cLjEJjmL6yexi+HXe1HFfZH6lTXMy2y+td6H
 Im+MSM8nZAMu/hBbMBlbjmRShmIdNd644SPCIkHJbdXJfxTNYMb9MJSu085HZNiDM2k/
 5v9Ryv3fnRlcqbZcnL9U6FKYSxnAoJKy53em7fFvFODclh04Yqc2cvtdcVrd4z+14we4
 6QSsS7bzLfeQjnNwV1OXQIIRH/lTkDq4VntCXI7TT0M3+6i3Q8x3G/K7TkBf7KX2IG0a
 BwOlQNkQLcrL+o3vf9mc77M0rgFpLi1TQldtbn7Pm1GAXxGzTA1TuekC4Ly0bzHjqWlT
 6sKg==
X-Gm-Message-State: AGi0PubgZHd1+hCFBBPThCU6Pm6fUcl9prPQO2mJ0VEf3kblgUSwCM4t
 s2k60tSoImdFpvZCdJx8p30=
X-Google-Smtp-Source: APiQypIz/YwOugDPJn9jgplod/vw/LcRDTS+6PH+rgJgIUALhMFb4iU4bXeGzUzz1cPDhS+gji1UoA==
X-Received: by 2002:a05:6a00:d:: with SMTP id
 h13mr4466425pfk.254.1587657084207; 
 Thu, 23 Apr 2020 08:51:24 -0700 (PDT)
Received: from localhost (176.122.158.71.16clouds.com. [176.122.158.71])
 by smtp.gmail.com with ESMTPSA id h17sm2931338pfk.13.2020.04.23.08.51.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Apr 2020 08:51:23 -0700 (PDT)
Date: Thu, 23 Apr 2020 23:51:16 +0800
From: Dejin Zheng <zhengdejin5@gmail.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2] console: console: Complete exception handling in
 newport_probe()
Message-ID: <20200423155116.GA2247@nuc8i5>
References: <CGME20200423142637eucas1p2ea543e281d96c75aa4292b49756f2146@eucas1p2.samsung.com>
 <20200423142627.1820-1-zhengdejin5@gmail.com>
 <081f8192-1708-80ff-6eef-885d72bdf5c5@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <081f8192-1708-80ff-6eef-885d72bdf5c5@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: linux-fbdev@vger.kernel.org, tsbogend@alpha.franken.de,
 FlorianSchandinat@gmx.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, ralf@linux-mips.org,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMjMsIDIwMjAgYXQgMDQ6NTU6MzVQTSArMDIwMCwgQmFydGxvbWllaiBab2xu
aWVya2lld2ljeiB3cm90ZToKPiAKPiBIaSwKPiAKPiBJIGJlbGlldmUgdGhhdCB0aGUgcGF0Y2gg
c3VtbWFyeSBsaW5lIHNob3VsZCBiZToKPiAKPiAiW1BBVENIIHYyXSBjb25zb2xlOiBuZXdwb3J0
X2NvbjogLi4uIgo+Ck9LLCB0aGFua3MhCgo+IE9uIDQvMjMvMjAgNDoyNiBQTSwgRGVqaW4gWmhl
bmcgd3JvdGU6Cj4gPiBBIGNhbGwgb2YgdGhlIGZ1bmN0aW9uIMKhwrBkb190YWtlX292ZXJfY29u
c29sZcKhwrEgY2FuIGZhaWwgaGVyZS4KPiA+IFRoZSBjb3JyZXNwb25kaW5nIHN5c3RlbSByZXNv
dXJjZXMgd2VyZSBub3QgcmVsZWFzZWQgdGhlbi4KPiA+IFRodXMgYWRkIGEgY2FsbCBvZiB0aGUg
ZnVuY3Rpb24gwqHCsGlvdW5tYXDCocKxIHRvZ2V0aGVyIHdpdGggdGhlIGNoZWNrCj4gPiBvZiBh
IGZhaWx1cmUgcHJlZGljYXRlLgo+ID4gCj4gPiBGaXhlczogZTg0ZGUwYzYxOTA1MDMgKCJNSVBT
OiBHSU8gYnVzIHN1cHBvcnQgZm9yIFNHSSBJUDIyLzI4IikKPgo+IEkgY2Fubm90IHNlZSBob3cg
dGhpcyBwYXRjaCBmaXhlcyBjb21taXQgZTg0ZGUwYzYxOTA1MDMKPiAoQUZBSUNTIG5wcmVncyBo
YXMgYWxzbyBiZWVuIGxlYWtlZCBvbiBlcnJvciBiZWZvcmUpPwo+CnllcywgeW91IGFyZSByaWdo
dCwgdGhlIGNvbW1pdCBzaG91bGQgYmUgZTg2YmI4YWNjMGZkY2E4MmQyCigiW1BBVENIXSBWVCBi
aW5kaW5nOiBNYWtlIG5ld3BvcnRfY29uIHN1cHBvcnQgYmluZGluZyIpCgotIG1vdmUgcmVnaXN0
ZXIgaW9yZW1hcCBmcm9tIG5ld3BvcnRfc3RhcnR1cCgpIHRvIG5ld3BvcnRfY29uc29sZV9pbml0
KCkKCj4gPiBDQzogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgo+
ID4gU2lnbmVkLW9mZi1ieTogRGVqaW4gWmhlbmcgPHpoZW5nZGVqaW41QGdtYWlsLmNvbT4KPiA+
IC0tLQo+ID4gdjEgLT4gdjI6Cj4gPiAJLSBtb2RpZnkgdGhlIGNvbW1pdCBjb21tZW50cyBieSBN
YXJrdXMnc3VnZ2VzdGlvbi4KPiA+IAo+ID4gIGRyaXZlcnMvdmlkZW8vY29uc29sZS9uZXdwb3J0
X2Nvbi5jIHwgMyArKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvbmV3cG9ydF9jb24uYyBiL2Ry
aXZlcnMvdmlkZW8vY29uc29sZS9uZXdwb3J0X2Nvbi5jCj4gPiBpbmRleCAwMGRkZGY2ZTA4YjAu
LjZiZmM4ZTNmZmQ0YSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmlkZW8vY29uc29sZS9uZXdw
b3J0X2Nvbi5jCj4gPiArKysgYi9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvbmV3cG9ydF9jb24uYwo+
ID4gQEAgLTcyMCw2ICs3MjAsOSBAQCBzdGF0aWMgaW50IG5ld3BvcnRfcHJvYmUoc3RydWN0IGdp
b19kZXZpY2UgKmRldiwKPiA+ICAJY29uc29sZV9sb2NrKCk7Cj4gPiAgCWVyciA9IGRvX3Rha2Vf
b3Zlcl9jb25zb2xlKCZuZXdwb3J0X2NvbiwgMCwgTUFYX05SX0NPTlNPTEVTIC0gMSwgMSk7Cj4g
PiAgCWNvbnNvbGVfdW5sb2NrKCk7Cj4gPiArCj4gPiArCWlmIChlcnIpCj4gPiArCQlpb3VubWFw
KCh2b2lkICopbnByZWdzKTsKPiAKPiBMb29rcyBPSyBidXQgd2hpbGUgeW91IGFyZSBhdCBpdCwg
Y291bGQgeW91IHBsZWFzZSBhbHNvIGFkZCBtaXNzaW5nCj4gcmVsZWFzZV9tZW1fcmVnaW9uKCkg
b24gZXJyb3IgYW5kIG9uIGRldmljZSByZW1vdmFsOgo+Ck9rLCBUaGFua3MsIEkgd2lsbCBzZW5k
IHRoZSBwYXRjaCB2MyBmb3IgaXQuCgo+IAluZXdwb3J0X2FkZHIgPSBkZXYtPnJlc291cmNlLnN0
YXJ0ICsgMHhGMDAwMDsKPiAJaWYgKCFyZXF1ZXN0X21lbV9yZWdpb24obmV3cG9ydF9hZGRyLCAw
eDEwMDAwLCAiTmV3cG9ydCIpKQo+IAkJcmV0dXJuIC1FTk9ERVY7Cj4gCj4gCW5wcmVncyA9IChz
dHJ1Y3QgbmV3cG9ydF9yZWdzICopLyogaW9yZW1hcCBjYW5ub3QgZmFpbCAqLwo+IAkJaW9yZW1h
cChuZXdwb3J0X2FkZHIsIHNpemVvZihzdHJ1Y3QgbmV3cG9ydF9yZWdzKSk7Cj4gCWNvbnNvbGVf
bG9jaygpOwo+IAllcnIgPSBkb190YWtlX292ZXJfY29uc29sZSgmbmV3cG9ydF9jb24sIDAsIE1B
WF9OUl9DT05TT0xFUyAtIDEsIDEpOwo+IAljb25zb2xlX3VubG9jaygpOwo+IAlyZXR1cm4gZXJy
Owo+IH0KPiAKPiBzdGF0aWMgdm9pZCBuZXdwb3J0X3JlbW92ZShzdHJ1Y3QgZ2lvX2RldmljZSAq
ZGV2KQo+IHsKPiAJZ2l2ZV91cF9jb25zb2xlKCZuZXdwb3J0X2Nvbik7Cj4gCWlvdW5tYXAoKHZv
aWQgKilucHJlZ3MpOwo+IH0KPiAKPiA/Cj4gCj4gPiAgCXJldHVybiBlcnI7Cj4gPiAgfQo+ID4g
IAo+IAo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oKPiBT
YW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kCj4gU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
