Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NzuBAH8nWmeSwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 20:29:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CCC18C154
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 20:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B6B10E330;
	Tue, 24 Feb 2026 19:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z6H17axK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E9910E330
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 19:28:59 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-8cb48234b08so619208885a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 11:28:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771961338; cv=none;
 d=google.com; s=arc-20240605;
 b=hUXk3YZoL2wVHYsJmsB/vPladWWFKXDCOsH0XisT0d5/9+DdUyhZgkBskS5WlNoHW9
 3FbIXsEF51rZMaI9k4o2la6roJohwu5qRz/wy7vEb+JYcJDriYLkyGRe+yaC1xLbbgso
 UyGdWMlAnNcJ/jzkvKVugwrDYawGTVywWLL7j4a5CEhJ6S53dwcUcaDImuHFhC0v8TJv
 Zn9ZHgA/eKkxL/RbjS3ljb/auxRGBT5A6y6vjWwm5Yq6Wdxrm/lRU1GUe+zPW8dr04OW
 rylxvDe9AGOxJwfhjAgZSecLrDf8SGBA01VBFVVCNwXCVmOpAA1RVwmMSg9e7e7eOeBa
 cUmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=d0g9JSn5hJ3/0cUOdGHJ8XxsbIzvXLpEXYfQCv5H66A=;
 fh=PHoZUpDQ1inbstGWD7yqTU5dxvqhl73AKFSTuZbuT8Y=;
 b=KjNS0MafJdOySdQCTAscpLmXqxTgSBL35yIcoZApC/pT7bD+2HRVwK508eSgK6BZW3
 Vi5SuE/ZhGjn9KvFwEAr/aezxOpFjRmnb/sUW3n9fWw6k8H2V+6kWNr0qyfXNlwnuOd4
 4EARn3ZOf5eMk7EbqcsWlYF4X1UIlGhW9OLi5HtNjK1PE71ye1gaT0pg41/0Iu0xo5Ne
 QYNy+CKjXTrYRjFzVbp0ELEHiGH7xauPD0GYNjlfLC7H/k7fFftMXsw+UldwRe0us6CM
 03IAPBBGxUiVO+eI7rarldL5JAwmGjNDqV0/4St8XAM1ZJFf+ek/+xc+2IGXluJclzLL
 TgjA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771961338; x=1772566138; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d0g9JSn5hJ3/0cUOdGHJ8XxsbIzvXLpEXYfQCv5H66A=;
 b=Z6H17axKuZJfBX17T2C1gbxclIG5XTuvxtzEbT4mEVu9Qjvyh5xAYvDX6ZWvy1gp3E
 BxAyOF+cL2tlU0hEupobIAvjCxLrNyBrtnWbFVjAAMTdOn1j3Bj1idtjUc75ZRmvGmSk
 q8IRZkCGYlpcRAiOX1FNHhPyP9hKAz33A5LHK0/GtBZjN2hg5MemeEh1RL46qpThkph1
 ngirV3KpL3EnqoU0gGFiAUvZP72IP/Nu3xTc3686QDEI0s3Gsg7EiENdaZpyevV2YN7P
 wlFk7pbCJvCrJ8+4yPTIp8ewqYNYeCAUWmyzL/RA5cL0koEL+jcobxjpsgqRLOuVp/Ac
 0V7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771961338; x=1772566138;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d0g9JSn5hJ3/0cUOdGHJ8XxsbIzvXLpEXYfQCv5H66A=;
 b=PO5Vy9UWba1iIPbDHJqCuR8HKatRuaflP+ohiXPQ/IznO4t2rULVYC3g7LsAm3+BcH
 9Q4GI7lomKAnaz20ZsBwS/DlDWtvRJ61n4Ccc5YX6J3q7CfVrt2/vvyaZ42QnE+BzEO7
 dOzykVawVUOruDjIQsSgTrmjsMzKsjUmZ0HO0/zg58VWQV5dcOGkXd9LgIIp9caKpam3
 Fv7tQsNVaQ6/cnOA1gztdxo73aBLJSkiZ0BQU0H3E1zFByM0RJ47llCS6+k15uKC/OL/
 EhVb/6b0c7ls6T6LsidOZgfEE23tVolt32+jMn1/JcLdP7uw2HimkibhUA4SFLzk8WlN
 gCBA==
X-Gm-Message-State: AOJu0Ywyt1drP0HMgQSqu0T4xSftJ3eFk0gXoWUXty9Ou9Uq/PkKw5AZ
 KPeTcRAf5E/v7iG1ckkLh2vOLuyEa2u4TOwgj+jKZKhnP0sc8C+Wb8J+Xboe9vNXHJIYWZ1ZpGK
 qfjJQFsfZAXjES9uzslrKADx8MbgI3ro=
