Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6508204BC7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84CB6E237;
	Tue, 23 Jun 2020 07:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28116E237
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 07:59:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BAB6DAD8C;
 Tue, 23 Jun 2020 07:59:27 +0000 (UTC)
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
To: Sam Ravnborg <sam@ravnborg.org>, Deepak Rawat <drawat.floss@gmail.com>
References: <20200622110623.113546-1-drawat.floss@gmail.com>
 <20200622110623.113546-2-drawat.floss@gmail.com>
 <20200622151913.GA655276@ravnborg.org>
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
Message-ID: <ea38c268-01e6-e43e-343d-a413142d450f@suse.de>
Date: Tue, 23 Jun 2020 09:59:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200622151913.GA655276@ravnborg.org>
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 David Airlie <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>, Jork Loeser <jloeser@microsoft.com>,
 Wei Hu <weh@microsoft.com>, K Y Srinivasan <kys@microsoft.com>
Content-Type: multipart/mixed; boundary="===============1546372936=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1546372936==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ABgYXB2kI2ib2fyUo64GFuVGCV5STUjRM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ABgYXB2kI2ib2fyUo64GFuVGCV5STUjRM
Content-Type: multipart/mixed; boundary="rtesIFpTpkRIy1pAq4CEM3NNavW4t8mtU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, Deepak Rawat <drawat.floss@gmail.com>
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 David Airlie <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>, Jork Loeser
 <jloeser@microsoft.com>, Wei Hu <weh@microsoft.com>,
 K Y Srinivasan <kys@microsoft.com>
Message-ID: <ea38c268-01e6-e43e-343d-a413142d450f@suse.de>
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
References: <20200622110623.113546-1-drawat.floss@gmail.com>
 <20200622110623.113546-2-drawat.floss@gmail.com>
 <20200622151913.GA655276@ravnborg.org>
In-Reply-To: <20200622151913.GA655276@ravnborg.org>

--rtesIFpTpkRIy1pAq4CEM3NNavW4t8mtU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Deepak

I did not receive you pat series, so I can only comment on Sam's reply.
See below for some points.

Am 22.06.20 um 17:19 schrieb Sam Ravnborg:
> Hi Deepak
>=20
> On Mon, Jun 22, 2020 at 04:06:22AM -0700, Deepak Rawat wrote:
>> DRM driver for hyperv synthetic video device, based on hyperv_fb
>> framebuffer driver. Also added config option "DRM_HYPERV" to enabled
>> this driver.
>=20
> Just a buch of drive-by comments while browsing the code.
> In general code looks good, especialyl for a v1.
>=20
> There is a few places that triggers warnings with checkpatch --strict
> Most looks like things that should be fixed.
>=20
>=20
> 	Sam
>=20
>>
>> Signed-off-by: Deepak Rawat <drawat.floss@gmail.com>
>> ---
>>  drivers/gpu/drm/tiny/Kconfig      |    9 +
>>  drivers/gpu/drm/tiny/Makefile     |    1 +
>>  drivers/gpu/drm/tiny/hyperv_drm.c | 1007 ++++++++++++++++++++++++++++=
+
>>  3 files changed, 1017 insertions(+)
>>  create mode 100644 drivers/gpu/drm/tiny/hyperv_drm.c
>>
>> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconf=
ig
>> index 2b6414f0fa75..e6d53e60a9c2 100644
>> --- a/drivers/gpu/drm/tiny/Kconfig
>> +++ b/drivers/gpu/drm/tiny/Kconfig
>> @@ -28,6 +28,15 @@ config DRM_GM12U320
>>  	 This is a KMS driver for projectors which use the GM12U320 chipset
>>  	 for video transfer over USB2/3, such as the Acer C120 mini projecto=
r.
>> =20
>> +config DRM_HYPERV
>> +	tristate "DRM Support for hyperv synthetic video device"
>> +	depends on DRM && PCI && MMU && HYPERV
>> +	select DRM_KMS_HELPER
>> +	select DRM_GEM_SHMEM_HELPER
>> +	help
>> +	 This is a KMS driver for for hyperv synthetic video device.
>> +	 If M is selected the module will be called hyperv_drm.
>> +
>>  config TINYDRM_HX8357D
>>  	tristate "DRM support for HX8357D display panels"
>>  	depends on DRM && SPI
>> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Make=
file
>> index 6ae4e9e5a35f..837cb2c2637e 100644
>> --- a/drivers/gpu/drm/tiny/Makefile
>> +++ b/drivers/gpu/drm/tiny/Makefile
>> @@ -2,6 +2,7 @@
>> =20
>>  obj-$(CONFIG_DRM_CIRRUS_QEMU)		+=3D cirrus.o
>>  obj-$(CONFIG_DRM_GM12U320)		+=3D gm12u320.o
>> +obj-$(CONFIG_DRM_HYPERV)		+=3D hyperv_drm.o
>>  obj-$(CONFIG_TINYDRM_HX8357D)		+=3D hx8357d.o
>>  obj-$(CONFIG_TINYDRM_ILI9225)		+=3D ili9225.o
>>  obj-$(CONFIG_TINYDRM_ILI9341)		+=3D ili9341.o
>> diff --git a/drivers/gpu/drm/tiny/hyperv_drm.c b/drivers/gpu/drm/tiny/=
hyperv_drm.c
>> new file mode 100644
>> index 000000000000..3d020586056e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tiny/hyperv_drm.c
>> @@ -0,0 +1,1007 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright 2012-2020 Microsoft
>> + *
>> + * Authors:
>> + * Deepak Rawat <drawat.floss@gmail.com>
>> + *
>> + * Portions of this code is derived from hyperv_fb.c
>> + * drivers/video/fbdev/hyperv_fb.c - framebuffer driver for hyperv sy=
nthetic
>> + * video device.
>> + *
>> + */
>> +
>> +#include <linux/console.h>
>> +#include <linux/module.h>
>> +#include <linux/pci.h>
>> +#include <linux/hyperv.h>
> Alphabetic order.
>> +
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_atomic_state_helper.h>
>> +#include <drm/drm_connector.h>
>> +#include <drm/drm_damage_helper.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_fb_helper.h>
>> +#include <drm/drm_file.h>
> Needed?
>=20
>> +#include <drm/drm_format_helper.h>
>> +#include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_shmem_helper.h>
>> +#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_ioctl.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/drm_modeset_helper_vtables.h>
>> +#include <drm/drm_probe_helper.h>
>> +#include <drm/drm_simple_kms_helper.h>
>=20
>> +
>> +#define DRIVER_NAME "hyperv_drm"
>> +#define DRIVER_DESC "DRM driver for hyperv synthetic video device"
>> +#define DRIVER_DATE "2020"
>> +#define DRIVER_MAJOR 1
>> +#define DRIVER_MINOR 0
>> +
>> +#define VMBUS_MAX_PACKET_SIZE 0x4000
>> +#define VMBUS_RING_BUFSIZE (256 * 1024)
>> +#define VMBUS_VSP_TIMEOUT (10 * HZ)
>> +
>> +#define PCI_VENDOR_ID_MICROSOFT 0x1414
>> +#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
>> +
>> +struct hyperv_device {
>=20
> This is much more than a device - maybe just name it "struct hv"?

I think hyperv_device is good. And it's much more than just 'hv'.

>=20
>> +	/* drm */
>> +	struct drm_device dev;
>> +	struct drm_simple_display_pipe pipe;
>> +	struct drm_connector connector;
>> +
>> +	/* mode */
>> +	u32 screen_width_max;
>> +	u32 screen_height_max;
>> +	u32 preferred_width;
>> +	u32 preferred_height;
>> +	u32 screen_depth;
>> +
>> +	/* hw */
>> +	void __iomem *vram;
>> +	unsigned long fb_base;
>> +	unsigned long fb_size;
>> +	struct completion wait;
>> +	u32 synthvid_version;
>> +	u32 mmio_megabytes;
>> +	bool init_done;

This field is unused. Please remove.

>> +
>> +	u8 init_buf[VMBUS_MAX_PACKET_SIZE];
>> +	u8 recv_buf[VMBUS_MAX_PACKET_SIZE];
>> +
>> +	struct hv_device *hdev;
>> +};
>> +
>> +#define to_hv(_dev) container_of(_dev, struct hyperv_device, dev)

