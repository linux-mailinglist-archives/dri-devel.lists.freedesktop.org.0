Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DAD42A77
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 17:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298C7896B5;
	Wed, 12 Jun 2019 15:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F0F896B0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 15:13:15 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4543B803BC;
 Wed, 12 Jun 2019 17:13:13 +0200 (CEST)
Date: Wed, 12 Jun 2019 17:13:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Shobhit Kukreti <shobhitkukreti@gmail.com>
Subject: Re: [PATCH] video: backlight: Replace old GPIO APIs with GPIO
 Consumer APIs for sky81542-backlight driver
Message-ID: <20190612151312.GB5030@ravnborg.org>
References: <20190612043229.GA18179@t-1000>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612043229.GA18179@t-1000>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=COmZixlhozaZKkr9zfUA:9 a=CjuIK1q_8ugA:10
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2hvYmhpdAoKPiAtCWlmIChncGlvX2lzX3ZhbGlkKHBkYXRhLT5ncGlvX2VuYWJsZSkpIHsK
PiAtCQlyZXQgPSBkZXZtX2dwaW9fcmVxdWVzdF9vbmUoZGV2LCBwZGF0YS0+Z3Bpb19lbmFibGUs
Cj4gLQkJCQkJR1BJT0ZfT1VUX0lOSVRfSElHSCwgInNreTgxNDUyLWVuIik7CgoKPiArCXBkYXRh
LT5ncGlvZF9lbmFibGUgPSBkZXZtX2dwaW9kX2dldChkZXYsICJzazgxNDUyLWVuIiwgR1BJT0Rf
T1VUX0hJR0gpOwo+ICsJaWYgKElTX0VSUihwZGF0YS0+Z3Bpb2RfZW5hYmxlKSkgewo+ICsJCWxv
bmcgcmV0ID0gUFRSX0VSUihwZGF0YS0+Z3Bpb2RfZW5hYmxlKTsKCkluIHRoZSBvbGQgY29kZSB0
aGUgcHJvcGVydHkgd2FzIG5hbWVkICJza3k4MTQ1Mi1lbiIuCkluIHRoZSBuZXcgY29kZSB0aGUg
cHJvcGVydHkgaXMgbmFtZWQgInNrODE0NTItZW4iLgoKTW9zdCBsaWtlbHkgYSBidWcuCgoJU2Ft
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
