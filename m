Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5C51A37B1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 18:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC8B6E110;
	Thu,  9 Apr 2020 16:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF1A6E110
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 16:04:26 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DAFEC20768
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 16:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586448266;
 bh=jHl2tXuPUqSaQC+oyWJix3OnWQectQwicEvPWmdxhFQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JvQO1zcrMuUG+G5yhLQ+FC82141KHggoH55IydrkE9dcXvWyDOTx0LTZ8G+DeNqlK
 rX1a6zIdEqdAN3ocTVxK+Ok6FToMIDzn+3Vn9py2AAZfjdP9qFDE9qHrh/HY6w40Hr
 6WKFCtS/GgpM6sIqTnVtu0d/noeQ+uaMzN7ZgQSg=
Received: by mail-qk1-f169.google.com with SMTP id g74so4420168qke.13
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 09:04:25 -0700 (PDT)
X-Gm-Message-State: AGi0PuYOnzMrtjqMHIphQ531yifH9WJgIehm13KrcKNSXLzcBbf+EI/N
 B5/7FTLL84HLZeyB/XnCB1OngxeUcYs1tR32BA==
X-Google-Smtp-Source: APiQypJORe0eaQnOiuivPG/xIQ+NoeNev+Wot1Kl7zM7TIi6OX4XybaKhfLLknumjo9+oc4cE7ZrNPC+AtZSpQVaJvs=
X-Received: by 2002:a37:61cd:: with SMTP id v196mr511059qkb.393.1586448265058; 
 Thu, 09 Apr 2020 09:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200328183641.11226-1-festevam@gmail.com>
 <20200328203001.GD32230@ravnborg.org>
In-Reply-To: <20200328203001.GD32230@ravnborg.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 9 Apr 2020 10:04:13 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+JXb3DHo-on-52TN6fGeukdPQPe+S+ZNrJmLxFT0rFOw@mail.gmail.com>
Message-ID: <CAL_Jsq+JXb3DHo-on-52TN6fGeukdPQPe+S+ZNrJmLxFT0rFOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: ltk500hd1829: Remove the reg
 property
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 28, 2020 at 2:30 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Sat, Mar 28, 2020 at 03:36:40PM -0300, Fabio Estevam wrote:
> > Commit 52120e8c7ae3 ("dt-bindings: display: fix panel warnings") removed
> > the dsi unit name, but missed to remove the 'reg' property, which causes
> > the following 'make dt_binding_check' warning:
> >
> > Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.example.dts:17.5-29.11: Warning (unit_address_vs_reg): /example-0/dsi: node has a reg or ranges property, but no unit name
> >
> > Fix it by removing the unneeded 'reg' property.
> >
> > Fixes: 52120e8c7ae3 ("dt-bindings: display: fix panel warnings")
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
>
> Thanks, applied to drm-misc-next.

This should go in fixes for 5.7 as well as the one for xinpeng,xpp055c272.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
