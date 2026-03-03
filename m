Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOinDpIZp2m+dgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:25:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EBD1F497A
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37A110E897;
	Tue,  3 Mar 2026 17:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4jZ6YGBT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3403C10E897
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 17:25:34 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-48371d2f661so66535e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 09:25:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772558733; cv=none;
 d=google.com; s=arc-20240605;
 b=Fk/buHIWRrYSk/LYBuPOjo4L4pOfUMAWMmlWtuH68spv8mJQRb+pQZ2FScss745szM
 /QeYbm9Z/qV5YZ2jB4IejozPVTtf/LgfkfqF9OWUW7JU2Rv/VbdzWttWMikKITWn+oqz
 tMQqDjPAfDbYJoOZqBcfaWuw8lrRDv8bQFh9BCALj99Fsa0h0dSLncnJd11o46Ek366v
 WX3sp7y4XvVqYNTNtzo7mUHxcW5dVBLo22XzR89QpSbZ0lFVB4ACQZXdf+6ITxRcP9qm
 j594sN3az9gbPe2rDnmQRQb2KHq93Ra6ywh9CfgZhHBXiXxmgqYzhUpSwOzk/OEVBSho
 u5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=p1noxESLu0MA7brXm1knWmLWb8wfzHlE5EPnaIYYBgQ=;
 fh=k9hqCJEYq7ISGmjJ4fU+qxo5vEPY+SHBsQoJGjIkqcQ=;
 b=ikfHpb4SxXP+TkU3zzFN42k10gthX8Pf3j5bs0k8wWb8pizq893zU+vDgjNSG3V6e+
 CxRqZeFfi7fTnTfX+DycqqUh3C6zSIWW4YKA24CyP/ZBbXObBruUcE5FljyndMf/jry1
 C73nc8LkPBZEKgQbvoGwnnp+GF92aRr259X4QoTkRI06ppu3mTxzSAFuwAQBZkWePgrv
 ZCpHZjkS5Zc6NFy9+pbDOPnI069vb5VeBO5KfZIaYTciQpvkU6v2YhwHbUFhP45bXqjs
 XHNrn0ek7vXjNTw3gm+4JcbIxTRj3Z9g7nz4tp2coU0JDecKOwrSkO3zGFHR+GXI9MSI
 RzPQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772558733; x=1773163533;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p1noxESLu0MA7brXm1knWmLWb8wfzHlE5EPnaIYYBgQ=;
 b=4jZ6YGBTp23ex8T/NCJTLzJhgbmzjqrs/oy6liWezzLKCF30btzYCVzcL/24zb8/Du
 KuWxNSA+9vO+ZoDGbFaKLIzVC+0aYE6gO3fv8OxyniZ937IQ4VFdrtWCYRsqbUCzaBeG
 pyrysRFco72w5zvMOZmUrYXhjcsT/of0u4mHRw7WlMY0fGZdm0jZwz4P7v/0156vkz5M
 FC0hE8dEMdWvGB27FltvdCKNXZy/c2lNHtji+Igb0HVvGo1Rlji1y30UARZrT2DvJJ87
 EIUKYnUkx/kXCpRt+nbsc48SI5WY2ug4YZME/XAHMswJSTWxGW5KzS24h47qLec32BI4
 UJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772558733; x=1773163533;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p1noxESLu0MA7brXm1knWmLWb8wfzHlE5EPnaIYYBgQ=;
 b=CpQM4Rlfc+0Fr+To+hPwJJd1dbqLFuprbJdv6qIsfKPkKyljpSDt0H4t6FdP1PqxX4
 jmZBQynoBvOEnN3yELIPfXRoFSjqvqytCG8v9XnUzlhFDPoToNov5fDa/QceGMpbuVCT
 iQbBXYbCkbOJqvnbCDmHEMBEwv51Nc2R2UiCOJkqb6WlpehXSql1VfgccfWiJBcHzU3H
 jzxH7qAyohmpgwR6rc71sOFMzDtg2NkrR6+51gW4ff/rPTuc89jGI/G5SZTa+rustUz1
 0POnCMM2JU2EWsD3mbJl8ZvHUn0Vx9yX3OnvtD/SSVVs94BBrqCAOukobBnWaIuS165b
 MOVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU8XyIb19/jJqJUwX5RckcBVt7DvTJHEoyjlzPMfXLPawuBm0b3PD1sCnMucUWdCf8WDES8cj+bnk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDYko+1NRECGKYDhdL2eUXl4AFoxTkXx/VekCxlQpAfjIFwCND
 VXPiTSMLPQjOwnH6I0E3EFf7a9FVLqb+GN8G6e2SjASyf0t8t7azcjTflLHInsEWBoc9DYxzxY0
 ju5UGM4Wcg7y7hKdcXhyvjrb9J3LwUqKR3K53oMVR
