Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0224D9471
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 16:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0594C89B9F;
	Wed, 16 Oct 2019 14:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503E889B33
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 14:55:24 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id h144so54124597iof.7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 07:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WsRXU2seKLqonJyjXRBsnNj1M9VdSNz6TzMXTF2DqOE=;
 b=hvf85Sm9zk+TZIQPG28z4FwsBzdWLQTn84hn3rn5Mf6vFlw7u3a7/qWnH2n3+MXoXO
 1fRHw88/vDiM2GOEcnmq6ZnYf7AIBhvozEluYXmOrhezWKkCwWA2CO9yMOms+MSeIu4v
 1HIWV0FZS2LMpDZXygTX6dihWlZnTOWaQbBJGrQZ8MNY0WUT3SgyzXuU12WmTCviVvtH
 qLiizHaugpEg/cvOcuXx+v3jVVVKycP/DKPU7vMDjWSei750ZBb6KX64v1ZfKTXSiLqk
 4/Nm1AD/y8z84aWwi3CdnIKytTcyhqPNGlZWVAz9NLn6i3mto3Mbmw7yDdxTR+R7e1c1
 NeLA==
X-Gm-Message-State: APjAAAXFb283pBy5nb+JAh7G1CrD2s0k1ii/EJwD43EEcHjufB/zOsbO
 WFEB2OQEoAiRn3BY5bpY6jHk4FWh5o5Ys2pIP8Y=
X-Google-Smtp-Source: APXvYqwZrFFGnXE2/LlaSltNPG5F0vYPaaUxMhoyXQyYWQpz1kDoiel4AdpJBMLakJV8NtyF44Gkecosan9olvXX4BQ=
X-Received: by 2002:a5d:9952:: with SMTP id v18mr26088875ios.58.1571237723091; 
 Wed, 16 Oct 2019 07:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191016135147.7743-1-aford173@gmail.com>
 <20191016135147.7743-2-aford173@gmail.com>
 <20191016144018.GG5175@pendragon.ideasonboard.com>
