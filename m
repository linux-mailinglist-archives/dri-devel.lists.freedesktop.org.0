Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D25424362F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1815F892C1;
	Thu, 13 Jun 2019 13:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270D58985A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:02:20 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id i11so3137295edq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 06:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=cJRBQx5YxcwIhfNgYtr+awKAW8N0g+gyh+1LcFGolTQ=;
 b=G+I+T6fezEBAI7hxmVEhgpEFTlBUcNnPgCjjH5fn39ZtJ8IPIyCWB9cXdazauHdvh/
 bnqEjLOagga1/6YMY91mgu0VLkAKJmp9pdUIb/UlYxUwe05oRRS7kIFHPNa+FTPJlcOP
 fZeeTaI52RCU4lpGe7TYvwPrb46AzSDSxxoOrCktymt5kDZlrvBUnel4PKWpxz9XG0U6
 rv33nc3W/bsPuNbi6aV9CXExFN4r7fS9OV6/DC/iL64jhHWgOy4qM+pRZ+MHCWjS9UmI
 d5zPRZIIO4RksXa2ABFk0ap2EJxql+fSg4+R04K3/fmLFla2K0JXq0jnMkgNEiaMELg+
 oxjw==
X-Gm-Message-State: APjAAAUmTo8J5b34AZiuFPPVhOu7g/6iu8Qdleg+KzTmEoVnFp5h2UEp
 Afiv58yQGbkN5JRN03BwDWlKEQ==
X-Google-Smtp-Source: APXvYqydJyCN2ejb4sYFNpsOx6DvRxHS6dguRoaeb7buM055N5urRzG3PEdHdlZeNrH+m3Qcx8AUHg==
X-Received: by 2002:a17:906:fcb8:: with SMTP id
 qw24mr58400990ejb.239.1560430938720; 
 Thu, 13 Jun 2019 06:02:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id i2sm864561edg.81.2019.06.13.06.02.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 06:02:17 -0700 (PDT)