X-Gm-Gg: ATEYQzx73luh54Ln4oguHefkQy/3rPyRfV/oi1Gm3ekZ23zucFJSZVsM7CgZhCwugJw
 uIFJ93E0CJ0OYpkkIwROtxhMdyqBLqMj8/3zGvMFccWMSmKAlRPomtyxyz1WItgZ/vmEOSrilKB
 OXTDBdkN6EyyBJYRsvStXd9FQw1qk4XWooxihN1eij436nBOmlJfNd3MoOKgWAC8bPQ2lU3iAgm
 ALfGnVq32vXhOeeF5fhfTKItQ/D7oasVitZIqVaFDhl6G6vCO7FOrVO73sCfGxuxvVWr6DkaC46
 QuzLRvJjubO0itIh6PDqa3+9hbjhAqM0O51xf/Z4lCY3ra9rvyKhq6Mfay6fValUumTprA==
X-Received: by 2002:a05:600c:8a09:10b0:480:683f:743d with SMTP id
 5b1f17b1804b1-483ce5f6f44mr2585095e9.14.1772558732287; Tue, 03 Mar 2026
 09:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20260224020854.791201-1-airlied@gmail.com>
 <20260224020854.791201-8-airlied@gmail.com>
 <ee914ffb-5c3d-4d41-abdb-5ed02db326c6@amd.com>
 <CAPM=9txUuS-qzA+gX2DvTuYR2OZ79RG86FuDA6czkpuJ_SR6KQ@mail.gmail.com>
 <4fddf319-50c4-40ab-9e36-04d629a8855e@amd.com> <aaWZrTZGsxxjbBYv@linux.dev>
 <8efef755-e429-4cec-bef4-b15b3f9f4632@amd.com> <aaWuoe_CQwbtcxEY@linux.dev>
 <63dccd9c-f2e5-421e-ac3a-a7c13cec9121@amd.com>
 <CABdmKX0=xPiwXgOHskGkE9Umj5=NrC=7OtngJjrm=mtOZmyzvA@mail.gmail.com>
 <614c3c39-1e11-4da4-b5ac-b8a6432dac7e@amd.com>
In-Reply-To: <614c3c39-1e11-4da4-b5ac-b8a6432dac7e@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 3 Mar 2026 09:25:19 -0800
X-Gm-Features: AaiRm53VHwY8zV-TMy3I5_8lCkvRhnZh3B-ppjhkgf1ohUtm3OVoU6SM37bueEs
Message-ID: <CABdmKX3MRdzVTFQcB+Z-6LkGbUxf2a04MTyjPpBSP0bfzRLB5A@mail.gmail.com>
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
X-Rspamd-Queue-Id: 91EBD1F497A
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,wikipedia.org:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 1:29=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 3/2/26 20:35, T.J. Mercier wrote:
> > On Mon, Mar 2, 2026 at 7:51=E2=80=AFAM Christian K=C3=B6nig <christian.=
koenig@amd.com> wrote:
> >>
> >> On 3/2/26 16:40, Shakeel Butt wrote:
> >>> +TJ
> >>>
> >>> On Mon, Mar 02, 2026 at 03:37:37PM +0100, Christian K=C3=B6nig wrote:
> >>>> On 3/2/26 15:15, Shakeel Butt wrote:
> >>>>> On Wed, Feb 25, 2026 at 10:09:55AM +0100, Christian K=C3=B6nig wrot=
e:
> >>>>>> On 2/24/26 20:28, Dave Airlie wrote:
> >>>>> [...]
> >>>>>>
> >>>>>>> This has been a pain in the ass for desktop for years, and I'd li=
ke to
> >>>>>>> fix it, the HPC use case if purely a driver for me doing the work=
.
> >>>>>>
> >>>>>> Wait a second. How does accounting to cgroups help with that in an=
y way?
> >>>>>>
> >>>>>> The last time I looked into this problem the OOM killer worked bas=
ed on the per task_struct stats which couldn't be influenced this way.
> >>>>>>
> >>>>>
> >>>>> It depends on the context of the oom-killer. If the oom-killer is t=
riggered due
> >>>>> to memcg limits then only the processes in the scope of the memcg w=
ill be
> >>>>> targetted by the oom-killer. With the specific setting, the oom-kil=
ler can kill
> >>>>> all the processes in the target memcg.
> >>>>>
> >>>>> However nowadays the userspace oom-killer is preferred over the ker=
nel
> >>>>> oom-killer due to flexibility and configurability. Userspace oom-ki=
llers like
> >>>>> systmd-oomd, Android's LMKD or fb-oomd are being used in containeri=
zed
> >>>>> environments. Such oom-killers looks at memcg stats and hiding some=
thing
> >>>>> something from memcg i.e. not charging to memcg will hide such usag=
e from these
> >>>>> oom-killers.
> >>>>
> >>>> Well exactly that's the problem. Android's oom killer is *not* using=
 memcg exactly because of this inflexibility.
