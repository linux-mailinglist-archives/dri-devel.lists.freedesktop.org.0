Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E87307626B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698206ECE0;
	Fri, 26 Jul 2019 09:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386146E6E0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 10:41:57 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id a15so48525658qtn.7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 03:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pGiwvfWNKHPPhL2m3Y+ZU+k11VBWGFXZIJf18IlQWnc=;
 b=XCxoE7CJ24Kiej/61e+y55+NnBin65d8BL5O2JpN9thfCBD40titjMZhRlZL5QJ8kB
 3Lg2/Goy0j9zWCwyVhqBIBLjAroHrRPsiWgICY5BM43IHwXU6IG5UOOp4AG/UAoUZD7n
 F9UILabv/By74QuKlNGXNw9Tc0wY2jAZBmPm+XEApQau21U+TBZKwZ+5PbDtgQM9sgls
 GTXxZd7F1Cqz3MNN1LCoauZgX5i+J4jZcKabYnJg3uTf0FeEjwoAxKcKB61+yRdVZrs1
 5gBJ63Lrv8FStTsQ65g0VOsErg3T48uAZ1K3GBAl8BquRI/k7OaBTwEssjoOWxvJkolo
 S1GQ==
X-Gm-Message-State: APjAAAXulfiJL4QDTP/IeVCLTgh3Yk7jVwXtks2u9Iwf7GFP4RLvy/o3
 OgMPT1tOMhXxKN187Qp1ZoctC7J+LEjfR85BljI=
X-Google-Smtp-Source: APXvYqwaHdM+e7GM8T7UVUIfXaFJJXhhorDT6t3/u3D3jbmoxQUBcTM6AGxPfcCuVwnDboRA1w3b6OlNCMC+IJaVLBo=
X-Received: by 2002:ac8:540e:: with SMTP id b14mr56392763qtq.134.1564051316047; 
 Thu, 25 Jul 2019 03:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAOKSTBs-cHMr7xbJVVUjZ9C3__bY6jZU-_TZ0RmMRMJ3dBk3PA@mail.gmail.com>
 <0c3f445d-1e37-1531-d3d5-f7ad75c58343@metux.net>
