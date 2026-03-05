Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIsAHWn2qGkNzwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 04:20:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BA020A7BC
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 04:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DC910EAE6;
	Thu,  5 Mar 2026 03:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jDdpNQuZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AEF10EAE6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 03:20:03 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-89a000f5adeso68140876d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 19:20:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772680803; cv=none;
 d=google.com; s=arc-20240605;
 b=i9OoeFFS/WTAgj1o6no72mHSNK2geqXg3xBJNfJy0NU6qBUcF7Q3vqZoqNX7jlIoFi
 jkkmNNhiMX5UycZlllGw28BwsaNwRvAXnbG2qvNqa0zMMCIR6U2db8hBpVKqiY8RF5w/
 dgiP+NY12yiYFucShq4B5KEBFkkSW2VUxxKCdqVHbD199Kbo7OI5RzS71Pbih4YBuvGC
 W/bAND/ZXkbkorhjyEqfrwSQPJNFkwvwyS99bfd1+ZVysJflwY7Wycp6R8E9cLdvqq/x
 Njm/B3+0d57/ySiuz3lMYOc5OdhtB4btSldDIXD9YyNTprv0NOihynI5SIfhaTpSa84u
 Zevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bNxfPghz3a2C6X013utbDw/X+on1R9lRqjkanG4CrHE=;
 fh=sD7st4FyvRoeQElkdXAp5YXZEamXNBF3KKR6UbXELu4=;
 b=C5XpKZNH/ou5CRMrJBQwrvxOy3jkIpFkD4WehnVbLkpo9yx7WX2LLrfcYkm9SwXaBI
 h5fq1Q6WbX5eKC6A/4jSXo1LH45NTpWEbIvPckOcZF/aq0Dz5Jdpjty2lV5ktlTqA4Yd
 N+s7gqEVq/T1HtFDLG+abfHSHvaJs6f1U1TO9qgMBUBJFjB4YPK3qv6FFnWpG1bCgmIw
 LRGb8PqigzVGNSQoJjRBbhvY+Ag+gz3FE6jrPvdENFwCL3/XOAwDBDDLe8JuQ/P7Dnts
 TP8DdF+3xEdXbUKxL7iwwkyBgBfvaICskDq8QQO4P2zYrWRRCVK7jursTL9hk7BgKtfd
 NqHA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772680803; x=1773285603; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bNxfPghz3a2C6X013utbDw/X+on1R9lRqjkanG4CrHE=;
 b=jDdpNQuZ/TNNTvdnda8mda+wFyzB4sv9sJBcuwOONuHQDgqm1xtOUhwA2yVcK0ipCw
 cg7pufzOV0noGe2jIkx5I4L3/B1bAi2cw/vfopohXLW94ezVvdxLErndsv1i1OtrIGEX
 R7RFO/+DWE7EKf4L38bteAuM5aGUtFFtysR8bLc6mROotiQ/hVvD5MEU7Xon9duPJbte
 srA81CVQTbKUyUJ2UVpueqPRc3FlsO2KMLfK7fhNSB9sk8GzltTxq4VfTtJD8SVqD/go
 GDLQe+8ZzzMEPwwVScj07WbQUXwp0bVbIS2UxuC9SJ8Fzv8tXVMQ+70GMRrl0pvPmI7b
 c3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772680803; x=1773285603;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bNxfPghz3a2C6X013utbDw/X+on1R9lRqjkanG4CrHE=;
 b=Z6XveySRkNqHFsLuqC6hrmSD+KHP13gPt89fK2i5gpesjH42/JQ0L0UewEPD5lx8L+
 J+WwP3bwFt2L+OlT5R80BHQe499aBDxoRWktCk6XtEVPZAV0FRSPZ/0IBMohuXS933Gx
 zgwG9kzJedJo2xElH5bfARfi8SVLXV2g0byfcDg7ELvPI+QvhxCWA8Ydjre2Rkt8mMVv
 dpeLR5OAoKelv1QCiSxLbTW5e+OWk3v6JKcdwHnR+qY+3v8CEO+OPCWLQDYQbgJ6gnQJ
 64RHZ5lPxjC/WefCUJtTFmyzZQ9rj7XDv97CuMhDBVLVQE+28g15Cjkx6E+Zsy/3gdw7
 QoVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2k9VlQ7puDNY//hGrH+u/DqXgDQiXLcXQPeXItgvDoB4AwnA53cBUzAmCuWQyCpPG43OUB97s6bc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxciN0ilYvSS9UfALnw7J7kQvw9Kc2NaPfdCj3TFvLnV/JlMgEu
 qxBIDHMHQPGEyZ5sZGBe/65HV6UQaAcXFnugtPgHwXSOO1hbgsOEwi8zrqklhjTIuNoYfSgI7uW
 XMLCpX7+WEkZuiHuKQ31hql8j7dlHdMQ=
