Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B744D1BD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 17:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37F36E593;
	Thu, 20 Jun 2019 15:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA376E593;
 Thu, 20 Jun 2019 15:11:20 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c2so3406659wrm.8;
 Thu, 20 Jun 2019 08:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0H9zlAD92P9ekBZ1IL5Ma72ZjrQuRTtWpdcHpCq85Z0=;
 b=hy+h0Z1X3Fr7p2ZR7f4z9YEzSs+7G8REOibTqCE66l7YHY3lLBSp8vwQrXKE51r+HC
 sBA4jvBswTzc5TClMkvcQfUmW0VTuL7LK5Kqp4Lju0/b5X1mKn4+Emi8PxD+cik96tZQ
 lTsCdg2/ufcBMCbRze+BMsMHJF4anAvedXp7wouTthvACRbzgbfs0msJ5x1XSgyhPJ0J
 Aqqavbseddsmg8aGv732mi2mW/o7snLVU6Zq/jml5b8UC+8hcHwUlhJglqgTZtgCj0l4
 5Oiz4SQMyHaxymkjt1GKOYwi5p/BgAtlog5/cjC9tJ2WwE2SiYX64EOJoiowSZxVB3TG
 h0Lw==
X-Gm-Message-State: APjAAAU3afZarhG0JhmfffPYqjLk2WMuSqSRrxtGD5yGLxSpS1ABj+Bc
 5LpGFxsH2LPcZloQErRl9XI=
X-Google-Smtp-Source: APXvYqxLgLTJRrKRTzgbmzlJtFRAFQi6lL43mcKlCoh2TXalCaiWaw2DfmIMa07K4qj2M0uHp8AFAw==
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr74980574wrr.5.1561043479267;
 Thu, 20 Jun 2019 08:11:19 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id z5sm4224300wma.36.2019.06.20.08.11.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 08:11:18 -0700 (PDT)
Date: Thu, 20 Jun 2019 17:11:17 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: drm connectors, tegra, and the web they weave (was Re: [PATCH
 58/59] drm/todo: Add new debugfs todo)
Message-ID: <20190620151117.GD15501@ulmo>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-59-daniel.vetter@ffwll.ch>
 <20190618151938.GA2567@kroah.com> <20190618152530.GA4576@kroah.com>
 <CAKMK7uEd0sZ81RMjDsz6cnkW+krPuvoqUcEY4U3ofB9W_qeFvA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEd0sZ81RMjDsz6cnkW+krPuvoqUcEY4U3ofB9W_qeFvA@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0H9zlAD92P9ekBZ1IL5Ma72ZjrQuRTtWpdcHpCq85Z0=;
 b=rHrwXAOeR1/KtWequmWPWdA65pILcJ8Ugg/uhlmaLRf6zbVBySb7v+dG0Tm4RryMmR
 T4QuTSmFcAB3DAxquMiXQmYJMKgwrOiHxSllIjmbAvjuehVdy4WyLykvLNHsGlYKrBWu
 unT1LLRUgk1slKMOzkVDpf3+Fl3oZdhDvwWpq1SdBP7TayEDXYPw4/p+RZw1XeZrG8T/
 vSYbu3j5LhNspeCsSouRUQKJ1FmTSKc7+T0+P9rZdeDRKdtALRu/UrOwfaCQcKVneR7y
 xt9gHbkufAg0oaNLK2ZoKk+XOywXf6v0k7EXD2PTTERXSUEv2DsoALvbzARNLSEYQbtm
 rt7Q==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0709890915=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0709890915==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uxuisgdDHaNETlh8"
Content-Disposition: inline


