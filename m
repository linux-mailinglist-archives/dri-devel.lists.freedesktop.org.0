Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8311C755A8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 19:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDB76E7DC;
	Thu, 25 Jul 2019 17:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA5B6E7DC
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 17:26:08 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x4so51578406wrt.6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 10:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qUfPpidGaXW1JR+PDwlAYzwSLRaesJn6wZTx7CMAfSw=;
 b=rQJZPwWEs8DO1RbfQReZkNH6SIxT29wkLjj/obZIuQH99SiMvUmiytB0Z3fO9st9+B
 0z9jlwWzGi/LSMv1kT4dwJ/UgAQMaf13DHD9nyimxc7PQXQOIYDiBuxs+3IHOn/Iyw1U
 sXeyD+LKO6OA/TFdJtVzCztxgGTVXzSMYKgjcmbqxp00m6b2gNdePzwbyZhP0FaH7QIU
 QwUwVF1mSSqp240zR/cBAEkt7EMOJW9EF+w8vtseZ2b5aI3va1TjUbt42p4T0Esdrhws
 RerUMSNKOJXc/wcL2Ww2nUMiz0tKadp+KBYuAk+TpdDEv7LK69eDWf+nRRr/4ZtZc4E1
 ijqg==
X-Gm-Message-State: APjAAAXmMAhmyo9EXUeflFHeSvt9LwcqvM9HKoGXPIihK5x+bZlj3Ipy
 /n408SXKfFFAin4Di5ohylhDbnxGaQx5ou8dAeQ=
X-Google-Smtp-Source: APXvYqzpCt+ykuPCj162sciP1+JajnBPVm6VFFQTgxMu4B0n6jDcSvnRA7P49Rle8xp3aCczF+zk8go9CUNiHRR5IoU=
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr93113559wrc.4.1564075566899; 
 Thu, 25 Jul 2019 10:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAOKSTBs-cHMr7xbJVVUjZ9C3__bY6jZU-_TZ0RmMRMJ3dBk3PA@mail.gmail.com>
 <0c3f445d-1e37-1531-d3d5-f7ad75c58343@metux.net>
In-Reply-To: <0c3f445d-1e37-1531-d3d5-f7ad75c58343@metux.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Jul 2019 13:25:55 -0400
Message-ID: <CADnq5_NqDNLzZW6h3cXBUfTMsBe6isvE6YQH=9Op6Gews=ubGg@mail.gmail.com>
Subject: Re: AMD Drivers
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qUfPpidGaXW1JR+PDwlAYzwSLRaesJn6wZTx7CMAfSw=;
 b=DfT45AwkHcvsxfoBm9B6LCOAoiewqd0xitUDiwUnABB17hQoA7GX7mhanjC+G662DR
 UIXGhjnaSyNP6ziZ7nX1GXpBeW9QCugb8MF+9+6lfJanD2O14SM9kqdx/UKqljt6AZg4
 +GUFp43DFSBX53VYB0uuvGZWRLoZio15YmeiThbZYf6wr+13bQ7Yj62UrFCyr/Kf1R3o
 tBevTrXs6baJib1/V3UjcLhOPWAh1FKrq+kMTX8mNc7eTMBvrgcNY0q+KuKgPy4XJc/B
 dE8R6j3P2hLJXqFllSxon9e3b5frVXFwFXE5kh7lDULCvjfzn9LxL0OzB+J2rzNd5S5k
 IECg==
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri devel <dri-devel@lists.freedesktop.org>,
 Gilberto Nunes <gilberto.nunes32@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMzozMCBBTSBFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQg
