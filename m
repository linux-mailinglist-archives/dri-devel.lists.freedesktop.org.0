Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNUHOkCJn2nMcgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 00:44:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536E919EF3D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 00:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F0F10E840;
	Wed, 25 Feb 2026 23:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="me6/mj2k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B066B10E840
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 23:43:56 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-897023602b1so3872156d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 15:43:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772063036; cv=none;
 d=google.com; s=arc-20240605;
 b=M8y6ltD5PNgNcJF6m7HPTVuhkE8geL6t9c5LtoR2C+2a+K3eK1cXGdH03Jw8rrQZn0
 cMKLAN0g5PLoMsK2i2RQPhA404a0qYjh82HkvABLjKb+81k3MHlNpe3XbJmb28/+at1f
 xiS3Feh/al6xNL9q0FPX7HmfqCMrTswunmfu4wZLWYPbvsn6PvbZc7CQO7QEC17He9EU
 wP4Om59SGqpz6++foy7d3opKP+5e5AgZyRbhz+ikI4PvOniwllv6xIAiFuOU2F/Hs934
 ScLJI9T0FernnEq/Wooi0waSx9q8Am1zzXnlEf2lJdw4BuWlRDD1wTeVZ+3kx0DE9Srz
 4znw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=uKa/vajBWOBwhcb6ZTw/N1BLKynDSWMpaPUdswW6428=;
 fh=XafdSTYHEv2+tFFpj5T1qnRpjBqZymBGkegIGl4G6Sc=;
 b=CYq1JYO1JogAFpANzM80ZfTpCt95CvYis4OxJIrewa0lQc/O/Rf7s5qZdBbn973Hvs
 oVXPK7IrfPuZ6apl6s+b+mWfUUsj27taxm8vBLX5GMH/Hk5ivmww/rR3fQ3oTBmchC+j
 B6AT7evTpfqKv+RoXCTnZjY1oeKA4wELxHclYCao0q7n0Rulc79Q38Yo3yozYXv5BFy4
 IPMSjPY8GKEDzVpMtTsL53BIfrw3cNDWd2+wrBAU+P2iEbiLK+X9MKjoghfgG1lOjAI3
 tRI8fKxwDJrzUcK7GKOU48KkaaFVWzJImkfIZa0CV9IokD05rXC2JQTuLfWJAiQdE6w9
 H/qw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772063036; x=1772667836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uKa/vajBWOBwhcb6ZTw/N1BLKynDSWMpaPUdswW6428=;
 b=me6/mj2kFYMJnlKBYYoilMqufO3fV3ieDx2AbB6cWWTHoP8wlAu+5hI6YuMKxjgAYm
 KziFJV+P2D7ELJrDoIA9n3pzsdeFWB5rug0MVHmbyqp9h1QxZTTcR3nuXzmp1kgOgC5u
 TpS+qN/pD/uh3pcKOXQoRfdnSE4H95nbj8IcWC02eEgpfId4smivY7P1mz7WpY4l+J0G
 TmT40VslauwnDFjh0kSGrxNmg0OqGohJftFtfeO2DAd8L42diNovRVqQh7iP08DIb0cX
 SOmzwo3zsvOsNSYF/fA7hVZDr77Plfi71UDVODD7mkr/qJsfZLoEXj7DWb2OzX6P3Cr1
 VPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772063036; x=1772667836;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uKa/vajBWOBwhcb6ZTw/N1BLKynDSWMpaPUdswW6428=;
 b=VYnXmoF9cV9qo2NpHzrAbFZ18mNpG21u+zRqLCZWxPu/BSQ6QLPMlIDR5irCT3ilzR
 I1r9FSjs2G4VDRVFfduD5TowY0S5hlUmYIexgcncpwJyTHUTZie/0drpnIpSlG2q9huq
 TeOzhEipSVeYgR98P5yDoCFuGPKYTy86agEOx1d+pjJrRjHGab7OsJsPgXu2H3RaGj7O
 F939hWodgzE7XmrlAL07dPNnZPn8QaYjy3/FhLGtbZKzCbZDQhDj9/RWs0Hf5150/PRY
 3t0WSGu0EfzvGOQoM9f97DOR3X6AcnFbGnskVjYGMm6Z2PeP9kxb0MySGO7xpqe/ZsPk
 XT8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDXKCM8NN2rym6D5S4KaAGxOn8+Qz1sM3mJB5bF5I4h5HyfPYts7O151XqAzfZIK78/+epkxq/4XE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylLxhvSpVeh0kWDPvQxaYR1LmuJ/tZh8gT+aGkbKfwORWgOwaT
 LBLReK8jZfKuZ5Yqcr/+tVTMDyWm6jDXEKMgVnS0FjJluvxmm29znbCG3NopMpMzaEKTXwDih1k
 dL7AeDR6bYmyIMxU+u9Lu12uN3Yb1mL0=
X-Gm-Gg: ATEYQzwUH04SGM2MEIuphOPBSqifCABJ1I46qZad41pVN/GRQnGjUONbH16bI3SUWJx
 VKY2K0IkY4R4hJ99q9UECNH8VfykwFBrpEDpOw8GHBqkm3kp/PYUm6ne1FoJ12uZ0kkI5/pQgcx
 0g5WXaqxYDMMxErMm4P5flfP3BzPKKlSrRSgqNIeONgNCU8suHaFjw5A67cAZDI3w36jV/1riYN
 /oNt7fJ4sOoPtPRRE04issVtT4OnPAPrpWHnQZpvpBsGCuCHa890t/b/6kGznv2cFh2mnRL371U
 hr53OSZ0EcR6Nt/rtBV091SAaDGmYTjwLZ7kgdhXVVUTYl3dG5tBhV9MJrNJqRkhCxM=
