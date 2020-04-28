Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5EE1BB73F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 09:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FEF6E147;
	Tue, 28 Apr 2020 07:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877196E13A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 07:09:57 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d15so21691020wrx.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 00:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lMEa6R/eYAIqk1WFDzSBGM7+C3iUTrOyPMrRdGdHxQI=;
 b=XK+3/aOKMdWUeiVuCoBZONtKCMfLLzYajSsCKOXfvsR6utqJUQhr+6FIry9ABFD6g1
 HFBeJpmo1mf3rvsdRFrXS8PXKlhAuKWiCd9I6K7lZfGYcZJ79v1T5YimjffH0G9yj87q
 aLSE8hWboyqXwcsegUE2bW4HB/6ZE6+LDN9X1l6E91g1+1xWVoCwP/OTOeOQUY/bk+IP
 ZYMbzeihgHkWc2ALWXiCsvcM6w3y3gNigL8hdyGqEsu+u9b0PIBuG+nKgpYIEUEBlD65
 LRvndNI/a7Stuwyeb/MaYykxFCyRuZKjpvL/mlSn+6riTQ/VGOs0cZMmhJ1yKIhho5/C
 9frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lMEa6R/eYAIqk1WFDzSBGM7+C3iUTrOyPMrRdGdHxQI=;
 b=Fi9mC1SjFU//goGZT+Haove79tRbsAGD+icqVkii7Qr+Latr1a8Z35MtIUoXXDBo+Z
 whbA9kBxj1/HduUdifL+LdASHYfFB+iVE4CnscHEwf8XJjTn5le5wswunaDHlOnc9xrj
 aPBngjdev2HZba7VpE1Xdasnv/JixYQZzNlJsdrtfpEG+7XmnsQ/f5oUez834kHfYABh
 8LIDVife0teeGI3Ntcn4MG4ncOnlKBCTTFRsranT8m25HgiSspASSy9ztrDy/BWPDlPx
 xCgeGKcBuuqdSxSpQABVrvqYXyYWgQ/bxD0asef1mqXwrg0u+EU1SGHvdYNTruonArL4
 xm1g==
X-Gm-Message-State: AGi0PuaYaQxpBxeEoEHKrJte55KgBfMbMPSN3/ofJBwQTKawiru6nOL9
 guOownDSyS/IqazJknU1rciP7w==
X-Google-Smtp-Source: APiQypK0KOM5V4C2Z5llck0w8pFFM5So+4+1Ay4saK2Pj2qjCPKB3yWrM321BmZUfw8SL8WDLVr+bw==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr31406670wrv.314.1588057796054; 
 Tue, 28 Apr 2020 00:09:56 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id j4sm23732081wrm.85.2020.04.28.00.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 00:09:55 -0700 (PDT)
Date: Tue, 28 Apr 2020 08:09:53 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] backlight: lp855x: Ensure regulators are disabled on
 probe failure
