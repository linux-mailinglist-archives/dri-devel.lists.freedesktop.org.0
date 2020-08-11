Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C6E242153
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 22:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB9F6E83F;
	Tue, 11 Aug 2020 20:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3519F6E83F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 20:37:16 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id z18so178636otk.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 13:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cyAdGLpsSHEg2WGh7JZfkmwsxkBgafP7iF5apU/n2CY=;
 b=Y2LCGsOpN0RldBzIMy48v+04TzKnyHcLpJToEgT+4rGAxSGdVtYwypLiVftvRHBOPE
 i+OlqvcAfb1XVHq8fZEdcZYKKnf1oG+gB8R7wAcAjI+0kT7MKjYvsw9Gaf99EnI06ogT
 HfPwLCmgC5PbrPp+Kf4RZvBDb5lF0nJLsiCyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cyAdGLpsSHEg2WGh7JZfkmwsxkBgafP7iF5apU/n2CY=;
 b=BwPfXCTdWjZBi9uSOQDb2LLxH9ZDcv7vmf2ii7oxrUC/t0NrtjGR7Ibx0/Rjwum49B
 scDCbCAyLYu35YDtkS4PQqZbhETIQOHqvd/QLhi2qCZXOsX53m7AJ+xQlhBlIKehkq8z
 snVyixtW9+W4xtKGEgOVTfoq5uD764FpLsgRKoIGEAeExP7ORJgxrIdGenSkfFdkYr7F
 TNUoXQekO1+ezp4AygTUmWWj5zNZpZHi6hLO+EyW/rOr8fauMu+ot3Tha8iELtZUsKp7
 Ak3HPT6Vmagnh0GvavYw8otiLubEyopT3XOt3qc1vwUOZEzjZEwdF2WUJIiLgVSRZMzy
 TNdw==
X-Gm-Message-State: AOAM530GBRo3LS05gzEOcJoJ6YFdxcawuexWRCz4Fgzh8/oI8v+pet2d
 FpYHGN0UjRNaIF/5bPpvZhNG4X/fmcITF8K0Ze8PKQ==
X-Google-Smtp-Source: ABdhPJxcgyXaX2x4hKWYec2RgVCtOonhZp1fq6FNvEKDqlAjlAYywhMckS+x9KVczzXwmCrjQz4q/gqy6pfHxpswrYY=
X-Received: by 2002:a05:6830:1e71:: with SMTP id
 m17mr6955382otr.188.1597178235447; 
 Tue, 11 Aug 2020 13:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <1597106777-30913-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
In-Reply-To: <1597106777-30913-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 11 Aug 2020 22:37:04 +0200
Message-ID: <CAKMK7uGcbaABtUuzWpOi8TA=ERSHBP6hwiX-YnQSXVHKWQo+mA@mail.gmail.com>
Subject: Re: [RFC PATCH V2 0/2] Add Xilinx DSI TX driver
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
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
Cc: sandipk@xilinx.com, Hyun Kwon <hyun.kwon@xilinx.com>,
 Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, vgannava@xilinx.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 11, 2020 at 2:46 AM Venkateshwar Rao Gannavarapu
<venkateshwar.rao.gannavarapu@xilinx.com> wrote:
>
> Xilinx DSI-TX subsytem consists of DSI controller core, AXI crossbar
> and D-PHY as sub blocks. DSI TX subsystem driver supports multiple lanes
> upto 4, RGB color formats, video mode and command modes.
>
> DSI-TX driver is implemented as an encoder driver, as it going to be
> the final node in display pipeline. Xilinx doesn't support any converter
> logic to make this as bridge driver. Xilinx doesn't have such
> use cases where end node can't be an encoder like DSI-TX. And Xilinx
> encoder drivers represents a subsystem where individual blocks can't be
> used with external components / encoders.

So there's indeed a bit of an argument about when it should just be
stitched together as components, and when it is better a bridge. But
bridges also come with plenty of convenience glue, and we're talking
about fpga so the point pretty much is to rewire this all eventually.
Maybe not by you folks, but people are r/e-ing these things so who
knows.

The other thing is you do have a bridge attached already, or should
have: The drm_panel. And you do get the entire drm-connector
instantiation rather wrong, at least the ->dpms hook is breaking
atomic real bad. The ->detect implementation is also quite the
adventure. So panel bridge is definitely required here.

Finally this also would avoid component.c usage in xlnx - not that
there's something wrong with that per se, but it always means driver
specific logic and interactions, so harder to maintain for people not
involved in the code base on a daily basis. Also I'm not sure how this
works, the component integration glue in the main driver seems to be
missing. And the upstream drm/xlnx doesn't seem to have it either.

So all together I do think drm_bridge sounds like the right thing to do here.
-Daniel

>
> Venkateshwar Rao Gannavarapu (2):
>   dt-bindings: display: xlnx: dsi: This add a DT binding for Xilinx DSI
>     TX     subsystem.
>   drm: xlnx: dsi: driver for Xilinx DSI TX subsystem
>
>  .../devicetree/bindings/display/xlnx/xlnx,dsi.yaml | 147 +++++
>  drivers/gpu/drm/xlnx/Kconfig                       |  11 +
>  drivers/gpu/drm/xlnx/Makefile                      |   2 +
>  drivers/gpu/drm/xlnx/xlnx_dsi.c                    | 701 +++++++++++++++++++++
>  4 files changed, 861 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.yaml
>  create mode 100644 drivers/gpu/drm/xlnx/xlnx_dsi.c
>
> --
> 1.8.3.1
>
> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.



--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
