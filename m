Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD62F5A270C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 13:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9171810E622;
	Fri, 26 Aug 2022 11:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C0410E622
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 11:47:44 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id kk26so2635756ejc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 04:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=6I1saXwykcy6QayrIDGL5n32r08at8PoZmfVUTcYUCU=;
 b=X2Fmrrv3asyl2W5nL1jiASlsERZ0mKPSNWIwo8PhVQ45WlvZUrFHDb7DPqb1185Mcs
 0z0o4jS394BMi+2ciyqOriJzpAK9hyPDkFdSJ+F4j/rWXNPZNbH8Gf++gfvDCQVEGhdh
 inPE8COluT9LpiHfaQRCKs3roYaZF2h5piAg5xdW7HryQ5QQnfPnT7WsG0J3uPmeCSJ0
 51wdyeu4IXh9etE96mcyB4PYI1ykou3wh41TxquW8+FATgxjU5mCtCMio3g9oWQURMuf
 wqnndLhihzxwQouxqndndmbqYwMTdMPqf5hGRnhuzfvPHxYCXibzrWis6BgU7xfbajvx
 5zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=6I1saXwykcy6QayrIDGL5n32r08at8PoZmfVUTcYUCU=;
 b=0m5RyRc+8ri246EYAo1SbkQq3U6dNUwbrjjMDrWcq7w6uw4nybV8cMofb9TMwr1YXj
 QxfFRTYTySIC0MC+ESFOOGDkpUz0OamXTX0+OsUAHR8I6XfMhGhsuHxCDXa66Q/TKRt7
 h02xWXH1Nj3fuAtCYBuMM97WbJUoYccfA4W8P6IVlmaHAdaK6LF2mpKxOsQSlAyzVEl7
 hCJfjjmvxnbrb363Qthyz3oSOuR8air6rOlY5t6tD6Ta7GQOGfGOfCJ2Jz4QPIu8gnTf
 D21r5Nxwu8vf6ZtcTnoIMT9oEjre6V4doSDEYFZy6cIRTB/+DQRAYgKSbe/RFhR4fLWI
 pPhw==
X-Gm-Message-State: ACgBeo0MYK2HZWIuKgXAwURb53lHr6UaU5wFkSxLypXo7Cm7Ek5cZpc0
 mjpYoeEkvkU8ZqGfsgqzwf2q7FhKuIZRTUBkUHhopQ==
X-Google-Smtp-Source: AA6agR4b4g6N1PbpW7cvmvO/x0YA2aTRLqfpsYqXh165oRYCKTU2oImycDVfMp2rZsEx3rrMZIY2UqLFUuMUPdk0jWA=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr5381175ejs.190.1661514462901; Fri, 26
 Aug 2022 04:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220804114105.41326-1-wangborong@cdjrlc.com>
In-Reply-To: <20220804114105.41326-1-wangborong@cdjrlc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 13:47:31 +0200
Message-ID: <CACRpkdbh1W4E=aq=+pApiiBWhRyASuk4iHDEmu38xssht-4h0A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: nt35510: Fix comment typo
To: Jason Wang <wangborong@cdjrlc.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 4, 2022 at 1:41 PM Jason Wang <wangborong@cdjrlc.com> wrote:

> The double `the' is duplicated in the comment, remove one.
>
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

Patch applied to drm-misc-next

Yours,
Linus Walleij