X-Received: by 2002:a05:6214:dc5:b0:899:ac2b:6ddc with SMTP id
 6a1803df08f44-899c8065c8emr3236056d6.62.1772063035679; Wed, 25 Feb 2026
 15:43:55 -0800 (PST)
MIME-Version: 1.0
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com>
 <a446b598-5041-450b-aaa9-3c39a09ff6a0@amd.com>
 <20260224-solemn-spider-of-serendipity-0d8b94@houat>
 <56400505-8a13-4cb2-864c-cb785e4b38d4@amd.com>
In-Reply-To: <56400505-8a13-4cb2-864c-cb785e4b38d4@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 26 Feb 2026 09:43:43 +1000
X-Gm-Features: AaiRm50TeEvqc50OnpAEgaAX78C2joyWBAyYfH_ecZDl20ZLik30HZzrg2UNE4M
Message-ID: <CAPM=9ty5mbMAVHPO4mRy1jKGnpChr7gK6uMtco2=j7MMJGpZdg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maxime Ripard <mripard@redhat.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Eric Chanudet <echanude@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, linux-mm@kvack.org, 
 Yosry Ahmed <yosryahmed@google.com>, Shakeel Butt <shakeel.butt@linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:mripard@redhat.com,m:tjmercier@google.com,m:echanude@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:aesteve@redhat.com,m:linux-mm@kvack.org,m:yosryahmed@google.com,m:shakeel.butt@linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 536E919EF3D
X-Rspamd-Action: no action

On Tue, 24 Feb 2026 at 20:32, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 2/24/26 10:43, Maxime Ripard wrote:
> > Hi Christian,
> >
> > On Fri, Feb 20, 2026 at 10:45:08AM +0100, Christian K=C3=B6nig wrote:
> >> On 2/20/26 02:14, T.J. Mercier wrote:
> >>> On Wed, Feb 18, 2026 at 9:15=E2=80=AFAM Eric Chanudet <echanude@redha=
t.com> wrote:
> >>>
> >>> Hi Eric,
> >>>
> >>>> An earlier series[1] from Maxime introduced dmem to the cma allocato=
r in
> >>>> an attempt to use it generally for dma-buf. Restart from there and a=
pply
> >>>> the charge in the narrower context of the CMA dma-buf heap instead.
> >>>>
> >>>> In line with introducing cgroup to the system heap[2], this behavior=
 is
> >>>> enabled based on dma_heap.mem_accounting, disabled by default.
> >>>>
> >>>> dmem is chosen for CMA heaps as it allows limits to be set for each
> >>>> region backing each heap. The charge is only put in the dma-buf heap=
 for
> >>>> now as it guaranties it can be accounted against a userspace process
> >>>> that requested the allocation.
> >>>
> >>> But CMA memory is system memory, and regular (non-CMA) movable
> >>> allocations can occur out of these CMA areas. So this splits system
> >>> memory accounting between memcg (from [2]) and dmem. If I want to put
> >>> a limit on system memory use I have to adjust multiple limits (memcg =
+
> >>> dmems) and know how to divide the total between them all.
> >>>
> >>> How do you envision using this combination of different controllers?
> >>
> >> Yeah we have this problem pretty much everywhere.
> >>
> >> There are both use cases where you want to account device allocations
> >> to memcg and when you don't want that.
> >>
> >> From what I know at the moment it would be best if the administrator
> >> could say for each dmem if it should account additionally to memcg or
> >> not.
> >>
> >> Using module parameters to enable/disable it globally is just a
> >> workaround as far as I can see.
> >
> > That's a pretty good idea! It would indeed be a solution that could
> > satisfy everyone (I assume?).
>
> I think so yeah.
>
> From what I have seen we have three different use cases:
>
> 1. local device memory (VRAM), GTT/CMA and memcg are completely separate =
domains and you want to have completely separate values as limit for them.
>
> 2. local device memory (VRAM) is separate. GTT/CMA are accounted to memcg=
, you can still have separate values as limit so that nobody over allocates=
 CMA (for example).
>
> 3. All three are accounted to memcg because system memory is actually use=
d as fallback if applications over allocate device local memory.
>
> It's debatable what should be the default, but we clearly need to handle =
all three use cases. Potentially even on the same system.


Give me cases where 1 or 3 actually make sense in the real world.

I can maybe take 1 if CMA is just old school CMA carved out preboot so
it's not in the main memory pool, but in that case it's just equiv to
device memory really

If something is in the main memory pool, it should be accounted for
using memcg. You cannot remove memory from the main memory pool
without accounting for it. Now we can add gpu limits to memcg, that
was going to me a next step in my series.

Whether we have that as a percentage or a hard limit, we would just
say GPU can consume 95% of the configured max for this cgroup.

3 to me just sounds like we haven't figured out fallback or
suspend/resume accounting yet, which is true, but I'm not sure there
is a reason for 3 to exist outside of the we don't know how to account
for temporary storage of swapped out VRAM objects.

Like it might be we need to have it so we have a limited transfer pool
of system memory for VRAM objects to "live in" but we move them to
swap as soon as possible once we get to the limit on that. Now what we
do on systems where no swap is available, that gets into I've no idea
space.

Static partitioning memcg up into a dmem and memcg isn't going to
solve this, we should solve it inside memcg.

Dave.
