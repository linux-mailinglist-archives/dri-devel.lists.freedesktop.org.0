Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C42168438
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 17:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985396E439;
	Fri, 21 Feb 2020 16:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939446E439;
 Fri, 21 Feb 2020 16:55:50 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id p191so743796vkf.8;
 Fri, 21 Feb 2020 08:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6MDFVDx7pNwvsyLTcgXxedjar9rvrewbwfB9eQcdWdE=;
 b=GMCV8+04+cps1lVCfLCNy91pt//xG8asL9CK8RLV6bGjReAuuYNpNxBXtgkn/8MXJd
 J7oxZuv8umNm67/eAfXnTREtu64hqk95rLqX4n3jGcCvvuMMczWKFfzmGR5QplNsp4ui
 onHtpaPzTyAicONyAkIvhsvBa6K5Jq8XGYoBl9KRn/kZfu5jPCGBOFuaQx/TPD3Zmtcq
 xQl2ub2q8MR83QPzxqwMqqHLuLxXBeXgZ6CbAQW+R2GMjMWcSpb13Ky2PnjqIywIJOu7
 2tXduKlTtad9rpjNtD27Q8V4NfxCMJ5DETEv25NhY5SpuYM0DMF2PyU3pu4prmQGaeDT
 RDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6MDFVDx7pNwvsyLTcgXxedjar9rvrewbwfB9eQcdWdE=;
 b=KIT9CH0PXQ8kTHsf9R7u9uDV7loky1g2s9+3jI0uxkt4AmGLbxJmcb4h/YKDtyXdlH
 9J2LBFYpAiR8LpOvFfwDszwV52hzf1fkzRsW6ec3HBH+z4M55Xf+H3s6MpbF+aUG8hKF
 b905OUMJ1AQTiLydnw+ZBg/X9kaWiE916YpoS0BkzYiUsnAcni8IfpJPaGXSq+OqMpEu
 8dFIa8Np4/hj7Tu8e1n2eCRASYqvqiHFNolA/4hjg3e8HuSBNqVAH1SQQ6v9ui/Si2N3
 3ihHyffFcp0Rjbjlu7k+SgL3mEXWZx4sXOjHie74bSjMKNz7CzXl/BLT+RKo11iaQzGl
 sb5g==
X-Gm-Message-State: APjAAAWPc5CoyS8wP8SuQUdfvmb7OQNeTtVoeLIXshhwXj2HiWAipY5F
 DoZszZBXlx0BPeIDjoyxl84LgpA9DTek/zPoKj6nug==
X-Google-Smtp-Source: APXvYqxTPg495JRSVdJwcjMNQAqLxQ/DbjomfazeG1r2uk11DV9llSrqBmAlYe+f8xCiez5Hbyt8rJwn5w5gEpDiSkE=
X-Received: by 2002:a1f:264b:: with SMTP id m72mr17492542vkm.51.1582304149598; 
 Fri, 21 Feb 2020 08:55:49 -0800 (PST)
MIME-Version: 1.0
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-2-ville.syrjala@linux.intel.com>
 <CACvgo53w0+anXrf0fSGkdAx8gctMFzLh311n74tBCQ7qt+_--A@mail.gmail.com>
 <20200221160425.GR13686@intel.com>
