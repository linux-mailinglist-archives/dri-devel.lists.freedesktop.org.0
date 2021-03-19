Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B953418FB
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 10:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98776E9D8;
	Fri, 19 Mar 2021 09:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60B06E9D8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 09:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616147906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14N7YiIxyiIUD8jIqz1YlQ1wNnYD6BJh9pT3hmKB6gU=;
 b=XZx3DJ9wrdpqzS2TjVCGvRz9TA6ujeXXbjYGDA8mmPqb57rMS/An0kwnYJZLE6IjeYC2na
 7kwI0RPC76MzwCSlmpAT0jfUix4wPh2fpQKoDqFRQvm8ERaVBOt4RrOqIN7G0kdSOgx0MX
 z9yChzSO8boY2RcI7LzHQlt/05W8h00=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-3SBHm9HQOT2X2gG0n04-wQ-1; Fri, 19 Mar 2021 05:58:24 -0400
X-MC-Unique: 3SBHm9HQOT2X2gG0n04-wQ-1
Received: by mail-wm1-f69.google.com with SMTP id z26so12701036wml.4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 02:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=14N7YiIxyiIUD8jIqz1YlQ1wNnYD6BJh9pT3hmKB6gU=;
 b=QuP5IYSPsyKJwGrbynH5wQs5HL5OZcjjJhkmpZUVcr4Yk6OEUZnvYfRXoxW51QIUw+
 PzczFfuQeYA9Ys8P/MoM1roTtlKMW6yy1KyiwJBQUyLgra4Ust25TAZMUPwKL+iXyofI
 sPtHgCfqmuNTXobppNkLkcx20fvaWAq9U8XQWGMFSb3vyIL5djHur3z/NiCJpo6rlqtW
 gbtpu+NcYW2ljGhy/rJpBKusRrC360ykka2r4pHGBQMjeK39JcBzDgFXsdPqtrNUMjHQ
 96cpYgtQUfz1o1R4g0Sbq5Jol4GEZ85EvOUOCZUCPNi/sgFkLHVkcSDjmOOT8sAzJpxF
 o7bg==
X-Gm-Message-State: AOAM532DNj/KCCOvf08Lxoi0Pe8KrbkHtCepxmeWcLyQ0qVoYf6LBZS9
 IsEaU9XaNwiOpglBQmnP6Jk4OeAbEdFhlA+mwOeYCjA70IDeVdP7IYSb3BNdi+2Q2s7Jwbeh71A
 xniv0nPKccYsm8Nroxd/gxdJEJbRXA/5Aioq+eQKRuUNC
X-Received: by 2002:a5d:560e:: with SMTP id l14mr3643927wrv.10.1616147903078; 
 Fri, 19 Mar 2021 02:58:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeORHso+wJAMW5iE+h4wMikaT3nxP8XYKaAeRR1AoFZSCKv6xsGOxkyaAWdZVyocVW2UEWX29YgKydp9i6sUE=
X-Received: by 2002:a5d:560e:: with SMTP id l14mr3643914wrv.10.1616147902914; 
 Fri, 19 Mar 2021 02:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-15-lee.jones@linaro.org>
In-Reply-To: <20210319082428.3294591-15-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 19 Mar 2021 10:58:12 +0100
Message-ID: <CACO55ts4nBY1DptpqcUGKgfkUzuQy61o+ZZ5voRfr4hSsqQcRQ@mail.gmail.com>
Subject: Re: [PATCH 14/19] drm/nouveau/dispnv50/headc57d: Make local function
 'headc57d_olut' static
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgMTksIDIwMjEgYXQgOToyNSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdk
LmM6MTczOjE6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYaGVhZGM1N2Rf
b2x1dOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdn
c0ByZWRoYXQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVA
cmVkaGF0LmNvbT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBu
b3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjUwL2hlYWRjNTdkLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2hlYWRjNTdkLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9o
ZWFkYzU3ZC5jCj4gaW5kZXggZmQ1MTUyN2I1NmI4My4uYmRjZmQyNDBkNjFjOCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZGM1N2QuYwo+IEBAIC0xNjksNyAr
MTY5LDcgQEAgaGVhZGM1N2Rfb2x1dF9sb2FkKHN0cnVjdCBkcm1fY29sb3JfbHV0ICppbiwgaW50
IHNpemUsIHZvaWQgX19pb21lbSAqbWVtKQo+ICAgICAgICAgd3JpdGV3KHJlYWR3KG1lbSAtIDQp
LCBtZW0gKyA0KTsKPiAgfQo+Cj4gLWJvb2wKPiArc3RhdGljIGJvb2wKPiAgaGVhZGM1N2Rfb2x1
dChzdHJ1Y3QgbnY1MF9oZWFkICpoZWFkLCBzdHJ1Y3QgbnY1MF9oZWFkX2F0b20gKmFzeWgsIGlu
dCBzaXplKQo+ICB7Cj4gICAgICAgICBpZiAoc2l6ZSAhPSAwICYmIHNpemUgIT0gMjU2ICYmIHNp
emUgIT0gMTAyNCkKPiAtLQo+IDIuMjcuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpSZXZpZXdlZC1ieTogS2Fyb2wgSGVyYnN0IDxraGVy
YnN0QHJlZGhhdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
