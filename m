Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D572D600A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 16:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38C06EA94;
	Thu, 10 Dec 2020 15:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5557A6EA94
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 15:40:57 +0000 (UTC)
X-Gm-Message-State: AOAM531B2doi4RM9WHVPPKWmKP5O1iYznByKV/gW5xMdLAm8Ab4TMQ1t
 Ey9tZjdD5/FCCl828mdDIfk7XkhCFGFliussaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607614857;
 bh=kLtdmt4oMcr69ZeEaGpqsEmfBzPYipCBB3bI8s06kKQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GVcosNOtUN4j/bxX47UVlveHVCGqW8i9QaQZ6HkPlxWC3uYI0yv+Gz8C/CmsFnuUh
 VHH6yRauv30XoxLjQP5qjpc9eNzgSOp8wiOZEFUefda4NKkf4zSwZUnhmpq04/8qxC
 32fwTWovPXPS9Zl/un6zRImWeQV8nhGgzN3F5iIYbeGf1eXyg6AGD8bzI0PSh1xxtT
 9pvdLYb2YwC3PrITFjio+/qf16+/CeVjxca6hB5cvpEs7nUm2sAyern7NBYbJbdmYr
 ITHCpGuWGMKHJQ91R/TmXQHkCPjo0M+0pbylEP5aNu4c0HmGWu90CNCtWfpWtSUrDu
 wYrkLofnlRiIg==
X-Google-Smtp-Source: ABdhPJx0j+Lqm6Jk4mCnuNpLmDuRmlHsWfRP57mzErtMeTRrN6xR9D9GsxcZ0189bugqUjaw7RdnSXryhX8yUPqWXoM=
X-Received: by 2002:a17:906:a106:: with SMTP id
 t6mr7055105ejy.63.1607614855174; 
 Thu, 10 Dec 2020 07:40:55 -0800 (PST)
MIME-Version: 1.0
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607591262-21736-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 10 Dec 2020 23:40:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-oL+NyzDKssCjyP=E8Py3oyEK6a6s=XoYvTFymZE9-zQ@mail.gmail.com>
Message-ID: <CAAOTY_-oL+NyzDKssCjyP=E8Py3oyEK6a6s=XoYvTFymZE9-zQ@mail.gmail.com>
Subject: Re: [PATCH v8, 1/6] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMTDml6Ug6YCx5ZubIOS4i+WNiDU6MjLlr6vpgZPvvJoKPgo+IHJk
bWEgZmlmbyBzaXplIG1heSBiZSBkaWZmZXJlbnQgZXZlbiBpbiBzYW1lIFNPQywgYWRkIHRoaXMK
PiBwcm9wZXJ0eSB0byB0aGUgY29ycmVzcG9uZGluZyByZG1hCj4KPiBTaWduZWQtb2ZmLWJ5OiBZ
b25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgLi4uL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgICAgICAgICAgfCAxNiAr
KysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVk
aWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+IGluZGV4IDEyMTIyMDcuLjY0
YzY0ZWUgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+IEBA
IC02Niw2ICs2NiwxMyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzIChETUEgZnVuY3Rpb24gYmxvY2tz
KToKPiAgICBhcmd1bWVudCwgc2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
b21tdS9tZWRpYXRlayxpb21tdS50eHQKPiAgICBmb3IgZGV0YWlscy4KPgo+ICtPcHRpb25hbCBw
cm9wZXJ0aWVzIChSRE1BIGZ1bmN0aW9uIGJsb2Nrcyk6Cj4gKy0gbWVkaWF0ZWsscmRtYV9maWZv
X3NpemU6IHJkbWEgZmlmbyBzaXplIG1heSBiZSBkaWZmZXJlbnQgZXZlbiBpbiBzYW1lIFNPQywg
YWRkIHRoaXMKPiArICBwcm9wZXJ0eSB0byB0aGUgY29ycmVzcG9uZGluZyByZG1hCj4gKyAgdGhl
IHZhbHVlIGlzIHRoZSBNYXggdmFsdWUgd2hpY2ggZGVmaW5lZCBpbiBoYXJkd2FyZSBkYXRhIHNo
ZWV0Lgo+ICsgIHJkbWFfZmlmb19zaXplIG9mIHJkbWEwIGluIG10ODE4MyBpcyA1MTIwCj4gKyAg
cmRtYV9maWZvX3NpemUgb2YgcmRtYTEgaW4gbXQ4MTgzIGlzIDIwNDgKPiArCj4gIEV4YW1wbGVz
Ogo+Cj4gIG1tc3lzOiBjbG9jay1jb250cm9sbGVyQDE0MDAwMDAwIHsKPiBAQCAtMjA3LDMgKzIx
NCwxMiBAQCBvZEAxNDAyMzAwMCB7Cj4gICAgICAgICBwb3dlci1kb21haW5zID0gPCZzY3BzeXMg
TVQ4MTczX1BPV0VSX0RPTUFJTl9NTT47Cj4gICAgICAgICBjbG9ja3MgPSA8Jm1tc3lzIENMS19N
TV9ESVNQX09EPjsKPiAgfTsKPiArCj4gK3JkbWExOiByZG1hQDE0MDBjMDAwIHsKPiArICAgICAg
IGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLWRpc3AtcmRtYSI7Cj4gKyAgICAgICByZWcg
PSA8MCAweDE0MDBjMDAwIDAgMHgxMDAwPjsKPiArICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQ
SSAyMjkgSVJRX1RZUEVfTEVWRUxfTE9XPjsKPiArICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNj
cHN5cyBNVDgxODNfUE9XRVJfRE9NQUlOX0RJU1A+Owo+ICsgICAgICAgY2xvY2tzID0gPCZtbXN5
cyBDTEtfTU1fRElTUF9SRE1BMT47Cj4gKyAgICAgICBtZWRpYXRlayxyZG1hX2ZpZm9fc2l6ZSA9
IDwyMDQ4PjsKPiArfTsKCkluIFsxXSwgUm9iIGhhcyBzdWdnZXN0IHRoYXQgbm90IGFkZCBleGFt
cGxlIG9mIHJkbWExLCBpdCdzIGJldHRlciB0bwphZGQgbWVkaWF0ZWsscmRtYV9maWZvX3NpemUg
aW4gcmRtYTAgZm9yIGV4YW1wbGUuCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzE1OTY4NTUyMzEtNTc4Mi0yLWdpdC1zZW5kLWVt
YWlsLXlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tLwoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4g
LS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
