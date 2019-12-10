Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6CE118578
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 11:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CF06E8A1;
	Tue, 10 Dec 2019 10:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D956E8A1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 10:45:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C2AB1B298;
 Tue, 10 Dec 2019 10:45:01 +0000 (UTC)
Subject: Re: [PATCH RFC 4/8] drm/sprd: add Unisoc's drm display controller
 driver
To: Kevin Tang <kevin3.tang@gmail.com>, airlied@linux.ie, daniel@ffwll.ch
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
 <1575966995-13757-5-git-send-email-kevin3.tang@gmail.com>
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
Message-ID: <5f5a49ce-0698-ff21-7ced-23e786d17583@suse.de>
Date: Tue, 10 Dec 2019 11:44:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1575966995-13757-5-git-send-email-kevin3.tang@gmail.com>
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
Cc: orsonzhai@gmail.com, baolin.wang@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhang.lyra@gmail.com
Content-Type: multipart/mixed; boundary="===============0832840943=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0832840943==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="esrGSde6ivD08pWYafl7kb8thvey53cuE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--esrGSde6ivD08pWYafl7kb8thvey53cuE
Content-Type: multipart/mixed; boundary="M4qYQZLBKjx32qPDQqLM28oi2ayGH6uYt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kevin Tang <kevin3.tang@gmail.com>, airlied@linux.ie, daniel@ffwll.ch
Cc: orsonzhai@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhang.lyra@gmail.com, baolin.wang@linaro.org
Message-ID: <5f5a49ce-0698-ff21-7ced-23e786d17583@suse.de>
Subject: Re: [PATCH RFC 4/8] drm/sprd: add Unisoc's drm display controller
 driver
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
 <1575966995-13757-5-git-send-email-kevin3.tang@gmail.com>
In-Reply-To: <1575966995-13757-5-git-send-email-kevin3.tang@gmail.com>

--M4qYQZLBKjx32qPDQqLM28oi2ayGH6uYt
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.12.19 um 09:36 schrieb Kevin Tang:
> From: Kevin Tang <kevin.tang@unisoc.com>
>=20
> Adds DPU(Display Processor Unit) support for the Unisoc's display subsy=
stem.
> It's support multi planes, scaler, rotation, PQ(Picture Quality) and mo=
re.
>=20
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  drivers/gpu/drm/sprd/Makefile       |    6 +-
>  drivers/gpu/drm/sprd/disp_lib.c     |  290 +++++++
>  drivers/gpu/drm/sprd/disp_lib.h     |   40 +
>  drivers/gpu/drm/sprd/dpu/Makefile   |    8 +
>  drivers/gpu/drm/sprd/dpu/dpu_r2p0.c | 1464 +++++++++++++++++++++++++++=
++++++++
>  drivers/gpu/drm/sprd/sprd_dpu.c     | 1152 +++++++++++++++++++++++++++=

