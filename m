Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB9E2B0EFA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 21:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD916E429;
	Thu, 12 Nov 2020 20:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2526E429
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 20:22:08 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D4ACB20023;
 Thu, 12 Nov 2020 21:22:05 +0100 (CET)
Date: Thu, 12 Nov 2020 21:22:04 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 27/30] drm/sti/sti_hdmi: Move 'colorspace_mode_names'
 array to where its used
Message-ID: <20201112202204.GE3287572@ravnborg.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-28-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112190039.2785914-28-lee.jones@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=KKAkSRfTAAAA:8 a=8b9GpE9nAAAA:8 a=e5mUnYsNAAAA:8
 a=sZ_kP7L1YpjpdGNb6c8A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=T3LWEMljR5ZiDmsYVIUa:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, Vincent Abriou <vincent.abriou@st.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGVlLApPbiBUaHUsIE5vdiAxMiwgMjAyMCBhdCAwNzowMDozNlBNICswMDAwLCBMZWUgSm9u
ZXMgd3JvdGU6Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmco
cyk6Cj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuaDozNjo0MDogd2FybmluZzog
4oCYY29sb3JzcGFjZV9tb2RlX25hbWVz4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNl
ZC1jb25zdC12YXJpYWJsZT1dCj4gIDM2IHwgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcHJvcF9l
bnVtX2xpc3QgY29sb3JzcGFjZV9tb2RlX25hbWVzW10gPSB7Cj4gIHwgXn5+fn5+fn5+fn5+fn5+
fn5+fn5+Cj4gCj4gQ2M6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5h
cm8ub3JnPgo+IENjOiBWaW5jZW50IEFicmlvdSA8dmluY2VudC5hYnJpb3VAc3QuY29tPgo+IENj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5k
ZT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkIHRvIGRybS1taXNjLW5l
eHQsCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
