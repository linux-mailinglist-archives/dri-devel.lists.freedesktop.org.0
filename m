Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E20FB548
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 17:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958866ED9C;
	Wed, 13 Nov 2019 16:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024AE6ED9D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 16:37:50 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b18so1653986wrj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 08:37:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=A/dCeSOhwINtW90TOs3U3N0tVzw/kXs58X7+iqnUwbM=;
 b=FkJiatY6xnpAP15pGPPjrzbhxWHXCgig/umNafta7mzh3DgzFAy1nr8XsyC9CTcm/E
 D1xtkmDHeS9sHLDJbKBuQCKT0T5n5gzrC9wg9RtmyG7u0eRTSdTEGR5yNYk0mf+6AG0S
 +BItLkYMyZxPexAEqMnDxHf1uOaDIQfbWhhssP/dywndbq7+w0CBh6Myloo8/GfEu6YU
 KZSI5aG7ENiWRaLtGWid3rIQ98nOImJHwO0W4w4DKDohRAgdEoMQ4Yc/T4XvsX6lOOBm
 2xUotSBrUEepNuIQ/QcMsu02QWvJfF67/tqTOZ1qSo4X5c2tvlvrVxCJmlJ0dXxULeuo
 NfzA==
X-Gm-Message-State: APjAAAVE54fP+OxPzQec7XURVDOrFc5U0N2Lob3fSpaTupJjouQIJxlp
 P3Fiz+SAJx2xZcOZHu4SC4tRlw==
X-Google-Smtp-Source: APXvYqyq+qcm8202QvZQNJD5zkvB8WAAc+85ASXTgZnk9aSjx8aLPs9mXcSh+H24jNsXY0SLKei2bw==
X-Received: by 2002:adf:f743:: with SMTP id z3mr3578884wrp.200.1573663069598; 
 Wed, 13 Nov 2019 08:37:49 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id o81sm3060004wmb.38.2019.11.13.08.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 08:37:48 -0800 (PST)
Date: Wed, 13 Nov 2019 17:37:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm/ast: Replace drm_get_pci_device() and
 drm_put_dev()
