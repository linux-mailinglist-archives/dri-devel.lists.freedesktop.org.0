Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 947EB1E78E5
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 10:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC3E6E8A9;
	Fri, 29 May 2020 08:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CFF6E8A9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 08:59:27 +0000 (UTC)
Date: Fri, 29 May 2020 08:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1590742765;
 bh=G1AgvezNZLWX9RvgjcuqAZ5N1X49zXNU8K4hi/NCjvo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=FcNtpPPvGtZc/labd95Z4ZYHCervQnEPnz84Oxxqo32F0DANTEmCpzzvSznCBIlse
 DCghFrOy7NsinyU5Jk+zYGBFk2D6/Hv+E7NgE/lh9Mut9pLsshAIrPCGvhFQ6vLulh
 66pxHFoNvuUqn261dx6YbszjGgQcLMI6wm/zJuc8=
To: =?UTF-8?Q?Marek_Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3] drm/fourcc: document modifier uniqueness requirements
Message-ID: <bbZABMxDckHUj5JW5DW0pSewqQ-rAIW0gvNnTlI4np7o1A2bDrpPGIeyk5tXGMDr_cAI1l_R9qw6ykJ8OEhQlbKruJ8IG579jqADaPAnUbA=@emersion.fr>
In-Reply-To: <CAAxE2A4NCo_KMkemUOHKbZ7P=GR4p-zwhpmP7Get18x4Ydb-Gg@mail.gmail.com>
References: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
 <CAAxE2A4NCo_KMkemUOHKbZ7P=GR4p-zwhpmP7Get18x4Ydb-Gg@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1cnNkYXksIE1heSAyOCwgMjAyMCA1OjQ5IFBNLCBNYXJlayBPbMWhw6FrIDxtYXJhZW9A
Z21haWwuY29tPiB3cm90ZToKCj4gT24gbW9zdCBoYXJkd2FyZSwgdGhlcmUgaXMgYSBtaW5pbXVt
IHBpdGNoIGFsaWdubWVudCBmb3IgbGluZWFyIGFuZAo+IGFueSBncmVhdGVyIG11bHRpcGxlIG9m
IHRoZSBhbGlnbm1lbnQgaXMgZmluZS4KPgo+IE9uIE5hdmksIHRoZSBwaXRjaCBpbiBieXRlcyBm
b3IgbGluZWFyIG11c3QgYmUKPiBhbGlnbih3aWR0aCAqIGJwcCAvIDgsIDI1NikuIFRoYXQncyBi
ZWNhdXNlIHRoZSBodyBjb21wdXRlcyB0aGUgcGl0Y2gKPiBmcm9tIHRoZSB3aWR0aCBhbmQgZG9l
c24ndCBhbGxvdyBzZXR0aW5nIGEgY3VzdG9tIHBpdGNoLiBGb3IgdGhhdAo+IHJlYXNvbiwgbXVs
dGktR1BVIHNoYXJpbmcgbWlnaHQgbm90IGJlIHBvc3NpYmxlIGlmIHRoZSBvdGhlciBHUFUKPiBk
b2Vzbid0IGFsaWduIHRoZSBwaXRjaCBpbiBleGFjdGx5IHRoZSBzYW1lIHdheS4KCk9LLiBJbiB0
aGlzIGNhc2UgSSB0aGluayBpdCdzIGZpbmUgdG8gbWFrZSB0aGUgRE1BLUJVRiBpbXBvcnQgZmFp
bCwgYXMKd2UndmUgc3VnZ2VzdGVkIG9uIElSQy4gVGhlIG1vcmUtb3ItbGVzcyBwbGFubmVkIGZp
eCBmb3IgdGhlc2UgYnVmZmVyCnNoYXJpbmcgaXNzdWVzIGlzIHRvIHJldml2ZSB0aGUgYnVmZmVy
IGNvbnN0cmFpbnRzIHByb3Bvc2FsIGZyb20gdGhlCmFsbG9jYXRvciBwcm9qZWN0LiBJdCdzIGEg
bG90IG9mIHdvcmsgdGhvdWdoLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
