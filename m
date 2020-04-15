Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DC81A9E6A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 13:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C416E9B0;
	Wed, 15 Apr 2020 11:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC01D6E9B0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 11:59:09 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id m2so3139407otr.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PnCiL3L0e2AXwuWWxWCVSBf2R6J0P9EEjPSS0NFlCLI=;
 b=IFLb73pKNheA9vT/6oSNNUgMy8T40ELtmxhQgQ2DN4EStH3JNbT2flUQ3r0vACUo48
 /lMoxVNNQOStjymeamYF9cVuc+aQVBRhFYMFlom757DcxqlwUKmDwvMOZiTAZaLLVmDu
 vPM9u0Qa3l9Epi4vgOYYwvjK9EuEY2Nd6coFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PnCiL3L0e2AXwuWWxWCVSBf2R6J0P9EEjPSS0NFlCLI=;
 b=a/Xfhhntxa/baOQ7/92rHaFKu0V+j4HZMvwGtQfrA7SrHUdAQjxcSUQyyjFt63pw0F
 T/hpVekNHgtVKrGBbdxcnNVIqjZxsC6ncMp7nil5Cx9fuVPHMEkeYnF9gnUA3IN2Ey1Z
 cNijFXA620yrKCNmXvrERm7iLNYp15/++NXJWd2GdT344V4fNlgeXFPskDTSlSFIcouq
 2wjX9IjbtZSjXTJcGkDokcizGIuuP+scheNr/yDOr7VpvCA6hfsj6ggQePWllEiIhccq
 uVNdv9inq/21TT4o93MJEntSodqWWoprKf824ad7Y4flrhUPRB9wPu0R/1kIlBpvJjvg
 D+TA==
X-Gm-Message-State: AGi0PubylvWI8f9e36e/6g/BK8SkUbWQCmML5ltytozHs6Xhx61VGFwa
 XCNIiNuyyZRlZeF6mSap+ve8hNhR0mCfBr9THl4XGA==
X-Google-Smtp-Source: APiQypLKhzcfTP49dcSedL/w4o0caLZKyFbS/Q+mm3DCYK1OaiJ72khNIkXTupw8HW9bPF1rmYP2G0mjDGYgUq7bzR8=
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr13130902ota.303.1586951948974; 
 Wed, 15 Apr 2020 04:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200414050807.13531-1-manasi.d.navare@intel.com>
 <20200414050807.13531-3-manasi.d.navare@intel.com>
 <20200414124454.GW3456981@phenom.ffwll.local>
 <3e395ad0-11c2-3e74-2fd6-41ddf0b565bc@daenzer.net>
