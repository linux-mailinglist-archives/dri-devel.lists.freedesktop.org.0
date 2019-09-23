Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B071ABB547
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED566E907;
	Mon, 23 Sep 2019 13:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F186E907
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 13:31:31 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id r26so33325332ioh.8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 06:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3+RYvpW6t7ADMYkerd+xeHNQ43Bh09ixj7XaFyC3Hbg=;
 b=aQqUfqYQbC/Jquqr0H0kVTJSomDYfr7c7490bsxiSefoIXYWq07o8N7CCWIviC4Pv/
 MnYgA7TtIK4mIt6DWKch+O+gx52+3vPfxly7KtSBYplTnAvKn5ci8rSiRRBPVKIEHdae
 V6hMUC38pk9jpg3d5OBc/c55AFPNImxYYpZvd1dI4Mfpe2jsNvqENjPyJLShcoGxE55r
 0wVTtkaW4nfKz0DSBT0WoRaMMUS3g1ew3Mew3KmauIS+hDWxZ6X3V84YpPp5F8trAHpO
 sFOH/hA+HVlTIY1QS0mmXmzUU1BKcYOKVg0J9x8ST/hx1WINN5oSdmQLugW0VJihlYol
 qJlQ==
X-Gm-Message-State: APjAAAUEhb8dcySlwCIp/ThCIleQNya6CrtkdywY/Vpr6zjmccYSiKZl
 PGqzz31a9ZmPo0YAvf97nu/vf1QMPtp4Aeg67ls=
X-Google-Smtp-Source: APXvYqw0DEPqirZ/GJL7O38ranF6+/QvHWDJuhu5rwTfjUDwNPVY+dYgCxKdkvUwJorgBrV31AVMzJLj+DOAzQ5GmOg=
X-Received: by 2002:a02:6017:: with SMTP id i23mr36944468jac.0.1569245490276; 
 Mon, 23 Sep 2019 06:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190917161214.2913-1-aford173@gmail.com>
 <20190917161214.2913-2-aford173@gmail.com>
 <20190921190708.GB32133@ravnborg.org>
