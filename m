Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A7754D03E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 19:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A6D1127CA;
	Wed, 15 Jun 2022 17:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C88A89B05
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 17:43:33 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id u12so24652456eja.8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 10:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9OKDwfuRpCwMHUsOr82U4EptqN/eeIOWnuYzgUoUJwM=;
 b=JZowQJGDfQnTk0kU95m1sKqI7pMsnB8n+VnfhbnoBdYDuqItcTdyHh1XHitnSZvJxs
 pbBnvPp62mmuwua+O2LpTfQQOpz+Cp9o5tnK2s7dYrvGRRgDwOrWCebfQRZIbsgCmLwP
 7xiabpcKbcZHqcgWH7wNdOlYBbnRByyGsmBnG8kbzyqWZUeCbYE3gy1GCpR8CfebIdW9
 q0TEnsHEhHz59NQXoCiMk16k0JMhdL6UiMxKIyH5A2EoIeByHJjoxRDMqUoGJvGJhtGO
 ogYuVH3Q0kJnTvN8U/yqZlLGL1wp0XFrl1GEOJj9pWNhyMMO7jn1jzd6aYDwNRpOAUtT
 vkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9OKDwfuRpCwMHUsOr82U4EptqN/eeIOWnuYzgUoUJwM=;
 b=JADMWOt2rHDKhEfQE3SX59WATy50xv0pH4042NTaLaVQZo0clWvJKbVJkMEUVNs6Jj
 9FIYKVtIrJP8cyQ2Fx85bvR+gQzoPHFQQw0wa6pFW7hV7q5M/HpNmtMB2YXOLBeHQF1o
 j1iE4DgviBjalGZPy+5z38pUppy+RrEEQQ7/Tdroz/juD6iuhI1dJz6yuRnIeGbz90LP
 7L5YJHimhVqipaxWQ0daWYPEEsZdowrXN9sgGinLW89x8WRnjDlooO/RBp/sD5iOBcV4
 O5rhe1sr/SK4xiYEnKUG6NETKEyfO74d3gF3yVCa7hYryY6ixxbww7abuEQ07k95fOnL
 pfVg==
X-Gm-Message-State: AJIora9P+I+puj4j5JXGdrbVp7PlA6yWTtUpouRD5r6MzSPWWVjUVm0Z
 XeEC9u7gupBp6uuCs3pr8+NZ/bfKd9PF/hlW/HmB9w==
X-Google-Smtp-Source: AGRyM1vkKP5MPApS1/cJGyqGeo0v9rRjmL2yOQJfTdFBb0VciPUw3b2ftxBEFWycapFn4PShfqEGzbUwc9nC5vuKOSM=
X-Received: by 2002:a17:907:d25:b0:711:ea61:63aa with SMTP id
 gn37-20020a1709070d2500b00711ea6163aamr847740ejc.584.1655315011274; Wed, 15
 Jun 2022 10:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220516171315.2400578-1-tjmercier@google.com>
 <175c5af3-9224-9c8e-0784-349dad9a2954@amd.com>
 <CABdmKX2GcgCs1xANYPBp8OEtk9qqH7AvCzpdppj9rHXvMqWSAw@mail.gmail.com>
 <0875fa95-3a25-a354-1433-201fca81ed3e@amd.com>
 <CABdmKX1+VYfdzyVYOS5MCsr4ptGTygmuUP9ikyh-vW6DgKk2kg@mail.gmail.com>
 <YoM9BAwybcjG7K/H@kroah.com> <Yo4/XhWQkACWaPIh@phenom.ffwll.local>
 <CABdmKX2dC0fkFrCedjhzmheYiDVP4PnKBMeGkX3_bgrLjOiYOg@mail.gmail.com>
 <38da6dcd-b395-f32f-5a47-6a8f2c6a4331@amd.com>
 <YpdeLrJzmCA7OozT@phenom.ffwll.local>
In-Reply-To: <YpdeLrJzmCA7OozT@phenom.ffwll.local>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 15 Jun 2022 10:43:19 -0700
Message-ID: <CABdmKX0EWhHsrbVdYkpR0=RYuqUteq45QWzytUw7f2NXQtJEWw@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: Move sysfs work out of DMA-BUF export path
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Kalesh Singh <kaleshsingh@google.com>, 
 Minchan Kim <minchan@google.com>, Greg Kroah-Hartman <gregkh@google.com>,
 John Stultz <jstultz@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Hridya Valsaraju <hridya@google.com>,
 kernel-team@android.com, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 1, 2022 at 5:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, May 30, 2022 at 08:12:16AM +0200, Christian K=C3=B6nig wrote:
