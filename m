Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18900A2A82
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 01:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25E96E17C;
	Thu, 29 Aug 2019 23:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9936E17C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 23:06:13 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 16AB52166E;
 Thu, 29 Aug 2019 23:06:13 +0000 (UTC)
Date: Thu, 29 Aug 2019 19:06:12 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [BACKPORT 4.19.y 2/3] scsi: ufs: Fix RX_TERMINATION_FORCE_ENABLE
 define value
Message-ID: <20190829230612.GQ5281@sasha-vm>
References: <20190829200001.17092-1-mathieu.poirier@linaro.org>
 <20190829200001.17092-3-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829200001.17092-3-mathieu.poirier@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567119973;
 bh=2DIq5j2X+QpOMWqhkHBK01w0HUI6PPxaH+sxt3qGcWQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J2cuYDBDMucFe8qdtZix2rddEIdxZw7/FHFvox1hljQ0HZ3Ccu84Be+GBM/aAV7zP
 IOg0Nnxp9u5sVvu+eoLvxTXAioLQ8iwQCyBYOrhtiBPs0XSHQwlPeRWE6nYBuA5E6J
 ojLmEC2KEMGrHULrn7ic7VfHjrp+tC0vRwH1L7S0=
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
Cc: architt@codeaurora.org, jejb@linux.vnet.ibm.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jsarha@ti.com, tomi.valkeinen@ti.com,
 Laurent.pinchart@ideasonboard.com, stable@vger.kernel.org,
 vinholikatti@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDI6MDA6MDBQTSAtMDYwMCwgTWF0aGlldSBQb2lyaWVy
IHdyb3RlOgo+RnJvbTogUGVkcm8gU291c2EgPHNvdXNhQHN5bm9wc3lzLmNvbT4KPgo+Y29tbWl0
IGViY2I4Zjg1MDhjNWVkZjQyOGY1MjUyNWNlYzc0ZDI4ZWRlYTdiY2IgdXBzdHJlYW0KPgo+Rml4
IFJYX1RFUk1JTkFUSU9OX0ZPUkNFX0VOQUJMRSBkZWZpbmUgdmFsdWUgZnJvbSAweDAwODkgdG8g
MHgwMEE5Cj5hY2NvcmRpbmcgdG8gTUlQSSBBbGxpYW5jZSBNUEhZIHNwZWNpZmljYXRpb24uCj4K
PkZpeGVzOiBlNzg1MDYwZWEzYTEgKCJ1ZnM6IGRlZmluaXRpb25zIGZvciBwaHkgaW50ZXJmYWNl
IikKPlNpZ25lZC1vZmYtYnk6IFBlZHJvIFNvdXNhIDxzb3VzYUBzeW5vcHN5cy5jb20+Cj5TaWdu
ZWQtb2ZmLWJ5OiBNYXJ0aW4gSy4gUGV0ZXJzZW4gPG1hcnRpbi5wZXRlcnNlbkBvcmFjbGUuY29t
Pgo+U2lnbmVkLW9mZi1ieTogTWF0aGlldSBQb2lyaWVyIDxtYXRoaWV1LnBvaXJpZXJAbGluYXJv
Lm9yZz4KCkkndmUgcXVldWVkIHRoaXMgZm9yIDQuMTQtNC4xOSwgdGhhbmtzIQoKLS0KVGhhbmtz
LApTYXNoYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
