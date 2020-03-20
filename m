Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7905918C9A1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 10:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FE66E04E;
	Fri, 20 Mar 2020 09:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3526E04E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 09:11:37 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id n20so3894182lfl.10
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 02:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OU/CpAGIqH8KmfsyruwEDtwqFN1iNUUKyUH7R3UxLkw=;
 b=mllYl6GF2syYSUniY8DE9rxhVQ9ZjeJtdUw2jL/qdetWaKL4P4TFCzv5AjONaNrDzs
 BGM8hqFjQpEIYY1BWfAadf0qCywfRXMAfeboea/zxJo57UoIVHfgZWrG/zwY9BwTuVgb
 DRXULnIB8wnRcpx/yKPfjz+J/PSnVSxl+Bt7vPIcZyJtyReDP/OxZHesXHBx+tinokkR
 IKKc188enCZ7EwyPkgD6Y9blmbi+56B1MJKDi1Fk8OvlUKZw3GAPgVVhAJvfZibhUl5t
 ekKWzyO+eyqmq12qo3Pns7t3wOzedDpKks/K9dXWARk5rtaiwF/SWq6Rqe5cYFNsYqlU
 rw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OU/CpAGIqH8KmfsyruwEDtwqFN1iNUUKyUH7R3UxLkw=;
 b=WqoSKZXeLmQzdaTiU1i8JFUveqziP4KwBU4D56OKgXcfHbrCDzBFahkK91yfw1l3rW
 SXW8FeybBTfrK05L4j2yKvJmTpBGy27A4x04/xYYKs5+06gdDSCQeJ8mVg7pnch6+53h
 oSYuAULcrhVZaJ/V+ORFECMql6I7IJI/+Xjo0RsZadzPYFMGNn9zKFJXsIrf1UNiYNBT
 Cyv+pRjY1nCGWXLcOwgbN/ACPuwC/+7kXGqLL650g0uVTyTXyZwZryfCV1cBEOAEXreB
 wTpAHoqUkj3Z3No1UhA9pfKJCXgR9UQVy3Jq1n9ND2NG99ZkRyy8gcClsMJTyS1HHFjJ
 bHrg==
X-Gm-Message-State: ANhLgQ3Sdw6d4MyEvfS4vzvyJqrJj+dZTFqEr2wJPp9OQTdQkGnHQ/a4
 nUEbFO/iPA0Pxs2l1mGsWiLa8moYrcN1HqOpGjz6Ep6kJLFV1Q==
X-Google-Smtp-Source: ADFU+vtJYWG8EQJP/hgD78QKWv99yAbCP307TFvbYqg8VWMrgeCGnVYbnG2Hccuki3Zkny8VqCdXwG3hw10skhhk4Rw=
X-Received: by 2002:a05:6512:247:: with SMTP id
 b7mr4683821lfo.21.1584695495451; 
 Fri, 20 Mar 2020 02:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200316133503.144650-1-icenowy@aosc.io>
 <20200316133503.144650-3-icenowy@aosc.io>
 <CACRpkdaVrfd1p+WyACy-gq-3BPsXJ_CZwi2OZe+=csseBcvcaA@mail.gmail.com>
 <491ADD02-5511-404B-88A8-5725EF061EAC@aosc.io>
In-Reply-To: <491ADD02-5511-404B-88A8-5725EF061EAC@aosc.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Mar 2020 10:11:22 +0100
Message-ID: <CACRpkdbeLAyhhkx115zAV0tdC7KJ4T0UoQ2QeDwTVN+btxp=Jw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: panel: add binding for Xingbangda
 XBD599 panel
