Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B772DC2ED
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 16:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6E66E20C;
	Wed, 16 Dec 2020 15:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68736E20C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 15:17:30 +0000 (UTC)
X-Gm-Message-State: AOAM530NM7EWH4Lok22xE/zUj6EjkK4Gm470Unnx5nT4oSOdTd66xxyz
 MKp+OM8i/XfqH/dtvnIms5JG8W1Lqc62loZJ5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608131850;
 bh=YOC88DJH1Ldr/FjwTLsg5NLtJ+aB+EfBl/k2z67zy1U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d3zPyyMVKaYdL5mltO4VQCc6Hwjmj9nRQPDH6TpXWUQOQ8tS2RTsGSUMuyMGmxQuG
 vt1J6iptJANrfVh0GdiXg2hqdmT38JHCJdvDA5WNs6nb4RPpeBslQuiAyi5EiM0WUl
 Ry6gG/cr5UJiSxuA3OUgt/+Oo51YGH/WCvv02r468d3Wn93Sca7Mmi+OyfY0t9GK3D
 7UZukCc5eNzrKPfF3jt74uit73q6Gge2zvm58xHWt3vjz+fFi34JTndsNRFj/Rj/gn
 JbuZ+Xwo5xOYaOWE7qnWYYto/8aBCdstxFLBE72PdvH4XHQ+VXHHfp+ppkAjvtAHpc
 HT76siTDS9xwg==
X-Google-Smtp-Source: ABdhPJxAAxsNxeLlUnTnLtNubQg6skrY+y2JxetX9D6LYAb9dpqNodHx3+yLdJbf7zIjVVvZiAZDbQ98NMhP+W08ATE=
X-Received: by 2002:a05:600c:25c2:: with SMTP id
 2mr3941456wml.170.1608131848789; 
 Wed, 16 Dec 2020 07:17:28 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-3-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607746317-4696-3-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 16 Dec 2020 23:17:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-YjP50QrBKfoCqVnMWp41efbs9wdon4gts5QhUfZO8OA@mail.gmail.com>
Message-ID: <CAAOTY_-YjP50QrBKfoCqVnMWp41efbs9wdon4gts5QhUfZO8OA@mail.gmail.com>
Subject: Re: [PATCH v2, 02/17] dt-bindings: mediatek: add CLK_MM_DISP_CONFIG
 control description for mt8192 display
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
PiDmlrwgMjAyMOW5tDEy5pyIMTLml6Ug6YCx5YWtIOS4i+WNiDEyOjEy5a+r6YGT77yaCj4KPiBh
ZGQgQ0xLX01NX0RJU1BfQ09ORklHIGNvbnRyb2wgZGVzY3JpcHRpb24gZm9yIG10ODE5MiBkaXNw
bGEKCmRpc3BsYXkKCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcu
bml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgfCAzICsrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxkaXNwLnR4dAo+IGluZGV4IDE5NzJmYTcuLmRmYmVjNzYgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlz
cC50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
ZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+IEBAIC01NCw2ICs1NCw5IEBAIFJlcXVpcmVkIHBy
b3BlcnRpZXMgKGFsbCBmdW5jdGlvbiBibG9ja3MpOgo+ICAgIERQSSBjb250cm9sbGVyIG5vZGVz
IGhhdmUgbXVsdGlwbGUgY2xvY2sgaW5wdXRzLiBUaGVzZSBhcmUgZG9jdW1lbnRlZCBpbgo+ICAg
IG1lZGlhdGVrLGRzaS50eHQgYW5kIG1lZGlhdGVrLGRwaS50eHQsIHJlc3BlY3RpdmVseS4KPiAg
ICBBbiBleGNlcHRpb24gaXMgdGhhdCB0aGUgbXQ4MTgzIG11dGV4IGlzIGFsd2F5cyBmcmVlIHJ1
bm5pbmcgd2l0aCBubyBjbG9ja3MgcHJvcGVydHkuCj4gKyAgQW4gZXhjZXB0aW9uIGlzIHRoYXQg
dGhlIG10ODE5MiBkaXNwbGF5IGFkZCAyIG1vcmUgY2xvY2tzKENMS19NTV9ESVNQX0NPTkZJRywg
Q0xLX01NXzI2TUhaKSwKPiArICBhbmQgdGhlc2UgMiBjbG9ja3MgbmVlZCBlbmFibGVkIGJlZm9y
ZSBkaXNwbGF5IG1vZHVsZSB3b3JrIGxpa2UgbXV0ZXggY2xvY2ssIHNvIHdlIGFkZCB0aGVzZQo+
ICsgIDIgY2xvY2tzIGNvbnRyb2xlZCBzYW1lIHdpdGggbXV0ZXggY2xvY2suCgpJZiBldmVyeSBk
aXNwbGF5IG1vZHVsZSBuZWVkcyB0aGVzZSB0d28gY2xvY2ssIGFkZCB0aGVzZSB0d28gY2xvY2sg
dG8KYWxsIHRoZSBkaXNwbGF5IG1vZHVsZSB3aGljaCBuZWVkIHRoZW0uCgpSZWdhcmRzLApDaHVu
LUt1YW5nLgoKPgo+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzIChETUEgZnVuY3Rpb24gYmxvY2tzKToK
PiAgLSBjb21wYXRpYmxlOiBTaG91bGQgYmUgb25lIG9mCj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