> > Am 25.05.22 um 23:05 schrieb T.J. Mercier:
> > > On Wed, May 25, 2022 at 7:38 AM Daniel Vetter <daniel@ffwll.ch> wrote=
:
> > > > On Tue, May 17, 2022 at 08:13:24AM +0200, Greg Kroah-Hartman wrote:
> > > > > On Mon, May 16, 2022 at 05:08:05PM -0700, T.J. Mercier wrote:
> > > > > > On Mon, May 16, 2022 at 12:21 PM Christian K=C3=B6nig
> > > > > > <christian.koenig@amd.com> wrote:
> > > > > > > Am 16.05.22 um 20:08 schrieb T.J. Mercier:
> > > > > > > > On Mon, May 16, 2022 at 10:20 AM Christian K=C3=B6nig
> > > > > > > > <christian.koenig@amd.com> wrote:
> > > > > > > > > Am 16.05.22 um 19:13 schrieb T.J. Mercier:
> > > > > > > > > > Recently, we noticed an issue where a process went into=
 direct reclaim
> > > > > > > > > > while holding the kernfs rw semaphore for sysfs in writ=
e (exclusive)
> > > > > > > > > > mode. This caused processes who were doing DMA-BUF expo=
rts and releases
> > > > > > > > > > to go into uninterruptible sleep since they needed to a=
cquire the same
> > > > > > > > > > semaphore for the DMA-BUF sysfs entry creation/deletion=
. In order to avoid
> > > > > > > > > > blocking DMA-BUF export for an indeterminate amount of =
time while
> > > > > > > > > > another process is holding the sysfs rw semaphore in ex=
clusive mode,
> > > > > > > > > > this patch moves the per-buffer sysfs file creation to =
the default work
> > > > > > > > > > queue. Note that this can lead to a short-term inaccura=
cy in the dmabuf
> > > > > > > > > > sysfs statistics, but this is a tradeoff to prevent the=
 hot path from