In-Reply-To: <20200221160425.GR13686@intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 21 Feb 2020 16:55:36 +0000
Message-ID: <CACvgo50uuZQunjgZUCZL=NH1X45Gtw5HFdzF9AEQGmAY_MFK3g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 01/12] drm: Nuke mode->hsync
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMSBGZWIgMjAyMCBhdCAxNjowNCwgVmlsbGUgU3lyasOkbMOkCjx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEZlYiAyMCwgMjAyMCBhdCAx
MDo1NToxOEFNICswMDAwLCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4gPiBPbiBXZWQsIDE5IEZlYiAy
MDIwIGF0IDIwOjM1LCBWaWxsZSBTeXJqYWxhCj4gPiA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gPgo+ID4gPiBMZXQncyBqdXN0IGNhbGN1bGF0ZSB0
aGUgaHN5bmMgcmF0ZSBvbiBkZW1hbmQuIE5vIHBvaW50IGluIHdhc3RpbmcKPiA+ID4gc3BhY2Ug
c3RvcmluZyBpdCBhbmQgcmlza2luZyB0aGUgY2FjaGVkIHZhbHVlIGdldHRpbmcgb3V0IG9mIHN5
bmMKPiA+ID4gd2l0aCByZWFsaXR5Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyAgICAgICAgICAgICAgICAgIHwgMTQgKystLS0t
LS0tLS0tLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxh
eS5jIHwgIDEgLQo+ID4gPiAgaW5jbHVkZS9kcm0vZHJtX21vZGVzLmggICAgICAgICAgICAgICAg
ICAgICAgfCAxMCAtLS0tLS0tLS0tCj4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMjMgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKPiA+ID4gaW5k
ZXggZDRkNjQ1MThlMTFiLi5mZTdlODcyYTYyMzkgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fbW9kZXMuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVz
LmMKPiA+ID4gQEAgLTc1MiwyNCArNzUyLDE0IEBAIEVYUE9SVF9TWU1CT0woZHJtX21vZGVfc2V0
X25hbWUpOwo+ID4gPiAgICogQG1vZGU6IG1vZGUKPiA+ID4gICAqCj4gPiA+ICAgKiBSZXR1cm5z
Ogo+ID4gPiAtICogQG1vZGVzJ3MgaHN5bmMgcmF0ZSBpbiBrSHosIHJvdW5kZWQgdG8gdGhlIG5l
YXJlc3QgaW50ZWdlci4gQ2FsY3VsYXRlcyB0aGUKPiA+ID4gLSAqIHZhbHVlIGZpcnN0IGlmIGl0
IGlzIG5vdCB5ZXQgc2V0Lgo+ID4gPiArICogQG1vZGVzJ3MgaHN5bmMgcmF0ZSBpbiBrSHosIHJv
dW5kZWQgdG8gdGhlIG5lYXJlc3QgaW50ZWdlcgo+ID4gPiAgICovCj4gPiA+ICBpbnQgZHJtX21v
ZGVfaHN5bmMoY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCj4gPiA+ICB7Cj4g
PiA+IC0gICAgICAgdW5zaWduZWQgaW50IGNhbGNfdmFsOwo+ID4gPiAtCj4gPiA+IC0gICAgICAg
aWYgKG1vZGUtPmhzeW5jKQo+ID4gPiAtICAgICAgICAgICAgICAgcmV0dXJuIG1vZGUtPmhzeW5j
Owo+ID4gPiAtCj4gPiA+ICAgICAgICAgaWYgKG1vZGUtPmh0b3RhbCA8PSAwKQo+ID4gPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+Cj4gPiA+IC0gICAgICAgY2FsY192YWwgPSAobW9k
ZS0+Y2xvY2sgKiAxMDAwKSAvIG1vZGUtPmh0b3RhbDsgLyogaHN5bmMgaW4gSHogKi8KPiA+ID4g
LSAgICAgICBjYWxjX3ZhbCArPSA1MDA7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAv
KiByb3VuZCB0byAxMDAwSHogKi8KPiA+ID4gLSAgICAgICBjYWxjX3ZhbCAvPSAxMDAwOyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB0cnVuY2F0ZSB0byBrSHogKi8KPiA+ID4gLQo+
ID4gPiAtICAgICAgIHJldHVybiBjYWxjX3ZhbDsKPiA+ID4gKyAgICAgICByZXR1cm4gRElWX1JP
VU5EX0NMT1NFU1QobW9kZS0+Y2xvY2ssIG1vZGUtPmh0b3RhbCk7Cj4gPiA+ICB9Cj4gPiA+ICBF
WFBPUlRfU1lNQk9MKGRybV9tb2RlX2hzeW5jKTsKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKPiA+ID4gaW5kZXggZWU3ZDU0Y2NkM2U2
Li5mYWI5MTQ4MTk0ODkgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheS5jCj4gPiA+IEBAIC04ODY3LDcgKzg4NjcsNiBAQCB2b2lkIGlu
dGVsX21vZGVfZnJvbV9waXBlX2NvbmZpZyhzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwK
PiA+ID4KPiA+ID4gICAgICAgICBtb2RlLT5jbG9jayA9IHBpcGVfY29uZmlnLT5ody5hZGp1c3Rl
ZF9tb2RlLmNydGNfY2xvY2s7Cj4gPiA+Cj4gPiA+IC0gICAgICAgbW9kZS0+aHN5bmMgPSBkcm1f
bW9kZV9oc3luYyhtb2RlKTsKPiA+Cj4gPiBXaXRoIHRoaXMgZ29uZSwgd2UgY291bGQgbWFrZSBk
cm1fbW9kZV9oc3luYygpIGludGVybmFsIGFuZCBtb3ZlIGl0IHRvCj4gPiBkcm1fZm9vX2ludGVy
bmFsLmguCj4gPiBNYWtpbmcgaXQgb2J2aW91cyB0aGF0IGRyaXZlcnMsIHNob3VsZCBiZSBjb3B5
L3Bhc3RpbmcgaXQuCj4KPiBIbW0uIExvb2tzIGxpa2UgZHJtX2VkaWQuYyBpcyB0aGUgb25seSB1
c2VyIGxlZnQgYWN0dWFsbHkuIFNob3VsZAo+IHByb2JhYmx5IGp1c3QgbW92ZSBpdCB0aGVyZSBh
bmQgbWFrZSBpdCBzdGF0aWMuCj4KVGhhdCBhbHNvIHdvcmtzLiBGZWVsIGZyZWUgdG8gbWFrZSB0
aGF0IGEgZm9sbG93LXVwIHBhdGNoIGlmIHlvdSBwcmVmZXIuCgotRW1pbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
