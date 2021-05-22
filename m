Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C735338D750
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 22:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B906E0D1;
	Sat, 22 May 2021 20:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49CF6E0D1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 May 2021 20:05:33 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i17so24313329wrq.11
 for <dri-devel@lists.freedesktop.org>; Sat, 22 May 2021 13:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sh/nv4GAmHxigrKAMgI9UHAAlWD4g2m8sYFn+xzeqOY=;
 b=oD+AjNut3ET2Zm4dBoQlFHFnqG4EgWRSrUpDerewjBQzSBXG1dCOxb5y1xWEb8yFRZ
 V+L8mNQ8f31vX6trafndRI8M1RBuIBpid+T0sMipB55d6xHUOjcUOY9d9iS73sI41Y+6
 nYv/ULt9gvHMfDcLC8RKI+n+TX1kn2aiQGSiXaGTcDphkxUE/AfjkadUFUAzDlrDSX01
 VTuTXNbKLJA0lhzhRudzRRrnz0S1S8wsR3HyOiJtK1I/7nm/Ux1Hd5E1z8LQ5QuLh5hM
 HpFfLnp3cNrGmsLXPsZ22kZk+FLkcb56SwXWM+11vo/rCSw+7PH3PsMlaC7uFalGF3Op
 z80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sh/nv4GAmHxigrKAMgI9UHAAlWD4g2m8sYFn+xzeqOY=;
 b=tMArKHnFi29vPiDSl3A/ENLVWfJhEFRjYfc/jiKlpW4/UobiqjqDLS1oqoaluMJCa0
 6w3j4kjC0p5H1pzSZq2ubB7rm7I62993iooozrxxikpeBIzNqyItmQzTKk6mW2nZEcxs
 pBKM1htJFOF2QxLTKea1b/ESSqNVJe4/zf42mkq/LEsTmR+7DbB+4MtVgbiKFwLxBVZ8
 GAeoAnWsAxrxizupS3TxgLJTB4tTy9p6VNizOoiR0Q3Pvm/oc2pr2gVABQmr9geofXhj
 71g+LeT9hsXa1VymbMS/bQNhtVdck5wIWm1s8kMTIGjGcP4CNA+HokAfq9cbZ3EDUMGn
 up5A==
X-Gm-Message-State: AOAM531Gw4KqEVYDqMOI97Fsi/6kLx5qYzJBVMMlWqqtHH2qJNAno/Pc
 SKlLaJJBP1Xh2ceIlTlo9YsZxIbSg5T5TdqzMjCS4T6yYYWO2A==
X-Google-Smtp-Source: ABdhPJyzh11MWGhh7VzHtsdUkIP2kughEfflWhwJb9VPSDsr6dzcBkSdh0mWIG24vidPdn5AlXqmW+Eg1qssRurn/ZY=
X-Received: by 2002:a5d:5144:: with SMTP id u4mr15050196wrt.373.1621713932060; 
 Sat, 22 May 2021 13:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
In-Reply-To: <20210520190007.534046-5-jason@jlekstrand.net>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 22 May 2021 21:05:20 +0100
Message-ID: <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] RFC: dma-buf: Add an API for importing sync files (v6)
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 20 May 2021 at 20:00, Jason Ekstrand <jason@jlekstrand.net> wrote:
> In the Vulkan world, this is useful for dealing with the out-fence from
> vkQueuePresent.  Current Linux window-systems (X11, Wayland, etc.) all
> rely on dma-buf implicit sync.  Since Vulkan is an explicit sync API, we
> get a set of fences (VkSemaphores) in vkQueuePresent and have to stash
> those as an exclusive (write) fence on the dma-buf.  We handle it in
> Mesa today with the above mentioned dummy submit trick.  This ioctl
> would allow us to set it directly without the dummy submit.
>
> This may also open up possibilities for GPU drivers to move away from
> implicit sync for their kernel driver uAPI and instead provide sync
> files and rely on dma-buf import/export for communicating with other
> implicit sync clients.
>
> We make the explicit choice here to only allow setting RW fences which
> translates to an exclusive fence on the dma_resv.  There's no use for
> read-only fences for communicating with other implicit sync userspace
> and any such attempts are likely to be racy at best.

I think I almost follow, but I'm not quite seeing the race you allude
to. Let me talk through my understanding so it's hopefully more clear
for others as a summary. Please correct me on anything I've
misunderstood or just missed completely. (I thought when I wrote this
intro that the email might be relatively snappy, but it's really long
and takes in a lot of breadth. Sorry.)

