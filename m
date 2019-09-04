Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B308A7D60
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 10:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6877789483;
	Wed,  4 Sep 2019 08:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E142389483
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 08:11:23 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id t24so15112879oij.13
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2019 01:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QBe1xYUcl4wDPPrpgdNI6/tC7+3FY0gRDDgV5gUzDa0=;
 b=Ulb+0cq04ZsO6AVjYkvHVHm79f6ZEQybgM1mmBzPMJs2GEsgKCty5EmUhtcMKXJwmY
 Tmt17uCJE4Nup8P7fZ7Em18uRxGZVEXw8zVK+uYdATOq8ssrTeNusFRS5k03zLQYRRO7
 fWqxw+4s78a+a4MNlvisJWOeQXZ+w+m5Lg8wPY/+nTK3ExyqlA16aGzQ3jhzzj73L7kG
 hz0D5vs9OLe00Zvgz03+krI8kV7/s9lbCPlznvoQNCpOTF4YBpMIAUR7CyV2PHVs0Kzv
 KNeZc5W4Y04s+q+gcf3sfJYGvM+5pwCR5EvNUfrdZb6BySaJivkbn7ayzhRB48Q7pyuR
 6K1Q==
X-Gm-Message-State: APjAAAVnTQ/7MjkdD/mzjIkYpNqMa74/CJc3+35mDU0aj9INIdmSOHh1
 w/IgvvYgxdXjXaoGwlMczodoQYD5FCyYuzTME0XWIg==
X-Google-Smtp-Source: APXvYqyBQTosIHingKj0P7SporWLcB6z0O7c6rA8B5z3JZ1HTYa1GUQ5sXSJq6kSN8/U1R1RtpxNjxd8GuGYoL3qNT8=
X-Received: by 2002:aca:f20a:: with SMTP id q10mr2479529oih.128.1567584683033; 
 Wed, 04 Sep 2019 01:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <c6e220fe-230c-265c-f2fc-b0948d1cb898@intel.com>
 <20190812072545.GA63191@shbuild999.sh.intel.com>
 <20190813093616.GA65475@shbuild999.sh.intel.com>
 <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
 <20190824051605.GA63850@shbuild999.sh.intel.com>
 <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
 <d114b0b6-6b64-406e-6c3f-a8b8d5502413@intel.com>
 <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
 <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
 <2e1b4d65-d477-f571-845d-fa0a670859af@suse.de>
 <20190904062716.GC5541@shbuild999.sh.intel.com>
 <72c33bf1-9184-e24a-c084-26d9c8b6f9b7@suse.de>
In-Reply-To: <72c33bf1-9184-e24a-c084-26d9c8b6f9b7@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 4 Sep 2019 10:11:11 +0200
Message-ID: <CAKMK7uGdOtyDHZMSzY8J45bX57EFKo=DWNUi+WL+GVOzoBpUhw@mail.gmail.com>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QBe1xYUcl4wDPPrpgdNI6/tC7+3FY0gRDDgV5gUzDa0=;
 b=Rueq1X24ipwfeeFmHVaKF9ycat0gHgTh38x0qR37JORw4l5B2Wx493lvyQia1pYdLI
 XNHfFSGS00l0i9/yVSMrUkxRqU9GDLooHyNNMbCUv8+BSDeEsz1XqDoJoGfWRTlCcUPr
 E+1DBRUq50i1U1CmBJ2wizt5bfZY1AGffFX8w=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Feng Tang <feng.tang@intel.com>,
 Rong Chen <rong.a.chen@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, LKP <lkp@01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCA4OjUzIEFNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToKPgo+IEhpCj4KPiBBbSAwNC4wOS4xOSB1bSAwODoyNyBzY2hy
