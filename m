Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F79F539A10
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 01:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD7710E34D;
	Tue, 31 May 2022 23:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825BE10E34D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 23:31:26 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id c2so9995596edf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 16:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wr9xpxSibC0ctyCpjnvowaocMYx7SBWLKjpEyTnQD44=;
 b=PvlmpA2rjw0N8/GZkXsGQSPJ+gcFfBQQagwSoQXhhsGWaWkC4/aViDXoh7vjWD2eMO
 PoypXG4Mwckqsh5TG/Ju9Baovrq2i16PZVUv7d5Djd5yr3LFRSyoWcy11iOcaS7Hjfj2
 b4d01OclJMNng7WSUtYzSLPHRqnPtig5Ygvs+56tpXaVeQ5NHj43hL+6qrDoh5FGOYhI
 k97kD4qqlanzUJ5rYdQg7avhqu0ICGXWLZV1rvIbZISX6MLx8Fftp16BlLkYtqXjwlCz
 S8D7zJUw1ef7Qa6oqcvNvnYS5L4h/DR7QPjaW+Ets1RZf5ftjXdx46Cnsu0lMe7jsV0J
 SYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wr9xpxSibC0ctyCpjnvowaocMYx7SBWLKjpEyTnQD44=;
 b=PaRVEJ+x3douIMYrMWEdQ9xdbC924troyZH9MIdTID+7/cXfaZuZ09b90mDiOKHBlX
 ZsYuy09S3iyAMyVEBtPwWw3s3VCUFWVvS0UrO66pjYWrJoEiGeJ7/5ahhNkFZKXoERwC
 18O3+gGitaxf2IwvSHZkWwxHyG0hLwI5RbMNRGc3xsuN/LbPZdYaPXV5QPoUfuayNbtJ
 +wgeK4xb4ekW+Y9tB8jTQBwlK2r/r7452j9dP0leNpK05TAWHt1w6oWTlWTVkOit9w78
 ULwzMcRgaTuHlLcQit+WyFmZXwIviqXB1pIaKyUvJ4SpRjmqNooDEMVligvvToXW31/L
 SAEQ==
X-Gm-Message-State: AOAM533+wsDjFj+oweKLlIOHMO8dkFoomVYmZ9LGXPAG7R1w+MEa6xV/
 EyCos5lDEqFWDgyGzCWYk9kOkDE+I0UhmPAtGHM5gw==
X-Google-Smtp-Source: ABdhPJwdIobYizmVKy4rwtwaMbS3U+uqxpsfRmQeYYxhL47ztI017EI3rsLbA/mlRl2fwXB2lZYMjjOS4AbhEdjaYzo=
X-Received: by 2002:a05:6402:354c:b0:42b:4e22:203b with SMTP id
 f12-20020a056402354c00b0042b4e22203bmr52476539edd.308.1654039884720; Tue, 31
 May 2022 16:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220516171315.2400578-1-tjmercier@google.com>
 <175c5af3-9224-9c8e-0784-349dad9a2954@amd.com>
 <CABdmKX2GcgCs1xANYPBp8OEtk9qqH7AvCzpdppj9rHXvMqWSAw@mail.gmail.com>
 <0875fa95-3a25-a354-1433-201fca81ed3e@amd.com>
 <CABdmKX1+VYfdzyVYOS5MCsr4ptGTygmuUP9ikyh-vW6DgKk2kg@mail.gmail.com>
 <YoM9BAwybcjG7K/H@kroah.com> <Yo4/XhWQkACWaPIh@phenom.ffwll.local>
 <CABdmKX2dC0fkFrCedjhzmheYiDVP4PnKBMeGkX3_bgrLjOiYOg@mail.gmail.com>
 <38da6dcd-b395-f32f-5a47-6a8f2c6a4331@amd.com>
