Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9412AE149
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 22:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82C789C27;
	Tue, 10 Nov 2020 21:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A97B89C97
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 21:02:28 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h2so4607814wmm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 13:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/4ivGjpOSzxr0bVTtrL/2oAHyb/02RtqaNu/H/vaQ4I=;
 b=Hm+BKMpx9UbZ/qHsQxtcxkqgo5nuU8Qd7EQLcSjhtJuBqKRh6U8HWodSY29Lle6X/L
 EcB03W8Lp1W4LPCk3xp8QA4mDbeCUxLbnpzwvBznApIH+zwGEdgJuFc16smVv0oe6frp
 s33ebO3415h5vzDyDvEoVXIJlwpAtHpNmuZ5cHq5vTVIoLMexGgEfe+oPtubX2SGnDEg
 rDYMm2aoMUiEEjbXPVU+1GRvbVbsigoeLlJ9zdb740gGgLEtR/EwbUJz2vDXi32iI0cd
 TXbBTpg65bQhHAiLKIvkCw9HfWiXOlNizbLnxhtD3cV4ZwzmJoyctBjHBHnpFRUVOWCi
 T7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/4ivGjpOSzxr0bVTtrL/2oAHyb/02RtqaNu/H/vaQ4I=;
 b=enE1clgKDqQic76tnoBlO6xNw/nkdvwc0WlBLL9LNHs7dA8aAV4z+8hAMcJa90IY3g
 KJZBUVslamXDCsPZL/0LHXy81HHyz8rAp6ULDrqsbLaC0Ib+MatSwd44pxZ9caMfSBPg
 w5NX9vundFnT40BvHRKhMnqi+xErblybKnVdrHPMgnpvxuR1Qcm+LXu6f4e2gBAmZktv
 X9CDq+T5/YE9Nb/QQyOjQG/mw1PUVWYawMy6gVGnu/kGfT9RBMImF82ngUekJzXrCgdF
 G2hOKy2Sb/lz7SJ0oDs20b3wtzs/DA9ijwJXOlRZhG1l1K4S2a6gCJe/RnugZDEHFzYh
 dhUw==
X-Gm-Message-State: AOAM532DTPgZWDIRkO1JHUqSLwh3vF8qTq7/fpSvRxZsF3rN3f0zqyZB
 Ku58CEA1NBYktgC6mJUVHt79aQ==
X-Google-Smtp-Source: ABdhPJy+bbCKjuEncDG1+ba9fnm9l07+jxcwHagMasg+krtBAelC9qSpYEiV3tnmoNKjXce+XpYKaw==
X-Received: by 2002:a1c:4144:: with SMTP id o65mr1125571wma.39.1605042146708; 
 Tue, 10 Nov 2020 13:02:26 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 18sm61004wmo.3.2020.11.10.13.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 13:02:26 -0800 (PST)
Date: Tue, 10 Nov 2020 21:02:24 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 15/20] drm/radeon/r600d: Move 'rc600_*' prototypes into
 shared header
Message-ID: <20201110210224.GJ2063125@dell>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
 <20201109211855.3340030-16-lee.jones@linaro.org>
 <CADnq5_NvitEQWH3Z+5EgOH3zJn=P5YTqwHQo4LLQLi0Hj0Dpww@mail.gmail.com>
 <20201110072242.GF2063125@dell>
 <20201110090247.GB2027451@ravnborg.org>
 <20201110094111.GG2063125@dell>
 <CADnq5_PYERS0xHJGQrpokDD7q3GgidSYqSrOoskza7gST4bbmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PYERS0xHJGQrpokDD7q3GgidSYqSrOoskza7gST4bbmQ@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMCBOb3YgMjAyMCwgQWxleCBEZXVjaGVyIHdyb3RlOgoKPiBPbiBUdWUsIE5vdiAx