aWViIEZlbmcgVGFuZzoKPiA+PiBUaGFuayB5b3UgZm9yIHRlc3RpbmcuIEJ1dCBkb24ndCBnZXQg
dG9vIGV4Y2l0ZWQsIGJlY2F1c2UgdGhlIHBhdGNoCj4gPj4gc2ltdWxhdGVzIGEgYnVnIHRoYXQg
d2FzIHByZXNlbnQgaW4gdGhlIG9yaWdpbmFsIG1nYWcyMDAgY29kZS4gQQo+ID4+IHNpZ25pZmlj
YW50IG51bWJlciBvZiBmcmFtZXMgYXJlIHNpbXBseSBza2lwcGVkLiBUaGF0IGlzIGFwcGFyZW50
bHkgdGhlCj4gPj4gcmVhc29uIHdoeSBpdCdzIGZhc3Rlci4KPiA+Cj4gPiBUaGFua3MgZm9yIHRo
ZSBkZXRhaWxlZCBpbmZvLCBzbyB0aGUgb3JpZ2luYWwgY29kZSBza2lwcyB0aW1lLWNvbnN1bWlu
Zwo+ID4gd29yayBpbnNpZGUgYXRvbWljIGNvbnRleHQgb24gcHVycG9zZS4gSXMgdGhlcmUgYW55
IHNwYWNlIHRvIG9wdG1pc2UgaXQ/Cj4gPiBJZiAyIHNjaGVkdWxlZCB1cGRhdGUgd29ya2VyIGFy
ZSBoYW5kbGVkIGF0IGFsbW9zdCBzYW1lIHRpbWUsIGNhbiBvbmUgYmUKPiA+IHNraXBwZWQ/Cj4K
PiBUbyBteSBrbm93bGVkZ2UsIHRoZXJlJ3Mgb25seSBvbmUgaW5zdGFuY2Ugb2YgdGhlIHdvcmtl
ci4gUmUtc2NoZWR1bGluZwo+IHRoZSB3b3JrZXIgYmVmb3JlIGEgcHJldmlvdXMgaW5zdGFuY2Ug
c3RhcnRlZCwgd2lsbCBub3QgY3JlYXRlIGEgc2Vjb25kCj4gaW5zdGFuY2UuIFRoZSB3b3JrZXIn
cyBpbnN0YW5jZSB3aWxsIGNvbXBsZXRlIGFsbCBwZW5kaW5nIHVwZGF0ZXMuIFNvIGluCj4gc29t
ZSB3YXksIHNraXBwaW5nIHdvcmtlcnMgYWxyZWFkeSBoYXBwZW5zLgoKU28gSSB0aGluayB0aGF0
IHRoZSBtb3N0IG9mdGVuIGZiY29uIHVwZGF0ZSBmcm9tIGF0b21pYyBjb250ZXh0IGlzIHRoZQpi
bGlua2luZyBjdXJzb3IuIElmIHlvdSBkaXNhYmxlIHRoYXQgb25lIHlvdSBzaG91bGQgYmUgYmFj
ayB0byB0aGUgb2xkCnBlcmZvcm1hbmNlIGxldmVsIEkgdGhpbmssIHNpbmNlIGp1c3Qgd3JpdGlu
ZyB0byBkbWVzZyBpcyBmcm9tIHByb2Nlc3MKY29udGV4dCwgc28gc2hvdWxkbid0IGNoYW5nZS4K
Cmh0dHBzOi8vdW5peC5zdGFja2V4Y2hhbmdlLmNvbS9xdWVzdGlvbnMvMzc1OS9ob3ctdG8tc3Rv
cC1jdXJzb3ItZnJvbS1ibGlua2luZwoKQnVuY2ggb2YgdHJpY2tzLCBidXQgdGJoIEkgaGF2ZW4n
dCB0ZXN0ZWQgdGhlbS4KCkluIGFueSBjYXNlLCBJIHN0aWxsIHN0cm9uZ2x5IGFkdmljZSB5b3Ug
ZG9uJ3QgcHJpbnQgYW55dGhpbmcgdG8gZG1lc2cKb3IgZmJjb24gd2hpbGUgYmVuY2htYXJraW5n
LCBiZWNhdXNlIGRtZXNnL3ByaW50ZiBhcmUgYW55dGhpbmcgYnV0CmZhc3QsIGVzcGVjaWFsbHkg
aWYgYSBncHUgZHJpdmVyIGlzIGludm9sdmVkLiBUaGVyZSdzIHNvbWUgZWZmb3J0cyB0bwptYWtl
IHRoZSBkbWVzZy9wcmludGsgc2lkZSBsZXNzIHBhaW5mdWwgKHVudGFuZ2xpbmcgdGhlIGNvbnNv
bGVfbG9jawpmcm9tIHByaW50ayksIGJ1dCBmdW5kYW1lbnRhbGx5IHByaW50aW5nIHRvIHRoZSBn
cHUgZnJvbSB0aGUga2VybmVsCnRocm91Z2ggZG1lc2cvZmJjb24gd29uJ3QgYmUgY2hlYXAuIEl0
J3MganVzdCBub3Qgc29tZXRoaW5nIHdlCm9wdGltaXplIGJleW9uZCAibWFrZSBzdXJlIGl0IHdv
cmtzIGZvciBlbWVyZ2VuY2llcyIuCi1EYW5pZWwKCj4KPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMK
Pgo+ID4KPiA+IFRoYW5rcywKPiA+IEZlbmcKPiA+Cj4gPj4KPiA+PiBCZXN0IHJlZ2FyZHMKPiA+
PiBUaG9tYXMKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo+ID4KPgo+IC0tCj4gVGhvbWFzIFppbW1lcm1hbm4KPiBHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyCj4gU1VTRSBMaW51eCBHbWJILCBNYXhmZWxkc3RyYXNzZSA1LCA5MDQw
OSBOdWVybmJlcmcsIEdlcm1hbnkKPiBHRjogRmVsaXggSW1lbmTDtnJmZmVyLCBNYXJ5IEhpZ2dp
bnMsIFNyaSBSYXNpYWgKPiBIUkIgMjEyODQgKEFHIE7DvHJuYmVyZykKPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcg
bGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCgotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUg
NTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
