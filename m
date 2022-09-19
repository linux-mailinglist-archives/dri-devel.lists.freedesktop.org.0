Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6AA5BC5C7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 11:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E608F10E53C;
	Mon, 19 Sep 2022 09:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B50C10E53C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 09:51:58 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id w8so46025651lft.12
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 02:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=CHVoh6AydMdVyNdsw6VEdTT8sVcwJuX4/7OtqF81TLE=;
 b=AsUtDZLutjYAmPuubd5VJT7esoukKBV4drhaipeCSPKxFSprD/Z0M3c5QRBWu0cyyD
 ouVrfCl8OORFdekwNoBwNhFR9U7ndxDKDos9VWw62Qymi2+VZGLP7XylvDA0t1ZHKYfb
 hmRpaUrRj4i0aVFafXU/drjl3I0IYfiOOD1wKGEr5aFW5JTTtIGYYUHRtjH/yy6W6pmx
 ZCFyoktY8JvMBm38nYe99kSyfOFZmFNJzY6SuC/Y07tLW8tbt3LThpNorC19V28CCBTK
 Ep+wJYpIabNauK9No+9itwZR26x9BIGA+29BKOeMdtOwtKRIhCxgkKe28PFBjA68Xlw1
 ONIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=CHVoh6AydMdVyNdsw6VEdTT8sVcwJuX4/7OtqF81TLE=;
 b=7sKslr9i1IpLiobU3DwQrz8lC81WAw1r9sgLYqxPfmEXJhx9GXnYy1ukxKJmIUqWXh
 6usaHYyd0ZELzMCfR6rIpggGY2cFLHZ/sM+rdLC9aq8eUPe08JWTp4OIeOwt4YxeamyC
 CoSoK6zlD9fHCn4C8qdFf/u4Y1nptDXDsKyi3y5EQYSh0AuqA6YWcCWIb3BKJDaWhQwQ
 CEhRC03ii+kM5UuIYB7JR0pwFsO67e9jtQGukCFfz3dc35e6bO3WTBE8xu+Hcu+GZjRD
 JWsfBqc5sEO01uUKi1xmruDKyMzmh6+WrEcQgx+NXtfwc1x+LmgmgMCk3iP32zSZUlkL
 BlMw==
X-Gm-Message-State: ACrzQf0N10ZFJeIsJWHZVgcTrkHqJbQsk+gpd6k/3STLm7UuWFRP278e
 RR3PRUtP3nBvY/oGwpvyRO0=
X-Google-Smtp-Source: AMsMyM7ueLFa3mwyZJZLiCmpSdCXCJLMG0inR83nTec9J8BjIHZJdlOX2VH8AUZJV6OitbHR4WhCiA==
X-Received: by 2002:a05:6512:909:b0:48b:954c:8e23 with SMTP id
 e9-20020a056512090900b0048b954c8e23mr6486606lft.670.1663581116524; 
 Mon, 19 Sep 2022 02:51:56 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.122.187])
 by smtp.googlemail.com with ESMTPSA id
 b2-20020a05651c032200b002618e5c2664sm4683016ljp.103.2022.09.19.02.51.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 02:51:55 -0700 (PDT)
Message-ID: <0fc52b8c-a8a1-0e73-6f1c-da554681c9a9@gmail.com>
Date: Mon, 19 Sep 2022 12:51:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH -next] drm/mediatek: dp: change mtk_dp_driver to static
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20220913134929.1970187-1-yangyingliang@huawei.com>
 <6051fab8-e198-fd58-2dfe-b2b344b67c15@collabora.com>
 <CAAOTY_8yTkkBNEv=MgRj2+JQM0=bD+z2wFsTT7n6uEC0ay1L9g@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <CAAOTY_8yTkkBNEv=MgRj2+JQM0=bD+z2wFsTT7n6uEC0ay1L9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Yang Yingliang <yangyingliang@huawei.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Chun-Kuang,

18.09.2022 06:56, Chun-Kuang Hu пишет:
> Hi, Dmitry:
> 
> My tree has no mtk dp driver yet. Would you like to pick this patch?
> 
> Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> 
> Dmitry Osipenko <dmitry.osipenko@collabora.com> 於 2022年9月15日 週四 下午5:04寫道：

Applied to drm-misc-next
