Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254841569D
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 01:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356EE8919A;
	Mon,  6 May 2019 23:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5898919A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 23:50:32 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id f24so6592671qtk.11
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 16:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TBaPTCCGb3Spexlm/yU/ejyBiuC7q/WyEWYVUijYGiA=;
 b=c3fAmXBjM08tgTgb331cJk+NW+1rjJgVEzgTCAH2jk3ZAtpJO0/U4U5Cg8bGBmnY+z
 SAzITovfrJIxUsqauyOIosjOu0jtQht8D6B7SVHxQs1MxkGDZ7nkM+YzBwVqqRpY5zNL
 idN/9WNKysF54crqlsRDkBvdb3LhJwLuVcCNLxA2O/+KGesjyvuwAUAxF3Xq8jR5K/As
 IOHZZix0QZU9A7tiX3x6Y9xFflxoqIgXfvenDsSZw9qUWmQLQh8cB4BNORhYXp4/zfrk
 IDMJI8g4C+aJcffpGr3NOA1VmSQsVwo/Z/Dz3zBK6VM5SXQeJfxpuyMECu2a8crpL1Mw
 QivQ==
X-Gm-Message-State: APjAAAUJdb9vXpxRA2tqccRXOt2586KrOXc3iaXznfMW8RRkc99co7XN
 18Y9cJZ/l7y7GRCOPkm19PSxfjg6L4DRmgYExYM=
X-Google-Smtp-Source: APXvYqxZU0aHXTfXbl4fMMxcjQuByvfo5jlnbfIA6JlzhTLCP+VE+EA4yiv2IZkL0YRXh211JFlYM69cEwoKwjxR+PQ=
X-Received: by 2002:a0c:c192:: with SMTP id n18mr8632941qvh.203.1557186631168; 
 Mon, 06 May 2019 16:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190502104548.GX15144@e110455-lin.cambridge.arm.com>
 <CAPM=9txjGu8NxGROVcfRuZ_PhqY8Q2VHZaA_1cuwO9K3wccG6g@mail.gmail.com>
 <20190503091109.GA15144@e110455-lin.cambridge.arm.com>
 <CAKMK7uFzZP=XK2NQGXOoEFW2-gNz0hnoJPmgvxOzPZCpeQfR3g@mail.gmail.com>
 <20190503092948.GB15144@e110455-lin.cambridge.arm.com>
 <20190503121753.GM3271@phenom.ffwll.local>
In-Reply-To: <20190503121753.GM3271@phenom.ffwll.local>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 7 May 2019 09:50:19 +1000
Message-ID: <CAPM=9tweO7C0EiLdC-fMDaozyX4ds9arsCRqxziYDZufFOEAfw@mail.gmail.com>
Subject: Re: [PULL] 2nd pull for malidp-next
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TBaPTCCGb3Spexlm/yU/ejyBiuC7q/WyEWYVUijYGiA=;
 b=CWeA19GUKkpogOGsbrUba+C/aCdLTLxBA+fIESPHalDuWIKRgxdsTMAyCwIKnoibZy
 5nMx5cTcN8530/uRSzHechFVohVGg18BKR+SinLmdCe/WeL7ORgL3idBGEoFghoF8cHZ
 T3Hhp/MQ9bEMkLlfC/u9F30PP+nl9ro8zhRUXzxgErACwqi8Qf0rCFlEp9f8NmmR0tMN
 lcaqihagIsBcjBDmkgkquDawKDuaaxjAiPNG8I4esY59RyY7SM+azuJdBhaRHwpInm1+
 slCbVgBh7jpn7vEKZkES9Ala6m3Eu5FEMiHEOs8mVyt/svrXrybh2DEFugyLSgAG5VnQ
 wI6w==
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
 James Qian Wang <james.qian.wang@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 DRI devel <dri-devel@lists.freedesktop.org>,
 MaliDP Maintainers <malidp@foss.arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAzIE1heSAyMDE5IGF0IDIyOjE3LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMTA6Mjk6NDhBTSArMDEwMCwg
