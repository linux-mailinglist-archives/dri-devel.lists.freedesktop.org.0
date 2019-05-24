Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39B229B9C
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 17:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E637A6E0C9;
	Fri, 24 May 2019 15:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9515D6E0C9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 15:59:44 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id j12so15041482eds.7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=yexDqkrsc1HF9hj9/kXUvrAtwn0/ajLTJpC1QpY2qoo=;
 b=c+uZCiQKEcQLdJ4SXXLRZLe4JoFlAz1bJmRyU3BVLHUATQ72moIPDC4J3H1hKmlw2N
 mIguvn+JK0hnpz3+0BYxMwRYMM/OQT2wiN0VcYCJ+j58cPW3pBfVY+7Hu3wkgqHzmE51
 bGwiI7UUWRCJfxN1V/NBQmNR+BraUw/PJI6L/aLAfJk3x5Wf6e/zSKbrtOFtMxPW4ojo
 ralk9AEX1JPIPImG/nR0ozRPWM+U4yQkIrgsf/IpcNgO+IWh3cPNwZi4u8Ll0qDY1V4O
 BwtAMzGuqIPZrt+ziO+ztHX3M+1agetq+rrcB6IBMSim5RyhQUYa3fDVxpfMIUsQYzrL
 iFWA==
X-Gm-Message-State: APjAAAWIIZboEtHujArPGLcPs9781jIdVGohVc8LWjhi7P+pZlWpMIw0
 U3FMmvqmbFFWGdlv8eqQO0gCWA==
X-Google-Smtp-Source: APXvYqybhG7BQc4QjuP89d0EVVAwwxppkCIHMezPNdnZltFV5G5hHb4ZVmcCPegz6bdR2D0dYL+bhA==
X-Received: by 2002:a17:906:b257:: with SMTP id
 ce23mr52749695ejb.52.1558713583203; 
 Fri, 24 May 2019 08:59:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id h4sm420714ejx.81.2019.05.24.08.59.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 08:59:42 -0700 (PDT)
