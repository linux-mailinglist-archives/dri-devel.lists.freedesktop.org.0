Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18733108A6F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 10:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C481189FF9;
	Mon, 25 Nov 2019 09:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEC889FF9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 09:04:32 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i12so16973653wro.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 01:04:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=FCcRXq9rJbMPMfoFuzPFIe7CFg7Q6ZOnAYxFNHJ2YvA=;
 b=Z74tGX77d8F1C1bVNRHFFPstyfUisHFIbH/y9O9OEqf09zmSnIUhslCgLqB+Blu1nn
 gO6s194zQh8IMsbJ9zczW0Ghvg+/6HDJC4d4BzURwlaqJBX530k1wglD3mIXK/+z4xlm
 LozhjXui27eQOLoBLE4DAmQ2Vny4uD2UGjxuw9zX4GQJUQ+KfIS1LPzkQWfxMPi87BRe
 C9hb1oUB0s4kcLnZ/IqYGBV3llv8yfPehw7KtctfV2Edf5bezlhTjgQfAvIqsHAdfyiN
 I4qjGNnBiNzmH6cUNz0p+H1f8xo9RdEIKlZpH2+5WLY+AuLOlE60FuIvt1dF+wHoU3Jc
 a38A==
X-Gm-Message-State: APjAAAUpDpeOFAYP2/bbgrJt+fcOrt07diDaeJmeSSdofroL7x7QQOe6
 +IAFia1KI/JzdVBNjf39UyLfOjzLRgk=
X-Google-Smtp-Source: APXvYqyQrihAxd9KIrI5g1bVfEDvkyJIYOfqMHWXRNrqbbA0K6a2Hi0OFP2QAYHm/PkP+X/BY9gfCw==
X-Received: by 2002:a5d:5227:: with SMTP id i7mr30428764wra.277.1574672670756; 
 Mon, 25 Nov 2019 01:04:30 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 91sm10059586wrm.42.2019.11.25.01.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 01:04:30 -0800 (PST)
Date: Mon, 25 Nov 2019 10:04:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] drm/sun4i: Fix Kconfig indentation
Message-ID: <20191125090428.GD29965@phenom.ffwll.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20191121132924.29485-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121132924.29485-1-krzk@kernel.org>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FCcRXq9rJbMPMfoFuzPFIe7CFg7Q6ZOnAYxFNHJ2YvA=;
 b=Pckq8+ZBX0c5vXqXPdW0trgRD8vqBwKVOHlUk33mbPiLqxw35IH8UR0w3sDEVmDsTK
 755Bektz7Ti/C1L26KE6nGgar7kYjqM5NIUhjtqtXK8VEdSoS9fpd7IMsj2sOvFLvUx2
 qW0Kqn530++EQSW3YQsiWIMTzwIdm6azBwOfg=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDk6Mjk6MjRQTSArMDgwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBBZGp1c3QgaW5kZW50YXRpb24gZnJvbSBzcGFjZXMgdG8gdGFiICgrb3B0
aW9uYWwgdHdvIHNwYWNlcykgYXMgaW4KPiBjb2Rpbmcgc3R5bGUgd2l0aCBjb21tYW5kIGxpa2U6
Cj4gCSQgc2VkIC1lICdzL14gICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KUXVldWVkIGluIGRy
bS1taXNjLW5leHQgZm9yIDUuNiwgdGhhbmtzIGZvciB5b3VyIHBhdGNoLgotRGFuaWVsCgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvS2NvbmZpZyB8IDE2ICsrKysrKysrLS0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL0tjb25maWcgYi9kcml2ZXJzL2dwdS9k
cm0vc3VuNGkvS2NvbmZpZwo+IGluZGV4IDM3ZTkwZTQyOTQzZi4uNTc1NWYwNDMyZTc3IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL0tjb25maWcKPiBAQCAtMTcsMTggKzE3LDE4IEBAIGNvbmZpZyBEUk1fU1VO
NEkKPiAgaWYgRFJNX1NVTjRJCj4gIAo+ICBjb25maWcgRFJNX1NVTjRJX0hETUkKPiAtICAgICAg
IHRyaXN0YXRlICJBbGx3aW5uZXIgQTEwIEhETUkgQ29udHJvbGxlciBTdXBwb3J0Igo+IC0gICAg
ICAgZGVmYXVsdCBEUk1fU1VONEkKPiAtICAgICAgIGhlbHAKPiArCXRyaXN0YXRlICJBbGx3aW5u
ZXIgQTEwIEhETUkgQ29udHJvbGxlciBTdXBwb3J0Igo+ICsJZGVmYXVsdCBEUk1fU1VONEkKPiAr
CWhlbHAKPiAgCSAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSBoYXZlIGFuIEFsbHdpbm5lciBT
b0Mgd2l0aCBhbiBIRE1JCj4gIAkgIGNvbnRyb2xsZXIuCj4gIAo+ICBjb25maWcgRFJNX1NVTjRJ
X0hETUlfQ0VDCj4gLSAgICAgICBib29sICJBbGx3aW5uZXIgQTEwIEhETUkgQ0VDIFN1cHBvcnQi
Cj4gLSAgICAgICBkZXBlbmRzIG9uIERSTV9TVU40SV9IRE1JCj4gLSAgICAgICBzZWxlY3QgQ0VD
X0NPUkUKPiAtICAgICAgIHNlbGVjdCBDRUNfUElOCj4gLSAgICAgICBoZWxwCj4gKwlib29sICJB
bGx3aW5uZXIgQTEwIEhETUkgQ0VDIFN1cHBvcnQiCj4gKwlkZXBlbmRzIG9uIERSTV9TVU40SV9I
RE1JCj4gKwlzZWxlY3QgQ0VDX0NPUkUKPiArCXNlbGVjdCBDRUNfUElOCj4gKwloZWxwCj4gIAkg
IENob29zZSB0aGlzIG9wdGlvbiBpZiB5b3UgaGF2ZSBhbiBBbGx3aW5uZXIgU29DIHdpdGggYW4g
SERNSQo+ICAJICBjb250cm9sbGVyIGFuZCB3YW50IHRvIHVzZSBDRUMuCj4gIAo+IC0tIAo+IDIu
MTcuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
