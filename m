Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B552C3448D1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 16:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD98A6E112;
	Mon, 22 Mar 2021 15:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F10E6E112
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 15:08:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C425B6199F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616425739;
 bh=3PQXyCv/6RPiauJW0RbXVxOk51+3YNHHQ4q0ubjIYI0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kUnTB41nwt/2gBmhP5ra1WG35j5VTc2LbveK7j4gYYhiDA0OqxLIqzjvVOabd+9hc
 8c5/bpXntK3H7xflMSt0Th2yx9BsVEqcuI9NF4Wn6e2wP5JfgMsrPZwU+jheE+oB+K
 j/tjJr0G/YIBU/+PDC1QZVKxhpIwvNjiOY8bK+KxxcWMUKlT+SdzDnUQ8hd3QqNqt9
 z+A5Ua1kThRlsTSklCyjRjlnm4zUcqkOyECsZ0CH03GglurtOgWsP56zLSaDtfWusJ
 DoQJodK5+AjShphBYD2Pui6068ctfFfdvKYk8QbT0YAEO3PS7bcOODP+Cr1Y2UQWv4
 A2QW0y6P5PFWg==
Received: by mail-ej1-f47.google.com with SMTP id kt15so12368541ejb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 08:08:58 -0700 (PDT)
X-Gm-Message-State: AOAM532Ps9GyUvwlB0AqvAfl2i7QRWloA5eljVQHwcaWxgwKB56lpodV
 1k81F/6MmulqYEK0UVoiKXuEUj+DsQ2AySeJ1A==
X-Google-Smtp-Source: ABdhPJy9CuEFTxVWjGKeDPfSnb0lRo8CbqOcKlR4LhHv/z1CX1/0nQw1fX42KGso9lasF9MhwTQPQqeELQ+Ao8npxVA=
X-Received: by 2002:a17:906:9888:: with SMTP id
 zc8mr242694ejb.310.1616425737261; 
 Mon, 22 Mar 2021 08:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <1609815993-22744-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609815993-22744-9-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609815993-22744-9-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 22 Mar 2021 23:08:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY__HO1AJ2xjRu7B+0Xs9MRHiifQYGNz5vr-EsVkQ7NeZBA@mail.gmail.com>
Message-ID: <CAAOTY__HO1AJ2xjRu7B+0Xs9MRHiifQYGNz5vr-EsVkQ7NeZBA@mail.gmail.com>
Subject: Re: [PATCH v4, 08/10] soc: mediatek: mmsys: add component RDMA4
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE1hdHRoaWFzOgoKWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+
IOaWvCAyMDIx5bm0MeaciDXml6Ug6YCx5LqMIOS4iuWNiDExOjA35a+r6YGT77yaCj4KPiBUaGlz
IHBhdGNoIGFkZCBjb21wb25lbnQgUkRNQTQKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBO
aXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1YW5n
IEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdGhp
cyBwYXRjaD8gT25lIGRybSBwYXRjaCBbMV0gZGVwZW5kcyBvbiB0aGlzIHBhdGNoLgoKWzFdIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8y
MDIxMDIwMjA4MTIzNy43NzQ0NDItNC1oc2lueWlAY2hyb21pdW0ub3JnLwoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4gLS0tCj4gIGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5o
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oIGIvaW5jbHVkZS9saW51eC9z
b2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgKPiBpbmRleCAxMzU0NmU5Li4yYzExNjE3IDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oCj4gKysrIGIvaW5j
bHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgKPiBAQCAtMzgsNiArMzgsNyBAQCBl
bnVtIG10a19kZHBfY29tcF9pZCB7Cj4gICAgICAgICBERFBfQ09NUE9ORU5UX1JETUEwLAo+ICAg
ICAgICAgRERQX0NPTVBPTkVOVF9SRE1BMSwKPiAgICAgICAgIEREUF9DT01QT05FTlRfUkRNQTIs
Cj4gKyAgICAgICBERFBfQ09NUE9ORU5UX1JETUE0LAo+ICAgICAgICAgRERQX0NPTVBPTkVOVF9V
Rk9FLAo+ICAgICAgICAgRERQX0NPTVBPTkVOVF9XRE1BMCwKPiAgICAgICAgIEREUF9DT01QT05F
TlRfV0RNQTEsCj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