Date: Fri, 24 May 2019 17:59:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 4/4] drm/TODO: add a task to kill DRM_UNLOCKED
Message-ID: <20190524155940.GA21222@phenom.ffwll.local>
References: <20190522154702.16269-1-emil.l.velikov@gmail.com>
 <20190522154702.16269-4-emil.l.velikov@gmail.com>
 <20190522161259.GV21222@phenom.ffwll.local>
 <20190524151716.GB8938@arch-x1c3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524151716.GB8938@arch-x1c3>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yexDqkrsc1HF9hj9/kXUvrAtwn0/ajLTJpC1QpY2qoo=;
 b=FxYE2wNgmU1+9yBpPQREJFVAX24KNXt0zpzZVSjXbqJl8PrSzpDtaRZo7wh0O/wF3W
 obfb39c1aOff3+Dv8/mUVv1iqJRqpUgPeGsw8rO8aYJc0bphVRYMSLLyo/odTZbqVhup
 SlSnUgO9mEx30UlUgwnld7lbXjWXk4Sv+qwc0=
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
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDQ6MTc6MTZQTSArMDEwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IE9uIDIwMTkvMDUvMjIsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBXZWQsIE1h
eSAyMiwgMjAxOSBhdCAwNDo0NzowMlBNICswMTAwLCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4gPiA+
IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gPiA+IAo+
ID4gPiBTaG91bGQgbWluaW1pc2UgdGhlIGNvcHkvcGFzdGUgbWlzdGFrZXMsIGZpeGVkIHdpdGgg
cHJldmlvdXMgcGF0Y2hlcy4KPiA+ID4gCj4gPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292
QGNvbGxhYm9yYS5jb20+Cj4gPiA+IC0tLQo+ID4gPiBEYW5pZWwsIG5vdCAxMDAlIHNvbGQgb24g
dGhlIGlkZWEuIFRoYXQgcGx1cyBsaXN0aW5nIHlvdSBhcyBhIGNvbnRhY3QKPiA+ID4gcG9pbnQg
Oy0pCj4gPiA+IAo+ID4gPiBXaGF0IGRvIHlvdSB0aGluZz8KPiA+ID4gRW1pbAo+ID4gPiAtLS0K
PiA+ID4gIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IHwgMTkgKysrKysrKysrKysrKysrKysr
Kwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKPiA+ID4gCj4gPiA+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1
L3RvZG8ucnN0Cj4gPiA+IGluZGV4IDY2ZjA1ZjRlNDY5Zi4uOWU2N2QxMjVmMmZkIDEwMDY0NAo+
ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+ID4gPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2dwdS90b2RvLnJzdAo+ID4gPiBAQCAtMzk3LDYgKzM5NywyNSBAQCBTb21lIG9mIHRo
ZXNlIGRhdGUgZnJvbSB0aGUgdmVyeSBpbnRyb2R1Y3Rpb24gb2YgS01TIGluIDIwMDggLi4uCj4g
PiA+ICAgIGVuZCwgZm9yIHdoaWNoIHdlIGNvdWxkIGFkZCBkcm1fKl9jbGVhbnVwX2tmcmVlKCku
IEFuZCB0aGVuIHRoZXJlJ3MgdGhlIChmb3IKPiA+ID4gICAgaGlzdG9yaWNhbCByZWFzb25zKSBt
aXNuYW1lZCBkcm1fcHJpbWFyeV9oZWxwZXJfZGVzdHJveSgpIGZ1bmN0aW9uLgo+ID4gPiAgCj4g
PiA+ICtVc2UgRFJNX0xPQ0tFRCBpbnN0ZWFkIG9mIERSTV9VTkxPQ0tFRAo+ID4gPiArLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gKwo+ID4gPiArRFJNX1VOTE9D
S0VEIGlzIGEgcmVtYWluZGVyIGZyb20gdGhlIGxlZ2FjeSBEUk0gZHJpdmVycy4gU2VlbWluZ2x5
IGRyaXZlcnMgZ2V0Cj4gPiA+ICt0cmlja2VkIGJ5IGl0IGFuZCBpdCBlbmRzIHVwIGluIHRoZSBk
cml2ZXIgcHJpdmF0ZSBpb2N0bHMuCj4gPiA+ICsKPiA+ID4gK1RvZGF5IG5vIG1vcmUgbGVnYWN5
IGRyaXZlcnMgYXJlIGFsbG93ZWQgYW5kIG1vc3QgY29yZSBEUk0gaW9jdGxzIGFyZSB1bmxvY2tl
ZC4KPiA+ID4gKwo+ID4gPiArSW50cm9kdWNlIERSTV9MT0NLRUQsIHVzZSBpdCB0byBhbm5vdGF0
ZSBvbmx5IHRoZSByZWxldmFudCBpb2N0bHMgYW5kIGtpbGwgdGhlCj4gPiA+ICtvbGQgRFJNX1VO
TE9DS0VELgo+ID4gPiArCj4gPiA+ICtQYXRjaCBzZXJpZXMgc2hvdWxkIGJlIHNwbGl0IGFzIGZv
bGxvd3M6Cj4gPiA+ICsgLSBQYXRjaCAxOiBkcm06IGFkZCB0aGUgbmV3IERSTV9MT0NLRUQgZmxh
ZyBhbmQgaG9ub3VyIGl0Cj4gPiA+ICsgLSBQYXRjaCAyOiBkcm06IGNvbnZlcnQgY29yZSBpb2N0
bHMgZnJvbSBEUk1fVU5MT0NLRUQgdG8gRFJNX0xPQ0tFRAo+ID4gPiArIC0gUGF0Y2ggMy0uLi46
IGRybS9kcml2ZXJYOiBjb252ZXJ0IGRyaXZlciBpb2N0bHMgZnJvbSAuLi4KPiA+ID4gKyAtIFBh
dGNoIFg6IGRybTogcmVtb3ZlIG5vIGxvbmdlciB1c2VkIERSTV9VTkxPQ0tFRCwgZHJvcCB0b2Rv
IGl0ZW0KPiA+IAo+ID4gU2VlbXMgbGlrZSB0b28gbXVjaCBib3RoZXIgZm9yIGxlZ2FjeSBkcml2
ZXJzIC4uLiBXaGF0IEknZCBkbyBpcyBzb21ldGhpbmcKPiA+IGEgbG90IGNoZWFwZXIsIHNpbmNl
IGFsbCB3ZSdyZSB0b3VjaGluZyBoZXJlIGFyZSBsZWdhY3kgZHJpdmVyczoKPiA+IAo+ID4gUmVt
b3ZlIERSTV9VTkxPQ0tFRCBmcm9tIGV2ZXJ5dGhpbmcgZXhjZXB0IHRoZSBvbGQgdmJsYW5rIGlv
Y3RsLiBUaGF0IG9uZQo+ID4gd2UgbmVlZCB0byBrZWVwLCBiZWNhdXNlIGl0IGZyZWV6ZXMgWDoK
PiA+IAo+ID4gY29tbWl0IDhmNGZmMmIwNmFmY2Q2ZjE1MTg2ODQ3NGE0MzJjNjAzMDU3ZWFmNTYK
PiA+IEF1dGhvcjogSWxpamEgSGFkemljIDxpaGFkemljQHJlc2VhcmNoLmJlbGwtbGFicy5jb20+
Cj4gPiBEYXRlOiAgIE1vbiBPY3QgMzEgMTc6NDY6MTggMjAxMSAtMDQwMAo+ID4gCj4gPiAgICAg
ZHJtOiBkbyBub3Qgc2xlZXAgb24gdmJsYW5rIHdoaWxlIGhvbGRpbmcgYSBtdXRleAo+ID4gCj4g
PiBBbnl0aGluZyBlbHNlIEkgdGhpbmsgaXMgZWl0aGVyIG5ldmVyIHVzZWQgYnkgbGVnYWN5IHVz
ZXJzcGFjZSwgb3IganVzdAo+ID4gZG9lc24ndCBtYXR0ZXIuIFRoYXQncyBzaW1wbGUgZW5vdWdo
IHRoYXQgSSBkb24ndCB0aGluayB3ZSByZWFsbHkgbmVlZCBhCj4gPiB0b2RvIGZvciBpdCA6LSkg
SSBndWVzcyBpZiB5b3Ugd2FudCB0byBraWxsIERSTV9VTkxPQ0tFRCB5b3UgY291bGQgcmVwbGFj
ZQo+ID4gdGhlIGNoZWNrIHdpdGggaW9jdGwtPmZ1bmMgPT0gZHJtX3ZibGFua19pb2N0bCwgb2Zj
IG9ubHkgaW4gdGhlCj4gPiBEUklWRVJfTEVHQUNZIHBhdGguCj4gPiAKPiBTb3VuZHMgbGlrZSBh
IG11Y2ggc2ltcGxlciBzb2x1dGlvbiBpbmRlZWQuIFNhZGx5IEkgZG9uJ3QgaGF2ZSBtdWNoIHRp
bWUgdG8KPiBkb3VibGUtY2hlY2sgdGhhdCB0aGlzIHdvbid0IGNhdXNlIHByb2JsZW1zIGVsc2V3
aGVyZSwgc28gSSdsbCBsZWF2ZSBpdCB0aGF0Cj4gdG8gc29tZW9uZSBlbHNlLgoKSSBkaWQgZGln
IHRocm91Z2ggZW5vdWdoIGhpc3RvcnkgdGhhdCBJJ20gY29uZmlkZW50LiBJJ2xsIHR5cGUgYSBw
YXRjaCBhbmQKc29tZSBhd2t3YXJkLWxvbmcgY29tbWl0IG1lc3NhZ2UgOi0pCi1EYW5pZWwKCj4g
Cj4gPiBPbiBwYXRjaGVzIDEtMyBpbiB5b3VyIHNlcmllczoKPiA+IAo+ID4gUmV2aWV3ZWQtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gPiAKPiBUaGFuayB5b3Ug
dmVyeSBtdWNoLgo+IAo+IC1FbWlsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
