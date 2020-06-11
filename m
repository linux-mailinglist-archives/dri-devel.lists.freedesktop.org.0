Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC1B1F6BD1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 18:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FF06E0AB;
	Thu, 11 Jun 2020 16:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B942F6E0AB
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 16:08:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8742D24F;
 Thu, 11 Jun 2020 18:08:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591891718;
 bh=jlW4b5AG5wwpqPodl7+wSfpNr7n8QxJCTCiAHHSO2z0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rJgQArWMykr86hC6S/z6A49E9WFqEfSoOuOnDevnRMkgif9FNpo2FEG6Pg0Xsw9sx
 eEo8pW1eeQZnEYg9N/IRUoO5CJjblOK1CQQvO665RDb561+TnK6GMHRvavCcORARv3
 247hPGH3b9vehgfJAPnPBIJ71VnYsUkWQDdwof60=
Date: Thu, 11 Jun 2020 19:08:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [PATCH v3 5/5] dt-bindings: display: ti,tfp410.yaml: make the
 ports node optional
Message-ID: <20200611160817.GA6031@pendragon.ideasonboard.com>
References: <20200611102356.31563-1-ricardo.canuelo@collabora.com>
 <20200611102356.31563-6-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200611102356.31563-6-ricardo.canuelo@collabora.com>
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, tomi.valkeinen@ti.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUmljYXJkbywKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVGh1LCBKdW4gMTEsIDIw
MjAgYXQgMTI6MjM6NTZQTSArMDIwMCwgUmljYXJkbyBDYcOxdWVsbyB3cm90ZToKPiBNYWtlIHRo
ZSBwb3J0cyBub2RlIG9wdGlvbmFsLCBzaW5jZSB0aGVyZSBhcmUgc29tZSBEVHMgdGhhdCBkb24n
dCBkZWZpbmUKPiBhbnkgcG9ydHMgZm9yIHRpLHRmcDQxMC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBS
aWNhcmRvIENhw7F1ZWxvIDxyaWNhcmRvLmNhbnVlbG9AY29sbGFib3JhLmNvbT4KClNob3VsZG4n
dCB3ZSBmaXggdGhvc2UgRFRzIGluc3RlYWQgPyBXaGF0J3MgdGhlIHBvaW50IG9mIGEgVEZQNDEw
CndpdGhvdXQgcG9ydHMgaW4gRFQgPwoKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLHRmcDQxMC55YW1sIHwgMSAtCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSx0ZnA0MTAueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSx0ZnA0MTAueWFtbAo+
IGluZGV4IDYwNTgzMWMxZTgzNi4uMWM5NDIxZWI4MGZhIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSx0ZnA0MTAueWFtbAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90
aSx0ZnA0MTAueWFtbAo+IEBAIC04Myw3ICs4Myw2IEBAIHByb3BlcnRpZXM6Cj4gIAo+ICByZXF1
aXJlZDoKPiAgICAtIGNvbXBhdGlibGUKPiAtICAtIHBvcnRzCj4gIAo+ICBpZjoKPiAgICByZXF1
aXJlZDoKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
