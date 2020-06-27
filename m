Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27E720CA66
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 22:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54C66E3BC;
	Sun, 28 Jun 2020 20:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B136E19A
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 23:44:18 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q7so815528ljm.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 16:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DsD7awmAZIv1K0t/HRUOLxMTKUOvG6ubHXppAfzr2+A=;
 b=ockKC02y8P4bF4ese89yysHA7TROKDspX0VPiNSFOxcxPv1bs5o4Ipzt77U6F/bToM
 Hi5GccIUp1bZi9B8t5Bea8vkAuA0LNa5bZQlODZAVq8wOSDdwwK079pGT1jls92QbPJ0
 mJZcs6Si2zDMdlaKOgvh+jIstcSQBf3Qq7BMbljOEFNq2QrusldNPkAyay8JdIeW1yhl
 O5cdFlSsmQuSltOEMqr1kARitCHny0HzAZHwudX3LNX/nWaOUxxY2GRIVwNJ9IX2B9/l
 KXOHIMcXqRussDfLMZKqMbCM8gKdIBr/1Pa0A8ZubuZ1cBPDwRg5khPkSBSi5FzxpBwG
 HcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DsD7awmAZIv1K0t/HRUOLxMTKUOvG6ubHXppAfzr2+A=;
 b=uE/z9I2jHPDaAM2zIfZVsFF3P8LgYaaxSUgFMWxMXir++/K3Z6P5H/f7EPpBEXNep4
 wz8j6ECai8vajne0W5VDUqdsVJWshio9rSFG8WB3G9IUE+EVSQYmk4bu3X7oBHrOssyD
 z2K/o5b+d/SuEOew4ImvHxa/pROwGCc7BTqooGUgclv7gX0ut9Sy0G/UWReSQCklI8e1
 wcCI7zlus8STYQwZ/XzQNIowFN8l3lky1P3DtauWVr10D5Y90xasDF9H/tzFtacxhOYC
 jX+acWOQjCJy3hEYWXn/wXN/g6pmCVWkdGnpBrOzG7DhcLdL5EHP5FG0SltE3luqnv9w
 I56w==
X-Gm-Message-State: AOAM532T2+nH69aZuS26F/zkJz1gFVuACZbWpqd6r5srwdIu+12iYTz9
 1+lgO/SAg5Y313cPBefsVIg=
X-Google-Smtp-Source: ABdhPJydon2sdcY17f+37qAc3+Bk9DQ7NUVVnunr1D2iOWg1bSdqs9Wqpr8bbJ6Ewek0R4fAVsDI4Q==
X-Received: by 2002:a2e:7601:: with SMTP id r1mr5117761ljc.111.1593301456651; 
 Sat, 27 Jun 2020 16:44:16 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id e13sm6321404ljo.6.2020.06.27.16.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Jun 2020 16:44:16 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] drm/panel-simple: Add missing BUS descriptions for
 some panels
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200621222742.25695-1-digetx@gmail.com>
 <20200621222742.25695-3-digetx@gmail.com>
 <20200627204338.GL5966@pendragon.ideasonboard.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dd1c5972-bbac-c2d8-76e8-08997b951e52@gmail.com>
Date: Sun, 28 Jun 2020 02:44:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200627204338.GL5966@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 28 Jun 2020 20:36:36 +0000
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjcuMDYuMjAyMCAyMzo0MywgTGF1cmVudCBQaW5jaGFydCDQv9C40YjQtdGCOgo+IEhpIERtaXRy
eSwKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPiAKPiBPbiBNb24sIEp1biAyMiwgMjAy
MCBhdCAwMToyNzo0MkFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IFRoaXMgcGF0
Y2ggYWRkcyBtaXNzaW5nIEJVUyBmaWVsZHMgdG8gdGhlIGRpc3BsYXkgcGFuZWwgZGVzY3JpcHRp
b25zIG9mCj4+IHRoZSBwYW5lbHMgd2hpY2ggYXJlIGZvdW5kIG9uIE5WSURJQSBUZWdyYSBkZXZp
Y2VzOgo+Pgo+PiAgIDEuIEFVTyBCMTAxQVcwMwo+PiAgIDIuIENodW5naHdhIENMQUEwNzBXUDAz
WEcKPj4gICAzLiBDaHVuZ2h3YSBDTEFBMTAxV0EwMUEKPj4gICA0LiBDaHVuZ2h3YSBDTEFBMTAx
V0IwMQo+PiAgIDUuIElubm9sdXggTjE1NkJHRSBMMjEKPj4gICA2LiBTYW1zdW5nIExUTjEwMU5U
MDUKPj4KPj4gU3VnZ2VzdGVkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGln
ZXR4QGdtYWlsLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2lt
cGxlLmMgfCAxMiArKysrKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPj4gaW5kZXggODdlZGQy
YmRmMDlhLi45ODZkZjk5Mzc2NTAgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1zaW1wbGUuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2lt
cGxlLmMKPj4gQEAgLTY5OCw2ICs2OTgsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rl
c2MgYXVvX2IxMDFhdzAzID0gewo+PiAgCQkud2lkdGggPSAyMjMsCj4+ICAJCS5oZWlnaHQgPSAx
MjUsCj4+ICAJfSwKPj4gKwkuYnVzX2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfUkdCNjY2XzFYN1gz
X1NQV0csCj4+ICsJLmJ1c19mbGFncyA9IERSTV9CVVNfRkxBR19ERV9ISUdIIHwgRFJNX0JVU19G
TEFHX1BJWERBVEFfRFJJVkVfUE9TRURHRSwKPiAKPiBEb2VzIERSTV9CVVNfRkxBR19QSVhEQVRB
X0RSSVZFXyogbWFrZSBzZW5zZSBmb3IgTFZEUyA/CgpUbyBiZSBob25lc3QgSSBkb24ndCBrbm93
IHdoZXRoZXIgaXQgbWFrZSBzZW5zZSBvciBub3QgZm9yIExWRFMuIEkgc2F3CnRoYXQgb3RoZXIg
TFZEUyBwYW5lbHMgaW4gcGFuZWwtc2ltcGxlLmMgdXNlIHRoZSBQSVhEQVRBIGZsYWcgYW5kIHRo
ZW4KbG9va2VkIGF0IHdoYXQgdGltaW5nIGRpYWdyYW1zIGluIHRoZSBkYXRhc2hlZXRzIHNob3cu
Cgo+IFRoZSByZXN0IGxvb2tzIGdvb2QsIGV4Y2VwdCB0aGUgU2Ftc3VuZyBwYW5lbCBmb3Igd2hp
Y2ggSSBoYXZlbid0IGJlZW4KPiBhYmxlIHRvIGxvY2F0ZSBhIGRhdGFzaGVldC4KPiAKPiBSZXZp
ZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgoKVGhhbmtzIHRvIHlvdSBhbmQgU2FtIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