In-Reply-To: <38da6dcd-b395-f32f-5a47-6a8f2c6a4331@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 31 May 2022 16:31:13 -0700
Message-ID: <CABdmKX2aUTLHGkiKLhP=4k4X3j6M9zmUvFMS=ddJVTWE+wk0+g@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: Move sysfs work out of DMA-BUF export path
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: kernel-team@android.com, Minchan Kim <minchan@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, Kalesh Singh <kaleshsingh@google.com>,
 Hridya Valsaraju <hridya@google.com>, Greg Kroah-Hartman <gregkh@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 29, 2022 at 11:12 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 25.05.22 um 23:05 schrieb T.J. Mercier:
> > On Wed, May 25, 2022 at 7:38 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >> On Tue, May 17, 2022 at 08:13:24AM +0200, Greg Kroah-Hartman wrote:
> >>> On Mon, May 16, 2022 at 05:08:05PM -0700, T.J. Mercier wrote:
> >>>> On Mon, May 16, 2022 at 12:21 PM Christian K=C3=B6nig
> >>>> <christian.koenig@amd.com> wrote:
> >>>>> Am 16.05.22 um 20:08 schrieb T.J. Mercier:
> >>>>>> On Mon, May 16, 2022 at 10:20 AM Christian K=C3=B6nig
> >>>>>> <christian.koenig@amd.com> wrote:
> >>>>>>> Am 16.05.22 um 19:13 schrieb T.J. Mercier:
> >>>>>>>> Recently, we noticed an issue where a process went into direct r=
eclaim
> >>>>>>>> while holding the kernfs rw semaphore for sysfs in write (exclus=
ive)
> >>>>>>>> mode. This caused processes who were doing DMA-BUF exports and r=
eleases
> >>>>>>>> to go into uninterruptible sleep since they needed to acquire th=
e same
> >>>>>>>> semaphore for the DMA-BUF sysfs entry creation/deletion. In orde=
r to avoid
> >>>>>>>> blocking DMA-BUF export for an indeterminate amount of time whil=
e
> >>>>>>>> another process is holding the sysfs rw semaphore in exclusive m=
ode,
> >>>>>>>> this patch moves the per-buffer sysfs file creation to the defau=
lt work
> >>>>>>>> queue. Note that this can lead to a short-term inaccuracy in the=
 dmabuf
> >>>>>>>> sysfs statistics, but this is a tradeoff to prevent the hot path=
 from
