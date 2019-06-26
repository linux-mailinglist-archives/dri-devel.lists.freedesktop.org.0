Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7564E567A4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 13:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0504F6E339;
	Wed, 26 Jun 2019 11:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9597E6E339
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 11:33:11 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7EC2380349;
 Wed, 26 Jun 2019 13:33:08 +0200 (CEST)
Date: Wed, 26 Jun 2019 13:33:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v5 2/2] drm/panel: Add support for Raydium RM67191 panel
 driver
Message-ID: <20190626113306.GA24921@ravnborg.org>
References: <1561544420-15572-1-git-send-email-robert.chiras@nxp.com>
 <1561544420-15572-3-git-send-email-robert.chiras@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1561544420-15572-3-git-send-email-robert.chiras@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10
 a=R-vzCapntemROrW6nt8A:9 a=QEXdDO2ut3YA:10
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-imx@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LgoKT24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDE6MjA6MjBQTSArMDMwMCwgUm9i
ZXJ0IENoaXJhcyB3cm90ZToKPiBUaGlzIHBhdGNoIGFkZHMgUmF5ZGl1bSBSTTY3MTkxIFRGVCBM
Q0QgcGFuZWwgZHJpdmVyIChNSVBJLURTSQo+IHByb3RvY29sKS4KCkkgd2FzIGFib3V0IHRvIGFw
cGx5IHRoZXNlIC0gYnV0IEkgZ2V0IGZvbGxvd2luZyB3YXJuaW5ncyBkdXJpbmcgYnVpbGQ6CiAg
Q0MgICAgICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmF5ZGl1bS1ybTY3MTkxLm8KL2hv
bWUvc2FtL2RybS9saW51eC5naXQvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJheWRpdW0t
cm02NzE5MS5jOiBJbiBmdW5jdGlvbiDigJhyYWRfYmxfZ2V0X2JyaWdodG5lc3PigJk6Ci9ob21l
L3NhbS9kcm0vbGludXguZ2l0L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXlkaXVtLXJt
NjcxOTEuYzo0NzA6MTc6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhkZXbigJkgWy1XdW51
c2VkLXZhcmlhYmxlXQogIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZkc2ktPmRldjsKICAgICAgICAg
ICAgICAgICBefn4KL2hvbWUvc2FtL2RybS9saW51eC5naXQvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXJheWRpdW0tcm02NzE5MS5jOiBJbiBmdW5jdGlvbiDigJhyYWRfYmxfdXBkYXRlX3N0
YXR1c+KAmToKL2hvbWUvc2FtL2RybS9saW51eC5naXQvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXJheWRpdW0tcm02NzE5MS5jOjQ5MjoxNzogd2FybmluZzogdW51c2VkIHZhcmlhYmxlIOKA
mGRlduKAmSBbLVd1bnVzZWQtdmFyaWFibGVdCiAgc3RydWN0IGRldmljZSAqZGV2ID0gJmRzaS0+
ZGV2OwogICAgICAgICAgICAgICAgIF5+fgoKUGxlYXNlIGZpeCBhbmQgdXBkYXRlIHlvdXIgc2Ny
aXB0cyB0byBjYXRjaCB0aGlzIGluIHRoZSBmdXR1cmUuCgoJU2FtCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
