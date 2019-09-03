Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5DEA73A9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 21:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26366897C3;
	Tue,  3 Sep 2019 19:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CCF897C3;
 Tue,  3 Sep 2019 19:30:23 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 30so7744230wrk.11;
 Tue, 03 Sep 2019 12:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BUC9lNV3hiLQYYhK09gUGrdClqoIa3FcNpKkrkBFKUs=;
 b=IXW8LJfI140BRoSJkVh41OWzU8g/g3fbB1TOc52XT4B9qO3S6yNx55R7xFxh3r3JuP
 M5kl5TkZyMgOqp4D4P1g8NhksjJTwOY1hwk4jVJPPNQulCc3ulv7885NbcKc3vWOYlWP
 ztYWYGLAL4z33zWJbDP2P9IfzJJJBNPay96nm3FXBdkQ+CJnZPPFWIg1JgV9xv+2uajd
 MPtitWcc1OJzxkjdsUcoYefV7K1kfliy87Bs9GCSUi2vpcYUeEbQSFi476o+iU9UafNx
 AkSOjJI0IJzq72EXPinKmcjsdDCd39rTZgDqU3uPU5BWvqmeB8Gii7679hIZ2xhIWgre
 5fsg==
X-Gm-Message-State: APjAAAVQa8ZK+yrj84iSuDhKWqnvDpmBDeeN6YLF6vMlrqMTz92cK8Cb
 SJ97X0hYSowILkl3lsHQZFPE5ILvUwFXAJHAmlg=
X-Google-Smtp-Source: APXvYqwGtw3k06abnxnAPKVukQA7dOhMMxI8wqrOCiZub2liJlFPTERNxfiKu289CQ8PDUPntVyv2CnSIs5XpSTAGwc=
X-Received: by 2002:adf:ef44:: with SMTP id c4mr23938460wrp.216.1567539022320; 
 Tue, 03 Sep 2019 12:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190903080217.GL2112@phenom.ffwll.local>
 <f8d561b9-091e-2f74-944f-38230195eea8@amd.com>
 <CAKMK7uGDs1fznj7PQytc7fAtBoSQ4VmW6D6UDqTgPxzgHOsC+Q@mail.gmail.com>
In-Reply-To: <CAKMK7uGDs1fznj7PQytc7fAtBoSQ4VmW6D6UDqTgPxzgHOsC+Q@mail.gmail.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Tue, 3 Sep 2019 15:30:11 -0400
Message-ID: <CAOWid-cgr3BuGzuxeGTmb_4jQXEy=GJVXR874iTz_kYRgRUqKA@mail.gmail.com>
Subject: Re: [PATCH RFC v4 00/16] new cgroup controller for gpu/drm subsystem
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BUC9lNV3hiLQYYhK09gUGrdClqoIa3FcNpKkrkBFKUs=;
 b=dOiBwHRt8IrV+6hpNvTDbS6aoB5EH3z4mCO1RHw+JoOBM7t049RVg/ueYKwqsgHTev
 ndqWdh/yNmmbMXnYN9u9G8GfPKv4O5SxYLfTYCbcl6i0znIa1JI5c8Z3MlzTP2DvjM8R
 W+oY+f78T/859JA6GAgTcYYFeQpCAxXBtouSQQ0Q3zr6lrCe6ou6vxNHpP60V9IcAHH9
 JrQzUp1+bRg8vUoc8g0BzLEKDdidFpqPkrPoi81MdxjbT7tzJ8CXpsHXM4k7mE5uM7zD
 eeV+inQonK+lK/6woygeYQJlxePKYHm92EmzhNS3em0sGXi/m8BOseuywSmZvvvGkTs9
 wHiA==
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
Cc: "Ho, Kenny" <Kenny.Ho@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "jsparks@cray.com" <jsparks@cray.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "lkaplan@cray.com" <lkaplan@cray.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Greathouse, Joseph" <Joseph.Greathouse@amd.com>,
 "tj@kernel.org" <tj@kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMywgMjAxOSBhdCA1OjIwIEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4gd3JvdGU6Cj4KPiBPbiBUdWUsIFNlcCAzLCAyMDE5IGF0IDEwOjI0IEFNIEtvZW5pZywg
