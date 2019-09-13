Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C804B227E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 16:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760046F3D7;
	Fri, 13 Sep 2019 14:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693F96F3D7;
 Fri, 13 Sep 2019 14:49:09 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id y62so18776260vsb.6;
 Fri, 13 Sep 2019 07:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nw7T83KKQvMYoShbp1YlvamGMfFATFsgELkQvR1PLxc=;
 b=hhDjDht3seZORwd1NgXPrLf9xY0cWFv2pTfnrzb/e+L0OvTj1ysIYxGcr8kJUvAuBt
 qvTrtt180pbw97xQPJqftaafjHD5DNrIlNY6L1sXcB7C0/LLNQkVykucuVUGi2liP1dH
 9Fjq5wQ8OJEdC4BSB/osHu14lPPglOQ01gJVa8cH2C1vzPgOuHUi9Tln5OFfvYeGB5lp
 gIXdiSQGsBrLUpDEm6fkNDF10GIIe0rfAaPocIUCfpVzFjdq/AjXBxaChKMuWKODfqig
 srIbbjHGGHIVVC7IAS90GYIl4h76DH3quNnYPWf9RXcnY51u3ay2pabePC4551851l+z
 pyoQ==
X-Gm-Message-State: APjAAAVe+PJVBGtyMBxeqhHcBIpvfLtx9H39WccDhcnbKvcJm0NIxVIl
 GHCJG0ju4z+fGB+GKnczGUtSpzBivY0UvYKBzWw=
X-Google-Smtp-Source: APXvYqybdR2BZuJUvlriiROjoC+yPYWDVTolJxZjwIstMw1q2QyxRZT/OZXpWARLJ1Hw7JnHFDzCdQ3wbE4RoUSYhcw=
X-Received: by 2002:a67:d410:: with SMTP id c16mr26690546vsj.37.1568386148550; 
 Fri, 13 Sep 2019 07:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190913130559.669563815@linuxfoundation.org>
 <20190913130606.981926197@linuxfoundation.org>
 <CAKb7UviY0sjFUc6QqjU4eKxm2b-osKoJNO2CSP9HmQ5AdORgkw@mail.gmail.com>
 <20190913144627.GH1546@sasha-vm>
In-Reply-To: <20190913144627.GH1546@sasha-vm>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 13 Sep 2019 10:48:57 -0400
Message-ID: <CAKb7UvgS5uGRP55Z7mcD=PTcPHmHMXB23gpP83kjn-vFcverJQ@mail.gmail.com>
Subject: Re: [PATCH 4.19 092/190] drm/nouveau: Dont WARN_ON VCPI allocation
 failures
To: Sasha Levin <sashal@kernel.org>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, "# 3.9+" <stable@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTA6NDYgQU0gU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgU2VwIDEzLCAyMDE5IGF0IDA5OjMzOjM2QU0gLTA0
MDAsIElsaWEgTWlya2luIHdyb3RlOgo+ID5IaSBHcmVnLAo+ID4KPiA+VGhpcyBmZWVscyBsaWtl
IGl0J3MgbWlzc2luZyBhIEZyb206IGxpbmUuCj4gPgo+ID5jb21taXQgYjUxM2ExOGNmMWQ3MDVi
ZDA0ZWZkOTFjNDE3ZTc5ZTQ5MzhiZTA5Mwo+ID5BdXRob3I6IEx5dWRlIFBhdWwgPGx5dWRlQHJl
ZGhhdC5jb20+Cj4gPkRhdGU6ICAgTW9uIEphbiAyOCAxNjowMzo1MCAyMDE5IC0wNTAwCj4gPgo+
ID4gICAgZHJtL25vdXZlYXU6IERvbid0IFdBUk5fT04gVkNQSSBhbGxvY2F0aW9uIGZhaWx1cmVz
Cj4gPgo+ID5JcyB0aGlzIGFuIGFydGlmYWN0IG9mIHlvdXIgbm90aWZpY2F0aW9uLW9mLXBhdGNo
ZXMgcHJvY2VzcyBhbmQgSQo+ID5uZXZlciBub3RpY2VkIGJlZm9yZSwgb3Igd2FzIHRoZSBwYXRj
aCBpbmdlc3RlZCBpbmNvcnJlY3RseT8KPgo+IEl0IHdhcyBhbHdheXMgbGlrZSB0aGlzIGZvciBw
YXRjaGVzIHRoYXQgY2FtZSB0aHJvdWdoIG1lLiBHcmVnJ3Mgc2NyaXB0Cj4gZ2VuZXJhdGVzIGFu
IGV4cGxpY2l0ICJGcm9tOiIgbGluZSBpbiB0aGUgcGF0Y2gsIGJ1dCBJIG5ldmVyIHNhdyB0aGUK
PiB2YWx1ZSBpbiB0aGF0IHNpbmNlIGdpdCBkb2VzIHRoZSByaWdodCB0aGluZyBieSBsb29raW5n
IGF0IHRoZSAiRnJvbToiCj4gbGluZSBpbiB0aGUgbWFpbCBoZWFkZXIuCgpUaGF0J3MgcmlnaHQg
LS0gdGhlIGVtYWlsJ3MgRnJvbSBoZWFkZXIgZ2V0cyB1c2VkIGluIHRoZSBjYXNlIG9mIG5vCmV4
cGxpY2l0IEZyb20gaW4gdGhlIGVtYWlsIGJvZHkuIEJ1dCBHcmVnIGlzIHNlbmRpbmcgdGhlIGVt
YWlscyBGcm9tOgpHcmVnLCBzbyBpZiBJIHdlcmUgdG8gaW5nZXN0IHRoYXQgZW1haWwsIEkgd291
bGQgZW5kIHVwIHdpdGggYSBwYXRjaApGcm9tOiBHcmVnLCBub3QgRnJvbTogTHl1ZGUgYXMgaXQg
b3VnaHQgdG8gYmUuCgpDaGVlcnMsCgogIC1pbGlhCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
