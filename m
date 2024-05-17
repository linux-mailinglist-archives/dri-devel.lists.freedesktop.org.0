Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2174F8C8D3C
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 22:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3E210EF5C;
	Fri, 17 May 2024 20:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dIgAKZ11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596F010E23D;
 Fri, 17 May 2024 20:15:38 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1ed0abbf706so18695185ad.2; 
 Fri, 17 May 2024 13:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715976938; x=1716581738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xfVKM6yCHTHqqF0MjeIKbFzobNgOfi1RcCAO0pIjbd4=;
 b=dIgAKZ11pfGMTOGkUzMM2hpLzK7LR/1QDe/I4XOLLy7FF+vkNDa2gYRT1OOQjGyScs
 dBQhO6wMjxZ/2iOpd6QwTHk97AXnAcAL/Hdwdqql/Q5db4kOgs70WqSFGnkF1jJH90zH
 HjTHWKwULBEfU9xoypHQWhbznd3N1zpp8r7pEVRKE15texsvJdE7hhYow0YnitDB1f+8
 Qf127tWAtsL+GhZyNbtFqk5u9rb0HdtuHwmF3rLIpbe0KFQQ3Ben63+8uvTRG19sunnK
 6e8TB43gOU/tUc5KwB02usVLNtMUNgMDJUsjoE9SUzriz62/YlacTNQAlisxR5xuucq/
 NI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715976938; x=1716581738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xfVKM6yCHTHqqF0MjeIKbFzobNgOfi1RcCAO0pIjbd4=;
 b=Fl7Z75U9Hx0KVqdHmYI7mx3bObAMxhcRkYmy6Amldn/1po0T545BFlVV8nrnSONS3d
 ChFntoS9ISW5cLbAQ4yUpWM2So5fb1UsthI/vgwB8EQi8ATCZe//+SWFgJ8xGVhnllsx
 B1OrFOnkqn+9EleMsnQ9bMzdVuBcsIGO64XNC8Kvn2df1Q0080LNfoOepM3+7MQHGED9
 sb2lwlKvFPBaudYv4CsRw9aeAqqTQdpsEnBzDDPwg6Ndm3G6At2evntTj2Fc/dKC1gnE
 xiD/VbyVTRkT/I17LNZld2Rnc/oUcWFbFIK6wcWEqM+LBb6SkdqjoOZBgFGAJ1zkTfoj
 8sqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoNd4z7rx3ifidcxNALpUAODzI1Jhhnp48oRmNnDm8IyYZdgjDxEo8+z6m7zQMjMmzdyKCBINp48WKfiEZ6O9kW1oWaZXiXkDbmqrM5pbBAe7EWMDpODHIwyJ0ifan9pOXeJqm4GVEaaMw0Nob+g==
X-Gm-Message-State: AOJu0YxnpJ1R/9b4iP1TbS9IRAbrhxJz7Vgxtjefx0IPBdNUNkHq028J
 /AJnCJMIAvp14Y4t+PrLDdm0RXwXqmQ6ZXf7QQhS8PCgbBNlOEjtA+inAWok4ixjL3v5vMJx+jm
 V3gGFc0QxcAp0lWL+0Lrx0vWk3jY=
X-Google-Smtp-Source: AGHT+IFZwP6rWy44FU4rq3UxXiUaAdkE55laBfEUdUNPOu8ek1f785nnafJHyUKHdP0NMIfhhm7Dg4hKjJktCEChsrs=
X-Received: by 2002:a17:90a:7d0e:b0:2a2:ba9:ba61 with SMTP id
 98e67ed59e1d1-2b6ccc72e91mr23681441a91.34.1715976937752; Fri, 17 May 2024
 13:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240516115721.1.I8d413e641239c059d018d46cc569048b813a5d9b@changeid>
 <9dd1cfd1-fe13-4434-a7cc-e14113dcaf53@amd.com>
 <CADnq5_NGLrrFmFHFX2bC7naByJGofEiYQyWvRP6CO4BDFo52TQ@mail.gmail.com>
 <CAMaBtwFQxeARGyhVxo+WsYCHgmJNJ7ThjtPcFv=LZqRNJtVxsw@mail.gmail.com>
In-Reply-To: <CAMaBtwFQxeARGyhVxo+WsYCHgmJNJ7ThjtPcFv=LZqRNJtVxsw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 May 2024 16:15:26 -0400
Message-ID: <CADnq5_MnsAEk_YsyMjaDH6G406E4=hQvMtOTU5xh5JeZJE7kqw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove GC HW IP 9.3.0 from noretry=1
To: Tim Van Patten <timvp@chromium.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 LKML <linux-kernel@vger.kernel.org>, alexander.deucher@amd.com, 
 prathyushi.nangia@amd.com, Tim Van Patten <timvp@google.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Ikshwaku Chauhan <ikshwaku.chauhan@amd.com>, Le Ma <le.ma@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Shaoyun.liu" <Shaoyun.liu@amd.com>, 
 Shiwu Zhang <shiwu.zhang@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 17, 2024 at 1:27=E2=80=AFPM Tim Van Patten <timvp@chromium.org>=
 wrote:
>
> > Fair enough, but this is also the only gfx9 APU which defaults to
> > noretry=3D1, all of the rest are dGPUs.  I'd argue it should align with
> > the other GFX9 APUs or they should all enable noretry=3D1.
>
> Do you mean we should remove all IP_VERSION(9, X, X) entries from
> amdgpu_gmc_noretry_set(), leaving just >=3D IP_VERSION(10, 3, 0)?

No, just take your patch as is.  All of the other 9.x IP versions in
that check are dGPUs.  9.3.0 was the only APU in that list.

Alex
