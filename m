Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 876FE7A291
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7926E429;
	Tue, 30 Jul 2019 07:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EF289CF5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 08:43:24 +0000 (UTC)
Received: from mail-pf1-f198.google.com ([209.85.210.198])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1hs1Fa-0005lX-Rz
 for dri-devel@lists.freedesktop.org; Mon, 29 Jul 2019 08:43:23 +0000
Received: by mail-pf1-f198.google.com with SMTP id y66so38040716pfb.21
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 01:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=EFOwyamcXvbMRJsRZdetUF5Nr5KxHA4P/o3wV2Qwcn0=;
 b=M+uiLK5ooW506az9MzNc95L9lfC7NYXzSyQCamrc159swOZuA4+FsO06X4ssMS1cyS
 L7taELq5jiJzl0s6iwurc5RM9Uqq1u6ahv3JmwJN3bcQK3y+BAFK+2iGcw5J7u0jMJwi
 gXp8WQAP2hNNQGPJHkxzTCxP+281jJlL3buBuzw2iGu0KhvJJl1Osv/37BpIOkJVE+CF
 /5qY2ds1SuU3+T1nC67oNgG9cPTl4P2wcTD6lK1r6h7fnTdbAGaClHefPJwCoo9vAIo+
 YEkJTfa4ZgEFYQ83jpGK5yNcwSadVoYyVoz42g0JHzyMMfhaHQiu7o/I21J3lYgrov20
 T6kA==
X-Gm-Message-State: APjAAAU6DeHt5KvK+QZo4hEJHnFUh8vKqKs/QtbKVILX6VTmsv1WU1iA
 HWTnWTEYYW//cW9jlq/Hvs6NFC2PFQtR2Vl7ZOX7MgIA1kbqzpRTx8v0B/bqbtB1+14PWoj1on5
 Uw13EPYwDQSXfKMB/xYU3ZSkbXjm0HCp+P/4ZbPRG033qaw==
X-Received: by 2002:a17:90a:ac13:: with SMTP id
 o19mr111224665pjq.143.1564389801580; 
 Mon, 29 Jul 2019 01:43:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzYWCufT4fyx3KH6LJ/5ZfYWOLG2+g3N3DG8anI9vGHgHOFfZY0Vcw12v5zLrRE5kt9WfBQAw==
X-Received: by 2002:a17:90a:ac13:: with SMTP id
 o19mr111224640pjq.143.1564389801172; 
 Mon, 29 Jul 2019 01:43:21 -0700 (PDT)
