Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6882627C9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B166E9C9;
	Wed,  9 Sep 2020 07:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E440B6E8FF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 02:10:13 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id u21so1437659ljl.6
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 19:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tP0EvdXLQDT1u4Oa2B1LXz0mUeG/WbkRnEleGiHXzQw=;
 b=RVU2FOFaReOtwAtWP0k69UtFuDntfBSxvLwX8B5Hl9VX9ORgJWFXoKhb0iIYGB2Xpz
 Z/+2R5GNOJCR1QB+kpIb6n/IruUSVtLy3HtXNxMvpGeGoiFhHwrAAtI+0cnfp6nsxApd
 xQJrinGkmpwi5Yv8IfPeUeKjfb+gcHbM42nqh3If/1CvoxFRDX7pCOYLnFluVULsas/7
 Ey35ernp2Mrt17wCkfFo5ye1sv4epQTIkpa6nW9eNJ10NxfGrvz6sbDR7UdxkCx9vk6O
 EGOfstujkCIYcKtWHrBr6OPTzlFyXEL/XejSgMqbjC7nHpAAB46kXv0b50wyGFagY1Va
 Dx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tP0EvdXLQDT1u4Oa2B1LXz0mUeG/WbkRnEleGiHXzQw=;
 b=gSQ5CXcVm0xsaL3JeaZh8nOo8VR1rZtzKTD3dv+VLWEQlWfae+IZINovxIep0LzlNe
 9oAQ3OxafW6qqTp8EV77LpAEMXdfuAg8PAftSqupymytw6d/MuS5KxrKibqejSCIuX63
 NGO8eyC/40rAnJf4IArI3OnGPx4PkJoOwifiyGJDoPEh3OZf49JLEgy8z7EcgDCEVXm8
 XajxhcB28jYn6+mkVIpE2n3QTeUUrR9KhfTQlgBJlJv7UuiKBt8iVHBpLBEXw0VdcYO0
 5RfpvGCejoTSSWzsjy4DNIcJl9faDBQ8HWTtwkKoP2+ZIJpBpTufm6JFlOtYdA6dSoN5
 KHvQ==
X-Gm-Message-State: AOAM530RVveBZQ43036Qh7lISkzfPrRzbp99qZQxMCVzaoZ9P8+N/pnP
 qj5OLHcPp3mI9tZGZSy/O2g=
X-Google-Smtp-Source: ABdhPJzoGp5l3+BFEiKfqk35E1OzS/wVLUORtJx81f9KCmrYTldvzL/ZmKrKlMsJkRaW3UbSmUj8PA==
X-Received: by 2002:a2e:8e31:: with SMTP id r17mr708571ljk.5.1599617412385;
 Tue, 08 Sep 2020 19:10:12 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id q22sm250685lfp.40.2020.09.08.19.10.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 19:10:11 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <11c05ff2-092b-dc40-73a9-c0ec0fa22826@gmail.com>
Date: Wed, 9 Sep 2020 05:10:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-18-mperttunen@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDUuMDkuMjAyMCAxMzozNCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gKwlqb2ItPnRp
bWVvdXQgPSBtaW4oYXJncy0+dGltZW91dF91cyAvIDEwMDAsIDEwMDAwVSk7Cj4gKwlpZiAoam9i
LT50aW1lb3V0ID09IDApCj4gKwkJam9iLT50aW1lb3V0ID0gMTsKCmNsYW1wKCkKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