Could this be a function?

>> +
>> +/* ------------------------------------------------------------------=
---- */
>> +/* Hyper-V Synthetic Video Protocol                                  =
     */

The comments look awkward. Unless this style has been used within DRM,
maybe just use

 /*
  * ...
  */

>> +
>> +#define SYNTHVID_VERSION(major, minor) ((minor) << 16 | (major))
>> +#define SYNTHVID_VER_GET_MAJOR(ver) (ver & 0x0000ffff)
>> +#define SYNTHVID_VER_GET_MINOR(ver) ((ver & 0xffff0000) >> 16)
>> +#define SYNTHVID_VERSION_WIN7 SYNTHVID_VERSION(3, 0)
>> +#define SYNTHVID_VERSION_WIN8 SYNTHVID_VERSION(3, 2)
>> +#define SYNTHVID_VERSION_WIN10 SYNTHVID_VERSION(3, 5)
>> +
>> +#define SYNTHVID_DEPTH_WIN7 16
>> +#define SYNTHVID_DEPTH_WIN8 32
>> +#define SYNTHVID_FB_SIZE_WIN7 (4 * 1024 * 1024)
>> +#define SYNTHVID_FB_SIZE_WIN8 (8 * 1024 * 1024)
>> +#define SYNTHVID_WIDTH_MAX_WIN7 1600
>> +#define SYNTHVID_HEIGHT_MAX_WIN7 1200
>> +
>> +enum pipe_msg_type {
>> +	PIPE_MSG_INVALID,
>> +	PIPE_MSG_DATA,
>> +	PIPE_MSG_MAX
>> +};
>> +
>> +enum synthvid_msg_type {
>> +	SYNTHVID_ERROR			=3D 0,
>> +	SYNTHVID_VERSION_REQUEST	=3D 1,
>> +	SYNTHVID_VERSION_RESPONSE	=3D 2,
>> +	SYNTHVID_VRAM_LOCATION		=3D 3,
>> +	SYNTHVID_VRAM_LOCATION_ACK	=3D 4,
>> +	SYNTHVID_SITUATION_UPDATE	=3D 5,
>> +	SYNTHVID_SITUATION_UPDATE_ACK	=3D 6,
>> +	SYNTHVID_POINTER_POSITION	=3D 7,
>> +	SYNTHVID_POINTER_SHAPE		=3D 8,
>> +	SYNTHVID_FEATURE_CHANGE		=3D 9,
>> +	SYNTHVID_DIRT			=3D 10,
>> +	SYNTHVID_RESOLUTION_REQUEST	=3D 13,
>> +	SYNTHVID_RESOLUTION_RESPONSE	=3D 14,
>> +
>> +	SYNTHVID_MAX			=3D 15
>> +};
>> +
>> +struct pipe_msg_hdr {
>> +	u32 type;
>> +	u32 size; /* size of message after this field */
>> +} __packed;
>> +
>> +struct hvd_screen_info {
>> +	u16 width;
>> +	u16 height;
>> +} __packed;
>> +
>> +struct synthvid_msg_hdr {
>> +	u32 type;
>> +	u32 size;  /* size of this header + payload after this field*/
> Add space before closing "*/"
>=20
> I wonder what is the difference between what is considered a message an=
d
> what is considered payload in the above comments.
> Maybe that just because I do not know this stuff at all and the comment=

> can be ignored.
>=20
>> +} __packed;
>> +
>> +struct synthvid_version_req {
>> +	u32 version;
>> +} __packed;
>> +
>> +struct synthvid_version_resp {
>> +	u32 version;
>> +	u8 is_accepted;
>> +	u8 max_video_outputs;
>> +} __packed;
>> +
>> +struct synthvid_vram_location {
>> +	u64 user_ctx;
>> +	u8 is_vram_gpa_specified;
>> +	u64 vram_gpa;
>> +} __packed;
> Not an alignmnet friendly layout - but I guess the layout is fixed.
> Same goes in otther places.
>=20
>> +
>> +struct synthvid_vram_location_ack {
>> +	u64 user_ctx;
>> +} __packed;
>> +
>> +struct video_output_situation {
>> +	u8 active;
>> +	u32 vram_offset;
>> +	u8 depth_bits;
>> +	u32 width_pixels;
>> +	u32 height_pixels;
>> +	u32 pitch_bytes;
>> +} __packed;
>> +
>> +struct synthvid_situation_update {
>> +	u64 user_ctx;
>> +	u8 video_output_count;
>> +	struct video_output_situation video_output[1];
>> +} __packed;
>> +
>> +struct synthvid_situation_update_ack {
>> +	u64 user_ctx;
>> +} __packed;
>> +
>> +struct synthvid_pointer_position {
>> +	u8 is_visible;
>> +	u8 video_output;
>> +	s32 image_x;
>> +	s32 image_y;
>> +} __packed;
>> +
>> +#define SYNTHVID_CURSOR_MAX_X 96
>> +#define SYNTHVID_CURSOR_MAX_Y 96
>> +#define SYNTHVID_CURSOR_ARGB_PIXEL_SIZE 4
>> +#define SYNTHVID_CURSOR_MAX_SIZE (SYNTHVID_CURSOR_MAX_X * \
>> +	SYNTHVID_CURSOR_MAX_Y * SYNTHVID_CURSOR_ARGB_PIXEL_SIZE)
>> +#define SYNTHVID_CURSOR_COMPLETE (-1)
>> +
>> +struct synthvid_pointer_shape {
>> +	u8 part_idx;
>> +	u8 is_argb;
>> +	u32 width; /* SYNTHVID_CURSOR_MAX_X at most */
>> +	u32 height; /* SYNTHVID_CURSOR_MAX_Y at most */
>> +	u32 hot_x; /* hotspot relative to upper-left of pointer image */
>> +	u32 hot_y;
>> +	u8 data[4];
>> +} __packed;
>> +
>> +struct synthvid_feature_change {
>> +	u8 is_dirt_needed;
>> +	u8 is_ptr_pos_needed;
>> +	u8 is_ptr_shape_needed;
>> +	u8 is_situ_needed;
>> +} __packed;
>> +
>> +struct rect {
>> +	s32 x1, y1; /* top left corner */
>> +	s32 x2, y2; /* bottom right corner, exclusive */
>> +} __packed;
>> +
>> +struct synthvid_dirt {
>> +	u8 video_output;
>> +	u8 dirt_count;
>> +	struct rect rect[1];
>> +} __packed;
>> +
>> +#define SYNTHVID_EDID_BLOCK_SIZE	128
>> +#define	SYNTHVID_MAX_RESOLUTION_COUNT	64
>> +
>> +struct synthvid_supported_resolution_req {
>> +	u8 maximum_resolution_count;
>> +} __packed;
>> +
>> +struct synthvid_supported_resolution_resp {
>> +	u8 edid_block[SYNTHVID_EDID_BLOCK_SIZE];
>> +	u8 resolution_count;
>> +	u8 default_resolution_index;
>> +	u8 is_standard;
>> +	struct hvd_screen_info supported_resolution[SYNTHVID_MAX_RESOLUTION_=
COUNT];
>> +} __packed;
>> +
>> +struct synthvid_msg {
>> +	struct pipe_msg_hdr pipe_hdr;
>> +	struct synthvid_msg_hdr vid_hdr;
>> +	union {
>> +		struct synthvid_version_req ver_req;
>> +		struct synthvid_version_resp ver_resp;
>> +		struct synthvid_vram_location vram;
>> +		struct synthvid_vram_location_ack vram_ack;
>> +		struct synthvid_situation_update situ;
>> +		struct synthvid_situation_update_ack situ_ack;
>> +		struct synthvid_pointer_position ptr_pos;
>> +		struct synthvid_pointer_shape ptr_shape;
>> +		struct synthvid_feature_change feature_chg;
>> +		struct synthvid_dirt dirt;
>> +		struct synthvid_supported_resolution_req resolution_req;
>> +		struct synthvid_supported_resolution_resp resolution_resp;
>> +	};
>> +} __packed;
>> +
>> +static inline bool synthvid_ver_ge(u32 ver1, u32 ver2)
>> +{
>> +	if (SYNTHVID_VER_GET_MAJOR(ver1) > SYNTHVID_VER_GET_MAJOR(ver2) ||
>> +	    (SYNTHVID_VER_GET_MAJOR(ver1) =3D=3D SYNTHVID_VER_GET_MAJOR(ver2=
) &&
>> +	     SYNTHVID_VER_GET_MINOR(ver1) >=3D SYNTHVID_VER_GET_MINOR(ver2))=
)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>> +static inline int synthvid_send(struct hv_device *hdev,
>> +				struct synthvid_msg *msg)
>> +{
>> +	static atomic64_t request_id =3D ATOMIC64_INIT(0);
>> +	int ret;
>> +
>> +	msg->pipe_hdr.type =3D PIPE_MSG_DATA;
>> +	msg->pipe_hdr.size =3D msg->vid_hdr.size;
>> +
>> +	ret =3D vmbus_sendpacket(hdev->channel, msg,
>> +			       msg->vid_hdr.size + sizeof(struct pipe_msg_hdr),
>> +			       atomic64_inc_return(&request_id),
>> +			       VM_PKT_DATA_INBAND, 0);
>> +
>> +	if (ret)
>> +		DRM_ERROR("Unable to send packet via vmbus\n");
>=20
> Try to use drm_err() and friends, and not DRM_ERR and friends.
> DRM_ERR are no logner preferred in drivers.
> Goes for all uses of DRM_ERR and friends.
>=20
>> +
>> +	return ret;
>> +}
>> +
>> +static int synthvid_negotiate_ver(struct hv_device *hdev, u32 ver)
>> +{
>> +	struct hyperv_device *hv =3D hv_get_drvdata(hdev);
>> +	struct synthvid_msg *msg =3D (struct synthvid_msg *)hv->init_buf;
>> +	unsigned long t;
>> +	int ret =3D 0;
>> +
>> +	memset(msg, 0, sizeof(struct synthvid_msg));
>> +	msg->vid_hdr.type =3D SYNTHVID_VERSION_REQUEST;
>> +	msg->vid_hdr.size =3D sizeof(struct synthvid_msg_hdr) +
>> +		sizeof(struct synthvid_version_req);
>> +	msg->ver_req.version =3D ver;
>> +	synthvid_send(hdev, msg);
>> +
>> +	t =3D wait_for_completion_timeout(&hv->wait, VMBUS_VSP_TIMEOUT);
>> +	if (!t) {
>> +		DRM_ERROR("Time out on waiting version response\n");
>> +		ret =3D -ETIMEDOUT;
>> +		goto out;
>> +	}
>> +	if (!msg->ver_resp.is_accepted) {
>> +		ret =3D -ENODEV;
>> +		goto out;
>> +	}
>> +
>> +	hv->synthvid_version =3D ver;
>> +	DRM_INFO("Synthvid Version major %d, minor %d\n",
>> +		 SYNTHVID_VER_GET_MAJOR(ver), SYNTHVID_VER_GET_MINOR(ver));
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +/* Should be done only once during init and resume */
>> +static int synthvid_update_vram_location(struct hv_device *hdev,
>> +					  phys_addr_t vram_pp)
>> +{
>> +	struct hyperv_device *hv =3D hv_get_drvdata(hdev);
>> +	struct synthvid_msg *msg =3D (struct synthvid_msg *)hv->init_buf;
>> +	unsigned long t;
>> +	int ret =3D 0;
>> +
>> +	memset(msg, 0, sizeof(struct synthvid_msg));
>> +	msg->vid_hdr.type =3D SYNTHVID_VRAM_LOCATION;
>> +	msg->vid_hdr.size =3D sizeof(struct synthvid_msg_hdr) +
>> +		sizeof(struct synthvid_vram_location);
>> +	msg->vram.user_ctx =3D msg->vram.vram_gpa =3D vram_pp;
>> +	msg->vram.is_vram_gpa_specified =3D 1;
>> +	synthvid_send(hdev, msg);
>> +
>> +	t =3D wait_for_completion_timeout(&hv->wait, VMBUS_VSP_TIMEOUT);
>> +	if (!t) {
>> +		DRM_ERROR("Time out on waiting vram location ack\n");
>> +		ret =3D -ETIMEDOUT;
>> +		goto out;
>> +	}
>> +	if (msg->vram_ack.user_ctx !=3D vram_pp) {
>> +		DRM_ERROR("Unable to set VRAM location\n");
>> +		ret =3D -ENODEV;
>> +	}
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +static int synthvid_update_situation(struct hv_device *hdev, u8 activ=
e, u32 bpp,
>> +				     u32 w, u32 h, u32 pitch)
>> +{
>> +	struct synthvid_msg msg;
>=20
> Sometimes synthvid_msg is hv->init_buf.
> Sometimes a local variable.
> I wonder why there is a difference.
>=20
>> +
>> +	memset(&msg, 0, sizeof(struct synthvid_msg));
>> +
>> +	msg.vid_hdr.type =3D SYNTHVID_SITUATION_UPDATE;
>> +	msg.vid_hdr.size =3D sizeof(struct synthvid_msg_hdr) +
>> +		sizeof(struct synthvid_situation_update);
>> +	msg.situ.user_ctx =3D 0;
>> +	msg.situ.video_output_count =3D 1;
>> +	msg.situ.video_output[0].active =3D active;
>> +	/* vram_offset should always be 0 */
>> +	msg.situ.video_output[0].vram_offset =3D 0;
>> +	msg.situ.video_output[0].depth_bits =3D bpp;
>> +	msg.situ.video_output[0].width_pixels =3D w;
>> +	msg.situ.video_output[0].height_pixels =3D h;
>> +	msg.situ.video_output[0].pitch_bytes =3D pitch;
>> +
>> +	synthvid_send(hdev, &msg);
>> +
>> +	return 0;
>> +}
>> +
>> +static int synthvid_update_dirt(struct hv_device *hdev, struct drm_re=
ct *rect)
>> +{
>> +	struct synthvid_msg msg;
>> +
>> +	memset(&msg, 0, sizeof(struct synthvid_msg));
>> +
>> +	msg.vid_hdr.type =3D SYNTHVID_DIRT;
>> +	msg.vid_hdr.size =3D sizeof(struct synthvid_msg_hdr) +
>> +		sizeof(struct synthvid_dirt);
>> +	msg.dirt.video_output =3D 0;
>> +	msg.dirt.dirt_count =3D 1;
>> +	msg.dirt.rect[0].x1 =3D rect->x1;
>> +	msg.dirt.rect[0].y1 =3D rect->y1;
>> +	msg.dirt.rect[0].x2 =3D rect->x2;
>> +	msg.dirt.rect[0].y2 =3D rect->y2;
>> +
>> +	synthvid_send(hdev, &msg);
>> +
>> +	return 0;
>> +}
>> +
>> +static int synthvid_get_supported_resolution(struct hv_device *hdev)
>> +{
>> +	struct hyperv_device *hv =3D hv_get_drvdata(hdev);
>> +	struct synthvid_msg *msg =3D (struct synthvid_msg *)hv->init_buf;
>> +	unsigned long t;
>> +	int ret =3D 0;
>> +	u8 index;
>> +	int i;
>> +
>> +	memset(msg, 0, sizeof(struct synthvid_msg));
>> +	msg->vid_hdr.type =3D SYNTHVID_RESOLUTION_REQUEST;
>> +	msg->vid_hdr.size =3D sizeof(struct synthvid_msg_hdr) +
>> +		sizeof(struct synthvid_supported_resolution_req);
>> +	msg->resolution_req.maximum_resolution_count =3D
>> +		SYNTHVID_MAX_RESOLUTION_COUNT;
>> +	synthvid_send(hdev, msg);
>> +
>> +	t =3D wait_for_completion_timeout(&hv->wait, VMBUS_VSP_TIMEOUT);
>> +	if (!t) {
>> +		DRM_ERROR("Time out on waiting resolution response\n");
>> +		ret =3D -ETIMEDOUT;
>> +		goto out;
>> +	}
>> +
>> +	if (msg->resolution_resp.resolution_count =3D=3D 0) {
>> +		DRM_ERROR("No supported resolutions\n");
>> +		ret =3D -ENODEV;
>> +		goto out;
>> +	}
>> +
>> +	index =3D msg->resolution_resp.default_resolution_index;
>> +	if (index >=3D msg->resolution_resp.resolution_count) {
>> +		DRM_ERROR("Invalid resolution index: %d\n", index);
>> +		ret =3D -ENODEV;
>> +		goto out;
>> +	}
>> +
>> +	for (i =3D 0; i < msg->resolution_resp.resolution_count; i++) {
>> +		hv->screen_width_max =3D max_t(u32, hv->screen_width_max,
>> +			msg->resolution_resp.supported_resolution[i].width);
>> +		hv->screen_height_max =3D max_t(u32, hv->screen_height_max,
>> +			msg->resolution_resp.supported_resolution[i].height);
>> +	}
>> +
>> +	hv->preferred_width =3D
>> +		msg->resolution_resp.supported_resolution[index].width;
>> +	hv->preferred_height =3D
>> +		msg->resolution_resp.supported_resolution[index].height;
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +/* Actions on received messages from host */
>> +static void synthvid_recv_sub(struct hv_device *hdev)
>> +{
>> +	struct hyperv_device *hv =3D hv_get_drvdata(hdev);
>> +	struct synthvid_msg *msg;
>> +
>> +	if (!hv)
>> +		return;
>> +
>> +	msg =3D (struct synthvid_msg *)hv->recv_buf;
>> +
>> +	/* Complete the wait event */
>> +	if (msg->vid_hdr.type =3D=3D SYNTHVID_VERSION_RESPONSE ||
>> +	    msg->vid_hdr.type =3D=3D SYNTHVID_RESOLUTION_RESPONSE ||
>> +	    msg->vid_hdr.type =3D=3D SYNTHVID_VRAM_LOCATION_ACK) {
>> +		memcpy(hv->init_buf, msg, VMBUS_MAX_PACKET_SIZE);
>> +		complete(&hv->wait);
>> +		return;
>> +	}
>> +}
>> +
>> +static void synthvid_receive(void *ctx)
>> +{
>> +	struct hv_device *hdev =3D ctx;
>> +	struct hyperv_device *hv =3D hv_get_drvdata(hdev);
>> +	struct synthvid_msg *recv_buf;
>> +	u32 bytes_recvd;
>> +	u64 req_id;
>> +	int ret;
>> +
>> +	if (!hv)
>> +		return;
>> +
>> +	recv_buf =3D (struct synthvid_msg *)hv->recv_buf;
>> +
>> +	do {
>> +		ret =3D vmbus_recvpacket(hdev->channel, recv_buf,
>> +				       VMBUS_MAX_PACKET_SIZE,
>> +				       &bytes_recvd, &req_id);
>> +		if (bytes_recvd > 0 &&
>> +		    recv_buf->pipe_hdr.type =3D=3D PIPE_MSG_DATA)
>> +			synthvid_recv_sub(hdev);
>> +	} while (bytes_recvd > 0 && ret =3D=3D 0);
>> +}
>> +
>> +static int synthvid_connect_vsp(struct hv_device *hdev)
>> +{
>> +	struct hyperv_device *hv =3D hv_get_drvdata(hdev);
>> +	int ret;
>> +
>> +	ret =3D vmbus_open(hdev->channel, VMBUS_RING_BUFSIZE, VMBUS_RING_BUF=
SIZE,
>> +			 NULL, 0, synthvid_receive, hdev);
>> +	if (ret) {
>> +		DRM_ERROR("Unable to open vmbus channel\n");
>> +		return ret;
>> +	}
>> +
>> +	/* Negotiate the protocol version with host */
>> +	switch (vmbus_proto_version) {
>> +	case VERSION_WIN10:
>> +	case VERSION_WIN10_V5:
>> +		ret =3D synthvid_negotiate_ver(hdev, SYNTHVID_VERSION_WIN10);
>> +		if (!ret)
>> +			break;
>> +		fallthrough;
>> +	case VERSION_WIN8:
>> +	case VERSION_WIN8_1:
>> +		ret =3D synthvid_negotiate_ver(hdev, SYNTHVID_VERSION_WIN8);
>> +		if (!ret)
>> +			break;
>> +		fallthrough;
>> +	case VERSION_WS2008:
>> +	case VERSION_WIN7:
>> +		ret =3D synthvid_negotiate_ver(hdev, SYNTHVID_VERSION_WIN7);
>> +		break;
>> +	default:
>> +		ret =3D synthvid_negotiate_ver(hdev, SYNTHVID_VERSION_WIN10);
>> +		break;
>> +	}
>> +
>> +	if (ret) {
>> +		DRM_ERROR("Synthetic video device version not accepted\n");
> Print error code?
>=20
>> +		goto error;
>> +	}
>> +
>> +	if (hv->synthvid_version =3D=3D SYNTHVID_VERSION_WIN7)
>> +		hv->screen_depth =3D SYNTHVID_DEPTH_WIN7;
>> +	else
>> +		hv->screen_depth =3D SYNTHVID_DEPTH_WIN8;
>> +
>> +	if (synthvid_ver_ge(hv->synthvid_version, SYNTHVID_VERSION_WIN10)) {=

>> +		ret =3D synthvid_get_supported_resolution(hdev);
>> +		if (ret)
>> +			DRM_ERROR("Failed to get supported resolution from host, use defau=
lt\n");
>> +	} else {
>> +		hv->screen_width_max =3D SYNTHVID_WIDTH_MAX_WIN7;
>> +		hv->screen_height_max =3D SYNTHVID_HEIGHT_MAX_WIN7;
>> +	}
>> +
>> +	hv->mmio_megabytes =3D hdev->channel->offermsg.offer.mmio_megabytes;=

>> +
>> +	return 0;
>> +
>> +error:
>> +	vmbus_close(hdev->channel);
>> +	return ret;
>> +}
>> +
>> +/* ------------------------------------------------------------------=
---- */
>> +/* VRAM blit                                                         =
     */
>> +
>> +static int hyperv_blit_to_vram_rect(struct drm_framebuffer *fb,
>> +				    struct drm_rect *rect)
>> +{
>> +	struct hyperv_device *hv =3D to_hv(fb->dev);
>> +	void *vmap;
>> +	int idx, ret;
>> +
>> +	ret =3D -ENODEV;
>> +	if (!drm_dev_enter(&hv->dev, &idx))
>> +		goto out;

Return -ENODEV directly.

>> +
>> +	ret =3D -ENOMEM;
>> +	vmap =3D drm_gem_shmem_vmap(fb->obj[0]);
>> +	if (!vmap)
>> +		goto out_dev_exit;
>> +
>> +	drm_fb_memcpy_dstclip(hv->vram, vmap, fb, rect);
>> +	drm_gem_shmem_vunmap(fb->obj[0], vmap);
>> +	ret =3D 0;
>> +
>> +out_dev_exit:
>> +	drm_dev_exit(idx);
>> +out:
>> +	return ret;

IMHO rather separate regular cleanups from error rollbacks. Handling
both in the same code is hard to read and usually not worth the amount
of saved LOCs.

>> +}
>> +
>> +static int hyperv_blit_to_vram_fullscreen(struct drm_framebuffer *fb)=

>> +{
>> +	struct drm_rect fullscreen =3D {
>> +		.x1 =3D 0,
>> +		.x2 =3D fb->width,
>> +		.y1 =3D 0,
>> +		.y2 =3D fb->height,
>> +	};
>> +	return hyperv_blit_to_vram_rect(fb, &fullscreen);
>> +}
>> +
>> +/* ------------------------------------------------------------------=
---- */
>> +/* connector                                                         =
     */
>> +
>> +static int hyperv_connector_get_modes(struct drm_connector *connector=
)
>> +{
>> +	struct hyperv_device *hv =3D to_hv(connector->dev);
>> +	int count;
>> +
>> +	count =3D drm_add_modes_noedid(connector,
>> +				     connector->dev->mode_config.max_width,
>> +				     connector->dev->mode_config.max_height);
>> +	drm_set_preferred_mode(connector, hv->preferred_width,
>> +			       hv->preferred_height);
>> +
>> +	return count;
>> +}
>> +
>> +static const struct drm_connector_helper_funcs hyperv_connector_helpe=
r_funcs =3D {
>> +	.get_modes =3D hyperv_connector_get_modes,
>> +};
>> +
>> +static const struct drm_connector_funcs hyperv_connector_funcs =3D {
>> +	.fill_modes =3D drm_helper_probe_single_connector_modes,
>> +	.destroy =3D drm_connector_cleanup,
>> +	.reset =3D drm_atomic_helper_connector_reset,
>> +	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_st=
ate,
>> +	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,=

>> +};
>> +
>> +static int hyperv_conn_init(struct hyperv_device *hv)
>> +{
>> +	drm_connector_helper_add(&hv->connector, &hyperv_connector_helper_fu=
ncs);
>> +	return drm_connector_init(&hv->dev, &hv->connector,
>> +				  &hyperv_connector_funcs,
>> +				  DRM_MODE_CONNECTOR_VGA);
>> +
>> +}
>> +
>> +/* ------------------------------------------------------------------=
---- */
>> +/* display pipe                                                      =
     */
>> +
>> +static int hyperv_check_size(struct hyperv_device *hv, int w, int h,
>> +			     struct drm_framebuffer *fb)
>> +{
>> +	u32 pitch =3D w * (hv->screen_depth/8);
>> +
>> +	if (fb)
>> +		pitch =3D fb->pitches[0];
>> +
>> +	if (pitch * h > hv->fb_size)
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>> +static enum drm_mode_status
>> +hyperv_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
>> +		       const struct drm_display_mode *mode)
>> +{
>> +	struct hyperv_device *hv =3D to_hv(pipe->crtc.dev);
>> +
>> +	if (hyperv_check_size(hv, mode->hdisplay, mode->vdisplay, NULL))
>> +		return MODE_BAD;
>> +
>> +	return MODE_OK;
>> +}
>> +
>> +static void hyperv_pipe_enable(struct drm_simple_display_pipe *pipe,
>> +			       struct drm_crtc_state *crtc_state,
>> +			       struct drm_plane_state *plane_state)
>> +{
>> +	struct hyperv_device *hv =3D to_hv(pipe->crtc.dev);
>> +
>> +	synthvid_update_situation(hv->hdev, 1,  hv->screen_depth,
>> +				  crtc_state->mode.hdisplay,
>> +				  crtc_state->mode.vdisplay,
>> +				  plane_state->fb->pitches[0]);
>> +	hyperv_blit_to_vram_fullscreen(plane_state->fb);
>> +}
>> +
>> +static void hyperv_pipe_update(struct drm_simple_display_pipe *pipe,
>> +			      struct drm_plane_state *old_state)
>> +{
>> +	struct hyperv_device *hv =3D to_hv(pipe->crtc.dev);
>> +	struct drm_plane_state *state =3D pipe->plane.state;
>> +	struct drm_rect rect;
>> +
>> +	if (drm_atomic_helper_damage_merged(old_state, state, &rect)) {
>> +		hyperv_blit_to_vram_rect(state->fb, &rect);
>> +		synthvid_update_dirt(hv->hdev, &rect);
>> +	}
>> +}
>> +
>> +static const struct drm_simple_display_pipe_funcs hyperv_pipe_funcs =3D=
 {
>> +	.mode_valid =3D hyperv_pipe_mode_valid,
>> +	.enable	=3D hyperv_pipe_enable,
>> +	.update	=3D hyperv_pipe_update,
>> +};
>> +
>> +static const uint32_t hyperv_formats[] =3D {
>> +	DRM_FORMAT_XRGB8888,
>> +};
>> +
>> +static const uint64_t hyperv_modifiers[] =3D {
>> +	DRM_FORMAT_MOD_LINEAR,
>> +	DRM_FORMAT_MOD_INVALID
>> +};
>> +
>> +static int hyperv_pipe_init(struct hyperv_device *hv)
>> +{
>> +	int ret;
>> +
>> +	ret =3D drm_simple_display_pipe_init(&hv->dev,
>> +					   &hv->pipe,
>> +					   &hyperv_pipe_funcs,
>> +					   hyperv_formats,
>> +					   ARRAY_SIZE(hyperv_formats),
>> +					   NULL,
>> +					   &hv->connector);
>> +
>> +	drm_plane_enable_fb_damage_clips(&(hv->pipe.plane));
>> +
>> +	return ret;
>> +}
>> +
>> +/* ------------------------------------------------------------------=
---- */
>> +/* framebuffers & mode config                                        =
     */
>> +
>> +static struct drm_framebuffer*
>> +hyperv_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>> +		 const struct drm_mode_fb_cmd2 *mode_cmd)
>> +{
>> +	struct hyperv_device *hv =3D to_hv(dev);
>> +
>> +	if (mode_cmd->pixel_format !=3D DRM_FORMAT_XRGB8888)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	if (mode_cmd->pitches[0] * mode_cmd->height > hv->fb_size)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	return drm_gem_fb_create_with_dirty(dev, file_priv, mode_cmd);
>> +}
>> +
>> +static const struct drm_mode_config_funcs hyperv_mode_config_funcs =3D=
 {
>> +	.fb_create =3D hyperv_fb_create,
>> +	.atomic_check =3D drm_atomic_helper_check,
>> +	.atomic_commit =3D drm_atomic_helper_commit,
>> +};
>> +
>> +static int hyperv_mode_config_init(struct hyperv_device *hv)
>> +{
>> +	struct drm_device *dev =3D &hv->dev;
>> +	int ret;
>> +
>> +	ret =3D drmm_mode_config_init(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dev->mode_config.min_width =3D 0;
>> +	dev->mode_config.min_height =3D 0;
>> +	dev->mode_config.max_width =3D hv->screen_width_max;
>> +	dev->mode_config.max_height =3D hv->screen_height_max;
>> +
>> +	dev->mode_config.preferred_depth =3D hv->screen_depth;
>> +	dev->mode_config.prefer_shadow =3D 0;
>> +
>> +	dev->mode_config.funcs =3D &hyperv_mode_config_funcs;
>> +
>> +	return 0;
>> +}
>> +
>> +/* ------------------------------------------------------------------=
---- */
>> +/* DRM                                                               =
     */
>> +
>> +DEFINE_DRM_GEM_FOPS(hv_fops);
>> +
>> +static struct drm_driver hyperv_driver =3D {
>> +	.driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>> +
>> +	.name		 =3D DRIVER_NAME,
>> +	.desc		 =3D DRIVER_DESC,
>> +	.date		 =3D DRIVER_DATE,
>> +	.major		 =3D DRIVER_MAJOR,
>> +	.minor		 =3D DRIVER_MINOR,
>> +
>> +	.fops		 =3D &hv_fops,
>> +	DRM_GEM_SHMEM_DRIVER_OPS,
>> +};
>> +
>> +/* ------------------------------------------------------------------=
---- */
>> +/* pci/vmbus interface                                               =
     */
>> +
>> +static int hyperv_pci_probe(struct pci_dev *pdev,
>> +			    const struct pci_device_id *ent)
>> +{
>> +	return 0;
>> +}
>> +
>> +static void hyperv_pci_remove(struct pci_dev *pdev)
>> +{
>> +}
>> +
>> +static const struct pci_device_id hyperv_pci_tbl[] =3D {
>> +	{
>> +		.vendor =3D PCI_VENDOR_ID_MICROSOFT,
>> +		.device =3D PCI_DEVICE_ID_HYPERV_VIDEO,
>> +	},
>> +	{ /* end of list */ }
>> +};
>> +
>> +static struct pci_driver hyperv_pci_driver =3D {
>> +	.name =3D		KBUILD_MODNAME,
>> +	.id_table =3D	hyperv_pci_tbl,
>> +	.probe =3D	hyperv_pci_probe,
>> +	.remove =3D	hyperv_pci_remove,
>> +};
>> +
>> +static int hyperv_vmbus_probe(struct hv_device *hdev,
>> +			      const struct hv_vmbus_device_id *dev_id)
>> +{
>> +	struct hyperv_device *hv;
>> +	struct drm_device *dev;
>> +	struct pci_dev *pdev;
>> +	int ret;
>> +
>> +	hv =3D devm_drm_dev_alloc(&hdev->device, &hyperv_driver,
>> +				struct hyperv_device, dev);
>> +	if (IS_ERR(hv))
>> +		return PTR_ERR(hv);
>> +
>> +	dev =3D &hv->dev;
>> +	init_completion(&hv->wait);
>> +	hv_set_drvdata(hdev, hv);
>> +	hv->hdev =3D hdev;
>> +
>> +	pdev =3D pci_get_device(PCI_VENDOR_ID_MICROSOFT,
>> +			      PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
>> +	if (!pdev) {
>> +		DRM_ERROR("Unable to find PCI Hyper-V video\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	ret =3D drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "hyp=
ervdrmfb");
>> +	if (ret) {
>> +		DRM_ERROR("Not able to remove boot fb\n");
>> +		goto error;
>> +	}
>> +
>> +	if (pci_request_region(pdev, 0, DRIVER_NAME) !=3D 0)
>> +		DRM_WARN("Cannot request framebuffer, boot fb still active?\n");
> devm variant?
>=20
>> +
>> +	if ((pdev->resource[0].flags & IORESOURCE_MEM) =3D=3D 0) {
>> +		DRM_ERROR("Resource at bar 0 is not IORESOURCE_MEM\n");
>> +		ret =3D -ENODEV;
>> +		goto error;
>> +	}
>> +
>> +	hv->fb_base =3D pci_resource_start(pdev, 0);
>> +	hv->fb_size =3D pci_resource_len(pdev, 0);
>> +	if (hv->fb_base =3D=3D 0) {
>> +		DRM_ERROR("Resource not available\n");
>> +		ret =3D -ENODEV;
>> +		goto error;
>> +	}
>> +
>> +	/* Get the actual VRAM size from the device */
>> +	ret =3D synthvid_connect_vsp(hdev);
>> +	if (ret) {
>> +		DRM_ERROR("Failed to connect to vmbus\n");
>> +		goto error;
>> +	}
>> +
>> +	hv->fb_size =3D min(hv->fb_size,
>> +			  (unsigned long)(hv->mmio_megabytes * 1024 * 1024));
>> +	hv->vram =3D devm_ioremap(&pdev->dev, hv->fb_base, hv->fb_size);
>> +	if (hv->vram =3D=3D NULL) {
>> +		DRM_ERROR("Failed to map vram\n");
>> +		ret =3D -ENOMEM;
>> +		goto error1;
>> +	}
>> +
>> +	/*
>> +	 * Failing to update vram location is not fatal. Device will update
>> +	 * dirty area till preferred resolution only.
>> +	 */
>> +	ret =3D synthvid_update_vram_location(hdev, hv->fb_base);
>> +	if (ret)
>> +		DRM_WARN("Failed to update vram location.\n");

I'd put the memory initialization, beginning at
"pci_request_region(pdev, 0, DRIVER_NAME)", into a separate function.


>> +
>> +	ret =3D hyperv_mode_config_init(hv);
>> +	if (ret) {
>> +		DRM_ERROR("Failed to initialized mode setting\n");
>> +		goto error1;
>> +	}
>> +
>> +	ret =3D hyperv_conn_init(hv);
>> +	if (ret) {
>> +		DRM_ERROR("Failed to initialized connector\n");
>> +		goto error1;
>> +	}
>> +
>> +	ret =3D hyperv_pipe_init(hv);
>> +	if (ret) {
>> +		DRM_ERROR("Failed to initialized pipe\n");
>> +		goto error1;
>> +	}
>> +
>> +	drm_mode_config_reset(dev);

The code up to here could go into hyperv_mode_config_init().

>> +
>> +	ret =3D drm_dev_register(dev, 0);
>> +	if (ret) {
>> +		DRM_ERROR("Failed to register drm driver\n");
>> +		goto error1;
>> +	}
>> +
>> +	drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);

Simply pass 0 as final argument. The helper will use the preferred depth
automatically.

>> +
>> +	pci_dev_put(pdev);
>> +	return 0;
>> +
>> +error1:
>> +	vmbus_close(hdev->channel);
>> +error:

There lables are badly named. Rather use err_vmbus_close and
err_hv_set_drv_data.

Best regards
Thomas

>> +	hv_set_drvdata(hdev, NULL);
>> +	pci_dev_put(pdev);
>> +	return ret;
>> +}
>> +
>> +static int hyperv_vmbus_remove(struct hv_device *hdev)
>> +{
>> +	struct drm_device *dev =3D hv_get_drvdata(hdev);
>> +
>> +	drm_dev_unplug(dev);
>> +	drm_atomic_helper_shutdown(dev);
>> +	vmbus_close(hdev->channel);
>> +	hv_set_drvdata(hdev, NULL);
>> +
>> +	return 0;
>> +}
>> +
>> +static int hyperv_vmbus_suspend(struct hv_device *hdev)
>> +{
>> +	struct drm_device *dev =3D hv_get_drvdata(hdev);
>> +	int ret;
>> +
>> +	ret =3D drm_mode_config_helper_suspend(dev);
>> +
>> +	vmbus_close(hdev->channel);
>> +
>> +	return ret;
>> +}
>> +
>> +static int hyperv_vmbus_resume(struct hv_device *hdev)
>> +{
>> +	struct drm_device *dev =3D hv_get_drvdata(hdev);
>> +	int ret;
>> +
>> +	ret =3D synthvid_connect_vsp(hdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return drm_mode_config_helper_resume(dev);
>> +}
>> +
>> +static const struct hv_vmbus_device_id hyperv_vmbus_tbl[] =3D {
>> +	/* Synthetic Video Device GUID */
>> +	{HV_SYNTHVID_GUID},
>> +	{}
>> +};
>> +
>> +static struct hv_driver hyperv_hv_driver =3D {
>> +	.name =3D KBUILD_MODNAME,
>> +	.id_table =3D hyperv_vmbus_tbl,
>> +	.probe =3D hyperv_vmbus_probe,
>> +	.remove =3D hyperv_vmbus_remove,
>> +	.suspend =3D hyperv_vmbus_suspend,
>> +	.resume =3D hyperv_vmbus_resume,
>> +	.driver =3D {
>> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>> +	},
>> +};
>> +
>> +/* ------------------------------------------------------------------=
---- */
>> +/* module init/exit                                                  =
     */
>> +
>> +static int __init hyperv_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret =3D pci_register_driver(&hyperv_pci_driver);
>> +	if (ret !=3D 0) {
>> +		DRM_ERROR("Failed to register pci driver\n");
>> +		return ret;
>> +	}
>> +
>> +	ret =3D vmbus_driver_register(&hyperv_hv_driver);
>> +	if (ret !=3D 0)
>> +		DRM_ERROR("Failed to register vmbus driver\n");
>> +
>> +	return ret;
>> +}
>> +
>> +static void __exit hyperv_exit(void)
>> +{
>> +	vmbus_driver_unregister(&hyperv_hv_driver);
>> +	pci_unregister_driver(&hyperv_pci_driver);
>> +}
>> +
>> +module_init(hyperv_init);
>> +module_exit(hyperv_exit);
>> +
>> +MODULE_DEVICE_TABLE(pci, hyperv_pci_tbl);
>> +MODULE_DEVICE_TABLE(vmbus, hyperv_vmbus_tbl);
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Deepak Rawat <drawat.floss@gmail.com>");
>> +MODULE_DESCRIPTION("DRM driver for hyperv synthetic video device");
>> --=20
>> 2.27.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--rtesIFpTpkRIy1pAq4CEM3NNavW4t8mtU--

--ABgYXB2kI2ib2fyUo64GFuVGCV5STUjRM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7xtl4ACgkQaA3BHVML
eiP1DQf+KI83ZTWZQwlMw9OttQsSfRxFvO9ssMQ4pDSkAI2VuGMRmwlCO7x9UeVD
xQBXOc1djV1g9TYJkZ9hA33p3cJrypsN3RKaFuBwq7XgVceBtEDPkocyVlAY0jFD
eQE2yFQAQuJvqCAMaYFtUXTrxWpCZUGWF5FSr8h5jjW43ehUSNoGWtbvssEtIiJ6
7WU+cjqtHEx5eB6mAKejdnydOLMgW6GURayzpaEw4yOBmv1Y1gnjxwZROfewoo+g
ipHXPVM/fECmdVHHy/LVYH2I0YXsjx+vtG6WGXzjIhNp4R6FZ/3PbZDbGT0gkjEM
xHcSssxrQJj3Dgq0tXSbAMQlwZkTTA==
=AyOG
-----END PGP SIGNATURE-----

--ABgYXB2kI2ib2fyUo64GFuVGCV5STUjRM--

--===============1546372936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1546372936==--
