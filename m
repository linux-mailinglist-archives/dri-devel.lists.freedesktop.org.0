Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B13A9216D56
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 14:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CDC89A98;
	Tue,  7 Jul 2020 12:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EBD89A98
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 12:59:45 +0000 (UTC)
Date: Tue, 07 Jul 2020 12:59:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1594126782;
 bh=QnZ9g4IQrdr1nA4NfZrlA2W+caNaeORiZ92aeny5RlQ=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=v7HCVx1HeT/uz3jgEMHAV+/Lut5E6MwXNO0+nXf8nQOrlwupLRelhhUkYq2e9t6Iq
 MmQXhKNOXihlX/DAUC+0b7QdBwGvjsJZICg6YJfq2XUZsWyqVk8PPPdQUvCxK0IpOC
 TaP4IgknCT/6BVlUzGkYJbvJI9wKxtG/7sXg/rso=
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v5] drm/doc: device hot-unplug for userspace
Message-ID: <fk1MVnoF7i7vl_T0JPaNfWbm4FclQPs1YDxpSMns1mjRPQOQuQktXcNpOx91EK2HC4xGfUyTapJr2vPuaHz0ypTUcBZS_Qdm8uOE6LCXIGw=@emersion.fr>
In-Reply-To: <20200707113805.30936-1-ppaalanen@gmail.com>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <20200707113805.30936-1-ppaalanen@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Karol Herbst <kherbst@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <skeggsb@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgSnVseSA3LCAyMDIwIDE6MzggUE0sIFBla2thIFBhYWxhbmVuIDxwcGFhbGFu
ZW5AZ21haWwuY29tPiB3cm90ZToKCj4gRnJvbTogUGVra2EgUGFhbGFuZW4gcGVra2EucGFhbGFu
ZW5AY29sbGFib3JhLmNvbQo+Cj4gU2V0IHVwIHRoZSBleHBlY3RhdGlvbnMgb24gaG93IGhvdC11
bnBsdWdnaW5nIGEgRFJNIGRldmljZSBzaG91bGQgbG9vayBsaWtlIHRvCj4gdXNlcnNwYWNlLgo+
Cj4gV3JpdHRlbiBieSBEYW5pZWwgVmV0dGVyJ3MgcmVxdWVzdCBhbmQgbGFyZ2VseSBiYXNlZCBv
biBoaXMgY29tbWVudHMgaW4gSVJDIGFuZAo+IGZyb20gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMjAtTWF5LzI2NTQ4NC5odG1sIC4KPgo+IEEgcmVs
YXRlZCBXYXlsYW5kIHByb3RvY29sIGNoYW5nZSBwcm9wb3NhbCBpcyBhdAo+IGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy93YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzLy0vbWVyZ2VfcmVx
dWVzdHMvMzUKPgo+IFNpZ25lZC1vZmYtYnk6IFBla2thIFBhYWxhbmVuIHBla2thLnBhYWxhbmVu
QGNvbGxhYm9yYS5jb20KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciBkYW5pZWwudmV0dGVy
QGZmd2xsLmNoCj4gUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciBhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tCj4gQWNrZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyBub3JhbGZAdHJvbm5lcy5vcmcKPiBD
YzogQW5kcmV5IEdyb2R6b3Zza3kgYW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbQo+IENjOiBEYXZl
IEFpcmxpZSBhaXJsaWVkQHJlZGhhdC5jb20KPiBDYzogU2VhbiBQYXVsIHNlYW5AcG9vcmx5LnJ1
bgo+IENjOiBTaW1vbiBTZXIgY29udGFjdEBlbWVyc2lvbi5mcgo+IENjOiBCZW4gU2tlZ2dzIHNr
ZWdnc2JAZ21haWwuY29tCj4gQ2M6IEthcm9sIEhlcmJzdCBraGVyYnN0QHJlZGhhdC5jb20KCkZy
b20gYSB1c2VyLXNwYWNlIHBvaW50LW9mLXZpZXcsIHRoaXMgc291bmRzIGZpbmUuCgpBY2tlZC1i
eTogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPgoKVGhhbmtzIQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
