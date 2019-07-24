Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57E473D50
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 22:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871536E651;
	Wed, 24 Jul 2019 20:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F0C6E654
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 20:16:37 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id j6so17175590ioa.5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 13:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SleUqq6V31kzUwMjIX1qfrELhcVA/KVuaspMZ04YgL4=;
 b=uHZMT7hLegmcpwHFS5TZSxy6AECKgjECgkkc6CaUGA73Nk7DtXAFSdC/aTGcNhFecY
 TBj1FQ12Mm6eGt36I+6A5XNR1oBGAo6UBCAFtRmQu0VTvlTp6jATD6YLSCq1unxtInTF
 o345q8o1UUnDNfIHo2dUrnAhxiKo1xRGudvtYvyFUjzSFHDDb3k+jwLRNdY47JKZkB6L
 8pvCqyin3JFoBJgpOITFzGOqcMXlrm8HlAwYZrMeU/Hgr8j/VWSh3VyFWsuucIbabn9b
 5PdLZBKvN4kWsQ0iJiA8MQzV8rP3TWVdnxeXTBkWxIih6OccYngl0SDZ6eWH48SZxl+c
 Slow==
X-Gm-Message-State: APjAAAXhyc+kKyDkkz08AKT+K/HIhWOB2NzqBRyYaQLemRKXWBypbAo5
 OgEkAAujB93+ApspYH8H6xkvGWI=
X-Google-Smtp-Source: APXvYqwqmUodaynFku7YClU/Ql2xFlbvkHEw7X/q17Yh5pYFol9maQFHH3YaP1av1prEvMzfEF8uMA==
X-Received: by 2002:a6b:6f06:: with SMTP id k6mr2226288ioc.32.1563999397076;
 Wed, 24 Jul 2019 13:16:37 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id i23sm33894203ioj.24.2019.07.24.13.16.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 13:16:36 -0700 (PDT)
Date: Wed, 24 Jul 2019 14:16:35 -0600
From: Rob Herring <robh@kernel.org>
To: yongqiang.niu@mediatek.com
Subject: Re: [PATCH v4, 05/33] dt-bindings: mediatek: add RDMA1 description
 for mt8183 display
Message-ID: <20190724201635.GA18345@bogus>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
 <1562625253-29254-6-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1562625253-29254-6-git-send-email-yongqiang.niu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMDY6MzM6NDVBTSArMDgwMCwgeW9uZ3FpYW5nLm5pdUBt
ZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBt
ZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgUkRNQTEgZGVzY3JpcHRpb24gZm9yIG10
ODE4MyBkaXNwbGF5Cj4gCj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5n
Lm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0IHwgMSArCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LGRpc3AudHh0Cj4gaW5kZXggYWZkM2M5MC4uYmI5Mjc0YSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNw
LnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gQEAgLTMwLDYgKzMwLDcgQEAgUmVxdWlyZWQgcHJv
cGVydGllcyAoYWxsIGZ1bmN0aW9uIGJsb2Nrcyk6Cj4gIAkibWVkaWF0ZWssPGNoaXA+LWRpc3At
b3ZsIiAgIAkJLSBvdmVybGF5ICg0IGxheWVycywgYmxlbmRpbmcsIGNzYykKPiAgCSJtZWRpYXRl
ayw8Y2hpcD4tZGlzcC1vdmwtMmwiICAgICAgICAgICAtIG92ZXJsYXkgKDIgbGF5ZXJzLCBibGVu
ZGluZywgY3NjKQo+ICAJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLXJkbWEiICAJCS0gcmVhZCBETUEg
LyBsaW5lIGJ1ZmZlcgo+ICsJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLXJkbWExIiAgICAgICAgICAg
IC0gZnVuY3Rpb24gaXMgc2FtZSB3aXRoIFJETUEsIGZpZm8gc2l6ZSBpcyBkaWZmZXJlbnQKClRo
aXMgY2FuJ3QgYmUgZGV0ZXJtaW5lZCBieSB3aGljaCBjaGlwIGl0IGlzPyBJT1csIGEgY2hpcCBt
YXkgaGF2ZSBib3RoIApyZG1hIGFuZCByZG1hMT8KCj4gIAkibWVkaWF0ZWssPGNoaXA+LWRpc3At
d2RtYSIgIAkJLSB3cml0ZSBETUEKPiAgCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1jY29yciIgICAg
ICAgICAgICAtIGNvbG9yIGNvcnJlY3Rpb24KPiAgCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1jb2xv
ciIgCQktIGNvbG9yIHByb2Nlc3Nvcgo+IC0tIAo+IDEuOC4xLjEuZGlydHkKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
