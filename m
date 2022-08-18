Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E581959818C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 12:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820F810EFEB;
	Thu, 18 Aug 2022 10:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0A8CCCFC;
 Thu, 18 Aug 2022 10:44:10 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3321c2a8d4cso30084447b3.5; 
 Thu, 18 Aug 2022 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=/Vg0MiE5047HvBd7kU3Dl8WG5Dtp7QWU7yaZmVgWvE0=;
 b=XBdxOIbpmad8maPo4XhdSMrnSkrWvg5nakK+efBLeJ5Dhda5817DMJDouZlliduGpJ
 cMI0PnJAxqFOOFm7rAFqrsLpEcmH508OQg92oOL0rAFnK/+n2gjeWpXrOogkawkZVQG5
 VP0N7xNN08DQPQ9SY53iFIHOhZ9JvL+U+KSRV4vFswq4WP11k7Zv9KelLOBoU8if2XHk
 kPiHeI2X96L2Hru8Eyz00HNQHoJG8ymiUmOE1Fe7MKZK3YDF79kwsWd7IhOxIKkwOS8/
 Jsv2X3wJnmvW8b+JIM6eTV/3XUOoVpybgNG3k4M2OVFKpCCOmcyDe03UYYN7UTmqNTHB
 pWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=/Vg0MiE5047HvBd7kU3Dl8WG5Dtp7QWU7yaZmVgWvE0=;
 b=sd0GrX8jSPUSm2COVsAAtpZce6N1CVJpj2IOnc/pvkbKdUg70g0ub4j7x5V0J6JUFp
 oPk1fsrLy26q5ZN+7yfwyAEPRf/vd4p6Ma8fXATo+I4sgtE5kvtd7b0DTOPR91gnfvAr
 Fb8IX2rs+Pv+oYDpBJgYIsVoObDjEe2Pw7oOc7Nv7b26eCpuUyPWoBOsx58pqkuo/1XX
 4gIqFm7qaD0FiA8gvMoB/4QG5eKkaqftX1PImh/tLDpcqmdByjsNNrKGDHuInNE4fvmq
 RA+6fGymzAqqW4WUou5KVlaSUWJXNMq9cJxRliYuzqWoWziMBsttSOrchdaoIsoodRhU
 e9OA==
X-Gm-Message-State: ACgBeo2liC5ppynannomCnWvOKMVUf4eZ2E+/HpHihxUWVmK5qlZX7EF
 vpDjLg8CqxQ5U0sfa1FZ8C+Tc3NCXoZ+4wtQvDU=
X-Google-Smtp-Source: AA6agR6bpMkfOdg/XRd/QTB2hcWngbdEhqg0DhxaakFttwjPtxVRnCyU9KJocZLjpI5nP8q5uNUBHgiRbNIJ29vaWxM=
X-Received: by 2002:a5b:845:0:b0:683:6ed7:b3b6 with SMTP id
 v5-20020a5b0845000000b006836ed7b3b6mr2221253ybq.183.1660819449894; Thu, 18
 Aug 2022 03:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <Yv1lepjhg/6QKyQl@debian>
 <CADnq5_Od9W1iuzYpsmODOB=Xem97ogeH_t0JrjWC-S8h0XM9fA@mail.gmail.com>
 <5638aaf1-b808-bdc6-d84a-820f24facea6@infradead.org>
In-Reply-To: <5638aaf1-b808-bdc6-d84a-820f24facea6@infradead.org>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 18 Aug 2022 11:43:34 +0100
Message-ID: <CADVatmNA6-qCJEHNn-gRO6Nx88SsTrPsJn_F5J0NiFhyvijNxA@mail.gmail.com>
Subject: Re: build failure of next-20220817 for amdgpu
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 linux-next <linux-next@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 18, 2022 at 3:09 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 8/17/22 19:01, Alex Deucher wrote:
> > On Wed, Aug 17, 2022 at 6:03 PM Sudip Mukherjee (Codethink)
> > <sudipm.mukherjee@gmail.com> wrote:
> >>
> >> Hi All,
> >>
> >> Not sure if it has been reported, build of next-20220817 fails with the
> >> error:
> >>
> >> ERROR: modpost: "cpu_smallcore_map" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >>
> >> Trying to do a git bisect to find out the offending commit.
> >>
> >
> > Thanks.  I don't see that symbol in the driver at all.  Not sure where
> > it is coming from.
> >
>
> It's powerpc only.
>
> Sudip, is it non-CONFIG_SMP by any chance?

Ohhh.. really sorry for the incomplete report. I should not try to
mail while travelling.

The error is seen with powerpc allmodconfig and it has CONFIG_SMP=y.

-- 
Regards
Sudip
