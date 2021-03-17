Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 688D133F376
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 15:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370E76E5A2;
	Wed, 17 Mar 2021 14:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E586E598
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 14:41:59 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id x21so2574431eds.4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 07:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1x2DVLYPyLfTcPZ4DPcLeAmGngaBfj0fgp9byOgJXZc=;
 b=t1TDhoQ6qncZ42uinLcLjuW3X5F4aW0zDAq20Kw/c5Cpuy4/XT8PFwtaYhTk7Ld8ij
 kmRUJYXVvj8V3tqOGCs4OBHwjH8n6mnMKJGyugvI22EutB+d4ZdNpbwDm+NzxhMbyg5T
 dPj6E1DZfE4fz10X7SptKtIojeDnf30+fnL+ZPZvdfncv7vpyyvpLa8fOCUzF7gjmL5T
 N4WQMWrVsvTZDs4SIDJb0nPYBmwK/2q67IK+LpLNLArij+1enuPCT5Jrbz1My12IhoGe
 IeVnW4m88oZxPZ+6t3t7+z6msfhp+se/UBpkNl54BnG+ZxKpEezCaB9l2xC8wpqiGAJk
 BiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1x2DVLYPyLfTcPZ4DPcLeAmGngaBfj0fgp9byOgJXZc=;
 b=eq8HDNtoTI/2GOdtyTUh6jzZTW+1E52w4HBw9UrdAE97Hc+SFR+oOesdP9V+r4vJQx
 VYdAARw/Kdrx8N1xW+QeFS5i5Ewv+azn10zVe0dRioyJbjU3ZiIIO5/mbid7c1XstJYS
 AVROQ0QyJ4MKEDY/yc6SK0dF1sSK+UHMd+Lg/fxofeAkWPSkRABNlRIdWuF8+HEZ4a+B
 EOZjNL5aJ9MgyL/H2vQNSX9xn1VJY1709GORXk7dT4FCYXDIaZafub/EBU3NoOfPV23E
 QUd+JoJOpzhUDI7rABDzW4nuElNfrqvRdhAq0gLieLc6/vsJz6FZwcpuD3+h5k+yIVYl
 SFKg==
X-Gm-Message-State: AOAM530mJn3dyPGQKo7/+XKaLcvmlA5JCvMtvfQJFd3ntkG9Gbfdi3dV
 YIqKZDvIF+PG5t4WxuGY5HAEICTT8zsZ6RfLIBwMfinQCLo=
X-Google-Smtp-Source: ABdhPJyf5OoL+X1btDFQd6YaxppjF8Yl09/CFO5eg5tZ+cFFwB0rIuA+MqfekRXiBkFCbogIYBe9Bn1RGayVMSqoeVE=
X-Received: by 2002:a05:6402:17d6:: with SMTP id
 s22mr42077216edy.232.1615992117217; 
 Wed, 17 Mar 2021 07:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210315143428.1471489-3-jason@jlekstrand.net>
 <20210317143935.2094831-1-jason@jlekstrand.net>
