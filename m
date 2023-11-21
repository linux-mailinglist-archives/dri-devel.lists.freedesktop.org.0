Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD617F3A7B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 00:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3052A10E5A9;
	Tue, 21 Nov 2023 23:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3E110E5A9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 23:50:14 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-daec4e4c5eeso5619532276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 15:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700610613; x=1701215413; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/l06aWoK25tymroRAN5LfyNnos2Y6Vu7701TLiI0gjY=;
 b=RaZi3haXWaXuYAuU3yGBmrNJdVXhaWY4nQWebL2qgXgoW4STmcdtPzZEUcSK8k96FW
 jueVRrtkf/V2b37QoU1Zl1Br9HAVFh48T8miYU+dhqZyubTx+LbqKBY0UwcGee9rqOv6
 NQLEo7sCTj582s2FAdBOMaKedfVhXQQ3j8MX2twjqI8bnu29s/P9fpSnfAE7XVc4t4H0
 aEVk8ED6cuAdm9+scacRvCWMbrd4sfiuYAxyU7GTWCdhpH1SPSJAjo5Na0XDY3sqGPXP
 S3qbQz5bbLV/G1Stk4dRTSfiqXCCmmN08jSilFrv2xZmRnYMWzIS/804EJ8lZ98/i2TX
 M2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700610613; x=1701215413;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/l06aWoK25tymroRAN5LfyNnos2Y6Vu7701TLiI0gjY=;
 b=e3eYA2RfYN2aT5NKOIlDLnS11LoyyG2MI2jjOwuu6QxHd19wXInDyj8TbM3+zhF4T2
 g2L06qqf3EV4JsDWiBhus76UIoV5mQI7SygGPEwAk/Q0OWe2ltzW/GkXdR6uDjqlhXS2
 dK+RvyS1WVtcL8bDa1fSlXcjRUrGd371AlRBO7hG7HGeRqsy3/qcYTNp3GM7a/WZwlkx
 X6Gb6gL6an7hfIqurD1I3zV+TPZQDtkOfEOrBZfJjk+orYydkrWXXbXoNsjNFm+JytIU
 SdPzQp2LINaUI/ZTvDddI8bGOTt8qHxg2zGCRBJhb5PhBTpaJdUVeDz6EDf2h8Ijl75g
 yiNA==
X-Gm-Message-State: AOJu0Yycm9UE3jnsD07s0K4ibz5nS1R+3UzKjR4JubnxMIo49SoJjiRJ
 WUzxwblb6ADCSYAZRQs2GA1IPx9LHOkSxO3ORZQ=
X-Google-Smtp-Source: AGHT+IEzzuDV7yVqOAYdb8QTA+Z2UBeO8W2J9fCl1SqDbEuSh3wlQ0jjreshbPUr2xeguit6WfU/uRSs5USbXzR8O9Y=
X-Received: by 2002:a25:3489:0:b0:d0a:8973:b1c with SMTP id
 b131-20020a253489000000b00d0a89730b1cmr508381yba.12.1700610613318; Tue, 21
 Nov 2023 15:50:13 -0800 (PST)
MIME-Version: 1.0
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-10-tzimmermann@suse.de>
In-Reply-To: <20231115102954.7102-10-tzimmermann@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Nov 2023 00:50:02 +0100
Message-ID: <CANiq72m8=KMin6Hck1XouqC3bV3oBgBxj0Qb4HCXsOjgFdgKjA@mail.gmail.com>
Subject: Re: [PATCH 09/32] auxdisplay/ht16k33: Set FBINFO_VIRTFB flag
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>,
 deller@gmx.de, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 Miguel Ojeda <ojeda@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 11:30=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> +       fbdev->info->flags |=3D FBINFO_VIRTFB;

Is the `|=3D` (instead of just `=3D`) used in case someone adds something
to the flags before (e.g. `fb_bl_default_curve`) or due to some other
reason? (One of the other patches uses `=3D`).

In any case, if that is intended:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
