Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 545104A80A0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 09:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FB410E759;
	Thu,  3 Feb 2022 08:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7DD10E1E0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 08:50:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 231D3B83379
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 08:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11ECC340EC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 08:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643878237;
 bh=sCovqp/LVTNAY55LPVwBXo9M2vjhcuupN49Og7ndHOY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PscAmiMQQh/LAwSnOR2Hx/QobSPRVEjzv8xVkIAU8KmhMgFSDquRJDgj8vEt7gqg7
 lzOSornWD2WbXflu/64XWLujgU7qquHEHQ1XFiPE738mMFPnsZu9dLExJx4ic+DCs1
 Tpvy9IrAd8V2fnZ2Gn7g6Ws2kIeziKGw3nVf/ncc5o47+YoiGy9ZCyk4saFxjlyR8q
 SSCmSrdsZtogivh7nsxdSF1okMq+/11E5VX5ZPn3o2qtTgC9y8ZZKkpQ6eHWjeV3WM
 gcQCMGd8dJVKaqjSvLmIBlUcKARzYiCwNUfYCSagConwybnuBx1778Hs5e92uw3xqb
 9zOccEn7sa+3g==
Received: by mail-yb1-f180.google.com with SMTP id c6so6784559ybk.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 00:50:37 -0800 (PST)
X-Gm-Message-State: AOAM530qwpHEArJL38emqfEzuEFXF/Y2/i8LjMLWE0GuYXYDq/yTUhsF
 aeyGVeEzCwcXC4YkGFpHI/QyLwr3HRtwI+S458s=
X-Google-Smtp-Source: ABdhPJz2rKW+6cJx7IEZ6y4WcndcGsOtT6b+W6v6GwyrkBFEapQckp7QFKUxvL8lVgv5cGNlZ3EXEHt5rAkHNmvxEaY=
X-Received: by 2002:a81:4b4a:: with SMTP id y71mr3698140ywa.418.1643878237062; 
 Thu, 03 Feb 2022 00:50:37 -0800 (PST)
MIME-Version: 1.0
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-3-15330273260@189.cn>
In-Reply-To: <20220203082546.3099-3-15330273260@189.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 3 Feb 2022 09:50:23 +0100
X-Gmail-Original-Message-ID: <CAJKOXPfN+Ax8i_Mcax9LfbSG8VwM86YgUxuRUfSF_YEx4z0EaQ@mail.gmail.com>
Message-ID: <CAJKOXPfN+Ax8i_Mcax9LfbSG8VwM86YgUxuRUfSF_YEx4z0EaQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] dt-bindings: ls2k1000: add the display controller
 device node
To: Sui Jingfeng <15330273260@189.cn>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 linux-mips@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Feb 2022 at 09:26, Sui Jingfeng <15330273260@189.cn> wrote:
>
> From: suijingfeng <suijingfeng@loongson.cn>
>
> The display controller is a pci device, its vendor id is 0x0014
> its device id is 0x7a06.

The same as your patch 3 - these are not bindings.

Best regards,
Krzysztof
