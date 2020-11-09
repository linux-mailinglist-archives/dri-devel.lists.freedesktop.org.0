Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 552A92AC093
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 17:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890DF89AA7;
	Mon,  9 Nov 2020 16:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D70789AA7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 16:13:02 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p1so9264153wrf.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 08:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8oYNPs7w2/EjOECIoZ9B9wqcB23zpJY9uTwhUzFm9nc=;
 b=TGkGYjkrU/ZSFOiudjN6HPEiyavpORnj47D2O97PHBS2RfhWzGY4N2LIevKBua2ELm
 SC+SxjLBhKB0ZfFHsI03aClpLTtkg1vB6YdOCKHzM8p1OHu71LGApBlmaNsfavoy6xrm
 ZaxGvDOrPYxwob2I2i6RhEVoH20fyMQxZcJXJSZBlvwTnSdodz/jU/g3ALeZRW/eSIeN
 CoJcZ4pLEt93iqD0FSsdnytSFnlmlXyQ3AEbYXl+tNHj5/n8ss0BnuwOKXxZJPO6nMX9
 tcsApkdAo5UO709ET5ShnRMk1dNWxfJf1Lt6ylp4hIHxYbUNcU1CHTektiM7WXNBTzER
 EUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8oYNPs7w2/EjOECIoZ9B9wqcB23zpJY9uTwhUzFm9nc=;
 b=mhnGqkK3/s7vpgxWnivbdlgHzW20MoVlOVIMJ27e4gw7+ZHzT/zrzZ9fttjFEehkT5
 i1PbD8xzbMp+6vR8lzbbX2oBiwN6nLxjbbdwvQc6iSECJwqVoAOODoj33B6p5xMBFwvd
 KcpS2Ege9rl8I9veBKfrGdeVZi1yX+0YgA8U0moocgk0gQ001x2f17cMPcSc/UQ89naK
 0S+CXJzmeHuloRJvKlP2Wmg+0ZGPbp74dkzp0R7rJ+PJ2YCSSYFuFwPRken0unQBG1So
 pBXFZ8OSYSvfPNv14LJEZ8G2qDVl7H1V73Ogkeu3eivmUc0hln9XdOPs59f4wbsxc7nv
 4dhg==
X-Gm-Message-State: AOAM532IW1aAYds0qlriy3xxL/+VuAadPTMQorc754dM8K2ptjV1Vp3V
 OvPVQ0pzjHLOSSOneC/0Hur4ZqsAQQpeOIxO
X-Google-Smtp-Source: ABdhPJzUvDyBZZ+ARYrz71v28PSz+z2eeKcayyARzkxJA3CZpbdef/sjlMSuhqPi+Lu21gb0N0uoaw==
X-Received: by 2002:adf:f5c8:: with SMTP id k8mr12142617wrp.2.1604938380824;
 Mon, 09 Nov 2020 08:13:00 -0800 (PST)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g20sm6210956wmh.20.2020.11.09.08.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 08:13:00 -0800 (PST)
Date: Mon, 9 Nov 2020 16:12:58 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 14/19] gpu: drm: selftests: test-drm_dp_mst_helper: Place
 'struct drm_dp_sideband_msg_req_body' onto the heap
Message-ID: <20201109161258.GX2063125@dell>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-15-lee.jones@linaro.org>
 <20201109151937.GF6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109151937.GF6112@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, David Francis <David.Francis@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwOSBOb3YgMjAyMCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgoKPiBPbiBUaHUsIE5v
diAwNSwgMjAyMCBhdCAwMjo0NToxMlBNICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBUaGUg
c3RhY2sgaXMgdG9vIGZ1bGwuCj4gPiAKPiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5l
bCBidWlsZCB3YXJuaW5nKHMpOgo+ID4gCj4gPiAgZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90
ZXN0LWRybV9kcF9tc3RfaGVscGVyLmM6IEluIGZ1bmN0aW9uIOKAmHNpZGViYW5kX21zZ19yZXFf
ZW5jb2RlX2RlY29kZeKAmToKPiA+ICBkcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJt
X2RwX21zdF9oZWxwZXIuYzoxNjE6MTogd2FybmluZzogdGhlIGZyYW1lIHNpemUgb2YgMTE3NiBi
eXRlcyBpcyBsYXJnZXIgdGhhbiAxMDI0IGJ5dGVzIFstV2ZyYW1lLWxhcmdlci10aGFuPV0KPiA+
IAo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+IENjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0
LmNvbT4KPiA+IENjOiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Cj4gPiBD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogTGVl
IEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+IC0tLQo+ID4gIC4uLi9kcm0vc2VsZnRl
c3RzL3Rlc3QtZHJtX2RwX21zdF9oZWxwZXIuYyAgICB8IDI5ICsrKysrKysrKysrKy0tLS0tLS0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2Rw
X21zdF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0
X2hlbHBlci5jCj4gPiBpbmRleCAxZDY5NmVjMDAxY2ZmLi4wYTUzOTQ1NmY2ODY0IDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVy
LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hl
bHBlci5jCj4gPiBAQCAtMTIwLDQ0ICsxMjAsNTEgQEAgc2lkZWJhbmRfbXNnX3JlcV9lcXVhbChj
b25zdCBzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19yZXFfYm9keSAqaW4sCj4gPiAgc3RhdGlj
IGJvb2wKPiA+ICBzaWRlYmFuZF9tc2dfcmVxX2VuY29kZV9kZWNvZGUoc3RydWN0IGRybV9kcF9z
aWRlYmFuZF9tc2dfcmVxX2JvZHkgKmluKQo+ID4gIHsKPiA+IC0Jc3RydWN0IGRybV9kcF9zaWRl
YmFuZF9tc2dfcmVxX2JvZHkgb3V0ID0gezB9Owo+ID4gKwlzdHJ1Y3QgZHJtX2RwX3NpZGViYW5k
X21zZ19yZXFfYm9keSAqb3V0Owo+IAo+IEhvdyBiaWcgaXMgaXQ/IEFuZCB3aHkgaXMgaXQgdGhh
dCBiaWc/CgpJdCdzIGEgc3RydWN0IG9mIGEgdW5pb24gb2Ygc3RydWN0cy4KCkFuZCBpdCdzIGFs
bCBhbGxvY2F0ZWQgb24gdGhlIHN0YWNrLiAgQmFkIG5ld3MhCgotLSAKTGVlIEpvbmVzIFvmnY7n
kLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8u
b3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzog
RmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
