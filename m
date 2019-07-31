Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FC57BB67
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 10:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E214899DB;
	Wed, 31 Jul 2019 08:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A777899DB
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 08:19:57 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id v15so64912758eds.9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 01:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=BHDcrQbpEvhDaOH6r4uDR/6+08AUZ1QBSBgLnhZtJ8c=;
 b=H4HSHSR4MPNVYKODCIajVOt6PgUfsHSKIxLLSja8sOuC9y7cRzv58kH8l616UA1que
 360jvj2v634a86o3MjXfUDctCqr+icrD7cBoIYAr+16HxmiDWtzDhUFx7E4XzI7sAAT0
 CtHGKlZ4Tah5MkCK+HY7w9RnZnmkkTc/5SRABr+f9NbvUCJZuwtyuAOdTU28NxsbRR/J
 0cafhTiiK95ZAh+lYJKVM7jVL5KGWlXy7Y4Aq3dTC6tvH8cHdC/SJ2J/WoLNEZG+wR2A
 hxM600b5SCvKbmSUVx7foBvr/KmHVm/RoJCiUi9RgwSFssS8XJ/LePgZCwyxZ3C91m9E
 9WHg==
X-Gm-Message-State: APjAAAXB7h0xUvItEMbvK40GRfkkpOOeBbUlePd961ZkHeEhjNJ9gdln
 Tf89IwzH7K4dEZfH8omUrodW2IsTYww=
X-Google-Smtp-Source: APXvYqxAHh2jXHIGKBGdjKVJch9iYufKvBuV286oS6OkzaVIO77nRsR2YxBEvrYXhLfodNUlwnF/EA==
X-Received: by 2002:a17:906:9453:: with SMTP id
 z19mr88278467ejx.287.1564561195376; 
 Wed, 31 Jul 2019 01:19:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z2sm12180645ejp.73.2019.07.31.01.19.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 01:19:54 -0700 (PDT)
Date: Wed, 31 Jul 2019 10:19:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 0/4] RESEND: ditch gem_prime_res_obj hook
Message-ID: <20190731081952.GD7444@phenom.ffwll.local>
References: <20190725132655.11951-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725132655.11951-1-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BHDcrQbpEvhDaOH6r4uDR/6+08AUZ1QBSBgLnhZtJ8c=;
 b=DlTwsIcf7rgzfuETiVKHWUZQL7HN297qd7yA0+hqWbxygZq4gn+fRdens7QQqCWl4R
 Uewys2Y0RJVeVDjKvVreIrPm7tuFTC/QozGcVU6r7UOel7M725wWkPw3qFg2VkDlScxC
 2yQUywmEKqzs71WvQQwEAgXMYjMXUPZpDD9Bw=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDM6MjY6NTFQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBIaSBhbGwsCj4gCj4gUmVzZW5kaW5nIHRoaXMgbGl0dGxlIHBhdGNoIHNlcmllcyAo
ZXZlcnl0aGluZyBlbHNlIGxhbmRlZCBub3cpLCBzbyB0aGF0Cj4gd2UgY2FuIG1vdmUgZm9yd2Fy
ZCB3aXRoIEdlcmQncyBzZXJpZXMgdG8gZW1iZWQgYSBnZW1fYm8gaW4gdGhlIHR0bV9ibyAoaGUK
PiByZWJhc2VkIG9uIHRvcCBvZiB0aGlzKS4KPiAKPiBSZXZpZXcvdGVzdGluZyBtdWNoIGFwcHJl
Y2lhdGVkLgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3cywgZW50aXJlIHNlcmllcyBsYW5kZWQgbm93
LgoKR2VyZCwgSSB0aGluayB5b3UncmUgZ29vZCB0byBnbyBvbiB5b3VyIHR0bV9iby9nZW1fYm8g
c2VyaWVzLgotRGFuaWVsCgo+IAo+IFRoYW5rcywgRGFuaWVsCj4gCj4gRGFuaWVsIFZldHRlciAo
NCk6Cj4gICBkcm0vcmFkZW9uOiBGaWxsIG91dCBnZW1fb2JqZWN0LT5yZXN2Cj4gICBkcm0vbm91
dmVhdTogRmlsbCBvdXQgZ2VtX29iamVjdC0+cmVzdgo+ICAgZHJtL2FtZGdwdTogRmlsbCBvdXQg
Z2VtX29iamVjdC0+cmVzdgo+ICAgZHJtL3ByaW1lOiBEaXRjaCBnZW1fcHJpbWVfcmVzX29iaiBo
b29rCj4gCj4gIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0ICAgICAgICAgICAgICAgICAgfCAg
OSAtLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYu
YyB8IDE3ICstLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kbWFfYnVmLmggfCAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYyAgICAgfCAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9v
YmplY3QuYyAgfCAgMiArKwo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgICAgICAgICAg
ICAgICAgIHwgIDMgLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyAg
ICAgICAgfCAgMiArKwo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jICAg
ICAgIHwgIDEgLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2dlbS5oICAgICAg
IHwgIDEgLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ByaW1lLmMgICAgIHwg
IDcgLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyAgICAgICAg
IHwgIDIgLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmMgICAgICB8
ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fcHJpbWUuYyAgICAgICB8ICA3
IC0tLS0tLS0KPiAgaW5jbHVkZS9kcm0vZHJtX2Rydi5oICAgICAgICAgICAgICAgICAgICAgICB8
IDEyIC0tLS0tLS0tLS0tLQo+ICAxNCBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYw
IGRlbGV0aW9ucygtKQo+IAo+IC0tIAo+IDIuMjIuMAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
