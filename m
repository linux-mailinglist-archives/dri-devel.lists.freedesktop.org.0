Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C34308984
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 15:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C496EB45;
	Fri, 29 Jan 2021 14:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A196EB45
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 14:25:13 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id f2so10640502ljp.11
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 06:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aHijws8Bzm93QZ1lZKc1h+l2tDz3eXhWAU92a1AA64M=;
 b=rJeKUDXo66TwimCR5SNm9L+YJRm7nyAG0MJyG7A5mLcLHg3sD9/+pQoBvvMMRATURn
 peJScdRi4+5m4l2CVObVp4hHKphjDYH5+3CXI+Rths2W/KGJg1zjfVXrWro8xeCdIdv7
 etAc7yZQ35lXUFfXnMEfFz17XSFpRnQq7Y02oWlkbdX8oxAbJSQwFPqAHpwOxCDMbGiq
 qdpNWA70J2kJrU53sep0kvn4GaNOCa71vAq4IwiGCRqSPyMXDkBfcKMo+lxJn58puOAe
 f6/tY9DwxhLdRaLPNqAO9cWRBPq6hyFG82hkpPR6Mx0eBPV1bz/uzTkAwjkhm3zUb1W+
 J+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aHijws8Bzm93QZ1lZKc1h+l2tDz3eXhWAU92a1AA64M=;
 b=AQNX9TWyF9klFlk6zrAbdeZTjd43iysDWA+zblxwuA+MuvKqR4rx+exPxQCNKDrWyx
 EfW030QzKq6Sw9bSjaogikhHFrxP+FiXru3a5DT4L5bpuk64GfAHZNTV4Mpn5ErA9J5l
 IC+KieTTry4bQhmCl+Ak0c336e2tXKFXN2WDndjHxTaJmxOGkEJ6cSuJViA//kPcw3Bg
 U2Z7B+kCLluVwH16u5GWAuLtXyYoRdg43bJJx2WHON6HxPABfHA5Oy9lkfM1yb/LeQId
 EFz2kxTby3rTAJDxtroq8VIIO1sF2vI7WgVYn2F7w/Dnc6pGiqFWhtGznLxULDez6xc1
 wEsA==
X-Gm-Message-State: AOAM531zsDd5lqHRhSuEaoY6Y6zCjwy57zPizHPgql9v2CZ4PReYElgm
 RTc78jB7qCTagxo35weAaTXaZpCtXQGnkbNdewc=
X-Google-Smtp-Source: ABdhPJzstBG3IpXX4M8GSGpHaPNsU12yYkSY8zWqN/sB5RwTuPMazjh7ZuVIr6m8LY+HwUBze5HoyqGbQMPLeJUznVA=
X-Received: by 2002:a2e:993:: with SMTP id 141mr1861299ljj.372.1611930311909; 
 Fri, 29 Jan 2021 06:25:11 -0800 (PST)
MIME-Version: 1.0
References: <20210129095604.32423-1-tzimmermann@suse.de>
 <20210129095604.32423-2-tzimmermann@suse.de>
In-Reply-To: <20210129095604.32423-2-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 29 Jan 2021 15:25:00 +0100
Message-ID: <CAMeQTsYb5wF4Ev_XniX-72eWw5pjbmEy_dPJB_oKc0V59Lk+Fw@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/gma500: Remove Medfield support
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 29, 2021 at 10:56 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Medfield is an outdated mobile platform with apparently no users left.
> Remove it from gma500.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Great, finally we get rid of that DSI code :)

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
