Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D73322FCE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 18:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDAB6E84D;
	Tue, 23 Feb 2021 17:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D416E84D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 17:44:31 +0000 (UTC)
Date: Tue, 23 Feb 2021 17:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1614102268;
 bh=BfG9OrbmBqNgKkcmelq97SJlZ+CtFojaf6Sw7blBg4M=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=k+vipebctkBPk5Y5rqzJxjWp6xU5O2k6NKU+w2LmQM8zg+dCS2eHV0eb0kv2yQY0+
 HVX44ICA2J1K8E87n/HqLAI2RvAHxRc5wwSM1P8+RYFoszkZWR3Qob4vnzuwrpO6Wm
 Fe1Ws0w6+6ivYkrlcZyMFI7KOh4LGpjgKCVIEDHiLgPt8swSv8KkMhtzKmq0Smm1mW
 sxZKpdM75tqH2ldtaWqHnZdK0yuqolDlj2z/4hA9gYnpNmyAf9B0o8uIkT15MoUhFA
 cmvCcgqfiSL1DtdrxMGzLcjK3S/KkFHOui/sj7dI37j4dp1h16btFxHq2aL1tqcsKi
 q5kuW9jem5ZFw==
To: Alex Deucher <alexdeucher@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/amdgpu/display: initialize the variable 'i'
Message-ID: <SPaFghh3lWax7Iwge3u3t7hAegI3wGyl7euN4azxZEVvTky4UCXmPq7QQSFFd38dgg3kgkhuJpjB_D3ob7Tqf5Oc2DGKCwHZIWzfit15Uyg=@emersion.fr>
In-Reply-To: <CADnq5_MXK_H-g4GReU1dGca2PAXsGjbzg47kcWjXFQ4DrYG8tg@mail.gmail.com>
References: <1614021931-4386-1-git-send-email-jrdr.linux@gmail.com>
 <32vjVDssCxltB75h5jHin2U3-cvNjmd_HFnRLiKohhbXkTfZea3hw2Knd80SgcHoyIFldMNwqh49t28hMBvta0HeWed1L0q_efLJ8QCgNw8=@emersion.fr>
 <20210222234457.GA36153@24bbad8f3778>
 <yHvp7KbQD2pF5dR6krMc_Zuq9a8GxkYSSiIpjBenuiCjwpFmFxpAOpfzhp0DfHQhH2Z3P81-CGpwmmXp0zjifT93vBXXYd5kJsSucQgXFZI=@emersion.fr>
 <CAP+8YyGdr0jkf5_K8ofKMzZn5Koy_vkxyKKHkyVDqDz2sWvL_g@mail.gmail.com>
 <CADnq5_MXK_H-g4GReU1dGca2PAXsGjbzg47kcWjXFQ4DrYG8tg@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Stylon Wang <stylon.wang@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Nathan Chancellor <nathan@kernel.org>, Dave Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>,
 Souptick Joarder <jrdr.linux@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, February 23rd, 2021 at 6:42 PM, Alex Deucher <alexdeucher@gmail.com> wrote:

> yeah, fdo ran out of disk space so I moved to gitlab:
>
> https://gitlab.freedesktop.org/agd5f/linux/-/commits/drm-next

Ah, thanks for the info, my bad!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
