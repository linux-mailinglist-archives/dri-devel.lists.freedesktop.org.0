Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EACFA7F16
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 11:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC28899B0;
	Wed,  4 Sep 2019 09:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6488933E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 09:17:37 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id 21so12446936otj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2019 02:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I+40/DNJALKIe+OMVW8OgiHh+XHMcISNZJPOwiVqxnU=;
 b=PKuLSX1f+VXEMzU0DWZca/bqrHFkooKsID1aAdNawwf79DpZEVEGIMI/MpFxcnvAiI
 ygawXJzjCf3PefN4I+UjadJonTeYoPc/7AdbX7meZjvfJusnbqlHe7Y3tnBQS00VcoaH
 NsNLAmWueZY8PuhQ6R3NGa4FKmaW7yGEf+TbYudI+d0zgRtRh358YQx9G0I0rOWLh6H1
 hK7JPsgLBDTsH9nlFBDiUzgDPPLWOxHQb4pdOQ53WoNiyH4+jW3ux7Qd7dPWY8iCMuzn
 CcX4ONkktluA7+lX1D2ow0D7ORv4QFKHjw4DclODUaGhRQ1NCHYgICxhEHXZOrcwBI/Q
 OJzA==
X-Gm-Message-State: APjAAAWGk1RROXS/lSJo9N4y6SerIzDfPbj/oCEJGIf5NbpAA3sFOXsF
 tT7TBZph3Pr7TiF6aNFjCdoosC1XHDrztRBFbY/3hg==
X-Google-Smtp-Source: APXvYqypz16YSXjW5oJ6bb2cXAUGXtifVRimiEm9apJ8tKa6ha99Mr+osX57GrV2Fd54XeC3XqZMn8kT4Nvrd+lcVA0=
X-Received: by 2002:a05:6830:10d8:: with SMTP id
 z24mr11682099oto.281.1567588657125; 
 Wed, 04 Sep 2019 02:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
 <20190824051605.GA63850@shbuild999.sh.intel.com>
 <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
 <d114b0b6-6b64-406e-6c3f-a8b8d5502413@intel.com>
 <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
 <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
 <2e1b4d65-d477-f571-845d-fa0a670859af@suse.de>
 <20190904062716.GC5541@shbuild999.sh.intel.com>
 <72c33bf1-9184-e24a-c084-26d9c8b6f9b7@suse.de>
 <CAKMK7uGdOtyDHZMSzY8J45bX57EFKo=DWNUi+WL+GVOzoBpUhw@mail.gmail.com>
 <20190904083558.GD5541@shbuild999.sh.intel.com>
In-Reply-To: <20190904083558.GD5541@shbuild999.sh.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 4 Sep 2019 11:17:25 +0200
Message-ID: <CAKMK7uGVKEN=pi4Erc_gtbL3ZFN-b6pm-nXSznjd_rH4H2yn4w@mail.gmail.com>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
To: Feng Tang <feng.tang@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=I+40/DNJALKIe+OMVW8OgiHh+XHMcISNZJPOwiVqxnU=;
 b=cYDDozExkHIYV0pS+OcdHOKXedZNtxAxjOpsZcONpkTyA8pgj4s1jdjMsXnH8mhLDC
 lDf2dknEmAB60L/jL10s1PKhx7qA2gKxoqKLETCab4H5uEjw4oezOXciviC4p5xwdh16
 pGqjdLTuvmSU3juIdrEi7KSXZ/oxKU4MhGRdc=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rong Chen <rong.a.chen@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, LKP <lkp@01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCAxMDozNSBBTSBGZW5nIFRhbmcgPGZlbmcudGFuZ0BpbnRl