> > > > > > > > > > being blocked. A work_struct is added to dma_buf to ach=
ieve this, but as
> > > > > > > > > > it is unioned with the kobject in the sysfs_entry, dma_=
buf does not
> > > > > > > > > > increase in size.
> > > > > > > > > I'm still not very keen of this approach as it strongly f=
eels like we
> > > > > > > > > are working around shortcoming somewhere else.
> > > > > > > > >
> > > > > > > > My read of the thread for the last version is that we're ru=
nning into
> > > > > > > > a situation where sysfs is getting used for something it wa=
sn't
> > > > > > > > originally intended for, but we're also stuck with this sys=
fs
> > > > > > > > functionality for dmabufs.
> > > > > > > >
> > > > > > > > > > Fixes: bdb8d06dfefd ("dmabuf: Add the capability to exp=
ose DMA-BUF stats in sysfs")
> > > > > > > > > > Originally-by: Hridya Valsaraju <hridya@google.com>
> > > > > > > > > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > > > > > > > >
> > > > > > > > > > ---
> > > > > > > > > > See the originally submitted patch by Hridya Valsaraju =
here:
> > > > > > > > > > https://nam11.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Flkml.org%2Flkml%2F2022%2F1%2F4%2F1066&amp;data=3D05%7C01%7Cchr=
istian.koenig%40amd.com%7C8f00afd44b9744c45f5708da3e926503%7C3dd8961fe4884e=
608e11a82d994e183d%7C0%7C0%7C637891095771223650%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7=
C%7C&amp;sdata=3DpubWqUyqhCWpXHhJHsoqarc3GLtB6IFB1rhgfsL4a1M%3D&amp;reserve=
d=3D0
> > > > > > > > > >
> > > > > > > > > > v2 changes:
> > > > > > > > > > - Defer only sysfs creation instead of creation and tea=
rdown per
> > > > > > > > > > Christian K=C3=B6nig
> > > > > > > > > >
> > > > > > > > > > - Use a work queue instead of a kthread for deferred wo=
rk per
> > > > > > > > > > Christian K=C3=B6nig
> > > > > > > > > > ---
> > > > > > > > > >     drivers/dma-buf/dma-buf-sysfs-stats.c | 56 ++++++++=
++++++++++++-------
> > > > > > > > > >     include/linux/dma-buf.h               | 14 ++++++-
> > > > > > > > > >     2 files changed, 54 insertions(+), 16 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/dr=
ivers/dma-buf/dma-buf-sysfs-stats.c
> > > > > > > > > > index 2bba0babcb62..67b0a298291c 100644
> > > > > > > > > > --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> > > > > > > > > > +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> > > > > > > > > > @@ -11,6 +11,7 @@
> > > > > > > > > >     #include <linux/printk.h>
> > > > > > > > > >     #include <linux/slab.h>
> > > > > > > > > >     #include <linux/sysfs.h>
> > > > > > > > > > +#include <linux/workqueue.h>
> > > > > > > > > >
> > > > > > > > > >     #include "dma-buf-sysfs-stats.h"
> > > > > > > > > >
> > > > > > > > > > @@ -168,10 +169,46 @@ void dma_buf_uninit_sysfs_statist=
ics(void)
> > > > > > > > > >         kset_unregister(dma_buf_stats_kset);
> > > > > > > > > >     }
> > > > > > > > > >
> > > > > > > > > > +static void sysfs_add_workfn(struct work_struct *work)
> > > > > > > > > > +{
> > > > > > > > > > +     struct dma_buf_sysfs_entry *sysfs_entry =3D
> > > > > > > > > > +             container_of(work, struct dma_buf_sysfs_e=
ntry, sysfs_add_work);
> > > > > > > > > > +     struct dma_buf *dmabuf =3D sysfs_entry->dmabuf;
> > > > > > > > > > +
> > > > > > > > > > +     /*
> > > > > > > > > > +      * A dmabuf is ref-counted via its file member. I=
f this handler holds the only
> > > > > > > > > > +      * reference to the dmabuf, there is no need for =
sysfs kobject creation. This is an
> > > > > > > > > > +      * optimization and a race; when the reference co=
unt drops to 1 immediately after
> > > > > > > > > > +      * this check it is not harmful as the sysfs entr=
y will still get cleaned up in
> > > > > > > > > > +      * dma_buf_stats_teardown, which won't get called=
 until the final dmabuf reference
> > > > > > > > > > +      * is released, and that can't happen until the e=
nd of this function.
> > > > > > > > > > +      */
> > > > > > > > > > +     if (file_count(dmabuf->file) > 1) {
> > > > > > > > > Please completely drop that. I see absolutely no justific=
ation for this
> > > > > > > > > additional complexity.
> > > > > > > > >
> > > > > > > > This case gets hit around 5% of the time in my testing so t=
he else is
> > > > > > > > not a completely unused branch.
> > > > > > > Well I can only repeat myself: This means that your userspace=
 is
> > > > > > > severely broken!
> > > > > > >
> > > > > > > DMA-buf are meant to be long living objects
> > > > > > This patch addresses export *latency* regardless of how long-li=
ved the
> > > > > > object is. Even a single, long-lived export will benefit from t=
his
> > > > > > change if it would otherwise be blocked on adding an object to =
sysfs.
> > > > > > I think attempting to improve this latency still has merit.
> > > > > Fixing the latency is nice, but as it's just pushing the needed w=
ork off
> > > > > to another code path, it will take longer overall for the sysfs s=
tuff to
> > > > > be ready for userspace to see.
> > > > >
> > > > > Perhaps we need to step back and understand what this code is sup=
posed
> > > > > to be doing.  As I recall, it was created because some systems do=
 not
> > > > > allow debugfs anymore, and they wanted the debugging information =
that
> > > > > the dmabuf code was exposing to debugfs on a "normal" system.  Mo=
ving
> > > > > that logic to sysfs made sense, but now I am wondering why we did=
n't see
> > > > > these issues in the debugfs code previously?
> > > > >
> > > > > Perhaps we should go just one step further and make a misc device=
 node
> > > > > for dmabug debugging information to be in and just have userspace
> > > > > poll/read on the device node and we spit the info that used to be=
 in
> > > > > debugfs out through that?  That way this only affects systems whe=
n they
> > > > > want to read the information and not normal code paths?  Yeah tha=
t's a
> > > > > hack, but this whole thing feels overly complex now.
> > > > A bit late on this discussion, but just wanted to add my +1 that we=
 should
> > > > either redesign the uapi, or fix the underlying latency issue in sy=
sfs, or
> > > > whatever else is deemed the proper fix.
> > > >
> > > > Making uapi interfaces async in ways that userspace can't discover =
is a
> > > > hack that we really shouldn't consider, at least for upstream. All =
kinds
> > > > of hilarious things might start to happen when an object exists, bu=
t not
> > > > consistently in all the places where it should be visible. There's =
a
> > > > reason sysfs has all these neat property groups so that absolutely
> > > > everything is added atomically. Doing stuff later on just because u=
sually
> > > > no one notices that the illusion falls apart isn't great.
> > > >
> > > > Unfortunately I don't have a clear idea here what would be the righ=
t
> > > > solution :-/ One idea perhaps: Should we dynamically enumerate the =
objects
> > > > when userspace does a readdir()? That's absolutely not how sysfs wo=
rks,
> > > > but procfs works like that and there's discussions going around abo=
ut
> > > > moving these optimizations to other kernfs implementations. At leas=
t there
> > > > was a recent lwn article on this:
> > > >
> > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flwn.net%2FArticles%2F895111%2F&amp;data=3D05%7C01%7Cchristian.koenig%40amd=
.com%7C8f00afd44b9744c45f5708da3e926503%7C3dd8961fe4884e608e11a82d994e183d%=
7C0%7C0%7C637891095771223650%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DQ5=
8OZi79vmKMCZLL0pY7NniIW6hmSqyWjlEaZgqzYtM%3D&amp;reserved=3D0
> > > >
> > > > But that would be serious amounts of work I guess.
> > > > -Daniel
> > > > --
> > > > Daniel Vetter"
> > > > Software Engineer, Intel Corporation
> > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
blog.ffwll.ch%2F&amp;data=3D05%7C01%7Cchristian.koenig%40amd.com%7C8f00afd4=
4b9744c45f5708da3e926503%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63789=
1095771223650%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DpOIl5yszzak4TPqjB=
YyL0mHjj%2F1nYRfNJbNPQTXBhbA%3D&amp;reserved=3D0
> > > Hi Daniel,
> > >
> > > My team has been discussing this, and I think we're approaching a
> > > consensus on a way forward that involves deprecating the existing
> > > uapi.
> > >
> > > I actually proposed a similar (but less elegant) idea to the readdir(=
)
> > > one. A new "dump_dmabuf_data" sysfs file that a user would write to,
> > > which would cause a one-time creation of the per-buffer files. These
> > > could be left around to become stale, or get cleaned up after first
> > > read. However to me it seems impossible to correctly deal with
> > > multiple simultaneous users with this technique. We're not currently
> > > planning to pursue this.
> > >
> > > Thanks for the link to the article. That on-demand creation sounds
> > > like it would allow us to keep the existing structure and files for
> > > DMA-buf, assuming there is not a similar lock contention issue when
> > > adding a new node to the virtual tree. :)
> >
> > I think that this on demand creation is even worse than the existing id=
eas,
> > but if you can get Greg to accept the required sysfs changes than that'=
s at
> > least outside of my maintenance domain any more :)
>
> I think doing it cleanly in sysfs without changing the current uapi sound=
s
> pretty good. The hand-rolled "touch a magic file to force update all the
> files into existence" sounds like a horror show to me :-) Plus I don't se=
e
> how you can actually avoid the locking pain with that since once the file=
s
> are created, you have to remove them synchronously again, plus you get to
> deal with races on top (and likely some locking inversion fun on top).
> -Daniel

Yes, lots of reasons not to pursue that angle. :)

So I asked Greg about modifying sysfs for this purpose, and he's quite
convincing that it's not the right way to approach this problem. So
that leaves deprecating the per-buffer statistics. It looks like we
can maintain the userspace functionality that depended on this by
replacing it with a single sysfs node for "dmabuf_total_size" along
with adding exporter information to procfs (via Kalesh's path patch
[1]). However there is a separate effort to account dmabufs from heaps
with cgroups [2], so if I'm able to make that work then we would not
need the new "dmabuf_total_size" file since this same information
could be obtained from the root cgroup instead. So I'd like to try
that first before falling back to adding a new dmabuf_total_size file.

[1] https://lore.kernel.org/lkml/875yll1fp1.fsf@stepbren-lnx.us.oracle.com/=
T/#m43a3d345f821a02babd4ebb1f4257982d027c9e4
[2] https://lore.kernel.org/lkml/CABdmKX1xvm87WMEDkMc9Aye46E4zv1-scenwgaRxH=
esrOCsaYg@mail.gmail.com/T/#mb82eca5438a4ea7ab157ab9cd7f044cbcfeb5509




> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
