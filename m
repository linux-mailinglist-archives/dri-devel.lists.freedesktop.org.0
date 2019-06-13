Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926A1434FD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 11:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCBB8982C;
	Thu, 13 Jun 2019 09:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506EF8982C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 09:52:43 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:38654)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hbMPL-00029h-MP; Thu, 13 Jun 2019 10:52:35 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hbMPH-000183-2d; Thu, 13 Jun 2019 10:52:31 +0100
Date: Thu, 13 Jun 2019 10:52:30 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH 01/13] drm/i2c: tda998x: introduce tda998x_audio_settings
Message-ID: <20190613095230.c2uhozgixkewyguy@shell.armlinux.org.uk>
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
 <E1haeX3-0001xe-1A@rmk-PC.armlinux.org.uk>
 <CAGngYiVfggWOJAMC2OmEmwfPQUQWv9JADUH_DkrCqYDjFggxWg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGngYiVfggWOJAMC2OmEmwfPQUQWv9JADUH_DkrCqYDjFggxWg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JXyEp58c2N9xP9zq0kAKmGB6lpaBz8G+/GXpceYGqdE=; b=qMYs+T9wiMB2JUICxbxWlpDQg
 aRHAG3YREG4VreRo+0EHV7wMUPb/NAaqZb1GKw1Ns1GpDa2AyK5B6bULAlp7YjHG4mZwxZwjXTSzU
 rnZAzuzFfd2vZYXyav8lOUDYzktZujeNMcfmxxnHqoQZQnw1Oz6Uz2a9RAbh2QOYm7hklfM+9kzCN
 vQITGfzeqMeH4tgXvT5g5j0nuvLgHArDTgatlWSLlndNJP9EMSIECKT9BhcWaykuqUQv/1t+icpst
 xlRJj4L0jCy38nExCpPGRSVhvFXVuMWm+wGpnwQRAfosZg58RzN1KWNCxaEa3cpffUyJxki3c+LRc
 6e9rpjs0Q==;
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTE6MjQ6NDZBTSAtMDQwMCwgU3ZlbiBWYW4gQXNicm9l
Y2sgd3JvdGU6Cj4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNzowMSBBTSBSdXNzZWxsIEtpbmcg
PHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+Cj4gPiBJbnRyb2R1Y2UgYSBz
dHJ1Y3R1cmUgdG8gaG9sZCB0aGUgcmVnaXN0ZXIgdmFsdWVzIHRvIGJlIHByb2dyYW1tZWQgd2hp
bGUKPiA+IHByb2dyYW1taW5nIHRoZSBUREE5OTh4IGF1ZGlvIHNldHRpbmdzLiAgVGhpcyBpcyBj
dXJyZW50bHkgYSBzdHViCj4gPiBzdHJ1Y3R1cmUsIHdoaWNoIHdpbGwgYmUgcG9wdWxhdGVkIGlu
IHN1YnNlcXVlbnQgY29tbWl0cy4KPiA+Cj4gPiBXaGVuIHdlIGluaXRpYWxpc2UgdGhpcyBmcm9t
IHRoZSBwbGF0Zm9ybSBkYXRhLCBvbmx5IGRvIHNvIGlmIHRoZXJlIGlzIGEKPiA+IHZhbGlkIGF1
ZGlvIGZvcm1hdCBzcGVjaWZpY2F0aW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwg
S2luZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+Cj4gPiAtLS0KPiAKPiBOaXQ6Cj4gRml4
IGNvbXBpbGUgZXJyb3JzPyBOb3RlIHRoYXQgdGhlc2UgZXJyb3JzIGRpc2FwcGVhciBpZiBwYXRj
aCAyLzEzCj4gaXMgYXBwbGllZCwgYnV0IG1heWJlIHdlIHdhbnQgdG8gbWFrZSBzdXJlIHRoYXQg
ZXZlcnkgcGF0Y2ggY29tcGlsZXMKPiBzbyBnaXQgYmlzZWN0IGRvZXMgbm90IGJyZWFrPwo+IAo+
IGRyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYzogSW4gZnVuY3Rpb24g4oCYdGRhOTk4
eF9hdWRpb19od19wYXJhbXPigJk6Cj4gZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTh4X2Rydi5j
OjEwMTE6MTA6IGVycm9yOiDigJhzdHJ1Y3QKPiB0ZGE5OTh4X2F1ZGlvX3NldHRpbmdz4oCZIGhh
cyBubyBtZW1iZXIgbmFtZWQg4oCYY29uZmln4oCZCj4gICAgICBhdWRpby5jb25maWcgPSBwcml2
LT5hdWRpb19wb3J0W2ldLmNvbmZpZzsKPiAgICAgICAgICAgXgo+IGRyaXZlcnMvZ3B1L2RybS9p
MmMvdGRhOTk4eF9kcnYuYzoxMDEyOjg6IGVycm9yOiDigJhzdHJ1Y3QKPiB0ZGE5OTh4X2F1ZGlv
X3NldHRpbmdz4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYZm9ybWF04oCZCj4gICAgYXVkaW8u
Zm9ybWF0ID0gQUZNVF9JMlM7Cj4gICAgICAgICBeCj4gZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5
OTh4X2Rydi5jOjEwMTc6MTA6IGVycm9yOiDigJhzdHJ1Y3QKPiB0ZGE5OTh4X2F1ZGlvX3NldHRp
bmdz4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYY29uZmln4oCZCj4gICAgICBhdWRpby5jb25m
aWcgPSBwcml2LT5hdWRpb19wb3J0W2ldLmNvbmZpZzsKPiAgICAgICAgICAgXgo+IGRyaXZlcnMv
Z3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYzoxMDE4Ojg6IGVycm9yOiDigJhzdHJ1Y3QKPiB0ZGE5
OTh4X2F1ZGlvX3NldHRpbmdz4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYZm9ybWF04oCZCj4g
ICAgYXVkaW8uZm9ybWF0ID0gQUZNVF9TUERJRjsKPiAgICAgICAgIF4KPiBkcml2ZXJzL2dwdS9k
cm0vaTJjL3RkYTk5OHhfZHJ2LmM6MTAyNToxMTogZXJyb3I6IOKAmHN0cnVjdAo+IHRkYTk5OHhf
YXVkaW9fc2V0dGluZ3PigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJhjb25maWfigJkKPiAgIGlm
IChhdWRpby5jb25maWcgPT0gMCkgewo+ICAgICAgICAgICAgXgoKVGhhbmtzIGZvciByZXBvcnRp
bmcuICBBbGwgZml4ZWQuCgpIb3dldmVyLCBJJ20gY29uY2VybmVkIHRoYXQgdGhlIDAtZGF5IGJ1
aWxkZXIgbmV2ZXIgZm91bmQgdGhlc2UgZGVzcGl0ZQp0aGlzIGNvZGUgYmVpbmcgcHVibGlzaGVk
IGZvciBtYW55IHdlZWtzLgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJt
bGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRDIGJyb2FkYmFuZCBmb3IgMC44bWls
ZSBsaW5lIGluIHN1YnVyYmlhOiBzeW5jIGF0IDEyLjFNYnBzIGRvd24gNjIya2JwcyB1cApBY2Nv
cmRpbmcgdG8gc3BlZWR0ZXN0Lm5ldDogMTEuOU1icHMgZG93biA1MDBrYnBzIHVwCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
