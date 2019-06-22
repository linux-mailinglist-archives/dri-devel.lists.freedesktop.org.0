Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 272974F562
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 12:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F173F6E964;
	Sat, 22 Jun 2019 10:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FFA6E964
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 10:51:22 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id b7so8798739otl.11
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 03:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Uop26IA6H9ZjT1ljZXQWgn6IimGyMmabeVDN4eojwc=;
 b=bmlDO5m0IKEg0Z/3bC7QQtuv8MKhFyP1NF5nABcsdGVBX0BYW13A/i1TeM6Nl6IHau
 wBT38M9gYi69rr2Y00uPtu1nKXPYT08hs7MOW+aZz8L3NOCH+IU+ENDQq9vp34uxKDG3
 ft6iLVdM0lE5gTK2dc9QsaqgYWu3oYx1Pq8K2bsoYN1MM9ENmrIMrYZdNQ3cVtgjG73M
 NAaDGTMbtYB+QF21gCp9DlMPi6mHdWBnHnR8CQyaK8HihWeOZJcwvBMT0QpYt1eJm8Vm
 9bGFCWlNfWWISxeVqdBKBW7UUwVKoiKCM40XCSk37QiBVcpnBhHXahUFSDg2aKXyJtXD
 xb3w==
X-Gm-Message-State: APjAAAXX3s2ozsscXD17ZGdacvvStFHOifn1KfWUFEGQC2fPwcJSVbij
 g+nYb/CkJsFVNys5H5ZCzjLfgZ4O6MJLsRcR9VTcOQ==
X-Google-Smtp-Source: APXvYqxZXRUY73tEDdihZsWnfd1u/rGq6Qd4OE1kveg9OOtyMmRcJspJlbDftznClMu6oBSi3hCym97MIEyUyjKPolU=
X-Received: by 2002:a05:6830:4b:: with SMTP id
 d11mr16993118otp.106.1561200681516; 
 Sat, 22 Jun 2019 03:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <13b7wY-2xuVr-7VBZKIUaV5hr_T03akw4sBL_zlsLRxksg5UZGpAYRKSq8_VmBRAvODmSISqGda2YU332G9O9IaJluDJFsc6R8uWkQeQT1o=@emersion.fr>
 <CAKMK7uH7Twme7kn==ZXeCuC5+uL0RAm9fv2KJui=KATZwLHuqw@mail.gmail.com>
 <87fto5pbvv.fsf@intel.com>
In-Reply-To: <87fto5pbvv.fsf@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 22 Jun 2019 12:51:10 +0200
Message-ID: <CAKMK7uFCKH5ydzRF8AsNDuFmva+1LWa70FhMGUiFTh3ka80C1w@mail.gmail.com>
Subject: Re: KMS documentation for userspace
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=6Uop26IA6H9ZjT1ljZXQWgn6IimGyMmabeVDN4eojwc=;
 b=dcjyiUfggxBSaO4gFuo7g2ebNgk7/ZaeUn84aaFLtrQ3tMhEBHIluELafwfKEgWLTz
 Dx3ToHRjvHO8+2+AW43QhLCAyd0TNOIiL3TqS4tKDpa+Rxqk+o30NWvgi7OTRrbTEQsn
 gy6qUwyH/fFxdihB8ajYGY0mnvEaj2ekBNtRk=
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
Cc: Simon Ser <contact@emersion.fr>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTA6MTYgUE0gSmFuaSBOaWt1bGEKPGphbmkubmlrdWxh
QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIDE5IEp1biAyMDE5LCBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4gLSBmaWd1cmUgb3V0IHdoYXQgdG8g
ZG8gd2l0aCB0aGUgbGliZHJtIG1hbnBhZ2VzLiBTb21lIHN0dWZmIHdlIHJlYWxseQo+ID4gd2Fu
dCB0byBhbHNvIGRvY3VtZW50IHRoZXJlLiBCdXQgZ2VleiBucm9mZi4gTWF5YmUgd2UgbmVlZCB0
byBzdHVmZgo+ID4gbGliZHJtIGludG8gdGhlIGtlcm5lbCwgZHVubm8uCj4KPiBIb3cgd291bGQg
cGVvcGxlIGZlZWwgYWJvdXQgY29udmVydGluZyBsaWJkcm0gbWFuIHBhZ2VzIHRvIHJzdCwgYW5k
Cj4gdXNpbmcgcnN0Mm1hbiBpbiB0aGUgYnVpbGQ/IFdlIGRpZCB0aGF0IGZvciBpZ3QgbWFuIHBh
Z2VzIFsxXS4gTG9va2luZwo+IGF0IHRoZSBkaWZmLCBJIHRoaW5rIGl0J3MgcGxhaW4gdG8gc2Vl
IGhvdyB0aGF0IGNvdWxkIGxvd2VyIHRoZSBiYXIgZm9yCj4gY29udHJpYnV0aW5nLiBBbmQgcGVy
aGFwcyBpdCB3b3VsZCBiZSBlYXNpZXIgdG8gcmVmYWN0b3IgYW5kIG1vdmUKPiBkb2N1bWVudGF0
aW9uIGFyb3VuZCB0b28uCgpJIHRoaW5rIHRoYXQnZCBiZSB2ZXJ5IG5pY2UuCgo+IEkgZm9yZ2V0
LCBJIHByb2JhYmx5IHVzZWQgcGFuZG9jIG9yIHNvbWV0aGluZyB0byBkbyB0aGUgYnVsayBvZiB0
aGUgaWd0Cj4gY29udmVyc2lvbiwgYW5kIGFkZGVkIHNvbWUgbWFudWFsIHBvbGlzaCBvbiB0b3Au
IEknbSBub3Qgdm9sdW50ZWVyaW5nCj4gZm9yIHRoZSBsaWJkcm0gbWFuIHBhZ2UgY29udmVyc2lv
biB0aG91Z2guIDspCgpIbSwgbWF5YmUgZGlnIG91dCB0aGUgb2xkIHRvb2xzIHlvdSB1c2VkIGFu
ZCBwb2ludCBTaW1vbiBhdCB0aGVtPwotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