So as far as I'm reading this patchset and the Mesa MR, this _only_
concerns the out-fence (i.e. compositor -> client AcquireNextImage
semaphore/fence) so far. The in-fence (client->compositor QueuePresent
wait-semaphores/fences) is handled by the driver ensuring that an
exclusive resv is placed on the union of the signal semaphores passed
to QueuePresent, either through flags on its CS ioctl, or amdgpu's BO
flags, or ... either way, no problem as it should always be exclusive,
and it seems pretty uncontroversial that we should pull the wait
semaphore into an exclusive fence so that no downstream consumer will
begin using it until the client ops have fully retired.

For AcquireNextImage, your patchset exports all the fences (shared and
exclusive both) on the dma_resv out into the semaphore/fence such that
the client can't progress (CPU-side for VkFence, GPU-side for
VkSemaphore) until all currently queued operations have completely
retired. So, as long as the server ensures that all its kernel-side
work is flushed before its IPC to unblock ANI (wl_buffer.release or
DRI3 PresentIdle, both indicating that the client is free to reuse the
buffer, subject to synchronising against implicit fences on the resv),
all good: we snapshot the current resv state, wrap the relevant
driver-side Vulkan primitive around it, and go back to explicit
synchronisation. The client can't race generating new work against
this, because it can't queue any work until ANI has returned and
queued a signaling op on the semaphore/fence.

So far, so good. I really like both your series up until this
narrative point; as I was saying in the userspace-fence thread, the
WSI<->client thread is certainly pulling a very big lever with a
heavyweight transition between the two different worlds, and I like
that the new export ioctl lets us be very clear about what exactly is
happening under the hood. Good stuff.

So, what gives with the import ioctl? Taking a guess at where you're
going, the import ioctl is going to be used in QueuePresent just as
the export ioctl is in ANI: instead of having CS flags to write into
the resv exclusive slot or per-BO flags to always dump in exclusive,
there's a forthcoming patch somewhere which lets drivers skip this and
instead have common QueuePresent code dump the wait semaphore into the
resv, so servers on the other side of an implicit-only protocol will
synchronise their access against the fence imported as part of
client-side QueuePresent?

That makes sense to me and is nicely symmetrical, plus it gets GPU
drivers further out of the business of doing magic winsys/display
synchronisation, which is good. But why enforce that imported fences
have to go into the exclusive slot? It makes sense from the point of
view of clients doing QueueSubmit, but I think it might preclude other
uses for no particularly good reason.

Certainly on X11 there's no real use for the shared slot - you get
into difficulties with mixed client/server rendering - but at least
Wayland and GBM are always non-destructive, so conceptually have a
good use for being able to import fences into the shared resv. This
goes for media and KMS access as well, if you think beyond the usecase
of an explicit Vulkan client sending through to a dumb implicit server
which just wants to texture.

