Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451E75345E1
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 23:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271C210E034;
	Wed, 25 May 2022 21:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A774810E034
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 21:39:45 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id er5so28577254edb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 14:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YkKRJ1yUuH42jH2+egPvmJc2QWPvILlcWZlWZWTzpDk=;
 b=q60MGtxeHRheg6iknuJY3qS0l27CyN0DuaX3wtTehHVlNTbiMft9I9zR2e2vAvrOl9
 z+2Z93ol7OJ9i5PoauV6NSy2c1D60fkHajAD/RB4QXX96Mydyibnsj/Wk/vecX8Ep+fF
 hhaIOKTCMRSJiVOpIY2LwpjrhClakTh8k2emKV0Y6Uw46GW6K2BirOeemrAbxlkFXPVo
 K8D4gcpwecTxV/gckYGN4phWydDlzvoB2g+VDwsALMvVpE5AK3uflfq/2Wd69DLxBf3r
 +WZ/86EAAJmu98KdRsJvKeZZ/dbx3O262MY1Z98hCQ26U/wmX1hf5dt0zqvybuNNR1qA
 tfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YkKRJ1yUuH42jH2+egPvmJc2QWPvILlcWZlWZWTzpDk=;
 b=B9UvAeWUPrIbWX0c3e7sCmI5DnLl3UI/L7HaLdcQQlQFFWUACrUkvamfQFcdjxSGV1
 81zBPudOJ9Spk2mvbaW4rg23mon+iWQ9N6mdVDNayYaY98GlDrhfGT8MswWHISDvTtKu
 hemAZtolT2JVCw3/8uwfYBDnia8lIntjoXwal9eD7fW63gLKKyvB1S3j2lR5y44a1Ql4
 /f1Ot7eb1LlwiwYr2ILRq88fPSzVcKtud076t9PKP9rx3GHmtilhoUK339++YXHxwaWh
 w1etH8jM62rRy9U+1mS7L2x9+RgXLMPfnJ5dzuAOz4QotRFOW5R3ARP6xD5uwpOJk9kn
 uhgQ==
X-Gm-Message-State: AOAM531tIXCckFk0+IwSmYP9CS+HWYWGMi/4+9QeRf36Nv6GQqzJNc3K
 mZAv1LOUnmJym+FwJa20O4sEsZ4DdcOzuQiRTqooLg==
X-Google-Smtp-Source: ABdhPJz06OtV9t6/CMKQQ4DixHbF8wC6aLzsK8RljcfFkSHfazdAJXxJul4fBqp2cA1GKzwjsvmZSjZ+kQD/lM1L+D4=
X-Received: by 2002:a05:6402:1f03:b0:42b:38ed:a9ff with SMTP id
 b3-20020a0564021f0300b0042b38eda9ffmr14557441edb.218.1653514783855; Wed, 25
 May 2022 14:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220516171315.2400578-1-tjmercier@google.com>
 <175c5af3-9224-9c8e-0784-349dad9a2954@amd.com>
 <CABdmKX2GcgCs1xANYPBp8OEtk9qqH7AvCzpdppj9rHXvMqWSAw@mail.gmail.com>
 <0875fa95-3a25-a354-1433-201fca81ed3e@amd.com>
 <CABdmKX1+VYfdzyVYOS5MCsr4ptGTygmuUP9ikyh-vW6DgKk2kg@mail.gmail.com>
 <YoM9BAwybcjG7K/H@kroah.com> <Yo4/XhWQkACWaPIh@phenom.ffwll.local>
 <CABdmKX2dC0fkFrCedjhzmheYiDVP4PnKBMeGkX3_bgrLjOiYOg@mail.gmail.com>
In-Reply-To: <CABdmKX2dC0fkFrCedjhzmheYiDVP4PnKBMeGkX3_bgrLjOiYOg@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 May 2022 14:39:32 -0700
Message-ID: <CABdmKX0-8s9XZDo9o9R3j-fkQzAhLB72+ng9Q087thdBbsiT2g@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: Move sysfs work out of DMA-BUF export path
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "T.J. Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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

