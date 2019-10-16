Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BBDD922C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 15:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464A389949;
	Wed, 16 Oct 2019 13:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FAF89949
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 13:15:34 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0C9F218DE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 13:15:33 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id n17so16623029qtr.4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 06:15:33 -0700 (PDT)
X-Gm-Message-State: APjAAAUHTRiOmpr4rvm3yZTVh4Ygj1AuEkvSkva5yar/Ditgcqzmn9YB
 RJYaEG1cozA/alLYYVGJC12oAWJRW2ZRtj629g==
X-Google-Smtp-Source: APXvYqwKs5UdvUeaFRW8bLvhtjp7znKBxIpTPywHIn8FBNhWh5DCfYY8yxrL5NLWwtGcIotNhvWLT8UwzY3fVixQOzY=
X-Received: by 2002:ac8:44d9:: with SMTP id b25mr45955617qto.300.1571231732993; 
 Wed, 16 Oct 2019 06:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191001233923.16514-1-aford173@gmail.com>
 <20191001233923.16514-5-aford173@gmail.com>
 <20191009233130.GA1002@bogus>
 <CAHCN7xLCvN1v00H10KUX625awz+nea6rhA_LYnftspjaZ+od-g@mail.gmail.com>
In-Reply-To: <CAHCN7xLCvN1v00H10KUX625awz+nea6rhA_LYnftspjaZ+od-g@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 16 Oct 2019 08:15:21 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJoPda6Oj14WTdm737Mydn+pzvdqkyCPry+zU7drheq=g@mail.gmail.com>
Message-ID: <CAL_JsqJoPda6Oj14WTdm737Mydn+pzvdqkyCPry+zU7drheq=g@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] dt-bindings: Add Logic PD Type 28 display panel
To: Adam Ford <aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571231734;
 bh=IcnqT7RQVBovweaVEALr0lBoNn170n6vif3YcfLUwK8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nb3sfhmWYplKyJ6Jp3DpoLlQq/qomzbD39TynD+136xDVYL8TWUi2rX7ZCbnvO85y
 c+DTLJP2AsYG8A/3H9pgWFU2/OJBdQDNVvPW6wYaVYuIzXXtx/x4jStH6DXd8K1Uqs
 Z9s8mgbv7Y6+C1biIH7R0yLCavlmbP0O1VT/zn1w=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Adam Ford <adam.ford@logicpd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgNjowNCBQTSBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE9jdCA5LCAyMDE5IGF0IDY6MzEgUE0gUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBPY3QgMDEsIDIwMTkg
