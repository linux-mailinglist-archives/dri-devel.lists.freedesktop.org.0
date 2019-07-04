Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C820D5F823
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 14:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8D46E33C;
	Thu,  4 Jul 2019 12:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539CA6E33C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 12:32:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D597C24B;
 Thu,  4 Jul 2019 14:32:31 +0200 (CEST)
Date: Thu, 4 Jul 2019 15:32:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi86: add link to datasheet
Message-ID: <20190704123211.GF6569@pendragon.ideasonboard.com>
References: <20190702154419.20812-1-robdclark@gmail.com>
 <20190702154419.20812-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702154419.20812-2-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562243552;
 bh=hyNqBrHx03qZNweexbbvyVNGuNrdc6G/wOUnelcohKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lKijpZ4ho0LfI+wWRhUg90UuEZxjbC5u+oICqyvd9PPLBm9aDB+KtCNHpRJQs9t6N
 ggC5T1EqBan1sA/qIp2Dr6BUaHQokn3K7cwnEigd8TxqbWUOTpciKoubt56FG0rglN
 3c+zDvNd39dQUe4BZ5ygIThqv4roFzLMHh3b93wo=
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBUdWUsIEp1bCAwMiwgMjAxOSBh
dCAwODo0NDoxNkFNIC0wNzAwLCBSb2IgQ2xhcmsgd3JvdGU6Cj4gRnJvbTogUm9iIENsYXJrIDxy
b2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IAo+IFRoZSBicmlkZ2UgaGFzIHByZXR0eSBnb29kIGRv
Y3MsIGxldHMgYWRkIGEgbGluayB0byBtYWtlIHRoZW0gZWFzaWVyIHRvCj4gZmluZC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgfCAxICsKPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGktc242NWRzaTg2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4
Ni5jCj4gaW5kZXggYmNjYTkxNzNjNzJhLi5mMWEyNDkzYjg2ZDkgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvdGktc242NWRzaTg2LmMKPiBAQCAtMSw2ICsxLDcgQEAKPiAgLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiAgLyoKPiAgICogQ29weXJpZ2h0IChjKSAyMDE4LCBU
aGUgTGludXggRm91bmRhdGlvbi4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KPiArICogZGF0YXNoZWV0
OiBodHRwOi8vd3d3LnRpLmNvbS9saXQvZHMvc3ltbGluay9zbjY1ZHNpODYucGRmCgpJdCdzIGlu
IHRoZSBEVCBiaW5kaW5ncyBhbmQgaXQncyBlYXN5IHRvIGZpbmQgc28gSSdtIG5vdCBzdXJlIGl0
IGFkZHMKbG90cyBvZiB2YWx1ZSB0byBtZW50aW9uIGl0IGhlcmUsIGJ1dCBJIGRvbid0IGZlZWwg
dmVyeSBzdHJvbmdseSBhYm91dAppdCwgc28gaWYgeW91IHRoaW5rIGl0IGNhbiBiZSB1c2VmdWwg
SSBkb24ndCBtaW5kLiBJIHdvdWxkIGhvd2V2ZXIgcHV0IGEKYmxhbmsgbGluZSBhZnRlciB0aGUg
Y29weXJpZ2h0IGxpbmUgaW4gdGhhdCBjYXNlLCBhbmQKcy9kYXRhc2hlZXQvRGF0YXNoZWV0LwoK
PiAgICovCj4gIAo+ICAjaW5jbHVkZSA8bGludXgvY2xrLmg+CgotLSAKUmVnYXJkcywKCkxhdXJl
bnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
