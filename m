Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FADD03C8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 01:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867DC6E8A9;
	Tue,  8 Oct 2019 23:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CF76E8A9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 23:06:15 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id c4so329598edl.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 16:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AZPcXCSdsuH7pWA3OZ3bGM7hGC52lMLSkaaLoVWixK4=;
 b=aPYbNwDdV6JrgRGiOIahptjfqO/b9xV8xAnf+wJSRucCAjWp3Q/0PmIevnt7QmlO/T
 1S/wTTGSfD5IZr12a3qw25CMynSrlKVbfqKyU8eQCty8HPeAPO3qYGwU3rP5rUtnawvw
 nW/+tWVaCUsd9oKH/2IJQr9EeEgQsdLVUF7aiAVrHpDNWnJgkNJ0/c6SXDjmDHjNbKVW
 XKCCTZVH5FZeYYrDv52lk4aTDcPczCMDP8tlbR1xM8EEblqOkykYnPM8WLYSU4/CfpTV
 859CQtfEcC0V8PXjEMGrjgNYJS6MyAvRpWYjORxRzzTPWHzmiSEpLEaMD2o49A8+ge9n
 wMzA==
X-Gm-Message-State: APjAAAVWyxvy4fiPAV68wK0m9umpGzQ32BLret6S4hhKcIOOsCzp8L15
 Tq0nbKV6By15pxobA+bIxDREYHGS+jPyNdXNiSw=
X-Google-Smtp-Source: APXvYqwvFewExUe2r+0It8MkIQ6I7IT1qowU6KW6inCShjd/CsASKWNIaoC61tzK2AAI/55RSHQNEnaOxC9hKFsaoOA=
X-Received: by 2002:a05:6402:557:: with SMTP id
 i23mr392675edx.71.1570575973700; 
 Tue, 08 Oct 2019 16:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <02b510a8a0b43b2aa55b0438859fb9fbd0f89f25.1570547447.git.robin.murphy@arm.com>
 <CAL_JsqL__+b46WHd3_cgVBcD5jdCPenqY4mQLjLcs5tvoUUmqg@mail.gmail.com>
In-Reply-To: <CAL_JsqL__+b46WHd3_cgVBcD5jdCPenqY4mQLjLcs5tvoUUmqg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 8 Oct 2019 16:06:02 -0700
Message-ID: <CAF6AEGtrvQ064G4MUyWdOcwiUkGfSrw0TbjtMu2bQSi62z3cJw@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Quiet shrinker messages
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AZPcXCSdsuH7pWA3OZ3bGM7hGC52lMLSkaaLoVWixK4=;
 b=IQfocEa+M1NGZDN50AfcuD7MumU+Fc7tLANP4DjV9xlawCyRihBUbueptqQJ+jXLJB
 s6vgyN4HCOA9v2HxOgxW3vu8UoCtNzNlZHokDZsz5JXWKRGowtGt6e8MlG8HsJSjWLc3
 6Abhx6c2I8Q3xHLr6ZOMvfcFpPQGX2DV7Hmj+TGGVdbAZmmvFNHLYMZr8/SEh6g9Uyfi
 SojqZE1tXzNRML42U1OHSB5dAER3mn4JG3k9i/5Y5CMp6M+fgXIccTKPc9xjvbnvMuxu
 MH3hV65KNdWN6ZzKHl0kw+v0nl3B6VIV0gFSoUjN9mFQv7dREyJ/4NvBwTsweuepJFnB
 DM5w==
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
Cc: Robin Murphy <robin.murphy@arm.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgOCwgMjAxOSBhdCAyOjQ2IFBNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBPY3QgOCwgMjAxOSBhdCAxMDoxMyBBTSBSb2JpbiBNdXJw
aHkgPHJvYmluLm11cnBoeUBhcm0uY29tPiB3cm90ZToKPiA+Cj4gPiBBcyBicm91Z2h0IHVwIG9u
IElSQywgbG9nZ2luZyBhIHZhZ3VlIGFuZCB1bmF0dHJpYnV0ZWQgbWVzc2FnZSBmb3IgYQo+ID4g
bm9ybWFsIGFuZCBleHBlY3RlZCBvcGVyYXRpb24gbG9va3MgYSBiaXQgc3BhbW15LiBVc2UgYSBk
ZXZfKiB2YXJpYW50Cj4gPiB0byBjbGFyaWZ5IGl0IGFzIGEgZHJpdmVyIG1lc3NhZ2UsIGFuZCBk
b3duZ3JhZGUgdGhlIGxldmVsIHRvIGRlYnVnIHRvCj4gPiBhdm9pZCBjbHV0dGVyaW5nIHVwIGVu
ZCB1c2VycycgbG9ncy4KPgo+IElmIGl0IHdhcyBnb29kIGVub3VnaCBmb3IgbXNtLCBpdCdzIG5v
dCBnb29kIGVub3VnaCBmb3IgdXM/Cj4KCkkgc3VwcG9zZSB0aGVyZSBhcmUgZGlmZmVyaW5nIG9w
aW5pb25zIGFib3V0IHNocmlua2VyIHNwYW0uLiBJIGtpbmRhCmxpa2UgdG8ga25vdyB3aGVuIGl0
IGlzIGhhcHBlbmluZywgT1RPSCBpdCBpcyBhIG11Y2ggbW9yZSBub3JtYWwKc2l0dWF0aW9uIG9u
IGRldmljZXMgd2l0aCBsZXNzIFJBTSBvciBhbmRyb2lkLi4KCmlzIHRoZXJlIGEgcmF0ZWxpbWl0
ZWQgdmVyc2lvbiBvZiBkZXZfZGJnKCksIHRob3VnaD8gIFlvdSBtaWdodCB3YW50IHRoYXQuLgoK
QlIsCi1SCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
