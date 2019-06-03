Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C18D329C2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 09:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC45F89AEE;
	Mon,  3 Jun 2019 07:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4474589AF3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 07:39:16 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m10so41632edv.6
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 00:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=qQAfZSrgAuaYh8GvF+T081vRyzva2JxG4hmK1d2X+y8=;
 b=EF++eluQPHHI3savc7yo4kd/o5Z4j5esSJVWsEkWgPAn0dJOIhOuMmRzoJUcXAbOEh
 c2l/hz5dFJYVFRaTbQpFDe2k9LpqgBGrneDg4esxc2QaguE+wmE2JCXq+d/XGmN/3E1F
 zW++gZ4E59MY/N+N2z1a9CsfeG8yJjPMuvDmKu9zMDp+um7ZXiAGBhB6Jqvxe5jt6Hpd
 ajKRnwa7iPUv4z0BxGTICMLwdyE3AZ5egj9ioYoEfIrxSqKviJLKteCsaqhdXKI1LPN2
 NoNQeI6E/Tjvy1CNRh+bsFcH/KcoJwh/Uyc9D0/rH8OCoO7qf/SjUtqQjjbDzRevA3vw
 KFMQ==
X-Gm-Message-State: APjAAAW5UWMZQEqfnYWuMLgqoZLu6o3coQpDteluex1vZCf6yAbkJEVU
 1xl9OiSolO8E3AHULc2tS8ySYQ==
X-Google-Smtp-Source: APXvYqyvWs6tMOGaRyEDGy05GODaRyLeJG9QYKJ5/fWSnSOLpVOHlvizrkM4Ve3+1ueekBeH3Fot6g==
X-Received: by 2002:a50:f389:: with SMTP id g9mr27009572edm.130.1559547554953; 
 Mon, 03 Jun 2019 00:39:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id d11sm3808749eda.45.2019.06.03.00.39.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 00:39:14 -0700 (PDT)
Date: Mon, 3 Jun 2019 09:39:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm/doc: More fine-tuning on userspace review requirements
Message-ID: <20190603073912.GE21222@phenom.ffwll.local>
References: <20190521084849.27452-1-daniel.vetter@ffwll.ch>
 <20190521120712.05b0a46a@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521120712.05b0a46a@eldfell.localdomain>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qQAfZSrgAuaYh8GvF+T081vRyzva2JxG4hmK1d2X+y8=;
 b=kpQgV4kk7G6UJ30cknrfEq6c80g9Xjhw0VfyLTHoPMy1eUsAqnIx4P7fdjQk/2vCvU
 V6qbryNGDM29sJxSufv49HFt4ZAsy7GfeUFKjnhQ8S2hDaHOCoZAvs/2/BtO+W4BEpX0
 hR13LSimt9dwxt8fKuLdDnIvNZp4x4sqIQ0Bw=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel@lists.freedesktop.org, contact@emersion.fr,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMTI6MDc6MTJQTSArMDMwMCwgUGVra2EgUGFhbGFuZW4g
