Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610B1165989
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 09:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C382F6ECFB;
	Thu, 20 Feb 2020 08:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4441C89150
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 16:21:28 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id a2so597445qko.12
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 08:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1IjE5f3DRWrL7DyNrD/EPrz9NqvpJo1LzwPmSu0Loyo=;
 b=Y0xUdyvI/KOwgnUyUAXVRQts2j2UDpi0MSoQ8O0ZIpFCbCbLaplKvU5pIrb49CIcHK
 Oko/yr/AtoCn2I7wP1Yz/l85vKpPmPYS2VLT7dy7v+KArYcmNL6mvY79eopcTfkaMHlR
 6ad0zsqSYvukfQwQMDKXW3o2M1y+7ZLCHho3eH9+XHp9GDKhBElQTtLcwPW1OzZqDG+o
 ey+6JO61zvRaKvwJ1VNS2Jvb4aETsOQDmV7IiKJxQwWThbSwQ3VPR/0SGwTsSc5081+r
 p4IwL9I721gfQnwgUof/i3OQS3UBN6v3KV2bdrPVFgNPBL/Fy8ditUJoByLUoc/wDrIn
 VXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1IjE5f3DRWrL7DyNrD/EPrz9NqvpJo1LzwPmSu0Loyo=;
 b=Jzv7l1JI+2i/aTRpTJ0/PvJ3/eegi9/HFHX+vlcDGrtnz+s7b3mddQHHeu02e8Qh2a
 BhIYP5dx26M/xRLl19eZSwenXZkvodaKfQxHJAaSbqnnj7/ZX6E8u5pF3Ut0jNHLyGHj
 VOi2k/W1Ug+XB/2c7V//vI1t8eBQSryCPByjbOBrODZh/jv+mTslGHDxOeS1Vtvv1kF0
 zaKgx8j99OyeFiccrYA4ohp+vP4L+g3qWLOSW0l4K6sYnAhAyHFrWvg/sHRtdiTgUM26
 nHp2fZ9PeeDy3vC4sVjtF02ZMXoG4SNGUBMqSzH0sE8auTBFJGIauXhTme2QeF6MV4n2
 lnsw==
X-Gm-Message-State: APjAAAWQ0xVcR78lV+9gg04aF51aIWIUvW51o8ywKHrhPaEbsZ4nLPX7
 B8674J0WmV6+nhVsftHoYxw/Ow==
X-Google-Smtp-Source: APXvYqx3pDhfMLHjqJZav0TSJad25iHzflnIoh0HNoBZKgS2hYkzGuQm5PMiuKy/xxFf6JF9qCXKSw==
X-Received: by 2002:ae9:ed41:: with SMTP id c62mr23816689qkg.403.1582129287358; 
 Wed, 19 Feb 2020 08:21:27 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::2:3bde])
 by smtp.gmail.com with ESMTPSA id n4sm210781qti.55.2020.02.19.08.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 08:21:26 -0800 (PST)
Date: Wed, 19 Feb 2020 11:21:25 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [PATCH 09/11] drm, cgroup: Introduce lgpu as DRM cgroup resource
Message-ID: <20200219162125.GC13406@cmpxchg.org>
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
 <20200214155650.21203-10-Kenny.Ho@amd.com>
 <CAOFGe96N5gG+08rQCRC+diHKDAfxPFYEnVxDS8_udvjcBYgsPg@mail.gmail.com>
 <CAOWid-f62Uv=GZXX2V2BsQGM5A1JJG_qmyrOwd=KwZBx_sr-bg@mail.gmail.com>
 <20200214183401.GY2363188@phenom.ffwll.local>
 <CAOWid-caJHeXUnQv3MOi=9U+vdBLfewN+CrA-7jRrz0VXqatbQ@mail.gmail.com>
 <20200214191754.GA218629@mtj.thefacebook.com>
 <CAOWid-dA2Ad-FTZDDLOs4pperYbsru9cknSuXo_2ajpPbQH0Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-dA2Ad-FTZDDLOs4pperYbsru9cknSuXo_2ajpPbQH0Xg@mail.gmail.com>
X-Mailman-Approved-At: Thu, 20 Feb 2020 08:45:37 +0000
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
Cc: juan.zuniga-anaya@amd.com, Kenny Ho <Kenny.Ho@amd.com>, "Kuehling,
 Felix" <felix.kuehling@amd.com>, jsparks@cray.com, nirmoy.das@amd.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 lkaplan@cray.com, Alex Deucher <alexander.deucher@amd.com>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 damon.mcdougall@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 03:28:40PM -0500, Kenny Ho wrote:
> On Fri, Feb 14, 2020 at 2:17 PM Tejun Heo <tj@kernel.org> wrote:
> > Also, a rather trivial high level question. Is drm a good controller
> > name given that other controller names are like cpu, memory, io?
> 
> There was a discussion about naming early in the RFC (I believe
> RFCv2), the consensuses then was to use drmcg to align with the drm
> subsystem.  I have no problem renaming it to gpucg  or something
> similar if that is the last thing that's blocking acceptance.  For
> now, I would like to get some clarity on the implementation before
> having more code churn.

As far as precedence goes, we named the other controllers after the
resources they control rather than the subsystem: cpu instead of
scheduler, memory instead of mm, io instead of block layer etc.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