YXQgMDY6Mzk6MjJQTSAtMDUwMCwgQWRhbSBGb3JkIHdyb3RlOgo+ID4gPiBUaGlzIHBhdGNoIGFk
ZHMgZG9jdW1lbnRhdGlvbiBvZiBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIFdWR0EgcGFu
ZWwKPiA+ID4gTG9naWMgUEQgVHlwZSAyOCBkaXNwbGF5Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+IFY0OiAg
VXBkYXRlIHBlciBSb2IgSCdzIHN1Z2dlc3Rpb25zIGFuZCBjb3B5IG90aGVyIHBhbmVsIHlhbWwg
ZXhhbXBsZSBmcm9tIDUuNC1yYzEKPiA+ID4gVjM6ICBDb3JyZWN0IGJ1aWxkIGVycm9ycyBmcm9t
ICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snCj4gPgo+ID4gVGhlIGV4YW1wbGUgc3RpbGwgZmFpbHMg
dG8gYnVpbGQgaGVyZS4KPgo+IEkgY2Fubm90IHJlcGxpY2F0ZSB0aGUgYnVpbGQgZXJyb3Igb24g
NS40LVJDMyBhdCBsZWFzdCBmb3IgdGhpcwo+IGJpbmRpbmcgb24gVjQgb2YgdGhlIHBhdGNoLiAg
SSBnZXQgYnVpbGQgZXJyb3Igb24gb3RoZXIgYmluZGluZ3MuCj4KPiAkIG1ha2UgZHRfYmluZGlu
Z19jaGVjayBBUkNIPWFybQo+IHNjcmlwdHMva2NvbmZpZy9jb25mICAtLXN5bmNjb25maWcgS2Nv
bmZpZwo+ICAgU0NIRU1BICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHJvY2Vz
c2VkLXNjaGVtYS55YW1sCj4gL2hvbWUvYWZvcmQvc3JjL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9uZXQvYWRpLGFkaW4ueWFtbDoKPiBpZ25vcmluZywgZXJyb3IgaW4g
c2NoZW1hICdhZGkscngtaW50ZXJuYWwtZGVsYXktcHMnCj4gd2FybmluZzogbm8gc2NoZW1hIGZv
dW5kIGluIGZpbGU6Cj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9hZGks
YWRpbi55YW1sCj4gL2hvbWUvYWZvcmQvc3JjL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yZWd1bGF0b3IvZml4ZWQtcmVndWxhdG9yLnlhbWw6Cj4gaWdub3JpbmcsIGVy
cm9yIGluIHNjaGVtYSAnMCcKPiB3YXJuaW5nOiBubyBzY2hlbWEgZm91bmQgaW4gZmlsZToKPiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVndWxhdG9yL2ZpeGVkLXJlZ3VsYXRv
ci55YW1sCj4gICBDSEtEVCAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
YW1sb2dpYy9hbWxvZ2ljLG1lc29uLWd4LWFvLXNlY3VyZS55YW1sCj4gICAuLi4uCj4gICBDSEtE
VCAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3Rwbyx0
cGcxMTAueWFtbAo+ICAgQ0hLRFQgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9hbXBpcmUsYW0tNDgwMjcyaDN0bXF3LXQwMWgueWFtbAo+ICAgQ0hLRFQg
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9sb2dpY3Bk
LHR5cGUyOC55YW1sCj4gICBDSEtEVCAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL3JvbmJvLHJiMDcwZDMwLnlhbWwKPiAgLi4uCj4gIENIS0RUICAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2FsbHdpbm5lcixzdW40aS1hMTAt
aXIueWFtbAo+ICAgQ0hLRFQgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVk
aWEvYWxsd2lubmVyLHN1bjRpLWExMC1jc2kueWFtbAo+IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS9hbGx3aW5uZXIsc3VuNGktYTEwLWNzaS55YW1sOgo+ICRpZDogcGF0
aC9maWxlbmFtZSAnYXJtL2FsbHdpbm5lcixzdW40aS1hMTAtY3NpLnlhbWwnIGRvZXNuJ3QgbWF0
Y2gKPiBhY3R1YWwgZmlsZW5hbWUKPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
TWFrZWZpbGU6MTI6IHJlY2lwZSBmb3IgdGFyZ2V0Cj4gJ0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS9hbGx3aW5uZXIsc3VuNGktYTEwLWNzaS5leGFtcGxlLmR0cycKPiBm
YWlsZWQKPiBtYWtlWzFdOiAqKiogW0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZWRpYS9hbGx3aW5uZXIsc3VuNGktYTEwLWNzaS5leGFtcGxlLmR0c10KPiBFcnJvciAxCj4gTWFr
ZWZpbGU6MTI2MzogcmVjaXBlIGZvciB0YXJnZXQgJ2R0X2JpbmRpbmdfY2hlY2snIGZhaWxlZAo+
IG1ha2U6ICoqKiBbZHRfYmluZGluZ19jaGVja10gRXJyb3IgMgo+Cj4KPiBJIHRvb2sgb3V0IHNv
bWUgb2YgdGhlIGxvZ3MgdG8gbWFrZSBpdCBsZXNzIGNoYXR0eS4gIEkgZG9uJ3Qga25vdwo+IGFu
eXRoaW5nIGFib3V0IHlhbWwgb3Igd2hhdCB0aGUgZXhwZWN0YXRpb25zIGFyZSwgc28gaWYgdGhl
cmUgaXMgYQo+IHRlc3QgYmV5b25kICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIHBsZWFzZSBsZXQg
bWUga25vdy4KClBlcmhhcHMgJ21ha2UgLWsnIGlzIG5lZWRlZCBiZWNhdXNlIG9mIHRoZSBvdGhl
ciBmYWlsdXJlcy4gT3IgdHJ5IG9uCnRvcCBvZiBsaW51eC1uZXh0IHdoaWNoIHNob3VsZCBhbGwg
YmUgZml4ZWQuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
