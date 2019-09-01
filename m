Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA66A4FBF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 09:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FC889BF8;
	Mon,  2 Sep 2019 07:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B080C89B3B;
 Sun,  1 Sep 2019 21:40:47 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 00BAB3E993;
 Sun,  1 Sep 2019 21:40:45 +0000 (UTC)
Date: Sun, 1 Sep 2019 17:40:45 -0400
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com, sean@poorly.run, bjorn.andersson@linaro.org
Subject: Re: [PATCH v7 0/7] qcom: add OCMEM support
Message-ID: <20190901214045.GA14321@onstation.org>
References: <20190823121637.5861-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190823121637.5861-1-masneyb@onstation.org>
X-Mailman-Approved-At: Mon, 02 Sep 2019 07:24:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1567374046;
 bh=yFlCHaBNAh10QurQOZiU1mvxCHhFWTKUbESMNHsI3oM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XMa2krbQak5fj5lyPbJuEKxTSFxIEGMzFR6NbZINT4gbbsTd2Qq1G2J1kUB++owJO
 Sb4idiBvJ08LgumuEeD+bA0zz9/R9n+pypLtqswcMqM0IjMa9MEnRiNI57ldFSPFsC
 4X0cl5mvKy9evzvJ7T1i/DrrnPW6f5aiCI50bxNo=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jonathan@marek.ca,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, agross@kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iIEMgLyBTZWFuIFAsCgpPbiBGcmksIEF1ZyAyMywgMjAxOSBhdCAwNToxNjozMEFNIC0w
NzAwLCBCcmlhbiBNYXNuZXkgd3JvdGU6Cj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0
IGZvciBRdWFsY29tbSdzIE9uIENoaXAgTUVNb3J5IChPQ01FTSkKPiB0aGF0IGlzIG5lZWRlZCBp
biBvcmRlciB0byBzdXBwb3J0IHNvbWUgYTN4eCBhbmQgYTR4eC1iYXNlZCBHUFVzCj4gdXBzdHJl
YW0uIFRoaXMgaXMgYmFzZWQgb24gUm9iIENsYXJrJ3MgcGF0Y2ggc2VyaWVzIHRoYXQgaGUgc3Vi
bWl0dGVkCj4gaW4gT2N0b2JlciAyMDE1IGFuZCBJIGFtIHJlc3VibWl0dGluZyB1cGRhdGVkIHBh
dGNoZXMgd2l0aCBoaXMKPiBwZXJtaXNzaW9uLiBTZWUgdGhlIGluZGl2aWR1YWwgcGF0Y2hlcyBm
b3IgdGhlIGNoYW5nZWxvZy4KCkkgdGFsa2VkIHRvIEJqb3JuIGluIHBlcnNvbiBhdCB0aGUgRW1i
ZWRkZWQgTGludXggQ29uZmVyZW5jZSBvdmVyIGEKd2VlayBhZ28gYWJvdXQgdGhpcyBzZXJpZXMu
IEhlIHRoaW5rcyB0aGF0IHRoaXMgc2VyaWVzIHNob3VsZCBnbyB0aHJvdWdoCnlvdXIgdHJlZS4g
SSBhc3N1bWUgaXQncyB0b28gbGF0ZSBmb3IgdGhlIHVwY29taW5nIG1lcmdlIHdpbmRvdywgd2hp
Y2gKaXMgZmluZS4gSSBqdXN0IHdhbnQgdG8gbWFrZSBzdXJlIHRoYXQgdGhpcyBzZXJpZXMgZ2V0
cyBwaWNrZWQgdXAgZm9yCnRoZSBmb2xsb3dpbmcgbWVyZ2Ugd2luZG93LgoKSSBqdXN0IHNlbnQg
b3V0IGEgZml4IGZvciBhIGNvbXBpbGVyIGVycm9yIG9uIE1JUFMgYXMgYSBzZXBhcmF0ZSBwYXRj
aDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDkwMTIxMzAzNy4yNTg4OS0xLW1h
c25leWJAb25zdGF0aW9uLm9yZy8KCkJyaWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
