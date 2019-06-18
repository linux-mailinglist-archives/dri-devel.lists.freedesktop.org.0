Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2A94AD87
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 23:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E882E6E25E;
	Tue, 18 Jun 2019 21:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24016E260
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 21:47:00 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p26so23900578edr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 14:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=LZrn7Rr8zleiGvdxF1w3tKSgpu14wo0qoDaXcva9cvY=;
 b=Q6LJfYA0mgyGwxUPK99wu+JZraWOoL2zCDAiWh1LK5OagngxOeDuvIAi/Gfpgzeqm2
 1jHOv2hQce2UOOWpDFMYDq5VIGQ3RcDEEVd3jV17FNtLwHgXW2OWhFt+6KtQk1mJ9Qod
 VoCX58JOvkSnSNjq4l4MyuG+fPlvuMiL+xGES8IGhDK+9osSIDhD4JmZvZHB1pgvpnHL
 /lqJ+Q0/ctH6NmewT+Wff4Dj5wyA4H+W8fcPefq9djYPkOm+5Cx+fINyhZS1Ucdk+u7G
 YvW91L+SSGrYTC71JbQOpewFK58m/NkiXAatAqWsFjYG8PKDqVrbx65myjnN2lbGXdvp
 TCqQ==
X-Gm-Message-State: APjAAAWpfvr5JIa/LbxvZLpOPZS6+9sLTLu8m4wNXEhagTfZYpaupDxa
 c+LPBMkeJDprMaV14VxihBG7xA==
X-Google-Smtp-Source: APXvYqwJvQ6v8diODmfivubZ8dOtPtpsb20XW5926nxdAIASSUgh96jzAqpn/te9CMxx45doYfrhew==
X-Received: by 2002:a50:8dc5:: with SMTP id s5mr128399509edh.138.1560894419613; 
 Tue, 18 Jun 2019 14:46:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id h23sm869911edh.40.2019.06.18.14.46.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 14:46:58 -0700 (PDT)
Date: Tue, 18 Jun 2019 23:46:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: drm connectors, tegra, and the web they weave (was Re: [PATCH
 58/59] drm/todo: Add new debugfs todo)
