Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0402684F33
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 16:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817A96E721;
	Wed,  7 Aug 2019 14:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F035D6E722
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 14:55:00 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id n205so32471024ywb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 07:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xmx+csY4vRNvkKoNZvN9t1G87O/ep00tipJ0lHUDLFM=;
 b=nHCfHG0jSAks0pgYa4bAzrEG8rY/aDWjShn3gWq74VPCtlVyQui3vJ9jF75OAuoaP/
 MysiDsFHjBnQU2jk1qy2rp2EkPitit6AN8Y9PZgsxYEWTwRTitoHKCbPEe3Pv0O44Ox/
 DzI5q6ZxahCdgU9qr5yiZhVxTOiV6h+i7D850Cz23Rf44COopVrQYn+TBUq6VdVTYkNl
 eLRbUJ0yCXcut60rf9gmAGwjKgdHjE2/EnEiWRpkzthDAF0tv3eC4+ajPyCnhXdcjhMO
 LuECTy47TgwJKfAJXP3tge9Ub6Qy5M4fKNOH19sF+7MdfIIdX2zz+05nKHB7uJxp6PJa
 MY2A==
X-Gm-Message-State: APjAAAXA2fwnwhww4nIytscI29YB2mzZNmZVYwL9W0X+fehuojSDGe/x
 uEX80eh4FGEljxylj2vXNaa1ujXX1qM=
X-Google-Smtp-Source: APXvYqycL61NTg8vXqF7mrzV89N2EoCsvwYZyIMlJk/Fyb2OSbMMu80d/HFEp+QlfZRyF+MF4A+J3A==
X-Received: by 2002:a81:9b07:: with SMTP id s7mr6036421ywg.203.1565189699988; 
 Wed, 07 Aug 2019 07:54:59 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d124sm21422390ywc.100.2019.08.07.07.54.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 07:54:59 -0700 (PDT)
Date: Wed, 7 Aug 2019 10:54:59 -0400
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, robh@kernel.org, emil.velikov@collabora.com
Subject: Re: [PATCH 0/2] drm/panfrost: Revert drm_gem_map_offset changes
Message-ID: <20190807145459.GA104440@art_vandelay>
References: <20190807145253.2037-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807145253.2037-1-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xmx+csY4vRNvkKoNZvN9t1G87O/ep00tipJ0lHUDLFM=;
 b=OSfbSvWZhnfQh6VB25sUlwoasuaycyc6bhrPgAquXfRDjBAtx5rDBlMvj9JNUpqUme
 YUyPBI3rx83bTS3wK8loCnyHrwcwvxcanrJp7qgmawyTW6ypau3NGsuXyWy87QfZDKri
 I4WfoVf0jvDtFmOS0gbDIbm5gOlmWMCpEkAd2mv5aCZpjERnZJq+7EfQ7n8ymjVTmXdR
 wq53UaWFZWzzCA5UnkvbnEHo6ov8wtZCSFJ0+pjS+ilF/dC8zt4CHuFX+zUMjFBGHp73
 yo/MtAi+Ofud/WIdUVxVoisYc2kGv2CklWLznu9N1x4tdCoiRYgvvgS4vFF+TWGCuMUd
 LCOw==
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
Cc: Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMTA6NTI6NDZBTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IFdoZW4gSSBz
dGFydGVkIHJlLWFwcGx5aW5nIHRoZXNlIEkgcmVhbGl6ZWQgdGhleSBoYWRuJ3QgaGl0IHRoZSBs
aXN0Lgo+IAo+IFNlYW4KPiAKPiBSb2IgSGVycmluZyAoMik6Cj4gICBSZXZlcnQgImRybS9nZW06
IFJlbmFtZSBkcm1fZ2VtX2R1bWJfbWFwX29mZnNldCgpIHRvCj4gICAgIGRybV9nZW1fbWFwX29m
ZnNldCgpIgo+ICAgUmV2ZXJ0ICJkcm0vcGFuZnJvc3Q6IFVzZSBkcm1fZ2VtX21hcF9vZmZzZXQo
KSIKCk5vdGUgSSBoYXZlIHRoZSBvcmRlciBtZXNzZWQgdXAsIHNvIHdpbGwgc3dhcCBpdCB3aGVu
IEkgYXBwbHkgKGFuZCBwcm9wZXJseQpjb21waWxlIHRlc3QgaW4gYmV0d2VlbiA6LykKClNlYW4K
Cj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHVtYl9idWZmZXJzLmMgICAgICB8ICA0ICsrLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyAgICAgICAgICAgICAgIHwgMTAgKysrLS0tLS0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmMgfCAgMyArKy0KPiAg
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIHwgMTYgKysrKysrKysrKysr
KystLQo+ICBpbmNsdWRlL2RybS9kcm1fZ2VtLmggICAgICAgICAgICAgICAgICAgfCAgNCArKy0t
Cj4gIDUgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4g
Cj4gLS0gCj4gU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0g
T1MKPiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1
bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