d3JvdGU6Cj4gT24gVHVlLCAyMSBNYXkgMjAxOSAxMDo0ODo0OSArMDIwMAo+IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+IAo+ID4gV2l0aCBFcmljJ3MgcGF0
Y2gKPiA+IAo+ID4gY29tbWl0IGJhNmU3OThlY2YzMjA3MTY3ODBiYjZhNjA4OGE4ZDE3ZGNiYTFk
NDkKPiA+IEF1dGhvcjogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KPiA+IERhdGU6ICAg
V2VkIEFwciAyNCAxMTo1NjoxNyAyMDE5IC0wNzAwCj4gPiAKPiA+ICAgICBkcm0vZG9jOiBEb2N1
bWVudCBleHBlY3RhdGlvbiB0aGF0IHVzZXJzcGFjZSByZXZpZXcgbG9va3MgYXQga2VybmVsIHVB
UEkuCj4gPiAKPiA+IHRoZXJlJ3MgYmVlbiBjb25jZXJucyByYWlzZWQgdGhhdCB3ZSBleHBlY3Qg
dXNlcnNwYWNlIHBlb3BsZSB0byBkbwo+ID4gaW4tZGVwdGgga2VybmVsIHBhdGNoIHJldmlldy4g
VGhhdCdzIG5vdCByZWFzb25hYmxlLCBzYW1lIHdheSBrZXJuZWwKPiA+IHBlb3BsZSBjYW4ndCBy
ZXZpZXcgYWxsIHRoZSB1c2Vyc3BhY2Ugd2UgaGF2ZS4gVHJ5IHRvIGNsYXJpZnkKPiA+IGV4cGVj
dGF0aW9ucyBhIGJpdCBtb3JlLgo+ID4gCj4gPiBDYzogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0
Lm5ldD4KPiA+IENjOiBQZWtrYSBQYWFsYW5lbiA8cHBhYWxhbmVuQGdtYWlsLmNvbT4KPiA+IENj
OiBjb250YWN0QGVtZXJzaW9uLmZyCj4gPiBDYzogd2F5bGFuZC1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
aW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9ncHUvZHJtLXVhcGkucnN0IHwg
NiArKystLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLXVhcGkucnN0
IGIvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLXVhcGkucnN0Cj4gPiBpbmRleCAwNTg3NGQwOTgyMGMu
LmYzNjhlNThmYjcyNyAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L2RybS11YXBp
LnJzdAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLXVhcGkucnN0Cj4gPiBAQCAtODUs
OSArODUsOSBAQCBsZWFkcyB0byBhIGZldyBhZGRpdGlvbmFsIHJlcXVpcmVtZW50czoKPiA+ICAt
IFRoZSB1c2Vyc3BhY2Ugc2lkZSBtdXN0IGJlIGZ1bGx5IHJldmlld2VkIGFuZCB0ZXN0ZWQgdG8g
dGhlIHN0YW5kYXJkcyBvZiB0aGF0Cj4gPiAgICB1c2Vyc3BhY2UgcHJvamVjdC4gRm9yIGUuZy4g
bWVzYSB0aGlzIG1lYW5zIHBpZ2xpdCB0ZXN0Y2FzZXMgYW5kIHJldmlldyBvbiB0aGUKPiA+ICAg
IG1haWxpbmcgbGlzdC4gVGhpcyBpcyBhZ2FpbiB0byBlbnN1cmUgdGhhdCB0aGUgbmV3IGludGVy
ZmFjZSBhY3R1YWxseSBnZXRzIHRoZQo+ID4gLSAgam9iIGRvbmUuICBUaGUgdXNlcnNwYWNlLXNp
ZGUgcmV2aWV3ZXIgc2hvdWxkIGFsc28gcHJvdmlkZSBhdCBsZWFzdCBhbgo+ID4gLSAgQWNrZWQt
Ynkgb24gdGhlIGtlcm5lbCB1QVBJIHBhdGNoIGluZGljYXRpbmcgdGhhdCB0aGV5J3ZlIGxvb2tl
ZCBhdCBob3cgdGhlCj4gPiAtICBrZXJuZWwgc2lkZSBpcyBpbXBsZW1lbnRpbmcgdGhlIG5ldyBm
ZWF0dXJlIGJlaW5nIHVzZWQuCj4gPiArICBqb2IgZG9uZS4gIFRoZSB1c2Vyc3BhY2Utc2lkZSBy
ZXZpZXdlciBzaG91bGQgYWxzbyBwcm92aWRlIGFuIEFja2VkLWJ5IG9uIHRoZQo+ID4gKyAga2Vy
bmVsIHVBUEkgcGF0Y2ggaW5kaWNhdGluZyB0aGF0IHRoZXkgYmVsaWV2ZSB0aGUgcHJvcG9zZWQg
dUFQSSBpcyBzb3VuZCBhbmQKPiA+ICsgIHN1ZmZpY2llbnRseSBkb2N1bWVudGVkIGFuZCB2YWxp
ZGF0ZWQgZm9yIHVzZXJzcGFjZSdzIGNvbnN1bXB0aW9uLgo+ID4gIAo+ID4gIC0gVGhlIHVzZXJz
cGFjZSBwYXRjaGVzIG11c3QgYmUgYWdhaW5zdCB0aGUgY2Fub25pY2FsIHVwc3RyZWFtLCBub3Qg
c29tZSB2ZW5kb3IKPiA+ICAgIGZvcmsuIFRoaXMgaXMgdG8gbWFrZSBzdXJlIHRoYXQgbm8gb25l
IGNoZWF0cyBvbiB0aGUgcmV2aWV3IGFuZCB0ZXN0aW5nCj4gCj4gVGhhbmsgeW91IGZvciBjbGFy
aWZ5aW5nIHRoaXMuIEkgY2FuIHdvcmsgd2l0aCB0aGF0Lgo+IAo+IFJldmlld2VkLWJ5OiBQZWtr
YSBQYWFsYW5lbiA8cGVra2EucGFhbGFuZW5AY29sbGFib3JhLmNvbT4KCk1lcmdlZCB3aXRoIEVy
aWMncyBpcmMtYWNrLCB0aGFua3MgZXZlcnlvbmUgZm9yIGhlbHBpbmcgaW1wcm92ZSB0aGlzIHRl
eHQuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
