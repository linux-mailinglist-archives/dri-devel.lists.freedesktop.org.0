Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139061040EB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 17:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5EE6E8C4;
	Wed, 20 Nov 2019 16:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5006E89C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 16:37:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i12so536900wrn.11
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 08:37:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=oBzjewY0/4230hInVXCRKl4aHXyti/pZjQvt6RHt1VA=;
 b=XBwzpFcJqWDToKMnS89wVw1Yk429927brxmUXqiWbGobEjKB6s6N1A8aN1JMsVYhBQ
 CRhmSF/baYSPkbkknkFy+8Yy/v+jvkR6aj9XBsV9xJgplFGxLh6QDa9apju2S6B2HCtI
 pe7CvG1dBJCvkKF857Nw1PeYKWAU5FX07/RsgL8lyhcz6gaj1ZX1inEDCi04LyYLIylZ
 mZ5BPPplWuvy+fgduj/wi7b/j8HptxYC+CO6w7yNqEnYjsr1h0/AJl6RCSnSdMGoXDr5
 T/7qAqcs/wmtthDLfER1ZKcwN+nk8pJYagFFFkZfrAiBZw2cJ+dLDKJmUWtcj2nBuNIR
 2Hvg==
X-Gm-Message-State: APjAAAVBeXPUIcNZpSalBiS6J2Zye9DgeMwa9NyFjdKhrH5YCcASCUB4
 pEur7/PHqZyFOZpX8bbdxapFYw==
X-Google-Smtp-Source: APXvYqzNCV+sfP02kErA79n55a947yOZR5HcIjv64GQCubrDGzn6eKqtIii7sRSDlHmruuk2gvm8gg==
X-Received: by 2002:adf:f3c5:: with SMTP id g5mr4563865wrp.5.1574267847491;
 Wed, 20 Nov 2019 08:37:27 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id w10sm6906706wmd.26.2019.11.20.08.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 08:37:26 -0800 (PST)
Date: Wed, 20 Nov 2019 17:37:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] drm/omap: Fix Kconfig indentation
Message-ID: <20191120163724.GO30416@phenom.ffwll.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
References: <20191120133615.11329-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120133615.11329-1-krzk@kernel.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oBzjewY0/4230hInVXCRKl4aHXyti/pZjQvt6RHt1VA=;
 b=HdWShTL7uCjMONRqimJ2Eyo1ErSQletuc9rg4RJp8o2bbAXc6g8xE5d2oe6BykafHS
 bSovGk+jYKaKxa6lr3D8Ku2oaQEgdSwfSmbmXJQ2qmxKm0oAs63TVV5NHo0Y95Sggj1o
 1w54Gfx8i+ukog6S2BG5rc/BftMP4JzzIdkU0=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDk6MzY6MTRQTSArMDgwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBBZGp1c3QgaW5kZW50YXRpb24gZnJvbSBzcGFjZXMgdG8gdGFiICgrb3B0
