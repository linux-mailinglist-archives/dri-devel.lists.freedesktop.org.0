Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB8AE008E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 11:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CCF6E4B6;
	Tue, 22 Oct 2019 09:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175C16E4B6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 09:19:30 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r19so16344610wmh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 02:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=r4xbJW3grSnf4M8N0nCJmNaFSFrCKReYewNpwqEWw1I=;
 b=LdZCXimFKWBrP5nuyxLN90czLN6cMaoxvtLKwNw8ejzLyjOTYdWN2PpPBczc5HlbN9
 fm7vcp25gGE9EYqIb5Zc3wwic+VpYitEJC5DmEXxZT+j8mZ6eb1bAbVDXKFnnB/BrbEw
 /meQOObg9AeY3LUrnA4wR1m65/q+IGyJhbLwLYBRL1b+PYKBpHEZ5gNFxNV2gIhSH9yQ
 UyoUJaJcmRH1F+FydwFjCQFeOfWEyaqr07wv4Gx3wOL+7UEzh/G02XKFpM/jYrIfGI9o
 Hdf+Aw3tEMoeIvy+Kt/fVWDMRkVJvDNXglbau1nxClFAaDHQxt8j789v8dvnNmE2xiC8
 ZCNA==
X-Gm-Message-State: APjAAAXP0+hZwS8Y5NMXWnywSJ2wFuQsY48fqD3v7+3b1s0YsZ5Qx9RQ
 OnevKXO92aWfypmr0D/lMwY6zA==
X-Google-Smtp-Source: APXvYqz+BA4HFcNcao9aMxDu/3IGW/iUzAxv2dFWU7p6o7dSEVbaGXZxewrvEiq0K5iQ35jC0VObig==
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr1953407wml.69.1571735968600; 
 Tue, 22 Oct 2019 02:19:28 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id a4sm17019422wmm.10.2019.10.22.02.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 02:19:27 -0700 (PDT)
Date: Tue, 22 Oct 2019 11:19:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [Outreachy kernel] [PATCH] drm: remove unnecessary return variable
Message-ID: <20191022091925.GD11828@phenom.ffwll.local>
Mail-Followup-To: Julia Lawall <julia.lawall@lip6.fr>,
 Wambui Karuga <wambui@karuga.xyz>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, airlied@linux.ie, sean@poorly.run,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 outreachy-kernel@googlegroups.com,
 Wambui Karuga <wambui.karugax@gmail.com>
