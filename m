Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14D322C34
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 15:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81DF6E1F9;
	Tue, 23 Feb 2021 14:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E43D89FFD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 14:27:24 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u14so22793725wri.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 06:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ua5mUBb1kXJwLpY5FtH2hXzt7wQx27QWyD9CzcSllG0=;
 b=z7ZK36m6RBMM+TS726upxalf8gZFlnGBsxFjQ7PnIdJnoe9hb8NLiRGixuMhgb6oN/
 /DLe0Gd4aQeV+5PrvgplISSYx3DE2ar2Jn4fpm2SOOFZWnZdahpFiXjsWCn4Eabc4RDx
 VSlke85NFhsHPwuC8yDMLOz528x+uYM4y1eVc+HygRMDX/qWKvTJgZYw7GD2JbAJrif9
 kRBLB+8sIS+2s242O8dxE8V3qVn+A68bwnNCx9ez0cJ5REIwCN+jwgYeBTuzrJ97m0Hb
 6j/deXf5acbruC0fFa5T7ayrlXBr1ETWq9kD9RONjuDXdUfHM+GA0wLjtg37ZE4tE6n6
 1eTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ua5mUBb1kXJwLpY5FtH2hXzt7wQx27QWyD9CzcSllG0=;
 b=glMNNBl7pKDKZkxx5VLF+VvuNnVb8tDffRUnxzAafGgPsSw09y3eW2Wfopx9z+SrPs
 pXr8oHgJlS2os0HrOCTy8/RVxBgDCWans0eTzMOKBdTYW//ZUTRSN//Rw2ILJaTiA+Gc
 WV5HOGOX/CB0EuuDJNLvLuQyeuIqMRLq0Mz/OV93AIwoHbZIQHYa+rjlzcnNc53BevXX
 JKXTCu9w9+PQ5WSOwLujcQ/9kV0ONFL6pRDAufCQM/gVsmjrCkAWrmrKrsMaAj10jpzZ
 JRHWKCQRALB6RmalfpxaNWvSY9pj323E6SBW/QCmsSkKo9tOrLVIHv2WKrOF+OjvJr+m
 2wEQ==
X-Gm-Message-State: AOAM530u3lwi4c7Cw33imQUIJBs/gk7ZUYkkB43KYbqpxx0fmsV/F2jC
 Jk0y5ff8ePOftSci86y8hoblFBOd2RPH/I8PtdP+0Q==
X-Google-Smtp-Source: ABdhPJxuHX8Wvue+y5zUj/iQnNI1u4s7XcFW3kvzWr5c2h2PHW8CZFWMo1qwLSptAJKX0RMF5pnCSQeFYVP+xKFVtpQ=
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr26948488wri.373.1614090443053; 
 Tue, 23 Feb 2021 06:27:23 -0800 (PST)
MIME-Version: 1.0
References: <20200811202631.3603-1-alyssa.rosenzweig@collabora.com>
In-Reply-To: <20200811202631.3603-1-alyssa.rosenzweig@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 23 Feb 2021 14:27:11 +0000
Message-ID: <CAPj87rMS5zxY6sK4N8zVZF9MHThmURj6kuso=G5+MQDVmNjC4Q@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: Require the YTR modifier for AFBC
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
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
Cc: Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-rockchip <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 12 Aug 2020 at 08:05, Alyssa Rosenzweig
<alyssa.rosenzweig@collabora.com> wrote:
> The AFBC decoder used in the Rockchip VOP assumes the use of the
> YUV-like colourspace transform (YTR). YTR is lossless for RGB(A)
> buffers, which covers the RGBA8 and RGB565 formats supported in
> vop_convert_afbc_format. Use of YTR is signaled with the
> AFBC_FORMAT_MOD_YTR modifier, which prior to this commit was missing. As
> such, a producer would have to generate buffers that do not use YTR,
> which the VOP would erroneously decode as YTR, leading to severe visual
> corruption.
>
> The upstream AFBC support was developed against a captured frame, which
> failed to exercise modifier support. Prior to bring-up of AFBC in Mesa
> (in the Panfrost driver), no open userspace respected modifier
> reporting. As such, this change is not expected to affect broken
> userspaces.
>
> Tested on RK3399 with Panfrost and Weston.

Bumping this one: it seems like the Rockchip VOP either always applies
the YTR transform, or has a YTR control bit which is not documented in
the driver's register definitions. This means that it is incorrect to
advertise the currently-used modifier, which specifies that YTR is
_not_ used, and doing so breaks Panfrost which correctly uses the
modifier as documented. Based on our knowledge of Mali, we believe
that Panfrost is correct, and the error lies with Rockchip erroneously
using the YTR transform in the VOP's AFBC decoder despite declaring
through the modifier that YTR is not in use.

Looking at the downstream vendor tree, VOP2 as used in newer SoCs has
explicit control bits for YTR and other AFBC knobs, but this has been
substantially reworked from the original VOP and is not applicable to
this IP block.

Mark, or others from Rockchip, can you please:
- explain if there is a way to enable/disable the YTR transform in the
VOP's AFBC decoder, similar to the split-block control bit?
- ack this patch which correctly declares that the YTR transform is in
use in order to make Panfrost work, so it can be merged through
drm-misc, or provide another solution which fixes this API mistake?
- if VOP does have a hidden YTR-disable bit, add support to disable
YTR so rockchip-drm can continue advertising the non-YTR modifier, and
Cc this patch for backporting to every kernel tree which declares AFBC
modifier support?

Thanks in advance.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
