Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E238BA6F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 15:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AD76E119;
	Tue, 13 Aug 2019 13:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728E56E119
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 13:36:18 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CB00208C2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 13:36:18 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id r4so79514291qkm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 06:36:18 -0700 (PDT)
X-Gm-Message-State: APjAAAUN28D1n/fObtRW0xi1QLcRzwTwTKI6n5DfFPqV7d31YkjI9T+W
 kn6x30SQeE80tLuxIHGvvjLHs6WVxXutuaKUAA==
X-Google-Smtp-Source: APXvYqwpfh5bMhHyB6vB1pzd7n1Vwqw30R85w02ibqi4bz0YGLZcgMCRWKhBC91fIfnr0Z0e1jVizuPMSMNcsYw+qBg=
X-Received: by 2002:a37:6944:: with SMTP id e65mr31258993qkc.119.1565703377198; 
 Tue, 13 Aug 2019 06:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190813133311.26441-1-laurent.pinchart@ideasonboard.com>
 <20190813133311.26441-4-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20190813133311.26441-4-laurent.pinchart@ideasonboard.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 13 Aug 2019 07:36:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLaUrYOrn2hq8Lhb-7muf5rQOTMo=CgHPrM=LDHodPHWA@mail.gmail.com>
Message-ID: <CAL_JsqLaUrYOrn2hq8Lhb-7muf5rQOTMo=CgHPrM=LDHodPHWA@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] dt-bindings: display: panel: Add bindings for NEC
 NL8048HL11 panel
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565703378;
 bh=nmpFtbTjb19ZTZT87e6AK+s+viettF7zvqv/K1p9Cqo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vt2BSmoJyNKKO4SI79tFbjUy9/WOXV2QfUzcAPKajEJZcYc+UcI+oa4Lj+wIagFTz
 DCboRDh1ophSN4YWPMnMSEMCu1otITfmZSuLLji8o4e+CA/5gzFYc/A2UiYCjN3Xxo
 Cn/zrtF6bLCO1cGjz5WnzEOmTb5KaS4UEwTSusGk=
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgNzozMyBBTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gVGhlIE5FQyBOTDgwNDhITDEx
IGlzIGEgMTAuNGNtIFdWR0EgKDgwMHg0ODApIHBhbmVsIHdpdGggYSAyNC1iaXQgUkdCCj4gcGFy
YWxsZWwgZGF0YSBpbnRlcmZhY2UgYW5kIGFuIFNQSSBjb250cm9sIGludGVyZmFjZS4KPgo+IFNp
Z25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYyOgo+Cj4gLSBBZGQgcmVnIGFuZCBzcGkt
bWF4LWZyZXF1ZW5jeSBwcm9wZXJ0aWVzCj4gLSBNYWtlIHRoZSBleGFtcGxlIHBhc3MgdGhlIGNo
ZWNrcwo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPgo+IC0gQ29udmVydCB0byBZQU1MCj4gLS0tCj4g
IC4uLi9kaXNwbGF5L3BhbmVsL25lYyxubDgwNDhobDExLnlhbWwgICAgICAgICB8IDYyICsrKysr
KysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL25lYyxubDgwNDhobDExLnlhbWwKClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
