Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562697AAB5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 16:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70286E55C;
	Tue, 30 Jul 2019 14:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF496E55C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 14:16:50 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u25so46450030wmc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 07:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=z8rp392xsuUdo7vFbvfpR3Mr62XlCM5rCOawpzCaL/I=;
 b=OMt8/Q9E47dRYUFkuGGgOQQ2ZlGDqOMNwRKXPmSzVIhzzkLmdbRAJ62PUr/cHrAnbo
 pvKuc1x04s9XciAl/T3AJorghNFqIzWMUkyvhKi5Rhk/kZsHQp6/lsRY7Yho3imwGkWO
 K9Jjp7dCA0ZNEuvVTDcOBuCCj8b8Q+aYRyu22oeWFCXgnp9xrshOpQblcvLh8k+xqBUC
 1EWJbdV5xdNC/n6skp6TvmDRcjDBETfTogm2OuhYAGYlpUobSqFKBrjL7fZO7X7P8mp6
 0n0TX6+PvL5pFYO5T1rzpCfv1Rp0RVFhyfFgnEIv/lVbjecZQP89jm4Rnr8TG0RF1ZzL
 YKDA==
X-Gm-Message-State: APjAAAWFmW9Ptmklp0SPM1BmKeTthNnjpfZ1zIFQXrtf+8WMkyMLjN0S
 oGZbNMw+f8UNbyI8mm2sBAI=
X-Google-Smtp-Source: APXvYqyG0lrJeq7yKhM/oVFydLCIiQo2MCjY4HjxL5A9cai+6J48U29+wK0CbSl3auKc4VTr+pXrUQ==
X-Received: by 2002:a1c:988a:: with SMTP id
 a132mr102989570wme.165.1564496208739; 
 Tue, 30 Jul 2019 07:16:48 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id f3sm48167881wrt.56.2019.07.30.07.16.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 07:16:48 -0700 (PDT)