Media clients are definitely a relevant usecase, both directly with
V4L2/VA-API, neither of which have support for explicit
synchronisation yet and (at least for V4L2) are unlikely to do so in
the near future, but even more with pipeline frameworks like GStreamer
and PipeWire, which don't have fundamental awareness (they're prepared
to deal with deep pipelines which return at arbitrary times, but once
anything is returned, it is available for immediate use). Maybe
open-coding CPU-side waits in these users is the best way longer term,
but for easier interop if nothing else, being able to pull shared
fences in seems like it could be a win ('the compositor is still
texturing from this for now, so feel free to read back from ref
frames, but don't scribble over it until it's finished').

I'm slightly bemused that there's so much energy spent on designing
around winsys being dumb and implicit. We did take a long time to roll
out sync_file support, but that was only because we didn't quite
understand all the nuances of why implicit sync is so difficult for
GPU drivers on modern architectures and how it was actually a win
compared to doing nothing; maybe we should have some kind of
conference where we all get together and talk to each other ... ?
Anyway, by the time we got to the cusp of rolling out bi-directional
sync_file support, suddenly we had drm_syncobj. By the time that had
semi-settled down and started to be rolled out, then we suddenly had
userspace fences on the horizon. And what do we do with those?

We've - certainly Weston, and I'm pretty confident I speak for Simon
on the wlroots side and Jonas for Mutter - landed on accepting that
we're going to have to deal with timeline semaphores and
wait-before-signal; we have a credible plan (we think) for protocol to
deal with at least syncobj, which should conceptually extend to
userspace fences. The biggest blocker there is the syncobj uAPI.
Compositors aren't Vulkan clients - we don't have one thread per group
of work, because the inter-client synchronisation becomes nightmarish
overhead for little gain. I don't think this will ever change, because
the balance of work is totally different between client and
compositor.

Anyway, the problem with syncobj is that the ioctl to wait for a
sync_file to materialise for a given timeline point only allows us to
block with a timeout; this is a non-starter, because we need something
which fits into epoll. The most optimal case is returning a new
eventfd or similar which signals when a given timeline point becomes
available or signaled, but in extremis a syncobj FD becoming readable
when any activity which would change the result of any zero-timeout
wait on that syncobj is more or less workable.

What we do want to do though, regardless of the primitive or its
semantics, is to only have to go through this once, not rework it all
in six months, and have to support a bunch of diverging codepaths. So
what is the optimal synchronisation primitive we should be aiming for
on the winsys side? Is sync_file a good enough lowest common
denominator, or should we do timeline-syncobj for fancy clients, in
tandem with sync_file bolted on the side for media and ancient GPUs?
Or are userspace fences going to give us some new primitive? And if
so, can we please talk about those semantics now, so we don't end up
with three synchronisation mechanisms which are all sort of but not
really alike?

As far as I can tell, the three relevant vendors with (more or less)
upstream drivers here are AMD, Arm, and Intel. Arm is obviously a bit
more up in the air as the hardware and specs aren't currently
available to the upstream development teams, but hopefully we can
bring them into this conversation. I think it's looking like we're
optimising for all of the following, without leaving anyone out in the
cold:

1. Modern userspace-fencing hardware running on a
userspace-fencing-aware winsys, i.e. new AMD/Arm/Intel on one of the
big three Wayland compositors which handle enough synchronisation
logic internally that the choice of underlying
composition/presentation API is immaterial (for which any new API is
important)
2. Modern userspace-fencing hardware running on Xwayland, for which
we'll inevitably have to type out new DRI3 synchronsiation, but
derived purely from the Wayland protocols so it can be passed through
quite directly, and with any mixed X11<->user buffer client
interaction (e.g. subwindows) being penalised by a long blocking wait
in the X server
3. sync_file-oriented hardware, for which we need to do ~nothing
4. Modern userspace-fencing hardware and APIs which need to interop
with media units, for all four combinations of client/server
source/sink; for some APIs like Vulkan Video synchronisation is not a
problem, for others like VA-API/V4L2/GStreamer we're probably need
going to live with the implicit semantics for the foreseeable future,
which means we should do the right thing for them up front, because
why would you even be playing games if you're not streaming them to
Twitch at the same time? (Personally I'm much happier that no-one
other than my friends who already know I'm terrible can see me playing
CoD, but y'know, kids these days ...)

The fifth case I've left out is clients who want to smash Vulkan
content directly into the display. For games and Kodi-like UI I'm just
going to ignore this, because (maybe I'm biased, but) using KMS
directly is difficult enough that you shouldn't do it and just use a
winsys because we've spent a very long time dealing with these
problems for you. The remaining usecase there is XR, but their uses
are very different, and OpenXR already deals with a _lot_ of this for
you, with the runtimes having sufficiently sophisticated
synchronisation internally that whatever we come up with won't be
onerous for them to implement. Either way, integration with KMS/GBM
has the same problem as Wayland, in that unless you fully encapsulate
it in something like VK_KHR_display, you don't get to throw a thread
under the bus to do delayed submit, because you need to actually
return something to the caller.

Ultimately, I think I'm leaning towards agreeing with Christian that I
would like to see a good holistic model for how this works in a
variety of usecases before we progress new uAPI, but also to agreeing
with you and Dan in that how amdgpu currently implements things is
currently objectively very wrong (despite the motivations for having
implemented it that way).

If there are any usecases I've missed then I'm all ears, but else I
think we should take this forward by working with
Vulkan/EGL/Wayland/X11/media/KMS and coming up with realistic
skeletons for end-to-end synchronisation through those usecases. It's
clear that this never happened for syncobj, because it's just not
usable as a primitive in any compositor which exists today: let's make
sure we don't get into the same trap again. If we can do this over
email/GitLab then that's great, but if not, maybe we need to do a kind
of mini-XDC with some kind of virtual whiteboard we can all scribble
over.

(As a coda to this, I'm pretty sure I understand the subtleties of the
memory fences for relocation/shootdown, but it would be _really_ good
to have a coherent description everyone agrees on written down
somewhere, so people can understand the issues without having to read
250 emails with people at loggerheads.)

Cheers,
Daniel








> When we got to
> insert the RW fence, the actual fence we set as the new exclusive fence
> is a combination of the sync_file provided by the user and all the other
> fences on the dma_resv.  This ensures that the newly added exclusive
> fence will never signal before the old one would have and ensures that
> we don't break any dma_resv contracts.  We require userspace to specify
> RW in the flags for symmetry with the export ioctl and in case we ever
> want to support read fences in the future.
>
> There is one downside here that's worth documenting:  If two clients
> writing to the same dma-buf using this API race with each other, their
> actions on the dma-buf may happen in parallel or in an undefined order.
> Both with and without this API, the pattern is the same:  Collect all
> the fences on dma-buf, submit work which depends on said fences, and
> then set a new exclusive (write) fence on the dma-buf which depends on
> said work.  The difference is that, when it's all handled by the GPU
> driver's submit ioctl, the three operations happen atomically under the
> dma_resv lock.  If two userspace submits race, one will happen before
> the other.  You aren't guaranteed which but you are guaranteed that
> they're strictly ordered.  If userspace manages the fences itself, then
> these three operations happen separately and the two render operations
> may happen genuinely in parallel or get interleaved.  However, this is a
> case of userspace racing with itself.  As long as we ensure userspace
> can't back the kernel into a corner, it should be fine.
>
> v2 (Jason Ekstrand):
>  - Use a wrapper dma_fence_array of all fences including the new one
>    when importing an exclusive fence.
>
> v3 (Jason Ekstrand):
>  - Lock around setting shared fences as well as exclusive
>  - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
>  - Initialize ret to 0 in dma_buf_wait_sync_file
>
> v4 (Jason Ekstrand):
>  - Use the new dma_resv_get_singleton helper
>
> v5 (Jason Ekstrand):
>  - Rename the IOCTLs to import/export rather than wait/signal
>  - Drop the WRITE flag and always get/set the exclusive fence
>
> v5 (Jason Ekstrand):
>  - Split import and export into separate patches
>  - New commit message
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/dma-buf/dma-buf.c    | 32 ++++++++++++++++++++++++++++++++
>  include/uapi/linux/dma-buf.h |  1 +
>  2 files changed, 33 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 7679562b57bfc..c9d6b9195c00c 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -417,6 +417,36 @@ static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
>         put_unused_fd(fd);
>         return ret;
>  }
> +
> +static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
> +                                    const void __user *user_data)
> +{
> +       struct dma_buf_sync_file arg;
> +       struct dma_fence *fence, *singleton = NULL;
> +       int ret = 0;
> +
> +       if (copy_from_user(&arg, user_data, sizeof(arg)))
> +               return -EFAULT;
> +
> +       if (arg.flags != DMA_BUF_SYNC_RW)
> +               return -EINVAL;
> +
> +       fence = sync_file_get_fence(arg.fd);
> +       if (!fence)
> +               return -EINVAL;
> +
> +       dma_resv_lock(dmabuf->resv, NULL);
> +
> +       ret = dma_resv_get_singleton_rcu(dmabuf->resv, fence, &singleton);
> +       if (!ret && singleton)
> +               dma_resv_add_excl_fence(dmabuf->resv, singleton);
> +
> +       dma_resv_unlock(dmabuf->resv);
> +
> +       dma_fence_put(fence);
> +
> +       return ret;
> +}
>  #endif
>
>  static long dma_buf_ioctl(struct file *file,
> @@ -465,6 +495,8 @@ static long dma_buf_ioctl(struct file *file,
>  #if IS_ENABLED(CONFIG_SYNC_FILE)
>         case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
>                 return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
> +       case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
> +               return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
>  #endif
>
>         default:
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index f902cadcbdb56..75fdde4800267 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -70,5 +70,6 @@ struct dma_buf_sync_file {
>  #define DMA_BUF_SET_NAME_A     _IOW(DMA_BUF_BASE, 1, u32)
>  #define DMA_BUF_SET_NAME_B     _IOW(DMA_BUF_BASE, 1, u64)
>  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE _IOWR(DMA_BUF_BASE, 2, struct dma_buf_sync_file)
> +#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE _IOW(DMA_BUF_BASE, 3, struct dma_buf_sync)
>
>  #endif
> --
> 2.31.1
>
