Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFCF10567D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 17:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD696F477;
	Thu, 21 Nov 2019 16:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801196F40A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 16:06:28 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-NaynWFZBNB-_JbEo9h7ZmQ-1; Thu, 21 Nov 2019 11:06:22 -0500
Received: by mail-qv1-f71.google.com with SMTP id w2so2595449qvz.10
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 08:06:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4u5SaUcnCKvjh6UsP+VC2r3Fd3UTQ4sI8vEm9p9IspQ=;
 b=AQqe5NRVAIb6GiauVJzK7etQJ+y8x0RHi07NVA+hWQfnG5ST8ZYv22aEdbCDDPGZ7M
 PwEtk8m32G6wynZxrt7OXxvmOz0uB32uaEyi3W5Tv/MA//yWsd3AJqsW+qeXoOPf08df
 OlvlsxoFzu8iTQWp9mUQUZ0ikyhIn/fHi6GHhJlbzdMhi7fQiWDjnxlWKFibZn/XcpL6
 VoW3zn4XXTTddqoUbQjQ1hliCWxc3vTGNfKghBi05P4mn4R2Yqw+625RWa4uC5d5ywCh
 CYEclp+A/pmrUeVQNg9Ms1R30p7csMQzNAAZoEBUr5j/pFUu2jXGT6mWVK1kTvv/usRG
 aDZw==
X-Gm-Message-State: APjAAAVwWT5lDJKi/zGP68zV5zg5G5gxdmlhYpMJhCnvGJJSUrYo3E4s
 3w0/Wxyky0bammDcu3vciIq0O+Ft3c7+H3yLmPnBqLYIDPpFwczyqYNJQemjLYYE2zA030AD7IC
 zIEXTI3nAnw/O0mXhp49Gczx9DNoj2Mlbd9QfyZq78Zdr
X-Received: by 2002:ac8:73c6:: with SMTP id v6mr9366594qtp.137.1574352381580; 
 Thu, 21 Nov 2019 08:06:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyMWsnX6Oq8sVu9TbpGunjITLNboA1N6sHCOJjdw/pIhaC+MKSuuxVJFGx9BLlu7cQMJ12GJrcBaxUzBIiQcN8=
X-Received: by 2002:ac8:73c6:: with SMTP id v6mr9366479qtp.137.1574352380570; 
 Thu, 21 Nov 2019 08:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
 <CACO55ttXJgXG32HzYP_uJDfQ6T-d8zQaGjXK_AZD3kF0Rmft4g@mail.gmail.com>
 <CAJZ5v0ibzcLEm44udUxW2uVgaF9NapdNBF8Ag+RE++u7gi2yNA@mail.gmail.com>