References: <20191019071840.16877-1-wambui@karuga.xyz>
 <alpine.DEB.2.21.1910192102410.5888@hadrien>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1910192102410.5888@hadrien>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=r4xbJW3grSnf4M8N0nCJmNaFSFrCKReYewNpwqEWw1I=;
 b=FGtqiS090+TGQJD//gAwTtX63ZcmUhqxCYUaSFDoCb3SG+hfsQ9BXYvIbAERWpV26E
 nvExslmfOp0xqb3UqiZUKTt6ZSazb5UOFbbRjLRGwF6wSP8CUZtMhsDdovh16u6N1Zqq
 tZH+AlYUfkMvQfCtL+XfwoYcRRTylo6Xi42JE=
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
Cc: airlied@linux.ie, Wambui Karuga <wambui@karuga.xyz>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 outreachy-kernel@googlegroups.com, sean@poorly.run,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBPY3QgMTksIDIwMTkgYXQgMDk6MDQ6MzFQTSArMDIwMCwgSnVsaWEgTGF3YWxsIHdy
b3RlOgo+IAo+IAo+IE9uIFNhdCwgMTkgT2N0IDIwMTksIFdhbWJ1aSBLYXJ1Z2Egd3JvdGU6Cj4g
Cj4gPiBGcm9tOiBXYW1idWkgS2FydWdhIDx3YW1idWkua2FydWdheEBnbWFpbC5jb20+Cj4gPgo+
ID4gUmVtb3ZlIHVubmVjZXNzYXJ5IHZhcmlhYmxlIGByZXRgIGluIGRybV9kcF9hdG9taWNfZmlu
ZF92Y3BpX3Nsb3RzKCkKPiA+IG9ubHkgdXNlZCB0byBob2xkIHRoZSBmdW5jdGlvbiByZXR1cm4g
dmFsdWUgYW5kIGhhdmUgdGhlIGZ1bmN0aW9uCj4gPiByZXR1cm4gdGhlIHZhbHVlIGRpcmVjdGx5
Lgo+IAo+IFRoaXMgcGF0Y2ggYXBwbGllcyBmb3IgbWUsIGJ1dCB3aXRoIGEgaHVnZSBvZmZzZXQu
ICBXaGF0IHRyZWUgYXJlIHlvdQo+IHVzaW5nPwoKRm9yIGRybSBwYXRjaGVzIGJlc3QgcHJhY3Rp
Y2VzIGlzIHRvIGJhc2UgcGF0Y2hlcyBlaXRoZXIgb24gbGludXgtbmV4dCBvcgp0aGUgZHJtLXRp
cCB0cmVlIHdlIGhhdmUgaGVyZToKCmh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtLXRp
cAoKZHJtIG1vdmVzIHF1aWNrbHksIHNvIG5lZWQgdG8gYmUgb24gdG9wIG9mIHRoZSBsYXRlc3Qg
dmVyc2lvbi4KCj4gQWxzbywgR3JlZyB3b24ndCBhcHBseSB0aGlzLCBiZWNhdXNlIGl0J3Mgbm90
IHRhcmdldGluZyBzdGFnaW5nLiAgSXMgdGhpcwo+IGZvciBhIHNwZWNpZmljIG91dHJlYWNoeSBw
cm9qZWN0PwoKWXVwIGl0J3MgZm9yIGRyaS1kZXZlbCwganVzdCBhcHBsaWVkIGl0LgoKVGhhbmtz
IGZvciB0aGUgcGF0Y2gsIG5pY2UgY2xlYW51cCEKCkNoZWVycywgRGFuaWVsCgo+IAo+IGp1bGlh
Cj4gCj4gCj4gPiBJc3N1ZSBmb3VuZCBieSBjb2NjaW5lbGxlOgo+ID4gQEAKPiA+IGxvY2FsIGlk
ZXhwcmVzc2lvbiByZXQ7Cj4gPiBleHByZXNzaW9uIGU7Cj4gPiBAQAo+ID4KPiA+IC1yZXQgPQo+
ID4gK3JldHVybgo+ID4gICAgICBlOwo+ID4gLXJldHVybiByZXQ7Cj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogV2FtYnVpIEthcnVnYSA8d2FtYnVpLmthcnVnYXhAZ21haWwuY29tPgo+ID4gLS0tCj4g
PiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDUgKystLS0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ID4gaW5kZXggOWNjY2M1ZTYzMzA5Li5i
ODU0YTQyMmE1MjMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
Cj4gPiBAQCAtMzU0MCw3ICszNTQwLDcgQEAgaW50IGRybV9kcF9hdG9taWNfZmluZF92Y3BpX3Ns
b3RzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKPiA+ICB7Cj4gPiAgCXN0cnVjdCBk
cm1fZHBfbXN0X3RvcG9sb2d5X3N0YXRlICp0b3BvbG9neV9zdGF0ZTsKPiA+ICAJc3RydWN0IGRy
bV9kcF92Y3BpX2FsbG9jYXRpb24gKnBvcywgKnZjcGkgPSBOVUxMOwo+ID4gLQlpbnQgcHJldl9z
bG90cywgcmVxX3Nsb3RzLCByZXQ7Cj4gPiArCWludCBwcmV2X3Nsb3RzLCByZXFfc2xvdHM7Cj4g
Pgo+ID4gIAl0b3BvbG9neV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X21zdF90b3BvbG9neV9zdGF0
ZShzdGF0ZSwgbWdyKTsKPiA+ICAJaWYgKElTX0VSUih0b3BvbG9neV9zdGF0ZSkpCj4gPiBAQCAt
MzU4Nyw4ICszNTg3LDcgQEAgaW50IGRybV9kcF9hdG9taWNfZmluZF92Y3BpX3Nsb3RzKHN0cnVj
dCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKPiA+ICAJfQo+ID4gIAl2Y3BpLT52Y3BpID0gcmVx
X3Nsb3RzOwo+ID4KPiA+IC0JcmV0ID0gcmVxX3Nsb3RzOwo+ID4gLQlyZXR1cm4gcmV0Owo+ID4g
KwlyZXR1cm4gcmVxX3Nsb3RzOwo+ID4gIH0KPiA+ICBFWFBPUlRfU1lNQk9MKGRybV9kcF9hdG9t
aWNfZmluZF92Y3BpX3Nsb3RzKTsKPiA+Cj4gPiAtLQo+ID4gMi4yMy4wCj4gPgo+ID4gLS0KPiA+
IFlvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmliZWQgdG8g
dGhlIEdvb2dsZSBHcm91cHMgIm91dHJlYWNoeS1rZXJuZWwiIGdyb3VwLgo+ID4gVG8gdW5zdWJz
Y3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwg
c2VuZCBhbiBlbWFpbCB0byBvdXRyZWFjaHkta2VybmVsK3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb20uCj4gPiBUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IGh0dHBz
Oi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9vdXRyZWFjaHkta2VybmVsLzIwMTkxMDE5MDcx
ODQwLjE2ODc3LTEtd2FtYnVpJTQwa2FydWdhLnh5ei4KPiA+CgotLSAKRGFuaWVsIFZldHRlcgpT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
