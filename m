Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F12D2283D94
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 19:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B8A89C9B;
	Mon,  5 Oct 2020 17:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EF089C13
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 17:38:32 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id x62so5065170oix.11
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 10:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K3fmY8B65FY8SIpToaxxUh/kyVCliYtzTy5qo1pqLfg=;
 b=JTTQVtC7DwMcbYUCGVCTcRciwOigUIvJI0cMNYyAFbt3RXhx8PLLjc8r/lYfIFXq/X
 rsMRB8k4Z14n7n8jGnhuqAg5L1Hn8tgb/IkzupoLZsnGF6l4ocfoun0gBDaU8+sN9WT1
 /nZXEsjtyNvejF3Dl6fft5EgPa1xIhheOt9Rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K3fmY8B65FY8SIpToaxxUh/kyVCliYtzTy5qo1pqLfg=;
 b=d3+4ZVtoa27wRLL9LUAE/Vhrf5fbUnPKSvx+uxPxqw05m9OErGtkSUqh0/SfrK1upB
 mPAxg+Q2m0OTmN96tewOdYMY+k9ZuHHXpiVPfHP+SW6g11/RCOZH0xBAOapK6u/ZkZy4
 /Q9blZStYV15jcAlBvrIatswNEBXKDLPltCdjRxtv6twFltbFeqTrwZShnQOzIgkOQ4t
 plzce3TS4y5qDqNXps7i7nzpHBoeRRLK9ETNRR98fCEY5BkhqCcvL7hBDS0z20nEzFJa
 7HPFaJLY6rY4gtwKE2joLwZ7FWE/VL/mvNTTYWwrTUx7od1FlI7lshz9lzp1B/Ur87Bs
 ZWgQ==
X-Gm-Message-State: AOAM530dpD6HVShQ0Y26QGilVeHgFXSsliDWp5pTFDEuTzHUX5H4E7mY
 5JSc3tzgN++0rmbf80y1b2N+mh1YNKO/HF3hHU1rKQ==
X-Google-Smtp-Source: ABdhPJy1B5YA31ileropbZ/3QrFV3MxDor1CNYNEnSDq8FAOpeT9++wtKAh9+aWPxk78OTbq1tdOzW7C/9azhF+kzvw=
X-Received: by 2002:aca:c6cc:: with SMTP id w195mr253449oif.101.1601919512035; 
 Mon, 05 Oct 2020 10:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200930165212.GA8833@lst.de>
 <20201004141758.1013317-1-paul@crapouillou.net>
 <20201004195921.GA556605@ravnborg.org> <ZE1PHQ.WGCBAFO9R38I3@crapouillou.net>
 <20201005230150.5637fa42@canb.auug.org.au>
 <20201005140534.GT438822@phenom.ffwll.local>
 <B3HQHQ.7DOFKW9A9TEX1@crapouillou.net>
In-Reply-To: <B3HQHQ.7DOFKW9A9TEX1@crapouillou.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 5 Oct 2020 19:38:21 +0200
Message-ID: <CAKMK7uG4BQZ3YijZUfztiF_E=jq9ZGoNy6FFsyb2J6ZWUbFM8Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "gpu/drm: ingenic: Add option to mmap GEM buffers
 cached"
To: Paul Cercueil <paul@crapouillou.net>
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
Cj4gU29ycnkgZm9yIHRoZSBtZXNzLiBXaGF0IHNob3VsZCBJIGRvPwoKV2UgbmVlZCB0aGUgcmV2
ZXJ0IGluIGRybS1taXNjLW5leHQtZml4ZXMgb3IgdGhlIGRybS1uZXh0IHB1bGwgcmVxdWVzdApk
b2Vzbid0IHdvcmsgb3V0LiBTbyBjaGVycnktcGljayBvdmVyLCBmaXggdXAgY29uZmxpY3RzLCBw
dXNoIHRoZQp0cmVlLCBhbmQgZG9uJ3QgZm9yZ2V0IHRvIGZpeCB1cCB0aGUgY29uZmxpY3RzIHdo
ZW4gZGltIHJlYnVpbGRzCmRybS10aXAuIEFsc28gdGVsbCBkcm0tbWlzYyBtYWludGFpbmVycyB3
aGF0IHlvdSd2ZSBkb25lLCB0aGV5CnByb2JhYmx5IHdhbnQgdG8gZG8gYSBiYWNrbWVyZ2UgdG8g
Y2xlYW4gdGhpcyB1cCBhIGJpdCBvbmNlIHRoZQpkcm0tbmV4dCBwdWxsIHJlcXVlc3QgaGFzIGxh
bmRlZC4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
