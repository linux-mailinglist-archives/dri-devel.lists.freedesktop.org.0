Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCE6345C8D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 12:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F0E6E8AF;
	Tue, 23 Mar 2021 11:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBA66E8AF
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 11:15:20 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id bx7so22955120edb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 04:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NPevtMq3DHV/D2UgNLk5GneTnkOuOy7HBTWldd55wzQ=;
 b=eUv77P5hxEW9j41DDsWupyx+73x8mIJsh3Tk6tqvMHQuzjy2Lm1dt7kGsDdAB78y/+
 oUNPfa1lyESp4nfOJASf2rnKTcSNx6rjZ6vYV8YCAXoTInpVL2AqktiR1OqkU0IIekCR
 UGo9otiu0s+WhETLnP6F+9Lvza8wTFw1+JO73xb0xVBnmbgFpVQZYVTGwVTpr6BjLuxN
 QK79xTcs+XoaycdBYHMioklp3HXtgHCeTR4yDbD1tRhifCpnRrWG1cFAeNCsploasFik
 REEkzLWMLozcyiRYdr16s7v2rulvCzASo+RPHtWzmDYtdFr8D6DPBdEXhG4hF0kbpab3
 qo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NPevtMq3DHV/D2UgNLk5GneTnkOuOy7HBTWldd55wzQ=;
 b=fnvrqZ9l7O+jbvpL7Gw6rcPGb3zMlqLgevm7m1FyGd/ffVDF0mOcglZYz7NPY4AB+c
 yAuL8jx248qw764jBFfdxDpzOu3UgNrjlEWtUg92hkYwxnOpYQkVrQ//DtIC51DIZG5k
 3cSLV+mlcDPDsA2M8qB5fvb2GHRFibBssUCxLaxLKnwz9BkxsbDk3C4u9qealuogUnGw
 pDu0iKxi0LoyMBdJnqjGsVf0FITaqvR1o44hOds291QaQ4FHyOsugbWAByUy2fA40tl3
 impQBOIaNY5rnSAr4KQ3Yxe35Z7PaZGqqEGYX2wV7W/vsxu2cTEyecBlQnl7FcrtNjxH
 vpjA==
X-Gm-Message-State: AOAM532O5ta75A8CFE1extuz1lHsVt5AjRDrYhrkkKXGapyGV3JATKYk
 AhXAdNUFggPU2C0MMdW0b14/R2akJmw=
X-Google-Smtp-Source: ABdhPJzhRa7xuApXuKvMIGvAHlXnEQMLHICPitoiUg0fKix/8Vn6qmguDImNPQwitJ4um+LFz6JGog==
X-Received: by 2002:aa7:c450:: with SMTP id n16mr3985625edr.16.1616498119379; 
 Tue, 23 Mar 2021 04:15:19 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id gr16sm11187845ejb.44.2021.03.23.04.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 04:15:17 -0700 (PDT)
Date: Tue, 23 Mar 2021 12:15:37 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v5 09/21] gpu: host1x: DMA fences and userspace fence
 creation
Message-ID: <YFnN2eIEa59AegPo@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-10-mperttunen@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210111130019.3515669-10-mperttunen@nvidia.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com
Content-Type: multipart/mixed; boundary="===============1967380390=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1967380390==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UkHz975LzvF9XEUl"
Content-Disposition: inline


