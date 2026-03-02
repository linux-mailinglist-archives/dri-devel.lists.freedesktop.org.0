Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GyZIZrmpWlLHwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 20:35:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C738B1DEDB8
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 20:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AD810E305;
	Mon,  2 Mar 2026 19:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="m27Lur8q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71C010E305
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 19:35:50 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-48373ad38d2so11925e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 11:35:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772480149; cv=none;
 d=google.com; s=arc-20240605;
 b=b7FgBfocJ5tfSuJ1a8VAuj9AaTtPWD/+Ih6SoNBxS1892PJYVLSnbUCLzYTbetNlUy
 aIBY0z2syidO+b3N0M6vCTFi3sLfZBg70eUDqOH7eWF98XDtFEYcXsje71hPfitVhHl6
 nlqNlcKtBEK+XTdv0pFtriRHDydzxDXRoDlITMOzmBZUTOA0LwkShLM9aXomzrSTXB4r
 q5dcS6GTGFUSxtCY0RZTgmmnCspgNHkpBiQRMjkMfRP+sbT/snYWcsrwMRYBLccUNPS9
 x73keJUDP8UBhZep/FPgLMmjmAw5pDZvGKjRgJUtAh98HdQo74PwvnKGLds/YiRajj8t
 a0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=BY6y+PcOr2weOd72FiZeoQi95+Yc0oAk8sWZFR4JOsM=;
 fh=UV7ynuZ/oqmiOLYp4MyQz+w07xbWPlxo6IkdGUucjZs=;
 b=DMVpclfm3w6FRPgbj+Oz4fbEEmGj9Lu4+erHUjXyJ+9pd8wH9njFJjwFbEvIAmdjOe
 oQxZzamfITuhge/yQaXaBICmFkeiXujDjOzaAhLg5/itPhcnE2l4MLEhM6bfd4KpVwe7
 aw3auB1jkfOJAzrNd3k6OmQJa7t4uHgMEcoUGXdUu/rwKxLs6gktivZan7vKaEeu/sOE
 YyciN30LxrNL9uc1qoV9NNCQN42z8sKZb/VMkPhs0M2TGexbiWCzljej6JCNyZarrmnw
 AQ+6tgYlMB1kXR0zfML0q5MQ5GKGDU0S0ICK/+PlOY02faYI1eaSmtuhv8qfzg/7iE6D
 3cbQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772480149; x=1773084949;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BY6y+PcOr2weOd72FiZeoQi95+Yc0oAk8sWZFR4JOsM=;
 b=m27Lur8q7rvGWI0VVB+iWn5t391D2svqvvwJyZRkfmpMS3TgKkGrCnCWNUloY+x1iP
 mmJTx/B0V2BUQH7XamzIpZbxaYKy1bFgs5aiTHYTf+1wuMKxiA6wzGeKbY/x9Tl4n3gL
 E2IlW6dg6CZnBCgC0ecIngvNYMWhD1CinUAMwlqgY1K90+1xNFa59AmBX/ENe1BUVuKR
 c9FayOYUFaG9fCVr8q7zXgXpz59Yk8+nRYVqtrQdOUFX5tO+OZu6md9sh+1EMcgtISq+
 WgPsB7jsWztBylLPswsJMXd/33ROtgxriu1pV0bgPA8zMdcVATny/ZXIz9NUHnutrglS
 PbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772480149; x=1773084949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BY6y+PcOr2weOd72FiZeoQi95+Yc0oAk8sWZFR4JOsM=;
 b=pMC2Lm4/U48yojMg1lmB9h137Won2BbML+g00cCKIjZjzcouzzOhWWPB+qtVqxsugs
 I72jeCQQHcBZE6Vg+hMePTcDGRxLCSzbOUjSqDf8ksRhAbkWZvT6Zi3rQY2pblZH/f7i
 cxP5qyd4560ZJr8V3nDLDxesyt0bItArsKmtj9mw8v9IhlhHQpyymsABU6UWMNoOUbR1
 mOIlTwFIKogw0JZeP0XBfnykpg+hCS7dUT6SWdZQ4T84NrDLqLQ7NJaWrUO0KuQi5+rP
 nOA8qkwP6n7wQIkEUDAvW0xc7rxph+VVzkw1TJes09Axk4abMtZc1l9+0wvehuIAwyhZ
 UNKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkSQn0mnY0Ho4LM9xDWAWvyOfQhRxfnNiZer1h1dNU0AFKWmZ9zfSjY6xyDaGVyccl7115IwUwYnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzKcttRXe1RgAaWIl+3lBchEysi2znjcMCQ2ywldd1NH4XsHxw
 83evkFs7+gP6NXr0Adpa/HHXHYmLDbr3thMf73JRlQUeiDy2AdpOkKyAH3eMR0rcky0wWbttyEl
 AQSyfYScmhfjPnxMTemir4kq+GXVLmTvsJpTNTKkD
