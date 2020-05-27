Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 504231E4E5D
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 21:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C7D894D4;
	Wed, 27 May 2020 19:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65402894D4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 19:40:15 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b6so30449213ljj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 12:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JoA+ltY04rTbNuPqoR5f7m96ZZzh4EiSS3yqsY7/Fkk=;
 b=hPL8fiE399pTijYYRRViKesbZjUEdR+1xrxi15mivx2UishaS/MyGdfufOhOuh4nJC
 9DUnu5lvoCIClNGhanYt78Spn/6lz6zJeb3f1R1yoUauNsfdQgAnT10eHlqd3dA2XxFA
 Wg3afUHR2XHL8Zs4PeqBof/vcTQa6b4reFBUU69cmsy3v+WHduqyYbNr7/uT0POOWyIb
 Pd9gtwh9o1vSLmlP5F8Wg9VveNOpMqacFmDDbP1kCj2b8X4Yz6f0DWDOd4IXybnXLHMc
 rqQth6s35/EOBBV/PYDci0vcE4tOXgfTbpJtEYpdvdMfOxYYHPxZ/7V0n7zGJrXURm7J
 siEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JoA+ltY04rTbNuPqoR5f7m96ZZzh4EiSS3yqsY7/Fkk=;
 b=brl/CWkS+ZIIMuQ/AzO+ZGtnMocKsTrw3+X763GBaK8s0dQNLVMG7riYvji3DDXOtL
 cPEgiBXQAwAVx9vAGx6SQMgH+kO++Bfr7c/zL4bu+FbQ2XlgcXudLmEibVAe5q3uBYtf
 lJbT+XO+BHq0UFbGxYE3/KCck7lXu50b/Hq/WaTE9TqlZwjXrq28QtVeZ66Vs6Y6uCfm
 1TAeezOLHdrfOlgCr6Fe7qGBG3b6R+bmkQJfkDQRDmAT5Z3UWywhW1WnmSyv1wCczj56
 TxHLyYlUgiKV+0jx0W3mD5LTgVtISlmFC1XoQvuKNiQPy8d0I4aAob3zc7OJmLSMIHMA
 shJw==
X-Gm-Message-State: AOAM532gSQvHKRwm5saLpfnnF63gedBuIbLadvXlY/poi8zlmbJH9Aet
 QDcOL5ZeeDoEbaMfyvmQei2JMsJapqA9uipdDQhxeA==
X-Google-Smtp-Source: ABdhPJzvKaopQeuSH++NfG6+ePzdECIe55mSMz1vGorLjrgnNGhLypFBTCO3NOV35EuZEgNnmnk7AN6/T2UVknXBfxI=
X-Received: by 2002:a2e:8ed3:: with SMTP id e19mr4027321ljl.367.1590608413785; 
 Wed, 27 May 2020 12:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <f1b1737fe0665e7191c3d2a3cd9bfafb831866be.1590594512.git-series.maxime@cerno.tech>
In-Reply-To: <f1b1737fe0665e7191c3d2a3cd9bfafb831866be.1590594512.git-series.maxime@cerno.tech>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 27 May 2020 12:40:02 -0700
Message-ID: <CADaigPUpH4DuK_FSVGmq-ZPPCtvxOcdq881h9h3NE1_ODJ6tuA@mail.gmail.com>
Subject: Re: [PATCH v3 055/105] drm/vc4: hvs: Introduce a function to get the
 assigned FIFO
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 8:50 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> At boot time, if we detect that a pixelvalve has been enabled, we need to
> be able to retrieve the HVS channel it has been assigned to so that we can
> disable that channel too. Let's create that function that returns the FIFO
> or an error from a given output.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

> +int vc4_hvs_get_fifo_from_output(struct drm_device *dev, unsigned int output)
> +{
> +       struct vc4_dev *vc4 = to_vc4_dev(dev);
> +       u32 reg;
> +       int ret;
> +
> +       switch (output) {
> +       case 0:
> +               return 0;
> +
> +       case 1:
> +               return 1;
> +
> +       case 2:
> +               reg = HVS_READ(SCALER_DISPECTRL);
> +               ret = FIELD_GET(SCALER_DISPECTRL_DSP2_MUX_MASK, reg);
> +               if (ret == 0)
> +                       return 2;
> +
> +               return 0;
> +
> +       case 3:
> +               reg = HVS_READ(SCALER_DISPCTRL);
> +               ret = FIELD_GET(SCALER_DISPCTRL_DSP3_MUX_MASK, reg);
> +               if (ret == 3)
> +                       return -EPIPE;
> +
> +               return ret;
> +
> +       case 4:
> +               reg = HVS_READ(SCALER_DISPEOLN);
> +               ret = FIELD_GET(SCALER_DISPEOLN_DSP4_MUX_MASK, reg);
> +               if (ret == 3)
> +                       return -EPIPE;
> +
> +               return ret;
> +
> +       case 5:
> +               reg = HVS_READ(SCALER_DISPDITHER);
> +               ret = FIELD_GET(SCALER_DISPDITHER_DSP5_MUX_MASK, reg);
> +               if (ret == 3)
> +                       return -EPIPE;

Oh, FIELD_GET is new to me.  Looks like we should replace
VC4_GET_FIELD usage with just using that header, and also
VC4_SET_FIELD with WARN_ON(!FIELD_FIT()); FIELD_PREP.

Could you follow up with that?  Other than that, 54-67 r-b.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
