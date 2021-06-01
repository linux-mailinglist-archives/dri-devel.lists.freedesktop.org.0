Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B96397A33
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 20:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AB16E05D;
	Tue,  1 Jun 2021 18:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEE46E05D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 18:50:07 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id z38so177978ybh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 11:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KULTWNGWxAMdd3yggGygNXZJz8k72ZI6IxXWO4gNiaM=;
 b=Zy/aK9S9MfZW9JTU01xqhEi6m0rqcROBATd2ozckjqFPUVPovgIdqJ5jYAGEz51eQ5
 GQZtY1brQ+UusIcoOcATSSXScyfyu/qTuOczahwKZgVpBrJRhlHni4VHk2odzCpA7jk+
 ytb2U44Shp3B3U2fddhbirOy7Nas7rhMR2Pml+RfObxKgtZwF6DM78LXPC2/JyQ+PHHT
 r2na1knXwfk61JftaC6qbb9MC9E3vpu0tFTjEp47OIP5JUaJ0XcpD04qeO+v47CnmPYy
 xeRwHjYY6GybLflqmy0x9YTNmO414Ai5QYc5Ps9mCqOCwnl4aH3wxqiPPZax+iAkP4Xc
 RRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KULTWNGWxAMdd3yggGygNXZJz8k72ZI6IxXWO4gNiaM=;
 b=jMLBukTYSjwZKShQVp6cMfxq2nLuZsbIXarZj39RL/cEWtl1v6XuhQUDWAI5UsPkw9
 js08sfabtHn0ZeVA0FemUZaNGQAoFdjvLojAfWlYZbksLerTeeN6hhD0S0Wn74hn8726
 tGkD7Siz832U4YkjWgpwAKTAQGx7QOuNbVvRW2QT7P8Fk2Bx9iKVGPMRvrxi8QyNnmVT
 1lvfvbYqZyC+4A5vJe0T9SKcq3GjGv8ONJbwXQwJe4O1KjSuv3OiK10ijWbsWsaquQdx
 sb1muBtlkgeOtHprX8zvdIH02Pa1EQqW3bs6AomghBtKQYWHUg3ZaY/M/ZDCF425UxRu
 ex+g==
X-Gm-Message-State: AOAM532cu6DXTNJwo2A28pE6hhJ+QZzt+FwO48CozaMZJXIUQcYLLqVe
 Zb3shyKBajNZdTLQ/bUtNJi4uCNhcOSi5p3FayffpA==
X-Google-Smtp-Source: ABdhPJyZ3l4/X2XEgeoJg8kexhlJvYXYc0bfL47p+KYMYEUXzmdCI1PEv8oH9SN4DY/XnCxlnZMURbRLrNrJZbcUhDs=
X-Received: by 2002:a25:cd85:: with SMTP id
 d127mr40419494ybf.259.1622573405833; 
 Tue, 01 Jun 2021 11:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210525183720.1739480-1-hridya@google.com>
 <3fd5145c-bb71-6f09-d412-6328ae9ea0a1@amd.com>
 <YK5UoSy6lnK1x/2T@phenom.ffwll.local>
 <CA+wgaPOyWKPrUC4X6c=5ufi+wDY0YB7pJ32m-hc9dMX8P76nAA@mail.gmail.com>
 <YK9zn2WaWaPZWrKK@phenom.ffwll.local>
In-Reply-To: <YK9zn2WaWaPZWrKK@phenom.ffwll.local>
From: Hridya Valsaraju <hridya@google.com>
Date: Tue, 1 Jun 2021 11:49:30 -0700
Message-ID: <CA+wgaPNLw8yg0_9_+uf_USi-vj9vNePz2Mwds4-r-UGBb5pB-A@mail.gmail.com>
Subject: Re: [PATCH v4] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
To: Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, LKML <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Android Kernel Team <kernel-team@android.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 John Stultz <john.stultz@linaro.org>, Suren Baghdasaryan <surenb@google.com>, 
 kernel test robot <lkp@intel.com>
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

On Thu, May 27, 2021 at 3:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, May 26, 2021 at 02:29:45PM -0700, Hridya Valsaraju wrote:
> > On Wed, May 26, 2021 at 7:01 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Wed, May 26, 2021 at 12:40:14PM +0200, Christian K=C3=B6nig wrote:
> > > > Hi Hridya,
> > > >
> > > > Am 25.05.21 um 20:37 schrieb Hridya Valsaraju:
> > > > > This patch allows statistics to be enabled for each DMA-BUF in
> > > > > sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> > > > >
> > > > > The following stats will be exposed by the interface:
> > > > >
> > > > > /sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
> > > > > /sys/kernel/dmabuf/buffers/<inode_number>/size
> > > > > /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid=
>/device
> > > > > /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid=
>/map_counter
> > > > >
> > > > > The inode_number is unique for each DMA-BUF and was added earlier=
 [1]
