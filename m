Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6773886142
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 13:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4459D6E48E;
	Thu,  8 Aug 2019 11:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60C96E48E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 11:58:12 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z51so2996604edz.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 04:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=mhO+hgPBV+VLoBe4FkLMr7mrrkAfMlf4RoVKrIDPI8U=;
 b=cyQHIRlsNaQtQb5vjaDYesC9kvTBM5pmgYRMnSMW4A0QCMKTm/iEOoTwWgvvzMErVx
 wjapjpad3OG0iEAksPDK1Df30CteYzBFT7obmME4WZWizayixAC2fjPQjubZDPTCpsxb
 UUpMIKZ/DdQcm2ca8pHnt+fqDzh83WVHhZyqCF4TKh8np81u02lOw8ANqqfqAM+91jXV
 TRFahWj3ZmwyRZK9bXq6WpP7a3/855kCo903fZkeq/N/LNR1yNrnfRvA/d6/i8lQpIB0
 JLC4Qem9hNFTUIffsb/BoHAN6vOgmH/IHh8+E783oNx7mucRJhdLh1HInUkuEUSb62jJ
 bsMA==
X-Gm-Message-State: APjAAAWDU7bNbYqEszPSTMryrgmbDZoaFFm/omnVydHqZN2vqzXn339B
 tt9YGl50tR1KlnMhPWcpCIFGkQ==
X-Google-Smtp-Source: APXvYqw9uraKM7qWqZW0Dg09fB6Nm02V7GB56xhaxehSuiymr4qKYwchHDPZ5RvXrNR5LEVxCZukiQ==
X-Received: by 2002:a17:906:ccc3:: with SMTP id
 ot3mr13167350ejb.113.1565265491478; 
 Thu, 08 Aug 2019 04:58:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id d12sm21361343edp.16.2019.08.08.04.58.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 04:58:10 -0700 (PDT)