In-Reply-To: <20190921190708.GB32133@ravnborg.org>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 23 Sep 2019 08:31:18 -0500
Message-ID: <CAHCN7x+j9dsn8R202Y_rQUzO8g3SFatt8TzWUYsgADqCnTR=-Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: Add Logic PD Type 28 display panel
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3+RYvpW6t7ADMYkerd+xeHNQ43Bh09ixj7XaFyC3Hbg=;
 b=eWy408zz+ozFC/Lbg71VkerP1XtastaivcX61SsWwiN++zVJvIWGdrzjGsNScWdqY7
 G3uNY1yjn2gyuy7bOSbCkyn/SoboYis22Z9Dj0Aj17NSHRJIuccQihnCvHwH3pDdjkNX
 cGnuILaR3IRK/jPlERiwWz0p1QvvzDDh3VeMU8TNLUuB+85zTMc1FJenUfVbx2paHF6X
 FcaBrAg6Q5KbtvIiarsSq8fsHBPtN14ytb1U+37xsmuI8rUpKRjns34ZsFnq9NXP6ZVK
 Qa+qKAsHK+d5P5u64lVZzt1HJ1u7JxZpA4Q2z0kaCpfSliUOo0s3kuTGx+b/aoeWXoJB
 WSEQ==
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBTZXAgMjEsIDIwMTkgYXQgMjowNyBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+Cj4gSGkgQWRhbS4KPgo+IEdvb2Qgd2l0aCBldmVuIG1vcmUgcGFuZWxz
Lgo+IEJ1dCBmb3IgbmV3IGJpbmRpbmdzIHBsZWFzZSB1c2UgbWV0YS1zY2hlbWEgKC55YW1sKSBm
b3JtYXQuCj4gVGhpcyBpcyB3aGF0IHdlIHVzZSBmb3IgbmV3IGJpbmRpbmdzIGFzIGl0IGFsbG93
cyBiZXR0ZXIKPiB2YWxpZGF0aW9uLgoKSSBkb24ndCBrbm93IHRoYXQgc3ludGF4LCBidXQgSSds
bCB0cnkgdG8gcGllY2UgdG9nZXRoZXIgYSBmZXcKZGlmZmVyZW50IGV4YW1wbGVzIHRvIGNvbWUg
dXAgd2l0aCBzb21ldGhpbmcuICBJIHNob3VsZCBoYXZlIGEgVjIKdG9kYXkuCgphZGFtCj4KPiAg
ICAgICAgIFNhbQo+Cj4gT24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMTE6MTI6MTJBTSAtMDUwMCwg
QWRhbSBGb3JkIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBhZGRzIGRvY3VtZW50YXRpb24gb2YgZGV2
aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBXVkdBIHBhbmVsCj4gPiBMb2dpYyBQRCBUeXBlIDI4
IGRpc3BsYXkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFp
bC5jb20+Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL2xvZ2ljcGQsdHlwZTI4LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2xvZ2ljcGQsdHlwZTI4LnR4dAo+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uODI5ZmM1MjEwZTA2Cj4g
PiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9sb2dpY3BkLHR5cGUyOC50eHQKPiA+IEBAIC0wLDAgKzEsMjYgQEAK
PiA+ICtMb2dpYyBQRCBUeXBlIDI4IDQuMyIgV1FWR0EgVEZUIExDRCBwYW5lbAo+ID4gKwo+ID4g
K1RoaXMgYmluZGluZyBpcyBjb21wYXRpYmxlIHdpdGggdGhlIHNpbXBsZS1wYW5lbCBiaW5kaW5n
LCB3aGljaCBpcyBzcGVjaWZpZWQKPiA+ICtpbiBzaW1wbGUtcGFuZWwudHh0IGluIHRoaXMgZGly
ZWN0b3J5Lgo+ID4gKwo+ID4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4gPiArLSBjb21wYXRpYmxl
OiBzaG91bGQgYmUgImxvZ2ljcGQsdHlwZTI4Igo+ID4gKwo+ID4gK09wdGlvbmFsIHByb3BlcnRp
ZXM6Cj4gPiArLSBwb3dlci1zdXBwbHk6IHJlZ3VsYXRvciB0byBwcm92aWRlIHRoZSBzdXBwbHkg
dm9sdGFnZQo+ID4gKy0gZW5hYmxlLWdwaW9zOiBHUElPIHBpbiB0byBlbmFibGUgb3IgZGlzYWJs
ZSB0aGUgcGFuZWwKPiA+ICstIGJhY2tsaWdodDogcGhhbmRsZSBvZiB0aGUgYmFja2xpZ2h0IGRl
dmljZSBhdHRhY2hlZCB0byB0aGUgcGFuZWwKPiBJcyBpdCBjb3JyZWN0IHRoYXQgdGhlc2UgYXJl
IG9wdGlvbmFsIGZvciB0aGUgZGVzY3JpdmJlZCBwYW5lbD8KPgo+ID4gKwo+ID4gK09wdGlvbmFs
IG5vZGVzOgo+ID4gKy0gVmlkZW8gcG9ydCBmb3IgUkdCIGlucHV0Lgo+ID4gKwo+ID4gK0V4YW1w
bGU6Cj4gPiArICAgICBsY2QwOiBkaXNwbGF5IHsKPiA+ICsgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJsb2dpY3BkLHR5cGUyOCI7Cj4gPiArICAgICAgICAgICAgIGVuYWJsZS1ncGlvcyA9IDwm
Z3BpbzUgMjcgR1BJT19BQ1RJVkVfSElHSD47Cj4gPiArICAgICAgICAgICAgIHBvcnQgewo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIGxjZF9pbjogZW5kcG9pbnQgewo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZkcGlfb3V0PjsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICB9Owo+ID4gKyAgICAgICAgICAgICB9Owo+ID4gKyAgICAgfTsKPiA+
IC0tCj4gPiAyLjE3LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