> > > > > in order to allow userspace to track DMA-BUF usage across differe=
nt
> > > > > processes.
> > > > >
> > > > > Currently, this information is exposed in
> > > > > /sys/kernel/debug/dma_buf/bufinfo.
> > > > > However, since debugfs is considered unsafe to be mounted in prod=
uction,
> > > > > it is being duplicated in sysfs.
> > > > >
> > > > > Procfs also uses the proc/<pid>/fdinfo/<fd> file to expose some
> > > > > information about DMA-BUF fds. However, the existing procfs inter=
faces
> > > > > can only provide information about the buffers for which processe=
s
> > > > > hold fds or have the buffers mmapped into their address space.
> > > > > The sysfs interface also exposes attachment statistics for each b=
uffer.
> > > > >
> > > > > This information will be used to derive DMA-BUF
> > > > > per-exporter stats and per-device usage stats for Android Bug rep=
orts.
> > > > > The corresponding userspace changes can be found at [2].
> > > > > Telemetry tools will also capture this information(along with oth=
er
> > > > > memory metrics) periodically as well as on important events like =
a
> > > > > foreground app kill (which might have been triggered by Low Memor=
y
> > > > > Killer). It will also contribute to provide a snapshot of the sys=
tem
> > > > > memory usage on other events such as OOM kills and Application No=
t
> > > > > Responding events.
> > > > >
> > > > > A shell script that can be run on a classic Linux environment to =
read
> > > > > out the DMA-BUF statistics can be found at [3](suggested by John
> > > > > Stultz).
> > > > >
> > > > > The patch contains the following major improvements over v1:
> > > > > 1) Each attachment is represented by its own directory to allow c=
reating
> > > > > a symlink to the importing device and to also provide room for fu=
ture
> > > > > expansion.
> > > > > 2) The number of distinct mappings of each attachment is exposed =
in a
> > > > > separate file.
> > > > > 3) The per-buffer statistics are now in /sys/kernel/dmabuf/buffer=
s
> > > > > inorder to make the interface expandable in future.
> > > > >
> > > > > All of the improvements above are based on suggestions/feedback f=
rom
> > > > > Daniel Vetter and Christian K=C3=B6nig.
> > > > >
> > > > > [1]: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1088791%2F&amp;data=3D04%7C01=
%7Cchristian.koenig%40amd.com%7C72394dc653194a3fd3fd08d91fac2fb9%7C3dd8961f=
e4884e608e11a82d994e183d%7C0%7C0%7C637575646676575967%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;sdata=3DEJ8KluQVn8FTOYRBAYpxAaG7rua46eQpmGwI%2FxIMthQ%3D&amp;reserved=
=3D0
> > > > > [2]: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fandroid-review.googlesource.com%2Fq%2Ftopic%3A%2522dmabuf-sysfs%252=
2&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7C72394dc653194a3fd3fd08d=
91fac2fb9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637575646676575967%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C1000&amp;sdata=3D4sAAqK%2F6mtSr5MWpcu2EbwOvL93UA6kMwQ2uk4f=
MP1g%3D&amp;reserved=3D0+(status:open%20OR%20status:merged)
> > > > > [3]: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fandroid-review.googlesource.com%2Fc%2Fplatform%2Fsystem%2Fmemory%2F=
libmeminfo%2F%2B%2F1549734&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%=
7C72394dc653194a3fd3fd08d91fac2fb9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7=
C0%7C637575646676575967%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dhs40%2FMAnJaZQA4=
pkYucGqeCOGk2A9dUU%2Fj9ajqAoyFk%3D&amp;reserved=3D0
> > > > >
> > > > > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > ---
> > > > >
> > > > > Hi Daniel,
> > > > >
> > > > > I am sending the latest version of the DMA-BUF sysfs statistics p=
atch to
> > > > > the list again as per your suggestion to restart the discussion o=
n it :)
> > > > > Please do take a look and let me know your thoughts, thank you!
> > > >
> > > > Daniel and Sumit might correct me, but I think in the previous disc=
ussion we
> > > > came pretty much to the conclusion that this is not the right appro=
ach.
> >
> >
> > Sorry about the confusion Christian. I should have added a brief
> > summary of our meeting with Daniel as well to provide further context.
> >
> >
> > > >
> > > > DMA-buf is just the transport vehicle for driver allocations and as=
 Daniel
> > > > outlined it doesn't really make sense to account on a DMA-buf level=
 except
> > > > for debugging.
> > > >
> > > > So while this patch is technically correct it will only add another=
 halve
> > > > backed uAPI. So question is rather what the alternative should look=
 like?
> > >
> > > So I chatted a bit with Android folks in a quick meeting, and the rou=
gh
> > > conclusions we've had was
> > >
> > > - for per-process stats we'll look into cgroups for tracking this (be=
cause
> > >   Android will add matching cgroup for each app the want to track)
> > >
> > > - same for the tracking for OOM killer
> > >
> > > - that does leave them with a gap for shared processes, for which I a=
greed
> > >   that just exposing the per dma-buf info is reasonable. It's not goi=
ng to
> > >   be super useful on desktop linux because the dma-buf tends to not s=
tick
> > >   around much, but it fits fairly perfectly on Android.
> > >
> > > So yeah that's why I think this is ok to have.
> > >
> > > What's missing is explaining this properly in the commit message. The
> > > commit message explains nicely what's being added (which really shoul=
d be
> > > proper uapi docs in our Documentation/ files, not hidden in a commit
> > > message where it's forgotten). But it fails to explain a bit the reas=
ons
> > > why we need this, I think a short summary of what Android needs (in a=
n
> > > abstract sense ie. high level semantics, not the specific implementat=
ion)
> > > and why this fits and there's nothing better is needed here I think.
> >
> >
> > Thank you Daniel, let me rewrite the commit message to explain this in
> > a better manner and send out another patch set. The patch does add the
> > ABI documentation in
> > Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers. Is the
> > suggestion to add them in a different location?
>
> Hm it's a bit sparse, and it's not nicely integrated into our .rst
> documents. E.g. we've' documented the poll() support on a dma-buf fd, see
>
> https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html#implicit-fen=
ce-poll-support
>
> That kind of overview paragraph might be nice to have.
>
> I think with the commit message polished to include all the relevant
> background, plus a short section about what's exposed in sysfs for dma-bu=
f
> (right after the section linked above) and this is perfect. Please also
> keep Greg's r-b on the code itself so he doesn't have to look at the
> patch again.


Thank you Daniel, that makes sense! I will enhance the documentation
and commit message as per your suggestions and send out another
patchset soon.

Regards,
Hridya


