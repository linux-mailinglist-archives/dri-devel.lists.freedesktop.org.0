Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA72829B01
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 17:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EA189E36;
	Fri, 24 May 2019 15:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75A589E36
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 15:28:10 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id i3so9807719wml.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JV+CmPGvOGsFWOO1X+nZSlB4FNMTNoe4yXs0kWlThFI=;
 b=b7ycttVL7IxeRNNsY/vCss1BTYmOwdxrcZh7luYDyrTJCPcuTtO0pUL39W6UhWLw6B
 uXWwLTF9FT9jJG/yGksj7LWV4iQkcdFDUFP1iv5H9oXocv6L6vCHOiugFBVYrwh+XPFJ
 x4bApCRsB2ATsy/1RPPc8/cOi0bdKzgfeApTtAGzpIFdgpjd5k9+uHDATtoj9NQJeaHC
 Jkpz2X7DWS7ALaPfyW76PlMnFeAoaw4GEej4CGLsLQWVzb4JcRHnavEN3SJHS9mOEvDB
 mDKfJKKVormaFPXOxf6toCsCpd7HzcglRvDlH1sMmoTpfsfnsyI6VdETg5ATVH5/bASv
 9gqg==
X-Gm-Message-State: APjAAAUCvkRghwxwPcxMdzqKrLET46bObzuQCoPR4ULHEknbIlS6NXO3
 jBXOrfBZWvmyDTxKqLg97xc=
X-Google-Smtp-Source: APXvYqy1hkCyrht+qMUuMYZDB0jkbExAwhUp0NCZScpgYjwBkhDjl4IX6uQkQBouubPaaWKjKqOIeg==
X-Received: by 2002:a1c:760f:: with SMTP id r15mr16473861wmc.134.1558711689393; 
 Fri, 24 May 2019 08:28:09 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id a5sm1955016wrt.10.2019.05.24.08.28.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 24 May 2019 08:28:08 -0700 (PDT)
