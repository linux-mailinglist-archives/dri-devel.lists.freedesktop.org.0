Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B06C344893
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 16:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7285E6E4CB;
	Mon, 22 Mar 2021 15:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2866E4CB
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 15:05:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8E716192E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 15:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616425528;
 bh=c4yP7LH8IBW/QR/vQG5f43s6dXD+rwLuJrpHYufaYPg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fs29X7UnIjE+Bl8ZhIKrYh5yNaYulJZGHlE+nNA9MKMIARjndFhJZSrJOathwSV8R
 uugjpqF1mpuEJF/pZKPn/dQVsYEh1ewpWy7X3z/6fDBA6opAV4iC11ODWBZ1jQFf0r
 HAyho/s5aElYWAPrdEl6cG3qvDBIC0YvolWrvSom6nj/v+DYAyZCqkyNKcbjXYc/Q0
 nwk+k9SAPvQg1qezFKJJUXHqFVWcpyruK0W3yM+OrLYYDXbfHP9oVb2/PAskylPqbo
 vnmqZT64DQJHD40k1NfcR59h304u+irrl89Gk/ROKyANR7qmPxofwImf2iuD/96Tzo
 YRmHXbNZF4wug==
Received: by mail-ej1-f49.google.com with SMTP id l4so21809615ejc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 08:05:27 -0700 (PDT)
X-Gm-Message-State: AOAM530KLJar1LvApL4BCV7bptH/OvelmpLAlBVgliQHoG2Bdb51moDr
 LSFrxQKKbrATwStbyrOBqPSZD4TJ1U7ea+hhwQ==
X-Google-Smtp-Source: ABdhPJyZsV8x+yYZywL3lcsQsXOxgCOh3eH/w6d7o0h5Iv9aWzDffRX6YSUicNu0SInCh4YA5/zW5+whL6f4MGzx6i4=
X-Received: by 2002:a17:907:7651:: with SMTP id
 kj17mr184000ejc.127.1616425526252; 
 Mon, 22 Mar 2021 08:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609144630-14721-5-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_98vrwQrefD9KwvsM+9+tDpNcUwbLoVwu_mXRf17imuTA@mail.gmail.com>
In-Reply-To: <CAAOTY_98vrwQrefD9KwvsM+9+tDpNcUwbLoVwu_mXRf17imuTA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 22 Mar 2021 23:05:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-yegJy-z4E_A0=3uxHHgre0jH2syQOY==PLe6yvx0vYA@mail.gmail.com>
Message-ID: <CAAOTY_-yegJy-z4E_A0=3uxHHgre0jH2syQOY==PLe6yvx0vYA@mail.gmail.com>
Subject: Re: [PATCH v3, 4/8] soc: mediatek: mmsys: add component OVL_2L2
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE1hdHRoaWFzOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaW
vCAyMDIw5bm0MTLmnIgyOeaXpSDpgLHkuowg5LiL5Y2IMTE6MjPlr6vpgZPvvJoKPgo+IEhpLCBZ
b25ncWlhbmc6Cj4KPiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4g
5pa8IDIwMjDlubQxMuaciDI45pelIOmAseS4gCDkuIvljYg0OjM35a+r6YGT77yaCj4gPgo+ID4g
VGhpcyBwYXRjaCBhZGQgY29tcG9uZW50IE9WTF8yTDIKPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQg
dGhpcyBwYXRjaD8gT25lIGRybSBwYXRjaCBbMV0gZGVwZW5kcyBvbiB0aGlzIHBhdGNoLgoKWzFd
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRj
aC8yMDIxMDIwMjA4MTIzNy43NzQ0NDItMi1oc2lueWlAY2hyb21pdW0ub3JnLwoKUmVnYXJkcywK
Q2h1bi1LdWFuZy4KCgo+Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9u
Z3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2xpbnV4L3NvYy9t
ZWRpYXRlay9tdGstbW1zeXMuaCB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGst
bW1zeXMuaCBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oCj4gPiBpbmRl
eCA0YjZjNTE0Li40MjQ3NmMyIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9zb2MvbWVk
aWF0ZWsvbXRrLW1tc3lzLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210
ay1tbXN5cy5oCj4gPiBAQCAtMjksNiArMjksNyBAQCBlbnVtIG10a19kZHBfY29tcF9pZCB7Cj4g
PiAgICAgICAgIEREUF9DT01QT05FTlRfT1ZMMCwKPiA+ICAgICAgICAgRERQX0NPTVBPTkVOVF9P
VkxfMkwwLAo+ID4gICAgICAgICBERFBfQ09NUE9ORU5UX09WTF8yTDEsCj4gPiArICAgICAgIERE
UF9DT01QT05FTlRfT1ZMXzJMMiwKPiA+ICAgICAgICAgRERQX0NPTVBPTkVOVF9PVkwxLAo+ID4g
ICAgICAgICBERFBfQ09NUE9ORU5UX1BXTTAsCj4gPiAgICAgICAgIEREUF9DT01QT05FTlRfUFdN
MSwKPiA+IC0tCj4gPiAxLjguMS4xLmRpcnR5Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4g
PiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
