Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C56112CEB4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2019 11:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B0289D42;
	Mon, 30 Dec 2019 10:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B5A89D42
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2019 10:24:47 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id v201so24821842lfa.11
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2019 02:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rzDoRC4MHhm3h5pF1afVY20HHsvL3mkKYh/fXUPc0Uw=;
 b=WtMjvql2lt33WePTaTxAejV/6Ql6c3RMJxp4Y23AMXse9xix5gI1Q4NnDK5ae02N6m
 4LtduhmLFWqoU6P/2rplRTaKlUsF0ikMpjkvKNNj2NKqjcX0mFsgf/ofOq+dh6zumofR
 ZzBhRH3AAJhP80OMBTcdN+h5hJzrTXMdhj76bVcdCdHGVeRdhtXrCGQfS/pEuYDHR4jq
 /UZxFPsGjWGR6EBmiKNn4GWLFNxlSxBsGz4FaHVb19XG9bwEaRsCmcJsMSALj1i6SiBP
 5T6ZpJtH98PU82kKunQ7kzRF3LI8JlXeqm6uwYciDhqUYhqU2oh/NhQKCPLwEMvDxxZb
 11qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rzDoRC4MHhm3h5pF1afVY20HHsvL3mkKYh/fXUPc0Uw=;
 b=Es/2MQkny/KWANX7OXC6sH2F0l9useY0mlO731uXF57V1lM7dwEyWlPV9KYSDpjvk4
 wEbPlxvuCAMx2SJOIEskfLHN6rojBg7NxYtCUjfkcR9zLe6mSBFaxffN3CM0CYnKckHD
 nD3D4Ym3OLBN/mAJTtF0bNdVygReR6SZpPYb9OVhtTco4l82Aw0WYfp32rf1KiNsOf/d
 i8d4zmBr3LjDQLFXaFnGlpuZKqDO2byXww3Ow+ODpKItTswJtQxrx1ta+evMK9rVhhRO
 +FfIRZxzl4KndNMXHwbssnnL2/u0uWmHdFfFUYu0yfhe8IuSOlAEEQohnWreRkldPsI+
 a0Ow==
X-Gm-Message-State: APjAAAWpY7wUzO0KG3lsobyqfJ9MkSHjFRAeKwj+bb0BdeUG/UPGABZj
 iljbzcCFjPJXMA462UZhjP1qXnsay5NkYEVly+S+Hw==
X-Google-Smtp-Source: APXvYqxRvkQxLspnMmrMM3h3Sj/dlWYZvO08GqnBkR25i7gWRKC/2+sgwKwkjkNbniEpGN7uNEbSVnL5aW6wlZVmlto=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr39891977lfn.126.1577701485459; 
 Mon, 30 Dec 2019 02:24:45 -0800 (PST)
MIME-Version: 1.0
References: <1577495680-28766-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1577495680-28766-1-git-send-email-tiantao6@hisilicon.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 30 Dec 2019 10:23:40 +0000
Message-ID: <CAPj87rO-ZrCCJCza0Eeyp-JAJ6Qp8RdhJQh_1Yh_QSeK2o8_hw@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon: Added three new resolutions and changed
 the alignment to 128 Bytes
To: Tian Tao <tiantao6@hisilicon.com>
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
Cc: David Airlie <airlied@linux.ie>, Chen Feng <puck.chen@hisilicon.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linuxarm@huawei.com,
 Xinliang Liu <xinliang.liu@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 tzimmermann@suse.de, Alex Deucher <alexander.deucher@amd.com>,
 tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tian,

On Sat, 28 Dec 2019 at 01:14, Tian Tao <tiantao6@hisilicon.com> wrote:
> @@ -118,11 +119,9 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
>         writel(gpu_addr, priv->mmio + HIBMC_CRT_FB_ADDRESS);
>
>         reg = state->fb->width * (state->fb->format->cpp[0]);
> -       /* now line_pad is 16 */
> -       reg = PADDING(16, reg);
>
>         line_l = state->fb->width * state->fb->format->cpp[0];
> -       line_l = PADDING(16, line_l);
> +       line_l = PADDING(128, line_l);

The 'line length' here is the 'stride' field of the FB. Stride is set
by userspace when allocating the buffer, and the kernel must not
attempt to guess what userspace set.

You should use state->fb->strides[0] directly here, and in your
atomic_check() function, make sure that the framebuffer stride is
correctly aligned.

Please split this into a separate change. Your commit has three
changes in it, which should all be separate commits:
  * enforce 128-byte stride alignment (is this a hardware limit?)
  * get the BO from drm_fb rather than hibmc_fb (can hibmc_fb->obj
just be removed now?)
  * add new clock/resolution configurations

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