Message-ID: <20191113163746.GU23790@phenom.ffwll.local>
References: <20191113155857.9507-1-tzimmermann@suse.de>
 <20191113155857.9507-2-tzimmermann@suse.de>
 <20191113163541.GT23790@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113163541.GT23790@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=A/dCeSOhwINtW90TOs3U3N0tVzw/kXs58X7+iqnUwbM=;
 b=hagnuTUB8bp5nvLbMJdiEI/bxyjtizQe4KY1oZDVhHkrd7FsC8kmlxqMGI0AavAZOR
 ElwnSbQtx1g7jQyvVRfaDDExzdq7uYcxiGu6xvP34yWZ0xd1H0W4MIK5C02D/9fMpLKA
 82pFxaqjmiDOO642Wv4b5bZ6P/d52NyaBTX/U=
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDU6MzU6NDFQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIE5vdiAxMywgMjAxOSBhdCAwNDo1ODo1NlBNICswMTAwLCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToKPiA+IEJvdGggZnVuY3Rpb25zIGFyZSBkZXByZWNhdGVkLiBPcGVu
LWNvZGUgdGhlbSB0aGVtIGluIHByZXBhcmF0aW9uCj4gPiBvZiByZW1vdmluZyBzdHJ1Y3QgZHJt
X2RyaXZlci57bG9hZCx1bmxvYWR9Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9hc3QvYXN0X2Rydi5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9kcnYuYwo+ID4gaW5kZXggZDc2M2RhNmYwODM0Li43OGM5MGEzYzkwM2Ig
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYwo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMKPiA+IEBAIC04Niw5ICs4NiwzNSBAQCBzdGF0
aWMgdm9pZCBhc3Rfa2lja19vdXRfZmlybXdhcmVfZmIoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4g
PiAgCj4gPiAgc3RhdGljIGludCBhc3RfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBj
b25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQo+ID4gIHsKPiA+ICsJc3RydWN0IGRybV9k
ZXZpY2UgKmRldjsKPiA+ICsJaW50IHJldDsKPiA+ICsKPiA+ICAJYXN0X2tpY2tfb3V0X2Zpcm13
YXJlX2ZiKHBkZXYpOwo+ID4gIAo+ID4gLQlyZXR1cm4gZHJtX2dldF9wY2lfZGV2KHBkZXYsIGVu
dCwgJmRyaXZlcik7Cj4gPiArCXJldCA9IHBjaV9lbmFibGVfZGV2aWNlKHBkZXYpOwo+ID4gKwlp
ZiAocmV0KQo+ID4gKwkJcmV0dXJuIHJldDsKPiA+ICsKPiA+ICsJZGV2ID0gZHJtX2Rldl9hbGxv
YygmZHJpdmVyLCAmcGRldi0+ZGV2KTsKPiAKPiBXb3VsZCBiZSBuaWNlIHRvIGFsc28gc3dpdGNo
IG92ZXIgdG8gZW1iZWRkaW5nIGRybV9kZXZpY2UgYW5kCj4gZHJtX2Rldl9pbml0LCBidXQgZm9y
IGFub3RoZXIgcGF0Y2guIFRoaXMgaXMKCkV2ZW4gYmV0dGVyOiBkZXZtX2RybV9kZXZfaW5pdCwg
YW5kIGRyb3BwaW5nIHRoZSBkcm1fZGV2X3B1dC9rZnJlZSBhdCB0aGUKYm90dG9tIG9mIHRoZSBw
Y2lfcmVtb3ZlIGZ1bmN0aW9uLgotRGFuaWVsCgo+IAo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IAo+ID4gKwlpZiAoSVNfRVJSKGRldikpIHsK
PiA+ICsJCXJldCA9IFBUUl9FUlIoZGV2KTsKPiA+ICsJCWdvdG8gZXJyX3BjaV9kaXNhYmxlX2Rl
dmljZTsKPiA+ICsJfQo+ID4gKwo+ID4gKwlkZXYtPnBkZXYgPSBwZGV2Owo+ID4gKwlwY2lfc2V0
X2RydmRhdGEocGRldiwgZGV2KTsKPiA+ICsKPiA+ICsJcmV0ID0gZHJtX2Rldl9yZWdpc3Rlcihk
ZXYsIGVudC0+ZHJpdmVyX2RhdGEpOwo+ID4gKwlpZiAocmV0KQo+ID4gKwkJZ290byBlcnJfZHJt
X2Rldl9wdXQ7Cj4gPiArCj4gPiArCXJldHVybiAwOwo+ID4gKwo+ID4gK2Vycl9kcm1fZGV2X3B1
dDoKPiA+ICsJZHJtX2Rldl9wdXQoZGV2KTsKPiA+ICtlcnJfcGNpX2Rpc2FibGVfZGV2aWNlOgo+
ID4gKwlwY2lfZGlzYWJsZV9kZXZpY2UocGRldik7Cj4gPiArCXJldHVybiByZXQ7Cj4gPiAgfQo+
ID4gIAo+ID4gIHN0YXRpYyB2b2lkCj4gPiBAQCAtOTYsNyArMTIyLDggQEAgYXN0X3BjaV9yZW1v
dmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gPiAgewo+ID4gIAlzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOwo+ID4gIAo+ID4gLQlkcm1fcHV0X2RldihkZXYp
Owo+ID4gKwlkcm1fZGV2X3VucmVnaXN0ZXIoZGV2KTsKPiA+ICsJZHJtX2Rldl9wdXQoZGV2KTsK
PiA+ICB9Cj4gPiAgCj4gPiAgc3RhdGljIGludCBhc3RfZHJtX2ZyZWV6ZShzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2KQo+ID4gLS0gCj4gPiAyLjIzLjAKPiA+IAo+IAo+IC0tIAo+IERhbmllbCBWZXR0
ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiBodHRwOi8vYmxvZy5m
ZndsbC5jaAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
