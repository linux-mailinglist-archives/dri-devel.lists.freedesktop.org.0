Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B8D2EE9B9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 00:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496B06E5A0;
	Thu,  7 Jan 2021 23:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942F26E5A0
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 23:27:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A20123603
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 23:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610062024;
 bh=m7RW9HBtqQnfdINbdCHqEB+pyy8sssGGLdn1klRTWl4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gT80uxAxXHcdu8ANm4X/DEVzQeUX4d9Xzi4EyFcd2Ykoyn1JnHjE6IUi73B7hwBng
 TniP8Jqu0BEvWq+jm3pKWDRd6eBQmKFdPSEmOHGAGo2ugRzzb+p2Hb8CjG1b3AE7ZF
 6p9ClqBeZO/di4+CpDsIeM4MtyiX1e99RbIuKAHypqNG0rmplxPbOWGg9/bcOVr0Sj
 yNOuBTaAQJcrCcPmKCdXKmuh3+7tVEmMPGwACG7S4zhdeNtZb+QnVlXhU+tQ5a5XDm
 +KPOF84EebCj/bdCaRm0oIinNJd8WO8rIszZ0UDn/GQlU+mefjg2g7g6N/VOLwAGhG
 8Wr8IeoPANQKg==
Received: by mail-wm1-f50.google.com with SMTP id g25so5749995wmh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 15:27:04 -0800 (PST)
X-Gm-Message-State: AOAM531JSWUQ5YT22RqaOBPVXTYDY+UNWvNcp9uRXhc2n+BO/6I1WdSE
 pvLfUsb2IflJN7AgDtReUw/stVL41L1YFuyo4g==
X-Google-Smtp-Source: ABdhPJzS3UQ0x/poF8FnNPQV3fPhB+gtHlyJACLspO4RjxuVplYpY3mxzHHqv7Jv/wY6lB6d7fYsmOrLxCypguDO4Us=
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr663344wmi.45.1610062022818;
 Thu, 07 Jan 2021 15:27:02 -0800 (PST)
MIME-Version: 1.0
References: <20210107143352.50090-1-jitao.shi@mediatek.com>
In-Reply-To: <20210107143352.50090-1-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 8 Jan 2021 07:26:50 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-7PiBGPE57OiAVDbq5hRLFunKX-v-h5UUS4v9Q7SuH=g@mail.gmail.com>
Message-ID: <CAAOTY_-7PiBGPE57OiAVDbq5hRLFunKX-v-h5UUS4v9Q7SuH=g@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Fix EoTp flag
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDHmnIg35pelIOmAseWbmyDkuIvljYgxMDozNOWvq+mBk++8mgo+Cj4gU29DIHdpbGwgdHJhbnNt
aXQgdGhlIEVvVHAgKEVuZCBvZiBUcmFuc21pc3Npb24gcGFja2V0KSB3aGVuCj4gTUlQSV9EU0lf
TU9ERV9FT1RfUEFDS0VUIGZsYWcgaXMgc2V0Lgo+Cj4gRW5hYmxpbmcgRW9UcCB3aWxsIG1ha2Ug
dGhlIGxpbmUgdGltZSBsYXJnZXIsIHNvIHRoZSBoZnAgYW5kCj4gaGJwIHNob3VsZCBiZSByZWR1
Y2VkIHRvIGtlZXAgbGluZSB0aW1lLgo+Cj4gU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRh
by5zaGlAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jIHwgOCArKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gaW5kZXggNjVm
ZDk5YzUyOGFmLi44YzcwZWMzOWJmZTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMKPiBAQCAtNDAxLDggKzQwMSwxMSBAQCBzdGF0aWMgdm9pZCBtdGtfZHNpX3J4dHhfY29udHJv
bChzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAg
IH0KPgo+IC0gICAgICAgdG1wX3JlZyB8PSAoZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9EU0lfQ0xP
Q0tfTk9OX0NPTlRJTlVPVVMpIDw8IDY7Cj4gLSAgICAgICB0bXBfcmVnIHw9IChkc2ktPm1vZGVf
ZmxhZ3MgJiBNSVBJX0RTSV9NT0RFX0VPVF9QQUNLRVQpID4+IDM7Cj4gKyAgICAgICBpZiAoZHNp
LT5tb2RlX2ZsYWdzICYgTUlQSV9EU0lfQ0xPQ0tfTk9OX0NPTlRJTlVPVVMpCj4gKyAgICAgICAg
ICAgICAgIHRtcF9yZWcgfD0gSFNUWF9DS0xQX0VOOwo+ICsKPiArICAgICAgIGlmICghKGRzaS0+
bW9kZV9mbGFncyAmIE1JUElfRFNJX01PREVfRU9UX1BBQ0tFVCkpCj4gKyAgICAgICAgICAgICAg
IHRtcF9yZWcgfD0gRElTX0VPVDsKClRoaXMgcGFydCBpcyBub3QgcmVsYXRlZCB0byBsaW5lIHRp
bWUsIHNvIHNlcGFyYXRlIHRoaXMgcGFydCB0byBhbm90aGVyIHBhdGNoLgoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4KPiAgICAgICAgIHdyaXRlbCh0bXBfcmVnLCBkc2ktPnJlZ3MgKyBEU0lfVFhS
WF9DVFJMKTsKPiAgfQo+IEBAIC00NzgsNiArNDgxLDcgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9j
b25maWdfdmRvX3RpbWluZyhzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdGltaW5nLT5kYV9oc196ZXJvICsgdGltaW5nLT5kYV9oc19leGl0ICsgMzsKPgo+
ICAgICAgICAgZGVsdGEgPSBkc2ktPm1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9NT0RFX1ZJREVPX0JV
UlNUID8gMTggOiAxMjsKPiArICAgICAgIGRlbHRhICs9IGRzaS0+bW9kZV9mbGFncyAmIE1JUElf
RFNJX01PREVfRU9UX1BBQ0tFVCA/IDIgOiAwOwo+Cj4gICAgICAgICBob3Jpem9udGFsX2Zyb250
cG9yY2hfYnl0ZSA9IHZtLT5oZnJvbnRfcG9yY2ggKiBkc2lfdG1wX2J1Zl9icHA7Cj4gICAgICAg
ICBob3Jpem9udGFsX2Zyb250X2JhY2tfYnl0ZSA9IGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRl
ICsgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZTsKPiAtLQo+IDIuMjUuMQo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
