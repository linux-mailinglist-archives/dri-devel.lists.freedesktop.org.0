Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CDE7861C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D522A89CB9;
	Mon, 29 Jul 2019 07:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25BA6ED90
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 14:31:25 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id m24so105239339ioo.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 07:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rZ/UBeNiBanOLKs9K5WAA6k/h0iDCXstzGMvYChhbN8=;
 b=t3XgRTDB7NQGB/brBv0iJFs36gEwEPBpaJGxLOOt5qPDdLy6FqSwqG/Qss7vgZ+1rU
 +k8rZC4TZrCC2Pqnm+xLGKYKshV4RPXE+tHAsMs604757GKdFRuUrRLZvmqws51mF3na
 gCzfBkIH90YTsyTtBcN+cRnOtvz2Vu9hY+xCboGZns9IKJO9LFr+C0PIm3OxTAt57utw
 VWMbZkEC31d/7swipostXgUiS0RIspfnvBLYrIu/31VWTTSn/ZOYU0G7dQBHxTL0bXsB
 CFNoWdd+NXTaZqkV/7+Azsl111Awyq+biQbwt4OTLS0QEfMBcXlWsXBRX0XrsZazzp4t
 ThOg==
X-Gm-Message-State: APjAAAWlTDM1sZmj11tJXWuUV9zTqbHTxThZRDjxNaI8utgEeOyPaAJQ
 hJkLTiA0KKtKZuhgF/ctfYni2RiA++e05/4wsFE=
X-Google-Smtp-Source: APXvYqyoFusi9rRAzb8Sz4ryxauK7V4EPDxozJDRC9Dy92L8oHNobVWt0IqcIZkUd2t5E2rbe4hpr1GOx/+E7EEzITA=
X-Received: by 2002:a6b:901:: with SMTP id t1mr13636701ioi.42.1564151485320;
 Fri, 26 Jul 2019 07:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
 <20190726123625.GA17037@ravnborg.org>
In-Reply-To: <20190726123625.GA17037@ravnborg.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Fri, 26 Jul 2019 08:31:15 -0600
Message-ID: <CAOCk7NqU7G-afjHwTnQxqrRFcH9=kqDJAUABPHuwRWsdm6xENQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add Sharp panel option for Lenovo Miix 630
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rZ/UBeNiBanOLKs9K5WAA6k/h0iDCXstzGMvYChhbN8=;
 b=Qkr83lkT49ARvGJVqpIAVKE+c3OskLUv7tZduSwYle/0YBDI1fhM3M35Dcm10CPOD6
 oGBJhLWanlvfEu/PCaAedYdFu3iFX9GnV0PyK5Gcoz6j0Y5iEEBn3sYWFz5Hd+F2arb0
 T2sokMAFO0/Sygfx4x/RYdUfRKTMg+sJlzbw2E0TxCmNd95v35OovB5jQws5FGWwQVKp
 tGbHGXnypMThoSExSEfOyJyB0uds+q5lX9GPtaJeVTzfIjhGoFtp10AqYWIz/UUmowJr
 MnV9vSAvagmcnnWHdHv8NZVXwoR9uoiCBznhNgb6GaRVLk+lD2nfRmPOfcHfvK9a+HV/
 4NqA==
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Dave Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 thierry.reding@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgNjozNiBBTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+Cj4gSGkgSmVmZnJleS4KPgo+IE9uIE1vbiwgSnVsIDA4LCAyMDE5IGF0
IDA5OjU2OjQ3QU0gLTA3MDAsIEplZmZyZXkgSHVnbyB3cm90ZToKPiA+IFRoZSBMZW5vdm8gTWlp
eCA2MzAgbGFwdG9wIGNhbiBiZSBmb3VuZCB3aXRoIG9uZSBvZiB0d28gcGFuZWxzIC0gYSBCT0UK
PiA+IG9yIFNoYXJwIG9wdGlvbi4gIFRoaXMgbGlrZWx5IHByb3ZpZGVzIG9wdGlvbnMgZHVyaW5n
IG1hbnVmYWN0dXJpbmcuCj4gPgo+ID4gVGhlc2UgcGFuZWxzIGNvbm5lY3QgdmlhIGVEUCwgaG93
ZXZlciB0aGV5IHNpdCBiZWhpbmQgYSBEU0kgdG8gZURQCj4gPiBicmlkZ2Ugb24gdGhlIGxhcHRv
cCwgc28gdGhleSBjYW4gZWFzaWx5IGJlIGhhbmRsZWQgYnkgdGhlIGV4aXN0aW5nCj4gPiBzaW1w
bGUgcGFuZWwgY29kZS4KPiA+Cj4gPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBT
aGFycCBvcHRpb24uCj4gPgo+ID4gdjI6Cj4gPiAtcmVtb3ZlZCBuby1ocGQgZnJvbSBkdCBleGFt
cGxlCj4gPiAtYWRkZWQgLmJ1c19mb3JtYXQgYW5kIC5idXNfZmxhZ3MgZmllbGRzIGJhc2VkIG9u
IHJldmlld3MKPiA+IC1hZGRlZCAuZmxhZ3MgYWZ0ZXIgQmpvcm4gcG9pbnRlZCBtZSB0byBzb21l
dGhpbmcgSSBtaXNzZWQKPiA+IC1hZGRlZCBTYW0ncyByZXZpZXdlZC1ieSB0YWdzCj4gPgo+ID4g
SmVmZnJleSBIdWdvICgyKToKPiA+ICAgZHQtYmluZGluZ3M6IHBhbmVsOiBBZGQgU2hhcnAgTEQt
RDUxMTZaMDFCCj4gPiAgIGRybS9wYW5lbDogc2ltcGxlOiBBZGQgc3VwcG9ydCBmb3IgU2hhcnAg
TEQtRDUxMTZaMDFCIHBhbmVsCj4KPiBUaGFua3MuCj4gQm90aCBwYXRjaGVzIGFwcGxpZWQgYW5k
IHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0LgoKRXhjZWxsZW50LiAgVGhhbmtzCgo+IEFyZSB5b3Ug
dXAgdG8gYSBsaXR0bGUgamFuaXRvcmlhbCB3b3JrPwo+IFRvZGF5IHRoZSBwcmVmZXJyZWQgZm9y
bWF0IGZvciBiaW5kaW5ncyBmaWxlcyBhcmUgdGhlIG5ldyB5YW1sIGZvcm1hdC4KPiBDb3VsZCB5
b3UgdXBkYXRlICd5b3VyJyBmaWxlLCBhbmQgbWF5YmUgdGhlIG90aGVyIHNoYXJwIGZpbGVzIHRv
bz8KCkkgY29uZmVzcyBJIGhhdmVuJ3QgeWV0IGZhbWlsaWFyaXplZCBteXNlbGYgd2l0aCB0aGUg
eWFtbCBmb3JtYXQgeWV0LApidXQgSSdsbCB0YWtlIGEgbG9vayBhbmQgZG8gYW4gdXBkYXRlIG9u
Y2UgSSB1bmRlcnN0YW5kIHRoZQpyZXF1aXJlbWVudHMuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
