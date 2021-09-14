Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE34A40B494
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 18:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6956E4AE;
	Tue, 14 Sep 2021 16:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715C96E4AE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 16:26:59 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id y16so29545026ybm.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 09:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M76dEsuG69ayw32JhIfhlHZS7uBRvbcdrb6f1kH90Qw=;
 b=V+Mtue6kXbRncaVsUxk6LcYAHASPeGZsInVIY5z6pb43lPml8uX19Xcu8WOUbVPU91
 +ZvmQfk+0DQpZ+XA5FGATRUz302GXJuFvMRKU/sX8vCkmxz5C2GQxtM42Mo4TGW2D9XF
 y6vV/wywkH/GCTIonsgIc3VvXbxvtpeNhOTECvySUezRquag0Fo/StvsJXWpPUt6C/Dk
 BoPsILnOXLCIfk+hNF1nqJwA5ExgXZt/VGw7HiVFBz0zVH/ryTxk8WMQ1MQL7sxOqBmU
 rUgS3lYXSOHrK952qDPQtUsu2qUCACdg3552nZH5KSBRu9n1TVm9uupz0EYgdz/hn3nD
 b3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M76dEsuG69ayw32JhIfhlHZS7uBRvbcdrb6f1kH90Qw=;
 b=pZKDyMhX2T6Ory27PxIs7HWUJr3VjR8FZDZi+Z9qVG//UkfhPTqbSTcRSFMYXdXkwr
 1UP7+uL30OnnSU8peY6gXmxpeQMC3S0DSOW+3/P8DB8cj0fT5CFEJTnFZwgrdm5LzQR8
 GW2O/n3aIbbgMiglYotKySZwPl0xgs1lGeRn6XuI0fxcXVKk1+TAe58IVEDTpY0kb4w8
 mdWp7TnB3yADa623Cw6oik+USdbim2869GmoVrCm4BCd+3oAAyw5SazcEEOMcCXlRtR4
 Gu/5WINy8QLp3v8mxIJ2mm+POnjoUTn74bTvWJYeaLIcqgi8DvXPyqVxKOCNUDmlecHo
 n+ww==
X-Gm-Message-State: AOAM5301nwtLCm3BpDHEZu+TZ/v6LzZO5iL70U68ll+dRnN+ytz3Y1SH
 AkT03eivfq8cWKFfaMXfzbqZFs2iALv3Gz30nnQb4Q==
X-Google-Smtp-Source: ABdhPJwvZaGWva3B2JOje2V/PctRIZ3IVxNzWIuHfWQHaClbmlJfFd4gyW3ewLpwcdsWWo9NFWTt0EZ5CWhUQnth7qw=
X-Received: by 2002:a25:b09d:: with SMTP id f29mr22849855ybj.257.1631636818329; 
 Tue, 14 Sep 2021 09:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210914032252.3770756-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20210914032252.3770756-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Tue, 14 Sep 2021 09:26:46 -0700
Message-ID: <CAD=FV=W7uTQ0OZ_YV7UU-4pGinuX=huF1SkBxfNb2R8T1Dx5Tw@mail.gmail.com>
Subject: Re: [v6 0/4] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 13, 2021 at 8:23 PM yangcong
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Compared to v5, squash this with patch #3 in the series in
> drm/panel: boe-tv101wum-nl6
>
> yangcong (4):
>   drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
>   dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
>   drm/panel: support for BOE and INX video mode panel
>   dt-bindings: boe, tv101wum-n16: Add compatible for boe tv110c9m-ll3
>     and inx hj110iz-01a
>
>  .../display/panel/boe,tv101wum-nl6.yaml       |   7 +
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 745 +++++++++++++++++-
>  2 files changed, 750 insertions(+), 2 deletions(-)

Still seems OK to me and you carried my Reviewed-by over which is fine with me.

Just to give others time to chime in, I'll reset my snooze and wait
another couple weeks. If I don't hear anything then I'll work on
landing.

-Doug
