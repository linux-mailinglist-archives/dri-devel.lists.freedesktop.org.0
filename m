Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DBB35875F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 16:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EB66EB16;
	Thu,  8 Apr 2021 14:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B4A6EB16
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 14:45:18 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id r12so3505568ejr.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UiAst+OVExzFrYgr0Ac6llHp4XJRNyzdkv1JER7eoV8=;
 b=q30UFfS5EfnjnF4XSmWJqH/ubPkHWloYQm1hO5l/KluDGQnAt33hAKbMx1e4wHtIGm
 xYrovM7HAcxDMRZzPc5Zqag1CazE9zf3WN9Yxu8ui1cJ+T9akCuQekXt0y1lGYC9JhXt
 d0s2DzFjYJ1KJOPO99GicUacplYOlfTcIlVqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UiAst+OVExzFrYgr0Ac6llHp4XJRNyzdkv1JER7eoV8=;
 b=VCi909wB5SI+BGRVuxzUDlsjD2TpAv7ce2hEv+PHhS5hursZCrnXHrU2widl529OST
 3mIx9HUTUbG/QfVwJmrIol8rBMtIFhSdmqdh1B3wT3fG4IvX4MdjUO7U4UWSCNXOy6oJ
 wlt/Ji7o21P6Tnuh1es7W3mB0HgAxizGzVoPYRST1JrGt62tuJ7qLokm1jtWzBuVPeit
 T8/h5L/iFczrSeaje6ZHW+0pymKV8Vrm0VZ3OGykDC5iLmiCShb39+tKZsDt2hvPfKaw
 t2z67ryp3bcQ+DeJGy79HkE24WKlIiQv8YEzovJ1eboDLnLtEVSFSuKj75LAtkeUlQKu
 QOzg==
X-Gm-Message-State: AOAM531EUcyse7xdQWAVQ47GVULgGN6ANWTRTneSkOABtJxa4dQpRoQx
 WtJwTekpdg2mJ39V/eyEAdNUYn3e+7Vp5AHC3ln3vg==
X-Google-Smtp-Source: ABdhPJxkofkeU6cyRKkyyI3iQigf422fSRi/Huh5y/CzNqKuxd/kSIXbN1JyWl5jEBUelSE/9fXnj0sk6h7waoZ1ICU=
X-Received: by 2002:a17:906:a049:: with SMTP id
 bg9mr10957487ejb.186.1617893116972; 
 Thu, 08 Apr 2021 07:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210214174453.104616-1-jagan@amarulasolutions.com>
 <d7f9b241-3cfc-836a-2519-3b6621899108@denx.de>
In-Reply-To: <d7f9b241-3cfc-836a-2519-3b6621899108@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 8 Apr 2021 20:15:04 +0530
Message-ID: <CAMty3ZBMt+bx7ZrCQf0b3wrJUtZVe3CS=8-t_wYZ4+=PwP+mbQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add bindings for
 SN65DSI83/84/85
To: Claudius Heine <ch@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 7:26 PM Claudius Heine <ch@denx.de> wrote:
>
> Hi Jagan,
>
> On 2021-02-14 18:44, Jagan Teki wrote:
> > SN65DSI83/84/85 devices are MIPI DSI to LVDS based bridge
> > controller IC's from Texas Instruments.
> >
> > SN65DSI83 - Single Channel DSI to Single-link LVDS bridge
> > SN65DSI84 - Single Channel DSI to Dual-link LVDS bridge
> > SN65DSI85 - Dual Channel DSI to Dual-link LVDS bridge
> >
> > Right now the bridge driver is supporting Channel A with single
> > link, so dt-bindings documented according to it.
>
> Do you know when we can expect a v4 for this?
>
> I am currently working on top of your patch set to setup a dual-link
> LVDS bridge of SN65DSI84.

Yes, I'm planning to send v4 this week. will keep you in CC. thanks!

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
