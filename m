Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7856CE14DB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1496E9F3;
	Wed, 23 Oct 2019 08:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DE16E9F3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 08:58:24 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p4so21144910wrm.8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 01:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=+pEdunK9RvxpN2qCe98Yc3WS02eUULVkUNNUYcdN5Es=;
 b=Fv9gYZ/MALZ6Wj84VGiaJWXzNdKceyH/8WBl0T89EntuyF9hMBkALxu8fbUg3XtfDL
 M3XZWWpDuqs4Lv21SrXLYLR4zjFJL9iuElx4S2QOre7LUE3zVQ8VJQ0rhIgAJknNGfob
 M+rK47VjXC9P3Qfmix+lVbPICxOv6M4/5iYtLkQoyjfz6qPaNSYRrzA8KtF5ascsaZpN
 Mdh+tu1WdtsvRT/XWE53oweBCi919cXB/wTlCKCEfCSHpPvItSQqlValIf7wI517dOB4
 fwHcpocjx+oC9puHAz1w9I+gMfUN4UpnVngQ4XggnxtRKLiqcDkDrs7eMh8gbTnSE6Dv
 OIog==
X-Gm-Message-State: APjAAAUIavEJrfa0LU5JCio1MgtIJQcb34ia+C36lQX5iRpYh58pO4HE
 i8u+ovCPPVRAQUI7uSmdiMzOFQ==
X-Google-Smtp-Source: APXvYqysHCWiLyULRTZcbtSofcM64JOGWSrBCR3iEpTaqowUwOnzK94J/o5X5PZwATWOR07c63zKRg==
X-Received: by 2002:a5d:498e:: with SMTP id r14mr6978367wrq.36.1571821103318; 
 Wed, 23 Oct 2019 01:58:23 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id g17sm20180004wrq.58.2019.10.23.01.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 01:58:22 -0700 (PDT)
Date: Wed, 23 Oct 2019 10:58:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/doc: Drop misleading comment on
 drm_mode_config_cleanup
Message-ID: <20191023085820.GT11828@phenom.ffwll.local>
References: <20191022163717.1064-1-daniel.vetter@ffwll.ch>
 <2276700.SQSDhaYmJ8@e123338-lin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2276700.SQSDhaYmJ8@e123338-lin>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+pEdunK9RvxpN2qCe98Yc3WS02eUULVkUNNUYcdN5Es=;
 b=hbl5IHe4WWOEo3xdGnNs0qTAqGyczm+3PKFXle9gde2UWP7YEMCWyxsh7MFCU/miiE
 Apw7sJjj7FTWmBVTPuCPXfT7xmYUJj3RQcaxHCIm9WbYjugsecJBr0vejfB8QFRUg4kw
 EeyVlAA12rJcsK5bJukUASOOU0lXYGETQ7Ee8=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, nd <nd@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMDU6MDI6NDBQTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBPbiBUdWVzZGF5LCAyMiBPY3RvYmVyIDIwMTkgMTc6Mzc6MTcgQlNUIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiBUaGlzIGlzIG5vdCBzb21ldGhpbmcgd2UnbGwgZml4LCBiZWNh
dXNlIGZhaWxpbmcgdG8gY2xlYW4gdXAgc3R1ZmYgKG9yCj4gPiBkb2luZyBpdCBpbiB0aGUgd3Jv
bmcgb3JkZXIpIGlzIGEgZHJpdmVyIGJ1Zy4gVGhlIG9mZmVuZGluZyBGSVhNRSBnb2VzCj4gPiBh
bGwgdGhlIHdheSBiYWNrIHRvIHRoZSBvcmlnaW5hbCBtb2Rlc2V0IG1lcmdlLgo+ID4gCj4gPiBX
ZSd2ZSBhZGRlZCBhIFdBUk5fT04gaW4KPiA+IAo+ID4gY29tbWl0IDJiNjc3ZThjMDhlZWQxMWU0
ZWJlNjZhN2MzMzRmMDNlMzg5YTE5YTMKPiA+IEF1dGhvcjogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBmZndsbC5jaD4KPiA+IERhdGU6ICAgTW9uIERlYyAxMCAyMToxNjowNSAyMDEyICsw
MTAwCj4gPiAKPiA+ICAgICBkcm06IHJlZmVyZW5jZSBmcmFtZWJ1ZmZlcnMgd2hpY2ggYXJlIG9u
IHRoZSBpZHIKPiA+IAo+ID4gaW5jbHVkaW5nIGEgY29tbWVudCBibGFtaW5nIGRyaXZlcnMgb24g
dGhpcy4gUmlnaHQgdGhpbmcgdG8gZG8gaXMgbW9zdAo+ID4gbGlrZWx5IGRybV9hdG9taWNfaGVs
cGVyX3NodXRkb3duIHBsdXMgbWFraW5nIHN1cmUgdGhhdAo+ID4gZHJtX21vZGVfY29uZmlnX2Ns
ZWFudXAgaXMgbm90IGNhbGxlZCB0b28gZWFybHkgKGkuZS4gbm90IGluIGRyaXZlcgo+ID4gdW5s
b2FkLCBidXQgb25seSBpbiB0aGUgZmluYWwgZHJtX2RldmljZSByZWxlYXNlIGNhbGxiYWNrKS4K
PiA+IAo+ID4gQ2M6IE1paGFpbCBBdGFuYXNzb3YgPE1paGFpbC5BdGFuYXNzb3ZAYXJtLmNvbT4K
PiA+IFJlcG9ydGVkLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxNaWhhaWwuQXRhbmFzc292QGFybS5j
b20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVs
LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYyB8IDIg
LS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fbW9kZV9jb25maWcuYwo+ID4gaW5kZXggN2JjMDNjM2MxNTRmLi4zYjU3MGE0MDQ5MzMgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfY29uZmlnLmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYwo+ID4gQEAgLTQyOCw4ICs0MjgsNiBA
QCBFWFBPUlRfU1lNQk9MKGRybV9tb2RlX2NvbmZpZ19pbml0KTsKPiA+ICAgKiBOb3RlIHRoYXQg
c2luY2UgdGhpcyAvc2hvdWxkLyBoYXBwZW4gc2luZ2xlLXRocmVhZGVkIGF0IGRyaXZlci9kZXZp
Y2UKPiA+ICAgKiB0ZWFyZG93biB0aW1lLCBubyBsb2NraW5nIGlzIHJlcXVpcmVkLiBJdCdzIHRo
ZSBkcml2ZXIncyBqb2IgdG8gZW5zdXJlIHRoYXQKPiA+ICAgKiB0aGlzIGd1YXJhbnRlZSBhY3R1
YWxseSBob2xkcyB0cnVlLgo+ID4gLSAqCj4gPiAtICogRklYTUU6IGNsZWFudXAgYW55IGRhbmds
aW5nIHVzZXIgYnVmZmVyIG9iamVjdHMgdG9vCj4gPiAgICovCj4gPiAgdm9pZCBkcm1fbW9kZV9j
b25maWdfY2xlYW51cChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+ID4gIHsKPiA+IAo+IAo+IFRo
YW5rcywKPiAKPiBSZXZpZXdlZC1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3Nv
dkBhcm0uY29tPgoKVGhhbmtzIGZvciB5b3VyIHJldmlldyZyZXBvcnQsIHBhdGNoIGFwcGxpZWQu
Ci1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
