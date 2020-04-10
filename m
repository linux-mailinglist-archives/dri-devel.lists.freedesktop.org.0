Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4581A4628
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 14:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BBA6E2A0;
	Fri, 10 Apr 2020 12:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC506E2A0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 12:14:12 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 6B5A080530;
 Fri, 10 Apr 2020 14:14:08 +0200 (CEST)
Date: Fri, 10 Apr 2020 14:14:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: drm/tve200: Checking for a failed platform_get_irq() call in
 tve200_probe()
Message-ID: <20200410121406.GA31761@ravnborg.org>
References: <0263f4fb-c349-7651-b590-8722cdd30c85@web.de>
 <20200410101831.GA27723@ravnborg.org>
 <235b500a-0e5e-9ca3-4be5-9026c7d9f87f@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <235b500a-0e5e-9ca3-4be5-9026c7d9f87f@web.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10
 a=JsGlSLdvelpcWIy28Y0A:9 a=QEXdDO2ut3YA:10
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
Cc: Tang Bin <tangbin@cmss.chinamobile.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWFya3VzLgoKT24gRnJpLCBBcHIgMTAsIDIwMjAgYXQgMTI6NTY6MjVQTSArMDIwMCwgTWFy
a3VzIEVsZnJpbmcgd3JvdGU6Cj4gPiBUaGUgcmlnaHQgd2F5IHRvIGNoZWNrIGZvciBlcnJvcnMg
aXMgdG8gY2hlY2sgaWYgdGhlIHJldHVybiB2YWx1ZSBpcwo+ID4gbGVzcyB0aGFuIDAuCj4gCj4g
VGhhbmtzIGZvciB5b3VyIGNvbnN0cnVjdGl2ZSBmZWVkYmFjay4KPiAKPiBJIHdhcyB1bnN1cmUg
aWYgSSBub3RpY2VkIGFub3RoZXIgcHJvZ3JhbW1pbmcgbWlzdGFrZS4KPiAKPiAKPiA+IENvdWxk
IHlvdSBwbGVhc2UgYXVkaXQgYWxsIHVzZXMgb2YgcGxhdGZvcm1fZ2V0X2lycSgpIGluIGRyaXZl
cnMvZ3B1Lwo+IAo+IEkgZm91bmQgMjAgc291cmNlIGZpbGVzIGZyb20gdGhlIHNvZnR3YXJlIOKA
nExpbnV4IG5leHQtMjAyMDA0MDjigJ0KPiB3aGljaCBzZWVtIHRvIGNvbnRhaW4gc2ltaWxhciB1
cGRhdGUgY2FuZGlkYXRlcy4KPiBXb3VsZCB5b3UgbGlrZSB0byBjbGFyaWZ5IGFueSBleHRlbnNp
b25zIGZvciBpbXByb3ZlZCBhcHBsaWNhdGlvbnMKPiBvZiBzY3JpcHRzIHdpdGggdGhlIHNlbWFu
dGljIHBhdGNoIGxhbmd1YWdlIChDb2NjaW5lbGxlIHNvZnR3YXJlKQo+IGZvciBjb3JyZXNwb25k
aW5nIGFuYWx5c2lzIGFuZCB0cmFuc2Zvcm1hdGlvbiBwdXJwb3Nlcz8KUGxlYXNlIGp1c3Qgc2Vu
ZCBhIHNlcmllcyBvZiBwYXRjaGVzLCBvbmUgZm9yIGVhY2ggZHJpdmVyLgpFYWNoIGNoYW5nZWxv
ZyBuZWVkcyB0byBleHBsYWluIHRoZSByYXRpb25hbGUgYmVoaW5kIHRoZSBjaGFuZ2UuCkxvb2sg
YXQgaG93IHRoaXMgaXMgb2Z0ZW4gZG9uZS4KCkFzIGZvciBjb2NjaW5lbGxlIC0gSSBjYW5ub3Qg
aGVscCB5b3UuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
