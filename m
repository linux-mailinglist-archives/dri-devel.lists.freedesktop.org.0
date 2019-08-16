Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610F59092C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 22:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365006E2F9;
	Fri, 16 Aug 2019 20:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3107C89CF2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 20:09:29 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC7C82133F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 20:09:28 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id u34so7455491qte.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 13:09:28 -0700 (PDT)
X-Gm-Message-State: APjAAAWO0onx1+Xccaisl1agsWRcAr4jYzL8o83vkJ3u9HVCBwevxym3
 LepgGdFf7L1hEB5PwDe69038AT/7ZYU8ssHNkg==
X-Google-Smtp-Source: APXvYqwebIs+I5l3D3YNa890IMkRQs6Czk1XXOPRicSteg8JjjQ6x/E6bhhzrgOT4keRPpNwkXj4uLugSyFeEGtAOs8=
X-Received: by 2002:ac8:368a:: with SMTP id a10mr10274315qtc.143.1565986168088; 
 Fri, 16 Aug 2019 13:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190816100424.5366-1-wen.he_1@nxp.com>
In-Reply-To: <20190816100424.5366-1-wen.he_1@nxp.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 16 Aug 2019 14:09:16 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLPZ+hCGd=J3MU83saHJJ-yx6k+X0Y7-2ECu5yT8PxF4w@mail.gmail.com>
Message-ID: <CAL_JsqLPZ+hCGd=J3MU83saHJJ-yx6k+X0Y7-2ECu5yT8PxF4w@mail.gmail.com>
Subject: Re: [v3 1/2] dt/bindings: display: Add optional property node for
 Mali DP500
To: Wen He <wen.he_1@nxp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565986169;
 bh=dBKRpCb+TdtFesGpn6eSh3quFn1tVcWVH4LK3WLPRRs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PtnUD++jqV+GjQkcWEZ+e4I5qc7dX8ApeEQuQ5RPADy3+0Wh1L58LyRxHnp7n/dwG
 u8xxXcJqUYgwBXtQenTqknzJjgAjJzbALa+WLVgp5UxTncf5y2u6uCRcBVekBKOfCJ
 YTNIIy7OjyC8NtM6E+yEKW9/X4yG2fk174HpcGAM=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Yang-Leo Li <leoyang.li@nxp.com>,
 linux-devel@linux.nxdi.nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgNDoxNCBBTSBXZW4gSGUgPHdlbi5oZV8xQG54cC5jb20+
IHdyb3RlOgo+Cj4gQWRkIG9wdGlvbmFsIHByb3BlcnR5IG5vZGUgJ2FybSxtYWxpZHAtYXJxb3Mt
dmFsdWUnIGZvciB0aGUgTWFsaSBEUDUwMC4KPiBUaGlzIHByb3BlcnR5IGRlc2NyaWJlIHRoZSBB
UlFvUyBsZXZlbHMgb2YgRFA1MDAncyBRb1Mgc2lnbmFsaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTog
V2VuIEhlIDx3ZW4uaGVfMUBueHAuY29tPgo+IC0tLQo+IGNoYW5nZSBpbiB2MzoKPiAgICAgICAg
IC0gY29ycmVjdGlvbiB0aGUgZGVzY3JpYmUgb2YgdGhlIG5vZGUKPgo+ICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hcm0sbWFsaWRwLnR4dCB8IDMgKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hcm0sbWFsaWRwLnR4dCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FybSxtYWxpZHAudHh0Cj4gaW5kZXgg
MmY3ODcwOTgzZWYxLi4xZjcxMWQzMmYyMzUgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJtLG1hbGlkcC50eHQKPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hcm0sbWFsaWRwLnR4dAo+IEBAIC0z
Nyw2ICszNyw4IEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6Cj4gICAgICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2ZWQtbWVtb3J5L3Jlc2VydmVkLW1lbW9yeS50eHQpCj4g
ICAgICB0byBiZSB1c2VkIGZvciB0aGUgZnJhbWVidWZmZXI7IGlmIG5vdCBwcmVzZW50LCB0aGUg
ZnJhbWVidWZmZXIgbWF5Cj4gICAgICBiZSBsb2NhdGVkIGFueXdoZXJlIGluIG1lbW9yeS4KPiAr
ICAtIGFybSxtYWxpZHAtYXJxb3MtaGlnaC1sZXZlbDogcGhhbmRsZSB0byBkZXNjcmliaW5nIHRo
ZSBBUlFvUyBsZXZlbHMgb2YgRFA1MDAncwo+ICsgICAgUW9TIHNpZ25hbGluZy4KClRoZSBkcml2
ZXIgaXMgcmVhZGluZyBhIHUzMi4uLiBEaWQgeW91IHRlc3QgdGhpcz8KCgo+Cj4KPiAgRXhhbXBs
ZToKPiBAQCAtNTQsNiArNTYsNyBAQCBFeGFtcGxlOgo+ICAgICAgICAgICAgICAgICBjbG9ja3Mg
PSA8Jm9zY2NsazI+LCA8JmZwZ2Fvc2MwPiwgPCZmcGdhb3NjMT4sIDwmZnBnYW9zYzE+Owo+ICAg
ICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJweGxjbGsiLCAibWNsayIsICJhY2xrIiwgInBj
bGsiOwo+ICAgICAgICAgICAgICAgICBhcm0sbWFsaWRwLW91dHB1dC1wb3J0LWxpbmVzID0gL2Jp
dHMvIDggPDggOCA4PjsKPiArICAgICAgICAgICAgICAgYXJtLG1hbGlkcC1hcnFvcy1oaWdoLWxl
dmVsID0gPCZycW9zdmFsdWU+Owo+ICAgICAgICAgICAgICAgICBwb3J0IHsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBkcDBfb3V0cHV0OiBlbmRwb2ludCB7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JnRkYTk5OHhfMl9pbnB1dD47Cj4gLS0K
PiAyLjE3LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
