Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA394E53CD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 15:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AE710E6E3;
	Wed, 23 Mar 2022 14:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B94510E6E7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 14:00:32 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id t11so2843582ybi.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 07:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WXmsudQE/TvO9iiY9zNu+1IylJ/3Toy3swSwCKBPOo8=;
 b=pLPt4Nny0j0BQLv4HIqLC3M+OAARYiL7j99SY2OpCpU5uMTMP73/MrCrJe1qGuG6z3
 LbV9s/x/7bxnISY8mUpG0XzF0ugw7k3K5bL0znrMDaptTcAwr3wXVL/rAU3TUvGERTD0
 eyT4equSyxkz8pweRVpOnMFupFINS4YY5vYVvclUw7yLdVECrnJSCQmBZf4YZ5ueD/wB
 Xfl5u508JiydNzfJJdCPoUIPVOX3K3/9Wrg5Cir5Q8sIc89cdmO1mP0CYlkCldvzXm7M
 dP3/kJWAlV9wrMuz86UIBwBIBlyFGomcM0amaSo6CvWxcGg7aUeB3LtGuTwO1GdAQfnH
 hE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WXmsudQE/TvO9iiY9zNu+1IylJ/3Toy3swSwCKBPOo8=;
 b=rhRQyGGk+y3lve8XFVClXBxIieN0V7RTqNWjvx2b1WyIMonZr7L+KmgjiLye474uU8
 l/Eo3MIU9vRcrB1ao+N44/i1WeGhHLO7yOFBgSi6+4LJKUxMZXSDfAgyUUu+y7aH71B3
 0bHLCdzepjNF2wwhAMohGDnw2yWvz5vQGxpHC0pdQz0chNWo6hgHDkNeUEo+JQ3RMfp/
 LVx+Fj9ReURx2VD+3ebzY/qQemLDOyQU0xcebVZ8fsESa0vPuZsHxrtbAw/L4mqM+T0w
 W78gwF0LCFUWWA9TTuxYtPOKCymqqzA33gV+vQcgk7AQHUprnRoFPoNv6LTPE5Z7oyPM
 an/w==
X-Gm-Message-State: AOAM533S9MSdnNsqNwuVHYZrGSO3OfBdnerxvqw6phIQhM7vM80pIIal
 gJ0CujbvXyt36NLELJtywqxbRtSD+X+zX7qLw4+YUQ==
X-Google-Smtp-Source: ABdhPJyHa7eOvNnyaHxUf07xuixSXY4plTAI+F72p+vYBKR20PiTxHWvuY2S3ZZhmuCa01nJPpnMNsM9vx/1eBu5XnY=
X-Received: by 2002:a25:ccd2:0:b0:633:786a:b105 with SMTP id
 l201-20020a25ccd2000000b00633786ab105mr87355ybf.28.1648044031330; Wed, 23 Mar
 2022 07:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
 <7addb3e7-d265-c1a7-d449-7d0056f06d63@molgen.mpg.de>
 <fc60c561-c12a-c031-9558-abae3e3474ec@amd.com>
 <6f0888a2-f74d-f41f-d593-a8362e7dc673@molgen.mpg.de>
 <398f8851-d37b-4020-24ce-8f2ab9723e40@amd.com>
In-Reply-To: <398f8851-d37b-4020-24ce-8f2ab9723e40@amd.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 23 Mar 2022 14:00:20 +0000
Message-ID: <CAPj87rMETV9UkpbGRYAT3mjVhRtW75m0e9OLON6_+gdcD0Fo2Q@mail.gmail.com>
Subject: Re: Commit messages (was: [PATCH v11] drm/amdgpu: add drm buddy
 support to amdgpu)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Mar 2022 at 08:19, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
> Am 23.03.22 um 09:10 schrieb Paul Menzel:
> > Sorry, I disagree. The motivation needs to be part of the commit
> > message. For example see recent discussion on the LWN article
> > *Donenfeld: Random number generator enhancements for Linux 5.17 and
> > 5.18* [1].
> >
> > How much the commit message should be extended, I do not know, but the
> > current state is insufficient (too terse).
>
> Well the key point is it's not about you to judge that.
>
> If you want to complain about the commit message then come to me with
> that and don't request information which isn't supposed to be publicly
> available.
>
> So to make it clear: The information is intentionally hold back and not
> made public.

In that case, the code isn't suitable to be merged into upstream
trees; it can be resubmitted when it can be explained.

Cheers,
Daniel
