Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0C22CA986
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 18:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27B06E82F;
	Tue,  1 Dec 2020 17:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285956E82F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 17:25:08 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id j15so2579767oih.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 09:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Y6qpwF38zenuVucgvf8IEMk7PiCzJOPAx4njVDZl8UA=;
 b=cwuraP9Srz+vt6ZAgo9z7+TqJdd6k4VNBLPlgDGDI3U4B9a3JXaFOr3Dagk/kyucgM
 vCtgMVwXCTCC+Bog3ZJncp4Ortx3VpQn+5K3FeEreuYAXNj6LHuA2fgVbFLTTXIfpx9s
 IxudAkOsrJN6TEqwKdjc5SkMGtqk+RRowksyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Y6qpwF38zenuVucgvf8IEMk7PiCzJOPAx4njVDZl8UA=;
 b=SgC/wyyFOtWjN2XHsTJHbX4kLq7zfu1tw5OCT8gBZE6gr9KoFefBpI1k3j2Dnbth4X
 vSLtcu1spZsR3CdLP4GKXg/lO2BDwQ/3rBo4v1JHNFQAzNjDCfJxVa4TMigtrJN/+jt0
 FgEA21FW0zz/Fcgsi38mnFabE59OrzU16rD0JCu1z/PBaZ2tLxad9G2wf1pzPW3q1+qf
 pY4aaLz1ml6ST+CY9/lsgmZjmBOTad2ylQTC1+xSJApfQKNnR8gE274oH8lOrNkcqFPB
 g0oYxWMTmEDXjGo6zwsv76vqpzHsce5/kdQ4zW8pMgT1e6UZ/fHX2E8lWgPo1MWqX3+C
 R3eg==
X-Gm-Message-State: AOAM530lToxjDqg7XGMYxDRJy6+gWxx12jI7p5U0Ac1gB5jGUBlwC5ya
 D5YRRqzZ7hv0Xe/9HrnLXlzt8ZrZpV1KkGgFjBCRp+sXpUc=
X-Google-Smtp-Source: ABdhPJyfiwKhDRf4MDj1uQv13uw9K9LQGorIXjnxPMLXLcIBO75IGPF51cv0pno/nwCwtmxdKfZNDwiWtdukOvUBLco=
X-Received: by 2002:aca:1713:: with SMTP id j19mr2387425oii.101.1606843507416; 
 Tue, 01 Dec 2020 09:25:07 -0800 (PST)
MIME-Version: 1.0
References: <3a1d46a8-cefe-cebb-2ab9-7bee1dea1d82@amd.com>
 <CAKMK7uHZmsMmJGu_wj7L=XjJcay_VLW8V=0mPiN_FcbRQB5LgQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHZmsMmJGu_wj7L=XjJcay_VLW8V=0mPiN_FcbRQB5LgQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 1 Dec 2020 18:24:56 +0100
Message-ID: <CAKMK7uG7xt7N265oi+HnWJkKU=B3TWfW4CWs-PAPVhiEqwnBUg@mail.gmail.com>
Subject: Re: Dim blowing up in my face
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMSwgMjAyMCBhdCA2OjIyIFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4gd3JvdGU6Cj4KPiBPbiBUdWUsIERlYyAxLCAyMDIwIGF0IDU6NTggUE0gQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBEYW5p
ZWwsCj4gPgo+ID4gSSd2ZSBqdXN0IHB1c2hlZCBhIG1pbm9yIFRUTSBjbGVhbnVwIGFuZCBkaW0g
aXMgY29tcGxhaW5pbmcgdGhhdAo+ID4gZHJtLWludGVsL2RybS1pbnRlbC1ndC1uZXh0IG1lcmdl
IGludG8gZHJtLXRpcCBmYWlsZWQuCj4gPgo+ID4gSW52ZXN0aWdhdGluZyB0aGF0IGxvb2tzIGxp
a2Ugc29tZXRoaW5nIGNvbXBsZXRlbHkgdW5yZWxhdGVkIGFuZCBJIGRvbid0Cj4gPiBrbm93IHRo
ZSBJbnRlbCBjb2RlIHdlbGwgZW5vdWdoIHRvIGZpeCBpdCBteXNlbGYuCj4gPgo+ID4gSG93IHRv
IHdlIHByb2NlZWQ/Cj4KPiBQcm9iYWJseSBqdXN0IHNvbWVvbmUgY29uY3VycmVudGx5IHB1c2hp
bmcgYW5kIGhhc24ndCByZXNvbHZlZCB0aGVpcgo+IGNvbmZsaWN0cyB5ZXQuIEJlc3QgaXMgdG8g
YXNrIG9uICNpbnRlbC1nZnggd2hvIGRpZCBpdCB0byBtYWtlIHN1cmUgaXQKPiBnZXRzIGZpeGVk
LgoKYnR3IGdpdGsgLS1tZXJnZSAoYW5kIG5vdCAtLW1lcmdlcywgdGhhdCdzIGEgdG90YWxseSBk
aWZmZXJlbnQga25vYikKaW4gdGhlIGNvbmZsaWN0aW5nIGJyYW5jaCBpcyByZWFsbHkgZ29vZCB0
byBmaWd1cmUgb3V0IHdoYXQncwpjb25mbGljdGluZyB3aXRoIHdoYXQgYW5kIHdob20gdG8gYmxh
bWUgZm9yIHRoZSBtZXNzLiBMb29rcyBsaWtlIGl0CndhcyBSb2RyaWdvIGFuZCBhbHJlYWR5IHJl
c29sdmVkLgotRGFuaWVsCgo+IC1EYW5pZWwKPgo+ID4KPiA+IFRoYW5rcywKPiA+IENocmlzdGlh
bi4KPgo+Cj4KPiAtLQo+IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KPiBodHRwOi8vYmxvZy5mZndsbC5jaAoKCgotLSAKRGFuaWVsIFZldHRlcgpT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