Message-ID: <20190618214656.GH12905@phenom.ffwll.local>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-59-daniel.vetter@ffwll.ch>
 <20190618151938.GA2567@kroah.com> <20190618152530.GA4576@kroah.com>
 <CAKMK7uEd0sZ81RMjDsz6cnkW+krPuvoqUcEY4U3ofB9W_qeFvA@mail.gmail.com>
 <20190618180113.GA26105@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618180113.GA26105@kroah.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LZrn7Rr8zleiGvdxF1w3tKSgpu14wo0qoDaXcva9cvY=;
 b=cENkHwfGotPGYAS9ExYWo2joZg+slq8McfhA3rkxAqOPj0ksLNdOTNAxpl5enwcP5V
 3cnJt6nTzVQlDqo6fcl2fBjx9ljMJMj4YNEIQPrgWbv4nTRjx9ehHycRkMOP1QVqOA4g
 P3SyvrpeP4wyJz7wm+YeVuo6sw8Bmlz8VH4z0=
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDg6MDE6MTNQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDE4LCAyMDE5IGF0IDA3OjMyOjIwUE0gKzAyMDAsIERh
bmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biAxOCwgMjAxOSBhdCA1OjI1IFBNIEdy
ZWcgS3JvYWgtSGFydG1hbgo+ID4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToK
PiA+ID4gT24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDU6MTk6MzhQTSArMDIwMCwgR3JlZyBLcm9h
aC1IYXJ0bWFuIHdyb3RlOgo+ID4gPiA+IEkgY291bGQganVzdCAib3BlbiBjb2RlIiBhIGJ1bmNo
IG9mIGNhbGxzIHRvIGRlYnVnZnNfY3JlYXRlX2ZpbGUoKSBmb3IKPiA+ID4gPiB0aGVzZSBkcml2
ZXJzLCB3aGljaCB3b3VsZCBzb2x2ZSB0aGlzIGlzc3VlLCBidXQgaW4gYSBtb3JlICJub24tZHJt
Igo+ID4gPiA+IHdheS4gIElzIGl0IHdvcnRoIHRvIGp1c3QgZG8gdGhhdCBpbnN0ZWFkIG9mIG92
ZXJ0aGlua2luZyB0aGUgd2hvbGUKPiA+ID4gPiB0aGluZyBhbmQgdHJ5aW5nIHRvIHNxdWlzaCBp
dCBpbnRvIHRoZSBkcm0gIm1vZGVsIiBvZiBkcm0gZGVidWdmcyBjYWxscz8KPiA+ID4KPiA+ID4g
QW4gZXhhbXBsZSBvZiAib3BlbiBjb2RpbmciIHRoaXMgaXMgdGhlIHBhdGNoIGJlbG93IGZvciB0
aGUgc29yLmMKPiA+ID4gZHJpdmVyLgo+ID4gCj4gPiBJIHRoaW5rIG9wZW4tY29kaW5nIGlzIHRo
ZSB3YXkgdG8gZ28gaGVyZS4gT25lIG9mIHRoZSB0b2RvcyBpcyB0bwo+ID4gZXh0ZW5kIGRlYnVn
ZnMgc3VwcG9ydCBmb3IgY3J0Yy9jb25uZWN0b3JzLCBidXQgbG9va2luZyBhdCB0aGUKPiA+IG9w
ZW4tY29kZWQgdmVyc2lvbiB3ZSByZWFsbHkgZG9uJ3QgbmVlZCBhIGRybS1mbGF2b3VyZWQgbWlk
bGF5ZXIgaGVyZS4KPiAKPiBUaGVyZSBhbHJlYWR5IGlzIGRlYnVnZnMgc3VwcG9ydCBpbiB0aGUg
Y29kZSBmb3IgY3J0Yy9jb25uZWN0b3JzLCB0aGVzZQo+IGZpbGVzIGFyZSAiaGFuZ2luZyIgb2Zm
IG9mIHRob3NlIGxvY2F0aW9ucyBhbHJlYWR5LiAgSSdsbCBrZWVwIHRoYXQsIGJ1dAo+IGluZGVu
dCBpdCBvbmUgbW9yZSBkaXJlY3Rvcnkgc28gdGhhdCB0aGVyZSdzIG5vIG5hbWVzcGFjZSBjb2xs
aXNpb25zLgoKVGhlIHRvZG8gd2FzIHRvIGhhdmUgc29tZSBkcm0gd3JhcHBlcnMgaGVyZSBmb3Ig
dGhlIGJvaWxlcnBsYXRlLCBidXQgYWZ0ZXIKbG9va2luZyBhdCB5b3VyIHZlcnNpb24gdGhhdCdz
IG5vdCBhIGdvb2QgaWRlYS4gU28gbm90IGp1c3QgbWFraW5nIHN1cmUKY3J0Y3MvY29ubmVjdG9y
cyBoYXZlIGEgZGVidWdmcyBkaXJlY3RvcnkgbWFkZSBmb3IgdGhlbSwgYnV0IG1vcmUuCgpXcnQg
YWRkaW5nIGEgbmV3IGRpcmVjdG9yeTogZGVidWdmcyBpc250IHVhcGksIGJ1dCB0aGVyZSdzIHVz
dWFsbHkgYQptYXNzaXZlIHBpbGUgb2Ygc2NyaXB0IHJlbHlpbmcgb24gdGhlbSwgc28gaXQncyBu
b3QgbmljZSB0byBzaHVmZmxlIHBhdGhzCmFyb3VuZC4gUGx1cyB0aGUgbGlmZXRpbWVzIG1hdGNo
IGFueXdheSAoYXQgbGVhc3QgaWYgeW91IGRvbid0IGhvdHBsdWcKY29ubmVjdG9ycywgd2hpY2gg
dGVncmEgZG9lc24ndCBkbykuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
