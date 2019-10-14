Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DDFD5D81
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 10:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FCB89DAB;
	Mon, 14 Oct 2019 08:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EA089DAB;
 Mon, 14 Oct 2019 08:30:50 +0000 (UTC)
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5443B207FF;
 Mon, 14 Oct 2019 08:29:41 +0000 (UTC)
Date: Mon, 14 Oct 2019 16:29:28 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH 08/11] dts: arm64: layerscape: add dma-ranges property to
 pcie nodes
Message-ID: <20191014082924.GI12262@dragon>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <20190924181244.7159-9-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190924181244.7159-9-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571041850;
 bh=p7mjM/EcKkarwYBL8yjO5OkJb2HPOW4/n1CL+uOOlMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RTnfmVLrzT1mElpLV1XpxtXmAYaHC4vXjDk1D8B2kTsZLHBXEuOXdUn57LgcXb0Ej
 h3mpF2mTZzuwOHBrv9gd3TZkQ4d/61IzyEHJNqi+GNSCzH6D3Q9rxbNjPNVhwsqsHm
 enxUHSuGte972ZNKUuW2YUasfYnn5BuldVKKqFww=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 mbrugger@suse.com, robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
 f.fainelli@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-tegra@vger.kernel.org, robh+dt@kernel.org,
 wahrenst@gmx.net, james.quinlan@broadcom.com, linux-pci@vger.kernel.org,
 dmaengine@vger.kernel.org, xen-devel@lists.xenproject.org,
 Li Yang <leoyang.li@nxp.com>, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMDg6MTI6MzlQTSArMDIwMCwgTmljb2xhcyBTYWVueiBK
dWxpZW5uZSB3cm90ZToKPiBUaGUgYnVzIGJlaGluZCB0aGUgYm9hcmQncyBQQ0llIGNvcmUgaGFz
IERNQSBhZGRyZXNzaW5nIGxpbWl0YXRpb25zLiBBZGQKPiBhbiBlbXB0eSAnZG1hLXJhbmdlcycg
cHJvcGVydHkgb24gYWxsIFBDSWUgYnVzIGRlc2NyaXB0aW9ucyB0byBpbmZvcm0KPiB0aGUgT0Yg
Y29yZSB0aGF0IGEgdHJhbnNsYXRpb24gaXMgZHVlIGZ1cnRoZXIgZG93biB0aGUgbGluZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBOaWNvbGFzIFNhZW56IEp1bGllbm5lIDxuc2FlbnpqdWxpZW5uZUBz
dXNlLmRlPgoKQXBwbGllZCwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
