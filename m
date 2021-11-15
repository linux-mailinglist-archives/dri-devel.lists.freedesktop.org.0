Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE81E4507A8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 15:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D586EA43;
	Mon, 15 Nov 2021 14:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A0B6EA43
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 14:56:34 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id v138so47833786ybb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 06:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NGsuZ3Uaj/agqI/tlHhQkOFiBszat8UqsNK6tdIQb40=;
 b=R08LYVuYr6Gp+PEUNtXMQc2DMWHrh1jSo/+FtU9PworKT40ZDLgm0NXLmHuOmCpvQh
 oQMS3XPGWDx5sKmvYwJZC2AxScOpaoRuIcDX3wCxCTBw5VYn0lp0odXZbV/3bwDD6Y7U
 R4qb7cBR2aY8LDk0qQ77wwEZt5tqvFNbozf/vBTruJ8w+lnzEHvAtK8JrdH/Z+yo4y04
 YRjscuO18dXG/mgg6R9EebkGCYBmkySw4sDlf1GgaBdvfHOiXzJyEy1bGfbdT5bBsM6y
 5qUe82mCPtMnSg52+hCX3hpVn6wrUM9rskdZ5NlxUHxpYjwJu6HK3v6BbT3d8QxEJa5K
 khZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NGsuZ3Uaj/agqI/tlHhQkOFiBszat8UqsNK6tdIQb40=;
 b=6nVaELE3kj8IPVGFrYeWDtb1UqmJYcMVINuubTbP3XBS3C+3A03GtviejUWviD5R+z
 DFw06IdWGMwxho3bDece0joCZAwm1uK2d97BAtjGgWW4wq7DiLlRFbjOKcBpEKh/cnaf
 W7V96CoycDQp7EAr5VE3+4ZegYBgAwx9n5byB+JxWk0VZmTBGu59AFjE9Nc6344KFDPK
 qxD1/6I9K365H5I+nfwNiQSbp4JSe51NBci8D0nmAU+ivWvJqjw3zaTG1DC00IY/Zrk3
 p16IZwmCMyYdtNMgEK/Y44OFjVhXi259pE+UkTz8Q3KWP4aROx+PcVMhcIAxH8EP8dxA
 D1JA==
X-Gm-Message-State: AOAM533jSd+4fnmczOwXrzMPa655edSqzvPVftPbDuq1pLzPt9qr5qd6
 mMcctnMCZUGfJMEmEecCl4450OcAFw/3TOM9zb97DA==
X-Google-Smtp-Source: ABdhPJyV50AYq9JZm1m5QCedvfVjYGxjtpwmvx0hYgMTa/thmV8z7bbUM0P5Y2oRBoTd6ZoVh65n82k7bnRJEEuoOrU=
X-Received: by 2002:a25:300a:: with SMTP id w10mr1270016ybw.506.1636988193134; 
 Mon, 15 Nov 2021 06:56:33 -0800 (PST)
MIME-Version: 1.0
References: <20211114234045.cc5tearljna2ywij@core>
In-Reply-To: <20211114234045.cc5tearljna2ywij@core>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 15 Nov 2021 14:56:22 +0000
Message-ID: <CAPj87rPxtQVQnrs0BiXy0H1viF-oMNeCCP_Aptsxt_sgeK+CpA@mail.gmail.com>
Subject: Re: Panic with linus/master and panfrost
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ondrej,

On Mon, 15 Nov 2021 at 07:35, Ond=C5=99ej Jirman <megi@xff.cz> wrote:
> I'm getting some fence refcounting related panics with the current
> Linus's master branch:
>
> It happens immediately whenever I start Xorg or sway.
>
> Anyone has any ideas where to start looking? It works fine with v5.15.
>
> (sorry for the interleaved log, it's coming from multiple CPUs at once
> I guess)

Thanks a lot for the report - are you able to bisect this please?

Cheers,
Daniel
