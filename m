Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C0C98A912
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 17:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926F010E2EE;
	Mon, 30 Sep 2024 15:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y1EqAvEU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A87F10E2EE;
 Mon, 30 Sep 2024 15:51:27 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2e0b467da03so788720a91.2; 
 Mon, 30 Sep 2024 08:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727711487; x=1728316287; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WATU2LUL4m9jJ4Aa98MIDs6l2qLx+EWO4m8F+EIqLxk=;
 b=Y1EqAvEUWOoFeWFdFwfKIh/HdZjnzfXyQyOKWL42jLhReecs0kvQ4AXp2wQCwjhuBk
 WMPlYeO78buFMC440e7Mi3IRsp5AUNgWSFvSDwvHZVLZKajW9NT1mghBWWQvcHgEd6hc
 +QoEURDNTzQ2CfKqcqL/a8zqvve2qdBn5JAEmBvEx5L1r0YAdnurx1TWeqfOc/o8ohBw
 VK8CG1l+ZVRxjJzoQpWL5QrKTw36AgQLf9G/4eo1OYMZmlB7B0cS5NInONm78wFOQDAG
 zTVPRfXPGeTL9jBeIAOu2M+TNqayKO0tGWjhJvJhCFfvEnhOXjHoSN6jQBanvGMS01Wo
 J1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727711487; x=1728316287;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WATU2LUL4m9jJ4Aa98MIDs6l2qLx+EWO4m8F+EIqLxk=;
 b=IXkNgBwuyolpGQoCwvARYGJt/A7QPXraCia2rAcEWsRK3ENjW2pTKTyqf3sVRZXlOV
 dP4Z34mrwPq206PlAk7v+msZy32Gq6A6HW013OR9ciuLadjRXbPlt4V7aL+R8jjp6z6b
 XMisZRaaRjk20yBIwIO0HvBTUDyvhOfxuLOQkJt1YZS2pYPGLmw7gFXdh0SE7puRtiqO
 0BviMTXofAdrrtFoc3sT2elNGSTrFFrWx+SkAdgu6VeUl0K0cSxpW3YrwYtRSBlVy0gB
 q02FUXveUMvIgoxjVfZf5vHUgM6OZio4ySYkxGKFl6ElDA0Yq/EALEhBZvvM0zIeifVo
 vQSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAcBSAhHgijuUd+DJvxRVz1MRdrzISUFiaASYvr2Ad+M4B6emXmV5Xu2IXekmsZLkyhu6KwBYF@lists.freedesktop.org,
 AJvYcCXrEBd2WxMkg1gNciLix+6nbRIcgLHoI2T+KmwaQUie0YtbpbNLp1VVDkFfVS+SERLWn0oQV9t7Wggv@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/fXmCA8+g0v/u2czlOmzAWgshJXCLKcWAmcHuDG2/TAFBtl2l
 P4vAiGqIQCzEMUe1ytuzkgEoU+32x/mU3OxJgsh1Sw9Xlsqp481E8fw0Oy/qmjEY3Tqueyup9tH
 AHUz1yC2K51rg2JRr7vIlqppzXUu57A==
X-Google-Smtp-Source: AGHT+IFy3pRmWmgHWpHGv0hrtSuJlpDkTjLMGNYiRP85LAIbiklgXtlTBb98vvOc2vKFgYVr4pAxxQk/8QByQ4oMpcQ=
X-Received: by 2002:a17:90a:e548:b0:2e0:8c23:fe5a with SMTP id
 98e67ed59e1d1-2e0e6e9902amr4399944a91.3.1727711486757; Mon, 30 Sep 2024
 08:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
 <20240930112121.95324-26-Julia.Lawall@inria.fr>
 <feb19089-a7ee-4a39-be8b-bf9e380b17b7@amd.com>
In-Reply-To: <feb19089-a7ee-4a39-be8b-bf9e380b17b7@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Sep 2024 11:51:15 -0400
Message-ID: <CADnq5_Pv1YOo2SNajhJvfRFKK=Yf1a4=4ufFteP2_n3jFA45Yg@mail.gmail.com>
Subject: Re: [PATCH 25/35] drm/amd/display: Reorganize kerneldoc parameter
 names
To: Harry Wentland <harry.wentland@amd.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, kernel-janitors@vger.kernel.org, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Applied.  Thanks!

On Mon, Sep 30, 2024 at 10:49=E2=80=AFAM Harry Wentland <harry.wentland@amd=
.com> wrote:
>
>
>
> On 2024-09-30 07:21, Julia Lawall wrote:
> > Reorganize kerneldoc parameter names to match the parameter
> > order in the function header.
> >
> > Problems identified using Coccinelle.
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> >
> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm=
/amd/display/dc/core/dc.c
> > index 5c39390ecbd5..417fe508c57f 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> > @@ -621,8 +621,8 @@ dc_stream_forward_crc_window(struct dc_stream_state=
 *stream,
> >   * dc_stream_configure_crc() - Configure CRC capture for the given str=
eam.
> >   * @dc: DC Object
> >   * @stream: The stream to configure CRC on.
> > - * @enable: Enable CRC if true, disable otherwise.
> >   * @crc_window: CRC window (x/y start/end) information
> > + * @enable: Enable CRC if true, disable otherwise.
> >   * @continuous: Capture CRC on every frame if true. Otherwise, only ca=
pture
> >   *              once.
> >   *
> >
>