Date: Thu, 13 Jun 2019 15:02:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <20190613130215.GK23020@phenom.ffwll.local>
References: <87y325x22w.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y325x22w.fsf@intel.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=cJRBQx5YxcwIhfNgYtr+awKAW8N0g+gyh+1LcFGolTQ=;
 b=AnxTmpvNiCfCMe9fGx72TZSvOZV/xfXFzc4NKRLQesKt2TyH4JW/DMWlq4tPmuyrcu
 t4Hi9/79vX39cQAdzip0uYH4wIk8wbg7Ol8ZwD+eOSgmBMQTAMyG2KTteQxNizKXwsPO
 sFlq3GVGNmKcldcIAQdyE2/zoBY5099TlsCUA=
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTI6MzI6MzlQTSArMDMwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gCj4gSGkgRGF2ZSwgRGFuaWVsLCBvbiBiZWhhbGYgb2YgSm9vbmFzLAo+IAo+IGRybS1p
bnRlbC1maXhlcy0yMDE5LTA2LTEzOgo+IGRybS9pOTE1IGZpeGVzIGZvciB2NS4yLXJjNToKPiAt
IEZpeCBETUMgZmlybXdhcmUgaW5wdXQgdmFsaWRhdGlvbiB0byBhdm9pZCBidWZmZXIgb3ZlcmZs
b3cKPiAtIEZpeCBwZXJmIHJlZ2lzdGVyIGFjY2VzcyB3aGl0ZWxpc3QgZm9yIHVzZXJzcGFjZQo+
IC0gRml4IERTSSBwYW5lbCBvbiBHUEQgTWljcm9QQwo+IC0gRml4IHBlci1waXhlbCBhbHBoYSB3
aXRoIENDUwo+IC0gRml4IEhETUkgYXVkaW8gZm9yIFNEVk8KClB1bGxlZCwgdGhhbmtzLgotRGFu
aWVsCgo+IAo+IEJSLAo+IEphbmkuCj4gCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdCBkMWZkYjZkOGY2YTQxMDlhNDI2MzE3NmM4NGI4OTkwNzZhNWY4MDA4Ogo+IAo+ICAgTGlu
dXggNS4yLXJjNCAoMjAxOS0wNi0wOCAyMDoyNDo0NiAtMDcwMCkKPiAKPiBhcmUgYXZhaWxhYmxl
IGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiAKPiAgIGdpdDovL2Fub25naXQuZnJlZWRlc2t0
b3Aub3JnL2RybS9kcm0taW50ZWwgdGFncy9kcm0taW50ZWwtZml4ZXMtMjAxOS0wNi0xMwo+IAo+
IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBjNWNjMGJmODcwY2ZiODBiMjc4OTllOTE2
YjQzOTdjZTExYzYxZDk2Ogo+IAo+ICAgZHJtL2k5MTUvcGVyZjogZml4IHdoaXRlbGlzdCBvbiBH
ZW4xMCsgKDIwMTktMDYtMTIgMTA6NDI6MjIgKzAzMDApCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IGRybS9pOTE1
IGZpeGVzIGZvciB2NS4yLXJjNToKPiAtIEZpeCBETUMgZmlybXdhcmUgaW5wdXQgdmFsaWRhdGlv
biB0byBhdm9pZCBidWZmZXIgb3ZlcmZsb3cKPiAtIEZpeCBwZXJmIHJlZ2lzdGVyIGFjY2VzcyB3
aGl0ZWxpc3QgZm9yIHVzZXJzcGFjZQo+IC0gRml4IERTSSBwYW5lbCBvbiBHUEQgTWljcm9QQwo+
IC0gRml4IHBlci1waXhlbCBhbHBoYSB3aXRoIENDUwo+IC0gRml4IEhETUkgYXVkaW8gZm9yIFNE
Vk8KPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gSGFucyBkZSBHb2VkZSAoMSk6Cj4gICAgICAgZHJtL2k5MTUvZHNp
OiBVc2UgYSBmdXp6eSBjaGVjayBmb3IgYnVyc3QgbW9kZSBjbG9jayBjaGVjawo+IAo+IExpb25l
bCBMYW5kd2VybGluICgxKToKPiAgICAgICBkcm0vaTkxNS9wZXJmOiBmaXggd2hpdGVsaXN0IG9u
IEdlbjEwKwo+IAo+IEx1Y2FzIERlIE1hcmNoaSAoMSk6Cj4gICAgICAgZHJtL2k5MTUvZG1jOiBw
cm90ZWN0IGFnYWluc3QgcmVhZGluZyByYW5kb20gbWVtb3J5Cj4gCj4gVmlsbGUgU3lyasOkbMOk
ICgyKToKPiAgICAgICBkcm0vaTkxNTogRml4IHBlci1waXhlbCBhbHBoYSB3aXRoIENDUwo+ICAg
ICAgIGRybS9pOTE1L3Nkdm86IEltcGxlbWVudCBwcm9wZXIgSERNSSBhdWRpbyBzdXBwb3J0IGZv
ciBTRFZPCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcGVyZi5jICAgICAgIHwgIDEg
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oICAgICAgICB8ICAxICsKPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfY3NyLmMgICAgICAgfCAxOCArKysrKysrKysrKwo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kaXNwbGF5LmMgICB8IDE0ICsrKysrLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2Rydi5oICAgICAgIHwgIDEgKwo+ICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9pbnRlbF9kc2lfdmJ0LmMgICB8IDExICsrKysrKysKPiAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaW50ZWxfc2R2by5jICAgICAgfCA1OCArKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3Nkdm9fcmVncy5oIHwgIDMg
KysKPiAgOCBmaWxlcyBjaGFuZ2VkLCA5MSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkK
PiAKPiAtLSAKPiBKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVy
CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
