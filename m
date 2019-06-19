Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A35784C247
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 22:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203D06E471;
	Wed, 19 Jun 2019 20:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212646E45F;
 Wed, 19 Jun 2019 20:21:37 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w13so1134170eds.4;
 Wed, 19 Jun 2019 13:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dt5foXU+GSxuVMklIKIKR8ocB5pAKJsCTrBcOxfy50A=;
 b=ZRRCnddWj9lNSDwViVMuZ+58Dp2onVKuaggiVydhV/MWrkC7MM/rlnbL9GXPA88Eh1
 9c0hTJvl5awmYPJwIdld7xgaw6pWrhYXfaWSbhwrSaNmVIaB88YkboN/DGuCaX8Ivsmw
 HzxLC2NagEI2eIbmE5WH3OKvUva688JIByfgGY205/QnpFlHpKOzU0W2NAM0pnRxhvc6
 Mc92D8IX0r9j3qGnHslmoByZt/vcm52g4VVgSVvlkNQFARgTU3FLH9KGKEJ/+66wcREq
 Wsh0VS25gTbcagFpBHMYLqilUsKtKrTHQbMXkgtGMrqhRNHOks/s7XkvO5iEY3ttespm
 gzDA==
X-Gm-Message-State: APjAAAXo7W/ZUCAEsC6y+0fzdE+b1IpAWmi99M1zVOI8bBol2SV28irU
 CH/MiqxNfdBsf6peNheinsr7m7kCfd0TneME9g4=
X-Google-Smtp-Source: APXvYqxiuHWkvqriR4R7oJlLWlmCuNQMbohUlkbW5G32Zn3s+lqiJyUeJOj/hTLGnhHr/AUshdmpn/1PBNhzP8/JWNg=
X-Received: by 2002:a17:906:f85:: with SMTP id
 q5mr12605405ejj.192.1560975695671; 
 Wed, 19 Jun 2019 13:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-3-masneyb@onstation.org>
 <CAL_Jsq+Ne=NEcLbO6C19iOny4bwm_m5QEtcsM78ZDeBmDUVO_Q@mail.gmail.com>