Date: Thu, 8 Aug 2019 13:58:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/2] drm: add cache support for arm64
Message-ID: <20190808115808.GN7444@phenom.ffwll.local>
Mail-Followup-To: Christoph Hellwig <hch@lst.de>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20190805211451.20176-1-robdclark@gmail.com>
 <20190806084821.GA17129@lst.de>
 <CAJs_Fx6eh1w7c=crMoD5XyEOMzP6orLhqUewErE51cPGYmObBQ@mail.gmail.com>
 <20190806155044.GC25050@lst.de>
 <CAJs_Fx6uztwDy2PqRy3Tc9p12k8r_ovS2tAcsMV6HqnAp=Ggug@mail.gmail.com>
 <20190807062545.GF6627@lst.de>
 <CAKMK7uH1O3q8VUftikipGH6ACPoT-8tbV1Zwo-8WL=wUHiqsoQ@mail.gmail.com>
 <20190808095506.GA32621@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808095506.GA32621@lst.de>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=mhO+hgPBV+VLoBe4FkLMr7mrrkAfMlf4RoVKrIDPI8U=;
 b=RtAidmmqIIva4EOO0Ms7+a5chcAGS7/yKnSnvq39J/g3vx0a+JVWFjbQb+KC211qET
 loJwSr4SQzfx6oDGn37n+bXY3zmhi4MoYZmqdkOMwoDDYZqyyWd+XO5simV3pT/raCp2
 F90mSqfkHi4PKIqiR/ORYKx+1b/TTuD7ygW1Q=
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
Cc: Rob Clark <robdclark@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMTE6NTU6MDZBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMTA6NDg6NTZBTSArMDIwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiA+ID4gICAgb3RoZXIgZHJtIGRyaXZlcnMgaG93IGRvIHRoZXkg
Z3VhcmFudGVlIGFkZHJlc3NhYmlsaXR5IHdpdGhvdXQgYW4KPiA+ID4gICAgaW9tbXU/KQo+ID4g
Cj4gPiBXZSB1c2Ugc2htZW0gdG8gZ2V0IGF0IHN3YXBwYWJsZSBwYWdlcy4gV2UgZ2VuZXJhbGx5
IGp1c3QgYXNzdW1lIHRoYXQKPiA+IHRoZSBncHUgY2FuIGdldCBhdCB0aG9zZSBwYWdlcywgYnV0
IHRoaW5ncyBmYWxsIGFwYXJ0IGluIGZ1biB3YXlzOgo+ID4gLSBzb21lIHNldHVwcyBzb21laG93
IGluamVjdCBib3VuY2UgYnVmZmVycy4gU29tZSBkcml2ZXJzIGp1c3QgZ2l2ZQo+ID4gdXAsIG90
aGVycyB0cnkgdG8gYWxsb2NhdGUgYSBwb29sIG9mIHBhZ2VzIHdpdGggZG1hX2FsbG9jX2NvaGVy
ZW50Lgo+ID4gLSBzb21lIGRldmljZXMgYXJlIG1pc2Rlc2lnbmVkIGFuZCBjYW4ndCBhY2Nlc3Mg
YXMgbXVjaCBhcyB0aGUgY3B1LiBXZQo+ID4gYWxsb2NhdGUgdXNpbmcgR0ZQX0RNQTMyIHRvIGZp
eCB0aGF0Lgo+IAo+IFdlbGwsIGZvciBzaG1lbSB5b3UgY2FuJ3QgcmVhbGx5IGNhbGwgYWxsb2Nh
dG9ycyBkaXJlY3RseSwgcmlnaHQ/CgpXZSBjYW4gcGFzcyBnZnAgZmxhZ3MgdG8gc2htZW1fcmVh
ZF9tYXBwaW5nX3BhZ2VfZ2ZwLCB3aGljaCBpcyBqdXN0IGFib3V0CmVub3VnaCBmb3IgdGhlIDIg
Y2FzZXMgb24gaW50ZWwgcGxhdGZvcm1zIHdoZXJlIHRoZSBncHUgY2FuIG9ubHkgYWNjZXNzCjRH
LCBidXQgdGhlIGNwdSBoYXMgd2F5IG1vcmUuCgo+IE9uZSB0aGluZyBJIGhhdmUgaW4gbXkgcGlw
ZWxpbmUgaXMgYSBkbWFfYWxsb2NfcGFnZXMgQVBJIHRoYXQgYWxsb2NhdGVzCj4gcGFnZXMgdGhh
dCBhcmUgZ3VhcmFudGVlZCB0byBiZSBhZGRyZXNzYWJseSBieSB0aGUgZGV2aWNlIG9yIG90aGVy
d2lzZQo+IGZhaWwuICBCdXQgdGhhdCBkb2Vzbid0IHJlYWxseSBoZWxwIHdpdGggdGhlIHNobWVt
IGZzLgoKWWVhaCwgdGhlIG90aGVyIGRyaXZlcnMgd2hlcmUgdGhlIHNobWVtIGdmcCB0cmljayBk
b2Vzbid0IHdvcmsgY29weQpiYWNrJmZvcnRoIGJldHdlZW4gdGhlIGRtYS1hYmxlIHBhZ2VzIGFu
ZCB0aGUgc2htZW0gc3dhcHBhYmxlIHBhZ2VzIGFzCm5lZWRlZCBpbiB0aGVpciBzaHJpbmtlci9h
bGxvY2F0aW9uIGNvZGUuIEkgZ3Vlc3MgaWRlYWwgd291bGQgYmUgaWYgd2UKY291bGQgZnVzZSB0
aGUgY3VzdG9tIGFsbG9jYXRvciBzb21laG93IGRpcmVjdGx5IGludG8gc2htZW0uCgpPdG9oIG9u
Y2UgeW91IHN0YXJ0IHRocmFzaGluZyBiZXlvbmQgc3lzdGVtIG1lbW9yeSBmb3IgZ2Z4IHdvcmts
b2FkcyBpdCdzCnByZXR0eSBob3BlbGVzcyBhbnl3YXksIGFuZCBzcGVlZCBkb2Vzbid0IHJlYWxs
eSBtYXR0ZXIgYW55bW9yZS4KCj4gPiBBbHNvIG1vZGVybiBncHUgYXBpcyBwcmV0dHkgbXVjaCBh
c3N1bWUgeW91IGNhbiBtYWxsb2MoKSBhbmQgdGhlbiB1c2UKPiA+IHRoYXQgZGlyZWN0bHkgd2l0
aCB0aGUgZ3B1Lgo+IAo+IFdoaWNoIGlzIGZpbmUgYXMgbG9uZyBhcyB0aGUgR1BVIGl0c2VsZiBz
dXBwb3J0cyBmdWxsIDY0LWJpdCBhZGRyZXNzaW5nCj4gKG9yIGFsd2F5cyBzaXRzIGJlaGluZCBh
biBpb21tdSksIGFuZCB0aGUgcGxhdGZvcm0gZG9lc24ndCBpbXBvc2UKPiBhZGRyZXNzaW5nIGxp
bWl0LCB3aGljaCB1bmZvcnR1bmF0ZWx5IHNvbWUgdGhhdCBhcmUgc2hpcHBlZCByaWdodCBub3cK
PiBzdGlsbCBkbyA6KAoKWWVzLCB0aGUgdXNlcnNwYWNlIGFwaSBwZW9wbGUgaW4ga2hyb25vcyBh
cmUgb2NjYXNpb25hbGx5IGEgYml0IG9wdGltaXN0aWMKOi0pCgo+IEJ1dCB1c2Vyc3BhY2UgbWFs
bG9jIHJlYWxseSBtZWFucyBkbWFfbWFwXyogYW55d2F5LCBzbyBub3QgcmVhbGx5Cj4gcmVsZXZh
bnQgZm9yIG1lbW9yeSBhbGxvY2F0aW9ucy4KCkl0IGRvZXMgdGllIGluLCBzaW5jZSB3ZSdsbCB3
YW50IGEgZG1hX21hcCB3aGljaCBmYWlscyBpZiBhIGRpcmVjdCBtYXBwaW5nCmlzbid0IHBvc3Np
YmxlLiBJdCBhbHNvIGhlbHBzIHRoZSBkcml2ZXIgY29kZSBhIGxvdCBpZiB3ZSBjb3VsZCB1c2Ug
dGhlCnNhbWUgbG93LWxldmVsIGZsdXNoaW5nIGZ1bmN0aW9ucyBiZXR3ZWVuIG91ciBvd24gbWVt
b3J5ICh3aGF0ZXZlciB0aGF0CmlzKSBhbmQgYW5vbiBwYWdlcyBmcm9tIG1hbGxvYy4gQW5kIGlu
IGFsbCB0aGUgY2FzZXMgaWYgaXQncyBub3QgcG9zc2libGUsCndlIHdhbnQgYSBmYWlsdXJlLCBu
b3QgZWxhYm9yYXRlIGF0dGVtcHRzIGF0IGhpZGluZyB0aGUgZGlmZmVyZW5jZXMKYmV0d2VlbiBh
bGwgcG9zc2libGUgYXJjaGl0ZWN0dXJlcyBvdXQgdGhlcmUuCi1EYW5pZWwKLS0gCkRhbmllbCBW
ZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZm
d2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
