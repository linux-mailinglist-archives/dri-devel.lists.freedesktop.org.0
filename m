Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B879E12A47
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 11:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8960A8920D;
	Fri,  3 May 2019 09:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61DA8920D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 09:15:35 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id y6so4635447ior.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2019 02:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ken3pj4lxsisZ0jg6Yd8yeGhLJFM144d1+NnQhbvwLY=;
 b=tDt6XiaEPg9lQnvVkib4aJeEPdZLljPh01n1bMXj685pNAt8vPxU0HA9FkLtj7H1eV
 U/y7JnjuY0O9IqEgETJbJQKOSrXFysICsbpmfhtoEnJ/a7BRn7v68zq/qA5Nmyn8B07q
 LhUEw/cwwwZaZuBzw6IrvHUwJkTPco6oGBNZnEemrQXDxUlMnYCLE62pjz9HbyK7edh0
 3RaObpaGSZ8RnBZ0NRIqmgmrW8jQTfqx3pLzhkxFeTth/YzzDdUD69UJ22vXvIJAUpUZ
 tdGBWBSl5i+nrnpmoyAX5dh7EEEmPZEhB8x/3SLgIFbHqM23XIBE9mgyU6S5DuN5/FHX
 m/rA==
X-Gm-Message-State: APjAAAUar+/M/xtXN+goUKLgKBGRj/Oa95+kUvfdcy5nua/E7+qKAks/
 3+G7OoLcoAXPq/wLCyLjVI3IqfHoNd7Gf0zjYoJTDw==
X-Google-Smtp-Source: APXvYqyJylk/NGHrSbevKIgF4xt+cGjpQt/FvPvH2j4twJEH9F8L2JJLB0rzR4V4yeQ6SJaZ3rRTRgvNb0KoupvY8Lw=
X-Received: by 2002:a6b:b2c8:: with SMTP id b191mr2284308iof.278.1556874934948; 
 Fri, 03 May 2019 02:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190502104548.GX15144@e110455-lin.cambridge.arm.com>
 <CAPM=9txjGu8NxGROVcfRuZ_PhqY8Q2VHZaA_1cuwO9K3wccG6g@mail.gmail.com>
 <20190503091109.GA15144@e110455-lin.cambridge.arm.com>
In-Reply-To: <20190503091109.GA15144@e110455-lin.cambridge.arm.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 3 May 2019 11:15:23 +0200
Message-ID: <CAKMK7uFzZP=XK2NQGXOoEFW2-gNz0hnoJPmgvxOzPZCpeQfR3g@mail.gmail.com>
Subject: Re: [PULL] 2nd pull for malidp-next
To: Liviu Dudau <Liviu.Dudau@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Ken3pj4lxsisZ0jg6Yd8yeGhLJFM144d1+NnQhbvwLY=;
 b=R+Wxoc9WzXqsC8oEmXrOeB1yxG5XHCSbDyIylYsNlzhxrTJV3zqdrs8C08ZhFDar5R
 4Z0gHOzkVKJJP84QOH6R5OkXFio9omDV55kxdF5fsJELkKsNFVxd5OSovzBgGSxOlNU1
 9e+4Nea+yOUS2ZGYrckWb1zlDMj/OJQG50ppU=
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
Cc: James Qian Wang <james.qian.wang@arm.com>,
 DRI devel <dri-devel@lists.freedesktop.org>,
 MaliDP Maintainers <malidp@foss.arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMywgMjAxOSBhdCAxMToxMSBBTSBMaXZpdSBEdWRhdSA8TGl2aXUuRHVkYXVA
YXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE1heSAwMywgMjAxOSBhdCAwOTo1NDozNUFNICsx
MDAwLCBEYXZlIEFpcmxpZSB3cm90ZToKPiA+IE9uIFRodSwgMiBNYXkgMjAxOSBhdCAyMDo0NSwg
TGl2aXUgRHVkYXUgPExpdml1LkR1ZGF1QGFybS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBE
Uk0gbWFpbnRhaW5lcnMsCj4gPiA+Cj4gPiA+IFRoaXMgaXMgdGhlIDJuZCBwdWxsIHJlcXVlc3Qg
Zm9yIHRoZSBtYWxpZHAtbmV4dC4gVGhlIG5ldyBwYXRjaGVzIGFkZAo+ID4gPiBhZGRpdGlvbmFs
IHN1cHBvcnQgZm9yIEFybSBNYWxpIEQ3MSBzbyB0aGF0IGl0IGNhbiBub3cgYmUgZW5hYmxlZAo+
ID4gPiBjb3JyZWN0bHkgYW5kIGJyb3VnaHQgdXAgb24gYW55IFNvQyB0aGF0IGNvbnRhaW5zIHRo
ZSBJUC4gRnJvbSBub3cgb24KPiA+ID4gd2Ugd2lsbCBzdGFydCBmb2N1c2luZyBvbiBhZGRpbmcg
d3JpdGViYWNrLCBzY2FsaW5nIGFuZCBvdGhlciB1c2VmdWwKPiA+ID4gZmVhdHVyZXMgdG8gYnJp
bmcgdGhlIGRyaXZlciB0byB0aGUgc2FtZSBsZXZlbCBvZiBtYXR1cml0eSBhcyBtYWxpLWRwLgo+
ID4gPgo+ID4gPiBQbGVhc2UgcHVsbCwKPiA+ID4gTGl2aXUKPiA+ID4KPiA+ID4KPiA+ID4KPiA+
ID4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA3YzEzZTVjYzIzOTE5NTA1NDFm
NDFmYzlhYjAzMzZhYWU3N2M3ZjYzOgo+ID4gPgo+ID4gPiAgIE1lcmdlIHRhZyAnZHJtLWludGVs
LW5leHQtZml4ZXMtMjAxOS0wNC0yNScgb2YgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcv
ZHJtL2RybS1pbnRlbCBpbnRvIGRybS1uZXh0ICgyMDE5LTA0LTI2IDExOjM1OjU5ICsxMDAwKQo+
ID4gPgo+ID4gPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiA+ID4K
PiA+ID4gICBnaXQ6Ly9saW51eC1hcm0ub3JnL2xpbnV4LWxkLmdpdCBmb3ItdXBzdHJlYW0vbWFs
aS1kcAo+ID4KPiA+IFRoaXMgYnJhbmNoIGNvbnRhaW5zOgo+ID4gY29tbWl0IDA0YzhhMWVjMzk1
YjIyZjA2MGI4MzZiNzJkMmQ0NDgwZTdlODU5ZjgKPiA+IEF1dGhvcjogTGl2aXUgRHVkYXUgPExp
dml1LkR1ZGF1QGFybS5jb20+Cj4gPiBEYXRlOiAgIFR1ZSBNYXIgMjYgMTA6MjM6NDAgMjAxOSAr
MDAwMAo+ID4KPiA+ICAgICBNQUlOVEFJTkVSUzogRml4IHBhdHRlcm4gZm9yIERvY3VtZW50YXRp
b24gcGF0aCBmb3IgQXJtIE1hbGkgS29tZWRhCj4gPgo+ID4gYXMgaXQncyBoZWFkLCBkaWQgeW91
IGZvcmdldCB0byBwdXNoPwo+Cj4gRnJvbSBteSBob21lIGNvbXB1dGVyIEkgc2VlIGEgZGlmZmVy
ZW50IGNvbW1pdCBhcyB0aGUgaGVhZDoKPgo+Cj4gY29tbWl0IDk2Zjk1NzQ2NjY4NjFlN2M1OTAy
ZDQxMjQ3NGQzZmYyODEyM2M3ZDEgKGxpdml1LWFybS9mb3ItdXBzdHJlYW0vbWFsaS1kcCkKPiBB
dXRob3I6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPiBEYXRlOiAgIFNhdCBB
cHIgMjcgMDA6NDI6MDIgMjAxOSArMDgwMAo+Cj4gICAgIGRybS9rb21lZGE6IHJlbW92ZSBzZXQg
YnV0IG5vdCB1c2VkIHZhcmlhYmxlICdrY3J0YycKPgo+ICAgICBGaXhlcyBnY2MgJy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4KPiAgICAgZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYzogSW4gZnVuY3Rpb24ga29tZWRhX3BsYW5lX2F0
b21pY19jaGVjazoKPiAgICAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfcGxhbmUuYzo0OToyMjogd2FybmluZzogdmFyaWFibGUga2NydGMgc2V0IGJ1dCBub3QgdXNl
ZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPgo+ICAgICBJdCBpcyBuZXZlciB1c2VkIHNp
bmNlIGludHJvZHVjdGlvbiBpbgo+ICAgICBjb21taXQgN2QzMWI5ZTdhNTUwICgiZHJtL2tvbWVk
YTogQWRkIGtvbWVkYV9wbGFuZS9wbGFuZV9oZWxwZXJfZnVuY3MiKQo+Cj4gICAgIFNpZ25lZC1v
ZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPiAgICAgUmV2aWV3ZWQt
Ynk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndh
bmdAYXJtLmNvbT4KPiAgICAgU2lnbmVkLW9mZi1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1
QGFybS5jb20+Cj4KPgo+IE1heWJlIHJlc3luYz8KCgo+ZGFuaWVsQHBoZW5vbTp+L2xpbnV4L3Ny
YyQgZ2l0IGZldGNoIGdpdDovL2xpbnV4LWFybS5vcmcvbGludXgtbGQuZ2l0IGZvci11cHN0cmVh
bS9tYWxpLWRwCkZyb20gZ2l0Oi8vbGludXgtYXJtLm9yZy9saW51eC1sZAogKiBicmFuY2ggICAg
ICAgICAgICAgICAgICAgICAgcmVmcy9mb3ItdXBzdHJlYW0vbWFsaS1kcCAtPiBGRVRDSF9IRUFE
CmRhbmllbEBwaGVub206fi9saW51eC9zcmMkIGdpdCBzaG93IEZFVENIX0hFQUQKY29tbWl0IDA0
YzhhMWVjMzk1YjIyZjA2MGI4MzZiNzJkMmQ0NDgwZTdlODU5ZjgKCldoYXRldmVyIGl0IGlzIHlv
dSdyZSBsb29raW5nIGF0LCBpdCdzIG5vdCB0aGUgcmVtb3RlIHNoYTEgZXZlcnlvbmUKZWxzZSBn
ZXRzIDotKQotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
