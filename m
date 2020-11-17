Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2F12B6CA9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 19:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E24789316;
	Tue, 17 Nov 2020 18:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B99489316
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 18:13:44 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k2so24187649wrx.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 10:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XUZThx36p3R01Q+OVZgC7ap+liimQUklKkO3YYLInjI=;
 b=pX+RHuLMITy1MSvnEX1opAwiuvv2Np3vNifM0kwC8d6WVZyNg+AdihEsvkn3hXp8Re
 3nBbUAVATInJR21EJkc3p2bhareTwPXUWAqpw3/ekms5J0snEHbv1p3d8Pf4tG9SibXa
 3xGqQ+c/ywhiljpumUxG/N0OvVpjKfnVfY+PDKgNl9bkbp7LXGKyQpU+UPGAbZKmftbs
 Xdg0s+53b/b0+soH3/rDaMDGMfoxhU1m+5HRXA/7rJ+DW6UpwiJ5JID0XfGZUu6vvv37
 z5/KEC+pCxOXh0K1GaG0zl8YJUUco+0GjP+hYtzEoOriVXLN1y84GdGqcVaBQwmm7vDq
 kAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XUZThx36p3R01Q+OVZgC7ap+liimQUklKkO3YYLInjI=;
 b=F+ZSmZU+87lI9ixvXogqYy3QhfOnw4xZ6ssgmIk6roiYtjcyaRjExYPDPVtEtZv4H8
 8WRw7U0MRGN0lxkqMH8tMZaJx+ZUkEnURYzz4fEh9s+lDGDoAtCerYdaseGYZdXeWIJ7
 jS/pW4tddiTxdrXvd0O1uyrN9eslXx2lCZpXQyrBIxP2TjN2g8QqN8ott2xMiZC004Gv
 FQ8Du/WJcvwBhon1yXipXPwG9pmCpK5gGTSzULB4cCNW30O+Qyb2R8kavb63c6alwFyf
 G4G8v7QcCcqFv4eLmKHPgBJJEf+QY/A8KtP6uyjNZ68hhVA9slOCBGvxHWtF9hSeM+Cj
 fLtw==
X-Gm-Message-State: AOAM532FMtWI7wlI6g/+h7GJcui6hZaTiAHw0vSzMAMBOMeoLmV/WBX1
 Zocn/XmJqLnRTo9YFVCJrCWlq9Z4TjlDYi2B
X-Google-Smtp-Source: ABdhPJzdDhitlcjhywQsflVnI9g5fvH8tJ02VlY73QUwKH2fOOZiML4WaajFIWJsxc97BVGkQwFU0Q==
X-Received: by 2002:a5d:6050:: with SMTP id j16mr897945wrt.158.1605636822648; 
 Tue, 17 Nov 2020 10:13:42 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id x6sm4815167wmc.48.2020.11.17.10.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 10:13:41 -0800 (PST)
Date: Tue, 17 Nov 2020 18:13:40 +0000
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: Re: [PATCH 03/42] drm/drm_dp_mst_topology: Remove set but never used
 variable 'len'
Message-ID: <20201117181340.GM1869941@dell>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-4-lee.jones@linaro.org>
 <20201117172925.GN401619@phenom.ffwll.local>
 <20201117181250.GL1869941@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117181250.GL1869941@dell>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxNyBOb3YgMjAyMCwgTGVlIEpvbmVzIHdyb3RlOgoKPiBPbiBUdWUsIDE3IE5vdiAy
MDIwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IAo+ID4gT24gTW9uLCBOb3YgMTYsIDIwMjAgYXQg
MDU6NDA6MzNQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPiBGaXhlcyB0aGUgZm9sbG93
aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPiA+ID4gCj4gPiA+ICBkcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jOiBJbiBmdW5jdGlvbiDigJhkcm1fZHBfc2VuZF9x
dWVyeV9zdHJlYW1fZW5jX3N0YXR1c+KAmToKPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmM6MzI2Mzo2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhsZW7igJkgc2V0IGJ1
dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiA+ID4gCj4gPiA+IENjOiBN
YWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4g
PiBDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+ID4gPiBDYzogVGhvbWFz
IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gPiA+IENjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+Cj4gPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+Cj4gPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gPiAKPiA+IEdvaW5n
IHRvIGFwcGx5IHRoaXMsIGJ1dCBJIG5vdGljZWQgdGhhdCB0aGUgcmV0dXJuIHZhbHVlIG9mIHRo
ZQo+ID4gYnVpbGRfcXVlcnlfc3RyZWFtX2VuY19zdGF0dXMoKSBpcyBwb2ludGxlc3MuIENhbiB5
b3UgcGxzIGZvbGxvdyB1cCB3aXRoCj4gPiBhbiBhZGRpdGlvbmFsIHBhdGNoIHRvIGNoYW5nZSB0
aGF0IHRvIHZvaWQ/Cj4gCj4gSSBjYW4uCgpMb29rcyBsaWtlIHlvdSdyZSBnZXR0aW5nIGRyb3Bw
ZWQgYWdhaW4hCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVh
ZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
