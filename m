Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD7A1221D
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 20:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65FD89452;
	Thu,  2 May 2019 18:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E89889452
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 18:45:55 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id v10so2571568oib.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 11:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=17OVt5sF62dgswwCTgJsxP7RAt3WsAf5VJ4Ut9AHOnQ=;
 b=FVVYVVFSGMgFYxRLwXyJUa7txDsLNEiKxR/R9W2LCn0GVbgFlTCR3zwiYit6rUGJoD
 KP1D9s5Bwy8im+ZoPpGYPRrsUzAucyeOG4myGabZ0biZfZXIB9nlxLwHHaCZ4ZkFri4R
 H03PpDao1CSYJlCroELUAjGJGDMdeXMXbVFo+vw9TFsogXZyi6xPj3DLKeP5HHBFeqUM
 uTiODaFPo635KRfH9Y3UwKt39+nCewVR6zkQtcKBfatFCdJJcnxymfnnka73IjYgk4NW
 4HJIVvgK8WpzfV0ampSJaZRgRTjrbescj8G41zfdtNKpybSzpJi6F2jLkuKqnQUgfOD+
 oNIg==
X-Gm-Message-State: APjAAAVrm7fA3riGVs3t25t6FPUKEdqsTK6/EGzPGT1ahxiu0JUTejQr
 wGavRQakKOv2+xUGqUWXK1VkYseCVxtbvdcfhoXWGA==
X-Google-Smtp-Source: APXvYqzC6lEhFzCwba9WNGtoNJlN2/sxNxsRqKIHnQJUgSQQ4oc4XCI9kW3OGRwazcEXau+lGinuQZlka+T3d8xNOxI=
X-Received: by 2002:aca:4586:: with SMTP id s128mr3264542oia.148.1556822754511; 
 Thu, 02 May 2019 11:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-17-brendanhiggins@google.com>
 <20190502110347.GE12416@kroah.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770A3A0@USCULXMSG01.am.sony.com>