Received: from 2001-b011-380f-37d3-55a6-6589-3f53-e6a8.dynamic-ip6.hinet.net
 (2001-b011-380f-37d3-55a6-6589-3f53-e6a8.dynamic-ip6.hinet.net.
 [2001:b011:380f:37d3:55a6:6589:3f53:e6a8])
 by smtp.gmail.com with ESMTPSA id z12sm42280079pfn.29.2019.07.29.01.43.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 01:43:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: OLED panel brightness support
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <87d0htp7pl.fsf@intel.com>
Date: Mon, 29 Jul 2019 16:43:18 +0800
Message-Id: <A9EF1920-08DF-4153-AA2E-351C7C999566@canonical.com>
References: <28D3097A-5295-4445-BD73-1A338EFA546D@canonical.com>
 <87d0htp7pl.fsf@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Tue, 30 Jul 2019 07:55:03 +0000
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
Cc: Anthony Wong <anthony.wong@canonical.com>, dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@dell.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YXQgMTY6MjYsIEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+IHdyb3Rl
OgoKPiBPbiBUdWUsIDIzIEp1bCAyMDE5LCBLYWktSGVuZyBGZW5nIDxrYWkuaGVuZy5mZW5nQGNh
bm9uaWNhbC5jb20+IHdyb3RlOgo+PiBIaSwKPj4KPj4gQ3VycmVudGx5LCBPTEVEIHBhbmVsIGJy
aWdodG5lc3MgWzFdIGlzIG5vdCBzdXBwb3J0ZWQuCj4KPiBBcyBhIGdlbmVyYWwgc3RhdGVtZW50
IHRoaXMgaXMgbm90IHRydWUsIGFuZCBub3QgYmFja2VkIHVwIGJ5IHRoZQo+IHJlZmVyZW5jZWQg
YnVnLiBXZSBqdXN0IGRvbid0IGtub3cgaG93IGJyaWdodG5lc3MgaXMgY29udHJvbGxlZCBvbiB0
aGF0Cj4gcGFydGljdWxhciBsYXB0b3AsIGJlY2F1c2UgaXQgYXBwYXJlbnRseSB1c2VzIGEgcHJv
cGVyaWV0YXJ5IG1lY2hhbmlzbS4KPgo+IElmIGl0IHVzZWQgdGhlIGJyaWdodG5lc3MgY29udHJv
bCBtZWNoYW1pc20gc3BlY2lmaWVkIGluIHRoZSBWRVNBIGVEUAo+IHNwZWMsIGl0IHNob3VsZCB3
b3JrIGp1c3QgZmluZSB3aXRoIHRoZSBpOTE1IGF1eCBiYWNrbGlnaHQgc3VwcG9ydCwgYW5kCj4g
d2Ugc2hvdWxkIGFsc28gZXhwb3J0IHRoZSByZWd1bGFyIGJhY2tsaWdodCBzeXNmcyBmb3IgdGhp
cy4KCkkgYW0gdG9sZCB0aGF0IFdpbmRvd3MgaW50cm9kdWNlZCDigJxOaXRzQnJpZ2h0bmVzc+KA
nSBbMV0gdG8gc3VwcG9ydCBPTEVEIHBhbmVsLgpJIGRvbuKAmXQga25vdyBob3cgaXTigJlzIHBs
dW1iZWQgdG8gdGhlIGF1eCBpbnRlcmZhY2UgdGhvdWdoLgoKSXMgaXQgcG9zc2libGUgdG8gYXNr
IFdpbmRvd3MgZ3JhcGhpY3MgdGVhbSBob3cgV2luZG93cyBoYW5kbGUgT0xFRCBwYW5lbD8KClsx
XSAgCmh0dHBzOi8vZG9jcy5taWNyb3NvZnQuY29tL2VuLXVzL3dpbmRvd3MtaGFyZHdhcmUvZHJp
dmVycy9kZGkvY29udGVudC9kM2RrbWR0L25zLWQzZGttZHQtX2R4Z2tfYnJpZ2h0bmVzc19jYXBz
CgpLYWktSGVuZwoKPgo+IEJSLAo+IEphbmkuCj4KPgo+PiBXZSBoYXZlIGEgc2ltaWxhciBEZWxs
IHN5c3RlbSB0aGF0IGFsc28gYWZmZWN0IGJ5IGxhY2sgb2YgT0xFRCBicmlnaHRuZXNzCj4+IHN1
cHBvcnQuCj4+Cj4+IEnigJl2ZSBpbnZlc3RpZ2F0ZWQgYm90aCBrZXJuZWwgYW5kIHVzZXIgc3Bh
Y2UgYnV0IEkgaGF2ZW7igJl0IGZvdW5kIGEgZ29vZAo+PiBnZW5lcmFsIHNvbHV0aW9uIHlldC4K
Pj4gRGVsbCBzeXN0ZW1zIHVzZSBFRElEIGRlc2NyaXB0b3IgNCBhcyBEZWxsIHNwZWNpZmljIGRl
c2NyaXB0b3IsIHdoaWNoCj4+IHJlcG9ydHMgaXRzIHBhbmVsIHR5cGUgYW5kIHdlIGNhbiBrbm93
IGl04oCZcyBhbiBPTEVEIHBhbmVsIG9yIG5vdC4KPj4KPj4gTXkgaW5pdGlhbCB0aG91Z2h0IGlz
IHRvIGFkZCBhIG5ldyBhdHRyaWJ1dGUg4oCcb2xlZCIgaW4gZHJtX3N5c2ZzLmMgWzJdIHRvCj4+
IGxldCB1c2Vyc3BhY2UgbGlrZSBjbHV0dGVyIFszXSB0byBjb250cm9sIHRoZSBicmlnaHRuZXNz
Lgo+PiBIb3dldmVyIG90aGVyIERFcyBtYXkgbmVlZCB0byBpbXBsZW1lbnQgdGhlaXIgb3duIE9M
RUQgYnJpZ2h0bmVzcyBzdXBwb3J0Cj4+IHdoaWNoIGlzbuKAmXQgaWRlYWwuCj4+Cj4+IFNvIEni
gJlkIGxpa2UgdG8ga25vdyBpZiB0aGVyZeKAmXMgYW55IGdvb2Qgd2F5IHRvIHN1cHBvcnQgT0xF
RCBicmlnaHRuZXNzIGluCj4+IGdvb2Qgb2xkIGJhY2tsaWdodCBzeXNmcywgdG8gbGV0IHVzZXJz
cGFjZSBrZWVwIHRvIHRoZSBjdXJyZW50IGludGVyZmFjZS4KPj4KPj4gWzFdIGh0dHBzOi8vYnVn
cy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTk3ODgzCj4+IFsyXSBodHRwczovL3Bh
c3RlYmluLnVidW50dS5jb20vcC9RWXJSQnBwVlQ5Lwo+PiBbM10KPj4gaHR0cHM6Ly9naXRsYWIu
Z25vbWUub3JnL0dOT01FL2NsdXR0ZXIvYmxvYi9tYXN0ZXIvY2x1dHRlci9jbHV0dGVyLWJyaWdo
dG5lc3MtY29udHJhc3QtZWZmZWN0LmMjTDU1OQo+Pgo+PiBLYWktSGVuZwo+Cj4gLS0gCj4gSmFu
aSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
