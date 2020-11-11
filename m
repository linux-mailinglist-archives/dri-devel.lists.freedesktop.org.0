Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A6B2AF9D4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 21:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DCD6E02D;
	Wed, 11 Nov 2020 20:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB956E02D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 20:36:25 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6DC23200DA;
 Wed, 11 Nov 2020 21:36:22 +0100 (CET)
Date: Wed, 11 Nov 2020 21:36:20 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH] drm/kmb: Fix build warnings
Message-ID: <20201111203620.GA3013948@ravnborg.org>
References: <1605045169-2696-1-git-send-email-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605045169-2696-1-git-send-email-anitha.chrisanthus@intel.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=QyXUC8HyAAAA:8 a=7gkXJVJtAAAA:8
 a=oaWHYoayf9LVmnIBLqAA:9 a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5pdGhhLAoKT24gVHVlLCBOb3YgMTAsIDIwMjAgYXQgMDE6NTI6NDlQTSAtMDgwMCwgQW5p
dGhhIENocmlzYW50aHVzIHdyb3RlOgo+IEZpeGVkIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBi
dWlsZCB3YXJuaW5ncwo+ICBkcml2ZXJzL2dwdS9kcm0va21iL2ttYl9wbGFuZS5oOjc0OjE4OiB3
YXJuaW5nOiDigJhrbWJfZm9ybWF0c1924oCZCj4gIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3Vu
dXNlZC1jb25zdC12YXJpYWJsZT1dCj4gIGRyaXZlcnMvZ3B1L2RybS9rbWIva21iX3BsYW5lLmg6
NjE6MTg6IHdhcm5pbmc6IOKAmGttYl9mb3JtYXRzX2figJkKPiAgZGVmaW5lZCBidXQgbm90IHVz
ZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbml0aGEg
Q2hyaXNhbnRodXMgPGFuaXRoYS5jaHJpc2FudGh1c0BpbnRlbC5jb20+Cj4gQ2M6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KClRoYW5rcywgYXBwbGllZCB0byBkcm0tbWlzYy1uZXh0
LgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