> >>>>>>>> being blocked. A work_struct is added to dma_buf to achieve this=
, but as
> >>>>>>>> it is unioned with the kobject in the sysfs_entry, dma_buf does =
not
> >>>>>>>> increase in size.
> >>>>>>> I'm still not very keen of this approach as it strongly feels lik=
e we
> >>>>>>> are working around shortcoming somewhere else.
> >>>>>>>
> >>>>>> My read of the thread for the last version is that we're running i=
nto
> >>>>>> a situation where sysfs is getting used for something it wasn't
> >>>>>> originally intended for, but we're also stuck with this sysfs
> >>>>>> functionality for dmabufs.
> >>>>>>
> >>>>>>>> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-B=
UF stats in sysfs")
> >>>>>>>> Originally-by: Hridya Valsaraju <hridya@google.com>
> >>>>>>>> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> >>>>>>>>
> >>>>>>>> ---
> >>>>>>>> See the originally submitted patch by Hridya Valsaraju here:
> >>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flkml.org%2Flkml%2F2022%2F1%2F4%2F1066&amp;data=3D05%7C01%7Cchristian.ko=
enig%40amd.com%7C8f00afd44b9744c45f5708da3e926503%7C3dd8961fe4884e608e11a82=
d994e183d%7C0%7C0%7C637891095771223650%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;=
sdata=3DpubWqUyqhCWpXHhJHsoqarc3GLtB6IFB1rhgfsL4a1M%3D&amp;reserved=3D0
> >>>>>>>>
> >>>>>>>> v2 changes:
> >>>>>>>> - Defer only sysfs creation instead of creation and teardown per
> >>>>>>>> Christian K=C3=B6nig
> >>>>>>>>
> >>>>>>>> - Use a work queue instead of a kthread for deferred work per
> >>>>>>>> Christian K=C3=B6nig
> >>>>>>>> ---
> >>>>>>>>     drivers/dma-buf/dma-buf-sysfs-stats.c | 56 +++++++++++++++++=
+++-------
> >>>>>>>>     include/linux/dma-buf.h               | 14 ++++++-
> >>>>>>>>     2 files changed, 54 insertions(+), 16 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma=
-buf/dma-buf-sysfs-stats.c
> >>>>>>>> index 2bba0babcb62..67b0a298291c 100644
> >>>>>>>> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> >>>>>>>> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> >>>>>>>> @@ -11,6 +11,7 @@
> >>>>>>>>     #include <linux/printk.h>
> >>>>>>>>     #include <linux/slab.h>
> >>>>>>>>     #include <linux/sysfs.h>
> >>>>>>>> +#include <linux/workqueue.h>
> >>>>>>>>
> >>>>>>>>     #include "dma-buf-sysfs-stats.h"
> >>>>>>>>
> >>>>>>>> @@ -168,10 +169,46 @@ void dma_buf_uninit_sysfs_statistics(void)
> >>>>>>>>         kset_unregister(dma_buf_stats_kset);
> >>>>>>>>     }
> >>>>>>>>
> >>>>>>>> +static void sysfs_add_workfn(struct work_struct *work)
> >>>>>>>> +{
> >>>>>>>> +     struct dma_buf_sysfs_entry *sysfs_entry =3D
> >>>>>>>> +             container_of(work, struct dma_buf_sysfs_entry, sys=
fs_add_work);
> >>>>>>>> +     struct dma_buf *dmabuf =3D sysfs_entry->dmabuf;
> >>>>>>>> +
> >>>>>>>> +     /*
> >>>>>>>> +      * A dmabuf is ref-counted via its file member. If this ha=
ndler holds the only
> >>>>>>>> +      * reference to the dmabuf, there is no need for sysfs kob=
ject creation. This is an
> >>>>>>>> +      * optimization and a race; when the reference count drops=
 to 1 immediately after
> >>>>>>>> +      * this check it is not harmful as the sysfs entry will st=
ill get cleaned up in
> >>>>>>>> +      * dma_buf_stats_teardown, which won't get called until th=
e final dmabuf reference
> >>>>>>>> +      * is released, and that can't happen until the end of thi=
s function.
> >>>>>>>> +      */
> >>>>>>>> +     if (file_count(dmabuf->file) > 1) {
> >>>>>>> Please completely drop that. I see absolutely no justification fo=
r this
> >>>>>>> additional complexity.
> >>>>>>>
> >>>>>> This case gets hit around 5% of the time in my testing so the else=
 is
> >>>>>> not a completely unused branch.
> >>>>> Well I can only repeat myself: This means that your userspace is
> >>>>> severely broken!
> >>>>>
> >>>>> DMA-buf are meant to be long living objects
> >>>> This patch addresses export *latency* regardless of how long-lived t=
he
> >>>> object is. Even a single, long-lived export will benefit from this
> >>>> change if it would otherwise be blocked on adding an object to sysfs=
.
> >>>> I think attempting to improve this latency still has merit.
> >>> Fixing the latency is nice, but as it's just pushing the needed work =
off
> >>> to another code path, it will take longer overall for the sysfs stuff=
 to
> >>> be ready for userspace to see.
> >>>
> >>> Perhaps we need to step back and understand what this code is suppose=
d
> >>> to be doing.  As I recall, it was created because some systems do not
> >>> allow debugfs anymore, and they wanted the debugging information that
> >>> the dmabuf code was exposing to debugfs on a "normal" system.  Moving
> >>> that logic to sysfs made sense, but now I am wondering why we didn't =
see
> >>> these issues in the debugfs code previously?
> >>>
> >>> Perhaps we should go just one step further and make a misc device nod=
e
> >>> for dmabug debugging information to be in and just have userspace
> >>> poll/read on the device node and we spit the info that used to be in
> >>> debugfs out through that?  That way this only affects systems when th=
ey
> >>> want to read the information and not normal code paths?  Yeah that's =
a
> >>> hack, but this whole thing feels overly complex now.
> >> A bit late on this discussion, but just wanted to add my +1 that we sh=
ould
> >> either redesign the uapi, or fix the underlying latency issue in sysfs=
, or
> >> whatever else is deemed the proper fix.
> >>
> >> Making uapi interfaces async in ways that userspace can't discover is =
a
> >> hack that we really shouldn't consider, at least for upstream. All kin=
ds
> >> of hilarious things might start to happen when an object exists, but n=
ot
> >> consistently in all the places where it should be visible. There's a
> >> reason sysfs has all these neat property groups so that absolutely
> >> everything is added atomically. Doing stuff later on just because usua=
lly
> >> no one notices that the illusion falls apart isn't great.
> >>
> >> Unfortunately I don't have a clear idea here what would be the right
> >> solution :-/ One idea perhaps: Should we dynamically enumerate the obj=
ects
> >> when userspace does a readdir()? That's absolutely not how sysfs works=
,
> >> but procfs works like that and there's discussions going around about
> >> moving these optimizations to other kernfs implementations. At least t=
here
> >> was a recent lwn article on this:
> >>
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flw=
n.net%2FArticles%2F895111%2F&amp;data=3D05%7C01%7Cchristian.koenig%40amd.co=
m%7C8f00afd44b9744c45f5708da3e926503%7C3dd8961fe4884e608e11a82d994e183d%7C0=
%7C0%7C637891095771223650%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DQ58OZ=
i79vmKMCZLL0pY7NniIW6hmSqyWjlEaZgqzYtM%3D&amp;reserved=3D0
> >>
> >> But that would be serious amounts of work I guess.
> >> -Daniel
> >> --
> >> Daniel Vetter"
> >> Software Engineer, Intel Corporation
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblo=
g.ffwll.ch%2F&amp;data=3D05%7C01%7Cchristian.koenig%40amd.com%7C8f00afd44b9=
744c45f5708da3e926503%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63789109=
5771223650%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB=
TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DpOIl5yszzak4TPqjBYyL=
0mHjj%2F1nYRfNJbNPQTXBhbA%3D&amp;reserved=3D0
> > Hi Daniel,
> >
> > My team has been discussing this, and I think we're approaching a
> > consensus on a way forward that involves deprecating the existing
> > uapi.
> >
> > I actually proposed a similar (but less elegant) idea to the readdir()
> > one. A new "dump_dmabuf_data" sysfs file that a user would write to,
> > which would cause a one-time creation of the per-buffer files. These
> > could be left around to become stale, or get cleaned up after first
> > read. However to me it seems impossible to correctly deal with
> > multiple simultaneous users with this technique. We're not currently
> > planning to pursue this.
> >
> > Thanks for the link to the article. That on-demand creation sounds
> > like it would allow us to keep the existing structure and files for
> > DMA-buf, assuming there is not a similar lock contention issue when
> > adding a new node to the virtual tree. :)
>
> I think that this on demand creation is even worse than the existing
> ideas, but if you can get Greg to accept the required sysfs changes than
> that's at least outside of my maintenance domain any more :)

Hah, ok. After chatting with Steven it sounds like an attempt at on
demand creation for sysfs is not likely to happen soon, as the focus
is on getting it working for tracefs first and letting it stew there
for a while to polish it. I'll check with Greg when he's available
again next week about whether that is a direction we should even
consider before moving forward from here.
>
>
> Regards,
> Christian.
