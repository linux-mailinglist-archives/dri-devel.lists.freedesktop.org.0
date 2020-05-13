Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC53C1D1723
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 16:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B13A6EA50;
	Wed, 13 May 2020 14:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499A36EA50
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:11:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7ECA1AE89;
 Wed, 13 May 2020 14:11:03 +0000 (UTC)
Subject: Re: [RFC PATCH 1/3] drm/debugfs: create debugfs files during
 drm_dev_register().
To: Wambui Karuga <wambui.karugax@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
References: <20200513114130.28641-1-wambui.karugax@gmail.com>
 <20200513114130.28641-2-wambui.karugax@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <47bbbb51-7e53-7c87-6058-5848f9ccecfe@suse.de>
Date: Wed, 13 May 2020 16:10:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200513114130.28641-2-wambui.karugax@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0842471044=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0842471044==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6m8qxQOCx5L5GhL1YRiyRnpywERnagkup"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6m8qxQOCx5L5GhL1YRiyRnpywERnagkup
Content-Type: multipart/mixed; boundary="9lG1s31uaMDRSrCYyYsQDttN856fGpr3N";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wambui Karuga <wambui.karugax@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <47bbbb51-7e53-7c87-6058-5848f9ccecfe@suse.de>
Subject: Re: [RFC PATCH 1/3] drm/debugfs: create debugfs files during
 drm_dev_register().
References: <20200513114130.28641-1-wambui.karugax@gmail.com>
 <20200513114130.28641-2-wambui.karugax@gmail.com>
In-Reply-To: <20200513114130.28641-2-wambui.karugax@gmail.com>

--9lG1s31uaMDRSrCYyYsQDttN856fGpr3N
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.05.20 um 13:41 schrieb Wambui Karuga:
> Introduce the ability to track requests for the addition of drm debugfs=

> files at any time and have them added all at once during
> drm_dev_register().
>=20
> Drivers can add drm debugfs file requests to a new list tied to drm_dev=
ice.
> During drm_dev_register(), the new function drm_debugfs_create_file()
> will iterate over the list of added files on a given minor to create
> them.
>=20
> Two new structs are introduced in this change: struct drm_simple_info
> which represents a drm debugfs file entry and struct
> drm_simple_info_entry which is used to track file requests and is the
> main parameter of choice passed by functions. Each drm_simple_info_entr=
y is
> added to the new struct drm_device->debugfs_list for file requests.
>=20
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 59 ++++++++++++++++++++++++++++++++---=