--uxuisgdDHaNETlh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 07:32:20PM +0200, Daniel Vetter wrote:
> On Tue, Jun 18, 2019 at 5:25 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Tue, Jun 18, 2019 at 05:19:38PM +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Jun 14, 2019 at 10:36:14PM +0200, Daniel Vetter wrote:
> > > > Greg is busy already, but maybe he won't do everything ...
> > > >
> > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > ---
> > > >  Documentation/gpu/todo.rst | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > > > index 9717540ee28f..026e55c517e1 100644
> > > > --- a/Documentation/gpu/todo.rst
> > > > +++ b/Documentation/gpu/todo.rst
> > > > @@ -375,6 +375,9 @@ There's a bunch of issues with it:
> > > >    this (together with the drm_minor->drm_device move) would allow =
us to remove
> > > >    debugfs_init.
> > > >
> > > > +- Drop the return code and error checking from all debugfs functio=
ns. Greg KH is
> > > > +  working on this already.
> > >
> > >
> > > Part of this work was to try to delete drm_debugfs_remove_files().
> > >
> > > There are only 4 files that currently still call this function:
> > >       drivers/gpu/drm/tegra/dc.c
> > >       drivers/gpu/drm/tegra/dsi.c
> > >       drivers/gpu/drm/tegra/hdmi.c
> > >       drivers/gpu/drm/tegra/sor.c
> > >
> > > For dc.c, the driver wants to add debugfs files to the struct drm_crtc
> > > debugfs directory.  Which is fine, but it has to do some special memo=
ry
> > > allocation to get the debugfs callback to point not to the struct
> > > drm_minor pointer, but rather the drm_crtc structure.
>=20
> There's already a todo to switch the drm_minor debugfs stuff over to
> drm_device. drm_minor is essentially different uapi flavours (/dev/
> minor nodes, hence the name) sitting on top of the same drm_device.
> Last time I checked all the debugfs files want the drm_device, not the
> minor. I think we even discussed to only register the debugfs files
> for the first minor, and create the other ones as symlinks to the
> first one. But haven't yet gotten around to typing that.
>=20
> drm_crtc/connector are parts of drm_device with modesetting support,
> so the drm_minor is even worse choice really.

For the connector drivers we already sit on top of the per-connector
debugfs directories. I think the only reason why we don't do that for
the display controller is because drm_crtc didn't have built-in debugfs
support like the connectors have. It looks like that's no longer true,
though it's been there for a while. I think it'd be good to just move
those over as well.

As for passing struct drm_minor, I think that's mostly unnecessary. As
far as I can tell, we only use drm_minor to get at drm_device, which in
turn we only use to check some features flags, and drm_minor itself is
only used to track the list of files that are being added so that they
can later be removed again. Given that we can just tear down everything
debugfs recursively, I don't think we need any of that.

