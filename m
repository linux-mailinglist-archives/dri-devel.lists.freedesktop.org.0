Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C7016359C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 22:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849DF6E41A;
	Tue, 18 Feb 2020 21:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5F76EA92
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 21:58:52 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c23so15693898lfi.7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 13:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ahpk/GappiCcM5wW00z5eRTm7XSNbwAT9p1AedeyQaE=;
 b=kdpjP80seFPRBqxhxIpalWncJhJycuWAQPQT0uf/BhAioMxpA/HQSrB4FFdQP+vo/L
 KzZMVoRXpw4PUTQavb0o6cZHHaGKHSVcOUgix+7f/NfUfAl9aCz7L0/IbtVECP3Hmx5k
 uQFJiRqinUNrrBdMEj/yIhEp3RBT2Uxd72BlqR4nMUwzHAyMKM7YPchqExAMmNWGqoBi
 Ph19zMTGlFHeCAUda62180ibnNyy2wl7eOxbVuLhU6Jsy9cLpevU3SYjCp9Zrk7UP43A
 VMce/XyzyXhUBuaWX2tdTaeUxZdF5O1Zs8APWnkdHzTNx1e2XTvdK45WjNKQLPXeMS0F
 1T4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ahpk/GappiCcM5wW00z5eRTm7XSNbwAT9p1AedeyQaE=;
 b=sqPOIPo4GS515kOlz4FbhKBHzE7+0zg6tPyRhUcQo3pEKKiOY8cxDJwMYOzE3QjNKf
 eyVw35zE9So+zfjPMx1C4fJSxP0YfC2GLSUt5fnH/bVsvZXkrQsHuCFcFWeMf7S2vjDx
 xu9GH/IavFUvcVEdt4z3JKtm6OzSJdxFVr5iyip640qFPE834s+bRbuOAO9iG03TOQII
 aw4dVw80ol5xXSWovV/S5tW75DszivYzNi7omwSrvq4Z1A+vp9Mi9JtjuYOqPinIt6vT
 ghB9uk/oiMr0MEMp4G65E4kqLJ/hV7l6i4TChcMqJPiRmA0dntrEpEVqmN96pHkXH/vo
 MB+g==
X-Gm-Message-State: APjAAAVVeYYRTuYh34rTPMTRujpmTzMEn4fYcjWzcbyVPO0KaTl9TZj2
 oWfnpJ+k+oWNvKWxcbItzRDv+W4lWpTOpPDTwcwtag==
X-Google-Smtp-Source: APXvYqwfJ/KjDHUqMyRYTcya4wxUGjDyhjQGBQJimj1/3xX/vD0XeMTB9CXlS07iJHjcgr5dOlc5NuiOgM8QWSquNew=
X-Received: by 2002:ac2:4214:: with SMTP id y20mr11460778lfh.212.1582063131075; 
 Tue, 18 Feb 2020 13:58:51 -0800 (PST)
MIME-Version: 1.0
References: <1581705404-5124-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1581705404-5124-1-git-send-email-jcrouse@codeaurora.org>
From: Eric Anholt <eric@anholt.net>
Date: Tue, 18 Feb 2020 13:58:39 -0800
Message-ID: <CADaigPXdn84cR0Pu-uLnCwOVHNUiOi_t6u7OYYDU6tkSvdWp6A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a5xx: Always set an OPP supported hardware value
To: Jordan Crouse <jcrouse@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 Wen Yang <wen.yang99@zte.com.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 10:36 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> If the opp table specifies opp-supported-hw as a property but the driver
> has not set a supported hardware value the OPP subsystem will reject
> all the table entries.
>
> Set a "default" value that will match the default table entries but not
> conflict with any possible real bin values. Also fix a small memory leak
> and free the buffer allocated by nvmem_cell_read().
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

This does fix my warn at boot on db820c.

Reviewed-by: Eric Anholt <eric@anholt.net>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
