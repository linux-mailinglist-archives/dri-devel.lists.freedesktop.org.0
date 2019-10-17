Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2387DB855
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 22:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B886EAB7;
	Thu, 17 Oct 2019 20:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DB26EAB7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 20:34:22 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id d192so1358353ywa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 13:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding:user-agent;
 bh=y+qQ+kaPPCxVz8AQ+EFMsi4bXxPeMfQaSynRlFc0gYw=;
 b=iRVBI2YSzR1D9C5dylowpe+92KrQ2EfNa5Pf6PA0puaK2DikqIF5KC2BsZbFuhgAJL
 Xykv6FcN8roUFCbgig/cauuRBeWE7coFPAmab9y8xZTXKlGUPgSJRwX8zEcmVyNmf+VD
 IrJIb2c+aQfuyWMkN7/KoJO/I7Id992H/gSLGmLNEuvKDiX921Iuxq+K9+0grXoeCRTM
 R7qjajlcSKbeD6E01rd488rc2OqVmBWOI7J4ml6WLqWg+0X/YMM8QALH38F5MMKHliwe
 fdOnC9oihEQb/OE562RgtY2s2lNS3nMRAAxtwWPcWaFblrZZDpX5eE0FKZEfGVxwhjk5
 s2RA==
X-Gm-Message-State: APjAAAWt5zbYXNwGc6bEbQqOFD4QF//FGEVQk9lHD6Cd9h6dgS3OxSxt
 KKMnKENfV5iB68sZBIdgqG/nmw==
X-Google-Smtp-Source: APXvYqxaq5ikwjFfN1GPrfXfp45gNKj+Hp61MZo5KWjLHThIwYBquMM3MLjAgWm9hTLuzY4bSIgvpw==
X-Received: by 2002:a0d:f1c2:: with SMTP id a185mr4338228ywf.298.1571344461515; 
 Thu, 17 Oct 2019 13:34:21 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id s187sm770132ywd.27.2019.10.17.13.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 13:34:21 -0700 (PDT)
Date: Thu, 17 Oct 2019 16:34:19 -0400
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20191017203419.GA142909@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding:user-agent;
 bh=y+qQ+kaPPCxVz8AQ+EFMsi4bXxPeMfQaSynRlFc0gYw=;
 b=UM1IL0NfOPEEHCvldcA6ldiTT+3cpNXT7ZH/R8Bvkkx/cboOP+iJLC00M5R68Yj6bs
 o9hI/FUD+uUnBinghWv2D84eO2m3qTSDuq/tpsOR5qBmxjwyNqqyJUyKE/Hr/0KW7m9M
 wOQ+j5x+ou/RWwHrnYa7deUbfF2J7ji+HCcZK243X9zQlQbDE7QnuSI09LB4s+xKTwb/
 o2BcBlkkYPIgb9FGhDb3MFyWU/urFDq00a/xMn2JWau4bF7z5kVTv8NZhD1okDC10doX
 x5kBDN4zDQ5rvsEnRABX3UQKEHHt1+Iiy6Szh4uxxqaHPWkASrtxbWtkaHvS9H6MTiju
 KpDg==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, dim-tools@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Steven Price <steven.price@arm.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org,
 Qiang Yu <yuq825@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhdmUvRGFuaWVsLApHdWVzdC1NYXhpbWUgaGVyZSB3aXRoIGEgZHJtLW1pc2MtZml4ZXMg