Message-ID: <20200428070953.GI3559@dell>
References: <20200224140748.2182-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224140748.2182-1-jonathanh@nvidia.com>
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
Cc: Milo Kim <milo.kim@ti.com>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyNCBGZWIgMjAyMCwgSm9uIEh1bnRlciB3cm90ZToKCj4gSWYgcHJvYmluZyB0aGUg
TFA4ODV4IGJhY2tsaWdodCBmYWlscyBhZnRlciB0aGUgcmVndWxhdG9ycyBoYXZlIGJlZW4KPiBl
bmFibGVkLCB0aGVuIHRoZSBmb2xsb3dpbmcgd2FybmluZyBpcyBzZWVuIHdoZW4gcmVsZWFzaW5n
IHRoZQo+IHJlZ3VsYXRvcnMgLi4uCj4gCj4gIFdBUk5JTkc6IENQVTogMSBQSUQ6IDI4OSBhdCBk
cml2ZXJzL3JlZ3VsYXRvci9jb3JlLmM6MjA1MSBfcmVndWxhdG9yX3B1dC5wYXJ0LjI4KzB4MTU4
LzB4MTYwCj4gIE1vZHVsZXMgbGlua2VkIGluOiB0ZWdyYV94dWRjIGxwODU1eF9ibCgrKSBob3N0
MXggcHdtX3RlZ3JhIGlwX3RhYmxlcyB4X3RhYmxlcyBpcHY2IG5mX2RlZnJhZ19pcHY2Cj4gIENQ
VTogMSBQSUQ6IDI4OSBDb21tOiBzeXN0ZW1kLXVkZXZkIE5vdCB0YWludGVkIDUuNi4wLXJjMi1u
ZXh0LTIwMjAwMjI0ICMxCj4gIEhhcmR3YXJlIG5hbWU6IE5WSURJQSBKZXRzb24gVFgxIERldmVs
b3BlciBLaXQgKERUKQo+IAo+ICAuLi4KPiAKPiAgQ2FsbCB0cmFjZToKPiAgIF9yZWd1bGF0b3Jf
cHV0LnBhcnQuMjgrMHgxNTgvMHgxNjAKPiAgIHJlZ3VsYXRvcl9wdXQrMHgzNC8weDUwCj4gICBk
ZXZtX3JlZ3VsYXRvcl9yZWxlYXNlKzB4MTAvMHgxOAo+ICAgcmVsZWFzZV9ub2RlcysweDEyYy8w
eDIzMAo+ICAgZGV2cmVzX3JlbGVhc2VfYWxsKzB4MzQvMHg1MAo+ICAgcmVhbGx5X3Byb2JlKzB4
MWMwLzB4MzcwCj4gICBkcml2ZXJfcHJvYmVfZGV2aWNlKzB4NTgvMHgxMDAKPiAgIGRldmljZV9k
cml2ZXJfYXR0YWNoKzB4NmMvMHg3OAo+ICAgX19kcml2ZXJfYXR0YWNoKzB4YjAvMHhmMAo+ICAg
YnVzX2Zvcl9lYWNoX2RldisweDY4LzB4YzgKPiAgIGRyaXZlcl9hdHRhY2grMHgyMC8weDI4Cj4g
ICBidXNfYWRkX2RyaXZlcisweDE2MC8weDFmMAo+ICAgZHJpdmVyX3JlZ2lzdGVyKzB4NjAvMHgx
MTAKPiAgIGkyY19yZWdpc3Rlcl9kcml2ZXIrMHg0MC8weDgwCj4gICBscDg1NXhfZHJpdmVyX2lu
aXQrMHgyMC8weDEwMDAgW2xwODU1eF9ibF0KPiAgIGRvX29uZV9pbml0Y2FsbCsweDU4LzB4MWEw
Cj4gICBkb19pbml0X21vZHVsZSsweDU0LzB4MWQwCj4gICBsb2FkX21vZHVsZSsweDFkODAvMHgy
MWM4Cj4gICBfX2RvX3N5c19maW5pdF9tb2R1bGUrMHhlOC8weDEwMAo+ICAgX19hcm02NF9zeXNf
ZmluaXRfbW9kdWxlKzB4MTgvMHgyMAo+ICAgZWwwX3N2Y19jb21tb24uY29uc3Rwcm9wLjMrMHhi
MC8weDE2OAo+ICAgZG9fZWwwX3N2YysweDIwLzB4OTgKPiAgIGVsMF9zeW5jX2hhbmRsZXIrMHhm
NC8weDFiMAo+ICAgZWwwX3N5bmMrMHgxNDAvMHgxODAKPiAKPiBGaXggdGhpcyBieSBlbnN1cmlu
ZyB0aGF0IHRoZSByZWd1bGF0b3JzIGFyZSBkaXNhYmxlZCwgaWYgZW5hYmxlZCwgb24KPiBwcm9i
ZSBmYWlsdXJlLgo+IAo+IEZpbmFsbHksIGVuc3VyZSB0aGF0IHRoZSB2ZGRpbyByZWd1bGF0b3Ig
aXMgZGlzYWJsZWQgaW4gdGhlIGRyaXZlcgo+IHJlbW92ZSBoYW5kbGVyLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEpvbiBIdW50ZXIgPGpvbmF0aGFuaEBudmlkaWEuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9scDg1NXhfYmwuYyB8IDIwICsrKysrKysrKysrKysrKystLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKQXBwbGll
ZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVj
aG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBT
b0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