In-Reply-To: <20191016144018.GG5175@pendragon.ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 16 Oct 2019 09:55:11 -0500
Message-ID: <CAHCN7xJhHHoia_o4rb0VgvCP71X94Pvem684F2quMijNNpNxVA@mail.gmail.com>
Subject: Re: [PATCH V5 2/3] dt-bindings: Add Logic PD Type 28 display panel
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WsRXU2seKLqonJyjXRBsnNj1M9VdSNz6TzMXTF2DqOE=;
 b=gpLeVx0lT1xzsOOJKDlnAf0oUpt5+fFrIs1kgXhcsJyXK8Lksxss8daWaaxFU/1ke6
 EI3CYVCI/gjBVHYHF5Aqe61wIn5OYFHamutZQnz7rnBU6yrDgLWJpHfTdE3r0GdpEJed
 6Iu8Dt9jevfXRR9SGydsQM0s8BIj/IaPIm8bhqxix9sJwzOE4nC6C7PnNx1kzY/E69Ln
 PLQOHZpkruD8jEjM4YM4ABlrSj4NRVJ7IjMgXSQrryrFirAfne6PiDp4oB5iMCgo3nbO
 vX5/gIdT9dHIXlUI0IuyhOxa8vLH5tdR+Od2MGlpBCtAtVu9rnVow0bnZSgmwX5do2As
 orKg==
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
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgOTo0MCBBTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gSGkgQWRhbSwKPgo+IFRoYW5r
IHlvdSBmb3IgdGhlIHBhdGNoLgo+Cj4gT24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMDg6NTE6NDZB
TSAtMDUwMCwgQWRhbSBGb3JkIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBhZGRzIGRvY3VtZW50YXRp
b24gb2YgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBXVkdBIHBhbmVsCj4gPiBMb2dpYyBQ
RCBUeXBlIDI4IGRpc3BsYXkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQWRhbSBGb3JkIDxhZm9y
ZDE3M0BnbWFpbC5jb20+Cj4gPiAtLS0KPiA+IFY1OiAgUmVwbGFjZSBHUElPX0FDVElWRV9ISUdI
IHdpdGggMCB0byBmaXggbWFrZSBkdF9iaW5kaW5nX2NoZWNrIC1rCj4gPiBWNDogIFVwZGF0ZSBw
ZXIgUm9iIEgncyBzdWdnZXN0aW9ucyBhbmQgY29weSBvdGhlciBwYW5lbCB5YW1sIGV4YW1wbGUg
ZnJvbSA1LjQtcmMxCj4gPiBWMzogIENvcnJlY3QgYnVpbGQgZXJyb3JzIGZyb20gJ21ha2UgZHRf
YmluZGluZ19jaGVjaycKPiA+IFYyOiAgVXNlIFlBTUwgaW5zdGVhZCBvZiBUWFQgZm9yIGJpbmRp
bmcKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvbG9naWNwZCx0eXBlMjgueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2xvZ2ljcGQsdHlwZTI4LnlhbWwKPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjI4MzQyODdiOGQ4OAo+ID4g
LS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvbG9naWNwZCx0eXBlMjgueWFtbAo+ID4gQEAgLTAsMCArMSw0MiBAQAo+
ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+ICslWUFNTCAxLjIKPiA+
ICstLS0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvcGFu
ZWwvbG9naWNwZCx0eXBlMjgueWFtbCMKPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ICsKPiA+ICt0aXRsZTogTG9naWMgUEQgVHlw
ZSAyOCA0LjMiIFdRVkdBIFRGVCBMQ0QgcGFuZWwKPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+
ICsgIC0gQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+Cj4gPiArCj4gPiArYWxsT2Y6Cj4g
PiArICAtICRyZWY6IHBhbmVsLWNvbW1vbi55YW1sIwo+ID4gKwo+ID4gK3Byb3BlcnRpZXM6Cj4g
PiArICBjb21wYXRpYmxlOgo+ID4gKyAgICBjb25zdDogbG9naWNwZCx0eXBlMjgKPiA+ICsKPiA+
ICsgIHBvd2VyLXN1cHBseTogdHJ1ZQo+ID4gKyAgZW5hYmxlLWdwaW9zOiB0cnVlCj4gPiArICBi
YWNrbGlnaHQ6IHRydWUKPiA+ICsgIHBvcnQ6IHRydWUKPiA+ICsKPiA+ICtyZXF1aXJlZDoKPiA+
ICsgIC0gY29tcGF0aWJsZQo+Cj4gU2hvdWxkIHRoZSBwb3J0IGJlIHJlcXVpcmVkIHRvbyA/IEFw
YXJ0IGZyb20gdGhhdCwKCkkgc3VwcG9zZWQgdGhhdCdzIHRydWUsIGJ1dCBJIHVzZWQgYW1waXJl
LGFtLTQ4MDI3MmgzdG1xdy10MDFoLnlhbWwgYXMKdGhlIGV4YW1wbGUsIGFuZCBpdCBkb2Vzbid0
IGxpc3QgaXQgYXMgYSByZXF1aXJlZCBpdGVtLgpJcyB0aGVyZSBhbnl0aGluZyBlbHNlIEkgbmVl
ZCB0byBhZGRyZXNzPyAgSSBmZWVsIGxpa2UgSSdtIHRyeWluZyB0bwpoaXQgYSBtb3ZpbmcgdGFy
Z2V0LgoKYWRhbQo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4KPiA+ICsKPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczog
ZmFsc2UKPiA+ICsKPiA+ICtleGFtcGxlczoKPiA+ICsgIC0gfAo+ID4gKyAgICBsY2QwOiBkaXNw
bGF5IHsKPiA+ICsgICAgICBjb21wYXRpYmxlID0gImxvZ2ljcGQsdHlwZTI4IjsKPiA+ICsgICAg
ICBlbmFibGUtZ3Bpb3MgPSA8JmdwaW81IDI3IDA+Owo+ID4gKyAgICAgIGJhY2tsaWdodCA9IDwm
YmFja2xpZ2h0PjsKPiA+ICsgICAgICBwb3J0IHsKPiA+ICsgICAgICAgIGxjZF9pbjogZW5kcG9p
bnQgewo+ID4gKyAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRwaV9vdXQ+Owo+ID4gKyAg
ICAgICAgfTsKPiA+ICsgICAgICB9Owo+ID4gKyAgICB9Owo+ID4gKwo+ID4gKy4uLgo+Cj4gLS0K
PiBSZWdhcmRzLAo+Cj4gTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
