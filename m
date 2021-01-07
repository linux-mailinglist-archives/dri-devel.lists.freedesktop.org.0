Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FE12ECDA3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 11:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FD06E423;
	Thu,  7 Jan 2021 10:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4098A6E423
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 10:17:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF0EB23358
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610014668;
 bh=6sb108ac5UVxYYGp+wjKpmn1DM3i6z83ytBYRl9cEg0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hH6B8lh70ZD1mRAhDD95qQrPQi2eJCkyxPUKdRaHXGFWvk5kWwkOpr8JGcMmr4J9g
 tu2A3ECZvMyoWTbpWGwp5BHqUdchbi6Q8GBZRvQ+0trW3ZhHIs1eYG4zlYmkXC5KeE
 I344mDb8l3ZW5ICrBovpiJY73YrVHCsP9U4pmfCyvSS6uI3S3mgYxOphgWLsTeu4+d
 CM42hJyJ7xFqID70fcHXWW4UYMb3L5Xqwq2aiQgj91ICb0b+4oYHRXa178czbrZy99
 RIXe8jg0ozfDjyn/YJtnFll+VCC8dHpma9ZlgM0xLu4JMBp+meDvvoawSCOZQb4Ypa
 1/yiKd1F/Q0ag==
Received: by mail-ed1-f43.google.com with SMTP id y24so7195504edt.10
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 02:17:47 -0800 (PST)
X-Gm-Message-State: AOAM532G4PbBfg/rvkQ4CoRRNCLGL2PG17qnLQZJ/tmckpp406UvC6jv
 cqCZsc1AlQ8uHlz8CR7eSqnswr8vZlXagAn/Ag==
X-Google-Smtp-Source: ABdhPJwFY76DPb4xZJOUEweB/1qZGG9xebnYuDZQduz4K7shnS7SUrqlKleXXx7W6MP7D9rlLuURfDRF0VERLMbkyZY=
X-Received: by 2002:a50:c3c5:: with SMTP id i5mr1159187edf.166.1610014666156; 
 Thu, 07 Jan 2021 02:17:46 -0800 (PST)
MIME-Version: 1.0
References: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609989081-29353-3-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609989081-29353-3-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 7 Jan 2021 18:17:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY_85Ks5pa244K_G2Lp-XwmMFvK74X6M4vdM-M5Et_9Y9sQ@mail.gmail.com>
Message-ID: <CAAOTY_85Ks5pa244K_G2Lp-XwmMFvK74X6M4vdM-M5Et_9Y9sQ@mail.gmail.com>
Subject: Re: [PATCH v9, 02/11] dt-bindings: mediatek: add description for
 mt8183 display
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
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIg35pelIOmAseWbmyDkuIrljYgxMToxMeWvq+mBk++8mgo+Cj4gYWRk
IGRlc2NyaXB0aW9uIGZvciBtdDgxODMgZGlzcGxheQoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0t
bmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0t
bmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcg
Tml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0IHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxk
aXNwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gaW5kZXggYjA3ODgxZS4uYzU2MmNkYSAxMDA2NDQKPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkaXNwLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gQEAgLTQzLDcgKzQzLDcgQEAg
UmVxdWlyZWQgcHJvcGVydGllcyAoYWxsIGZ1bmN0aW9uIGJsb2Nrcyk6Cj4gICAgICAgICAibWVk
aWF0ZWssPGNoaXA+LWRwaSIgICAgICAgICAgICAgICAgICAgLSBEUEkgY29udHJvbGxlciwgc2Vl
IG1lZGlhdGVrLGRwaS50eHQKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1tdXRleCIg
ICAgICAgICAgICAtIGRpc3BsYXkgbXV0ZXgKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlz
cC1vZCIgICAgICAgICAgICAgICAtIG92ZXJkcml2ZQo+IC0gIHRoZSBzdXBwb3J0ZWQgY2hpcHMg
YXJlIG10MjcwMSwgbXQ3NjIzLCBtdDI3MTIsIG10ODE2NyBhbmQgbXQ4MTczLgo+ICsgIHRoZSBz
dXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQ3NjIzLCBtdDI3MTIsIG10ODE2NywgbXQ4MTcz
IGFuZCBtdDgxODMuCj4gIC0gcmVnOiBQaHlzaWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBv
ZiB0aGUgZnVuY3Rpb24gYmxvY2sgcmVnaXN0ZXIgc3BhY2UKPiAgLSBpbnRlcnJ1cHRzOiBUaGUg
aW50ZXJydXB0IHNpZ25hbCBmcm9tIHRoZSBmdW5jdGlvbiBibG9jayAocmVxdWlyZWQsIGV4Y2Vw
dCBmb3IKPiAgICBtZXJnZSBhbmQgc3BsaXQgZnVuY3Rpb24gYmxvY2tzKS4KPiAtLQo+IDEuOC4x
LjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
