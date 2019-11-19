Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2321102E35
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 22:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85576E9A8;
	Tue, 19 Nov 2019 21:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF096E9B9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 21:25:47 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z26so4810093wmi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 13:25:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fstwmZmFM8xiDIrCKf1GaoMnKbL8rymwGVXgktoO+Io=;
 b=MKZ10HqD/GHUdSh7d5fyMc4vnp7enBU5YwdZsD8Y2RFOel5y7/COH8lfBMM7WQP9Re
 vg3VRdwzKkn8tFOEDqyXJjqIQZtb1InsBf/eJddiqKEuJF8Q5GgdMfLXkGB1cs6KpL/J
 OosDhII7hwzmlgsRGkk1SbyonEJd9P/fiSie3HFDqmg/zu2l8axpxPhYBglWcwVeftov
 TmYdeK+gdNgorVfLcArcRs+84sKAQyIk/Vb5tUmYJhWdUS55Ir7psbG5EwrxMml3HlI5
 JEfqP37ZYXcvP9PHhCAabmgFZKau59/XXWB9hOalpxojr5AL2RHg3zKsl10ptYIOauPZ
 t8ww==
X-Gm-Message-State: APjAAAWQ75nTikBptdpUmFN7grrsc8jhzLPnvL5/Eh673cO9bUGDQWkG
 ukmxhZwzweLiWrPAMBp9ZhObaQ==
X-Google-Smtp-Source: APXvYqx2rsw03IN+NST6Xf+WhkyWiSEqsp01ctZry5jPClQIDtayQ6OR8K3LvFRgM6ydRyGyTl+KCw==
X-Received: by 2002:a05:600c:2105:: with SMTP id
 u5mr8247386wml.47.1574198745757; 
 Tue, 19 Nov 2019 13:25:45 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id a15sm28413485wrw.10.2019.11.19.13.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 13:25:45 -0800 (PST)
Date: Tue, 19 Nov 2019 22:25:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH 6/8] drm/xen: Simplify fb_create
Message-ID: <20191119212543.GG30416@phenom.ffwll.local>
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
 <20191115092120.4445-7-daniel.vetter@ffwll.ch>
 <4042b233-c219-5e72-adfd-8108b13e9a71@epam.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4042b233-c219-5e72-adfd-8108b13e9a71@epam.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fstwmZmFM8xiDIrCKf1GaoMnKbL8rymwGVXgktoO+Io=;
 b=laFBi78X/KIPcFNZYc4ticGpLcIB9UMLsw1D6ngjRf5JPy4WDtD6RSAlnZKPLheQgN
 8S4sDKBzBPXjrQ95n3oQ2VMLE/j2Bnry0mMs7c8cR63x1CagTTENggMP4g9qZB03amy9
 H/6G8jde9S9jkbmoRiPB8FgAf9GgGO8eFhhmI=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTA6MzM6MjRBTSArMDAwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gT24gMTEvMTUvMTkgMTE6MjEgQU0sIERhbmllbCBWZXR0ZXIgd3Jv
dGU6Cj4gPiBUaGUgY3VycmVudCBjb2RlIGlzIGEgcHJldHR5IGdvb2Qgd3RmIG1vbWVudCwgc2lu
Y2Ugd2UgZHJvcCB0aGUKPiA+IHJlZmVyZW5jZSBiZWZvcmUgd2UgdXNlIGl0LiBJdCdzIG5vdCBh
IGJpZyBkZWFsLCBiZWNhdXNlIGEpIHdlIG9ubHkKPiA+IHVzZSB0aGUgcG9pbnRlciwgc28gZG9l
c24ndCBibG93IHVwIGFuZCB0aGUgcmVhbCByZWFzb24gYikgZmItPm9ialswXQo+ID4gYWxyZWFk
eSBob2xkcyBhIGZ1bGwgcmVmZXJlbmNlIGZvciB1cy4KPiA+Cj4gPiBNaWdodCBhcyB3ZWxsIHRh
a2UgdGhlIHJlYWwgcG9pbnRlciBpbnMndCBvZiBjb21wbGljYXRlZCBnYW1lcyB0aGF0Cj4gPiBi
YWZmbGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBpbnRlbC5jb20+Cj4gPiBDYzogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9h
bmRydXNoY2hlbmtvQGVwYW0uY29tPgo+ID4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwo+IFJldmlld2VkLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2Fu
ZHJ1c2hjaGVua29AZXBhbS5jb20+CgpUaGFua3MgZm9yIHRha2luZyBhIGxvb2ssIHB1c2hlZCB0
byBkcm0tbWlzYy1uZXh0LgotRGFuaWVsCgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94
ZW4veGVuX2RybV9mcm9udF9rbXMuYyB8IDkgKy0tLS0tLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgOCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3hl
bi94ZW5fZHJtX2Zyb250X2ttcy5jCj4gPiBpbmRleCBmZjUwNmJjOTk0MTQuLjRmMzRjNTIwODE4
MCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMu
Ywo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jCj4gPiBA
QCAtNjMsMTQgKzYzLDcgQEAgZmJfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVj
dCBkcm1fZmlsZSAqZmlscCwKPiA+ICAgCWlmIChJU19FUlJfT1JfTlVMTChmYikpCj4gPiAgIAkJ
cmV0dXJuIGZiOwo+ID4gICAKPiA+IC0JZ2VtX29iaiA9IGRybV9nZW1fb2JqZWN0X2xvb2t1cChm
aWxwLCBtb2RlX2NtZC0+aGFuZGxlc1swXSk7Cj4gPiAtCWlmICghZ2VtX29iaikgewo+ID4gLQkJ
RFJNX0VSUk9SKCJGYWlsZWQgdG8gbG9va3VwIEdFTSBvYmplY3RcbiIpOwo+ID4gLQkJcmV0ID0g
LUVOT0VOVDsKPiA+IC0JCWdvdG8gZmFpbDsKPiA+IC0JfQo+ID4gLQo+ID4gLQlkcm1fZ2VtX29i
amVjdF9wdXRfdW5sb2NrZWQoZ2VtX29iaik7Cj4gPiArCWdlbV9vYmogPSBmYi0+b2JqWzBdOwo+
ID4gICAKPiA+ICAgCXJldCA9IHhlbl9kcm1fZnJvbnRfZmJfYXR0YWNoKGRybV9pbmZvLT5mcm9u
dF9pbmZvLAo+ID4gICAJCQkJICAgICAgeGVuX2RybV9mcm9udF9kYnVmX3RvX2Nvb2tpZShnZW1f
b2JqKSwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
