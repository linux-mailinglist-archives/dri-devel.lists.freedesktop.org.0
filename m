Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDF74E62B8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 12:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8021E10E88E;
	Thu, 24 Mar 2022 11:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED5610E88E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 11:52:29 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 mp11-20020a17090b190b00b001c79aa8fac4so2289315pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 04:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aroiU2GiEBc0mzOQ/Loh3g/ALUh7v+xPixNkYKzQpTk=;
 b=i8rXTdMYXmqBOuF5RneRqV2feGsnqlp8h0N3j3r4lUrvshXAuvGWrvuAKYOzhiMa+B
 jnDWZ+xQ8nsAIc88UF1cb18QpmJ26NBlQfAm5PHFgrsEuL++TBJnL32ZOHtn0FokAsAQ
 NM2qAbSFbqn4BFjvM1pZ/NQbxCGfEoE0dAMzJIoNAmtkUe76WsNR/IZKtERD4JJDz4H8
 mPQ/8oAs+HQKGcAWbgcW/+DvJAXUpdYhhL9eOsnUp0I41kT/rsLUJ3UO63LCHMSRQafZ
 h8Ebu+oqnFmowoDM4/JqYzTYeqXImbbExAUY3bEsEbt4EmXmlCPtV30wvZ3D72QJVWPb
 c8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aroiU2GiEBc0mzOQ/Loh3g/ALUh7v+xPixNkYKzQpTk=;
 b=5IfY4aOm+CF34YTtR/Hl3WK8vhnjXT0zEHD1eHwYwN160tYZWQO3nd1Gpq4Ifmmo93
 62iBrEC9W0KNOKY6X1QrSsQXDmAhRVfftQPrDEWCB7Oz7ErtKDEkDIbYPbGunRDrFsVv
 6voO3+QZHzY/S17meYKsieIn/Eh/SKXkeW9fXyjAHzxyo+FfPcjd+zMk+2nj2VALd1C+
 USgGiTyK/Jb8SUbwlYB7XueuChQ7m2bAExvtQmmgIQQIWOWOAqDLR5aQk/EUg5X81iSl
 8XhPzS38235fsLtj6MZVlg1qWu/PmP5LWQBNP3Buq5a5REdXYgRrse18WgK2jz4BEEdj
 iFJA==
X-Gm-Message-State: AOAM531B9EcMJ8z/z3vP1r4/MvOvwSu8uFYaJwN6wndC7L8UZwCSoBLz
 DuBu0hqLLlN5Rrt0aQ3/dv0hqWMUSO/9zX0UsRYAyw==
X-Google-Smtp-Source: ABdhPJzXKDj3d1FS7qaSZQA8ljtBwjUrx0yl4r1DjZ+msZR2HsfW4E4dfXE2mgixdUQOD8MK3sWX3uSB8iWC5oP0iVg=
X-Received: by 2002:a17:902:9301:b0:153:2252:44ea with SMTP id
 bc1-20020a170902930100b00153225244eamr5350911plb.65.1648122748899; Thu, 24
 Mar 2022 04:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220317094724.25972-1-yuehaibing@huawei.com>
 <CAG3jFythpVSh-CLuBAu8AC403Yq7Sh-oAjjkPtA+JFuN7_OriA@mail.gmail.com>
 <4d20ab47-6871-3ca5-2751-a2499166cada@huawei.com>
In-Reply-To: <4d20ab47-6871-3ca5-2751-a2499166cada@huawei.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 24 Mar 2022 12:52:18 +0100
Message-ID: <CAG3jFyu1VrzNE0GyB9+tr_eBZd_83eTgSqv1NpdeZASrn_xnhg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/bridge: it6505: Fix build error
To: YueHaibing <yuehaibing@huawei.com>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, allen.chen@ite.com.tw,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, Hermes.Wu@ite.com.tw,
 laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Added r-b & applied to drm-misc-next.
