Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C038DDE5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 21:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F78899B0;
	Wed, 14 Aug 2019 19:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054AD899B0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 19:28:57 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a21so220314edt.11
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 12:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=+pjdcKa6fFaMEikMyY1Q6v1FPAhqL6ZE7Dt/EMBZt3Q=;
 b=YKSulDYWUVeq/wdPbdxtLMTWEDEB3noHjWyibKXCMXP2iIUeuSWQGcyNb+eoFiNd2F
 g0uruT/GJISyTlj2vgFpH4jysBIuHp9ol7HqRhQ9FjHJpjX1Dm+iJcMCmnCzbb7Mfud1
 T6lsT2B8l4AmI5HJOkaWOOBmc61YR0q6zHgWyLb4Hji10vMfaKhQ6WH9zZznwOMFMflR
 YjzRx34JJ2AgU9Zy49hM2RAq48gqBXh6eTvmbCvOfx/JRLdEZ/xNUr1AcKwcQzEqrf8c
 STejevcS7A2YsLkEmkk2HNRkwbGI1Pv7sh3H+gHSZc67Y+iPaPdFGSpkw4xBsAFOb6Gy
 A4LQ==
X-Gm-Message-State: APjAAAVFKvQTKdXR8GncMz6+XELQMnuaUZaCx5YaHGlSQ5Q8jCs5ZYj7
 NiH7q6zNEjcmIf3esWoYgfK8jIHPHWO5Ug==
X-Google-Smtp-Source: APXvYqzJE4uFYIxCVrPOWQCesHR/bDkMk3LQToXkyi362vGHI99HJLtaQWx//mD11WWgpmEQj6pwOw==
X-Received: by 2002:a50:a5dd:: with SMTP id b29mr1477347edc.34.1565810936513; 
 Wed, 14 Aug 2019 12:28:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id q10sm67637ejt.54.2019.08.14.12.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 12:28:55 -0700 (PDT)
Date: Wed, 14 Aug 2019 21:28:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/vboxvideo: Make structure vbox_fb_helper_funcs
 constant
