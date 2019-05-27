Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F472B1DF
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 12:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CF5893D0;
	Mon, 27 May 2019 10:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94080893D0;
 Mon, 27 May 2019 10:12:26 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id k1so3724466vkb.2;
 Mon, 27 May 2019 03:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=bKene/oH32AbqScjh1OM9FENwUtIpe8xn10+tVWgyCY=;
 b=TzsSZ3ib3bOxzdr89KfdhO0PP3fbjrCvdv8LpZO+MKsBJLCwGo14VahwkNdMNg2qeH
 XwySvs5bxkFlF2SGO7vAuxza5K34IO7yYUVXcSWAIukQWJR/2bdp0W5R7296CoZadFbR
 lUz5jQP4zbNAd46ts8Jx/o8QsT+0AuNHjha8hqNWS2e7DaqfOA1T1hnlAI5ANqGVi9V5
 Bg+GUfaZuP+bjyxB3JmX7SsS3qjj19ZMhDKM1zPzv36m9Ld7H8D9GMEMHy24d5Csc+th
 /GR9eCk7h4QB6040bdOp2yvFThGWUnwoXllnbZx3ynDWOp2YCWN6il9VpfCHU95i5WdA
 jXFw==
X-Gm-Message-State: APjAAAWw0kWYE5s1bw6dbTtxP2icjfPZMNxen0iq5t/vqybHhJZT1kkD
 8FeF7rTpWQ4urCkMJlREZLX9/Vbr/Wn160uxp6501jMCZcM=
X-Google-Smtp-Source: APXvYqw8QTJGtkbk2P/jEgmYqctohZraGr+Kg5pGwZQWvuIR3/lNM2mptR/dpwhM6fpimkr7C/VAcNGB3HM7LtR9aVQ=
X-Received: by 2002:a1f:14c1:: with SMTP id 184mr18665855vku.69.1558951945249; 
 Mon, 27 May 2019 03:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLgUBDJ3qhD5mzQ6kYbpO7RHa7EhkfR668wtL6rkhY_s2g@mail.gmail.com>
In-Reply-To: <CAOuPNLgUBDJ3qhD5mzQ6kYbpO7RHa7EhkfR668wtL6rkhY_s2g@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 27 May 2019 15:42:14 +0530
Message-ID: <CAOuPNLjeCkb+685oSOR2FoJMw9-L=Lky0PhVpkgMiV+n+ztdsA@mail.gmail.com>
Subject: Re: dpms mode change with wayland on iMX.6
To: dri-devel@lists.freedesktop.org, paulo.r.zanoni@intel.com, 
 etnaviv@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=bKene/oH32AbqScjh1OM9FENwUtIpe8xn10+tVWgyCY=;
 b=rc7v4BQXqMIkZBML4nD50/d0jkb/wcSfcwHlvPXJhjvFsnhbQxFZ5ApH9cZhAMrpfT
 xC+jauwdSxy5asOpFV3bWtVig545vEOv0GHR+u8rW/Bk3padPb98oWtiGrfpkBG5ixvW
 Isozr5AuVG/bYADT6FIoB55Qr1JvC0BeQiaPqrW5ypX/nxnji7kxzZE+BZHfifP3u2WC
 D+0G/5g5Hmr2cSIbSDGFns7GeJ9Sejt30PTTb78ootY1rweIlJDHzfPjxYpWa7BeLFyV
 InZy35wK1AgisEqWJ8LeYByp3Zq9+qoyekZZKhApnbakl+FZtaR0Nf3Zelt0U+l7cCmn
 zwhg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMTI6NDEgUE0gUGludHUgQWdhcndhbCA8cGludHUucGlu