In-Reply-To: <CAL_Jsq+Ne=NEcLbO6C19iOny4bwm_m5QEtcsM78ZDeBmDUVO_Q@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 19 Jun 2019 13:21:20 -0700
Message-ID: <CAF6AEGs6By9-LGRBAPw2OwR9tRKJtEiZVgS2WVWRXmOK1VxNLA@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: display: msm: gmu: add optional ocmem
 property
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Dt5foXU+GSxuVMklIKIKR8ocB5pAKJsCTrBcOxfy50A=;
 b=AraBg7zqtUA6q56HZl04tbp2kVZutw3FJe0SuFvMdzlxMIh0y3Mp5tKVIffuYBaWhJ
 JpxJcI3RzyjyEJ6p9od/SmjAsFYCIBUXkIft4Khrxe0AKzGYNCosKu912/XWzMdlZrQ+
 pQIGYai+TE2OHtyzYVeetKp9QZHt0RWHwfjsVfa9CHReYql6rUPYo8qmQ8KvB1xT7xNv
 ktBWchctw34EaZdJKN6v9yMkpoGFee9QG1YpS/mAfmLdvnq81dig+lrfXLQvKU6Nea9u
 TGmh/XbuIW33FWdoT+srdSJ9LRZNlDE/ZNJwpOujVbhLBt7GaLqttSG6hB1tuLCxSj8c
 FlJA==
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
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Brown <david.brown@linaro.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <sean@poorly.run>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMToxNyBQTSBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFN1biwgSnVuIDE2LCAyMDE5IGF0IDc6MjkgQU0gQnJpYW4g
TWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+IHdyb3RlOgo+ID4KPiA+IFNvbWUgQTN4eCBh
bmQgQTR4eCBBZHJlbm8gR1BVcyBkbyBub3QgaGF2ZSBHTUVNIGluc2lkZSB0aGUgR1BVIGNvcmUg
YW5kCj4gPiBtdXN0IHVzZSB0aGUgT24gQ2hpcCBNRU1vcnkgKE9DTUVNKSBpbiBvcmRlciB0byBi
ZSBmdW5jdGlvbmFsLiBBZGQgdGhlCj4gPiBvcHRpb25hbCBvY21lbSBwcm9wZXJ0eSB0byB0aGUg
QWRyZW5vIEdyYXBoaWNzIE1hbmFnZW1lbnQgVW5pdCBiaW5kaW5ncy4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KPiA+IC0tLQo+ID4g
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUudHh0IHwg
NCArKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUu
dHh0Cj4gPiBpbmRleCA5MGFmNWIwYTU2YTkuLmM3NDZiOTVlOTVkNCAxMDA2NDQKPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUudHh0Cj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211
LnR4dAo+ID4gQEAgLTMxLDYgKzMxLDEwIEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gPiAgLSBp
b21tdXM6IHBoYW5kbGUgdG8gdGhlIGFkcmVubyBpb21tdQo+ID4gIC0gb3BlcmF0aW5nLXBvaW50
cy12MjogcGhhbmRsZSB0byB0aGUgT1BQIG9wZXJhdGluZyBwb2ludHMKPiA+Cj4gPiArT3B0aW9u
YWwgcHJvcGVydGllczoKPiA+ICstIG9jbWVtOiBwaGFuZGxlIHRvIHRoZSBPbiBDaGlwIE1lbW9y
eSAoT0NNRU0pIHRoYXQncyBwcmVzZW50IG9uIHNvbWUgU25hcGRyYWdvbgo+ID4gKyAgICAgICAg
IFNvQ3MuIFNlZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3Fjb20vcWNv
bSxvY21lbS55YW1sLgo+Cj4gV2UgYWxyZWFkeSBoYXZlIGEgY291cGxlIG9mIHNpbWlsYXIgcHJv
cGVydGllcy4gTGV0cyBzdGFuZGFyZGl6ZSBvbgo+ICdzcmFtJyBhcyB0aGF0IGlzIHdoYXQgVEkg
YWxyZWFkeSB1c2VzLgo+Cj4gQWxzbywgaXMgdGhlIHdob2xlIE9DTUVNIGFsbG9jYXRlZCB0byB0
aGUgR01VPyBJZiBub3QgeW91IHNob3VsZCBoYXZlCj4gY2hpbGQgbm9kZXMgdG8gc3ViZGl2aWRl
IHRoZSBtZW1vcnkuCj4KCmlpcmMsIGRvd25zdHJlYW0gYSBsYXJnZSBjaHVuayBvZiBPQ01FTSBp
cyBzdGF0aWNhbGx5IGFsbG9jYXRlZCBmb3IKR1BVLi4gdGhlIHJlbWFpbmRlciBpcyBkeW5hbWlj
YWxseSBhbGxvY2F0ZWQgZm9yIGRpZmZlcmVudCB1c2UtY2FzZXMuClRoZSB1cHN0cmVhbSBkcml2
ZXIgQnJpYW4gaXMgcHJvcG9zaW5nIG9ubHkgaGFuZGxlcyB0aGUgc3RhdGljCmFsbG9jYXRpb24g
Y2FzZSAoYW5kIEkgZG9uJ3QgdGhpbmsgd2UgaGF2ZSB1cHN0cmVhbSBzdXBwb3J0IGZvciB0aGUK
dmFyaW91cyBhdWRpbyBhbmQgdmlkZW8gdXNlLWNhc2VzIHRoYXQgdXNlZCBkeW5hbWljIE9DTUVN
IGFsbG9jYXRpb24KZG93bnN0cmVhbSkKCkFsdGhvdWdoIG1heWJlIHdlIHNob3VsZCBzdGlsbCBo
YXZlIGEgY2hpbGQgbm9kZSB0byBzZXBhcmF0ZSB0aGUKc3RhdGljYWxseSBhbmQgZHluYW1pY2Fs
bHkgYWxsb2NhdGVkIHBhcnRzPyAgSSdtIG5vdCBzdXJlIHdoYXQgd291bGQKbWFrZSB0aGUgbW9z
dCBzZW5zZS4uCgpCUiwKLVIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
