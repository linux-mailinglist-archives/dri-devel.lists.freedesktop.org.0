Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D74361957
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 07:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E596EB24;
	Fri, 16 Apr 2021 05:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B7A6EB23;
 Fri, 16 Apr 2021 05:35:26 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id l131so21684378oih.0;
 Thu, 15 Apr 2021 22:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SFCuQjzeWEqVOnSxH9l3seK+DWkURq4UwkFrvexD2eU=;
 b=d0yTUxmTcD6nOU09FHnlzTo0lx2mwWzMVSDLY7FdcLjHeVJeVLjeilmVNNQ4CSC/gh
 IhmShyVpFwEkb9hwfZVsXO0m2pbhuetrECeMDuRev7x0LLI2satvKrdejFVsmSttz8cO
 oxxjcQ8yK62sSn2/mMDFyyFkm/OXJ3r0QDr8VbDowa9jo+XZzn1QF7cf/GB0qU4esOsP
 EYTV3EC9dhbV2KS33vH86rsn3jkQNG0sytqkXlFoTPb8zNX3wCrRAF2oz/YdjIx6Unjd
 9dYYB0VszdZtUdpViQaMQfDmz00euvrj3EZxr2Xl/tTsda+uRd+y6tZv1kQPUbeREXed
 giRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SFCuQjzeWEqVOnSxH9l3seK+DWkURq4UwkFrvexD2eU=;
 b=XuxM03ExlkuokL6dfbpbI6iaJHuX0PWWqwZInPYGDn0mk/WJJ0Kzwd8Og24Ohz2V4Z
 9gNjkYvosDTnzeZ7f66RXJC0inLlo1m9P1HpNqfQOytFHSmeJQ3UwO1HfE5r1NgoHdRg
 I1/eerpH2dTjuHGuCZPY4loCMUKpjytmSgi7Ob7Lg1MSZ25YZnO7t1eooiXtCVtLijgo
 XUefhtuvFXKIl+EHZGXqwE/gheoA7egW25Noqi62gfZSSMgIXAN1LuH5wwfk2u1kKADp
 SPOyq5MAN8w77YeQOJImQ3NuwWeLdYeiEQYj4qrXV5GRDD3fsNgj/MSD22L9nvuGsbLX
 6QKQ==
X-Gm-Message-State: AOAM533Zv+Sub+VoJoB1tP4pSHqzBxO/89b/inFK6Ufjo+MyhIwSgZRp
 e6otngDcju1cVd2wKXYj3Pn0zdKU5guHWtYHeP0=
X-Google-Smtp-Source: ABdhPJypqEgjQFMCGz9v5f2MQTPTCxXxge7bZue6TFEQc+HYzUoahf5lCYEmOL2SVqpvYBWuuf78thQEnheNwoAxOXo=
X-Received: by 2002:aca:c08a:: with SMTP id q132mr4986993oif.5.1618551325311; 
 Thu, 15 Apr 2021 22:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210415212508.7ef57d73@Zen-II-x12.niklas.com>
 <20210415221626.3a33787f@Zen-II-x12.niklas.com>
In-Reply-To: <20210415221626.3a33787f@Zen-II-x12.niklas.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Apr 2021 01:35:14 -0400
Message-ID: <CADnq5_MqWX9wGN7p+8RYqQ7dxV84sQjdgv9nWFrDgbVLh46oDw@mail.gmail.com>
Subject: Re: [Regression] amdgpu driver broken on AMD HD7770 GHz edition.
To: David Niklas <Hgntkwis@vfemail.net>
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
Cc: Chunming Zhou <David1.Zhou@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 16, 2021 at 12:48 AM David Niklas <Hgntkwis@vfemail.net> wrote:
>
> Hey,
>
> I forgot to give you a bug tracker in case you want one.
> Here: https://bugzilla.kernel.org/show_bug.cgi?id=212691

I've followed up on the bug report.  Please take a look there.

Alex

>
> Thanks,
> David
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
