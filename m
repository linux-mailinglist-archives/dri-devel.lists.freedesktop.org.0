Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDFA72D0E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 13:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A706E517;
	Wed, 24 Jul 2019 11:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E556E517
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:13:04 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 207so41454303wma.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 04:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VoTHpFzQYPjvAZfIE3OYqA2wlNclaoN9MrmSNOMVyog=;
 b=bNPaPO6wr3IIS93GOCAKhylyrbvRCJlbhXKrXOwUUtrvz9t2T0Sw/1qC63v/mp1pxi
 MW0E3xFyMJRoVxrxsDnG0iUi1tGJYDLHZyzlHK89If5rPBQvxKEYNvQ6PU5ANqsim/cg
 Su8cBPjnMLVmLWeIiH+EdR5CKlwmDar0BWVB6mGaibzLjtr9OxGmgWfq/kNCVSI5G+a3
 DCc6Z2Gq5040FyaFQDvOvKijJelSYqnbolcfi0x2YnTeTj2Uf1LyR4rorxCkwExEXGFX
 Rzi2RsN1IKrvjOuwK0H1Ndhbw49j6zkulHz+s7qkxWlsB+QZhhUWcgAgzU4Ir2gtE3X3
 xhLQ==
X-Gm-Message-State: APjAAAViV97OorsbqFcf34fWY4/5veXO8tGl+BTqT/xzRwIqPRp/iRCC
 C+U68duy0wp7mz9zPmLPg8mwtQ60v4BG1A==
X-Google-Smtp-Source: APXvYqwL4FGhbU5IvgYchPKITgSwCC6hxbCyT7AAsCPQGSECzuD1QkWBPt0+GgsrgAixoJZK+W4tng==
X-Received: by 2002:a1c:a985:: with SMTP id
 s127mr72652355wme.163.1563966783080; 
 Wed, 24 Jul 2019 04:13:03 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id p18sm45929436wrm.16.2019.07.24.04.13.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 04:13:02 -0700 (PDT)
Date: Wed, 24 Jul 2019 12:13:00 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v3 4/7] backlight: gpio: remove unused fields from
 platform data
Message-ID: <20190724111300.pt624m3olrpzp4nj@holly.lan>
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <20190724082508.27617-5-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724082508.27617-5-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VoTHpFzQYPjvAZfIE3OYqA2wlNclaoN9MrmSNOMVyog=;
 b=sNZKGEKeF2gx87AyJo4R5CYbJaKpY/ihuXG0R7rQkW4wRe4s2JJbI+yIG04881Spln
 gd+DDll/gXoZRxNp19YBgqDXmF/J+0pP21GtLnClf7RwOJrvY354Fdm3TfcMG27l63qb
 rMGjgtPNIv3Z8NCYxq/ew31B7rBrTn31oGGfsRMlZ+K4t1aL/uS2X3qN10x+rDHfzoVN
 9oxoUbHx79nwVpzbwRtVzJyRxByvgMGXYTLE7oEnIHYsTnXfJGUTSexU3YlM7mA6j/wd
 P1oV6X9iodNVjStiYAXUe2ytdYHKY/wSwZf8T4sH5oDYRLPUOay3M6DU2+z9flz1/QzN
 54FQ==
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTA6MjU6MDVBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IFJlbW92ZSB0aGUgcGxhdGZvcm0gZGF0YSBmaWVsZHMgdGhhdCBub2Jv
ZHkgdXNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6
ZXdza2lAYmF5bGlicmUuY29tPgo+IFJldmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJp
eS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KClJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBz
b24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgoKCj4gLS0tCj4gIGluY2x1ZGUvbGludXgv
cGxhdGZvcm1fZGF0YS9ncGlvX2JhY2tsaWdodC5oIHwgMyAtLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGxhdGZvcm1f
ZGF0YS9ncGlvX2JhY2tsaWdodC5oIGIvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwaW9f
YmFja2xpZ2h0LmgKPiBpbmRleCAzNDE3OWQ2MDAzNjAuLjFhOGI1YjE5NDZmZSAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvZ3Bpb19iYWNrbGlnaHQuaAo+ICsrKyBi
L2luY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9ncGlvX2JhY2tsaWdodC5oCj4gQEAgLTksOSAr
OSw2IEBAIHN0cnVjdCBkZXZpY2U7Cj4gIAo+ICBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZv
cm1fZGF0YSB7Cj4gIAlzdHJ1Y3QgZGV2aWNlICpmYmRldjsKPiAtCWludCBncGlvOwo+IC0JaW50
IGRlZl92YWx1ZTsKPiAtCWNvbnN0IGNoYXIgKm5hbWU7Cj4gIH07Cj4gIAo+ICAjZW5kaWYKPiAt
LSAKPiAyLjIxLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
