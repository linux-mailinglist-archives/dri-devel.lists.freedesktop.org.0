Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D541C4419A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 18:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715958929C;
	Thu, 13 Jun 2019 16:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3228929C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 16:16:11 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:56368)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hbSOO-00049v-VK; Thu, 13 Jun 2019 17:16:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hbSON-0001Mt-IQ; Thu, 13 Jun 2019 17:15:59 +0100
Date: Thu, 13 Jun 2019 17:15:59 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] armada: no need to check return value of debugfs_create
 functions
Message-ID: <20190613161559.tef4ajcs5rdldf5d@shell.armlinux.org.uk>
References: <20190613132850.GC4863@kroah.com>
 <20190613143600.ldcqfw4s3t2pxh2y@shell.armlinux.org.uk>
 <20190613160114.GC4632@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613160114.GC4632@kroah.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TMXwSiwnWgLvUbPrBq7EFUAKnCW2RZ1tuTU3nbdTlKY=; b=moVpyG4Ih/p8w4k+IdLoLu3/8
 b7/0gEMeImJqcEv8ltNBCrPWJ3U9FlKSeYvgYE2mKjw17ZSe+3ZvRyBOzQvmueJRVWfXSsYfwZVdg
 THD6mxmJMcI47CxKfT8QM6nYJp6Aat9acDB7/E/bK+nJNFAoPt7ZRe15+djFN1w7udAauOOxKfzQn
 fxa06jr4iJoIL92dY7NzsW26OCqssgdzB+eTadmJFn5pwt8p+AlWerwhnBqZbJFlw3oXzoMhwEtXF
 XM2Qzj0cp9vE0ai8uNo3sAvs97Q/zB4dgpry+torOH0KYNDdJDhgU6SrOprN+8u9O0jFXBIUZMbqp
 XN8TZ14+A==;
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDY6MDE6MTRQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDAzOjM2OjAwUE0gKzAxMDAsIFJ1
c3NlbGwgS2luZyAtIEFSTSBMaW51eCBhZG1pbiB3cm90ZToKPiA+IE9uIFRodSwgSnVuIDEzLCAy
MDE5IGF0IDAzOjI4OjUwUE0gKzAyMDAsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToKPiA+ID4g
V2hlbiBjYWxsaW5nIGRlYnVnZnMgZnVuY3Rpb25zLCB0aGVyZSBpcyBubyBuZWVkIHRvIGV2ZXIg
Y2hlY2sgdGhlCj4gPiA+IHJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4gd29yayBvciBu
b3QsIGJ1dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKPiA+ID4gbmV2ZXIgZG8gc29tZXRoaW5nIGRp
ZmZlcmVudCBiYXNlZCBvbiB0aGlzLgo+ID4gCj4gPiBQbGVhc2UgZG9uJ3QgbWVyZ2UgdGhpcyBw
YXRjaCAtIEkgaGF2ZSBhIGNoYW5nZSB0aGF0IGNvbmZsaWN0cyB3aXRoIHRoaXMKPiA+IHdoaWNo
IHN3aXRjaGVzIHVzIG92ZXIgdG8gdXNpbmcgZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKCksIHRo
ZXJlYnkKPiA+IGVsaW1pbmF0aW5nIHRoaXMgY29kZS4KPiAKPiBJc24ndCBpdCAiZmlyc3QgcmVj
ZWl2ZWQsIGZpcnN0IGFwcGxpZWQ/IiAgVGhhdCdzIGhvdyBpdCBpcyBmb3IgbXkKPiBzdWJzeXN0
ZW1zLi4uCgpXaGVuIEkgc3RhcnRlZCB3b3JraW5nIG9uIHRoZSBrZXJuZWwgaW4gdGhlIDE5OTBz
LCBpdCB3YXMgInRoZSBtb3N0CnRlY2huaWNhbGx5IGNvcnJlY3QgYXBwcm9hY2ggb2YgY29tcGV0
aW5nIGFwcHJvYWNoZXMiLiAgSWYgd2UndmUKbm93IHN3aXRjaGVkIHRvICJmaXJzdCByZWNlaXZl
ZCwgZmlyc3QgYXBwbGllZCIgdGhhdCBjYW4gb25seSBiZQpoYXJtZnVsIGFuZCBkZW1vdGl2YXRp
bmcgdG8gdGhvc2Ugd2hvIHdpc2ggdG8gZG8gYSBnb29kIGpvYi4KCklmIHNvbWVvbmUgaGFzIGEg
YmV0dGVyIGFwcHJvYWNoIHJlYWR5IHRvIGdvLCB3aHkgc2hvdWxkIHRoZQppbmZlcmlvciBhcHBy
b2FjaCBiZSBhcHBsaWVkIGFuZCB0aGVuIHRoZSBiZXR0ZXIgYXBwcm9hY2ggaGF2ZSB0bwpiZSBy
ZWJhc2VkIG9uIHRvcCBvZiB0aGUgaW5mZXJpb3IgYXBwcm9hY2g/ICBUaGlzIG1ha2VzIG5vIHNl
bnNlLgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVr
L2RldmVsb3Blci9wYXRjaGVzLwpGVFRDIGJyb2FkYmFuZCBmb3IgMC44bWlsZSBsaW5lIGluIHN1
YnVyYmlhOiBzeW5jIGF0IDEyLjFNYnBzIGRvd24gNjIya2JwcyB1cApBY2NvcmRpbmcgdG8gc3Bl
ZWR0ZXN0Lm5ldDogMTEuOU1icHMgZG93biA1MDBrYnBzIHVwCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
