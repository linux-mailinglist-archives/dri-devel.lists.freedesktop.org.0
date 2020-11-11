Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090A72AE974
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3258289DED;
	Wed, 11 Nov 2020 07:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D48B89DED
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 07:16:08 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a65so1360022wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 23:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+nPLAs9D2ufq7P4TZ41Op/D3bZShS4W5mF/VA6cz7/U=;
 b=mhLpXVeLoB/gkb+Az2aKW+BxBUlNW8rOmuRdOt96oIEMScXjIzJcNXw+VyxJ2zyqqD
 63lwWwl1iABwU2vFZf+lFGzPhbV4zMGFQddJNtt4jKve+Eafqby5GghY9WhQJdlQqZVl
 YXOQuEYjZinIUoRx5rvmldASKFngyXdqpzIKEB5JzqOuwtXJsbfCV24ikJTrExjv9xPx
 EKunKqMNq5IHYKC0EfAMyeLkY2J5rxBHYqSy2jqLO0Iiars08t2njEz+EVypbmWcQFVT
 Wn9Uk2cW+kMLbLWMOIBtFWj9Rov1xWzWiZSppd2jTU1Qvra5tSmai8BsptEgEp/doiTJ
 zzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+nPLAs9D2ufq7P4TZ41Op/D3bZShS4W5mF/VA6cz7/U=;
 b=o6qEHoguntP2Ce7mbzLlfr9jMZ0iX8Unsq0H96zj8Gb0sG5fC9YsG0SCFrB5V0qpMP
 01zQdhA0QWvyVOnxImtKEBm1YZU5x1k0zHFUWQuZiOzQovGTOQqS1CqQLNRc8Ca8UmwB
 V0iNFsdepxMpW3tJW15ECxaLplEYVLkiGJHs9d3FcR+aLXRC+paddeRAwTCEfOUsoMu7
 Xawy514S8RhxsdWcKOi1HiPVqCENyLgtXUKk6yx+xnfdq1OMyMhBB783aipEh13o/unQ
 kG+vxoIfxlXeWWJUukbok7WpS2NXAlCyRIB2QOktj1Rp3kdCDbvlChIDhFsFKyI2jVOv
 gLfg==
X-Gm-Message-State: AOAM5318Ca3b/oovGtrXk5DPo2Qk+eBl74W8vl+bfOLHSVjc0IL1AiNu
 sP8vbuPBJ9RWKhvIRkE8S3wuEA==
X-Google-Smtp-Source: ABdhPJxq9nNsRdWxmsjRvYKprThebW/E99OrwREqb9B0XCSt/1vALQHP41UyvyzHl/CpRtuLhn++Fg==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr2293473wmg.21.1605078966759; 
 Tue, 10 Nov 2020 23:16:06 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id w1sm1275524wro.44.2020.11.10.23.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 23:16:06 -0800 (PST)
Date: Wed, 11 Nov 2020 07:16:04 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 01/30] drm/radeon/evergreen: Add comment for
 'evergreen_page_flip()'s 'async' param
Message-ID: <20201111071604.GN2063125@dell>
References: <20201110193112.988999-1-lee.jones@linaro.org>
 <20201110193112.988999-2-lee.jones@linaro.org>
 <CADnq5_MMDnk7fvoOv8poVvCx1EVGQ0XvujHG=fBwR5XgSO+qww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_MMDnk7fvoOv8poVvCx1EVGQ0XvujHG=fBwR5XgSO+qww@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMCBOb3YgMjAyMCwgQWxleCBEZXVjaGVyIHdyb3RlOgoKPiBPbiBUdWUsIE5vdiAx
MCwgMjAyMCBhdCAyOjMxIFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IHdyb3Rl
Ogo+ID4KPiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMp
Ogo+ID4KPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5jOiBJbiBmdW5jdGlv
biDigJhldmVyZ3JlZW5fZ3B1X2luaXTigJk6Cj4gPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9l
dmVyZ3JlZW4uYzoxNDE5OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdh
c3luYycgbm90IGRlc2NyaWJlZCBpbiAnZXZlcmdyZWVuX3BhZ2VfZmxpcCcKPiA+Cj4gPiBDYzog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+ID4gQ2M6ICJDaHJpc3Rp
YW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4gQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+Cj4gPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IENjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxl
ZS5qb25lc0BsaW5hcm8ub3JnPgo+IAo+IEFwcGxpZWQgd2l0aCBtaW5vciBmaXh1cHMuICBUaGFu
a3MhCgpTdXBlcnN0YXIhICBUaGFua3MgQWxleC4KCk9uY2UgdGhlc2UgYXJlIGFsbCBpbiAtbmV4
dCwgSSdsbCByZWJhc2UgYW5kIGZpeCB0aGUgc3RyYWdnbGVycy4KCi0tIApMZWUgSm9uZXMgW+ad
jueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJv
OiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
