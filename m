Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C95376D3F2
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 20:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09426E450;
	Thu, 18 Jul 2019 18:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253CF6E450
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 18:30:52 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id k10so28319222qtq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 11:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=in+k2EJ0yUgEcWfMOCLX6vtt4xp7gnH3JFGCqlQ3fNY=;
 b=Ozf6U9/X5epKTn0ptmjXM78TiNrBOyq4yNp5zze2DTuc/7i8lM8BShWci2B3+AKwrp
 mXwZDZF8M42OV1hmq6pPZnWYTgGfHYBUt/bT5T8ljO0mIqLuU6NnkgGSI/SrFut2qPU+
 1slHXYiEMvpEQ0xqBN9SKs2OuH4QStoHdKyozHdcEKHVNwCedxAX//wHG9XXBZN6r0h9
 kr122B5om5vc3yP02pAuqkesfE/kJvQCeVizW4PIJpw9nTz4Ubrx0FnVbf06W5OORD+J
 I3l01jTrjnon0QYejluVXEQfTcLLxtbunUSykm8EHHfxLRBobuDOchMCd5WMjF3fwMKK
 3DSw==
X-Gm-Message-State: APjAAAVodufKDtdJS5cgWTgBpWviHXx/lw/J3Ozpu6fPoY1D49qB/A0n
 af0CtIHhPgIjG13crQ6+XYGKIA==
X-Google-Smtp-Source: APXvYqyBLppEZZyvT5K/qJOtPAJP26Q7Zq17101bVCjXPdYuHpTMV6yKtYIcA/OhY2zXrQ5+No6vUQ==
X-Received: by 2002:a0c:ad76:: with SMTP id v51mr34949407qvc.232.1563474651240; 
 Thu, 18 Jul 2019 11:30:51 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id r40sm15578032qtr.57.2019.07.18.11.30.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 11:30:50 -0700 (PDT)
Date: Thu, 18 Jul 2019 14:30:50 -0400
From: Sean Paul <sean@poorly.run>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 04/11] drm/ati_pcigart: drop dependency on
 drm_os_linux.h
Message-ID: <20190718183050.GA104440@art_vandelay>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-5-sam@ravnborg.org>
 <20190718174905.GG31819@art_vandelay>
 <20190718181135.GA5612@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718181135.GA5612@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=in+k2EJ0yUgEcWfMOCLX6vtt4xp7gnH3JFGCqlQ3fNY=;
 b=Bg6jaOgG9du1wnY3AakkRHNi1vr5x6MttHcc8/z0LrY8OApHgsOiUtYwm0yiR1LKF0
 z2MmA/nGKAJrt1OLbX+ieHspwY5WF9Q3wk28PkzatbhA0Hev59GwPDQEMFhoWrSq5cRR
 z01TDj/2sNwKRrZZUQbtS+lMvnJwwgfNnD/wUqPiPCF48THrCA7mGgUhTmhbWRG0Q9Zk
 WRp05TxbCeh2ls/yjXftohPGzg4OCShCl8YrRN5xIrxAz2oMNNsyF4TQGeY6CjU4Gww6
 0ywzytZkX7NXZ5smdo9S5Q7CXKt48Ab/MxBuGD3mM03WGXnN6GT+7XSBl9p8BSlb+pEx
 8HTA==
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Thierry Reding <treding@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDg6MTE6MzVQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIFNlYW4uCj4gPiAKPiA+IEFueSBwbGFucyBmb3IgdGhlIG90aGVyIHVzZXJzIG9m
IERSTV9XUklURTxOPigpPyBJdCBzZWVtcyBsaWtlIGl0J2QgYmUgdHJpdmlhbAo+ID4gdG8gZml4
IGl0IHVwIGZvciB2aWEgYW5kIG1nYS4gSSBkb24ndCByZWFsbHkgaGF2ZSBhbnkgYmFja2dyb3Vu
ZCBvbgo+ID4gZHJtX29zX2xpbnV4LmgsIGJ1dCBpdCBkb2Vzbid0IHNlZW0gbGlrZSBpdCdkIGJl
IHRoYXQgbXVjaCBtb3JlIGVmZm9ydCB0byBqdXN0Cj4gPiByZW1vdmUgdGhlIHdob2xlIHRoaW5n
Lgo+IAo+IER1cmluZyB0aGUgZHJtUC5oIHJlbW92YWwgSSBhbHNvIHRvb2sgY2FyZSBvZiBkcm1f
b3NfbGludXguaCwKPiBzbyB3aGVuIHRoZSBwYXRjaGVzIGxhbmQgdGhlbiB0aGVyZSB3aWxsIGJl
IG5vIHVzZXJzIGxlZnQuCj4gSSBsb29rIGZvcndhcmQgdG8gZGVsZXRlIHRoYXQgZmlsZS4KPiAK
PiBGb3IgdmlhIEkgb25seSBqdXN0IHBvc3RlZCB0aGUgcGF0Y2hlcyB0b2RheS4KPiBGb3IgbWdh
IHRoZXkgYWxyZWFkeSBsYW5kZWQgaW4gZHJtLW1pc2MtbmV4dC4KPiAKCkF3ZXNvbWUhIEkgdGhp
bmsgSSB3YXMgbG9va2luZyBhdCBkcm0tbmV4dCBpbnN0ZWFkIG9mIC1taXNjLW5leHQsIHNvIGhh
cHB5IHRvCmhlYXIgdGhlIGZ1dHVyZSBpcyBicmlnaHQgOikKClJldmlld2VkLWJ5OiBTZWFuIFBh
dWwgPHNlYW5AcG9vcmx5LnJ1bj4KCgo+IEkgZXhwZWN0IHRoYXQgd2UgYWZ0ZXIgbmV4dCBtZXJn
ZSB3aW5kb3cgY2FuIGRlbGV0ZQo+IGJvdGggZHJtX29zX2xpbnV4LmggYW5kIGRybVAuaC4KPiAK
PiAJU2FtCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21p
dW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
