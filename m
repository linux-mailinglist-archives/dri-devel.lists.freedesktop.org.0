Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA832698FF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 18:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4E789A5E;
	Mon, 15 Jul 2019 16:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CFE89A5E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 16:28:42 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id AE90020020;
 Mon, 15 Jul 2019 18:28:40 +0200 (CEST)
Date: Mon, 15 Jul 2019 18:28:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v1 08/33] drm/fsl-dcu: drop use of drmP.h
Message-ID: <20190715162839.GD27038@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-9-sam@ravnborg.org>
 <97d4d798f226c06dbf0e4dbfb280a693@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <97d4d798f226c06dbf0e4dbfb280a693@agner.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=8AirrxEcAAAA:8 a=Szf1Ry5gbKK9hiQg_nsA:9 a=8F0bylWuqIdF1q5B:21
 a=SyAXZgrL_58b8wpm:21 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=ST-jHhOKWsTCqRlWije3:22
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
Cc: Alison Wang <alison.wang@nxp.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam.ravnborg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMTA6NDY6NTBQTSArMDIwMCwgU3RlZmFuIEFnbmVyIHdy
b3RlOgo+IE9uIDIwMTktMDYtMzAgMDg6MTgsIFNhbSBSYXZuYm9yZyB3cm90ZToKPiA+IERyb3Ag
dXNlIG9mIHRoZSBkZXByZWNhdGVkIGRybVAuaCBoZWFkZXIgZmlsZS4KPiA+IEZpeCBmYWxsb3V0
Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+
Cj4gPiBDYzogU3RlZmFuIEFnbmVyIDxzdGVmYW5AYWduZXIuY2g+Cj4gPiBDYzogQWxpc29uIFdh
bmcgPGFsaXNvbi53YW5nQG54cC5jb20+Cj4gCj4gQWNrZWQtYnk6IFN0ZWZhbiBBZ25lciA8c3Rl
ZmFuQGFnbmVyLmNoPgoKVGhhbmtzLCBhcHBsaWVkLgoKCVNhbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
