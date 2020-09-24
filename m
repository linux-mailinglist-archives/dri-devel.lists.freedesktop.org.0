Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6199277B42
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 23:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5AD6EB63;
	Thu, 24 Sep 2020 21:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A9E6EABD
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 21:50:16 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id t16so429891edw.7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 14:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VhJeuoj+rOPSJ4IEGV+fYVhmYT10xm972NsSejdMkBg=;
 b=mpx4PkaUmFFwA1xtz/GJ0EVr677LvVWAywlSsSBXx0ShG6AZt57DEjUoyvLg2RGr7Z
 XcGgHUDzZZ6KrvKq3epkk490qeNIFUZ7WVyzH3k2hV1MN72qalnnNSh1ZNSDRi2MLtBr
 E72zTYmp0vKyrWmKXZxOsV3KnQVii0Sr3ANFsR+bCuFKdWlMgcIpCImgEkZKy8/R+I2s
 sqwBTgWf3Vh9dt4g2rUdVd4/T2tJRyZNBbd2wGucpyMBqUgIUxJmtMstfGcJI553/ICm
 BHqlmsbvM2Oar8F97gSEIPFqlW9TLbnrBzxk9NNJIwT7vjE1gUjc8bXNcqREFCuIjxEE
 vIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VhJeuoj+rOPSJ4IEGV+fYVhmYT10xm972NsSejdMkBg=;
 b=BVoI6Upf5I39rCC7R4LpBpiNUsBmwpnDRaiwqMgV+1KwUu0+cH7Eq3JzRmMp6Jl7QU
 a24SgRAukGmxdlR2bK7IK7JddaANIDd3avXLxam2Ui19UzPmfsqoVETxd6lQI3Ap2aih
 2+mPcC39AY3DYUD5frgENiXrAL73VL2n/q8r56ysPJ7NGOr5WC/SLlejANHh3qBug4Gj
 3HSyfRlYLPoHwbPLW9PKSIj7OeoRr+F3DRYaRV4cKKWePF1uWOHKKkoEhI8qWO6HOKm0
 fhF6K/F8ikrFvAZYqB6v7TkJwantVl2xCKkcaVIxtSb4R2TVHExchJG4CKC3J485kvwy
 bSrA==
X-Gm-Message-State: AOAM533qaaainwRPI6EzsYcaapJpOD7s9iagUGITAi3NcSYabjJgL7u5
 jCYLGdzVOOr6Ir3eFkQJ1Yk5oUPc9Bswb+YwtXMtZQ==
X-Google-Smtp-Source: ABdhPJwxLNwMbKBfN2GZNfdh2odn88qLZ8Gba3MAPoetXp02KpOblT44U8/Ptt6lHHhBfbX75bgCKW+Q3RCxXi3Ppoc=
X-Received: by 2002:aa7:c511:: with SMTP id o17mr884128edq.300.1600984214693; 
 Thu, 24 Sep 2020 14:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAPcyv4iQ4VnXMU0+_7rfXwPowgcdoABSFUH4WO_3P9vHtWAzPg@mail.gmail.com>
 <79BEC711-C769-432B-9A50-63C6A3AEB0E3@redhat.com>
