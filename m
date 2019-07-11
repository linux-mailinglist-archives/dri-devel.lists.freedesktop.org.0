Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAA965EDB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 19:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8176E132;
	Thu, 11 Jul 2019 17:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81166E132
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 17:42:44 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w20so6606208edd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 10:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sDCTVVop4NPgBu2WxG9CKMJq6Rz5EG8pMIpMsrokx0Q=;
 b=uBlgWiFvrwzmSHbJJApcWwQaDDkZ2DOu4ASw/J2pmNHk+uSlzZR6oPEEwIj6yyIvTo
 k2gWr5rfqmri4rPkNHqakVnNrf6ttWx/IkBBwuQ3tek24Hsc0doJQprqyMSmnolsnHM3
 czWCePdtZyEfwtz3qzDljMRFd9rEAD+3QT6lVFHTnXwIvNwAuzDNNADRnsNFv3OhrSJG
 odDGFvhlChl5HJC8tPSVLuL2oCwsLpjD40Iej8g2dCdCTKAUgT3Q21ScYCPMfQqJlWGk
 Hqdg7QdfQL5jpxghFtMeSQNW2iWdk1UgN0osh/WBtmNz6a7kyGJfLA4Gmtd99DVI+PJM
 mMVQ==
X-Gm-Message-State: APjAAAV/Up7fl/8Rz6Yn7pBEOenlnyZnFnfhky6h7NcHVE+aReoUcySN
 8gADdHj6LDumrqbU8+yia5RmJWWXMXWQ2rY5Cgo=
X-Google-Smtp-Source: APXvYqybvEj2gI8a+mKBgq/L1/X8hSAoV6wPjO69HykrLFeoq6zIaiUwmcQ6LeSMTx1h28aL9hhcTtZYF32EUx/Iurw=
X-Received: by 2002:a50:9203:: with SMTP id i3mr4933489eda.302.1562866963151; 
 Thu, 11 Jul 2019 10:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190706203105.7810-1-robdclark@gmail.com>
 <20190711164908.GO5247@pendragon.ideasonboard.com>
In-Reply-To: <20190711164908.GO5247@pendragon.ideasonboard.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 11 Jul 2019 10:42:31 -0700
Message-ID: <CAF6AEGvF78tT4aHv1SO56zMD_0FaX=TF+2MmAATTM9rnqLvEsQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: use dev name for debugfs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=sDCTVVop4NPgBu2WxG9CKMJq6Rz5EG8pMIpMsrokx0Q=;
 b=YrfPuLnRDGVP7eg9cdZpsaPagof75FJD/41u5WhkrwxGuDOcBTDryC1LGTVQDUE3Bf
 rPk8w59kCJaAwUXAAxjhHXoC8HXSuyRcUwHai+6q84ZaQXDlpGjlXszEcKAPBQG7OtZJ
 fQN//8VLoNKtd51RzFI3jX1+9S7kqlIl9b9p95xhpp1DrnuYxEwiL2RRhViwPJ1sqzzN
 Rlnx1rYFqSF3+WHhZfNEudYW/p2m8AWHkGUoUsiJMOyTHIebhjbhnK0KXy9LKbjbEH8v
 sZRR4WypeArW8HJbWs7UzZqWVkBIYNzEd4mfpizDhvtkOoSvggwr/l2AHDNYZgcIslT0
 fcZQ==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgOTo0OSBBTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gSGkgUm9iLAo+Cj4gVGhhbmsg
eW91IGZvciB0aGUgcGF0Y2guCj4KPiBPbiBTYXQsIEp1bCAwNiwgMjAxOSBhdCAwMTozMTowMlBN
IC0wNzAwLCBSb2IgQ2xhcmsgd3JvdGU6Cj4gPiBGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0Bj
aHJvbWl1bS5vcmc+Cj4gPgo+ID4gVGhpcyBzaG91bGQgYmUgbW9yZSBmdXR1cmUtcHJvb2YgaWYg
d2UgZXZlciBlbmNvdW50ZXIgYSBkZXZpY2Ugd2l0aCB0d28KPiA+IG9mIHRoZXNlIGJyaWRnZXMu
Cj4gPgo+ID4gU3VnZ2VzdGVkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFy
a0BjaHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNu
NjVkc2k4Ni5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rp
LXNuNjVkc2k4Ni5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYwo+ID4g
aW5kZXggYzhmYjQ1ZTdiMDZkLi45ZjRmZjg4ZDRhMTAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RpLXNuNjVkc2k4Ni5jCj4gPiBAQCAtMjA0LDcgKzIwNCw3IEBAIERFRklORV9TSE9X
X0FUVFJJQlVURShzdGF0dXMpOwo+ID4KPiA+ICBzdGF0aWMgdm9pZCB0aV9zbl9kZWJ1Z2ZzX2lu
aXQoc3RydWN0IHRpX3NuX2JyaWRnZSAqcGRhdGEpCj4gPiAgewo+ID4gLSAgICAgcGRhdGEtPmRl
YnVnZnMgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoInRpX3NuNjVkc2k4NiIsIE5VTEwpOwo+ID4gKyAg
ICAgcGRhdGEtPmRlYnVnZnMgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoZGV2X25hbWUocGRhdGEtPmRl
diksIE5VTEwpOwo+Cj4gVGhhdCBzaG91bGQgd29yaywgYnV0IHdvbid0IGl0IGJlY29tZSBxdWl0
ZSBjb25mdXNpbmcgZm9yIHVzZXJzID8gSQo+IHdvbmRlciBpZiB0aGUgZGlyZWN0b3J5IG5hbWUg
c2hvdWxkbid0IGJlIHByZWZpeGVkIHdpdGggdGhlIGRyaXZlciBuYW1lLgo+IFNvbWV0aGluZyBs
aWtlICJ0aV9zbjY1ZHNpODY6JXMiLCBkZXZfbmFtZShwZGF0YS0+ZGV2KS4KCiptYXliZSosIGlm
IHRoZXkgYXJlIGJhZGx5IG5hbWVkIGluIGR0PyAgSW4gdGhlIGVuZCB0aGUgdGFyZ2V0CmF1ZGll
bmNlIGlzIHJlYWxseSB0byBoZWxwIGRldmVsb3BlcnMgYW5kIHBlb3BsZSBicmluZ2luZyB1cCBh
IG5ldwpib2FyZCwgc28gbWF5YmUgbXkgd2F5IGVuY291cmFnZXMgdGhlbSB0byB1c2Ugc2Vuc2li
bGUgbmFtZXMgaW4gZHQgOy0pCgpCUiwKLVIKCgo+Cj4gPiAgICAgICBkZWJ1Z2ZzX2NyZWF0ZV9m
aWxlKCJzdGF0dXMiLCAwNjAwLCBwZGF0YS0+ZGVidWdmcywgcGRhdGEsCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgJnN0YXR1c19mb3BzKTsKPgo+IC0tCj4gUmVnYXJkcywKPgo+IExhdXJlbnQg
UGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
