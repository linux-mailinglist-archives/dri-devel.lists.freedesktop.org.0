Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C88F2611B9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 15:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DFE89F89;
	Tue,  8 Sep 2020 13:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A571F89F89
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 13:01:33 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id n25so8998676ljj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 06:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9ROFMex6SmeQcgvgfjI5Vchgvc+G2tj/iCxGO6nsxuo=;
 b=gck+FqS4TFd5ioreMir7T2hmA8fOv7VmNt+UEdcoNlHpyopB61mqzfwAgUgzpnzI1M
 awXeDvbGswaVG9tiaeMeWaU39z+IibLEQ+XqA6dnfa0fojUufDKdMMk1Cf3PgB6k6MD8
 jr/nL7gXzFGPBVryCkZTzvftcp8o6uyy5VwP3T5/xlmEVZ0ICQT66jYZJ2dm0Qsu+KO4
 OZANzsYGJ2FdjcMvOaH17vORAB6hK/dCqCiIA2790Wa7sTbCy6mb16uHiI7SK3HbLHxU
 gGT61gn0NiPQwyQewP2S+WzKFszo3IFb/LbbilVCN7YK4fhSGXVMm1FM4hBkhd3sDSGz
 OjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ROFMex6SmeQcgvgfjI5Vchgvc+G2tj/iCxGO6nsxuo=;
 b=Svo9iAcUXeVJy6JYCm+5uE5ji3mCqoLJ0fVUogFnPkfSMpWFC77D2Yy0sXjwU1XRP8
 wIjK1jyeZ/pWol9aeeOk7oHDoaBinqG8i0Dd9c4RWw14khC2VBZjzUfNm/Y9L5LgDtxm
 4WYEaGMlOfbW07fF6+iMh9uF7uILFFjXP0qazx0gmOqNZTJKxMfqIZnQISi88pZYnkIF
 kt38xJWmZpKz6I5TBVdTOYA3GkOkW1TuQOu5TV8hgqrJlcjsXPDcXyndNJ0s5NbUzQvT
 nB+5ZSeUkh1U3MBO7sOc93lJnOHIgW+eVjcp20thkozSmNYnwIhn7ZlLoBWTbRKcxPpG
 rRnQ==
X-Gm-Message-State: AOAM5333PicJnUAaGDmhmDrxWL7ABZLlSoWhvJXVoP0W1ruxHCjillni
 1oh2qYbu2xa+mmG6RbxdxbKl1m91JY1dU9LomrM=
X-Google-Smtp-Source: ABdhPJzNCPOWmmxsXcRfVxojDQus+EStgmwv1gk8/iTKXOq4a7uo6VFLWq6gOeHI82RqCdy4Fdrc7ekP8uPBAtxxulA=
X-Received: by 2002:a2e:9899:: with SMTP id b25mr11694176ljj.178.1599570091951; 
 Tue, 08 Sep 2020 06:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200908125558.256843-1-stefan@agner.ch>
In-Reply-To: <20200908125558.256843-1-stefan@agner.ch>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 8 Sep 2020 10:01:20 -0300
Message-ID: <CAOMZO5Amaxi-rU44b_q4+6k4vtOoCOmbKgiDJ0r3tEi4zkZB=w@mail.gmail.com>
Subject: Re: [PATCH v2] drm: mxsfb: check framebuffer pitch
To: Stefan Agner <stefan@agner.ch>
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
Cc: Marek Vasut <marex@denx.de>, Sascha Hauer <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

On Tue, Sep 8, 2020 at 9:56 AM Stefan Agner <stefan@agner.ch> wrote:
>
> The lcdif IP does not support a framebuffer pitch (stride) other than
> framebuffer width. Check for equality and reject the framebuffer
> otherwise.
>
> This prevents a distorted picture when using 640x800 and running the
> Mesa graphics stack. Mesa tires to use a cache aligned stride, which
> leads at that particular resolution to width != stride. Currently
> Mesa has no fallback behavior, but rejecting this configuration allows
> userspace to handle the issue correctly.

What about adding a Fixes tag so that it can be backported to old
stable kernels?

Thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
