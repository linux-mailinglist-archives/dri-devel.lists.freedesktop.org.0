Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C3F2B1113
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 23:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BE76E0BE;
	Thu, 12 Nov 2020 22:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F55B6E12B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 22:10:42 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c9so6532791wml.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 14:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0qnbq+VtAYJrqLWmWFv2NmhXM3gXrWp9ucRRD3D1vUY=;
 b=iurwi1R3VHGsEx/f+7EjFPiApRwfwXMCzMmqI1yZLs+X4Wz84WVe3aHLMI4/r074Ik
 1mrFDwWH6SdRYYfV9I8eiEQN03vjyaTp+IGIVjtVhaGB4rpD3Lc/lpl/XPpmkLEayseP
 kj29vLukJL9y/nm+6MCJofb8j136/9ir9GAFOs0xqmKnny1Z4npsaIiZ6x4GvfYEojJr
 Dsv8i0Kj33Z/VBn1IOW8kE+O9qXoxW4ani7DZIQqh1yPZqGEnOXc39ofXOsZqLEeb/aO
 WuVrCpYK9dlpqPUGvwVHdEyEMqls6Cn9Xlc/hypn+WAU3WV67YzLQePmL/AC9lzIS8Vr
 m+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0qnbq+VtAYJrqLWmWFv2NmhXM3gXrWp9ucRRD3D1vUY=;
 b=oQU/c6c0OgINItDB89/9Ts34cRWduxwDtiFmEa1BwTaJIH2aitoevq/s+dlUXBugV2
 eJXtSsqAxPSeS8rYdL+0V5sz5CQAHeMxFum7YY/2Pk0eR8jGiKDsbXIYLOBVfsQCDWmE
 fKh1PnWYHWh1Oz31ec7+MaWExQhzfc7fLdPKrtlKSl/xTr8dQACMCPdB2xH0l1YWJW1K
 nFdsT/VxGA9QetA/4LvU6zOHT/OOFgks0M5FKCCp518Gebg+NG0BqCPQWvxWY8a3Wmpi
 eDH7gTguYqCDFDByUuJUdleW7MQWTQJ/UMdz28bh3OC4hOV+4XvLh3pIZl5T2KJUnHpP
 xbJA==
X-Gm-Message-State: AOAM532rmJJvxqtzeNIm6oO8dU7vQPqrxcPFdMAmCoUciTHwCb66YN+P
 K0NiBDcpEMlyPonpOznZAaVHUA==
X-Google-Smtp-Source: ABdhPJwXjIC56WmbtyzjCCg4PGgk5NPg/06k7kufDSxq/IJGoMM1EPx00nmBb+swVbwgtTquGjcb0g==
X-Received: by 2002:a05:600c:230e:: with SMTP id
 14mr1731202wmo.119.1605219041178; 
 Thu, 12 Nov 2020 14:10:41 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id q2sm8388986wru.76.2020.11.12.14.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 14:10:40 -0800 (PST)
Date: Thu, 12 Nov 2020 22:10:38 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 29/30] drm/amd/amdgpu/atombios_encoders: Remove set but
 unused variable 'backlight_level'
Message-ID: <20201112221038.GC2787115@dell>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-30-lee.jones@linaro.org>
 <CADnq5_MjzzRhu0zwOeefjGP_mJ2tfTVvK1O5x55dE03kRxDa3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_MjzzRhu0zwOeefjGP_mJ2tfTVvK1O5x55dE03kRxDa3Q@mail.gmail.com>
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
 Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMiBOb3YgMjAyMCwgQWxleCBEZXVjaGVyIHdyb3RlOgoKPiBPbiBUaHUsIE5vdiAx
MiwgMjAyMCBhdCAyOjAxIFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IHdyb3Rl
Ogo+ID4KPiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMp
Ogo+ID4KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19lbmNvZGVycy5j
OiBJbiBmdW5jdGlvbiDigJhhbWRncHVfYXRvbWJpb3NfZW5jb2Rlcl9pbml0X2JhY2tsaWdodOKA
mToKPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19lbmNvZGVycy5jOjE3
NDo1OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhiYWNrbGlnaHRfbGV2ZWzigJkgc2V0IGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiA+Cj4gPiBDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+ID4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiBDYzog
THViZW4gVHVpa292IDxsdWJlbi50dWlrb3ZAYW1kLmNvbT4KPiA+IENjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiA+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19lbmNvZGVycy5jIHwg
MyArLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9z
X2VuY29kZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19lbmNvZGVy
cy5jCj4gPiBpbmRleCBmYTgxN2ViZmY5ODA0Li5hZjg3NTA1YWQ3ZDU3IDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZW5jb2RlcnMuYwo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZW5jb2RlcnMuYwo+ID4gQEAg
LTE3MSw3ICsxNzEsNiBAQCB2b2lkIGFtZGdwdV9hdG9tYmlvc19lbmNvZGVyX2luaXRfYmFja2xp
Z2h0KHN0cnVjdCBhbWRncHVfZW5jb2RlciAqYW1kZ3B1X2VuY29kZQo+ID4gICAgICAgICBzdHJ1
Y3QgYmFja2xpZ2h0X3Byb3BlcnRpZXMgcHJvcHM7Cj4gPiAgICAgICAgIHN0cnVjdCBhbWRncHVf
YmFja2xpZ2h0X3ByaXZkYXRhICpwZGF0YTsKPiA+ICAgICAgICAgc3RydWN0IGFtZGdwdV9lbmNv
ZGVyX2F0b21fZGlnICpkaWc7Cj4gPiAtICAgICAgIHU4IGJhY2tsaWdodF9sZXZlbDsKPiA+ICAg
ICAgICAgY2hhciBibF9uYW1lWzE2XTsKPiA+Cj4gPiAgICAgICAgIC8qIE1hYyBsYXB0b3BzIHdp
dGggbXVsdGlwbGUgR1BVcyB1c2UgdGhlIGdtdXggZHJpdmVyIGZvciBiYWNrbGlnaHQKPiA+IEBA
IC0yMDcsNyArMjA2LDcgQEAgdm9pZCBhbWRncHVfYXRvbWJpb3NfZW5jb2Rlcl9pbml0X2JhY2ts
aWdodChzdHJ1Y3QgYW1kZ3B1X2VuY29kZXIgKmFtZGdwdV9lbmNvZGUKPiA+Cj4gPiAgICAgICAg
IHBkYXRhLT5lbmNvZGVyID0gYW1kZ3B1X2VuY29kZXI7Cj4gPgo+ID4gLSAgICAgICBiYWNrbGln
aHRfbGV2ZWwgPSBhbWRncHVfYXRvbWJpb3NfZW5jb2Rlcl9nZXRfYmFja2xpZ2h0X2xldmVsX2Zy
b21fcmVnKGFkZXYpOwo+ID4gKyAgICAgICBhbWRncHVfYXRvbWJpb3NfZW5jb2Rlcl9nZXRfYmFj
a2xpZ2h0X2xldmVsX2Zyb21fcmVnKGFkZXYpOwo+IAo+IFdlIGNhbiBkcm9wIHRoaXMgZnVuY3Rp
b24gY2FsbCBhbHRvZ2V0aGVyLiAgV2UgY2FsbCBpdCBhZ2FpbiBiZWxvdyBpbmRpcmVjdGx5LgoK
V2lsbCBkbywgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5p
Y2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ug
c29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8
IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
