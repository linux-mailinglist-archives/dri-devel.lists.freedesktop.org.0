Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE7284287
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 00:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BA56E1B6;
	Mon,  5 Oct 2020 22:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F183C6E0EE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 22:31:21 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id f37so6784154otf.12
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 15:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aGJPhjJnGizWZ9cjlMtyvbh4s8GPun/neUKltdZk0Y0=;
 b=E3BNLEwO4blu18AA9bBYPMj6KdaoOIvVuhzzTlO9SdwVRmMA2I1sF+4TC6R5gMuF/t
 70UA+qS/l9JVHRzuN/wPuWxJDfn8ax9yN4TA4/WDU/sxhXEIIfAvbsb9CcVOnvYEU0T2
 kHU/ZnYKgFMx6M0TDPusm2djOUMgcutEgfWz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aGJPhjJnGizWZ9cjlMtyvbh4s8GPun/neUKltdZk0Y0=;
 b=qMo7gABOrf8tC2mKXbcKqHiT4r49Ouo65CtVcaP9NeCO+vpKQk+LiYzoPfQgZFFEyv
 KkJjRln5N6BTP2t3T05iZJyECWxIDQXrb1ctHenPD6/Bgif39kOfAN5yeVsLYWJPbEsd
 jrC+MTGKGVcrIaYYAQFJpitGBPAUfHAeGVNWNmbT/VKoQYSEZ9c1QcKmk1TMyqr9MEYx
 WAWxyOsoyd7zW2wBSjfqc8tduOcpyp0OAQuVsx9UuaT3Lb8K281A1je+5My0spdabvKy
 Rqbo9meYvlwdji/8D13yaGRJ9rRMYTnBdEAIeGrXSxQng/cmXXdETJo/o8ZEe5HFYyfy
 ueXg==
X-Gm-Message-State: AOAM533gYg1Wekd98Odmnj6H/jBmcfPE7srG2qDSDB4E3IqvV2p+ZKwG
 84Nzg3M861mkXv9PCcK8udYtk/dGfB3se0iTIQvZfA==
X-Google-Smtp-Source: ABdhPJxnWbeNqcHTXdnaARCv/Zto+89buyW7FSld30l4eYbHTDn36gLjIFSYQDd9gbmM8YZlwLxRaLcHDFyluEPHV0o=
X-Received: by 2002:a05:6830:1e56:: with SMTP id
 e22mr967660otj.303.1601937081198; 
 Mon, 05 Oct 2020 15:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200930165212.GA8833@lst.de>
 <20201004141758.1013317-1-paul@crapouillou.net>
 <20201004195921.GA556605@ravnborg.org> <ZE1PHQ.WGCBAFO9R38I3@crapouillou.net>
 <20201005230150.5637fa42@canb.auug.org.au>
 <20201005140534.GT438822@phenom.ffwll.local>
 <B3HQHQ.7DOFKW9A9TEX1@crapouillou.net>
In-Reply-To: <B3HQHQ.7DOFKW9A9TEX1@crapouillou.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 6 Oct 2020 00:31:10 +0200
Message-ID: <CAKMK7uEB7xHgnSpnT=Hd3Cw2+uwkimF=4uQuw3NOYz1DsnMY7g@mail.gmail.com>
Subject: Re: [PATCH] Revert "gpu/drm: ingenic: Add option to mmap GEM buffers
 cached"
To: Paul Cercueil <paul@crapouillou.net>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, od@zcrc.me,
 Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgNSwgMjAyMCBhdCA0OjQ3IFBNIFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91