aW9uYWwgdHdvIHNwYWNlcykgYXMgaW4KPiBjb2Rpbmcgc3R5bGUgd2l0aCBjb21tYW5kIGxpa2U6
Cj4gCSQgc2VkIC1lICdzL14gICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KClF1ZXVlZCBmb3Ig
NS42IGluIGRybS1taXNjLCB0aGFua3MgZm9yIHlvdXIgcGF0Y2guCi1EYW5pZWwKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZGlzcGxheXMvS2NvbmZpZyB8ICA2ICsrKy0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvS2NvbmZpZyAgICAgIHwgMTIgKysrKysrLS0tLS0t
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9LY29uZmlnIGIv
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZGlzcGxheXMvS2NvbmZpZwo+IGluZGV4IDI0MGRkYTEw
Mjg0NS4uYjU2MmE4Y2Q2MWJmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L2Rpc3BsYXlzL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5
cy9LY29uZmlnCj4gQEAgLTgsMTggKzgsMTggQEAgY29uZmlnIERSTV9PTUFQX0VOQ09ERVJfT1BB
MzYyCj4gIAkgIHRocm91Z2ggYSBHUElPLgo+ICAKPiAgY29uZmlnIERSTV9PTUFQX0VOQ09ERVJf
VFBEMTJTMDE1Cj4gLSAgICAgICAgdHJpc3RhdGUgIlRQRDEyUzAxNSBIRE1JIEVTRCBwcm90ZWN0
aW9uIGFuZCBsZXZlbCBzaGlmdGVyIgo+ICsJdHJpc3RhdGUgIlRQRDEyUzAxNSBIRE1JIEVTRCBw
cm90ZWN0aW9uIGFuZCBsZXZlbCBzaGlmdGVyIgo+ICAJaGVscAo+ICAJICBEcml2ZXIgZm9yIFRQ
RDEyUzAxNSwgd2hpY2ggb2ZmZXJzIEhETUkgRVNEIHByb3RlY3Rpb24gYW5kIGxldmVsCj4gIAkg
IHNoaWZ0aW5nLgo+ICAKPiAgY29uZmlnIERSTV9PTUFQX0NPTk5FQ1RPUl9IRE1JCj4gLSAgICAg
ICAgdHJpc3RhdGUgIkhETUkgQ29ubmVjdG9yIgo+ICsJdHJpc3RhdGUgIkhETUkgQ29ubmVjdG9y
Igo+ICAJaGVscAo+ICAJICBEcml2ZXIgZm9yIGEgZ2VuZXJpYyBIRE1JIGNvbm5lY3Rvci4KPiAg
Cj4gIGNvbmZpZyBEUk1fT01BUF9DT05ORUNUT1JfQU5BTE9HX1RWCj4gLSAgICAgICAgdHJpc3Rh
dGUgIkFuYWxvZyBUViBDb25uZWN0b3IiCj4gKwl0cmlzdGF0ZSAiQW5hbG9nIFRWIENvbm5lY3Rv
ciIKPiAgCWhlbHAKPiAgCSAgRHJpdmVyIGZvciBhIGdlbmVyaWMgYW5hbG9nIFRWIGNvbm5lY3Rv
ci4KPiAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9LY29uZmln
IGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL0tjb25maWcKPiBpbmRleCA5NTZmMjNlMTQ1
MmQuLjcyYWU3OWMwYzliNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9k
c3MvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9LY29uZmlnCj4g
QEAgLTYsMTIgKzYsMTIgQEAgY29uZmlnIE9NQVBfRFNTX0JBU0UKPiAgCXRyaXN0YXRlCj4gIAo+
ICBtZW51Y29uZmlnIE9NQVAyX0RTUwo+IC0gICAgICAgIHRyaXN0YXRlICJPTUFQMisgRGlzcGxh
eSBTdWJzeXN0ZW0gc3VwcG9ydCIKPiArCXRyaXN0YXRlICJPTUFQMisgRGlzcGxheSBTdWJzeXN0
ZW0gc3VwcG9ydCIKPiAgCXNlbGVjdCBPTUFQX0RTU19CQVNFCj4gIAlzZWxlY3QgVklERU9NT0RF
X0hFTFBFUlMKPiAgCXNlbGVjdCBPTUFQMl9EU1NfSU5JVAo+ICAJc2VsZWN0IEhETUkKPiAtICAg
ICAgICBoZWxwCj4gKwloZWxwCj4gIAkgIE9NQVAyKyBEaXNwbGF5IFN1YnN5c3RlbSBzdXBwb3J0
Lgo+ICAKPiAgaWYgT01BUDJfRFNTCj4gQEAgLTUyLDcgKzUyLDcgQEAgY29uZmlnIE9NQVAyX0RT
U19EUEkKPiAgCj4gIGNvbmZpZyBPTUFQMl9EU1NfVkVOQwo+ICAJYm9vbCAiVkVOQyBzdXBwb3J0
Igo+IC0gICAgICAgIGRlZmF1bHQgeQo+ICsJZGVmYXVsdCB5Cj4gIAloZWxwCj4gIAkgIE9NQVAg
VmlkZW8gRW5jb2RlciBzdXBwb3J0IGZvciBTLVZpZGVvIGFuZCBjb21wb3NpdGUgVFYtb3V0Lgo+
ICAKPiBAQCAtNjEsNyArNjEsNyBAQCBjb25maWcgT01BUDJfRFNTX0hETUlfQ09NTU9OCj4gIAo+
ICBjb25maWcgT01BUDRfRFNTX0hETUkKPiAgCWJvb2wgIkhETUkgc3VwcG9ydCBmb3IgT01BUDQi
Cj4gLSAgICAgICAgZGVmYXVsdCB5Cj4gKwlkZWZhdWx0IHkKPiAgCXNlbGVjdCBPTUFQMl9EU1Nf
SERNSV9DT01NT04KPiAgCWhlbHAKPiAgCSAgSERNSSBzdXBwb3J0IGZvciBPTUFQNCBiYXNlZCBT
b0NzLgo+IEBAIC04NSw3ICs4NSw3IEBAIGNvbmZpZyBPTUFQNV9EU1NfSERNSQo+ICAKPiAgY29u
ZmlnIE9NQVAyX0RTU19TREkKPiAgCWJvb2wgIlNESSBzdXBwb3J0Igo+IC0gICAgICAgIGRlZmF1
bHQgbgo+ICsJZGVmYXVsdCBuCj4gIAloZWxwCj4gIAkgIFNESSAoU2VyaWFsIERpc3BsYXkgSW50
ZXJmYWNlKSBzdXBwb3J0Lgo+ICAKPiBAQCAtOTQsNyArOTQsNyBAQCBjb25maWcgT01BUDJfRFNT
X1NESQo+ICAKPiAgY29uZmlnIE9NQVAyX0RTU19EU0kKPiAgCWJvb2wgIkRTSSBzdXBwb3J0Igo+
IC0gICAgICAgIGRlZmF1bHQgbgo+ICsJZGVmYXVsdCBuCj4gIAloZWxwCj4gIAkgIE1JUEkgRFNJ
IChEaXNwbGF5IFNlcmlhbCBJbnRlcmZhY2UpIHN1cHBvcnQuCj4gIAo+IC0tIAo+IDIuMTcuMQo+
IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