To: Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Ondrej Jirman <megous@megous.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgMjAsIDIwMjAgYXQgOTowNyBBTSBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFv
c2MuaW8+IHdyb3RlOgo+IOS6jiAyMDIw5bm0M+aciDE55pelIEdNVCswODowMCDkuIvljYgxMDox
NDoyNywgTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiDlhpnliLA6Cj4g
Pk9uIE1vbiwgTWFyIDE2LCAyMDIwIGF0IDI6MzcgUE0gSWNlbm93eSBaaGVuZyA8aWNlbm93eUBh
b3NjLmlvPiB3cm90ZToKCj4gPkFzIG5vdGljZWQgaW4gdGhlIHJldmlldyBvZiB0aGUgZHJpdmVy
LCB0aGlzIGRpc3BsYXkgaXMgdmVyeSBjbG9zZSB0bwo+ID5oaW1heCxoeDgzNjMuCj4gPgo+ID5J
IHRoaW5rIHRoZSBiZXN0IGlzIHRvIGRldGVybWluIHdoYXQgYWN0dWFsIGRpc3BsYXkgY29udHJv
bGxlciBpdCBpcywKPiA+SSB0aGluayBpdCBpcyBzb21lIGtpbmQgb2YgSWxpdGVrIGNvbnRyb2xs
ZXIgc2luY2UgSWxpdGVrIGlsaTkzNDIgaXMKPiA+Y2xlYXJseSB2ZXJ5IHNpbWlsYXIuCj4KPiBJ
dCdzIFNpdHJvbml4IFNUNzcwMywgc2FtZSBhcyB0aGUgTGlicmVtIDUgcGFuZWwuCgpIZWgsIEkg
d29uZGVyIGhvdyBpdCBjb21lcyB0aGF0IGl0IGlzIHNvIHNpbWlsYXIgdG8gSWxpdGVrLgpJIGd1
ZXNzIEkgd2lsbCBuZXZlciB1bmRlcnN0YW5kIGhvdyB0aGUgc2lsaWNvbiBlY29zeXN0ZW0gd29y
a3MKaW4gYXNpYSAoSSBkaWQgcmVhZCBhIGxvdCBvZiBCdW5uaWUgSHVhbmcncyBhcnRpY2xlcyBh
bmQgaGFyZHdhcmUKaGFja2luZyBib29rIHRvIHRyeSB0byB1bmRlcnN0YW5kLi4uKQoKVGhpcyBm
aWxlIHNob3VsZCBiZSBuYW1lZCBzaXRyb25peCxzdDc3MDMueWFtbCB0aGVuLgoKQWNjb3JkaW5n
IHRvIHRoZSBjb2RlIGluIHRoZSBMaWJyZW0gNToKaHR0cHM6Ly9zb3VyY2UucHVyaS5zbS9MaWJy
ZW01L2xpbnV4LW5leHQvYmxvYi9pbXg4LWN1cnJlbnQtbGlicmVtNS9kcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3NzAxLmMKVGhlIGFjdHVhbCBuYW1lIG9mIHRoZSBkaXNw
bGF5IGlzIFRlY2hzdGFyIHRzODU1MGIuCkFuZCB0aGUgZGlzcGxheSBjb250cm9sbGVyIGlzIHN0
NzcwMSwgc28gbWF5YmUgd2Ugc2hvdWxkCmFjdHVhbGx5IG5hbWUgaXQgc2l0cm9uaXgsc3Q3NzB4
LnlhbWwgaWYgdGhlcmUgYXJlIHNvbWUKc3ViLXZhcmlhbnRzIG9mIHN0NzcweD8KCj4gPnByb3Bl
cnRpZXM6Cj4gPiAgY29tcGF0aWJsZToKPiA+ICAgIGl0ZW1zOgo+ID4gICAgICAtIGNvbnN0OiB4
aW5nYmFuZ2RhLHhiZDU5OQo+ID4gICAgICAtIGNvbnN0OiBpbGl0ZWssaWxpOTM0Mgo+ID4KPiA+
UG9zc2libHkgdXNlIG9uZU9mIGFuZCBhZGQgc3VwcG9ydCBmb3IgdGhlIGhpbWF4LGh4ODM2Mwo+
ID5hbHJlYWR5IHdoaWxlIHlvdSdyZSBhdCBpdC4KClRoaXMgc2hvdWxkIGF0IGxlYXN0IGJlOgoK
Y29tcGF0aWJsZToKICAgaXRlbXM6CiAgICAgLSBlbnVtOgogICAgICAgLSB4aW5nYmFuZ2RhLHhi
ZDU5OQogICAgICAgLSBoaW1heCxoeDgzNjMKICAgICAgIC0gdGVjaHN0YXIsdHM4NTUwYgogICAg
IC0gZW51bToKICAgICAgIC0gc2l0cm9uaXgsc3Q3NzAxCiAgICAgICAtIHNpdHJvbml4LHN0Nzcw
MwoKU28gcGFuZWwgbm9kZXMgdXNpbmcgdGhpcyBwYW5lbCBiZWNvbWUKY29tcGF0aWJsZSA9ICJ4
aW5nYmFuZ2RhLHNiZDU5OSIsICJzaXRyb25peCxzdDc3MDMiCmV0Yy4KClRoaXMgd2F5IGl0IGlz
IHN0cmFpZ2h0LWZvcndhcmQgZm9yIGRyaXZlcnMgdG8gaWRlbnRpZnkgdGhlIHBhbmVsCnZlbmRv
ciBhbmQgZGlzcGxheSBjb250cm9sbGVyLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
