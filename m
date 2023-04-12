Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FBB6DF607
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF1F10E7CC;
	Wed, 12 Apr 2023 12:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BCD10E7CC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:46:53 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id u13so11651272ybu.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1681303612; x=1683895612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWtoyznG1jQkJXfGXISHmoZv7o88ByGk3CRzyfAidPo=;
 b=kooJCqe3s1gvURM2TKNxBimViUpe0FDLMmTwy2USCZOZ/skDKBeGg2Gu1N2gfd59mU
 JEDuLCa00CT0/bxmx66XhEAld/rihJ/E8pEm2itgFYFRYjO1bSx4e+/TC0u31eiw55qi
 HkXg2o4PxJYq5WXVuexUxfiLcsZZ3eo+JkNyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681303612; x=1683895612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZWtoyznG1jQkJXfGXISHmoZv7o88ByGk3CRzyfAidPo=;
 b=ezU09TeWK7bGTkw09IOgC7A39QFAJYXLvBZdiudb9NFacWfMT2FUnb4mV8G8ZSg/f7
 PCfYKls0J3111faRoWvBrSNWWB2Ih4yJvJ54fHbYs05bupsmQr641chgnwnMiMEBgoqV
 G39jTG4Q/h3/tUwgqJcW8bFi/oubp/0jCCbfnIRPbvGI3PgyjsUvBFoW5b+xol1ysjD7
 /ZhVgwqKnY8gSbASG7dx0r9OSs052MGTi49tBTXCkHBX7Byk3qaaxvG8ZpfWkPdIb4le
 xuEuzl0t+sr6nQLXpb9z7rCk+3Fgl9v+wmdPfqM/xnPPgG1AwwyOyZeteBiDkobiTw2z
 XcXw==
X-Gm-Message-State: AAQBX9eoiHpzN7ZiHgQb6xQZ44gnHBsf3Tz/P9HH0C5vZnoHhLreWGzd
 ErX6MKbbRrbQoil4pynj1YDESBdCXO0Fa/qEU+7oTw==
X-Google-Smtp-Source: AKy350bIuLlcFpO7COINKvAhvizXXewfh0siMk180T25E5fGREj1bgFu8ITSLShoQK+OoRRlqZrkKQRntAzuXmCXhRU=
X-Received: by 2002:a25:744e:0:b0:b8b:f61e:65ff with SMTP id
 p75-20020a25744e000000b00b8bf61e65ffmr3945980ybc.5.1681303612127; Wed, 12 Apr
 2023 05:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230412080921.10171-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20230412080921.10171-1-daniel.vetter@ffwll.ch>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 12 Apr 2023 18:16:40 +0530
Message-ID: <CAMty3ZDVNq++AT0q8Qzd3PYerUV1eRaoipb-8PDJhE=0k6v6nw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add drm_bridge for drm bridge maintainers
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 1:39=E2=80=AFPM Daniel Vetter <daniel.vetter@ffwll.=
ch> wrote:
>
> Otherwise core changes don't get noticed by the right people. I
> noticed this because a patch set from Jagan Teki seems to have fallen
> through the cracks.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> --
> Jagan, with this your bridge series should find the right people!

Thanks, Daniel.

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
