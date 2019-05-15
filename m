Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2AF1EAB3
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 11:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BB0895C4;
	Wed, 15 May 2019 09:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 311 seconds by postgrey-1.36 at gabe;
 Wed, 15 May 2019 09:09:47 UTC
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733338959D;
 Wed, 15 May 2019 09:09:47 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id CED6D803D7;
 Wed, 15 May 2019 11:09:45 +0200 (CEST)
Date: Wed, 15 May 2019 11:09:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v5 07/11] drm/fb-helper: Move out commit code
Message-ID: <20190515090944.GC31712@ravnborg.org>
References: <20190506180139.6913-1-noralf@tronnes.org>
 <20190506180139.6913-8-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506180139.6913-8-noralf@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=SJz97ENfAAAA:8
 a=7gkXJVJtAAAA:8 a=z7kW-bJOffKxQzrOZgEA:9 a=wPNLvfGTeEIA:10
 a=vFet0B0WnEQeilDPIY6i:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmLgoKT24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDg6MDE6MzVQTSArMDIwMCwgTm9y
YWxmIFRyw7hubmVzIHdyb3RlOgo+IE1vdmUgdGhlIG1vZGVzZXQgY29tbWl0IGNvZGUgdG8gZHJt
X2NsaWVudF9tb2Rlc2V0Lgo+IE5vIGNoYW5nZXMgZXhjZXB0IGV4cG9ydGluZyBBUEkuCj4gCj4g
djI6IE1vdmUgdG8gZHJtX2NsaWVudF9tb2Rlc2V0LmMgaW5zdGVhZCBvZiBkcm1fY2xpZW50LmMK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4K
UmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KCkFzc3VtZXMgdGhp
cyBpcyBhIG9uZS10by1vbmUgY29weS4gSSBkaWQgbm90IGNoZWNrIGl0IGxpbmUtYnktbGluZS4K
U2hvdWxkIGdpdCBiZSBhYmxlIHRvIHRlbGwgdGhpcyB3aXRoIHByb3BlciBvcHRpb25zPwoKCVNh
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