In-Reply-To: <0c3f445d-1e37-1531-d3d5-f7ad75c58343@metux.net>
From: Gilberto Nunes <gilberto.nunes32@gmail.com>
Date: Thu, 25 Jul 2019 07:41:19 -0300
Message-ID: <CAOKSTBsYLKGMDC8noaTVHf=S4U8UnXB0HfJpD5YRjVPHw8rEXA@mail.gmail.com>
Subject: Re: AMD Drivers
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pGiwvfWNKHPPhL2m3Y+ZU+k11VBWGFXZIJf18IlQWnc=;
 b=cR1Wx3yvjSP8ftL5qjLwcS3bydYdNBb9LbMe98teK2F5ipD3Njxpjc7WU14tCHa32d
 olU+kyMW/5PV5LF0V8BHY+d+2QN4JMTFkqIKMZNHmcQOsOUpXsfpNaqugUI6P6qqnLVN
 5BDvwdKYjwcce2Bi8hrccNAjjgyyPSqbYxPU3am29d9+SKZRD5W56rcmEpAzl4TmmQho
 XL+Wg2/j6LrxODMkDuMKvZw8v9yyHBkF+lhQx/lDcDWs/em7ghOKmCigO9HlPJbBWRyl
 wnFYR8QDShBTVHXs5YR6QywYgqUW9QOHLAv2on2+xBups8afqm9xjI3CS63d3SvrNq6R
 m9+w==
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
Cc: linux-kernel@vger.kernel.org, dri devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgdGhlcmUKCj4gV2hhdCBhYm91dCBvdGhlciB2ZXJzaW9ucyAoZWcuIHY0LjE5KSA/Cj4gV2hp
Y2ggaXMgdGhlIGxhc3Qgd29ya2luZyB2ZXJzaW9uID8KClRoZSBvbmx5IHNlcmllcyB0aGF0IHdv
cmtzIHByb3Blcmx5IGlzIDQuMTUueAoKPiBDb3VsZCB5b3UgYWxzbyB0cnkgNS4zID8KSSB3aWxs
LCBBU0FQIQoKPj4gT2ghIEJ5IHRoZSB3YXksIHRoZSBuZXR3b3JrIGNhcmQgcjgxNjkgYXJlIHdv
cmsgd29uZGVyZnVsIQo+RGlkbid0IHlvdSBzYXkgKGFib3ZlKSB0aGF0IGl0IGRvZXMgbm90IHdv
cmsgPwo+T3IgaXMgaXQganVzdCBhbiBpbW1lZGlhdGUgZmFpbCBhbmQgbGF0ZXIgY29tZXMgYmFj
ayA/CgpXZWxsLi4uIEkgaW5zdGFsbGVkIDUuMiBhbmQgYWZ0ZXIgcmVib290IE5JQyB3b3JrcyBm
aW5lLCBidXQgZ2V0IHN0dWNrCndpdGggYW1kZ3B1IGFnYWluLi4uCkl0J3Mgc2VlbXMgNS54IGlz
IGluIHRoZSByaWdodCBwYXRoLi4uIEJ1dCBzdGlsbCBhbWRncHUgaGFzIHNvbWUgYnVncywKSSB0
aGluay4uLgoKVGhhbmtzIGEgbG90IGZvciB5b3VyIGNvbWVudHMKCgpCZXN0IHJlZ2FyZHMKCkVt
IHF1aSwgMjUgZGUganVsIGRlIDIwMTkgw6BzIDA0OjIyLCBFbnJpY28gV2VpZ2VsdCwgbWV0dXgg
SVQgY29uc3VsdAo8bGttbEBtZXR1eC5uZXQ+IGVzY3JldmV1Ogo+Cj4gT24gMjQuMDcuMTkgMTY6
MTcsIEdpbGJlcnRvIE51bmVzIHdyb3RlOgo+Cj4gSGksCj4KPiBjcm9zc3Bvc3RpbmcgdG8gZHJp
LWRldmVsLCBhcyBpdCBzbWVsbHMgbGlrZSBhIHByb2JsZW0gdy8gYW1kZ3B1IGRyaXZlci4KPgo+
ID4gQ1BVIC0gQU1EIEExMi05NzIwUCBSQURFT04gUjcsIDEyIENPTVBVVEUgQ09SRVMgNEMrOEcK
PiA+IEdQVSAtIFdhbmkgW1JhZGVvbiBSNS9SNi9SNyBHcmFwaGljc10gKGFtZGdwdSkKPiA+IE5l
dHdvcmsgSW50ZXJmYWNlIGNhcmQ6Cj4gPiAwMTowMC4xIEV0aGVybmV0IGNvbnRyb2xsZXI6IFJl
YWx0ZWsgU2VtaWNvbmR1Y3RvciBDby4sIEx0ZC4KPiA+IFJUTDgxMTEvODE2OC84NDExIFBDSSBF
eHByZXNzIEdpZ2FiaXQgRXRoZXJuZXQgQ29udHJvbGxlciAocmV2IDEyKQo+ID4KPiA+IFdoZW4g
SSBpbnN0YWxsIGtlcm5lbCA0LjE4Lnggb3IgNS54LCB0aGUgbmV0d29yayBkb2Vzbid0IHdvcmsg
YW55bW9yZS4uLgo+Cj4gV2hhdCBhYm91dCBvdGhlciB2ZXJzaW9ucyAoZWcuIHY0LjE5KSA/Cj4g
V2hpY2ggaXMgdGhlIGxhc3Qgd29ya2luZyB2ZXJzaW9uID8KPgo+ID4gSSBjYW4gbG9hZGVkIHRo
ZSBtb2R1bG8gcjgxNjkgYW5kcjgxNjguCj4gPiBJIHNhdyBlbnAxczBmMSBhcyB3ZWxsIGJ1dCB0
aGVyZSdzIG5vIGxpbmsgYXQgYWxsIQo+ID4gRXZlbiB3aGVuIEkgZml4ZWQgdGhlIElQIG5vbmUg
bGluayEKPiA+IEkgY2Fubm90IHBpbmcgdGhlIG5ldHdvcmsgZ2F0ZXdheSBvciBhbnkgb3RoZXIg
SVAgaW5zaWRlIExBTiEKPiA+IFJpZ2h0IG5vdywgSSBib290ZWQgbXkgbGFwdG9wIHdpdGgga2Vy
bmVsCj4gPiBMaW51eCB2ZXJzaW9uIDUuMi4yLTA1MDIwMi1nZW5lcmljIChrZXJuZWxAa2F0aGxl
ZW4pIChnY2MgdmVyc2lvbgo+ID4gOS4xLjAgKFVidW50dSA5LjEuMC05dWJ1bnR1MikpICMyMDE5
MDcyMzEyNTAgU01QIFR1ZSBKdWwgMjMgMTI6NTM6MjEKPiA+IFVUQyAyMDE5Cj4KPiBDb3VsZCB5
b3UgYWxzbyB0cnkgNS4zID8KPgo+ID4gVGhlIHN5c3RlbSBib290IHNsb3dseSwgYW5kIEkgaGF2
ZSBhIFNTRCBTYW1zdW5nLCB3aGljaCBpbiBrZXJuZWwKPiA+IDQuMTUsIGJvb3QgcXVpY2tseS4K
PiA+IEFuZCB0aGVyZSdzIG1hbnkgZXJyb3JzIGluIGRtZXNnIGNvbW1hbmQsIGxpa2UgeW91IGNh
biBzZWUgaW4gdGhpcyBwYXN0YmluCj4gPgo+ID4gaHR0cHM6Ly9wYXN0ZS51YnVudHUuY29tL3Av
WWhiam56WVlZaC8KPgo+IGxvb2tzIGxpa2Ugc29tZXRoaW5nJ3Mgd3Jvbmcgdy8gcmVhZGluZyBn
cHUgcmVnaXN0ZXJzIChtb3JlIHByZWNpc2VseQo+IHdhaXRpbmcgZm9yIHNvbWUgY2hhbmdpbmcp
LCB0aGF0J3MgY2F1c2luZyB0aGUgc29mdCBsb2NrdXAuIChtYXliZSB0b28KPiBiaWcgdGltZW91
dCA/KQo+Cj4gPiBPaCEgQnkgdGhlIHdheSwgdGhlIG5ldHdvcmsgY2FyZCByODE2OSBhcmUgd29y
ayB3b25kZXJmdWwhCj4KPiBEaWRuJ3QgeW91IHNheSAoYWJvdmUpIHRoYXQgaXQgZG9lcyBub3Qg
d29yayA/Cj4gT3IgaXMgaXQganVzdCBhbiBpbW1lZGlhdGUgZmFpbCBhbmQgbGF0ZXIgY29tZXMg
YmFjayA/Cj4KPgo+IC0tbXR4Cj4KPgo+IC0tCj4gRW5yaWNvIFdlaWdlbHQsIG1ldHV4IElUIGNv
bnN1bHQKPiBGcmVlIHNvZnR3YXJlIGFuZCBMaW51eCBlbWJlZGRlZCBlbmdpbmVlcmluZwo+IGlu
Zm9AbWV0dXgubmV0IC0tICs0OS0xNTEtMjc1NjUyODcKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
