Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A315B4676
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 15:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C1210E1D0;
	Sat, 10 Sep 2022 13:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A9210E065;
 Sat, 10 Sep 2022 13:21:54 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id b35so6465878edf.0;
 Sat, 10 Sep 2022 06:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=vJzFczFZc9R3CNJwUCT58m+YUaaboAVwGUQlhwHyv7s=;
 b=pP+9rBwcddf6Ij7ePgc97VFK6YzdlCy5Iem5tqefGl/87R97zu6uvr3scd4En6lZyo
 o/BCozqxPOylrNJh5o90pO0YhaS0tUDbbAp2rAKS73uqAQBhcU4eVjqy2DpggqYUx7GD
 r5LFSwwu9Z3A1IO7pQZ3IVE1ZH5ltyOS9kFaWcd6Suk++lRAwVgL+VU2QgoqGe4ySlFd
 uUhKf9X6j/na6zeI5TR3j7lRMIfsBdr6j3hpxMLPq03VynDhOYGUoEDDYOew4J5V5X70
 tb8B45M7E7h5Avnnz85/WU7rZKJbHzudmXSvfiXjiZfAVJvXbzcS0bYldfnhlEoBwX+U
 6zNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=vJzFczFZc9R3CNJwUCT58m+YUaaboAVwGUQlhwHyv7s=;
 b=8OcbVLaX6YO+UPQQuDvWufIY6r0YwGu+IVZAjvPL0SgbBkSip25apu0/jj624mGHdR
 0P+Z+kVG+7vsWy2AMLdRjzud/5/QYrX03RIaS8QFjzLNbo/3nKmASEpVAUYYZL3UV/X1
 iHVE1O9I3nxUTqgUqC/Pfs4oRoWNqLcntyhDTBnYoCym4pwTIGMkllsJjy2WvlPg8YkP
 dC6tz5UElnkpwbEiDwFoY8zxoXXWgPUVUw65hBkVXsy6a6FRPsJEQfmciyu0RJgYfoh3
 Rn/zoAKDEIbylgolS93BK/vmO+SsxPxuatyqt0zaGNtIjgzGYQr/UaXhUpoB1E21iKrp
 UBFg==
X-Gm-Message-State: ACgBeo1+c3GlkiYD2DIPSCql5A25DS8Ong30itVDJXWbBYEkjI5MXCnl
 To6rL/NwjUc/L5zzfD+hLNEdcEH2yW7a4wzXz+w=
X-Google-Smtp-Source: AA6agR6cUv8DD3eTP3TJ2HWUACrXJYFNCPKMPomKcfIxuuyuDQeVp06NiGkla9qLJQCWoEo9JODkOYhO0mn34hXzb7o=
X-Received: by 2002:a05:6402:f11:b0:44f:e1ff:801a with SMTP id
 i17-20020a0564020f1100b0044fe1ff801amr11457764eda.109.1662816113245; Sat, 10
 Sep 2022 06:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220909093000.3458413-1-l.stach@pengutronix.de>
In-Reply-To: <20220909093000.3458413-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sat, 10 Sep 2022 15:21:41 +0200
Message-ID: <CAH9NwWfmu-MOQ-u87ZkdBh+HWugWdaX=LWMcnH2dkBcaeLR1ig@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add Vivante tile status modifiers
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, etnaviv@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas

Am Fr., 9. Sept. 2022 um 11:30 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> The tile status modifiers can be combined with all of the usual
> color buffer modifiers. When they are present an additional plane
> is added to the surfaces to share the tile status buffer. The
> TS modifiers describe the interpretation of the tag bits in this
> buffer.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
