Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 391D7DA71F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 10:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3337689FF9;
	Thu, 17 Oct 2019 08:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0BC6E409
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 08:21:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j11so1266715wrp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 01:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=wcAQT4r1spvW6KMkycQX6PNdbUeN63RYbDG8CIMfXUI=;
 b=KOyTdkb5SXkDlQG8sRmUPNfI2BK4jdlRap2nBWlrBOF8tF8LdHJS1cqp9b94lKSEli
 SdE4YwxNNAzTFHsSRXMGjn9b6Fz7Goc8xdgcwDoT8QK5NQnbnzHNFjoCxb7aSvwM1Uxi
 Is4DTJTZJr0MGLDkeSiwXSasGVuGIKFeUsnfERYTJ+m4DoicrHXEAKUqzo1301zkd8nW
 qrdC+hrPtgtT7eLToXlPn/8X8Qn+YosRwtZV7U0AMOFAdZzHfiRnf3YKcVtLcAurvNFg
 Kzxb+13g4n5BDAQS+JVFtB+gJ1nn/YEVBBAaXPN8x1N0WqEh6L/A55xLM2joXrWEXfZg
 TSyg==
X-Gm-Message-State: APjAAAWlDPojKoMrcDVO/hfICtmsfTIPpJSTr5jcXHaY4eR3wVKm5stV
 MCxrrVeXDTKM05QuJxJlQTikxeHxdC8=
X-Google-Smtp-Source: APXvYqyJ5hkiAS7WczuMKs8Vh/CNwjw9j1tt2Av9MErFWExKnmS01fSGPcPV/CBGGy1wJl5SXR8hqA==
X-Received: by 2002:a5d:68c7:: with SMTP id p7mr1838631wrw.156.1571300469312; 
 Thu, 17 Oct 2019 01:21:09 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id n18sm1507056wmi.20.2019.10.17.01.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 01:21:08 -0700 (PDT)
