Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D07025E179
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 11:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483FB6E110;
	Wed,  3 Jul 2019 09:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB7F6E10F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 09:54:58 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id z25so1439998edq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 02:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Uk3Ch3YDbbsqM+pKnGRUL9+3WRRG3D2+E1fyTpSzOR0=;
 b=WxiGP0ygrsHkfHSOYCPt2DXsK/CeRP7DPR6ll3G07dAI2AyIbT3zXnm+Jec/Wy9VIP
 IDU3V7gABOH56DMoIPntZZOy6bsI3RTvZZNAU0wHRdiStjN4BvhIX/rqU2e5YDQhiSGW
 L3XxxqKBnrFuFMXEaGtjqXkeGe87xNQY6r4JCI85v5ceScvLHAi2et9f3CBgJ3QaASqm
 cnAU+QEsx0vUuR8Jl+n429gMY/oPSdk683vgjs77cuP10Nfv9+n+5c0/Ka8NB2rZ2d8y
 84zdNO29ogoljLT403UCbTwEbXUpEk28D5Ua1izUUGBK69O+RM2jhN9SLMMqIwn0Kpo0
 2kzg==
X-Gm-Message-State: APjAAAVkH/FyPC3RsaKdAXweno//3PApV86uMgR4xdnST0iY/RKVh0z2
 ofAMX00LzObELa26sg95J1lCduHYCzo=
X-Google-Smtp-Source: APXvYqxKTZ3mcipeAwzIvV1eoDXZzinZ8Pl/unoIm4iDh9cFbrYPdL1D5e/s3w8CvMEQ7Nt93QEiAw==
X-Received: by 2002:a50:d1c6:: with SMTP id i6mr40763749edg.110.1562147697354; 
 Wed, 03 Jul 2019 02:54:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id w14sm533145eda.69.2019.07.03.02.54.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 02:54:56 -0700 (PDT)
Date: Wed, 3 Jul 2019 11:54:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [pull] amdgpu drm-fixes-5.2
Message-ID: <20190703095453.GE15868@phenom.ffwll.local>
References: <20190703015705.3162-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703015705.3162-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Uk3Ch3YDbbsqM+pKnGRUL9+3WRRG3D2+E1fyTpSzOR0=;
 b=ZNZ0cWlsipBtqO7aUEOI9vuCkOhaQIv+sa8xvzTfS3SJamkbit8srC7yWFNB6mF+tr
 5ZkmtZAqlr937xK+1rysRlR2spyp/j7kURLdAOTU0ESmhO8V0N2by+To9AqgoX29wD54
 wsH5SRuft2K0xNA3dmmz1kTlfNfCxCscY2/Ss=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMDg6NTc6MDVQTSAtMDUwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IEhpIERhdmUsIERhbmllbCwKPiAKPiAzIGZpeGVzIGFsbCBjYydlZCB0byBzdGFibGUu
