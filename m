Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC1736CD3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9350D895C4;
	Thu,  6 Jun 2019 07:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FC489395
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 08:31:26 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vhwDaiCA=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
 with ESMTPSA id i01b98v558VNBIo
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Wed, 5 Jun 2019 10:31:23 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v2 0/2] drm/panel-simple: Add panel parameters for
 ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190605082942.GC15169@ravnborg.org>
Date: Wed, 5 Jun 2019 10:31:22 +0200
Message-Id: <E8EB9DF9-3684-4312-86E6-AA7BF38CF121@goldelico.com>
References: <cover.1559711222.git.hns@goldelico.com>
 <20190605082942.GC15169@ravnborg.org>
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Thu, 06 Jun 2019 07:03:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1559723484; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=dZ9VB0L69XNhmbi+WvDL/Ge3RPtwyO9V5uIsQMIewxA=;
 b=mR+iIsXqCl6Dn6uwvlTkumAgFPoh/J8a17+JM6OkYqoVKIQIlCmpd97R8VRZ5Fd9TE
 rA+PzKedouNpoB0JeEJq5v7m2f/RNM3OIm2Rcp/oa9UfjtbT3jmSv5CkRmNJvSxbWKJL
 Qf9syWVJgElkrjwl7wpDysQvl1+ojhG4qg+bd0AlvYTtblG3gnJp6xz0GsTt7LZMcGcy
 xIA3zIso9p86YaqOGI4KO+37/nTSkAtdaJDOc8ArFYjnQwGisvjYQze0hkkgXbz/EYpw
 eJPvb5vz1k6rZ7a4E5ew/kMDYiZfvOMT75D6u7HNvotVhCX85s9fOh9uBpTBMbc5x1Qj
 foXg==
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
Cc: linux-omap@vger.kernel.org, David Airlie <airlied@linux.ie>,
 marek.belisko@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
 Thierry Reding <thierry.reding@gmail.com>, letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKPiBBbSAwNS4wNi4yMDE5IHVtIDEwOjI5IHNjaHJpZWIgU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPjoKPiAKPiBIaSBOaWtvbGF1cy4KPiAKPiBUaGFua3MgZm9yIHRoZSBu
ZXcgcGFuZWwgcGF0Y2hlcy4KPiBPbiBXZWQsIEp1biAwNSwgMjAxOSBhdCAwNzowNzowMUFNICsw
MjAwLCBILiBOaWtvbGF1cyBTY2hhbGxlciB3cm90ZToKPj4gVjI6Cj4+ICogZml4IHR5cG8gaW4g
OTlkdGMgcGFuZWwgY29tcGF0aWJsZSBzdHJpbmcgKHJlcG9ydGVkIGJ5IGltaXJraW5AYWx1bS5t
aXQuZWR1KQo+PiAKPj4gVjE6Cj4+IAo+PiBTaW5jZSB2NS4yLXJjMSBPTUFQIGlzIG5vIGxvbmdl
ciB1c2luZyBhIHNwZWNpYWwgZGlzcGxheSBkcml2ZXIgYXJjaGl0ZWN0dXJlCj4+IGZvciBEUEkg
cGFuZWxzLCBidXQgdXNlcyB0aGUgZ2VuZXJhbCBkcm0vcGFuZWwvcGFuZWwtc2ltcGxlLgo+PiAK
Pj4gU28gd2UgZmluYWxseSBjYW4gYWRkIFNvQyBpbmRlcGVuZGVudCBwYW5lbCBkZWZpbml0aW9u
cyBmb3IgdHdvIHBhbmVsIG1vZGVscwo+PiB3aGljaCB3ZSBhbHJlYWR5IGhhZCB3b3JrZWQgb24g
cXVpdGUgYSB3aGlsZSBhZ28gKGJlZm9yZSBkZXZpY2UgdHJlZSB3YXMKPj4gaW50cm9kdWNlZCk6
Cj4+IAo+PiAJaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8yODUxMjk1Lwo+PiAK
Pj4gCj4+IAo+PiBILiBOaWtvbGF1cyBTY2hhbGxlciAoMik6Cj4+ICBkcm0vcGFuZWw6IHNpbXBs
ZTogQWRkIFNoYXJwIExRMDcwWTNERzNCIHBhbmVsIHN1cHBvcnQKPj4gIGRybS9wYW5lbDogc2lt
cGxlOiBBZGQgT3J0dXN0ZWNoIENPTTM3SDNNIHBhbmVsIHN1cHBvcnQKPiAKPiBBbGwgdGhyZWUg
cGFuZWxzIGFyZSBtaXNzaW5nIGJpbmRpbmcgZG9jdW1lbnRhdGlvbi4KPiBQbGVhc2Ugc3VibWl0
IGJpbmRpbmcgZG9jdW1lbnRhdGlvbiwgaW4gc2VwYXJhdGUgcGF0Y2hlcywgd2l0aAo+IHByb3Bl
ciAiZHQtYmluZGluZ3M6IHh4eCIgc3ViamVjdHMuCj4gU2VlIERvY3VtZW50YXRpb24vZGV2aWNl
LXRyZWUvYmluZGluZ3Mvc3VibWl0dGluZy4uLgoKQWgsIG9rLiBZZXMsIHdpbGwgYWRkIHRvIHYz
IGFzYXAuCgo+IAo+IFBhdGNoZXMgbm90IGFwcGxpZWQgZHVlIHRvIHRoZSBtaXNzaW5nIGRvY3Mu
Cj4gQnV0IHRoZSBwYXRjaGVzIGl0c2VsZiBsb29rZWQgZ29vZC4KPiBZb3UgaGF2ZSBzcGVjaWZp
ZWQgYnVzX2ZsYWdzIGV0YywgYW5kIGFkZGVkIHRoZQo+IG5ldyBlbnRyaWVzIGluIGNvcnJlY3Qg
YWxwaGFiZXRpY2FsIG9yZGVyIGV0Yy4KPiAKPiAJU2FtCgpCUiBhbmQgdGhhbmtzLApOaWtvbGF1
cwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