Date: Tue, 30 Jul 2019 15:16:19 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 1/3] drm/tinydrm/Kconfig: Remove menuconfig DRM_TINYDRM
Message-ID: <20190730141619.GC12424@arch-x1c3>
References: <20190725105132.22545-1-noralf@tronnes.org>
 <20190725105132.22545-2-noralf@tronnes.org>
 <20190730135302.GA12424@arch-x1c3>
 <45d73a17-2197-6d31-923f-93af4bfd895a@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45d73a17-2197-6d31-923f-93af4bfd895a@tronnes.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=z8rp392xsuUdo7vFbvfpR3Mr62XlCM5rCOawpzCaL/I=;
 b=MkA28HGUU1djmpDAylNzKZMaTW4msq/ukRDeV3gKE0mM7mDOAHkXSyG1GdEY/MwTel
 OyNHKGs/NNh9qeAxQSdSbMi8tBkzS4UnQRguqR7HskROb3qK4cvViCuH+yKcA+RVcMRL
 TiyRULRzSQ284TW/OSh30p5gPNqZIWzD0NRrMHcwb4cTqPqKTb4cCYxfjyPnfsR7ABsR
 INRouZKgWXJG6o+icg/EK4dx4lxdz/tK+/2RaHM4T6U3wf+T7jjCJdC0wY8A+IxVtZnH
 jrOkwYct0Ugv2c8QFQoBXKYN4ZB/rsdd7NGYu3wo4unHSSauv2ujbdHvN0i0uTXnpcqH
 Nwgg==
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNy8zMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+IAo+IAo+IERlbiAzMC4wNy4y
MDE5IDE1LjUzLCBza3JldiBFbWlsIFZlbGlrb3Y6Cj4gPiBPbiAyMDE5LzA3LzI1LCBOb3JhbGYg
VHLDuG5uZXMgd3JvdGU6Cj4gPj4gVGhpcyBtYWtlcyB0aGUgdGlueSBkcml2ZXJzIHZpc2libGUg
YnkgZGVmYXVsdCB3aXRob3V0IGhhdmluZyB0byBlbmFibGUgYQo+ID4+IGtub2IuCj4gPj4KPiA+
PiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiA+
PiAtLS0KPiA+PiAgZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlICAgICAgICB8ICAyICstCj4gPj4g
IGRyaXZlcnMvZ3B1L2RybS90aW55ZHJtL0tjb25maWcgfCAzNyArKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0KPiA+PiAgMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAx
NyBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vTWFr
ZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUKPiA+PiBpbmRleCA5OGM3MzJmOTI1Yzcu
LjBiMzBhZmE3NTI0ZCAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUK
PiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUKPiA+PiBAQCAtMTEyLDcgKzExMiw3
IEBAIG9iai0kKENPTkZJR19EUk1fQVJDUEdVKSs9IGFyYy8KPiA+PiAgb2JqLXkJCQkrPSBoaXNp
bGljb24vCj4gPj4gIG9iai0kKENPTkZJR19EUk1fWlRFKQkrPSB6dGUvCj4gPj4gIG9iai0kKENP
TkZJR19EUk1fTVhTRkIpCSs9IG14c2ZiLwo+ID4+IC1vYmotJChDT05GSUdfRFJNX1RJTllEUk0p
ICs9IHRpbnlkcm0vCj4gPj4gK29iai15CQkJKz0gdGlueWRybS8KPiA+PiAgb2JqLSQoQ09ORklH
X0RSTV9QTDExMSkgKz0gcGwxMTEvCj4gPj4gIG9iai0kKENPTkZJR19EUk1fVFZFMjAwKSArPSB0
dmUyMDAvCj4gPj4gIG9iai0kKENPTkZJR19EUk1fWEVOKSArPSB4ZW4vCj4gPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90aW55ZHJtL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vdGlu
eWRybS9LY29uZmlnCj4gPj4gaW5kZXggNDJiMDZmNGY4OTg5Li5mOGM5YTBlNzFkZGUgMTAwNjQ0
Cj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vS2NvbmZpZwo+ID4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90aW55ZHJtL0tjb25maWcKPiA+PiBAQCAtMSwxNiArMSw5IEBACj4gPj4g
ICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ID4+IC1tZW51Y29uZmln
IERSTV9USU5ZRFJNCj4gPj4gLQl0cmlzdGF0ZSAiU3VwcG9ydCBmb3Igc2ltcGxlIGRpc3BsYXlz
Igo+ID4+IC0JZGVwZW5kcyBvbiBEUk0KPiA+PiAtCXNlbGVjdCBEUk1fS01TX0hFTFBFUgo+ID4+
IC0Jc2VsZWN0IERSTV9LTVNfQ01BX0hFTFBFUgo+ID4+IC0JaGVscAo+ID4+IC0JICBDaG9vc2Ug
dGhpcyBvcHRpb24gaWYgeW91IGhhdmUgYSB0aW55ZHJtIHN1cHBvcnRlZCBkaXNwbGF5Lgo+ID4+
IC0JICBJZiBNIGlzIHNlbGVjdGVkIHRoZSBtb2R1bGUgd2lsbCBiZSBjYWxsZWQgdGlueWRybS4K
PiA+PiAtCj4gPiBGd2l3IEkgd291bGQgaGF2ZSBnb25lIHdpdGggSGFuJ3MgaWRlYSBvZiBtYWtp
bmcgdGhpcyBoaWRkZW4uIFRoYXQgaGFzIGEKPiA+IG51bWJlciBvZiBhZHZhbnRhZ2VzLCBldmVu
IGlmIHdlIGRvbid0IGhhdmUgYSBzZXBhcmF0ZSB0aW55ZHJtLmtvOgo+ID4gIC0gdGhlIHRpbnlk
cm0gY29kZSBpcyBub3QgYnVpbGQgd2hlbiB0aGVyZSBhcmUgbm8gdXNlcnMKPiAKPiBUaGUgdGhp
bmcgaXMsIHRoZXJlIGlzIG5vIHRpbnlkcm0gY29kZSBhbnltb3JlLCBpdCdzIGFsbCBiZWVuIHB1
dCBpbnRvCj4gdmFyaW91cyBjb3JlIGhlbHBlcnMuIFRoZSBmb2xkZXIgZG9lcyBvbmx5IGNvbnRh
aW4gcmVndWxhciBEUk0gZHJpdmVycy4KPiBUaGUgb25seSB0aGluZyBzcGVjaWFsIGFib3V0IHRo
ZW0gaXMgdGhhdCB0aGV5IGZpdCBpbnRvIG9uZSBzb3VyY2UgZmlsZS4KClJpZ2h0LCBJIHNhdyB5
b3VyIHNlcmllcyBraWxsaW5nIHRpbnlkcm0ua28gWzFdIGFuZCBtaXNzZWQgc2VlIHRoZQptaXBp
LWRiaS5jIG1vdmUgd2l0aCBjb21taXQgMTc0MTAyZjRkZTIzMGExYmY4NWU2ZWYyZjhjODNlNTBi
M2JhMjJjOQoKVGhhbmtzIGZvciB0aGUgYXdlc29tZSB3b3JrLgpFbWlsCgpbMV0gaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MzgxMS8KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
