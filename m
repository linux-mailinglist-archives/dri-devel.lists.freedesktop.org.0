Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A36926DCF
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 21:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E1B89BFB;
	Wed, 22 May 2019 19:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADF089BF8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 19:44:42 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id m18so2287553qki.8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 12:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=+IA+Cc0f0KKNESBZzd8/c1x2kQ+BqUA8EjqiSbntTlk=;
 b=O1v5qQVKBivxLIB+vZTKK+p2c7lltZFs8XzDOZaJqd/nvJxcRcYzao+Iu6lQ8Uoa+T
 loTwVQRoTIuk5RADDD7YqXt+v/u7JZEaICs+x8rwQTbjC2DhIiZL/AnChXTeLUyMTT3q
 /Lwz38yTKxdMjgJIGKQs++kf9/VWHuoxFRaUIj9XIIn4s/JOXjPivuuJzi3eNQcrZ/I3
 U2zOBcNTntS70ugo4n+yWESkF/dWNTzbs/J3iCUu4XuT3Q2kPTcBChvwZ4eVtS5hJS9j
 M1Fw9Er/MhKJvYaC+0/dM8LiD1RyoLONhtrrl6JDEwDSEpm46Vxc334Tm+6qWhIZKuS7
 ID9A==
X-Gm-Message-State: APjAAAXu0HpSZ5Lvi2yPqjZPZnCsMJTmUsEF7wDsfLJj9JQEy5MpL/Ml
 KvTUZlBNc9E+NBj9xC5ePjZRHQ==
X-Google-Smtp-Source: APXvYqygDgvF5RonvHDP0ierCkfZnHf5iZPtIPz8LMd7CAyqGXXaJtFOkvC9mLHNASJPBD7Xxrp6wQ==
X-Received: by 2002:a37:ad19:: with SMTP id f25mr27511595qkm.261.1558554281336; 
 Wed, 22 May 2019 12:44:41 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id x6sm11819551qti.88.2019.05.22.12.44.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 12:44:40 -0700 (PDT)
