Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3913A70E719
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 23:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF54610E4DC;
	Tue, 23 May 2023 21:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D670010E4DC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 21:05:12 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-33828a86ee2so42045ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 14:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684875911; x=1687467911;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j2Nz3y3qoiTuBk9TgDabiliDyiqWiXu5FrWlJdz9mKE=;
 b=ONgWeoapPdsXjtVlfZgOTY0YX7WN84kwZ+lxvIZ+Z4JgI0d0KEejBZHFG14bnlJ8Q+
 LZeXd5pYKxQT6vTp4kKHY+jHAhAZi8/eoyCBQRuqWVxLQJoqe3fxhEpjMLOmJ0t4EV5O
 C113c5SM7jQNkt7uGolh64LfDpkgaTWEJgX1opjbWVEySvF3wUojSBVnrGtP/tEFCq4p
 m4LMDyEPLJwS7ZciKAWcb9dX5wnFmi6JjZfCCScrpUDy2m0JOawJU844QlTAVLEcMsck
 FxZKf03dsMlrbic8t+xD8NpLBtvkNXlX85QjS/kETmPvBM88UyGkRopycXAYOQ0k4qtV
 w6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684875911; x=1687467911;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j2Nz3y3qoiTuBk9TgDabiliDyiqWiXu5FrWlJdz9mKE=;
 b=EIxomDPJZuJ3zgf/kJgr9T7QP29WkvtrCcHR7V31WaP1tPlGUzcaPahNSybMZsp1Dt
 HgZO/w6mY2Ebd09gQcJ+5JgvPZhVLWRO1MWQhS6xhwLJLuuwa3CScVCDMPosyVC8ee4Z
 xiNkE6XllAFqcZdLKlMAwRKdC+0ug5RqfhW41bSTD90kn6TZ/kKDTEiqjYTuDMYK928R
 4EwWhoukwephUcZt428Z61MklzpqGhQ3X1uaB3HbWAXYs/Dg6D1136FFICsEPN8oiTKV
 yJTei+bo5E8xkMyDcLPOnw76HYkQuhkCbz9JEMDDwXkKDiBb9rG7QX7sAZYhyPHjY6qf
 qKqw==
X-Gm-Message-State: AC+VfDwaYjeKKdv5zl6iKFaWqw6xKmbJbx3kR96dzfXX4hk1By7URTti
 YyN8OIYIDOnyEgJSTSCtyyQ1owE+o3l9oTNtbRUoKg==
X-Google-Smtp-Source: ACHHUZ7Txm8nqQaZy6MgeGTbwmpy46SQwfW06R6g1Du+QW7rpPJydUuYPp9gS6UClgiky4qhjuFMErdp4zPAfwqP4vc=
X-Received: by 2002:a92:cda9:0:b0:335:62cc:3972 with SMTP id
 g9-20020a92cda9000000b0033562cc3972mr41564ild.19.1684875911458; Tue, 23 May
 2023 14:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230519032316.3464732-1-yangcong5@huaqin.corp-partner.google.com>
 <20230519080136.4058243-1-yangcong5@huaqin.corp-partner.google.com>
 <ed8fc8f2-e5d8-8e08-dc29-e1197c911571@linaro.org>
 <CAHwB_NK8wKaXw6Gy9CFnsZB0XrqokiHGXoMNAzd0R+myYg4gxQ@mail.gmail.com>
In-Reply-To: <CAHwB_NK8wKaXw6Gy9CFnsZB0XrqokiHGXoMNAzd0R+myYg4gxQ@mail.gmail.com>
From: Doug Anderson <dianders@google.com>
Date: Tue, 23 May 2023 14:04:56 -0700
Message-ID: <CAD=FV=WRecTWsFM96k81YAx1=jJT0vpS4EPP0ZfWFUGHNFx9Tw@mail.gmail.com>
Subject: Re: [v1 0/2] *** Support Starry-himax83102-j02 and Starry-ili9882t
 TDDI MIPI-DSI panel ***
To: cong yang <yangcong5@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hsinyi@google.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, May 22, 2023 at 1:01=E2=80=AFAM cong yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Hi,neil:
>  Thank you for your reply, it's not that the polarity of reset is differe=
nt. The state of this rst needs to be high during a certain period of time =
(when hid touch communicate,). I have tried to set the default property to =
high in DT, but from the log and waveform, the rseet single  is set to low =
by boe_panel_add before hid touch communication.As shown in the picture, rs=
t needs to be high before hid ready. Datasheet: https://github.com/HimaxSof=
tware/Doc/tree/main/Himax_Chipset_Power_Sequence

To add some breadcrumbs, I think the issues is that panel/touchscreeen
are intertwined and really need a solution like the one proposed in my
series:

https://lore.kernel.org/r/20230523193017.4109557-1-dianders@chromium.org

Cong Yang tested an early version of my series and indicated that it
helped solve his problem. Presumably if that series (or something like
it) can land then we'll unblock the ability to support this hardware.

-Doug
