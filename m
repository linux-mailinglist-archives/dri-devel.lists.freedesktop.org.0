Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1092B660B7D
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 02:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C85A10E904;
	Sat,  7 Jan 2023 01:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF93810E904
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 01:27:46 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id j16so3657216qtv.4
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 17:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YZmW57ZvRkRR4S/DXyoGDrnsp4/+X8umxttq9HRE8mw=;
 b=ZT39AOGH4oWdTOUwUMNz1C/sCmOKV8oI3/I+ZIQIT65hOVRjnbTbx/NqCGL+AD/Mmy
 sQkvFtaeUPVtoEvyIZClUSmQaI+xyqEBUWRiMC+ooXyWWVt6mZDnEw2yBYnZYKjn0OY3
 FxETHbWF0lc/oVngvKSRSXim4a5bVSRjedJ+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YZmW57ZvRkRR4S/DXyoGDrnsp4/+X8umxttq9HRE8mw=;
 b=e7NYXjz3tiQzczmtJAFflV/uHlxbnzjMOLt1AZK4+ew0CvvkBYFeVm3wACd4n6RLny
 HsBv4rpmMc8Dz1aAbhI9Twz9X8WJg4HaWUW5ZHocpJOMVHjkhyTGDgjmiNnP6vybbFCv
 gROlYlPRPT3HTr+gKtPUsWLaLqsfKwiME5zZvO/0N43c9blBPFRY7otIdUIOpjpy7XJe
 zyIDjuMGd4ciGAWhZ++V4xxky/KTmrUcgerRvH7jA9jom7LNBiVsaITxkvMynhidYsxR
 9qi15m5NUkJTWNHtCGp1tcWysGc85kvDkShvpwoWlKe7lTgyBldYanMYObXUz9Nu9RyG
 Ir9g==
X-Gm-Message-State: AFqh2kqUay4so4XKqoTl0SGcR2+IVzqv8RiVqOPAPv7TAtKzuTn8RcZO
 NRL8BsSMt2SN7CQ1hP0l+/k/RNOvRjavZ0Hm
X-Google-Smtp-Source: AMrXdXsZ6j4FQq/wr1AIQ+H86jhBtzHhmypWzDJhJsNAEgnes+9QpA5onki/ATEcHGKD+wXFKIKb7w==
X-Received: by 2002:ac8:4b44:0:b0:3a7:ff64:8c00 with SMTP id
 e4-20020ac84b44000000b003a7ff648c00mr72129383qts.22.1673054865779; 
 Fri, 06 Jan 2023 17:27:45 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 fg13-20020a05622a580d00b003a6a92a202esm1267948qtb.83.2023.01.06.17.27.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 17:27:45 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-4c3b4d4be98so25956607b3.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 17:27:45 -0800 (PST)
X-Received: by 2002:a0d:d912:0:b0:36a:d4df:c6b6 with SMTP id
 b18-20020a0dd912000000b0036ad4dfc6b6mr752702ywe.18.1673054864827; Fri, 06 Jan
 2023 17:27:44 -0800 (PST)
MIME-Version: 1.0
References: <20230106172310.v2.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
In-Reply-To: <20230106172310.v2.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
From: Brian Norris <briannorris@chromium.org>
Date: Fri, 6 Jan 2023 17:27:33 -0800
X-Gmail-Original-Message-ID: <CA+ASDXNBDkzz_xRDbE9gNZZN5kSfxksh0EN01_CxNgyog_BZOg@mail.gmail.com>
Message-ID: <CA+ASDXNBDkzz_xRDbE9gNZZN5kSfxksh0EN01_CxNgyog_BZOg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/atomic: Allow vblank-enabled + self-refresh
 "disable"
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 6, 2023 at 5:23 PM Brian Norris <briannorris@chromium.org> wrote:
> v2:
>  * add 'ret != 0' warning case for self-refresh
>  * describe failing test case and relation to drm/rockchip patch better

Ugh, there's always something you remember right after you hit send: I
forgot to better summarize some of the other discussion from v1, and
alternatives we didn't entertain. I'll write that up now (not sure
whether in patch 1 or 2) and plan on sending a v3 for next week, in
case there are any other comments I should address at the same time.

Sorry for the noise,
Brian