>  drivers/gpu/drm/sprd/sprd_dpu.h     |  217 ++++++
>  7 files changed, 3176 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/sprd/disp_lib.c
>  create mode 100644 drivers/gpu/drm/sprd/disp_lib.h
>  create mode 100644 drivers/gpu/drm/sprd/dpu/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h
>=20
> diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makef=
ile
> index df0b316..3f188ab 100644
> --- a/drivers/gpu/drm/sprd/Makefile
> +++ b/drivers/gpu/drm/sprd/Makefile
> @@ -5,4 +5,8 @@ ccflags-y +=3D -Iinclude/drm
>  subdir-ccflags-y +=3D -I$(src)
> =20
>  obj-y :=3D sprd_drm.o \
> -	sprd_gem.o
> \ No newline at end of file
> +	sprd_gem.o \
> +	sprd_dpu.o
> +
> +obj-y +=3D disp_lib.o
> +obj-y +=3D dpu/
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/sprd/disp_lib.c b/drivers/gpu/drm/sprd/dis=
p_lib.c
> new file mode 100644
> index 0000000..cadd1ad
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/disp_lib.c
> @@ -0,0 +1,290 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
> + */
> +
> +#define pr_fmt(__fmt) "[drm][%20s] "__fmt, __func__
> +
> +#include <linux/device.h>
> +#include <linux/libfdt.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_platform.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +#include <linux/fs.h>
> +
> +#include "disp_lib.h"
> +
> +struct bmp_header {
> +	u16 magic;
> +	u32 size;
> +	u32 unused;
> +	u32 start;
> +} __attribute__((__packed__));
> +
> +struct dib_header {
> +	u32 size;
> +	u32 width;
> +	u32 height;
> +	u16 planes;
> +	u16 bpp;
> +	u32 compression;
> +	u32 data_size;
> +	u32 h_res;
> +	u32 v_res;
> +	u32 colours;
> +	u32 important_colours;
> +	u32 red_mask;
> +	u32 green_mask;
> +	u32 blue_mask;
> +	u32 alpha_mask;
> +	u32 colour_space;
> +	u32 unused[12];
> +} __attribute__((__packed__));
> +
> +int str_to_u32_array(const char *p, u32 base, u32 array[])
> +{
> +	const char *start =3D p;
> +	char str[12];
> +	int length =3D 0;
> +	int i, ret;
> +
> +	pr_info("input: %s", p);
> +
> +	for (i =3D 0 ; i < 255; i++) {
> +		while (*p =3D=3D ' ')
> +			p++;
> +		if (*p =3D=3D '\0')
> +			break;
> +		start =3D p;
> +
> +		while ((*p !=3D ' ') && (*p !=3D '\0'))
> +			p++;
> +
> +		if ((p - start) >=3D sizeof(str))
> +			break;
> +
> +		memset(str, 0, sizeof(str));
> +		memcpy(str, start, p - start);
> +
> +		ret =3D kstrtou32(str, base, &array[i]);
> +		if (ret) {
> +			DRM_ERROR("input format error\n");
> +			break;
> +		}
> +
> +		length++;
> +	}
> +
> +	return length;
> +}
> +EXPORT_SYMBOL_GPL(str_to_u32_array);
> +
> +int load_dtb_to_mem(const char *name, void **blob)
> +{
> +	ssize_t ret;
> +	u32 count;
> +	struct fdt_header dtbhead;
> +	loff_t pos =3D 0;
> +	struct file *fdtb;
> +
> +
> +	fdtb =3D filp_open(name, O_RDONLY, 0644);
> +	if (IS_ERR(fdtb)) {
> +		DRM_ERROR("%s open file error\n", __func__);
> +		return PTR_ERR(fdtb);
> +	}
> +
> +	ret =3D kernel_read(fdtb, &dtbhead, sizeof(dtbhead), &pos);
> +	pos =3D 0;
> +	count =3D ntohl(dtbhead.totalsize);
> +	*blob =3D kzalloc(count, GFP_KERNEL);
> +	if (*blob =3D=3D NULL) {
> +		filp_close(fdtb, NULL);
> +		return -ENOMEM;
> +	}
> +	ret =3D kernel_read(fdtb, *blob, count, &pos);
> +
> +	if (ret !=3D count) {
> +		DRM_ERROR("Read to mem fail: ret %zd size%x\n", ret, count);
> +		kfree(*blob);
> +		*blob =3D NULL;
> +		filp_close(fdtb, NULL);
> +		return ret < 0 ? ret : -ENODEV;
> +	}
> +
> +	filp_close(fdtb, NULL);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(load_dtb_to_mem);
> +
> +int str_to_u8_array(const char *p, u32 base, u8 array[])
> +{
> +	const char *start =3D p;
> +	char str[12];
> +	int length =3D 0;
> +	int i, ret;
> +
> +	pr_info("input: %s", p);
> +
> +	for (i =3D 0 ; i < 255; i++) {
> +		while (*p =3D=3D ' ')
> +			p++;
> +		if (*p =3D=3D '\0')
> +			break;
> +		start =3D p;
> +
> +		while ((*p !=3D ' ') && (*p !=3D '\0'))
> +			p++;
> +
> +		if ((p - start) >=3D sizeof(str))
> +			break;
> +
> +		memset(str, 0, sizeof(str));
> +		memcpy(str, start, p - start);
> +
> +		ret =3D kstrtou8(str, base, &array[i]);
> +		if (ret) {
> +			DRM_ERROR("input format error\n");
> +			break;
> +		}
> +
> +		length++;
> +	}
> +
> +	return length;
> +}
> +EXPORT_SYMBOL_GPL(str_to_u8_array);
> +
> +int dump_bmp32(const char *p, u32 width, u32 height,
> +		bool noflip, const char *filename)
> +{
> +	struct file *fp;
> +	mm_segment_t fs;
> +	loff_t pos;
> +	struct dib_header dib_header =3D {
> +		.size =3D sizeof(dib_header),
> +		.width =3D width,
> +		.height =3D noflip ? -height : height,
> +		.planes =3D 1,
> +		.bpp =3D 32,
> +		.compression =3D 3,
> +		.data_size =3D 4 * width * height,
> +		.h_res =3D 0xB13,
> +		.v_res =3D 0xB13,
> +		.colours =3D 0,
> +		.important_colours =3D 0,
> +		.red_mask =3D 0x000000FF,
> +		.green_mask =3D 0x0000FF00,
> +		.blue_mask =3D 0x00FF0000,
> +		.alpha_mask =3D 0xFF000000,
> +		.colour_space =3D 0x57696E20,
> +	};
> +	struct bmp_header bmp_header =3D {
> +		.magic =3D 0x4d42,
> +		.size =3D (width * height * 4) +
> +		sizeof(bmp_header) + sizeof(dib_header),
> +		.start =3D sizeof(bmp_header) + sizeof(dib_header),
> +	};
> +
> +	fp =3D filp_open(filename, O_RDWR | O_CREAT, 0644);
> +	if (IS_ERR(fp)) {
> +		DRM_ERROR("failed to open %s: %ld\n", filename, PTR_ERR(fp));
> +		return PTR_ERR(fp);
> +	}
> +
> +	fs =3D get_fs();
> +	set_fs(KERNEL_DS);
> +	pos =3D 0;
> +
> +	vfs_write(fp, (const char *)&bmp_header, sizeof(bmp_header), &pos);
> +	vfs_write(fp, (const char *)&dib_header, sizeof(dib_header), &pos);
> +	vfs_write(fp, p, width * height * 4, &pos);
> +
> +	filp_close(fp, NULL);
> +	set_fs(fs);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(dump_bmp32);
> +
> +void *disp_ops_attach(const char *str, struct list_head *head)
> +{
> +	struct ops_list *list;
> +	const char *ver;
> +
> +	list_for_each_entry(list, head, head) {
> +		ver =3D list->entry->ver;
> +		if (!strcmp(str, ver))
> +			return list->entry->ops;
> +	}
> +
> +	DRM_ERROR("attach disp ops %s failed\n", str);
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(disp_ops_attach);
> +
> +int disp_ops_register(struct ops_entry *entry, struct list_head *head)=

> +{
> +	struct ops_list *list;
> +
> +	list =3D kzalloc(sizeof(struct ops_list), GFP_KERNEL);
> +	if (!list)
> +		return -ENOMEM;
> +
> +	list->entry =3D entry;
> +	list_add(&list->head, head);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(disp_ops_register);
> +
> +struct device *sprd_disp_pipe_get_by_port(struct device *dev, int port=
)
> +{
> +	struct device_node *np =3D dev->of_node;
> +	struct device_node *endpoint;
> +	struct device_node *remote_node;
> +	struct platform_device *remote_pdev;
> +
> +	endpoint =3D of_graph_get_endpoint_by_regs(np, port, 0);
> +	if (!endpoint) {
> +		DRM_ERROR("%s/port%d/endpoint0 was not found\n",
> +			  np->full_name, port);
> +		return NULL;
> +	}
> +
> +	remote_node =3D of_graph_get_remote_port_parent(endpoint);
> +	if (!remote_node) {
> +		DRM_ERROR("device node was not found by endpoint0\n");
> +		return NULL;
> +	}
> +
> +	remote_pdev =3D of_find_device_by_node(remote_node);
> +	if (remote_pdev =3D=3D NULL) {
> +		DRM_ERROR("find %s platform device failed\n",
> +			  remote_node->full_name);
> +		return NULL;
> +	}
> +
> +	return &remote_pdev->dev;
> +}
> +EXPORT_SYMBOL_GPL(sprd_disp_pipe_get_by_port);
> +
> +struct device *sprd_disp_pipe_get_input(struct device *dev)
> +{
> +	return sprd_disp_pipe_get_by_port(dev, 1);
> +}
> +EXPORT_SYMBOL_GPL(sprd_disp_pipe_get_input);
> +
> +struct device *sprd_disp_pipe_get_output(struct device *dev)
> +{
> +	return sprd_disp_pipe_get_by_port(dev, 0);
> +}
> +EXPORT_SYMBOL_GPL(sprd_disp_pipe_get_output);
> +
> +MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
> +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
> +MODULE_DESCRIPTION("Unisoc display common API library");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/sprd/disp_lib.h b/drivers/gpu/drm/sprd/dis=
p_lib.h
> new file mode 100644
> index 0000000..7900b89
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/disp_lib.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
> + */
> +
> +#ifndef _DISP_LIB_H_
> +#define _DISP_LIB_H_
> +
> +#include <linux/list.h>
> +#include <drm/drm_print.h>
> +
> +#ifdef pr_fmt
> +#undef pr_fmt
> +#define pr_fmt(__fmt) "[drm][%20s] "__fmt, __func__
> +#endif
> +
> +struct ops_entry {
> +	const char *ver;
> +	void *ops;
> +};
> +
> +struct ops_list {
> +	struct list_head head;
> +	struct ops_entry *entry;
> +};
> +
> +int str_to_u32_array(const char *p, u32 base, u32 array[]);
> +int str_to_u8_array(const char *p, u32 base, u8 array[]);
> +int dump_bmp32(const char *p, u32 width, u32 height,
> +		bool bgra, const char *filename);
> +int load_dtb_to_mem(const char *name, void **blob);

The bitmap-loading code seems out of place in a driver. It should be a
helper. And efifb has similar code already. Is there an opportunity to
share the implementation?

I cannot find any caller of load_dtb_to_mem(). Where is it being used?

Best regards
Thomas

> +
> +void *disp_ops_attach(const char *str, struct list_head *head);
> +int disp_ops_register(struct ops_entry *entry, struct list_head *head)=
;
> +
> +struct device *sprd_disp_pipe_get_by_port(struct device *dev, int port=
);
> +struct device *sprd_disp_pipe_get_input(struct device *dev);
> +struct device *sprd_disp_pipe_get_output(struct device *dev);
> +
> +#endif
> diff --git a/drivers/gpu/drm/sprd/dpu/Makefile b/drivers/gpu/drm/sprd/d=
pu/Makefile
> new file mode 100644
> index 0000000..d960107
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/dpu/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +ifdef CONFIG_ARM64
> +KBUILD_CFLAGS +=3D -mstrict-align
> +endif
> +
> +obj-y +=3D dpu_r2p0.o
> +
> diff --git a/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c b/drivers/gpu/drm/sprd=
/dpu/dpu_r2p0.c
> new file mode 100644
> index 0000000..4c0a539
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
> @@ -0,0 +1,1464 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/wait.h>
> +#include <linux/workqueue.h>
> +#include "sprd_dpu.h"
> +
> +#define DISPC_INT_FBC_PLD_ERR_MASK	BIT(8)
> +#define DISPC_INT_FBC_HDR_ERR_MASK	BIT(9)
> +
> +#define DISPC_INT_MMU_INV_WR_MASK	BIT(19)
> +#define DISPC_INT_MMU_INV_RD_MASK	BIT(18)
> +#define DISPC_INT_MMU_VAOR_WR_MASK	BIT(17)
> +#define DISPC_INT_MMU_VAOR_RD_MASK	BIT(16)
> +
> +#define XFBC8888_HEADER_SIZE(w, h) (ALIGN((w) * (h) / (8 * 8) / 2, 128=
))
> +#define XFBC8888_PAYLOAD_SIZE(w, h) (w * h * 4)
> +#define XFBC8888_BUFFER_SIZE(w, h) (XFBC8888_HEADER_SIZE(w, h) \
> +				+ XFBC8888_PAYLOAD_SIZE(w, h))
> +
> +#define XFBC565_HEADER_SIZE(w, h) (ALIGN((w) * (h) / (16 * 8) / 2, 128=
))
> +#define XFBC565_PAYLOAD_SIZE(w, h) (w * h * 2)
> +#define XFBC565_BUFFER_SIZE(w, h) (XFBC565_HEADER_SIZE(w, h) \
> +				+ XFBC565_PAYLOAD_SIZE(w, h))
> +
> +#define SLP_BRIGHTNESS_THRESHOLD 0x20
> +
> +struct layer_reg {
> +	u32 addr[4];
> +	u32 ctrl;
> +	u32 size;
> +	u32 pitch;
> +	u32 pos;
> +	u32 alpha;
> +	u32 ck;
> +	u32 pallete;
> +	u32 crop_start;
> +};
> +
> +struct wb_region_reg {
> +	u32 pos;
> +	u32 size;
> +};
> +
> +struct dpu_reg {
> +	u32 dpu_version;
> +	u32 dpu_ctrl;
> +	u32 dpu_cfg0;
> +	u32 dpu_cfg1;
> +	u32 dpu_cfg2;
> +	u32 dpu_secure;
> +	u32 reserved_0x0018_0x001C[2];
> +	u32 panel_size;
> +	u32 blend_size;
> +	u32 reserved_0x0028;
> +	u32 bg_color;
> +	struct layer_reg layers[8];
> +	u32 wb_base_addr;
> +	u32 wb_ctrl;
> +	u32 wb_cfg;
> +	u32 wb_pitch;
> +	struct wb_region_reg region[3];
> +	u32 reserved_0x01D8_0x01DC[2];
> +	u32 dpu_int_en;
> +	u32 dpu_int_clr;
> +	u32 dpu_int_sts;
> +	u32 dpu_int_raw;
> +	u32 dpi_ctrl;
> +	u32 dpi_h_timing;
> +	u32 dpi_v_timing;
> +	u32 reserved_0x01FC;
> +	u32 dpu_enhance_cfg;
> +	u32 reserved_0x0204_0x020C[3];
> +	u32 epf_epsilon;
> +	u32 epf_gain0_3;
> +	u32 epf_gain4_7;
> +	u32 epf_diff;
> +	u32 reserved_0x0220_0x023C[8];
> +	u32 hsv_lut_addr;
> +	u32 hsv_lut_wdata;
> +	u32 hsv_lut_rdata;
> +	u32 reserved_0x024C_0x027C[13];
> +	u32 cm_coef01_00;
> +	u32 cm_coef03_02;
> +	u32 cm_coef11_10;
> +	u32 cm_coef13_12;
> +	u32 cm_coef21_20;
> +	u32 cm_coef23_22;
> +	u32 reserved_0x0298_0x02BC[10];
> +	u32 slp_cfg0;
> +	u32 slp_cfg1;
> +	u32 reserved_0x02C8_0x02FC[14];
> +	u32 gamma_lut_addr;
> +	u32 gamma_lut_wdata;
> +	u32 gamma_lut_rdata;
> +	u32 reserved_0x030C_0x033C[13];
> +	u32 checksum_en;
> +	u32 checksum0_start_pos;
> +	u32 checksum0_end_pos;
> +	u32 checksum1_start_pos;
> +	u32 checksum1_end_pos;
> +	u32 checksum0_result;
> +	u32 checksum1_result;
> +	u32 reserved_0x035C;
> +	u32 dpu_sts[18];
> +	u32 reserved_0x03A8_0x03AC[2];
> +	u32 dpu_fbc_cfg0;
> +	u32 dpu_fbc_cfg1;
> +	u32 reserved_0x03B8_0x03EC[14];
> +	u32 rf_ram_addr;
> +	u32 rf_ram_rdata_low;
> +	u32 rf_ram_rdata_high;
> +	u32 reserved_0x03FC_0x07FC[257];
> +	u32 mmu_en;
> +	u32 mmu_update;
> +	u32 mmu_min_vpn;
> +	u32 mmu_vpn_range;
> +	u32 mmu_pt_addr;
> +	u32 mmu_default_page;
> +	u32 mmu_vaor_addr_rd;
> +	u32 mmu_vaor_addr_wr;
> +	u32 mmu_inv_addr_rd;
> +	u32 mmu_inv_addr_wr;
> +	u32 mmu_uns_addr_rd;
> +	u32 mmu_uns_addr_wr;
> +	u32 mmu_miss_cnt;
> +	u32 mmu_pt_update_qos;
> +	u32 mmu_version;
> +	u32 mmu_min_ppn1;
> +	u32 mmu_ppn_range1;
> +	u32 mmu_min_ppn2;
> +	u32 mmu_ppn_range2;
> +	u32 mmu_vpn_paor_rd;
> +	u32 mmu_vpn_paor_wr;
> +	u32 mmu_ppn_paor_rd;
> +	u32 mmu_ppn_paor_wr;
> +	u32 mmu_reg_au_manage;
> +	u32 mmu_page_rd_ch;
> +	u32 mmu_page_wr_ch;
> +	u32 mmu_read_page_cmd_cnt;
> +	u32 mmu_read_page_latency_cnt;
> +	u32 mmu_page_max_latency;
> +};
> +
> +struct wb_region {
> +	u32 index;
> +	u16 pos_x;
> +	u16 pos_y;
> +	u16 size_w;
> +	u16 size_h;
> +};
> +
> +struct enhance_module {
> +	u32 scl_en: 1;
> +	u32 epf_en: 1;
> +	u32 hsv_en: 1;
> +	u32 cm_en: 1;
> +	u32 slp_en: 1;
> +	u32 gamma_en: 1;
> +	u32 blp_en: 1;
> +};
> +
> +struct scale_cfg {
> +	u32 in_w;
> +	u32 in_h;
> +};
> +
> +struct epf_cfg {
> +	u16 epsilon0;
> +	u16 epsilon1;
> +	u8 gain0;
> +	u8 gain1;
> +	u8 gain2;
> +	u8 gain3;
> +	u8 gain4;
> +	u8 gain5;
> +	u8 gain6;
> +	u8 gain7;
> +	u8 max_diff;
> +	u8 min_diff;
> +};
> +
> +struct hsv_entry {
> +	u16 hue;
> +	u16 sat;
> +};
> +
> +struct hsv_lut {
> +	struct hsv_entry table[360];
> +};
> +
> +struct gamma_entry {
> +	u16 r;
> +	u16 g;
> +	u16 b;
> +};
> +
> +struct gamma_lut {
> +	u16 r[256];
> +	u16 g[256];
> +	u16 b[256];
> +};
> +
> +struct cm_cfg {
> +	short coef00;
> +	short coef01;
> +	short coef02;
> +	short coef03;
> +	short coef10;
> +	short coef11;
> +	short coef12;
> +	short coef13;
> +	short coef20;
> +	short coef21;
> +	short coef22;
> +	short coef23;
> +};
> +
> +struct slp_cfg {
> +	u8 brightness;
> +	u8 conversion_matrix;
> +	u8 brightness_step;
> +	u8 second_bright_factor;
> +	u8 first_percent_th;
> +	u8 first_max_bright_th;
> +};
> +
> +static struct scale_cfg scale_copy;
> +static struct cm_cfg cm_copy;
> +static struct slp_cfg slp_copy;
> +static struct gamma_lut gamma_copy;
> +static struct hsv_lut hsv_copy;
> +static struct epf_cfg epf_copy;
> +static u32 enhance_en;
> +
> +static DECLARE_WAIT_QUEUE_HEAD(wait_queue);
> +static bool panel_ready =3D true;
> +static bool need_scale;
> +static bool mode_changed;
> +static bool evt_update;
> +static bool evt_stop;
> +static u32 prev_y2r_coef;
> +
> +static void dpu_sr_config(struct dpu_context *ctx);
> +static void dpu_enhance_reload(struct dpu_context *ctx);
> +static void dpu_clean_all(struct dpu_context *ctx);
> +static void dpu_layer(struct dpu_context *ctx,
> +		    struct sprd_dpu_layer *hwlayer);
> +
> +static u32 dpu_get_version(struct dpu_context *ctx)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +
> +	return reg->dpu_version;
> +}
> +
> +static bool dpu_check_raw_int(struct dpu_context *ctx, u32 mask)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +	u32 val;
> +
> +	down(&ctx->refresh_lock);
> +	if (!ctx->is_inited) {
> +		up(&ctx->refresh_lock);
> +		pr_err("dpu is not initialized\n");
> +		return false;
> +	}
> +
> +	val =3D reg->dpu_int_raw;
> +	up(&ctx->refresh_lock);
> +
> +	if (val & mask)
> +		return true;
> +
> +	pr_err("dpu_int_raw:0x%x\n", val);
> +	return false;
> +}
> +
> +static int dpu_parse_dt(struct dpu_context *ctx,
> +				struct device_node *np)
> +{
> +	return 0;
> +}
> +
> +static void dpu_dump(struct dpu_context *ctx)
> +{
> +	u32 *reg =3D (u32 *)ctx->base;
> +	int i;
> +
> +	pr_info("      0          4          8          C\n");
> +	for (i =3D 0; i < 256; i +=3D 4) {
> +		pr_info("%04x: 0x%08x 0x%08x 0x%08x 0x%08x\n",
> +			i * 4, reg[i], reg[i + 1], reg[i + 2], reg[i + 3]);
> +	}
> +}
> +
> +static u32 check_mmu_isr(struct dpu_context *ctx, u32 reg_val)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +	u32 mmu_mask =3D DISPC_INT_MMU_VAOR_RD_MASK |
> +			DISPC_INT_MMU_VAOR_WR_MASK |
> +			DISPC_INT_MMU_INV_RD_MASK |
> +			DISPC_INT_MMU_INV_WR_MASK;
> +	u32 val =3D reg_val & mmu_mask;
> +
> +	if (val) {
> +		pr_err("--- iommu interrupt err: 0x%04x ---\n", val);
> +
> +		pr_err("iommu invalid read error, addr: 0x%08x\n",
> +			reg->mmu_inv_addr_rd);
> +		pr_err("iommu invalid write error, addr: 0x%08x\n",
> +			reg->mmu_inv_addr_wr);
> +		pr_err("iommu va out of range read error, addr: 0x%08x\n",
> +			reg->mmu_vaor_addr_rd);
> +		pr_err("iommu va out of range write error, addr: 0x%08x\n",
> +			reg->mmu_vaor_addr_wr);
> +		pr_err("BUG: iommu failure at %s:%d/%s()!\n",
> +			__FILE__, __LINE__, __func__);
> +
> +		dpu_dump(ctx);
> +	}
> +
> +	return val;
> +}
> +
> +static u32 dpu_isr(struct dpu_context *ctx)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +	u32 reg_val, int_mask =3D 0;
> +
> +	reg_val =3D reg->dpu_int_sts;
> +
> +	/* disable err interrupt */
> +	if (reg_val & DISPC_INT_ERR_MASK)
> +		int_mask |=3D DISPC_INT_ERR_MASK;
> +
> +	/* dpu update done isr */
> +	if (reg_val & DISPC_INT_UPDATE_DONE_MASK) {
> +		evt_update =3D true;
> +		wake_up_interruptible_all(&wait_queue);
> +	}
> +
> +	/* dpu stop done isr */
> +	if (reg_val & DISPC_INT_DONE_MASK) {
> +		evt_stop =3D true;
> +		wake_up_interruptible_all(&wait_queue);
> +	}
> +
> +	/* dpu ifbc payload error isr */
> +	if (reg_val & DISPC_INT_FBC_PLD_ERR_MASK) {
> +		int_mask |=3D DISPC_INT_FBC_PLD_ERR_MASK;
> +		pr_err("dpu ifbc payload error\n");
> +	}
> +
> +	/* dpu ifbc header error isr */
> +	if (reg_val & DISPC_INT_FBC_HDR_ERR_MASK) {
> +		int_mask |=3D DISPC_INT_FBC_HDR_ERR_MASK;
> +		pr_err("dpu ifbc header error\n");
> +	}
> +
> +	int_mask |=3D check_mmu_isr(ctx, reg_val);
> +
> +	reg->dpu_int_clr =3D reg_val;
> +	reg->dpu_int_en &=3D ~int_mask;
> +
> +	return reg_val;
> +}
> +
> +static int dpu_wait_stop_done(struct dpu_context *ctx)
> +{
> +	int rc;
> +
> +	if (ctx->is_stopped)
> +		return 0;
> +
> +	rc =3D wait_event_interruptible_timeout(wait_queue, evt_stop,
> +					       msecs_to_jiffies(500));
> +	evt_stop =3D false;
> +
> +	ctx->is_stopped =3D true;
> +
> +	if (!rc) {
> +		pr_err("dpu wait for stop done time out!\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dpu_wait_update_done(struct dpu_context *ctx)
> +{
> +	int rc;
> +
> +	evt_update =3D false;
> +
> +	rc =3D wait_event_interruptible_timeout(wait_queue, evt_update,
> +					       msecs_to_jiffies(500));
> +
> +	if (!rc) {
> +		pr_err("dpu wait for reg update done time out!\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static void dpu_stop(struct dpu_context *ctx)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +
> +	if (ctx->if_type =3D=3D SPRD_DISPC_IF_DPI)
> +		reg->dpu_ctrl |=3D BIT(1);
> +
> +	dpu_wait_stop_done(ctx);
> +	pr_info("dpu stop\n");
> +}
> +
> +static void dpu_run(struct dpu_context *ctx)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +
> +	reg->dpu_ctrl |=3D BIT(0);
> +
> +	ctx->is_stopped =3D false;
> +
> +	pr_info("dpu run\n");
> +
> +	if (ctx->if_type =3D=3D SPRD_DISPC_IF_EDPI) {
> +		/*
> +		 * If the panel read GRAM speed faster than
> +		 * DSI write GRAM speed, it will display some
> +		 * mass on screen when backlight on. So wait
> +		 * a TE period after flush the GRAM.
> +		 */
> +		if (!panel_ready) {
> +			dpu_wait_stop_done(ctx);
> +			/* wait for TE again */
> +			mdelay(20);
> +			panel_ready =3D true;
> +		}
> +	}
> +}
> +
> +static int dpu_init(struct dpu_context *ctx)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +	u32 size;
> +
> +	reg->bg_color =3D 0;
> +
> +	size =3D (ctx->vm.vactive << 16) | ctx->vm.hactive;
> +	reg->panel_size =3D size;
> +	reg->blend_size =3D size;
> +
> +	reg->dpu_cfg0 =3D BIT(4) | BIT(5);
> +	prev_y2r_coef =3D 3;
> +
> +	reg->dpu_cfg1 =3D 0x004466da;
> +	reg->dpu_cfg2 =3D 0;
> +
> +	if (ctx->is_stopped)
> +		dpu_clean_all(ctx);
> +
> +	reg->mmu_en =3D 0;
> +	reg->mmu_min_ppn1 =3D 0;
> +	reg->mmu_ppn_range1 =3D 0xffff;
> +	reg->mmu_min_ppn2 =3D 0;
> +	reg->mmu_ppn_range2 =3D 0xffff;
> +	reg->mmu_vpn_range =3D 0x1ffff;
> +
> +	reg->dpu_int_clr =3D 0xffff;
> +
> +	dpu_enhance_reload(ctx);
> +
> +	return 0;
> +}
> +
> +static void dpu_uninit(struct dpu_context *ctx)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +
> +	reg->dpu_int_en =3D 0;
> +	reg->dpu_int_clr =3D 0xff;
> +
> +	panel_ready =3D false;
> +}
> +
> +enum {
> +	DPU_LAYER_FORMAT_YUV422_2PLANE,
> +	DPU_LAYER_FORMAT_YUV420_2PLANE,
> +	DPU_LAYER_FORMAT_YUV420_3PLANE,
> +	DPU_LAYER_FORMAT_ARGB8888,
> +	DPU_LAYER_FORMAT_RGB565,
> +	DPU_LAYER_FORMAT_XFBC_ARGB8888 =3D 8,
> +	DPU_LAYER_FORMAT_XFBC_RGB565,
> +	DPU_LAYER_FORMAT_MAX_TYPES,
> +};
> +
> +enum {
> +	DPU_LAYER_ROTATION_0,
> +	DPU_LAYER_ROTATION_90,
> +	DPU_LAYER_ROTATION_180,
> +	DPU_LAYER_ROTATION_270,
> +	DPU_LAYER_ROTATION_0_M,
> +	DPU_LAYER_ROTATION_90_M,
> +	DPU_LAYER_ROTATION_180_M,
> +	DPU_LAYER_ROTATION_270_M,
> +};
> +
> +static u32 to_dpu_rotation(u32 angle)
> +{
> +	u32 rot =3D DPU_LAYER_ROTATION_0;
> +
> +	switch (angle) {
> +	case 0:
> +	case DRM_MODE_ROTATE_0:
> +		rot =3D DPU_LAYER_ROTATION_0;
> +		break;
> +	case DRM_MODE_ROTATE_90:
> +		rot =3D DPU_LAYER_ROTATION_90;
> +		break;
> +	case DRM_MODE_ROTATE_180:
> +		rot =3D DPU_LAYER_ROTATION_180;
> +		break;
> +	case DRM_MODE_ROTATE_270:
> +		rot =3D DPU_LAYER_ROTATION_270;
> +		break;
> +	case DRM_MODE_REFLECT_Y:
> +		rot =3D DPU_LAYER_ROTATION_180_M;
> +		break;
> +	case (DRM_MODE_REFLECT_Y | DRM_MODE_ROTATE_90):
> +		rot =3D DPU_LAYER_ROTATION_90_M;
> +		break;
> +	case DRM_MODE_REFLECT_X:
> +		rot =3D DPU_LAYER_ROTATION_0_M;
> +		break;
> +	case (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_90):
> +		rot =3D DPU_LAYER_ROTATION_270_M;
> +		break;
> +	default:
> +		pr_err("rotation convert unsupport angle (drm)=3D 0x%x\n", angle);
> +		break;
> +	}
> +
> +	return rot;
> +}
> +
> +static u32 dpu_img_ctrl(u32 format, u32 blending, u32 compression, u32=
 rotation)
> +{
> +	int reg_val =3D 0;
> +
> +	/* layer enable */
> +	reg_val |=3D BIT(0);
> +
> +	switch (format) {
> +	case DRM_FORMAT_BGRA8888:
> +		/* BGRA8888 -> ARGB8888 */
> +		reg_val |=3D SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 8;
> +		if (compression)
> +			/* XFBC-ARGB8888 */
> +			reg_val |=3D (DPU_LAYER_FORMAT_XFBC_ARGB8888 << 4);
> +		else
> +			reg_val |=3D (DPU_LAYER_FORMAT_ARGB8888 << 4);
> +		break;
> +	case DRM_FORMAT_RGBX8888:
> +	case DRM_FORMAT_RGBA8888:
> +		/* RGBA8888 -> ABGR8888 */
> +		reg_val |=3D SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 8;
> +	case DRM_FORMAT_ABGR8888:
> +		/* rb switch */
> +		reg_val |=3D BIT(10);
> +	case DRM_FORMAT_ARGB8888:
> +		if (compression)
> +			/* XFBC-ARGB8888 */
> +			reg_val |=3D (DPU_LAYER_FORMAT_XFBC_ARGB8888 << 4);
> +		else
> +			reg_val |=3D (DPU_LAYER_FORMAT_ARGB8888 << 4);
> +		break;
> +	case DRM_FORMAT_XBGR8888:
> +		/* rb switch */
> +		reg_val |=3D BIT(10);
> +	case DRM_FORMAT_XRGB8888:
> +		if (compression)
> +			/* XFBC-ARGB8888 */
> +			reg_val |=3D (DPU_LAYER_FORMAT_XFBC_ARGB8888 << 4);
> +		else
> +			reg_val |=3D (DPU_LAYER_FORMAT_ARGB8888 << 4);
> +		break;
> +	case DRM_FORMAT_BGR565:
> +		/* rb switch */
> +		reg_val |=3D BIT(10);
> +	case DRM_FORMAT_RGB565:
> +		if (compression)
> +			/* XFBC-RGB565 */
> +			reg_val |=3D (DPU_LAYER_FORMAT_XFBC_RGB565 << 4);
> +		else
> +			reg_val |=3D (DPU_LAYER_FORMAT_RGB565 << 4);
> +		break;
> +	case DRM_FORMAT_NV12:
> +		/* 2-Lane: Yuv420 */
> +		reg_val |=3D DPU_LAYER_FORMAT_YUV420_2PLANE << 4;
> +		/* Y endian */
> +		reg_val |=3D SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> +		/* UV endian */
> +		reg_val |=3D SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 10;
> +		break;
> +	case DRM_FORMAT_NV21:
> +		/* 2-Lane: Yuv420 */
> +		reg_val |=3D DPU_LAYER_FORMAT_YUV420_2PLANE << 4;
> +		/* Y endian */
> +		reg_val |=3D SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> +		/* UV endian */
> +		reg_val |=3D SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 10;
> +		break;
> +	case DRM_FORMAT_NV16:
> +		/* 2-Lane: Yuv422 */
> +		reg_val |=3D DPU_LAYER_FORMAT_YUV422_2PLANE << 4;
> +		/* Y endian */
> +		reg_val |=3D SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 8;
> +		/* UV endian */
> +		reg_val |=3D SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 10;
> +		break;
> +	case DRM_FORMAT_NV61:
> +		/* 2-Lane: Yuv422 */
> +		reg_val |=3D DPU_LAYER_FORMAT_YUV422_2PLANE << 4;
> +		/* Y endian */
> +		reg_val |=3D SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> +		/* UV endian */
> +		reg_val |=3D SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 10;
> +		break;
> +	case DRM_FORMAT_YUV420:
> +		reg_val |=3D DPU_LAYER_FORMAT_YUV420_3PLANE << 4;
> +		/* Y endian */
> +		reg_val |=3D SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> +		/* UV endian */
> +		reg_val |=3D SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 10;
> +		break;
> +	case DRM_FORMAT_YVU420:
> +		reg_val |=3D DPU_LAYER_FORMAT_YUV420_3PLANE << 4;
> +		/* Y endian */
> +		reg_val |=3D SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> +		/* UV endian */
> +		reg_val |=3D SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 10;
> +		break;
> +	default:
> +		pr_err("error: invalid format %c%c%c%c\n", format,
> +						format >> 8,
> +						format >> 16,
> +						format >> 24);
> +		break;
> +	}
> +
> +	switch (blending) {
> +	case DRM_MODE_BLEND_PIXEL_NONE:
> +		/* don't do blending, maybe RGBX */
> +		/* alpha mode select - layer alpha */
> +		reg_val |=3D BIT(2);
> +		break;
> +	case DRM_MODE_BLEND_COVERAGE:
> +		/* alpha mode select - combo alpha */
> +		reg_val |=3D BIT(3);
> +		/*Normal mode*/
> +		reg_val &=3D (~BIT(16));
> +		break;
> +	case DRM_MODE_BLEND_PREMULTI:
> +		/* alpha mode select - combo alpha */
> +		reg_val |=3D BIT(3);
> +		/*Pre-mult mode*/
> +		reg_val |=3D BIT(16);
> +		break;
> +	default:
> +		/* alpha mode select - layer alpha */
> +		reg_val |=3D BIT(2);
> +		break;
> +	}
> +
> +	rotation =3D to_dpu_rotation(rotation);
> +	reg_val |=3D (rotation & 0x7) << 20;
> +
> +	return reg_val;
> +}
> +
> +static int check_layer_y2r_coef(struct sprd_dpu_layer layers[], u8 cou=
nt)
> +{
> +	int i;
> +
> +	for (i =3D (count - 1); i >=3D 0; i--) {
> +		switch (layers[i].format) {
> +		case DRM_FORMAT_NV12:
> +		case DRM_FORMAT_NV21:
> +		case DRM_FORMAT_NV16:
> +		case DRM_FORMAT_NV61:
> +		case DRM_FORMAT_YUV420:
> +		case DRM_FORMAT_YVU420:
> +			if (layers[i].y2r_coef =3D=3D prev_y2r_coef)
> +				return -EINVAL;
> +
> +			/* need to config dpu y2r coef */
> +			prev_y2r_coef =3D layers[i].y2r_coef;
> +			return prev_y2r_coef;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	/* not find yuv layer */
> +	return -EINVAL;
> +}
> +
> +static void dpu_clean_all(struct dpu_context *ctx)
> +{
> +	int i;
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +
> +	for (i =3D 0; i < 8; i++)
> +		reg->layers[i].ctrl =3D 0;
> +}
> +
> +static void dpu_bgcolor(struct dpu_context *ctx, u32 color)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +
> +	if (ctx->if_type =3D=3D SPRD_DISPC_IF_EDPI)
> +		dpu_wait_stop_done(ctx);
> +
> +	reg->bg_color =3D color;
> +
> +	dpu_clean_all(ctx);
> +
> +	if ((ctx->if_type =3D=3D SPRD_DISPC_IF_DPI) && !ctx->is_stopped) {
> +		reg->dpu_ctrl |=3D BIT(2);
> +		dpu_wait_update_done(ctx);
> +	} else if (ctx->if_type =3D=3D SPRD_DISPC_IF_EDPI) {
> +		reg->dpu_ctrl |=3D BIT(0);
> +		ctx->is_stopped =3D false;
> +	}
> +}
> +
> +static void dpu_layer(struct dpu_context *ctx,
> +		    struct sprd_dpu_layer *hwlayer)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +	const struct drm_format_info *info;
> +	struct layer_reg *layer;
> +	u32 addr, size, offset;
> +	int i;
> +
> +	layer =3D &reg->layers[hwlayer->index];
> +	offset =3D (hwlayer->dst_x & 0xffff) | ((hwlayer->dst_y) << 16);
> +
> +	if (hwlayer->pallete_en) {
> +		size =3D (hwlayer->dst_w & 0xffff) | ((hwlayer->dst_h) << 16);
> +		layer->pos =3D offset;
> +		layer->size =3D size;
> +		layer->alpha =3D hwlayer->alpha;
> +		layer->pallete =3D hwlayer->pallete_color;
> +
> +		/* pallete layer enable */
> +		layer->ctrl =3D 0x1005;
> +
> +		pr_debug("dst_x =3D %d, dst_y =3D %d, dst_w =3D %d, dst_h =3D %d\n",=

> +			hwlayer->dst_x, hwlayer->dst_y,
> +			hwlayer->dst_w, hwlayer->dst_h);
> +		return;
> +	}
> +
> +	if (hwlayer->src_w && hwlayer->src_h)
> +		size =3D (hwlayer->src_w & 0xffff) | ((hwlayer->src_h) << 16);
> +	else
> +		size =3D (hwlayer->dst_w & 0xffff) | ((hwlayer->dst_h) << 16);
> +
> +	for (i =3D 0; i < hwlayer->planes; i++) {
> +		addr =3D hwlayer->addr[i];
> +
> +		/* dpu r2p0 just support xfbc-rgb */
> +		if (hwlayer->xfbc)
> +			addr +=3D hwlayer->header_size_r;
> +
> +		if (addr % 16)
> +			pr_err("layer addr[%d] is not 16 bytes align, it's 0x%08x\n",
> +				i, addr);
> +		layer->addr[i] =3D addr;
> +	}
> +
> +	layer->pos =3D offset;
> +	layer->size =3D size;
> +	layer->crop_start =3D (hwlayer->src_y << 16) | hwlayer->src_x;
> +	layer->alpha =3D hwlayer->alpha;
> +
> +	info =3D drm_format_info(hwlayer->format);
> +	if (info->cpp[0] =3D=3D 0) {
> +		pr_err("layer[%d] bytes per pixel is invalid\n", hwlayer->index);
> +		return;
> +	}
> +
> +	if (hwlayer->planes =3D=3D 3)
> +		/* UV pitch is 1/2 of Y pitch*/
> +		layer->pitch =3D (hwlayer->pitch[0] / info->cpp[0]) |
> +				(hwlayer->pitch[0] / info->cpp[0] << 15);
> +	else
> +		layer->pitch =3D hwlayer->pitch[0] / info->cpp[0];
> +
> +	layer->ctrl =3D dpu_img_ctrl(hwlayer->format, hwlayer->blending,
> +		hwlayer->xfbc, hwlayer->rotation);
> +
> +	pr_debug("dst_x =3D %d, dst_y =3D %d, dst_w =3D %d, dst_h =3D %d\n",
> +				hwlayer->dst_x, hwlayer->dst_y,
> +				hwlayer->dst_w, hwlayer->dst_h);
> +	pr_debug("start_x =3D %d, start_y =3D %d, start_w =3D %d, start_h =3D=
 %d\n",
> +				hwlayer->src_x, hwlayer->src_y,
> +				hwlayer->src_w, hwlayer->src_h);
> +}
> +
> +static void dpu_scaling(struct dpu_context *ctx,
> +			struct sprd_dpu_layer layers[], u8 count)
> +{
> +	int i;
> +	struct sprd_dpu_layer *top_layer;
> +
> +	if (mode_changed) {
> +		top_layer =3D &layers[count - 1];
> +		pr_debug("------------------------------------\n");
> +		for (i =3D 0; i < count; i++) {
> +			pr_debug("layer[%d] : %dx%d --- (%d)\n", i,
> +				layers[i].dst_w, layers[i].dst_h,
> +				scale_copy.in_w);
> +		}
> +
> +		if  (top_layer->dst_w <=3D scale_copy.in_w) {
> +			dpu_sr_config(ctx);
> +			mode_changed =3D false;
> +
> +			pr_info("do scaling enhace: 0x%x, top layer(%dx%d)\n",
> +				enhance_en, top_layer->dst_w,
> +				top_layer->dst_h);
> +		}
> +	}
> +}
> +
> +static void dpu_flip(struct dpu_context *ctx,
> +		     struct sprd_dpu_layer layers[], u8 count)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +	int i;
> +	int y2r_coef;
> +
> +	/*
> +	 * Make sure the dpu is in stop status. DPU_R2P0 has no shadow
> +	 * registers in EDPI mode. So the config registers can only be
> +	 * updated in the rising edge of DPU_RUN bit.
> +	 */
> +	if (ctx->if_type =3D=3D SPRD_DISPC_IF_EDPI)
> +		dpu_wait_stop_done(ctx);
> +
> +	/* set Y2R conversion coef */
> +	y2r_coef =3D check_layer_y2r_coef(layers, count);
> +	if (y2r_coef >=3D 0) {
> +		/* write dpu_cfg0 register after dpu is in idle status */
> +		if (ctx->if_type =3D=3D SPRD_DISPC_IF_DPI)
> +			dpu_stop(ctx);
> +
> +		reg->dpu_cfg0 &=3D ~(0x7 << 4);
> +		reg->dpu_cfg0 |=3D (y2r_coef << 4);
> +	}
> +
> +	/* reset the bgcolor to black */
> +	reg->bg_color =3D 0;
> +
> +	/* disable all the layers */
> +	dpu_clean_all(ctx);
> +
> +	/* to check if dpu need scaling the frame for SR */
> +	dpu_scaling(ctx, layers, count);
> +
> +	/* start configure dpu layers */
> +	for (i =3D 0; i < count; i++)
> +		dpu_layer(ctx, &layers[i]);
> +
> +	/* update trigger and wait */
> +	if (ctx->if_type =3D=3D SPRD_DISPC_IF_DPI) {
> +		if (!ctx->is_stopped) {
> +			reg->dpu_ctrl |=3D BIT(2);
> +			dpu_wait_update_done(ctx);
> +		} else if (y2r_coef >=3D 0) {
> +			reg->dpu_ctrl |=3D BIT(0);
> +			ctx->is_stopped =3D false;
> +			pr_info("dpu start\n");
> +		}
> +
> +		reg->dpu_int_en |=3D DISPC_INT_ERR_MASK;
> +
> +	} else if (ctx->if_type =3D=3D SPRD_DISPC_IF_EDPI) {
> +		reg->dpu_ctrl |=3D BIT(0);
> +
> +		ctx->is_stopped =3D false;
> +	}
> +
> +	/*
> +	 * If the following interrupt was disabled in isr,
> +	 * re-enable it.
> +	 */
> +	reg->dpu_int_en |=3D DISPC_INT_FBC_PLD_ERR_MASK |
> +			   DISPC_INT_FBC_HDR_ERR_MASK |
> +			   DISPC_INT_MMU_VAOR_RD_MASK |
> +			   DISPC_INT_MMU_VAOR_WR_MASK |
> +			   DISPC_INT_MMU_INV_RD_MASK |
> +			   DISPC_INT_MMU_INV_WR_MASK;
> +}
> +
> +static void dpu_dpi_init(struct dpu_context *ctx)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +	u32 int_mask =3D 0;
> +
> +	if (ctx->if_type =3D=3D SPRD_DISPC_IF_DPI) {
> +		/* use dpi as interface */
> +		reg->dpu_cfg0 &=3D ~BIT(0);
> +
> +		/* disable Halt function for SPRD DSI */
> +		reg->dpi_ctrl &=3D ~BIT(16);
> +
> +		/* select te from external pad */
> +		reg->dpi_ctrl |=3D BIT(10);
> +
> +		/* set dpi timing */
> +		reg->dpi_h_timing =3D (ctx->vm.hsync_len << 0) |
> +				    (ctx->vm.hback_porch << 8) |
> +				    (ctx->vm.hfront_porch << 20);
> +		reg->dpi_v_timing =3D (ctx->vm.vsync_len << 0) |
> +				    (ctx->vm.vback_porch << 8) |
> +				    (ctx->vm.vfront_porch << 20);
> +		if (ctx->vm.vsync_len + ctx->vm.vback_porch < 32)
> +			pr_warn("Warning: (vsync + vbp) < 32, "
> +				"underflow risk!\n");
> +
> +		/* enable dpu update done INT */
> +		int_mask |=3D DISPC_INT_UPDATE_DONE_MASK;
> +		/* enable dpu DONE  INT */
> +		int_mask |=3D DISPC_INT_DONE_MASK;
> +		/* enable dpu dpi vsync */
> +		int_mask |=3D DISPC_INT_DPI_VSYNC_MASK;
> +		/* enable dpu TE INT */
> +		int_mask |=3D DISPC_INT_TE_MASK;
> +		/* enable underflow err INT */
> +		int_mask |=3D DISPC_INT_ERR_MASK;
> +		/* enable write back done INT */
> +		int_mask |=3D DISPC_INT_WB_DONE_MASK;
> +		/* enable write back fail INT */
> +		int_mask |=3D DISPC_INT_WB_FAIL_MASK;
> +
> +	} else if (ctx->if_type =3D=3D SPRD_DISPC_IF_EDPI) {
> +		/* use edpi as interface */
> +		reg->dpu_cfg0 |=3D BIT(0);
> +
> +		/* use external te */
> +		reg->dpi_ctrl |=3D BIT(10);
> +
> +		/* enable te */
> +		reg->dpi_ctrl |=3D BIT(8);
> +
> +		/* enable stop DONE INT */
> +		int_mask |=3D DISPC_INT_DONE_MASK;
> +		/* enable TE INT */
> +		int_mask |=3D DISPC_INT_TE_MASK;
> +	}
> +
> +	/* enable ifbc payload error INT */
> +	int_mask |=3D DISPC_INT_FBC_PLD_ERR_MASK;
> +	/* enable ifbc header error INT */
> +	int_mask |=3D DISPC_INT_FBC_HDR_ERR_MASK;
> +	/* enable iommu va out of range read error INT */
> +	int_mask |=3D DISPC_INT_MMU_VAOR_RD_MASK;
> +	/* enable iommu va out of range write error INT */
> +	int_mask |=3D DISPC_INT_MMU_VAOR_WR_MASK;
> +	/* enable iommu invalid read error INT */
> +	int_mask |=3D DISPC_INT_MMU_INV_RD_MASK;
> +	/* enable iommu invalid write error INT */
> +	int_mask |=3D DISPC_INT_MMU_INV_WR_MASK;
> +
> +	reg->dpu_int_en =3D int_mask;
> +}
> +
> +static void enable_vsync(struct dpu_context *ctx)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +
> +	reg->dpu_int_en |=3D DISPC_INT_DPI_VSYNC_MASK;
> +}
> +
> +static void disable_vsync(struct dpu_context *ctx)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +
> +	reg->dpu_int_en &=3D ~DISPC_INT_DPI_VSYNC_MASK;
> +}
> +
> +static void dpu_enhance_backup(u32 id, void *param)
> +{
> +	u32 *p;
> +
> +	switch (id) {
> +	case ENHANCE_CFG_ID_ENABLE:
> +		p =3D param;
> +		enhance_en |=3D *p;
> +		pr_info("enhance enable backup: 0x%x\n", *p);
> +		break;
> +	case ENHANCE_CFG_ID_DISABLE:
> +		p =3D param;
> +		enhance_en &=3D ~(*p);
> +		if (*p & BIT(1))
> +			memset(&epf_copy, 0, sizeof(epf_copy));
> +		pr_info("enhance disable backup: 0x%x\n", *p);
> +		break;
> +	case ENHANCE_CFG_ID_SCL:
> +		memcpy(&scale_copy, param, sizeof(scale_copy));
> +		enhance_en |=3D BIT(0);
> +		pr_info("enhance scaling backup\n");
> +		break;
> +	case ENHANCE_CFG_ID_HSV:
> +		memcpy(&hsv_copy, param, sizeof(hsv_copy));
> +		enhance_en |=3D BIT(2);
> +		pr_info("enhance hsv backup\n");
> +		break;
> +	case ENHANCE_CFG_ID_CM:
> +		memcpy(&cm_copy, param, sizeof(cm_copy));
> +		enhance_en |=3D BIT(3);
> +		pr_info("enhance cm backup\n");
> +		break;
> +	case ENHANCE_CFG_ID_SLP:
> +		memcpy(&slp_copy, param, sizeof(slp_copy));
> +		enhance_en |=3D BIT(4);
> +		pr_info("enhance slp backup\n");
> +		break;
> +	case ENHANCE_CFG_ID_GAMMA:
> +		memcpy(&gamma_copy, param, sizeof(gamma_copy));
> +		enhance_en |=3D BIT(5);
> +		pr_info("enhance gamma backup\n");
> +		break;
> +	case ENHANCE_CFG_ID_EPF:
> +		memcpy(&epf_copy, param, sizeof(epf_copy));
> +		if ((slp_copy.brightness > SLP_BRIGHTNESS_THRESHOLD) ||
> +			(enhance_en & BIT(0))) {
> +			enhance_en |=3D BIT(1);
> +			pr_info("enhance epf backup\n");
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static void dpu_epf_set(struct dpu_reg *reg, struct epf_cfg *epf)
> +{
> +	reg->epf_epsilon =3D (epf->epsilon1 << 16) | epf->epsilon0;
> +	reg->epf_gain0_3 =3D (epf->gain3 << 24) | (epf->gain2 << 16) |
> +			   (epf->gain1 << 8) | epf->gain0;
> +	reg->epf_gain4_7 =3D (epf->gain7 << 24) | (epf->gain6 << 16) |
> +			   (epf->gain5 << 8) | epf->gain4;
> +	reg->epf_diff =3D (epf->max_diff << 8) | epf->min_diff;
> +}
> +
> +static void dpu_enhance_set(struct dpu_context *ctx, u32 id, void *par=
am)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +	struct scale_cfg *scale;
> +	struct cm_cfg *cm;
> +	struct slp_cfg *slp;
> +	struct gamma_lut *gamma;
> +	struct hsv_lut *hsv;
> +	struct epf_cfg *epf;
> +	u32 *p, i;
> +
> +	if (!ctx->is_inited) {
> +		dpu_enhance_backup(id, param);
> +		return;
> +	}
> +
> +	if (ctx->if_type =3D=3D SPRD_DISPC_IF_EDPI)
> +		dpu_wait_stop_done(ctx);
> +
> +	switch (id) {
> +	case ENHANCE_CFG_ID_ENABLE:
> +		p =3D param;
> +		reg->dpu_enhance_cfg |=3D *p;
> +		pr_info("enhance module enable: 0x%x\n", *p);
> +		break;
> +	case ENHANCE_CFG_ID_DISABLE:
> +		p =3D param;
> +		reg->dpu_enhance_cfg &=3D ~(*p);
> +		if (*p & BIT(1))
> +			memset(&epf_copy, 0, sizeof(epf_copy));
> +		pr_info("enhance module disable: 0x%x\n", *p);
> +		break;
> +	case ENHANCE_CFG_ID_SCL:
> +		memcpy(&scale_copy, param, sizeof(scale_copy));
> +		scale =3D &scale_copy;
> +		reg->blend_size =3D (scale->in_h << 16) | scale->in_w;
> +		reg->dpu_enhance_cfg |=3D BIT(0);
> +		pr_info("enhance scaling: %ux%u\n", scale->in_w, scale->in_h);
> +		break;
> +	case ENHANCE_CFG_ID_HSV:
> +		memcpy(&hsv_copy, param, sizeof(hsv_copy));
> +		hsv =3D &hsv_copy;
> +		for (i =3D 0; i < 360; i++) {
> +			reg->hsv_lut_addr =3D i;
> +			udelay(1);
> +			reg->hsv_lut_wdata =3D (hsv->table[i].sat << 16) |
> +						hsv->table[i].hue;
> +		}
> +		reg->dpu_enhance_cfg |=3D BIT(2);
> +		pr_info("enhance hsv set\n");
> +		break;
> +	case ENHANCE_CFG_ID_CM:
> +		memcpy(&cm_copy, param, sizeof(cm_copy));
> +		cm =3D &cm_copy;
> +		reg->cm_coef01_00 =3D (cm->coef01 << 16) | cm->coef00;
> +		reg->cm_coef03_02 =3D (cm->coef03 << 16) | cm->coef02;
> +		reg->cm_coef11_10 =3D (cm->coef11 << 16) | cm->coef10;
> +		reg->cm_coef13_12 =3D (cm->coef13 << 16) | cm->coef12;
> +		reg->cm_coef21_20 =3D (cm->coef21 << 16) | cm->coef20;
> +		reg->cm_coef23_22 =3D (cm->coef23 << 16) | cm->coef22;
> +		reg->dpu_enhance_cfg |=3D BIT(3);
> +		pr_info("enhance cm set\n");
> +		break;
> +	case ENHANCE_CFG_ID_SLP:
> +		memcpy(&slp_copy, param, sizeof(slp_copy));
> +		slp =3D &slp_copy;
> +		reg->slp_cfg0 =3D (slp->second_bright_factor << 24) |
> +				(slp->brightness_step << 16) |
> +				(slp->conversion_matrix << 8) |
> +				slp->brightness;
> +		reg->slp_cfg1 =3D (slp->first_max_bright_th << 8) |
> +				slp->first_percent_th;
> +		reg->dpu_enhance_cfg |=3D BIT(4);
> +		pr_info("enhance slp set\n");
> +		break;
> +	case ENHANCE_CFG_ID_GAMMA:
> +		memcpy(&gamma_copy, param, sizeof(gamma_copy));
> +		gamma =3D &gamma_copy;
> +		for (i =3D 0; i < 256; i++) {
> +			reg->gamma_lut_addr =3D i;
> +			udelay(1);
> +			reg->gamma_lut_wdata =3D (gamma->r[i] << 20) |
> +						(gamma->g[i] << 10) |
> +						gamma->b[i];
> +			pr_debug("0x%02x: r=3D%u, g=3D%u, b=3D%u\n", i,
> +				gamma->r[i], gamma->g[i], gamma->b[i]);
> +		}
> +		reg->dpu_enhance_cfg |=3D BIT(5);
> +		pr_info("enhance gamma set\n");
> +		break;
> +	case ENHANCE_CFG_ID_EPF:
> +		memcpy(&epf_copy, param, sizeof(epf_copy));
> +		if ((slp_copy.brightness > SLP_BRIGHTNESS_THRESHOLD) ||
> +			(enhance_en & BIT(0))) {
> +			epf =3D &epf_copy;
> +			dpu_epf_set(reg, epf);
> +			reg->dpu_enhance_cfg |=3D BIT(1);
> +			pr_info("enhance epf set\n");
> +			break;
> +		}
> +		return;
> +	default:
> +		break;
> +	}
> +
> +	if ((ctx->if_type =3D=3D SPRD_DISPC_IF_DPI) && !ctx->is_stopped) {
> +		reg->dpu_ctrl |=3D BIT(2);
> +		dpu_wait_update_done(ctx);
> +	} else if ((ctx->if_type =3D=3D SPRD_DISPC_IF_EDPI) && panel_ready) {=

> +		/*
> +		 * In EDPI mode, we need to wait panel initializatin
> +		 * completed. Otherwise, the dpu enhance settings may
> +		 * start before panel initialization.
> +		 */
> +		reg->dpu_ctrl |=3D BIT(0);
> +		ctx->is_stopped =3D false;
> +	}
> +
> +	enhance_en =3D reg->dpu_enhance_cfg;
> +}
> +
> +static void dpu_enhance_get(struct dpu_context *ctx, u32 id, void *par=
am)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +	struct scale_cfg *scale;
> +	struct epf_cfg *ep;
> +	struct slp_cfg *slp;
> +	struct gamma_lut *gamma;
> +	u32 *p32;
> +	int i, val;
> +
> +	switch (id) {
> +	case ENHANCE_CFG_ID_ENABLE:
> +		p32 =3D param;
> +		*p32 =3D reg->dpu_enhance_cfg;
> +		pr_info("enhance module enable get\n");
> +		break;
> +	case ENHANCE_CFG_ID_SCL:
> +		scale =3D param;
> +		val =3D reg->blend_size;
> +		scale->in_w =3D val & 0xffff;
> +		scale->in_h =3D val >> 16;
> +		pr_info("enhance scaling get\n");
> +		break;
> +	case ENHANCE_CFG_ID_EPF:
> +		ep =3D param;
> +
> +		val =3D reg->epf_epsilon;
> +		ep->epsilon0 =3D val;
> +		ep->epsilon1 =3D val >> 16;
> +
> +		val =3D reg->epf_gain0_3;
> +		ep->gain0 =3D val;
> +		ep->gain1 =3D val >> 8;
> +		ep->gain2 =3D val >> 16;
> +		ep->gain3 =3D val >> 24;
> +
> +		val =3D reg->epf_gain4_7;
> +		ep->gain4 =3D val;
> +		ep->gain5 =3D val >> 8;
> +		ep->gain6 =3D val >> 16;
> +		ep->gain7 =3D val >> 24;
> +
> +		val =3D reg->epf_diff;
> +		ep->min_diff =3D val;
> +		ep->max_diff =3D val >> 8;
> +		pr_info("enhance epf get\n");
> +		break;
> +	case ENHANCE_CFG_ID_HSV:
> +		dpu_stop(ctx);
> +		p32 =3D param;
> +		for (i =3D 0; i < 360; i++) {
> +			reg->hsv_lut_addr =3D i;
> +			udelay(1);
> +			*p32++ =3D reg->hsv_lut_rdata;
> +		}
> +		dpu_run(ctx);
> +		pr_info("enhance hsv get\n");
> +		break;
> +	case ENHANCE_CFG_ID_CM:
> +		p32 =3D param;
> +		*p32++ =3D reg->cm_coef01_00;
> +		*p32++ =3D reg->cm_coef03_02;
> +		*p32++ =3D reg->cm_coef11_10;
> +		*p32++ =3D reg->cm_coef13_12;
> +		*p32++ =3D reg->cm_coef21_20;
> +		*p32++ =3D reg->cm_coef23_22;
> +		pr_info("enhance cm get\n");
> +		break;
> +	case ENHANCE_CFG_ID_SLP:
> +		slp =3D param;
> +
> +		val =3D reg->slp_cfg0;
> +		slp->brightness =3D val;
> +		slp->conversion_matrix =3D val >> 8;
> +		slp->brightness_step =3D val >> 16;
> +		slp->second_bright_factor =3D val >> 24;
> +
> +		val =3D reg->slp_cfg1;
> +		slp->first_percent_th =3D val;
> +		slp->first_max_bright_th =3D val >> 8;
> +		pr_info("enhance slp get\n");
> +		break;
> +	case ENHANCE_CFG_ID_GAMMA:
> +		dpu_stop(ctx);
> +		gamma =3D param;
> +		for (i =3D 0; i < 256; i++) {
> +			reg->gamma_lut_addr =3D i;
> +			udelay(1);
> +			val =3D reg->gamma_lut_rdata;
> +			gamma->r[i] =3D (val >> 20) & 0x3FF;
> +			gamma->g[i] =3D (val >> 10) & 0x3FF;
> +			gamma->b[i] =3D val & 0x3FF;
> +			pr_debug("0x%02x: r=3D%u, g=3D%u, b=3D%u\n", i,
> +				gamma->r[i], gamma->g[i], gamma->b[i]);
> +		}
> +		dpu_run(ctx);
> +		pr_info("enhance gamma get\n");
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static void dpu_enhance_reload(struct dpu_context *ctx)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +	struct scale_cfg *scale;
> +	struct cm_cfg *cm;
> +	struct slp_cfg *slp;
> +	struct gamma_lut *gamma;
> +	struct hsv_lut *hsv;
> +	struct epf_cfg *epf;
> +	int i;
> +
> +	if (enhance_en & BIT(0)) {
> +		scale =3D &scale_copy;
> +		reg->blend_size =3D (scale->in_h << 16) | scale->in_w;
> +		pr_info("enhance scaling from %ux%u to %ux%u\n", scale->in_w,
> +			scale->in_h, ctx->vm.hactive, ctx->vm.vactive);
> +	}
> +
> +	if (enhance_en & BIT(1)) {
> +		epf =3D &epf_copy;
> +		dpu_epf_set(reg, epf);
> +		pr_info("enhance epf reload\n");
> +	}
> +
> +	if (enhance_en & BIT(2)) {
> +		hsv =3D &hsv_copy;
> +		for (i =3D 0; i < 360; i++) {
> +			reg->hsv_lut_addr =3D i;
> +			udelay(1);
> +			reg->hsv_lut_wdata =3D (hsv->table[i].sat << 16) |
> +						hsv->table[i].hue;
> +		}
> +		pr_info("enhance hsv reload\n");
> +	}
> +
> +	if (enhance_en & BIT(3)) {
> +		cm =3D &cm_copy;
> +		reg->cm_coef01_00 =3D (cm->coef01 << 16) | cm->coef00;
> +		reg->cm_coef03_02 =3D (cm->coef03 << 16) | cm->coef02;
> +		reg->cm_coef11_10 =3D (cm->coef11 << 16) | cm->coef10;
> +		reg->cm_coef13_12 =3D (cm->coef13 << 16) | cm->coef12;
> +		reg->cm_coef21_20 =3D (cm->coef21 << 16) | cm->coef20;
> +		reg->cm_coef23_22 =3D (cm->coef23 << 16) | cm->coef22;
> +		pr_info("enhance cm reload\n");
> +	}
> +
> +	if (enhance_en & BIT(4)) {
> +		slp =3D &slp_copy;
> +		reg->slp_cfg0 =3D (slp->second_bright_factor << 24) |
> +				(slp->brightness_step << 16) |
> +				(slp->conversion_matrix << 8) |
> +				slp->brightness;
> +		reg->slp_cfg1 =3D (slp->first_max_bright_th << 8) |
> +				slp->first_percent_th;
> +		pr_info("enhance slp reload\n");
> +	}
> +
> +	if (enhance_en & BIT(5)) {
> +		gamma =3D &gamma_copy;
> +		for (i =3D 0; i < 256; i++) {
> +			reg->gamma_lut_addr =3D i;
> +			udelay(1);
> +			reg->gamma_lut_wdata =3D (gamma->r[i] << 20) |
> +						(gamma->g[i] << 10) |
> +						gamma->b[i];
> +			pr_debug("0x%02x: r=3D%u, g=3D%u, b=3D%u\n", i,
> +				gamma->r[i], gamma->g[i], gamma->b[i]);
> +		}
> +		pr_info("enhance gamma reload\n");
> +	}
> +
> +	reg->dpu_enhance_cfg =3D enhance_en;
> +}
> +
> +static void dpu_sr_config(struct dpu_context *ctx)
> +{
> +	struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> +
> +	reg->blend_size =3D (scale_copy.in_h << 16) | scale_copy.in_w;
> +	if (need_scale) {
> +		/* SLP is disabled mode or bypass mode */
> +		if (slp_copy.brightness <=3D SLP_BRIGHTNESS_THRESHOLD) {
> +
> +		/*
> +		 * valid range of gain3 is [128,255];dpu_scaling maybe
> +		 * called before epf_copy is assinged a value
> +		 */
> +			if (epf_copy.gain3 > 0) {
> +				dpu_epf_set(reg, &epf_copy);
> +				enhance_en |=3D BIT(1);
> +			}
> +		}
> +		enhance_en |=3D BIT(0);
> +		reg->dpu_enhance_cfg =3D enhance_en;
> +	} else {
> +		if (slp_copy.brightness <=3D SLP_BRIGHTNESS_THRESHOLD)
> +			enhance_en &=3D ~(BIT(1));
> +
> +		enhance_en &=3D ~(BIT(0));
> +		reg->dpu_enhance_cfg =3D enhance_en;
> +	}
> +}
> +
> +static int dpu_modeset(struct dpu_context *ctx,
> +		struct drm_mode_modeinfo *mode)
> +{
> +	scale_copy.in_w =3D mode->hdisplay;
> +	scale_copy.in_h =3D mode->vdisplay;
> +
> +	if ((mode->hdisplay !=3D ctx->vm.hactive) ||
> +		(mode->vdisplay !=3D ctx->vm.vactive))
> +		need_scale =3D true;
> +	else
> +		need_scale =3D false;
> +
> +	mode_changed =3D true;
> +	pr_info("begin switch to %u x %u\n", mode->hdisplay, mode->vdisplay);=

> +
> +	return 0;
> +}
> +
> +static const u32 primary_fmts[] =3D {
> +	DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_RGBA8888, DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_RGBX8888, DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_RGB565, DRM_FORMAT_BGR565,
> +	DRM_FORMAT_NV12, DRM_FORMAT_NV21,
> +	DRM_FORMAT_NV16, DRM_FORMAT_NV61,
> +	DRM_FORMAT_YUV420, DRM_FORMAT_YVU420,
> +};
> +
> +static int dpu_capability(struct dpu_context *ctx,
> +			struct dpu_capability *cap)
> +{
> +	if (!cap)
> +		return -EINVAL;
> +
> +	cap->max_layers =3D 6;
> +	cap->fmts_ptr =3D primary_fmts;
> +	cap->fmts_cnt =3D ARRAY_SIZE(primary_fmts);
> +
> +	return 0;
> +}
> +
> +static struct dpu_core_ops dpu_r2p0_ops =3D {
> +	.parse_dt =3D dpu_parse_dt,
> +	.version =3D dpu_get_version,
> +	.init =3D dpu_init,
> +	.uninit =3D dpu_uninit,
> +	.run =3D dpu_run,
> +	.stop =3D dpu_stop,
> +	.isr =3D dpu_isr,
> +	.ifconfig =3D dpu_dpi_init,
> +	.capability =3D dpu_capability,
> +	.flip =3D dpu_flip,
> +	.bg_color =3D dpu_bgcolor,
> +	.enable_vsync =3D enable_vsync,
> +	.disable_vsync =3D disable_vsync,
> +	.enhance_set =3D dpu_enhance_set,
> +	.enhance_get =3D dpu_enhance_get,
> +	.modeset =3D dpu_modeset,
> +	.check_raw_int =3D dpu_check_raw_int,
> +};
> +
> +static struct ops_entry entry =3D {
> +	.ver =3D "dpu-r2p0",
> +	.ops =3D &dpu_r2p0_ops,
> +};
> +
> +static int __init dpu_core_register(void)
> +{
> +	return dpu_core_ops_register(&entry);
> +}
> +
> +subsys_initcall(dpu_core_register);
> diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/spr=
d_dpu.c
> new file mode 100644
> index 0000000..43142b3
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> @@ -0,0 +1,1152 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
> + */
> +
> +#include <linux/component.h>
> +#include <linux/dma-buf.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_plane_helper.h>
> +
> +#include "sprd_drm.h"
> +#include "sprd_dpu.h"
> +#include "sprd_gem.h"
> +
> +struct sprd_plane {
> +	struct drm_plane plane;
> +	struct drm_property *alpha_property;
> +	struct drm_property *blend_mode_property;
> +	struct drm_property *fbc_hsize_r_property;
> +	struct drm_property *fbc_hsize_y_property;
> +	struct drm_property *fbc_hsize_uv_property;
> +	struct drm_property *y2r_coef_property;
> +	struct drm_property *pallete_en_property;
> +	struct drm_property *pallete_color_property;
> +	u32 index;
> +};
> +
> +struct sprd_plane_state {
> +	struct drm_plane_state state;
> +	u8 alpha;
> +	u8 blend_mode;
> +	u32 fbc_hsize_r;
> +	u32 fbc_hsize_y;
> +	u32 fbc_hsize_uv;
> +	u32 y2r_coef;
> +	u32 pallete_en;
> +	u32 pallete_color;
> +};
> +
> +LIST_HEAD(dpu_core_head);
> +LIST_HEAD(dpu_clk_head);
> +LIST_HEAD(dpu_glb_head);
> +
> +static int sprd_dpu_init(struct sprd_dpu *dpu);
> +static int sprd_dpu_uninit(struct sprd_dpu *dpu);
> +
> +static inline struct sprd_plane *to_sprd_plane(struct drm_plane *plane=
)
> +{
> +	return container_of(plane, struct sprd_plane, plane);
> +}
> +
> +static inline struct
> +sprd_plane_state *to_sprd_plane_state(const struct drm_plane_state *st=
ate)
> +{
> +	return container_of(state, struct sprd_plane_state, state);
> +}
> +
> +static int sprd_dpu_iommu_map(struct device *dev,
> +				struct sprd_gem_obj *sprd_gem)
> +{
> +	/*
> +	 * TODO:
> +	 * Currently only supports dumb buffer,
> +	 * will support iommu in the future.
> +	 */
> +
> +	return 0;
> +}
> +
> +static void sprd_dpu_iommu_unmap(struct device *dev,
> +				struct sprd_gem_obj *sprd_gem)
> +{
> +	/*
> +	 * TODO:
> +	 * Currently only supports dumb buffer,
> +	 * will support iommu in the future.
> +	 */
> +}
> +
> +static int of_get_logo_memory_info(struct sprd_dpu *dpu,
> +	struct device_node *np)
> +{
> +	struct device_node *node;
> +	struct resource r;
> +	int ret;
> +	struct dpu_context *ctx =3D &dpu->ctx;
> +
> +	node =3D of_parse_phandle(np, "sprd,logo-memory", 0);
> +	if (!node) {
> +		DRM_INFO("no sprd,logo-memory specified\n");
> +		return 0;
> +	}
> +
> +	ret =3D of_address_to_resource(node, 0, &r);
> +	of_node_put(node);
> +	if (ret) {
> +		DRM_ERROR("invalid logo reserved memory node!\n");
> +		return -EINVAL;
> +	}
> +
> +	ctx->logo_addr =3D r.start;
> +	ctx->logo_size =3D resource_size(&r);
> +
> +	return 0;
> +}
> +
> +static int sprd_plane_prepare_fb(struct drm_plane *plane,
> +				struct drm_plane_state *new_state)
> +{
> +	struct drm_plane_state *curr_state =3D plane->state;
> +	struct drm_framebuffer *fb;
> +	struct drm_gem_object *obj;
> +	struct sprd_gem_obj *sprd_gem;
> +	struct sprd_dpu *dpu;
> +	int i;
> +
> +	if ((curr_state->fb =3D=3D new_state->fb) || !new_state->fb)
> +		return 0;
> +
> +	fb =3D new_state->fb;
> +	dpu =3D crtc_to_dpu(new_state->crtc);
> +
> +	if (!dpu->ctx.is_inited) {
> +		DRM_WARN("dpu has already powered off\n");
> +		return 0;
> +	}
> +
> +	for (i =3D 0; i < fb->format->num_planes; i++) {
> +		obj =3D drm_gem_fb_get_obj(fb, i);
> +		sprd_gem =3D to_sprd_gem_obj(obj);
> +		if (sprd_gem->sgtb && sprd_gem->sgtb->nents > 1)
> +			sprd_dpu_iommu_map(&dpu->dev, sprd_gem);
> +	}
> +
> +	return 0;
> +}
> +
> +static void sprd_plane_cleanup_fb(struct drm_plane *plane,
> +				struct drm_plane_state *old_state)
> +{
> +	struct drm_plane_state *curr_state =3D plane->state;
> +	struct drm_framebuffer *fb;
> +	struct drm_gem_object *obj;
> +	struct sprd_gem_obj *sprd_gem;
> +	struct sprd_dpu *dpu;
> +	int i;
> +	static atomic_t logo2animation =3D { -1 };
> +
> +	if ((curr_state->fb =3D=3D old_state->fb) || !old_state->fb)
> +		return;
> +
> +	fb =3D old_state->fb;
> +	dpu =3D crtc_to_dpu(old_state->crtc);
> +
> +	if (!dpu->ctx.is_inited) {
> +		DRM_WARN("dpu has already powered off\n");
> +		return;
> +	}
> +
> +	for (i =3D 0; i < fb->format->num_planes; i++) {
> +		obj =3D drm_gem_fb_get_obj(fb, i);
> +		sprd_gem =3D to_sprd_gem_obj(obj);
> +		if (sprd_gem->sgtb && sprd_gem->sgtb->nents > 1)
> +			sprd_dpu_iommu_unmap(&dpu->dev, sprd_gem);
> +	}
> +
> +	if (unlikely(atomic_inc_not_zero(&logo2animation)) &&
> +		dpu->ctx.logo_addr) {
> +		DRM_INFO("free logo memory addr:0x%lx size:0x%lx\n",
> +			dpu->ctx.logo_addr, dpu->ctx.logo_size);
> +		free_reserved_area(phys_to_virt(dpu->ctx.logo_addr),
> +			phys_to_virt(dpu->ctx.logo_addr + dpu->ctx.logo_size),
> +			-1, "logo");
> +	}
> +}
> +
> +static int sprd_plane_atomic_check(struct drm_plane *plane,
> +				  struct drm_plane_state *state)
> +{
> +	DRM_DEBUG("%s()\n", __func__);
> +
> +	return 0;
> +}
> +
> +static void sprd_plane_atomic_update(struct drm_plane *plane,
> +				    struct drm_plane_state *old_state)
> +{
> +	struct drm_plane_state *state =3D plane->state;
> +	struct drm_framebuffer *fb =3D plane->state->fb;
> +	struct drm_gem_object *obj;
> +	struct sprd_gem_obj *sprd_gem;
> +	struct sprd_plane *p =3D to_sprd_plane(plane);
> +	struct sprd_plane_state *s =3D to_sprd_plane_state(state);
> +	struct sprd_dpu *dpu =3D crtc_to_dpu(plane->state->crtc);
> +	struct sprd_dpu_layer *layer =3D &dpu->layers[p->index];
> +	int i;
> +
> +	if (plane->state->crtc->state->active_changed) {
> +		DRM_DEBUG("resume or suspend, no need to update plane\n");
> +		return;
> +	}
> +
> +	if (s->pallete_en) {
> +		layer->index =3D p->index;
> +		layer->dst_x =3D state->crtc_x;
> +		layer->dst_y =3D state->crtc_y;
> +		layer->dst_w =3D state->crtc_w;
> +		layer->dst_h =3D state->crtc_h;
> +		layer->alpha =3D s->alpha;
> +		layer->blending =3D s->blend_mode;
> +		layer->pallete_en =3D s->pallete_en;
> +		layer->pallete_color =3D s->pallete_color;
> +		dpu->pending_planes++;
> +		DRM_DEBUG("%s() pallete_color =3D %u, index =3D %u\n",
> +			__func__, layer->pallete_color, layer->index);
> +		return;
> +	}
> +
> +	layer->index =3D p->index;
> +	layer->src_x =3D state->src_x >> 16;
> +	layer->src_y =3D state->src_y >> 16;
> +	layer->src_w =3D state->src_w >> 16;
> +	layer->src_h =3D state->src_h >> 16;
> +	layer->dst_x =3D state->crtc_x;
> +	layer->dst_y =3D state->crtc_y;
> +	layer->dst_w =3D state->crtc_w;
> +	layer->dst_h =3D state->crtc_h;
> +	layer->rotation =3D state->rotation;
> +	layer->planes =3D fb->format->num_planes;
> +	layer->format =3D fb->format->format;
> +	layer->alpha =3D s->alpha;
> +	layer->blending =3D s->blend_mode;
> +	layer->xfbc =3D fb->modifier;
> +	layer->header_size_r =3D s->fbc_hsize_r;
> +	layer->header_size_y =3D s->fbc_hsize_y;
> +	layer->header_size_uv =3D s->fbc_hsize_uv;
> +	layer->y2r_coef =3D s->y2r_coef;
> +	layer->pallete_en =3D s->pallete_en;
> +	layer->pallete_color =3D s->pallete_color;
> +
> +	DRM_DEBUG("%s() alpha =3D %u, blending =3D %u, rotation =3D %u, y2r_c=
oef =3D %u\n",
> +		  __func__, layer->alpha, layer->blending, layer->rotation, s->y2r_c=
oef);
> +
> +	DRM_DEBUG("%s() xfbc =3D %u, hsize_r =3D %u, hsize_y =3D %u, hsize_uv=
 =3D %u\n",
> +		  __func__, layer->xfbc, layer->header_size_r,
> +		  layer->header_size_y, layer->header_size_uv);
> +
> +	for (i =3D 0; i < layer->planes; i++) {
> +		obj =3D drm_gem_fb_get_obj(fb, i);
> +		sprd_gem =3D to_sprd_gem_obj(obj);
> +		layer->addr[i] =3D sprd_gem->dma_addr + fb->offsets[i];
> +		layer->pitch[i] =3D fb->pitches[i];
> +	}
> +
> +	dpu->pending_planes++;
> +}
> +
> +static void sprd_plane_atomic_disable(struct drm_plane *plane,
> +				     struct drm_plane_state *old_state)
> +{
> +	struct sprd_plane *p =3D to_sprd_plane(plane);
> +
> +	/*
> +	 * NOTE:
> +	 * The dpu->core->flip() will disable all the planes each time.
> +	 * So there is no need to impliment the atomic_disable() function.
> +	 * But this function can not be removed, because it will change
> +	 * to call atomic_update() callback instead. Which will cause
> +	 * kernel panic in sprd_plane_atomic_update().
> +	 *
> +	 * We do nothing here but just print a debug log.
> +	 */
> +	DRM_DEBUG("%s() layer_id =3D %u\n", __func__, p->index);
> +}
> +
> +static void sprd_plane_reset(struct drm_plane *plane)
> +{
> +	struct sprd_plane *p =3D to_sprd_plane(plane);
> +	struct sprd_plane_state *s;
> +
> +	DRM_INFO("%s()\n", __func__);
> +
> +	if (plane->state) {
> +		__drm_atomic_helper_plane_destroy_state(plane->state);
> +
> +		s =3D to_sprd_plane_state(plane->state);
> +		memset(s, 0, sizeof(*s));
> +	} else {
> +		s =3D kzalloc(sizeof(*s), GFP_KERNEL);
> +		if (!s)
> +			return;
> +		plane->state =3D &s->state;
> +	}
> +
> +	s->state.plane =3D plane;
> +	s->state.zpos =3D p->index;
> +	s->alpha =3D 255;
> +	s->blend_mode =3D DRM_MODE_BLEND_PIXEL_NONE;
> +}
> +
> +static struct drm_plane_state *
> +sprd_plane_atomic_duplicate_state(struct drm_plane *plane)
> +{
> +	struct sprd_plane_state *s;
> +	struct sprd_plane_state *old_state =3D to_sprd_plane_state(plane->sta=
te);
> +
> +	DRM_DEBUG("%s()\n", __func__);
> +
> +	s =3D kzalloc(sizeof(*s), GFP_KERNEL);
> +	if (!s)
> +		return NULL;
> +
> +	__drm_atomic_helper_plane_duplicate_state(plane, &s->state);
> +
> +	WARN_ON(s->state.plane !=3D plane);
> +
> +	s->alpha =3D old_state->alpha;
> +	s->blend_mode =3D old_state->blend_mode;
> +	s->fbc_hsize_r =3D old_state->fbc_hsize_r;
> +	s->fbc_hsize_y =3D old_state->fbc_hsize_y;
> +	s->fbc_hsize_uv =3D old_state->fbc_hsize_uv;
> +	s->y2r_coef =3D old_state->y2r_coef;
> +	s->pallete_en =3D old_state->pallete_en;
> +	s->pallete_color =3D old_state->pallete_color;
> +
> +	return &s->state;
> +}
> +
> +static void sprd_plane_atomic_destroy_state(struct drm_plane *plane,
> +					    struct drm_plane_state *state)
> +{
> +	DRM_DEBUG("%s()\n", __func__);
> +
> +	__drm_atomic_helper_plane_destroy_state(state);
> +	kfree(to_sprd_plane_state(state));
> +}
> +
> +static int sprd_plane_atomic_set_property(struct drm_plane *plane,
> +					  struct drm_plane_state *state,
> +					  struct drm_property *property,
> +					  u64 val)
> +{
> +	struct sprd_plane *p =3D to_sprd_plane(plane);
> +	struct sprd_plane_state *s =3D to_sprd_plane_state(state);
> +
> +	DRM_DEBUG("%s() name =3D %s, val =3D %llu\n",
> +		  __func__, property->name, val);
> +
> +	if (property =3D=3D p->alpha_property)
> +		s->alpha =3D val;
> +	else if (property =3D=3D p->blend_mode_property)
> +		s->blend_mode =3D val;
> +	else if (property =3D=3D p->fbc_hsize_r_property)
> +		s->fbc_hsize_r =3D val;
> +	else if (property =3D=3D p->fbc_hsize_y_property)
> +		s->fbc_hsize_y =3D val;
> +	else if (property =3D=3D p->fbc_hsize_uv_property)
> +		s->fbc_hsize_uv =3D val;
> +	else if (property =3D=3D p->y2r_coef_property)
> +		s->y2r_coef =3D val;
> +	else if (property =3D=3D p->pallete_en_property)
> +		s->pallete_en =3D val;
> +	else if (property =3D=3D p->pallete_color_property)
> +		s->pallete_color =3D val;
> +	else {
> +		DRM_ERROR("property %s is invalid\n", property->name);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int sprd_plane_atomic_get_property(struct drm_plane *plane,
> +					  const struct drm_plane_state *state,
> +					  struct drm_property *property,
> +					  u64 *val)
> +{
> +	struct sprd_plane *p =3D to_sprd_plane(plane);
> +	const struct sprd_plane_state *s =3D to_sprd_plane_state(state);
> +
> +	DRM_DEBUG("%s() name =3D %s\n", __func__, property->name);
> +
> +	if (property =3D=3D p->alpha_property)
> +		*val =3D s->alpha;
> +	else if (property =3D=3D p->blend_mode_property)
> +		*val =3D s->blend_mode;
> +	else if (property =3D=3D p->fbc_hsize_r_property)
> +		*val =3D s->fbc_hsize_r;
> +	else if (property =3D=3D p->fbc_hsize_y_property)
> +		*val =3D s->fbc_hsize_y;
> +	else if (property =3D=3D p->fbc_hsize_uv_property)
> +		*val =3D s->fbc_hsize_uv;
> +	else if (property =3D=3D p->y2r_coef_property)
> +		*val =3D s->y2r_coef;
> +	else if (property =3D=3D p->pallete_en_property)
> +		*val =3D s->pallete_en;
> +	else if (property =3D=3D p->pallete_color_property)
> +		*val =3D s->pallete_color;
> +	else {
> +		DRM_ERROR("property %s is invalid\n", property->name);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int sprd_plane_create_properties(struct sprd_plane *p, int inde=
x)
> +{
> +	struct drm_property *prop;
> +	static const struct drm_prop_enum_list blend_mode_enum_list[] =3D {
> +		{ DRM_MODE_BLEND_PIXEL_NONE, "None" },
> +		{ DRM_MODE_BLEND_PREMULTI, "Pre-multiplied" },
> +		{ DRM_MODE_BLEND_COVERAGE, "Coverage" },
> +	};
> +
> +	/* create rotation property */
> +	drm_plane_create_rotation_property(&p->plane,
> +					   DRM_MODE_ROTATE_0,
> +					   DRM_MODE_ROTATE_MASK |
> +					   DRM_MODE_REFLECT_MASK);
> +
> +	/* create zpos property */
> +	drm_plane_create_zpos_immutable_property(&p->plane, index);
> +
> +	/* create layer alpha property */
> +	prop =3D drm_property_create_range(p->plane.dev, 0, "alpha", 0, 255);=

> +	if (!prop)
> +		return -ENOMEM;
> +	drm_object_attach_property(&p->plane.base, prop, 255);
> +	p->alpha_property =3D prop;
> +
> +	/* create blend mode property */
> +	prop =3D drm_property_create_enum(p->plane.dev, DRM_MODE_PROP_ENUM,
> +					"pixel blend mode",
> +					blend_mode_enum_list,
> +					ARRAY_SIZE(blend_mode_enum_list));
> +	if (!prop)
> +		return -ENOMEM;
> +	drm_object_attach_property(&p->plane.base, prop,
> +				   DRM_MODE_BLEND_PIXEL_NONE);
> +	p->blend_mode_property =3D prop;
> +
> +	/* create fbc header size property */
> +	prop =3D drm_property_create_range(p->plane.dev, 0,
> +			"FBC header size RGB", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	drm_object_attach_property(&p->plane.base, prop, 0);
> +	p->fbc_hsize_r_property =3D prop;
> +
> +	prop =3D drm_property_create_range(p->plane.dev, 0,
> +			"FBC header size Y", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	drm_object_attach_property(&p->plane.base, prop, 0);
> +	p->fbc_hsize_y_property =3D prop;
> +
> +	prop =3D drm_property_create_range(p->plane.dev, 0,
> +			"FBC header size UV", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	drm_object_attach_property(&p->plane.base, prop, 0);
> +	p->fbc_hsize_uv_property =3D prop;
> +
> +	/* create y2r coef property */
> +	prop =3D drm_property_create_range(p->plane.dev, 0,
> +			"YUV2RGB coef", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	drm_object_attach_property(&p->plane.base, prop, 0);
> +	p->y2r_coef_property =3D prop;
> +
> +	/* create pallete enable property */
> +	prop =3D drm_property_create_range(p->plane.dev, 0,
> +			"pallete enable", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	drm_object_attach_property(&p->plane.base, prop, 0);
> +	p->pallete_en_property =3D prop;
> +
> +	/* create pallete color property */
> +	prop =3D drm_property_create_range(p->plane.dev, 0,
> +			"pallete color", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	drm_object_attach_property(&p->plane.base, prop, 0);
> +	p->pallete_color_property =3D prop;
> +
> +	return 0;
> +}
> +
> +static const struct drm_plane_helper_funcs sprd_plane_helper_funcs =3D=
 {
> +	.prepare_fb =3D sprd_plane_prepare_fb,
> +	.cleanup_fb =3D sprd_plane_cleanup_fb,
> +	.atomic_check =3D sprd_plane_atomic_check,
> +	.atomic_update =3D sprd_plane_atomic_update,
> +	.atomic_disable =3D sprd_plane_atomic_disable,
> +};
> +
> +static const struct drm_plane_funcs sprd_plane_funcs =3D {
> +	.update_plane =3D drm_atomic_helper_update_plane,
> +	.disable_plane	=3D drm_atomic_helper_disable_plane,
> +	.destroy =3D drm_plane_cleanup,
> +	.reset =3D sprd_plane_reset,
> +	.atomic_duplicate_state =3D sprd_plane_atomic_duplicate_state,
> +	.atomic_destroy_state =3D sprd_plane_atomic_destroy_state,
> +	.atomic_set_property =3D sprd_plane_atomic_set_property,
> +	.atomic_get_property =3D sprd_plane_atomic_get_property,
> +};
> +
> +static struct drm_plane *sprd_plane_init(struct drm_device *drm,
> +					struct sprd_dpu *dpu)
> +{
> +	struct drm_plane *primary =3D NULL;
> +	struct sprd_plane *p =3D NULL;
> +	struct dpu_capability cap =3D {};
> +	int err, i;
> +
> +	if (dpu->core && dpu->core->capability)
> +		dpu->core->capability(&dpu->ctx, &cap);
> +
> +	dpu->layers =3D devm_kcalloc(drm->dev, cap.max_layers,
> +				  sizeof(struct sprd_dpu_layer), GFP_KERNEL);
> +	if (!dpu->layers)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i =3D 0; i < cap.max_layers; i++) {
> +
> +		p =3D devm_kzalloc(drm->dev, sizeof(*p), GFP_KERNEL);
> +		if (!p)
> +			return ERR_PTR(-ENOMEM);
> +
> +		err =3D drm_universal_plane_init(drm, &p->plane, 1,
> +					       &sprd_plane_funcs, cap.fmts_ptr,
> +					       cap.fmts_cnt, NULL,
> +					       DRM_PLANE_TYPE_PRIMARY, NULL);
> +		if (err) {
> +			DRM_ERROR("fail to init primary plane\n");
> +			return ERR_PTR(err);
> +		}
> +
> +		drm_plane_helper_add(&p->plane, &sprd_plane_helper_funcs);
> +
> +		sprd_plane_create_properties(p, i);
> +
> +		p->index =3D i;
> +		if (i =3D=3D 0)
> +			primary =3D &p->plane;
> +	}
> +
> +	if (p)
> +		DRM_INFO("dpu plane init ok\n");
> +
> +	return primary;
> +}
> +
> +static void sprd_crtc_mode_set_nofb(struct drm_crtc *crtc)
> +{
> +	struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> +	struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
> +
> +	DRM_INFO("%s() set mode: %s\n", __func__, dpu->mode->name);
> +
> +	/*
> +	 * TODO:
> +	 * Currently, low simulator resolution only support
> +	 * DPI mode, support for EDPI in the future.
> +	 */
> +	if (mode->type & DRM_MODE_TYPE_BUILTIN) {
> +		dpu->ctx.if_type =3D SPRD_DISPC_IF_DPI;
> +		return;
> +	}
> +
> +	if ((dpu->mode->hdisplay =3D=3D dpu->mode->htotal) ||
> +	    (dpu->mode->vdisplay =3D=3D dpu->mode->vtotal))
> +		dpu->ctx.if_type =3D SPRD_DISPC_IF_EDPI;
> +	else
> +		dpu->ctx.if_type =3D SPRD_DISPC_IF_DPI;
> +
> +	if (dpu->core && dpu->core->modeset) {
> +		if (crtc->state->mode_changed) {
> +			struct drm_mode_modeinfo umode;
> +
> +			drm_mode_convert_to_umode(&umode, mode);
> +			dpu->core->modeset(&dpu->ctx, &umode);
> +		}
> +	}
> +}
> +
> +static enum drm_mode_status sprd_crtc_mode_valid(struct drm_crtc *crtc=
,
> +					const struct drm_display_mode *mode)
> +{
> +	struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> +
> +	DRM_INFO("%s() mode: "DRM_MODE_FMT"\n", __func__, DRM_MODE_ARG(mode))=
;
> +
> +	if (mode->type & DRM_MODE_TYPE_DEFAULT)
> +		dpu->mode =3D (struct drm_display_mode *)mode;
> +
> +	if (mode->type & DRM_MODE_TYPE_PREFERRED) {
> +		dpu->mode =3D (struct drm_display_mode *)mode;
> +		drm_display_mode_to_videomode(dpu->mode, &dpu->ctx.vm);
> +	}
> +
> +	if (mode->type & DRM_MODE_TYPE_BUILTIN)
> +		dpu->mode =3D (struct drm_display_mode *)mode;
> +
> +	return MODE_OK;
> +}
> +
> +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,
> +				   struct drm_crtc_state *old_state)
> +{
> +	struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> +	static bool is_enabled =3D true;
> +
> +	DRM_INFO("%s()\n", __func__);
> +
> +	/*
> +	 * add if condition to avoid resume dpu for SR feature.
> +	 */
> +	if (crtc->state->mode_changed && !crtc->state->active_changed)
> +		return;
> +
> +	if (is_enabled)
> +		is_enabled =3D false;
> +	else
> +		pm_runtime_get_sync(dpu->dev.parent);
> +
> +	sprd_dpu_init(dpu);
> +
> +	enable_irq(dpu->ctx.irq);
> +}
> +
> +static void sprd_crtc_wait_last_commit_complete(struct drm_crtc *crtc)=

> +{
> +	struct drm_crtc_commit *commit;
> +	int ret, i =3D 0;
> +
> +	spin_lock(&crtc->commit_lock);
> +	list_for_each_entry(commit, &crtc->commit_list, commit_entry) {
> +		i++;
> +		/* skip the first entry, that's the current commit */
> +		if (i =3D=3D 2)
> +			break;
> +	}
> +	if (i =3D=3D 2)
> +		drm_crtc_commit_get(commit);
> +	spin_unlock(&crtc->commit_lock);
> +
> +	if (i !=3D 2)
> +		return;
> +
> +	ret =3D wait_for_completion_interruptible_timeout(&commit->cleanup_do=
ne,
> +							HZ);
> +	if (ret =3D=3D 0)
> +		DRM_WARN("wait last commit completion timed out\n");
> +
> +	drm_crtc_commit_put(commit);
> +}
> +
> +static void sprd_crtc_atomic_disable(struct drm_crtc *crtc,
> +				    struct drm_crtc_state *old_state)
> +{
> +	struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> +	struct drm_device *drm =3D dpu->crtc.dev;
> +
> +	DRM_INFO("%s()\n", __func__);
> +
> +	/* add if condition to avoid suspend dpu for SR feature */
> +	if (crtc->state->mode_changed && !crtc->state->active_changed)
> +		return;
> +
> +	sprd_crtc_wait_last_commit_complete(crtc);
> +
> +	disable_irq(dpu->ctx.irq);
> +
> +	sprd_dpu_uninit(dpu);
> +
> +	pm_runtime_put(dpu->dev.parent);
> +
> +	spin_lock_irq(&drm->event_lock);
> +	if (crtc->state->event) {
> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +		crtc->state->event =3D NULL;
> +	}
> +	spin_unlock_irq(&drm->event_lock);
> +}
> +
> +static int sprd_crtc_atomic_check(struct drm_crtc *crtc,
> +				 struct drm_crtc_state *state)
> +{
> +	DRM_DEBUG("%s()\n", __func__);
> +
> +	return 0;
> +}
> +
> +static void sprd_crtc_atomic_begin(struct drm_crtc *crtc,
> +				  struct drm_crtc_state *old_state)
> +{
> +	struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> +
> +	DRM_DEBUG("%s()\n", __func__);
> +
> +	down(&dpu->ctx.refresh_lock);
> +
> +	memset(dpu->layers, 0, sizeof(*dpu->layers) * dpu->pending_planes);
> +
> +	dpu->pending_planes =3D 0;
> +}
> +
> +static void sprd_crtc_atomic_flush(struct drm_crtc *crtc,
> +				  struct drm_crtc_state *old_state)
> +
> +{
> +	struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> +	struct drm_device *drm =3D dpu->crtc.dev;
> +
> +	DRM_DEBUG("%s()\n", __func__);
> +
> +	if (dpu->core && dpu->core->flip &&
> +	    dpu->pending_planes && !dpu->ctx.disable_flip)
> +		dpu->core->flip(&dpu->ctx, dpu->layers, dpu->pending_planes);
> +
> +	up(&dpu->ctx.refresh_lock);
> +
> +	spin_lock_irq(&drm->event_lock);
> +	if (crtc->state->event) {
> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +		crtc->state->event =3D NULL;
> +	}
> +	spin_unlock_irq(&drm->event_lock);
> +}
> +
> +static int sprd_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> +
> +	DRM_DEBUG("%s()\n", __func__);
> +
> +	if (dpu->core && dpu->core->enable_vsync)
> +		dpu->core->enable_vsync(&dpu->ctx);
> +
> +	return 0;
> +}
> +
> +static void sprd_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> +
> +	DRM_DEBUG("%s()\n", __func__);
> +
> +	if (dpu->core && dpu->core->disable_vsync)
> +		dpu->core->disable_vsync(&dpu->ctx);
> +}
> +
> +static int sprd_crtc_create_properties(struct drm_crtc *crtc)
> +{
> +	struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> +	struct drm_device *drm =3D dpu->crtc.dev;
> +	struct drm_property *prop;
> +	struct drm_property_blob *blob;
> +	size_t blob_size;
> +
> +	blob_size =3D strlen(dpu->ctx.version) + 1;
> +
> +	blob =3D drm_property_create_blob(dpu->crtc.dev, blob_size,
> +			dpu->ctx.version);
> +	if (IS_ERR(blob)) {
> +		DRM_ERROR("drm_property_create_blob dpu version failed\n");
> +		return PTR_ERR(blob);
> +	}
> +
> +	/* create dpu version property */
> +	prop =3D drm_property_create(drm,
> +		DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
> +		"dpu version", 0);
> +	if (!prop) {
> +		DRM_ERROR("drm_property_create dpu version failed\n");
> +		return -ENOMEM;
> +	}
> +	drm_object_attach_property(&crtc->base, prop, blob->base.id);
> +
> +	/* create corner size property */
> +	prop =3D drm_property_create(drm,
> +		DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_RANGE,
> +		"corner size", 0);
> +	if (!prop) {
> +		DRM_ERROR("drm_property_create corner size failed\n");
> +		return -ENOMEM;
> +	}
> +	drm_object_attach_property(&crtc->base, prop, dpu->ctx.corner_size);
> +
> +	return 0;
> +}
> +
> +static const struct drm_crtc_helper_funcs sprd_crtc_helper_funcs =3D {=

> +	.mode_set_nofb	=3D sprd_crtc_mode_set_nofb,
> +	.mode_valid	=3D sprd_crtc_mode_valid,
> +	.atomic_check	=3D sprd_crtc_atomic_check,
> +	.atomic_begin	=3D sprd_crtc_atomic_begin,
> +	.atomic_flush	=3D sprd_crtc_atomic_flush,
> +	.atomic_enable	=3D sprd_crtc_atomic_enable,
> +	.atomic_disable	=3D sprd_crtc_atomic_disable,
> +};
> +
> +static const struct drm_crtc_funcs sprd_crtc_funcs =3D {
> +	.destroy	=3D drm_crtc_cleanup,
> +	.set_config	=3D drm_atomic_helper_set_config,
> +	.page_flip	=3D drm_atomic_helper_page_flip,
> +	.reset		=3D drm_atomic_helper_crtc_reset,
> +	.atomic_duplicate_state	=3D drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state	=3D drm_atomic_helper_crtc_destroy_state,
> +	.enable_vblank	=3D sprd_crtc_enable_vblank,
> +	.disable_vblank	=3D sprd_crtc_disable_vblank,
> +};
> +
> +static int sprd_crtc_init(struct drm_device *drm, struct drm_crtc *crt=
c,
> +			 struct drm_plane *primary)
> +{
> +	struct device_node *port;
> +	int err;
> +
> +	/*
> +	 * set crtc port so that drm_of_find_possible_crtcs call works
> +	 */
> +	port =3D of_parse_phandle(drm->dev->of_node, "ports", 0);
> +	if (!port) {
> +		DRM_ERROR("find 'ports' phandle of %s failed\n",
> +			  drm->dev->of_node->full_name);
> +		return -EINVAL;
> +	}
> +	of_node_put(port);
> +	crtc->port =3D port;
> +
> +	err =3D drm_crtc_init_with_planes(drm, crtc, primary, NULL,
> +					&sprd_crtc_funcs, NULL);
> +	if (err) {
> +		DRM_ERROR("failed to init crtc.\n");
> +		return err;
> +	}
> +
> +	drm_mode_crtc_set_gamma_size(crtc, 256);
> +
> +	drm_crtc_helper_add(crtc, &sprd_crtc_helper_funcs);
> +
> +	sprd_crtc_create_properties(crtc);
> +
> +	DRM_INFO("%s() ok\n", __func__);
> +	return 0;
> +}
> +
> +int sprd_dpu_run(struct sprd_dpu *dpu)
> +{
> +	struct dpu_context *ctx =3D &dpu->ctx;
> +
> +	down(&ctx->refresh_lock);
> +
> +	if (!ctx->is_inited) {
> +		DRM_ERROR("dpu is not initialized\n");
> +		up(&ctx->refresh_lock);
> +		return -EINVAL;
> +	}
> +
> +	if (!ctx->is_stopped) {
> +		up(&ctx->refresh_lock);
> +		return 0;
> +	}
> +
> +	if (dpu->core && dpu->core->run)
> +		dpu->core->run(ctx);
> +
> +	up(&ctx->refresh_lock);
> +
> +	drm_crtc_vblank_on(&dpu->crtc);
> +
> +	return 0;
> +}
> +
> +int sprd_dpu_stop(struct sprd_dpu *dpu)
> +{
> +	struct dpu_context *ctx =3D &dpu->ctx;
> +
> +	down(&ctx->refresh_lock);
> +
> +	if (!ctx->is_inited) {
> +		DRM_ERROR("dpu is not initialized\n");
> +		up(&ctx->refresh_lock);
> +		return -EINVAL;
> +	}
> +
> +	if (ctx->is_stopped) {
> +		up(&ctx->refresh_lock);
> +		return 0;
> +	}
> +
> +	if (dpu->core && dpu->core->stop)
> +		dpu->core->stop(ctx);
> +
> +	up(&ctx->refresh_lock);
> +
> +	drm_crtc_handle_vblank(&dpu->crtc);
> +	drm_crtc_vblank_off(&dpu->crtc);
> +
> +	return 0;
> +}
> +
> +static int sprd_dpu_init(struct sprd_dpu *dpu)
> +{
> +	struct dpu_context *ctx =3D &dpu->ctx;
> +
> +	down(&ctx->refresh_lock);
> +
> +	if (dpu->ctx.is_inited) {
> +		up(&ctx->refresh_lock);
> +		return 0;
> +	}
> +
> +	if (dpu->glb && dpu->glb->power)
> +		dpu->glb->power(ctx, true);
> +	if (dpu->glb && dpu->glb->enable)
> +		dpu->glb->enable(ctx);
> +
> +	if (ctx->is_stopped && dpu->glb && dpu->glb->reset)
> +		dpu->glb->reset(ctx);
> +
> +	if (dpu->clk && dpu->clk->init)
> +		dpu->clk->init(ctx);
> +	if (dpu->clk && dpu->clk->enable)
> +		dpu->clk->enable(ctx);
> +
> +	if (dpu->core && dpu->core->init)
> +		dpu->core->init(ctx);
> +	if (dpu->core && dpu->core->ifconfig)
> +		dpu->core->ifconfig(ctx);
> +
> +	ctx->is_inited =3D true;
> +
> +	up(&ctx->refresh_lock);
> +
> +	return 0;
> +}
> +
> +static int sprd_dpu_uninit(struct sprd_dpu *dpu)
> +{
> +	struct dpu_context *ctx =3D &dpu->ctx;
> +
> +	down(&ctx->refresh_lock);
> +
> +	if (!dpu->ctx.is_inited) {
> +		up(&ctx->refresh_lock);
> +		return 0;
> +	}
> +
> +	if (dpu->core && dpu->core->uninit)
> +		dpu->core->uninit(ctx);
> +	if (dpu->clk && dpu->clk->disable)
> +		dpu->clk->disable(ctx);
> +	if (dpu->glb && dpu->glb->disable)
> +		dpu->glb->disable(ctx);
> +	if (dpu->glb && dpu->glb->power)
> +		dpu->glb->power(ctx, false);
> +
> +	ctx->is_inited =3D false;
> +
> +	up(&ctx->refresh_lock);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t sprd_dpu_isr(int irq, void *data)
> +{
> +	struct sprd_dpu *dpu =3D data;
> +	struct dpu_context *ctx =3D &dpu->ctx;
> +	u32 int_mask =3D 0;
> +
> +	if (dpu->core && dpu->core->isr)
> +		int_mask =3D dpu->core->isr(ctx);
> +
> +	if (int_mask & DISPC_INT_TE_MASK) {
> +		if (ctx->te_check_en) {
> +			ctx->evt_te =3D true;
> +			wake_up_interruptible_all(&ctx->te_wq);
> +		}
> +	}
> +
> +	if (int_mask & DISPC_INT_ERR_MASK)
> +		DRM_WARN("Warning: dpu underflow!\n");
> +
> +	if ((int_mask & DISPC_INT_DPI_VSYNC_MASK) && ctx->is_inited)
> +		drm_crtc_handle_vblank(&dpu->crtc);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int sprd_dpu_irq_request(struct sprd_dpu *dpu)
> +{
> +	int err;
> +	int irq_num;
> +
> +	irq_num =3D irq_of_parse_and_map(dpu->dev.of_node, 0);
> +	if (!irq_num) {
> +		DRM_ERROR("error: dpu parse irq num failed\n");
> +		return -EINVAL;
> +	}
> +	DRM_INFO("dpu irq_num =3D %d\n", irq_num);
> +
> +	irq_set_status_flags(irq_num, IRQ_NOAUTOEN);
> +	err =3D devm_request_irq(&dpu->dev, irq_num, sprd_dpu_isr,
> +					0, "DISPC", dpu);
> +	if (err) {
> +		DRM_ERROR("error: dpu request irq failed\n");
> +		return -EINVAL;
> +	}
> +	dpu->ctx.irq =3D irq_num;
> +	dpu->ctx.dpu_isr =3D sprd_dpu_isr;
> +
> +	return 0;
> +}
> +
> +static int sprd_dpu_bind(struct device *dev, struct device *master, vo=
id *data)
> +{
> +	struct drm_device *drm =3D data;
> +	struct sprd_drm *sprd =3D drm->dev_private;
> +	struct sprd_dpu *dpu =3D dev_get_drvdata(dev);
> +	struct drm_plane *plane;
> +	int err;
> +
> +	DRM_INFO("%s()\n", __func__);
> +
> +	plane =3D sprd_plane_init(drm, dpu);
> +	if (IS_ERR_OR_NULL(plane)) {
> +		err =3D PTR_ERR(plane);
> +		return err;
> +	}
> +
> +	err =3D sprd_crtc_init(drm, &dpu->crtc, plane);
> +	if (err)
> +		return err;
> +
> +	sprd_dpu_irq_request(dpu);
> +
> +	sprd->dpu_dev =3D dev;
> +
> +	return 0;
> +}
> +
> +static void sprd_dpu_unbind(struct device *dev, struct device *master,=

> +	void *data)
> +{
> +	struct sprd_dpu *dpu =3D dev_get_drvdata(dev);
> +
> +	DRM_INFO("%s()\n", __func__);
> +
> +	drm_crtc_cleanup(&dpu->crtc);
> +}
> +
> +static const struct component_ops dpu_component_ops =3D {
> +	.bind =3D sprd_dpu_bind,
> +	.unbind =3D sprd_dpu_unbind,
> +};
> +
> +static int sprd_dpu_context_init(struct sprd_dpu *dpu,
> +				struct device_node *np)
> +{
> +	u32 temp;
> +	struct resource r;
> +	struct dpu_context *ctx =3D &dpu->ctx;
> +
> +	if (dpu->core && dpu->core->parse_dt)
> +		dpu->core->parse_dt(&dpu->ctx, np);
> +	if (dpu->clk && dpu->clk->parse_dt)
> +		dpu->clk->parse_dt(&dpu->ctx, np);
> +	if (dpu->glb && dpu->glb->parse_dt)
> +		dpu->glb->parse_dt(&dpu->ctx, np);
> +
> +	if (!of_property_read_u32(np, "sprd,dev-id", &temp))
> +		ctx->id =3D temp;
> +
> +	if (of_address_to_resource(np, 0, &r)) {
> +		DRM_ERROR("parse dt base address failed\n");
> +		return -ENODEV;
> +	}
> +	ctx->base =3D (unsigned long)ioremap_nocache(r.start,
> +					resource_size(&r));
> +	if (ctx->base =3D=3D 0) {
> +		DRM_ERROR("ioremap base address failed\n");
> +		return -EFAULT;
> +	}
> +
> +	of_get_logo_memory_info(dpu, np);
> +
> +	sema_init(&ctx->refresh_lock, 1);
> +
> +	return 0;
> +}
> +
> +static int sprd_dpu_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct sprd_dpu *dpu;
> +	int ret;
> +
> +	dpu =3D devm_kzalloc(&pdev->dev, sizeof(*dpu), GFP_KERNEL);
> +	if (!dpu)
> +		return -ENOMEM;
> +
> +	ret =3D sprd_dpu_context_init(dpu, np);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, dpu);
> +	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	return component_add(&pdev->dev, &dpu_component_ops);
> +}
> +
> +static int sprd_dpu_remove(struct platform_device *pdev)
> +{
> +	component_del(&pdev->dev, &dpu_component_ops);
> +	return 0;
> +}
> +
> +static const struct of_device_id dpu_match_table[] =3D {
> +	{ .compatible =3D "sprd,display-processor",},
> +	{},
> +};
> +
> +static struct platform_driver sprd_dpu_driver =3D {
> +	.probe =3D sprd_dpu_probe,
> +	.remove =3D sprd_dpu_remove,
> +	.driver =3D {
> +		.name =3D "sprd-dpu-drv",
> +		.of_match_table =3D dpu_match_table,
> +	},
> +};
> +module_platform_driver(sprd_dpu_driver);
> +
> +MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
> +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
> +MODULE_DESCRIPTION("Unisoc Display Controller Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/sprd/sprd_dpu.h b/drivers/gpu/drm/sprd/spr=
d_dpu.h
> new file mode 100644
> index 0000000..998ebc7
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_dpu.h
> @@ -0,0 +1,217 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
> + */
> +
> +#ifndef __SPRD_DPU_H__
> +#define __SPRD_DPU_H__
> +
> +#include <linux/bug.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/string.h>
> +#include <video/videomode.h>
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_vblank.h>
> +#include <uapi/drm/drm_mode.h>
> +#include "disp_lib.h"
> +
> +#define DISPC_INT_DONE_MASK		BIT(0)
> +#define DISPC_INT_TE_MASK		BIT(1)
> +#define DISPC_INT_ERR_MASK		BIT(2)
> +#define DISPC_INT_EDPI_TE_MASK		BIT(3)
> +#define DISPC_INT_UPDATE_DONE_MASK	BIT(4)
> +#define DISPC_INT_DPI_VSYNC_MASK	BIT(5)
> +#define DISPC_INT_WB_DONE_MASK		BIT(6)
> +#define DISPC_INT_WB_FAIL_MASK		BIT(7)
> +
> +/* NOTE: this mask is not a realy dpu interrupt mask */
> +#define DISPC_INT_FENCE_SIGNAL_REQUEST	BIT(31)
> +
> +enum {
> +	SPRD_DISPC_IF_DBI =3D 0,
> +	SPRD_DISPC_IF_DPI,
> +	SPRD_DISPC_IF_EDPI,
> +	SPRD_DISPC_IF_LIMIT
> +};
> +
> +enum {
> +	SPRD_IMG_DATA_ENDIAN_B0B1B2B3 =3D 0,
> +	SPRD_IMG_DATA_ENDIAN_B3B2B1B0,
> +	SPRD_IMG_DATA_ENDIAN_B2B3B0B1,
> +	SPRD_IMG_DATA_ENDIAN_B1B0B3B2,
> +	SPRD_IMG_DATA_ENDIAN_LIMIT
> +};
> +
> +enum {
> +	DISPC_CLK_ID_CORE =3D 0,
> +	DISPC_CLK_ID_DBI,
> +	DISPC_CLK_ID_DPI,
> +	DISPC_CLK_ID_MAX
> +};
> +
> +enum {
> +	ENHANCE_CFG_ID_ENABLE,
> +	ENHANCE_CFG_ID_DISABLE,
> +	ENHANCE_CFG_ID_SCL,
> +	ENHANCE_CFG_ID_EPF,
> +	ENHANCE_CFG_ID_HSV,
> +	ENHANCE_CFG_ID_CM,
> +	ENHANCE_CFG_ID_SLP,
> +	ENHANCE_CFG_ID_GAMMA,
> +	ENHANCE_CFG_ID_LTM,
> +	ENHANCE_CFG_ID_CABC,
> +	ENHANCE_CFG_ID_SLP_LUT,
> +	ENHANCE_CFG_ID_LUT3D,
> +	ENHANCE_CFG_ID_MAX
> +};
> +
> +struct sprd_dpu_layer {
> +	u8 index;
> +	u8 planes;
> +	u32 addr[4];
> +	u32 pitch[4];
> +	s16 src_x;
> +	s16 src_y;
> +	s16 src_w;
> +	s16 src_h;
> +	s16 dst_x;
> +	s16 dst_y;
> +	u16 dst_w;
> +	u16 dst_h;
> +	u32 format;
> +	u32 alpha;
> +	u32 blending;
> +	u32 rotation;
> +	u32 xfbc;
> +	u32 height;
> +	u32 header_size_r;
> +	u32 header_size_y;
> +	u32 header_size_uv;
> +	u32 y2r_coef;
> +	u8 pallete_en;
> +	u32 pallete_color;
> +};
> +
> +struct dpu_capability {
> +	u32 max_layers;
> +	const u32 *fmts_ptr;
> +	u32 fmts_cnt;
> +};
> +
> +struct dpu_context;
> +
> +struct dpu_core_ops {
> +	int (*parse_dt)(struct dpu_context *ctx,
> +			struct device_node *np);
> +	u32 (*version)(struct dpu_context *ctx);
> +	int (*init)(struct dpu_context *ctx);
> +	void (*uninit)(struct dpu_context *ctx);
> +	void (*run)(struct dpu_context *ctx);
> +	void (*stop)(struct dpu_context *ctx);
> +	void (*disable_vsync)(struct dpu_context *ctx);
> +	void (*enable_vsync)(struct dpu_context *ctx);
> +	u32 (*isr)(struct dpu_context *ctx);
> +	void (*ifconfig)(struct dpu_context *ctx);
> +	void (*write_back)(struct dpu_context *ctx, u8 count, bool debug);
> +	void (*flip)(struct dpu_context *ctx,
> +		     struct sprd_dpu_layer layers[], u8 count);
> +	int (*capability)(struct dpu_context *ctx,
> +			struct dpu_capability *cap);
> +	void (*bg_color)(struct dpu_context *ctx, u32 color);
> +	void (*enhance_set)(struct dpu_context *ctx, u32 id, void *param);
> +	void (*enhance_get)(struct dpu_context *ctx, u32 id, void *param);
> +	int (*modeset)(struct dpu_context *ctx,
> +			struct drm_mode_modeinfo *mode);
> +	bool (*check_raw_int)(struct dpu_context *ctx, u32 mask);
> +};
> +
> +struct dpu_clk_ops {
> +	int (*parse_dt)(struct dpu_context *ctx,
> +			struct device_node *np);
> +	int (*init)(struct dpu_context *ctx);
> +	int (*uinit)(struct dpu_context *ctx);
> +	int (*enable)(struct dpu_context *ctx);
> +	int (*disable)(struct dpu_context *ctx);
> +	int (*update)(struct dpu_context *ctx, int clk_id, int val);
> +};
> +
> +struct dpu_glb_ops {
> +	int (*parse_dt)(struct dpu_context *ctx,
> +			struct device_node *np);
> +	void (*enable)(struct dpu_context *ctx);
> +	void (*disable)(struct dpu_context *ctx);
> +	void (*reset)(struct dpu_context *ctx);
> +	void (*power)(struct dpu_context *ctx, int enable);
> +};
> +
> +struct dpu_context {
> +	unsigned long base;
> +	u32 base_offset[2];
> +	const char *version;
> +	u32 corner_size;
> +	int irq;
> +	u8 if_type;
> +	u8 id;
> +	bool is_inited;
> +	bool is_stopped;
> +	bool disable_flip;
> +	struct videomode vm;
> +	struct semaphore refresh_lock;
> +	struct work_struct wb_work;
> +	struct tasklet_struct dvfs_task;
> +	u32 wb_addr_p;
> +	irqreturn_t (*dpu_isr)(int irq, void *data);
> +	wait_queue_head_t te_wq;
> +	bool te_check_en;
> +	bool evt_te;
> +	unsigned long logo_addr;
> +	unsigned long logo_size;
> +	struct work_struct cabc_work;
> +	struct work_struct cabc_bl_update;
> +};
> +
> +struct sprd_dpu {
> +	struct device dev;
> +	struct drm_crtc crtc;
> +	struct dpu_context ctx;
> +	struct dpu_core_ops *core;
> +	struct dpu_clk_ops *clk;
> +	struct dpu_glb_ops *glb;
> +	struct drm_display_mode *mode;
> +	struct sprd_dpu_layer *layers;
> +	u8 pending_planes;
> +};
> +
> +extern struct list_head dpu_core_head;
> +extern struct list_head dpu_clk_head;
> +extern struct list_head dpu_glb_head;
> +
> +static inline struct sprd_dpu *crtc_to_dpu(struct drm_crtc *crtc)
> +{
> +	return crtc ? container_of(crtc, struct sprd_dpu, crtc) : NULL;
> +}
> +
> +#define dpu_core_ops_register(entry) \
> +	disp_ops_register(entry, &dpu_core_head)
> +#define dpu_clk_ops_register(entry) \
> +	disp_ops_register(entry, &dpu_clk_head)
> +#define dpu_glb_ops_register(entry) \
> +	disp_ops_register(entry, &dpu_glb_head)
> +
> +#define dpu_core_ops_attach(str) \
> +	disp_ops_attach(str, &dpu_core_head)
> +#define dpu_clk_ops_attach(str) \
> +	disp_ops_attach(str, &dpu_clk_head)
> +#define dpu_glb_ops_attach(str) \
> +	disp_ops_attach(str, &dpu_glb_head)
> +
> +int sprd_dpu_run(struct sprd_dpu *dpu);
> +int sprd_dpu_stop(struct sprd_dpu *dpu);
> +
> +#endif
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--M4qYQZLBKjx32qPDQqLM28oi2ayGH6uYt--

--esrGSde6ivD08pWYafl7kb8thvey53cuE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3vdykACgkQaA3BHVML
eiMjuwf/YE6hWq15ipb+xwK9YbYmQmEmzGwxacSm9x275BRqsJroKHr2RA69N+s4
YfIav9xdVWqOlNFXFC7NGRpo9BtpkKKj63t1vP/BMDhN08Y0V7pDsKdFCRL8GqR1
bMsuSId9Z1BtChenUWr8VUkxhM1IyT4XdedG8gF+zxZTI8/OjK6g8E0nMCRGywqi
SwdJNZeermWM7R4ABV5hBgiBiPyyIDlkRjQGL8L4bXuhaYqAtJEYqF0H2AGQeByS
sKSAlnZN0QehdSaYFPrbXLLztfmVDR99niYJEOcpHgdIWDlqADyR74z46l+fghP9
R2qpA1Ui0VI0mGv/v3IgEJc2u0UjFQ==
=iGf7
-----END PGP SIGNATURE-----

--esrGSde6ivD08pWYafl7kb8thvey53cuE--

--===============0832840943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0832840943==--
