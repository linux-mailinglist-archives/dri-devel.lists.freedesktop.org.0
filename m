Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA89C3F8F2F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 21:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8058A6E8A4;
	Thu, 26 Aug 2021 19:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD986E8A4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 19:48:46 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id n24so5205111ion.10
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 12:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M9r6P/TUxb0E3FmM0klJiSdufzbjU3qGMGKgnCkSAmo=;
 b=rWuumi0cfmaz+Lq5UB6OEufM3QFy/niE09oV2rgA+PbfiPEOoK1hTHciBG5KeN8SF7
 5Z5Yz6e4Q5afb33HPogWx8soUhzsU7hw8jofc6CqRO4tF28CHqXlBccSapfdRl4vdzP3
 LzsphsRQQLwYpOo1HaOWAKmHE6pbJOLERiYf3n2lZXh54MfZJj2O1i2COeZAM/X93cJj
 JCsT7q+7EKToEi6rVR5kd33yzvLgxyfVzx8hsyL6QIXPwmFeJhLSimjVLx6w4jyBtyHq
 RHCU059H60HONmAFsjzea/Lo8TR+TyvC3YpUUPm5xuEgljFczvB2K2VzptjtTB20kaup
 XEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M9r6P/TUxb0E3FmM0klJiSdufzbjU3qGMGKgnCkSAmo=;
 b=Qo6Aemdd9TU/HlFiFQaTrKpnlg0hsYfxXMo6XXJZWK4CDAC+GEwURoo/5gkgSnxBE/
 VuRrHhxlkHop6GckuZ6zhmwaZbQrgv4y5BOCXS9Q/ZPGklbiF2kjSJyVlwn+SJdTtOOR
 l9/pWvUV70m5ZPTU36RjwxJTBmbsAPUBoiZ5w17h69QuIf0zjdy2kz6XZUHzoBjQGpGh
 mwlZGpO4u/6BphVDJyq9nYZp8a2Lp6x8+vdgLMRbOaM7x3tcdo9tMBoT3faj2qErdoeM
 S2/bB5UocverODgQl86Im8ajSMAH5yTAt/qQUDWAKoriuKE8cPmyHGf8Qqh7RSWwm9nN
 FXIQ==
X-Gm-Message-State: AOAM533A8aGeKFqeCDSta4berFVT67s8oUj0yIDb04FpLGuEbu2iQug3
 z7fYHVZNmrbrM3/xYDuUEVeq1KGsvhD6VG1H82Uy0Q==
X-Google-Smtp-Source: ABdhPJybUiZ/1aDkojLeaVirp1rPMj1gGTcE/+wAcvdKIseIFYTffMk7FQo9U8EsVQNVmvDuU4vmZXIsrIte7MMrQfs=
X-Received: by 2002:a02:cca8:: with SMTP id t8mr4919268jap.51.1630007325141;
 Thu, 26 Aug 2021 12:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210819124844.12424-1-yangcong5@huaqin.corp-partner.google.com>
 <20210820070113.45191-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20210820070113.45191-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 26 Aug 2021 12:48:33 -0700
Message-ID: <CAD=FV=Xu4WoQ=cTTQw93NaT1=+QePmDSYQ+4oDAjLnrNAdMx8A@mail.gmail.com>
Subject: Re: [v2 0/2] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
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

Sam / Thierry,

On Fri, Aug 20, 2021 at 12:01 AM yangcong
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Compared to v1, "pp3300-supply" is removed in the required list:
> dt-bindings: drm/panel:
>    - reg
>    - enable-gpios
>    - pp1800-supply
> -  - pp3300-supply
>    - avdd-supply
>    - avee-supply
>
> yangcong (2):
>   drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
>   dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
>
>  .../bindings/display/panel/boe,tv101wum-nl6.yaml      |  3 +++
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c        | 11 +++++++++++
>  2 files changed, 14 insertions(+)

I've been keeping track of this series since this panel is supposed to
be used on a future Chrome OS project. It's quite simple and the
bindings now have Rob's Review. I'm happy to take care of landing them
in drm-misc-next if that's OK with you two (since you're listed as
maintainers in the bindings).

-Doug