X-Gm-Gg: ATEYQzyAmYkzVJaHohSPVeddhClRdyReIriAOR3i/gWGMMP451YvaTMkuOs5vxsXqlP
 BOhmcJLraa76P0hDvDgh+8Q6nSdTWFQJWaQpKyY2QsVhlTiAj8oIEtNfu/HeT1R1Gwy+0Wf/YIZ
 cf9Fqjnds+b2KOjZ+H+X6z4K7YSQf/KM9XBF7xdV8wbtSYY4iSQc7nzki3c3/+ZgSX091YZFXRd
 f3T3/0HLhgcsTXNVf3tJp73NVViIklplcllVNalQwIbtdXtzyFU+ft/sVIqvPJoYVo7UW5Myhfi
 VxP0S1hlOmGrS67E79xmIwUS5Ai5j+Hvn3yaag==
X-Received: by 2002:a05:600c:b4d:b0:47b:deb9:15ca with SMTP id
 5b1f17b1804b1-483d0606017mr1472655e9.3.1772480148894; Mon, 02 Mar 2026
 11:35:48 -0800 (PST)
MIME-Version: 1.0
References: <20260224020854.791201-1-airlied@gmail.com>
 <20260224020854.791201-8-airlied@gmail.com>
 <ee914ffb-5c3d-4d41-abdb-5ed02db326c6@amd.com>
 <CAPM=9txUuS-qzA+gX2DvTuYR2OZ79RG86FuDA6czkpuJ_SR6KQ@mail.gmail.com>
 <4fddf319-50c4-40ab-9e36-04d629a8855e@amd.com> <aaWZrTZGsxxjbBYv@linux.dev>
 <8efef755-e429-4cec-bef4-b15b3f9f4632@amd.com> <aaWuoe_CQwbtcxEY@linux.dev>
 <63dccd9c-f2e5-421e-ac3a-a7c13cec9121@amd.com>
In-Reply-To: <63dccd9c-f2e5-421e-ac3a-a7c13cec9121@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 2 Mar 2026 11:35:36 -0800
X-Gm-Features: AaiRm51KCL2nDutxmU7MXZZE-iw_Km39J2t5ovf3bUQsdBZPTuZ8g_DowZvUqgk
Message-ID: <CABdmKX0=xPiwXgOHskGkE9Umj5=NrC=7OtngJjrm=mtOZmyzvA@mail.gmail.com>
Subject: Re: [PATCH 07/16] memcg: add support for GPU page counters. (v4)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Dave Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, tj@kernel.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>, 
 Waiman Long <longman@redhat.com>, simona@ffwll.ch, 
 Suren Baghdasaryan <surenb@google.com>
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
X-Rspamd-Queue-Id: C738B1DEDB8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:shakeel.butt@linux.dev,m:airlied@gmail.com,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:roman.gushchin@linux.dev,m:muchun.song@linux.dev,m:cgroups@vger.kernel.org,m:david@fromorbit.com,m:longman@redhat.com,m:simona@ffwll.ch,m:surenb@google.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[tjmercier@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,lists.freedesktop.org,kernel.org,cmpxchg.org,vger.kernel.org,fromorbit.com,redhat.com,ffwll.ch,google.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,amd.com:email]
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 7:51=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 3/2/26 16:40, Shakeel Butt wrote:
> > +TJ
> >
> > On Mon, Mar 02, 2026 at 03:37:37PM +0100, Christian K=C3=B6nig wrote:
> >> On 3/2/26 15:15, Shakeel Butt wrote:
> >>> On Wed, Feb 25, 2026 at 10:09:55AM +0100, Christian K=C3=B6nig wrote:
> >>>> On 2/24/26 20:28, Dave Airlie wrote:
> >>> [...]
> >>>>
> >>>>> This has been a pain in the ass for desktop for years, and I'd like=
 to
