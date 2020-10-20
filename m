Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BE829337E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 05:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4CB6EC09;
	Tue, 20 Oct 2020 03:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9E06EC09
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 03:15:59 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id c22so534128ejx.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 20:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YNzRtT7klAYVm68jpDG6DZAqWUuuBgxEPA8Ur7/o4Sk=;
 b=XQawKfb9wuKqjPqdEsJpPB2tfCP3qwgFdkdRFGzIjyASd8RlbmUDicJ2y97dhZHbEM
 LQUOYWxllfVnUd4XmScCuB/gU9XYhTJnmJ9x37V5tnBnDbjv5cM8i7bb+b1sbi/sJkpy
 E0LXnDRm9tp2Gz9Un8AQUa87WGcXz9yH/DX0zuDlvlvMwb2TCHl8uEBoAMZyzQBSaFez
 VlnK39+6dHZM9kKpWrNoWq6b9Pq4D3oX14gMIr7w68CZN/z7WhbCCx00wIY6HOogycK/
 Hqv4pCh2lKYcWZ+YPBNJFyKfU8/21s7Cttxug9fqkZ+MMlWQkTP4jBLgIlKj3SSaMqcY
 52/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YNzRtT7klAYVm68jpDG6DZAqWUuuBgxEPA8Ur7/o4Sk=;
 b=geV+Y6CEw1YR1KJvGBsFyIwiggh2gjE1Rwubu1yGO3G/MtjQ8cB7sfsLMI4h9KasoI
 ByNVk15WB7vNRex1KNJbjztPSHt/rqDbfiO8TkE7J4YKl1g7Z43v6EaVo+tGjLp9UVLV
 Hr9/PPiaZlghtcYzE8QtMCOLrecoMtobYpxlwii1x7MmM+yQxkPbtepI5/QGYPVJ5DgH
 AHJHcomQskTVJBr3BQT8D8V4nQvOLtg3HU2N+v2D6daJQpYxAmGG1ZNx7GLEfqQ8mY12
 vrbaZIV0f0rZGTr6u4l2gKVrDXuvn745MiGRuhnewTbhkwL74W2V14dA2oJRteEr/gVR
 iQkg==
X-Gm-Message-State: AOAM532WUe9g9IXFrRJk1whrRX6NL9J17uHybglOZdDgVAMPQ5OguoJD
 F4wIiooYSTBrqau1Ru/5AgeVdQe5jnU47QmyKHibpnZR
X-Google-Smtp-Source: ABdhPJyQWLLMdq28pVCPoG3RL3w/8gnUfD3OGa8jMnM6JvsFwD5qNiir3IlZkJ4YEw0kVfr27/r1AYRlNlwXBwKwa4k=
X-Received: by 2002:a17:906:2b83:: with SMTP id
 m3mr1004637ejg.456.1603163757726; 
 Mon, 19 Oct 2020 20:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201019222257.1684769-1-airlied@gmail.com>
 <20201019222257.1684769-4-airlied@gmail.com>
In-Reply-To: <20201019222257.1684769-4-airlied@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 20 Oct 2020 13:15:46 +1000
Message-ID: <CAPM=9txi7Z5jC+Met4izPDJJ3NkzQVoP5Z1AZqOyzoGDtt-m_g@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/ttm: drop bo->num_pages.
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: "Koenig, Christian" <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Oct 2020 at 08:23, Dave Airlie <airlied@gmail.com> wrote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> This is stored in the mem field, everywhere that a new mem is
> created, the bo->mem is either copied or this field is copied
> explicitly.

This has a problem with the pipeline gutting path, since it memset
(bo->mem to 0), but I'll fix that up in a v2.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
