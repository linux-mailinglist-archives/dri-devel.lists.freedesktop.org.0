Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E65F825AB82
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 14:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C4A6E4AE;
	Wed,  2 Sep 2020 12:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C36A6E4AE
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 12:56:24 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a9so4440310wmm.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 05:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PJwOaegz+YPBwd+csZhRIU3z4t7+mLX2KzxOnpSFwNE=;
 b=eqj9zybtYEuxdj7kIHzMvBikV7fv/URLolA99YF6hJijFUYPHjM1TIWxn9dNR/L7vg
 HLCDs+Rk9FG6zo5LKwUQAEZZYZ2HjBVVE5Zp+sqChnRbpZZr8dXzytv0NuFcJEdErd99
 76HUn3cYkSudqsLiuIHC6Y7fHVAiylMUXY36etSCAg2M5Zw8218LyhiEtBxAWknLFivJ
 4u3zucst0vmIXmOot7x9u+5KZIaDJlIcR2zeVlOP+BvsAC6RnxJpwX8gNOQbXGcNW9Z4
 0NrEWQc3gf6z+S4QYCHrzcx092/zN4S+RoQSGVzQyzC5yOZXMWmZkWSPbaGZF1bzZkiz
 KXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PJwOaegz+YPBwd+csZhRIU3z4t7+mLX2KzxOnpSFwNE=;
 b=BmnTZK80YnY0CyQd4NSezDYCrSQzPJFBVfZFmETVyTNg6sjQYLBuJYXkBhbwtDzvf/
 EKhefTVcKvFkyFTWzgN9sllk1cUF0VR+bT873kjkXzPsouvONBCSydUU6yltBKXl4uGU
 pD57Ysedi1FuGR564gIkt5LZK/J2IeEALf40W/T7RnZfbTdN4LkMo3OvPfCGbRK2x1ZF
 Lt4d2dE+B7rB9Krfnz4tX43AgGIc4JNxM6yfQ8NyeORvZRimq+csUgTJp7y7BbrSR7RX
 9qaQdCRpPAn3k+PBOaLyWlB6PNF92kPhj4tGpWz8HK0ZIUkrVfve6OVCgZtdXlXu36lk
 H53Q==
X-Gm-Message-State: AOAM533I8uAvqIPdzs0VBrCpHXVkOljO/7sD0BLJeixdy55aQCO9kCv+
 /urFzZuXLkGTFNkhyfFu4wEZ//cApddVKIBTwcrWcg==
X-Google-Smtp-Source: ABdhPJybydQkH9Wn43UYtx5Qc6GHJ3Ze/qe6QSdQf3Andh3ckScTQSwaNyYkVbXRN24RtRj44AFBKntCfl89f/egDGM=
X-Received: by 2002:a1c:96:: with SMTP id 144mr560346wma.84.1599051382718;
 Wed, 02 Sep 2020 05:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200902102440.3621733-1-daniel.vetter@ffwll.ch>
 <t3hHLqZ0yNm5FdxpyJovgjEVzs-OD7qD5nYrYXug8UhkBykhekB0_hOqPltEvFH3daJ3HYtY_3FInv3U5xIHprg1FS7b2SP8fCf48r7DvVg=@emersion.fr>
 <CAKMK7uFztTjjvQvM-toeZv3hps+NMJFXV7s=Dzs5PwG3J+7wjw@mail.gmail.com>
 <ap5W_r98yx5DpM1jFkrof6yWGWPtxbyObFp3iIP1-hm-SD_-Jij72KZK2VhVV2p-34EqdVE6T1JeW4zAgjnNsxv_CtULfvg2ASY3xECXMuY=@emersion.fr>
In-Reply-To: <ap5W_r98yx5DpM1jFkrof6yWGWPtxbyObFp3iIP1-hm-SD_-Jij72KZK2VhVV2p-34EqdVE6T1JeW4zAgjnNsxv_CtULfvg2ASY3xECXMuY=@emersion.fr>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 2 Sep 2020 13:56:11 +0100
Message-ID: <CAPj87rPu3eODU6AYU7SS_RAn8TC85iym4ZV6+SAjtKsojukTAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/doc: Document that modifiers are always required for
 fb