X-Gm-Gg: ATEYQzyi9swdLPX0ziUsmoT3svLBLM2asaqPIr1Zo76qL5uigy1dOjF1f19ltxcbyiw
 WvsLBsXznYLXhRNtylc32fcdEEZNshLvdHC0qAPKjcDATQUFpQEbqghJSUWfqvW/dyBt79pQDTz
 6EVIwwQlZd1wGhJNyJU9NPWl8l2eugCZgl4wGLsbpwYyz4k+J01MBd6LpQXgz9SDhMcf3zi9ih3
 KIIWwNuBQuC7ZqFcPDiimZtZGe5+Oe7HMFd9OGjsy16rM9FG2i1CLJuIcix34c8YGu+C+v9QQSA
 NZPrZuB2WM/Zdq8XamDHBAsMFkxGGW5sz2u7vEDsBL1kf5l9yclowudtE396BxJ197I=
X-Received: by 2002:ad4:5dc9:0:b0:899:f841:da21 with SMTP id
 6a1803df08f44-89a19cfb95fmr62940486d6.51.1772680802721; Wed, 04 Mar 2026
 19:20:02 -0800 (PST)
MIME-Version: 1.0
References: <20260224020854.791201-1-airlied@gmail.com>
 <20260224020854.791201-8-airlied@gmail.com>
 <ee914ffb-5c3d-4d41-abdb-5ed02db326c6@amd.com>
 <CAPM=9txUuS-qzA+gX2DvTuYR2OZ79RG86FuDA6czkpuJ_SR6KQ@mail.gmail.com>
 <4fddf319-50c4-40ab-9e36-04d629a8855e@amd.com> <aaWZrTZGsxxjbBYv@linux.dev>
 <8efef755-e429-4cec-bef4-b15b3f9f4632@amd.com> <aaWuoe_CQwbtcxEY@linux.dev>
 <63dccd9c-f2e5-421e-ac3a-a7c13cec9121@amd.com>
 <CABdmKX0=xPiwXgOHskGkE9Umj5=NrC=7OtngJjrm=mtOZmyzvA@mail.gmail.com>
In-Reply-To: <CABdmKX0=xPiwXgOHskGkE9Umj5=NrC=7OtngJjrm=mtOZmyzvA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Mar 2026 13:19:51 +1000
X-Gm-Features: AaiRm529B-v2wzcCVYUJenUOR_2LQm-Zonmnic-n55ff8LsW9WWtwV-PEDAH5Lo
Message-ID: <CAPM=9tycvBguhM6r5ytm9S7D608iZDthHgfY=hxUvSjXLqsZAA@mail.gmail.com>
Subject: Re: [PATCH 07/16] memcg: add support for GPU page counters. (v4)
To: "T.J. Mercier" <tjmercier@google.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>, 
 Waiman Long <longman@redhat.com>, simona@ffwll.ch, 
 Suren Baghdasaryan <surenb@google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: C2BA020A7BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tjmercier@google.com,m:christian.koenig@amd.com,m:shakeel.butt@linux.dev,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:roman.gushchin@linux.dev,m:muchun.song@linux.dev,m:cgroups@vger.kernel.org,m:david@fromorbit.com,m:longman@redhat.com,m:simona@ffwll.ch,m:surenb@google.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

> Independent of all of that, memcg doesn't really work well for this
> because it's shared memory that can only be attributed to a single
> memcg, and the most common allocator (gralloc) is in a separate
> process and memcg than the processes using the buffers (camera,
> YouTube, etc.). I had a few patches that transferred the ownership of
> buffers to a new memcg when they were sent via Binder, but this used
> the memcg v1 charge moving functionality which is now gone because it
> was so complicated. But that only works if there is one user that
> should be charged for the buffer anyway. What if it is shared by
> multiple applications and services?
>

Usually there is a user intent behind the action that causes the
memory allocation, i.e. user opens camera app, user runs instagram
which opens camera, and uses GPU filters etc.

The charge should be to the application or cgroup that causes the
intent, if multiple applications/services are sharing a buffer, what
is the intent behind how that happens, is there a limit on how to make
more of those shared buffers get allocated, what drives that etc.

If there are truly internal memory allocations like evictions or
underlying shared pages tables then maybe we don't have to account
those to a specific application, but we really want to make sure a
user intentionally cannot cause an application to consume more memory,
so at least for Android I'd try and tie it to user actions and account
to that process.

On desktop Linux, I would say firefox or gtk apps are the intended
users of any compositor allocated buffers (not that we really have
those now I don't think).

if there are caches of allocations that should also be tied into
cgroups, so memory pressure can reclaim them.

Dave.
