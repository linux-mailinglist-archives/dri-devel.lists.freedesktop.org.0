Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA4B2F0329
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 20:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4366E039;
	Sat,  9 Jan 2021 19:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE636E039
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jan 2021 19:27:56 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id o10so20302996lfl.13
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Jan 2021 11:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mMzmhqsb6O+Y/sweUwnfBNP0O+DIAXIGp9pSoa4SyH4=;
 b=uTzq5h8Iuv77HAntNbpwm3FVUhayYhlLptY5pCwOcZhQJvXxtLAcVx3TSaL9+pd6H8
 owZv7e8MLunROZacxEtvuF6quKWIH5vg5D9bzbXFnrZXKZbnmctX7t4FasG6gKel5VPe
 WT/AonhPx3CAFj/BtYDm9TJmLehdYX35pmZohneqWaYd+u0YTVfZrlHOALecGguQqgnX
 5oNmWeKmEcaW5ILp2AsuBz9WoMcIVCqAX5/HrIMeQRzLGLSor1rvXHe43yGFNwAEH68I
 qo+BELRNYgcZhf9ftsoVf4vFOZY1A9elnizxClPpYEYfhhMq9J51TFYNmL946+b5NKjH
 9Zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mMzmhqsb6O+Y/sweUwnfBNP0O+DIAXIGp9pSoa4SyH4=;
 b=UmElgaJIteE5lYpdWBLbFq+eMdmzk5Olkge0ztFa9OXlMoibCe3vKhiXV1wEuS+HqL
 L3eJVpF3grlbHCLIB9dIy+BPPq1KIDUblzvcvoErDoLbvcnGx0rwtAfar4rKpKHYVvnv
 nrmS9dstqV7MX5jFzENkslDULFkRLStmIiQbITvOflNvI3l2HGn4y4Pa0hM94NCwAWQ1
 N+xaDPra4GCge3bTpKwalMCG27dlVFvrqKErmqQtqQ1ktDIMRw20f4cLor8EiahEnauH
 Hma5yZy/ntYLZXgEeUhN5sjgTIj+uCCk9eKLrebzK1wMhf5vcO8k7CHat/BP+Y1PHNZu
 yNVQ==
X-Gm-Message-State: AOAM532jQ+9Z3e02aZ5GZtO6IEUh9NABy2vT5IUIGraNhUZPaQqfDM3Z
 uJogZF7WyCdNo3AF+JHO2811NRuT+YmJ0gfbfK4=
X-Google-Smtp-Source: ABdhPJz/XGrE9hd0zKsEMiVyUZ/CPfFqRBSJ6A2xplHL+kAVBy/n3LREY6+X4uxsW4ba7wL1gySV+a0S/UaR9okmkwg=
X-Received: by 2002:a2e:bc05:: with SMTP id b5mr4273065ljf.444.1610220475326; 
 Sat, 09 Jan 2021 11:27:55 -0800 (PST)
MIME-Version: 1.0
References: <1608381853-18582-1-git-send-email-oliver.graute@gmail.com>
 <20210108214313.GA7979@ripley>
In-Reply-To: <20210108214313.GA7979@ripley>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 9 Jan 2021 16:27:43 -0300
Message-ID: <CAOMZO5AXgeGYt4+4NMBRL1Hm-9M4X2DngdEBsJEAHq8+MRhQgQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/panel: simple: add SGD GKTW70SDAD1SD
To: Oliver Graute <oliver.graute@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Marco Felsch <m.felsch@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oliver,

On Fri, Jan 8, 2021 at 7:24 PM Oliver Graute <oliver.graute@gmail.com> wrote:
>
> On 19/12/20, Oliver Graute wrote:
> > Add support for the Solomon Goldentek Display Model: GKTW70SDAD1SD
> > to panel-simple.
> >
> > The panel spec from Variscite can be found at:
> > https://www.variscite.com/wp-content/uploads/2017/12/VLCD-CAP-GLD-RGB.pdf
>
> some clue what bus_format and bus_flags I have to use?
>
> [   42.505156] panel-simple panel-lcd: Specify missing bus_flags
> [   42.511090] panel-simple panel-lcd: Specify missing bus_format
> [   42.615131] mxsfb 21c8000.lcdif: Cannot connect bridge: -517

Does this patch work?
https://pastebin.com/raw/diTMVsh8
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
