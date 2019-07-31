Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFB37C57E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 17:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793E589E8C;
	Wed, 31 Jul 2019 15:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF8189E8C
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 15:05:39 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id i11so2516242edq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 08:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=spQ2scKq4YIapn3+o1kUSOETPqQf/yqxlPLXfevLOOE=;
 b=epFieUfZASKjnuH+YK0XBBnjigmrr7Yu6ioYAXmiUUbDWWABjTWlf5ERDuh9xB6W66
 SVTBwT6arCmuiJy2XaERlm0DlSzjN6RMenLGyTuU929GHAQppb3tgG6IukhLTrhX20On
 1JVpEQvZjwNGRuW8iwTV+mAKW9kRUsl8D+O1l9i4ZJklXiJHTQRO/lDkQUWDMkPdBR7l
 jXasMb4GiB17ohN72SKyZNq7FiFQHwdL8qtFhvXE5T4HodbJ5Fk8i6C7rBIBIohJNKUj
 pTL4fbDpqjXUduPyu8rUBgq4/at/gcyvOijA65dpt0pBfmA37eUV0ple3uPxHfJ4b1b3
 aVNw==
X-Gm-Message-State: APjAAAVCutlZ1op52qCrra8YUJszalERx59gpOwx4hGU6qMn9Ri5Ee7Y
 4Tf+TH4fhqDDis6T/bmtuUc=
X-Google-Smtp-Source: APXvYqyieSt64tfwNFBkIyq5Jy3hQwTlpiHC8C/ybPztXy01O0BoHzJ1UwZa8R1f7GyIJuYR5Arkqg==
X-Received: by 2002:a17:906:8386:: with SMTP id
 p6mr93849049ejx.139.1564585538459; 
 Wed, 31 Jul 2019 08:05:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id e24sm9228746ejb.53.2019.07.31.08.05.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 08:05:37 -0700 (PDT)
Date: Wed, 31 Jul 2019 17:05:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] drm/i810: Use CONFIG_PREEMPTION
Message-ID: <20190731150535.GJ7444@phenom.ffwll.local>
References: <alpine.DEB.2.21.1907262223280.1791@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1907262223280.1791@nanos.tec.linutronix.de>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=spQ2scKq4YIapn3+o1kUSOETPqQf/yqxlPLXfevLOOE=;
 b=k1v4LNBrbQzzS/X0wKxRHRIJuBsQPSJViwg+QeU57N2qE46UWZ3a61rg7prx3tAabY
 YsWmNimYUsoMmhhZlYRalbtOZB+XX+BKRdEZNLGo+BOB0XpV26a0Qn4u1YGoOlS/dCSa
 2+AooQGyEpWkcXyFJ9j7ghmNztGpZSqgC6AIY=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMTA6MjU6MjBQTSArMDIwMCwgVGhvbWFzIEdsZWl4bmVy
IHdyb3RlOgo+IENPTkZJR19QUkVFTVBUSU9OIGlzIHNlbGVjdGVkIGJ5IENPTkZJR19QUkVFTVBU
IGFuZCBieQo+IENPTkZJR19QUkVFTVBUX1JULiBCb3RoIFBSRUVNUFQgYW5kIFBSRUVNUFRfUlQg
cmVxdWlyZSB0aGUgc2FtZQo+IGZ1bmN0aW9uYWxpdHkgd2hpY2ggdG9kYXkgZGVwZW5kcyBvbiBD
T05GSUdfUFJFRU1QVC4KPiAKPiBDaGFuZ2UgdGhlIEtjb25maWcgZGVwZW5kZW5jeSBvZiBpODEw
IHRvICFDT05GSUdfUFJFRU1QVElPTiBzbyB0aGUgZHJpdmVyCj4gaXMgbm90IGFjY2lkZW50YWxs
eSBidWlsdCBvbiBhIFJUIGtlcm5lbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgR2xlaXhu
ZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KClF1ZXVlZCB1cCwgc2hvdWxkIGxhbmQgaW4gLXJj
MyBvciBzby4KClRoYW5rcywgRGFuaWVsCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZp
ZyB8ICAgIDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vS2NvbmZpZwo+IEBAIC0zOTQsNyArMzk0LDcgQEAgY29uZmlnIERSTV9SMTI4Cj4gIGNv
bmZpZyBEUk1fSTgxMAo+ICAJdHJpc3RhdGUgIkludGVsIEk4MTAiCj4gIAkjICFQUkVFTVBUIGJl
Y2F1c2Ugb2YgbWlzc2luZyBpb2N0bCBsb2NraW5nCj4gLQlkZXBlbmRzIG9uIERSTSAmJiBBR1Ag
JiYgQUdQX0lOVEVMICYmICghUFJFRU1QVCB8fCBCUk9LRU4pCj4gKwlkZXBlbmRzIG9uIERSTSAm
JiBBR1AgJiYgQUdQX0lOVEVMICYmICghUFJFRU1QVElPTiB8fCBCUk9LRU4pCj4gIAloZWxwCj4g
IAkgIENob29zZSB0aGlzIG9wdGlvbiBpZiB5b3UgaGF2ZSBhbiBJbnRlbCBJODEwIGdyYXBoaWNz
IGNhcmQuICBJZiBNIGlzCj4gIAkgIHNlbGVjdGVkLCB0aGUgbW9kdWxlIHdpbGwgYmUgY2FsbGVk
IGk4MTAuICBBR1Agc3VwcG9ydCBpcyByZXF1aXJlZAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
