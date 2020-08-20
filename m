Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF8E24CE82
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5B96E0D2;
	Fri, 21 Aug 2020 07:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068666EA3A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 20:10:28 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v4so3525046ljd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 13:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aGDq3G61oS7LkIVvcYe8gs5DEBUj3X0IY6+Ho7L4bXc=;
 b=aaI2XwvNa4jYT+ZP++lm8ICOT30vbHbYUWZ2eapjPgVOrbFZiW0JrsNRnHrkHauDAe
 F+tXGAAqJ4vzEu+ctIrX4IM+yBsxNUqux5EEMIr8tDiF5nelEImI1pAGijUjDb9sdpr+
 3jhTQx0pxPCjI9Yjxp5eOYRJHWEFTz3Q/JDopYi/d21uwf6ydkQJd8zd0nrYHrBm51gj
 IJ251b8BXCu/KouQNs7VyVjZaRoQ6EfqJzBBwEfbvaelF0x0hTDyx36zN9EiD0UZhoes
 jE4vU9heUNNm5TPrDjhlMPFoFqDRVuH+5P+XTNd0kuG1aP3MnluFFFC7ajaNVZ0Eb9HZ
 g3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aGDq3G61oS7LkIVvcYe8gs5DEBUj3X0IY6+Ho7L4bXc=;
 b=dZco+QTYLtbV694y5XdSg0jppoiR9+DGxiU4AO5LJ9cq+8cbYJ/KFHHwRvezkmOyHl
 F4NH8CnX9MJwNHLykWZX6Xj1/vyKyVHAnfuOU6sa3mi5/cDx7DE30DfZ4zjl43z0tEAm
 cEoca6QSf62VB8xRipJ+4krQ37GkKBSRCbGsaP9OXfNN+Ga9UPuPpQu2YJEKi6zNfGUS
 VJDb4WMkEKn3+Yt3xOgTaBHxf6eWhII9DKGUl/BnRCYhyz2YRknVO9CCFdUaTzAKRwmq
 1gPnbUqdxm3pLxFXEQ3kriYmnR1se0AnzkMxv8TdcqeO7QYqWtYHwqQdXvdn/Q0yABWS
 DGPg==
X-Gm-Message-State: AOAM533a2nWQKphQ98BQS1xbqeK75wegDwLI0m7H5RtwiySWDf5fAtNW
 SBWksb7fWBndAaXB6AHhuTw=
X-Google-Smtp-Source: ABdhPJwerR6+NSwUtwLl00X9aib7HLlZlj50J5PUAv4AGloGJDrAm7Kb1tk696rJXQBYokDQvzy/bw==
X-Received: by 2002:a2e:9886:: with SMTP id b6mr684ljj.258.1597954226414;
 Thu, 20 Aug 2020 13:10:26 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id f23sm633489ljk.74.2020.08.20.13.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 13:10:25 -0700 (PDT)
Subject: Re: [PATCH 16/18] staging/media/tegra-vde: Clean up IOMMU workaround
From: Dmitry Osipenko <digetx@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>, hch@lst.de, joro@8bytes.org,
 linux@armlinux.org.uk
References: <cover.1597931875.git.robin.murphy@arm.com>
 <3535c205b9bce52556abbf2f63384fb38e009df9.1597931876.git.robin.murphy@arm.com>
 <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
Message-ID: <ebc9c605-b986-daef-9f2c-1834437fd292@gmail.com>
Date: Thu, 20 Aug 2020 23:10:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:11:07 +0000
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, s-anna@ti.com, will@kernel.org,
 m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org,
 magnus.damm@gmail.com, kyungmin.park@samsung.com, jonathanh@nvidia.com,
 agross@kernel.org, yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjAuMDguMjAyMCAyMjo1MSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gQWx0ZXJuYXRp
dmVseSwgdGhlIFRlZ3JhIFNNTVUgY291bGQgYmUgY2hhbmdlZCBzdWNoIHRoYXQgdGhlIGRldmlj
ZXMKPiB3aWxsIGJlIGF0dGFjaGVkIHRvIGEgZG9tYWluIGF0IHRoZSB0aW1lIG9mIGEgZmlyc3Qg
SU9NTVUgbWFwcGluZwo+IGludm9jYXRpb24gaW5zdGVhZCBvZiBhdHRhY2hpbmcgYXQgdGhlIHRp
bWUgb2YgYXR0YWNoX2RldigpIGNhbGxiYWNrCj4gaW52b2NhdGlvbi4KPiAKPiBPciBtYXliZSBl
dmVuIElPTU1VIGNvcmUgY291bGQgYmUgY2hhbmdlZCB0byBhdHRhY2ggZGV2aWNlcyBhdCB0aGUg
dGltZQo+IG9mIHRoZSBmaXJzdCBJT01NVSBtYXBwaW5nIGludm9jYXRpb24/IFRoaXMgY291bGQg
YmUgYSB1bml2ZXJzYWwKPiBzb2x1dGlvbiBmb3IgYWxsIGRyaXZlcnMuCgpBbHRob3VnaCwgcGxl
YXNlIHNjcmF0Y2ggdGhpcyA6KSBJJ2xsIG5lZWQgdG8gcmV2aXNpdCBob3cgRE1BIG1hcHBpbmcK
QVBJIHdvcmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
