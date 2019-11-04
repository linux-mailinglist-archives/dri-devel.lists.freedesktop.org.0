Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E7CEE6E8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 19:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3D36E7D5;
	Mon,  4 Nov 2019 18:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFABD6E7D5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 18:06:32 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f2so9290304wrs.11
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 10:06:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=9dTelUObSz4Vp1pDppKby4L2YiUNwABknpxOezqJg24=;
 b=glgTMpMB4ppdl5EAj0XA1foudU8kyGQ8YcMBVRTkfbSJs48dw+J01nGQpAgCisPDN4
 4vvtF8BMTd1LPvIB1erhV4HJmnXuGNiBfGPriw7J/m5K760NqdKsEcI5xdwPBa+Z2t0c
 XxQ25urhmVKY8Y8Yh3Iz+DxZ0Wz7y7zt7PaVdKhivJKlM8rRYriYVZNefR1p0JUFmAd/
 uf2le3BcXRqNEpzUSOR2mRQ+VOD/1Ev5wdKk+nEVMyRo6OZ875VqZZo278exgERN58RA
 JgmdPk3BYzMbRkK4k0GfuV/2hmy5tqGEuX2jSzkfEy1nCgYOty8HAG49yvdLWFMrBYcS
 cd9g==
X-Gm-Message-State: APjAAAUbwDatRZVSzf09bxVO24gIYVTje+ngDlarmChCmHT/DOZkYVyt
 Ampw1ows7D2ZfiN0MR5SbExzIwBLeCE=
X-Google-Smtp-Source: APXvYqyNZmKBDumJ4J2e9yspvSi5TokRUxL5VWgSulQPZ+OyhRhbR3GVomtZXrIxsNuDmoOp32nK+A==
X-Received: by 2002:a5d:4584:: with SMTP id p4mr6388786wrq.345.1572890791331; 
 Mon, 04 Nov 2019 10:06:31 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id s10sm17945304wrr.5.2019.11.04.10.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 10:06:30 -0800 (PST)