In-Reply-To: <79BEC711-C769-432B-9A50-63C6A3AEB0E3@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 24 Sep 2020 14:50:03 -0700
Message-ID: <CAPcyv4jsUiXTqDtnh_fnm_p4NaX2=c3rrjFe6Efa-oWPkTe-fA@mail.gmail.com>
Subject: Re: [PATCH v4 11/23] device-dax: Kill dax_kmem_res
To: David Hildenbrand <david@redhat.com>
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
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, Vishal Verma <vishal.l.verma@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Joao Martins <joao.m.martins@oracle.com>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjQsIDIwMjAgYXQgMjo0MiBQTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPgo+Cj4gPiBBbSAyNC4wOS4yMDIwIHVtIDIzOjI2IHNjaHJp
ZWIgRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+Ogo+ID4KPiA+IO+7v1su
Ll0KPiA+Pj4gSSdtIG5vdCBzdWdnZXN0aW5nIHRvIGJ1c3kgdGhlIHdob2xlICJ2aXJ0aW8iIHJh
bmdlLCBqdXN0IHRoZSBwb3J0aW9uCj4gPj4+IHRoYXQncyBhYm91dCB0byBiZSBwYXNzZWQgdG8g
YWRkX21lbW9yeV9kcml2ZXJfbWFuYWdlZCgpLgo+ID4+Cj4gPj4gSSdtIGFmcmFpZCBJIGRvbid0
IGdldCB5b3VyIHBvaW50LiBGb3IgdmlydGlvLW1lbToKPiA+Pgo+ID4+IEJlZm9yZToKPiA+Pgo+
ID4+IDEuIENyZWF0ZSB2aXJ0aW8wIGNvbnRhaW5lciByZXNvdXJjZQo+ID4+Cj4gPj4gMi4gKHNv
bWV3aGVuIGluIHRoZSBmdXR1cmUpIGFkZF9tZW1vcnlfZHJpdmVyX21hbmFnZWQoKQo+ID4+IC0g
Q3JlYXRlIHJlc291cmNlIChTeXN0ZW0gUkFNICh2aXJ0aW9fbWVtKSksIG1hcmtpbmcgaXQgYnVz
eS9kcml2ZXIKPiA+PiAgIG1hbmFnZWQKPiA+Pgo+ID4+IEFmdGVyOgo+ID4+Cj4gPj4gMS4gQ3Jl
YXRlIHZpcnRpbzAgY29udGFpbmVyIHJlc291cmNlCj4gPj4KPiA+PiAyLiAoc29tZXdoZW4gaW4g
dGhlIGZ1dHVyZSkgQ3JlYXRlIHJlc291cmNlIChTeXN0ZW0gUkFNICh2aXJ0aW9fbWVtKSksCj4g
Pj4gICBtYXJraW5nIGl0IGJ1c3kvZHJpdmVyIG1hbmFnZWQKPiA+PiAzLiBhZGRfbWVtb3J5X2Ry
aXZlcl9tYW5hZ2VkKCkKPiA+Pgo+ID4+IE5vdCBoZWxwZnVsIG9yIHNpbXBsZXIgSU1ITy4KPiA+
Cj4gPiBUaGUgY29uY2VybiBJJ20gdHJ5aW5nIHRvIGFkZHJlc3MgaXMgdGhlIHRoZW9yZXRpY2Fs
IHJhY2Ugd2luZG93IGFuZAo+ID4gbGF5ZXJpbmcgdmlvbGF0aW9uIGluIHRoaXMgc2VxdWVuY2Ug
aW4gdGhlIGttZW0gZHJpdmVyOgo+ID4KPiA+IDEvIHJlcyA9IHJlcXVlc3RfbWVtX3JlZ2lvbigu
Li4pOwo+ID4gMi8gcmVzLT5mbGFncyA9IElPUkVTT1VSQ0VfTUVNOwo+ID4gMy8gYWRkX21lbW9y
eV9kcml2ZXJfbWFuYWdlZCgpOwo+ID4KPiA+IEJldHdlZW4gMi8gYW5kIDMvIHNvbWV0aGluZyBj
YW4gcmFjZSBhbmQgdGhpbmsgdGhhdCBpdCBvd25zIHRoZQo+ID4gcmVnaW9uLiBEbyBJIHRoaW5r
IGl0IHdpbGwgaGFwcGVuIGluIHByYWN0aWNlLCBubywgYnV0IGl0J3Mgc3RpbGwgYQo+ID4gcGF0
dGVybiB0aGF0IGRlc2VydmVzIGNvbWUgY2xlYW51cC4KPgo+IEkgdGhpbmsgaW4gdGhhdCB1bmxp
a2VseSBldmVudCAocmF0aGVyIGltcG9zc2libGUpLCBhZGRfbWVtb3J5X2RyaXZlcl9tYW5hZ2Vk
KCkgc2hvdWxkIGZhaWwsIGRldGVjdGluZyBhIGNvbmZsaWN0aW5nIChidXN5KSByZXNvdXJjZS4g
Tm90IHN1cmUgd2hhdCB3aWxsIGhhcHBlbiBuZXh0ICggYW5kIGRpZCBub3QgZG91YmxlLWNoZWNr
KS4KCmFkZF9tZW1vcnlfZHJpdmVyX21hbmFnZWQoKSB3aWxsIGZhaWwsIGJ1dCB0aGUgcmVsZWFz
ZV9tZW1fcmVnaW9uKCkgaW4Ka21lbSB0byB1bndpbmQgb24gdGhlIGVycm9yIHBhdGggd2lsbCBk
byB0aGUgd3JvbmcgdGhpbmcgYmVjYXVzZSB0aGF0Cm90aGVyIGRyaXZlciB0aGlua3MgaXQgZ290
IG93bmVyc2hpcCBvZiB0aGUgcmVnaW9uLgoKPiBCdXQgeWVhaCwgdGhlIHdheSB0aGUgQlVTWSBi
aXQgaXMgY2xlYXJlZCBoZXJlIGlzIHdyb25nIC0gc2ltcGx5IG92ZXJ3cml0aW5nIG90aGVyIGJp
dHMuIEFuZCBpdCB3b3VsZCBiZSBldmVuIGJldHRlciBpZiB3ZSBjb3VsZCBhdm9pZCBtYW51YWxs
eSBtZXNzaW5nIHdpdGggZmxhZ3MgaGVyZS4KCkknbSBvayB0byBsZWF2ZSBpdCBhbG9uZSBmb3Ig
bm93IChoYXNuJ3QgYmVlbiBhbmQgbGlrZWx5IG5ldmVyIHdpbGwgYmUKYSBwcm9ibGVtIGluIHBy
YWN0aWNlKSwgYnV0IEkgdGhpbmsgaXQgd2FzIHN0aWxsIHdvcnRoIGdydW1ibGluZwphYm91dC4g
SSdsbCBsZWF2ZSB0aGF0IHBhcnQgb2Yga21lbSBhbG9uZSBpbiB0aGUgdXBjb21pbmcgc3BsaXQg
b2YKZGF4X2ttZW1fcmVzIHJlbW92YWwuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
