Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D7ECB4BD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8846EAA7;
	Fri,  4 Oct 2019 07:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2236EAA7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 07:02:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0B432E5;
 Fri,  4 Oct 2019 09:02:26 +0200 (CEST)
Date: Fri, 4 Oct 2019 10:02:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: display: renesas: Add r8a774b1 support
Message-ID: <20191004070211.GA9380@pendragon.ideasonboard.com>
References: <1569835731-8096-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569835731-8096-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570172547;
 bh=ff0YXiLcRAU78UlQx9FiW7X44GoxjWj2rqTFc4BimAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oHcKjcMOngDwgA2/r8Nl+8advWQ0ml+4p/Kt6OryBCB4jJfrzUg2LORSqz0D8+Dh5
 0N21m7Cr3eJ1saJPF8ZIvamIBlnPvl9B2LmGw06wX/m2/WRCoj6q5MJhsXwwEd5eDO
 F52ytoDf9iofw7ZLfR54LPj8TfLNU53aN5o8XvMk=
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
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Simon Horman <horms@verge.net.au>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmlqdSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gTW9uLCBTZXAgMzAsIDIwMTkg
YXQgMTA6Mjg6NTFBTSArMDEwMCwgQmlqdSBEYXMgd3JvdGU6Cj4gRG9jdW1lbnQgUlovRzJOIChS
OEE3NzRCMSkgU29DIGJpbmRpbmdzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1
LmRhc0BicC5yZW5lc2FzLmNvbT4KCkkgcmVhbGx5IGxpa2UgaG93IHlvdXIgUlogcGF0Y2hlcyBh
cmUgc2ltcGxlLCB0aGV5J3JlIHBhaW5sZXNzIHRvCnJldmlldywgaXQncyBhbGwgdmVyeSBwbGVh
c3VyYWJsZSA6LSkKClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+CgpBbmQgYXBwbGllZCB0byBteSB0cmVlLgoKPiAtLS0KPiAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMs
ZHctaGRtaS50eHQgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS9yZW5lc2FzLGR3LWhkbWkudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsZHctaGRtaS50eHQKPiBpbmRleCBkYjY4MDQxLi44
MTlmM2UzIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L2JyaWRnZS9yZW5lc2FzLGR3LWhkbWkudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsZHctaGRtaS50eHQKPiBA
QCAtMTMsNiArMTMsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICAKPiAgLSBjb21wYXRpYmxl
IDogU2hhbGwgY29udGFpbiBvbmUgb3IgbW9yZSBvZgo+ICAgIC0gInJlbmVzYXMscjhhNzc0YTEt
aGRtaSIgZm9yIFI4QTc3NEExIChSWi9HMk0pIGNvbXBhdGlibGUgSERNSSBUWAo+ICsgIC0gInJl
bmVzYXMscjhhNzc0YjEtaGRtaSIgZm9yIFI4QTc3NEIxIChSWi9HMk4pIGNvbXBhdGlibGUgSERN
SSBUWAo+ICAgIC0gInJlbmVzYXMscjhhNzc5NS1oZG1pIiBmb3IgUjhBNzc5NSAoUi1DYXIgSDMp
IGNvbXBhdGlibGUgSERNSSBUWAo+ICAgIC0gInJlbmVzYXMscjhhNzc5Ni1oZG1pIiBmb3IgUjhB
Nzc5NiAoUi1DYXIgTTMtVykgY29tcGF0aWJsZSBIRE1JIFRYCj4gICAgLSAicmVuZXNhcyxyOGE3
Nzk2NS1oZG1pIiBmb3IgUjhBNzc5NjUgKFItQ2FyIE0zLU4pIGNvbXBhdGlibGUgSERNSSBUWAoK
LS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
