Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF2A45D4B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3A0892D3;
	Fri, 14 Jun 2019 12:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B4C892D3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 12:59:53 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id t28so2288230lje.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 05:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dxN8IMeJHVXnP1b6nJkOyvD5/EuemFZLofVhpm8EbR8=;
 b=XalharJBbDGkE58aLiiQhLaNahAyQW0pcByYVxZnhYz71qQn6GqftjiHxPyctkE2c9
 X0F49D/iRZo9wfMCCNJOGAcy7gMqc9IQ5t/k0M3rBRnhZaQoKsCMAqWMzJn1HnF0zGNq
 kQF80avWF974yiV6RgiA53htgi7wIB4dHdxNvaAxGe6yfHq7Znm4fjBIaX7CJfYi3xrI
 l3rLpi0HDT6bU1V8KJEn9h8xs2KCc26/tcocEvNRM1Qtui54hPwGqTZj0DbVp87bO2w4
 u7JHkicDs/Qbmx0wb13N5NJyQ4tWy/AbYhwlHivKPZc7LFgi9ki9mMoV2F6hRIa/vuh3
 zGNQ==
X-Gm-Message-State: APjAAAWQ0fDG04zamlQcy6LFK/vp3U0m3xk5Qhcx/CMmMmS5diOTEtdL
 FKbj5nTCFmg8w7vvleeBWLb2hLz3mvNTmLNCYbg=
X-Google-Smtp-Source: APXvYqw8lXq0F0+4IJ+bpSdJl/2U6LvUGkEuFr8uiUorBszvcRCgkPzY9gUJlHkQLLz12pREmb/LM7DQwkvuRWZqP34=
X-Received: by 2002:a2e:63c4:: with SMTP id s65mr40905213lje.211.1560517191687; 
 Fri, 14 Jun 2019 05:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <1560513063-24995-1-git-send-email-robert.chiras@nxp.com>
 <1560513063-24995-2-git-send-email-robert.chiras@nxp.com>
In-Reply-To: <1560513063-24995-2-git-send-email-robert.chiras@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 14 Jun 2019 09:59:54 -0300
Message-ID: <CAOMZO5AMBr0TZip_PRBRPkMZ-d-kVeEOB4-rMTtcfcYtjLrLqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add support for Raydium
 RM67191 panel
