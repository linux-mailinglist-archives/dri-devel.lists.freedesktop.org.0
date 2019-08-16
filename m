Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 956FA8FA04
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 06:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6396EAC2;
	Fri, 16 Aug 2019 04:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DD46EAC2;
 Fri, 16 Aug 2019 04:48:52 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 393EA8064D;
 Fri, 16 Aug 2019 06:48:47 +0200 (CEST)
Date: Fri, 16 Aug 2019 06:48:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20190816044846.GA27781@ravnborg.org>
References: <20190816133132.6b37d7fa@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816133132.6b37d7fa@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=riLMJWpmpRtepst6gjgA:9 a=CjuIK1q_8ugA:10
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RlcGhlbi4KCk9uIEZyaSwgQXVnIDE2LCAyMDE5IGF0IDAxOjMxOjMyUE0gKzEwMDAsIFN0
ZXBoZW4gUm90aHdlbGwgd3JvdGU6Cj4gSGkgYWxsLAo+IAo+IEFmdGVyIG1lcmdpbmcgdGhlIGRy
bS1taXNjIHRyZWUsIHRvZGF5J3MgbGludXgtbmV4dCBidWlsZCAoeDg2XzY0Cj4gYWxsbW9kY29u
ZmlnKSBwcm9kdWNlZCB0aGlzIHdhcm5pbmc6Cj4gCj4gd2FybmluZzogc2FtZSBtb2R1bGUgbmFt
ZXMgZm91bmQ6Cj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9w
YW5lbC1uZWMtbmw4MDQ4aGwxMS5rbwo+ICAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW5l
Yy1ubDgwNDhobDExLmtvCj4gd2FybmluZzogc2FtZSBtb2R1bGUgbmFtZXMgZm91bmQ6Cj4gICBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9wYW5lbC1zaGFycC1sczAz
N3Y3ZHcwMS5rbwo+ICAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNoYXJwLWxzMDM3djdk
dzAxLmtvCj4gd2FybmluZzogc2FtZSBtb2R1bGUgbmFtZXMgZm91bmQ6Cj4gICBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9wYW5lbC1zb255LWFjeDU2NWFrbS5rbwo+
ICAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNvbnktYWN4NTY1YWttLmtvCj4gd2Fybmlu
Zzogc2FtZSBtb2R1bGUgbmFtZXMgZm91bmQ6Cj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAy
L29tYXBmYi9kaXNwbGF5cy9wYW5lbC10cG8tdGQwMjh0dGVjMS5rbwo+ICAgZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXRwby10ZDAyOHR0ZWMxLmtvCj4gd2FybmluZzogc2FtZSBtb2R1bGUg
bmFtZXMgZm91bmQ6Cj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5
cy9wYW5lbC10cG8tdGQwNDNtdGVhMS5rbwo+ICAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXRwby10ZDA0M210ZWExLmtvCj4gCj4gSW50cm9kdWNlZCBieSBjb21taXRzCj4gCj4gICBkZjQz
OWFiZTY1MDEgKCJkcm0vcGFuZWw6IEFkZCBkcml2ZXIgZm9yIHRoZSBORUMgTkw4MDQ4SEwxMSBw
YW5lbCIpCj4gICBjOWNmNGMyYTNiZDMgKCJkcm0vcGFuZWw6IEFkZCBkcml2ZXIgZm9yIHRoZSBT
aGFycCBMUzAzN1Y3RFcwMSBwYW5lbCIpCj4gICAxYzhmYzNmMGM1ZDIgKCJkcm0vcGFuZWw6IEFk
ZCBkcml2ZXIgZm9yIHRoZSBTb255IEFDWDU2NUFLTSBwYW5lbCIpCj4gICA0MTViOGRkMDg3MTEg
KCJkcm0vcGFuZWw6IEFkZCBkcml2ZXIgZm9yIHRoZSBUb3Bwb2x5IFREMDI4VFRFQzEgcGFuZWwi
KQo+ICAgZGMyZTFlNWIyNzk5ICgiZHJtL3BhbmVsOiBBZGQgZHJpdmVyIGZvciB0aGUgVG9wcG9s
eSBURDA0M01URUExIHBhbmVsIikKClVwcywgaGFkIG5vdCBzZWVuIHRoaXMgb25lIGNvbWluZy4K
V2UgYXJlIGluIHRoZSBwcm9jZXNzIG9mIHJlbW92aW5nIHRoZSBkcml2ZXJzIGluIGRyaXZlcnMv
dmlkZW8vZmJkZXYvb21hcDIvb21hcGZiLwphbmQgZGVjaWRlZCB0byBpbnRyb2R1Y2UgdGhlIG5l
dyBkcml2ZXJzIGVhcmx5IHRvIGdldCB0aGVtIG91dCBvZiBhCmxvbmdlciBwYXRjaCBzZXJpZXMu
CgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
