Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5312BC0195
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 05:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77FB10E17B;
	Tue,  7 Oct 2025 03:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NZtWDNhy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D0210E17B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 03:32:09 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-854fcb187b2so664578085a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 20:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759807928; x=1760412728; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zRzHTOaUOkmAyAaBLcy9ebM3WJuX4bDU8dGAYrN/H78=;
 b=NZtWDNhyWuW23Hqr46GQme5ifdbSX5ZnGdY9aIMR9WxPPxOWli8aj6er84AUL0SzwO
 +YiE/41LCv8gLcZCWoaF564CDuQHcK22o+40jzJ0JCM5CaO1Z+qjTwqGLyrnvBTRzWWt
 faV04/Hi9luZlpSjrPt/aABGPKmOLc58Zu6ccTjxZKX+qaRyXe2OMFEENI018Ld7Vpn5
 CALlslnCd7akk1uIobWk8To+hiy+s5ixqi2wIAPalNqSIcPftNyuPiFJ9ZfT7Dwo3RhV
 47LthBxV6bz3x1dcHRR8d5CY0Bef2F2zuEG7hieLNdluTULD0/iwMbiATSzNbyFZ5lIB
 4SqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759807928; x=1760412728;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zRzHTOaUOkmAyAaBLcy9ebM3WJuX4bDU8dGAYrN/H78=;
 b=jVm8fUtWWxmKwY+ccEzSfdfFq9P4blyAHVrMaBqk7NKsmPfCBvC7UqmrmRPGwyPd/W
 aJEaGxWkUHOLR8C0HI8zS7P3ScenAgWHE6i2f2k6qoERCXVi3Rzf+8qzZRrw2ain54I5
 lowbao3rm69PQV3b+ssIxIx6081k9mNxYmo7q/3cXkj9E7JLfgF7RWO26TgJOmeyKryu
 JjMpWG8U1wBtU7bmu/8B3gf72GV8PW8U9pzeXeCGrJWgmgpnKUP2gTkeaslWDetjuAYL
 lsf21GhXlq/DykbZdnsdLZIw0ivO9agCqQgNHEbAdmAX36VnF7+a8mMtOLJf1D/8VZFj
 0teQ==
X-Gm-Message-State: AOJu0Yz1DwSLDEJS6COTB8ytGN1Yqizt1FDlAOf8MA3y9hawzL09ynCn
 SgpOKsOZVabArkSKklmNF1zsIvMj1Q9phhIiRIzaPpPlx+2OIzeyXYQOII8gIzbaP3aGjK+tJKB
 URMOFAf/cHzbzvMiYQshxyaM1dqK7b/g=
X-Gm-Gg: ASbGncsFKwLUsRz5ll4dNuMZCCaOhhD4WB2SUwyemgGHERybTmTdM5seAxwykLG+R6a
 kJpyFJS4acpsBz4pEqQvAcFdSYIPufVx3whwbbN5WKKuCQ2e06Nn7+muzw2O1n1mS9LuuwW4ANQ
 OxWk8BbEhB4j+2AFj+GYbwWXfJdHBru6tVxo70/T0EmUrN7E/TWI7COIgJGmSSXHSMHDG0Zh5Pb
 RJ/DEF9ql/wyAN1kkKk0qJj7uzNrA==
X-Google-Smtp-Source: AGHT+IEpV14RL2FDsGLZyWsYzLwk0c6mVnvsVP8x5nUj7rkZ84ybVA4iHya2NADISw8Upf+hl7gLAv/cl3rlYPXlTAY=
X-Received: by 2002:a05:620a:4887:b0:7fc:e0c1:7d47 with SMTP id
 af79cd13be357-87a36b52d72mr1691776885a.8.1759807927766; Mon, 06 Oct 2025
 20:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251007013207.1469618-1-airlied@gmail.com>
 <d57eb562b87f9c3ead50acc81d76526e947d0ab9.camel@nvidia.com>
In-Reply-To: <d57eb562b87f9c3ead50acc81d76526e947d0ab9.camel@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 7 Oct 2025 13:31:56 +1000
X-Gm-Features: AS18NWAbfxuGZTHfcg1oEvdaXw09W5TzI2ErtFzo1aet-N9hObQxjdaSM2GFK8o
Message-ID: <CAPM=9tx3Q4NdAc5NDGUjdjOH-ZPagKNu43+zOUZTVcpEO9zSsQ@mail.gmail.com>
Subject: Re: [PATCH] nouveau: add option to avoid 535 firmware in initramfs
To: Timur Tabi <ttabi@nvidia.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>
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

On Tue, 7 Oct 2025 at 13:29, Timur Tabi <ttabi@nvidia.com> wrote:
>
> On Tue, 2025-10-07 at 11:32 +1000, Dave Airlie wrote:
> > +config DRM_NOUVEAU_570_ONLY
> > +     bool "Only support 570 firmware, don't add 535 to the initrd."
> > +     depends on DRM_NOUVEAU
> > +     default n
> > +     help
> > +          Nouveau can support 535 and 570 firmwares, but that means both
> > +          will end up in initramfs, bloating it. If you can guarantee you
> > +          have the 570 in your distro or install, enable this option.
> > +
>
> I don't like the idea of using the specific version number in the Kconfig.
>
> Can we rename this to "DRM_NOUVEAU_LATEST_FW_ONLY" or something like that, and Nouveau
> automatically only supports whatever the latest version is?  I know we probably won't add
> support for anything after 570, but we might.

We can't do that, because if we moved to 580, and distros have this
option on for 570, they would fail unless they had the 580 firmware,
so it needs to be versioned.

Dave.
