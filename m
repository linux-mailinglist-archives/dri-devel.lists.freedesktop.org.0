Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A5FA1315
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 09:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D23C89FD7;
	Thu, 29 Aug 2019 07:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880CE89FD7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 07:57:47 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id l2so1885829oil.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 00:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QlVHj9x553xnQTEez13oHT9EpyHgH9QecAY7hhhrPAk=;
 b=Pb02oTyO4160JbXgKn4/3mt5ngwWoNyQ8juB7dPp4/4cx/13qYbE2pTUSuq6yT/Q+j
 GsO+8lLNY47N2guS0DXkxOKitRnV1P88u1Zsnj6SlBKHr0fWtKuQbQXq2RCXHnK7E1u6
 KODVuX0S6Zsy7d17vwNtMH/jXwwudT38em9WlYxYF6AAEaV48XqH+SCWCXmWJZPEJpu6
 MD9r64LReNUE0BHb9d9WV3ECOSee4XKFQlU4EKkFibljdh6YzsPfAepYj3TbQFpyhY9+
 p4RXGmjot8fNjAV2zeNUyNnEFYAJxiSKaiyTsPFM4Z+a/TwaOexyrTuMHkDOvjtgloBf
 /r+w==
X-Gm-Message-State: APjAAAVnZsaqLTT4Ol0QEqY3Ky12f1FJ/tbal150U49+mlItH7ozwvgl
 T8kl+ElwV+cUxFcRC0uJmJXJgQbWrcwCihc3lOY=
X-Google-Smtp-Source: APXvYqwtm23JqVzDWeBpUT9mVYdLnoyO70OgcXLyNcpsa0xvNS/qCBp951gxuzDuCzJMGWND93w6eQfyvRVEfqxUW4U=
X-Received: by 2002:aca:ea82:: with SMTP id i124mr5313299oih.153.1567065466698; 
 Thu, 29 Aug 2019 00:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567017402-5895-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1567017402-5895-2-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2019 09:57:35 +0200
Message-ID: <CAMuHMdVPsT=1R7DAnmui+iaWcnoy52Xrr47zLWbgmUumBZ2sdw@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: display: Add bindings for LVDS
 bus-timings
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
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
 <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpPbiBXZWQsIEF1ZyAyOCwgMjAxOSBhdCA4OjM2IFBNIEZhYnJpemlvIENh
