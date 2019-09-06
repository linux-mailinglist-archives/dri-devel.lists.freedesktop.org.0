Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 934EDAB4C6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 11:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78239894DE;
	Fri,  6 Sep 2019 09:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C674894DE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 09:20:05 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a23so3431197edv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2019 02:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=MxZ3K4aGxu4P+gvU3JRA4Jf7N+aFzXI3Kx5uSFiUvTM=;
 b=AYnyLPPJycIFnFCtNeUqoDlxwm3hIshgXOlKb+3tjTsd1Z5mWYL29/szMq8MvgJyuz
 oOkKBuLxHrWFY7E+7YEvV4tNU+PtvVWhG+1ketps7E5hM/cwD87tvut0ACALp28z0X9P
 N4MNhdENtiyYHwPY/8reCQk0ZNLsDg9Kt14fRBsMl8EUATLTJMNJS9Sou3LFkrs5vPe2
 XqWWLFAyPcAwsDUHZWDm6YmmKRfJB3cm2Jan7rTbXsw4N+EyHZmJ6Jdv+QGCvmRJHTz5
 9vy9/kIyM7ll3dcSleTTzeIt76mXjkMptUi8auhhhO9oqCoA/I6dMiYtawInUfX54goI
 yPlQ==
X-Gm-Message-State: APjAAAUQAgdrlb2z9bBlu7Vyd9u1qtwvNb9jBLYtRwGlobKnEeUnXpsX
 3JOXxH9Wuxz7C58wfZqbo1OUoSEl6bs=
X-Google-Smtp-Source: APXvYqwk2cHOmHqRGZ9oDHFlNACtHmml1CwiRZ6PR2ODFtJIsnY6oSXKlRDKljMX+Sv+cXHpmwWTyQ==
X-Received: by 2002:a50:a0e2:: with SMTP id 89mr8329122edo.118.1567761603549; 
 Fri, 06 Sep 2019 02:20:03 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j30sm841443edb.8.2019.09.06.02.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 02:20:02 -0700 (PDT)
Date: Fri, 6 Sep 2019 11:20:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/8] drm/ttm: remove embedded vma_manager from
 ttm_bo_device
Message-ID: <20190906092000.GC3958@phenom.ffwll.local>
References: <20190905070509.22407-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190905070509.22407-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MxZ3K4aGxu4P+gvU3JRA4Jf7N+aFzXI3Kx5uSFiUvTM=;
 b=Up8v9pN1I5w3Wr2yPL1WNA9TJRgAax6BogP/bSC6AI6J2jgNFEeAqA/vdm54x5iiaM
 2SO5dzwDy0SK9bEPIWGUf4VlFZdAPUERNmHtL+bpGYskUhRWsmQ5C2xhqRaNiyuza+N9
 9F6n8t5wZqCrhAoLuNlYjIJHxI6WNejd3iZLQ=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMDk6MDU6MDFBTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiAKPiAKPiBHZXJkIEhvZmZtYW5uICg4KToKPiAgIGRybS90dG06IHR1cm4gdHRtX2Jv
X2RldmljZS52bWFfbWFuYWdlciBpbnRvIGEgcG9pbnRlcgo+ICAgZHJtL25vdXZlYXU6IHN3aXRj
aCB0byBnZW0gdm1hIG9mZnNldCBtYW5hZ2VyCj4gICBkcm0vdnJhbTogc3dpdGNoIHRvIGdlbSB2
bWEgb2Zmc2V0IG1hbmFnZXIKPiAgIGRybS9yYWRlb246IHN3aXRjaCB0byBnZW0gdm1hIG9mZnNl
dCBtYW5hZ2VyCj4gICBkcm0vYW1kZ3B1OiBzd2l0Y2ggdG8gZ2VtIHZtYSBvZmZzZXQgbWFuYWdl
cgo+ICAgZHJtL3F4bDogc3dpdGNoIHRvIGdlbSB2bWEgb2Zmc2V0IG1hbmFnZXIKPiAgIGRybS92
bXdnZng6IHN3aXRjaCB0byBvd24gdm1hIG1hbmFnZXIKPiAgIGRybS90dG06IHJlbW92ZSBlbWJl
ZGRlZCB2bWFfb2Zmc2V0X21hbmFnZXIKCk5pY2UuIE9uIHRoZSBzZXJpZXM6CgpSZXZpZXdlZC1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCkFzc3VtaW5nIGl0IGNv
bXBpbGVzLCBJJ3ZlIHJlbGllZCBvbiB0aGF0IHdoZW4gcmV2aWV3aW5nLgoKQnV0IGRlZmluaXRl
bHkgd2FpdCBmb3IgYSBmZXcgbW9yZSBkYXlzIGZvciBhY2tzIGJlZm9yZSBsYW5kaW5nIGl0IGFs
bC4KLURhbmllbAoKCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oICAg
ICB8ICAxICsKPiAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCAgICAgICAgIHwgIDYg
KysrKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8ICAxICsK
PiAgZHJpdmVycy9ncHUvZHJtL2RybV92cmFtX21tX2hlbHBlci5jICAgIHwgIDEgKwo+ICBkcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jICAgfCAgMSArCj4gIGRyaXZlcnMvZ3B1
L2RybS9xeGwvcXhsX3R0bS5jICAgICAgICAgICB8ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fdHRtLmMgICAgIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
by5jICAgICAgICAgICAgfCAxNCArKysrKysrLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9ib192bS5jICAgICAgICAgfCAgNiArKystLS0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfZHJ2LmMgICAgIHwgIDUgKysrKysKPiAgMTAgZmlsZXMgY2hhbmdlZCwgMjUgaW5z
ZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gCj4gLS0gCj4gMi4xOC4xCj4gCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKRGFuaWVs
IFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
