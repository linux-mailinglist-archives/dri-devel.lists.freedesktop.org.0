Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A09DC103EE8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 16:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B537E89322;
	Wed, 20 Nov 2019 15:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3729689322
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 15:37:32 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-Xr35LEt3PUiHSUaDonzSqg-1; Wed, 20 Nov 2019 10:37:26 -0500
Received: by mail-qk1-f199.google.com with SMTP id s144so16046501qke.20
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 07:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BksgvfivWT5oEKOsVtU2jjsSwTJ8rcltyxFUj+I5xNY=;
 b=or71+ZA0LQ36e0uQvWDOGUhGC3OcDKI4jg8ODt7CwH3gjVYuPFZjNZl47XqkNO70+I
 EQWP3IIOq3kY76GZENMSGy0Iyfl1RHS+irlo/VRrCu9Rbvlit3vCEDKoB5u1Eo7pYkw3
 3KYBaiktAVaSj0ralj24pzWNLVviNJQ00ypsdRfz82cVQXzhZnP4h2KbuONjLJUfmec+
 Zf5GbB9MxAFbJVZcW5VF9hmuePph5Xe+TwGZzcoIFltw+Yo+KRIzn1M8kng65WwDWwPM
 bx0hA0OoYIHdwSSr9lDYvgEA/hZQi+7eJ0W94HRlO8QPEO0YGYaZFkZhSQZwutWmp2y0
 negw==
X-Gm-Message-State: APjAAAXCakwDYygoMkShxAGszQUrxqiF6Yp9yFkitMkdPDSAFih8hW6S
 fMyuCWDALbmRl8UHdYudRt58zIGZSX6jeWCsOYMsqrQPVUZCUyXelKF+shC+HhynrYcX2+MXCsE
 lL/p7CbDpGstRXBx2oXnKTWslEXVF80le6y/01fA0zzGu
X-Received: by 2002:a37:6811:: with SMTP id d17mr3082064qkc.102.1574264245976; 
 Wed, 20 Nov 2019 07:37:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqzt0K/ijAMXYP756+k75llJT5zszZ47OfQZKFovlD4ZwaMaT169d/nRHiPSAwI9CqrdON3hSsUsT8pA85i0bCE=
X-Received: by 2002:a37:6811:: with SMTP id d17mr3082027qkc.102.1574264245623; 
 Wed, 20 Nov 2019 07:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
