Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA63150672
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 13:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313896E332;
	Mon,  3 Feb 2020 12:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAD46E328
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 12:56:28 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w12so7050222wrt.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 04:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=E2yBqJw6aIeQHsEzrZrpaz3/gGhQvzW7o1+h1qCN7g0=;
 b=W1KdfvddRzMSN00ZvGyLtTcjnr+I+mgR468Or2lrLTzINh8nPNtcQP9pFUzkE9em2C
 Bu4o9+fc0LnkkuOLqf13pviuc1tzVQ+Vc2A0q6gQ7kjSTZEbb+BLCNvSyVayfX2ZhAkA
 RzZsll5Pwo/K6wJ6zxvT2nEANBRpG0DMMCdPP7Sc+KqnfIk53Tt70Lq/4830Z7wTguZt
 Aq4b6TpCiFJqjnmR5JkNUvyPpdc7olcvbaTCjrPwDvhvpKDlREjVKMc+LvbIlg0/vpzw
 6zLC8XQsTjn1/8FtaCYLag9kQ4KgJugqWDOv7GX6Vio61Hh3aZnctjjvgAU22p93C/Co
 E2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E2yBqJw6aIeQHsEzrZrpaz3/gGhQvzW7o1+h1qCN7g0=;
 b=ipGlQ9gGokM8KTkm0NfD8wYR3zlTh27tomPmwdKzR4zSzbIyBk1NAxcbhHPija16oI
 3IISf0gq7umbGPD7LloGXczJ5svtU1I3VGedkElgpxOkVGt7LsMdSJQKVK5ExjJPbqJv
 Cd8MSAr70234AACxFnPex01P+yuXqqegJi20qcH44ZM4ySLBbA36vqz8oKVf+wxuELgU
 LjlQpFab3X6boL5KkknKzJD0YDJWmejFD8l2ArSk6YT/9kkWUHCNzSzQAtdMNiVJWKbb
 jPeiZEI//uo9WEqM6vCGxcVrWbQ4zKLmGh+IImB+R4NC7N0PDi6RguCcNQENHkBuggNm
 OvzQ==
X-Gm-Message-State: APjAAAW2S/lwaD/5ogruVNpFEBS5An77XLEvChxIHjMg8d8fw3IQgCKR
 izM2Xx26urId9zl+CWF7Y8M=
X-Google-Smtp-Source: APXvYqxghCrgD4P7NNLWyc96KUlvZkdYlkMkW5lri2cdr7VYb3/RUosRlVwKD5ngfDcqlOOGUw4zNg==
X-Received: by 2002:adf:f802:: with SMTP id s2mr16506092wrp.201.1580734586845; 
 Mon, 03 Feb 2020 04:56:26 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
 by smtp.gmail.com with ESMTPSA id n13sm23328786wmd.21.2020.02.03.04.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 04:56:25 -0800 (PST)
Date: Mon, 3 Feb 2020 13:56:23 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [Regression 5.5-rc1] Extremely low GPU performance on NVIDIA
 Tegra20/30
Message-ID: <20200203125623.GB3506060@ulmo>
References: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
 <20191213151045.GB222809@ulmo>
 <d03876b8-b0d1-850b-7ae8-a61302e23843@gmail.com>
 <2f5c6fda-adf9-c6c3-7601-fa912813ce1f@gmail.com>
 <20200129123935.GG2479935@ulmo>
 <d69df90f-37c9-0242-708a-689a8789a30b@gmail.com>
 <20200130120806.GA2582317@ulmo>
 <7b710148-15db-f2d8-4221-62b032542426@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7b710148-15db-f2d8-4221-62b032542426@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0871948637=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0871948637==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Content-Disposition: inline


--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 12:00:49AM +0300, Dmitry Osipenko wrote:
> 30.01.2020 15:08, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> Why not to set the DMA mask to 32bits if IOMMU is unavailable?
> >=20
> > We already do that. If you look at host1x_iommu_init() in
> > drivers/gpu/host1x/dev.c, you'll see that when no IOMMU support is
> > available and the host1x doesn't support wide GATHER opcodes, then
> > we limit the DMA Mask to 32 bits.
> >=20
> > But that's not enough, see below.
> >=20
> >> I'm a bit puzzled by the actual need to support the case where Host1x =
is
> >> backed by IOMMU and clients not.. How we could ever end up with this
> >> scenario in the upstream kernel?
> >=20
> > That's not what we're doing here. The fundamental problem is that we
> > have a couple of generations where the hardware is mismatched in that
> > clients support 34-bit addresses while host1x can only use 32-bit
> > addresses in the GATHER opcode. The only way to get around this mismatch
> > is by using an IOMMU.
>=20
> Isn't it possible to limit DMA mask to 32-bit for both clients and Host1x?

