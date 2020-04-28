Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7787F1BC133
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 16:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D57F6E7FE;
	Tue, 28 Apr 2020 14:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A676E7F5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 14:28:04 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01645206D9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 14:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588084084;
 bh=D7QNgWTGi3LFiveU1UlSuH8oqtvhgNGqKALwImoVYkY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=o29hVvvQad0SDi9yf0TpO1MvWtpwYZqpd618/5yEjDqWmjCyASAVgED8qreXsCwJ6
 pcjomR4yyq7assm3J+isPP0SgXijqTklM/ILcQhMOnvia80RWdj+wTzAbPqTGXzcOp
 hB1VoplClc9b9cPdQ4oqVX4wYoPzFaBl3t+jSxJY=
Received: by mail-ot1-f51.google.com with SMTP id b13so32920965oti.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 07:28:03 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ8iQT75idOvCJKfgtSM0hWlMVBYaskwxJofoj+URPiftJHA4GJ
 s7FFPcAGqv8QQUdlJpHbKSufnM7BBfekoLaGNg==
X-Google-Smtp-Source: APiQypK3X4aUyiYhPAHhaTh4SayCKXYiLxNTHCd8y/oQZhydp53nEzkfEni/GtmVYYFLz/z1zRBGLXTAo3ngLC2yGQU=
X-Received: by 2002:a9d:1441:: with SMTP id h59mr23106980oth.192.1588084083280; 
 Tue, 28 Apr 2020 07:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200420215728.1927434-1-bjorn.andersson@linaro.org>
 <20200425175842.GA3773@ravnborg.org>
In-Reply-To: <20200425175842.GA3773@ravnborg.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 28 Apr 2020 09:27:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL6bMwrXZqvGz_H_aJi+EeoikBwKznLP2VomJ=Wn822Rg@mail.gmail.com>
Message-ID: <CAL_JsqL6bMwrXZqvGz_H_aJi+EeoikBwKznLP2VomJ=Wn822Rg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: simple: Add IVO M133NWF4 R0
To: Sam Ravnborg <sam@ravnborg.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBBcHIgMjUsIDIwMjAgYXQgMTI6NTggUE0gU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPiB3cm90ZToKPgo+IEhpIEJqw7Zybi4KPgo+IE9uIE1vbiwgQXByIDIwLCAyMDIwIGF0
IDAyOjU3OjI3UE0gLTA3MDAsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToKPiA+IERlZmluZSB0aGUg
dmVuZG9yIHByZWZpeCBmb3IgSW5mb1Zpc2lvbiBPcHRvZWxlY3Ryb25pY3MgYW5kIGFkZCB0aGVp
cgo+ID4gTTEzM05XRjQgUjAgMTMuMyIgRkhEICgxOTIweDEwODApIFRGVCBMQ0QgcGFuZWwgdG8g
dGhlIGNvbXBhdGlibGUgbGlzdAo+ID4gb2YgcGFuZWwtc2ltcGxlLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc+Cj4KPiBJ
IGdvdCBPSyBmb3IgdGhlIHZlbmRvciBwcmVmaXggb24gaXJjIHNvIHBhdGNoIGlzIG5vdyBhZGRl
ZCB0bwo+IGRybS1taXNjLW5leHQuCj4gQW5vdGhlciB0aW1lIHBsZWFzZSB1c2UgYSBkZWRpY2F0
ZWQgcGF0Y2ggZm9yIHZlbmRvci1wcmVmaXgKPiBzbyBpdCBpcyBub3QgaGlkZGVuIHdpdGggb3Ro
ZXIgc3R1ZmYuIFRoaXMgd2F5IHRoZSBjaGFuY2UKPiB0byBnZXQgdGhlIGF0dGVudGlvbiBvZiB0
aGUgcmlnaHQgcGVvcGxlIGlzIGJldHRlci4KCkkgc2hvdWxkIGhhdmUgbWVudGlvbmVkIHRoZXJl
J3MgYmFzaWNhbGx5IG9uZSB0aGluZyB0byBjaGVjazoKYWxwaGFiZXRpY2FsIG9yZGVyLgoKVGhl
IGdvb2QgbmV3cyBpcyBib3RoIGZpbGVzIGdvdCBpdCB3cm9uZywgc28gYXQgbGVhc3Qgd2UncmUg
Y29uc2lzdGVudC4gOikKClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
