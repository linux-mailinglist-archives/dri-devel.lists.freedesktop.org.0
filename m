Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD02F153FD6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872B86F9E5;
	Thu,  6 Feb 2020 08:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647936F8E1
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 17:19:47 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q9so3338017wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 09:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ex6QL9IQc00cprlqfypdFG6mGmc5LLHkyyGwInJDeD8=;
 b=tU+0v+ngKvKZCtJJ84RqD1ZU0TiVG0jGJ71neqmfpgeoJ0YN80Lc5FBdK0eSwi3oBQ
 Vg//7UrZQPfezFrZherus6aXORrEYtZdxaGPA3rC/nfu2TGbpyKRLYDQHBkqItVR44u8
 jZ642auf1Ky5UKCmq8aLsChuWS7V7HcClwjubEUNr1gWgS/pgZi6KZ2akNLqqNxMjgzv
 k6yOxG3d81RnKTge1wido5OWuGVc95DCSxFTzKU+IiQkbHWncxAPGkHlzJGzu241hpN1
 W++xNpV35OAqfR2ra1xaz0xpJ8Mf/vOMt++Vcvh4jw9oyulv/avCGniYcevqVPVy6pvL
 GIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ex6QL9IQc00cprlqfypdFG6mGmc5LLHkyyGwInJDeD8=;
 b=hd4SoZkDWowdvWKIg822pwz9vZ0GW8MlvHiSmfWwyhB7thW9FtqQNkQqE4Hr4BvFvG
 kWggO1BpmTw8mmAgAX4eXxuYous2vv7qmXn91VIYkAOnO1URe831Ldj9fRQH1ymIJyHo
 zJR2T/E/HnfEH8UTeJStS168BaEW3UdPjRpY/b7RQwyUdVOvbj62vBJckPznaFBt2PeI
 Mvy2LJ/F/hmJ28eHTEFzE9X9iI3bzGnMXEqp95/hokI+gSQtmgbDPoBDDGixHA3E4q2q
 hTOcaG2KJ4b4/gnhdNcNRXvvNFNEM4tN4/l4EsoWcxEyzUJT2QHIefjJI/8O/+MLjvh5
 /NCw==
X-Gm-Message-State: APjAAAWulrxisAem4mXizD1godHjBj1VHfKa4pYLxZCepdy6DGhxD+M4
 7ZwzH88sCZF+Zc0Put7rrhY5iBfs
X-Google-Smtp-Source: APXvYqzaveCUjjthPP/xQP9AvaAIXBz0NzCkUGwSTDItKsIpucKUoHbQX87edIKQiToXexncNFfIrQ==
X-Received: by 2002:a7b:c459:: with SMTP id l25mr6593360wmi.17.1580923185855; 
 Wed, 05 Feb 2020 09:19:45 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id y12sm291334wmj.6.2020.02.05.09.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 09:19:45 -0800 (PST)
Subject: Re: [PATCH 1/3] drm/tegra: Relax IOMMU usage criteria on old Tegra
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
 <20200204135926.1156340-2-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9cb5fc84-f03a-53d9-578d-a4c1589c1009@gmail.com>
Date: Wed, 5 Feb 2020 20:19:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200204135926.1156340-2-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDQuMDIuMjAyMCAxNjo1OSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IE9sZGVyIFRlZ3JhIGRldmljZXMg
b25seSBhbGxvdyBhZGRyZXNzaW5nIDMyIGJpdHMgb2YgbWVtb3J5LCBzbyB3aGV0aGVyCj4gb3Ig
bm90IHRoZSBob3N0MXggaXMgYXR0YWNoZWQgdG8gYW4gSU9NTVUgZG9lc24ndCBtYXR0ZXIuIGhv
c3QxeCBJT01NVQo+IGF0dGFjaG1lbnQgaXMgb25seSBuZWVkZWQgb24gZGV2aWNlcyB0aGF0IGNh
biBhZGRyZXNzIG1lbW9yeSBiZXlvbmQgdGhlCj4gMzItYml0IGJvdW5kYXJ5IGFuZCB3aGVyZSB0
aGUgaG9zdDF4IGRvZXNuJ3Qgc3VwcG9ydCB0aGUgd2lkZSBHQVRIRVIKPiBvcGNvZGUgdGhhdCBh
bGxvd3MgaXQgdG8gYWNjZXNzIGJ1ZmZlcnMgYXQgaGlnaGVyIGFkZHJlc3Nlcy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgoKVGhpcyBuZWVk
cyBhIHN0YWJsZSB0YWc6CgpDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjUuNQoKPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jIHwgNDkgKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwg
MTcgZGVsZXRpb25zKC0pCgpPdGhlcndpc2UsCgpSZXZpZXdlZC1ieTogRG1pdHJ5IE9zaXBlbmtv
IDxkaWdldHhAZ21haWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
