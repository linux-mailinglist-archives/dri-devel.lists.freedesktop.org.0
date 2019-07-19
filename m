Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A4C6E388
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 11:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5F56E7EA;
	Fri, 19 Jul 2019 09:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591BA6E7EC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 09:36:24 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id v15so33924930eds.9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 02:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=59Z1upMDs/xaR5JtxbV46RgLxl7CNaASSsQMFoVcYuE=;
 b=dPeglSVZOJ0OIP17ZC+/zNEfIHcvPOESp7SUA40gD6Fz84tCQf7QEewPXyYBtXmkrV
 eM3t/ODxuYHBPap1MGFV3K2EeiKWWzfUhX40HuOew3jjAEOkql4aVRLB56H3Q3azH4Xl
 aph63nezW95IBLEu5keGqMuk7u1Etb7xu8S0cDF+8ZmCexn4dN1UJO1NjnVaIWk4j6r4
 b16C5EtIAWw5sZpNFvACuscsQ5Yjp6iNdcYvby8mNlHRD3nKNzVLUmVyF1WKz86SDWQm
 sLyTg0RklR2gfuTCpksDtqoBJjKzROjH4FPmKHKRYnK6x48esvBAYPXvSUyHDtZI5/a6
 8oVA==
X-Gm-Message-State: APjAAAVGbTqkNtgEPGRTtqAQeZrpRMnvpRzC3k6V6nAxKgV0pJXznekP
 RqlshHBtlefDRIFwwrKXZOM=
X-Google-Smtp-Source: APXvYqx6reMxtKS9ddW2PHpj1N+c3sau4XbINWhPv2X2psQfBvN3pwUfxk1DI8L0GOhbMjBb2/qLDg==
X-Received: by 2002:a50:b60a:: with SMTP id b10mr45424262ede.113.1563528983045; 
 Fri, 19 Jul 2019 02:36:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id f21sm8362135edj.36.2019.07.19.02.36.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 02:36:22 -0700 (PDT)
Date: Fri, 19 Jul 2019 11:36:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH/RFT v1 0/6] drm/via: drop use of deprecated headers
 drmP.h and drm_os_linux.h
Message-ID: <20190719093619.GL15868@phenom.ffwll.local>
References: <20190718153737.28657-1-sam@ravnborg.org>
 <20190719060712.GA26070@ravnborg.org>
 <e2a3b772-96e7-0fed-d269-bb103057cafe@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2a3b772-96e7-0fed-d269-bb103057cafe@daenzer.net>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=59Z1upMDs/xaR5JtxbV46RgLxl7CNaASSsQMFoVcYuE=;
 b=b7ECauZQYIDj6jhhopDq7Jtz1YLgwsGubHT5RrmoyQmXZFRpjbwGKHlQdbH/odfNpo
 4c55wTavrmrqeiJz5cHSBuzLjvgj2TYyWxuZfuOIXF03hoOu4y+f6bQvpPqIRe1DS0HA
 Pi0Oid5hE969ed6bEkK3jzENqKp9oITVC6nl0=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Ira Weiny <ira.weiny@intel.com>,
 Kevin Brace <kevinbrace@gmx.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, openchrome-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 dri-devel@lists.freedesktop.org, Mike Marshall <hubcap@omnibond.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMTE6MDU6NDRBTSArMDIwMCwgTWljaGVsIETDpG56ZXIg