> >>>
> >>> Are you sure Android's oom killer is not using memcg? From what I see=
 in the
> >>> documentation [1], it requires memcg.
> >
> > LMKD used to use memcg v1 for memory.pressure_level, but that has been
> > replaced by PSI which is now the default configuration. I deprecated
> > all configurations with memcg v1 dependencies in January. We plan to
> > remove the memcg v1 support from LMKD when the 5.10 and 5.15 kernels
> > reach EOL.
> >
> >> My bad, I should have been wording that better.
> >>
> >> The Android OOM killer is not using memcg for tracking GPU memory allo=
cations, because memcg doesn't have proper support for tracking shared buff=
ers.
> >>
> >> In other words GPU memory allocations are shared by design and it is t=
he norm that the process which is using it is not the process which has all=
ocated it.
> >>
> >> What we would need (as a start) to handle all of this with memcg would=
 be to accounted the resources to the process which referenced it and not t=
he one which allocated it.
> >>
> >> I can give a full list of requirements which would be needed by cgroup=
s to cover all the different use cases, but it basically means tons of extr=
a complexity.
> >
> > Yeah this is right. We usually prioritize fast kills rather than
> > picking the biggest offender though. Application state (foreground /
> > background) is the primary selector, however LMKD does have a mode
> > (kill_heaviest_task) where it will pick the largest task within a
> > group of apps sharing the same application state. For this it uses RSS
> > from /proc/<pid>/statm, and (prepare to avert your eyes) a new and out
> > of tree interface in procfs for accounting dmabufs used by a process.
> > It tracks FD references and map references as they come and go, and
> > only counts any buffer once for a process regardless of the number and
> > type of references a process has to the same buffer. I dislike it
> > greatly.
>
> *sigh* I was really hoping that we would have nailed it with the BPF supp=
ort for DMA-buf and not rely on out of tree stuff any more.

The BPF support is still a win and I'm very happy to have it, but I
don't think there was ever a route to implementing cgroup limits on
top of it.

> We should really stop re-inventing the wheel over and over again and fix =
the shortcomings cgroups has instead and then use that one.
>
> > My original intention was to use the dmabuf BPF iterator we added to
> > scan maps and FDs of a process for dmabufs on demand. Very simple and
> > pretty fast in BPF. This wouldn't support high watermark tracking, so
> > I was forced into doing something else for per-process accounting. To
> > be fair, the HWM tracking has detected a few application bugs where
> > 4GB of system memory was inadvertently consumed by dmabufs.
> >
> > The BPF iterator is currently used to support accounting of buffers
> > not visible in userspace (dmabuf_dump / libdmabufinfo) and it's a nice
> > improvement for that over the old sysfs interface. I hope to replace
> > the slow scanning of procfs for dmabufs in libdmabufinfo with BPF
> > programs that use the dmabuf iterator, but that's not a priority for
> > this year.
> >
> > Independent of all of that, memcg doesn't really work well for this
> > because it's shared memory that can only be attributed to a single
> > memcg, and the most common allocator (gralloc) is in a separate
> > process and memcg than the processes using the buffers (camera,
> > YouTube, etc.). I had a few patches that transferred the ownership of
> > buffers to a new memcg when they were sent via Binder, but this used
> > the memcg v1 charge moving functionality which is now gone because it
> > was so complicated. But that only works if there is one user that
> > should be charged for the buffer anyway. What if it is shared by
> > multiple applications and services?
>
> Well the "usual" (e.g. what you find in the literature and what other ope=
rating systems do) approach is to use a proportional set size instead of th=
e resident set size: https://en.wikipedia.org/wiki/Proportional_set_size
>
> The problem is that a proportional set size is usually harder to come by.=
 So it means additional overhead, more complex interfaces etc...

I added /proc/<pid>/dmabuf_pss as well, which actually isn't a
horrible implementation if you consider that the entire buffer is
pinned as long as there is any user.

https://cs.android.com/android/kernel/superproject/+/common-android14-6.1:c=
ommon/fs/proc/base.c;drc=3D1b269f8eb12649ec9370f4051ae049e54a31e3fe;l=3D339=
3

With page-based memcg accounting it would be much harder and more expensive=
.

> Regards,
> Christian.
>
> >
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> [1] https://source.android.com/docs/core/perf/lmkd
> >>>
> >>>>
> >>>> See the multiple iterations we already had on that topic. Even inclu=
ding reverting already upstream uAPI.
> >>>>
> >>>> The latest incarnation is that BPF is used for this task on Android.
> >>>>
> >>>> Regards,
> >>>> Christian.
> >>
>
