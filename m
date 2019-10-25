Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A94E45DC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 10:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F8789C96;
	Fri, 25 Oct 2019 08:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F88389C96
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 08:38:12 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id v138so1038128oif.6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 01:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pBYnmLdS4ItVVuZxMTA5TR1RAigQ3eRUfNM3jlzVOjE=;
 b=txB/BXGoVWurF7NuJfIMOoduSmtSdaAUMDNLHzUbVkr9hcw1HubJPo1xO8vqDkghhi
 Z79yiIgXCiWUv6EntD8nmm1oJTaTnrb988DvM6NPCRVLze38rkSjx8b/H+UqKFq63LYv
 qFEVyyZtmCHvt2JIUc+qIAVs2HqD0q7EebqHIaJ0ViC9vEahgPgeO+K7oCEPtrwnX1vO
 I5W4KlIfl31EM4HF9t7V9vAS1kX4bTT9zajOSai0S7PpAKVqtIXiZbZI92dCE0Anr2mK
 kptyHf1fBVa73XzbTwQoch8XuRR8NYG5PcmrKW40uN8fwBzX4eWLRXYkJG9MCXYlXfM6
 Djsg==
X-Gm-Message-State: APjAAAUOEgAIsZaVfstG+KB2qdeGFcAZkstoPc8Pv6PhkjSSJB5tKzVQ
 xqO/ZSyK2skp/1Nfz1JaWQM4rYpDdXnKTJ53C+lJJS9o
X-Google-Smtp-Source: APXvYqw2uvZ5Ui7/u0vn0CO6eKi2o0ZfK2NYaY9GO59mG2TI5+YXWfV+R231ARAojDSIuqbpVPEHzsaXOuVFcrT96rY=
X-Received: by 2002:aca:1b10:: with SMTP id b16mr2049522oib.110.1571992691763; 
 Fri, 25 Oct 2019 01:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <1571984808-4552-1-git-send-email-bhanusreemahesh@gmail.com>
 <20191025073436.GM11828@phenom.ffwll.local>
 <CAB0Mk-OnP1L5RGT6YCLG+SR74NpdJCtTAerWr3Db+viAAOHYxQ@mail.gmail.com>
In-Reply-To: <CAB0Mk-OnP1L5RGT6YCLG+SR74NpdJCtTAerWr3Db+viAAOHYxQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 25 Oct 2019 10:38:00 +0200
Message-ID: <CAKMK7uEHo=Q3ByWeTkOQT==EUimRHbXeMtTPHmzRpcjQSwggYQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/gpu: Fix checkpatch.pl warnings
To: Bhanusree Mahesh <bhanusreemahesh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pBYnmLdS4ItVVuZxMTA5TR1RAigQ3eRUfNM3jlzVOjE=;
 b=hZhMeIEgtiST72ly0q8LMu2gIKEz57oFKErWgUVIrHMl+uTgt2D15ymARhIQgPONxF
 ZedgYw1tMLp5r+PH1R6skXIW+z4ncfMXlGczuTrbkX8gA+lvmViBAJ4niMnpb7P7QTuC
 gC1ospH9bi+lAeAksaa5SmFDtEn6WFKXVPOqY=
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMTA6MjAgQU0gQmhhbnVzcmVlIE1haGVzaAo8YmhhbnVz
cmVlbWFoZXNoQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBTdXJlLiBJIHNoYWxsIHRha2UgY2FyZSBv
ZiBpdCBmcm9tIG5leHQgcGF0Y2hlcy4gU2hhbGwgSSByZXNlbmQgdGhlbQo+IHdpdGggb3V0cmVh
Y2h5IGdyb3VwIGluIGNjPwoKQWxyZWFkeSBhcHBsaWVkIGJvdGgsIGxldCdzIHRvIHRoYXQgZm9y
IHRoZSBuZXh0IHJvdW5kLgotRGFuaWVsCgo+Cj4gVGhhbmtzJnJlZ2FyZHMsCj4gQmhhbnVzcmVl
IFBvbGEuCj4KPiBPbiBGcmksIDI1IE9jdCAyMDE5IGF0IDEzOjA0LCBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgT2N0IDI1LCAyMDE5IGF0IDEx
OjU2OjQ4QU0gKzA1MzAsIEJoYW51c3JlZSB3cm90ZToKPiA+ID4gVGhpcyBwYXRjaCBzZXJpZXMg
Y2xlYXJzIHRoZSBjaGVja3BhdGNoLnBsIHdhcm5pbmdzCj4gPiA+IFtQQVRDSCAxLzJdOkZpeCBN
aXNzaW5nIGJsYW5rIGxpbmUgYWZ0ZXIgZGVjbGFyYXRpb25zCj4gPiA+IFtQQVRDSCAyLzJdOkZp
eCBNZW1vcnkgYmFycmllciB3aXRob3V0IGNvbW1lbnQKPiA+ID4KPiA+ID4gQmhhbnVzcmVlICgy
KToKPiA+ID4gICBkcm0vZ3B1OiBGaXggTWlzc2luZyBibGFuayBsaW5lIGFmdGVyIGRlY2xhcmF0
aW9ucwo+ID4gPiAgIGRybS9ncHU6IEZpeCBNZW1vcnkgYmFycmllciB3aXRob3V0IGNvbW1lbnQg
SXNzdWUKPiA+Cj4gPiBUaGUgdGhyZWFkaW5nIGluIHRoaXMgc3VibWlzc2lvbiBpcyBicm9rZW4g
c29tZWhvdyAuLi4gRGlkIHlvdSBzZW5kIHRoZXNlCj4gPiBwYXRjaGVzIG91dCBpbmRpdmlkdWFs
bHk/IEVpdGhlciBkbyB0aGVtIGFsbCB0b2dldGhlciwgb3IgZG8gaW52aWRpZHVhbAo+ID4gc3Rh
bmQtYWxvbmUgcGF0Y2hlcy4gQWxzbyBmb3IgYW55dGhpbmcgb3V0cmVhY2h5IHBscyBhbHdheXMg
Y2MgdGhlCj4gPiBvdXRyZWFjaHkgbGlzdCB0b28uCj4gPgo+ID4gVGhhbmtzLCBEYW5pZWwKPiA+
Cj4gPiA+Cj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMgfCAxMCArKysrKystLS0t
Cj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+
ID4gPgo+ID4gPiAtLQo+ID4gPiAyLjcuNAo+ID4gPgo+ID4KPiA+IC0tCj4gPiBEYW5pZWwgVmV0
dGVyCj4gPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiA+IGh0dHA6Ly9i
bG9nLmZmd2xsLmNoCgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