Y29uc3VsdAo8bGttbEBtZXR1eC5uZXQ+IHdyb3RlOgo+Cj4gT24gMjQuMDcuMTkgMTY6MTcsIEdp
bGJlcnRvIE51bmVzIHdyb3RlOgo+Cj4gSGksCj4KPiBjcm9zc3Bvc3RpbmcgdG8gZHJpLWRldmVs
LCBhcyBpdCBzbWVsbHMgbGlrZSBhIHByb2JsZW0gdy8gYW1kZ3B1IGRyaXZlci4KPgo+ID4gQ1BV
IC0gQU1EIEExMi05NzIwUCBSQURFT04gUjcsIDEyIENPTVBVVEUgQ09SRVMgNEMrOEcKPiA+IEdQ
VSAtIFdhbmkgW1JhZGVvbiBSNS9SNi9SNyBHcmFwaGljc10gKGFtZGdwdSkKPiA+IE5ldHdvcmsg
SW50ZXJmYWNlIGNhcmQ6Cj4gPiAwMTowMC4xIEV0aGVybmV0IGNvbnRyb2xsZXI6IFJlYWx0ZWsg
U2VtaWNvbmR1Y3RvciBDby4sIEx0ZC4KPiA+IFJUTDgxMTEvODE2OC84NDExIFBDSSBFeHByZXNz
IEdpZ2FiaXQgRXRoZXJuZXQgQ29udHJvbGxlciAocmV2IDEyKQo+ID4KPiA+IFdoZW4gSSBpbnN0
YWxsIGtlcm5lbCA0LjE4Lnggb3IgNS54LCB0aGUgbmV0d29yayBkb2Vzbid0IHdvcmsgYW55bW9y
ZS4uLgo+Cj4gV2hhdCBhYm91dCBvdGhlciB2ZXJzaW9ucyAoZWcuIHY0LjE5KSA/Cj4gV2hpY2gg
aXMgdGhlIGxhc3Qgd29ya2luZyB2ZXJzaW9uID8KPgo+ID4gSSBjYW4gbG9hZGVkIHRoZSBtb2R1
bG8gcjgxNjkgYW5kcjgxNjguCj4gPiBJIHNhdyBlbnAxczBmMSBhcyB3ZWxsIGJ1dCB0aGVyZSdz
IG5vIGxpbmsgYXQgYWxsIQo+ID4gRXZlbiB3aGVuIEkgZml4ZWQgdGhlIElQIG5vbmUgbGluayEK
PiA+IEkgY2Fubm90IHBpbmcgdGhlIG5ldHdvcmsgZ2F0ZXdheSBvciBhbnkgb3RoZXIgSVAgaW5z
aWRlIExBTiEKPiA+IFJpZ2h0IG5vdywgSSBib290ZWQgbXkgbGFwdG9wIHdpdGgga2VybmVsCj4g
PiBMaW51eCB2ZXJzaW9uIDUuMi4yLTA1MDIwMi1nZW5lcmljIChrZXJuZWxAa2F0aGxlZW4pIChn
Y2MgdmVyc2lvbgo+ID4gOS4xLjAgKFVidW50dSA5LjEuMC05dWJ1bnR1MikpICMyMDE5MDcyMzEy
NTAgU01QIFR1ZSBKdWwgMjMgMTI6NTM6MjEKPiA+IFVUQyAyMDE5Cj4KPiBDb3VsZCB5b3UgYWxz
byB0cnkgNS4zID8KPgo+ID4gVGhlIHN5c3RlbSBib290IHNsb3dseSwgYW5kIEkgaGF2ZSBhIFNT
RCBTYW1zdW5nLCB3aGljaCBpbiBrZXJuZWwKPiA+IDQuMTUsIGJvb3QgcXVpY2tseS4KPiA+IEFu
ZCB0aGVyZSdzIG1hbnkgZXJyb3JzIGluIGRtZXNnIGNvbW1hbmQsIGxpa2UgeW91IGNhbiBzZWUg
aW4gdGhpcyBwYXN0YmluCj4gPgo+ID4gaHR0cHM6Ly9wYXN0ZS51YnVudHUuY29tL3AvWWhiam56
WVlZaC8KPgo+IGxvb2tzIGxpa2Ugc29tZXRoaW5nJ3Mgd3Jvbmcgdy8gcmVhZGluZyBncHUgcmVn
aXN0ZXJzIChtb3JlIHByZWNpc2VseQo+IHdhaXRpbmcgZm9yIHNvbWUgY2hhbmdpbmcpLCB0aGF0
J3MgY2F1c2luZyB0aGUgc29mdCBsb2NrdXAuIChtYXliZSB0b28KPiBiaWcgdGltZW91dCA/KQoK
SXQgbG9va3MgbGlrZSB0aGUgZEdQVSBmYWlscyB0byBwb3dlciB1cCBwcm9wZXJseSB3aGVuIHlv
dSBhdHRlbXB0IHRvCnVzZSBpdC4gIFlvdSBjYW4gYXBwZW5kIGFtZGdwdS5ydW5wbT0wIHRvIHRo
ZSBrZXJuZWwgY29tbWFuZCBsaW5lIGluCmdydWIgdG8gZGlzYWJsZSBkeW5hbWljYWxseSBwb3dl
cmluZyBkb3duIHRoZSBkR1BVLgoKQWxleAoKPgo+ID4gT2ghIEJ5IHRoZSB3YXksIHRoZSBuZXR3
b3JrIGNhcmQgcjgxNjkgYXJlIHdvcmsgd29uZGVyZnVsIQo+Cj4gRGlkbid0IHlvdSBzYXkgKGFi
b3ZlKSB0aGF0IGl0IGRvZXMgbm90IHdvcmsgPwo+IE9yIGlzIGl0IGp1c3QgYW4gaW1tZWRpYXRl
IGZhaWwgYW5kIGxhdGVyIGNvbWVzIGJhY2sgPwo+Cj4KPiAtLW10eAo+Cj4KPiAtLQo+IEVucmlj
byBXZWlnZWx0LCBtZXR1eCBJVCBjb25zdWx0Cj4gRnJlZSBzb2Z0d2FyZSBhbmQgTGludXggZW1i
ZWRkZWQgZW5naW5lZXJpbmcKPiBpbmZvQG1ldHV4Lm5ldCAtLSArNDktMTUxLTI3NTY1Mjg3Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