In-Reply-To: <CAJZ5v0ibzcLEm44udUxW2uVgaF9NapdNBF8Ag+RE++u7gi2yNA@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 21 Nov 2019 17:06:09 +0100
Message-ID: <CACO55ttBkZD9dm0Y_jT931NnzHHtDFyLz28aoo+ZG0pnLzPgbA@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: "Rafael J. Wysocki" <rafael@kernel.org>
X-MC-Unique: NaynWFZBNB-_JbEo9h7ZmQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574352387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bUmJw5NVvVVplfFLTrj0DWj0K1ssd2HaG6I0BvVfDc=;
 b=b7dpbj18d503h3M+u9CUaER1Qu9/MJbdwFCYwStC13tu082gbedLwL7HiYfN5M2oJ3rLHs
 G5jYd8384kMRLQffcAHFsTt9LwHoGMoPuZdfcaotvOLHC+O5J5iNsw4HePa6IR3Q3uuoFd
 p72wISzI/WGt8m3L0vdFfJSRYZbRMaQ=
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgNDo0NyBQTSBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVs
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTo1MyBQTSBL
YXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBO
b3YgMjEsIDIwMTkgYXQgMTI6NDYgUE0gTWlrYSBXZXN0ZXJiZXJnCj4gPiA8bWlrYS53ZXN0ZXJi
ZXJnQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0
IDEyOjM0OjIyUE0gKzAxMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gPiA+IE9uIFRo
dSwgTm92IDIxLCAyMDE5IGF0IDEyOjI4IFBNIE1pa2EgV2VzdGVyYmVyZwo+ID4gPiA+IDxtaWth
Lndlc3RlcmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBXZWQs
IE5vdiAyMCwgMjAxOSBhdCAxMToyOTozM1BNICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90
ZToKPiA+ID4gPiA+ID4gPiBsYXN0IHdlZWsgb3Igc28gSSBmb3VuZCBzeXN0ZW1zIHdoZXJlIHRo
ZSBHUFUgd2FzIHVuZGVyIHRoZSAiUENJCj4gPiA+ID4gPiA+ID4gRXhwcmVzcyBSb290IFBvcnQi
IChuYW1lIGZyb20gbHNwY2kpIGFuZCBvbiB0aG9zZSBzeXN0ZW1zIGFsbCBvZiB0aGF0Cj4gPiA+
ID4gPiA+ID4gc2VlbXMgdG8gd29yay4gU28gSSBhbSB3b25kZXJpbmcgaWYgaXQncyBpbmRlZWQg
anVzdCB0aGUgMHgxOTAxIG9uZSwKPiA+ID4gPiA+ID4gPiB3aGljaCBhbHNvIGV4cGxhaW5zIE1p
a2FzIGNhc2UgdGhhdCBUaHVuZGVyYm9sdCBzdHVmZiB3b3JrcyBhcyBkZXZpY2VzCj4gPiA+ID4g
PiA+ID4gbmV2ZXIgZ2V0IHBvcHVsYXRlZCB1bmRlciB0aGlzIHBhcnRpY3VsYXIgYnJpZGdlIGNv
bnRyb2xsZXIsIGJ1dCB1bmRlcgo+ID4gPiA+ID4gPiA+IHRob3NlICJSb290IFBvcnQicwo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiBJdCBhbHdheXMgaXMgYSBQQ0llIHBvcnQsIGJ1dCBpdHMgbG9j
YXRpb24gd2l0aGluIHRoZSBTb0MgbWF5IG1hdHRlci4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBFeGFj
dGx5LiBJbnRlbCBoYXJkd2FyZSBoYXMgUENJZSBwb3J0cyBvbiBDUFUgc2lkZSAodGhlc2UgYXJl
IGNhbGxlZAo+ID4gPiA+ID4gUEVHLCBQQ0kgRXhwcmVzcyBHcmFwaGljcywgcG9ydHMpLCBhbmQg
dGhlIFBDSCBzaWRlLiBJIHRoaW5rIHRoZSBJUCBpcwo+ID4gPiA+ID4gc3RpbGwgdGhlIHNhbWUu
Cj4gPiA+ID4gPgo+ID4KPiA+IHllYWgsIEkgbWVhbnQgdGhlIGJyaWRnZSBjb250cm9sbGVyIHdp
dGggdGhlIElEIDB4MTkwMSBpcyBvbiB0aGUgQ1BVCj4gPiBzaWRlLiBBbmQgaWYgdGhlIE52aWRp
YSBHUFUgaXMgb24gYSBwb3J0IG9uIHRoZSBQQ0ggc2lkZSBpdCBhbGwgc2VlbXMKPiA+IHRvIHdv
cmsganVzdCBmaW5lLgo+Cj4gQnV0IHRoYXQgbWF5IGludm9sdmUgZGlmZmVyZW50IEFNTCB0b28s
IG1heSBpdCBub3Q/Cj4KPiA+ID4gPiA+ID4gQWxzbyBzb21lIGN1c3RvbSBBTUwtYmFzZWQgcG93
ZXIgbWFuYWdlbWVudCBpcyBpbnZvbHZlZCBhbmQgdGhhdCBtYXkKPiA+ID4gPiA+ID4gYmUgbWFr
aW5nIHNwZWNpZmljIGFzc3VtcHRpb25zIG9uIHRoZSBjb25maWd1cmF0aW9uIG9mIHRoZSBTb0Mg
YW5kIHRoZQo+ID4gPiA+ID4gPiBHUFUgYXQgdGhlIHRpbWUgb2YgaXRzIGludm9jYXRpb24gd2hp
Y2ggdW5mb3J0dW5hdGVseSBhcmUgbm90IGtub3duIHRvCj4gPiA+ID4gPiA+IHVzLgo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiBIb3dldmVyLCBpdCBsb29rcyBsaWtlIHRoZSBBTUwgaW52b2tlZCB0
byBwb3dlciBkb3duIHRoZSBHUFUgZnJvbQo+ID4gPiA+ID4gPiBhY3BpX3BjaV9zZXRfcG93ZXJf
c3RhdGUoKSBnZXRzIGNvbmZ1c2VkIGlmIGl0IGlzIG5vdCBpbiBQQ0kgRDAgYXQKPiA+ID4gPiA+
ID4gdGhhdCBwb2ludCwgc28gaXQgbG9va3MgbGlrZSB0aGF0IEFNTCB0cmllcyB0byBhY2Nlc3Mg
ZGV2aWNlIG1lbW9yeSBvbgo+ID4gPiA+ID4gPiB0aGUgR1BVIChiZXlvbmQgdGhlIFBDSSBjb25m
aWcgc3BhY2UpIG9yIHNpbWlsYXIgd2hpY2ggaXMgbm90Cj4gPiA+ID4gPiA+IGFjY2Vzc2libGUg
aW4gUENJIHBvd2VyIHN0YXRlcyBiZWxvdyBEMC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBPciB0aGUg
UENJIGNvbmZpZyBzcGFjZSBvZiB0aGUgR1BVIHdoZW4gdGhlIHBhcmVudCByb290IHBvcnQgaXMg
aW4gRDNob3QKPiA+ID4gPiA+IChhcyBpdCBpcyB0aGUgY2FzZSBoZXJlKS4gQWxzbyB0aGVuIHRo
ZSBHUFUgY29uZmlnIHNwYWNlIGlzIG5vdAo+ID4gPiA+ID4gYWNjZXNzaWJsZS4KPiA+ID4gPgo+
ID4gPiA+IFdoeSB3b3VsZCB0aGUgcGFyZW50IHBvcnQgYmUgaW4gRDNob3QgYXQgdGhhdCBwb2lu
dD8gIFdvdWxkbid0IHRoYXQgYmUKPiA+ID4gPiBhIHN1c3BlbmQgb3JkZXJpbmcgdmlvbGF0aW9u
Pwo+ID4gPgo+ID4gPiBOby4gV2UgcHV0IHRoZSBHUFUgaW50byBEM2hvdCBmaXJzdCwgdGhlbiB0
aGUgcm9vdCBwb3J0IGFuZCB0aGVuIHR1cm4KPiA+ID4gb2ZmIHRoZSBwb3dlciByZXNvdXJjZSAo
d2hpY2ggaXMgYXR0YWNoZWQgdG8gdGhlIHJvb3QgcG9ydCkgcmVzdWx0aW5nCj4gPiA+IHRoZSB0
b3BvbG9neSBlbnRlcmluZyBEM2NvbGQuCj4gPiA+Cj4gPgo+ID4gSWYgdGhlIGtlcm5lbCBkb2Vz
IGEgRDAgLT4gRDNob3QgLT4gRDAgY3ljbGUgdGhpcyB3b3JrcyBhcyB3ZWxsLCBidXQKPiA+IHRo
ZSBwb3dlciBzYXZpbmdzIGFyZSB3YXkgbG93ZXIsIHNvIEkga2luZCBvZiBwcmVmZXIgc2tpcHBp
bmcgRDNob3QKPiA+IGluc3RlYWQgb2YgRDNjb2xkLiBTa2lwcGluZyBEM2hvdCBkb2Vzbid0IHNl
ZW0gdG8gbWFrZSBhbnkgZGlmZmVyZW5jZQo+ID4gaW4gcG93ZXIgc2F2aW5ncyBpbiBteSB0ZXN0
aW5nLgo+Cj4gT0sKPgo+IFdoYXQgZXhhY3RseSBkaWQgeW91IGRvIHRvIHNraXAgRDNjb2xkIGlu
IHlvdXIgdGVzdGluZz8KPgoKRm9yIHRoYXQgSSBwb2tlZCBpbnRvIHRoZSBQQ0kgcmVnaXN0ZXJz
IGRpcmVjdGx5IGFuZCBza2lwcGVkIGRvaW5nIHRoZQpBQ1BJIGNhbGxzIGFuZCBzaW1wbHkgY2hl
Y2tlZCBmb3IgdGhlIGlkbGUgcG93ZXIgY29uc3VtcHRpb24gb24gbXkKbGFwdG9wLiBCdXQgSSBn
dWVzcyBJIHNob3VsZCByZXRlc3Qgd2l0aCBjYWxsaW5nIHBjaV9kM2NvbGRfZGlzYWJsZQpmcm9t
IG5vdXZlYXUgaW5zdGVhZD8gT3IgaXMgdGhlcmUgYSBkaWZmZXJlbnQgcHJlZmVyYWJsZSB3YXkg
b2YKdGVzdGluZyB0aGlzPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
