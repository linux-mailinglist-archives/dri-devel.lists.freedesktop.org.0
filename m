Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9546810E70D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 09:49:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5089B89CB5;
	Mon,  2 Dec 2019 08:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8617689CB5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 08:49:39 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t14so4622288wmi.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 00:49:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=OTj1RBCZb2YMCeCoS+sNA0hsSD1PCx/KWXCN5P/k7WI=;
 b=AIEWhz4mLodnlHmODoIsD4OIIBnHunekvnX3HiB1SWWL5o+Y10rEKNFZPegOJJQdJd
 tSg28tuJ7Z3zQF01PTE0VQB5WPGeFwkGlky9hAALpxrypGNsyqUnZvLra89+YLMV76PP
 b/WCMAWUhZ0S6K0Rgb3RVxy8/JqqsyFhypw2KBMePidC+YuFYjwGKAKTILsfXLp5li/+
 iAlbWbBwkl/EWNDBkrkwVu4gHZviTqTg+KwwtIAosN1plPfWvqU1k6RvqQdZN8KoyA5f
 SKHzMDddsHGpkqJQA0h92Mu0+hvEBYI/YfPT9h46lPiE6t09jNDJlW+hKq1SRc9mN30C
 BRwg==
X-Gm-Message-State: APjAAAVcmwfgJQR3dIVNEj4B+Fsn4dHlnEHLWBs4wJJ6St/e/ksV4cF1
 N2gkDTN8FgAp9gMsT2JbjqVc8mqNAvw=
X-Google-Smtp-Source: APXvYqynfMmdc+cNc63cE3ghvW6E0uyOdcT96eJ8oRbrseMVckK734QiBG7ddSOHI9zfdzlNiX+ppA==
X-Received: by 2002:a1c:4e03:: with SMTP id g3mr12747171wmh.22.1575276578020; 
 Mon, 02 Dec 2019 00:49:38 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id a64sm25598619wmc.18.2019.12.02.00.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 00:49:37 -0800 (PST)
