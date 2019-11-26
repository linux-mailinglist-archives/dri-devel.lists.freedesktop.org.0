Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5692A10A470
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 20:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424286E088;
	Tue, 26 Nov 2019 19:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD88B6E088
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 19:24:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B03BA20055;
 Tue, 26 Nov 2019 20:24:46 +0100 (CET)
Date: Tue, 26 Nov 2019 20:24:45 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH 01/30] drm: Introduce drm_bridge_init()
Message-ID: <20191126192445.GA2044@ravnborg.org>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
 <20191126131541.47393-2-mihail.atanassov@arm.com>
 <20191126142610.GV29965@phenom.ffwll.local>
 <11447519.fzG14qnjOE@e123338-lin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11447519.fzG14qnjOE@e123338-lin>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=oJJ1f2mEg_3WOdBYLHIA:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWloYWlsLgoKPiBBY2ssIGJ1dCB3aXRoIG9uZSBjYXZlYXQ6IGJyaWRnZS0+ZGV2IGlzIHRo
ZSBzdHJ1Y3QgZHJtX2RldmljZSB0aGF0IGlzCj4gdGhlIGJyaWRnZSBjbGllbnQsIHdlIG5lZWQg
dG8gYWRkIGEgYnJpZGdlLT5kZXZpY2UgKHBhdGNoIDI5IGluIHRoaXMKPiBzZXJpZXMpIHdoaWNo
IGlzIHRoZSBzdHJ1Y3QgZGV2aWNlIHRoYXQgd2lsbCBtYW5hZ2UgdGhlIGJyaWRnZSBsaWZldGlt
ZS4KT3RoZXIgcGxhY2VzIHVzZXMgdGhlIHZhcmlhYmxlIG5hbWUgImRybSIgZm9yIGEgZHJtX2Rl
dmljZS4KVGhpcyBpcyBsZXNzIGNvbmZ1c2lvbiB0aGFuIHRoZSAiZGV2IiBuYW1lLgoKSXQgc2Vl
bXMgYSByZWNlbnQgdHJlbmQgdG8gdXNlIHRoZSB2YXJpYWJsZSBuYW1lICJkcm0iIHNvIHlvdSBj
YW4gZmluZCBhCmxvdCBvZiBwbGFjZXMgdXNpbmcgImRldiIuCgpiaWtlLXNoZWRkaW5nIC0gYnV0
IGFsc28gYWJvdXQgcmVhZGFiaWxpdHkuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
