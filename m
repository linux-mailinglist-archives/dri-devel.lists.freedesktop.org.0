Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 020C2DD114
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 23:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C43389B84;
	Fri, 18 Oct 2019 21:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC698920E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 21:20:24 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-mD_yOf9yOvym_J5dyQXQMw-1; Fri, 18 Oct 2019 17:20:19 -0400
Received: by mail-qt1-f200.google.com with SMTP id f15so7182700qth.6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 14:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=bNndFFt/z+M5A1T7jxDnkef3ufMGSA/vRlkP0YHLCWg=;
 b=jDDsVMXZEEe0qCgtp+6L4h435Jzp6dlja8BYExZ8GfLMuoaDJ67LMhRSepsVsXRmt8
 ccJD+8NRjEi5YEO2PpD/4Z5EhL17Pp4Q5H4CCO+22GRI0CxztLIEnGVQ0VZnDh91vPMb
 exVk4tpGzHA5vzJiqe6FXD7mX5p/vfClAUeJjBQnYFYML087ZQeZwNS+XBe9LxPUOzof
 20NAQx9ZLfDstMILux0GE+eKNd/Sueizz1NOw9JCxooTrpFqT43sehj5O8ExonAEgI4w
 rUW1agcKIE2uWu7LkIevTbzm6eYY5wf4VJXuaSqz3s+HrGwCM6cfMyOa9+OJsDTFokhk
 xQTA==
X-Gm-Message-State: APjAAAU5TvY+lYYKwUxNnwNWI13GlE7bkZt4xFMFPPdyi5Pf1KhDou/c
 c3qqVBARrWKPVq9XI4AP1X2lXKKCMxKgfQHoMv9e7nwTZxgLbz9FSR4zYdT2y0fzQzgfw0B6qnk
 33yyU0dDbWwBDROFko8jb4fsgYHIo
X-Received: by 2002:ac8:7692:: with SMTP id g18mr12648677qtr.127.1571433619069; 
 Fri, 18 Oct 2019 14:20:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzDi5GNKO+MGzgoz1K7LV02BNjuVoZa/KV5XAfG+R8BQ6oJzF7odx4UC52P7hLnhKIgjUQDBQ==
X-Received: by 2002:ac8:7692:: with SMTP id g18mr12648660qtr.127.1571433618879; 
 Fri, 18 Oct 2019 14:20:18 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id w2sm4787043qtc.59.2019.10.18.14.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 14:20:18 -0700 (PDT)
Message-ID: <82688eb7450be22211d64fbdf9e73ca4bcc3d5d3.camel@redhat.com>
Subject: Re: [PATCH 01/15] drm/dp: Sort includes alphabetically
From: Lyude Paul <lyude@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Oct 2019 17:20:17 -0400
In-Reply-To: <20191015143509.1104985-2-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
 <20191015143509.1104985-2-thierry.reding@gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: mD_yOf9yOvym_J5dyQXQMw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571433623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5NFHwf2xx8GKDQDI05oDO8+GQMs76hmGeYAoHGgOTVY=;
 b=i32yLrIUNokUlnP0phxvFrHnPnFpH3XXOACVhvm/QF46O4bl9Gf8zRjivrleU/gQG3YaOe
 7xCgXQNeDCoJ11FqTJuxs/36PJW/6lGLJSOETkz5/moIPYzfzva+yMlwSmVFyT74TRJIcU
 NMr597u2Nc1o6NHjS1er9czIEfmBVdc=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBUdWUsIDIwMTkt
MTAtMTUgYXQgMTY6MzQgKzAyMDAsIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+IEZyb206IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gCj4gS2VlcGluZyB0aGUgbGlzdCBzb3J0
ZWQgYWxwaGFiZXRpY2FsbHkgbWFrZXMgaXQgbXVjaCBlYXNpZXIgdG8gZGV0ZXJtaW5lCj4gd2hl
cmUgdG8gYWRkIG5ldyBpbmNsdWRlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGlu
ZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVy
LmggfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIvaW5j
bHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gaW5kZXggYmY2MmI0M2FhZjJiLi41MmZmMWYyNGEy
NGQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gKysrIGIvaW5j
bHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gQEAgLTIzLDkgKzIzLDkgQEAKPiAgI2lmbmRlZiBf
RFJNX0RQX0hFTFBFUl9IXwo+ICAjZGVmaW5lIF9EUk1fRFBfSEVMUEVSX0hfCj4gIAo+IC0jaW5j
bHVkZSA8bGludXgvdHlwZXMuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L2kyYy5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvZGVsYXkuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2kyYy5oPgo+ICsjaW5jbHVkZSA8
bGludXgvdHlwZXMuaD4KPiAgCj4gIC8qCj4gICAqIFVubGVzcyBvdGhlcndpc2Ugbm90ZWQsIGFs
bCB2YWx1ZXMgYXJlIGZyb20gdGhlIERQIDEuMWEgc3BlYy4gIE5vdGUgdGhhdAotLSAKQ2hlZXJz
LAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
