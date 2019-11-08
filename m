Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C58F45CA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 12:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94656F94C;
	Fri,  8 Nov 2019 11:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B496F94C;
 Fri,  8 Nov 2019 11:37:08 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C480320869;
 Fri,  8 Nov 2019 11:37:07 +0000 (UTC)
Date: Fri, 8 Nov 2019 12:37:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH 4/5] power: avs: smartreflex: Remove superfluous cast in
 debugfs_create_file() call
Message-ID: <20191108113705.GA721212@kroah.com>
References: <20191021145149.31657-1-geert+renesas@glider.be>
 <20191021145149.31657-5-geert+renesas@glider.be>
 <4367615.jSCgeRn5tF@kreacher>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4367615.jSCgeRn5tF@kreacher>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573213028;
 bh=G5j+RwShAgrettv3VQJ2Hzibs0yOoFaJu63CqOxn8Oo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iWFuYTQcqXM/DR65wCIopKLQsBH2V3ve8n4fUHcE6O0QCwEWq5LcBR7HT3UYbVuXy
 LLH+DzR/qTOHmtgWKoaaTL5pocOV+6Wehrg/cMS5rr/2mDYoYQbR8bXug4dIKrlFDH
 izPZgMynJUZ3fTgx+ygLAuT+nnb+N95WoPMCQjcs=
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
Cc: Nishanth Menon <nm@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Paul Mackerras <paulus@samba.org>,
 Breno =?iso-8859-1?Q?Leit=E3o?= <leitao@debian.org>, David@rox.of.borg,
 Herbert Xu <herbert@gondor.apana.org.au>, Kevin Hilman <khilman@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nayna Jain <nayna@linux.ibm.com>,
 amd-gfx@lists.freedesktop.org, Casey Leedom <leedom@chelsio.com>,
 linux-pm@vger.kernel.org, Pensando Drivers <drivers@pensando.io>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 Shannon Nelson <snelson@pensando.io>, linuxppc-dev@lists.ozlabs.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMTI6MjQ6NDJQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gTW9uZGF5LCBPY3RvYmVyIDIxLCAyMDE5IDQ6NTE6NDggUE0gQ0VUIEdl
ZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+IFRoZXJlIGlzIG5vIG5lZWQgdG8gY2FzdCBhIHR5
cGVkIHBvaW50ZXIgdG8gYSB2b2lkIHBvaW50ZXIgd2hlbiBjYWxsaW5nCj4gPiBhIGZ1bmN0aW9u
IHRoYXQgYWNjZXB0cyB0aGUgbGF0dGVyLiAgUmVtb3ZlIGl0LCBhcyB0aGUgY2FzdCBwcmV2ZW50
cwo+ID4gZnVydGhlciBjb21waWxlciBjaGVja3MuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gCj4gR3JlZywgaGF2
ZSB5b3UgdGFrZW4gdGhpcyBvbmUgYnkgYW55IGNoYW5jZT8KCk5vcGUsIGl0J3MgYWxsIHlvdXJz
ISAgOikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
