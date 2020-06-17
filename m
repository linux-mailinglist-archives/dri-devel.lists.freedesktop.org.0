Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E6B1FD91F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 00:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FF56E1CF;
	Wed, 17 Jun 2020 22:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9513A6E1CF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 22:43:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B1BCF9;
 Thu, 18 Jun 2020 00:43:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592433829;
 bh=RsQLbHMQw0UnnMPXiJLpwb7U7RPinG9A0N7ByG5hyvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bj4klpDvexsIx02tUwJp8pvRLCUAjQm8xeslbCUfE/Vf4usT2oWacy9HFLrIOZNUf
 faDGeL3MsCLKh6dw9jNJQEXnPRECPJaiMS3FWqICfdf1bITaAvUthue0AMxfepuWtl
 fuv9lwk52SICRGq4BtGOq1jaADjKu3lFoYNKOAA8=
Date: Thu, 18 Jun 2020 01:43:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/5] dt-bindings: display: ti,tfp410.yaml: make the
 ports node optional
Message-ID: <20200617224326.GE32604@pendragon.ideasonboard.com>
References: <20200611102356.31563-1-ricardo.canuelo@collabora.com>
 <20200611102356.31563-6-ricardo.canuelo@collabora.com>
 <20200617223455.GA2953201@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617223455.GA2953201@bogus>
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
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com, kernel@collabora.com,
 Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gV2VkLCBKdW4gMTcsIDIwMjAgYXQgMDQ6MzQ6NTVQTSAtMDYwMCwgUm9iIEhl
cnJpbmcgd3JvdGU6Cj4gT24gVGh1LCBKdW4gMTEsIDIwMjAgYXQgMTI6MjM6NTZQTSArMDIwMCwg
UmljYXJkbyBDYcOxdWVsbyB3cm90ZToKPiA+IE1ha2UgdGhlIHBvcnRzIG5vZGUgb3B0aW9uYWws
IHNpbmNlIHRoZXJlIGFyZSBzb21lIERUcyB0aGF0IGRvbid0IGRlZmluZQo+ID4gYW55IHBvcnRz
IGZvciB0aSx0ZnA0MTAuCj4gCj4gT25seSBhcmNoL2FybS9ib290L2R0cy9kb3ZlLXNiYy1hNTEw
LmR0cyBBRkFJQ1QuLi4gSXQgc2hvdWxkIGJlIHVwZGF0ZWQgCj4gSU1PLgoKQWdyZWVkLCBidXQg
UmljYXJkbyB3YXNuJ3Qgc3VyZSBob3cgdG8gdXBkYXRlIGl0LiBJdCB3b3VsZCBiZSBuaWNlIGlm
CnNvbWVvbmUgd2l0aCBrbm93bGVkZ2Ugb2YgdGhlIGhhcmR3YXJlIGNvdWxkIGhhdmUgYSBsb29r
LgoKQnkgdGhlIHdheSwgdGhpcyBwYXRjaCBpcyBkcm9wcGVkIGZyb20gdjQgb2YgdGhlIHNlcmll
cy4KCj4gPiBTaWduZWQtb2ZmLWJ5OiBSaWNhcmRvIENhw7F1ZWxvIDxyaWNhcmRvLmNhbnVlbG9A
Y29sbGFib3JhLmNvbT4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS90aSx0ZnA0MTAueWFtbCB8IDEgLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGksdGZwNDEwLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGksdGZwNDEwLnlhbWwK
PiA+IGluZGV4IDYwNTgzMWMxZTgzNi4uMWM5NDIxZWI4MGZhIDEwMDY0NAo+ID4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLHRmcDQxMC55
YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9i
cmlkZ2UvdGksdGZwNDEwLnlhbWwKPiA+IEBAIC04Myw3ICs4Myw2IEBAIHByb3BlcnRpZXM6Cj4g
PiAgCj4gPiAgcmVxdWlyZWQ6Cj4gPiAgICAtIGNvbXBhdGlibGUKPiA+IC0gIC0gcG9ydHMKPiA+
ICAKPiA+ICBpZjoKPiA+ICAgIHJlcXVpcmVkOgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNo
YXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
