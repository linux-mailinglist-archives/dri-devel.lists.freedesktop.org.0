Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392EB4D8619
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 14:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA9710EB71;
	Mon, 14 Mar 2022 13:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5182A10EB6F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 13:38:47 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2dc348dab52so163540927b3.6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 06:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xC+lJiodR+sWpzqzm91V+sLXEyA0MqIpnbN3l1bqwWU=;
 b=OexWQ2h693u4lZOOUvJTKtfnBVn43v7FMeeMk5qC6Frv256FwjHDfU7eMS1+8nFYmb
 i3A7P9HN5ayJTyk/xe33mK8GVleqWqW85fUg5rWNLWZ+xDhV/KwCvpDsQeuLdBQR8+Xo
 czjRV4c3d/fwjqVQ2XYLj8s+A9wfHndMUpwBA/k6f9n+l06tQSRE+rJchhDCTpb9lFqQ
 4znbk3UIOaTqHlj/AP5CvXd4dAKjjvxE6ZsXyF//gBc3BEmA+n79YsjU8RlWUca2oKok
 vlzRCH1tajRmDhoakSGDMBw8avYHd3MLbA6mlM0shYCsLfgTuTfM3MyfwgTVrcMLGkb1
 fIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xC+lJiodR+sWpzqzm91V+sLXEyA0MqIpnbN3l1bqwWU=;
 b=6Lwe93ursRCCoxQ4jYg8FjtIPH0Itu+jRCo04jae8+UGNAOFab+2chlyNrO9M723wO
 2mrorYPJP/tRdhxWxzImA4N+AVkbd3Ekk9p9RwzMNT2JuI7jZQ/sy3dQGKdSE2EsTjAn
 IawvTQ5ic6Z/xFVLNDB/exv/HQK0V5oppb23zjuuz/7gIopCRvivsVLrhThtyqEfUbyY
 CuAV6VGM9uavM27b4fd4LnfvG3mCruke5WfN5qM45UDWmgt2Kcbr8rrA9a1KOoZ9ibxa
 I1R+YJ6hzpNCU/O/uNw946QJJ5H9saSNpik/d+wV3vbLRzJ1fKz5weKZFpI2Hg6V284+
 kjuw==
X-Gm-Message-State: AOAM531F23aCkkvpFe1NdcW14YvEBcFD8hJCBtxripyTQM8juI1Zo3sE
 9wY2xEBpgYT8DHGH8JjdlgC0fHzHzFXeenr+YPWn1g==
X-Google-Smtp-Source: ABdhPJxR5tRZorPtoK9M8ocNQ9ikdDUGdQA0+NLPUHYqvLKOH7htQyeEib4lFHIQySUWWYAOFtzU3UegfAPAeVz5eBs=
X-Received: by 2002:a81:1182:0:b0:2dc:4e58:da41 with SMTP id
 124-20020a811182000000b002dc4e58da41mr18944386ywr.268.1647265126402; Mon, 14
 Mar 2022 06:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220225075150.2729401-1-s.hauer@pengutronix.de>
 <20220225075150.2729401-23-s.hauer@pengutronix.de>
 <bb077f34-333e-a07a-1fcb-702a6807f941@rock-chips.com>
 <CAPj87rO2sztocJrE-CeSQWry9j_cSe2uv9F1Yf81pGnBXdu2Ag@mail.gmail.com>
 <ae4314db-09c0-049b-ccc9-f6b1c3003dcb@rock-chips.com>
 <CAPj87rOanNE1wca3ijJx1zXYZkKX1ta9F145GCXM15Nv=POicA@mail.gmail.com>
 <f3af0286-fc64-f011-bc90-6797e26e3640@rock-chips.com>
 <30f195d6-e9d7-3da6-89fa-4a064a1f6bf9@rock-chips.com>
 <d98782df-43c8-475b-375d-ad6aff4fae44@rock-chips.com>
In-Reply-To: <d98782df-43c8-475b-375d-ad6aff4fae44@rock-chips.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 14 Mar 2022 13:38:35 +0000
Message-ID: <CAPj87rNXuJ6MQMb7dJHWZcqxaH9cyu1f2_NWidT_zsm44STmaw@mail.gmail.com>
Subject: Re: [PATCH v7 22/24] drm: rockchip: Add VOP2 driver
To: Andy Yan <andy.yan@rock-chips.com>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Mon, 14 Mar 2022 at 11:02, Andy Yan <andy.yan@rock-chips.com> wrote:
>    Remember you said our downstream vop2 driver is very slow on weston.
>
> Would you please share the case you run ? or how can i test frame rate
> on weston?

We were able to observe this by just using either waylandsink (using
dmabuf from the V4L2 rkvdec/rkvpu drivers), or even weston-simple-egl.
I have not been able to do a full review of Sascha's submission, but
from what I've seen of it, it should have fixed those issues. (I don't
have RK3568 hardware to hand anymore.)

Cheers,
Daniel