aWxsb3UubmV0PiB3cm90ZToKPgo+IEhpLAo+Cj4gTGUgbHVuLiA1IG9jdC4gMjAyMCDDoCAxNjow
NSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiBhIMOpY3JpdCA6Cj4gPiBPbiBNb24s
IE9jdCAwNSwgMjAyMCBhdCAxMTowMTo1MFBNICsxMTAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3Rl
Ogo+ID4+ICBIaSBQYXVsLAo+ID4+Cj4gPj4gIE9uIFN1biwgMDQgT2N0IDIwMjAgMjI6MTE6MjMg
KzAyMDAgUGF1bCBDZXJjdWVpbAo+ID4+IDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4gd3JvdGU6Cj4g
Pj4gID4KPiA+PiAgPiBQdXNoZWQgdG8gZHJtLW1pc2MtbmV4dCB3aXRoIHRoZSBjaGFuZ2Vsb2cg
Zml4LCB0aGFua3MuCj4gPj4gID4KPiA+PiAgPiBTdGVwaGVuOgo+ID4+ICA+IE5vdyBpdCBzaG91
bGQgYnVpbGQgZmluZSBhZ2Fpbi4gQ291bGQgeW91IHJlbW92ZSB0aGUgQlJPS0VOIGZsYWc/Cj4g
Pj4KPiA+PiAgVGhhbmtzIGZvciBsZXR0aW5nIG1lIGtub3csIGJ1dCB0aGUgZml4IGhhcyBub3Qg
YXBwZWFyZWQgaW4gYW55IGRybQo+ID4+ICB0cmVlIGluY2x1ZGVkIGluIGxpbnV4LW5leHQgeWV0
IC4uLgo+ID4+Cj4gPj4gIElmIGl0IGRvZXNuJ3Qgc2hvdyB1cCBieSB0aGUgdGltZSBJIHdpbGwg
bWVyZ2UgdGhlIGRybSB0cmVlCj4gPj4gdG9tb3Jyb3csIEkKPiA+PiAgd2lsbCBhcHBseSB0aGlz
IHJldmVydCBwYXRjaCBteXNlbGYgKGluc3RlYWQgb2YgdGhlIHBhdGNoIG1hcmtpbmcKPiA+PiB0
aGUKPiA+PiAgZHJpdmVyIEJST0tFTikuCj4gPgo+ID4gWWVhaCBpdCBzaG91bGQgaGF2ZSBiZWVu
IHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0LWZpeGVzIHBlcgo+ID4KPiA+IGh0dHBzOi8vZHJtLnBh
Z2VzLmZyZWVkZXNrdG9wLm9yZy9tYWludGFpbmVyLXRvb2xzL2NvbW1pdHRlci1kcm0tbWlzYy5o
dG1sI3doZXJlLWRvLWktYXBwbHktbXktcGF0Y2gKPiA+Cj4gPiBQYXVsLCBjYW4geW91IHBscyBn
aXQgY2hlcnJ5LXBpY2sgLXggdGhpcyBvdmVyIHRvIGRybS1taXNjLW5leHQtZml4ZXM/Cj4KPiBJ
IGhhZCBhIGZldyBjb21taXRzIG9uIHRvcCBvZiBpdCBpbiBkcm0tbWlzYy1uZXh0LCBzbyB0aGUg
cmV2ZXJ0Cj4gZG9lc24ndCBhcHBseSBjbGVhbmx5IGluIGRybS1taXNjLW5leHQtZml4ZXMuLi4g
SSBjYW4gcmV2ZXJ0IGl0IHRoZXJlLAo+IGJ1dCB0aGVuIHdlJ2QgaGF2ZSBhIGRpZmZlcmVudCBy
ZXZlcnQgY29tbWl0IGluIGRybS1taXNjLW5leHQgYW5kCj4gZHJtLW1pc2MtbmV4dC1uZXh0Lgo+
Cj4gU29ycnkgZm9yIHRoZSBtZXNzLiBXaGF0IHNob3VsZCBJIGRvPwoKSG0gbm90IHN1cmUgd2h5
LCBidXQgdGhlIHJlcGx5IEkgdGhvdWdodCBJJ3ZlIHR5cGVkIGRpZG4ndCBzZWVtIHRvCmhhdmUg
Z29uZSBvdXQuCgpDaGVycnkgcGljayB1cCwgZml4IHVwIGNvbmZsaWN0IGFuZCB0aGVuIGZpeCB1
cCB0aGUgY29uZmxpY3Qgd2hlbgpyZWJ1aWxkaW5nIGRybS10aXAuIFBsZWFzZSB0ZWxsIGRybS1t
aXNjIG1haW50YWluZXJzLCB0aGV5IHByb2JhYmx5CndhbnQgdG8gZG8gYSBiYWNrbWVyZ2Ugb25j
ZSB0aGUgZHJtLW5leHQgbWVyZ2Ugd2luZG93IHB1bGwgaXMgbWVyZ2VkCmluIExpbnVzIHRyZWUu
CgpJZiB3ZSBkb24ndCBmaXggdGhpcyB1cCB0aGVuIHRoZSBkcm0tbmV4dCBwdWxsIGdvZXMgbm93
aGVyZS4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
