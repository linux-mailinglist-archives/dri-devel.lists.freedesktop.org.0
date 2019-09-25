Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDFFBD821
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 08:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055998930F;
	Wed, 25 Sep 2019 06:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A838930F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 06:09:21 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h7so4891986wrw.8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 23:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a5oAIDqUfmbOdwjy5a4n5ZHEaVAoEhrHBNGoLi27O6s=;
 b=ODy8fBGJNDdreY5udbekGW89Q+GnoNNtpQbfxFXCeheTHZUL5vifHL8UfaSChcH/VT
 6SienbNfRXf+17P7K3peK3GU4q/TGxL9pa6nrBdMGA/AWhN75SIiaK30e9/+jiOgApZf
 +yreDhnspn/ylhO3oIG6r4t/poICybSHegJ6PdNLGN6jbEP8Ju3kdtXB6EcV17LZ8inz
 FxKDewyu9K8zLDq3LECnwfLZy4vanCRqqvAAfOQuOVUHf+is9XO74ttw2Z4XiAE2NCHQ
 oXgv7Rz2xRvBg8/OkI0QJOuQyDqe4AqI9Y5kFcxtdJKsmJAqvQVzG+/PsjoiAZfF+yFJ
 ZWPA==
X-Gm-Message-State: APjAAAXspCz5S0LDJnk8DzsMALu7DmZyXaYwgQoyKfbhb7DB21Tb2K7R
 ZHc0KelWK+d+1jUGIBD4D0z+/JnlVF11LPOTBN5PXA==
X-Google-Smtp-Source: APXvYqwn/8MsLAaNa8Smu/C94KSRoKQRW3EIzJUwUg5BEeKRc+rlWPucILd38rK11nf7AFPrd7C6jt6Gu8kUWOVdNxM=
X-Received: by 2002:adf:f601:: with SMTP id t1mr6895987wrp.36.1569391760275;
 Tue, 24 Sep 2019 23:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190924212920.76103-1-john.stultz@linaro.org>
 <CAL_JsqLR212Et5Z82Gr=DJfB5WY-4o8bN_s5peu07EnaEVEOYQ@mail.gmail.com>
 <CALAqxLUR5ML3gmBs3SM2GvfXB+JxiO7gTUrtpVJqVzuh+hugxg@mail.gmail.com>
In-Reply-To: <CALAqxLUR5ML3gmBs3SM2GvfXB+JxiO7gTUrtpVJqVzuh+hugxg@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 24 Sep 2019 23:09:08 -0700
Message-ID: <CALAqxLWHrCKogRqe2ZQZT3dK57+8AmxKfZjKXxztvw6CFobdkg@mail.gmail.com>
Subject: Re: [PATCH] libdrm: Convert to Android.mk to Android.bp
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=a5oAIDqUfmbOdwjy5a4n5ZHEaVAoEhrHBNGoLi27O6s=;
 b=wg1glir3E9Vv275QkWYlZMGb/KL+aQc187UkcH4faSBriSVC/y7koMUXmdCKycPJ3R
 wQ12msR0kttfmvxuULXFI4PQ7+JB5LPTskax7eFkRDUfXB6nDbCulnF/ocj9Tgw5AaWt
 PutmzescPsqsWIZr1Wo4BSweEpiRAZ4RXx0mATxcxP3TkdnXCIP5PaQU1Wh5ezwG7IDm
 TmBevH8l8iDyBknYt5ciTG6wHu4YAREwsEOXLFrRy4h0qPuF8R0QsmzfKoj5uGK246Gt
 jNP3QNdJjb2VMWUwRBf1hTOAdHC9uWy/6rucM2jaFszukYpr4cd32kbApboLXBBbXXEG
 Q26w==
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
Cc: Rob Clark <robdclark@chromium.org>, Jiyong Park <jiyong@google.com>,
 Robert Foss <robert.foss@collabora.com>, Mauro Rossi <issor.oruam@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Eric Anholt <anholt@google.com>,
 Sean Paul <seanpaul@chromium.org>, Dan Willemsen <dwillemsen@google.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgNDozMCBQTSBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpA
bGluYXJvLm9yZz4gd3JvdGU6Cj4gT24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMzoyNCBQTSBSb2Ig
SGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+IFRyeWluZyB0byBtYWludGFpbiBz
b21ldGhpbmcgdGhhdCB3b3JrcyBhY3Jvc3MgbW9yZSB0aGFuIDMgcmVsZWFzZXMgb3IKPiA+IHNv
IGlzIHBhaW5mdWwuIEkgZG9uJ3QgdGhpbmsgYW5kcm9pZC14ODYgZm9sa3MgaGF2ZSB0aGUgYmFu
ZHdpZHRoIHRvCj4gPiBtYWludGFpbiB0aGluZ3Mgb2xkZXIgdGhhbiB0aGF0ICphbmQqIHVwZGF0
ZSB0byBuZXdlciB2ZXJzaW9ucy4gU28gSQo+ID4gdGhpbmsgb25seSBzdXBwb3J0aW5nIHRoZSBu
IGxhdGVzdCByZWxlYXNlcyBpcyBnb29kLgo+ID4KPiA+IEFyZSAuYnAgZmlsZXMgZm9yIG1hc3Rl
ci9RIGNvbXBhdGlibGUgYmFjayB0byBOIChvciBPKT8gSUlSQywgYXQgbGVhc3QKPiA+IGZvciB0
aGUgZmlyc3QgY291cGxlIG9mIHJlbGVhc2VzIHdpdGggLmJwIGZpbGVzLCB0aGV5IHNlZW1lZCB0
byBoYXZlCj4gPiBpbmNvbXBhdGlibGUgY2hhbmdlcy4KPgo+IEkgdGhpbmsgdGhlcmUgaGF2ZSBw
b3NzaWJseSBiZWVuIHNvbWUgaW5jb21wYXRpYmxlIGNoYW5nZXMsIGFzIEkga25vdwo+IGVhcmx5
IHcvIGJwIGZpbGVzIHRoaW5ncyB3ZXJlIG1vcmUgaW4gZmx1eC4gVGhhdCBzYWlkLCB0aGVyZSBo
YXZlbid0Cj4gYmVlbiBtYW55IGNoYW5nZXMgdG8gdGhlIGxpYmRybSBicCBmaWxlcyBzaW5jZSB0
aGUgY29udmVyc2lvbiB3YXMKPiBmaXJzdCBkb25lIGluIDIwMTcgKHNvIEFuZHJvaWQgTykuIEkn
bGwgY2hlY2tvdXQgTiBhbmQgdmFsaWRhdGUgc28gSQo+IGNhbiBwcm92aWRlIGEgbW9yZSBjb25j
cmV0ZSBhc3N1cmFuY2UuCgpBaC4gQ3J1ZC4gWW91J3JlIHJpZ2h0LiBUaGUgYnAgc3ludGF4IGhh
cyBzaGlmdGVkIGVub3VnaCBvdmVyIHRpbWUgdG8KY2F1c2UgcHJvYmxlbXMgdy8gdGhlIGN1cnJl
bnQgZmlsZSB3aGVuIGJ1aWxkaW5nIGFnYWluc3Qgb2xkZXIgQW5kcm9pZApyZWxlYXNlcy4gICBO
IGZhbGxzIG92ZXIgcHJldHR5IGhhcmQsIGFuZCBPIGFuZCBldmVuIFAgaGF2ZSBpc3N1ZXMgdy8K
InJlY292ZXJ5X2F2YWlsYWJsZTogIiwgYW5kICJwcmVidWlsdF9ldGMiIHN5bnRheC4gIFNvIG15
IHByb3Bvc2VkCmNvbW1pdCBtZXNzYWdlIG1pc2NoYXJhY3Rlcml6ZXMgdGhlIHN0YXRlIG9mIG9s
ZGVyIGJ1aWxkcy4gQXBvbG9naWVzIQoKSSdsbCB0cnkgdG8gcmVhY2ggb3V0IHRvIHRoZSBhbmRy
b2lkIGRldnMgdG8gc2VlIGlmIHRoZXJlJ3MgYW55IHNvcnQKb2YgY29tcGF0IG1hZ2ljIHRoYXQg
Y2FuIGJlIGRvbmUgdG8ga2VlcCB0aGluZ3Mgd29ya2luZyBvbiBvbGRlcgp2ZXJzaW9ucy4gVGhh
dCBzYWlkLCBJJ20gc3RpbGwgdG9ybiwgYXMgd2l0aG91dCB0aGlzIHRoZSBjdXJyZW50CmxpYmRy
bS9tYXN0ZXIgY29kZSBpcyBicm9rZW4gd2l0aCBBT1NQL21hc3RlciBhbmQgUS4gIEl0cyBmcnVz
dHJhdGluZwp3ZSBoYXZlIHRvIGhhdmUgdGhpcyBzZWVtaW5nbHkgZXhjbHVzaXZlIHRyYWRlIG9m
Zi4KCkknbSBjdXJpb3VzIGlmIGZvbGtzIG1pZ2h0IGJlIHdpbGxpbmcgdG8gY29uc2lkZXIgc29t
ZXRoaW5nIGxpa2UgYW4KdXBzdHJlYW0gYnJhbmNoIHRvIHByZXNlcnZlIHRoZSBidWlsZCBiaXRz
IHRoYXQgd29yayB3aXRoIHByaW9yCkFuZHJvaWQgcmVsZWFzZXM/IE9yIGFueSBvdGhlciBpZGVh
cz8KCnRoYW5rcwotam9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
