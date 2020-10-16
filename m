Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E52C290CF7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 22:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739036EE93;
	Fri, 16 Oct 2020 20:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7236EE93
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 20:58:40 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3528520030;
 Fri, 16 Oct 2020 22:58:37 +0200 (CEST)
Date: Fri, 16 Oct 2020 22:58:36 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Li Heng <liheng40@huawei.com>
Subject: Re: [PATCH -next] video: Remove set but not used variable
Message-ID: <20201016205836.GB1496366@ravnborg.org>
References: <1600957106-13741-1-git-send-email-liheng40@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600957106-13741-1-git-send-email-liheng40@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=S433PrkP c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=i0EeH86SAAAA:8 a=e5mUnYsNAAAA:8
 a=ta2fmmrRsy9J0w49oKkA:9 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, tomi.valkeinen@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 b.zolnierkie@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGkgSGVuZwoKT24gVGh1LCBTZXAgMjQsIDIwMjAgYXQgMTA6MTg6MjZQTSArMDgwMCwgTGkg
SGVuZyB3cm90ZToKPiBGaXhlcyBnY2MgJy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5p
bmc6Cj4gCj4gZHJpdmVycy92aWRlby9mYmRldi9zaXMvMzAwdnRibC5oOjEwNjQ6Mjg6IHdhcm5p
bmc6Cj4g4oCYU2lTMzAwX0NIVFZWQ0xLU09OVFND4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFst
V3VudXNlZC1jb25zdC12YXJpYWJsZT1dCj4gCj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1
bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExpIEhlbmcgPGxpaGVuZzQwQGh1YXdl
aS5jb20+CgpUaGFua3MsIG5vdyBhcHBsaWVkIHRvIGRybS1taXNjLW5leHQuCgoJU2FtCgo+IC0t
LQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3Npcy8zMDB2dGJsLmggfCAyIC0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L3Npcy8zMDB2dGJsLmggYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Npcy8zMDB2dGJsLmgKPiBp
bmRleCBlNGI0YTI2Li4yNmIxOWY3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYv
c2lzLzMwMHZ0YmwuaAo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2lzLzMwMHZ0YmwuaAo+
IEBAIC0xMDYxLDggKzEwNjEsNiBAQCBzdGF0aWMgY29uc3QgdW5zaWduZWQgY2hhciBTaVMzMDBf
Q0hUVlZDTEtVTlRTQ1tdICA9IHsgMHgyOSwweDI5LDB4MjksMHgyOSwweDJhLAo+IAo+ICBzdGF0
aWMgY29uc3QgdW5zaWduZWQgY2hhciBTaVMzMDBfQ0hUVlZDTEtPTlRTQ1tdICA9IHsgMHgyYyww
eDJjLDB4MmMsMHgyYywweDJkLDB4MmIgfTsKPiAKPiAtc3RhdGljIGNvbnN0IHVuc2lnbmVkIGNo
YXIgU2lTMzAwX0NIVFZWQ0xLU09OVFNDW10gPSB7IDB4MmMsMHgyYywweDJjLDB4MmMsMHgyZCww
eDJiIH07Cj4gLQo+ICBzdGF0aWMgY29uc3QgdW5zaWduZWQgY2hhciBTaVMzMDBfQ0hUVlZDTEtV
UEFMW10gICA9IHsgMHgyZiwweDJmLDB4MmYsMHgyZiwweDJmLDB4MzEgfTsKPiAKPiAgc3RhdGlj
IGNvbnN0IHVuc2lnbmVkIGNoYXIgU2lTMzAwX0NIVFZWQ0xLT1BBTFtdICAgPSB7IDB4MmYsMHgy
ZiwweDJmLDB4MmYsMHgzMCwweDMyIH07Cj4gLS0KPiAyLjcuNAo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
