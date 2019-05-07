Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA69158D1
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 07:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3888489CAA;
	Tue,  7 May 2019 05:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035BA89CAA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 05:15:26 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id o189so7661727wmb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 22:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jyJqLdaGHg9KctUawfoQkCPGyLuFJ20fSW5bMYGxiUk=;
 b=OW4YkUCDi6kLedLcGoNE/E31ONkTZAFab2mVPs1aHUVIPhhduDES/2NAEykAy6LnBM
 NIYmTTh5Ic7QYJaRwKzCOx6/ksI0OqevYYtlqZL6uK5qKPkwR0yWJg/Q5caxwJ3mKr2o
 /rsT/UDPFCz6MGTj8ElbHxoEmLvkdLnQ6yFBf8gFhm1aigmdK1MGJYIxxMBf4NbrJ1Z5
 LDX/PzOZLu86dwr2SGG+0XRclGGvmXL0zydWqMkfBnXur/F1LPn2ggfietX4E5k4ThVN
 0vVU69ix68ONMF/hePhaGgopcKzugZfjSJEYQAAE60nr4/YsOlX/X0l2Cw8lSFfwHmO9
 UjxA==
X-Gm-Message-State: APjAAAXnBRXJSXQxtNybj8MOmEMDV29gaWaqrBm7+7WIsyecc5dTorLH
 0hypOTg9CdnuU7pm4/Ts21UrzHW1u+NTR49jvGQ=
X-Google-Smtp-Source: APXvYqxM41dZQ+arO2sRwzAISq2tqPW84PwjBdaBOnqW0dRp0jHvgMUf45te4KPT5jRgCQlgb92wM8o11s5OF079FI4=
X-Received: by 2002:a1c:6c04:: with SMTP id h4mr19424061wmc.135.1557206124698; 
 Mon, 06 May 2019 22:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190418060157.18968-1-mario.kleiner.de@gmail.com>
 <cc16f733-3d4c-7d91-c63a-3958f8e342c4@amd.com>
