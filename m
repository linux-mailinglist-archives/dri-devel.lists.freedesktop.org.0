Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCC82C91BA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641BD89C89;
	Mon, 30 Nov 2020 22:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64CB89C89;
 Mon, 30 Nov 2020 22:58:36 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id k26so16118065oiw.0;
 Mon, 30 Nov 2020 14:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AFKS8AJu+Fj+MZmOUNhw1ND9mL6dIAAw6BtuS0oHe6E=;
 b=UaiIA6Sjv4FXSOCMWBm3hHKel0jzdCXcIJIacC1DYcQINH/Lyt0t33lU7IxE4CTk8j
 zIPqZznn5SqovEBZvr1IVYKAsoYiohNUEpRIrJpSmMJ46fOAw3u5NBnpzUKoEpr3jc/J
 WuDg0xU7X0njIN6IBWGcA/Rld47I7z5NhJ4w2Sd+voJmWv+XnCMOmJRICEJfWKshpn36
 tv+rds1+EWC8kd2QrQr93YQY1zJd1+fPwcEVV7KAZ/rE/GDFt9T+c5PUOkFihfzG1CFD
 10y0NfpIPIeQ3lWVTzQaQ2geFSZtSnhy7Vs+JhuK+Ij77U04W+qPvNFCfyKN9gEF/kkB
 bIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AFKS8AJu+Fj+MZmOUNhw1ND9mL6dIAAw6BtuS0oHe6E=;
 b=Qf2Jq3wQu9Psh+9YGtCaWG/yqaqO6XyS3Wp48/5svd8yWv+1Ktt3PTTA7iPg4RBbRn
 naPSe7HzYiUrSrssSIuk8y+NhFD3japl9J6cSnXKqiELpC7202KtsI6KF3xGHGal3Wi/
 dPDQlBQ8gMDNFe/P6ja3qC+VWjtdvhhJOtWrlLn9qH6fa4cTntZOXHscuta+hl9Fo7Gw
 gk2dDL8iCA1bQVGelJjCIqJ7qqqOy0rYPKWaxG5mvCtOqXqjxdDqCWCGcQ1AKp11Odgm
 8cGN3EpoQBQnCj0No/6XOdaeF7ExM/CWSksGsSTMoAnX7sM7xqrWJBD7VaYQnSGDhIbo
 3jDA==
X-Gm-Message-State: AOAM5302Gy3rPSYgn1Jem9FfxBfN/rOm6euoNUA92scrvmUb0QwmwjJj
 38gcxbV5cAGLJOzud1usv+xrOQCKFstISJBZgRY=
X-Google-Smtp-Source: ABdhPJyNBowr50AMEKIoDeQpkyqZuKZ4limvURq/g3IpLqTRRmsU3Prk3PIRibfwhOfSYmywxOxWp9KDfcXUv9jdmV8=
X-Received: by 2002:aca:f50e:: with SMTP id t14mr29155oih.123.1606777116254;
 Mon, 30 Nov 2020 14:58:36 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-36-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-36-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:58:25 -0500
Message-ID: <CADnq5_OKkW3MvjAK4eziMPJyZ-D4vYT0VnCJk2BpX9szKY4edA@mail.gmail.com>
Subject: Re: [PATCH 35/40] drm/amd/pm/swsmu/smu11/vangogh_ppt: Make local
 function 'vangogh_set_default_dpm_tables()' static
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Xiaojian Du <Xiaojian.Du@amd.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3N3c211L3Nt
dTExL3ZhbmdvZ2hfcHB0LmM6IEF0IHRvcCBsZXZlbDoKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vcG0vc3dzbXUvc211MTEvdmFuZ29naF9wcHQuYzo3NjQ6NTogd2FybmluZzogbm8g
cHJldmlvdXMgcHJvdG90eXBlIGZvciDigJh2YW5nb2doX3NldF9kZWZhdWx0X2RwbV90YWJsZXPi
gJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICA3NjQgfCBpbnQgdmFuZ29naF9zZXRfZGVmYXVs
dF9kcG1fdGFibGVzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQo+ICB8IF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fgo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBYaWFvamlhbiBEdSA8WGlhb2ppYW4uRHVAYW1k
LmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+CgpUaGlzIGNvZGUgaGFzIGNoYW5nZWQgYSBiaXQgYW5kIEkndmUganVz
dCBzZW50IG91dCBhIHBhdGNoIHRvIGhhbmRsZQp0aGlzIHNsaWdodGx5IGRpZmZlcmVudGx5LiAg
VGhhbmtzIQoKQWxleAoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211
MTEvdmFuZ29naF9wcHQuYyB8IDkgKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wbS9zd3NtdS9zbXUxMS92YW5nb2doX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
bS9zd3NtdS9zbXUxMS92YW5nb2doX3BwdC5jCj4gaW5kZXggOWEyZjcyZjIxZWQ4Ni4uMDVjMzJi
ZTNhNzQ5NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTEx
L3ZhbmdvZ2hfcHB0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTEx
L3ZhbmdvZ2hfcHB0LmMKPiBAQCAtNDAwLDE2ICs0MDAsMTMgQEAgc3RhdGljIGludCB2YW5nb2do
X2dldF9jdXJyZW50X2FjdGl2aXR5X3BlcmNlbnQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIGFtZF9w
cF9zZW5zb3JzIHNlbnNvciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQzMl90ICp2YWx1ZSkKPiAgewo+IC0gICAgICAgaW50IHJldCA9IDA7Cj4g
LQo+ICAgICAgICAgaWYgKCF2YWx1ZSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4KPiAgICAgICAgIHN3aXRjaCAoc2Vuc29yKSB7Cj4gICAgICAgICBjYXNlIEFNREdQVV9QUF9T
RU5TT1JfR1BVX0xPQUQ6Cj4gLSAgICAgICAgICAgICAgIHJldCA9IHZhbmdvZ2hfZ2V0X3NtdV9t
ZXRyaWNzX2RhdGEoc211LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgTUVUUklDU19BVkVSQUdFX0dGWEFDVElWSVRZLAo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmFsdWUpOwo+ICsgICAgICAgICAg
ICAgICB2YW5nb2doX2dldF9zbXVfbWV0cmljc19kYXRhKHNtdSwgTUVUUklDU19BVkVSQUdFX0dG
WEFDVElWSVRZLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHZhbHVlKTsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBkZWZhdWx0Ogo+ICAg
ICAgICAgICAgICAgICBkZXZfZXJyKHNtdS0+YWRldi0+ZGV2LCAiSW52YWxpZCBzZW5zb3IgZm9y
IHJldHJpZXZpbmcgY2xvY2sgYWN0aXZpdHlcbiIpOwo+IEBAIC03NjEsNyArNzU4LDcgQEAgc3Rh
dGljIGludCB2YW5nb2doX29kX2VkaXRfZHBtX3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211
LCBlbnVtIFBQX09EX0RQTV9UQUIKPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPgo+IC1pbnQg
dmFuZ29naF9zZXRfZGVmYXVsdF9kcG1fdGFibGVzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQo+
ICtzdGF0aWMgaW50IHZhbmdvZ2hfc2V0X2RlZmF1bHRfZHBtX3RhYmxlcyhzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSkKPiAgewo+ICAgICAgICAgc3RydWN0IHNtdV90YWJsZV9jb250ZXh0ICpzbXVf
dGFibGUgPSAmc211LT5zbXVfdGFibGU7Cj4KPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
