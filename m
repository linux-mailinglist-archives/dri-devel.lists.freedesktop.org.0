Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DCB2F2318
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 00:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0235C892AE;
	Mon, 11 Jan 2021 23:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9759489364
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 23:30:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 090DE22D58
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 23:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610407829;
 bh=wY6WyJnyn9l1uwrWbWHDhefPmOISumjIE80nS7nbeWw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y8T4muPUcBgbTVPe7FTnsA5LKfJuPHHRfgndFWSilgpS0ZTgL/ptC/wZULassWj6C
 4j8UKWV2fGSGgERGw9SoY1PeqwbalopJtlD9dPVfdiASi0c20eHH0o/GEc4oPKIBSP
 JDjPEN6T3MhIMKlxeJiaa+1QuaE09Vs/01xG4u7gz+PWESD9aclM+MqTuLGm22tbkO
 AesCFZj8KgUyL040eHfiXr2KHrhFYXTUAVv69fe9uQtS8pgwl03f3Tl71em2RdpFqf
 TwGMv2zOFfqpAyyu1tGdiWoxYpJ/b949IU6vwY7SPoEKYBVMHDNCkE0hJ4KqskE8WD
 mBArExwmnNqcw==
Received: by mail-ed1-f46.google.com with SMTP id cw27so290260edb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 15:30:28 -0800 (PST)
X-Gm-Message-State: AOAM531BjiUqKjuCdZtz77mkassSzZfiHyfeJAI37HfuhPlfPpSCy4oK
 euBEdeE79bJTQkcr6XYmk6/7JoWP8ljKFSQU8A==
X-Google-Smtp-Source: ABdhPJw/nqrPwedUsYYELvqmQQV2DVc/qTFoJ6TexxxOKDBI8IG/Cky1sIApLzU+/jMMXRGHkDWXdP+ADAPgZ8NARYQ=
X-Received: by 2002:a50:fc96:: with SMTP id f22mr1283182edq.162.1610407827487; 
 Mon, 11 Jan 2021 15:30:27 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 12 Jan 2021 07:30:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8aUJQJimDk8gy-Jc8JXtdOmvm_+2eKnYp1p_CDbF_=dQ@mail.gmail.com>
Message-ID: <CAAOTY_8aUJQJimDk8gy-Jc8JXtdOmvm_+2eKnYp1p_CDbF_=dQ@mail.gmail.com>
Subject: Re: [PATCH v3,
 01/15] dt-bindings: mediatek: add description for postmask
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

WW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+IOaWvCAyMDIx5bm0Meac
iDEx5pelIOmAseS4gCDkuIvljYgzOjQ05a+r6YGT77yaCj4KPiBhZGQgZGVzY3JpcHRpb24gZm9y
IHBvc3RtYXNrCj4gcG9zdG1hc2sgaXMgdXNlZCBjb250cm9sIHJvdW5kIGNvcm5lciBmb3IgZGlz
cGxheSBmcmFtZQoKQWZ0ZXIgY2hhbmdpbmcgdG8gJ3VzZWQgdG8gY29udHJvbCcsCgpSZXZpZXdl
ZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVk
LW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0t
Cj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21l
ZGlhdGVrLGRpc3AudHh0IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKPiBpbmRleCBjNTYyY2Rh
Li45ZDlhYjY1IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQK
PiBAQCAtMzcsNiArMzcsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzIChhbGwgZnVuY3Rpb24gYmxv
Y2tzKToKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1hYWwiICAgICAgICAgICAgICAt
IGFkYXB0aXZlIGFtYmllbnQgbGlnaHQgY29udHJvbGxlcgo+ICAgICAgICAgIm1lZGlhdGVrLDxj
aGlwPi1kaXNwLWdhbW1hIiAgICAgICAgICAgIC0gZ2FtbWEgY29ycmVjdGlvbgo+ICAgICAgICAg
Im1lZGlhdGVrLDxjaGlwPi1kaXNwLW1lcmdlIiAgICAgICAgICAgIC0gbWVyZ2Ugc3RyZWFtcyBm
cm9tIHR3byBSRE1BIHNvdXJjZXMKPiArICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1wb3N0
bWFzayIgICAgICAgICAtIGNvbnRyb2wgcm91bmQgY29ybmVyIGZvciBkaXNwbGF5IGZyYW1lCj4g
ICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3Atc3BsaXQiICAgICAgICAgICAgLSBzcGxpdCBz
dHJlYW0gdG8gdHdvIGVuY29kZXJzCj4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3AtdWZv
ZSIgICAgICAgICAgICAgLSBkYXRhIGNvbXByZXNzaW9uIGVuZ2luZQo+ICAgICAgICAgIm1lZGlh
dGVrLDxjaGlwPi1kc2kiICAgICAgICAgICAgICAgICAgIC0gRFNJIGNvbnRyb2xsZXIsIHNlZSBt
ZWRpYXRlayxkc2kudHh0Cj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