Q2hyaXN0aWFuCj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQW0g
MDMuMDkuMTkgdW0gMTA6MDIgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+ID4gPiBPbiBUaHUsIEF1
ZyAyOSwgMjAxOSBhdCAwMjowNToxN0FNIC0wNDAwLCBLZW5ueSBIbyB3cm90ZToKPiA+ID4+IFdp
dGggdGhpcyBSRkMgdjQsIEkgYW0gaG9waW5nIHRvIGhhdmUgc29tZSBjb25zZW5zdXMgb24gYSBt
ZXJnZSBwbGFuLiAgSSBiZWxpZXZlCj4gPiA+PiB0aGUgR0VNIHJlbGF0ZWQgcmVzb3VyY2VzIChk
cm0uYnVmZmVyLiopIGludHJvZHVjZWQgaW4gcHJldmlvdXMgUkZDIGFuZCwKPiA+ID4+IGhvcGVm
dWxseSwgdGhlIGxvZ2ljYWwgR1BVIGNvbmNlcHQgKGRybS5sZ3B1LiopIGludHJvZHVjZWQgaW4g
dGhpcyBSRkMgYXJlCj4gPiA+PiB1bmNvbnRyb3ZlcnNpYWwgYW5kIHJlYWR5IHRvIG1vdmUgb3V0
IG9mIFJGQyBhbmQgaW50byBhIG1vcmUgZm9ybWFsIHJldmlldy4gIEkKPiA+ID4+IHdpbGwgY29u
dGludWUgdG8gd29yayBvbiB0aGUgbWVtb3J5IGJhY2tlbmQgcmVzb3VyY2VzIChkcm0ubWVtb3J5
LiopLgo+ID4gPj4KPiA+ID4+IFRoZSBjb3ZlciBsZXR0ZXIgZnJvbSB2MSBpcyBjb3BpZWQgYmVs
b3cgZm9yIHJlZmVyZW5jZS4KPiA+ID4+Cj4gPiA+PiBbdjFdOiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOC1Ob3ZlbWJlci8xOTcxMDYuaHRtbAo+
ID4gPj4gW3YyXTogaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvY2dyb3Vwcy9tc2cyMjA3
NC5odG1sCj4gPiA+PiBbdjNdOiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZl
cy9hbWQtZ2Z4LzIwMTktSnVuZS8wMzYwMjYuaHRtbAo+ID4gPiBTbyBsb29raW5nIGF0IGFsbCB0
aGlzIGRvZXNuJ3Qgc2VlbSB0byBoYXZlIGNoYW5nZWQgbXVjaCwgYW5kIHRoZSBvbGQKPiA+ID4g
ZGlzY3Vzc2lvbiBkaWRuJ3QgcmVhbGx5IGNvbmNsdWRlIGFueXdoZXJlIChhc2lkZSBmcm9tIHNv
bWUgZGV0YWlscykuCj4gPiA+Cj4gPiA+IE9uZSBtb3JlIG9wZW4gdGhvdWdoIHRoYXQgY3Jvc3Nl
ZCBteSBtaW5kLCBoYXZpbmcgcmVhZCBhIHRvbiBvZiB0dG0gYWdhaW4KPiA+ID4gcmVjZW50bHk6
IEhvdyBkb2VzIHRoaXMgYWxsIGludGVyYWN0IHdpdGggdHRtIGdsb2JhbCBsaW1pdHM/IEknZCBz
YXkgdGhlCj4gPiA+IHR0bSBnbG9iYWwgbGltaXRzIGlzIHRoZSB1ci1jZ3JvdXBzIHdlIGhhdmUg
aW4gZHJtLCBhbmQgbm90IGxvb2tpbmcgYXQKPiA+ID4gdGhhdCBzZWVtcyBraW5kYSBiYWQuCj4g
Pgo+ID4gQXQgbGVhc3QgbXkgaG9wZSB3YXMgdG8gY29tcGxldGVseSByZXBsYWNlIHR0bSBnbG9i
YWxzIHdpdGggdGhvc2UKPiA+IGxpbWl0YXRpb25zIGhlcmUgd2hlbiBpdCBpcyByZWFkeS4KPgo+
IFlvdSBuZWVkIG1vcmUsIGF0IGxlYXN0IHNvbWUga2luZCBvZiBzaHJpbmtlciB0byBjdXQgZG93
biBibyBwbGFjZWQgaW4KPiBzeXN0ZW0gbWVtb3J5IHdoZW4gd2UncmUgdW5kZXIgbWVtb3J5IHBy
ZXNzdXJlLiBXaGljaCBkcmFncyBpbiBhCj4gcHJldHR5IGVwaWMgYW1vdW50IG9mIGxvY2tpbmcg
bG9scyAoc2VlIGk5MTUncyBzaHJpbmtlciBmdW4sIHdoZXJlIHdlCj4gYXR0ZW1wdCB0aGF0KS4g
UHJvYmFibHkgYW5vdGhlciBnb29kIGlkZWEgdG8gc2hhcmUgYXQgbGVhc3Qgc29tZQo+IGNvbmNl
cHRzLCBtYXliZSBldmVuIGNvZGUuCgpJIGFtIHN0aWxsIGxvb2tpbmcgaW50byB5b3VyIHNocmlu
a2VyIHN1Z2dlc3Rpb24gc28gdGhlIG1lbW9yeS4qCnJlc291cmNlcyBhcmUgdW50b3VjaCBmcm9t
IFJGQyB2My4gIFRoZSBtYWluIGNoYW5nZSBmb3IgdGhlIGJ1ZmZlci4qCnJlc291cmNlcyBpcyB0
aGUgcmVtb3ZhbCBvZiBidWZmZXIgc2hhcmluZyByZXN0cmljdGlvbiBhcyB5b3UKc3VnZ2VzdGVk
IGFuZCBhZGRpdGlvbmFsIGRvY3VtZW50YXRpb24gb2YgdGhhdCBiZWhhdmlvdXIuICAoSSBtYXkg
aGF2ZQpuZWdsZWN0ZWQgbWVudGlvbmluZyBpdCBpbiB0aGUgY292ZXIuKSAgVGhlIG90aGVyIGtl
eSBwYXJ0IG9mIFJGQyB2NAppcyB0aGUgImxvZ2ljYWwgR1BVL2xncHUiIGNvbmNlcHQuICBJIGFt
IGhvcGluZyB0byBnZXQgaXQgb3V0IHRoZXJlCmVhcmx5IGZvciBmZWVkYmFjayB3aGlsZSBJIGNv
bnRpbnVlIHRvIHdvcmsgb24gdGhlIG1lbW9yeS4qIHBhcnRzLgoKS2VubnkKCj4gLURhbmllbAo+
Cj4gPgo+ID4gQ2hyaXN0aWFuLgo+ID4KPiA+ID4gLURhbmllbAo+ID4gPgo+ID4gPj4gdjQ6Cj4g
PiA+PiBVbmNoYW5nZWQgKG5vIHJldmlldyBuZWVkZWQpCj4gPiA+PiAqIGRybS5tZW1vcnkuKi90
dG0gcmVzb3VyY2VzIChQYXRjaCA5LTEzLCBJIGFtIHN0aWxsIHdvcmtpbmcgb24gbWVtb3J5IGJh
bmR3aWR0aAo+ID4gPj4gYW5kIHNocmlua2VyKQo+ID4gPj4gQmFzZSBvbiBmZWVkYmFja3Mgb24g
djM6Cj4gPiA+PiAqIHVwZGF0ZSBub21pbmNsYXR1cmUgdG8gZHJtY2cKPiA+ID4+ICogZW1iZWQg
cGVyIGRldmljZSBkcm1jZyBwcm9wZXJ0aWVzIGludG8gZHJtX2RldmljZQo+ID4gPj4gKiBzcGxp
dCBHRU0gYnVmZmVyIHJlbGF0ZWQgY29tbWl0cyBpbnRvIHN0YXRzIGFuZCBsaW1pdAo+ID4gPj4g
KiByZW5hbWUgZnVuY3Rpb24gbmFtZSB0byBhbGlnbiB3aXRoIGNvbnZlbnRpb24KPiA+ID4+ICog
Y29tYmluZWQgYnVmZmVyIGFjY291bnRpbmcgYW5kIGNoZWNrIGludG8gYSB0cnlfY2hhcmdlIGZ1
bmN0aW9uCj4gPiA+PiAqIHN1cHBvcnQgYnVmZmVyIHN0YXRzIHdpdGhvdXQgbGltaXQgZW5mb3Jj
ZW1lbnQKPiA+ID4+ICogcmVtb3ZlZCBHRU0gYnVmZmVyIHNoYXJpbmcgbGltaXRhdGlvbgo+ID4g
Pj4gKiB1cGRhdGVkIGRvY3VtZW50YXRpb25zCj4gPiA+PiBOZXcgZmVhdHVyZXM6Cj4gPiA+PiAq
IGludHJvZHVjaW5nIGxvZ2ljYWwgR1BVIGNvbmNlcHQKPiA+ID4+ICogZXhhbXBsZSBpbXBsZW1l
bnRhdGlvbiB3aXRoIEFNRCBLRkQKPiA+ID4+Cj4gPiA+PiB2MzoKPiA+ID4+IEJhc2Ugb24gZmVl
ZGJhY2tzIG9uIHYyOgo+ID4gPj4gKiByZW1vdmVkIC5oZWxwIHR5cGUgZmlsZSBmcm9tIHYyCj4g
PiA+PiAqIGNvbmZvcm0gdG8gY2dyb3VwIGNvbnZlbnRpb24gZm9yIGRlZmF1bHQgYW5kIG1heCBo
YW5kbGluZwo+ID4gPj4gKiBjb25mb3JtIHRvIGNncm91cCBjb252ZW50aW9uIGZvciBhZGRyZXNz
aW5nIGRldmljZSBzcGVjaWZpYyBsaW1pdHMgKHdpdGggbWFqb3I6bWlub3IpCj4gPiA+PiBOZXcg
ZnVuY3Rpb246Cj4gPiA+PiAqIGFkb3B0ZWQgbWVtcGFyc2UgZm9yIG1lbW9yeSBzaXplIHJlbGF0
ZWQgYXR0cmlidXRlcwo+ID4gPj4gKiBhZGRlZCBtYWNybyB0byBtYXJzaGFsbCBkcm1jZ3JwIGNm
dHlwZSBwcml2YXRlICAoRFJNQ0dfQ1RGX1BSSVYsIGV0Yy4pCj4gPiA+PiAqIGFkZGVkIHR0bSBi
dWZmZXIgdXNhZ2Ugc3RhdHMgKHBlciBjZ3JvdXAsIGZvciBzeXN0ZW0sIHR0LCB2cmFtLikKPiA+
ID4+ICogYWRkZWQgdHRtIGJ1ZmZlciB1c2FnZSBsaW1pdCAocGVyIGNncm91cCwgZm9yIHZyYW0u
KQo+ID4gPj4gKiBhZGRlZCBwZXIgY2dyb3VwIGJhbmR3aWR0aCBzdGF0cyBhbmQgbGltaXRpbmcg
KGJ1cnN0IGFuZCBhdmVyYWdlIGJhbmR3aWR0aCkKPiA+ID4+Cj4gPiA+PiB2MjoKPiA+ID4+ICog
UmVtb3ZlZCB0aGUgdmVuZG9yaW5nIGNvbmNlcHRzCj4gPiA+PiAqIEFkZCBsaW1pdCB0byB0b3Rh
bCBidWZmZXIgYWxsb2NhdGlvbgo+ID4gPj4gKiBBZGQgbGltaXQgdG8gdGhlIG1heGltdW0gc2l6
ZSBvZiBhIGJ1ZmZlciBhbGxvY2F0aW9uCj4gPiA+Pgo+ID4gPj4gdjE6IGNvdmVyIGxldHRlcgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