Z0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRGVhciBBbGwsCj4KPiBJIGhhdmUgYSBpTVguNiAoYXJt
IDMyKSBib2FyZCB3aXRoIExpbnV4IEtlcm5lbCAzLjEwIGFuZCBkZWJpYW4KPiBwbGF0Zm9ybSBy
dW5uaW5nLgo+IFRoZSBib2FyZCBpcyBjb25uZWN0ZWQgdG8gb25lIExDRCBzY3JlZW4gYW5kIG9u
ZSBIRE1JIG1vbml0b3IuCj4gSXQgaGF2ZSBEUk0gKyBXYXlsYW5kIHNldHVwIGZvciBkaXNwbGF5
Lgo+IEFsc28sIEkgbm90aWNlZCB0aGF0IGl0IGhhdmUgdHdvIGRyaSBpbnRlcmZhY2U6Cj4gL2Rl
di9kcmkvY2FyZDAKPiAvZGV2L2RyaS9jYXJkMQo+Cj4gSSBhbSBub3QgdmVyeSBmYW1pbGlhciB3
aXRoIExpbnV4IEdyYXBoaWNzL0Rpc3BsYXkgc3Vic3lzdGVtLCBzbyBJIGFtCj4gbG9va2luZyBm
b3Igc29tZSBoZWxwIGhlcmUuCj4KPiBNeSByZXF1aXJlbWVudCBpcyB0aGF0IEkgaGF2ZSB0dXJu
IG9mZiBIRE1JIGRpc3BsYXkgc2NyZWVuIHVzaW5nIGEKPiBjb21tYW5kIGxpbmUgdXRpbGl0eSBv
ciB0ZXN0IHByb2dyYW0uCj4gSSBsZWFybiB0aGF0IGZvciBYLXNlcnZlciB3ZSBjYW4gdXNlIHhz
ZXQgOiB4c2V0IGRwbXMgZm9yY2Ugb2ZmIChhbmQKPiBpdCB3b3JrcyBvbiBteSB1YnVudHUgZGVz
a3RvcCB3aXRoIDE2LjA0KS4KPgo+IEhvd2V2ZXIgdGhpcyBjb21tYW5kIGRvZXMgbm90IGV4aXN0
cyBvbiBteSBib2FyZC4KPiBTbywgbXkgcXVlc3Rpb24gaXM6Cj4gSXMgdGhlcmUgYW55IGVxdWl2
YWxlbnQgRFBNUyBjb21tYW5kcyBmb3IgV2F5bGFuZC9XZXRzb24/Cj4KPiAtLS0tLS0tLS0KPiBG
dXJ0aGVyLCBpbiBvcmRlciB0byBleHBsb3JlIG1vcmUsIEkgY2xvbmVkIGxpYmRybSBjb2RlIGZy
b20gaGVyZToKPiB1cmwgPSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9kcm0K
Pgo+IFRoZW4gSSBmb3VuZCBzb21lIHRlc3QgdXRpbGl0eSB1bmRlcjogZHJtL3Rlc3RzIGZvbGRl
ci4KPiBBZnRlciBleHBsb3JpbmcgbW9yZSwgYW5kIGZldyBtb2RpZmljYXRpb24sIHNvbWVob3cg
SSBjb3VsZCBhYmxlIHRvCj4gY3Jvc3MtY29tcGlsZSAicHJvcHRlc3QiIGZvciBteSBib2FyZCB1
c2luZyBiZWxvdzoKPiBhcm0tbGludXgtZ251ZWFiaS1nY2MgLW8gcHJvcHRlc3Qub3V0IHByb3B0
ZXN0LmMKPiAtSS4vdGFyZ2V0L2xpYmRybV9pbmNsdWRlLyAtTC4vdGFyZ2V0L2xpYmRybV9saWIv
IC1sZHJtCj4KPiBJIGZvdW5kIHRoYXQgIi9kZXYvZHJpL2NhcmQwIiBpcyBub3Qgd29ya2luZyB3
aXRoIHRoaXMgdGVzdC4KPiBTbywgSSBjaGFuZ2VkIHRoZSB0ZXN0IHV0aWxpdHkgbGlrZSB0aGlz
Ogo+IGZkID0gZHJtT3BlbigiaW14LWRybSIsIE5VTEwpOwo+IE9SCj4gZmQgPSBvcGVuKCIvZGV2
L2RyaS9jYXJkMSIsIE9fUkRXUik7Cj4KPiBXaGVuIEkgZGVmYXVsdCBydW4gaXQgb24gbXkgYm9h
cmQsIEkgc2VlIHRoYXQgIkNvbm5lY3Rvcl9pZDogMjkiIGlzCj4gc2hvd2luZyBmb3IgdGhlIEhE
TUkgZGlzcGxheSBhbmQgaXQgY2FuIHN1cHBvcnQgRFBNUyBwcm9wZXJ0eS4KPiB7e3sKPiBDb25u
ZWN0b3IgMjkgKDExLTEpCj4gICAgICAgICAxIEVESUQ6Cj4gICAgICAgICAgICAgICAgIGZsYWdz
OiBpbW11dGFibGUgYmxvYgo+ICAgICAgICAgICAgICAgICBibG9iczoKPgo+ICAgICAgICAgICAg
ICAgICB2YWx1ZToKPiAgICAgICAgICAgICAgICAgICAgICBYWFhYWFhYCj4gICAgICAgICAyIERQ
TVM6Cj4gICAgICAgICAgICAgICAgIGZsYWdzOiBlbnVtCj4gICAgICAgICAgICAgICAgIGVudW1z
OiBPbj0wIFN0YW5kYnk9MSBTdXNwZW5kPTIgT2ZmPTMKPiAgICAgICAgICAgICAgICAgdmFsdWU6
IDAKPiBDUlRDIDI0Cj4gQ1JUQyAyNwo+IH19fQo+Cj4gVGhlbiwgd2hlbiBJIHRyeSB0byBydW4g
aXQgdXNpbmcgYmVsb3cgY29tbWFuZDoKPiAjIC4vcHJvcHRlc3Qub3V0IDI5IGNvbm5lY3RvciAy
IDMKPgo+IFRoZSBwcm9ncmFtIGp1c3QgcmV0dXJucyBzdWNjZXNzZnVsbHkgd2l0aG91dCBhbnkg
ZXJyb3JzLCBidXQgbm90aGluZwo+IGhhcHBlbnMuIFRoZSBkaXNwbGF5IGRvZXMgbm90IHR1cm5z
IG9mZi4KPiBJIHNhdyB0aGF0IGluIG15IGtlcm5lbCAzLjEwIHRoZSBpb2N0bChEUk1fSU9DVExf
TU9ERV9TRVRQUk9QRVJUWSkgaXMKPiBhbHJlYWR5IHN1cHBvcnRlZCB1bmRlciBEUk0uCj4KPiBT
bywgSSBhbSB3b25kZXJpbmcgd2hhdCBpcyB0aGUgcmlnaHQgd2F5IHRvIHZlcmlmeSBEUE1TIG1v
ZGUgcHJvcGVydHkKPiBvbiB3YXlsYW5kID8KPgo+IElmIGFueWJvZHkgaGF2ZSBhbnkgc3VnZ2Vz
dGlvbnMsIHBsZWFzZSBoZWxwIG1lLgo+Cj4KPiBUaGFua3MsCj4gUGludHUKCisgZXRuYXZpdkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
