Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D27E44DE4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 22:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AED2892EE;
	Thu, 13 Jun 2019 20:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2B2892EE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:56:58 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53020)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hbWmA-0005Re-OH; Thu, 13 Jun 2019 21:56:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hbWm8-0001W3-AJ; Thu, 13 Jun 2019 21:56:48 +0100
Date: Thu, 13 Jun 2019 21:56:48 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH v2 00/13] tda998x updates
Message-ID: <20190613205648.6qw6vp4flprobka6@shell.armlinux.org.uk>
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
 <20190613142943.vhgiy6yvyjz6uqlp@shell.armlinux.org.uk>
 <CAGngYiVVa8WqQebDpV5ZUrc433LcEWAuvMFCFimq5ku9ij4CHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGngYiVVa8WqQebDpV5ZUrc433LcEWAuvMFCFimq5ku9ij4CHQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R95RsaCjZUohS74+7+eTp22xAA5e9Tx0DQ54HHlCK2A=; b=0ueRHyJqiJKI4/JhubXR1tbAW
 PpoExyZBfucdXmQELqLM1UYofnEMdQb311DH3kjX61hiap13lG5zXX8QV6DxDobCPive8GAkoTV8n
 2X2SzJhrZcPF4DHBRFHkG+Mjwdhb0z5MBCC6EHtDSJX9qHGqnT6/JAmo2YXfhmj0TyJDmXwasOF1Q
 gdu+5yRwQs1xpvMeDah2f/7XFdi3PIIqkBe8l0r1D9JNXQh+y4Bawkk0a21Mgr2LNatcyQrn+rJvd
 PH4lZvfsv+iN2M1/RM5TKOQ0dAObk9GnUvJgCZ2tnwvWHVxXR6baBCAe+GctoLfGkODGBvVjoonr4
 Go5y6RgvA==;
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDM6NTE6MDZQTSAtMDQwMCwgU3ZlbiBWYW4gQXNicm9l
Y2sgd3JvdGU6Cj4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTA6MjkgQU0gUnVzc2VsbCBLaW5n
IC0gQVJNIExpbnV4IGFkbWluCj4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPgo+
ID4gVGhpcyBzZXJpZXMgcmVwcmVzZW50cyBkZXZlbG9wbWVudCB3b3JrIGNvbGxlY3RlZCBvdmVy
IHRoZSBsYXN0IHNpeAo+ID4gbW9udGhzIHRvIGltcHJvdmUgdGhlIFREQTk5OHggZHJpdmVyLCBw
YXJ0aWN1bGFybHkgZm9yIHRoZSBhdWRpbwo+ID4gc2lkZS4gIFRoZXNlIHBhdGNoZXMgY2FuIGJl
IGZvdW5kIGluIG15ICJkcm0tdGRhOTk4eC1kZXZlbCIgYnJhbmNoCj4gPiBhdCBnaXQ6Ly9naXQu
YXJtbGludXgub3JnLnVrL35ybWsvbGludXgtYXJtLmdpdAo+IAo+IEZvciB0aGUgd2hvbGUgcGF0
Y2hzZXQsIGFmdGVyICdoYWNraW5nJyB0aGUgYmNsa19yYXRpbyB0byBjb3JyZXNwb25kIHdpdGgK
PiBteSBpbXg2cSBzc2kncyB3aXJlIGZvcm1hdDoKPiAKPiBUZXN0ZWQtYnk6IFN2ZW4gVmFuIEFz
YnJvZWNrIDxUaGVTdmVuNzNAZ21haWwuY29tPgoKVGhhbmtzLgoKLS0gClJNSydzIFBhdGNoIHN5
c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRD
IGJyb2FkYmFuZCBmb3IgMC44bWlsZSBsaW5lIGluIHN1YnVyYmlhOiBzeW5jIGF0IDEyLjFNYnBz
IGRvd24gNjIya2JwcyB1cApBY2NvcmRpbmcgdG8gc3BlZWR0ZXN0Lm5ldDogMTEuOU1icHMgZG93
biA1MDBrYnBzIHVwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