Date: Mon, 4 Nov 2019 19:06:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Leandro Ribeiro <leandrohr@riseup.net>
Subject: Re: [PATCH] drm/doc: Update IGT documentation
Message-ID: <20191104180628.GO10326@phenom.ffwll.local>
References: <20191030011211.47942-1-leandrohr@riseup.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030011211.47942-1-leandrohr@riseup.net>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9dTelUObSz4Vp1pDppKby4L2YiUNwABknpxOezqJg24=;
 b=DmhQSP/D500XfTW5FjbWokVQBd8RJNk8ZrP+TC1AVIsCsWzuNPeF2x+bJriolRoFhz
 ysZcDyyF+MV22b1N8f6oNTDsVibAXpqu7v0F/HvzfzuNt2jDJ2fHMZuSa43RlViZRiyq
 kTS+EVzZFKNBzaZc9e7Mscn2ZbA6UPxAu86Gw=
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
Cc: airlied@linux.ie, lkcamp@lists.libreplanetbr.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMTA6MTI6MTFQTSAtMDMwMCwgTGVhbmRybyBSaWJlaXJv
IHdyb3RlOgo+IFRoZSBJR1QgZG9jdW1lbnRhdGlvbiBpbiB0aGlzIHBhZ2UgaXMgdGVsbGluZyB1
cyB0byBidWlsZCBpdCB1c2luZwo+IG1ha2UuIEFjY29yZGluZyB0byBjb21taXQgNjc5OTNjMSAo
ImF1dG9tYWtlOiBQb2ludCBidWlsZGVycyBhdAo+IG1lc29uIikgZnJvbSB0aGUgSUdUIHByb2pl
Y3QsIHRoaXMgaXMgZGVwcmVjYXRlZCBhbmQgSUdUIHNob3VsZCBiZQo+IGJ1aWx0IHdpdGggbWVz
b24uIEluc3RlYWQgb2YgaGF2aW5nIGEgZG9jdW1lbnRhdGlvbiBmb3IgSUdUIGluIHRoaXMKPiBw
YWdlLCBwb2ludCB0byB0aGVpciBHaXRMYWIgUkVBRE1FLCB3aGljaCBzaG91bGQgYWx3YXlzIGJl
IHVwIHRvCj4gZGF0ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMZWFuZHJvIFJpYmVpcm8gPGxlYW5k
cm9ockByaXNldXAubmV0PgoKVWgsIGRvY3MganVzdCBkb24ndCBhZ2Ugd2VsbCA6LSgKClRoYW5r
cyBmb3IgeW91ciBwYXRjaCwgYXBwbGllZC4KLURhbmllbAoKPiAtLS0KPiAgRG9jdW1lbnRhdGlv
bi9ncHUvZHJtLXVhcGkucnN0IHwgMzIgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L2RybS11YXBpLnJzdCBiL0RvY3VtZW50YXRp
b24vZ3B1L2RybS11YXBpLnJzdAo+IGluZGV4IDk0ZjkwNTIxZjU4Yy4uOTk2ZjczNTRlMDVjIDEw
MDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L2RybS11YXBpLnJzdAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZ3B1L2RybS11YXBpLnJzdAo+IEBAIC0yNTQsMzYgKzI1NCw4IEBAIFZhbGlkYXRp
bmcgY2hhbmdlcyB3aXRoIElHVAo+ICBUaGVyZSdzIGEgY29sbGVjdGlvbiBvZiB0ZXN0cyB0aGF0
IGFpbXMgdG8gY292ZXIgdGhlIHdob2xlIGZ1bmN0aW9uYWxpdHkgb2YKPiAgRFJNIGRyaXZlcnMg
YW5kIHRoYXQgY2FuIGJlIHVzZWQgdG8gY2hlY2sgdGhhdCBjaGFuZ2VzIHRvIERSTSBkcml2ZXJz
IG9yIHRoZQo+ICBjb3JlIGRvbid0IHJlZ3Jlc3MgZXhpc3RpbmcgZnVuY3Rpb25hbGl0eS4gVGhp
cyB0ZXN0IHN1aXRlIGlzIGNhbGxlZCBJR1QgYW5kCj4gLWl0cyBjb2RlIGNhbiBiZSBmb3VuZCBp
biBodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzLy4KPiAtCj4g
LVRvIGJ1aWxkIElHVCwgc3RhcnQgYnkgaW5zdGFsbGluZyBpdHMgYnVpbGQgZGVwZW5kZW5jaWVz
LiBJbiBEZWJpYW4tYmFzZWQKPiAtc3lzdGVtczo6Cj4gLQo+IC0JIyBhcHQtZ2V0IGJ1aWxkLWRl
cCBpbnRlbC1ncHUtdG9vbHMKPiAtCj4gLUFuZCBpbiBGZWRvcmEtYmFzZWQgc3lzdGVtczo6Cj4g
LQo+IC0JIyBkbmYgYnVpbGRkZXAgaW50ZWwtZ3B1LXRvb2xzCj4gLQo+IC1UaGVuIGNsb25lIHRo
ZSByZXBvc2l0b3J5OjoKPiAtCj4gLQkkIGdpdCBjbG9uZSBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNr
dG9wLm9yZy9kcm0vaWd0LWdwdS10b29scwo+IC0KPiAtQ29uZmlndXJlIHRoZSBidWlsZCBzeXN0
ZW0gYW5kIHN0YXJ0IHRoZSBidWlsZDo6Cj4gLQo+IC0JJCBjZCBpZ3QtZ3B1LXRvb2xzICYmIC4v
YXV0b2dlbi5zaCAmJiBtYWtlIC1qNgo+IC0KPiAtRG93bmxvYWQgdGhlIHBpZ2xpdCBkZXBlbmRl
bmN5OjoKPiAtCj4gLQkkIC4vc2NyaXB0cy9ydW4tdGVzdHMuc2ggLWQKPiAtCj4gLUFuZCBydW4g
dGhlIHRlc3RzOjoKPiAtCj4gLQkkIC4vc2NyaXB0cy9ydW4tdGVzdHMuc2ggLXQga21zIC10IGNv
cmUgLXMKPiAtCj4gLXJ1bi10ZXN0cy5zaCBpcyBhIHdyYXBwZXIgYXJvdW5kIHBpZ2xpdCB0aGF0
IHdpbGwgZXhlY3V0ZSB0aGUgdGVzdHMgbWF0Y2hpbmcKPiAtdGhlIC10IG9wdGlvbnMuIEEgcmVw
b3J0IGluIEhUTUwgZm9ybWF0IHdpbGwgYmUgYXZhaWxhYmxlIGluCj4gLS4vcmVzdWx0cy9odG1s
L2luZGV4Lmh0bWwuIFJlc3VsdHMgY2FuIGJlIGNvbXBhcmVkIHdpdGggcGlnbGl0Lgo+ICtpdHMg
Y29kZSBhbmQgaW5zdHJ1Y3Rpb25zIHRvIGJ1aWxkIGFuZCBydW4gY2FuIGJlIGZvdW5kIGluCj4g
K2h0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy8uCj4gIAo+
ICBEaXNwbGF5IENSQyBTdXBwb3J0Cj4gIC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAtLSAKPiAyLjIz
LjAKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