Message-ID: <20190814192853.GW7444@phenom.ffwll.local>
References: <20190813062548.24770-1-nishkadg.linux@gmail.com>
 <687f24b1-c3c5-c9d6-9abb-3c84ae009715@redhat.com>
 <20190814172634.GP7444@phenom.ffwll.local>
 <3d20c06e-ff9a-ff05-350b-9d54ab5161cb@redhat.com>
 <20190814175137.GU7444@phenom.ffwll.local>
 <20190814184227.GA23241@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814184227.GA23241@ravnborg.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+pjdcKa6fFaMEikMyY1Q6v1FPAhqL6ZE7Dt/EMBZt3Q=;
 b=HsGVzpAm2bHR2GOkKSWT57e2Ow3XxNptgInj18jWeh7A0rbYGTuGjss6DPQ3HmK92e
 kgF7ooI1uiZVwYtB7K7dRxet4DSnMC25gvWHPZR6/Kqm243I7TZxwSUkjG1L/W5d5ueb
 iZy8Uw23QnAsTVw8N6cZAjTnreujIDdDrSZ80=
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 lwn@lwn.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDg6NDI6MjdQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IE9uIFdlZCwgQXVnIDE0LCAyMDE5IGF0IDA3OjUxOjM3UE0gKzAyMDAsIERhbmllbCBW
ZXR0ZXIgd3JvdGU6Cj4gPiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCAwNzozNjo1NVBNICswMjAw
LCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+ID4gPiBIaSwKPiA+ID4gCj4gPiA+IE9uIDE0LTA4LTE5
IDE5OjI2LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSwgQXVnIDEzLCAyMDE5
IGF0IDA5OjU3OjE5QU0gKzAyMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4gPiA+ID4gPiBIaSwK
PiA+ID4gPiA+IAo+ID4gPiA+ID4gT24gMTMtMDgtMTkgMDg6MjUsIE5pc2hrYSBEYXNndXB0YSB3
cm90ZToKPiA+ID4gPiA+ID4gVGhlIHN0YXRpYyBzdHJ1Y3R1cmUgdmJveF9mYl9oZWxwZXJfZnVu
Y3MsIG9mIHR5cGUgZHJtX2ZiX2hlbHBlcl9mdW5jcywKPiA+ID4gPiA+ID4gaXMgdXNlZCBvbmx5
IHdoZW4gaXQgaXMgcGFzc2VkIGFzIHRoZSB0aGlyZCBhcmd1bWVudCB0bwo+ID4gPiA+ID4gPiBk
cm1fZmJfaGVscGVyX2ZiZGV2X3NldHVwKCksIHdoaWNoIGRvZXMgbm90IG1vZGlmeSBpdC4gSGVu
Y2UgbWFrZSBpdAo+ID4gPiA+ID4gPiBjb25zdGFudCB0byBwcm90ZWN0IGl0IGZyb20gdW5pbnRl
bmRlZCBtb2RpZmljYXRpb25zLgo+ID4gPiA+ID4gPiBJc3N1ZSBmb3VuZCB3aXRoIENvY2NpbmVs
bGUuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOaXNoa2EgRGFzZ3Vw
dGEgPG5pc2hrYWRnLmxpbnV4QGdtYWlsLmNvbT4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhhbmsg
eW91IGZvciB0aGUgcGF0Y2gsIHRoaXMgbG9va3MgZ29vZCB0byBtZToKPiA+ID4gPiA+IAo+ID4g
PiA+ID4gUmV2aWV3ZWQtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4g
PiA+ID4gCj4gPiA+ID4gSSdtIGFzc3VtaW5nIHlvdSdsbCBhcHBseSB0aGlzIHRvIGRybS1taXNj
LW5leHQgdG9vPyBHb29kIHRvIHN0YXRlIHRoYXQsCj4gPiA+ID4gdG8gYXZvaWQgY29uZnVzaW9u
IGFuZCBjb29yZGluYXRpb24gaXNzdWVzLgo+ID4gPiAKPiA+ID4gQWN0dWFsbHkgSSdtIHNvIHVz
ZWQgdG8gdGhlIHdvcmtmbG93IGluIG90aGVyIHN1YnN5c3RlbXMgSSB3YXMKPiA+ID4gZXhwZWN0
aW5nIHRoZSBzdWJzeXMgbWFpbnRhaW5lciB0byBwaWNrIGl0IHVwLiBCdXQgSSBrbm93IHRoYXQK
PiA+ID4gaXMgbm90IGhvdyBpdCB3b3JrcyBmb3IgdGhlIGRybSBzdWJzeXMgYW5kIHNpbmNlIEkn
bSB0aGUgdmJveHZpZGVvCj4gPiA+IG1haW50YWluZXIgSSBndWVzcyBpdCBtYWtlcyBzZW5zZSBm
b3IgbWUgdG8gcGljayB0aGlzIHVwIGFuZCBwdXNoIGl0Lgo+ID4gCj4gPiBZZWFoLCBkcm0gc3Vi
c3lzdGVtIG1haW50YWluZXJzIGFyZSBleGNlZWRpbmdseSBsYXp5IGJhc3RhcmRzLiBTYW1lCj4g
PiBhcHBsaWVzIHRvIHN1YnRyZWUgbWFpbnRhaW5lcnMgKGF0IGxlYXN0IGluIG1vc3QgY2FzZXMp
Lgo+IAo+IEJlIGNhcmVmdWwsIHRoaXMgY291bGQgZW5kIHVwIGluIHNvbWUgcG9wdWxhciBuZXdz
IHNpdGUuCgpSdWxlIG9mIENvb2w6IEFsd2F5cyBiZSBxdW90YWJsZSA6LSkKCkNoZWVycywgRGFu
aWVsCgo+IAo+IAlTYW0KPiA+ICAKPiA+ID4gU28geWVzIEkgd2lsbCBwaWNrIHRoaXMgdXAgYW5k
IHB1c2ggaXQgdG8gZHJtLW1pc2MtbmV4dCwgc29ycnkKPiA+ID4gZm9yIHRoZSBjb25mdXNpb24u
Cj4gPiAKPiA+IFRoYW5rcywgRGFuaWVsCj4gPiAKPiA+ID4gCj4gPiA+IFJlZ2FyZHMsCj4gPiA+
IAo+ID4gPiBIYW5zCj4gPiA+IAo+ID4gPiAKPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ICAg
IGRyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYyB8IDIgKy0KPiA+ID4gPiA+ID4g
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4g
PiA+IAo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92
Ym94X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X2Rydi5jCj4gPiA+ID4g
PiA+IGluZGV4IDAyNTM3YWI5Y2MwOC4uMmI1N2VhMzE5NWYyIDEwMDY0NAo+ID4gPiA+ID4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMKPiA+ID4gPiA+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X2Rydi5jCj4gPiA+ID4gPiA+IEBAIC0z
Miw3ICszMiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3Rb
XSA9IHsKPiA+ID4gPiA+ID4gICAgfTsKPiA+ID4gPiA+ID4gICAgTU9EVUxFX0RFVklDRV9UQUJM
RShwY2ksIHBjaWlkbGlzdCk7Cj4gPiA+ID4gPiA+IC1zdGF0aWMgc3RydWN0IGRybV9mYl9oZWxw
ZXJfZnVuY3MgdmJveF9mYl9oZWxwZXJfZnVuY3MgPSB7Cj4gPiA+ID4gPiA+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9mYl9oZWxwZXJfZnVuY3MgdmJveF9mYl9oZWxwZXJfZnVuY3MgPSB7Cj4g
PiA+ID4gPiA+ICAgIAkuZmJfcHJvYmUgPSB2Ym94ZmJfY3JlYXRlLAo+ID4gPiA+ID4gPiAgICB9
Owo+ID4gPiA+ID4gPiAKPiA+ID4gPiAKPiA+IAo+ID4gLS0gCj4gPiBEYW5pZWwgVmV0dGVyCj4g
PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiA+IGh0dHA6Ly9ibG9nLmZm
d2xsLmNoCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
