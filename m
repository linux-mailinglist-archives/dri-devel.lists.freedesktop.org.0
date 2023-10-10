Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A1B7BF2C4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 08:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868EC10E188;
	Tue, 10 Oct 2023 06:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AFB10E188
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 06:08:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 22331614DE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 06:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C047FC433C8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 06:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696918100;
 bh=rRBs3Ych6ZoGW6MOQ4I5lIL2l0ivTAGfSIv5O+2SfEE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MRWYqQEukdLRyPOdSKu/qZUlD5vfD67O7axPbnBwNdlyS08vG8SbjJ2h3zawccQIs
 Q3M373CcUoPmrb8iq7dfN2hz2GHKSlhMIKAv8CJIHQ4nxnMDBZyrX4XVnq68FR3UTV
 4zztaYkwJF435GaHsQu4XPAWoGOAPu3YBFXQTozaMH/SOihs0q2KOG2Qo2r9dVilzu
 Io90O3xAY2XfkqrSn5TL11H7rRt/XTtLeTOHC3RDG3UdiVotRzl0qU+BhQmLGlJcB5
 UyRifSTFK1eoRLE0Hs+KatQBAJ1luM2iVMVRgV8Rr/ATXBk0xb10T4IkHenJYYow5Q
 HZr6i71aQ7W0w==
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-5a7aaa73d55so12639827b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 23:08:20 -0700 (PDT)
X-Gm-Message-State: AOJu0YzZtY8Wx7atF5FsSCikXCjYQX0tpmHcXWLshieK6eNbRiy89n8q
 NKgmXJ1Bamb+fT/Lc1WoX+fVi3anmHOSLyivY7c=
X-Google-Smtp-Source: AGHT+IG9mD2kz+9gbuzzXiCGiW9fG1qt5NBAZi/g3qSE9AAFBv09eLy0LeQCY/MGvuj+9PGzan4fdLL74rBsIzs95zs=
X-Received: by 2002:a0d:d7cc:0:b0:584:4bbb:963b with SMTP id
 z195-20020a0dd7cc000000b005844bbb963bmr16955392ywd.15.1696918099929; Mon, 09
 Oct 2023 23:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <2023100654-pointless-stem-5ee1@gregkh>
In-Reply-To: <2023100654-pointless-stem-5ee1@gregkh>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 10 Oct 2023 09:07:53 +0300
X-Gmail-Original-Message-ID: <CAFCwf10o8J2JYue9Spc0qmSnH671ySuDeUggJ3J6mhXVTc7kTA@mail.gmail.com>
Message-ID: <CAFCwf10o8J2JYue9Spc0qmSnH671ySuDeUggJ3J6mhXVTc7kTA@mail.gmail.com>
Subject: Re: [PATCH] accel/habanalabs: make hl_class constant
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Ohad Sharabi <osharabi@habana.ai>, Dani Liberman <dliberman@habana.ai>,
 Koby Elbaz <kelbaz@habana.ai>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dafna Hirschfeld <dhirschfeld@habana.ai>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Tomer Tayar <ttayar@habana.ai>, Tal Cohen <talcohen@habana.ai>,
 Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 6, 2023 at 4:57=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> Now that the driver core allows for struct class to be in read-only
> memory, we should make all 'class' structures declared at build time
> placing them into read-only memory, instead of having to be dynamically
> allocated at runtime.
>
> This requires some passing of const struct class * around in the common
> habanalabs code as well as converting the structure itself.

Hi Greg,
Thanks for the patch but if you look at our tip of habanalabs-next
branch (to be merged in 6.7), you will see the hl_class related code
no longer exists, as we moved completely to the new accel char device
class.
So, I'm dropping this patch.
Oded

