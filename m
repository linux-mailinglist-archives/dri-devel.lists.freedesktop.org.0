Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD31745C31
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 14:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A3310E212;
	Mon,  3 Jul 2023 12:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3055E10E212
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 12:27:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E1BA60F05
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 12:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84251C433C8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 12:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688387272;
 bh=2EVs3kXtnpDKdNK9AnLY5wZF5XzWUsZ/2zmOx02LYSE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=az4MYr7MKdkVdiJl9mNOIZmGAK/AevdEKU+MPp+qMQA74XX8Pwhyjnr+UDWj367s8
 XMOHC3orgnuJFPC6+VCf6PEZJ14pOvDH39DedpuzYBUXPyZO6wuZzPN5Lg1b2dgscZ
 jGUdSJXaROGGpCyB6bC/ehAuyEff5GndLAnoEfCvJXQ93GRIcMeW+uiNq188Mh4KUO
 m4a2W0liFVl7rpP73dh6XWwMDHVYNRWypF/OK9BWDKK7VubbODZRIV41G0M2ZyJQa2
 VO1Us1ppfNwI7xInklCRyx9N3MuveLazo/v70cIOh7MWYKKrX0Myxdm10Sk59QBxrj
 XYVmJ9xnZ3Vgw==
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-570114e1feaso55188857b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 05:27:52 -0700 (PDT)
X-Gm-Message-State: ABy/qLbtnUo548G7pdhLtotY6wQTslkPEJC+KFj5iR8ykSsC2i96DzRy
 wdaw/m8uOLbn/36mIHMObgUlaT3F3vEW/ei6oBI=
X-Google-Smtp-Source: APBJJlHGkXOiyDljiw0WPQ1cdzbR+bOTDjupgspEK/of6mYU3V8vuOADTtRzC4cI8DvchQrkLfIr6EaRTZ1NFO100Vg=
X-Received: by 2002:a25:d216:0:b0:c21:caaf:bd47 with SMTP id
 j22-20020a25d216000000b00c21caafbd47mr10459923ybg.2.1688387271590; Mon, 03
 Jul 2023 05:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230620182528.669526-2-gregkh@linuxfoundation.org>
 <1caf16e9-f066-f889-278c-fe1c242930c3@habana.ai>
In-Reply-To: <1caf16e9-f066-f889-278c-fe1c242930c3@habana.ai>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 3 Jul 2023 15:27:25 +0300
X-Gmail-Original-Message-ID: <CAFCwf11fOZpzh5ZTizzW6ZnnvEbq4oG3upp9CNmstSZj5P4ofw@mail.gmail.com>
Message-ID: <CAFCwf11fOZpzh5ZTizzW6ZnnvEbq4oG3upp9CNmstSZj5P4ofw@mail.gmail.com>
Subject: Re: [PATCH] accel: make accel_class a static const structure
To: Tomer Tayar <ttayar@habana.ai>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ivan Orlov <ivan.orlov0322@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 3, 2023 at 3:09=E2=80=AFPM Tomer Tayar <ttayar@habana.ai> wrote=
:
>
> On 20/06/2023 21:25, Greg Kroah-Hartman wrote:
> > From: Ivan Orlov <ivan.orlov0322@gmail.com>
> >
> > Now that the driver core allows for struct class to be in read-only
> > memory, move the accel_class structure to be declared at build time
> > placing it into read-only memory, instead of having to be dynamically
> > allocated at boot time.
> >
> > Cc: Oded Gabbay <ogabbay@kernel.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> Reviewed-by: Tomer Tayar <ttayar@habana.ai>
Thanks Tomer.
Applied to habanalabs-next for 6.6.
Oded
>
> Thanks,
> Tomer
>
> > ---
> >   drivers/accel/drm_accel.c | 21 ++++++++-------------
> >   1 file changed, 8 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
> > index 4a9baf02439e..2dc187e1ee41 100644
> > --- a/drivers/accel/drm_accel.c
> > +++ b/drivers/accel/drm_accel.c
> > @@ -21,7 +21,6 @@ static DEFINE_SPINLOCK(accel_minor_lock);
> >   static struct idr accel_minors_idr;
> >
> >   static struct dentry *accel_debugfs_root;
> > -static struct class *accel_class;
> >
> >   static struct device_type accel_sysfs_device_minor =3D {
> >       .name =3D "accel_minor"
> > @@ -32,23 +31,19 @@ static char *accel_devnode(const struct device *dev=
, umode_t *mode)
> >       return kasprintf(GFP_KERNEL, "accel/%s", dev_name(dev));
> >   }
> >
> > +static const struct class accel_class =3D {
> > +     .name =3D "accel",
> > +     .devnode =3D accel_devnode,
> > +};
> > +
> >   static int accel_sysfs_init(void)
> >   {
> > -     accel_class =3D class_create("accel");
> > -     if (IS_ERR(accel_class))
> > -             return PTR_ERR(accel_class);
> > -
> > -     accel_class->devnode =3D accel_devnode;
> > -
> > -     return 0;
> > +     return class_register(&accel_class);
> >   }
> >
> >   static void accel_sysfs_destroy(void)
> >   {
> > -     if (IS_ERR_OR_NULL(accel_class))
> > -             return;
> > -     class_destroy(accel_class);
> > -     accel_class =3D NULL;
> > +     class_unregister(&accel_class);
> >   }
> >
> >   static int accel_name_info(struct seq_file *m, void *data)
> > @@ -116,7 +111,7 @@ void accel_debugfs_init(struct drm_minor *minor, in=
t minor_id)
> >   void accel_set_device_instance_params(struct device *kdev, int index)
> >   {
> >       kdev->devt =3D MKDEV(ACCEL_MAJOR, index);
> > -     kdev->class =3D accel_class;
> > +     kdev->class =3D &accel_class;
> >       kdev->type =3D &accel_sysfs_device_minor;
> >   }
> >
>
>
