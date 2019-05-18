Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA0C22542
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2019 23:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC3D89310;
	Sat, 18 May 2019 21:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F1E89310
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2019 21:37:58 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:38162)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hS71b-0000RC-FF; Sat, 18 May 2019 22:37:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hS71Y-0003QS-V8; Sat, 18 May 2019 22:37:48 +0100
Date: Sat, 18 May 2019 22:37:48 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] drm: etnaviv: avoid DMA API warning when importing buffers
Message-ID: <20190518213748.msdvolgiu5ykmaep@shell.armlinux.org.uk>
References: <E1gyDr8-0001cW-8d@rmk-PC.armlinux.org.uk>
 <20190225105423.jouccln33vj5xtyb@shell.armlinux.org.uk>
 <20190518175133.tpj255jzi7idhwxq@shell.armlinux.org.uk>
 <CAOMZO5C_nAMQM=ODU+_v3XMhcEDg_U+wY8c0-yR-cq_BWN_tVw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5C_nAMQM=ODU+_v3XMhcEDg_U+wY8c0-yR-cq_BWN_tVw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NTByp75oL9ER+cYUi4rvgY47AqZN84/yeo0Ctkaiyo8=; b=LWINue1GYbeZcfu5ukLT3ec2m
 CMEiTcisK8DtoklIUQtvDp5HKlmPfXIC8mv84GpFOd3m5Id5+1ZPDPnPc9c3JfHiFVcJZhBWpIFx4
 jiB+9Yd4cgSOPcG6LIFYYW05Du7bxS6FgDkAOGBvSuIbWH8Q/y2ZRNgi+JCyfueU+GXkNiu3LzzA5
 mqCjK2gMmu/Kaw2qA7AY69YliFGXh1N6IGmbZBvLKg0D14vku8hPCHE1zK/BoPxcHBYwvicwZcgXY
 10PVd9FdCJ3wyPE1M5T8Jy4C9xSvBELwoAdI1aIv+g6oRYLt91+ygD9JDNZfAV0yIfqLGXltp7TYi
 hzIa+ziUg==;
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
Cc: David Airlie <airlied@linux.ie>, Christoph Hellwig <hch@lst.de>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBNYXkgMTgsIDIwMTkgYXQgMDY6MDQ6NDJQTSAtMDMwMCwgRmFiaW8gRXN0ZXZhbSB3
cm90ZToKPiBIaSBSdXNzZWxsLAo+IAo+IE9uIFNhdCwgTWF5IDE4LCAyMDE5IGF0IDI6NTEgUE0g
UnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWluCj4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4g
d3JvdGU6Cj4gPgo+ID4gUGluZy4KPiAKPiBUaGlzIHBhdGNoIGlzIHByZXNlbnQgaW4gTHVjYXMn
IHB1bGwgcmVxdWVzdDoKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9l
dG5hdml2LzIwMTktTWF5LzAwMjQ5MC5odG1sCgpJJ20gd29uZGVyaW5nIHdoeSBpdCBkaWRuJ3Qg
bWFrZSA1LjEgc2luY2UgaXQncyBhIHJlZ3Jlc3Npb24uCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVt
OiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVEMgYnJv
YWRiYW5kIGZvciAwLjhtaWxlIGxpbmUgaW4gc3VidXJiaWE6IHN5bmMgYXQgMTIuMU1icHMgZG93
biA2MjJrYnBzIHVwCkFjY29yZGluZyB0byBzcGVlZHRlc3QubmV0OiAxMS45TWJwcyBkb3duIDUw
MGticHMgdXAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
