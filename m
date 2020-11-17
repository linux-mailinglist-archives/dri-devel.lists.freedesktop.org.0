Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B932B5AF9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 09:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C196E12C;
	Tue, 17 Nov 2020 08:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D927E6E12C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 08:29:58 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h2so2401019wmm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 00:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0AoYHW7lMZzkTQ6BnvkiA74s9JiSHbIiy02gKpfefxk=;
 b=ouKgk1yasb8tfHmx4anuX+qm2kqIPUj4/8c6jf4bkP4LeF8hOAvtGE5WWDQ65ml129
 5YMClxsCnewFUtABCONGd/7eKMO8g3PiQ2HohthbTvxswPTMcDHfLEL74D9m0CrkFybr
 gOx9fKxx1G+L2v/9x109RHOMtbc3oJrwlrHhRCJxMJ7H8RRB5XTdzrGFz0YEBvWXeqQf
 /uFQItOjN4UEbjdZltBmKVkBR/Y9/cwCWMdOpecekpZ4yyhYQKDNlOg6tK3Y0xENxPOX
 bGyHTV4zLQ5SMeA7PrCG7lpTopRg9YGWRN9EDgIq2P37DduwtmnXsMMl9wrZZCd57g3I
 QE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0AoYHW7lMZzkTQ6BnvkiA74s9JiSHbIiy02gKpfefxk=;
 b=bmyv5VRUJcdkcaQ8DTCBmt0r33cZS8pVvZBZdJr8UsVvR0rRzTwScSL4A2+MwomQYe
 5VMPaOoefLiZlzJ9z9DoPuvdGckIUKhK2soSVQRBqZ0zyXJqGoSX9xkypuw30fmyzzxv
 HdgIrq4ZHLgwjjXsIv1JW6OLErBsUGKjgYDJb++z1G29eFQsTXhAKJn+cLRpNzyIcNqx
 SCHiRiQvy0Xyi/UAck153cL4HPPQwQIijUSXlKfSpYVgk4rw+1paHyK8xx9fdirxazy+
 iZUzJH0pJOPCY/dZGG0oqAn0KYgOgm1rIhVvxP15c4Xj8xHmcUJR40pWNL596UKLG0u7
 PDBg==
X-Gm-Message-State: AOAM531GmQBTBjj8CDb3iy6q74zWoH/WTrYxPTNXq7HFMu5JYJn1ToXG
 Ic6snxWRIrXK1bVtQ8nWEDEZJA==
X-Google-Smtp-Source: ABdhPJw8DTAOsUr5WU8Vpd+v0a+yBmTCtwLVBO7SW0hLGXW07nvSR0O4uxCMpwl6vZZg8UEpdLJJzQ==
X-Received: by 2002:a1c:bac1:: with SMTP id k184mr2938223wmf.76.1605601797569; 
 Tue, 17 Nov 2020 00:29:57 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t74sm2523552wmt.8.2020.11.17.00.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 00:29:56 -0800 (PST)
Date: Tue, 17 Nov 2020 08:29:55 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 29/42] drm/selftests/test-drm_dp_mst_helper: Place
 'struct drm_dp_sideband_msg_req_body' onto the heap
Message-ID: <20201117082955.GA1869941@dell>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-30-lee.jones@linaro.org>
 <2dad68f011c7cd8a7c3754457c192f9dc2f504ed.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2dad68f011c7cd8a7c3754457c192f9dc2f504ed.camel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, David Francis <David.Francis@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxNiBOb3YgMjAyMCwgTHl1ZGUgUGF1bCB3cm90ZToKCj4gSHVoLWNvdWxkIGhhdmUg
c3dvcm4gSSBoYWQgcmV2aWV3ZWQgdGhpcyBvbmUgYWxyZWFkeS4KPiAKPiBSZXZpZXdlZC1ieTog
THl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KClllcywgeW91J3JlIHJpZ2h0LgoKSXQgd2Fz
IG1hc2tlZCBieSB0aGUgZGlzY3Vzc2lvbiB3aXRoIFZpbGxlLiAgQXBvbG9naWVzLgoKPiBPbiBN
b24sIDIwMjAtMTEtMTYgYXQgMTc6NDAgKzAwMDAsIExlZSBKb25lcyB3cm90ZTpWCj4gPiBUaGUg
c3RhY2sgaXMgdG9vIGZ1bGwuCj4gPiAKPiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5l
bCBidWlsZCB3YXJuaW5nKHMpOgo+ID4gCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMv
dGVzdC1kcm1fZHBfbXN0X2hlbHBlci5jOiBJbiBmdW5jdGlvbgo+ID4g4oCYc2lkZWJhbmRfbXNn
X3JlcV9lbmNvZGVfZGVjb2Rl4oCZOgo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rl
c3QtZHJtX2RwX21zdF9oZWxwZXIuYzoxNjE6MTogd2FybmluZzogdGhlCj4gPiBmcmFtZSBzaXpl
IG9mIDExNzYgYnl0ZXMgaXMgbGFyZ2VyIHRoYW4gMTAyNCBieXRlcyBbLVdmcmFtZS1sYXJnZXIt
dGhhbj1dCj4gPiAKPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gQ2M6IEx5dWRlIFBhdWwgPGx5
dWRlQHJlZGhhdC5jb20+Cj4gPiBDYzogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQu
Y29tPgo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IFNpZ25lZC1v
ZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gPiAtLS0KPiA+IMKgLi4u
L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5jwqDCoMKgIHwgMzEgKysrKysr
KysrKysrLS0tLS0tLQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwg
TGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxv
ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
