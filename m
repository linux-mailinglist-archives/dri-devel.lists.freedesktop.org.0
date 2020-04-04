Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C63619E558
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 16:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61036E21E;
	Sat,  4 Apr 2020 14:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E1A6E143
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Apr 2020 14:06:56 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1D542070E
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Apr 2020 14:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586009216;
 bh=+b0oTb1t16JA3+0YlDERGnAPMV5kIMdS/LTGfcOX41U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d19ZLvzaDmpCW357gTjPA1TjMezn/zxJIORTvB5Io2yYEqf47IY2Ttzkt/UFraWx/
 m1Nf9yUj8JbBzv871OwE2FZWGNOeLDsgfR+0VRl6IiDJx3nHlpu83X7kJN288/saoO
 um2bO/Sr5PCPtS8pflCCHBQzzEFDmp/M1y//Yv+o=
Received: by mail-ed1-f48.google.com with SMTP id bd14so12836458edb.10
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Apr 2020 07:06:55 -0700 (PDT)
X-Gm-Message-State: AGi0PuYFcyDBk7H9wNnUCMdAN+t5AqaQkgIud9ECraRtXgdMVCljyRZq
 fkweQn9guW7zrITKP1XFHwwWE3mvLEb5Yvw0zA==
X-Google-Smtp-Source: APiQypKLXINGBOt97ZZpI29BPDjcTt7cZyRUT5zbCMljkyv5Paew8tAP2fOKpbz9k7takTeCmHk4vVxNJHxo+pWOLBU=
X-Received: by 2002:a05:6402:b70:: with SMTP id
 cb16mr11854658edb.48.1586009214144; 
 Sat, 04 Apr 2020 07:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200403080350.95826-1-jitao.shi@mediatek.com>
 <20200403080350.95826-2-jitao.shi@mediatek.com>
In-Reply-To: <20200403080350.95826-2-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 4 Apr 2020 22:06:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-0xddwEvo+v8KsyfSVbtYpe_cZGLFoz-5BBnx5MEwHEQ@mail.gmail.com>
Message-ID: <CAAOTY_-0xddwEvo+v8KsyfSVbtYpe_cZGLFoz-5BBnx5MEwHEQ@mail.gmail.com>
Subject: Re: [PATCH v14 1/3] dt-bindings: display: mediatek: control dpi pins
 mode to avoid leakage
To: Jitao Shi <jitao.shi@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDTmnIgz5pelIOmAseS6lCDkuIvljYg0OjA05a+r6YGT77yaCj4KPiBBZGQgcHJvcGVydHkgInBp
bmN0cmwtbmFtZXMiIHRvIHN3YXAgcGluIG1vZGUgYmV0d2VlbiBncGlvIGFuZCBkcGkgbW9kZS4g
U2V0Cj4gdGhlIGRwaSBwaW5zIHRvIGdwaW8gbW9kZSBhbmQgb3V0cHV0LWxvdyB0byBhdm9pZCBs
ZWFrYWdlIGN1cnJlbnQgd2hlbiBkcGkKPiBkaXNhYmxlZC4KPgoKUmV2aWV3ZWQtYnk6IENodW4t
S3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPiBTaWduZWQtb2ZmLWJ5OiBKaXRh
byBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnR4dCAgIHwgNiArKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS50
eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkcGkudHh0Cj4gaW5kZXggNTg5MTRjZjY4MWI4Li43N2RlZjQ0NTY3MDYgMTAwNjQ0
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssZHBpLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS50eHQKPiBAQCAtMTcsNiArMTcsOSBA
QCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9ncmFwaC50eHQuIFRoaXMgcG9ydCBzaG91bGQgYmUgY29ubmVjdGVkCj4gICAgdG8gdGhl
IGlucHV0IHBvcnQgb2YgYW4gYXR0YWNoZWQgSERNSSBvciBMVkRTIGVuY29kZXIgY2hpcC4KPgo+
ICtPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ICstIHBpbmN0cmwtbmFtZXM6IENvbnRhaW4gImRlZmF1
bHQiIGFuZCAic2xlZXAiLgo+ICsKPiAgRXhhbXBsZToKPgo+ICBkcGkwOiBkcGlAMTQwMWQwMDAg
ewo+IEBAIC0yNyw2ICszMCw5IEBAIGRwaTA6IGRwaUAxNDAxZDAwMCB7Cj4gICAgICAgICAgICAg
ICAgICA8Jm1tc3lzIENMS19NTV9EUElfRU5HSU5FPiwKPiAgICAgICAgICAgICAgICAgIDwmYXBt
aXhlZHN5cyBDTEtfQVBNSVhFRF9UVkRQTEw+Owo+ICAgICAgICAgY2xvY2stbmFtZXMgPSAicGl4
ZWwiLCAiZW5naW5lIiwgInBsbCI7Cj4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQi
LCAic2xlZXAiOwo+ICsgICAgICAgcGluY3RybC0wID0gPCZkcGlfcGluX2Z1bmM+Owo+ICsgICAg
ICAgcGluY3RybC0xID0gPCZkcGlfcGluX2lkbGU+Owo+Cj4gICAgICAgICBwb3J0IHsKPiAgICAg
ICAgICAgICAgICAgZHBpMF9vdXQ6IGVuZHBvaW50IHsKPiAtLQo+IDIuMjEuMAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