bC5jb20+IHdyb3RlOgo+Cj4gSGkgRGFuaWVsLAo+Cj4gT24gV2VkLCBTZXAgMDQsIDIwMTkgYXQg
MTA6MTE6MTFBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIFdlZCwgU2VwIDQs
IDIwMTkgYXQgODo1MyBBTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IEhpCj4gPiA+Cj4gPiA+IEFtIDA0LjA5LjE5IHVtIDA4OjI3IHNj
aHJpZWIgRmVuZyBUYW5nOgo+ID4gPiA+PiBUaGFuayB5b3UgZm9yIHRlc3RpbmcuIEJ1dCBkb24n
dCBnZXQgdG9vIGV4Y2l0ZWQsIGJlY2F1c2UgdGhlIHBhdGNoCj4gPiA+ID4+IHNpbXVsYXRlcyBh
IGJ1ZyB0aGF0IHdhcyBwcmVzZW50IGluIHRoZSBvcmlnaW5hbCBtZ2FnMjAwIGNvZGUuIEEKPiA+
ID4gPj4gc2lnbmlmaWNhbnQgbnVtYmVyIG9mIGZyYW1lcyBhcmUgc2ltcGx5IHNraXBwZWQuIFRo
YXQgaXMgYXBwYXJlbnRseSB0aGUKPiA+ID4gPj4gcmVhc29uIHdoeSBpdCdzIGZhc3Rlci4KPiA+
ID4gPgo+ID4gPiA+IFRoYW5rcyBmb3IgdGhlIGRldGFpbGVkIGluZm8sIHNvIHRoZSBvcmlnaW5h
bCBjb2RlIHNraXBzIHRpbWUtY29uc3VtaW5nCj4gPiA+ID4gd29yayBpbnNpZGUgYXRvbWljIGNv
bnRleHQgb24gcHVycG9zZS4gSXMgdGhlcmUgYW55IHNwYWNlIHRvIG9wdG1pc2UgaXQ/Cj4gPiA+
ID4gSWYgMiBzY2hlZHVsZWQgdXBkYXRlIHdvcmtlciBhcmUgaGFuZGxlZCBhdCBhbG1vc3Qgc2Ft
ZSB0aW1lLCBjYW4gb25lIGJlCj4gPiA+ID4gc2tpcHBlZD8KPiA+ID4KPiA+ID4gVG8gbXkga25v
d2xlZGdlLCB0aGVyZSdzIG9ubHkgb25lIGluc3RhbmNlIG9mIHRoZSB3b3JrZXIuIFJlLXNjaGVk
dWxpbmcKPiA+ID4gdGhlIHdvcmtlciBiZWZvcmUgYSBwcmV2aW91cyBpbnN0YW5jZSBzdGFydGVk
LCB3aWxsIG5vdCBjcmVhdGUgYSBzZWNvbmQKPiA+ID4gaW5zdGFuY2UuIFRoZSB3b3JrZXIncyBp
bnN0YW5jZSB3aWxsIGNvbXBsZXRlIGFsbCBwZW5kaW5nIHVwZGF0ZXMuIFNvIGluCj4gPiA+IHNv
bWUgd2F5LCBza2lwcGluZyB3b3JrZXJzIGFscmVhZHkgaGFwcGVucy4KPiA+Cj4gPiBTbyBJIHRo
aW5rIHRoYXQgdGhlIG1vc3Qgb2Z0ZW4gZmJjb24gdXBkYXRlIGZyb20gYXRvbWljIGNvbnRleHQg
aXMgdGhlCj4gPiBibGlua2luZyBjdXJzb3IuIElmIHlvdSBkaXNhYmxlIHRoYXQgb25lIHlvdSBz
aG91bGQgYmUgYmFjayB0byB0aGUgb2xkCj4gPiBwZXJmb3JtYW5jZSBsZXZlbCBJIHRoaW5rLCBz
aW5jZSBqdXN0IHdyaXRpbmcgdG8gZG1lc2cgaXMgZnJvbSBwcm9jZXNzCj4gPiBjb250ZXh0LCBz
byBzaG91bGRuJ3QgY2hhbmdlLgo+Cj4gSG1tLCB0aGVuIGZvciB0aGUgb2xkIGRyaXZlciwgaXQg
c2hvdWxkIGFsc28gZG8gdGhlIG1vc3QgdXBkYXRlIGluCj4gbm9uLWF0b21pYyBjb250ZXh0Pwo+
Cj4gT25lIG90aGVyIHRoaW5nIGlzLCBJIHByb2ZpbGVkIHRoYXQgdXBkYXRpbmcgYSAzTUIgc2hh
ZG93IGJ1ZmZlciBuZWVkcwo+IDIwIG1zLCB3aGljaCB0cmFuc2ZlciB0byAxNTAgTUIvcyBiYW5k
d2lkdGguIENvdWxkIGl0IGJlIHJlbGF0ZWQgd2l0aAo+IHRoZSBjYWNoZSBzZXR0aW5nIG9mIERS
TSBzaGFkb3cgYnVmZmVyPyBzYXkgdGhlIG9yZ2luYWwgY29kZSB1c2UgYQo+IGNhY2hhYmxlIGJ1
ZmZlcj8KCkhtLCB0aGF0IHdvdWxkIGluZGljYXRlIHRoZSB3cml0ZS1jb21iaW5pbmcgZ290IGJy
b2tlbiBzb21ld2hlcmUuIFRoaXMKc2hvdWxkIGRlZmluaXRlbHkgYmUgZmFzdGVyLiBBbHNvIHdl
IHNob3VsZG4ndCB0cmFuc2ZlciB0aGUgaG9sZQp0aGluZywgZXhjZXB0IHdoZW4gc2Nyb2xsaW5n
IC4uLgoKCj4gPiBodHRwczovL3VuaXguc3RhY2tleGNoYW5nZS5jb20vcXVlc3Rpb25zLzM3NTkv
aG93LXRvLXN0b3AtY3Vyc29yLWZyb20tYmxpbmtpbmcKPiA+Cj4gPiBCdW5jaCBvZiB0cmlja3Ms
IGJ1dCB0YmggSSBoYXZlbid0IHRlc3RlZCB0aGVtLgo+Cj4gVGhvbWFzIGhhcyBzdWdnZXN0ZWQg
dG8gZGlzYWJsZSBjdXJzb24gYnkKPiAgICAgICAgIGVjaG8gMCA+IC9zeXMvZGV2aWNlcy92aXJ0
dWFsL2dyYXBoaWNzL2ZiY29uL2N1cnNvcl9ibGluawo+Cj4gV2UgdHJpZWQgdGhhdCB3YXksIGFu
ZCBubyBjaGFuZ2UgZm9yIHRoZSBwZXJmb3JtYW5jZSBkYXRhLgoKSHVoLCBpZiB0aGVyZSdzIG90
aGVyIGF0b21pYyBjb250ZXh0cyBmb3IgZmJjb24gdXBkYXRlIHRoZW4gSSdtIG5vdAphd2FyZSAu
Li4gYW5kIGlmIGl0J3MgYWxsIHRoZSB1cGRhdGVzLCB0aGVuIHlvdSB3b3VsZG4ndCBzZWUgYSBo
b2xlCmxvdCBvbiB5b3VyIHNjcmVlbiwgbmVpdGhlciB3aXRoIHRoZSBvbGQgb3IgbmV3IGZiZGV2
IHN1cHBvcnQgaW4KbWdhZzIwMC4gSSdtIGEgYml0IGNvbmZ1c2VkIC4uLgotRGFuaWVsCgo+Cj4g
VGhhbmtzLAo+IEZlbmcKPgo+ID4KPiA+IEluIGFueSBjYXNlLCBJIHN0aWxsIHN0cm9uZ2x5IGFk
dmljZSB5b3UgZG9uJ3QgcHJpbnQgYW55dGhpbmcgdG8gZG1lc2cKPiA+IG9yIGZiY29uIHdoaWxl
IGJlbmNobWFya2luZywgYmVjYXVzZSBkbWVzZy9wcmludGYgYXJlIGFueXRoaW5nIGJ1dAo+ID4g
ZmFzdCwgZXNwZWNpYWxseSBpZiBhIGdwdSBkcml2ZXIgaXMgaW52b2x2ZWQuIFRoZXJlJ3Mgc29t
ZSBlZmZvcnRzIHRvCj4gPiBtYWtlIHRoZSBkbWVzZy9wcmludGsgc2lkZSBsZXNzIHBhaW5mdWwg
KHVudGFuZ2xpbmcgdGhlIGNvbnNvbGVfbG9jawo+ID4gZnJvbSBwcmludGspLCBidXQgZnVuZGFt
ZW50YWxseSBwcmludGluZyB0byB0aGUgZ3B1IGZyb20gdGhlIGtlcm5lbAo+ID4gdGhyb3VnaCBk
bWVzZy9mYmNvbiB3b24ndCBiZSBjaGVhcC4gSXQncyBqdXN0IG5vdCBzb21ldGhpbmcgd2UKPiA+
IG9wdGltaXplIGJleW9uZCAibWFrZSBzdXJlIGl0IHdvcmtzIGZvciBlbWVyZ2VuY2llcyIuCj4g
PiAtRGFuaWVsCj4gPgo+ID4gPgo+ID4gPiBCZXN0IHJlZ2FyZHMKPiA+ID4gVGhvbWFzCj4gPiA+
Cj4gPiA+ID4KPiA+ID4gPiBUaGFua3MsCj4gPiA+ID4gRmVuZwo+ID4gPiA+Cj4gPiA+ID4+Cj4g
PiA+ID4+IEJlc3QgcmVnYXJkcwo+ID4gPiA+PiBUaG9tYXMKPiA+ID4gPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiA+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiA+ID4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+ID4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
PiA+ID4gPgo+ID4gPgo+ID4gPiAtLQo+ID4gPiBUaG9tYXMgWmltbWVybWFubgo+ID4gPiBHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyCj4gPiA+IFNVU0UgTGludXggR21iSCwgTWF4ZmVsZHN0cmFz
c2UgNSwgOTA0MDkgTnVlcm5iZXJnLCBHZXJtYW55Cj4gPiA+IEdGOiBGZWxpeCBJbWVuZMO2cmZm
ZXIsIE1hcnkgSGlnZ2lucywgU3JpIFJhc2lhaAo+ID4gPiBIUkIgMjEyODQgKEFHIE7DvHJuYmVy
ZykKPiA+ID4KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiA+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gPiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCj4gPgo+ID4KPiA+Cj4gPiAtLQo+ID4gRGFuaWVsIFZldHRl
cgo+ID4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gPiArNDEgKDApIDc5
IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCgoKCi0tIApEYW5pZWwgVmV0dGVyClNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAt
IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