On Wed, May 25, 2022 at 2:05 PM T.J. Mercier <tjmercier@google.com> wrote:
>
> On Wed, May 25, 2022 at 7:38 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, May 17, 2022 at 08:13:24AM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, May 16, 2022 at 05:08:05PM -0700, T.J. Mercier wrote:
> > > > On Mon, May 16, 2022 at 12:21 PM Christian K=C3=B6nig
> > > > <christian.koenig@amd.com> wrote:
> > > > >
> > > > > Am 16.05.22 um 20:08 schrieb T.J. Mercier:
> > > > > > On Mon, May 16, 2022 at 10:20 AM Christian K=C3=B6nig
> > > > > > <christian.koenig@amd.com> wrote:
> > > > > >> Am 16.05.22 um 19:13 schrieb T.J. Mercier:
> > > > > >>> Recently, we noticed an issue where a process went into direc=
t reclaim
> > > > > >>> while holding the kernfs rw semaphore for sysfs in write (exc=
lusive)
> > > > > >>> mode. This caused processes who were doing DMA-BUF exports an=
d releases
> > > > > >>> to go into uninterruptible sleep since they needed to acquire=
 the same
> > > > > >>> semaphore for the DMA-BUF sysfs entry creation/deletion. In o=
rder to avoid
> > > > > >>> blocking DMA-BUF export for an indeterminate amount of time w=
hile
> > > > > >>> another process is holding the sysfs rw semaphore in exclusiv=
e mode,
> > > > > >>> this patch moves the per-buffer sysfs file creation to the de=
fault work
> > > > > >>> queue. Note that this can lead to a short-term inaccuracy in =
the dmabuf
> > > > > >>> sysfs statistics, but this is a tradeoff to prevent the hot p=
ath from
> > > > > >>> being blocked. A work_struct is added to dma_buf to achieve t=
his, but as
> > > > > >>> it is unioned with the kobject in the sysfs_entry, dma_buf do=
es not
> > > > > >>> increase in size.
> > > > > >> I'm still not very keen of this approach as it strongly feels =
like we
> > > > > >> are working around shortcoming somewhere else.
> > > > > >>
> > > > > > My read of the thread for the last version is that we're runnin=
g into
> > > > > > a situation where sysfs is getting used for something it wasn't
> > > > > > originally intended for, but we're also stuck with this sysfs
> > > > > > functionality for dmabufs.
> > > > > >
> > > > > >>> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DM=
A-BUF stats in sysfs")
> > > > > >>> Originally-by: Hridya Valsaraju <hridya@google.com>
> > > > > >>> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > > > >>>
> > > > > >>> ---
> > > > > >>> See the originally submitted patch by Hridya Valsaraju here:
> > > > > >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Flkml.org%2Flkml%2F2022%2F1%2F4%2F1066&amp;data=3D05%7C01%7Cchristian=
.koenig%40amd.com%7C794614324d114880a25508da37672e4b%7C3dd8961fe4884e608e11=
a82d994e183d%7C0%7C0%7C637883213566903705%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&a=
mp;sdata=3DbGlA2FeubfSeL5XDHYyWMZqUXfScoCphZjjK4jrqQJs%3D&amp;reserved=3D0
> > > > > >>>
> > > > > >>> v2 changes:
> > > > > >>> - Defer only sysfs creation instead of creation and teardown =
per
> > > > > >>> Christian K=C3=B6nig
> > > > > >>>
> > > > > >>> - Use a work queue instead of a kthread for deferred work per
> > > > > >>> Christian K=C3=B6nig
> > > > > >>> ---
> > > > > >>>    drivers/dma-buf/dma-buf-sysfs-stats.c | 56 +++++++++++++++=
+++++-------
> > > > > >>>    include/linux/dma-buf.h               | 14 ++++++-
> > > > > >>>    2 files changed, 54 insertions(+), 16 deletions(-)
> > > > > >>>
> > > > > >>> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/=
dma-buf/dma-buf-sysfs-stats.c
> > > > > >>> index 2bba0babcb62..67b0a298291c 100644
> > > > > >>> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> > > > > >>> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> > > > > >>> @@ -11,6 +11,7 @@
> > > > > >>>    #include <linux/printk.h>
> > > > > >>>    #include <linux/slab.h>
> > > > > >>>    #include <linux/sysfs.h>
> > > > > >>> +#include <linux/workqueue.h>
> > > > > >>>
> > > > > >>>    #include "dma-buf-sysfs-stats.h"
> > > > > >>>
> > > > > >>> @@ -168,10 +169,46 @@ void dma_buf_uninit_sysfs_statistics(vo=
id)
> > > > > >>>        kset_unregister(dma_buf_stats_kset);
> > > > > >>>    }
> > > > > >>>
> > > > > >>> +static void sysfs_add_workfn(struct work_struct *work)
> > > > > >>> +{
> > > > > >>> +     struct dma_buf_sysfs_entry *sysfs_entry =3D
> > > > > >>> +             container_of(work, struct dma_buf_sysfs_entry, =
sysfs_add_work);
> > > > > >>> +     struct dma_buf *dmabuf =3D sysfs_entry->dmabuf;
> > > > > >>> +
> > > > > >>> +     /*
> > > > > >>> +      * A dmabuf is ref-counted via its file member. If this=
 handler holds the only
> > > > > >>> +      * reference to the dmabuf, there is no need for sysfs =
kobject creation. This is an
> > > > > >>> +      * optimization and a race; when the reference count dr=
ops to 1 immediately after
> > > > > >>> +      * this check it is not harmful as the sysfs entry will=
 still get cleaned up in
> > > > > >>> +      * dma_buf_stats_teardown, which won't get called until=
 the final dmabuf reference
> > > > > >>> +      * is released, and that can't happen until the end of =
this function.
> > > > > >>> +      */
> > > > > >>> +     if (file_count(dmabuf->file) > 1) {
> > > > > >> Please completely drop that. I see absolutely no justification=
 for this
> > > > > >> additional complexity.
> > > > > >>
> > > > > > This case gets hit around 5% of the time in my testing so the e=
lse is
> > > > > > not a completely unused branch.
> > > > >
> > > > > Well I can only repeat myself: This means that your userspace is
> > > > > severely broken!
> > > > >
> > > > > DMA-buf are meant to be long living objects
> > > > This patch addresses export *latency* regardless of how long-lived =
the
> > > > object is. Even a single, long-lived export will benefit from this
> > > > change if it would otherwise be blocked on adding an object to sysf=
s.
> > > > I think attempting to improve this latency still has merit.
> > >
> > > Fixing the latency is nice, but as it's just pushing the needed work =
off
> > > to another code path, it will take longer overall for the sysfs stuff=
 to
> > > be ready for userspace to see.
> > >
> > > Perhaps we need to step back and understand what this code is suppose=
d
> > > to be doing.  As I recall, it was created because some systems do not
> > > allow debugfs anymore, and they wanted the debugging information that
> > > the dmabuf code was exposing to debugfs on a "normal" system.  Moving
> > > that logic to sysfs made sense, but now I am wondering why we didn't =
see
> > > these issues in the debugfs code previously?
> > >
> > > Perhaps we should go just one step further and make a misc device nod=
e
> > > for dmabug debugging information to be in and just have userspace
> > > poll/read on the device node and we spit the info that used to be in
> > > debugfs out through that?  That way this only affects systems when th=
ey
> > > want to read the information and not normal code paths?  Yeah that's =
a
> > > hack, but this whole thing feels overly complex now.
> >
> > A bit late on this discussion, but just wanted to add my +1 that we sho=
uld
> > either redesign the uapi, or fix the underlying latency issue in sysfs,=
 or
> > whatever else is deemed the proper fix.
> >
> > Making uapi interfaces async in ways that userspace can't discover is a
> > hack that we really shouldn't consider, at least for upstream. All kind=
s
> > of hilarious things might start to happen when an object exists, but no=
t
> > consistently in all the places where it should be visible. There's a
> > reason sysfs has all these neat property groups so that absolutely
> > everything is added atomically. Doing stuff later on just because usual=
ly
> > no one notices that the illusion falls apart isn't great.
> >
> > Unfortunately I don't have a clear idea here what would be the right
> > solution :-/ One idea perhaps: Should we dynamically enumerate the obje=
cts
> > when userspace does a readdir()? That's absolutely not how sysfs works,
> > but procfs works like that and there's discussions going around about
> > moving these optimizations to other kernfs implementations. At least th=
ere
> > was a recent lwn article on this:
> >
> > https://lwn.net/Articles/895111/
> >
> > But that would be serious amounts of work I guess.
> > -Daniel
> > --
> > Daniel Vetter"
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>
> Hi Daniel,
>
> My team has been discussing this, and I think we're approaching a
> consensus on a way forward that involves deprecating the existing
> uapi.
>
> I actually proposed a similar (but less elegant) idea to the readdir()
> one. A new "dump_dmabuf_data" sysfs file that a user would write to,
> which would cause a one-time creation of the per-buffer files. These
> could be left around to become stale, or get cleaned up after first
> read. However to me it seems impossible to correctly deal with
> multiple simultaneous users with this technique. We're not currently
> planning to pursue this.
>
> Thanks for the link to the article. That on-demand creation sounds
> like it would allow us to keep the existing structure and files for
> DMA-buf, assuming there is not a similar lock contention issue when
> adding a new node to the virtual tree. :)

I'll follow up with Steven on this topic. Thanks again.