>
> Cheers, Daniel
>
>
> > > > Both AMD and Intel engineers are currently discussion a fdinfo base=
d
> > > > approach on the dri-devel mailing list.
> > > >
> > > > I strongly suggest that you join this discussion as well (and sorry=
 I don't
> > > > have the link at hand).
> > >
> > > Yeah I think since Android keeps the dma-buf fd around anyway (by des=
ign),
> > > and since this is geared 100% for Android, implementing this exact
> > > functionality as an fdinfo on the dma-buf sounds a lot cleaner to me.
> > > Putting this in sysfs is really a bit a hack.
> >
> > The /proc/<pid>/fdinfo/<fd> interface
> > can only provide information about the buffers for which processes
> > hold fds. Hence, for the purposes of calculating per-buffer
> > statistics, parsing /proc/<pid>/fdinfo/<fd> by itself would not provide
> > a complete picture.
>
> Bummer, I had hopes, but makes sense. Please also include that in the
> commit message so that we have everything.
>
> > Thank you for the reviews and comments Greg, Christian and Daniel!
> >
> > Regards,
> > Hridya
> >
> >
> >
> > >
> > > But it is also orthogonal to our fdinfo discussion, since our fdinfo =
is
> > > for the drm_file, not the dma-buf fd.
> > >
> > > Except ofc I'm yet again not quite understanding what exactly Android
> > > wants/needs.
> > > -Daniel
> > >
> > > >
> > > > Regards,
> > > > Christian.
> > > >
> > > > >
> > > > > Regards,
> > > > > Hridya
> > > > >
> > > > > Changes in v4:
> > > > > -Suppress uevents from kset creation to avoid waking up uevent li=
steners on
> > > > > DMA-BUF export/release.
> > > > >
> > > > > Changes in v3:
> > > > > -Fix a warning reported by the kernel test robot.
> > > > >
> > > > > Changes in v2:
> > > > > -Move statistics to /sys/kernel/dmabuf/buffers in oder to allow a=
ddition
> > > > > of other DMA-BUF-related sysfs stats in future. Based on feedback=
 from
> > > > > Daniel Vetter.
> > > > > -Each attachment has its own directory to represent attaching dev=
ices as
> > > > > symlinks and to introduce map_count as a separate file. Based on
> > > > > feedback from Daniel Vetter and Christian K=C3=B6nig. Thank you b=
oth!
> > > > > -Commit messages updated to point to userspace code in AOSP that =
will
> > > > > read the DMA-BUF sysfs stats.
> > > > >
> > > > >   .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  52 +++
> > > > >   drivers/dma-buf/Kconfig                       |  11 +
> > > > >   drivers/dma-buf/Makefile                      |   1 +
> > > > >   drivers/dma-buf/dma-buf-sysfs-stats.c         | 300 +++++++++++=
+++++++
> > > > >   drivers/dma-buf/dma-buf-sysfs-stats.h         |  62 ++++
> > > > >   drivers/dma-buf/dma-buf.c                     |  37 +++
> > > > >   include/linux/dma-buf.h                       |  20 ++
> > > > >   7 files changed, 483 insertions(+)
> > > > >   create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabu=
f-buffers
> > > > >   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
> > > > >   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
> > > > >
> > > > > diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffer=
s b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> > > > > new file mode 100644
> > > > > index 000000000000..73a8c372b0f2
> > > > > --- /dev/null
> > > > > +++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> > > > > @@ -0,0 +1,52 @@
> > > > > +What:              /sys/kernel/dmabuf/buffers
> > > > > +Date:              May 2021
> > > > > +KernelVersion:     v5.13
> > > > > +Contact:   Hridya Valsaraju <hridya@google.com>
> > > > > +Description:       The /sys/kernel/dmabuf/buffers directory cont=
ains a
> > > > > +           snapshot of the internal state of every DMA-BUF.
> > > > > +           /sys/kernel/dmabuf/buffers/<inode_number> will contai=
n the
> > > > > +           statistics for the DMA-BUF with the unique inode numb=
er
> > > > > +           <inode_number>
> > > > > +Users:             kernel memory tuning/debugging tools
> > > > > +
> > > > > +What:              /sys/kernel/dmabuf/buffers/<inode_number>/exp=
orter_name
> > > > > +Date:              May 2021
> > > > > +KernelVersion:     v5.13
> > > > > +Contact:   Hridya Valsaraju <hridya@google.com>
> > > > > +Description:       This file is read-only and contains the name =
of the exporter of
> > > > > +           the DMA-BUF.
> > > > > +
> > > > > +What:              /sys/kernel/dmabuf/buffers/<inode_number>/siz=
e
> > > > > +Date:              May 2021
> > > > > +KernelVersion:     v5.13
> > > > > +Contact:   Hridya Valsaraju <hridya@google.com>
> > > > > +Description:       This file is read-only and specifies the size=
 of the DMA-BUF in