>  drivers/gpu/drm/drm_drv.c     |  2 ++
>  include/drm/drm_debugfs.h     | 38 ++++++++++++++++++++++
>  include/drm/drm_device.h      | 12 +++++++
>  4 files changed, 107 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugf=
s.c
> index 2bea22130703..03b0588ede68 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -145,9 +145,10 @@ static const struct drm_info_list drm_debugfs_list=
[] =3D {
> =20
>  static int drm_debugfs_open(struct inode *inode, struct file *file)
>  {
> -	struct drm_info_node *node =3D inode->i_private;
> +	struct drm_simple_info_entry *entry =3D inode->i_private;
> +	struct drm_simple_info *node =3D &entry->file;
> =20
> -	return single_open(file, node->info_ent->show, node);
> +	return single_open(file, node->show_fn, entry);
>  }
> =20
> =20
> @@ -159,6 +160,25 @@ static const struct file_operations drm_debugfs_fo=
ps =3D {
>  	.release =3D single_release,
>  };
> =20
> +/**
> + * drm_debugfs_create_file - create DRM debugfs file.
> + * @dev: drm_device that the file belongs to
> + *
> + * Create a DRM debugfs file from the list of files to be created
> + * from dev->debugfs_list.
> + */
> +static void drm_debugfs_create_file(struct drm_minor *minor)

This function creates several files. I'd rather call it
drm_debugfs_create_added_files().

> +{
> +	struct drm_device *dev =3D minor->dev;
> +	struct drm_simple_info_entry *entry;
> +
> +	list_for_each_entry(entry, &dev->debugfs_list, list) {
> +		debugfs_create_file(entry->file.name,
> +				    S_IFREG | S_IRUGO, minor->debugfs_root,
> +				    entry,
> +				    &drm_debugfs_fops);
> +	}

I think the created items should be removed from the list. That way,
drivers can call the function multiple times without recreating the same
files again.

> +}
> =20
>  /**
>   * drm_debugfs_create_files - Initialize a given set of debugfs files =
for DRM
> @@ -213,8 +233,7 @@ int drm_debugfs_init(struct drm_minor *minor, int m=
inor_id,
>  	sprintf(name, "%d", minor_id);
>  	minor->debugfs_root =3D debugfs_create_dir(name, root);
> =20
> -	drm_debugfs_create_files(drm_debugfs_list, DRM_DEBUGFS_ENTRIES,
> -				 minor->debugfs_root, minor);

By removing these two lines, aren't you losing the files listed in
DRM_DEBUGFS_ENTRIES?

> +	drm_debugfs_create_file(minor);
> =20
>  	if (drm_drv_uses_atomic_modeset(dev)) {
>  		drm_atomic_debugfs_init(minor);
> @@ -449,4 +468,36 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc=
)
>  	crtc->debugfs_entry =3D NULL;
>  }
> =20
> +void drm_debugfs_add_file(struct drm_device *dev, const char *name,
> +			  drm_simple_show_t show_fn, void *data)
> +{
> +	struct drm_simple_info_entry *entry =3D
> +		kzalloc(sizeof(*entry), GFP_KERNEL);
> +
> +	if (!entry)
> +		return;
> +
> +	entry->file.name =3D name;
> +	entry->file.show_fn =3D show_fn;
> +	entry->file.data =3D data;
> +	entry->dev =3D dev;
> +
> +	mutex_lock(&dev->debugfs_mutex);
> +	list_add(&entry->list, &dev->debugfs_list);
> +	mutex_unlock(&dev->debugfs_mutex);
> +}
> +EXPORT_SYMBOL(drm_debugfs_add_file);
> +
> +void drm_debugfs_add_files(struct drm_device *dev,
> +			   const struct drm_simple_info *files, int count)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < count; i++) {
> +		drm_debugfs_add_file(dev, files[i].name, files[i].show_fn,
> +				     files[i].data);
> +	}
> +}
> +EXPORT_SYMBOL(drm_debugfs_add_files);
> +
>  #endif /* CONFIG_DEBUG_FS */
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index bc38322f306e..c68df4e31aa0 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -646,12 +646,14 @@ int drm_dev_init(struct drm_device *dev,
>  	INIT_LIST_HEAD(&dev->filelist_internal);
>  	INIT_LIST_HEAD(&dev->clientlist);
>  	INIT_LIST_HEAD(&dev->vblank_event_list);
> +	INIT_LIST_HEAD(&dev->debugfs_list);
> =20
>  	spin_lock_init(&dev->event_lock);
>  	mutex_init(&dev->struct_mutex);
>  	mutex_init(&dev->filelist_mutex);
>  	mutex_init(&dev->clientlist_mutex);
>  	mutex_init(&dev->master_mutex);
> +	mutex_init(&dev->debugfs_mutex);
> =20
>  	ret =3D drmm_add_action(dev, drm_dev_init_release, NULL);
>  	if (ret)
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index 2188dc83957f..bbce580c3b38 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -34,6 +34,44 @@
> =20
>  #include <linux/types.h>
>  #include <linux/seq_file.h>
> +
> +struct drm_device;
> +
> +typedef int (*drm_simple_show_t)(struct seq_file *, void *);
> +
> +/**
> + * struct drm_simple_info - debugfs file entry
> + *
> + * This struct represents a debugfs file to be created.
> + */
> +struct drm_simple_info {

drm_simple_info and drm_simple_info_entry seem to be misnomers. They
should probably have some reference to debugfs in their name.

Best regards
Thomas


> +	const char *name;
> +	drm_simple_show_t show_fn;
> +	u32 driver_features;
> +	void *data;
> +};
> +
> +/**
> + * struct drm_simple_info_entry - debugfs list entry
> + *
> + * This struct is used in tracking requests for new debugfs files
> + * to be created.
> + */
> +struct drm_simple_info_entry {
> +	struct drm_device *dev;
> +	struct drm_simple_info file;
> +	struct list_head list;
> +};
> +
> +void drm_debugfs_add_file(struct drm_device *dev,
> +			  const char *name,
> +			  drm_simple_show_t show_fn,
> +			  void *data);
> +
> +void drm_debugfs_add_files(struct drm_device *dev,
> +			   const struct drm_simple_info *files,
> +			   int count);
> +
>  /**
>   * struct drm_info_list - debugfs info list entry
>   *
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index a55874db9dd4..b84dfdac27b7 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -326,6 +326,18 @@ struct drm_device {
>  	 */
>  	struct drm_fb_helper *fb_helper;
> =20
> +	/**
> +	 * @debugfs_mutex:
> +	 * Protects debugfs_list access.
> +	 */
> +	struct mutex debugfs_mutex;
> +
> +	/** @debugfs_list:
> +	 * List of debugfs files to add.
> +	 * Files are added during drm_dev_register().
> +	 */
> +	struct list_head debugfs_list;
> +
>  	/* Everything below here is for legacy driver, never use! */
>  	/* private: */
>  #if IS_ENABLED(CONFIG_DRM_LEGACY)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--9lG1s31uaMDRSrCYyYsQDttN856fGpr3N--

--6m8qxQOCx5L5GhL1YRiyRnpywERnagkup
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl67//EACgkQaA3BHVML
eiMnvwgAv2RMsl2bHeEcg6FLjPW4g10U/ewwdAv2X3rt2W0Nz9IQfOFjjySyRKlw
ARKFG36rj+hhixOPVWJwm6pPAOLNf42pcbvw3wY6JOxoxnzxBjBGfTnn1+gcu6Bc
W7m8FIuCcBqMtvnfDS37X4cf7uxHMyjDQiHBD65VHzoxx61SjjJwklLjWF3K034n
HoNtt/iIf9bk1HCJvhtKeUGpldo7AP8rnY5f/Ld4ym3wN+Yr3bi4hc6QDYJKdITi
N5w8/zUVsUZJIRVMRDK10TDd5sICeU3Vau4IxC9DCL5kJtT3b2rPH2Zds1JZb+dI
MvrEzgugoS9ufpsGVtaQLMl/U+Mcow==
=d0Px
-----END PGP SIGNATURE-----

--6m8qxQOCx5L5GhL1YRiyRnpywERnagkup--

--===============0842471044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0842471044==--