ICBOb3RlIHRoYXQgZGltIGNvbXBsYWlucyBhYm91dCB0aGUgRml4ZXMgdGFnCj4gaW4gb25lIG9m
IHRoZSBwYXRjaGVzLiAgVGhlIHBhdGNoIGhhczoKPiBGaXhlczogOTIxOTM1ZGM2NDA0ICgiZHJt
L2FtZC9wb3dlcnBsYXk6IGVuZm9yY2UgZGlzcGxheSByZWxhdGVkIHNldHRpbmdzIG9ubHkgb24g
bmVlZGVkIikKPiB3aGlsZSBkaW0gcmVjb21tZW5kczoKClRoaXMgaXMgdGhlIHJpZ2h0IGZvcm1h
dC4KCj4gRml4ZXM6IGNvbW1pdCA5MjE5MzVkYzY0MDQgKCJkcm0vYW1kL3Bvd2VycGxheTogZW5m
b3JjZSBkaXNwbGF5IHJlbGF0ZWQgc2V0dGluZ3Mgb25seSBvbiBuZWVkZWQiKQoKQWRkaW5nIGEg
ImNvbW1pdCIgaXMgd3JvbmcuIEFuZCBhdCBsZWFzdCBteSBkaW0gaGVyZSBkb2Vzbid0IGNvbXBs
YWluCmFib3V0IHlvdXIgcHVsbC4gSG93IGRpZCB5b3UgdGVzdCB0aGlzPwotRGFuaWVsCgo+IEkg
ZmVlbCBsaWtlIHRoZSBmb3JtZXIgaXMgdGhlIG1vcmUgY29tbW9uIG5vbWVuY2xldHVyZSAoYXQg
bGVhc3QgaGlzdG9yaWNhbGx5KSwKPiBidXQgSSdtIGhhcHB5IHRvIHJlc3BpbiBpZiB5b3UnZCBw
cmVmZXIuCj4gCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2NjVkNmQ0ZTMy
MzEzYTc5NTJiYjMzMzk2NDdmNzRjM2E2YjBkNzhhOgo+IAo+ICAgTWVyZ2UgdGFnICdkcm0tbWlz
Yy1maXhlcy0yMDE5LTA2LTI2JyBvZiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0v
ZHJtLW1pc2MgaW50byBkcm0tZml4ZXMgKDIwMTktMDYtMjcgMTE6MzQ6NTIgKzEwMDApCj4gCj4g
YXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4gCj4gICBnaXQ6Ly9wZW9w
bGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eCB0YWdzL2RybS1maXhlcy01LjItMjAxOS0w
Ny0wMgo+IAo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAyNWYwOWY4NTg4MzViMGU5
YTA2MjEzODExMDMxMTkwYTE3ZDhhYjc4Ogo+IAo+ICAgZHJtL2FtZGdwdS9nZng5OiB1c2UgcmVz
ZXQgZGVmYXVsdCBmb3IgUEFfU0NfRklGT19TSVpFICgyMDE5LTA3LTAxIDEyOjE2OjI2IC0wNTAw
KQo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiBkcm0tZml4ZXMtNS4yLTIwMTktMDctMDI6Cj4gCj4gRml4ZXMgZm9y
IHN0YWJsZQo+IAo+IGFtZGdwdToKPiAtIHN0YWJpbGl0eSBmaXggZm9yIGdmeDkKPiAtIHJlZ3Jl
c3Npb24gZml4IGZvciBIRyBvbiBzb21lIHBvbGFyaXMgYm9hcmRzCj4gLSBjcmFzaCBmaXggZm9y
IHNvbWUgbmV3IE9FTSBib2FyZHMKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gQWxleCBEZXVjaGVyICgxKToKPiAg
ICAgICBkcm0vYW1kZ3B1L2dmeDk6IHVzZSByZXNldCBkZWZhdWx0IGZvciBQQV9TQ19GSUZPX1NJ
WkUKPiAKPiBFdmFuIFF1YW4gKDEpOgo+ICAgICAgIGRybS9hbWQvcG93ZXJwbGF5OiB1c2UgaGFy
ZHdhcmUgZmFuIGNvbnRyb2wgaWYgbm8gcG93ZXJwbGF5IGZhbiB0YWJsZQo+IAo+IEx5dWRlIFBh
dWwgKDEpOgo+ICAgICAgIGRybS9hbWRncHU6IERvbid0IHNraXAgZGlzcGxheSBzZXR0aW5ncyBp
biBod21ncl9yZXN1bWUoKQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jICAgICAgICAgICAgICAgICB8IDE5IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYyAgICAgICAgICAgfCAgMiArLQo+ICAu
Li4vZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvcHJvY2Vzc19wcHRhYmxlc192MV8wLmMgICB8ICA0
ICsrKy0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2h3bWdyLmggICAgICAg
ICAgICAgfCAgMSArCj4gIC4uLi9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3BvbGFyaXMx
MF9zbXVtZ3IuYyAgIHwgIDQgKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KSwgMjEgZGVsZXRpb25zKC0pCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwg
SW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