To: Robert Chiras <robert.chiras@nxp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dxN8IMeJHVXnP1b6nJkOyvD5/EuemFZLofVhpm8EbR8=;
 b=HM9PZfbMeFKhbiqGJ8k7ChriLFbLkvmVVj2iyulEvchIEz8/+TjMU383RbCZ51pYIY
 iWfrjlAiZwOGWcLcvHI9tDh/4Y8DOFsyxWrW9KskJtoJ/XvLna/Y0LviTgz0q1mnM21k
 cD+Ri3bnDrggF+7wdTbiHkxxZ4MHBymFnUmPp6ChkbD4YwjqWBplnh2SD5AXK/hpkWzU
 vRISa1Kjnt2u32lJ9buRRkD5KScwAxjyCEZSYp13JNgP/0VN7r/6m08wa17fGE99B1i2
 dZH2pgKYn+JWiQA0mcYs3/AIRxuVs970lPq2jIhJm3oQ4Glg36mZiTVQu648uhunD+2H
 aP6A==
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgODo1MyBBTSBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hp
cmFzQG54cC5jb20+IHdyb3RlOgo+Cj4gQWRkIGR0LWJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9y
IFJheWRpdW0gUk02NzE5MSBEU0kgcGFuZWwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgQ2hp
cmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL3JheWRpdW0scm02NzE5MS50eHQgICAgIHwgNDIgKysrKysrKysrKysrKysrKysrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5ZGl1
bSxybTY3MTkxLnR4dAo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JheWRpdW0scm02NzE5MS50eHQgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yYXlkaXVtLHJtNjcxOTEudHh0Cj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwLi41YTYyNjhkCj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL3JheWRpdW0scm02NzE5MS50eHQKPiBAQCAtMCwwICsxLDQyIEBACj4gK1JheWRpdW0gUk02
NzE3MSBPTEVEIExDRCBwYW5lbCB3aXRoIE1JUEktRFNJIHByb3RvY29sCj4gKwo+ICtSZXF1aXJl
ZCBwcm9wZXJ0aWVzOgo+ICstIGNvbXBhdGlibGU6ICAgICAgICAgICJyYXlkaXVtLHJtNjcxOTEi
Cj4gKy0gcmVnOiAgICAgICAgICAgICAgICAgdmlydHVhbCBjaGFubmVsIGZvciBNSVBJLURTSSBw
cm90b2NvbAo+ICsgICAgICAgICAgICAgICAgICAgICAgIG11c3QgYmUgPDA+Cj4gKy0gZHNpLWxh
bmVzOiAgICAgICAgICAgbnVtYmVyIG9mIERTSSBsYW5lcyB0byBiZSB1c2VkCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgbXVzdCBiZSA8Mz4gb3IgPDQ+Cj4gKy0gcG9ydDogICAgICAgICAgICAg
ICAgaW5wdXQgcG9ydCBub2RlIHdpdGggZW5kcG9pbnQgZGVmaW5pdGlvbiBhcwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGRlZmluZWQgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2dyYXBoLnR4dDsKPiArICAgICAgICAgICAgICAgICAgICAgICB0aGUgaW5wdXQgcG9ydCBz
aG91bGQgYmUgY29ubmVjdGVkIHRvIGEgTUlQSS1EU0kgZGV2aWNlCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgZHJpdmVyCj4gKwo+ICtPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ICstIHJlc2V0LWdw
aW86ICAgICAgICAgIGEgR1BJTyBzcGVjIGZvciB0aGUgUlNUX0IgR1BJTyBwaW4KCnJlc2V0LWdw
aW9zICh3aXRoIHRoZSBzIGluIHRoZSBlbmQpIGlzIHRoZSByZWNvbW1lbmRhdGlvbi4KCj4gKy0g
ZGlzcGxheS10aW1pbmdzOiAgICAgdGltaW5ncyBmb3IgdGhlIGNvbm5lY3RlZCBwYW5lbCBhY2Nv
cmRpbmcgdG8gWzFdCgpUaGlzIGlzIG5vdCBuZWVkZWQuCgo+ICstIHZpZGVvLW1vZGU6ICAgICAg
ICAgIDAgLSBidXJzdC1tb2RlCj4gKyAgICAgICAgICAgICAgICAgICAgICAgMSAtIG5vbi1idXJz
dCB3aXRoIHN5bmMgZXZlbnQKPiArICAgICAgICAgICAgICAgICAgICAgICAyIC0gbm9uLWJ1cnN0
IHdpdGggc3luYyBwdWxzZQo+ICsKPiArWzFdOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9kaXNwbGF5LXRpbWluZy50eHQKClRoaXMgcGF0aCBkb2VzIG5vdCBleGlz
dC4KCkFsc28sIGNvdWxkIHlvdSB0cnkgdG8gYWxpZ24gdGhlc2UgYmluZGluZ3Mgd2l0aCB0aGUg
b25lIGZyb20gcmF5ZGl1bSxybTY4MjAwPwoKVGhlcmUgYXJlIHBvd2VyLXN1cHBseSBhbmQgYmFj
a2xpZ2h0IG9wdGlvbmFsIHByb3BlcnRpZXMgdGhlcmUsIHdoaWNoCnNlZW0gdXNlZnVsLgoKPiAr
Cj4gK0V4YW1wbGU6Cj4gKwo+ICsgICAgICAgcGFuZWxAMCB7Cj4gKyAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAicmF5ZGl1bSxybTY3MTkxIjsKPiArICAgICAgICAgICAgICAgcmVnID0gPDA+
Owo+ICsgICAgICAgICAgICAgICBwaW5jdHJsLTAgPSA8JnBpbmN0cmxfbWlwaV9kc2lfMF8xX2Vu
PjsKCllvdSBzaG91bGQgYWxzbyBwYXNzIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7IGlmIHlv
dSB1c2UgcGluY3RybC0wLgoKPiArICAgICAgICAgICAgICAgcmVzZXQtZ3BpbyA9IDwmZ3BpbzEg
NyBHUElPX0FDVElWRV9ISUdIPjsKClNob3VsZCBiZSBhY3RpdmUgbG93LgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
