Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DA0B42FBC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 04:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6932010E057;
	Thu,  4 Sep 2025 02:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F/2sHWsD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C6810E057
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 02:25:48 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so73423466b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 19:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756952746; x=1757557546; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5z4OrOFPS4XvH0NP/EnUCmmw7Fx9k8M6erkBwOpY+u4=;
 b=F/2sHWsD/SxIpHYCDV+cH0SVnWeNfCA/6h8QjfPvzbAfnjbyZCmEtW2oEc8opDQp6d
 Xl0p1PwnkVLVq2iyex0S1pf9Evhj8BazyB0i7kzkuqhdTFp5G57leQe2yRAfN3+Ye44N
 y5qh+krE1bbdYkLh48WKGGnvWNqI48VGbSZiT0PH7Yn6eWQ4DmeRM27w0+jdzDloxA/b
 /MBW08+EiGePg/s1XaLsrEZJ/9Er5Jgzs2J0oRnXryz8Gi82n13NCVsFnghAKLgDrrFu
 hCtWpSul/ppIBdnfPoh48t3zNucEzyu6EzS+Otf7xTgBEhE3cfPWgOdj4gXlDfLEN2Cl
 P8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756952746; x=1757557546;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5z4OrOFPS4XvH0NP/EnUCmmw7Fx9k8M6erkBwOpY+u4=;
 b=dPgySYm3K4+cwEZ71BGxvIl8SMUjYDhZSJfQOhs4ceY2F+icdC7vtPKTYkOAl4Kx3c
 t7KYEgNq9U4koFZyE7WfM8NNW8poeg/QXV/Dma7P9ZLoLzeNeYjZvcUvd3vt4pATgQ5s
 fK/DQIrnRJSPKDXDrTWnDvyoek+y+/KaS0CeKGpcxTuUxasFeI9oVrG8DYUKf6poqdFA
 l6l7NAIkUC0a89HjzX8uEqiffbsrXn7HlFVx5EL11JrFObQfj/5GuRktiHT7nBg+nhM1
 bcyNni6HyCBLyaMkR7ir7DtuwtwckYMWW9FqfpHdHN3ZhbPI/Wx3nXX8Qcl/Qk/DVZFt
 2JFQ==
X-Gm-Message-State: AOJu0YzUgjBHt1eSp5K+8XyrNMMCf4SYeLj61lstHx4iStzV7wQAv9aV
 L/XWuOxq97i8g/NzwBoCAxZrerQJiZ8W8fZXgIvXm3s9Q/Ds45P08aSnJzN3E60197FYrZn1WEb
 i4pdyyBITVPpwljP6bt/V2MeRRYAVsJY=
X-Gm-Gg: ASbGncvxTBGxEz4XcfQZr1C9Ehd/HTkjUpx0LDE1cq9SP+9XOvO7hibJMQUBSu7fV3D
 2d14GWpOogxBFbfi1jrWl/H9b2ui0hGoHIkHrRL2BkiN2VHuXzibLKF4zIp/PmPoNAuvy2kuFqe
 A2B0pYGjLHnTlsJ26Dnv+shzVyExtLgkBzVUUmLawsBeVuo960Q9iVil6/Ld8pEIEOBG0wB2P/A
 TEG1dhYXHkzwLQD
X-Google-Smtp-Source: AGHT+IFx/wB9FI1f3hFOOW57VGYOPL/Ls9PSyOMGNhTPLoupuVBZJC6+YLHC+db4jbrQbCWw8xGbfXuY8N9qEY2kC5Y=
X-Received: by 2002:a17:906:c10e:b0:b04:2b28:223d with SMTP id
 a640c23a62f3a-b042b283383mr1401131466b.20.1756952746428; Wed, 03 Sep 2025
 19:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250902041024.2040450-1-airlied@gmail.com>
 <20250902041024.2040450-12-airlied@gmail.com>
 <4e462912-64de-461c-8c4b-204e6f58dde8@amd.com>
In-Reply-To: <4e462912-64de-461c-8c4b-204e6f58dde8@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 4 Sep 2025 12:25:35 +1000
X-Gm-Features: Ac12FXzIOcCeJd-fn4RCBlScfspfWtoHuRwY0FIRBUcuRJSbmxFdrkK2CB8rqLU
Message-ID: <CAPM=9txiApDK8riR3TH3gM2V0pVwGBD5WobbXv2_bfoH+wsgSw@mail.gmail.com>
Subject: Re: [PATCH 11/15] ttm/pool: enable memcg tracking and shrinker. (v2)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org, 
 Dave Chinner <david@fromorbit.com>, Waiman Long <longman@redhat.com>,
 simona@ffwll.ch
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

On Wed, 3 Sept 2025 at 00:23, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 02.09.25 06:06, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This enables all the backend code to use the list lru in memcg mode,
> > and set the shrinker to be memcg aware.
> >
> > It adds the loop case for when pooled pages end up being reparented
> > to a higher memcg group, that newer memcg can search for them there
> > and take them back.
>
> I can only repeat that as far as I can see that makes no sense at all.
>
> This just enables stealing pages from the page pool per cgroup and won't =
give them back if another cgroup runs into a low memery situation.
>
> Maybe Thomas and the XE guys have an use case for that, but as far as I c=
an see that behavior is not something we would ever want.

This is what I'd want for a desktop use case at least, if we have a
top level cgroup then logged in user cgroups, each user will own their
own uncached pages pool and not cause side effects to other users. If
they finish running their pool will get give to the parent.

Any new pool will get pages from the parent, and manage them itself.

This is also what cgroup developers have said makes the most sense for
containerisation here, one cgroup allocator should not be able to
cause shrink work for another cgroup unnecessarily.

Dave.
