Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4D2AEE972
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 23:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF09A10E4CD;
	Mon, 30 Jun 2025 21:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HsFKI+sS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C8210E4D1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 21:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751319016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BcqHhOM1rJkONPu+TJAlI+2xkQAo/6F6Zo2zMziO8Qw=;
 b=HsFKI+sSBOyna8Q6L22VDNKxO/dUcf8e4msgXmNx9rOSN7UV2bO7oz+KPgI2Epj72bdFY/
 KCZowN6ZQ4NONCFHnI0dpmdtfwAGbvhFwf9lrvoL8x8O2j8izzL7B9mX77oawGypzitI/Q
 3oYrQ3bAE59XBHBqekN72jJ3zp/A85U=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-8FS50GtXPUa2wTWEskyyNw-1; Mon, 30 Jun 2025 17:30:14 -0400
X-MC-Unique: 8FS50GtXPUa2wTWEskyyNw-1
X-Mimecast-MFC-AGG-ID: 8FS50GtXPUa2wTWEskyyNw_1751319014
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2349498f00eso45982585ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 14:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751319013; x=1751923813;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BcqHhOM1rJkONPu+TJAlI+2xkQAo/6F6Zo2zMziO8Qw=;
 b=jb0lI+qzeerfv9B5QYqK4gKSkZwZPDI+K3IazYbFyGA3dhZohXvTeXAt9H3qJTh7Vy
 0bDg4WZGi6xxVgZ/c8zVHnLIl9gI4JyDH4wCtGbBLYaE+BYMAu9UxR/oDNbEB77qD8Bm
 gKEmcmidnfpWNIt5GrwkIyX76dYBRZkKsWh4l1e3r2q6Y/h+pEXjfLnP9uCaeSpWsFkI
 Kzi7wMFb23/bLyAyF+9J35eH9Muk4gEW/BdM3eelgYHMiSQBwR83DDCAMmgulHpsUbjf
 dCcLb6BdZ7CcnchvyFsBC7eEdedWU+WGyl4If+2SfjjqqX0hNuyCBuI8Lk2x8JhGF0ip
 b6tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDANclFQIhpR3doUv2hFV74Bbs9mxmPV+9UhZ9r3TsoyR+TPoAeF20HmKgPJz6d3nLLuxOMJoF1uQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIhC69mNgFSsxFhOegUjNTK0pjAIR40xNyTrwmEjryp5QRfswX
 n71DwNJB78435sReCoQ9LE8a8B0e2wh4LUZdTNwZLKmHRL6Nv9Zfm5RM3diU+YtfPntXT6rsqIs
 dQmfIaLW7HSirwibHKkcrRGiOwWlYrmtYZHTMfbwUkkBUcFr0lZOtyJT93cnlXvDnP2aytQaI/U
 F/+wKU0RUWDBI7SXr5mXnMIO7Dl+IvchWNNex8/YVeneRsfK6lHLah
X-Gm-Gg: ASbGncvPJlH0VE/wL6RDO9//Yoxa5dT82Tb6m/KLokJP/STkf2lE8l5ue4cwbxx3CFo
 9TK3k3PLr7ccr4MQ1XahShH8h7mlds+y+s1qNcna/P2MvTPjMethjIp7krTcoOm6cVNxX2bie/r
 dUsg==
X-Received: by 2002:a17:903:2448:b0:234:b445:3f31 with SMTP id
 d9443c01a7336-23b3556f0d7mr17232845ad.17.1751319013451; 
 Mon, 30 Jun 2025 14:30:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHNipBcKo/vNu4QmdorxQN4WYh75KbOH+w0t8MO87UQMbu2EKJ/ko5NtjnD58dLdPkqL1ddApDWelmhg4RoJs=
X-Received: by 2002:a17:903:2448:b0:234:b445:3f31 with SMTP id
 d9443c01a7336-23b3556f0d7mr17232515ad.17.1751319013101; Mon, 30 Jun 2025
 14:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-7-airlied@gmail.com>
 <3d40716c-0d2c-4be1-aae6-2c075ea72c1e@amd.com>
In-Reply-To: <3d40716c-0d2c-4be1-aae6-2c075ea72c1e@amd.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 1 Jul 2025 07:30:01 +1000
X-Gm-Features: Ac12FXza9EvICcNse4rZj_BXpRQwQZqMfPU5yvHM0inhibfNDqSVjfmvp8PW9QM
Message-ID: <CAMwc25r2eSsGs7wAUSp3K9SegNTi7E2+A6wOLKfxSYchgUaTgw@mail.gmail.com>
Subject: Re: [PATCH 06/17] ttm/pool: make pool shrinker NUMA aware
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Simona Vetter <simona@ffwll.ch>,
 Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zwdGUalk7R-KAgiO0gH2CdtNMcBDNWn8PWDRGUK83m4_1751319014
X-Mimecast-Originator: redhat.com
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

On Mon, Jun 30, 2025 at 8:15=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 30.06.25 06:49, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This enable NUMA awareness for the shrinker on the
> > ttm pools.
>
>
> Looks good from my side, but the last time I suggested this Sima explicit=
ly told me that it isn't very fruitful. Adding her to comment as well.

I don't think it going to make anything a lot better, it just makes
adding memcg support easier if you do the lru stuff first in a
separate stage.

Dave.

