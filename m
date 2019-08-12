Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9408AB0A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 01:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4CF6E53C;
	Mon, 12 Aug 2019 23:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8FE6E53C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 23:19:48 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id z17so47082398otk.13
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 16:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lqrNtsY3z/GqboCx94xUohSgcAprstWJeqrp2vVk0Is=;
 b=CAcUy/Tg0dnaQnP2UKQkCgATBXlP77U6tDFmjzcAY0Dn9HaWhv5GSB4a1NymmvIG8U
 zdA06xcyk5Wkxi9chkb2zDo80ADcO5c3eERCpw0ZJw9rFd7oUHUoNxDU76ZqFRGSpSgB
 SsWPHhZoq1brl7gL6evCyvu1mQQyIEBFNaqPi5rLhergqTaUuGiP5kPbz9B3UTZatoC1
 j11AyP10vPaRmegoh5OQsaVTnqnGSV7kLmqe8ZXkwp3fjJxpy7HpZ+nXwZuhNz0O3AV6
 R/WZa8aSzrvPBFpowzrNw4j1xhe1zK7Xg0/StyLXlkc4ffknzaDsMXvsBo30EftMcAHE
 28mg==
X-Gm-Message-State: APjAAAXRaZEfIVQIc+aB3X8UT5sZXDukNtrtsK16Cs0qykt9Cr77Ntpi
 x8R0vZiMCYEXZr8aNUXPew==
X-Google-Smtp-Source: APXvYqzwBkIvZBYjlD4u+kjMaZdM68xR5wuwLJn2T+FcAD1ydiPZOHSTU9O9tYsk3wdi1CNOJnVggw==
X-Received: by 2002:a5e:9e03:: with SMTP id i3mr880391ioq.66.1565651988117;
 Mon, 12 Aug 2019 16:19:48 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id f1sm11826048ioh.73.2019.08.12.16.19.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 16:19:47 -0700 (PDT)
Date: Mon, 12 Aug 2019 17:19:46 -0600
From: Rob Herring <robh@kernel.org>
To: Wen He <wen.he_1@nxp.com>
Subject: Re: [v2 2/3] dt/bindings: display: Add optional property node
 defined for Mali DP500
Message-ID: <20190812231946.GA31179@bogus>
References: <20190719095842.11683-1-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190719095842.11683-1-wen.he_1@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, leoyang.li@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDU6NTg6NDJQTSArMDgwMCwgV2VuIEhlIHdyb3RlOgo+
IEFkZCBvcHRpb25hbCBwcm9wZXJ0eSBub2RlICdhcm0sbWFsaWRwLWFycW9zLXZhbHVlJyBmb3Ig
dGhlIE1hbGkgRFA1MDAuCj4gVGhpcyBwcm9wZXJ0eSBkZXNjcmliZSB0aGUgQVJRb1MgbGV2ZWxz
IG9mIERQNTAwJ3MgUW9TIHNpZ25hbGluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZW4gSGUgPHdl
bi5oZV8xQG54cC5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2FybSxtYWxpZHAudHh0IHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9hcm0sbWFsaWRwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2FybSxtYWxpZHAudHh0Cj4gaW5kZXggMmY3ODcwOTgzZWYxLi43NmEw
ZTcyNTEyNTEgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYXJtLG1hbGlkcC50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9hcm0sbWFsaWRwLnR4dAo+IEBAIC0zNyw2ICszNyw4IEBAIE9wdGlv
bmFsIHByb3BlcnRpZXM6Cj4gICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmVzZXJ2ZWQtbWVtb3J5L3Jlc2VydmVkLW1lbW9yeS50eHQpCj4gICAgICB0byBiZSB1c2VkIGZv
ciB0aGUgZnJhbWVidWZmZXI7IGlmIG5vdCBwcmVzZW50LCB0aGUgZnJhbWVidWZmZXIgbWF5Cj4g
ICAgICBiZSBsb2NhdGVkIGFueXdoZXJlIGluIG1lbW9yeS4KPiArICAtIGFybSxtYWxpZHAtYXJx
b3MtaGlnaC1sZXZlbDogaW50ZWdlciBvZiB1MzIgdmFsdWUgZGVzY3JpYmluZyB0aGUgQVJRb1MK
PiArICAgIGxldmVscyBvZiBEUDUwMCdzIFFvUyBzaWduYWxpbmcuCgp1MzIgaGVyZSwgYW5kLi4u
Cgo+ICAKPiAgCj4gIEV4YW1wbGU6Cj4gQEAgLTU0LDYgKzU2LDcgQEAgRXhhbXBsZToKPiAgCQlj
bG9ja3MgPSA8Jm9zY2NsazI+LCA8JmZwZ2Fvc2MwPiwgPCZmcGdhb3NjMT4sIDwmZnBnYW9zYzE+
Owo+ICAJCWNsb2NrLW5hbWVzID0gInB4bGNsayIsICJtY2xrIiwgImFjbGsiLCAicGNsayI7Cj4g
IAkJYXJtLG1hbGlkcC1vdXRwdXQtcG9ydC1saW5lcyA9IC9iaXRzLyA4IDw4IDggOD47Cj4gKwkJ
YXJtLG1hbGlkcC1hcnFvcy1oaWdoLWxldmVsID0gPCZycW9zdmFsdWU+OwoKcGhhbmRsZSBoZXJl
PwoKPiAgCQlwb3J0IHsKPiAgCQkJZHAwX291dHB1dDogZW5kcG9pbnQgewo+ICAJCQkJcmVtb3Rl
LWVuZHBvaW50ID0gPCZ0ZGE5OTh4XzJfaW5wdXQ+Owo+IC0tIAo+IDIuMTcuMQo+IApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
