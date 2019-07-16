Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8696A4D6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 11:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F643890D3;
	Tue, 16 Jul 2019 09:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09049890D3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 09:24:56 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id x19so12990837eda.12
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 02:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=zDo+eWmhtTV8VZruvHAv9SmmLeaVvLllVnL2EEq/1Fw=;
 b=Z1j2iL7fp2hfKByMVpLgfr5OTDnypoognyGKp5NbcpFT9984/sa6qdFl+IfsJRHjIX
 NAnGTar1S0j6xMo3zHeD27+IlWoR0b5op7HjsnNTAx7s0trBT9jTxbk4txj5dHNx0sAx
 kuiF7OBFCekddObKL9dvo5pdW0ygZ7JqAd3zpo1csR65B3TZwa/Crc6Fcqj2f/T2+G2w
 sXaCP279rw2LSAyQNvNGEPE67lYOSe4UjnXn9VXZyrcqlyVUdlprgb5Re1skBPSFTW6r
 g/eYIczknp7CZcbUjxvgFTo1jU+U9mj7VB9aIqDCBP/QopwdF1FYTMCDEtZySWfg/haX
 xiPQ==
X-Gm-Message-State: APjAAAX2GhBKJtBPj7LId1AdZNR29nxLhFyOSxqIsc7YUBj7nZLWm5vI
 NMiFbRvqnMLpZ5/dGgpDJ5A=
X-Google-Smtp-Source: APXvYqy8TYWGSmoRD93Iah2eYrZZToh7cQL4GAdEZ/YgeilZWr9vJGPiBFDokpEWtB6tW8xCnLaPDQ==
X-Received: by 2002:a50:9999:: with SMTP id m25mr28327908edb.183.1563269095678; 
 Tue, 16 Jul 2019 02:24:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id k8sm5739035edr.31.2019.07.16.02.24.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 02:24:55 -0700 (PDT)
