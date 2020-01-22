Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC23144D1E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6776F3BE;
	Wed, 22 Jan 2020 08:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040F36F3BE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 08:19:10 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t14so6140481wmi.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 00:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=ahqJi39L7hCmLZPOpPTNeDXrK6DDNhPTKiMAbD2ywhE=;
 b=F9sZ0g+1suMsinawzZ2+380DXDooohvMYhrtAigpsje4enqGS/E3s0VpLBwSqO1j8b
 Amc4lUyYFP9yeCXzfVLT+K9Judmv/BsI0HVUB9Sy+j7iPmjkQzVS/mTdCnbkEqvXvLf1
 784XmubZcHuyL7KHcsx8O6+B5bh3MN77272sQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=ahqJi39L7hCmLZPOpPTNeDXrK6DDNhPTKiMAbD2ywhE=;
 b=OxuyHmqbe96DwuQsM2e7afVc6mtnViYwMa0+i+i9NAwB1GHJw1B6fw6xD9GMr/G8D9
 8kiOG2KT5wgXzHtQLEgM0JvDfEX9zMpU6Mn5UPD15qW7pLxFohMD3Myo1CSsktIIqy/L
 Wxmw2ZZexYc7IItLcecpZuRMaiKfXMi8Y6xTfs7gx9mXQs9ZFeB77/2ztQpaXuyg7uf2
 Sd1RSagY8YC+bMUllyLTEYBqL1oRy5iHdA+pe4wqjF+7KE10qM4HTfgWEVUyMgvdGLRk
 zpLLLsmPKThx9IJxZBnezxVRNisJAK9baXRsTalDirW0V5UJaxWCrRNg0nNhFTfCConV
 rmig==
X-Gm-Message-State: APjAAAWCOS0kr5bodmcDOrbuFHiI2N52ld4eWRxk3jakwgWICkz3XykE
 g8Usn10oGLNcPDzw1CcIVXGgHA==
X-Google-Smtp-Source: APXvYqwN9OhE8aTeF0own3s/Ooyt3OHRegbX3r4sudjELKIGb7qKe67NW4lGo+Sw1GcVN7BxEniEJA==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr1670290wmg.92.1579681149325; 
 Wed, 22 Jan 2020 00:19:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z11sm58565947wrt.82.2020.01.22.00.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 00:19:08 -0800 (PST)
Date: Wed, 22 Jan 2020 09:19:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Bo YU <tsu.yubo@gmail.com>
Subject: Re: [PATCH -next] drm/drm_dp_mst:remove set but not used variable
 'origlen'
Message-ID: <20200122081906.GO43062@phenom.ffwll.local>
Mail-Followup-To: Bo YU <tsu.yubo@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 irlied@linux.ie, airlied@redhat.com, tprevite@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200118080628.mxcx7bfwdas5m7un@kaowomen.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200118080628.mxcx7bfwdas5m7un@kaowomen.cn>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: tprevite@gmail.com, irlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKYW4gMTgsIDIwMjAgYXQgMDQ6MDY6MjhQTSArMDgwMCwgQm8gWVUgd3JvdGU6Cj4g
Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgo+IAo+IGRyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmM6MzY5MzoxNjogd2FybmluZzogdmFyaWFi
bGUKPiDigJhvcmlnbGVu4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFy
aWFibGVdCj4gICBpbnQgcmVwbHlsZW4sIG9yaWdsZW4sIGN1cnJlcGx5Owo+IAo+IEl0IGxvb2tz
IGxpa2UgbmV2ZXIgdXNlIHZhcmlhYmxlIG9yaWdsZW4gYWZ0ZXIgYXNzaWduIHZhbHVlIHRvIGl0
Lgo+IAo+IEZpeGVzOiBhZDdmOGExZjljZWQ3IChkcm0vaGVscGVyOiBhZGQgRGlzcGxheXBvcnQg
bXVsdGktc3RyZWFtIGhlbHBlciAodjAuNikpCj4gU2lnbmVkLW9mZi1ieTogQm8gWVUgPHRzdS55
dWJvQGdtYWlsLmNvbT4KClF1ZXVlZCBpbiBkcm0tbWlzYy1uZXh0LCB0aGFua3MgZm9yIHlvdXIg
cGF0Y2guCi1EYW5pZWwKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMgfCAzICstLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gaW5kZXggNGI3
NDE5M2I4OWNlLi40Yzc2ZTY3MzIwNmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9tc3RfdG9wb2xvZ3kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3Rv
cG9sb2d5LmMKPiBAQCAtMzY5MCw3ICszNjkwLDcgQEAgc3RhdGljIGJvb2wgZHJtX2RwX2dldF9v
bmVfc2JfbXNnKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLCBib29sIHVwKQo+
ICB7Cj4gIAlpbnQgbGVuOwo+ICAJdTggcmVwbHlibG9ja1szMl07Cj4gLQlpbnQgcmVwbHlsZW4s
IG9yaWdsZW4sIGN1cnJlcGx5Owo+ICsJaW50IHJlcGx5bGVuLCBjdXJyZXBseTsKPiAgCWludCBy
ZXQ7Cj4gIAlzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19yeCAqbXNnOwo+ICAJaW50IGJhc2Vy
ZWcgPSB1cCA/IERQX1NJREVCQU5EX01TR19VUF9SRVFfQkFTRSA6IERQX1NJREVCQU5EX01TR19E
T1dOX1JFUF9CQVNFOwo+IEBAIC0zNzEwLDcgKzM3MTAsNiBAQCBzdGF0aWMgYm9vbCBkcm1fZHBf
Z2V0X29uZV9zYl9tc2coc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsIGJvb2wg
dXApCj4gIAl9Cj4gIAlyZXBseWxlbiA9IG1zZy0+Y3VyY2h1bmtfbGVuICsgbXNnLT5jdXJjaHVu
a19oZHJsZW47Cj4gIAo+IC0Jb3JpZ2xlbiA9IHJlcGx5bGVuOwo+ICAJcmVwbHlsZW4gLT0gbGVu
Owo+ICAJY3VycmVwbHkgPSBsZW47Cj4gIAl3aGlsZSAocmVwbHlsZW4gPiAwKSB7Cj4gLS0gCj4g
Mi4xMS4wCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
