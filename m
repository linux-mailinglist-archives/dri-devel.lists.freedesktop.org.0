Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDD542C27
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 18:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD99896B0;
	Wed, 12 Jun 2019 16:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79881896B0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 16:26:28 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z25so26643201edq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 09:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=C/zSyhNx+x2LqbaFHnleJ533xiPKf/+YwcGPOEVjjnA=;
 b=mTehmUXir6Zup8NcIxn2p4YJqbu6d1XAGb+3nIHy4/KxWiHHx7cMvifI6Iq4ELjzAr
 YFli4q3lLy9MIb98bV3eyCzg3yvNkx8n68ziVtOKLm/W+KUh1sjL/0/2bu98suQRH5ob
 yhPpWXtpr/AV5IupXAPis/N3zA12LznT6eYVlL0lqgRTIMaENLQYSwkcmppP1eHhL5R+
 XQhwxpF5qf9o0AGJ2rMuZ2NKhNWZPvFvi8H9t/pnOUjfmgVruKXMyoUJW8A2gVUjzEXd
 IH7ktu6uASu1eS/GH9idApJYF6gltr6K/c2VEqgbuicrGpOXNIloawbZAa9GP0ZYRq6f
 dNtQ==
X-Gm-Message-State: APjAAAWLjZyYYpHiIGRGdu9z3HJdSYvlKg7QnjnyYh7vb8AwJmd0tUsm
 C2gRF0jpqjNor+DSbCE/jP6j+w==
X-Google-Smtp-Source: APXvYqyOJFCKPmram4Xo2cf/3w7LqEkA1AmvrIl2TmxcprOR1qzbE/gkv+I770WiLrKZyJy1wZz7nw==
X-Received: by 2002:a50:b7bc:: with SMTP id h57mr88940704ede.77.1560356787119; 
 Wed, 12 Jun 2019 09:26:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x8sm94093edx.67.2019.06.12.09.26.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 09:26:26 -0700 (PDT)
Date: Wed, 12 Jun 2019 18:25:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: CK Hu <ck.hu@mediatek.com>
Subject: Re: [GIT,PULL] mediatek drm fixes for 5.2
Message-ID: <20190612162538.GA8035@phenom.ffwll.local>
References: <1560325868.3259.6.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560325868.3259.6.camel@mtksdaap41>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=C/zSyhNx+x2LqbaFHnleJ533xiPKf/+YwcGPOEVjjnA=;
 b=cDh73ZoLM3IgDLvaGeZmDcShtae9q9InYNp2itldwsWnppizgvamfZUelokVvjNY7g
 ni+s093HHccoewQrlYQne0DuNLIXvYB+tBQDEUnbPCNYYTmb9bcqPrd82IAY8ucMq5F0
 v/FuYVb04kJ8Tfmmpv3uvNtk3WVsg/7Gyjbrc=
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
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDM6NTE6MDhQTSArMDgwMCwgQ0sgSHUgd3JvdGU6Cj4g
SGkgRGF2ZSwgRGFuaWVsOgo+IAo+IFRoaXMgaW5jbHVkZSB1bmJpbmQgZXJyb3IgZml4LCBjbG9j
ayBjb250cm9sIGZsb3cgcmVmaW5lbWVudCwgYW5kIFBSSU1FCj4gbW1hcCB3aXRoIHBhZ2Ugb2Zm
c2V0Lgo+IAo+IFJlZ2FyZHMsCj4gQ0sKPiAKPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2Ug
Y29tbWl0Cj4gYTE4ODMzOWNhNWEzOTZhY2M1ODhlNTg1MWVkN2UxOWY2NmIwZWJkOToKPiAKPiAg
IExpbnV4IDUuMi1yYzEgKDIwMTktMDUtMTkgMTU6NDc6MDkgLTA3MDApCj4gCj4gYXJlIGF2YWls
YWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4gCj4gICBodHRwczovL2dpdGh1Yi5jb20v
Y2todS1tZWRpYXRlay9saW51eC5naXQtdGFncy5naXQKPiBtZWRpYXRlay1kcm0tZml4ZXMtNS4y
CgpGb3IgbmV4dCB0aW1lIGFyb3VuZCwgcGxlYXNlIG1ha2UgdGhpcyBhIHNpZ25lZCBhbm5vdGF0
ZWQgdGFnLiBhbm5vdGF0ZWQKYmVjYXVzZSB0aGVuIGl0J3MgbGVzcyB0eXBpbmcgZm9yIG1lLCBh
bmQgc2lnbmVkIGJlY2F1c2UgaXQncyBvbiBhIHNlcnZlcgp3ZSBkb24ndCBuZWNlc3NhcmlseSB0
cnVzdC4KCj4gCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDI0NThkOWQ2ZDk0YmU5
ODJiOTE3ZTkzYzYxYTg5YjQ0MjZmMzJlMzE6Cj4gCj4gICBkcm0vbWVkaWF0ZWs6IGNhbGwgbXRr
X2RzaV9zdG9wKCkgYWZ0ZXIgbXRrX2RybV9jcnRjX2F0b21pY19kaXNhYmxlKCkKPiAoMjAxOS0w
Ni0wNCAwOTo1NDo0MiArMDgwMCkKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gSHNpbi1ZaSBXYW5nICg1KToKPiAg
ICAgICBkcm0vbWVkaWF0ZWs6IGZpeCB1bmJpbmQgZnVuY3Rpb25zCj4gICAgICAgZHJtL21lZGlh
dGVrOiB1bmJpbmQgY29tcG9uZW50cyBpbiBtdGtfZHJtX3VuYmluZCgpCj4gICAgICAgZHJtL21l
ZGlhdGVrOiBjYWxsIGRybV9hdG9taWNfaGVscGVyX3NodXRkb3duKCkgd2hlbiB1bmJpbmRpbmcK
PiBkcml2ZXIKPiAgICAgICBkcm0vbWVkaWF0ZWs6IGNsZWFyIG51bV9waXBlcyB3aGVuIHVuYmlu
ZCBkcml2ZXIKPiAgICAgICBkcm0vbWVkaWF0ZWs6IGNhbGwgbXRrX2RzaV9zdG9wKCkgYWZ0ZXIK
PiBtdGtfZHJtX2NydGNfYXRvbWljX2Rpc2FibGUoKQo+IAo+IFlvbmdxaWFuZyBOaXUgKDIpOgo+
ICAgICAgIGRybS9tZWRpYXRlazogYWRqdXN0IGRkcCBjbG9jayBjb250cm9sIGZsb3cKPiAgICAg
ICBkcm0vbWVkaWF0ZWs6IHJlc3BlY3QgcGFnZSBvZmZzZXQgZm9yIFBSSU1FIG1tYXAgY2FsbHMK
CllvdSBtaWdodCB3YW50IHRvIGxvb2sgaW50byBhbGwgdGhlIHJlY2VudGx5IGFkZGVkIGhlbHBl
cnMgZm9yIG1tYXAsIEkKZG9uJ3QgdGhpbmsgbXRrIGRvZXMgYW55dGhpbmcgc3BlY2lhbCBoZXJl
LgoKCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8IDMwCj4g
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2Rydi5jICB8ICA4ICsrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2dlbS5jICB8ICA3ICsrKysrKy0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYyAgICAgIHwgMTIgKysrKysrKysrKystCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjYg
aW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCgpQdWxsZWQsIHRoYW5rcy4KLURhbmllbAoK
PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
