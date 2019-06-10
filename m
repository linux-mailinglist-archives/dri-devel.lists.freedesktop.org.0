Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED7A3B866
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 17:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8378915A;
	Mon, 10 Jun 2019 15:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857C98915A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 15:39:02 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 527782145D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 15:39:02 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id m14so5758887qka.10
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 08:39:02 -0700 (PDT)
X-Gm-Message-State: APjAAAW8RHaEnp1bOS/wbCCb21mXc2Av3da/aWEEfCRurUOsxTNJazmk
 bgBXl4jvsDB8bAFdDVUtwx2K80bcRKz1GfyMGA==
X-Google-Smtp-Source: APXvYqxtJEfJeRvwWEg6MNQXNzIIbLv/Gxxvs+vk6RDEbINaMiaAilnhmqNDT1gk37a1acPPEUw5WPTz61G0WylDaBU=
X-Received: by 2002:a05:620a:13d1:: with SMTP id
 g17mr1603265qkl.121.1560181141516; 
 Mon, 10 Jun 2019 08:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190520092306.27633-1-steven.price@arm.com>
 <20190520092306.27633-3-steven.price@arm.com>
 <CAL_JsqLzefOvopTCuyBsNhJDGbFV3JdVce0x398vMaGy3-+fVw@mail.gmail.com>
 <155846303227.23981.8007374203089408422@skylake-alporthouse-com>
 <a4cd9ada-aaf1-3bd8-a138-f61308baf70c@arm.com>
In-Reply-To: <a4cd9ada-aaf1-3bd8-a138-f61308baf70c@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 10 Jun 2019 09:38:50 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+KpJHgyx017u78+D0HX03NNJuK=fYVES5J1dEpQroeEQ@mail.gmail.com>
Message-ID: <CAL_Jsq+KpJHgyx017u78+D0HX03NNJuK=fYVES5J1dEpQroeEQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/panfrost: Use drm_gem_shmem_map_offset()
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560181142;
 bh=FUq4suVrLDG1IIUGHRa6j68aD+lmlr5m3QrCVHn3MRk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ebj/TmAvxM0eiGfq3QcwS2BkcymUD0stm2bTsz0n8ZOJRWDPyP5QsRds40ChtEZ2C
 4GnECJUzxfGHbm1yTUV6Am58NDs+mdLh34UCBUw+mhOLnFulQUc7uq+GZ8sgN5IQOh
 soytCp1XBOaDXaWt+KSm3yFKcFGhOOL6ITbKtjTY=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgNjozOSBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIDIxLzA1LzIwMTkgMTk6MjMsIENocmlzIFdpbHNvbiB3
cm90ZToKPiA+IFF1b3RpbmcgUm9iIEhlcnJpbmcgKDIwMTktMDUtMjEgMTY6MjQ6MjcpCj4gPj4g
T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgNDoyMyBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPiB3cm90ZToKPiA+Pj4KPiA+Pgo+ID4+IFlvdSBmb3Jnb3QgdG8gdXBkYXRlIHRo
ZSBzdWJqZWN0LiBJIGNhbiBmaXh1cCB3aGVuIGFwcGx5aW5nLCBidXQgSSdkCj4gPj4gbGlrZSBh
biBhY2sgZnJvbSBDaHJpcyBvbiBwYXRjaCAxLgo+Cj4gU29ycnkgYWJvdXQgdGhhdCAtIEknbGwg
dHJ5IHRvIGJlIG1vcmUgY2FyZWZ1bCBpbiB0aGUgZnV0dXJlLgo+Cj4gPiBJIHN0aWxsIHRoaW5r
IGl0IGlzIGluY29ycmVjdCBhcyB0aGUgbGltaXRhdGlvbiBpcyBwdXJlbHkgYW4gaXNzdWUgd2l0
aAo+ID4gdGhlIHNobWVtIGJhY2tlbmQgYW5kIG5vdCBhIGdlbmVyaWMgR0VNIGxpbWl0YXRpb24u
IEl0IG1hdHRlcnMgaWYgeW91Cj4KPiBEbyB5b3UgcHJlZmVyIHRoZSBwcmV2aW91cyB2ZXJzaW9u
IG9mIHRoaXMgc2VyaWVzWzFdIHdpdGggdGhlIHNobWVtIGhlbHBlcj8KPgo+IFsxXQo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA1MTYxNDE0NDcuNDY4MzktMS1zdGV2ZW4ucHJp
Y2VAYXJtLmNvbS8KPgo+IEFsdGhvdWdoIHRoaXMgaXNuJ3QgYSBnZW5lcmljIEdFTSBsaW1pdGF0
aW9uIGl0J3MgY3VycmVudGx5IHRoZSBzYW1lCj4gbGltaXRhdGlvbiB0aGF0IGFwcGxpZXMgdG8g
dGhlICdkdW1iJyBkcml2ZXJzIGFzIHdlbGwgYXMgc2htZW0gYmFja2VuZCwKPiBzbyBJJ2QgcHJl
ZmVyIG5vdCBpbXBsZW1lbnRpbmcgdHdvIGlkZW50aWNhbCBmdW5jdGlvbnMgcHVyZWx5IGJlY2F1
c2UKPiB0aGlzIGxpbWl0YXRpb24gY291bGQgYmUgcmVtb3ZlZCBpbiB0aGUgZnV0dXJlLgoKSW4g
aW50ZXJlc3Qgb2YgbW92aW5nIHRoaXMgZm9yd2FyZCwgaG93IGFib3V0IHNvbWUgY29tbWVudHMg
aW4KZHJtX2dlbV9tYXBfb2Zmc2V0KCkgZXhwbGFpbmluZyB0aGUgbGltaXRhdGlvbnMgYW5kIHdo
ZW4gaXQgaXMKYXBwcm9wcmlhdGUgdG8gdXNlIHRoZSBmdW5jdGlvbi4KClJvYgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
