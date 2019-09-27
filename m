Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45713C04EB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 14:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DABE6E203;
	Fri, 27 Sep 2019 12:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FD06E203
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 12:14:11 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id b136so15723507iof.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 05:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XJJtNuqioZl6sa+W5Rtd/VG7UjoMxElWqoWFvVmwcPg=;
 b=UQZHZjxwscka5uCppcTeXempeAgc1NURYgi7NFdg6IUUHL745QWlF5JeRf9jBthBjt
 xt5DSg/xvIy02YrYdrF4JXSyMy0iPZdoTZxsyzZX70W/eO9QfWy+5dh2XxK+IIvoA1CQ
 v8n+hDxsDESEzJIpVat9yVdPrdkcTmgG+h45AgjfW5VYrXOU44YE4dPsAGgqhPoZzkAI
 ZX5BeSF5uhHTTm/3yh6IyX0SkipukaAO/auQB6kZxhqRkFrmhyT9L/OpFr99D6q+0nsi
 2ucRQa9Rp/n+Bj8fjL1M6SC/IvtjnwFRqYE3fR8shz77H3TXYPmcVEIyhh+JNTCrAsQX
 Gtpg==
X-Gm-Message-State: APjAAAX9/MhQKzK6Vsitw2SoJt7XQYPH2LTt2UuiOuTaw18U1hUddfPj
 AIVMR8YQqdXvF9nDSd4BO3/q/yXYhSBkqSR6W/I=
X-Google-Smtp-Source: APXvYqwyOKCiZQF6ncWvp6oVJF/zzgcf1p5FbkC23Qgharm/Cg3vsMj4M3mHWcQhIQJk7EAyi5Ecx3hZvquvq5qC//8=
X-Received: by 2002:a92:3f0a:: with SMTP id m10mr4235717ila.158.1569586450690; 
 Fri, 27 Sep 2019 05:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <f6012b3a-7b96-6020-d09d-c458fa8742d8@ti.com>
In-Reply-To: <f6012b3a-7b96-6020-d09d-c458fa8742d8@ti.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Sep 2019 07:13:59 -0500
Message-ID: <CAHCN7x+ysOEXFCE5DXvoPh6sQBdnHRE8t-KJfcijWesJRx9iXg@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=XJJtNuqioZl6sa+W5Rtd/VG7UjoMxElWqoWFvVmwcPg=;
 b=iROi2TOrPbDzeqog2o0irRLDYv8v0KQxALF63dP95BRHup05sWPpMyhjL8kxbpnyUl
 9rlyIezwuakpTw24pXZQuDTN5ePY1nXjUTJw/ORTVKLPHr08x+DR2fAHWXJAXM/XapbP
 2SRvVM6DubGI/ojN759mp2E01zstJgN+YsNaR8VbCOivsWZFBw3j7x3TBnuAmeUOc2b4
 4yU1ltsIaulzT0xipQDIjckwMUOPeuxWhmX5T6yzKWYhIS2Kbe5xXa8UhNi24k+O6BQ1
 6PP/D77y76Lb7Upg1jzA+KtGKbBy7q25jgPBcJx3HT+5pHqciyJYyW1A11MIjJSUeNgT
 7Png==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh+dt@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>,
 Adam Ford <adam.ford@logicpd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMToyMiBBTSBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxr
