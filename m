Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B76765E1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 14:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B976ED30;
	Fri, 26 Jul 2019 12:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1C46ED30
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 12:33:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 655ED804B3;
 Fri, 26 Jul 2019 14:33:54 +0200 (CEST)
Date: Fri, 26 Jul 2019 14:33:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH v2] drm/panel: check failure cases in the probe func
Message-ID: <20190726123353.GA16964@ravnborg.org>
References: <20190724185933.GE22640@ravnborg.org>
 <20190724195534.9303-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724195534.9303-1-navid.emamdoost@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=warq429__hhIKtkPYyQA:9 a=CjuIK1q_8ugA:10
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
Cc: secalert@redhat.com, David Airlie <airlied@linux.ie>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, smccaman@umn.edu, emamd001@umn.edu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmF2aWQuCgpPbiBXZWQsIEp1bCAyNCwgMjAxOSBhdCAwMjo1NTozNFBNIC0wNTAwLCBOYXZp
ZCBFbWFtZG9vc3Qgd3JvdGU6Cj4gVGhlIGZvbGxvd2luZyBmdW5jdGlvbiBjYWxscyBtYXkgZmFp
bCBhbmQgcmV0dXJuIE5VTEwsIHNvIHRoZSBudWxsIGNoZWNrCj4gaXMgYWRkZWQuCj4gb2ZfZ3Jh
cGhfZ2V0X25leHRfZW5kcG9pbnQKPiBvZl9ncmFwaF9nZXRfcmVtb3RlX3BvcnRfcGFyZW50Cj4g
b2ZfZ3JhcGhfZ2V0X3JlbW90ZV9wb3J0Cj4gCj4gVXBkYXRlOiBUaGFua3MgdG8gU2FtIFJhdm5i
b3JnLCBmb3Igc3VnZ2Vzc2lvbiBvbiB0aGUgdXNlIG9mIGdvdG8gdG8gYXZvaWQKPiBsZWFraW5n
IGVuZHBvaW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5hdmlkIEVtYW1kb29zdCA8bmF2aWQuZW1h
bWRvb3N0QGdtYWlsLmNvbT4KQXBwbGllZCBhbmQgcHVzaGVkIHRvIGRybS1taXNjLW5leHQuCgoJ
U2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
