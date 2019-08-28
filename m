Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0976A05CC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 17:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF73D89D4B;
	Wed, 28 Aug 2019 15:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A2389D4B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 15:12:25 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id n4so1645375pgv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=XcJ6NYlg/uL9WmWriXAoX9eMie6Q9zQs2ri3z33W8Do=;
 b=W7shjLB8RF5pLebVmXq/lwlSINylkzyfXFhgvPrHFmdCcV04PO5iRXQbVTQja56d5/
 9OiP297UDGvJAElMPF9h2ET3f42tw/XeaJA46jwDmQJAO0eez9F+7tc4IlbTIsRStrSY
 yvKqAxjJPim6a+Z4Mz1o/n0GZ2HRQRoEPC8dzi8Vtbm1NRtP/KZpPs1XpkjxxLmavedf
 uOiVFDJuw2esPCH97P8fF8/+lTxPPTfKsujZQRwmqlR34aOd4aHi5JQXBHSwU9/VRF2+
 6wXFPde5Xs0cGYmlFzBh6C2XvWLsOsD4lk71yxmxmNhXLMtFhncV7sJYWuMzCXYjyAfQ
 G5xw==
X-Gm-Message-State: APjAAAV067GI6CJGwqvThywwX+W0FQZsdIRYexZG7lsH0okWnUedh1dt
 i7p4LC2WZXGYu6VIsWi3DSVCeg==
X-Google-Smtp-Source: APXvYqz97Mimt+J42SvRSibm4RDZVnMCd5grLb1uXWfEqZeh5eyLN9Msos0FMr0J7qZbOn21/oz1ow==
X-Received: by 2002:a63:2b84:: with SMTP id r126mr3994757pgr.308.1567005144906; 
 Wed, 28 Aug 2019 08:12:24 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:cc35:e750:308e:47f])
 by smtp.gmail.com with ESMTPSA id l31sm6950443pgm.63.2019.08.28.08.12.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 28 Aug 2019 08:12:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/2] drm/meson: add resume/suspend hooks
In-Reply-To: <b8ea00c4-3749-e571-edb6-ae5091b23247@baylibre.com>
References: <20190827095825.21015-1-narmstrong@baylibre.com>
 <7h5zmixvrz.fsf@baylibre.com>
 <b8ea00c4-3749-e571-edb6-ae5091b23247@baylibre.com>
Date: Wed, 28 Aug 2019 08:12:22 -0700
Message-ID: <7htva1s4rt.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=XcJ6NYlg/uL9WmWriXAoX9eMie6Q9zQs2ri3z33W8Do=;
 b=B2+UPSog7z8YLILm6YZplhJNxIH5DioVNm5Whk2+ecAMQWfM0n77Oz3Ge9I8H/Vpti
 z6bzqGN+baAi0yG18A2r5n2QkdsN3rtnXK/XfCMIizgEIY1jHvCBz01TICGm4RMM78OP
 xKiIL4fyqd73KHRwzu9Eo2PqQvL5qbVvdv/hI8g0PfQuP5jlQg3l4juQvANmy6I/MKXU
 uDQh9BAq/H88QsdenOLMwPYExjsjktzeUbybwynwBrdnzSmr8LimKn/fFKjG89VIAZb3
 g/pB+GdmD9Z0iurJEiuMYQXq/MYUV6eU20W+ajDVpS0S5SBMVuTNd1VlmB99/FSmiEKX
 cXvg==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cgo+IE9uIDI3
LzA4LzIwMTkgMjE6MTcsIEtldmluIEhpbG1hbiB3cm90ZToKPj4gTmVpbCBBcm1zdHJvbmcgPG5h
cm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cj4+IAo+Pj4gVGhpcyBzZXJpZSBhZGRzIHRo
ZSByZXN1bWUvc3VzcGVuZCBob29rcyBpbiB0aGUgQW1sb2dpYyBNZXNvbiBWUFUgbWFpbiBkcml2
ZXIKPj4+IGFuZCB0aGUgRFctSERNSSBHbHVlIGRyaXZlciB0byBjb3JyZWN0bHkgc2F2ZSBzdGF0
ZSBhbmQgZGlzYWJsZSBIVyBiZWZvcmUKPj4+IHN1c3BlbmQsIGFuZCBzdWNjZXNmdWxseSByZS1p
bml0IHRoZSBIVyB0byByZWNvdmVyIGZ1bmN0aW9ubmFsIGRpc3BsYXkKPj4+IGFmdGVyIHJlc3Vt
ZS4KPj4+Cj4+PiBUaGlzIHNlcmllIGhhcyBiZWVuIHRlc3RlZCBvbiBBbWxvZ2ljIEcxMkEgYmFz
ZWQgU0VJNTEwIGJvYXJkLCB1c2luZwo+Pj4gdGhlIG5ld2x5IGFjY2VwdGVkIFZSVEMgZHJpdmVy
IGFuZCB0aGUgcnRjd2FrZSB1dGlsaXR5Lgo+PiAKPj4gVGVzdGVkLWJ5OiBLZXZpbiBIaWxtYW4g
PGtoaWxtYW5AYmF5bGlicmUuY29tPgo+PiAKPj4gVGVzdGVkIG9uIG15IEcxMkEgU0VJNTEwIGJv
YXJkLCBhbmQgSSB2ZXJpZmllZCB0aGF0IGl0IGZpeGVzCj4+IHN1c3BlbmQvcmVzdW1lIGlzc3Vl
cyBwcmV2aW91c2x5IHNlZW4uCj4+IAo+PiBLZXZpbgo+PiAKPgo+IFRoYW5rcywKPgo+IEFwcGx5
aW5nIHRvIGRybS1taXNjLW5leHQgKGZvciB2NS41KSwgd2l0aCBhIHR5cG8gZml4IGluIHRoZSBm
aXJzdCBwYXRjaCBjb21taXQgbG9nOgo+IHMvc3VzcGVucy9zdXNwZW5kCgpJcyB0aGVyZSBhbnkg
Y2hhbmNlIG9mIGdldHRpbmcgdGhpcyBpbiBhIGEgZml4IGZvciB2NS40IHNvIHdlIGhhdmUgYQp3
b3JraW5nIHN1c3BlbmQvcmVzdW1lIGluIHY1LjQ/CgpUaGFua3MsCgpLZXZpbgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
