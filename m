Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1F52F4E87
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 16:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38346EA39;
	Wed, 13 Jan 2021 15:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B52C6EA39
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 15:28:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F00F233ED
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 15:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610551706;
 bh=Mg2ARogJlO660LgGnPMrdN+6ikF0b/JxVj+vxajyk+Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZcVw6Lmqm06Cwx5kwFDHc7g8QO7QcfdqfDCEbWK6E61+n27+/N5vRQPntpD9SbrKI
 ABSRfhvQzozbH6dX5PN7rXGr6BjLU1ByuA6n7XQrTW0zSnH9R9dP0pWXq688j/KPv0
 qU/4Mg2JnZeG3NSUd71XnRBTKbaiagC+VLGTAf7RFYkiF1P+EGBSU2YdMIU9jwngJE
 IzwvZWaNRt/nRG3tTJa7RqhR9pZ5prVYX/36ahpqhJptAqYZc2Uh7pMRLfqmUOeAg/
 vuR7hxhMS9bKcKU/UTpkpRjuD1HRWpOizh3Rp4dJaht1WqnDnDJWMevIRiAflvG7h0
 VKoiv+bGw6U4Q==
Received: by mail-ej1-f47.google.com with SMTP id d17so3614108ejy.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 07:28:25 -0800 (PST)
X-Gm-Message-State: AOAM533J3sCazaOZVWrmYQxxeUNlwOegBXVODkAoFRNtCwlX2riv1YXL
 2COuVq7twwsCjru92rePk7KO3RKAb/YibAuFEg==
X-Google-Smtp-Source: ABdhPJwSNSW5WjoC5vVbpHCVn5f5VMr7QuBDfdON7GWyYQI8ef3yATBL0johH1JdQeAE83K0V4Og53LZq9AnwQ2itKw=
X-Received: by 2002:a17:906:fb1a:: with SMTP id
 lz26mr1962502ejb.194.1610551704525; 
 Wed, 13 Jan 2021 07:28:24 -0800 (PST)
MIME-Version: 1.0
References: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609989081-29353-2-git-send-email-yongqiang.niu@mediatek.com>
 <20210112144921.GA330210@robh.at.kernel.org>
In-Reply-To: <20210112144921.GA330210@robh.at.kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 13 Jan 2021 23:28:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9=TJw6Hj5UOWSJJh_O6B0Ue43LhtCpJwtJiG-93-kgAg@mail.gmail.com>
Message-ID: <CAAOTY_9=TJw6Hj5UOWSJJh_O6B0Ue43LhtCpJwtJiG-93-kgAg@mail.gmail.com>
Subject: Re: [PATCH v9, 01/11] dt-bindings: mediatek: add rdma-fifo-size
 description for mt8183 display
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjHlubQx5pyIMTLml6Ug6YCx5LqM
IOS4i+WNiDEwOjQ55a+r6YGT77yaCj4KPiBPbiBUaHUsIDA3IEphbiAyMDIxIDExOjExOjExICsw
ODAwLCBZb25ncWlhbmcgTml1IHdyb3RlOgo+ID4gcmRtYSBmaWZvIHNpemUgbWF5IGJlIGRpZmZl
cmVudCBldmVuIGluIHNhbWUgU09DLCBhZGQgdGhpcwo+ID4gcHJvcGVydHkgdG8gdGhlIGNvcnJl
c3BvbmRpbmcgcmRtYQoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4K
ClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVu
a3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5n
Lm5pdUBtZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0ICAgICAgIHwgOSArKysrKysrKysKPiA+
ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gPgo+Cj4gUmV2aWV3ZWQtYnk6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
