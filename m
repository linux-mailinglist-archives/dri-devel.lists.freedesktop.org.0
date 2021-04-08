Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C47A358087
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 12:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BC66EA75;
	Thu,  8 Apr 2021 10:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Thu, 08 Apr 2021 10:26:15 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C7F6EA77;
 Thu,  8 Apr 2021 10:26:15 +0000 (UTC)
Received: from mail-oi1-f181.google.com ([209.85.167.181]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MacjC-1m0kfO216Y-00c5IL; Thu, 08 Apr 2021 12:21:08 +0200
Received: by mail-oi1-f181.google.com with SMTP id x207so1651760oif.1;
 Thu, 08 Apr 2021 03:21:08 -0700 (PDT)
X-Gm-Message-State: AOAM530/N9befn6xu/MG836NLforQ8pjfag4qrKzIsY+daYD87ZPNq5o
 n/6LAFXbZQDiGZPbOWh+MA8AobM2q1ANSV6ilW8=
X-Google-Smtp-Source: ABdhPJy3jeKTxPcNwfngsbvoonksh80soCCHxiz4gKJ4G+0Fm3IstMzm5ZSVa0dFJZ+2JUBZ8yF1Sx9mjNQUOlISLnU=
X-Received: by 2002:a05:6808:3d9:: with SMTP id
 o25mr5654228oie.4.1617877267082; 
 Thu, 08 Apr 2021 03:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
In-Reply-To: <20210408092011.52763-3-david@redhat.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Apr 2021 12:20:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
Message-ID: <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: David Hildenbrand <david@redhat.com>
X-Provags-ID: V03:K1:Zr9CJujDqt6/yqLrtwqOUy/QypvVLIZJDD9jPjkx7kUsVb9ZWkJ
 ICzYQutCIq2vKDUpIdqduCYtIz4papwgpsC0iiOmnzjOqavUA2CCfwYok2isaUKCO1BetCC
 OmQq+XKXxjecwGxayDZkpxdaS5Eqyigfr9Gr0f6QyZmDEXA8XbhiEPZX31KVrYqGhlGP7Mz
 A1tse1hIkv7ozxNO45vgQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XmFWV0LUteM=:UGJDiQwGXaxwE5n7eoTL29
 3akZxkrgl56ZUl8OJL1kuNzZOCOs4N6+e50vThO4PzuaYsyVHT+3bp30gafv7yFxtbaVs2VWw
 rbpn6wqwrgTZG/qJUi62Sh+2beoTWLl8L7P9Azfx9X+qH7KRw8VZ1iLHMAO+n+4ep7H98E4kM
 0jypXNHQxX2zgYAndtNVbK7TRBLHcYSIfVGTqpyjwUkW/HfOk0MtTggKykqzlcT55kOjT7dpk
 4bsJCG6dpHmBwYqoUGQVXC0SXpu7kgH8GZmPsEK0/MPPbXFlRbhHtX+MQwfRBLNSWLiRl3t9z
 gl6N3Ohh+qBMEPg2GqG7MVFXAWodnFoxsoDw+jEGuF1yaIUvZZXJoowLi0igho3vzoh50hx4h
 22q7O0jVfHRJgSg7Uxuzu/CmnrRBuWoF8Pf0F/qv6koi213MdlNRn4N4RvsrAGi7G2JXQb58Z
 vBPFh2Qq6XgmQx4R/xJ33xkk7j/ugaKFCD2JNCpCNoJ46htscawapSI/vyE/EpzhJ7HdP4kwo
 5kd8K9EhqLVXb8lTeHM29quU1QYoTLKoIuqg/eKZJYaO19KyP9t1emWD/XN4c4Kqyg0VMKSnQ
 gqoyOkId2QuSQFZQ2dcv4zhOC8UB5L2V7d
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Simek <michal.simek@xilinx.com>, Linux-MM <linux-mm@kvack.org>,
 Joel Stanley <joel@jms.id.au>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 8, 2021 at 11:22 AM David Hildenbrand <david@redhat.com> wrote:
>
> Random drivers should not override a user configuration of core knobs
> (e.g., CONFIG_DMA_CMA=n). Use "imply" instead, to still respect
> dependencies and manual overrides.
>
> "This is similar to "select" as it enforces a lower limit on another
>  symbol except that the "implied" symbol's value may still be set to n
>  from a direct dependency or with a visible prompt."
>
> Implying DRM_CMA should be sufficient, as that depends on CMA.
>
> Note: If this is a real dependency, we should use "depends on DMA_CMA"
> instead -  but I assume the driver can work without CMA just fine --
> esp. when we wouldn't have HAVE_DMA_CONTIGUOUS right now.

'imply' is almost never the right solution, and it tends to cause more
problems than it solves.

In particular, it does not prevent a configuration with 'DRM_CMA=m'
and 'DRMA_ASPEED_GFX=y', or any build failures from such
a configuration.

If you want this kind of soft dependency, you need
'depends on DRM_CMA || !DRM_CMA'.

         Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