>
> Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
> Cc: Dani Liberman <dliberman@habana.ai>
> Cc: Koby Elbaz <kelbaz@habana.ai>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Ofir Bitton <obitton@habana.ai>
> Cc: Ohad Sharabi <osharabi@habana.ai>
> Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Cc: Tal Cohen <talcohen@habana.ai>
> Cc: Tomer Tayar <ttayar@habana.ai>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/accel/habanalabs/common/device.c        |  2 +-
>  drivers/accel/habanalabs/common/habanalabs.h    |  2 +-
>  .../accel/habanalabs/common/habanalabs_drv.c    | 17 ++++++++++-------
>  3 files changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/hab=
analabs/common/device.c
> index b97339d1f7c6..4c28d8cfbb68 100644
> --- a/drivers/accel/habanalabs/common/device.c
> +++ b/drivers/accel/habanalabs/common/device.c
> @@ -652,7 +652,7 @@ static void device_release_func(struct device *dev)
>   *
>   * Initialize a cdev and a Linux device for habanalabs's device.
>   */
> -static int device_init_cdev(struct hl_device *hdev, struct class *class,
> +static int device_init_cdev(struct hl_device *hdev, const struct class *=
class,
>                                 int minor, const struct file_operations *=
fops,
>                                 char *name, struct cdev *cdev,
>                                 struct device **dev)
> diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel=
/habanalabs/common/habanalabs.h
> index 2f027d5a8206..f1c78555e611 100644
> --- a/drivers/accel/habanalabs/common/habanalabs.h
> +++ b/drivers/accel/habanalabs/common/habanalabs.h
> @@ -3308,7 +3308,7 @@ struct hl_device {
>         u64                             pcie_bar_phys[HL_PCI_NUM_BARS];
>         void __iomem                    *pcie_bar[HL_PCI_NUM_BARS];
>         void __iomem                    *rmmio;
> -       struct class                    *hclass;
> +       const struct class              *hclass;
>         struct cdev                     cdev;
>         struct cdev                     cdev_ctrl;
>         struct device                   *dev;
> diff --git a/drivers/accel/habanalabs/common/habanalabs_drv.c b/drivers/a=
ccel/habanalabs/common/habanalabs_drv.c
> index 7263e84c1a4d..4f1fdff3843d 100644
> --- a/drivers/accel/habanalabs/common/habanalabs_drv.c
> +++ b/drivers/accel/habanalabs/common/habanalabs_drv.c
> @@ -27,7 +27,11 @@ MODULE_DESCRIPTION(HL_DRIVER_DESC);
>  MODULE_LICENSE("GPL v2");
>
>  static int hl_major;
> -static struct class *hl_class;
> +
> +static const struct class hl_class =3D {
> +       .name =3D HL_NAME,
> +};
> +
>  static DEFINE_IDR(hl_devs_idr);
>  static DEFINE_MUTEX(hl_devs_idr_lock);
>
> @@ -317,7 +321,7 @@ static void copy_kernel_module_params_to_device(struc=
t hl_device *hdev)
>         hdev->asic_prop.fw_security_enabled =3D is_asic_secured(hdev->asi=
c_type);
>
>         hdev->major =3D hl_major;
> -       hdev->hclass =3D hl_class;
> +       hdev->hclass =3D &hl_class;
>         hdev->memory_scrub =3D memory_scrub;
>         hdev->reset_on_lockup =3D reset_on_lockup;
>         hdev->boot_error_status_mask =3D boot_error_status_mask;
> @@ -691,10 +695,9 @@ static int __init hl_init(void)
>
>         hl_major =3D MAJOR(dev);
>
> -       hl_class =3D class_create(HL_NAME);
> -       if (IS_ERR(hl_class)) {
> +       rc =3D class_register(&hl_class);
> +       if (rc) {
>                 pr_err("failed to allocate class\n");
> -               rc =3D PTR_ERR(hl_class);
>                 goto remove_major;
>         }
>
> @@ -712,7 +715,7 @@ static int __init hl_init(void)
>
>  remove_debugfs:
>         hl_debugfs_fini();
> -       class_destroy(hl_class);
> +       class_unregister(&hl_class);
>  remove_major:
>         unregister_chrdev_region(MKDEV(hl_major, 0), HL_MAX_MINORS);
>         return rc;
> @@ -732,7 +735,7 @@ static void __exit hl_exit(void)
>          */
>         hl_debugfs_fini();
>
> -       class_destroy(hl_class);
> +       class_unregister(&hl_class);
>         unregister_chrdev_region(MKDEV(hl_major, 0), HL_MAX_MINORS);
>
>         idr_destroy(&hl_devs_idr);
> --
> 2.42.0
>
