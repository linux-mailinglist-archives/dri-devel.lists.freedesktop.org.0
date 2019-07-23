Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0297071356
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E336E1D3;
	Tue, 23 Jul 2019 07:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0ED26E1CE;
 Tue, 23 Jul 2019 07:55:03 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B2182239E;
 Tue, 23 Jul 2019 07:55:03 +0000 (UTC)
Date: Tue, 23 Jul 2019 09:55:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jens Remus <jremus@linux.ibm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-s390@vger.kernel.org, Nicolas Pitre <nicolas.pitre@linaro.org>,
 Martin Hostettler <textshell@uchuujin.de>,
 Adam Borowski <kilobyte@angband.pl>, Mikulas Patocka <mpatocka@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] vt: Grab console_lock around con_is_bound in show_bind
Message-ID: <20190723075500.GA27243@kroah.com>
References: <20190718080903.22622-1-daniel.vetter@ffwll.ch>
 <20190723073820.GU15868@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723073820.GU15868@phenom.ffwll.local>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563868503;
 bh=XTIupdkvBAk6FNP+2QR6xl7R06H8lbRCz3aQpx99k88=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=gRzxGwffi5Myg9zbZ3d4zuP153urc4STde0+DYmBrxGGYYu3dH/MCCkZmVFZNLbjg
 DfZ/IHRTqYRbpTxVJADxQCBr9Nw/q9h5RJ+GXBacveSkT8SOkyAup3lBVKZZs5LzBZ
 Yp7hRFDGbj4PcpzU6MgeNgF+DOmpLrkX+GwkJQ6s=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDk6Mzg6MjBBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBIaSBHcmVnLAo+IAo+IERvIHlvdSBwbGFuIHRvIHBpY2sgdGhpcyB1cCBpbiB5b3Vy
IGNvbnNvbGUvdnQvd2hhdGV2ZXItZml4ZXMgYnJhbmNoPwoKWWVzLCBub3cgdGhhdCB0aGUgbWVy
Z2Ugd2luZG93IGlzIGNsb3NlZCwgSSB3aWxsIGJlIHBpY2tpbmcgdGhpcyB1cC4KCnRoYW5rcywK
CmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
