Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3E8CAE7F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 20:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9207B6EA4F;
	Thu,  3 Oct 2019 18:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EE26EA4F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 18:49:11 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id m19so3261306otp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 11:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4bYXjGFVT5M4BPwSyoV9TrBf9Kkv65nfJ31r2xLDzZU=;
 b=i0aodO/sUdgd/E6B2l9zH0dBVOqVirxe9eOzOJZCq4lYBjvwpb73PN/Kl8Bp9xuyrS
 6IFT+DHHRXvIOi24sioP4rpW8xDoxlp2x/fkd6E6ik0hHB+qQDeySIxL2xKwV0C9Pfdf
 VaTF4adsXV8yEqwpnMwko/UT/zNOoHKDXPxImsCiRrDVyQgcNW/EcOytgCY8XnIjdY9m
 1vCbXBH5ujLPtvVTd+xhNwi3j44zMzL2B7eWo/EBj1DioGXLjxAE/R7tUljdXVE4nt3K
 yvsGDUQyvCXBMTuBRCobbNHYlTI/jafML4fieQaeV1VjHzYAB3Z/gCee0ItTqPG+aOZf
 SYBA==
X-Gm-Message-State: APjAAAWO0f93qUfYHlACpPQdAaO+u4APRcYySCe+oq/DS0tSjpoG47xi
 B+jkiiF2GhbvhH8fith6cSmUPm4GBY0=
X-Google-Smtp-Source: APXvYqzxaMpfojNUBi0fxv9W7MaQlfMoIVC32jqjDxKe2nFkoIf7qT8hC8f/GqKEWI+kV9Of29VwSQ==
X-Received: by 2002:a05:6830:602:: with SMTP id
 w2mr8181845oti.231.1570128551002; 
 Thu, 03 Oct 2019 11:49:11 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id j31sm1027257ota.13.2019.10.03.11.49.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2019 11:49:10 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id a1so7997331ioc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 11:49:09 -0700 (PDT)
X-Received: by 2002:a5e:d817:: with SMTP id l23mr9427708iok.142.1570128549025; 
 Thu, 03 Oct 2019 11:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191003102003.1.Ib233b3e706cf6317858384264d5b0ed35657456e@changeid>
 <CAMavQKKTdsJmVy1wz8K66qyZ_iONqStM8JXJwX=9XspVAKT28A@mail.gmail.com>
In-Reply-To: <CAMavQKKTdsJmVy1wz8K66qyZ_iONqStM8JXJwX=9XspVAKT28A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 3 Oct 2019 11:48:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UnC_b1DfN0Aq1bcw_1Oz95Kc-2hkkEULY84+bMfd4sNw@mail.gmail.com>
Message-ID: <CAD=FV=UnC_b1DfN0Aq1bcw_1Oz95Kc-2hkkEULY84+bMfd4sNw@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: Round up _before_ giving to the clock
 framework
