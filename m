Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B4F91EADB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 00:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174F210E065;
	Mon,  1 Jul 2024 22:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AhfOqK9a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C7A10E065;
 Mon,  1 Jul 2024 22:34:51 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a725a918edaso529781566b.3; 
 Mon, 01 Jul 2024 15:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719873290; x=1720478090; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dDZkEA5Xw/Sp+Sil7gF9E8mjtngb6x6DnZd0K/Gw6BM=;
 b=AhfOqK9aepI9fuxy8uWyTzIr2wb5Pn/16bCCKVrNadatGrtQ+DMhBXVC6i7uqP9Duf
 bw7xl/8mTsE0FJeiI3l89iZAowT+0aK6fVmMlm6wuM+prU1IBBs3XuvsdAWwOus2ABOv
 LHOC5jxEZaeUFFwoYLkMx6lqIwpF3tbqNwAICFSN5Da+Wfkl85HQE9zdXc3JO0zt2PZw
 v09fGxu++dVaCyy2s7IPaV6wZHhhn5AhOJYuoj254B113hirO77Smb0F4VStSkmj2+FU
 RP5OiyBOC+2HpYJGAG0na3hD+Z1jazo456W69ii/0QCUANT9mjQc88l1HqGVp3GjnU0c
 /3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719873290; x=1720478090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dDZkEA5Xw/Sp+Sil7gF9E8mjtngb6x6DnZd0K/Gw6BM=;
 b=MvWvvdgQBCawuwDkXgqVsD55a27BnoyHHba2Xi0Ibor2LevVBAG1YLr9NbGe/EF6X5
 AlYUIMXYiUIYHvni/Za9YFh5S6Puk3830sr8Ku4BVlHbC3x40h2bIOcSRHpJV9BKtpS8
 aUUjCO1lUeR9oA9uobBbchpF8D8Jm2sMpcMjyskeRq1Is92t9JGYj5oP754U8FIYzNZR
 H+7Vy+CScEKFuTAtfQ30Qs5cKfLG8LBonBOMcFWHipF48Mvdzrl59nElB4HoPL++YCzV
 wlwJ61jtCgmB1LRTtRM5Jyso5RjtrmlygQKr4WnBwx7ZArkRw+OjO8ApiskAslZbJ6kE
 bT+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCGbRWODvUDhqUtZ6FljTbkzgRcQHa/GcomS2byRB/l30VTzEV4Sd8xXhUEm8NAecqIF7UadSaVSaqioAXYnTVgs+EXd2ptKwgkA8NvW9pvVlGkdhzKZF1Qh35Uq4DGU+1XPd8s6tmAMAWK2Io1w==
X-Gm-Message-State: AOJu0YwqzjbFWdf4DWurq6kqMB9YIk9F0jzrA/Kn3BpOMWQm8ijZyMfR
 QCGpB9fOabGWs35fKVUGdJt/ZIwJ3r3LZT2Zyx/jpH1QpKZUY1YfZZNcFV2sBdKzfxdN5Ez//kc
 gD8Z9STXA6HCHxzSN3S/GOZdKIPI=
X-Google-Smtp-Source: AGHT+IGDYQPH72kLApzWQipmEC+sdBkOt/X0x5q0hPUEBs5a0NGCXeLOjteGz2HCG46xtab/yxkP4K87WE/k2Jo1spU=
X-Received: by 2002:a17:907:3e9f:b0:a6f:50ae:e02 with SMTP id
 a640c23a62f3a-a751446803fmr643722266b.4.1719873289405; Mon, 01 Jul 2024
 15:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240606020404.210989-1-mario.limonciello@amd.com>
 <20240606020404.210989-3-mario.limonciello@amd.com>
 <bc1d81ef-d9d0-4440-b63f-ecfb735ef783@amd.com>
 <d637d3c2-34f7-42f8-acbb-6a1730d3fc3c@amd.com>
 <CAFZQkGy0xuuUw73HQvS8Ce92sUi2rVrRnX25pi1KdNmyQbtBZA@mail.gmail.com>
 <CAFZQkGz8DeoiVX2MohoBoTMxraJk1Ou41N_wKP3GkqRrPg_6sg@mail.gmail.com>
 <49d70214-21e9-4547-96a8-ff168d922eaf@amd.com>
In-Reply-To: <49d70214-21e9-4547-96a8-ff168d922eaf@amd.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Tue, 2 Jul 2024 00:34:37 +0200
Message-ID: <CAFZQkGyr6aupS6vzHc1=eHeFnA+t-yvvpQMD-4kP45Hi3a=5Qw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/amd: Add power_saving_policy drm property to
 eDP connectors
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <Harry.Wentland@amd.com>, 
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@google.com>
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

Am Mo., 1. Juli 2024 um 21:02 Uhr schrieb Mario Limonciello
<mario.limonciello@amd.com>:
> Hmm I'm a bit surprised the IGT tests I did didn't catch this.
>
> Are you working on a system with two GPUs by chance (like a Framework
> 16)?  If so; can you try the "other GPU"?

No, I tested on a Framework 13.

> As it seems your PR to span 3 projects and I've never built KDE before
> can you spit out some artifacts somewhere that I can have a play with to
> reproduce your result and find the kernel issue?  Arch pkgs would be
> preferable for me, but some RPMs or DEBs are fine too.

Here you go: https://nx44777.your-storageshare.de/s/2j4Jy5anDwwzCtF
and https://nx44777.your-storageshare.de/s/2rxJ4Tp2L8gdc8Y
You can set the drm property to "Require color accuracy" with
"kscreen-doctor output.1.allowColorPowerSaving.disallow" and to zero
again with "kscreen-doctor output.1.allowColorPowerSaving.allow"
