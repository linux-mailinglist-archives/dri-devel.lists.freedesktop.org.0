Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D6332FE3D
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 01:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7838D6E0AC;
	Sun,  7 Mar 2021 00:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC526E0AC
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 00:42:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16C2F650BB
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 00:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615077776;
 bh=KZD3vOv3vH2mC1Q0ZplTlNxWU5cUbcMTjSyFa0US+0U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MzO4xfRz/R75vm/uSgcq+ZU75rGZekKhPNHoAZ2UHiBjgiKU4O+Nn/bxwktFoLVFu
 iTN9mENxTxEN7a6blOtoqs1OdTro3umc94005wwWt4g1o89NEZBO7xc2VAhCYb/4pd
 ivy2UieMfb+QewR7D2UrUSjbHSMQXRIi0JYXpuzvzC5gTfeVbtby+k3pvu+Tj3tyit
 WmUV4GJDijKzl9/3KkI7CzfoC7xSXgCUVWEKqP4WBWve/n44tfyDMohOMQfwpza0ai
 QPubm5uVRC9tVQz6+nLXNYN8jYQVrfN+gOVZ88lT8wkAXWYjlMzb4t7zny5MvGYj+G
 0pbjIisuLwCiw==
Received: by mail-ed1-f45.google.com with SMTP id b13so9085879edx.1
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Mar 2021 16:42:56 -0800 (PST)
X-Gm-Message-State: AOAM533avfbf3awQ9ZmbRje0r6fZNtIFYLvZLBF2cMa/T6k+C/kXtTc6
 mgGUUXd0BPEvI7g3cU8zL+SG8EiGMHmtz86wOA==
X-Google-Smtp-Source: ABdhPJx7jtQ0W73hZycPPbjKIcZbMY0MyE9EPc5BZE00JeOhpRPAnSbt16/1gZRtb+fIlfnNDBOeoa0ac6GIa4Mpr3E=
X-Received: by 2002:a50:ec07:: with SMTP id g7mr15611220edr.72.1615077774729; 
 Sat, 06 Mar 2021 16:42:54 -0800 (PST)
MIME-Version: 1.0
References: <20210208014221.196584-1-jitao.shi@mediatek.com>
 <20210208014221.196584-4-jitao.shi@mediatek.com>
 <20210210201856.GA2690160@robh.at.kernel.org>
In-Reply-To: <20210210201856.GA2690160@robh.at.kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 7 Mar 2021 08:42:43 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9gQe1SvzyzeNSA+i5tQNGjuW-57vpuA=GusmtWX0+_1g@mail.gmail.com>
Message-ID: <CAAOTY_9gQe1SvzyzeNSA+i5tQNGjuW-57vpuA=GusmtWX0+_1g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mediatek, dpi: add mt8192 to mediatek,
 dpi
To: Rob Herring <robh@kernel.org>
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
Cc: DTML <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, shuijing.li@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjHlubQy5pyI
MTHml6Ug6YCx5ZubIOS4iuWNiDQ6MTnlr6vpgZPvvJoKPgo+IE9uIE1vbiwgMDggRmViIDIwMjEg
MDk6NDI6MjEgKzA4MDAsIEppdGFvIFNoaSB3cm90ZToKPiA+IEFkZCBjb21wYXRpYmxlICJtZWRp
YXRlayxtdDgxOTItZHBpIiBmb3IgdGhlIG10ODE5MiBkcGkuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbCAgICAg
ICB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPgo+IEFja2Vk
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKCkFwcGxpZWQgdG8gbWVkaWF0ZWst
ZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWst
ZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
