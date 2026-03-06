Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDDwF0FnqmlOQwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 06:33:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C44C321BBE1
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 06:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1F810E243;
	Fri,  6 Mar 2026 05:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PJl/0rVm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com
 [74.125.224.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD88410E243
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 05:33:48 +0000 (UTC)
Received: by mail-yx1-f48.google.com with SMTP id
 956f58d0204a3-64ca09f2056so6485974d50.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 21:33:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772775228; cv=none;
 d=google.com; s=arc-20240605;
 b=O7LBI+m/BGgaDEQyIzVxqLA/w7ClGekC4/4hWbNzXGuME/injHt6pGTRQv47Gq2E3Q
 ymgp8R8PvI58Pp9WAfOI3QbxOKEHME14sAzD1C7TDYcoiyPLECTpR/BktmfvgZO2FYcm
 t0GjOLID51XE8USF/K1qXpezLobE0Rh2kk/UvSPyNzcOSMCNMI3potetKy79Vm8wkQbJ
 AljSHLkfo3KdjxgtrcyknQ/okHDB7g/2V647IFqySXe/iYCTNEVxNX3osxyvyQRsvqkE
 m8cY/DEb4zBQvxMM/T2z816S1AetwdNeZv1xJlCkpKyWarmJpuA6NKVPwHxZbM1WHFT1
 fDPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=V2UpvAUsvEfYuRtRoQDGDh0bnP4CHYXvodHKQxJ2WGM=;
 fh=CBuBEGox0rmkkn/sM6bSZmSooEnTOXqQTD4OeEPq9WM=;
 b=KHL1xIsyKoUrBBmRgKmLKLFwDt/6Nk4GRY4wHEQcVor4Ol2cdhu+dbzKbknuCHn0Ed
 lgBEEibXqTSK6zYINVNf+OX6hiMRSjsjMVFN6o9eAQ4HO0ATveuC7RxGMl3G+Q1zmkT6
 m5asD+prHuSdobA6YhpAyUZuCcKqHyjR7rM0a3o/U5itNw2G8JNQyUK/GPOR/6zCA7QD
 AnNtzY+JwYHarDTYZiZK32oguadPBhjGQvhjr4I1Nm7zZmAo/pQWTkEmgxb/T6ZDkz/k
 5zMuI3QzhWqWUZ6Z76wBxPXQX4F+adOubN+4o5oIncnPbiOhhradYxBycn2/FMF1yfTq
 dKpg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772775228; x=1773380028; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V2UpvAUsvEfYuRtRoQDGDh0bnP4CHYXvodHKQxJ2WGM=;
 b=PJl/0rVmHl15YOPLCI7CpJw+pEZeyLIvSYafZn3AeF25GpLzipsBYLXDhj+Oj1BqUM
 cbIYgVKsfsRw2s5UXHFM2hezIeqhiBki2qpTuHwejCdlZgAe+/OS+OBqMVqVhU9vaRfc
 OFYJGIuzkHjY92kimvo12jwYSpACpJNeIXBpX9ETCc0hXyJ9YQtF5c0a6pvauRcgt2mf
 qUx9hsrdaphyDPx+zqGa2qB6FDQxFntfKPhWSoeHdPsRqjqiDcEvb1oM0dmfnxrhirD4
 cCmJ57p7b4a1MIyKVbnwiOvw4n0uhzclAK7Mobsy59mJCkNTR9/B6A5cVRkLTPco2j6A
 9Yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772775228; x=1773380028;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=V2UpvAUsvEfYuRtRoQDGDh0bnP4CHYXvodHKQxJ2WGM=;
 b=uS219CEzQdJwWukiqMoLjbdVpbceipSR9RjfntZT8052iSN0YzlZrQ2l79J4NCDxQd
 2m1negKI7kpR64luqmMz+6XHhCw6bn3JaAIeJIsQUHHYHHYRFY6vzTQsgn0262jBBilE
 Eeak5bncsO90y8MEUt21p4my5HFUwjeTt5x/74qAG9naL655golo4iwlSDowWUK0KeG9
 mvJqhCYcoy6tqQZk1L/ZgErdGcgWKcjgcG1vUaaPAbIEsMtzuXRT+WUz4bFdIQUB+2Uo
 ra0pj4dz3efW9ZBBnuoIMvJ8LzognRbyodJzZNDszQ+e/mUiNwTKmcypXJRIZOabhydg
 2IFQ==
X-Gm-Message-State: AOJu0YwU3Hrr6L2Jy+8xjsrPaHr6Fg0TzZmvg0324C+SIOryqFVA/mIG
 p4K/JU+GvGZe+H0pieLwh/OBkUZSLIv9YNR/VU6ZiyI5mUD5SXNBV3eGJDx4pAD7WCxqTz26ESa
 3Baux4gLWlgFeLT4gXWs3BX++GYIpMuY=
X-Gm-Gg: ATEYQzygxWRTfNV6Sr2ljyDavX0ehFBrBMF8IzX5p5H0AS/Sn8x3wN6HKLgPnWzsf4Q
 /9/rtvO2QhSgS83qRioBkXrnAoREQRDmbIgQ79CZUflt9kWnG8tO0A1rXuT+/8WiwsC8ZnEqFt5
 9KzZXhZdMOkV82FLLZguOMaYYlAdrqgKqWTyOrIOMz3LKwgsxgoIv67DjzBAhkrsARUvByEIKCB
 tHVO+wDkzMM5MnxkckKqpCusXKDErA8k6LEG/ZeKBNDh8dj0EULrz/O9oRjFfhg8hVNjADpGVvb
 sJu3HJ2fTQdSSwIsdYyYUa+eJmALbXlJPnTtTYBX3zx+5pVnmWG3TdL+mR2MTrdWHrvLPE1U
X-Received: by 2002:a05:690e:d8b:b0:645:51f9:b4c0 with SMTP id
 956f58d0204a3-64d142c7f8emr910092d50.55.1772775227810; Thu, 05 Mar 2026
 21:33:47 -0800 (PST)
MIME-Version: 1.0
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <20260305102323.11b07502@fedora>
In-Reply-To: <20260305102323.11b07502@fedora>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 5 Mar 2026 21:33:36 -0800
X-Gm-Features: AaiRm50YC-9v07WzvBVfdBZY8LWjXNT9ArNxjAeeDLekJ7if8LU8pLOoMu7WurY
Message-ID: <CAPaKu7R3t0Vz3WLg0G9aAVgmWhTGQWPKc6YHsH+2cRKnUjtqow@mail.gmail.com>
Subject: Re: drm_sched run_job and scheduling latency
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 intel-xe@lists.freedesktop.org, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, open list <linux-kernel@vger.kernel.org>
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
X-Rspamd-Queue-Id: C44C321BBE1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:intel-xe@lists.freedesktop.org,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:linux-kernel@vger.kernel.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[olvaffe@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olvaffe@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 1:23=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed, 4 Mar 2026 14:51:39 -0800
> Chia-I Wu <olvaffe@gmail.com> wrote:
>
> > Hi,
> >
> > Our system compositor (surfaceflinger on android) submits gpu jobs
> > from a SCHED_FIFO thread to an RT gpu queue. However, because
> > workqueue threads are SCHED_NORMAL, the scheduling latency from submit
> > to run_job can sometimes cause frame misses. We are seeing this on
> > panthor and xe, but the issue should be common to all drm_sched users.
> >
> > Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
> > meet future android requirements). It seems either workqueue needs to
> > gain RT support, or drm_sched needs to support kthread_worker.
> >
> > I know drm_sched switched from kthread_worker to workqueue for better
> > scaling when xe was introduced.
>
> Actually, it went from a plain kthread with open-coded "work" support to
> workqueues. The kthread_worker+kthread_work model looks closer to what
> workqueues provide, so transitioning drivers to it shouldn't be too
> hard. The scalability issue you mentioned (one thread per GPU context
> doesn't scale) doesn't apply, because we can pretty easily share the
> same kthread_worker for all drm_gpu_scheduler instances, just like we
> can share the same workqueue for all drm_gpu_scheduler instances today.
> Luckily, it seems that no one so far has been using
> WQ_PERCPU-workqueues, so that's one less thing we need to worry about.
> The last remaining drawback with a kthread_work[er] based solution is
> the fact workqueues can adjust the number of worker threads on demand
> based on the load. If we really need this flexibility (a non static
> number of threads per-prio level per-driver), that's something we'll
> have to add support for.
Wait, I thought this was the exact scaling issue that workqueue solved
for xe and panthor? We needed to execute run_jobs for N
drm_gpu_scheduler instances, where N is in total control of the
userspace. We didn't want to serialize the executions to a single
thread.

Granted, panthor holds a lock in its run_job callback and does not
benefit from a workqueue. I don't know how xe's run_job does though.

>
> For Panthor, the way I see it, we could start with one thread per-group
> priority, and then pick the worker thread to use at drm_sched_init()
> based on the group prio. If we need something with a thread pool, then
> drm_sched will have to know about those threads, and do some load
> balancing when queueing the works...
>
> Note that someone at Collabora is working on dynamic context priority
> support, meaning we'll have to be able to change the drm_gpu_scheduler
> kthread_worker at runtime.
>
> TLDR; All of this is doable, but it's more work (for us, DRM devs) than
> asking RT prio support to be added to workqueues.

It looks like WQ_RT was last brought up in

  https://lore.kernel.org/all/aPJdrqSiuijOcaPE@slm.duckdns.org/

Maybe adding some form of bring-your-own-worker-pool support to
workqueue will be acceptable?

>
> > But if drm_sched can support either
> > workqueue or kthread_worker during drm_sched_init, drivers can
> > selectively use kthread_worker only for RT gpu queues. And because
> > drivers require CAP_SYS_NICE for RT gpu queues, this should not cause
> > scaling issues.
>
> I think, whatever we choose to go for, we probably don't want to keep
> both models around, because that's going to be a pain to maintain.