In-Reply-To: <cc16f733-3d4c-7d91-c63a-3958f8e342c4@amd.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Tue, 7 May 2019 07:15:12 +0200
Message-ID: <CAEsyxygPictN2=ms=16tZsx0vq8kr5Mg43iAE9iGJw5u-3B9vg@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix timestamp docs for variable refresh properties.
To: Dave Airlie <airlied@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=jyJqLdaGHg9KctUawfoQkCPGyLuFJ20fSW5bMYGxiUk=;
 b=I1bctnbHTt86+mWI9BNLhC9BorgPpAm5j+yRZS9ZZwUdoSYPLrF4qi9JCg/YD/Jl9S
 BKepBxudo8VNJcR6T0OyaYsHLQg1ihQObP5LndI9GpIpOkapKT6U/Vu66kE7ijkHLDp7
 zvtoWBVebOgejRk3h4yDsZAvsZo6qdcSDkbr5/QcFOf7e98opZ/QhmiCaEfiOOaVtCcI
 0ziqwMfn/vYA+QbWvt3wvQ9IstT0yr00pn0I+p6rePge2PqW4HadiD+ECgFETzJ/lyDz
 RCr0fwpVQwUYDk0LZjJ+Yjo/LmYzzjjDtOZFi7JeGV91YFhxIU5iAsaq48ctZ71G2l28
 u/+Q==
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmFnIG5hZzogVGhlIGJlbG93IGRvY3VtZW50YXRpb24gcGF0Y2gsIGFja2VkLWJ5IERhbmllbCBh
bmQgci1iJ2QgYnkKTmljaG9sYXMgc2VlbXMgdG8gbm90IGhhdmUgbWFkZSBpdCBpbnRvIGRybS1u
ZXh0IHlldD8KCnRoYW5rcywKLW1hcmlvCgpPbiBUaHUsIEFwciAxOCwgMjAxOSBhdCAyOjQ1IFBN
IEthemxhdXNrYXMsIE5pY2hvbGFzCjxOaWNob2xhcy5LYXpsYXVza2FzQGFtZC5jb20+IHdyb3Rl
Ogo+Cj4gT24gNC8xOC8xOSAyOjAxIEFNLCBNYXJpbyBLbGVpbmVyIHdyb3RlOgo+ID4gQXMgZGlz
Y3Vzc2VkIHdpdGggTmljaG9sYXMgYW5kIERhbmllbCBWZXR0ZXIgKHBhdGNod29yawo+ID4gbGlu
ayB0byBkaXNjdXNzaW9uIGJlbG93KSwgdGhlIFZSUiB0aW1lc3RhbXBpbmcgYmVoYXZpb3VyCj4g
PiBwcm9kdWNlZCB1dHRlcmx5IHVzZWxlc3MgYW5kIGJvZ3VzIHZibGFuay9wYWdlZmxpcAo+ID4g
dGltZXN0YW1wcy4gV2UgaGF2ZSBmb3VuZCBhIHdheSB0byBmaXggdGhpcyBhbmQgcHJvdmlkZQo+
ID4gc2FuZSBiZWhhdmlvdXIuCj4gPgo+ID4gQXMgb2YgTGludXggNS4yLCB0aGUgYW1kZ3B1IGRy
aXZlciB3aWxsIGJlIGFibGUgdG8KPiA+IHByb3ZpZGUgZXhhY3RseSB0aGUgc2FtZSB2Ymxhbmsg
LyBwYWdlZmxpcCB0aW1lc3RhbXAKPiA+IHNlbWFudGljIGluIHZhcmlhYmxlIHJlZnJlc2ggcmF0
ZSBtb2RlIGFzIGluIHN0YW5kYXJkCj4gPiBmaXhlZCByZWZyZXNoIHJhdGUgbW9kZS4gVGhpcyBp
cyBhY2hpZXZlZCBieSBkZWZlcnJpbmcKPiA+IGNvcmUgdmJsYW5rIGhhbmRsaW5nIChkcm1fY3J0
Y19oYW5kbGVfdmJsYW5rKCkpIHVudGlsCj4gPiB0aGUgZW5kIG9mIGZyb250IHBvcmNoLCBhbmQg
YWxzbyBkZWZlciB0aGUgc2VuZGluZyBvZgo+ID4gcGFnZWZsaXAgY29tcGxldGlvbiBldmVudHMg
dW50aWwgZW5kIG9mIGZyb250IHBvcmNoLAo+ID4gd2hlbiB3ZSBjYW4gc2FmZWx5IGNvbXB1dGUg
Y29ycmVjdCBwYWdlZmxpcC92YmxhbmsKPiA+IHRpbWVzdGFtcHMuCj4gPgo+ID4gVGhlIHNhbWUg
YXBwcm9hY2ggd2lsbCBiZSBwb3NzaWJsZSBmb3Igb3RoZXIgVlJSCj4gPiBjYXBhYmxlIGttcyBk
cml2ZXJzLCBzbyB3ZSBjYW4gYWN0dWFsbHkgaGF2ZSBzYW5lCj4gPiBhbmQgdXNlZnVsIHRpbWVz
dGFtcHMgaW4gVlJSIG1vZGUuCj4gPgo+ID4gVGhpcyBwYXRjaCByZW1vdmVzIHRoZSBzZWN0aW9u
IG9mIHRoZSBkb2NzIHRoYXQKPiA+IGRlc2NyaWJlcyB0aGUgYnJva2VuIHRpbWVzdGFtcCBiZWhh
dmlvdXIgcHJlc2VudAo+ID4gaW4gTGludXggNS4wLzUuMS4KPiA+Cj4gPiBGaXhlczogYWI3YTY2
NGY3YTJkICgiZHJtOiBEb2N1bWVudCB2YXJpYWJsZSByZWZyZXNoIHByb3BlcnRpZXMiKQo+ID4g
TGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzI4NTMzMy8KPiA+
IFNpZ25lZC1vZmYtYnk6IE1hcmlvIEtsZWluZXIgPG1hcmlvLmtsZWluZXIuZGVAZ21haWwuY29t
Pgo+Cj4gUmV2aWV3ZWQtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNr
YXNAYW1kLmNvbT4KPgo+IFNvbWVvbmUgZWxzZSBjYW4gZmVlbCBmcmVlIHRvIHB1c2ggdGhpcyBh
cyBJIGRvbid0IGhhdmUgY29tbWl0IHJpZ2h0cwo+IGZvciBEUk0uCj4KPiBUaGFua3MhCj4KPiBO
aWNob2xhcyBLYXpsYXVza2FzCj4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nv
bm5lY3Rvci5jIHwgNiAtLS0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCj4gPiBpbmRleCAyMzU1MTI0ODQ5ZGIuLmIz
NGMzZDM4YmYxNSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9y
LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKPiA+IEBAIC0xNDE2
LDEyICsxNDE2LDYgQEAgRVhQT1JUX1NZTUJPTChkcm1fbW9kZV9jcmVhdGVfc2NhbGluZ19tb2Rl
X3Byb3BlcnR5KTsKPiA+ICAgICoKPiA+ICAgICogIFRoZSBkcml2ZXIgbWF5IHBsYWNlIGZ1cnRo
ZXIgcmVzdHJpY3Rpb25zIHdpdGhpbiB0aGVzZSBtaW5pbXVtCj4gPiAgICAqICBhbmQgbWF4aW11
bSBib3VuZHMuCj4gPiAtICoKPiA+IC0gKiAgIFRoZSBzZW1hbnRpY3MgZm9yIHRoZSB2ZXJ0aWNh
bCBibGFuayB0aW1lc3RhbXAgZGlmZmVyIHdoZW4KPiA+IC0gKiAgIHZhcmlhYmxlIHJlZnJlc2gg
cmF0ZSBpcyBhY3RpdmUuIFRoZSB2ZXJ0aWNhbCBibGFuayB0aW1lc3RhbXAKPiA+IC0gKiAgIGlz
IGRlZmluZWQgdG8gYmUgYW4gZXN0aW1hdGUgdXNpbmcgdGhlIGN1cnJlbnQgbW9kZSdzIGZpeGVk
Cj4gPiAtICogICByZWZyZXNoIHJhdGUgdGltaW5ncy4gVGhlIHNlbWFudGljcyBmb3IgdGhlIHBh
Z2UtZmxpcCBldmVudAo+ID4gLSAqICAgdGltZXN0YW1wIHJlbWFpbiB0aGUgc2FtZS4KPiA+ICAg
ICovCj4gPgo+ID4gICAvKioKPiA+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
