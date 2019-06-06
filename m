Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D5537A5E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 18:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2272D893A4;
	Thu,  6 Jun 2019 16:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81092893A4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 16:59:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D541333B;
 Thu,  6 Jun 2019 18:59:11 +0200 (CEST)
Date: Thu, 6 Jun 2019 19:58:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 05/20] clk: renesas: r8a7795: Add CMM clocks
Message-ID: <20190606165857.GL12825@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-6-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-6-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559840352;
 bh=XDx8nCiqiYqSjm6geqOh75YZZTdb04aCc3T8YidISPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ut/qrx1h0uk4GGyPirmjpOsBDdj0ByH5fFxjf7XKO9fHkKLj6K7NJ3Cfk7vOxFYns
 Iv+k3M4VgrxNhkQBLPNt0uTs9+7zBw8qIaNmuMPfGO5OOUE+TV095gB8otzT0pISsx
 4gGhckbNQvtIw4C8IR3hPJqD6RpacJCsCx8Idpc0=
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBUaHUsIEp1biAwNiwgMjAx
OSBhdCAwNDoyMjowNVBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gQWRkIGNsb2NrIGRl
ZmluaXRpb25zIGZvciBDTU0gdW5pdHMgb24gUmVuZXNhcyBSLUNhciBHZW4zIEgzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KPiAt
LS0KPiAgZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3Nzk1LWNwZy1tc3NyLmMgfCA0ICsrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2Nsay9yZW5lc2FzL3I4YTc3OTUtY3BnLW1zc3IuYyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjhh
Nzc5NS1jcGctbXNzci5jCj4gaW5kZXggODY4NDJjOWZkMzE0Li5lOGYxZDVlYzA0NTUgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3Nzk1LWNwZy1tc3NyLmMKPiArKysgYi9k
cml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3OTUtY3BnLW1zc3IuYwo+IEBAIC0yMDAsNiArMjAwLDEw
IEBAIHN0YXRpYyBzdHJ1Y3QgbXNzcl9tb2RfY2xrIHI4YTc3OTVfbW9kX2Nsa3NbXSBfX2luaXRk
YXRhID0gewo+ICAJREVGX01PRCgiZWhjaTAiLAkJIDcwMywJUjhBNzc5NV9DTEtfUzNENCksCj4g
IAlERUZfTU9EKCJoc3VzYiIsCQkgNzA0LAlSOEE3Nzk1X0NMS19TM0Q0KSwKPiAgCURFRl9NT0Qo
ImhzdXNiMyIsCQkgNzA1LAlSOEE3Nzk1X0NMS19TM0Q0KSwKPiArCURFRl9NT0QoImNtbTMiLAkJ
CSA3MDgsCVI4QTc3OTVfQ0xLX1MyRDEpLAo+ICsJREVGX01PRCgiY21tMiIsCQkJIDcwOSwJUjhB
Nzc5NV9DTEtfUzJEMSksCj4gKwlERUZfTU9EKCJjbW0xIiwJCQkgNzEwLAlSOEE3Nzk1X0NMS19T
MkQxKSwKPiArCURFRl9NT0QoImNtbTAiLAkJCSA3MTEsCVI4QTc3OTVfQ0xLX1MyRDEpLAoKQ291
bGQgeW91IHRyeSB0byBnZXQgY29uZmlybWF0aW9uIHRoYXQgUzJEMSBpcyB0aGUgcmlnaHQgcGFy
ZW50IChmb3IgYWxsClNvQ3MpID8gQXBhcnQgZnJvbSB0aGF0LAoKUmV2aWV3ZWQtYnk6IExhdXJl
bnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KCj4gIAlERUZf
TU9EKCJjc2kyMSIsCQkgNzEzLAlSOEE3Nzk1X0NMS19DU0kwKSwgLyogRVMxLnggKi8KPiAgCURF
Rl9NT0QoImNzaTIwIiwJCSA3MTQsCVI4QTc3OTVfQ0xLX0NTSTApLAo+ICAJREVGX01PRCgiY3Np
NDEiLAkJIDcxNSwJUjhBNzc5NV9DTEtfQ1NJMCksCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGlu
Y2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