X-Gm-Gg: AZuq6aIMPEibXIf4t+3PywSb2NAGPJro3GTp9PleRqzciWBhuAiViePO7fQYzFCn5B7
 3T9I506By9s1qK6cBoJ52YFDCMxZ75kmq1w3pZUjmEWJtjAKSRoprrHhaZSWPHhxYOAVaUDtsBk
 F5zNCBqwomLBqCZFHNPXd+11558xs0AnOz015FcyqUv/z7z9L5ZDKwFBThWWNLGOVTwe6i8NFQS
 AK0coJwjuiJGyPodJl4b4o75h2h5yLWkV8YeNbBXfl1dTPfooPVd52eVZl+nivfcTPj9YFxu9ot
 3WSvY+MrcohZlpCOvMDmC/7q0gtffDRBecI0rAyoCEzUkHVVfBeDTZeZvMrpe5CMcoU=
X-Received: by 2002:a05:620a:3911:b0:88f:ee0a:3d66 with SMTP id
 af79cd13be357-8cb8caa1338mr1636967585a.80.1771961338031; Tue, 24 Feb 2026
 11:28:58 -0800 (PST)
MIME-Version: 1.0
References: <20260224020854.791201-1-airlied@gmail.com>
 <20260224020854.791201-8-airlied@gmail.com>
 <ee914ffb-5c3d-4d41-abdb-5ed02db326c6@amd.com>
In-Reply-To: <ee914ffb-5c3d-4d41-abdb-5ed02db326c6@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 25 Feb 2026 05:28:46 +1000
X-Gm-Features: AaiRm50QKMBq5S5enORbZuDApNPwLLHkYHnIYA5Ik3gHmkQKI-riIj_9p1f_rEU
Message-ID: <CAPM=9txUuS-qzA+gX2DvTuYR2OZ79RG86FuDA6czkpuJ_SR6KQ@mail.gmail.com>
Subject: Re: [PATCH 07/16] memcg: add support for GPU page counters. (v4)
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:roman.gushchin@linux.dev,m:shakeel.butt@linux.dev,m:muchun.song@linux.dev,m:cgroups@vger.kernel.org,m:david@fromorbit.com,m:longman@redhat.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 33CCC18C154
X-Rspamd-Action: no action

On Tue, 24 Feb 2026 at 17:50, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 2/24/26 03:06, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This introduces 2 new statistics and 3 new memcontrol APIs for dealing
> > with GPU system memory allocations.
> >
> > The stats corresponds to the same stats in the global vmstat,
> > for number of active GPU pages, and number of pages in pools that
> > can be reclaimed.
> >
> > The first API charges a order of pages to a objcg, and sets
> > the objcg on the pages like kmem does, and updates the active/reclaim
> > statistic.
> >
> > The second API uncharges a page from the obj cgroup it is currently cha=
rged
> > to.
> >
> > The third API allows moving a page to/from reclaim and between obj cgro=
ups.
> > When pages are added to the pool lru, this just updates accounting.
> > When pages are being removed from a pool lru, they can be taken from
> > the parent objcg so this allows them to be uncharged from there and tra=
nsferred
> > to a new child objcg.
> >
> > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> I have to take that back.
>
> After going over the different use cases I'm now pretty convinced that ch=
arging any GPU/TTM allocation to memcg is the wrong approach to the problem=
.

You'll need to sell me a bit more on this idea, I don't hate it, but
it seems to be honest kinda half baked and smells a bit of reachitect
without form, so please start up you writing skills and give me
something concrete here.

>
> Instead TTM should have a dmem_cgroup_pool which can limit the amount of =
system memory each cgroup can use from GTT.

This sounds like a static limit though, how would we configure that in
a sane way?
>
> The use case that GTT memory should account to memcg is actually only val=
id for an extremely small number of HPC customers and for those use cases w=
e have different approaches to solve this issue (udmabuf, system DMA-buf he=
ap, etc...).

Stop, I have a major use case for this that isn't any of those.
Integrated GPUs on Intel and AMD accounting the RAM usage to somewhere
useful, so cgroup mgmt of desktop clients actually work, so when
firefox uses GPU memory it gets accounted to firefox and when the OOM
killer comes along it can choose the correct user.

This has been a pain in the ass for desktop for years, and I'd like to
fix it, the HPC use case if purely a driver for me doing the work.

Can you give a detailed explanation of how your idea will work in an
unconfigured cgroup environment to help this case?

>
> What we can do is to say that this dmem_cgroup_pool then also accounts to=
 memcg for selected cgroups. This would not only make it superflous to have=
 different flags in drivers and TTM to turn this feature on/off, but also a=
llow charging VRAM or other local memory to memcg because they use system m=
emory as fallback for device memory.
>
> In other more high level words memcg is actually the swapping space for d=
mem.

This is descriptive, but still feels very static, and nothing I've
seen indicated I want this to be a 50% type limit.

Dave.
>