Date: Wed, 22 May 2019 15:44:40 -0400
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20190522194440.GA22359@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=+IA+Cc0f0KKNESBZzd8/c1x2kQ+BqUA8EjqiSbntTlk=;
 b=U7F0grTkJyJ/lXhpaJuXVLwExHjSDSAE0W32Q6SibFj3BKGqtlpF9siUO4fgyepuet
 kWinaVVR/LmaWurt4y5tTKG9UrKiDgQyhyOsfffC30BUe3xf/8M+IzIqan61mIyQtvJx
 X6cDjthLaBivmfx1KX6/ILV4pxnH0Bq6biJG0SsgdynxYc2PJZSqZJ18IMFPaNwz7MAz
 ukn3oRd3rs+U6SmsovdcA9zsLJyE0yGKrzx1RGAFdaSS6RnQNB6V73y2NMvN8yBXKxRU
 fz0LNiXAE5Rtgsk/+jsnC0GWxSUTz019wLz0A4q3trzUOwrW8KXsUXEBHwKf20vRkYKH
 C7+w==
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
Cc: dim-tools@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhLiosCkZpcnN0IC1maXhlcyBwdWxsLCBwcmVkaWN0YWJseSBsaWdodC4gVGhlIG1lcmdl
IGhlcmUgd2FzIGJyaW5naW5nIG92ZXIgc29tZQpzdW40aSBwYXRjaGVzIHRoYXQgbWlzc2VkIHRo
ZSBsYXN0IC1taXNjLW5leHQtZml4ZXMgcHVsbC4KCgpkcm0tbWlzYy1maXhlcy0yMDE5LTA1LTIy
OgotIHN1bjRpIGZpeGVzIHRvIGhkbWkgcGh5IGFzIHdlbGwgYXMgdTE2IG92ZXJmbG93IGluIGRz
aSAobGVmdCBmcm9tIC1uZXh0LWZpeGVzKQotIGdtYTUwMCBmaXggdG8gbWFrZSBsdmRzIGRldGVj
dGlvbiBtb3JlIHJlbGlhYmxlCi0gc2VsZWN0IGRldmZyZXEgZm9yIHBhbmZyb3N0IHNpbmNlIGl0
IGNhbid0IHByb2JlIHdpdGhvdXQgaXQKCkNoZWVycywgU2VhbgoKClRoZSBmb2xsb3dpbmcgY2hh
bmdlcyBzaW5jZSBjb21taXQgYTE4ODMzOWNhNWEzOTZhY2M1ODhlNTg1MWVkN2UxOWY2NmIwZWJk
OToKCiAgTGludXggNS4yLXJjMSAoMjAxOS0wNS0xOSAxNTo0NzowOSAtMDcwMCkKCmFyZSBhdmFp
bGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNr
dG9wLm9yZy9kcm0vZHJtLW1pc2MgdGFncy9kcm0tbWlzYy1maXhlcy0yMDE5LTA1LTIyCgpmb3Ig
eW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZjM2MTdiNDQ5ZDBiY2YzYjVkODBhOTdmNTE0OThk
Y2Y3NDYzY2Y3ZToKCiAgZHJtL3BhbmZyb3N0OiBTZWxlY3QgZGV2ZnJlcSAoMjAxOS0wNS0yMiAx
MzowNToxMyAtMDUwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLSBzdW40aSBmaXhlcyB0byBoZG1pIHBoeSBhcyB3ZWxs
IGFzIHUxNiBvdmVyZmxvdyBpbiBkc2kgKGxlZnQgZnJvbSAtbmV4dC1maXhlcykKLSBnbWE1MDAg
Zml4IHRvIG1ha2UgbHZkcyBkZXRlY3Rpb24gbW9yZSByZWxpYWJsZQotIHNlbGVjdCBkZXZmcmVx
IGZvciBwYW5mcm9zdCBzaW5jZSBpdCBjYW4ndCBwcm9iZSB3aXRob3V0IGl0CgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkV6
ZXF1aWVsIEdhcmNpYSAoMSk6CiAgICAgIGRybS9wYW5mcm9zdDogU2VsZWN0IGRldmZyZXEKCkph
Z2FuIFRla2kgKDEpOgogICAgICBkcm0vc3VuNGk6IHN1bjZpX21pcGlfZHNpOiBGaXggaHN5bmNf
cG9yY2ggb3ZlcmZsb3cKCkplcm5laiBTa3JhYmVjICgyKToKICAgICAgZHJtL3N1bjRpOiBGaXgg
c3VuOGkgSERNSSBQSFkgY2xvY2sgaW5pdGlhbGl6YXRpb24KICAgICAgZHJtL3N1bjRpOiBGaXgg
c3VuOGkgSERNSSBQSFkgY29uZmlndXJhdGlvbiBmb3IgPiAxNDguNSBNSHoKClBhdHJpayBKYWtv
YnNzb24gKDEpOgogICAgICBkcm0vZ21hNTAwL2NkdjogQ2hlY2sgdmJ0IGNvbmZpZyBiaXRzIHdo
ZW4gZGV0ZWN0aW5nIGx2ZHMgcGFuZWxzCgpTZWFuIFBhdWwgKDEpOgogICAgICBNZXJnZSBkcm0t
bWlzYy1uZXh0LWZpeGVzLTIwMTktMDUtMjAgaW50byBkcm0tbWlzYy1maXhlcwoKIGRyaXZlcnMv
Z3B1L2RybS9nbWE1MDAvY2R2X2ludGVsX2x2ZHMuYyAgICAgfCAgMyArKysKIGRyaXZlcnMvZ3B1
L2RybS9nbWE1MDAvaW50ZWxfYmlvcy5jICAgICAgICAgfCAgMyArKysKIGRyaXZlcnMvZ3B1L2Ry
bS9nbWE1MDAvcHNiX2Rydi5oICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvS2NvbmZpZyAgICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2RldmZyZXEuYyB8IDEzICsrLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9z
dW40aS9zdW42aV9taXBpX2RzaS5jICAgICAgfCAgNSArKystLQogZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjhpX2hkbWlfcGh5LmMgICAgICB8IDI5ICsrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tCiA3IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQoK
LS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
