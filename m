Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063DB66BDED
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 13:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF71F10E091;
	Mon, 16 Jan 2023 12:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4189C89580
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 12:35:26 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id o75so30123536yba.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 04:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/erdhCvJApG5+vMesdd42dNerta3+LyPUExayIGJPz0=;
 b=itZ+gDDTGwuqBx/tze1RvlEJN6u0EwoKQK0i1czQF/cl/UscOfz6YkJegbygVvnrMp
 tydo6HMMV5c7DobR3fHke+4bSyEgulQb0Ew+P7FzMYldQrV4/mZU4KB+y/8DCQzvuy7s
 MUhHh384PCVdpJ3iJPHcLbjwixsAx77cmLWOITqfCSi7LiLAsMmM8lLUqjn9pSBN61xI
 DOXsOIjgDXJkWQuxmXktlp/jOKVXc/MA8YsG3hX0qt328aaEpUEb2w6iE8J2AKtnxr1Q
 AhlcJa+r6B1r21bTWW0Vw0yIyTGxaOowB/tOLoCuveWnmUTZ2givnijP1r6RiIBvW8so
 ZKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/erdhCvJApG5+vMesdd42dNerta3+LyPUExayIGJPz0=;
 b=K/flDrddgfnEfxW0xk38J5teWJ07nX8M9DzymobG+KhtZ+nZcbZuiZ0C353ozsyNvw
 EtyrAsPn28R+qOVjYGAERCtGGnsXxo89+YfuLu8In67TxAB4+TIcIRpFSnoqz2thgUrz
 wsaOATiekl96ts5T2oQ0oJzK+JtnaCMJUuSHRl5zgvRHHsl+DyaCKfchdQf3l1z/eBKx
 a8jtRPKPtiL1khHbtJRVDLEpiZ1EVkxKGOHlaKGucM7fFYLtccwLpSDjntMYOmQfJSWM
 oOMZHFVowLzat+qE6pcu0EEjHBc0u49XjcdLsZm+Nc3pnIp3foBnQZplEM2wPk+dvLBS
 0GOA==
X-Gm-Message-State: AFqh2kr8ma3Jr57TglumnQ3xKQSH50gFhwYUx5OlMYObvzTZ946jTCn8
 Sq8l3QAM2wVNLmPcldoM0M4jKUyHQUUKatNdUBcExA==
X-Google-Smtp-Source: AMrXdXt1WAMrSMDgrFvzDatVwEnbHDFT16F4YV0aLDOnGxfs2CR1LL+5Qr5ImSLTYmxCautE2oqiS8pGzCGYY5jDKcQ=
X-Received: by 2002:a25:d08d:0:b0:7ca:9b40:72a7 with SMTP id
 h135-20020a25d08d000000b007ca9b4072a7mr1821610ybg.130.1673872525317; Mon, 16
 Jan 2023 04:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20230110200255.1218738-2-macroalpha82@gmail.com>
 <202301111039.dxBiLene-lkp@intel.com>
In-Reply-To: <202301111039.dxBiLene-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 16 Jan 2023 13:35:13 +0100
Message-ID: <CACRpkdbvsFDDRt1otJcZ-mPdSBecL0cwDSW92YeBGmmyLXee0A@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] drm: of: Add drm_of_get_dsi_bus helper function
To: kernel test robot <lkp@intel.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, tzimmermann@suse.de,
 oe-kbuild-all@lists.linux.dev, sam@ravnborg.org, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 4:01 AM kernel test robot <lkp@intel.com> wrote:

>    126  static inline int
>    127  drm_of_get_data_lanes_count_ep(const struct device_node *port,
>    128                                 int port_reg, int reg,
>    129                                 const unsigned int min,
>    130                                 const unsigned int max)
>    131  {
>    132          return -EINVAL;
>    133  }
>  > 134  struct mipi_dsi_host *drm_of_get_dsi_bus(struct device *dev,
>    135                                           struct mipi_dsi_device_info *info)
>    136  {
>    137          return ERR_PTR(-EINVAL);
>    138  }
>    139  #endif

This needs to be prefixed "static inline" like the function above, then
I bet it works.

Yours,
Linus Walleij
