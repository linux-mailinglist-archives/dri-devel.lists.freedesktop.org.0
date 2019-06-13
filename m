Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E8343FDE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 18:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C8788E87;
	Thu, 13 Jun 2019 16:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C6F88E87
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 16:01:17 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1A3020679;
 Thu, 13 Jun 2019 16:01:16 +0000 (UTC)
Date: Thu, 13 Jun 2019 18:01:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH] armada: no need to check return value of debugfs_create
 functions
Message-ID: <20190613160114.GC4632@kroah.com>
References: <20190613132850.GC4863@kroah.com>
 <20190613143600.ldcqfw4s3t2pxh2y@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613143600.ldcqfw4s3t2pxh2y@shell.armlinux.org.uk>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560441677;
 bh=4uvljIY72AOvHwBEiAypsztJBI9y/HX4sZy9a3M6Apo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R9D3jrNWAih8DM2XNIOoFxHwc0WRlJcW+gextPbehU/giENWzjJ0B6BaSJTAj5hNQ
 1GVh5Ow7a7IciWiuU2rVrS01HbcyY+GHYjvqv48c69Fruy84/GE3y3snx/HZfYupru
 +DhEJLhqC4suhwYyWVpbQSIJcaYd8krlwD492He4=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDM6MzY6MDBQTSArMDEwMCwgUnVzc2VsbCBLaW5nIC0g
QVJNIExpbnV4IGFkbWluIHdyb3RlOgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDAzOjI4OjUw
UE0gKzAyMDAsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToKPiA+IFdoZW4gY2FsbGluZyBkZWJ1
Z2ZzIGZ1bmN0aW9ucywgdGhlcmUgaXMgbm8gbmVlZCB0byBldmVyIGNoZWNrIHRoZQo+ID4gcmV0
dXJuIHZhbHVlLiAgVGhlIGZ1bmN0aW9uIGNhbiB3b3JrIG9yIG5vdCwgYnV0IHRoZSBjb2RlIGxv
Z2ljIHNob3VsZAo+ID4gbmV2ZXIgZG8gc29tZXRoaW5nIGRpZmZlcmVudCBiYXNlZCBvbiB0aGlz
Lgo+IAo+IFBsZWFzZSBkb24ndCBtZXJnZSB0aGlzIHBhdGNoIC0gSSBoYXZlIGEgY2hhbmdlIHRo
YXQgY29uZmxpY3RzIHdpdGggdGhpcwo+IHdoaWNoIHN3aXRjaGVzIHVzIG92ZXIgdG8gdXNpbmcg
ZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKCksIHRoZXJlYnkKPiBlbGltaW5hdGluZyB0aGlzIGNv
ZGUuCgpJc24ndCBpdCAiZmlyc3QgcmVjZWl2ZWQsIGZpcnN0IGFwcGxpZWQ/IiAgVGhhdCdzIGhv
dyBpdCBpcyBmb3IgbXkKc3Vic3lzdGVtcy4uLgoKQW55d2F5LCBJIGhhdmUgYSBtdWNoIGxhcmdl
ciBwYXRjaCBmb3IgYWxsIHVzZXJzIG9mCmRybV9kZWJ1Z2ZzX2NyZWF0ZV9maWxlcyBjb21pbmcs
IGJ1dCBJJ2xsIHdhaXQgZm9yIGFsbCBvZiB0aGVzZSB0aW55Cm9uZXMgdG8gbGFuZCBiZWZvcmUg
c2VuZGluZyB0aGF0IG91dCA6KQoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