To: Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=4bYXjGFVT5M4BPwSyoV9TrBf9Kkv65nfJ31r2xLDzZU=;
 b=EmOe+8mi8SJNDbJCkY/leXIR58hNDc6XJa30oWJMy598KhE/OlmxkDz1hWH2Y1zBSU
 FiEzgzPY69cw6bb7b8ItJYERLWC/ZHGAoieXc82zRqAIXoMlGCLZdazUqZLhMtsrfqHF
 eLszIT8IdmfVVs6uEVjwai/tpfb0EBagW5YH0=
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tomasz Figa <tfiga@chromium.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Matthias Kaehlcke <mka@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Ryan Case <ryandcase@chromium.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUaHUsIE9jdCAzLCAyMDE5IGF0IDExOjM3IEFNIFNlYW4gUGF1bCA8c2VhbkBwb29y
bHkucnVuPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDMsIDIwMTkgYXQgMToyMCBQTSBEb3VnbGFz
IEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+IEknbSBlbWJh
cmFzc2VkIHRvIHNheSB0aGF0IGV2ZW4gdGhvdWdoIEkndmUgdG91Y2hlZAo+ID4gdm9wX2NydGNf
bW9kZV9maXh1cCgpIHR3aWNlIGFuZCBJIHN3ZWFyIEkgdGVzdGVkIGl0LCB0aGVyZSdzIHN0aWxs
IGEKPiA+IHN0dXBpZCBnbGFyaW5nIGJ1ZyBpbiBpdC4gIFNwZWNpZmljYWxseSwgb24gdmV5cm9u
X21pbm5pZSAod2l0aCBhbGwKPiA+IHRoZSBsYXRlc3QgZGlzcGxheSB0aW1pbmdzKSB3ZSB3YW50
IHRvIGJlIHNldHRpbmcgb3VyIHBpeGVsIGNsb2NrIHRvCj4gPiA2Niw2NjYsNjY2LjY3IEh6IGFu
ZCB3ZSB0ZWxsIHVzZXJzcGFjZSB0aGF0J3Mgd2hhdCB3ZSBzZXQsIGJ1dCB3ZSdyZQo+ID4gYWN0
dWFsbHkgY2hvb3NpbmcgNjYsMDAwLDAwMCBIei4gIFRoaXMgaXMgY29uZmlybWVkIGJ5IGxvb2tp
bmcgYXQgdGhlCj4gPiBjbG9jayB0cmVlLgo+ID4KPiA+IFRoZSBwcm9ibGVtIGlzIHRoYXQgaW4g
ZHJtX2Rpc3BsYXlfbW9kZV9mcm9tX3ZpZGVvbW9kZSgpIHdlIGNvbnZlcnQKPiA+IGZyb20gSHog
dG8ga0h6IHdpdGg6Cj4gPgo+ID4gICBkbW9kZS0+Y2xvY2sgPSB2bS0+cGl4ZWxjbG9jayAvIDEw
MDA7Cj4gPgo+ID4gLi4uc28gd2hlbiB0aGUgZGV2aWNlIHRyZWUgc3BlY2lmaWVzIGEgY2xvY2sg
b2YgNjY2NjY2NjcgZm9yIHRoZSBwYW5lbAo+ID4gdGhlbiBEUk0gdHJhbnNsYXRlcyB0aGF0IHRv
IDY2NjY2MDAwLiAgVGhlIGNsb2NrIGZyYW1ld29yayB3aWxsIGFsd2F5cwo+ID4gcGljayBhIGNs
b2NrIHRoYXQgaXMgX2xvd2VyXyB0aGFuIHRoZSBvbmUgcmVxdWVzdGVkLCBzbyBpdCB3aWxsIHJl
ZnVzZQo+ID4gdG8gcGljayA2NjY2NjY2NyBhbmQgd2UnbGwgZW5kIHVwIGF0IDY2MDAwMDAwLgo+
ID4KPiA+IFdoaWxlIHdlIGNvdWxkIHRyeSB0byBmaXggZHJtX2Rpc3BsYXlfbW9kZV9mcm9tX3Zp
ZGVvbW9kZSgpIHRvIHJvdW5kCj4gPiB0byB0aGUgbmVhcmVzdCBrSHogYW5kIGl0IHdvdWxkIGZp
eCBvdXIgcHJvYmxlbSwKPgo+IEkgZ290IGEgYml0IGNvbmZ1c2VkIHJlYWRpbmcgdGhpcyBhbmQg
RG91ZyBzdHJhaWdodGVuZWQgbWUgb3V0IGluIGEKPiBzaWRlYmFuZCBjb252ZXJzYXRpb24uCj4K
PiBUbyBzdW1tYXJpemUsIHRoZSBkcm1fZGlzcGxheV9tb2RlX2Zyb21fdmlkZW9tb2RlKCkgY2Fs
bCByZWZlcmVuY2VkCj4gYWJvdmUgaXMgZnJvbSBwYW5lbC1zaW1wbGUsIGFuZCB0aGlzIGRvd25z
bG90dGluZyBpcyBzcGVjaWZpYyB0bwo+IHJvY2tjaGlwJ3MgY2xvY2sgZHJpdmVyLiBTbyBJJ3Zl
IGFza2VkIHRvIGNsYXJpZnkgdGhlc2UgMiBwb2ludHMgc28KPiBpdCdzIGNsZWFyIGZyb20gdGhl
IGNvbW1pdCBtZXNzYWdlIHRoYXQgdGhpcyBwYXRjaCBpcyB0aGUgYmVzdAo+IHNvbHV0aW9uLiBX
aXRoIHRoYXQgYWRkcmVzc2VkLAo+Cj4gUmV2aWV3ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxA
Y2hyb21pdW0ub3JnPgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3ISAgSG9wZWZ1bGx5IHBlb3BsZSBk
b24ndCBtaW5kIHRoZSBxdWljayBzcGluLi4uCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIw
MTkxMDAzMTE0NzI2LnYyLjEuSWIyMzNiM2U3MDZjZjYzMTc4NTgzODQyNjRkNWIwZWQzNTY1NzQ1
NmVAY2hhbmdlaWQKCi1Eb3VnCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
