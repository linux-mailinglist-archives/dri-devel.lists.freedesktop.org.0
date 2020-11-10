Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07712AE186
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 22:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0397489381;
	Tue, 10 Nov 2020 21:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80E589C52
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 21:20:42 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c9so4623523wml.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 13:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QIBJshKpv92POnG5rECWEfa1XG4D+wo2F1uj30221ws=;
 b=MQwkHYPkvDN417BZe5U6Pp09S/rmgt2LyTmKr39o80Gl8IVjOLC4+fbs2EX+mD1vVg
 BfHLXDrzZEkogEJFztCSPvzrIbNWeB4FB+Ko3qWk1l0zenpiTkaROItaxYWL1pj45M8z
 DAkcacHe5YPHy5055oswQsRNe4EJYM2eHtebBlQL6sad7DgMpJPFB9dNWoDmNfw3etWN
 FczHcnOOiPZoNL4PEwRNMWd1EZ/5NS7p7wXoPsdiHvcvpkUJVx2sOjHVcKesQp2q/G91
 +kU35alQnVbwVPHbnPLHCdKLoXK28BsRmxj5s5roTukIWMO3+T2ToE8Y68jYUuhUr43Y
 HyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QIBJshKpv92POnG5rECWEfa1XG4D+wo2F1uj30221ws=;
 b=I2d8PzSzNm+KdVvYNrjbcU3nASJ+KPlKtysIjoLwEv/3Dj3C4xGDWem7qXS6eT9bqq
 7mS1SuHd+Axlak4MElVWjMLF4Laav4kH4UcYTC9dhjc0YE8VSQz5/aQsmRPcMPiGs4xo
 /8MwYt/4Mjus/m7VCnISVwFoham49TovTW9eNgBUXcJeZk15uRhYQJPDdmcExLxC0Bs6
 9/UFs+2fnGVplOeANBJALOtTdmCQzVtZ57CIRqJsYPkpA9czPOA7lgSqg5tiuqqI228/
 mbz2bviE52fP9bt+lw1yRww6J4qBJaQzT3vOng2FJacpkPmTRqZSq1fQ84l9VyEBbLhP
 6jLQ==
X-Gm-Message-State: AOAM530lfrOz5FYoZuGjZ+5KiS5bRCgF82+9k2I1OHYdlYgxurmWoxgO
 t+JAFR61sClBptAeUtIxu0d2rQ==
X-Google-Smtp-Source: ABdhPJwCTUWwrks9Lt6bjM5yd8fytosAD9T3MWUv1CZE5JGhqzDgmOEGA7pKRClkRBXcOndIAPqC5Q==
X-Received: by 2002:a1c:4144:: with SMTP id o65mr34234wma.171.1605043241519;
 Tue, 10 Nov 2020 13:20:41 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id v8sm78027wmg.28.2020.11.10.13.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 13:20:40 -0800 (PST)
Date: Tue, 10 Nov 2020 21:20:39 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 15/19] gpu: drm: radeon: radeon_drv: Remove unused
 variable 'ret'
Message-ID: <20201110212039.GL2063125@dell>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-16-lee.jones@linaro.org>
 <CADnq5_PZRM0wmrcJAGfdyFqnR68gbVQK76TrHSbJJRK1t8cT8g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PZRM0wmrcJAGfdyFqnR68gbVQK76TrHSbJJRK1t8cT8g@mail.gmail.com>
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
 Alex Deucher <alexander.deucher@amd.com>, Gareth Hughes <gareth@valinux.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMCBOb3YgMjAyMCwgQWxleCBEZXVjaGVyIHdyb3RlOgoKPiBPbiBUaHUsIE5vdiA1
LCAyMDIwIGF0IDk6NTIgQU0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3JvdGU6
Cj4gPgo+ID4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6
Cj4gPgo+ID4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jOiBJbiBmdW5jdGlv
biDigJhyYWRlb25fcG1vcHNfcnVudGltZV9zdXNwZW5k4oCZOgo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2Rydi5jOjQ1NTo2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhyZXTigJkg
c2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiA+Cj4gPiBDYzog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+ID4gQ2M6ICJDaHJpc3Rp
YW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4gQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+Cj4gPiBDYzogR2FyZXRoIEh1Z2hlcyA8Z2FyZXRoQHZhbGludXguY29tPgo+ID4gQ2M6IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KPiAKPiBBcHBsaWVkLiAgVGhhbmtzIQoKVGhhbmtzIEFsZXguCgpJJ2xsIHJlYmFzZSBp
biBhIGZldyBkYXlzIGFuZCBmaXgvcmVzZW5kIHdoYXRldmVyIGlzIG91dHN0YW5kaW5nLgoKLS0g
CkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIg
U2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0Nz
CkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
