Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1628F4B90FA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 20:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B0E10E591;
	Wed, 16 Feb 2022 19:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394BC10E591;
 Wed, 16 Feb 2022 19:05:59 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-2d0ede7dd9eso9275267b3.10; 
 Wed, 16 Feb 2022 11:05:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yLrFIsE9bo3p9BnVIL7Uc7sprqnSKm0YOW7fBIQdERM=;
 b=4GNnjCmvlMwKEYZdbpj+gD8MAPb3lM3TgUJ0uEfCvtIhIfeJqWqI/IunmhVJLrw6DP
 BpMHtuZ5JE5y9oufa6A8vgGGcFG0VqaJxdiLX05WzqZjsvvbCvRl4pLI3C8RLXwwSBYh
 hbNyE84MoIc4eIGRwqrVlUbPPxLjL0f4dPLnhd4VCGwsHVzPzFCZFfoJN0/3sXqKFPv0
 kzZBDMiTiup4OPaLC2QyQURkcuKJm9WbtKCJKaiLUIF5WLstyuorzVfzalBDXWgxwXrc
 oIy8G1r0OjmnZBoG8Wh8s0hT+ElxEH3VF6SJBJUd8bCaHi3+RobGRUmdjiAbuyg/MjxL
 RvnQ==
X-Gm-Message-State: AOAM530ENKACFS2TQdz0qxi1a0PFsbuCxp4rq8BCLSSaex8mEsd8Ibt8
 dGqf/FJslQxKX9+T7YfuLbvOTQ3nPfBElkU+L3c=
X-Google-Smtp-Source: ABdhPJyFOmiGOmRDkw8czUhuWEAUWZI3b6hfKAcdDSxdtm3oSTgs7z2noREt7vOvPl7JarLhxJEUxltkCz2WrL99cSU=
X-Received: by 2002:a0d:c244:0:b0:2d1:1fbb:180d with SMTP id
 e65-20020a0dc244000000b002d11fbb180dmr3902361ywd.196.1645038358332; Wed, 16
 Feb 2022 11:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20220215174743.GA878920@embeddedor>
 <202202151016.C0471D6E@keescook>
 <20220215192110.GA883653@embeddedor> <Ygv8wY75hNqS7zO6@unreal>
 <20220215193221.GA884407@embeddedor>
In-Reply-To: <20220215193221.GA884407@embeddedor>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 16 Feb 2022 20:05:47 +0100
Message-ID: <CAJZ5v0jpAnQk+Hub6ue6t712RW+W0YBjb_gAcZZbUeuYMGv7mg@mail.gmail.com>
Subject: Re: [PATCH][next] treewide: Replace zero-length arrays with
 flexible-array members
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, linux-ia64@vger.kernel.org,
 Linux-sh list <linux-sh@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, target-devel@vger.kernel.org,
 linux-hardening@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
 "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, mpi3mr-linuxdrv.pdl@broadcom.com,
 coresight@lists.linaro.org, sparmaintainer@unisys.com,
 linux-um@lists.infradead.org, greybus-dev@lists.linaro.org,
 linux-rpi-kernel@lists.infradead.org,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:ACPI COMPONENT ARCHITECTURE \(ACPICA\)" <devel@acpica.org>,
 linux-cifs@vger.kernel.org,
 "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-alpha@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 8:24 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> On Tue, Feb 15, 2022 at 09:19:29PM +0200, Leon Romanovsky wrote:
> > On Tue, Feb 15, 2022 at 01:21:10PM -0600, Gustavo A. R. Silva wrote:
> > > On Tue, Feb 15, 2022 at 10:17:40AM -0800, Kees Cook wrote:
> > > > On Tue, Feb 15, 2022 at 11:47:43AM -0600, Gustavo A. R. Silva wrote:
> > > >
> > > > These all look trivially correct to me. Only two didn't have the end of
> > > > the struct visible in the patch, and checking those showed them to be
> > > > trailing members as well, so:
> > > >
> > > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > >
> > > I'll add this to my -next tree.
> >
> > I would like to ask you to send mlx5 patch separately to netdev. We are working
> > to delete that file completely and prefer to avoid from unnecessary merge conflicts.
>
> Oh OK. Sure thing; I will do so.

Can you also send the ACPI patch separately, please?

We would like to route it through the upstream ACPICA code base.
