Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFACB0D23
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 12:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAFC6ECC0;
	Thu, 12 Sep 2019 10:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF1E6ECC0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 10:45:09 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B51E933A;
 Thu, 12 Sep 2019 12:45:06 +0200 (CEST)
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
 <a9cc2193-0a18-0490-c273-c64bd70992f5@ideasonboard.com>
Openpgp: preference=signencrypt
Organization: Ideas on Board
Message-ID: <ce3ba782-9658-a8fc-d161-10192002e508@ideasonboard.com>
Date: Thu, 12 Sep 2019 11:45:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a9cc2193-0a18-0490-c273-c64bd70992f5@ideasonboard.com>
Content-Language: en-GB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1568285107;
 bh=ySflx1ZVmELycv6C11MLgMeMJ8/ORIvARvZ8QTgVPzI=;
 h=Reply-To:Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=ZjXhY6+FaPpNwSKsQLuMQNYqMGefCghUZ/+IFQGcXkM7qHgYroKb3xpOTIBQ3kXVz
 VD7xPVUU78sc/gzLAO0hjdF8Ktg2AlAFazWCd5VyGuIZZ+kQBPaTbEi/pvpBtO9DTm
 tw8iuvL0S1pCmMLdBvsIVvhdY2n0/vthsX3LStE0=
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIFNlcmdlaSwKCk9uIDEyLzA5LzIwMTkgMTE6MjYsIEtpZXJhbiBCaW5naGFtIHdyb3RlOgo+
IEhpIFNlcmdlaSwKPiAKPiAocHVsbGluZyBpbiArR2VlcnQgZm9yIGhpcyBvcGluaW9uIG9uIGNv
bXBhdGlibGUgc3RyaW5nIHVzYWdlcykKPiAKPiBPbiAxMi8wOS8yMDE5IDExOjAwLCBTZXJnZWkg
U2h0eWx5b3Ygd3JvdGU6PiBIZWxsbyEKPj4KPj4gT24gMTEuMDkuMjAxOSAyMjoyNSwgS2llcmFu
IEJpbmdoYW0gd3JvdGU6Cj4+Cj4+PiBBZGQgZGlyZWN0IHN1cHBvcnQgZm9yIHRoZSByOGE3Nzk4
MCAoVjNIKS4KPj4+Cj4+PiBUaGUgVjNIIHNoYXJlcyBhIGNvbW1vbiwgY29tcGF0aWJsZSBjb25m
aWd1cmF0aW9uIHdpdGggdGhlIHI4YTc3OTcwCj4+PiAoVjNNKSBzbyB0aGF0IGRldmljZSBpbmZv
IHN0cnVjdHVyZSBpcyByZXVzZWQuCj4+Cj4+IMKgwqAgRG8gd2UgcmVhbGx5IG5lZWQgdG8gYWRk
IHlldCBhbm90aGVyIGNvbXBhdGlibGUgaW4gdGhpcyBjYXNlPwo+PiBJIGp1c3QgYWRkZWQgcjhh
Nzc5NzAgdG8gdGhlIGNvbXBhdGlibGUgcHJvcCBpbiB0aGUgcjhhNzc5ODAgRFQuIFRoYXQncyB3
aHkKPj4gYSBwYXRjaCBsaWtlIHRoaXMgb25lIGRpZG4ndCBnZXQgcG9zdGVkIGJ5IG1lLgoKQWxz
bywgdGhlIGRvY3VtZW50YXRpb24gYXQgOgpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dAoKYWxyZWFkeSBzdGF0ZXMgdGhlIHRoZSAicmVuZXNh
cyxkdS1yOGE3Nzk4MCIgY29tcGF0aWJsZSBzdHJpbmcgaXMKc3VwcG9ydGVkIHRoYW5rcyB0byBb
MF0sIHNvIGFjdHVhbGx5IC0gdGhpcyBhZGRpdGlvbiBpcyBhIHJlcXVpcmVtZW50IHRvCm1ha2Ug
dGhlIGRyaXZlciBtYXRjaCB0aGUgZG9jdW1lbnRhdGlvbi4KCgpbMF0gNGZmZTVhYTUzNzkxICgi
ZHQtYmluZGluZ3M6IGRpc3BsYXk6IHJlbmVzYXM6IGR1OiBkb2N1bWVudCBSOEE3Nzk4MApiaW5k
aW5ncyIpCgoKPj4+IFNpZ25lZC1vZmYtYnk6IEtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hh
bStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Cj4+IFsuLi5dCj4+Cj4+IE1CUiwgU2VyZ2VpCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
