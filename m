Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FCC2F2322
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 00:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064458979F;
	Mon, 11 Jan 2021 23:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A82189760
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 23:40:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E174222D2B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 23:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610408401;
 bh=SUTe1YRrwFqH+vKzLDa3Og8DsDF1ZslKpsxpjuqS79Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=C4SRUzfgdqbPO9+4zUA34idzVN/yden/m5HsHWYfd+XTYEC++Ui3SBEj9nck9hOfE
 liCL2d1S7L9webHpS/jmoyOYZmy8YXGdkpcwsluC+HdaXv1tARWHsI+obIHm43W25g
 01vJ5Ja8Utn61uvTSuBj7VYppOyrWA5/YFeuZn/LY16G1cYgXAjC5K7iIeG6QA1gI1
 sXRDVQ+Tr8x2KfPkY8zCHFu6Rq2a3Y+bhjlMM9mZN36UMh23iDBG2lqkni4bZkEzun
 fWv/hmKidkno64/wf8cgGW1mU/9gbiUw4xrRlduZO+cQSAxU+qObUIgzyezXiW3O7f
 s81LcVzYZWBNw==
Received: by mail-ej1-f41.google.com with SMTP id 6so870357ejz.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 15:40:00 -0800 (PST)
X-Gm-Message-State: AOAM532wd25fUZQFp1GnpyKoIVRS3OXe7z4FHpUvWhJuACHXtyXrMqVP
 6/ka1VFbdxy5j+Z9AfXqDZxoRhqg9pRSifen4Q==
X-Google-Smtp-Source: ABdhPJy3eFEmLOMrjiND05dS8vMTb4vPOL8mvRHpetE+fXbs9sEJc5/Jr5lXrVgBYYr+sVlxdWA4fZ74fE5DQFk/WR4=
X-Received: by 2002:a17:906:3753:: with SMTP id
 e19mr1211701ejc.267.1610408399484; 
 Mon, 11 Jan 2021 15:39:59 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-3-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-3-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 12 Jan 2021 07:39:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_91MUXgQg3zF=4Cjb4xAW+FKKXQKGSGE0YsTgO855_LiQ@mail.gmail.com>
Message-ID: <CAAOTY_91MUXgQg3zF=4Cjb4xAW+FKKXQKGSGE0YsTgO855_LiQ@mail.gmail.com>
Subject: Re: [PATCH v3, 02/15] dt-bindings: mediatek: add description for
 mt8192 display
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
PiDmlrwgMjAyMeW5tDHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2IMzo0OOWvq+mBk++8mgo+Cj4gYWRk
IGRlc2NyaXB0aW9uIGZvciBtdDgxOTIgZGlzcGxheQoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0t
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
dGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gaW5kZXggOWQ5YWI2NS4uYjQ3ZTFhMCAxMDA2NDQKPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkaXNwLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gQEAgLTQ0LDcgKzQ0LDcgQEAg
UmVxdWlyZWQgcHJvcGVydGllcyAoYWxsIGZ1bmN0aW9uIGJsb2Nrcyk6Cj4gICAgICAgICAibWVk
aWF0ZWssPGNoaXA+LWRwaSIgICAgICAgICAgICAgICAgICAgLSBEUEkgY29udHJvbGxlciwgc2Vl
IG1lZGlhdGVrLGRwaS50eHQKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1tdXRleCIg
ICAgICAgICAgICAtIGRpc3BsYXkgbXV0ZXgKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlz
cC1vZCIgICAgICAgICAgICAgICAtIG92ZXJkcml2ZQo+IC0gIHRoZSBzdXBwb3J0ZWQgY2hpcHMg
YXJlIG10MjcwMSwgbXQ3NjIzLCBtdDI3MTIsIG10ODE2NywgbXQ4MTczIGFuZCBtdDgxODMuCj4g
KyAgdGhlIHN1cHBvcnRlZCBjaGlwcyBhcmUgbXQyNzAxLCBtdDc2MjMsIG10MjcxMiwgbXQ4MTY3
LCBtdDgxNzMsIG10ODE4MyBhbmQgbXQ4MTkyLgo+ICAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRy
ZXNzIGFuZCBsZW5ndGggb2YgdGhlIGZ1bmN0aW9uIGJsb2NrIHJlZ2lzdGVyIHNwYWNlCj4gIC0g
aW50ZXJydXB0czogVGhlIGludGVycnVwdCBzaWduYWwgZnJvbSB0aGUgZnVuY3Rpb24gYmxvY2sg
KHJlcXVpcmVkLCBleGNlcHQgZm9yCj4gICAgbWVyZ2UgYW5kIHNwbGl0IGZ1bmN0aW9uIGJsb2Nr
cykuCj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