d3JvdGU6Cj4gT24gMjAxOS0wNy0xOSA4OjA3IGEubS4sIFNhbSBSYXZuYm9yZyB3cm90ZToKPiA+
IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDA1OjM3OjMxUE0gKzAyMDAsIFNhbSBSYXZuYm9yZyB3
cm90ZToKPiA+PiBUaGlzIGlzIHNvbWUgamFuaXRvcmlhbCB1cGRhdGVzIHRvIHRoZSB2aWEgZHJp
dmVyCj4gPj4gdGhhdCBpcyByZXF1aXJlZCB0byBnZXQgcmlkIG9mIGRlcHJlY2F0ZWQgaGVhZGVy
cwo+ID4+IGluIHRoZSBkcm0gc3Vic3lzdGVtLgo+ID4+Cj4gPj4gVGhlIGZpcnN0IHRocmVlIHBh
dGNoZXMgYXJlIHRyaXZpYWwsIHdoZXJlCj4gPj4gdGhlIGRlcGVuZGVuY2llcyBvbiBkcm1QLmgg
YW5kIGRybV9vc19saW51eCBhcmUgZHJvcHBlZC4KPiA+Pgo+ID4+IFRoZSByZW1haW5pbmcgdGhy
ZWUgcGF0Y2hlcyBkcm9wIHVzZSBvZiBEUk1fV0FJVF9PTigpLgo+ID4+IFRoZXkgYXJlIHJlcGxh
Y2VkIGJ5IHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZV90aW1lb3V0KCkuCj4gPj4gVGhlc2UgcGF0
Y2hlcyBjb3VsZCB1c2UgYSBtb3JlIGNyaXRpY2FsIHJldmlldy4KPiA+IAo+ID4gVGhlIGRpZmZl
cmVuY2VzIGJldHdlZW4gRFJNX1dBSVRfT04oKSBhbmQKPiA+IHdhaXRfZXZlbnRfaW50ZXJydXB0
aWJsZV90aW1lb3V0KCkgYXJlIGJpZ2dlciB0aGFuIGFudGljaXBhdGVkLgo+ID4gCj4gPiBUaGUg
Y29udmVyc2lvbiBJIGRpZCBmb3IgZHJtX3ZibGFuay5jIGlzIGJvZ3VzIHRodXMgSSBleHBlY3QK
PiA+IHRoZSBjb252ZXJzaW9uIGRvbmUgZm9yIHZpYSBpcyBhbHNvIGJvZ3VzLgo+IAo+IFdoYXQg
ZXhhY3RseSBpcyB0aGUgcHJvYmxlbSB0aG91Z2g/IENhbiB5b3Ugc2hhcmUgaW5mb3JtYXRpb24g
YWJvdXQgdGhlCj4gZmFpbHVyZXMgeW91J3JlIHNlZWluZz8KPiAKPiBUaGVyZSB3YXMgc29tZSBk
aXNjdXNzaW9uIGFib3V0IERSTV9XQUlUX09OKCkgInBvbGxpbmciIG9uIElSQy4gSSBhc3N1bWUK
PiB0aGF0IHJlZmVycyB0byBpdCBvbmx5IHNsZWVwaW5nIGZvciB1cCB0byAwLjAxcyBiZWZvcmUg
Y2hlY2tpbmcgdGhlCj4gY29uZGl0aW9uIGFnYWluLiBJbiBjb250cmFzdCwgd2FpdF9ldmVudF9p
bnRlcnJ1cHRpYmxlX3RpbWVvdXQoKSBjaGVja3MKPiB0aGUgY29uZGl0aW9uIG9uY2UsIHRoZW4g
c2xlZXBzIHVwIHRvIHRoZSBmdWxsIHRpbWVvdXQgYmVmb3JlIGNoZWNraW5nCj4gaXQgYWdhaW4u
Cj4gCj4gSWYgdGhhdCBtYWtlcyBhIGRpZmZlcmVuY2UgZm9yIGRybV93YWl0X3ZibGFua19pb2N0
bCwgaXQgaW5kaWNhdGVzIHRoYXQKPiBzb21lIG90aGVyIGNvZGUgd2hpY2ggdXBkYXRlcyB0aGUg
dmJsYW5rIGNvdW50IG9yIGNsZWFycyB2YmxhbmstPmVuYWJsZWQKPiBkb2Vzbid0IHdha2UgdXAg
dGhlIHZibGFuay0+cXVldWUuCgpUaGUgcmV0dXJuIHZhbHVlcyBkaWZmZXIsIGxhdGVzdCBwYXRj
aCBmcm9tIFNhbSBwYXNzZXMgQ0k6CgpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
cGF0Y2gvMzE4OTA5LwoKSSBoYXZlIHZhZ3VlIG1lbW9yaWVzIGZyb20gZXhhY3RseSB0aGlzIGZ1
biB3aGVuIEkgcmlwcGVkIG91dCBEUk1fV0FJVF9PTgpmcm9tIGk5MTUuCi1EYW5pZWwKLS0gCkRh
bmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9i
bG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