Date: Tue, 16 Jul 2019 11:24:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH] gpu/drm: fix a few kernel-doc "/**" mark warnings
Message-ID: <20190716092453.GA15868@phenom.ffwll.local>
Mail-Followup-To: Qian Cai <cai@lca.pw>, emil.l.velikov@gmail.com,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <1563198173-7317-1-git-send-email-cai@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1563198173-7317-1-git-send-email-cai@lca.pw>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=zDo+eWmhtTV8VZruvHAv9SmmLeaVvLllVnL2EEq/1Fw=;
 b=iq/IVh/fNvRMT2I9A/QNh3+yF9u1UrtSDEE5nlnN+E5wSnoO0g8wujwp5DraAOQj/x
 q5ZQk9jMRIJtDPWbNs+Izn/+LI6GHhvfmto8XV0lysvrvb8FbU/q8d4q5AGPN8XyAd/u
 I4HdbEX6UxulgC3MXpsn84QXNdagfDvs/QeV4=
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
Cc: maxime.ripard@bootlin.com, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMDk6NDI6NTNBTSAtMDQwMCwgUWlhbiBDYWkgd3JvdGU6
Cj4gVGhlIG9wZW5pbmcgY29tbWVudCBtYXJrICIvKioiIGlzIHJlc2VydmVkIGZvciBrZXJuZWwt
ZG9jIGNvbW1lbnRzLCBzbwo+IGl0IHdpbGwgZ2VuZXJhdGUgd2FybmluZ3MgZm9yIGNvbW1lbnRz
IHRoYXQgYXJlIG5vdCBrZXJuZWwtZG9jIHdpdGgKPiAibWFrZSBXPTEiLiBGb3IgZXhhbXBsZSwK
PiAKPiBkcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jOjI6IHdhcm5pbmc6IENhbm5vdCB1bmRl
cnN0YW5kICAqIFxmaWxlCj4gZHJtX21lbW9yeS5jCj4gCj4gU2lnbmVkLW9mZi1ieTogUWlhbiBD
YWkgPGNhaUBsY2EucHc+CgpBcHBsaWVkIHRvIGRybS1taXNjLW5leHQgZm9yIDUuNC4KLURhbmll
bAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9hZ3BzdXBwb3J0LmMgIHwgMiArLQo+ICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2RtYS5jICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fbGVnYWN5X21pc2MuYyB8IDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9sb2NrLmMg
ICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jICAgICAgfCAyICst
Cj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fc2NhdHRlci5jICAgICB8IDIgKy0KPiAgZHJpdmVycy9n
cHUvZHJtL2RybV92bS5jICAgICAgICAgIHwgMiArLQo+ICA3IGZpbGVzIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9hZ3BzdXBwb3J0LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2FncHN1cHBvcnQuYwo+
IGluZGV4IDQwZmJhMWMwNGRmYy4uZWY1NDljOTViMGI5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fYWdwc3VwcG9ydC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hZ3Bz
dXBwb3J0LmMKPiBAQCAtMSw0ICsxLDQgQEAKPiAtLyoqCj4gKy8qCj4gICAqIFxmaWxlIGRybV9h
Z3BzdXBwb3J0LmMKPiAgICogRFJNIHN1cHBvcnQgZm9yIEFHUC9HQVJUIGJhY2tlbmQKPiAgICoK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kbWEuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZG1hLmMKPiBpbmRleCAzZjgzZTJjYTgwYWQuLmNiZmFhMmVhYWIwMCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RtYS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kbWEuYwo+IEBAIC0xLDQgKzEsNCBAQAo+IC0vKioKPiArLyoKPiAgICogXGZpbGUgZHJtX2Rt
YS5jCj4gICAqIERNQSBJT0NUTCBhbmQgZnVuY3Rpb24gc3VwcG9ydAo+ICAgKgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2xlZ2FjeV9taXNjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2xlZ2FjeV9taXNjLmMKPiBpbmRleCAyZmU3ODY4MzljYTguLjc0NWViOTkzOTQxNCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2xlZ2FjeV9taXNjLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2xlZ2FjeV9taXNjLmMKPiBAQCAtMSw0ICsxLDQgQEAKPiAtLyoqCj4g
Ky8qCj4gICAqIFxmaWxlIGRybV9sZWdhY3lfbWlzYy5jCj4gICAqIE1pc2MgbGVnYWN5IHN1cHBv
cnQgZnVuY3Rpb25zLgo+ICAgKgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2xv
Y2suYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbG9jay5jCj4gaW5kZXggYjcwMDU4ZTc3YTI4Li4y
NjEwYmZmM2Q1MzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9sb2NrLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2xvY2suYwo+IEBAIC0xLDQgKzEsNCBAQAo+IC0vKioK
PiArLyoKPiAgICogXGZpbGUgZHJtX2xvY2suYwo+ICAgKiBJT0NUTHMgZm9yIGxvY2tpbmcKPiAg
ICoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tZW1vcnkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fbWVtb3J5LmMKPiBpbmRleCAxMzJmZWY4ZmYxYjYuLmQ5MmYyNGMzMDhhMSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9tZW1vcnkuYwo+IEBAIC0xLDQgKzEsNCBAQAo+IC0vKioKPiArLyoKPiAg
ICogXGZpbGUgZHJtX21lbW9yeS5jCj4gICAqIE1lbW9yeSBtYW5hZ2VtZW50IHdyYXBwZXJzIGZv
ciBEUk0KPiAgICoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zY2F0dGVyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX3NjYXR0ZXIuYwo+IGluZGV4IGJiODI5YTExNWZjNi4uYjZk
ODYzNjk5ZDBmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc2NhdHRlci5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zY2F0dGVyLmMKPiBAQCAtMSw0ICsxLDQgQEAKPiAt
LyoqCj4gKy8qCj4gICAqIFxmaWxlIGRybV9zY2F0dGVyLmMKPiAgICogSU9DVExzIHRvIG1hbmFn
ZSBzY2F0dGVyL2dhdGhlciBtZW1vcnkKPiAgICoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV92bS5jCj4gaW5kZXggMTBjZjgzZDU2
OWUxLi42Yzc0YzY4ZjE5MmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV92bS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92bS5jCj4gQEAgLTEsNCArMSw0IEBACj4gLS8q
Kgo+ICsvKgo+ICAgKiBcZmlsZSBkcm1fdm0uYwo+ICAgKiBNZW1vcnkgbWFwcGluZyBmb3IgRFJN
Cj4gICAqCj4gLS0gCj4gMS44LjMuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