Date: Thu, 17 Oct 2019 10:21:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 1/1] drm: Add TODO item for fbdev driver conversion
Message-ID: <20191017082106.GU11828@phenom.ffwll.local>
References: <20191017074705.9140-1-tzimmermann@suse.de>
 <20191017074705.9140-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017074705.9140-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wcAQT4r1spvW6KMkycQX6PNdbUeN63RYbDG8CIMfXUI=;
 b=LBl/1t03eJ7kcFxX0YSgWVg8tALYIDTAgzxEkC4wk+U3hk6ahaRuzSBBqQIgkPfjRi
 aVB2a5GsapzyQWUqU4cxbmkT/1uwIWqHB6gUbD8O3PF8fZGj4bz8L1b79C296ZgDP2bb
 qr6CR6oTjEL/PYFflnH1uI2mo88i73IIlt8F4=
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, corbet@lwn.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDk6NDc6MDVBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIERSTSBUT0RPIGxpc3Qgbm93IGNvbnRhaW5zIGFuIGVudHJ5IGZvciBj
b252ZXJ0aW5nIGZiZGV2Cj4gZHJpdmVycyBvdmVyIHRvIERSTS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KClJldmlld2VkLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiAtLS0KPiAgRG9jdW1lbnRh
dGlvbi9ncHUvdG9kby5yc3QgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9ncHUvdG9kby5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+IGluZGV4IDc5
Nzg1NTU5ZDcxMS4uMjNiM2E2Nzc5NGJhIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZ3B1
L3RvZG8ucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPiBAQCAtNDYyLDMg
KzQ2MiwzMCBAQCBDb250YWN0OiBTYW0gUmF2bmJvcmcKPiAgCj4gIE91dHNpZGUgRFJNCj4gID09
PT09PT09PT09Cj4gKwo+ICtDb252ZXJ0IGZiZGV2IGRyaXZlcnMgdG8gRFJNCj4gKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiArCj4gK1RoZXJlIGFyZSBwbGVudHkgb2YgZmJkZXYgZHJp
dmVycyBmb3Igb2xkZXIgaGFyZHdhcmUuIFNvbWUgaHdhcmR3YXJlIGhhcwo+ICtiZWNvbWUgb2Jz
b2xldGUsIGJ1dCBzb21lIHN0aWxsIHByb3ZpZGVzIGdvb2QoLWVub3VnaCkgZnJhbWVidWZmZXJz
LiBUaGUKPiArZHJpdmVycyB0aGF0IGFyZSBzdGlsbCB1c2VmdWwgc2hvdWxkIGJlIGNvbnZlcnRl
ZCB0byBEUk0gYW5kIGFmdGVyd2FyZHMKPiArcmVtb3ZlZCBmcm9tIGZiZGV2Lgo+ICsKPiArVmVy
eSBzaW1wbGUgZmJkZXYgZHJpdmVycyBjYW4gYmVzdCBiZSBjb252ZXJ0ZWQgYnkgc3RhcnRpbmcg
d2l0aCBhIG5ldwo+ICtEUk0gZHJpdmVyLiBTaW1wbGUgS01TIGhlbHBlcnMgYW5kIFNITUVNIHNo
b3VsZCBiZSBhYmxlIHRvIGhhbmRsZSBhbnkKPiArZXhpc3RpbmcgaGFyZHdhcmUuIFRoZSBuZXcg
ZHJpdmVyJ3MgY2FsbC1iYWNrIGZ1bmN0aW9ucyBhcmUgZmlsbGVkIGZyb20KPiArZXhpc3Rpbmcg
ZmJkZXYgY29kZS4KPiArCj4gK01vcmUgY29tcGxleCBmYmRldiBkcml2ZXJzIGNhbiBiZSByZWZh
Y3RvcmVkIHN0ZXAtYnktc3RlcCBpbnRvIGEgRFJNCj4gK2RyaXZlciB3aXRoIHRoZSBoZWxwIG9m
IHRoZSBEUk0gZmJjb252IGhlbHBlcnMuIFsxXSBUaGVzZSBoZWxwZXJzIHByb3ZpZGUKPiArdGhl
IHRyYW5zaXRpb24gbGF5ZXIgYmV0d2VlbiB0aGUgRFJNIGNvcmUgaW5mcmFzdHJ1Y3R1cmUgYW5k
IHRoZSBmYmRldgo+ICtkcml2ZXIgaW50ZXJmYWNlLiBDcmVhdGUgYSBuZXcgRFJNIGRyaXZlciBv
biB0b3Agb2YgdGhlIGZiY29udiBoZWxwZXJzLAo+ICtjb3B5IG92ZXIgdGhlIGZiZGV2IGRyaXZl
ciwgYW5kIGhvb2sgaXQgdXAgdG8gdGhlIERSTSBjb2RlLiBFeGFtcGxlcyBmb3IKPiArc2V2ZXJh
bCBmYmRldiBkcml2ZXJzIGFyZSBhdmFpbGFibGUgYXQgWzFdIGFuZCBhIHR1dG9yaWFsIG9mIHRo
aXMgcHJvY2Vzcwo+ICthdmFpbGFibGUgYXQgWzJdLiBUaGUgcmVzdWx0IGlzIGEgcHJpbWl0aXZl
IERSTSBkcml2ZXIgdGhhdCBjYW4gcnVuIFgxMQo+ICthbmQgV2VzdG9uLgo+ICsKPiArIC0gWzFd
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy90emltbWVybWFubi9saW51eC90cmVlL2Zi
Y29udgo+ICsgLSBbMl0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3R6aW1tZXJtYW5u
L2xpbnV4L2Jsb2IvZmJjb252L2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJjb252X2hlbHBlci5jCgpi
dHcgaWYgeW91IHdhbnQgdG8gcHVzaCBhIHBhdGNoIHRvIGdldCB0aGlzIGJ1aWx0IGFuZCBwdWJs
aXNoZWQ6CgpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMv
YmxvYi9tYXN0ZXIvLmdpdGxhYi1jaS55bWwKClRoZSAicGFnZXMiIGpvYiBpcyB0aGUgb25lIHdo
aWNoIGdldHMgcHVibGlzaGVkIHRvCgpodHRwczovL2RybS5wYWdlcy5mcmVlZGVza3RvcC5vcmcv
aWd0LWdwdS10b29scy8KCldpdGggdGhhdCB5b3UgY291bGQgcG9pbnQgYXQgdGhlIHByZXR0eSBo
bXRsIGV2ZW4uCi1EYW5pZWwKCj4gKwo+ICtDb250YWN0OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4KPiAtLSAKPiAyLjIzLjAKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
