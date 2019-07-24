Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E4072CFE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 13:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835956E511;
	Wed, 24 Jul 2019 11:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F406E517
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:11:58 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d383cfe0000>; Wed, 24 Jul 2019 04:11:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 24 Jul 2019 04:11:57 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 24 Jul 2019 04:11:57 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Jul
 2019 11:11:55 +0000
Subject: Re: [PATCH v3] drm/tegra: sor: Enable HDA interrupts at plug-in
To: Dmitry Osipenko <digetx@gmail.com>, Viswanath L <viswanathl@nvidia.com>,
 <thierry.reding@gmail.com>
References: <1563885610-27198-1-git-send-email-viswanathl@nvidia.com>
 <0ba35efb-44ec-d56c-b559-59f1daa3e6e4@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <8b113ad7-07b4-7dfb-e2e5-653514686085@nvidia.com>
Date: Wed, 24 Jul 2019 12:11:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0ba35efb-44ec-d56c-b559-59f1daa3e6e4@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1563966718; bh=xQNX1HbPPM6BRzzmB6sq6kMQKmuV/BLtNOO7HydZaZM=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ol8dQr5gzAmLHIj5lTxFkUolWPXhGP2K9CnvI/dSiulgmwl0EHQgzpakvzGsYkqi7
 nXqVwSkg2bNwHOn8wHojRJa1BXx+zvU7xx9RKQeqbFNu2OxabCdJOCvlOenu7KJDAH
 mjpxOE/VhMX/gi73/lX74NFkJ8J4qUVwKNIDI+xJgO0H3kp/dybmAM7JNlD+yHCq6J
 Ejt/3mOhlyxkm5fq9S91Alse4MZFFrc9iD2XMG9fpPrgr/vI/SjvCxmPEeOxi4Zmfh
 SyF3xyg/e9cifD5QDXY4nEWqdi+DQ+LthYFCtQRPCUFmU+G76DYEELYCIOHqpNdR8C
 vbvZDnXw9h69Q==
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDI0LzA3LzIwMTkgMTA6MjcsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAyMy4wNy4yMDE5
IDE1OjQwLCBWaXN3YW5hdGggTCDQv9C40YjQtdGCOgo+PiBIRE1JIHBsdWdvdXQgY2FsbHMgcnVu
dGltZSBzdXNwZW5kLCB3aGljaCBjbGVhcnMgaW50ZXJydXB0IHJlZ2lzdGVycwo+PiBhbmQgY2F1
c2VzIGF1ZGlvIGZ1bmN0aW9uYWxpdHkgdG8gYnJlYWsgb24gc3Vic2VxdWVudCBwbHVnLWluOyBz
ZXR0aW5nCj4+IGludGVycnVwdCByZWdpc3RlcnMgaW4gc29yX2F1ZGlvX3ByZXBhcmUoKSBzb2x2
ZXMgdGhlIGlzc3VlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBWaXN3YW5hdGggTCA8dmlzd2FuYXRo
bEBudmlkaWEuY29tPgo+IAo+IFlvdXJzIHNpZ25lZC1vZmYtYnkgYWx3YXlzIHNob3VsZCBiZSB0
aGUgbGFzdCBsaW5lIG9mIHRoZSBjb21taXQncwo+IG1lc3NhZ2UgYmVjYXVzZSB0aGUgdGV4dCBi
ZWxvdyBpdCBiZWxvbmdzIHRvIGEgcGVyc29uIHdobyBhcHBsaWVzIHRoaXMKPiBwYXRjaCwgVGhp
ZXJyeSBpbiB0aGlzIGNhc2UuIFRoaXMgaXMgbm90IGEgYmlnIGRlYWwgYXQgYWxsIGFuZCBUaGll
cnJ5Cj4gY291bGQgbWFrZSBhIGZpeHVwIHdoaWxlIGFwcGx5aW5nIHRoZSBwYXRjaCBpZiB3aWxs
IGRlZW0gdGhhdCBhcyBuZWNlc3NhcnkuCj4gCj4gU2Vjb25kbHksIHRoZXJlIGlzIG5vIG5lZWQg
dG8gYWRkICJzdGFibGVAdmdlci5rZXJuZWwub3JnIiB0byB0aGUKPiBlbWFpbCdzIHJlY2lwaWVu
dHMgYmVjYXVzZSB0aGUgcGF0Y2ggd2lsbCBmbG93IGludG8gc3RhYmxlIGtlcm5lbAo+IHZlcnNp
b25zIGZyb20gdGhlIG1haW5saW5lIG9uY2UgaXQgd2lsbCBnZXQgYXBwbGllZC4gVGhhdCBoYXBw
ZW5zIGJhc2VkCj4gb24gdGhlIHN0YWJsZSB0YWcgcHJlc2VuY2UsIGhlbmNlIGl0J3MgZW5vdWdo
IHRvIGFkZCB0aGUgJ0NjJyB0YWcgdG8gdGhlCj4gY29tbWl0J3MgbWVzc2FnZSBpbiBvcmRlciB0
byBnZXQgcGF0Y2ggYmFja3BvcnRlZC4KCkkgYmVsaWV2ZSAnZ2l0IHNlbmQtZW1haWwnIGF1dG9t
YXRpY2FsbHkgZG9lcyB0aGlzLgoKSm9uCgotLSAKbnZwdWJsaWMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
