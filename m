Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BF2363C8A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 09:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226E26E1D8;
	Mon, 19 Apr 2021 07:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526626E1D8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 07:32:36 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c15so23900541wro.13
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 00:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Z8WpgIEyaNMIp2AG6J2yr0VQBL2GI1senNVwuLAl8l8=;
 b=ZQF7H/uM2rO49L9wpM9XllzZjitTbpXKWInesIXamkm9FCLyEWSAYYGY2w/0MNb5PE
 b5ESG/rXCvlhhb16xngbxkcyDZWxYpDi0tcoYEB5o7e/3L6g7OF6btvzN76aYAq/G10+
 0Eb4urisyR5zKISw5hHtHOGRZwGqbCNY8x4OO2ypbXcabXs4R8szDfjkJoIYydk9zfSU
 7/UxJwoN5KJ2rtk39R/PNfqepLj+Rj++PW3MyphjCJiFeWuI5b165CUFETQnewWKoGJd
 I69WZPf35biNVDZ6nR6XPRXUQUfBGrarporKZkSh34O/KX51oG0bm8XH9m3byyfDY+Ss
 vcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Z8WpgIEyaNMIp2AG6J2yr0VQBL2GI1senNVwuLAl8l8=;
 b=Hq3FIDXWOBAAz5kftqVbNNLzB/yITs6JWfikEIpF8ONWMD5l1yfJf4YPRQXXqdGOQe
 jki6csN5QLGA8GnoiuceEsYgHEsQfnlSC2bfAf4oLAqsjnPDld2/ZaM9VQQP1IP1v7Hf
 Z+H/CcBLEFJVwc5Js9Ol/BFEc2ji0LS4ybXnG/bvX70dGTGUvOk2X+bCVuvfLldjPZ63
 E96+I9FSRw5hPd/kAkS89PENpoR9+Mj5719WJEF6U09wSS8U7OrkWpuk0zc+uyKMGum+
 tmglw6e3zUEysjdBuNXhw2Erl/zgg2j7Hb6xNqkDpHWRZOrn7TeVMqO3X8ifWeYte2TP
 M52Q==
X-Gm-Message-State: AOAM530egWZ8Hfd88f9wFprogrJFteQx9sLMW4gPPYTg33BB8dN96o87
 9SiHuvUQAKnOFkvERLpkCLH2PF2XXrxdEA==
X-Google-Smtp-Source: ABdhPJx+cxP7LQa/qUpwTpH/IMyqh38VCbja+SonDd0qBBMbuOTUmqlP3W58Zo1ouVBaSuPseC56Ew==
X-Received: by 2002:adf:97d6:: with SMTP id t22mr12827899wrb.123.1618817555052; 
 Mon, 19 Apr 2021 00:32:35 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id 186sm18640349wme.10.2021.04.19.00.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:32:34 -0700 (PDT)
Date: Mon, 19 Apr 2021 08:32:32 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 22/40] drm/ttm/ttm_tt: Demote non-conformant kernel-doc
 header
Message-ID: <20210419073232.GE4869@dell>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-23-lee.jones@linaro.org>
 <2a85bf3c-d40e-6608-98f3-cd399f4df912@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a85bf3c-d40e-6608-98f3-cd399f4df912@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNiBBcHIgMjAyMSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKCj4gCj4gCj4gQW0g
MTYuMDQuMjEgdW0gMTY6Mzcgc2NocmllYiBMZWUgSm9uZXM6Cj4gPiBGaXhlcyB0aGUgZm9sbG93
aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPiA+IAo+ID4gICBkcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV90dC5jOjM5ODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJl
ciAnbnVtX3BhZ2VzJyBub3QgZGVzY3JpYmVkIGluICd0dG1fdHRfbWdyX2luaXQnCj4gPiAgIGRy
aXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmM6Mzk4OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0
ZXIgb3IgbWVtYmVyICdudW1fZG1hMzJfcGFnZXMnIG5vdCBkZXNjcmliZWQgaW4gJ3R0bV90dF9t
Z3JfaW5pdCcKPiA+IAo+ID4gQ2M6IENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KPiA+IENjOiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgo+ID4gQ2M6IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+Cj4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4g
U2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiAKPiBGb3Ig
dGhhdCBvbmUgSSB3b3VsZCByYXRoZXIgcHJlZmVyIHRvIGp1c3QgZG9jdW1lbnQgdGhlIHR3byBw
YXJhbWV0ZXJzLgoKTm8gcHJvYmxlbS4gIFdpbGwgZml4LgoKLS0gCkxlZSBKb25lcyBb5p2O55C8
5pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9y
ZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZh
Y2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
