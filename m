Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5A5D18DB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 21:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A9C6EA4D;
	Wed,  9 Oct 2019 19:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C106EA4D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 19:26:31 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id k9so2764001oib.7
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 12:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E+1Cf+QVyq8bhGJdgpmwKD8ewKz92Myu7dCI2HheZcs=;
 b=oQZUJU18Is6w3fKMLFKbyeuw2UAshXGj74x60dLgBDPQgVfkE9jIbU/+I5kbanbs5s
 h+uLTOVyHDHNF3OeBhvEGRw/ysVLOkDj3igkH72AH5kxdBbF4zW2+NGW+8i4Oj9krgWr
 n9E/deFZeTo1Vde3hM5KaXfHXgx4FAnB3aDkyFmgjyZ4Bz5cX/8Tv2eCN6+U2yKJgCT5
 aMgmAPfGdRaXTAK6NcC3sb/rB7u2nmariocNrmHuVCnQLLe0ODydddQGzwDC6waCgi12
 +znkBaOTXjhatg5Wq1BhLVGIQUyzTMyKJjuTfEoGZdfgQ7UoT+qaxKgeqkqX3y1ydpzy
 r/2w==
X-Gm-Message-State: APjAAAUVi5Z0X/oPT8lcu2lTlEiPAGO1oQ1EXbgsEUOxiET2ycbXLVly
 CyI+3kRn7bTeDeyfQR+i/g==
X-Google-Smtp-Source: APXvYqxhf2oe+tg+UPt4mEDyJD79ww7yyIO3EkWvJYkdvSRE+pnt3LOVSbpBMfctWccSlLhsJ7SMZQ==
X-Received: by 2002:aca:d402:: with SMTP id l2mr4027557oig.127.1570649190033; 
 Wed, 09 Oct 2019 12:26:30 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 11sm991096otg.62.2019.10.09.12.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 12:26:29 -0700 (PDT)
Date: Wed, 9 Oct 2019 14:26:28 -0500
From: Rob Herring <robh@kernel.org>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v10 4/6] dts-bindings: leds: Document the naming
 requirement for LED properties
Message-ID: <20191009192628.GA24087@bogus>
References: <20191009085127.22843-1-jjhiblot@ti.com>
 <20191009085127.22843-5-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009085127.22843-5-jjhiblot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, sre@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomi.valkeinen@ti.com,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMTA6NTE6MjVBTSArMDIwMCwgSmVhbi1KYWNxdWVzIEhp
YmxvdCB3cm90ZToKPiBMRUQgcHJvcGVydGllcyBtdXN0IGJlIG5hbWVkICJsZWRzIiBpbiB0aGUg
c2FtZSB3YXkgdGhhdCBQV00sIGNsb2NrcyBvcgo+IFBIWSBwcm9wZXJ0aWVzIGFyZSBuYW1lcyBy
ZXNwZWN0aXZlbHkgInB3bXMiLCAiY2xvY2tzIiBhbmQgInBoeXMiLgo+IAo+IENjOiBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJsb3Qg
PGpqaGlibG90QHRpLmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9j
b21tb24udHh0ICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvY29tbW9uLnR4dCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2NvbW1vbi50eHQKPiBpbmRleCA5ZmE2Zjk3
OTVkNTAuLjMxYjhjMWY2OGQyNyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbGVkcy9jb21tb24udHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2xlZHMvY29tbW9uLnR4dAo+IEBAIC0xMCw2ICsxMCw5IEBAIGNhbiBpbmZs
dWVuY2UgdGhlIHdheSBvZiB0aGUgTEVEIGRldmljZSBpbml0aWFsaXphdGlvbiwgdGhlIExFRCBj
b21wb25lbnRzCj4gIGhhdmUgdG8gYmUgdGlnaHRseSBjb3VwbGVkIHdpdGggdGhlIExFRCBkZXZp
Y2UgYmluZGluZy4gVGhleSBhcmUgcmVwcmVzZW50ZWQKPiAgYnkgY2hpbGQgbm9kZXMgb2YgdGhl
IHBhcmVudCBMRUQgZGV2aWNlIGJpbmRpbmcuCj4gIAo+ICtMRUQgcHJvcGVydGllcyBzaG91bGQg
YmUgbmFtZWQgImxlZHMiLiBUaGUgZXhhY3QgbWVhbmluZyBvZiBlYWNoIGxlZHMKPiArcHJvcGVy
dHkgbXVzdCBiZSBkb2N1bWVudGVkIGluIHRoZSBkZXZpY2UgdHJlZSBiaW5kaW5nIGZvciBlYWNo
IGRldmljZS4KPiArCgpUaGlzIGlzIHdvcmRlZCBvZGRseS4gVGhlIHByb3BlcnR5IGlzICdsZWRz
JyBhbmQgaXQgaXMgYWx3YXlzIGEgbGlzdCBvZiAKcGhhbmRsZXMgdG8gTEVEIGRldmljZSBub2Rl
cy4gSXQgaXMgcHJlc2VudCBpbiBhbiBMRUQgY29uc3VtZXIgZGV2aWNlLgoKPiAgCj4gIE9wdGlv
bmFsIHByb3BlcnRpZXMgZm9yIGNoaWxkIG5vZGVzOgo+ICAtIGxlZC1zb3VyY2VzIDogTGlzdCBv
ZiBkZXZpY2UgY3VycmVudCBvdXRwdXRzIHRoZSBMRUQgaXMgY29ubmVjdGVkIHRvLiBUaGUKPiBA
QCAtMTY1LDkgKzE2OCwyMCBAQCBsZWQtY29udHJvbGxlckAzMCB7Cj4gIAkJZnVuY3Rpb24tZW51
bWVyYXRvciA9IDwyPjsKPiAgICAgICAgICB9Owo+ICAKPiAtICAgICAgICBsZWRAMyB7Cj4gKyAg
ICAgICAgYmtsX2xlZDA6IGxlZEAzIHsKPiAgCQlyZWcgPSA8Mz47Cj4gLQkJZnVuY3Rpb24gPSBM
RURfRlVOQ1RJT05fSU5ESUNBVE9SOwo+IC0JCWZ1bmN0aW9uLWVudW1lcmF0b3IgPSA8Mz47Cj4g
KwkJZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fQkFDS0xJR0hUOwo+ICsJCWZ1bmN0aW9uLWVudW1l
cmF0b3IgPSA8MT47Cj4gICAgICAgICAgfTsKPiArCj4gKyAgICAgICAgYmtsX2xlZDE6IGxlZEA0
IHsKPiArCQlyZWcgPSA8ND47Cj4gKwkJZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fQkFDS0xJR0hU
Owo+ICsJCWZ1bmN0aW9uLWVudW1lcmF0b3IgPSA8Mj47Cj4gKyAgICAgICAgfTsKPiArfTsKPiAr
Cj4gKwo+ICtiYWNrbGlnaHRANDAgewoKRWl0aGVyIG5lZWRzICdyZWcnIG9yIHRoZSB1bml0LWFk
ZHJlc3MgZHJvcHBlZC4KCj4gKwlsZWRzID0gPCZia2xfbGVkMD4gLCA8JmJrbF9sZWQxPjsKCmRy
b3AgdGhlIHNwYWNlICAgICAgICAgICAgXgoKPiAgfTsKPiAtLSAKPiAyLjE3LjEKPiAKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
