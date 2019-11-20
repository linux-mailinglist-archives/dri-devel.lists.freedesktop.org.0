Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3E51040E2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 17:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62F66E89F;
	Wed, 20 Nov 2019 16:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D09D6E89F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 16:36:08 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q70so283406wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 08:36:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=omWiA+8UvJju/f0RhpZnlfMjZi7KNti/SjVz56D+iCM=;
 b=t4Hn6Tww9fMekCosemPDnJb48qTg1PVXULqzts9pzXPSb7UBzPOk4EW1ZVsvFiMKsE
 Kp0Zqz/Pc0nl+AR3GJltloc7rWhUMfigkJCeK0/tDhwfZZwS0awWnw4mdu/FbOnVq40Q
 9QA9D1jGGdWpfjBr68M/KI8VcOOy++UeVkZIlCkVMY4FlLYBtGqMQzvvldK72VRJpNWg
 klr/N23E+S+Lqlc5g+ljMlHcuhAgdZABZVTyOFiarjo0nTCJ7b229OvEvD7cqibmSOIh
 etDXg+z0fJLPI+GvlSSOPr6HN6E5zqUwntQjMmGOZ6B8kw7088iDAAnbRLDFmFTbmtji
 sz3w==
X-Gm-Message-State: APjAAAV3N/dUEI9Y5v1Q9xjiMHd5vnwYpQe4h+jrZBqNq3WmA4ZnLIe9
 0RxrDNdDxevWUCjz9pP1lcY1YFoN2UM=
X-Google-Smtp-Source: APXvYqzIBVBtoDa0M7K4+BNAPUZpAVBHu/NYxZkMSpGxBdxeihs2POYM3n+zTBi3yyJULegORyw67Q==
X-Received: by 2002:a1c:9804:: with SMTP id a4mr4209118wme.57.1574267766731;
 Wed, 20 Nov 2019 08:36:06 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id y189sm7313992wmb.13.2019.11.20.08.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 08:36:06 -0800 (PST)
Date: Wed, 20 Nov 2019 17:36:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] drm/udl: Fix Kconfig indentation
Message-ID: <20191120163604.GM30416@phenom.ffwll.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
References: <20191120133341.6582-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120133341.6582-1-krzk@kernel.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=omWiA+8UvJju/f0RhpZnlfMjZi7KNti/SjVz56D+iCM=;
 b=hRL2tDCx6el6phLJYT7VKJlIX9kzoD6aoLA5K6Quu6d5IPDsTr71zv52h72hxlh+ts
 k5xd6qylRBcFDMnPQKbpMvLHiYgFgMcW1GfxLnNLg2AfBMLsqmVYQBi2W3R9QPzs6Rkz
 MKweV/MqvChxeLfqbXRa8L6PYJhM9s3X4dxIE=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDk6MzM6NDFQTSArMDgwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBBZGp1c3QgaW5kZW50YXRpb24gZnJvbSBzcGFjZXMgdG8gdGFiICgrb3B0
aW9uYWwgdHdvIHNwYWNlcykgYXMgaW4KPiBjb2Rpbmcgc3R5bGUgd2l0aCBjb21tYW5kIGxpa2U6
Cj4gCSQgc2VkIC1lICdzL14gICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KClF1ZXVlZCBmb3Ig
NS42IGluIGRybS1taXNjLCB0aGFua3MgZm9yIHlvdXIgcGF0Y2guCi1EYW5pZWwKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL3VkbC9LY29uZmlnIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3VkbC9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL3VkbC9LY29uZmlnCj4gaW5kZXggYjRk
MTc5Yjg3ZjAxLi5iMTNhYTMzOTkwZjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Vk
bC9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC9LY29uZmlnCj4gQEAgLTgsNCAr
OCw0IEBAIGNvbmZpZyBEUk1fVURMCj4gIAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiAgCWhlbHAK
PiAgCSAgVGhpcyBpcyBhIEtNUyBkcml2ZXIgZm9yIHRoZSBVU0IgZGlzcGxheWxpbmsgdmlkZW8g
YWRhcHRlcnMuCj4gLSAgICAgICAgICBTYXkgTS9ZIHRvIGFkZCBzdXBwb3J0IGZvciB0aGVzZSBk
ZXZpY2VzIHZpYSBkcm0va21zIGludGVyZmFjZXMuCj4gKwkgIFNheSBNL1kgdG8gYWRkIHN1cHBv
cnQgZm9yIHRoZXNlIGRldmljZXMgdmlhIGRybS9rbXMgaW50ZXJmYWNlcy4KPiAtLSAKPiAyLjE3
LjEKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
