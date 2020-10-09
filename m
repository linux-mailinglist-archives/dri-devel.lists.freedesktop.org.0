Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174A4288602
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 11:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67F36EC85;
	Fri,  9 Oct 2020 09:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195E36EC85
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 09:37:06 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id u126so9514602oif.13
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 02:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8gh++1RbSAQ4bLIJvvfIzZpwpZ5o3yZIgy0AeHVMe60=;
 b=UQZaMKc5YgyPR5wCWQIpe1FXIwS9TROIvEpq92iIlPBL4oWLGqxGj03Th/UTfSK1q1
 7vkkiH3qK+OSXZKKusiMOHYzPhYPtobjO9zQX85hhbf8zqvWUgAS9zZLux2NTMGrtkqH
 15ejARb/Moghky4lE60XBcB1/lpUs5K4LdJb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8gh++1RbSAQ4bLIJvvfIzZpwpZ5o3yZIgy0AeHVMe60=;
 b=e6Qg1v4xocHWelTOmrMAA/nDuvKkdop/1Xzmjem0KHTf8ihcxym8JjyX1PRzjLZAFG
 DDUIX+Zo0QgzjaQ0NW7I8N18jjjXmflGiqvV8BXY4k6Gi9tMtu8V+P+cOrhZFTzR3tBw
 pGmj7PzmIHcIURkYATIeAHzkiB2c153wBfNdUP6I5PgE7ISn5UWeV1HME2YnrMpLOB0j
 StuE+tMjBwPrxr80EpqhHFZQN5Q18utDHbPwr57ylXBBb0ztv/oozQZ85P0xe1ZGWH/+
 XKFNpAUpNZfY45yFXARrQy2WcUlP656TLKq0haNO5yiIzHUyhTdRfEntMzc8sWpglyQ3
 7w1w==
X-Gm-Message-State: AOAM532+igsf+35H9jJ5uWCdxnOxEhjZ8jTInoAgGCzO8Z8NzKYUPFYc
 YQGEznpIUICR5UYQjLvs7TqWP4UQkRfmTT9IpSoUcO6YUuiYDg==
X-Google-Smtp-Source: ABdhPJwdnhCk0f8IJ1N4xxr0ytmdEo5vWdNOaRgK4frJa/33y/eqqSZzfEz7tkfAEmncGelrioyHxcz9Pq7v1H/a72M=
X-Received: by 2002:aca:52c4:: with SMTP id g187mr1740821oib.101.1602236225470; 
 Fri, 09 Oct 2020 02:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
In-Reply-To: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 9 Oct 2020 11:36:54 +0200
Message-ID: <CAKMK7uF84A7S0Lv1Oz8jydoBD49K+WHY-=enJLfpVx7sYmY7uA@mail.gmail.com>
Subject: Re: [PATCH] drm: document that user-space should avoid parsing EDIDs
To: Simon Ser <contact@emersion.fr>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgOSwgMjAyMCBhdCAxMToyNCBBTSBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNp
b24uZnI+IHdyb3RlOgo+Cj4gVXNlci1zcGFjZSBzaG91bGQgYXZvaWQgcGFyc2luZyBFRElEcyBm
b3IgbWV0YWRhdGEgYWxyZWFkeSBleHBvc2VkIHZpYQo+IG90aGVyIEtNUyBpbnRlcmZhY2VzIGFu
ZCBwcm9wZXJ0aWVzLiBGb3IgaW5zdGFuY2UsIHVzZXItc3BhY2Ugc2hvdWxkIG5vdAo+IHRyeSB0
byBleHRyYWN0IGEgbGlzdCBvZiBtb2RlcyBmcm9tIHRoZSBFRElEOiB0aGUga2VybmVsIG1pZ2h0
IG11dGF0ZQo+IHRoZSBtb2RlIGxpc3QgKGJlY2F1c2Ugb2YgbGluayBjYXBhYmlsaXRpZXMgb3Ig
cXVpcmtzIGZvciBpbnN0YW5jZSkuCj4KPiBPdGhlciBtZXRhZGF0YSBub3QgZXhwb3NlZCBieSBL
TVMgY2FuIGJlIHBhcnNlZCBieSB1c2VyLXNwYWNlLiBUaGlzCj4gaW5jbHVkZXMgZm9yIGluc3Rh
bmNlIG1vbml0b3IgaWRlbnRpZmljYXRpb24gKG1ha2UvbW9kZWwvc2VyaWFsKSBhbmQKPiBzdXBw
b3J0ZWQgY29sb3Itc3BhY2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxjb250YWN0
QGVtZXJzaW9uLmZyPgo+IFN1Z2dlc3RlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBpbnRlbC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29t
Pgo+IENjOiBQZWtrYSBQYWFsYW5lbiA8cGVra2EucGFhbGFuZW5AY29sbGFib3JhLmNvLnVrPgo+
IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgoKUmV2
aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIHwgNCArKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwo+IGluZGV4IDcx
N2M0ZTcyNzFiMC4uMDBlNThmZDJkMjkyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fY29ubmVjdG9yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCj4g
QEAgLTk2MCw2ICs5NjAsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcHJvcF9lbnVtX2xp
c3QgZHBfY29sb3JzcGFjZXNbXSA9IHsKPiAgICogICAgIGRybV9jb25uZWN0b3JfdXBkYXRlX2Vk
aWRfcHJvcGVydHkoKSwgdXN1YWxseSBhZnRlciBoYXZpbmcgcGFyc2VkCj4gICAqICAgICB0aGUg
RURJRCB1c2luZyBkcm1fYWRkX2VkaWRfbW9kZXMoKS4gVXNlcnNwYWNlIGNhbm5vdCBjaGFuZ2Ug
dGhpcwo+ICAgKiAgICAgcHJvcGVydHkuCj4gKyAqCj4gKyAqICAgICBVc2VyLXNwYWNlIHNob3Vs
ZCBub3QgcGFyc2UgdGhlIEVESUQgdG8gb2J0YWluIGluZm9ybWF0aW9uIGV4cG9zZWQgdmlhCj4g
KyAqICAgICBvdGhlciBLTVMgcHJvcGVydGllcy4gRm9yIGluc3RhbmNlLCB1c2VyLXNwYWNlIHNo
b3VsZCBub3QgdHJ5IHRvIHBhcnNlCj4gKyAqICAgICBtb2RlIGxpc3RzIGZyb20gdGhlIEVESUQu
Cj4gICAqIERQTVM6Cj4gICAqICAgICBMZWdhY3kgcHJvcGVydHkgZm9yIHNldHRpbmcgdGhlIHBv
d2VyIHN0YXRlIG9mIHRoZSBjb25uZWN0b3IuIEZvciBhdG9taWMKPiAgICogICAgIGRyaXZlcnMg
dGhpcyBpcyBvbmx5IHByb3ZpZGVkIGZvciBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSB3aXRoIGV4
aXN0aW5nCj4gLS0KPiAyLjI4LjAKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2lu
ZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