cHVsbC4gSW50ZXJlc3Rpbmcgc3R1ZmYgaGFzIGJlZW4KaGlnaGxpZ2h0ZWQgYmVsb3cgaW4gdGhl
IHRhZy4gSSByZWFsaXplZCB0aGF0IHdlIGhhdmUgU3RldmVuJ3Mgc3RvcHBlZCBqb2IgcGF0Y2gK
aW4gYm90aCAtbmV4dCBhbmQgLWZpeGVzLCBzbyB3ZSdsbCBuZWVkIHRvIHdhdGNoIG91dCBmb3Ig
Y29uZmxpY3RzIHdoZW4gdGhleQpjb21lIHRvZ2V0aGVyLgoKCmRybS1taXNjLWZpeGVzLTIwMTkt
MTAtMTc6Ci1kbWEtcmVzdjogQ2hhbmdlIHNoYXJlZF9jb3VudCB0byBwb3N0LWluY3JlbWVudCB0
byBmaXggbGltYSBjcmFzaCAoUWlhbmcpCi10dG06IEEgY291cGxlIGZpeGVzIHJlbGF0ZWQgdG8g
bGlmZXRpbWUgYW5kIHJlc3RvcmUgcHJlZmF1bHQgYmVoYXZpb3IKIChDaHJpc3RpYW4gJiBUaG9t
YXMpCi1wYW5mcm9zdDogRmlsbCBpbiBtaXNzaW5nIGZlYXR1cmUgcmVnIHZhbHVlcyBhbmQgZml4
IHN0b3BwZWRqb2IgdGltZW91dHMKIChTdGV2ZW4pCgpDYzogUWlhbmcgWXUgPHl1cTgyNUBnbWFp
bC5jb20+CkNjOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+CkNjOiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBTdGV2ZW4gUHJp
Y2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgoKQ2hlZXJzLCBTZWFuCgoKVGhlIGZvbGxvd2luZyBj
aGFuZ2VzIHNpbmNlIGNvbW1pdCBmZDcwYzc3NTViZjAxNzJkZGQzM2I1NThhZWY2OWMzMjJkZTNi
NWNmOgoKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogZml4IG1heF90dV9zeW1ib2wgdmFsdWUgKDIw
MTktMTAtMTAgMTE6MTU6NDUgKzAyMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjIHRh
Z3MvZHJtLW1pc2MtZml4ZXMtMjAxOS0xMC0xNwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVw
IHRvIDViM2VjODEzNGY1ZjlmYTFlZDBhNTM4NDQxYTQ5NTUyMTA3OGJiZWU6CgogIGRybS9wYW5m
cm9zdDogSGFuZGxlIHJlc2V0dGluZyBvbiB0aW1lb3V0IGJldHRlciAoMjAxOS0xMC0xNSAxMToz
ODoyMiAtMDUwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KLWRtYS1yZXN2OiBDaGFuZ2Ugc2hhcmVkX2NvdW50IHRvIHBv
c3QtaW5jcmVtZW50IHRvIGZpeCBsaW1hIGNyYXNoIChRaWFuZykKLXR0bTogQSBjb3VwbGUgZml4
ZXMgcmVsYXRlZCB0byBsaWZldGltZSBhbmQgcmVzdG9yZSBwcmVmYXVsdCBiZWhhdmlvcgogKENo
cmlzdGlhbiAmIFRob21hcykKLXBhbmZyb3N0OiBGaWxsIGluIG1pc3NpbmcgZmVhdHVyZSByZWcg
dmFsdWVzIGFuZCBmaXggc3RvcHBlZGpvYiB0aW1lb3V0cwogKFN0ZXZlbikKCkNjOiBRaWFuZyBZ
dSA8eXVxODI1QGdtYWlsLmNvbT4KQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13
YXJlLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
Q2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+CgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNocmlzdGlh
biBLw7ZuaWcgKDIpOgogICAgICBkcm0vdHRtOiBmaXggYnVzeSByZWZlcmVuY2UgaW4gdHRtX21l
bV9ldmljdF9maXJzdAogICAgICBkcm0vdHRtOiBmaXggaGFuZGxpbmcgaW4gdHRtX2JvX2FkZF9t
ZW1fdG9fbHJ1CgpKZWZmcmV5IEh1Z28gKDEpOgogICAgICBkcm0vbXNtL2RzaTogSW1wbGVtZW50
IHJlc2V0IGNvcnJlY3RseQoKS2FpLUhlbmcgRmVuZyAoMSk6CiAgICAgIGRybS9lZGlkOiBBZGQg
NiBicGMgcXVpcmsgZm9yIFNEQyBwYW5lbCBpbiBMZW5vdm8gRzUwCgpRaWFuZyBZdSAoMSk6CiAg
ICAgIGRtYS1idWYvcmVzdjogZml4IGV4Y2x1c2l2ZSBmZW5jZSBnZXQKClN0ZXZlbiBQcmljZSAo
Mik6CiAgICAgIGRybS9wYW5mcm9zdDogQWRkIG1pc3NpbmcgR1BVIGZlYXR1cmUgcmVnaXN0ZXJz
CiAgICAgIGRybS9wYW5mcm9zdDogSGFuZGxlIHJlc2V0dGluZyBvbiB0aW1lb3V0IGJldHRlcgoK
VGhvbWFzIEhlbGxzdHJvbSAoMSk6CiAgICAgIGRybS90dG06IFJlc3RvcmUgdHRtIHByZWZhdWx0
aW5nCgpVbGYgTWFnbnVzc29uICgxKToKICAgICAgZHJtL3Rpbnk6IEtjb25maWc6IFJlbW92ZSBh
bHdheXMteSBUSEVSTUFMIGRlcC4gZnJvbSBUSU5ZRFJNX1JFUEFQRVIKCiBkcml2ZXJzL2RtYS1i
dWYvZG1hLXJlc3YuYyAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2RybV9l
ZGlkLmMgICAgICAgICAgICAgIHwgIDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lf
aG9zdC5jICAgICAgfCAgNiArKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9ncHUuYyB8ICAzICsrKwogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5j
IHwgMTYgKysrKysrKysrKystLS0tLQogZHJpdmVycy9ncHUvZHJtL3RpbnkvS2NvbmZpZyAgICAg
ICAgICAgIHwgIDEgLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAgICAgICAgICAgIHwg
IDkgKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jICAgICAgICAgfCAx
NiArKysrKysrLS0tLS0tLS0tCiA4IGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDIy
IGRlbGV0aW9ucygtKQoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAv
IENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
