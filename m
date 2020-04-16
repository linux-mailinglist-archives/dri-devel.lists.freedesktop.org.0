Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 746B21ACEE1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 19:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BE06E97A;
	Thu, 16 Apr 2020 17:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0936E97A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 17:45:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A9AC97D;
 Thu, 16 Apr 2020 19:45:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1587059125;
 bh=Si+PzRRws6+4QDc7hynPy3aV2BYGQt/fRSsGgtq8sj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A3exe/dLkoRkW7lEsQ8BdExFrYDd58/ZG1h8n96EfHkx7BDjk+IrwtvIZezM2z5on
 5y5MAj37PUdA2af/qbeQzCtF7HD2GfTrxEy6vypLrXJ4jIPlNNeNY/Mfl0PxRmUYTp
 sp7agrePntewR5vh0XcIiIjWjIf+Bdq8KH4T6wzw=
Date: Thu, 16 Apr 2020 20:45:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 1/2] drm/tegra: output: Don't leak OF node on error
Message-ID: <20200416174513.GT4796@pendragon.ideasonboard.com>
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-2-digetx@gmail.com>
 <20200416172727.GN4796@pendragon.ideasonboard.com>
 <304a2a58-0031-bf88-6290-e72ab025d8c5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <304a2a58-0031-bf88-6290-e72ab025d8c5@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LAoKT24gVGh1LCBBcHIgMTYsIDIwMjAgYXQgMDg6MzA6MjRQTSArMDMwMCwgRG1p
dHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDE2LjA0LjIwMjAgMjA6MjcsIExhdXJlbnQgUGluY2hhcnQg
0L/QuNGI0LXRgjoKPiA+IE9uIFRodSwgQXByIDE2LCAyMDIwIGF0IDA4OjI0OjA0UE0gKzAzMDAs
IERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiA+PiBUaGUgT0Ygbm9kZSBzaG91bGQgYmUgcHV0IGJl
Zm9yZSByZXR1cm5pbmcgZXJyb3IgaW4gdGVncmFfb3V0cHV0X3Byb2JlKCksCj4gPj4gb3RoZXJ3
aXNlIG5vZGUncyByZWZjb3VudCB3aWxsIGJlIGxlYWtlZC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYt
Ynk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPiA+IAo+ID4gUmV2aWV3ZWQt
Ynk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4K
PiAKPiBIZWxsbyBMYXVyZW50LAo+IAo+IFRoYXQgaXMgdGhlIGZhc3Rlc3Qga2VybmVsIHJldmll
dyBJIGV2ZXIgZ290LCB0aGFuayB5b3UgOikKCkkgdGhpbmsgSSdtIGFsc28gZ3VpbHR5IGZvciB0
aGUgc2xvd2VzdCBrZXJuZWwgcmV2aWV3cyBldmVyLCBzbyBtYXliZSBpbgp0aGUgZW5kIGl0IHdp
bGwgZXZlbiBvdXQgOi0pCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