To: Simon Ser <contact@emersion.fr>
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
Cc: Daniel Stone <daniels@collabora.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Juston Li <juston.li@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyIFNlcCAyMDIwIGF0IDEzOjQ5LCBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24u
ZnI+IHdyb3RlOgo+IE9uIFdlZG5lc2RheSwgU2VwdGVtYmVyIDIsIDIwMjAgMjo0NCBQTSwgRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4gd3JvdGU6Cj4gPiBJIGRvbid0IHRo
aW5rIHRoYXQgaGFwcGVucywgYnV0IGl0IGhhcyBjb21lIHVwIGluIGRpc2N1c3Npb25zLiBJdCdz
Cj4gPiBraW5kYSBkaWZmZXJlbnQgc2NlbmFyaW8gdGhvdWdoOiBnZXRmYjIgaXMgZm9yIGNyb3Nz
LWNvbXBvc2l0b3Igc3R1ZmYsCj4gPiBlbmFibGluZyBzbW9vdGggdHJhbnNpdGlvbnMgYXQgYm9v
dC11cCBhbmQgd2hlbiBzd2l0Y2hpbmcuIFNvIHlvdSBoYXZlCj4gPiBhIGxlZ2l0IHJlYXNvbiBm
b3IgbWl4aW5nIG1vZGlmaWVyLWF3YXJlIHVzZXJzcGFjZSB3aXRoCj4gPiBub24tbW9kaWZpZXIt
YXdhcmUgdXNlcnNwYWNlLiBBbmQgdGhlIG1vZGlmaWVyLWF3YXJlIHVzZXJzcGFjZSB3b3VsZAo+
ID4gbGlrZSB0aGF0IGV2ZXJ5dGhpbmcgd29ya3Mgd2l0aCBtb2RpZmllcnMgY29uc2lzdGVudGx5
LCBpbmNsdWRpbmcKPiA+IGdldGZiMi4gQnV0IGdibSBpcyBqdXN0IHdpdGhpbiBhIHNpbmdsZSBw
cm9jZXNzLCBhbmQgdGhhdCBzaG91bGQKPiA+IGVpdGhlciBydW4gYWxsIHdpdGggbW9kaWZpZXJz
LCBvciBub3QgYXQgYWxsLCBzaW5jZSB0aGVzZSB3b3JsZHMganVzdAo+ID4gZG9udCBtaXggd2Vs
bC4gSGVuY2UgSSdtIG5vdCBzZWVpbmcgbXVjaCB1c2UgZm9yIHRoYXQsIC1tb2Rlc2V0dGluZwo+
ID4gYmVpbmcgYSBjb25mdXNlZCBtZXNzIG5vbndpdGhzdGFuZGluZyA6LSkKPgo+IFdlbGzigKYg
VGhlcmUncyBhbHNvIHRoZSBjYXNlIHdoZXJlIHNvbWUgbGVnYWN5IFdheWxhbmQgY2xpZW50IHRh
bGtzIHRvIGEKPiBtb2RpZmllci1hd2FyZSBjb21wb3NpdG9yLiBnYm1fYm9faW1wb3J0IHdvdWxk
IGJlIGNhbGxlZCB3aXRob3V0IGEKPiBtb2RpZmllciwgYnV0IHRoZSBjb21wb3NpdG9yIGV4cGVj
dHMgZ2JtX2JvX2dldF9tb2RpZmllciB0byB3b3JrLgo+Cj4gQWxzbywgd2xyb290cyB3aWxsIGNh
bGwgZ2JtX2JvX2NyZWF0ZSB3aXRob3V0IGEgbW9kaWZpZXIgdG8gb25seSBsZXQKPiB0aGUgZHJp
dmVyIHBpY2sgInNhZmUiIG1vZGlmaWVycyBpbiBjYXNlIHBhc3NpbmcgdGhlIGZ1bGwgbGlzdCBv
Zgo+IG1vZGlmaWVycyByZXN1bHRzIGluIGEgYmxhY2sgc2NyZWVuLiBMYXRlciBvbiB3bHJvb3Rz
IHdpbGwgY2FsbAo+IGdibV9ib19nZXRfbW9kaWZpZXIgdG8gZmlndXJlIG91dCB3aGF0IG1vZGlm
aWVyIHRoZSBkcml2ZXIgcGlja2VkLgoKSSB0aGluayB0aG9zZSBhcmUgcmVhc29uYWJsZSBleHBl
Y3RhdGlvbnMgdG8gaGF2ZSwgZXZlbiB0aG91Z2gKYXJndWFibHkgZm9yIGNvbnNpc3RlbmN5IHdl
IHNob3VsZCBhbHdheXMgaGF2ZSBhIGZpeGVkIElOVkFMSUQgZm9yCndoZW4gYSBtb2RpZmllciBp
c24ndCB1c2VkLgoKQW55d2F5LCBwYXRjaCBpczoKQWNrZWQtYnk6IERhbmllbCBTdG9uZSA8ZGFu
aWVsc0Bjb2xsYWJvcmEuY29tPgoKVGhhbmtzIGZvciB0eXBpbmcgdGhpcyB1cCEKCkNoZWVycywK
RGFuaWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
