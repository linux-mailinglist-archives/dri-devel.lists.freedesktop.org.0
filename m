Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB1214A395
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 13:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB696EB3F;
	Mon, 27 Jan 2020 12:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA4C6EB3F;
 Mon, 27 Jan 2020 12:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 23DDF3FB21;
 Mon, 27 Jan 2020 13:14:40 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=G4Fsw6zH; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z5s3Fk1f1p1c; Mon, 27 Jan 2020 13:14:39 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 7223E3F793;
 Mon, 27 Jan 2020 13:14:37 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A6500360102;
 Mon, 27 Jan 2020 13:14:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1580127277; bh=yMTT37x4Jo70WCGbtbrgqOMIoekyOV4AXZXVbG+tvk8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=G4Fsw6zHyPfPx3Ad9bTTl2tP23upEf8HzA8UxGXxRAf5h4jymer8pFLPpBNu+HhS9
 +osmAOAYN3q8592tGMwP5vt5TfmyyOWidJBMhlYsgzotfURJrgKq2O6+OfVf1Cvr4L
 OU4EhSV/OLbnWFvpH5Qvi/swh8RjV2gpuONPU02M=
Subject: Re: [PATCH] drm/auth: Drop master_create/destroy hooks
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200127100203.1299322-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <326bfd15-e739-7c19-ec9d-602fc72c7d83@shipmail.org>
Date: Mon, 27 Jan 2020 13:14:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200127100203.1299322-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMS8yNy8yMCAxMTowMiBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiB2bXdnZnggc3RvcHBl
ZCB1c2luZyB0aGVtLgo+Cj4gV2l0aCB0aGUgZHJtIGRldmljZSBtb2RlbCB0aGF0IHdlJ3ZlIHNs
b3dseSBldm9sdmVkIG92ZXIgdGhlIHBhc3QgZmV3Cj4geWVhcnMgbWFzdGVyIHN0YXR1cyBlc3Nl
bnRpYWxseSBjb250cm9scyBhY2Nlc3MgdG8gZGlzcGxheSByZXNvdXJjZXMsCj4gYW5kIG5vdGhp
bmcgZWxzZS4gU2luY2UgdGhhdCdzIGEgcHVyZSBhY2Nlc3MgcGVybWlzc2lvbiBjaGVjayBkcml2
ZXJzCj4gc2hvdWxkIGhhdmUgbm8gbmVlZCBhdCBhbGwgdG8gdHJhY2sgYWRkaXRpb25hbCBzdGF0
ZSBvbiBhIHBlciBmaWxlCj4gYmFzaXMuCj4KPiBBc2lkZTogRm9yIGNsZWFudXAgYW5kIHJlc3Rv
cmluZyBrZXJuZWwtaW50ZXJuYWwgY2xpZW50cyB0aGUgZ3JhbmQKPiBwbGFuIGlzIHRvIG1vdmUg
ZXZlcnlvbmUgb3ZlciB0byBkcm1fY2xpZW50IGFuZAo+IGRybV9tYXN0ZXJfaW50ZXJuYWxfYWNx
dWlyZS9yZWxlYXNlLCBsaWtlIHRoZSBnZW5lcmljIGZiZGV2IGNvZGUKPiBhbHJlYWR5IGRvZXMu
IFRoYXQgc2hvdWxkIGdldCByaWQgb2YgbW9zdCAtPmxhc3RjbG9zZSBpbXBsZW1lbnRhdGlvbnMs
Cj4gYW5kIEkgdGhpbmsgYWxzbyBzdWJzdW1lcyBhbnkgcHJvY2Vzc2luZyB2bXdnZnggZG9lcyBp
bgo+IG1hc3Rlcl9zZXQvZHJvcC4KPgo+IENjOiAiVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSki
IDx0aG9tYXNfb3NAc2hpcG1haWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryb20g
PHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
