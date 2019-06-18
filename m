Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A8D4A745
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 18:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9493D89BF8;
	Tue, 18 Jun 2019 16:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CF789BF8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 16:43:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 682CFD5;
 Tue, 18 Jun 2019 18:43:55 +0200 (CEST)
Date: Tue, 18 Jun 2019 19:43:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: renesas: Add r8a774a1 support
Message-ID: <20190618164338.GG21105@pendragon.ideasonboard.com>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560871119-16570-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560871119-16570-2-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1560876235;
 bh=1xUkCuv94g7S9J2o8wEGgwE4uKHhIma2x2Q1OFT9Qyg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J5LcKgHqPwLOD0UM3Av3Op3KWpF67JJo7Leut0KuPYT6BKqek14fzSlOn+YS3Lz1I
 luR9eq/GHmEC3A8vHiHnS7FwZTvTxnYQ9DqIa45Z1Ni49gSedGVNsaOSbKcahh5LAb
 JC8PnOUhGQ38hgYF6gC+QokLScepNYpTJP01W4t4=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFR1ZSwgSnVuIDE4LCAy
MDE5IGF0IDA0OjE4OjM3UE0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBEb2N1bWVu
dCBSWi9HMk0gKFI4QTc3NEExKSBTb0MgYmluZGluZ3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogRmFi
cml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+CgpSZXZpZXdlZC1i
eTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoK
SSBkb24ndCBoYXZlIHBlbmRpbmcgY2hhbmdlcyBmb3IgdGhpcyBmaWxlIGZvciB0aGlzIGtlcm5l
bCByZWxlYXNlLiBBcwp5b3VyIHNlcmllcyBjb250YWlucyBEVCBjaGFuZ2VzLCBJJ20gZmluZSBp
ZiB0aGlzIHBhdGNoIGdldHMgbWVyZ2VkCnRocm91Z2ggdGhlIEFSTSBTb0MgdHJlZSBhbG9uZyB3
aXRoIHRoZSByZXN0LiBPdGhlcndpc2UgcGxlYXNlIGxldCBtZQprbm93IGlmIEkgc2hvdWxkIGhh
bmRsZSBpdCBteXNlbGYuCgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxkdy1oZG1pLnR4dCB8IDQgKysrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2Fz
LGR3LWhkbWkudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
YnJpZGdlL3JlbmVzYXMsZHctaGRtaS50eHQKPiBpbmRleCBhNDFkMjgwLi5kYjY4MDQxIDEwMDY0
NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS9yZW5lc2FzLGR3LWhkbWkudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsZHctaGRtaS50eHQKPiBAQCAtMTIsMTAgKzEy
LDEyIEBAIGZvbGxvd2luZyBkZXZpY2Utc3BlY2lmaWMgcHJvcGVydGllcy4KPiAgUmVxdWlyZWQg
cHJvcGVydGllczoKPiAgCj4gIC0gY29tcGF0aWJsZSA6IFNoYWxsIGNvbnRhaW4gb25lIG9yIG1v
cmUgb2YKPiArICAtICJyZW5lc2FzLHI4YTc3NGExLWhkbWkiIGZvciBSOEE3NzRBMSAoUlovRzJN
KSBjb21wYXRpYmxlIEhETUkgVFgKPiAgICAtICJyZW5lc2FzLHI4YTc3OTUtaGRtaSIgZm9yIFI4
QTc3OTUgKFItQ2FyIEgzKSBjb21wYXRpYmxlIEhETUkgVFgKPiAgICAtICJyZW5lc2FzLHI4YTc3
OTYtaGRtaSIgZm9yIFI4QTc3OTYgKFItQ2FyIE0zLVcpIGNvbXBhdGlibGUgSERNSSBUWAo+ICAg
IC0gInJlbmVzYXMscjhhNzc5NjUtaGRtaSIgZm9yIFI4QTc3OTY1IChSLUNhciBNMy1OKSBjb21w
YXRpYmxlIEhETUkgVFgKPiAtICAtICJyZW5lc2FzLHJjYXItZ2VuMy1oZG1pIiBmb3IgdGhlIGdl
bmVyaWMgUi1DYXIgR2VuMyBjb21wYXRpYmxlIEhETUkgVFgKPiArICAtICJyZW5lc2FzLHJjYXIt
Z2VuMy1oZG1pIiBmb3IgdGhlIGdlbmVyaWMgUi1DYXIgR2VuMyBhbmQgUlovRzIgY29tcGF0aWJs
ZQo+ICsJCQkgICAgIEhETUkgVFgKPiAgCj4gICAgICBXaGVuIGNvbXBhdGlibGUgd2l0aCBnZW5l
cmljIHZlcnNpb25zLCBub2RlcyBtdXN0IGxpc3QgdGhlIFNvQy1zcGVjaWZpYwo+ICAgICAgdmVy
c2lvbiBjb3JyZXNwb25kaW5nIHRvIHRoZSBwbGF0Zm9ybSBmaXJzdCwgZm9sbG93ZWQgYnkgdGhl
CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
