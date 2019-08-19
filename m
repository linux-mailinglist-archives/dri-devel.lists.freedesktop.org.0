Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E55A94B06
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 18:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501C46E22E;
	Mon, 19 Aug 2019 16:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCFF6E22E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:57:23 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFDC022CE9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:57:22 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id g17so1992624qkk.8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 09:57:22 -0700 (PDT)
X-Gm-Message-State: APjAAAVW/RCqZs8ndORrp1kT4S+c6AjeaxMpfiIubdtgH/yDh7Gb2VJZ
 fbCGXM7QnNM44B5R6nXGp/lvqzz9Idnc+RNhAQ==
X-Google-Smtp-Source: APXvYqyQ/HAYu6TofUCZQ74sjJGFs/1QvUeohTN3l/vDfdSATCDtm4dUpsdinkMlGSKuytE71MLMZdTYQe6ZITk79b4=
X-Received: by 2002:a37:a010:: with SMTP id j16mr22432191qke.152.1566233842018; 
 Mon, 19 Aug 2019 09:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190816093107.30518-1-steven.price@arm.com>
In-Reply-To: <20190816093107.30518-1-steven.price@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 19 Aug 2019 11:57:10 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+F-QLJp_1hJz5_0GNLjYwDzkAs8Zg9RsaGiS90QGr_dQ@mail.gmail.com>
Message-ID: <CAL_Jsq+F-QLJp_1hJz5_0GNLjYwDzkAs8Zg9RsaGiS90QGr_dQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Enable devfreq to work without regulator
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566233842;
 bh=Hy8n0lFRp7zty8ZWy4THs+if4S0VJnY7dlnn2BR9Vz8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=z4oz4S9WVcCWFjUcS9mPBKI3fAGqQ0WbNNxkAP3iCz6cASA0MdQClIjXBEnCFPz5c
 5YhZVJz0tz7B8yKj43mwr+mEU9HvqhVEmpzphwTyI02HpXBBH4YApo1jrclaMBBok4
 5n8wi2vIuxWjLKhT8T6ENENrtP7EpRlyj476b48s=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgNDozMSBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPiB3cm90ZToKPgo+IElmIHRoZXJlIGlzIG5vIHJlZ3VsYXRvciBkZWZpbmVkIGZv
ciB0aGUgR1BVIHRoZW4gc3RpbGwgY29udHJvbCB0aGUKPiBmcmVxdWVuY3kgdXNpbmcgdGhlIHN1
cHBsaWVkIGNsb2NrLgo+Cj4gU29tZSBib2FyZHMgaGF2ZSBjbG9jayBjb250cm9sIGJ1dCBubyAo
ZGlyZWN0KSBjb250cm9sIG9mIHRoZSByZWd1bGF0b3IuCj4gRm9yIGV4YW1wbGUgdGhlIEhpS2V5
OTYwIHVzZXMgYSBtYWlsYm94IHByb3RvY29sIHRvIGEgTUNVIHRvIGNvbnRyb2wKPiBmcmVxdWVu
Y2llcyBhbmQgZG9lc24ndCBkaXJlY3RseSBjb250cm9sIHRoZSB2b2x0YWdlLiBUaGlzIHBhdGNo
IGFsbG93cwo+IGZyZXF1ZW5jeSBjb250cm9sIG9mIHRoZSBHUFUgb24gdGhpcyBzeXN0ZW0uCj4K
PiBTaWduZWQtb2ZmLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIHwgNyArKy0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpB
cHBsaWVkLCB0aGFua3MuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
