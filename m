Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A172D946B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5456E0FC;
	Mon, 14 Dec 2020 08:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76296E0FC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 08:55:41 +0000 (UTC)
Date: Mon, 14 Dec 2020 08:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607936139;
 bh=TEBhOtqfa17K52xtKT9xnApO+7iuK81H1vRsdKzaJ2c=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=BmETrhZI88b6ZNObBAzCCE3a1Luu7Q+/vmE+IzCnwxwhrW8F6itYxRre1fuMiWyeX
 2Qrr+C+RzdeuN+Lsy0/564bnQClVNegF2Fso7Eeg01ryx4U+mbDK4rM8JNeF53y5/d
 AetS88hXorQfqzflX0S8gLhgXMEdSrxFXSmlS7LunZsb4voHcs8GeP8RVg2Gkpatrl
 MUj75yvSZM7Z5ZcZl9IcQfdCsF+IN+fV24wjokL035CGS3PUG5RFnI9zwlai2BfC9j
 Rf+uD4h082n7Ubg9o5ZL9i47hlX6B499Z61ziGh+ZIuzlBNfN7h8Kx3X9VStT+cnWK
 LZ4K5z+yHozfA==
To: =?utf-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v5 1/6] drm/damage_helper: Check if damage clips has valid
 values
Message-ID: <Mc9Acjxtl9hCv_yd6qeDG8VXAC5-I18UkQYV4xPBAIv-K1QJt_gwTg1WJQjKdD5f3Yfoq6kElbFxFx8HNnHJ3vqX9ztgdL7o_9aGtwAYLZk=@emersion.fr>
In-Reply-To: <20201213183930.349592-1-jose.souza@intel.com>
References: <20201213183930.349592-1-jose.souza@intel.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Sean Paul <seanpaul@chromium.org>,
 Deepak Rawat <drawat@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBVc2Vyc3BhY2UgY2FuIHNldCBhIGRhbWFnZSBjbGlwIHdpdGggYSBuZWdhdGl2ZSBjb29yZGlu
YXRlLCBuZWdhdGl2ZQo+IHdpZHRoIG9yIGhlaWdodCBvciBsYXJnZXIgdGhhbiB0aGUgcGxhbmUu
Cj4gVGhpcyBpbnZhbGlkIHZhbHVlcyBjb3VsZCBjYXVzZSBpc3N1ZXMgaW4gc29tZSBIVyBvciBl
dmVuIHdvcnN0IGVuYWJsZQo+IHNlY3VyaXR5IGZsYXdzLgo+Cj4gdjI6Cj4gLSBhZGQgZGVidWcg
bWVzc2FnZXMgdG8gbGV0IHVzZXJzcGFjZSBrbm93IHdoeSBhdG9taWMgY29tbWl0IGZhaWxlZAo+
IGR1ZSBpbnZhbGlkIGRhbWFnZSBjbGlwcwo+Cj4gQ2M6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVy
c2lvbi5mcj4KPiBDYzogR3dhbi1neWVvbmcgTXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29t
Pgo+IENjOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiBDYzogRmFiaW8gRXN0
ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgo+IENjOiBEZWVwYWsgUmF3YXQgPGRyYXdhdEB2bXdh
cmUuY29tPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9m
Zi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+CgpBZnRl
ciBsb29raW5nIGF0IHRoZSBrZXJuZWwgY29kZSwgaXQgc2VlbXMgbGlrZSB0aGUga2VybmVsIGFs
cmVhZHkgY2hlY2tzIGZvcgphbGwgb2YgdGhhdCBpbiBkcm1fYXRvbWljX3BsYW5lX2NoZWNrLiBB
cmUgeW91IGF3YXJlIG9mIHRoaXM/Cgo+ICsJdyA9IGRybV9yZWN0X3dpZHRoKCZwbGFuZV9zdGF0
ZS0+c3JjKSA+PiAxNjsKPiArCWggPSBkcm1fcmVjdF9oZWlnaHQoJnBsYW5lX3N0YXRlLT5zcmMp
ID4+IDE2OwoKVGhlIGRvY3Mgc2F5IHRoaXMgc2hvdWxkIGJlIGluIEZCIGNvb3JkaW5hdGVzLCBu
b3QgaW4gU1JDXyogY29vcmRpbmF0ZXMuIFNvIHdlCnNob3VsZG4ndCBuZWVkIHRvIGNoZWNrIGFu
eSBTUkNfKiBwcm9wIGhlcmUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