In-Reply-To: <20210317143935.2094831-1-jason@jlekstrand.net>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 17 Mar 2021 09:41:46 -0500
Message-ID: <CAOFGe95-ziVPXC4t-SvDKpQ30kTtUiu6R0-uq6dGeeehfHcdBw@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gem: Drop relocation support on all new hardware
 (v6)
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
 Intel GFX <intel-gfx@lists.freedesktop.org>
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
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBzaG91bGQgcHJvYmFibHkgaGF2ZSBzYWlkIHRoYXQgdGhlIHJldmlld3MgYXJlIG9uIHY1IGFu
ZCBpdCdzIHZlcnkKZGlmZmVyZW50IGluIHY2IHNvIHRoZXkgc2hvdWxkIHByb2JhYmx5IGJlIGNv
bnNpZGVyZWQgZHJvcHBlZCB1bnRpbApyZS1jb25maXJtZWQuCgpPbiBXZWQsIE1hciAxNywgMjAy
MSBhdCA5OjM5IEFNIEphc29uIEVrc3RyYW5kIDxqYXNvbkBqbGVrc3RyYW5kLm5ldD4gd3JvdGU6
Cj4KPiBUaGUgVnVsa2FuIGRyaXZlciBpbiBNZXNhIGZvciBJbnRlbCBoYXJkd2FyZSBuZXZlciB1
c2VzIHJlbG9jYXRpb25zIGlmCj4gaXQncyBydW5uaW5nIG9uIGEgdmVyc2lvbiBvZiBpOTE1IHRo
YXQgc3VwcG9ydHMgYXQgbGVhc3Qgc29mdHBpbiB3aGljaAo+IGFsbCB2ZXJzaW9ucyBvZiBpOTE1
IHN1cHBvcnRpbmcgR2VuMTIgZG8uICBPbiB0aGUgT3BlbkdMIHNpZGUsIEdlbjEyKyBpcwo+IG9u
bHkgc3VwcG9ydGVkIGJ5IGlyaXMgd2hpY2ggbmV2ZXIgdXNlcyByZWxvY2F0aW9ucy4gIFRoZSBv
bGRlciBpOTY1Cj4gZHJpdmVyIGluIE1lc2EgZG9lcyB1c2UgcmVsb2NhdGlvbnMgYnV0IGl0IG9u
bHkgc3VwcG9ydHMgSW50ZWwgaGFyZHdhcmUKPiB0aHJvdWdoIEdlbjExIGFuZCBoYXMgYmVlbiBk
ZXByZWNhdGVkIGZvciBhbGwgaGFyZHdhcmUgR2VuOSsuICBUaGUKPiBjb21wdXRlIGRyaXZlciBh
bHNvIG5ldmVyIHVzZXMgcmVsb2NhdGlvbnMuICBUaGlzIG9ubHkgbGVhdmVzIHRoZSBtZWRpYQo+
IGRyaXZlciB3aGljaCBpcyBzdXBwb3NlZCB0byBiZSBzd2l0Y2hpbmcgdG8gc29mdHBpbiBnb2lu
ZyBmb3J3YXJkLgo+IE1ha2luZyBzb2Z0cGluIGEgcmVxdWlyZW1lbnQgZm9yIGFsbCBmdXR1cmUg
aGFyZHdhcmUgc2VlbXMgcmVhc29uYWJsZS4KPgo+IFRoZXJlIGlzIG9uZSBwaWVjZSBvZiBoYXJk
d2FyZSBlbmFibGVkIGJ5IGRlZmF1bHQgaW4gaTkxNTogUktMIHdoaWNoIHdhcwo+IGVuYWJsZWQg
YnkgZTIyZmE2ZjBhOTc2IHdoaWNoIGhhcyBub3QgeWV0IGxhbmRlZCBpbiBkcm0tbmV4dCBzbyB0
aGlzCj4gYWxtb3N0IGJ1dCBub3QgcmVhbGx5IGEgdXNlcnNwYWNlIEFQSSBjaGFuZ2UgZm9yIFJL
TC4gIElmIGl0IGJlY29tZXMgYQo+IHByb2JsZW0sIHdlIGNhbiBhbHdheXMgYWRkICFJU19ST0NL
RVRMQUtFKGViLT5pOTE1KSB0byB0aGUgY29uZGl0aW9uLgo+Cj4gUmVqZWN0aW5nIHJlbG9jYXRp
b25zIHN0YXJ0aW5nIHdpdGggbmV3ZXIgR2VuMTIgcGxhdGZvcm1zIGhhcyB0aGUKPiBiZW5lZml0
IHRoYXQgd2UgZG9uJ3QgaGF2ZSB0byBib3RoZXIgc3VwcG9ydGluZyBpdCBvbiBwbGF0Zm9ybXMg
d2l0aAo+IGxvY2FsIG1lbW9yeS4gIEdpdmVuIGhvdyBtdWNoIENQVSB0b3VjaGluZyBvZiBtZW1v
cnkgaXMgcmVxdWlyZWQgZm9yCj4gcmVsb2NhdGlvbnMsIG5vdCBoYXZpbmcgdG8gZG8gc28gb24g
cGxhdGZvcm1zIHdoZXJlIG5vdCBhbGwgbWVtb3J5IGlzCj4gZGlyZWN0bHkgQ1BVLWFjY2Vzc2li
bGUgY2FycmllcyBzaWduaWZpY2FudCBhZHZhbnRhZ2VzLgo+Cj4gdjIgKEphc29uIEVrc3RyYW5k
KToKPiAgLSBBbGxvdyBUR0wtTFAgcGxhdGZvcm1zIGFzIHRoZXkndmUgYWxyZWFkeSBzaGlwcGVk
Cj4KPiB2MyAoSmFzb24gRWtzdHJhbmQpOgo+ICAtIFdBUk5fT04gcGxhdGZvcm1zIHdpdGggTE1F
TSBzdXBwb3J0IGluIGNhc2UgdGhlIGNoZWNrIGlzIHdyb25nCj4KPiB2NCAoSmFzb24gRWtzdHJh
bmQpOgo+ICAtIENhbGwgb3V0IFJvY2tldCBMYWtlIGluIHRoZSBjb21taXQgbWVzc2FnZQo+Cj4g
djUgKEphc29uIEVrc3RyYW5kKToKPiAgLSBEcm9wIHRoZSBIQVNfTE1FTSBjaGVjayBhcyBpdCdz
IGFscmVhZHkgY292ZXJlZCBieSB0aGUgdmVyc2lvbiBjaGVjawo+Cj4gdjYgKEphc29uIEVrc3Ry
YW5kKToKPiAgLSBNb3ZlIHRoZSBjaGVjayB0byBlYl92YWxpZGF0ZV92bWEoKSB3aXRoIGFsbCB0
aGUgb3RoZXIgZXhlY19vYmplY3QKPiAgICB2YWxpZGF0aW9uIGNoZWNrcy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEphc29uIEVrc3RyYW5kIDxqYXNvbkBqbGVrc3RyYW5kLm5ldD4KPiBSZXZpZXdlZC1i
eTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+
Cj4gUmV2aWV3ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51
eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9l
eGVjYnVmZmVyLmMgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVj
YnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5j
Cj4gaW5kZXggOTk3NzJmMzdiZmY2MC4uYzA4MmZiMGJlZjMzMCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYwo+IEBAIC00ODMsNiArNDgz
LDEzIEBAIGViX3ZhbGlkYXRlX3ZtYShzdHJ1Y3QgaTkxNV9leGVjYnVmZmVyICplYiwKPiAgICAg
ICAgICAgICAgICAgc3RydWN0IGRybV9pOTE1X2dlbV9leGVjX29iamVjdDIgKmVudHJ5LAo+ICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgaTkxNV92bWEgKnZtYSkKPiAgewo+ICsgICAgICAgLyogUmVs
b2NhdGlvbnMgYXJlIGRpc2FsbG93ZWQgZm9yIGFsbCBwbGF0Zm9ybXMgYWZ0ZXIgVEdMLUxQLiAg
VGhpcwo+ICsgICAgICAgICogYWxzbyBjb3ZlcnMgYWxsIHBsYXRmb3JtcyB3aXRoIGxvY2FsIG1l
bW9yeS4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKGVudHJ5LT5yZWxvY2F0aW9uX2NvdW50
ICYmCj4gKyAgICAgICAgICAgSU5URUxfR0VOKGViLT5pOTE1KSA+PSAxMiAmJiAhSVNfVElHRVJM
QUtFKGViLT5pOTE1KSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICAg
ICAgICAgaWYgKHVubGlrZWx5KGVudHJ5LT5mbGFncyAmIGViLT5pbnZhbGlkX2ZsYWdzKSkKPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4KPiAtLQo+IDIuMjkuMgo+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
