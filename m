Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE27766E3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 15:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611406ED3D;
	Fri, 26 Jul 2019 13:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4A26ED3F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 13:05:56 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u25so37273803wmc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 06:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=LA2gZQHW+ogCEHAq4zNqZ9+u5bdgeGEW5eaDTfnaq2c=;
 b=E6oANHpUauw6AoCyLsdqIzNv5ro4ofB5MJepfgFuJWPloayQOxgxHqJEpHMDhJ+avn
 ygCkGWmdzB56XM3qdF1RkNDz3+7xYURqVPnpDUPjJTA9F6c2rgYhufmJrEUbQ0etmF/1
 X6F3Yi/XXFNZgYTNR0Ir3z1H4QcKq4LJKwOCGuZY1E/sh/dfCqMgSuVkxRKQb8VyykAc
 5LASeyEf8f+Gl6bjdHj7blWi5DhreUqrgUCh24FlQ2kJWbzLf5f7dsxgkUN/Wrqe0SAS
 uah7Mwc6HptyZwZxBAmq+Tq+4LTfO1qOVMwHyxbq5RzUtGYsTS+DDI9bv8BUedDbI7wI
 mUaQ==
X-Gm-Message-State: APjAAAX3w2IQL1c1am/AnPAEO2J6cWkaSvjAxJpOG5eEJsern/loQjX2
 JfEWJyiOLtisGHLHOcgNqcQ30w==
X-Google-Smtp-Source: APXvYqys9RQ0RnGtSIgncuHAcCNn6PgPxDgjB5e01xzx01Hy+w1I6ozWB4sOYDep4YVQq+0KTfdkpQ==
X-Received: by 2002:a7b:cbc6:: with SMTP id n6mr56918505wmi.14.1564146355025; 
 Fri, 26 Jul 2019 06:05:55 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id f70sm65027253wme.22.2019.07.26.06.05.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 06:05:54 -0700 (PDT)
Date: Fri, 26 Jul 2019 14:05:52 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 1/1] backlight: drop EARLY_EVENT_BLANK support
Message-ID: <20190726130552.6asmzwvx7dml262x@holly.lan>
References: <20190725143224.GB31803@ravnborg.org>
 <20190726095016.wsj7jnni5zdh37dl@holly.lan>
 <20190726112724.GB20065@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726112724.GB20065@ravnborg.org>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=LA2gZQHW+ogCEHAq4zNqZ9+u5bdgeGEW5eaDTfnaq2c=;
 b=cwXjbHe8R5GVASuJAOtuB91oQOebnWGJyVRTnZvPs8CsQKKRkabnnrm35zfFShy/Uk
 r3B2fm7CPEcU1jDvOibQIdg/jV744HdCz1ZTYwGb/8zRwlXueOBZJ1mKQsFHUIYTTdx4
 rkbUWixSZ12EmGn7Jl1GyEKrK9ZwkF+3Xa2dL7wtfw3Z46nQjaFBXqzXN5L9yD1q2wTe
 74vKi5VtquDxWEWMVvWRK0dzMESgjgofsADYuZzBcQzzq69KXWR/jzV4ztdLsz1Hl3UF
 3rdd0MXI1OyUNOJaf/eEF++Wt6zBMFgshQx2BDM8FvohjDtxGGjFS3uDxlCQQeFJGLqD
 r8Tw==
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Gerd Hoffmann <kraxel@redhat.com>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDE6Mjc6MjVQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIERhbmllbC4KPiAKPiBPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCAxMDo1MDoxNkFN
ICswMTAwLCBEYW5pZWwgVGhvbXBzb24gd3JvdGU6Cj4gPiBPbiBUaHUsIEp1bCAyNSwgMjAxOSBh
dCAwNDozMjoyNFBNICswMjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gPiA+IFRoZXJlIHdhcyBu
byB1c2VycyBsZWZ0IC0gc28gZHJvcCB0aGUgY29kZSB0byBzdXBwb3J0IEVBUkxZX0ZCX0JMQU5L
Lgo+ID4gCj4gPiBXaHkgYXJlIHdlIHVzaW5nIGEgZGlmZmVyZW50IG5vdW4gZm9yIHRoZSBzdWJq
ZWN0IGFuZCBkZXNjcmlwdGlvbj8KPiBJIGZhdC1maW5nZXJlZCB0aGUgZGVzY3JpcHRpb24uCj4g
V2lsbCBmaXggd2hlbiBJIGFwcGx5IC0gb3Igc2VuZCBvdXQgYSB2MiBpZiByZXF1ZXN0ZWQuCgpO
byBuZWVkIHRvIG1lIHRvIHNlZSBhIHYyIGlmIHRoYXQncyB0aGUgb25seSBjaGFuZ2UuCgoKRGFu
aWVsLgoKCj4gCj4gLi4uCj4gCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gPiA+IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgo+ID4gPiBDYzogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJv
Lm9yZz4KPiA+ID4gQ2M6IEppbmdvbyBIYW4gPGppbmdvb2hhbjFAZ21haWwuY29tPgo+ID4gPiBD
YzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgo+
ID4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+ID4gQ2M6
IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiA+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiA+IENjOiAiTWljaGHF
giBNaXJvc8WCYXciIDxtaXJxLWxpbnV4QHJlcmUucW1xbS5wbD4KPiA+ID4gQ2M6IFBldGVyIFJv
c2luIDxwZWRhQGF4ZW50aWEuc2U+Cj4gPiA+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4KPiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4g
Q2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwo+ID4gCj4gPiBPdGhlciB0aGFuIHRoZSBx
dWliYmxlIGFib3V0IHRoZSBkZXNjcmlwdGlvbi4uLgo+ID4gCj4gPiBBY2tlZC1ieTogRGFuaWVs
IFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPiAKPiBUaGFua3MsCj4gCj4g
CVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
