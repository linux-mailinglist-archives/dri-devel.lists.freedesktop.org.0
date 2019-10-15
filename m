Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C64AD7744
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 15:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A976E05C;
	Tue, 15 Oct 2019 13:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B166E05C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 13:17:44 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A81A324;
 Tue, 15 Oct 2019 15:17:41 +0200 (CEST)
Subject: Re: [PATCH v5 3/8] drm: rcar-du: Add support for CMM
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
 laurent.pinchart@ideasonboard.com, geert@linux-m68k.org, horms@verge.net.au,
 uli+renesas@fpond.eu, VenkataRajesh.Kalakodima@in.bosch.com
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20191015104621.62514-4-jacopo+renesas@jmondi.org>
 <2aefe646-45db-aafa-b22b-e1cf9616259d@ideasonboard.com>
Openpgp: preference=signencrypt
Organization: Ideas on Board
Message-ID: <f0c787a4-9267-b75b-047f-de5142ea437e@ideasonboard.com>
Date: Tue, 15 Oct 2019 14:17:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2aefe646-45db-aafa-b22b-e1cf9616259d@ideasonboard.com>
Content-Language: en-GB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1571145462;
 bh=OGe73LjqajbcudlitAMvXu0BZp8hvWsmr33UvUWk+Zg=;
 h=Reply-To:Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=luQ+FPeyeNVCv5hr4rd5zjNDri+A8NvWV0MfQLtzRmautNAcLsHYFCUeMp8Tr48J2
 D4X6kTWkcEmh5iM7A2FJFTQLj7W4dVKxD53p4YgbQSx6frlM+nXkSlwuBxxmvZ+14V
 LeK/Rhudg6Z+iBa6p6vsXQ7pOQfQh2MbZ/mwhsCc=
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
Cc: muroya@ksk.co.jp, airlied@linux.ie, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, seanpaul@chromium.org,
 Harsha.ManjulaMallikarjun@in.bosch.com, ezequiel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT25lIG1pbm9yIGFkZGl0aW9uYWwgY2F0Y2ggaGVyZToKCk9uIDE1LzEwLzIw
MTkgMTI6NTMsIEtpZXJhbiBCaW5naGFtIHdyb3RlOgo+IEhpIEphY29wbywKCjxzbmlwcGVkPgoK
Pj4gKwo+PiArLyoKPj4gKyAqIHJjYXJfY21tX2x1dF93cml0ZSgpIC0gU2NhbGUgdGhlIERSTSBM
VVQgdGFibGUgZW50cmllcyB0byBoYXJkd2FyZSBwcmVjaXNpb24KPj4gKyAqCQkJICBhbmQgd3Jp
dGUgdG8gdGhlIENNTSByZWdpc3RlcnMuCj4+ICsgKiBAcmNtbTogUG9pbnRlciB0byB0aGUgQ01N
IGRldmljZQo+PiArICogQGRybV9sdXQ6IFBvaW50ZXIgdG8gdGhlIERSTSBMVVQgdGFibGUKPj4g
KyAqLwo+PiArc3RhdGljIHZvaWQgcmNhcl9jbW1fbHV0X3dyaXRlKHN0cnVjdCByY2FyX2NtbSAq
cmNtbSwKPj4gKwkJCSAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2NvbG9yX2x1dCAqZHJtX2x1dCkK
Pj4gK3sKPj4gKwl1bnNpZ25lZCBpbnQgaTsKPj4gKwo+PiArCWZvciAoaSA9IDA7IGkgPCBDTTJf
TFVUX1NJWkU7ICsraSkgewo+PiArCQl1MzIgZW50cnkgPSAgZHJtX2NvbG9yX2x1dF9leHRyYWN0
KGRybV9sdXRbaV0ucmVkLCA4KSA8PCAxNgoKVGhlcmUncyBhbiBleHRyYSBzcGFjZSBiZXR3ZWVu
ID0gYW5kICdkcm1fY29sb3IuLi4nIGhlcmUuCgo8c25pcHBlZD4KCi0tCktpZXJhbgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