MCwgMjAyMCBhdCA0OjQxIEFNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IHdyb3Rl
Ogo+ID4KPiA+IE9uIFR1ZSwgMTAgTm92IDIwMjAsIFNhbSBSYXZuYm9yZyB3cm90ZToKPiA+Cj4g
PiA+IEhpIExlZSwKPiA+ID4KPiA+ID4gPiA+IHRoZSAqZC5oIGhlYWRlcnMgYXJlIHN1cHBvc2Vk
IHRvIGp1c3QgYmUgaGFyZHdhcmUgZGVmaW5pdGlvbnMuICBJJ2QKPiA+ID4gPiA+IHByZWZlciB0
byBrZWVwIGRyaXZlciBzdHVmZiBvdXQgb2YgdGhlbS4KPiA+ID4gPgo+ID4gPiA+IFRoYXQncyBm
aW5lIChJIGRpZCB3b25kZXIgaWYgdGhhdCB3ZXJlIHRoZSBjYXNlKS4KPiA+ID4gPgo+ID4gPiA+
IEkgbmVlZCBhbiBhbnN3ZXIgZnJvbSB5b3UgYW5kIFNhbSB3aGV0aGVyIEkgY2FuIGNyZWF0ZSBu
ZXcgaGVhZGVycy4KPiA+ID4gPgo+ID4gPiA+IEZvciBtZSwgaXQgaXMgdGhlIHJpZ2h0IHRoaW5n
IHRvIGRvLgo+ID4gPgo+ID4gPiBQbGVhc2UgZm9sbG93IHRoZSBhZHZpY2Ugb2YgQWxleCBmb3Ig
dGhlIHJhZGVvbiBkcml2ZXIuCj4gPgo+ID4gR3JlYXQuICBUaGFua3MgZm9yIHJlc29sdmluZyB0
aGlzIFNhbS4KPiA+Cj4gPiBXaWxsIGZpeCBhbGwgb2NjdXJyZW5jZXMuCj4gCj4gSSdtIG5vdCBy
ZWFsbHkgZm9sbG93aW5nIHRoZXNlIHBhdGNoIHNldHMgeW91IGFyZSBzZW5kaW5nIG91dC4gIFRo
ZXkKPiBhbGwgc2VlbSBjb21wbGV0ZWx5IGluZGVwZW5kZW50LiAgSSB3YXMgZXhwZWN0aW5nIHVw
ZGF0ZWQgdmVyc2lvbnMKPiB3aXRoIGZlZWRiYWNrIGludGVncmF0ZWQsIGJ1dCB0aGV5IHNlZW0g
dG8gYmUganVzdCBkaWZmZXJlbnQgZml4ZXMuCj4gQXJlIHlvdSBwbGFubmluZyB0byBzZW5kIG91
dCB1cGRhdGVkIHZlcnNpb25zIGJhc2VkIG9uIGZlZWRiYWNrIGZyb20KPiB0aGVzZSBzZXJpZXM/
ICBBbHNvLCBzb21lIG9mIHRoZSBwYXRjaGVzIGhhdmUgc3VidGxlIGVycm9ycyBpbiB0aGVtCj4g
KGUuZy4sIHdyb25nIGRlc2NyaXB0aW9ucyBvZiB2YXJpYWJsZXMsIHdyb25nIGNvcHlyaWdodCBo
ZWFkZXJzIG9uIG5ldwo+IGZpbGVzLCBldGMuKSwgZG8geW91IG1pbmQgaWYgSSBmaXggdGhlbSB1
cCBsb2NhbGx5IHdoZW4gYXBwbHlpbmcgb3IKPiB3b3VsZCB5b3UgcmF0aGVyIEkgcG9pbnQgb3V0
IHRoZSBjaGFuZ2VzIGFuZCB5b3UgY2FuIGludGVncmF0ZSB0aGVtCj4gYW5kIHJlc2VuZD8KCkFw
b2xvZ2llcyBmb3IgYW55IGNvbmZ1c2lvbi4gIExldCBtZSB0cnkgdG8gc2hlZCBzb21lIGxpZ2h0
LgoKQWxsIDQgc2V0cyBzZW50IHRodXMgZmFyIGhhdmUgYmVlbiBpbmRlcGVuZGVudC4gIFRoZXJl
IGFyZSA1MDAwIGlzc3Vlcwp0byBzb2x2ZSBpbiBkcml2ZXJzL2dwdSAtIEknbSB0cnlpbmcgbXkg
YmVzdCB0byB3aGl0dGxlIHRoZW0gZG93bi4KV2UncmUgZG93biB0byAyMjAwIHJpZ2h0IG5vdywg
c28gaXQgc2VlbXMgdG8gYmUgZ29pbmcgd2VsbC4KCkknbSBhd2FyZSB0aGF0IHNvbWUgb2YgdGhl
IHBhdGNoZXMgaGF2ZSBiZWVuIGFjY2VwdGVkIGFscmVhZHksIHNvIHRoZQpwbGFuIGlzIHRvIHdh
aXQgYSBmZXcgZGF5cywgbGV0IHRoZW0gc2V0dGxlIGludG8gLW5leHQsIHRoZW4gc3RhcnQ7CnJl
YmFzaW5nIHNldHMsIGFwcGx5aW5nIGZpeC11cHMgYW5kIHNlbmRpbmcgb3V0IHYycy4KCkZZSTog
VGhlcmUgYXJlIGFsc28gb3V0c3RhbmRpbmcgcmViYXNlcyBkdWUgZm9yOyB3aXJlbGVzcywgbmV0
LCBpbnB1dAphbmQgU0NTSSwgYXMgd2VsbCBhcyB0aGUgNCBEUk0gc2V0cy4gIEknbSBnZXR0aW5n
IHRvIGFsbCBvZiB0aGVtLgoKV2l0aCByZWdhcmRzIHRvIGhvdyB5b3UgZGVhbCB3aXRoIGluY29y
cmVjdG5lc3MsIHRoYXQncyBlbnRpcmVseSB1cCB0bwp5b3UuICBGZWVsIGZyZWUgdG8gZWl0aGVy
IGZpeC11cCBhbnkgaXNzdWVzIHlvdSBzZWUgb3IgdG8gcHJvdmlkZQpyZXZpZXcgY29tbWVudHMg
YW5kIGxldCBtZSBkZWFsIHdpdGggaXQuICBXaGF0ZXZlciB3b3JrcyBmb3IgeW91LgoKQSBub3Rl
IG9uIGNvcHlyaWdodHMgb24gbmV3IGZpbGVzOyB0aGUgbmV3IGZpbGVzIGFyZSBjb3BpZWQgZGly
ZWN0bHkKZnJvbSBvbGQsIHByZXZpb3VzbHkgYWNjZXB0ZWQvY3VycmVudGx5IHJlc2lkaW5nIG9u
ZXMgaW4gb3JkZXIgdG8ga2VlcAppbi1saW5lIHdpdGggd2hhdCdzIGV4cGVjdGVkIG9mIHRoZSBz
dWJzeXN0ZW0uICBJZiB0aGUgZm9ybWF0IGhhcyBiZWVuCnVwZGF0ZWQgYW5kL29yIHlvdSB3b3Vs
ZCBsaWtlIHRoZW0gbW9kZXJuaXNlZCwgcGxlYXNlIGVpdGhlciBmaXggdGhlbQp1cCBhdCB5b3Vy
IGxlaXN1cmUgb3IgbGV0IG1lIGtub3cgd2hhdCdzIHJlcXVpcmVkIGFuZCBJJ2xsIHJld29yayBh
bmQKcmVzdWJtaXQgdGhlbS4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2hu
aWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNl
IHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIg
fCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