In-Reply-To: <ECADFF3FD767C149AD96A924E7EA6EAF9770A3A0@USCULXMSG01.am.sony.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 2 May 2019 11:45:43 -0700
Message-ID: <CAFd5g471Wawu6g14p0AO3aY8VPBKLA0mjHSdfR1qStFGzp3iGQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/17] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
To: "Bird, Timothy" <Tim.Bird@sony.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=17OVt5sF62dgswwCTgJsxP7RAt3WsAf5VJ4Ut9AHOnQ=;
 b=P9mmkEctGFviK6NgZSHwMcUWXoaX/YoeIAK9bJMcE3Lx9wj9ioBeHG7azUaTRvfMEz
 TY2RHOx0ThWPnz2RyK/JeVea8tpHo/vQkabwSgIPQaucOPCDrRgdtpJvHIeyfXSXZIdh
 EEpMDUWFYZWhjIh9jDc8FJvMTlSL8vQ8VfgY4koM+if0RzgjLUM+G7N96Iar9oJO2RWW
 y2bZo1FvLirTsbvZcF5UvfSKsfdjWdxyGHNZOdT8DOFyQvGPVysWQaUTlUo3hkMnOD0e
 RSC2W/FJE39vCVMCViynhllAgBlnR6+D6q04cTiRfgx2IG0+4k0zkzJ9Spq984jh3G9l
 lWjw==
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
Cc: Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Iurii Zaikin <yzaikin@google.com>, Kevin Hilman <khilman@baylibre.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCAxMToxNSBBTSA8VGltLkJpcmRAc29ueS5jb20+IHdyb3Rl
Ogo+Cj4KPgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IEdyZWcgS0gK
PiA+Cj4gPiBPbiBXZWQsIE1heSAwMSwgMjAxOSBhdCAwNDowMToyNVBNIC0wNzAwLCBCcmVuZGFu
IEhpZ2dpbnMgd3JvdGU6Cj4gPiA+IEZyb206IEl1cmlpIFphaWtpbiA8eXphaWtpbkBnb29nbGUu
Y29tPgo+ID4gPgo+ID4gPiBLVW5pdCB0ZXN0cyBmb3IgaW5pdGlhbGl6ZWQgZGF0YSBiZWhhdmlv
ciBvZiBwcm9jX2RvaW50dmVjIHRoYXQgaXMKPiA+ID4gZXhwbGljaXRseSBjaGVja2VkIGluIHRo
ZSBjb2RlLiBJbmNsdWRlcyBiYXNpYyBwYXJzaW5nIHRlc3RzIGluY2x1ZGluZwo+ID4gPiBpbnQg
bWluL21heCBvdmVyZmxvdy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSXVyaWkgWmFpa2lu
IDx5emFpa2luQGdvb2dsZS5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lu
cyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBrZXJuZWwvTWFr
ZWZpbGUgICAgICB8ICAgMiArCj4gPiA+ICBrZXJuZWwvc3lzY3RsLXRlc3QuYyB8IDI5Mgo+ID4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgbGliL0tj
b25maWcuZGVidWcgICAgfCAgIDYgKwo+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAzMDAgaW5zZXJ0
aW9ucygrKQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGtlcm5lbC9zeXNjdGwtdGVzdC5jCj4g
PiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9rZXJuZWwvTWFrZWZpbGUgYi9rZXJuZWwvTWFrZWZpbGUK
PiA+ID4gaW5kZXggNmM1N2U3ODgxN2RhZC4uYzgxYTg5NzZiNmE0YiAxMDA2NDQKPiA+ID4gLS0t
IGEva2VybmVsL01ha2VmaWxlCj4gPiA+ICsrKyBiL2tlcm5lbC9NYWtlZmlsZQo+ID4gPiBAQCAt
MTEyLDYgKzExMiw4IEBAIG9iai0kKENPTkZJR19IQVNfSU9NRU0pICs9IGlvbWVtLm8KPiA+ID4g
IG9iai0kKENPTkZJR19aT05FX0RFVklDRSkgKz0gbWVtcmVtYXAubwo+ID4gPiAgb2JqLSQoQ09O
RklHX1JTRVEpICs9IHJzZXEubwo+ID4gPgo+ID4gPiArb2JqLSQoQ09ORklHX1NZU0NUTF9LVU5J
VF9URVNUKSArPSBzeXNjdGwtdGVzdC5vCj4gPgo+ID4gWW91IGFyZSBnb2luZyB0byBoYXZlIHRv
IGhhdmUgYSAic3RhbmRhcmQiIG5hbWluZyBzY2hlbWUgZm9yIHRlc3QKPiA+IG1vZHVsZXMsIGFy
ZSB5b3UgZ29pbmcgdG8gcmVjb21tZW5kICJmb28tdGVzdCIgb3ZlciAidGVzdC1mb28iPyAgSWYg
c28sCj4gPiB0aGF0J3MgZmluZSwgd2Ugc2hvdWxkIGp1c3QgYmUgY29uc2lzdGFudCBhbmQgZG9j
dW1lbnQgaXQgc29tZXdoZXJlLgo+ID4KPiA+IFBlcnNvbmFsbHksIEknZCBwcmVmZXIgInRlc3Qt
Zm9vIiwgYnV0IHRoYXQncyBqdXN0IG1lLCBuYW1pbmcgaXMgaGFyZC4uLgo+Cj4gTXkgcHJlZmVy
ZW5jZSB3b3VsZCBiZSAidGVzdC1mb28iIGFzIHdlbGwuICBKdXN0IG15IDIgY2VudHMuCgpJIGRl
ZmluaXRlbHkgYWdyZWUgd2Ugc2hvdWxkIGJlIGNvbnNpc3RlbnQuIE15IHBlcnNvbmFsIGJpYXMK
KHVuc3VycHJpc2luZ2x5KSBpcyAiZm9vLXRlc3QsIiBidXQgdGhpcyBpcyBqdXN0IGJlY2F1c2Ug
dGhhdCBpcyB0aGUKY29udmVudGlvbiBJIGFtIHVzZWQgdG8gaW4gb3RoZXIgcHJvamVjdHMgSSBo
YXZlIHdvcmtlZCBvbi4KCk9uIGFuIHVuYmlhc2VkIG5vdGUsIHdlIGFyZSBjdXJyZW50bHkgYWxt
b3N0IGV2ZW5seSBzcGxpdCBiZXR3ZWVuIHRoZQp0d28gY29udmVudGlvbnMgd2l0aCAqc2xpZ2h0
KiBwcmVmZXJlbmNlIGZvciAiZm9vLXRlc3QiOiBJIHJhbiB0aGUgdHdvCmZvbGxvd2luZyBncmVw
IGNvbW1hbmRzIG9uIHY1LjEtcmM3OgoKZ3JlcCAtSHJuIC0tZXhjbHVkZS1kaXI9ImJ1aWxkIiAt
ZSAiY29uZmlnIFthLXpBLVpfMC05XVwrX1RFU1QkIiB8IHdjIC1sCmdyZXAgLUhybiAtLWV4Y2x1
ZGUtZGlyPSJidWlsZCIgLWUgImNvbmZpZyBURVNUX1thLXpBLVpfMC05XVwrIiB8IHdjIC1sCgoi
Zm9vLXRlc3QiIGhhcyAzNiBvY2N1cnJlbmNlcy4KInRlc3QtZm9vIiBoYXMgMzMgb2NjdXJyZW5j
ZXMuCgpUaGUgdGhpbmdzIEkgYW0gbW9yZSBjb25jZXJuZWQgYWJvdXQgaXMgaG93IHRoaXMgd291
bGQgYWZmZWN0IGZpbGUKbmFtaW5nLiBJZiB3ZSBoYXZlIGEgdW5pdCB0ZXN0IGZvciBmb28uYywg
SSB0aGluayBmb29fdGVzdC5jIGlzIG1vcmUKY29uc2lzdGVudCB3aXRoIG91ciBuYW1lc3BhY2lu
ZyBjb252ZW50aW9ucy4gVGhlIG90aGVyIHRoaW5nLCBpcyBpZiB3ZQphbHJlYWR5IGhhdmUgYSBL
Y29uZmlnIHN5bWJvbCBjYWxsZWQgRk9PX1RFU1QgKG9yIFRFU1RfRk9PKSB3aGF0CnNob3VsZCB3
ZSBuYW1lIHRoZSBLVW5pdCB0ZXN0IGluIHRoaXMgY2FzZT8gRk9PX1VOSVRfVEVTVD8KRk9PX0tV
TklUX1RFU1QsIGxpa2UgSSBkaWQgYWJvdmU/CgpDaGVlcnMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