--UkHz975LzvF9XEUl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 03:00:07PM +0200, Mikko Perttunen wrote:
> Add an implementation of dma_fences based on syncpoints. Syncpoint
> interrupts are used to signal fences. Additionally, after
> software signaling has been enabled, a 30 second timeout is started.
> If the syncpoint threshold is not reached within this period,
> the fence is signalled with an -ETIMEDOUT error code. This is to
> allow fences that would never reach their syncpoint threshold to
> be cleaned up.
>=20
> Additionally, add a new /dev/host1x IOCTL for creating sync_file
> file descriptors backed by syncpoint fences.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v5:
> * Update for change in put_ref prototype.
> v4:
> * Fix _signal prototype and include it to avoid warning
> * Remove use of unused local in error path
> v3:
> * Move declaration of host1x_fence_extract to public header
> ---
>  drivers/gpu/host1x/Makefile |   1 +
>  drivers/gpu/host1x/fence.c  | 208 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/host1x/fence.h  |  13 +++
>  drivers/gpu/host1x/intr.c   |   9 ++
>  drivers/gpu/host1x/intr.h   |   2 +
>  drivers/gpu/host1x/uapi.c   | 103 ++++++++++++++++++
>  include/linux/host1x.h      |   4 +
>  7 files changed, 340 insertions(+)
>  create mode 100644 drivers/gpu/host1x/fence.c
>  create mode 100644 drivers/gpu/host1x/fence.h
>=20
> diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
> index 882f928d75e1..a48af2cefae1 100644
> --- a/drivers/gpu/host1x/Makefile
> +++ b/drivers/gpu/host1x/Makefile
> @@ -10,6 +10,7 @@ host1x-y =3D \
>  	debug.o \
>  	mipi.o \
>  	uapi.o \
> +	fence.o \
>  	hw/host1x01.o \
>  	hw/host1x02.o \
>  	hw/host1x04.o \
> diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
> new file mode 100644
> index 000000000000..e96ad93ff656
> --- /dev/null
> +++ b/drivers/gpu/host1x/fence.c
> @@ -0,0 +1,208 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Syncpoint dma_fence implementation
> + *
> + * Copyright (c) 2020, NVIDIA Corporation.
> + */
> +
> +#include <linux/dma-fence.h>
> +#include <linux/file.h>
> +#include <linux/fs.h>
> +#include <linux/slab.h>
> +#include <linux/sync_file.h>
> +
> +#include "fence.h"
> +#include "intr.h"
> +#include "syncpt.h"
> +
> +DEFINE_SPINLOCK(lock);
> +
> +struct host1x_syncpt_fence {
> +	struct dma_fence base;
> +
> +	atomic_t signaling;
> +
> +	struct host1x_syncpt *sp;
> +	u32 threshold;
> +
> +	struct host1x_waitlist *waiter;
> +	void *waiter_ref;
> +
> +	struct delayed_work timeout_work;
> +};
> +
> +static const char *syncpt_fence_get_driver_name(struct dma_fence *f)
> +{
> +	return "host1x";
> +}
> +
> +static const char *syncpt_fence_get_timeline_name(struct dma_fence *f)
> +{
> +	return "syncpoint";
> +}
> +
> +static bool syncpt_fence_enable_signaling(struct dma_fence *f)
> +{
> +	struct host1x_syncpt_fence *sf =3D
> +		container_of(f, struct host1x_syncpt_fence, base);

Maybe add a casting helper to make this less annoying.

> +const struct dma_fence_ops syncpt_fence_ops =3D {

I'd prefer this to use the host1x_syncpt_ prefix for better scoping.

> +	.get_driver_name =3D syncpt_fence_get_driver_name,
> +	.get_timeline_name =3D syncpt_fence_get_timeline_name,
> +	.enable_signaling =3D syncpt_fence_enable_signaling,
> +	.release =3D syncpt_fence_release,

Maybe also do that for these, while at it.

> +static int dev_file_ioctl_create_fence(struct host1x *host1x, void __use=
r *data)
> +{
> +	struct host1x_create_fence args;
> +	unsigned long copy_err;

Any reason why this needs to have that cumbersome copy_ prefix? There's
no other "err" variables, so why not just use the shorter "err" for
this?

> +	int fd;
> +
> +	copy_err =3D copy_from_user(&args, data, sizeof(args));
> +	if (copy_err)
> +		return -EFAULT;
> +
> +	if (args.reserved[0])
> +		return -EINVAL;
> +
> +	if (args.id >=3D host1x_syncpt_nb_pts(host1x))
> +		return -EINVAL;
> +
> +	args.id =3D array_index_nospec(args.id, host1x_syncpt_nb_pts(host1x));
> +
> +	fd =3D host1x_fence_create_fd(&host1x->syncpt[args.id], args.threshold);
> +	if (fd < 0)
> +		return fd;
> +
> +	args.fence_fd =3D fd;
> +
> +	copy_err =3D copy_to_user(data, &args, sizeof(args));
> +	if (copy_err)
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static int dev_file_ioctl_fence_extract(struct host1x *host1x, void __us=
er *data)
> +{
> +	struct host1x_fence_extract_fence __user *fences_user_ptr;
> +	struct dma_fence *fence, **fences;
> +	struct host1x_fence_extract args;
> +	struct dma_fence_array *array;
> +	unsigned int num_fences, i;
> +	unsigned long copy_err;

Can't do the same here, but perhaps just do what other copy_from_user()
callsites do and just use it directly in the conditional so you don't
even need to store the return value since you're not reusing it anyway.

In fact you could do the same thing above and just get rid of that
variable and render the code more idiomatic.

> +	int err;
> +
> +	copy_err =3D copy_from_user(&args, data, sizeof(args));
> +	if (copy_err)
> +		return -EFAULT;
> +
> +	fences_user_ptr =3D u64_to_user_ptr(args.fences_ptr);
> +
> +	if (args.reserved[0] || args.reserved[1])
> +		return -EINVAL;
> +
> +	fence =3D sync_file_get_fence(args.fence_fd);
> +	if (!fence)
> +		return -EINVAL;
> +
> +	array =3D to_dma_fence_array(fence);
> +	if (array) {
> +		fences =3D array->fences;
> +		num_fences =3D array->num_fences;
> +	} else {
> +		fences =3D &fence;
> +		num_fences =3D 1;
> +	}
> +
> +	for (i =3D 0; i < min(num_fences, args.num_fences); i++) {
> +		struct host1x_fence_extract_fence f;
> +
> +		err =3D host1x_fence_extract(fences[i], &f.id, &f.threshold);
> +		if (err)
> +			goto put_fence;
> +
> +		copy_err =3D copy_to_user(fences_user_ptr + i, &f, sizeof(f));
> +		if (copy_err) {
> +			err =3D -EFAULT;
> +			goto put_fence;
> +		}
> +	}
> +
> +	args.num_fences =3D i+1;

checkpatch will probably complain about this not having spaces around
that '+'.

> +
> +	copy_err =3D copy_to_user(data, &args, sizeof(args));
> +	if (copy_err) {
> +		err =3D -EFAULT;
> +		goto put_fence;
> +	}
> +
> +	return 0;
> +
> +put_fence:
> +	dma_fence_put(fence);
> +
> +	return err;
> +}
> +
>  static long dev_file_ioctl(struct file *file, unsigned int cmd,
>  			   unsigned long arg)
>  {
> @@ -210,6 +305,14 @@ static long dev_file_ioctl(struct file *file, unsign=
ed int cmd,
>  		err =3D dev_file_ioctl_alloc_syncpoint(file->private_data, data);
>  		break;
> =20
> +	case HOST1X_IOCTL_CREATE_FENCE:
> +		err =3D dev_file_ioctl_create_fence(file->private_data, data);
> +		break;
> +
> +	case HOST1X_IOCTL_FENCE_EXTRACT:
> +		err =3D dev_file_ioctl_fence_extract(file->private_data, data);
> +		break;
> +
>  	default:
>  		err =3D -ENOTTY;
>  	}
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index b3178ae51cae..080f9d3d29eb 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -165,6 +165,10 @@ u32 host1x_syncpt_base_id(struct host1x_syncpt_base =
*base);
> =20
>  struct host1x_syncpt *host1x_syncpt_fd_get(int fd);
> =20
> +struct dma_fence *host1x_fence_create(struct host1x_syncpt *sp, u32 thre=
shold);
> +int host1x_fence_create_fd(struct host1x_syncpt *sp, u32 threshold);
> +int host1x_fence_extract(struct dma_fence *fence, u32 *id, u32 *threshol=
d);

Do we need these outside of the IOCTL implementations?

Thierry

--UkHz975LzvF9XEUl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZzdYACgkQ3SOs138+
s6HpJRAApyg1qzhgRD7OV6hUR9fgDDOZ98EHF8xY8350I97NNTQl6FU8cQFdz1gu
0MDZ32yraMS3pLE+bAlipVQSJJ7ExcRd7pQgs++bDt6DnfvwLSmNxfAJ9LeW5XIH
Xu0xs3WdHJDk0MaCMoahvK1CukV5ab+mGpiqie5/ZmHpDbTiV/TproOdWqYJ2bHK
OEwg3ewJldLPYQC2Omo+Rj7d604VhhQfMNhwbjRxw0joKQvKs0eNJvffNgpBnTnn
dpbMuVNjwtYdBPW3hQaa0jVIWZTeW/JUTR6XxVHjDeBL/4N3bSq9hRQU4gFXCc9J
vZjq5643biz57HavoZHJgVxyZQremDxBISoL+da1vkbJaeTfqkqQC7AkWcLaqytx
ekah0JFecactVhh1rrAPRulNU2GiZioz85FprrQNs7+DBBPY+xQIfQ8+FNTzQTHs
5JxNd5PsQgZFOZYrdvTYuxkJzKmCJFlsSBoTrwdfpogkkFXMe3b8GuSyhS0OuJay
pvv+IPEgu31FNxZUdLo0MYBZ/UA3ksnmvo0DpgPczoOmduUtjP7PkD30/nw5Vpau
JQh9Cce4sGfBUgNvdfv64mnby8q83W9m/fjIqfgPCU5yR3WM4KpqnJin6MdG27YM
eQJMFUO1aPdmpAtovoE1EztrQ/cZE+7OS/R1E388MvD9mFQnsVI=
=7WQ/
-----END PGP SIGNATURE-----

--UkHz975LzvF9XEUl--

--===============1967380390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1967380390==--
