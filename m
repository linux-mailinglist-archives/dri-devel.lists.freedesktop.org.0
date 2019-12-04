Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06539113704
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 22:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123D36F50A;
	Wed,  4 Dec 2019 21:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74B86F50B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 21:22:57 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id i126so328861ywe.7
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 13:22:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=KWvXSXURzpEibWklZQcyK52jJjABIqmSiXr71h3H4d8=;
 b=QoPatQpZxOQRyZidr7rJdf+KHyEz3XIeN9Cj0mRkHes5y3+mh88hVcKH7387MNZJCs
 mzw7mhqmvIkqQjlg1WR4Lar6AO2uCyqO8V14OHlkbdLjnGQoEaAKO23wMvFvLas91RIm
 IJxg5POYS/YL0CyOSBvvuohWpNGGiP5FBuSSWEMW6KMYpVc7iaHii2uMWMZ8kbLeAtfa
 +GQDlz6ZoZ1TL/EoyiV6LnnyEfDd5uFEek2bIIXUK0+gg/SWhKsnmR8s6Nx/G9kjCLiN
 qGOUj876/2QoJ7a2Fj0G2+imiyB40Xl1TMD7WNqZ4s7l7SGBwCOT8D+NfhkFAsTMN6Px
 KISw==
X-Gm-Message-State: APjAAAUQaiL9x2GvakhjUabGVpVgSVyfMI4kRUrm0CfH/t1JvYdJz6w1
 bzNhWJPuEwPzz2gta0+m7wPwzg==
X-Google-Smtp-Source: APXvYqwCTI4MV4jl57iqQ/F1VCrK6Ds42XpQfjIKLUoxXaSHyCzp5idNO51YhuKwo0k9ql1fGpzVcQ==
X-Received: by 2002:a81:6654:: with SMTP id a81mr3474964ywc.447.1575494576875; 
 Wed, 04 Dec 2019 13:22:56 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id n129sm3642264ywb.75.2019.12.04.13.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 13:22:56 -0800 (PST)
Date: Wed, 4 Dec 2019 16:22:55 -0500
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20191204212255.GA256395@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=KWvXSXURzpEibWklZQcyK52jJjABIqmSiXr71h3H4d8=;
 b=URSqQZvJP3d01hmPjPjfi8eWqOBF7uANVnV3/VnWmwPm8yhBiKQc0HiJvEiq06iX8T
 6tWAteOq25GQenhcmfqLV990ZzY88WPTnqz7azqbPSglrXUZLbPHBObIoE/0/j7LCtkf
 RG4iaHVF4RfR5EPPNS8JX2tBUbQ5+VS8SI4wI7iy/Cw4l0TYgZ7X9NafqNev0lxduWY/
 01FSVXyeY4LHPiNjAZSMInFwOwXbxB5Ur9cnRXrDY019z0yVHoV7bubOegjV9+0u1MOq
 QbgQZW2+jS2F5BGchkvANPymQzHeDCUjABTGNJsZ7M+ZWb9YSUNQH50uZ6J85GAkyk2y
 Nz2w==
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
Cc: dim-tools@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhdmUgJiBEYW5pZWwsCkEgaGFuZGZ1bCBvZiBmaXhlcyB0aGlzIHdlZWssIGFsbCBzdHJh
aWdodGZvcndhcmQuCgoKZHJtLW1pc2MtbmV4dC1maXhlcy0yMDE5LTEyLTA0OgptZ2FnMjAwLSBG
aXggaHcgd2l0aCBicm9rZW4gJ3N0YXJ0YWRkJyBzdXBwb3J0IChUaG9tYXMpCm1zdC0gQXZvaWQg
c2tpcHBpbmcgcGF5bG9hZHMgaW4gcGF5bG9hZCBkZWxldGlvbiBsb29wIChXYXluZSkKb21hcC0g
Rml4IGRtYV9hZGRyIHJlZmNvdW50aW5nIChUb21pKQoKQ2M6IFdheW5lIExpbiA8V2F5bmUuTGlu
QGFtZC5jb20+CkNjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpDYzog
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CgpDaGVlcnMsIFNlYW4KCgpU
aGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDk3ODZiNjViYzYxYWNlYzYzZjkyMzk3
OGM3NWU3MDdhZmJiNzRiYzc6CgogIGRybS90dG06IGZpeCBtbWFwIHJlZmNvdW50aW5nICgyMDE5
LTExLTE1IDA4OjAwOjA4ICswMTAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRv
cnkgYXQ6CgogIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYyB0YWdz
L2RybS1taXNjLW5leHQtZml4ZXMtMjAxOS0xMi0wNAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIGU1YTZjYTI3ZWI3MmM2NzUzM2RkZmMxMWMwNmRmODRiZWFhMTY3ZmE6CgogIGRybS9k
cF9tc3Q6IENvcnJlY3QgdGhlIGJ1ZyBpbiBkcm1fZHBfdXBkYXRlX3BheWxvYWRfcGFydDEoKSAo
MjAxOS0xMi0wNCAxNTozMToxNiAtMDUwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KbWdhZzIwMC0gRml4IGh3IHdpdGgg
YnJva2VuICdzdGFydGFkZCcgc3VwcG9ydCAoVGhvbWFzKQptc3QtIEF2b2lkIHNraXBwaW5nIHBh
eWxvYWRzIGluIHBheWxvYWQgZGVsZXRpb24gbG9vcCAoV2F5bmUpCm9tYXAtIEZpeCBkbWFfYWRk
ciByZWZjb3VudGluZyAoVG9taSkKCkNjOiBXYXluZSBMaW4gPFdheW5lLkxpbkBhbWQuY29tPgpD
YzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KQ2M6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpHdWVudGVyIFJvZWNrICgxKToK
ICAgICAgZHJtL2RwX21zdDogRml4IGJ1aWxkIG9uIHN5c3RlbXMgd2l0aCBTVEFDS1RSQUNFX1NV
UFBPUlQ9bgoKVGhvbWFzIFppbW1lcm1hbm4gKDMpOgogICAgICBkcm0vbWdhZzIwMDogRXh0cmFj
dCBkZXZpY2UgdHlwZSBmcm9tIGZsYWdzCiAgICAgIGRybS9tZ2FnMjAwOiBTdG9yZSBmbGFncyBm
cm9tIFBDSSBkcml2ZXIgZGF0YSBpbiBkZXZpY2Ugc3RydWN0dXJlCiAgICAgIGRybS9tZ2FnMjAw
OiBBZGQgd29ya2Fyb3VuZCBmb3IgSFcgdGhhdCBkb2VzIG5vdCBzdXBwb3J0ICdzdGFydGFkZCcK
ClRvbWkgVmFsa2VpbmVuICgxKToKICAgICAgZHJtL29tYXA6IGZpeCBkbWFfYWRkciByZWZjb3Vu
dGluZwoKV2F5bmUgTGluICgxKToKICAgICAgZHJtL2RwX21zdDogQ29ycmVjdCB0aGUgYnVnIGlu
IGRybV9kcF91cGRhdGVfcGF5bG9hZF9wYXJ0MSgpCgogZHJpdmVycy9ncHUvZHJtL0tjb25maWcg
ICAgICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9n
eS5jICB8ICA2ICsrKystLQogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYyAg
fCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0v
bWdhZzIwMC9tZ2FnMjAwX2Rydi5oICB8IDE4ICsrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21haW4uYyB8ICAzICsrLQogZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vb21hcF9nZW0uYyAgICAgfCAgNCArKysrCiA2IGZpbGVzIGNoYW5nZWQsIDY0IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVl
ciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