> > > > > +           bytes.
> > > > > +
> > > > > +What:              /sys/kernel/dmabuf/buffers/<inode_number>/att=
achments
> > > > > +Date:              May 2021
> > > > > +KernelVersion:     v5.13
> > > > > +Contact:   Hridya Valsaraju <hridya@google.com>
> > > > > +Description:       This directory will contain subdirectories re=
presenting every
> > > > > +           attachment of the DMA-BUF.
> > > > > +
> > > > > +What:              /sys/kernel/dmabuf/buffers/<inode_number>/att=
achments/<attachment_uid>
> > > > > +Date:              May 2021
> > > > > +KernelVersion:     v5.13
> > > > > +Contact:   Hridya Valsaraju <hridya@google.com>
> > > > > +Description:       This directory will contain information on th=
e attaching device
> > > > > +           and the number of current distinct device mappings.
> > > > > +
> > > > > +What:              /sys/kernel/dmabuf/buffers/<inode_number>/att=
achments/<attachment_uid>/device
> > > > > +Date:              May 2021
> > > > > +KernelVersion:     v5.13
> > > > > +Contact:   Hridya Valsaraju <hridya@google.com>
> > > > > +Description:       This file is read-only and is a symlink to th=
e attaching devices's
> > > > > +           sysfs entry.
> > > > > +
> > > > > +What:              /sys/kernel/dmabuf/buffers/<inode_number>/att=
achments/<attachment_uid>/map_counter
> > > > > +Date:              May 2021
> > > > > +KernelVersion:     v5.13
> > > > > +Contact:   Hridya Valsaraju <hridya@google.com>
> > > > > +Description:       This file is read-only and contains a map_cou=
nter indicating the
> > > > > +           number of distinct device mappings of the attachment.
> > > > > diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> > > > > index 4e16c71c24b7..9561e3d2d428 100644
> > > > > --- a/drivers/dma-buf/Kconfig
> > > > > +++ b/drivers/dma-buf/Kconfig
> > > > > @@ -72,6 +72,17 @@ menuconfig DMABUF_HEAPS
> > > > >       allows userspace to allocate dma-bufs that can be shared
> > > > >       between drivers.
> > > > > +menuconfig DMABUF_SYSFS_STATS
> > > > > +   bool "DMA-BUF sysfs statistics"
> > > > > +   select DMA_SHARED_BUFFER
> > > > > +   help
> > > > > +      Choose this option to enable DMA-BUF sysfs statistics
> > > > > +      in location /sys/kernel/dmabuf/buffers.
> > > > > +
> > > > > +      /sys/kernel/dmabuf/buffers/<inode_number> will contain
> > > > > +      statistics for the DMA-BUF with the unique inode number
> > > > > +      <inode_number>.
> > > > > +
> > > > >   source "drivers/dma-buf/heaps/Kconfig"
> > > > >   endmenu
> > > > > diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> > > > > index 995e05f609ff..40d81f23cacf 100644
> > > > > --- a/drivers/dma-buf/Makefile
> > > > > +++ b/drivers/dma-buf/Makefile
> > > > > @@ -6,6 +6,7 @@ obj-$(CONFIG_DMABUF_HEAPS)  +=3D heaps/
> > > > >   obj-$(CONFIG_SYNC_FILE)           +=3D sync_file.o
> > > > >   obj-$(CONFIG_SW_SYNC)             +=3D sw_sync.o sync_debug.o
> > > > >   obj-$(CONFIG_UDMABUF)             +=3D udmabuf.o
> > > > > +obj-$(CONFIG_DMABUF_SYSFS_STATS) +=3D dma-buf-sysfs-stats.o
> > > > >   dmabuf_selftests-y :=3D \
> > > > >     selftest.o \
> > > > > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-=
buf/dma-buf-sysfs-stats.c
> > > > > new file mode 100644
> > > > > index 000000000000..45717c8108c8
> > > > > --- /dev/null
> > > > > +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> > > > > @@ -0,0 +1,300 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > +/*
> > > > > + * DMA-BUF sysfs statistics.
> > > > > + *
> > > > > + * Copyright (C) 2021 Google LLC.
> > > > > + */
> > > > > +
> > > > > +#include <linux/dma-buf.h>
> > > > > +#include <linux/dma-resv.h>
> > > > > +#include <linux/kobject.h>
> > > > > +#include <linux/printk.h>
> > > > > +#include <linux/slab.h>
> > > > > +#include <linux/sysfs.h>
> > > > > +
> > > > > +#include "dma-buf-sysfs-stats.h"
> > > > > +
> > > > > +#define to_dma_buf_entry_from_kobj(x) container_of(x, struct dma=
_buf_sysfs_entry, kobj)
> > > > > +
> > > > > +struct dma_buf_stats_attribute {
> > > > > +   struct attribute attr;
> > > > > +   ssize_t (*show)(struct dma_buf *dmabuf,
> > > > > +                   struct dma_buf_stats_attribute *attr, char *b=
uf);
> > > > > +};
> > > > > +#define to_dma_buf_stats_attr(x) container_of(x, struct dma_buf_=
stats_attribute, attr)
> > > > > +
> > > > > +static ssize_t dma_buf_stats_attribute_show(struct kobject *kobj=
,
> > > > > +                                       struct attribute *attr,
> > > > > +                                       char *buf)
> > > > > +{
> > > > > +   struct dma_buf_stats_attribute *attribute;
> > > > > +   struct dma_buf_sysfs_entry *sysfs_entry;
> > > > > +   struct dma_buf *dmabuf;
> > > > > +
> > > > > +   attribute =3D to_dma_buf_stats_attr(attr);
> > > > > +   sysfs_entry =3D to_dma_buf_entry_from_kobj(kobj);
> > > > > +   dmabuf =3D sysfs_entry->dmabuf;
> > > > > +
> > > > > +   if (!dmabuf || !attribute->show)
> > > > > +           return -EIO;
> > > > > +
> > > > > +   return attribute->show(dmabuf, attribute, buf);
> > > > > +}
> > > > > +
> > > > > +static const struct sysfs_ops dma_buf_stats_sysfs_ops =3D {
> > > > > +   .show =3D dma_buf_stats_attribute_show,
> > > > > +};
> > > > > +
> > > > > +static ssize_t exporter_name_show(struct dma_buf *dmabuf,
> > > > > +                             struct dma_buf_stats_attribute *att=
r,
> > > > > +                             char *buf)
> > > > > +{
> > > > > +   return sysfs_emit(buf, "%s\n", dmabuf->exp_name);
> > > > > +}
> > > > > +
> > > > > +static ssize_t size_show(struct dma_buf *dmabuf,
> > > > > +                    struct dma_buf_stats_attribute *attr,
> > > > > +                    char *buf)
> > > > > +{
> > > > > +   return sysfs_emit(buf, "%zu\n", dmabuf->size);
> > > > > +}
> > > > > +
> > > > > +static struct dma_buf_stats_attribute exporter_name_attribute =
=3D
> > > > > +   __ATTR_RO(exporter_name);
> > > > > +static struct dma_buf_stats_attribute size_attribute =3D __ATTR_=
RO(size);
> > > > > +
> > > > > +static struct attribute *dma_buf_stats_default_attrs[] =3D {
> > > > > +   &exporter_name_attribute.attr,
> > > > > +   &size_attribute.attr,
> > > > > +   NULL,
> > > > > +};
> > > > > +ATTRIBUTE_GROUPS(dma_buf_stats_default);
> > > > > +
> > > > > +static void dma_buf_sysfs_release(struct kobject *kobj)
> > > > > +{
> > > > > +   struct dma_buf_sysfs_entry *sysfs_entry;
> > > > > +
> > > > > +   sysfs_entry =3D to_dma_buf_entry_from_kobj(kobj);
> > > > > +   kfree(sysfs_entry);
> > > > > +}
> > > > > +
> > > > > +static struct kobj_type dma_buf_ktype =3D {
> > > > > +   .sysfs_ops =3D &dma_buf_stats_sysfs_ops,
> > > > > +   .release =3D dma_buf_sysfs_release,
> > > > > +   .default_groups =3D dma_buf_stats_default_groups,
> > > > > +};
> > > > > +
> > > > > +#define to_dma_buf_attach_entry_from_kobj(x) container_of(x, str=
uct dma_buf_attach_sysfs_entry, kobj)
> > > > > +
> > > > > +struct dma_buf_attach_stats_attribute {
> > > > > +   struct attribute attr;
> > > > > +   ssize_t (*show)(struct dma_buf_attach_sysfs_entry *sysfs_entr=
y,
> > > > > +                   struct dma_buf_attach_stats_attribute *attr, =
char *buf);
> > > > > +};
> > > > > +#define to_dma_buf_attach_stats_attr(x) container_of(x, struct d=
ma_buf_attach_stats_attribute, attr)
> > > > > +
> > > > > +static ssize_t dma_buf_attach_stats_attribute_show(struct kobjec=
t *kobj,
> > > > > +                                              struct attribute *=
attr,
> > > > > +                                              char *buf)
> > > > > +{
> > > > > +   struct dma_buf_attach_stats_attribute *attribute;
> > > > > +   struct dma_buf_attach_sysfs_entry *sysfs_entry;
> > > > > +
> > > > > +   attribute =3D to_dma_buf_attach_stats_attr(attr);
> > > > > +   sysfs_entry =3D to_dma_buf_attach_entry_from_kobj(kobj);
> > > > > +
> > > > > +   if (!attribute->show)
> > > > > +           return -EIO;
> > > > > +
> > > > > +   return attribute->show(sysfs_entry, attribute, buf);
> > > > > +}
> > > > > +
> > > > > +static const struct sysfs_ops dma_buf_attach_stats_sysfs_ops =3D=
 {
> > > > > +   .show =3D dma_buf_attach_stats_attribute_show,
> > > > > +};
> > > > > +
> > > > > +static ssize_t map_counter_show(struct dma_buf_attach_sysfs_entr=
y *sysfs_entry,
> > > > > +                           struct dma_buf_attach_stats_attribute=
 *attr,
> > > > > +                           char *buf)
> > > > > +{
> > > > > +   return sysfs_emit(buf, "%u\n", sysfs_entry->map_counter);
> > > > > +}
> > > > > +
> > > > > +static struct dma_buf_attach_stats_attribute map_counter_attribu=
te =3D
> > > > > +   __ATTR_RO(map_counter);
> > > > > +
> > > > > +static struct attribute *dma_buf_attach_stats_default_attrs[] =
=3D {
> > > > > +   &map_counter_attribute.attr,
> > > > > +   NULL,
> > > > > +};
> > > > > +ATTRIBUTE_GROUPS(dma_buf_attach_stats_default);
> > > > > +
> > > > > +static void dma_buf_attach_sysfs_release(struct kobject *kobj)
> > > > > +{
> > > > > +   struct dma_buf_attach_sysfs_entry *sysfs_entry;
> > > > > +
> > > > > +   sysfs_entry =3D to_dma_buf_attach_entry_from_kobj(kobj);
> > > > > +   kfree(sysfs_entry);
> > > > > +}
> > > > > +
> > > > > +static struct kobj_type dma_buf_attach_ktype =3D {
> > > > > +   .sysfs_ops =3D &dma_buf_attach_stats_sysfs_ops,
> > > > > +   .release =3D dma_buf_attach_sysfs_release,
> > > > > +   .default_groups =3D dma_buf_attach_stats_default_groups,
> > > > > +};
> > > > > +
> > > > > +void dma_buf_attach_stats_teardown(struct dma_buf_attachment *at=
tach)
> > > > > +{
> > > > > +   struct dma_buf_attach_sysfs_entry *sysfs_entry;
> > > > > +
> > > > > +   sysfs_entry =3D attach->sysfs_entry;
> > > > > +   if (!sysfs_entry)
> > > > > +           return;
> > > > > +
> > > > > +   sysfs_delete_link(&sysfs_entry->kobj, &attach->dev->kobj, "de=
vice");
> > > > > +
> > > > > +   kobject_del(&sysfs_entry->kobj);
> > > > > +   kobject_put(&sysfs_entry->kobj);
> > > > > +}
> > > > > +
> > > > > +int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach=
,
> > > > > +                          unsigned int uid)
> > > > > +{
> > > > > +   struct dma_buf_attach_sysfs_entry *sysfs_entry;
> > > > > +   int ret;
> > > > > +   struct dma_buf *dmabuf;
> > > > > +
> > > > > +   if (!attach)
> > > > > +           return -EINVAL;
> > > > > +
> > > > > +   dmabuf =3D attach->dmabuf;
> > > > > +
> > > > > +   sysfs_entry =3D kzalloc(sizeof(struct dma_buf_attach_sysfs_en=
try),
> > > > > +                         GFP_KERNEL);
> > > > > +   if (!sysfs_entry)
> > > > > +           return -ENOMEM;
> > > > > +
> > > > > +   sysfs_entry->kobj.kset =3D dmabuf->sysfs_entry->attach_stats_=
kset;
> > > > > +
> > > > > +   attach->sysfs_entry =3D sysfs_entry;
> > > > > +
> > > > > +   ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_att=
ach_ktype,
> > > > > +                              NULL, "%u", uid);
> > > > > +   if (ret)
> > > > > +           goto kobj_err;
> > > > > +
> > > > > +   ret =3D sysfs_create_link(&sysfs_entry->kobj, &attach->dev->k=
obj,
> > > > > +                           "device");
> > > > > +   if (ret)
> > > > > +           goto link_err;
> > > > > +
> > > > > +   return 0;
> > > > > +
> > > > > +link_err:
> > > > > +   kobject_del(&sysfs_entry->kobj);
> > > > > +kobj_err:
> > > > > +   kobject_put(&sysfs_entry->kobj);
> > > > > +   attach->sysfs_entry =3D NULL;
> > > > > +
> > > > > +   return ret;
> > > > > +}
> > > > > +void dma_buf_stats_teardown(struct dma_buf *dmabuf)
> > > > > +{
> > > > > +   struct dma_buf_sysfs_entry *sysfs_entry;
> > > > > +
> > > > > +   sysfs_entry =3D dmabuf->sysfs_entry;
> > > > > +   if (!sysfs_entry)
> > > > > +           return;
> > > > > +
> > > > > +   kset_unregister(sysfs_entry->attach_stats_kset);
> > > > > +   kobject_del(&sysfs_entry->kobj);
> > > > > +   kobject_put(&sysfs_entry->kobj);
> > > > > +}
> > > > > +
> > > > > +
> > > > > +/* Statistics files do not need to send uevents. */
> > > > > +static int dmabuf_sysfs_uevent_filter(struct kset *kset, struct =
kobject *kobj)
> > > > > +{
> > > > > +   return 0;
> > > > > +}
> > > > > +
> > > > > +static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops =
=3D {
> > > > > +   .filter =3D dmabuf_sysfs_uevent_filter,
> > > > > +};
> > > > > +
> > > > > +static struct kset *dma_buf_stats_kset;
> > > > > +static struct kset *dma_buf_per_buffer_stats_kset;
> > > > > +int dma_buf_init_sysfs_statistics(void)
> > > > > +{
> > > > > +   dma_buf_stats_kset =3D kset_create_and_add("dmabuf",
> > > > > +                                            &dmabuf_sysfs_no_uev=
ent_ops,
> > > > > +                                            kernel_kobj);
> > > > > +   if (!dma_buf_stats_kset)
> > > > > +           return -ENOMEM;
> > > > > +
> > > > > +   dma_buf_per_buffer_stats_kset =3D kset_create_and_add("buffer=
s",
> > > > > +                                                       &dmabuf_s=
ysfs_no_uevent_ops,
> > > > > +                                                       &dma_buf_=
stats_kset->kobj);
> > > > > +   if (!dma_buf_per_buffer_stats_kset) {
> > > > > +           kset_unregister(dma_buf_stats_kset);
> > > > > +           return -ENOMEM;
> > > > > +   }
> > > > > +
> > > > > +   return 0;
> > > > > +}
> > > > > +
> > > > > +void dma_buf_uninit_sysfs_statistics(void)
> > > > > +{
> > > > > +   kset_unregister(dma_buf_per_buffer_stats_kset);
> > > > > +   kset_unregister(dma_buf_stats_kset);
> > > > > +}
> > > > > +
> > > > > +int dma_buf_stats_setup(struct dma_buf *dmabuf)
> > > > > +{
> > > > > +   struct dma_buf_sysfs_entry *sysfs_entry;
> > > > > +   int ret;
> > > > > +   struct kset *attach_stats_kset;
> > > > > +
> > > > > +   if (!dmabuf || !dmabuf->file)
> > > > > +           return -EINVAL;
> > > > > +
> > > > > +   if (!dmabuf->exp_name) {
> > > > > +           pr_err("exporter name must not be empty if stats need=
ed\n");
> > > > > +           return -EINVAL;
> > > > > +   }
> > > > > +
> > > > > +   sysfs_entry =3D kzalloc(sizeof(struct dma_buf_sysfs_entry), G=
FP_KERNEL);
> > > > > +   if (!sysfs_entry)
> > > > > +           return -ENOMEM;
> > > > > +
> > > > > +   sysfs_entry->kobj.kset =3D dma_buf_per_buffer_stats_kset;
> > > > > +   sysfs_entry->dmabuf =3D dmabuf;
> > > > > +
> > > > > +   dmabuf->sysfs_entry =3D sysfs_entry;
> > > > > +
> > > > > +   /* create the directory for buffer stats */
> > > > > +   ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_kty=
pe, NULL,
> > > > > +                              "%lu", file_inode(dmabuf->file)->i=
_ino);
> > > > > +   if (ret)
> > > > > +           goto err_sysfs_dmabuf;
> > > > > +
> > > > > +   /* create the directory for attachment stats */
> > > > > +   attach_stats_kset =3D kset_create_and_add("attachments",
> > > > > +                                           &dmabuf_sysfs_no_ueve=
nt_ops,
> > > > > +                                           &sysfs_entry->kobj);
> > > > > +   if (!attach_stats_kset) {
> > > > > +           ret =3D -ENOMEM;
> > > > > +           goto err_sysfs_attach;
> > > > > +   }
> > > > > +
> > > > > +   sysfs_entry->attach_stats_kset =3D attach_stats_kset;
> > > > > +
> > > > > +   return 0;
> > > > > +
> > > > > +err_sysfs_attach:
> > > > > +   kobject_del(&sysfs_entry->kobj);
> > > > > +err_sysfs_dmabuf:
> > > > > +   kobject_put(&sysfs_entry->kobj);
> > > > > +   dmabuf->sysfs_entry =3D NULL;
> > > > > +   return ret;
> > > > > +}
> > > > > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-=
buf/dma-buf-sysfs-stats.h
> > > > > new file mode 100644
> > > > > index 000000000000..5f4703249117
> > > > > --- /dev/null
> > > > > +++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
> > > > > @@ -0,0 +1,62 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > > +/*
> > > > > + * DMA-BUF sysfs statistics.
> > > > > + *
> > > > > + * Copyright (C) 2021 Google LLC.
> > > > > + */
> > > > > +
> > > > > +#ifndef _DMA_BUF_SYSFS_STATS_H
> > > > > +#define _DMA_BUF_SYSFS_STATS_H
> > > > > +
> > > > > +#ifdef CONFIG_DMABUF_SYSFS_STATS
> > > > > +
> > > > > +int dma_buf_init_sysfs_statistics(void);
> > > > > +void dma_buf_uninit_sysfs_statistics(void);
> > > > > +
> > > > > +int dma_buf_stats_setup(struct dma_buf *dmabuf);
> > > > > +int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach=
,
> > > > > +                          unsigned int uid);
> > > > > +static inline void dma_buf_update_attachment_map_count(struct dm=
a_buf_attachment *attach,
> > > > > +                                                  int delta)
> > > > > +{
> > > > > +   struct dma_buf_attach_sysfs_entry *entry =3D attach->sysfs_en=
try;
> > > > > +
> > > > > +   entry->map_counter +=3D delta;
> > > > > +}
> > > > > +void dma_buf_stats_teardown(struct dma_buf *dmabuf);
> > > > > +void dma_buf_attach_stats_teardown(struct dma_buf_attachment *at=
tach);
> > > > > +static inline unsigned int dma_buf_update_attach_uid(struct dma_=
buf *dmabuf)
> > > > > +{
> > > > > +   struct dma_buf_sysfs_entry *entry =3D dmabuf->sysfs_entry;
> > > > > +
> > > > > +   return entry->attachment_uid++;
> > > > > +}
> > > > > +#else
> > > > > +
> > > > > +static inline int dma_buf_init_sysfs_statistics(void)
> > > > > +{
> > > > > +   return 0;
> > > > > +}
> > > > > +
> > > > > +static inline void dma_buf_uninit_sysfs_statistics(void) {}
> > > > > +
> > > > > +static inline int dma_buf_stats_setup(struct dma_buf *dmabuf)
> > > > > +{
> > > > > +   return 0;
> > > > > +}
> > > > > +static inline int dma_buf_attach_stats_setup(struct dma_buf_atta=
chment *attach,
> > > > > +                                        unsigned int uid)
> > > > > +{
> > > > > +   return 0;
> > > > > +}
> > > > > +
> > > > > +static inline void dma_buf_stats_teardown(struct dma_buf *dmabuf=
) {}
> > > > > +static inline void dma_buf_attach_stats_teardown(struct dma_buf_=
attachment *attach) {}
> > > > > +static inline void dma_buf_update_attachment_map_count(struct dm=
a_buf_attachment *attach,
> > > > > +                                                  int delta) {}
> > > > > +static inline unsigned int dma_buf_update_attach_uid(struct dma_=
buf *dmabuf)
> > > > > +{
> > > > > +   return 0;
> > > > > +}
> > > > > +#endif
> > > > > +#endif // _DMA_BUF_SYSFS_STATS_H
> > > > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.=
c
> > > > > index f264b70c383e..184dd7acb1ed 100644
> > > > > --- a/drivers/dma-buf/dma-buf.c
> > > > > +++ b/drivers/dma-buf/dma-buf.c
> > > > > @@ -29,6 +29,8 @@
> > > > >   #include <uapi/linux/dma-buf.h>
> > > > >   #include <uapi/linux/magic.h>
> > > > > +#include "dma-buf-sysfs-stats.h"
> > > > > +
> > > > >   static inline int is_dma_buf_file(struct file *);
> > > > >   struct dma_buf_list {
> > > > > @@ -79,6 +81,7 @@ static void dma_buf_release(struct dentry *dent=
ry)
> > > > >     if (dmabuf->resv =3D=3D (struct dma_resv *)&dmabuf[1])
> > > > >             dma_resv_fini(dmabuf->resv);
> > > > > +   dma_buf_stats_teardown(dmabuf);
> > > > >     module_put(dmabuf->owner);
> > > > >     kfree(dmabuf->name);
> > > > >     kfree(dmabuf);
> > > > > @@ -580,6 +583,10 @@ struct dma_buf *dma_buf_export(const struct =
dma_buf_export_info *exp_info)
> > > > >     file->f_mode |=3D FMODE_LSEEK;
> > > > >     dmabuf->file =3D file;
> > > > > +   ret =3D dma_buf_stats_setup(dmabuf);
> > > > > +   if (ret)
> > > > > +           goto err_sysfs;
> > > > > +
> > > > >     mutex_init(&dmabuf->lock);
> > > > >     INIT_LIST_HEAD(&dmabuf->attachments);
> > > > > @@ -589,6 +596,14 @@ struct dma_buf *dma_buf_export(const struct =
dma_buf_export_info *exp_info)
> > > > >     return dmabuf;
> > > > > +err_sysfs:
> > > > > +   /*
> > > > > +    * Set file->f_path.dentry->d_fsdata to NULL so that when
> > > > > +    * dma_buf_release() gets invoked by dentry_ops, it exits
> > > > > +    * early before calling the release() dma_buf op.
> > > > > +    */
> > > > > +   file->f_path.dentry->d_fsdata =3D NULL;
> > > > > +   fput(file);
> > > > >   err_dmabuf:
> > > > >     kfree(dmabuf);
> > > > >   err_module:
> > > > > @@ -723,6 +738,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf=
, struct device *dev,
> > > > >   {
> > > > >     struct dma_buf_attachment *attach;
> > > > >     int ret;
> > > > > +   unsigned int attach_uid;
> > > > >     if (WARN_ON(!dmabuf || !dev))
> > > > >             return ERR_PTR(-EINVAL);
> > > > > @@ -748,8 +764,13 @@ dma_buf_dynamic_attach(struct dma_buf *dmabu=
f, struct device *dev,
> > > > >     }
> > > > >     dma_resv_lock(dmabuf->resv, NULL);
> > > > >     list_add(&attach->node, &dmabuf->attachments);
> > > > > +   attach_uid =3D dma_buf_update_attach_uid(dmabuf);
> > > > >     dma_resv_unlock(dmabuf->resv);
> > > > > +   ret =3D dma_buf_attach_stats_setup(attach, attach_uid);
> > > > > +   if (ret)
> > > > > +           goto err_sysfs;
> > > > > +
> > > > >     /* When either the importer or the exporter can't handle dyna=
mic
> > > > >      * mappings we cache the mapping here to avoid issues with th=
e
> > > > >      * reservation object lock.
> > > > > @@ -776,6 +797,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf=
, struct device *dev,
> > > > >                     dma_resv_unlock(attach->dmabuf->resv);
> > > > >             attach->sgt =3D sgt;
> > > > >             attach->dir =3D DMA_BIDIRECTIONAL;
> > > > > +           dma_buf_update_attachment_map_count(attach, 1 /* delt=
a */);
> > > > >     }
> > > > >     return attach;
> > > > > @@ -792,6 +814,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf=
, struct device *dev,
> > > > >     if (dma_buf_is_dynamic(attach->dmabuf))
> > > > >             dma_resv_unlock(attach->dmabuf->resv);
> > > > > +err_sysfs:
> > > > >     dma_buf_detach(dmabuf, attach);
> > > > >     return ERR_PTR(ret);
> > > > >   }
> > > > > @@ -841,6 +864,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, s=
truct dma_buf_attachment *attach)
> > > > >                     dma_resv_lock(attach->dmabuf->resv, NULL);
> > > > >             __unmap_dma_buf(attach, attach->sgt, attach->dir);
> > > > > +           dma_buf_update_attachment_map_count(attach, -1 /* del=
ta */);
> > > > >             if (dma_buf_is_dynamic(attach->dmabuf)) {
> > > > >                     dma_buf_unpin(attach);
> > > > > @@ -854,6 +878,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, s=
truct dma_buf_attachment *attach)
> > > > >     if (dmabuf->ops->detach)
> > > > >             dmabuf->ops->detach(dmabuf, attach);
> > > > > +   dma_buf_attach_stats_teardown(attach);
> > > > >     kfree(attach);
> > > > >   }
> > > > >   EXPORT_SYMBOL_GPL(dma_buf_detach);
> > > > > @@ -993,6 +1018,9 @@ struct sg_table *dma_buf_map_attachment(stru=
ct dma_buf_attachment *attach,
> > > > >     }
> > > > >   #endif /* CONFIG_DMA_API_DEBUG */
> > > > > +   if (!IS_ERR(sg_table))
> > > > > +           dma_buf_update_attachment_map_count(attach, 1 /* delt=
a */);
> > > > > +
> > > > >     return sg_table;
> > > > >   }
> > > > >   EXPORT_SYMBOL_GPL(dma_buf_map_attachment);
> > > > > @@ -1030,6 +1058,8 @@ void dma_buf_unmap_attachment(struct dma_bu=
f_attachment *attach,
> > > > >     if (dma_buf_is_dynamic(attach->dmabuf) &&
> > > > >         !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> > > > >             dma_buf_unpin(attach);
> > > > > +
> > > > > +   dma_buf_update_attachment_map_count(attach, -1 /* delta */);
> > > > >   }
> > > > >   EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
> > > > > @@ -1480,6 +1510,12 @@ static inline void dma_buf_uninit_debugfs(=
void)
> > > > >   static int __init dma_buf_init(void)
> > > > >   {
> > > > > +   int ret;
> > > > > +
> > > > > +   ret =3D dma_buf_init_sysfs_statistics();
> > > > > +   if (ret)
> > > > > +           return ret;
> > > > > +
> > > > >     dma_buf_mnt =3D kern_mount(&dma_buf_fs_type);
> > > > >     if (IS_ERR(dma_buf_mnt))
> > > > >             return PTR_ERR(dma_buf_mnt);
> > > > > @@ -1495,5 +1531,6 @@ static void __exit dma_buf_deinit(void)
> > > > >   {
> > > > >     dma_buf_uninit_debugfs();
> > > > >     kern_unmount(dma_buf_mnt);
> > > > > +   dma_buf_uninit_sysfs_statistics();
> > > > >   }
> > > > >   __exitcall(dma_buf_deinit);
> > > > > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > > > > index efdc56b9d95f..342585bd6dff 100644
> > > > > --- a/include/linux/dma-buf.h
> > > > > +++ b/include/linux/dma-buf.h
> > > > > @@ -295,6 +295,9 @@ struct dma_buf_ops {
> > > > >    * @poll: for userspace poll support
> > > > >    * @cb_excl: for userspace poll support
> > > > >    * @cb_shared: for userspace poll support
> > > > > + * @sysfs_entry: for exposing information about this buffer in s=
ysfs.
> > > > > + * The attachment_uid member of @sysfs_entry is protected by dma=
_resv lock
> > > > > + * and is incremented on each attach.
> > > > >    *
> > > > >    * This represents a shared buffer, created by calling dma_buf_=
export(). The
> > > > >    * userspace representation is a normal file descriptor, which =
can be created by
> > > > > @@ -330,6 +333,15 @@ struct dma_buf {
> > > > >             __poll_t active;
> > > > >     } cb_excl, cb_shared;
> > > > > +#ifdef CONFIG_DMABUF_SYSFS_STATS
> > > > > +   /* for sysfs stats */
> > > > > +   struct dma_buf_sysfs_entry {
> > > > > +           struct kobject kobj;
> > > > > +           struct dma_buf *dmabuf;
> > > > > +           unsigned int attachment_uid;
> > > > > +           struct kset *attach_stats_kset;
> > > > > +   } *sysfs_entry;
> > > > > +#endif
> > > > >   };
> > > > >   /**
> > > > > @@ -379,6 +391,7 @@ struct dma_buf_attach_ops {
> > > > >    * @importer_ops: importer operations for this attachment, if p=
rovided
> > > > >    * dma_buf_map/unmap_attachment() must be called with the dma_r=
esv lock held.
> > > > >    * @importer_priv: importer specific attachment data.
> > > > > + * @sysfs_entry: For exposing information about this attachment =
in sysfs.
> > > > >    *
> > > > >    * This structure holds the attachment information between the =
dma_buf buffer
> > > > >    * and its user device(s). The list contains one attachment str=
uct per device
> > > > > @@ -399,6 +412,13 @@ struct dma_buf_attachment {
> > > > >     const struct dma_buf_attach_ops *importer_ops;
> > > > >     void *importer_priv;
> > > > >     void *priv;
> > > > > +#ifdef CONFIG_DMABUF_SYSFS_STATS
> > > > > +   /* for sysfs stats */
> > > > > +   struct dma_buf_attach_sysfs_entry {
> > > > > +           struct kobject kobj;
> > > > > +           unsigned int map_counter;
> > > > > +   } *sysfs_entry;
> > > > > +#endif
> > > > >   };
> > > > >   /**
> > > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
