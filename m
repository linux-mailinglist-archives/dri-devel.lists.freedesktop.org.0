Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2391BA9FA08
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 21:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3746F10E6F7;
	Mon, 28 Apr 2025 19:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="D+PYCeCV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A42610E24A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 19:57:14 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-47681dba807so6291cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 12:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1745870233; x=1746475033;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KUGna70WQpCWkTeNNt6g447tdKBI53CPsya1LM9jehw=;
 b=D+PYCeCVaxQ33uTfJDj82FwVZoY3AIsveLEZzRCbSvul1hb+emoJiN3BMjvJCk/BRV
 E3D54Bd1O0I8lDRCTdug0WPxT9pZ1ZRHGP8Wo9ZgKWV2Dvofbk1LtzQjK79I7V4ScEYm
 mhYhO0Q7JC+N6CubUg6nOucU6s6iF0bDZkqFVt0813FSYroGkjVMeFjk8SXgB0dJnhOv
 jz8BCFIG+hPTQL1cxjguaZfqaEX8C3jdLarOJNt99mFt1+nG4X1EsX6TV9oUvOVTV/DT
 PlyXBOUX4/0UWSyuTjOL5xpm0Y1tzezkRKPxDLOqN/hz8F/T2GRA8D/EFST//BuisZsP
 QfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745870233; x=1746475033;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KUGna70WQpCWkTeNNt6g447tdKBI53CPsya1LM9jehw=;
 b=UEg98Jn5zuQf798/comdXc69Yr87oeQiGKow0BoZXXkONqXo3/yXxuLgGUgPfWq3p9
 BkQEbV+sAk2a0/U2SD4jhBNMbwUDzJ9W08WE6OoPNU4DoZAkjvAwH8IrC0oJ51s9fkS9
 62JIuLT10QGwnaTYnIwAckq5hp2WDTSx7gSHGTRTgF+TEKrkdqauQCUg4mQWFV8zZK27
 BPM/fgYhtdmkUA0gKSH36aeeek2253BYh+kr2PI6ykyu7MQv2Y/e5gU4wwdJtkA9YlE5
 9eGr4pRS2hkHe/LPFHeSFWeXFy5l/buI3hMaLX+fXhG07SSAMKNSvu4hNSRMLZq8OV9C
 Nk9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrJRMNGKg/vCZf5gMUeLJiftxMnv6KUXeWYGe1N7HOGioBfvJnqLnin260B/l4ELFLSfZHHNPmVxo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8J48xggkvXmjUoqQvlrC8tGElEIh9d/igUXZRTRNzY5869R8a
 OCkiHuLGIPX0SfSlpwV3+NMr7tEKaKzqpW/Tfxxb68NycC2DFrE0gitseb2P/+pglgBZJNhuvVC
 tHBvhEobbO0bBysjB4VP81wTfMWdiyD0tnGDF
X-Gm-Gg: ASbGncvsdMwFzqCgZ/TdwCj7GqiOYu3o+gci9eItGC7+hTA8Q2jiYt3sp4GuLgPMoK0
 ipwGeZDPkzJzW3aMwQDWY40guciEcfFzXWFbSvE+L2wqZvyyP9riruN1JdFyo545tMeYJJ0GYcz
 by2k3riTQK7q8DAYYHqQZL
X-Google-Smtp-Source: AGHT+IEhejaHFThaKwhJCfo8/xHV6yGo88io+XsVdICYQukFeW24MAIkT6Fi1xOMkVwdW/FKQmmwSk2eKpS9NWkWZlM=
X-Received: by 2002:a05:622a:452:b0:480:1561:837f with SMTP id
 d75a77b69052e-4885aacab9cmr871171cf.8.1745870232933; Mon, 28 Apr 2025
 12:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-6-david@redhat.com>
 <aAvvQ1h9bg11hiqI@x1.local> <bbadf008-9ffc-4628-9809-2d8cf104a424@redhat.com>
 <aA-n9hvSX9JLsRM-@x1.local> <7a26e29c-d889-450a-a5e1-ce671f09e4c8@redhat.com>
 <aA-rtji7ujQgckbM@x1.local> <884fab29-e16a-4663-8e33-885bc70ca2f7@redhat.com>
 <f08118b3-0736-4a5d-b780-8e3d88f45c02@lucifer.local>
In-Reply-To: <f08118b3-0736-4a5d-b780-8e3d88f45c02@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 28 Apr 2025 12:57:02 -0700
X-Gm-Features: ATxdqUFN4dSm5xUeBut-iPBeU1VBNXf3LtoK4Lvt9a17IgRXhS8pQBx8VXvr8KE
Message-ID: <CAJuCfpEtnBrAkSV-6PDv4Au5gs02vWYeMNHo3OxZb8NB0sy8cw@mail.gmail.com>
Subject: Re: [PATCH v1 05/11] mm: convert VM_PFNMAP tracking to pfnmap_track()
 + pfnmap_untrack()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, x86@kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>, 
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>
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

On Mon, Apr 28, 2025 at 12:37=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Mon, Apr 28, 2025 at 07:23:18PM +0200, David Hildenbrand wrote:
> > On 28.04.25 18:24, Peter Xu wrote:
> > > On Mon, Apr 28, 2025 at 06:16:21PM +0200, David Hildenbrand wrote:
> > > > > Probably due to what config you have.  E.g., when I'm looking min=
e it's
> > > > > much bigger and already consuming 256B, but it's because I enable=
d more
> > > > > things (userfaultfd, lockdep, etc.).
> > > >
> > > > Note that I enabled everything that you would expect on a productio=
n system
> > > > (incld. userfaultfd, mempolicy, per-vma locks), so I didn't enable =
lockep.
> > >
> > > I still doubt whether you at least enabled userfaultfd, e.g., your pr=
evious
> > > paste has:
> > >
> > >    struct vm_userfaultfd_ctx  vm_userfaultfd_ctx;   /*   176     0 */
> > >
> > > Not something that matters.. but just in case you didn't use the expe=
cted
> > > config file you wanted to use..
> >
> > You're absolutely right. I only briefly rechecked for this purpose here=
 on
> > my notebook, and only looked for the existence of members, not expectin=
g
> > that we have confusing stuff like vm_userfaultfd_ctx.
> >
> > I checked again and the size stays at 192 with allyesconfig and then
> > disabling debug options.
>
> I think a reasonable case is everything on, except CONFIG_DEBUG_LOCK_ALLO=
C and I
> don't care about nommu.

I think it's safe to assume that production systems would disable
lockdep due to the performance overhead. At least that's what we do on
Android - enable it on development branches but disable in production.

>
> So:
>
> CONFIG_PER_VMA_LOCK
> CONFIG_SWAP
> CONFIG_MMU (exclude the nommu vm_region field)
> CONFIG_NUMA
> CONFIG_NUMA_BALANCING
> CONFIG_PER_VMA_LOCK
> CONFIG_ANON_VMA_NAME
> __HAVE_PFNMAP_TRACKING
>
> So to be clear - allyesconfig w/o debug gives us this yes? And we don't a=
dd a
> cache line? In which case all good :)
>
>
> >
> > --
> > Cheers,
> >
> > David / dhildenb
> >
>