In-Reply-To: <3e395ad0-11c2-3e74-2fd6-41ddf0b565bc@daenzer.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 15 Apr 2020 13:58:58 +0200
Message-ID: <CAKMK7uGGMpRPUgXPN9SSyPdaGFeEJV3e02KnaAYLJ1KGfn4E0w@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v4 3/3] drm/i915/dp: Expose connector VRR info
 via debugfs
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBcHIgMTUsIDIwMjAgYXQgMTI6MzMgUE0gTWljaGVsIETDpG56ZXIgPG1pY2hlbEBk
YWVuemVyLm5ldD4gd3JvdGU6Cj4KPiBPbiAyMDIwLTA0LTE0IDI6NDQgcC5tLiwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPiA+IE9uIE1vbiwgQXByIDEzLCAyMDIwIGF0IDEwOjA4OjA3UE0gLTA3MDAs
IE1hbmFzaSBOYXZhcmUgd3JvdGU6Cj4gPj4gRnJvbTogQmhhbnVwcmFrYXNoIE1vZGVtIDxiaGFu
dXByYWthc2gubW9kZW1AaW50ZWwuY29tPgo+ID4+Cj4gPj4gW1doeV0KPiA+PiBJdCdzIHVzZWZ1
bCB0byBrbm93IHRoZSBtaW4gYW5kIG1heCB2cnIgcmFuZ2UgZm9yIElHVCB0ZXN0aW5nLgo+ID4+
Cj4gPj4gW0hvd10KPiA+PiBFeHBvc2UgdGhlIG1pbiBhbmQgbWF4IHZmcmVxIGZvciB0aGUgY29u
bmVjdG9yIHZpYSBhIGRlYnVnZnMgZmlsZQo+ID4+IG9uIHRoZSBjb25uZWN0b3IsICJpOTE1X3Zy
cl9pbmZvIi4KPiA+Pgo+ID4+IEV4YW1wbGUgdXNhZ2U6IGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9k
cmkvMC9EUC0xL2k5MTVfdnJyX2luZm8KPiA+Pgo+ID4+IHYzOgo+ID4+ICogUmVtb3ZlIHRoZSB1
bm5lY2Vzc2FyeSBkZWJ1ZyBwcmludCAoTWFuYXNpKQo+ID4+IHYyOgo+ID4+ICogRml4IHRoZSB0
eXBvIGluIG1heF92ZnJlcSAoTWFuYXNpKQo+ID4+ICogQ2hhbmdlIHRoZSBuYW1lIG9mIG5vZGUg
dG8gaTkxNV92cnJfaW5mbyBzbyB3ZSBjYW4gYWRkCj4gPj4gb3RoZXIgdnJyIGluZm8gZm9yIG1v
cmUgZGVidWcgaW5mbyAoTWFuYXNpKQo+ID4+ICogQ2hhbmdlIHRoZSBWUlIgY2FwYWJsZSB0byBk
aXNwbGF5IFllcyBvciBObyAoTWFuYXNpKQo+ID4+ICogRml4IGluZGVudGF0aW9uIGNoZWNrcGF0
Y2ggZXJyb3JzIChNYW5hc2kpCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBCaGFudXByYWthc2gg
TW9kZW0gPGJoYW51cHJha2FzaC5tb2RlbUBpbnRlbC5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTog
TWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4KPiA+PiBDYzogSmFuaSBO
aWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4KPiA+PiBDYzogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+PiBUZXN0ZWQtYnk6IE1hbmFz
aSBOYXZhcmUgPG1hbmFzaS5kLm5hdmFyZUBpbnRlbC5jb20+Cj4gPgo+ID4gU28gaWYgSSdtIHVu
ZGVyc3RhbmRpbmcgdGhpbmdzIGNvcnJlY3RseSBBTUQgYnV0Y2hlcmVkIHRoZSBWUlIgc3R1ZmYg
YW5kCj4gPiBvbmx5IGV4cG9zZXMgaXQgd2hlbjoKPiA+Cj4gPiAtIFZSUl9FTkFCTEVEIGlzIHNl
dAo+Cj4gTm90IHJlYWxseSBzdXJwcmlzaW5nPyA6KQo+Cj4gPiAtIF9hbmRfIHlvdSdyZSB1c2lu
ZyB0aGUgbGVnYWN5IHBhZ2VfZmxpcCBwYXRoLCBhdG9taWMgZmxpcCBkb2Vzbid0Cj4gPiAgIHN1
cHBvcnQgaXQKPgo+IFNpbW9uIFNlciBoYXMgVlJSIHdvcmtpbmcgd2l0aCBzd2F5IHVzaW5nIHRo
ZSBhdG9taWMgS01TIEFQSS4KPgo+ID4gLSBfYW5kXyB0aGUgUEFHRV9GTElQX0FTWU5DIGZsYWcg
aXMgc2V0Lgo+Cj4gQUZBSUsgaXQgd29ya3MgYm90aCB3aXRob3V0IGFuZCB3aXRoIFBBR0VfRkxJ
UF9BU1lOQy4gKEFzeW5jIGp1c3QgbWVhbnMKPiB0ZWFyaW5nIGlmIHRoZSBmbGlwIGlzIHByb2dy
YW1tZWQgb3V0c2lkZSBvZiB2ZXJ0aWNhbCBibGFuaykKClllYWggTmljb2xhcyBhbHJlYWR5IGV4
cGxhaW5lZCBpdCBhbGwgb24gdGhlIGlndCB0aHJlYWQsIGNvbmNsdXNpb24gaXMKdGhhdCB0aGUg
aWd0IG5lZWRzIHNvbWUgd29yayB0byBpbXByb3ZlIGl0IChuZWVkIHRvIHRlc3QgdGhlIGF0b21p
YwpwYXRoIHRvbywgYW5kIHRyeSB0byBiZSBhIGJpdCBsZXNzIGhhY2tpc2ggd2l0aCB0aGUgdGlt
aW5nIHRlc3RzKS4gU28KYWxsIGdvb2QsIGp1c3QgbWUgd2hvIHBhbmlja2VkIGFuZCBnb3QgbGVk
IGFzdHJheSBieSB0aGUgY29tbWVudCBpbgp0aGUgaWd0IGFuZCB0aGF0IGFtZGdwdSBzdGlsbCBp
bXBsZW1lbnRzIGl0cyBvd24gcGFnZV9mbGlwIGNhbGxiYWNrCihpbiBjb21wbGV0ZWx5IHNlcGFy
YXRlIHBhdGhzLCBpdCBkb2Vzbid0IHNlZW0gdG8gY29udmVyZ2UgZXZlbiBpbiB0aGUKbG93LWxl
dmVsIGNoaXAgZnVuY3Rpb25zKSwgc28gd2Fzbid0IG9idmlvdXMgdG8gbWUgZnJvbSByZWFkaW5n
IGNvZGUKdGhhdCB0aGUgYXRvbWljIHBhdGggd291bGQgYWxzbyB3b3JrLgotRGFuaWVsCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDAp
IDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
