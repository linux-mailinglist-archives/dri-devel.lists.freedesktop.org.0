Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A36652A2854
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 11:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102236E4A7;
	Mon,  2 Nov 2020 10:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81566E4A7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 10:32:45 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id j14so1938087ots.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 02:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gZ5JsXASv6QPxAr8TfphUzPVrtHB+0HtH4Ow7k/kZ38=;
 b=hOMoz/34LdfW9d81lIDOZWfZOlNh2cwiB44Dw7vGYUtxnUswuE0AYbCZ/YEmbteqDh
 PcqYV3ilxSv5X8CrefOEFI6AdyoXWYK3Hrw37lD10i1YWQWdHSph515T0wZHqOJXSVQm
 TlINLGO5hsNIU1BLknBIAqu4becCvfhuBOahM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gZ5JsXASv6QPxAr8TfphUzPVrtHB+0HtH4Ow7k/kZ38=;
 b=KlwtQYKd1vxFoubzwsFHai2zpF41yqkpHtNUgyPkcPvx+KrY+zHjQIvZ+h4GEQYzfW
 qFf2u2mVHg4BOEHL1h65M+N72AoF0LpFIXufYFX6busar8mu4RDXrz7PXjy9FGOjs9lp
 tA6N4vYbJT1uisstJOly4Dkj6HuGpmeRAbf1c3M1O1qFscousa9bCQ5Am3GSisF/pP8U
 0EhpQKO0c5ZqFO9K965rHQNbdO52Hwi/rxttL6hHoQzy96e3EiISVBDW9tP1beCf4JoV
 njzfiYPdTastccOpMfKCZRxC0LKnJYNK6Hb2Jnl3vI5ILee99zDp0tOoJMjSOQhc/Yb+
 YmGQ==
X-Gm-Message-State: AOAM533rHdls1ps01lMgbdnmYgtnhKU/FdHzfwikoyZrnKYR/tgrCsla
 +cPRrTf01C7FSHl8h5Q/g4anEyPdQhiqjqvZ+iq/Cg==
X-Google-Smtp-Source: ABdhPJziJwKaNXyzgONoHh0y1NIlvc9/bvTClmXMrjSWnfMGeXKfxmZyIOIB/B6TT8VDrny76P8hczX/KH3fPZNVrcA=
X-Received: by 2002:a05:6830:1647:: with SMTP id
 h7mr12194030otr.281.1604313165295; 
 Mon, 02 Nov 2020 02:32:45 -0800 (PST)
MIME-Version: 1.0
References: <20201030111301.13458-1-christian.koenig@amd.com>
In-Reply-To: <20201030111301.13458-1-christian.koenig@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 2 Nov 2020 11:32:34 +0100
Message-ID: <CAKMK7uG5_duB_gA2_wce5g_tRo7c+4nbwYTen=NMRsby4ZCXMA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveu: fix swiotlb include
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMzAsIDIwMjAgYXQgMTI6MTMgUE0gQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5p
Zy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhlIGNoZWNrIGZvciBzd2lv
dGxiIGhhcyBtb3ZlZCB0byBub3V2ZXVfdHRtLmMsIGJ1dCB3ZSBmb3Jnb3QgdG8gbW92ZQo+IHRo
ZSBpbmNsdWRlIGFzIHdlbGwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpTbyB0aGlzIG5vdyBicm9rZSBkcm0tbWlzYy1uZXh0
IGNvbXBpbGF0aW9uIG9uIGFybSwgd2hpY2ggaXNuJ3QgZ3JlYXQuClBsZWFzZSBtYWtlIHN1cmUg
eW91IGNvbXBpbGUgdGVzdCBzdHVmZiBiZWZvcmUgcHVzaGluZy4KClNpbmNlIHRoZSBwcm9wZXIg
Zml4IGlzIG1heWJlIHN0dWNrIGluIHRoZSB1c3VhbCAiZHJtIGFidXNlcyBzd2lvdGxiCmludGVy
bmFscyIgYmlrZXNoZWQsIG1heWJlIGJlc3QgaWYgd2UgcHVzaCBhIGZpeCB0byBpbmNsdWRpbmcg
bGltaXRzLmgKaW4gbm91dmVhdSBhbmQgY2FsbCBpdCBkb25lPyBBbHNvIGFkZGluZyBNYXhpbWUs
IHdobydzIHRyeWluZyB0byBnZXQKdGhlIGJhY2ttZXJnZSB0aHJvdWdoIHJpZ2h0IG5vdy4KLURh
bmllbAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jICB8IDEg
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jIHwgMyArKysKPiAgMiBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBpbmRleCA3NDZjMDZlZDE5NWIuLjgxMzMzNzdkODY1
ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBAQCAtMjgsNyArMjgs
NiBAQAo+ICAgKi8KPgo+ICAjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KPiAtI2luY2x1
ZGUgPGxpbnV4L3N3aW90bGIuaD4KPgo+ICAjaW5jbHVkZSAibm91dmVhdV9kcnYuaCIKPiAgI2lu
Y2x1ZGUgIm5vdXZlYXVfY2hhbi5oIgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0u
Ywo+IGluZGV4IGQ2OTZkODgyYzllYi4uMmJmMzYyMjlkZDU3IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdHRtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X3R0bS5jCj4gQEAgLTIyLDYgKzIyLDkgQEAKPiAgICogT1RIRVJXSVNF
LCBBUklTSU5HIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJF
IE9SIFRIRQo+ICAgKiBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgo+ICAg
Ki8KPiArCj4gKyNpbmNsdWRlIDxsaW51eC9zd2lvdGxiLmg+Cj4gKwo+ICAjaW5jbHVkZSAibm91
dmVhdV9kcnYuaCIKPiAgI2luY2x1ZGUgIm5vdXZlYXVfZ2VtLmgiCj4gICNpbmNsdWRlICJub3V2
ZWF1X21lbS5oIgo+IC0tCj4gMi4xNy4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
