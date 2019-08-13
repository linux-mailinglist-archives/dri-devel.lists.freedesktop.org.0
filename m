Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B048AECB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 07:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5B26E03C;
	Tue, 13 Aug 2019 05:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D906E03C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 05:28:49 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C554C80330;
 Tue, 13 Aug 2019 07:28:46 +0200 (CEST)
Date: Tue, 13 Aug 2019 07:28:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v1 1/1] drm/exynos: drop use of drmP.h (2nd round)
Message-ID: <20190813052845.GA21448@ravnborg.org>
References: <20190803145735.GA28393@ravnborg.org>
 <CGME20190812185129epcas4p3284224dcf88127c4e97d36be6f5e5aa7@epcas4p3.samsung.com>
 <20190812185122.GA7087@ravnborg.org>
 <92eba3eb-a57b-7cb3-c447-e6ce8a564a60@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92eba3eb-a57b-7cb3-c447-e6ce8a564a60@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10
 a=PaGloZ4-fHqVkK3eTaMA:9 a=QEXdDO2ut3YA:10
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
Cc: David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSW5raS4KCk9uIFR1ZSwgQXVnIDEzLCAyMDE5IGF0IDEwOjAzOjUxUE0gKzA5MDAsIElua2kg
RGFlIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDE5LiA4LiAxMy4g7Jik7KCEIDM6NTEsIFNhbSBSYXZu
Ym9yZyB3cm90ZToKPiA+IEhpIElua2kuCj4gPiAKPiA+IEFueSBwbGFucyB0byB0YWtlIHRoaXMg
dG8gdGhlIGV4eW5vcyB0cmVlPwo+ID4gCj4gCj4gSXQgd2lsbCBiZSBtZXJnZWQgdG8gbmV4dC4K
VGhhbmtzLCBvbmUgbW9yZSBvZmYgdGhlIGxpc3QuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