TGl2aXUgRHVkYXUgd3JvdGU6Cj4gPiBPbiBGcmksIE1heSAwMywgMjAxOSBhdCAxMToxNToyM0FN
ICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiBPbiBGcmksIE1heSAzLCAyMDE5IGF0
IDExOjExIEFNIExpdml1IER1ZGF1IDxMaXZpdS5EdWRhdUBhcm0uY29tPiB3cm90ZToKPiA+ID4g
Pgo+ID4gPiA+IE9uIEZyaSwgTWF5IDAzLCAyMDE5IGF0IDA5OjU0OjM1QU0gKzEwMDAsIERhdmUg
QWlybGllIHdyb3RlOgo+ID4gPiA+ID4gT24gVGh1LCAyIE1heSAyMDE5IGF0IDIwOjQ1LCBMaXZp
dSBEdWRhdSA8TGl2aXUuRHVkYXVAYXJtLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+IEhpIERSTSBtYWludGFpbmVycywKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhpcyBpcyB0
aGUgMm5kIHB1bGwgcmVxdWVzdCBmb3IgdGhlIG1hbGlkcC1uZXh0LiBUaGUgbmV3IHBhdGNoZXMg
YWRkCj4gPiA+ID4gPiA+IGFkZGl0aW9uYWwgc3VwcG9ydCBmb3IgQXJtIE1hbGkgRDcxIHNvIHRo
YXQgaXQgY2FuIG5vdyBiZSBlbmFibGVkCj4gPiA+ID4gPiA+IGNvcnJlY3RseSBhbmQgYnJvdWdo
dCB1cCBvbiBhbnkgU29DIHRoYXQgY29udGFpbnMgdGhlIElQLiBGcm9tIG5vdyBvbgo+ID4gPiA+
ID4gPiB3ZSB3aWxsIHN0YXJ0IGZvY3VzaW5nIG9uIGFkZGluZyB3cml0ZWJhY2ssIHNjYWxpbmcg
YW5kIG90aGVyIHVzZWZ1bAo+ID4gPiA+ID4gPiBmZWF0dXJlcyB0byBicmluZyB0aGUgZHJpdmVy
IHRvIHRoZSBzYW1lIGxldmVsIG9mIG1hdHVyaXR5IGFzIG1hbGktZHAuCj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IFBsZWFzZSBwdWxsLAo+ID4gPiA+ID4gPiBMaXZpdQo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2lu
Y2UgY29tbWl0IDdjMTNlNWNjMjM5MTk1MDU0MWY0MWZjOWFiMDMzNmFhZTc3YzdmNjM6Cj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ICAgTWVyZ2UgdGFnICdkcm0taW50ZWwtbmV4dC1maXhlcy0yMDE5
LTA0LTI1JyBvZiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLWludGVsIGlu
dG8gZHJtLW5leHQgKDIwMTktMDQtMjYgMTE6MzU6NTkgKzEwMDApCj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiAgIGdpdDovL2xpbnV4LWFybS5vcmcvbGludXgtbGQuZ2l0IGZvci11cHN0
cmVhbS9tYWxpLWRwCgpTbyBJIGdldCBjb21taXRzIG5vdywgYnV0IEkgYWxzbyBnZXQ6CgpQdWxs
aW5nIGdpdDovL2xpbnV4LWFybS5vcmcvbGludXgtbGQuZ2l0IGZvci11cHN0cmVhbS9tYWxpLWRw
IC4uLgpGcm9tIGdpdDovL2xpbnV4LWFybS5vcmcvbGludXgtbGQKICogYnJhbmNoICAgICAgICAg
ICAgICAgICAgICAgIGZvci11cHN0cmVhbS9tYWxpLWRwIC0+IEZFVENIX0hFQUQKZGltOiAwOTkx
OGJiMWZmOGMgKCJkcm0va29tZWRhOiBVc2UgbWVtc2V0IHRvIGluaXRpYWxpemUgY29uZmlnX2lk
Iik6ClNIQTEgaW4gZml4ZXMgbGluZSBub3QgZm91bmQ6CmRpbTogICAgIDRjYzczNGNiNzlhOCAo
ImRybS9rb21lZGE6IEFkZCBzeXNmcyBhdHRyaWJ1dGU6IGNvcmVfaWQgYW5kIGNvbmZpZ19pZCIp
CmRpbTogZDlmY2FiNGExMzFkICgiZHJtL2tvbWVkYTogTWFyayB0aGUgbG9jYWwgZnVuY3Rpb25z
IGFzIHN0YXRpYyIpOgphdXRob3IgU2lnbmVkLW9mZi1ieSBtaXNzaW5nLgpkaW06IEVSUk9SOiBp
c3N1ZXMgaW4gY29tbWl0cyBkZXRlY3RlZCwgYWJvcnRpbmcKClBsZWFzZSBmaXggdGhlIGZpeGVz
IHRhZywgdGhvdWdoIHNpbmNlIHRoYXQgaXMgYWxsIGluIHRoZSBvbmUgcHVsbApyZXF1ZXN0IHlv
dSBzaG91bGQgcHJvYmFibHkgc3F1YXNoIHRoZSBmaXggaW50byB0aGUgb2ZmZW5kaW5nIGNvbW1p
dC4KCkRhdmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