Many things are possible, but I'm trying to find the best and most
intuitive way of encoding these restrictions in the driver. The problem
isn't so much that the hardware can only access 32-bits because the
memory interface is larger. It's more that the platform requires 32-bit
addresses because of integration mismatches like the above.

> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> index 6a995db51d6d..4253dd53ea2e 100644
> --- a/drivers/gpu/host1x/bus.c
> +++ b/drivers/gpu/host1x/bus.c
> @@ -190,12 +190,28 @@ static void host1x_subdev_unregister(struct
> host1x_device *device,
>   */
>  int host1x_device_init(struct host1x_device *device)
>  {
> +	struct host1x *host =3D dev_get_drvdata(device->dev.parent);
> +	struct iommu_domain *domain =3D iommu_get_domain_for_dev(host->dev);
>  	struct host1x_client *client;
> +	u64 mask;
>  	int err;
>=20
>  	mutex_lock(&device->clients_lock);
>=20
>  	list_for_each_entry(client, &device->clients, list) {
> +		mask =3D dma_get_mask(client->dev);
> +
> +		if (!domain && !host->info->has_wide_gather &&
> +		    mask > DMA_BIT_MASK(32)) {
> +			err =3D dma_coerce_mask_and_coherent(client->dev,
> +							   DMA_BIT_MASK(32));
> +			if (err < 0) {
> +				dev_err(&device->dev,
> +					"failed to set DMA mask: %d\n", err);
> +				goto teardown;
> +			}
> +		}
> +
>  		if (client->ops && client->ops->init) {
>  			err =3D client->ops->init(client);
>  			if (err < 0) {

So yes, something like this would probably work as well, but it's not an
accurate description of what's going on, in my opinion.

> > However, with an IOMMU enabled for clients, we can run into the case
> > where sparse pages would be allocated via shmem and end up beyond the
> > 32-bit boundary. If the host1x is not attached to an IOMMU, there's no
> > way for it to access these pages with standard GATHER opcodes.
> >=20
> > This is what used to happen prior to this change when the host1x
> > firewall was enabled.
>=20
> I assume you're meaning the *disabled* firewall because gathers are
> copied into the Host1x's DMA buffer if firewall is enabled.
>=20
> > Since we were not attaching it to an IOMMU in that
> > case, we would end up with sparse buffers allocated from pages that the
> > host1x couldn't address.
>=20
> Could you please clarify what do you mean by the shmem? If you mean the
> get_pages(), then one option will be to simply enforce Host1x firewall
> in order to get gathers always copied, and thus, we can remove the
> TEGRA_HOST1X_FIREWALL Kconfig option.

The firewall is useful for other things that just copying the memory.
That said, I agree that always copying gathers doesn't sound like a bad
idea.

> The other option could be *not* to use get_pages() whenever it can't work.

That's basically what we're doing. drm_gem_get_pages() is only used when
IOMMU support is enabled. Otherwise the DMA API will be used and that
will respect the DMA mask that was previously configured.

So another way you could think of this is that we set the logical host1x
device's DMA mask to the intersection of the DMA masks for all the sub-
devices. That ensures that all devices can access the memory allocated
by the DMA API.

> It also should be worthwhile to simply restrict kernel's configuration
> by disabling all functionality which requires IOMMU if IOMMU is not
> available. Just error out with informative message in that case, telling
> that kernel/device-tree configuration is wrong.

What we currently do is to gracefully fall back to CMA allocations if
the IOMMU functionality isn't there. That sounds like a better option
to me than to fail and request people to rebuild the kernel.

Also note that we don't usually know at compile-time whether or not an
IOMMU is enabled.

> Please notice that grate-drivers do not work with the disabled firewall
> anyways, because it's simply impractical/unusable from a userspace
> perspective to track liveness of the gather BO.

Um... that's certainly a little strange. There's never going to be a
reliable way for userspace to detect whether or not the firewall is
enabled or not. Userspace also shouldn't care because nothing in the
UABI should in anyway indicate the presence of the firewall.

What exactly makes it impractical/unusable to track liveness of a gather
BO? The buffer can't go away until you destroy the GEM object, so it
sounds rather simple to me. As for ownership, userspace needs to
consider the gather buffer as owned by the kernel/hardware until the job
to which it was submitted has finished running.

> Also, take a look at the grate-kernel's WIP patch where Host1x is
> separated from Tegra DRM and Host1x maintains gather buffer allocations
> by itself. In the case of legacy UAPI, the gather commands are copied
> from DRM GEM to the Host1x's BO, similarly to what we have now in
> upstream for the case of the enabled firewall, but in a more optimized
> manner (using pre-allocated pool and etc). I'd like to see the upstream
> driver doing the same if we won't end up dropping the legacy staging
> UAPI entirely.

Do you have any pointers?

> >> What about the reverse scenario? You won't be able to patch cmdstream
> >> properly for >32bit addresses.
> >=20
> > I don't think that scenario exists. I'm not aware of a Tegra device that
> > has system memory outside of the CPU-addressable region.
> >=20
> >> The root of the problem is that Tegra DRM UAPI doesn't support 64bit
> >> addresses, so you can't use "wide" opcodes and can't patch cmdstream.
> >=20
> > There's nothing in the UAPI that deals with addresses directly. We only
> > pass around handles and these are resolved to buffer objects in the
> > kernel where the address of the buffers can be 32-bit or 64-bit.
>=20
> If buffer is 64-bit, then client's address-registers take two 32-bit
> hardware registers, and thus, cmdstream should reserve two words for the
> patched handles.
>=20
> Host1x driver doesn't support patching of 64-bit addresses and there is
> no way to tell userspace to reserve two words per-address using the
> current UAPI.

That's only partially true. Yes, we don't support patching of 64-bit
addresses, but the reason is because we don't have to. On SoC
generations where the memory interface is wider than 32 bits, the host1x
clients use a relocation shift (typically of 8 bits) to accomodate for
the 32-bit width restriction of the registers.

We currently deal with that in the ABI and I'm honestly not sure that's
a good solution. But it works perfectly fine with 64-bit BO addresses.

> > And we do in fact support wide opcodes and patch command streams just
> > fine on 64-bit systems.
> >=20
> > I mean, it's not like I've been doing this just for the fun of it. There
> > are actual configurations where this is needed in order for it to work.
> >=20
> >> Perhaps it is better not to add any new things or quirks to the Host1x=
 /
> >> Tegra DRM for now. The drivers need a serious clean up, otherwise mess
> >> only continues to grow up. Don't you think so?
> >=20
> > This isn't anything new or a quirk. This is bug fixes to ensure that the
> > driver works in (now hopefully) all configurations. Previously it was a
> > matter of getting the configuration just right in order for it to work.
> > All the work I did here (starting with the wide opcode support and then
> > the DMA API and IOMMU work) was to make sure it would safely work in any
> > setup.
> >=20
> > And I do consider these changes to also be cleanups and incremental
> > improvements of what the state was before. Again, I don't consider a
> > rewrite a serious cleanup.
> >=20
> > I'm fully aware that the driver has been collecting dust for a while and
> > it isn't perfect. But it's also not overly messy. It's perhaps a bit
> > more complex than your average driver, but it's also some pretty complex
> > hardware.
> ...
> >> Doesn't sound good to me.. this is not going to be good for GPU driver=
s.
> >> All cache maintenance should be in control of userspace, the userspace
> >> should be telling kernel driver when it needs to get CPU access and wh=
en
> >> to finish the access. DMABUF has generic UAPI for the synchronizations,
> >> although a mature GPU driver may need more than that.
> >=20
> > I agree. But that's not something that we can do at this point. We don't
> > have a way of passing information such as this to the driver, so the
> > driver has to assume that caches are dirty for all buffers, otherwise it
> > will not be able to guarantee that random cache flushes won't corrupt
> > the data that it's passing to the hardware.
> >=20
> > So yes, when we do have a way of explicitly flushing the caches for
> > buffers, then we can add a mechanism to pass that information to the
> > kernel so that it can optimize. But until then we just can't be sure.
>=20
> It worked fine for the last 7 years on T20/30 and continues to work if
> the offending patches are reverted, no problems here.

I do recall problems with cache maintenance during early development.
Note that I've never seen these issues when using only the DMA API. But
with explicit IOMMU usage there would typically be short horizontal
lines that were the wrong color because CPU caches hadn't been properly
flushed. We used to work around that by using dma_sync_sg_for_device(),
but that causes the DMA API to report abuses in debug mode.

Again, back at the time I was working on Tegra20 and Tegra30, and I was
definitely seeing those cache-related issues there as well.

> > And I prefer a kernel driver that gives me slow and reliable, rather
> > than fast but unpredictable results.
>=20
> Your changes introduced regression on Tegra20/30 without solving any
> problem. This is unacceptable, it's not an improvement, please don't do
> it :)

It's perhaps a performance regression, but functionally it should still
be working fine. And see above for the issues that this solves.

Now, it may be that there are some cases where cache maintenance at this
level is not necessary, but keep in mind that we have a generic driver
that needs to work properly on many different setups at the same time. A
mechanism like the DMA API debug facilities is there for a reason. It
points out when you take shortcuts that may only work under some
circumstances but break terribly under others.

So I consider this an improvement in that it ensures that things always
work correctly, regardless of any assumptions.

> Apparently some problem exists only for later Tegra generations, but I
> still can't recognize what it's is from your words.
>=20
> Please give a concrete real-world example of the trouble you're trying
> to solve.

See above. And, again, this is a problem that also exists on earlier
generations. I /think/ I've never seen cache-related issues when the
IOMMU is disabled, and that's probably because we have write-combine
mappings in that case. What you're saying seems to confirm that.

> >> Today Tegra DRM driver supports only write-combined BO allocations, and
> >> thus, we don't need to do more than to flush CPU buffers before
> >> executing HW job.
> >=20
> > That's only true when you allocate with the DMA API. When you allocate
> > from a shmem mapping you don't get write-combined memory, so we do have
> > to perform cache maintenance on the pages.
>=20
> In all cases GEM's memory mappings are write-combined, including the
> case of get_pages(). Host1x driver performs the maintenance by doing
> wmb() before executing job.

No, that's just not true. You don't get write-combined mappings for
drm_gem_get_pages(). The wmb() doesn't help in that case.

> If you're meaning that imported buffers could be backed by cacheable
> pages, then userspace must use DMABUF syncing UAPI or any other means to
> sync CPU cache, there is no way around it. You should assume that yours
> userpspace is broken if it doesn't do it.

I don't think it's supposed to work that way. Again, in practice this
may work fine most of the time. However, in the more general case it may
not.

The DMA-BUF sync UABI is really all about userspace synchronizing CPU
accesses with the exporter of the DMA-BUF. So, yes, if userspace makes
modifications to the buffer, it needs to tell the exporter about it with
the sync IOCTL.

But importers of the DMA-BUF aren't automatically on the safe side. So
there could be cases where an importer needs to do additional cache
maintenance in order to properly use a given buffer.

I'm not aware of any cases like that on Tegra, but that shouldn't be an
excuse for taking shortcuts. We should still be using the APIs in the
way they were intended. If they end up doing too much or even the wrong
thing, then I think we need to address that in their implementation and
not by abusing the API.

> >>>> Please let me know if you're going to fix the problems or if you'd
> >>>> prefer me to create the patches.
> >>>>
> >>>> Here is a draft of the fix for #2, it doesn't cover case of imported
> >>>> buffers (which should be statically mapped, IIUC):
> >>>>
> >>>> @@ -38,7 +38,7 @@ static struct sg_table *tegra_bo_pin(struct device
> >>>> *dev, struct host1x_bo *bo,
> >>>>          * If we've manually mapped the buffer object through the IO=
MMU,
> >>>> make
> >>>>          * sure to return the IOVA address of our mapping.
> >>>>          */
> >>>> -       if (phys && obj->mm) {
> >>>> +       if (phys && (obj->mm || obj->vaddr)) {
> >>>>                 *phys =3D obj->iova;
> >>>
> >>> This doesn't work for the case where we use the DMA API for mapping. =
Or
> >>> at least it isn't going to work in the general case.
> >>
> >> Right, looks like I'll need to update my memory about the DMA API usag=
e.
> >>
> >>> The reason is because obj->iova is only valid for whatever the device=
 was that mapped
> >>> or allocated the buffer, which in this case is the host1x device, whi=
ch
> >>> isn't even a real device, so it won't work. The only case where it do=
es
> >>> work is if we're not behind an IOMMU, so obj->iova will actually be t=
he
> >>> physical address.
> >>
> >> But why do you need to dynamically map/unmap the statically-allocated
> >> buffers on each job submission, could you please explain what is the
> >> point? Perhaps it's a temporary workaround just to get a minimum of
> >> things working for the case of implicit IOMMU?
> >=20
> > It's primarily because we don't really know if a buffer has been mapped
> > for a specific device. We always map at allocation time for the Tegra
> > DRM parent device (which isn't a real device) but before it's used by
> > any other host1x client, it has to be mapped for that device as well.
>=20
> > That's important in case any of these devices have different IOMMU
> > domains.
>=20
> This case should be covered by the solution I'm proposing below.
>=20
> Today's mainline kernel has all clients in the same shared IOMMU domain.
> Please note that I'm focused on solving the primary regression problem,
> the potential future problems are secondary.

Again, that's only true up to and including Tegra210. For Tegra186 and
Tegra194 that's no longer possible.

> > Actually, given that the device isn't a real device, the DMA handle
> > returned from dma_alloc_wc() is actually a physical address and not
> > valid for any device behind an IOMMU. So even in the case where we
> > share an IOMMU domain among multiple device, the mapping created by
> > dma_alloc_wc() is useless for them.
>=20
> What about to pick any DRM sub-device and then statically map DMA buffer
> for this picked device during of BO allocation / import? All other DRM
> sub-devices can access that mapping because of the shared domain.

Again, this only works if all devices share a common IOMMU domain. Since
that's not the case we can't do it.

> > Because of the above and probably a bunch of other reasons, it's also a
> > requirement of the DMA API. If you enable CONFIG_DMA_API_DEBUG, the DMA
> > API will start printing a bunch of errors if you violate those and they
> > typically indicate that what you're doing may not work. That doesn't
> > mean it can't work, but it usually only does so accidentally.
> >=20
> >> All buffers should be statically allocated and statically mapped, and
> >> when there is a need to sync an already mapped buffer, the dma_sync_*
> >> API should be used.
> >=20
> > That's my understanding as well. However, it's slightly more complicated
> > than that. Once you move away from the assumption that a mapping for a
> > buffer the same for all devices, you can no longer do that. For example,
> > while the statically allocated buffer may be mapped for the Tegra DRM
> > device (again, it's not a real device), it's not mapped for any of the
> > clients yet.
>=20
> The same what I wrote above. Just pick any DRM sub-device and map buffer
> for that device during allocation / import.

That won't work in the general case where we have separate IOMMU
domains, because you need to map the buffer once for each domain.

> > So before a client can use it, its driver has to go and map
> > the buffer for the device. The logical point to do that is during
> > host1x_job_pin(). Once the client no longer has a use for the buffer it
> > should also unmap the buffer again because it will otherwise occupy the
> > IOVA space unnecessarily. The logical point to do that is during
> > host1x_job_unpin().
>=20
> The IOVA space problem really exists only for Tegra20.
>=20
> I suppose that page table size is ~10-20MB per 1GB of allocations, this
> is not something to worry about.

The IOVA space problem is going to be real for other devices once we
start leaking IOVA memory addresses.

> > host1x_job_unpin() is also the point at which the job releases its
> > reference to the buffer, so the backing memory could go away at any
> > point after that, which means that the IOVA mapping could point at
> > invalid memory if we didn't unmap the buffer.
>=20
> Backing memory can't go away before buffer is unmapped, it is a refcount
> bug otherwise.

Right. However, my point was that if you don't unmap the buffer at
host1x_job_unpin() time, when would you unmap it? It's really at unpin
time that you know the buffer won't be used anymore. It might be used
again in the future, but the driver doesn't know that. Similarily, the
driver only knows at host1x_job_pin() time that a buffer will be used,
and by what device. It's not possible to predict ahead of time when a
buffer will be used, by which device and for how long.

> > I'm not aware of an easy way to optimize this while at the same time
> > making sure that everything is still consistent. I suppose one way to do
> > this would be to keep a cache of buffer objects and their mappings for
> > each device and avoid mapping/unmapping them for every job. The problem
> > with that is that we also don't want to hold on to buffer objects
> > indefinitely because that will potentially cause a lot of memory and
> > IOVA space to be used.
>=20
> The case of explicit IOMMU is nicer because we can use DRM's MM scanner
> to maintain a limited window of IOMMU mappings. Take a look at
> https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/u=
api/gart.c
> for example.
>=20
> The LRU cache should be easy to implement, it also should be useful if
> we'll get around to supporting memory shrinker (BO swap-out).
>=20
> >> Like I said above, the syncing should be done by userspace for the
> >> buffers that are in control of userspace.
> >=20
> > Yes, I agree. We already have an implementation of the .begin_cpu_access
> > and .end_cpu_access callbacks for DMA-BUF, so it should be easy to add
> > something like that for native buffers. Alternatively, I suppose user-
> > space could be required to flush/invalidate using the DMA-BUF, but that
> > potentially has the drawback of having to export a DMA-BUF for every
> > single buffer.> A better option may be to add a driver-specific IOCTL t=
o do cache
> > maintenance. I think other drivers already do that.
> Perhaps.. but it needs a real-world use-case first.
>=20
> >>> So what this basically ends up doing is avoid dma_map_*() all the tim=
e,
> >>> which I guess is what you're trying to achieve. But it also gives you
> >>> the wrong I/O virtual address in any case where an IOMMU is involved.
> >>> Also, as discussed above, avoiding cache maintenance isn't correct.
> >>
> >> Alright, then right now we need to bypass the dma_map_*() in a case of=
 a
> >> non-implicit IOMMU, in order to bring back the good old behavior (at
> >> least temporary, until there will be a more comprehensive solution).
> >=20
> > But it's not good old behaviour. You're still going to side-step the
> > cache maintenance and violate the DMA API semantics.
>=20
> The DMA API usage that you introduced in the v5.5 is wrong too because
> it makes driver unusable :)

No, it's not wrong. It does the right thing from an API point of view.
If it causes a performance regression that's because previously we did
too little and just got lucky that it still worked. So I think we need
to find out why exactly we could get away with how things worked before
and find a way to replicate that behaviour while still allowing the API
to be correctly used.

So if for whatever reason cache maintenance isn't necessary in this
case, can we make the DMA API not perform the cache maintenance. At this
point, I'm not even sure that cache maintenance is the issue. We'll need
to run some more tests to find out.

> From a user's perspective it is exactly the good old behaviour. I tried
> to load KDE Plasma 5 using Xorg Opentegra driver, which worked perfectly
> fine before, and now it is absolutely unusable.
>=20
> There are couple things we could do in order to prevent this situation
> in the future:
>=20
>   1. Better automated testing. The grate-tests could be useful for this
> particular case, once it will get support for the offscreen testing.

Definitely. Right now we don't really have a good way of testing at all.
We also don't have a good way for benchmarking tests. All of that would
be a massive improvement.

FWIW, I've been holding back on the VIC test cases for libdrm because I
didn't want to port them to the old ABI, assuming we could fairly
quickly settle on a new ABI and get that merged. However, looking at the
current state of affairs, it may be worth porting them over to using the
old ABI so that we can also run tests on Tegra124 and later where grate
can't be supported anymore.

>   2. Better review and real-world testing of the patches. Don't you mind
> if I'll propose myself as a reviewer for the Tegra DRM / Host1x drivers?

You already review most of the patches anyway. And it would've been
pretty hard to find out during review that these patches would cause a
performance regression like this. To be honest, I'm still surprised that
the impact is this big, since I'm not seeing any impact at all doing
things like modeset -v on something like Tegra210, Tegra186 or Tegra194.

Granted, that's probably not the best test case since we're not really
doing any cache maintenance (hopefully) after the first two page-flips.
However, it does entail mapping/unmapping a 32 MiB framebuffer to/from
the IOMMU per frame, which should account for quite a bit of work as
well.

I guess that if you do a lot of updates from userspace and have to flush
the cache a lot for every frame that could have some impact. But you
were saying the difference was going from 100+ to 10- frames per second,
which seems a bit much for *only* cache maintenance. Sounds to me like
something else is going on here.

> I'm suggesting to take a step back and revert to the old behaviour for
> now, at least on T20/30. I don't know about ARM64, but ARM32 permits to
> violate the DMA API semantics for the case of unavailable IOMMU, of
> course that may change in the future and by that time I hope we'll
> manage to get the DMA API usage done right.

Okay, let's see if we can temporarily restore the performance on older
devices. But I'd also like to eventually figure out why it's even
regressing on performance that badly.

Thierry

> The solution below restores old behavior for the case of unavailable
> IOMMU and for the case of explicit IOMMU domain, it should work in the
> case of implicit IOMMU as well.
>=20
> >> What do you think about this variant:
> >>
> >> --- >8 ---
> >> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> >> index 1237df157e05..555a6424e9fa 100644
> >> --- a/drivers/gpu/drm/tegra/gem.c
> >> +++ b/drivers/gpu/drm/tegra/gem.c
> >> @@ -54,16 +54,25 @@ static struct sg_table *tegra_bo_pin(struct device
> >> *dev, struct host1x_bo *bo,
> >>  				     dma_addr_t *phys)
> >>  {
> >>  	struct tegra_bo *obj =3D host1x_to_tegra_bo(bo);
> >> +	struct tegra_drm *tegra =3D obj->gem.dev->dev_private;
> >>  	struct sg_table *sgt;
> >>  	int err;
> >>
> >> -	/*
> >> -	 * If we've manually mapped the buffer object through the IOMMU, make
> >> -	 * sure to return the IOVA address of our mapping.
> >> -	 */
> >> -	if (phys && obj->mm) {
> >> -		*phys =3D obj->iova;
> >> -		return NULL;
> >> +	if (phys && iommu_get_domain_for_dev(dev) =3D=3D tegra->domain) {
> >> +		/* if IOMMU isn't available, return IOVA=3DPHYS of the mapping */
>=20
> >> +		if (obj->vaddr) {
>=20
> If this is unacceptable on ARM64 (dma_handle !=3D phys_addr), then it
> could be:
>=20
> 		if (obj->vaddr && IS_ENABLED(CONFIG_ARM)) {
>=20
> >> +			*phys =3D obj->iova;
> >> +			return NULL;
> >> +		}
> >> +
> >> +		/*
> >> +		 * If we've manually mapped the buffer object through the
> >> +		 * IOMMU, make sure to return the IOVA address of our mapping.
> >> +		 */
> >> +		if (obj->mm) {
> >> +			*phys =3D obj->iova;
> >> +			return NULL;
> >> +		}
> >>  	}
> >>
> >>  	/*
> >> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/pla=
ne.c
> >> index 6d1872ddef17..91304b9034fa 100644
> >> --- a/drivers/gpu/drm/tegra/plane.c
> >> +++ b/drivers/gpu/drm/tegra/plane.c
> >> @@ -97,16 +97,15 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct
> >> tegra_plane_state *state)
> >>
> >>  	for (i =3D 0; i < state->base.fb->format->num_planes; i++) {
> >>  		struct tegra_bo *bo =3D tegra_fb_get_plane(state->base.fb, i);
> >> +		struct sg_table *sgt;
> >>
> >> -		if (!dc->client.group) {
> >> -			struct sg_table *sgt;
> >> -
> >> -			sgt =3D host1x_bo_pin(dc->dev, &bo->base, NULL);
> >> -			if (IS_ERR(sgt)) {
> >> -				err =3D PTR_ERR(sgt);
> >> -				goto unpin;
> >> -			}
> >> +		sgt =3D host1x_bo_pin(dc->dev, &bo->base, &state->iova[i]);
> >> +		if (IS_ERR(sgt)) {
> >> +			err =3D PTR_ERR(sgt);
> >> +			goto unpin;
> >> +		}
> >>
> >> +		if (sgt) {
> >>  			err =3D dma_map_sg(dc->dev, sgt->sgl, sgt->nents,
> >>  					 DMA_TO_DEVICE);
> >>  			if (err =3D=3D 0) {
> >> @@ -127,8 +126,6 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct
> >> tegra_plane_state *state)
> >>
> >>  			state->iova[i] =3D sg_dma_address(sgt->sgl);
> >>  			state->sgt[i] =3D sgt;
> >> -		} else {
> >> -			state->iova[i] =3D bo->iova;
> >>  		}
> >>  	}
> >>
> >> @@ -141,8 +138,11 @@ static int tegra_dc_pin(struct tegra_dc *dc, stru=
ct
> >> tegra_plane_state *state)
> >>  		struct tegra_bo *bo =3D tegra_fb_get_plane(state->base.fb, i);
> >>  		struct sg_table *sgt =3D state->sgt[i];
> >>
> >> -		dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents, DMA_TO_DEVICE);
> >> -		host1x_bo_unpin(dc->dev, &bo->base, sgt);
> >> +		if (sgt) {
> >> +			dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents,
> >> +				     DMA_TO_DEVICE);
> >> +			host1x_bo_unpin(dc->dev, &bo->base, sgt);
> >> +		}
> >>
> >>  		state->iova[i] =3D DMA_MAPPING_ERROR;
> >>  		state->sgt[i] =3D NULL;
> >> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> >> index 60b2fedd0061..538c0f0b40a4 100644
> >> --- a/drivers/gpu/host1x/job.c
> >> +++ b/drivers/gpu/host1x/job.c
> >> @@ -108,7 +108,7 @@ static unsigned int pin_job(struct host1x *host,
> >> struct host1x_job *job)
> >>
> >>  	for (i =3D 0; i < job->num_relocs; i++) {
> >>  		struct host1x_reloc *reloc =3D &job->relocs[i];
> >> -		dma_addr_t phys_addr, *phys;
> >> +		dma_addr_t phys_addr;
> >>  		struct sg_table *sgt;
> >>
> >>  		reloc->target.bo =3D host1x_bo_get(reloc->target.bo);
> >> @@ -117,12 +117,7 @@ static unsigned int pin_job(struct host1x *host,
> >> struct host1x_job *job)
> >>  			goto unpin;
> >>  		}
> >>
> >> -		if (client->group)
> >> -			phys =3D &phys_addr;
> >> -		else
> >> -			phys =3D NULL;
> >> -
> >> -		sgt =3D host1x_bo_pin(dev, reloc->target.bo, phys);
> >> +		sgt =3D host1x_bo_pin(dev, reloc->target.bo, &phys_addr);
> >>  		if (IS_ERR(sgt)) {
> >>  			err =3D PTR_ERR(sgt);
> >>  			goto unpin;
> >> @@ -168,6 +163,13 @@ static unsigned int pin_job(struct host1x *host,
> >> struct host1x_job *job)
> >>  		job->num_unpins++;
> >>  	}
> >>
> >> +	/*
> >> +	 * In a case of enabled firewall, all user gathers are copied into
> >> +	 * the secured job->gather_copy_mapped.
> >> +	 */
> >> +	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
> >> +		return 0;
> >> +
> >>  	for (i =3D 0; i < job->num_gathers; i++) {
> >>  		struct host1x_job_gather *g =3D &job->gathers[i];
> >>  		size_t gather_size =3D 0;
> >> @@ -184,13 +186,13 @@ static unsigned int pin_job(struct host1x *host,
> >> struct host1x_job *job)
> >>  			goto unpin;
> >>  		}
> >>
> >> -		sgt =3D host1x_bo_pin(host->dev, g->bo, NULL);
> >> +		sgt =3D host1x_bo_pin(host->dev, g->bo, &phys_addr);
> >>  		if (IS_ERR(sgt)) {
> >>  			err =3D PTR_ERR(sgt);
> >>  			goto unpin;
> >>  		}
> >>
> >> -		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
> >> +		if (host->domain) {
> >>  			for_each_sg(sgt->sgl, sg, sgt->nents, j)
> >>  				gather_size +=3D sg->length;
> >>  			gather_size =3D iova_align(&host->iova, gather_size);
> >> @@ -214,7 +216,7 @@ static unsigned int pin_job(struct host1x *host,
> >> struct host1x_job *job)
> >>
> >>  			job->unpins[job->num_unpins].size =3D gather_size;
> >>  			phys_addr =3D iova_dma_addr(&host->iova, alloc);
> >> -		} else {
> >> +		} else if (sgt) {
> >>  			err =3D dma_map_sg(host->dev, sgt->sgl, sgt->nents,
> >>  					 DMA_TO_DEVICE);
> >>  			if (!err) {
> >>
> >> --- >8 ---
>=20

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl44GHQACgkQ3SOs138+
s6F9gg/8C4VRYRl34iPV9no/52uoXZIMdPjdbdIV+cBozmAe/2pUAjKV0yAh6rMt
hRWvPBozz15ShA0CHsqjk4iS4rnkNfFoeqgIJrhKzIIEjfB8Fi930SrvB9NZMQdM
sW0BDiNf7QF+Nfj5RAwmujvWAT7dj9tTtIHn83IfJ0uo4FCGflLFYqcY4laPzJzD
NHQwHcD2vFRt3Hqi1MahU4IfVctKSMSImVvbMQnslms2sZnwTUby3IrK9gf8QmDD
vKRvRVUBNOvcUaoaDRFDyo/C8m4ir9hL8ogJJcP+VzEcDrNu9cuwGX+oFwmAYdCm
6Owsmjqfc4XySUydE14x/9iFKQBJCBfco1FC49E7pnRaoY1bWB0sUUgZQNW2XKU6
ZgO6xszsHBTan6N0D0N49kzG5uh5wFHZzc6B91+DPX5incJI7T5HjP2ZH3aSkIm/
kC5lF8pwvSIgIOkuE1HRVDEBH08BTIaFo8j0VCRnVCw33R96qxPrJopVk0NRV2xK
8baK98DuKSy2ZNJX5OTYTcCZvRxwHrgCB60iFd8vc9uVixxvg5M0E7vcFNmrRFiK
+5lnMQn5qYXA6ecDzafzyJWVW/S16+uZCQl/ZyYQQJYMu3oCfJCniDHDRXd3w9VP
Z/bIDxXANGnDDdcL08BO63QIAT3AkmIP1DDKjq6ibvE9znZl7vY=
=bbwI
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--

--===============0871948637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0871948637==--
