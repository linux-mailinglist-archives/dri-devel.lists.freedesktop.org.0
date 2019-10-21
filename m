Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3DFDE9FC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 12:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA70889BFB;
	Mon, 21 Oct 2019 10:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD5089BFB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 10:45:12 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s1so4607617wro.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 03:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CJo1vGs4ohyige0AyAjrZb8zyvlwhFRLiB6YWgX+C3o=;
 b=J/BYX+SPKOJNeL21sKa+fhqceiiCuH6uIebncoWCV5rrNw7xYTrAkFZ5j1iMdcIV4H
 Mpfy25zdb859r0sXcWVgzlcT+Z9rUw1YTdlIiGXvyKDdJV9nNwHT337I0GdyOT8MNbsg
 on4qCQ1q7tQfvw+uIbLEHMyCScZGA0AkSMjIeQgenjoKHo4tVH/uX1B911AMPv5KXpcj
 l56WVwozTBSd0Gd8AoFwQCj8QdOoZwpJS356v8iemaaUhewMr33tOOGD6Kz4xAFbsa6E
 YdG4c7tgfcpovsOY3nNnVYfkkN9CK0SQtbczeTJH4cOXMCbRwYB2aP5BOb0AzzOxUSEi
 xzkA==
X-Gm-Message-State: APjAAAWPZwPfWW85Ha5fbvrIBh4ZjzNNQuzfjLhJRolU7fFVxSdHV8nj
 b3K+j9AJjxlK1l9GMyKz5+lReQ==
X-Google-Smtp-Source: APXvYqyOQqTEEe1cFPC48dBEDv70QO6nfTk62LM9CE+MhYiYoDPtFAT2lTxhyOfs7dYa1VCwfKoJrQ==
X-Received: by 2002:a5d:408f:: with SMTP id o15mr17537508wrp.139.1571654711412; 
 Mon, 21 Oct 2019 03:45:11 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id x21sm921318wmj.42.2019.10.21.03.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 03:45:10 -0700 (PDT)
Date: Mon, 21 Oct 2019 11:45:09 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v6 3/9] backlight: gpio: explicitly set the direction of
 the GPIO
Message-ID: <20191021104509.p2bsll3rwe7ica6t@holly.lan>
References: <20191019083556.19466-1-brgl@bgdev.pl>
 <20191019083556.19466-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191019083556.19466-4-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CJo1vGs4ohyige0AyAjrZb8zyvlwhFRLiB6YWgX+C3o=;
 b=lUNMfWi8td8fXPOYsOUuMBA9nWhRm0sBIXWMkl4sTFpawsp/CTPCpFr6O8gwzrzkgk
 pkxXJHfF/gQ3TH5qexZiA6RIH368flsN8Q+PTma85+Ev6H7rpZsULwO8EYlzGqtRM4gw
 7rj2u20jS7LAGi79W7V6cauUS6INpXUN64sMSlhP6LYN+rfZ8nrOtLkRdsGrYBQLjaWn
 rkgJ5ukLRCJEzn35zoa5dDskWA+2SzE5LItepTXVZpSDG8HN32mqrw2Nw26qf845wK/e
 D25QsJ3zYhtkMR6iFCZBrEwuV8SpHikU8FdSzNcQxPV+dujq4CCtNkJmNqJRRNfiwSe/
 7iuQ==
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
Cc: Jacopo Mondi <jacopo@jmondi.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBPY3QgMTksIDIwMTkgYXQgMTA6MzU6NTBBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IFRoZSBHUElPIGJhY2tsaWdodCBkcml2ZXIgY3VycmVudGx5IHJlcXVl
c3RzIHRoZSBsaW5lICdhcyBpcycsIHdpdGhvdXQKPiBhY2l2ZWx5IHNldHRpbmcgaXRzIGRpcmVj
dGlvbi4gVGhpcyBjYW4gbGVhZCB0byBwcm9ibGVtczogaWYgdGhlIGxpbmUKPiBpcyBpbiBpbnB1
dCBtb2RlIGJ5IGRlZmF1bHQsIHdlIHdvbid0IGJlIGFibGUgdG8gZHJpdmUgaXQgbGF0ZXIgd2hl
bgo+IHVwZGF0aW5nIHRoZSBzdGF0dXMgYW5kIGFsc28gcmVhZGluZyBpdHMgaW5pdGlhbCB2YWx1
ZSBkb2Vzbid0IG1ha2UKPiBzZW5zZSBmb3IgYmFja2xpZ2h0IHNldHRpbmcuCj4gCj4gUmVxdWVz
dCB0aGUgbGluZSAnYXMgaXMnIGluaXRpYWxseSwgc28gdGhhdCB3ZSBjYW4gcmVhZCBpdHMgdmFs
dWUKPiB3aXRob3V0IGFmZmVjdGluZyBpdCBidXQgdGhlbiBjaGFuZ2UgdGhlIGRpcmVjdGlvbiB0
byBvdXRwdXQgZXhwbGljaXRseQo+IHdoZW4gc2V0dGluZyB0aGUgaW5pdGlhbCBicmlnaHRuZXNz
Lgo+IAo+IEFsc286IGNoZWNrIHRoZSBjdXJyZW50IGRpcmVjdGlvbiBhbmQgb25seSByZWFkIHRo
ZSB2YWx1ZSBpZiBpdCdzIG91dHB1dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFz
emV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgoKSW50ZW50IGxvb2tzIGdvb2QgdG8g
bWUgYnV0Li4uCgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdo
dC5jIHwgMjMgKysrKysrKysrKysrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9n
cGlvX2JhY2tsaWdodC5jCj4gaW5kZXggMzk1NWI1MTNmMmY4Li5hMzZhYzNhNDViODEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwo+ICsrKyBi
L2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKPiBAQCAtMjUsOSArMjUs
OCBAQCBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgewo+ICAJaW50IGRlZl92YWx1ZTsKPiAgfTsKPiAg
Cj4gLXN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfdXBkYXRlX3N0YXR1cyhzdHJ1Y3QgYmFja2xp
Z2h0X2RldmljZSAqYmwpCj4gK3N0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfZ2V0X2N1cnJfYnJp
Z2h0bmVzcyhzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmwpCgpUaGlzIGZ1bmN0aW9uIGRvZXMg
bm90IGdldCB0aGUgY3VycmVudCBicmlnaHRuZXNzIChlLmcuIHdoYXQgdGhlCmhhcmR3YXJlIGlz
IGN1cnJlbnRseSBkb2luZykuIEdpdmVuIHdlJ3ZlIGp1c3QgbnVrZWQgdGhlIGZ1bmN0aW9uIHRo
YXQgCipkaWQqIGdldCB0aGUgY3VycmVudCBicmlnaHRuZXNzIGZyb20gdGhlIGhhcmR3YXJlIHRo
aXMgaXNuJ3QgYW4KYWNjZXB0YWJsZSBuYW1lLgoKV291bGQgbGlrZSBzb21ldGhpbmcgbGlrZSBj
YWxjX2JyaWdodG5lc3MoKSBvciBnZXRfbmV4dF9icmlnaHRuZXNzKCkuCgoKRGFuaWVsLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