> >>>>> fix it, the HPC use case if purely a driver for me doing the work.
> >>>>
> >>>> Wait a second. How does accounting to cgroups help with that in any =
way?
> >>>>
> >>>> The last time I looked into this problem the OOM killer worked based=
 on the per task_struct stats which couldn't be influenced this way.
> >>>>
> >>>
> >>> It depends on the context of the oom-killer. If the oom-killer is tri=
ggered due
> >>> to memcg limits then only the processes in the scope of the memcg wil=
l be
> >>> targetted by the oom-killer. With the specific setting, the oom-kille=
r can kill
> >>> all the processes in the target memcg.
> >>>
> >>> However nowadays the userspace oom-killer is preferred over the kerne=
l
> >>> oom-killer due to flexibility and configurability. Userspace oom-kill=
ers like
> >>> systmd-oomd, Android's LMKD or fb-oomd are being used in containerize=
d
> >>> environments. Such oom-killers looks at memcg stats and hiding someth=
ing
> >>> something from memcg i.e. not charging to memcg will hide such usage =
from these
> >>> oom-killers.
> >>
> >> Well exactly that's the problem. Android's oom killer is *not* using m=
emcg exactly because of this inflexibility.
> >
> > Are you sure Android's oom killer is not using memcg? From what I see i=
n the
> > documentation [1], it requires memcg.

LMKD used to use memcg v1 for memory.pressure_level, but that has been
replaced by PSI which is now the default configuration. I deprecated
all configurations with memcg v1 dependencies in January. We plan to
remove the memcg v1 support from LMKD when the 5.10 and 5.15 kernels
reach EOL.

> My bad, I should have been wording that better.
>
> The Android OOM killer is not using memcg for tracking GPU memory allocat=
ions, because memcg doesn't have proper support for tracking shared buffers=
.
>
> In other words GPU memory allocations are shared by design and it is the =
norm that the process which is using it is not the process which has alloca=
ted it.
>
> What we would need (as a start) to handle all of this with memcg would be=
 to accounted the resources to the process which referenced it and not the =
one which allocated it.
>
> I can give a full list of requirements which would be needed by cgroups t=
o cover all the different use cases, but it basically means tons of extra c=
omplexity.

Yeah this is right. We usually prioritize fast kills rather than
picking the biggest offender though. Application state (foreground /
background) is the primary selector, however LMKD does have a mode
(kill_heaviest_task) where it will pick the largest task within a
group of apps sharing the same application state. For this it uses RSS
from /proc/<pid>/statm, and (prepare to avert your eyes) a new and out
of tree interface in procfs for accounting dmabufs used by a process.
It tracks FD references and map references as they come and go, and
only counts any buffer once for a process regardless of the number and
type of references a process has to the same buffer. I dislike it
greatly.

My original intention was to use the dmabuf BPF iterator we added to
scan maps and FDs of a process for dmabufs on demand. Very simple and
pretty fast in BPF. This wouldn't support high watermark tracking, so
I was forced into doing something else for per-process accounting. To
be fair, the HWM tracking has detected a few application bugs where
4GB of system memory was inadvertently consumed by dmabufs.

The BPF iterator is currently used to support accounting of buffers
not visible in userspace (dmabuf_dump / libdmabufinfo) and it's a nice
improvement for that over the old sysfs interface. I hope to replace
the slow scanning of procfs for dmabufs in libdmabufinfo with BPF
programs that use the dmabuf iterator, but that's not a priority for
this year.

Independent of all of that, memcg doesn't really work well for this
because it's shared memory that can only be attributed to a single
memcg, and the most common allocator (gralloc) is in a separate
process and memcg than the processes using the buffers (camera,
YouTube, etc.). I had a few patches that transferred the ownership of
buffers to a new memcg when they were sent via Binder, but this used
the memcg v1 charge moving functionality which is now gone because it
was so complicated. But that only works if there is one user that
should be charged for the buffer anyway. What if it is shared by
multiple applications and services?

> Regards,
> Christian.
>
> >
> > [1] https://source.android.com/docs/core/perf/lmkd
> >
> >>
> >> See the multiple iterations we already had on that topic. Even includi=
ng reverting already upstream uAPI.
> >>
> >> The latest incarnation is that BPF is used for this task on Android.
> >>
> >> Regards,
> >> Christian.
>
