Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EA3462C4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 17:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7CF896FA;
	Fri, 14 Jun 2019 15:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72267892EF;
 Fri, 14 Jun 2019 15:30:34 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD9E42175B;
 Fri, 14 Jun 2019 15:30:33 +0000 (UTC)
Date: Fri, 14 Jun 2019 17:30:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 12/16] staging/comedi: mark as broken
Message-ID: <20190614153032.GD18049@kroah.com>
References: <20190614134726.3827-1-hch@lst.de>
 <20190614134726.3827-13-hch@lst.de>
 <20190614140239.GA7234@kroah.com> <20190614144857.GA9088@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614144857.GA9088@lst.de>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560526234;
 bh=yHr9pq/10KysBErHEUNYe66X5QjENZmZbRJgZ95Q5/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YQSkaSpALbREELFlyjYwtyXX2zZ40opkg5+4KefS4XBIuG2ytKNe/HlyefrPeKCy0
 E/FugLo4jefFccnnPx66ACowyYQe8Bea79xHMfRvngOsTctElVKuYIxt72NvyX9Rye
 Xmh7GqKPGUeRorB/KJsSF7isbiZer4sAIhDPDf20=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 linux-rdma@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-media@vger.kernel.org, Intel Linux Wireless <linuxwifi@intel.com>,
 intel-gfx@lists.freedesktop.org, Ian Abbott <abbotti@mev.co.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, H Hartley Sweeten <hsweeten@visionengravers.com>,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDQ6NDg6NTdQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDQ6MDI6MzlQTSArMDIwMCwgR3Jl
ZyBLSCB3cm90ZToKPiA+IFBlcmhhcHMgYSBoaW50IGFzIHRvIGhvdyB3ZSBjYW4gZml4IHRoaXMg
dXA/ICBUaGlzIGlzIHRoZSBmaXJzdCB0aW1lCj4gPiBJJ3ZlIGhlYXJkIG9mIHRoZSBjb21lZGkg
Y29kZSBub3QgaGFuZGxpbmcgZG1hIHByb3Blcmx5Lgo+IAo+IEl0IGNhbiBiZSBmaXhlZCBieToK
PiAKPiAgYSkgbmV2ZXIgY2FsbGluZyB2aXJ0X3RvX3BhZ2UgKG9yIHZtYWxsb2NfdG9fcGFnZSBm
b3IgdGhhdCBtYXR0ZXIpCj4gICAgIG9uIGRtYSBhbGxvY2F0aW9uCj4gIGIpIG5ldmVyIHJlbWFw
cGluZyBkbWEgYWxsb2NhdGlvbiB3aXRoIGNvbmZsaWN0aW5nIGNhY2hlIG1vZGVzCj4gICAgIChu
byByZW1hcHBpbmcgc2hvdWxkIGJlIGRvYWJsZSBhZnRlciBhKSBhbnl3YXkpLgoKT2ssIGZhaXIg
ZW5vdWdoLCBoYXZlIGFueSBwb2ludGVycyBvZiBkcml2ZXJzL2NvcmUgY29kZSB0aGF0IGRvZXMg
dGhpcwpjb3JyZWN0bHk/ICBJIGNhbiBwdXQgaXQgb24gbXkgdG9kbyBsaXN0LCBidXQgbWlnaHQg
dGFrZSBhIHdlZWsgb3Igc28uLi4KCklhbiwgd2FudCB0byBsb29rIGludG8gZG9pbmcgdGhpcyBz
b29uZXI/Cgp0aGFua3MsCgpncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