c3Rybwo8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPiB3cm90ZToKPiBEdWFsLUxWRFMg
Y29ubmVjdGlvbnMgbmVlZCBtYXJrZXJzIGluIHRoZSBEVCwgdGhpcyBwYXRjaCBhZGRzCj4gc29t
ZSBjb21tb24gZG9jdW1lbnRhdGlvbiB0byBiZSByZWZlcmVuY2VkIGJ5IGJvdGggcGFuZWxzIGFu
ZAo+IGJyaWRnZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlv
LmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KClRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2J1cy10aW1pbmdzL2x2ZHMueWFtbAo+IEBAIC0wLDAgKzEsMzggQEAKPiArIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9idXMtdGltaW5ncy9sdmRzLnlhbWwjCj4g
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+
ICsKPiArdGl0bGU6IENvbW1vbiBQcm9wZXJ0aWVzIGZvciBidXMgdGltaW5ncyBvZiBMVkRTIGlu
dGVyZmFjZXMKPiArCj4gK21haW50YWluZXJzOgo+ICsgIC0gVGhpZXJyeSBSZWRpbmcgPHRoaWVy
cnkucmVkaW5nQGdtYWlsLmNvbT4KPiArICAtIEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2Fz
dHJvQGJwLnJlbmVzYXMuY29tPgo+ICsKPiArZGVzY3JpcHRpb246IHwKPiArICBUaGlzIGRvY3Vt
ZW50IGRlZmluZXMgZGV2aWNlIHRyZWUgcHJvcGVydGllcyBjb21tb24gdG8gTFZEUyBhbmQgZHVh
bC1MVkRTCj4gKyAgaW50ZXJmYWNlcywgd2hlcmUgYSBkdWFsLUxWRFMgaW50ZXJmYWNlIGlzIGEg
ZHVhbC1saW5rIGNvbm5lY3Rpb24gd2l0aCBldmVuCj4gKyAgcGl4ZWxzIHRyYXZlbGluZyBvbiBv
bmUgY29ubmVjdGlvbiwgYW5kIHdpdGggb2RkIHBpeGVscyB0cmF2ZWxpbmcgb24gdGhlIG90aGVy
Cj4gKyAgY29ubmVjdGlvbi4KPiArICBUaGlzIGRvY3VtZW50IGRvZXNuJ3QgY29uc3RpdHVlIGEg
ZGV2aWNlIHRyZWUgYmluZGluZyBzcGVjaWZpY2F0aW9uIGJ5IGl0c2VsZgo+ICsgIGJ1dCBpcyBt
ZWFudCB0byBiZSByZWZlcmVuY2VkIGJ5IGRldmljZSB0cmVlIGJpbmRpbmdzLgo+ICsgIFdoZW4g
cmVmZXJlbmNlZCBmcm9tIHBhbmVsIG9yIGJyaWRnZSBkZXZpY2UgdHJlZSBiaW5kaW5ncywgdGhl
IHByb3BlcnRpZXMKPiArICBkZWZpbmVkIGluIHRoaXMgZG9jdW1lbnQgYXJlIGRlZmluZWQgYXMg
Zm9sbG93cy4gVGhlIHBhbmVsIGFuZCBicmlkZ2UgZGV2aWNlCj4gKyAgdHJlZSBiaW5kaW5ncyBh
cmUgcmVzcG9uc2libGUgZm9yIGRlZmluaW5nIHdoZXRoZXIgZWFjaCBwcm9wZXJ0eSBpcyByZXF1
aXJlZAo+ICsgIG9yIG9wdGlvbmFsLgo+ICsKPiArcHJvcGVydGllczoKPiArICBkdWFsLWx2ZHMt
ZXZlbi1waXhlbHM6Cj4gKyAgICB0eXBlOiBib29sZWFuCj4gKyAgICBkZXNjcmlwdGlvbjoKPiAr
ICAgICAgVGhpcyBwcm9wZXJ0eSBpcyBzcGVjaWZpYyB0byBhbiBpbnB1dCBwb3J0IG9mIGEgc2lu
ayBkZXZpY2UuIFdoZW4KPiArICAgICAgc3BlY2lmaWVkLCBpdCBtYXJrcyB0aGUgcG9ydCBhcyBy
ZWNpcGllbnQgb2YgZXZlbi1waXhlbHMuCj4gKwo+ICsgIGR1YWwtbHZkcy1vZGQtcGl4ZWxzOgo+
ICsgICAgdHlwZTogYm9vbGVhbgo+ICsgICAgZGVzY3JpcHRpb246Cj4gKyAgICAgIFRoaXMgcHJv
cGVydHkgaXMgc3BlY2lmaWMgdG8gYW4gaW5wdXQgcG9ydCBvZiBhIHNpbmsgZGV2aWNlLiBXaGVu
Cj4gKyAgICAgIHNwZWNpZmllZCwgaXQgbWFya3MgdGhlIHBvcnQgYXMgcmVjaXBpZW50IG9mIG9k
ZC1waXhlbHMuCgpEbyB5b3UgbmVlZCB0aGUgImR1YWwtIiBwcmVmaXg/IElzbid0IHRoYXQgaW1w
bGllZCBieSBldmVuL29kZD8KT3IgaXMgaXQgYmV0dGVyIHRvIGtlZXAgaXQsIGZvciByZWFkYWJp
bGl0eT8KCkknbSBhbHNvIHRoaW5raW5nIGFib3V0IGEgcG9zc2libGUgZnV0dXJlIGV4dGVuc2lv
biB0byB0cmlwbGUgb3IgcXVhZCBMVkRTLgpBcyBJJ20gbm90IGF3YXJlIG9mIEVuZ2xpc2ggd29y
ZCBlcXVpdmFsZW50cyBvZiBldmVuL29kZCBmb3IgdHJpcGxlL3F1YWQsCnBlcmhhcHMgdGhpcyBz
aG91bGQgYmUgc3BlY2lmaWVkIHVzaW5nIGEgbnVtZXJpY2FsIHZhbHVlIGluc3RlYWQ/CgpJZiBJ
IGdvIHRvbyBmYXIsIHBsZWFzZSBqdXN0IHNheSBzbyA7LSkKCkdye29ldGplLGVldGluZ31zLAoK
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0g
VGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3Jn
CgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxs
IG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBq
dXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
