Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2006166D5
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 17:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0066C6E7F0;
	Tue,  7 May 2019 15:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x12b.google.com (mail-it1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D346E7EA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 15:35:13 +0000 (UTC)
Received: by mail-it1-x12b.google.com with SMTP id o190so9319397itc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 08:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PjU6agHg62J8TrBTjaU+yUVLUh0B6X5XmxeccDOwZoo=;
 b=Gp5P2Phui0xwBwuhwSUHHP+L8qHHIqQgmRRguit/n08LpkVzFdWlkSuTqgZtLcbRKq
 nrxpTyjT8UPFAekIDVw2srnazRcwlEPFKc5b+GuxVGcg3I5+87827c0uuGI/vHsfRFou
 6Lxkqk+kxKB+2NDIPvhosX+TPiT8k3dZuIc2HFzMWMTFBXh6r8ekwkiP5LdQWXOdMWHR
 5Rci4qAglj4jgfsw4ZG4/FzN5IRDsWMvGJT10g+UbNR6mW7HZ2QMMBdyOetbML1iiaC7
 /0n42Btnxg+pdEz20goG3N8OSEQsaWcG4WnE+wx96kcRTKbNdzDk4OrjCYf2CZGF0HuW
 JQ7Q==
X-Gm-Message-State: APjAAAWU8XYwtiq+p3rYZEPbEbLDFxkd6Iiv5d2PKscryYe/I9IU9RtC
 fbrqNlqqDLP0tARWx0dR1JkMwiod0fCQn8TqVjcEdA==
X-Google-Smtp-Source: APXvYqwKRpvTKI14gDTHaW/gqFH8DbYOua0IkpW8m/wbHs89ScoA2BXhjYvvHAqSO9xqGBxA++AeBmYhNnyGcPf53Ro=
X-Received: by 2002:a24:39c6:: with SMTP id l189mr24066425ita.51.1557243313367; 
 Tue, 07 May 2019 08:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAKzjFstQdAM8tY-8YhF5HDtoZGMcuJnRXYQswnwgsnyvAbKR7A@mail.gmail.com>
 <CAKMK7uEFBJ=2O7aBE2=UdGrZSEku9Yvx8ABqiB2JsY=XwEgxzg@mail.gmail.com>
In-Reply-To: <CAKMK7uEFBJ=2O7aBE2=UdGrZSEku9Yvx8ABqiB2JsY=XwEgxzg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 7 May 2019 17:35:02 +0200
Message-ID: <CAKMK7uGqag9RPKVumtaYNRNALZMHrebs0z605ch1SrN2FknfvQ@mail.gmail.com>
Subject: Re: XORG Endless Vacation of Code
To: Karthik Guru <karth251998@gmail.com>, evoc@foundation.x.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=PjU6agHg62J8TrBTjaU+yUVLUh0B6X5XmxeccDOwZoo=;
 b=h30QiWHY5fhbTrjH5RCxrmRoch6yTGv2xy91I3dUygblU8qr0S3qhisBoh2fDR6q4o
 W3NkzsUI9chGHsZRzAtN2L1eifyPCPoHEVc/GqqI05zZeV2EW3VLo17Oot7lWro1Dsqd
 /G4Cd2OCzxj3hzod3dCM1m/g+jqJODtr8q7r4=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHVwIHRvIG1lYW4gdGhlIGV2b2MgbGlzdCwgbm90IHRoZSBldmVudCBsaXN0LgotRGFuaWVs
CgpPbiBUdWUsIE1heSA3LCAyMDE5IGF0IDU6MzQgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPiB3cm90ZToKPgo+IEFkZGluZyBldm9jIGxpc3QuCj4gLURhbmllbAo+Cj4gT24gVHVl
LCBNYXkgNywgMjAxOSBhdCAzOjI4IFBNIEthcnRoaWsgR3VydSA8a2FydGgyNTE5OThAZ21haWwu
Y29tPiB3cm90ZToKPiA+Cj4gPiBIZXkKPiA+Cj4gPiBDb3VsZCB5b3UgcGxlYXNlIHRlbGwgbWUg
aWYgYXBwbGljYXRpb25zIGFyZSBvcGVuIGZvciBYT1JHIEVWT0M/Cj4gPgo+ID4gQWxzbywgd2hh
dHMgdGhlIHByb2NlZHVyZSBmb3Igd3JpdGluZyBhIHByb3Bvc2FsIGZvciBhbnkgb2YgdGhlIHBy
b2plY3RzCj4gPgo+ID4gVGhhbmtzIQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4KPgo+Cj4gLS0KPiBEYW5pZWwgVmV0dGVyCj4g
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gKzQxICgwKSA3OSAzNjUgNTcg
NDggLSBodHRwOi8vYmxvZy5mZndsbC5jaAoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBF
bmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8v
YmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