>=20
> Not exactly sure why we went with this, but probably dates back to the
> *bsd compat layer and a lot of these files hanging out in procfs too
> (we've fixed those mistakes a few years ago, yay!).
>=20
> > > So, to remove this call, I need to remove this special memory allocat=
ion
> > > and to do that, I need to somehow be able to cast from drm_minor back=
 to
> > > the drm_crtc structure being used in this driver.  And I can't figure
> > > how they are related at all.
> > >
> > > Any pointers here (pun intended) would be appreciated.
> > >
> > > For the other 3 files, the situation is much the same, but I need to =
get
> > > from a 'struct drm_minor' pointer to a 'struct drm_connector' pointer.
>=20
> Ditch the drm_minor, there's no no way to get from that to something
> like drm_connector/crtc, since it's a n:m relationship.

Yeah. That too.

> > > I could just "open code" a bunch of calls to debugfs_create_file() for
> > > these drivers, which would solve this issue, but in a more "non-drm"
> > > way.  Is it worth to just do that instead of overthinking the whole
> > > thing and trying to squish it into the drm "model" of drm debugfs cal=
ls?
> >
> > An example of "open coding" this is the patch below for the sor.c
> > driver.
>=20
> I think open-coding is the way to go here. One of the todos is to
> extend debugfs support for crtc/connectors, but looking at the
> open-coded version we really don't need a drm-flavoured midlayer here.

Exactly my thoughts. It'd be nice to have some sort of macro to help
bring the boilerplate down a bit.

Thierry

> > Totally untested, not even built, but you should get the idea here.
> >
> > thanks,
> >
> > greg k-h
> >
> > ---------------
> >
> > diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> > index 5be5a0817dfe..3216221c77c4 100644
> > --- a/drivers/gpu/drm/tegra/sor.c
> > +++ b/drivers/gpu/drm/tegra/sor.c
> > @@ -414,7 +414,8 @@ struct tegra_sor {
> >
> >         struct drm_dp_aux *aux;
> >
> > -       struct drm_info_list *debugfs_files;
> > +       struct dentry *debugfs_root;
> > +       struct drm_device *drm;
> >
> >         const struct tegra_sor_ops *ops;
> >         enum tegra_io_pad pad;
> > @@ -1262,10 +1263,9 @@ static int tegra_sor_crc_wait(struct tegra_sor *=
sor, unsigned long timeout)
> >
> >  static int tegra_sor_show_crc(struct seq_file *s, void *data)
> >  {
> > -       struct drm_info_node *node =3D s->private;
> > -       struct tegra_sor *sor =3D node->info_ent->data;
> > +       struct tegra_sor *sor =3D s->private;
> >         struct drm_crtc *crtc =3D sor->output.encoder.crtc;
> > -       struct drm_device *drm =3D node->minor->dev;
> > +       struct drm_device *drm =3D sor->drm;
> >         int err =3D 0;
> >         u32 value;
> >
> > @@ -1302,6 +1302,20 @@ static int tegra_sor_show_crc(struct seq_file *s=
, void *data)
> >         return err;
> >  }
> >
> > +static int crc_open(struct inode *inode, struct file *file)
> > +{
> > +       struct tegra_sor *sor =3D inode->i_private;
> > +       return single_open(file, tegra_sor_show_crc, sor);
> > +}
> > +
> > +static const struct file_operations crc_fops =3D {
> > +       .owner =3D THIS_MODULE,
> > +       .open =3D crc_open,
> > +       .read =3D seq_read,
> > +       .llseek =3D seq_lseek,
> > +       .release =3D single_release,
> > +};
>=20
> Hm, is there not a macro to create such simple files with read/write
> ops? At least for sysfs this is a bit less boilerplate iirc.
>=20
> > +
> >  #define DEBUGFS_REG32(_name) { .name =3D #_name, .offset =3D _name }
> >
> >  static const struct debugfs_reg32 tegra_sor_regs[] =3D {
> > @@ -1424,10 +1438,9 @@ static const struct debugfs_reg32 tegra_sor_regs=
[] =3D {
> >
> >  static int tegra_sor_show_regs(struct seq_file *s, void *data)
> >  {
> > -       struct drm_info_node *node =3D s->private;
> > -       struct tegra_sor *sor =3D node->info_ent->data;
> > +       struct tegra_sor *sor =3D s->private;
> >         struct drm_crtc *crtc =3D sor->output.encoder.crtc;
> > -       struct drm_device *drm =3D node->minor->dev;
> > +       struct drm_device *drm =3D sor->drm;
>=20
> sor->output.connector.dev should give you this already. And I think
> getting at the drm_device is the only reason we needed the drm_minor
> here at all.
>=20
> >         unsigned int i;
> >         int err =3D 0;
> >
> > @@ -1450,51 +1463,44 @@ static int tegra_sor_show_regs(struct seq_file =
*s, void *data)
> >         return err;
> >  }
> >
> > -static const struct drm_info_list debugfs_files[] =3D {
> > -       { "crc", tegra_sor_show_crc, 0, NULL },
> > -       { "regs", tegra_sor_show_regs, 0, NULL },
> > +static int regs_open(struct inode *inode, struct file *file)
> > +{
> > +       struct tegra_sor *sor =3D inode->i_private;
> > +       return single_open(file, tegra_sor_show_regs, sor);
> > +}
> > +
> > +static const struct file_operations crc_fops =3D {
> > +       .owner =3D THIS_MODULE,
> > +       .open =3D crc_open,
> > +       .read =3D seq_read,
> > +       .llseek =3D seq_lseek,
> > +       .release =3D single_release,
> >  };
> >
> >  static int tegra_sor_late_register(struct drm_connector *connector)
> >  {
> > -       struct tegra_output *output =3D connector_to_output(connector);
> > -       unsigned int i, count =3D ARRAY_SIZE(debugfs_files);
> >         struct drm_minor *minor =3D connector->dev->primary;
> > -       struct dentry *root =3D connector->debugfs_entry;
> > +       struct tegra_output *output =3D connector_to_output(connector);
> >         struct tegra_sor *sor =3D to_sor(output);
> > -       int err;
> > +       struct dentry *root;
> >
> > -       sor->debugfs_files =3D kmemdup(debugfs_files, sizeof(debugfs_fi=
les),
> > -                                    GFP_KERNEL);
> > -       if (!sor->debugfs_files)
> > -               return -ENOMEM;
> > +       sor->drm =3D minor->dev;
> >
> > -       for (i =3D 0; i < count; i++)
> > -               sor->debugfs_files[i].data =3D sor;
> > +       root =3D debugfs_create_dir("sor", connector->debugfs_entry);
>=20
> Hm I think the old files got created right in the
> drm_connector->debugfs_entry directory?
>=20
> > +       sor->debugfs_root =3D root;
> >
> > -       err =3D drm_debugfs_create_files(sor->debugfs_files, count, roo=
t, minor);
> > -       if (err < 0)
> > -               goto free;
> > +       debugfs_create_file("crc", S_IFREG | S_IRUGO, root, sor, &crc_f=
ops);
> > +       debugfs_create_file("regs", S_IFREG | S_IRUGO, root, sor, &regs=
_fops);
> >
> >         return 0;
> > -
> > -free:
> > -       kfree(sor->debugfs_files);
> > -       sor->debugfs_files =3D NULL;
> > -
> > -       return err;
> >  }
>=20
> I think if you can create a debugfs-simple-file macro, this here would
> win hands-down from a boilerplate pov. I like.

I fully agree with this and all of your points above.

> >  static void tegra_sor_early_unregister(struct drm_connector *connector)
> >  {
> >         struct tegra_output *output =3D connector_to_output(connector);
> > -       unsigned int count =3D ARRAY_SIZE(debugfs_files);
> >         struct tegra_sor *sor =3D to_sor(output);
> >
> > -       drm_debugfs_remove_files(sor->debugfs_files, count,
> > -                                connector->dev->primary);
> > -       kfree(sor->debugfs_files);
> > -       sor->debugfs_files =3D NULL;
> > +       debugfs_remove_recursive(sor->debugfs_root);
>=20
> Not needed, we tear down everything as part of drm_dev_unregister
> anyway. So you can ditch this.

And this. Greg, let me know if you need a hand with the patches or if
you want any of these to be build/runtime tested.

Thierry

--uxuisgdDHaNETlh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LohIACgkQ3SOs138+
s6EFHA/+M445JdfOy3KDU0l1Z+q8GIbxBghef/HSVY+H+0PKwfIEYpUdRl2Dkz7S
bqbRKJu+domYu7UHGIyR3QpDSq1At6FpvxR1tIZ25PHmsehNOvscCdn1MBN+LuzZ
wMJ+XEwzu1OE9xlIAr4Vr8LTY6Fzn2Sql+vz3UxuVuRgg2xxFSGzdUrEaIrbZjcu
6/iGXwtD4xHrMq6aHQs+fvwRkYUBFDnQU9o0aoahG8WhG9tdnsuF7yxtlGZn+jLw
NwijgUtLNxU/YLrRK4w1G/mQdVIO/syfHbzavzpe2XDLqgSnYU+WjeRWHzNUKPna
WBfgIJ5XPyyaXdPx67D06+RdJDiUC/YsXUF336zsebKW/Drd+mhN44lfL76T5zIm
7Ot/Sm7GLgWRSh4zp7EXoXMSFnsMrGH57Yaf1NOVFPgnr+eH0aA8/uJZo0ZUkMkT
nfdl0AhY/pTOUQZphcfz6ZEcq9ACYiRV53/8h4guonDV0YrSIM/M6+DnKW/5IxXZ
ekUrfs3tqn2Aj9/AVHOc/ZQy+s5M9T70uTj1rJaH+xDJFexn/L4HJQHtCYZY1McP
S9xvn7QGr911GPWLB1m4uLtKHr33XLHpSRUHRj51HU5TexSa161Ui0CMuNxN+L/J
M28ZIZV20yPOPH6iMG5HpyLoMnriCtIrDkfIhyR28UjUCBmmfb4=
=yJCg
-----END PGP SIGNATURE-----

--uxuisgdDHaNETlh8--

--===============0709890915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0709890915==--