ZWluZW5AdGkuY29tPiB3cm90ZToKPgo+IE9uIDI2LzA5LzIwMTkgMTc6MTIsIEFkYW0gRm9yZCB3
cm90ZToKPgo+ID4+IEFuZCB3aGF0IGlzIHRoZSBoZG1pNV9jb25maWd1cmUgdGhlcmU/IEkgZG9u
J3Qgc2VlIGFueXRoaW5nIGluIHRoZQo+ID4+IGRyaXZlciB0aGF0IHdvdWxkIHByaW50IGhkbWk1
X2NvbmZpZ3VyZS4gQW5kLCBvZiBjb3Vyc2UsIHRoZXJlJ3Mgbm8KPiA+PiBoZG1pNSBvbiB0aGF0
IHBsYXRmb3JtLiBIbW0sIG9rLi4uIGl0J3MgZnJvbSBjb21wb25lbnQuYywgdXNpbmcgIiVwcyIu
Cj4gPj4gU29tZWhvdyB0aGF0IGdvZXMgd3JvbmcuIFdoaWNoIGlzIGEgYml0IGFsYXJtaW5nLCBi
dXQgcGVyaGFwcyBhIHRvdGFsbHkKPiA+PiBkaWZmZXJlbnQgaXNzdWUuCj4gPgo+ID4gSSdsbCB0
cnkgdG8gdGFrZSBhIGxvb2sgbGF0ZXIuICBGb3IgTG9naWMgUEQgZGlzdHJpYnV0aW9ucywgd2Ug
Y3JlYXRlCj4gPiBhIGN1c3RvbSBkZWZjb25maWcgd2l0aCBhbGwgdGhvc2UgZHJpdmVycyByZW1v
dmVkLCBzbyBJJ20gbm90IHdvcmtlZAo+ID4gdXAgYWJvdXQgaXQsIGJ1dCBpdCB3b3VsZCBiZSBu
aWNlIHRvIG5vdCBjYWxsIGRyaXZlcnMgdGhhdCBkb24ndAo+ID4gZXhpc3QuCj4KPiBTbyB5b3Ug
aGF2ZSBDT05GSUdfT01BUDVfRFNTX0hETUk9bj8gVGhlbiBpdCdzIGV2ZW4gbW9yZSBkaXN0dXJi
aW5nLCBhcwo+IHRoZXJlJ3Mgbm8gd2F5IHRoZSBzdHJpbmcgImhkbWk1X2NvbmZpZ3VyZSIgY2Fu
IGJlIGluIHRoZSBrZXJuZWwgaW1hZ2UuLi4KCkZvciB0aGUgbG9ncyBhbmQgcHJvYmxlbXMgSSBh
bSBzaG93aW5nIGluIHRoaXMgdGhyZWFkLCBJIGFtIHVzaW5nIGEKc3RvY2sgb21hcDJwbHVzX2Rl
ZmNvbmZpZyB3aGljaCBoYXMgaXQgZW5hYmxlZC4gIEkgd2FzIG9ubHkgdHJ5aW5nIHRvCnN0YXRl
IHRoYXQgSSBhbSBub3Qgd29ycmllZCBhYm91dCB0aGUgb21hcDUgaGRtaSBzdHVmZiwgYmVjYXVz
ZSB3aGVuIEkKZG8gYSBjdXN0b20gZGlzdHJpYnV0aW9uIGZvciBMb2dpYyBQRCwgSSByZW1vdmUg
dGhvc2UgY29uZmlnIG9wdGlvbnMKdG8gbWFrZSB0aGUgaXNzdWUgZ28gYXdheS4KPgo+IE1heWJl
IGl0J3Mgbm90aGluZywgYnV0Li4uIEl0J3MganVzdCBzbyBvZGQuCgpJIGRvbid0IHRoaW5rIHdl
IG5lZWQgdG8gd29ycnkgYWJvdXQgaXQgbm93LiAgSWRlYWxseSwgaXQgd291bGQgYmUKbmljZSB0
byBoYXZlIHRoZSBkcml2ZXJzIHJlY29nbml6ZSB0aGV5IGFyZSBub3QgbmVlZGVkIGFuZCBvciBz
ZXR1cAp0aGUgS2NvbmZpZyBvcHRpb25zIHRvIG1ha2UgdGhlc2UgZHJpdmVycyBkZXBlbmRlbnQg
b24gdGhlIHBsYXRmb3Jtcwp0aGF0IHN1cHBvcnQgaXQgc28gdW5zZWxlY3RpbmcgT01BUDUgY291
bGQgbWFrZSB0aGUgb21hcDUgb3B0aW9ucwpkaXNhcHBlYXIuCgpTb3JyeSBpZiBJIGFjY2lkZW50
YWxseSB0aHJldyBpbiBhIGRpc3RyYWN0aW9uIG9yIGNvbmZ1c2lvbi4KCmFkYW0KPgo+ICAgVG9t
aQo+Cj4gLS0KPiBUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIy
LCAwMDE4MCBIZWxzaW5raS4KPiBZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3Rp
cGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
