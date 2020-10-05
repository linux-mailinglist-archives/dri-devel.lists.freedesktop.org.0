Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD0F284269
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 00:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A691C6E182;
	Mon,  5 Oct 2020 22:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15246E182
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 22:09:53 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id f37so6724644otf.12
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 15:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7f1fBk7T5MJuppOGzJybgejBl0zlC1yTjVdkRiIg2Io=;
 b=eRV3e5oh23BWQ1xBhZU3IXavOjxK+ylB/MO2gxeAzG1PO4NAG+wZqlY5nge32xCYo6
 XeHPLInF0TJ3wW8/MKLWoU9nE7KeCKaiT7ipdK0pI0RCUIxkYl35YzYvTr8GPO7cmZ2s
 oDEjxzGwzwrh9VfRA88Q4udCM3FPeq1E8/pPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7f1fBk7T5MJuppOGzJybgejBl0zlC1yTjVdkRiIg2Io=;
 b=anKshsc/sRzG7uImK7+6Njsl8EF0jOGSVewAqTLp3ZTA6agCa3dD72WaYdLwWD7wdi
 62+ulxai3vgPVMsjYKNNW5B5rqME4OvPzFa+BxGQ7s75Dottw/eMZxVFdrNFqF1tYYiS
 YfzxNoFwks8WMXI6Z9KiewGwRvxU/kkDIJn4PkrLZutEPqBDjbbSuZtJMMGjby99XUwh
 PKilGd+StS/xAOwYstFELfInLrpSjcm8qevhEo9cSNow2kjkLid0amhkAarYZN5OVmLh
 vgDmZBb2dT0IJQ7Lcn8I4/yfCWDlwywWmDnfV3Nfz2X4YstLGVk/QHhb5V+7GfxbRtB7
 CyoQ==
X-Gm-Message-State: AOAM530ib0X5PUmbfQZIogcPp+sHOgVuTfy0h2vpYG+cpZte/sdp0Z3s
 9IiTWV8TA5+DuM7WRjx7P9I1SgrenyF391Ei8T9YOA==
X-Google-Smtp-Source: ABdhPJw1s01w9VPnqHysvveyA2SrC0Ov7Z+hqY/1WwTItT8XhlcBYA4buQZDwbXVWGfhS6mvqS36I2lMZyO2Vc9dqBo=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id
 f28mr1061163ote.188.1601935793128; 
 Mon, 05 Oct 2020 15:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201005213123.o4qtfazrnexgjq7p@NiksLab>
In-Reply-To: <20201005213123.o4qtfazrnexgjq7p@NiksLab>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 6 Oct 2020 00:09:41 +0200
Message-ID: <CAKMK7uFkuaGphqdzmYxY4UyMJT2QOASTmhMLAxDHzLdRp-PRGQ@mail.gmail.com>
Subject: Re: drm: Supporting new connector model in tidss
To: Nikhil Devshatwar <nikhil.nd@ti.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 5, 2020 at 11:43 PM Nikhil Devshatwar <nikhil.nd@ti.com> wrote:
>
> Hi all,
>
> I am trying to convert the upstream tidss drm driver to new
> connector model.
> The connector is getting created by the tidss driver and bridges are
> attached with flag DRM_BRIDGE_ATTACH_NO_CONNECTOR
> Here are some questions, regarding this:
>
> 1) Most of the info regarding bus_format and bus flags is coming from
> the bridges. Is it okay to not populate connector->display_info with
> bus_format and flags?
>
> 2) The "drm_atomic_bridge_chain_select_bus_fmts" does the format
> negotiation. So is it okay for the encoder to simply pick the bus_format
> from the first bridge's state?
>
> 3) What is the meaning of MEDIA_BUS_FMT_FIXED? Does it mean that the
> bridge does not change the format from input to output?
>
> 4) The bus_flags are available in bridge->timings->input_bus_flags and
> also in bridge_state->input_bus_cfg.flags. Which one should be used?

Whatever the answers, please make sure that they're recorded as
updates to the kerneldoc comments for these functions/flags/struct
members.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
