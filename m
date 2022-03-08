Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369714D1CE8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 17:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A40110E320;
	Tue,  8 Mar 2022 16:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E719B10E320
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 16:13:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E50861647
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 16:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1973C340F6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 16:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646756025;
 bh=jXBz2f9tChtMFtKyOyZ4Q3h2mhlA6Onv+Izw71UufzM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UnxR/RJqQQzmrMWTZA3iu/62twkicgqrZxqPlgt9nko9YFkMPdzqQdhKoUlmtE+sA
 LsIrzYMHxXsjIhdqok6IGMj9Rq+1a6gWFNyB+Z+70KJtOOsqpOWNvFYljWZILzQJFj
 LCxFHq/7Of/gQbIlyvcaL2wihl5o1JEWd4jIsnhVX/JV05yIIeslM8V9wzZWNaplmt
 l79agZVVIiUMcMfcrko3HrLFLt+J5HqqOBuZ0IiRMIWFolhZ93VD/j8oJUDeiczv1Y
 ubHFl6HiKUy6yf1IWu6VGT4SBvF3/AqCtwo8kPFLx0yRK8d3B/jrDwCqPJscQUbEO6
 W1eCuj5HSAGvw==
Received: by mail-ej1-f41.google.com with SMTP id d10so40315351eje.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 08:13:45 -0800 (PST)
X-Gm-Message-State: AOAM5338BldNaK6Frqv9zwsPywl8ZcvkhUpn8ObcuphO3CC3xU3q1cyQ
 QuGZglILxO78EM6ffXUiWTQvYlWzZLZB8VjhRg==
X-Google-Smtp-Source: ABdhPJwgjUirqReFAL6N3dmjsf1cllJkmUJ+TfjKooqF93ar8SLKSqqP4oME9QxeInU2UXWZqXn7edss5wrmTCZW8Po=
X-Received: by 2002:a17:906:181a:b0:6d0:ebf5:c064 with SMTP id
 v26-20020a170906181a00b006d0ebf5c064mr13580319eje.82.1646756024055; Tue, 08
 Mar 2022 08:13:44 -0800 (PST)
MIME-Version: 1.0
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <CAAOTY_8CTewRw2Le9RjXoCrqF8AyHD0_p01EMiJ2QQ63yf-HKQ@mail.gmail.com>
In-Reply-To: <CAAOTY_8CTewRw2Le9RjXoCrqF8AyHD0_p01EMiJ2QQ63yf-HKQ@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 8 Mar 2022 10:13:31 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+qqCHvzg8uKx6xaD4cDJJq7hOUvJGME18V7cuLW5OPqQ@mail.gmail.com>
Message-ID: <CAL_Jsq+qqCHvzg8uKx6xaD4cDJJq7hOUvJGME18V7cuLW5OPqQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix MediaTek display dt-bindings issues
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: DTML <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 4, 2022 at 5:49 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
>
> Hi, Rob:
>
> Would you like to take this series into your tree, or I take this
> series into my tree?

I can't. I don't have the broken commits in my tree.

Rob