Date: Fri, 24 May 2019 16:26:48 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Thomas Hellstrom <thellstrom@vmware.com>
Subject: Re: [PATCH 4/5] drm/vmwgfx: remove custom ioctl io encoding check
Message-ID: <20190524152648.GD8938@arch-x1c3>
References: <20190522164119.24139-1-emil.l.velikov@gmail.com>
 <20190522164119.24139-4-emil.l.velikov@gmail.com>
 <a2ec4b6f529ffdc6146903decec6b5ba4cab0a1d.camel@vmware.com>
 <20190524121410.GB6233@arch-x1c3>
 <280025344d8590a4d10edfd9990d26d15a983264.camel@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <280025344d8590a4d10edfd9990d26d15a983264.camel@vmware.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JV+CmPGvOGsFWOO1X+nZSlB4FNMTNoe4yXs0kWlThFI=;
 b=JtHU+r8ZQ+mZGV7UuMKjDgRRs/2n0zERfnkAqKwreC9xUEUfK7w2jpvstCCb6y0zBT
 l3eQKhdBcWOTEotv6+7C/hbhpI+xw22VVtp4Ane6m9f5Fcpk6TPR61bThbrmtMiGLWYW
 32ukqG7NdkeQPCsWh3a2XkkxjDJNnsmmRyCWAfzHgiQ5+lVk9WZGVs47FEjv2mLNeWSd
 U2sGcDoBrQjpG7VKVBmnbok064JzHC6DTfsOj8K85xo8MEDkDmQ9t+fRTMLo6UH3CtQi
 bvJQCm02eMdV7gEKueTZq4to2d4ofoi8HdyAP37zvCcNsPgvWPGhlO4+G5oyMAakahw9
 lkIg==
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
Cc: "kernel@collabora.com" <kernel@collabora.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNS8yNCwgVGhvbWFzIEhlbGxzdHJvbSB3cm90ZToKPiBPbiBGcmksIDIwMTktMDUt
MjQgYXQgMTM6MTQgKzAxMDAsIEVtaWwgVmVsaWtvdiB3cm90ZToKPiA+IE9uIDIwMTkvMDUvMjMs
IFRob21hcyBIZWxsc3Ryb20gd3JvdGU6Cj4gPiA+IEhpLCBFbWlsLAo+ID4gPiAKPiA+ID4gT24g
V2VkLCAyMDE5LTA1LTIyIGF0IDE3OjQxICswMTAwLCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4gPiA+
ID4gRnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiA+ID4g
PiAKPiA+ID4gPiBEcm9wIHRoZSBjdXN0b20gaW9jdGwgaW8gZW5jb2RpbmcgY2hlY2sgLSBjb3Jl
IGRybSBkb2VzIGl0IGZvcgo+ID4gPiA+IHVzLgo+ID4gPiAKPiA+ID4gSSBmYWlsIHRvIHNlZSB3
aGVyZSB0aGUgY29yZSBkb2VzIHRoaXMsIG9yIGRvIEkgbWlzcyBzb21ldGhpbmc/Cj4gPiAKPiA+
IGRybV9pb2N0bCgpIGFsbG93cyBmb3IgdGhlIGVuY29kaW5nIHRvIGJlIGNoYW5nZWQgYW5kIGF0
dHJpYnV0ZXMgdGhhdAo+ID4gb25seSB0aGUKPiA+IGFwcHJvcHJpYXRlIHNpemUgaXMgY29waWVk
IGluL291dCBvZiB0aGUga2VybmVsLgo+ID4gCj4gPiBUZWNobmljYWxseSB0aGUgZnVuY3Rpb24g
aXMgbW9yZSByZWxheGVkIHJlbGF0aXZlIHRvIHRoZSB2bXdnZngKPiA+IGNoZWNrLCB5ZXQKPiA+
IHNlZW1zIHBlcmZlY3RseSByZWFzb25hYmxlLgo+ID4gCj4gPiBJcyB0aGVyZSBhbnkgY29ybmVy
LWNhc2UgdGhhdCBpc24ndCBidXQgc2hvdWxkIGJlIGhhbmRsZWQgaW4KPiA+IGRybV9pb2N0bCgp
Pwo+IAo+IEknZCBsaWtlIHRvIHR1cm4gdGhlIHF1ZXN0aW9uIGFyb3VuZCBhbmQgYXNrIHdoZXRo
ZXIgdGhlcmUncyBhIHJlYXNvbgo+IHdlIHNob3VsZCByZWxheCB0aGUgdm13Z2Z4IHRlc3Q/IElu
IHRoZSBwYXN0IGl0IGhhcyB0cmFwcGVkIHF1aXRlIGEgZmV3Cj4gdXNlci1zcGFjZSBlcnJvcnMu
Cj4gClRoZSB3YXkgSSBzZWUgaXQgZWl0aGVyOgogLSB0aGUgY2hlY2ssIGFzLWlzLCBpcyB1bm5l
c3Nlc2FyeSwgb3IKIC0gaXQgaXMgbmVlZGVkLCBhbmQgd2Ugc2hvdWxkIGRvIHNvbWV0aGluZyBl
cXVpdmFsZW50IGZvciBhbGwgb2YgRFJNCgpXZSBoYWQgYSB2ZXJ5IGxvbmcgYnJhaW5zdG9ybWlu
ZyBzZXNzaW9uIHdpdGggYSBjb2xsZWFndWUgYW5kIHdlIGNvdWxkIG5vdCBzZWUKYW55IGNhc2Vz
IHdoZXJlIHRoaXMgd291bGQgY2F1c2UgYSBwcm9ibGVtLiBJZiB5b3UgcmVjYWxsIGFueXRoaW5n
IGNvbmNyZXRlCnBsZWFzZSBsZXQgbWUga25vdyAtIEkgd291bGQgYmUgbW9yZSB0aGFuIGhhcHB5
IHRvIHRha2UgYSBjbG9zZXIgbG9vay4KClRoYW5rcwpFbWlsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
