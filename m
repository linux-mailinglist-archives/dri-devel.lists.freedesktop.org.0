Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE63956984
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 14:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F386E411;
	Wed, 26 Jun 2019 12:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FD56E411
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 12:41:43 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B913F20042;
 Wed, 26 Jun 2019 14:41:40 +0200 (CEST)
Date: Wed, 26 Jun 2019 14:41:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v2 0/4] drm/panel: jh057n0090: Add regulators and drop
 magic value in init
Message-ID: <20190626124139.GB7337@ravnborg.org>
References: <cover.1561542477.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1561542477.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10
 a=UBMrDm-lNqQcMwi2BuQA:9 a=wPNLvfGTeEIA:10
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
 Purism Kernel Team <kernel@puri.sm>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3VpZG8uCgpPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAxMjozNzo0N1BNICswMjAwLCBHdWlk
byBHw7xudGhlciB3cm90ZToKPiBGaXggdGhlIG9taXNzaW9uIG9mIGEgcmVndWxhdG9ycyBmb3Ig
dGhlIHJlY2VudGx5IGFkZGVkIHBhbmVsIGFuZCBtYWtlIHN1cmUgYWxsCj4gZHNpIGNvbW1hbmRz
IHN0YXJ0IHdpdGggYSBjb21tYW5kIGluc3RlYWQgb2Ygb25lIGhhdmluZyBhIG1hZ2ljIGNvbnN0
YW50ICh3aGljaAo+IGFscmVhZHkgY2F1c2VkIGNvbmZ1c2lvbikuCj4gCj4gQWxzbyBhZGRzIGEg
bWFpbCBhbGlhcyB0byB0aGUgcGFuZWwncyBNQUlOVEFJTkVSIGVudHJ5IHRvIHJlZHVjZSB0aGUg
YnVzCj4gZmFjdG9yLgo+IAo+IENoYW5nZXMgZnJvbSB2MToKPiAqIEFzIHBlciByZXZpZXcgY29t
bWVudHMgZnJvbSBTYW0gUmF2bmJvcmc6Cj4gICAtIFByaW50IGVycm9yIG9uIGRldm1fcmVndWxh
dG9yX2dldCgpIGZhaWxyZXMKPiAgIC0gRml4IHR5cG9zIGluIGNvbW1pdCBtZXNzYWdlcwo+ICog
UHJpbnQgYW4gZXJyb3Igb24gcmVndWxhdG9yX2VuYWJsZSgpCj4gKiBEaXNhYmxlIHZjYyBpZiBp
b3ZjYyBmYWlscyB0byBlbmFibGUKPiAKPiBHdWlkbyBHw7xudGhlciAoNCk6Cj4gICBNQUlOVEFJ
TkVSUzogQWRkIFB1cmlzbSBtYWlsIGFsaWFzIGFzIHJldmlld2VyIGZvciB0aGVpciBkZXZraXQn
cwo+ICAgICBwYW5lbAo+ICAgZHJtL3BhbmVsOiBqaDA1N24wMDkwMDogRG9uJ3QgdXNlIG1hZ2lj
IGNvbnN0YW50Cj4gICBkdC1iaW5kaW5nczogZGlzcGxheS9wYW5lbDogamgwNTduMDA5MDA6IERv
Y3VtZW50IHBvd2VyIHN1cHBseQo+ICAgICBwcm9wZXJ0aWVzCj4gICBkcm0vcGFuZWw6IGpoMDU3
bjAwOTAwOiBBZGQgcmVndWxhdG9yIHN1cHBvcnQKClBhdGNoZXMgYXBwbGllZCB0byBkcm0tbWlz
Yy1uZXh0IGFuZCBwdXNoZWQgb3V0CgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
