Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C84F4233
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734916E826;
	Fri,  8 Nov 2019 08:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FD06F8AD
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 08:34:52 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f3so5265147wmc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2019 00:34:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=GNBx6vzN5n9iZ0DowN8UoHdT8V/yV/ZlTTgj8SuNHxw=;
 b=fGPvsxBCk9Uup9gQ7EBzwOn7pQguYoPypDaJ6YqNvQMuMAyUfcNPlmgVlgbqNzeBKN
 N6sfdGnsb4Qvsv3IUJBmZUMRWoJLFSCqYesyBDkS6QeYuP3ERUbStcv0kQneQechb3ZI
 eY26gTR4W8dd+wi1tO3xf3WLX8Cf47WUBl32PtcPPKUOanzO708Tor/pehmBs0wa0+wz
 QlZpp3B3qHpBmx+tteOWA6yV8/V8Bu7n+azMiQEt5SnNu8OY5mQrnrgctTOPObiavB8K
 qhsgsKiiM4La6cI9aEcg793VuC8z2MrAyOZdFylLxAXyzkwt4MeCSxh9hnkcghaRvNwr
 COcw==
X-Gm-Message-State: APjAAAUPKDh3YRv3GaJTEos3mIrhwiOsg4fFX3i1Ynuly69On4QgINbT
 QGTb/lZJw9BOv98XB0fVRUmR6A==
X-Google-Smtp-Source: APXvYqyHKHX0v/WKP8FWHehNB24+E1bGaM6s4cXKYojPO1xiyu2qSI95yblhRj7a1eR06RxC+l1ZzQ==
X-Received: by 2002:a05:600c:2105:: with SMTP id
 u5mr6797527wml.47.1573202091526; 
 Fri, 08 Nov 2019 00:34:51 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id n65sm1382891wmf.28.2019.11.08.00.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 00:34:50 -0800 (PST)
Date: Fri, 8 Nov 2019 09:34:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Steve Cohen <cohens@codeaurora.org>
Subject: Re: [PATCH 0/3] allow DRM drivers to limit creation of blobs
Message-ID: <20191108083448.GU23790@phenom.ffwll.local>
References: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GNBx6vzN5n9iZ0DowN8UoHdT8V/yV/ZlTTgj8SuNHxw=;
 b=ArZJRK5l4lbX7IXd9hkNrsVI0q35U8SROjjCaKLhN4RHO1SZE+KqNwIbps8Se7IEKt
 col9v8Xc+AXID/lCJz/bWDehorG5CHS9shNIX8CwjctBjoCiNNktbD9suQHfZur6Kj7g
 w5W6Izq40Selz214kUaevG2IoapbIb/Nn5P4c=
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
Cc: adelva@google.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, pdhaval@codeaurora.org, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDI6Mzk6MTFQTSAtMDUwMCwgU3RldmUgQ29oZW4gd3Jv
dGU6Cj4gRnV6emVycyB1c2VkIGluIEFuZHJvaWQgY29tcGxpYW5jZSB0ZXN0aW5nIHJlcGVhdGVk
bHkgY2FsbCB0aGUKPiBjcmVhdGUgYmxvYiBJT0NUTCB3aGljaCBldmVudHVhbGx5IGV4aGF1c3Rz
IHRoZSBzeXN0ZW0gbWVtb3J5Lgo+IFRoaXMgc2VyaWVzIGFkZHMgYSBob29rIHdoaWNoIGFsbG93
cyBkcml2ZXJzIHRvIGltcG9zZSB0aGVpciBvd24KPiBsaW1pdGF0aW9ucyBvbiB0aGUgc2l6ZSBh
bmQvb3IgbnVtYmVyIG9mIGJsb2JzIGNyZWF0ZWQuCgpQcmV0dHkgc3VyZSB0aGlzIGlzbid0IGp1
c3QgYSBwcm9ibGVtIGZvciBtc20vZHB1IGFsb25lLCB3aHkgdGhpcyB2ZXJ5CmxpbWl0ZWQgYXBw
cm9hY2g/CgpBbHNvLCB3aHkgYXJlIHlvdXIgZnV6emVycyBub3QgYWxzbyBhbGxvY2F0aW5nIGVu
b3Jtb3VzIGFtb3VudHMgb2YgZ2VtCmJ1ZmZlcnMsIHdoaWNoIHdpbGwgYWxzbyBleGhhdXN0IG1l
bW9yeSBldmVudHVhbGx5PwotRGFuaWVsCgo+IAo+IFN0ZXZlIENvaGVuICgzKToKPiAgIGRybTog
YWRkIGRyaXZlciBob29rIGZvciBjcmVhdGUgYmxvYiBsaW1pdGF0aW9ucwo+ICAgZHJtL21zbTog
YWRkIHN1cHBvcnQgZm9yIGNyZWF0ZWJsb2JfY2hlY2sgZHJpdmVyIGhvb2sKPiAgIGRybS9tc20v
ZHB1OiBjaGVjayBibG9iIGxpbWl0YXRpb25zIGR1cmluZyBjcmVhdGUgYmxvYiBpb2N0bAo+IAo+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3Byb3BlcnR5LmMgICAgICAgICAgfCAgNyArKysrKysrCj4g
IGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYyB8IDE0ICsrKysrKysrKysr
KysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jICAgICAgICAgICB8IDI1ICsrKysr
KysrKysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fa21zLmggICAg
ICAgICAgIHwgIDEgKwo+ICBpbmNsdWRlL2RybS9kcm1fZHJ2LmggICAgICAgICAgICAgICAgICAg
fCAgOSArKysrKysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCj4gCj4g
LS0gCj4gVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9m
IHRoZSBDb2RlIEF1cm9yYSBGb3J1bSwKPiBhIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2
ZSBQcm9qZWN0Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