In-Reply-To: <20191120151542.GH11621@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 20 Nov 2019 16:37:14 +0100
Message-ID: <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Mika Westerberg <mika.westerberg@intel.com>
X-MC-Unique: Xr35LEt3PUiHSUaDonzSqg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574264250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/C9gUt9cyA76AzLuivaEWyzrhcrqWJ0lBzJ30P+LXYs=;
 b=P1n/Btyco8r48NtnmDtWA8lQd7SD9aHK2VK6ZkNUpWKmI0gordQ3mZlo4mC4oCgmLXgmCV
 lj4hkrY+IzYSgTmSatxOIoIBAamADevKjOPdmqjQbI9Q2AwhkwK+bmSFher17aS8p3x3oZ
 Btek2Gmn9oeUk+QSFIDj3DDUsPQca8c=
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgNDoxNSBQTSBNaWthIFdlc3RlcmJlcmcKPG1pa2Eud2Vz
dGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDE6
MTE6NTJQTSArMDEwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gT24gV2VkLCBOb3YgMjAsIDIw
MTkgYXQgMTowOSBQTSBNaWthIFdlc3RlcmJlcmcKPiA+IDxtaWthLndlc3RlcmJlcmdAaW50ZWwu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6NTg6MDBQ
TSArMDEwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gPiA+IG92ZXJhbGwsIHdoYXQgSSByZWFs
bHkgd2FudCB0byBrbm93IGlzLCBfd2h5XyBkb2VzIGl0IHdvcmsgb24gd2luZG93cz8KPiA+ID4K
PiA+ID4gU28gZG8gSSA7LSkKPiA+ID4KPiA+ID4gPiBPciB3aGF0IGFyZSB3ZSBkb2luZyBkaWZm
ZXJlbnRseSBvbiBMaW51eCBzbyB0aGF0IGl0IGRvZXNuJ3Qgd29yaz8gSWYKPiA+ID4gPiBhbnli
b2R5IGhhcyBhbnkgaWRlYSBvbiBob3cgd2UgY291bGQgZGlnIGludG8gdGhpcyBhbmQgZmlndXJl
IGl0IG91dAo+ID4gPiA+IG9uIHRoaXMgbGV2ZWwsIHRoaXMgd291bGQgcHJvYmFibHkgYWxsb3cg
dXMgdG8gZ2V0IGNsb3NlciB0byB0aGUgcm9vdAo+ID4gPiA+IGNhdXNlPyBubz8KPiA+ID4KPiA+
ID4gSGF2ZSB5b3UgdHJpZWQgdG8gdXNlIHRoZSBhY3BpX3Jldl9vdmVycmlkZSBwYXJhbWV0ZXIg
aW4geW91ciBzeXN0ZW0gYW5kCj4gPiA+IGRvZXMgaXQgaGF2ZSBhbnkgZWZmZWN0Pwo+ID4gPgo+
ID4gPiBBbHNvIGRpZCB5b3UgdHJ5IHRvIHRyYWNlIHRoZSBBQ1BJIF9PTi9fT0ZGKCkgbWV0aG9k
cz8gSSB0aGluayB0aGF0Cj4gPiA+IHNob3VsZCBob3BlZnVsbHkgcmV2ZWFsIHNvbWV0aGluZy4K
PiA+ID4KPiA+Cj4gPiBJIHRoaW5rIEkgZGlkIGluIHRoZSBwYXN0IGFuZCBpdCBzZWVtZWQgdG8g
aGF2ZSB3b3JrZWQsIHRoZXJlIGlzIGp1c3QKPiA+IG9uZSBiaWcgaXNzdWUgd2l0aCB0aGlzOiBp
dCdzIGEgRGVsbCBzcGVjaWZpYyB3b3JrYXJvdW5kIGFmYWlrLCBhbmQKPiA+IHRoaXMgaXNzdWUg
cGxhZ3VlcyBub3QganVzdCBEZWxsLCBidXQgd2UndmUgc2VlbiBpdCBvbiBIUCBhbmQgTGVub3Zv
Cj4gPiBsYXB0b3BzIGFzIHdlbGwsIGFuZCBJJ3ZlIGhlYXJkIGFib3V0IHVzZXJzIGhhdmluZyB0
aGUgc2FtZSBpc3N1ZXMgb24KPiA+IEFzdXMgYW5kIE1TSSBsYXB0b3BzIGFzIHdlbGwuCj4KPiBN
YXliZSBpdCBpcyBub3QgYSB3b3JrYXJvdW5kIGF0IGFsbCBidXQgaW5zdGVhZCBpdCBzaW1wbHkg
ZGV0ZXJtaW5lcwo+IHdoZXRoZXIgdGhlIHN5c3RlbSBzdXBwb3J0cyBSVEQzIG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQgKElJUkMgV2luZG93cyA4Cj4gc3RhcnRlZCBzdXBwb3J0aW5nIGl0KS4gTWF5
YmUgRGVsbCBhZGRlZCBjaGVjayBmb3IgTGludXggYmVjYXVzZSBhdCB0aGF0Cj4gdGltZSBMaW51
eCBkaWQgbm90IHN1cHBvcnQgaXQuCj4KCnRoZSBwb2ludCBpcywgaXQncyBub3QgY2hlY2tpbmcg
aXQgYnkgZGVmYXVsdCwgc28gYnkgZGVmYXVsdCB5b3Ugc3RpbGwKcnVuIGludG8gdGhlIHdpbmRv
d3MgOCBjb2RlcGF0aC4KCj4gSW4gY2FzZSBSVEQzIGlzIHN1cHBvcnRlZCBpdCBpbnZva2VzIExL
RFMoKSB3aGljaCBwcm9iYWJseSBkb2VzIHRoZSBMMgo+IG9yIEwzIGVudHJ5IGFuZCB0aGlzIGlz
IGZvciBzb21lIHJlYXNvbiBkb2VzIG5vdCB3b3JrIHRoZSBzYW1lIHdheSBpbgo+IExpbnV4IHRo
YW4gaXQgZG9lcyB3aXRoIFdpbmRvd3MgOCsuCj4KPiBJIGRvbid0IHJlbWVtYmVyIGlmIHRoaXMg
aGFwcGVucyBvbmx5IHdpdGggbm91dmVhdSBvciB3aXRoIHRoZQo+IHByb3ByaWV0YXJ5IGRyaXZl
ciBhcyB3ZWxsIGJ1dCBsb29raW5nIGF0IHRoZSBub3V2ZWF1IHJ1bnRpbWUgUE0gc3VzcGVuZAo+
IGhvb2sgKGFzc3VtaW5nIEknbSBsb29raW5nIGF0IHRoZSBjb3JyZWN0IGNvZGUpOgo+Cj4gc3Rh
dGljIGludAo+IG5vdXZlYXVfcG1vcHNfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRl
dikKPiB7Cj4gICAgICAgICBzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsK
PiAgICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBk
ZXYpOwo+ICAgICAgICAgaW50IHJldDsKPgo+ICAgICAgICAgaWYgKCFub3V2ZWF1X3Btb3BzX3J1
bnRpbWUoKSkgewo+ICAgICAgICAgICAgICAgICBwbV9ydW50aW1lX2ZvcmJpZChkZXYpOwo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICBub3V2
ZWF1X3N3aXRjaGVyb29fb3B0aW11c19kc20oKTsKPiAgICAgICAgIHJldCA9IG5vdXZlYXVfZG9f
c3VzcGVuZChkcm1fZGV2LCB0cnVlKTsKPiAgICAgICAgIHBjaV9zYXZlX3N0YXRlKHBkZXYpOwo+
ICAgICAgICAgcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOwo+ICAgICAgICAgcGNpX2lnbm9yZV9o
b3RwbHVnKHBkZXYpOwo+ICAgICAgICAgcGNpX3NldF9wb3dlcl9zdGF0ZShwZGV2LCBQQ0lfRDNj
b2xkKTsKPiAgICAgICAgIGRybV9kZXYtPnN3aXRjaF9wb3dlcl9zdGF0ZSA9IERSTV9TV0lUQ0hf
UE9XRVJfRFlOQU1JQ19PRkY7Cj4gICAgICAgICByZXR1cm4gcmV0Owo+IH0KPgo+IE5vcm1hbGx5
IFBDSSBkcml2ZXJzIGxlYXZlIHRoZSBQQ0kgYnVzIFBNIHRoaW5ncyB0byBQQ0kgY29yZSBidXQg
aGVyZQo+IHRoZSBkcml2ZXIgZG9lcyB0aGVzZS4gU28gSSB3b25kZXIgaWYgaXQgbWFrZXMgYW55
IGRpZmZlcmVuY2UgaWYgd2UgbGV0Cj4gdGhlIGNvcmUgaGFuZGxlIGFsbCB0aGF0Ogo+Cj4gc3Rh
dGljIGludAo+IG5vdXZlYXVfcG1vcHNfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRl
dikKPiB7Cj4gICAgICAgICBzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsK
PiAgICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBk
ZXYpOwo+ICAgICAgICAgaW50IHJldDsKPgo+ICAgICAgICAgaWYgKCFub3V2ZWF1X3Btb3BzX3J1
bnRpbWUoKSkgewo+ICAgICAgICAgICAgICAgICBwbV9ydW50aW1lX2ZvcmJpZChkZXYpOwo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICBub3V2
ZWF1X3N3aXRjaGVyb29fb3B0aW11c19kc20oKTsKPiAgICAgICAgIHJldCA9IG5vdXZlYXVfZG9f
c3VzcGVuZChkcm1fZGV2LCB0cnVlKTsKPiAgICAgICAgIHBjaV9pZ25vcmVfaG90cGx1ZyhwZGV2
KTsKPiAgICAgICAgIGRybV9kZXYtPnN3aXRjaF9wb3dlcl9zdGF0ZSA9IERSTV9TV0lUQ0hfUE9X
RVJfRFlOQU1JQ19PRkY7Cj4gICAgICAgICByZXR1cm4gcmV0Owo+IH0KPgo+IGFuZCBzaW1pbGFy
IGZvciB0aGUgbm91dmVhdV9wbW9wc19ydW50aW1lX3Jlc3VtZSgpLgo+Cgp5ZWFoLCBJIHRyaWVk
IHRoYXQgYXQgc29tZSBwb2ludCBhbmQgaXQgZGlkbid0IGhlbHAgZWl0aGVyLiBUaGUgcmVhc29u
CndlIGNhbGwgdGhvc2UgZnJvbSBpbnNpZGUgTm91dmVhdSBpcyB0byBzdXBwb3J0IHN5c3RlbXMg
cHJlIF9QUiB3aGVyZQpub3V2ZWF1IGludm9rZXMgY3VzdG9tIF9EU00gY2FsbHMgb24gaXRzIG93
bi4gV2UgY291bGQgcG90ZW50aWFsbHkKY2hlY2sgZm9yIHRoYXQgdGhvdWdoLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