Date: Mon, 2 Dec 2019 09:49:35 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [01/30] drm: Introduce drm_bridge_init()
Message-ID: <20191202084935.GW624164@phenom.ffwll.local>
Mail-Followup-To: "james qian wang (Arm Technology China)"
 <james.qian.wang@arm.com>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, nd <nd@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20191126131541.47393-2-mihail.atanassov@arm.com>
 <20191202055459.GA25729@jamwan02-TSP300>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202055459.GA25729@jamwan02-TSP300>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OTj1RBCZb2YMCeCoS+sNA0hsSD1PCx/KWXCN5P/k7WI=;
 b=lpXqgi6RxG7r8QtKa9tbrp1YCJngkhiNJXJ0eZoRoKbbZGYJNMc2FmmkfOnrrr+aIS
 K1uhIrJieHIHhZBmIuypHu8pQnp34Mat7kQLu7jS8EH2TNQt0FpWNQ7d4/1QPg8FQecZ
 n0Jj0Bz2KoQ0dcXy3jkwRHHXpzCWTivuBmcYs=
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
Cc: David Airlie <airlied@linux.ie>, nd <nd@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMDIsIDIwMTkgYXQgMDU6NTU6MDZBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gT24gVHVlLCBOb3YgMjYsIDIwMTkgYXQg
MDE6MTU6NTlQTSArMDAwMCwgTWloYWlsIEF0YW5hc3NvdiB3cm90ZToKPiA+IEEgc2ltcGxlIGNv
bnZlbmllbmNlIGZ1bmN0aW9uIHRvIGluaXRpYWxpemUgdGhlIHN0cnVjdCBkcm1fYnJpZGdlLgo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292
QGFybS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jIHwgMjkg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBpbmNsdWRlL2RybS9kcm1fYnJpZGdl
LmggICAgIHwgIDQgKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMKPiA+IGluZGV4IGNiYTUzN2M5OWU0My4uY2JlNjgwYWE2
ZWFjIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYwo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYwo+ID4gQEAgLTg5LDYgKzg5LDM1IEBAIHZv
aWQgZHJtX2JyaWRnZV9yZW1vdmUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiA+ICB9Cj4g
PiAgRVhQT1JUX1NZTUJPTChkcm1fYnJpZGdlX3JlbW92ZSk7Cj4gPiAgCj4gPiArLyoqCj4gPiAr
ICogZHJtX2JyaWRnZV9pbml0IC0gaW5pdGlhbGlzZSBhIGRybV9icmlkZ2Ugc3RydWN0dXJlCj4g
PiArICoKPiA+ICsgKiBAYnJpZGdlOiBicmlkZ2UgY29udHJvbCBzdHJ1Y3R1cmUKPiA+ICsgKiBA
ZnVuY3M6IGNvbnRyb2wgZnVuY3Rpb25zCj4gPiArICogQGRldjogZGV2aWNlCj4gPiArICogQHRp
bWluZ3M6IHRpbWluZyBzcGVjaWZpY2F0aW9uIGZvciB0aGUgYnJpZGdlOyBvcHRpb25hbCAobWF5
IGJlIE5VTEwpCj4gPiArICogQGRyaXZlcl9wcml2YXRlOiBwb2ludGVyIHRvIHRoZSBicmlkZ2Ug
ZHJpdmVyIGludGVybmFsIGNvbnRleHQgKG1heSBiZSBOVUxMKQo+ID4gKyAqLwo+ID4gK3ZvaWQg
ZHJtX2JyaWRnZV9pbml0KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsIHN0cnVjdCBkZXZpY2Ug
KmRldiwKPiA+ICsJCSAgICAgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgKmZ1bmNzLAo+
ID4gKwkJICAgICBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV90aW1pbmdzICp0aW1pbmdzLAo+ID4g
KwkJICAgICB2b2lkICpkcml2ZXJfcHJpdmF0ZSkKPiA+ICt7Cj4gPiArCVdBUk5fT04oIWZ1bmNz
KTsKPiA+ICsKPiA+ICsJYnJpZGdlLT5kZXYgPSBOVUxMOwo+ID4gKwlicmlkZ2UtPmVuY29kZXIg
PSBOVUxMOwo+ID4gKwlicmlkZ2UtPm5leHQgPSBOVUxMOwo+ID4gKwo+ID4gKyNpZmRlZiBDT05G
SUdfT0YKPiA+ICsJYnJpZGdlLT5vZl9ub2RlID0gZGV2LT5vZl9ub2RlOwo+ID4gKyNlbmRpZgo+
ID4gKwlicmlkZ2UtPnRpbWluZ3MgPSB0aW1pbmdzOwo+ID4gKwlicmlkZ2UtPmZ1bmNzID0gZnVu
Y3M7Cj4gPiArCWJyaWRnZS0+ZHJpdmVyX3ByaXZhdGUgPSBkcml2ZXJfcHJpdmF0ZTsKPiAKPiBD
YW4gd2UgZGlyZWN0bHkgcHV0IGRybV9icmlkZ2VfYWRkKCkgaGVyZS4gdGhlbgo+IC0gVXNlciBh
bHdheXMgbmVlZCB0byBjYWxsIGJyaWRnZV9pbml0IGFuZCBhZGQgdG9nZXRoZXIuCj4gLSBDb25z
aXN0ZW50IHdpdGggb3RoZXJzIGxpa2UgZHJtX3BsYW5lL2NydGNfaW5pdCB3aGljaCBkaXJlY3Rs
eSBoYXMKPiAgIGRybV9tb2RlX29iamVjdF9hZGQoKSBpbiBpdC4KClVoIG5vLCB0aGUgdHJvdWJs
ZSBoZXJlIGlzIHRoYXQgZHJtX2JyaWRnZV9hZGQgc2hvdWxkIGFjdHVhbGx5IGJlIGNhbGxlZApf
cmVnaXN0ZXIsIGJlY2F1c2UgaXQgcHVibGlzaGVzIHRoZSBicmlkZ2UgdG8gdGhlIHdvcmxkLiBJ
IHRoaW5rIHdlIGV2ZW4KaGF2ZSBhIHRvZG8gaXRlbSB0byByZW5hbWUgX2FkZCB0byBfcmVnaXN0
ZXIgLi4uIE9uY2UgdGhhdCdzIGRvbmUgdGhlCmJyaWRnZSBjYW4ndCBiZSBjaGFuZ2VkIGFueW1v
cmUsIGFsbCBpbml0IGNvZGUgbXVzdCBoYXZlIGNvbXBsZXRlZC4gU28Kb2Z0ZW4geW91IG5lZWQg
YSBiaXQgb2YgY29kZSBiZXR3ZWVuIF9pbml0KCkgYW5kIF9yZWdpc3RlcigpLgoKZHJtX21vZGVf
b2JqZWN0X2FkZCBpcyBkaWZmZXJlbnQgc2luY2UgZm9yIG1vZGUgb2JqZWN0cyBpdCBkb2Vzbid0
IHB1Ymxpc2gKaXQgdG8gdGhlIHdvcmxkLCB0aGF0J3MgZG9uZSB3aXRoIGRybV9kZXZfcmVnaXN0
ZXIgYW5kCmRybV9jb25uZWN0b3JfcmVnaXN0ZXIuIGRybV9tb2RlX29iamVjdF9hZGQganVzdCBk
b2VzIGEgYml0IG9mIGludGVybmFsCmhvdXNlIGtlZXBpbmcuCi1EYW5pZWwKCj4gCj4gSmFtZXMu
Cj4gPiArfQo+ID4gK0VYUE9SVF9TWU1CT0woZHJtX2JyaWRnZV9pbml0KTsKPiA+ICsKPiA+ICAv
KioKPiA+ICAgKiBkcm1fYnJpZGdlX2F0dGFjaCAtIGF0dGFjaCB0aGUgYnJpZGdlIHRvIGFuIGVu
Y29kZXIncyBjaGFpbgo+ID4gICAqCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Jy
aWRnZS5oIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCj4gPiBpbmRleCBjMGEyMjg2YTgxZTku
LmQ2ZDlkNTMwMTU1MSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAo+
ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCj4gPiBAQCAtNDAyLDYgKzQwMiwxMCBA
QCBzdHJ1Y3QgZHJtX2JyaWRnZSB7Cj4gPiAgCj4gPiAgdm9pZCBkcm1fYnJpZGdlX2FkZChzdHJ1
Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKTsKPiA+ICB2b2lkIGRybV9icmlkZ2VfcmVtb3ZlKHN0cnVj
dCBkcm1fYnJpZGdlICpicmlkZ2UpOwo+ID4gK3ZvaWQgZHJtX2JyaWRnZV9pbml0KHN0cnVjdCBk
cm1fYnJpZGdlICpicmlkZ2UsIHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ICsJCSAgICAgY29uc3Qg
c3RydWN0IGRybV9icmlkZ2VfZnVuY3MgKmZ1bmNzLAo+ID4gKwkJICAgICBjb25zdCBzdHJ1Y3Qg
ZHJtX2JyaWRnZV90aW1pbmdzICp0aW1pbmdzLAo+ID4gKwkJICAgICB2b2lkICpkcml2ZXJfcHJp
dmF0ZSk7Cj4gPiAgc3RydWN0IGRybV9icmlkZ2UgKm9mX2RybV9maW5kX2JyaWRnZShzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wKTsKPiA+ICBpbnQgZHJtX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyLCBzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+ID4gIAkJICAgICAg
c3RydWN0IGRybV9icmlkZ2UgKnByZXZpb3VzKTsKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
