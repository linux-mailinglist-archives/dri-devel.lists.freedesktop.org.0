Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AD4CD986E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 14:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7FB10E104;
	Tue, 23 Dec 2025 13:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CyDaG83h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B9D10E1B2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 13:58:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 93A494E41D5F;
 Tue, 23 Dec 2025 13:58:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 67B4760716;
 Tue, 23 Dec 2025 13:58:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3FCC110AB0ADE; Tue, 23 Dec 2025 14:58:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766498324; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fxtHoMruIF2wGIEKa2vJ+74d1NL4YgjMYBTBQqpRwVI=;
 b=CyDaG83h05mf0TipiaSS1rN0qmhUH2UPcnuzEJs+r1LP9R7MaMv9dZHXBmSmESRXckPXp2
 krXq1Mk7t9rpRXgCwpjrXCjPgIUN0mfjC7xQMbP+LBQkuftCgImirDbLgFR4+9cpNM+ftg
 UD9IyCBP8Rgirzta1oq6iN0afzdxK5uffia8WDX8UrkrSmHEKAziHm98zmCjzOmOJlggC9
 CSloz4GkeSv/UbGwooy2cVHp2RDML57OLGsGQF+NpT6jjXbYYWYpS3Ojpx06zWadM/i0Rh
 XY1HKVtssDm3Y2gcwjOoGiB78HFVp+mGP+r9Dcsboueftq7g5R5jOdRskcgfyQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 14:58:41 +0100
Message-Id: <DF5NE5WRSCYT.4NV0451K0SRU@bootlin.com>
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Haneen Mohammed"
 <hamohammed.sa@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Melissa Wen"
 <melissa.srw@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <jose.exposito89@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
X-Mailer: aerc 0.20.1
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
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

On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
> To allow the userspace to test many hardware configuration, introduce a
> new interface to configure the available formats per planes. VKMS support=
s
> multiple formats, so the userspace can choose any combination.
>
> The supported formats are configured by writing the fourcc code in
> supported_formats:
>  # enable AR24 format
>   echo '+AR24' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
>  # disable AR24 format
>   echo '-AR24' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
>  # enable all format supported by VKMS
>   echo '+*' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
>  # disable all formats
>   echo '-*' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -153,6 +153,15 @@ Description:
>          Default color range presented to userspace, same
>          values as supported_color_ranges.
>
> +What:		/sys/kernel/config/vkms/<device>/planes/<plane>/supported_formats
> +Date:		Nov 2025

Jan 2026.

> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -87,7 +87,7 @@ Start by creating one or more planes::
>
>    sudo mkdir /config/vkms/my-vkms/planes/plane0
>
> -Planes have 8 configurable attributes:
> +Planes have 9 configurable attributes:
>
>  - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>    exposed by the "type" property of a plane)
> @@ -109,6 +109,11 @@ Planes have 8 configurable attributes:
>    must be set too.
>  - default_color_range: Default color range presented to the userspace, s=
ame
>    values as supported_color_ranges
> +- supported_formats: List of supported formats for this plane. To add a =
new item in the
> +  list, write it using a plus and fourcc code: +XR24
> +  To remove a format, use a minus and its fourcc: -XR24

From the docs examples it's not obvious that you can add/remove multiple
formats in one write operation ("+XR24 -RG24"), but the implementation
allows it. So either add a more complete example or forbid multiple
operations in one write. I would consider the latter option seriously
because it would simplify the string parsing code, which is very tricky to
get right and robust.

> +++ b/drivers/gpu/drm/vkms/tests/vkms_configfs_test.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include "linux/printk.h"
> +#include <kunit/test.h>
> +
> +#include "../vkms_configfs.h"
> +
> +MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
> +
> +/**
> + * struct vkms_configfs_parse_format_case - Store test case for format p=
arsing
> + * @str: Contains the string to parse
> + * @str_len: str len
> + * @expected_len: expected len of the matched format
> + * @expected_offset: expected offset in the string for the parsed format
> + */
> +struct vkms_configfs_parse_format_case {
> +	const char *str;
> +	int str_len;
> +	int expected_len;
> +	int expected_offset;
> +};
> +
> +struct vkms_configfs_parse_format_case vkms_configfs_parse_format_test_c=
ases[] =3D {
> +	{
> +		.str =3D "+RG24",
> +		.str_len =3D 6,
> +		.expected_len =3D 5,
> +		.expected_offset =3D 0,

Thanks for having renamed 'data' to 'str'! However now I realize the
'str_len' name becomes misleading: the string length does not include the
training NUL character, while the value you need here does. I beg your
pardon... I guess 'str_len' should be renamed too, maybe to 'str_size' if
no better name comes to mind.

> +	}, {

Based on the question I asked after v3,resend and on your answer, I'd add a
clarifying comment here about the following test:

	   /* ensure the algorithm stops at data_len and not \0 */

> +		.str =3D "-R1111",
> +		.str_len =3D 3,
> +		.expected_len =3D 3,
> +		.expected_offset =3D 0
> +	}

Testing wrong and corner cases is more important than testing perfectly
clean cases. So it would be nice to add tests for not-obviously-wrong and
definitely-wrong cases, such as "+ RG24" (note the space), "fubar", "+**",
"*+", "++", "-+", "-A*42" (see below), ":-)" (dash after non-blank char)
and "(-o-)".

> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -3,6 +3,8 @@
>  #include <linux/configfs.h>
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
> +#include <kunit/visibility.h>
>
>  #include "vkms_drv.h"
>  #include "vkms_config.h"
> @@ -628,6 +630,120 @@ static ssize_t plane_default_color_encoding_store(s=
truct config_item *item,
>  	return count;
>  }
>
> +static ssize_t plane_supported_formats_show(struct config_item *item, ch=
ar *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +
> +	plane =3D plane_item_to_vkms_configfs_plane(item);
> +
> +	page[0] =3D '\0';
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		u32 *formats =3D vkms_config_plane_get_supported_formats(plane->config=
);
> +
> +		for (int i =3D 0;
> +		     i < vkms_config_plane_get_supported_formats_count(plane->config);
> +		     i++) {
> +			char tmp[6] =3D { 0 };
> +			const ssize_t ret =3D snprintf(tmp, ARRAY_SIZE(tmp), "%.*s\n",
> +					       (int)sizeof(*formats),
> +					       (char *)&formats[i]);
> +			if (ret < 0)
> +				return ret;
> +			/*
> +			 * Limitation of ConfigFS attributes, an attribute can't be bigger
> +			 * than PAGE_SIZE. This will crop the result if this plane support
> +			 * more than =E2=89=881000 formats.

Every format takes 5 chars, so about 800 formats, no?

> +			 */
> +			if (ret + strlen(page) > PAGE_SIZE - 1)
> +				return -ENOMEM;
> +			strncat(page, tmp, ARRAY_SIZE(tmp));
> +		}
> +	}
> +
> +	return strlen(page);
> +}
> +
> +/**
> + * parse_next_format() - Parse the next format in page, skipping all non=
 fourcc-related characters
> + * @page: page to search into
> + * @page_end: last character of the page
> + * @out: Output pointer, will point inside page
> + *
> + * Returns: size of the matched format, @out will point to the + or -
> + */
> +VISIBLE_IF_KUNIT
> +int vkms_configfs_parse_next_format(const char *page, const char *page_e=
nd, char **out)
> +{
> +	int count =3D page - page_end;
> +	char *tmp_plus =3D strnchr(page, count, '+');
> +	char *tmp_minus =3D strnchr(page, count, '-');
> +
> +	if (!tmp_plus && !tmp_minus)
> +		return 0;
> +	if (!tmp_plus)
> +		*out =3D tmp_minus;
> +	else if (!tmp_minus)
> +		*out =3D tmp_plus;
> +	else
> +		*out =3D min(tmp_plus, tmp_minus);
> +
> +	char *end =3D *out + 1;
> +
> +	while (end < page_end) {
> +		if (!isalnum(*end) && *end !=3D '*')
> +			break;
> +		end++;
> +	}

I think this while loop will capture a string like "A*42", which is wrong.

Maybe you could change this function to be both stricter and simpler by not
trying to accept leading spaces, for example.

> +static ssize_t plane_supported_formats_store(struct config_item *item,
> +					     const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane;
> +
> +	plane =3D plane_item_to_vkms_configfs_plane(item);
> +	int ret =3D 0;
> +	const char *end_page =3D page + count;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		while (1) {
> +			char *tmp;
> +			char fmt[4] =3D {' ', ' ', ' ', ' '};
> +			int len =3D vkms_configfs_parse_next_format(page, end_page, &tmp);
> +
> +			// No fourcc code found
> +			if (len <=3D 1 || len > 5)
> +				break;
> +
> +			page =3D tmp + len;
> +			memcpy(fmt, &tmp[1], min(len - 1, 4));
> +			if (tmp[0] =3D=3D '+') {
> +				if (fmt[0] =3D=3D '*') {
> +					ret =3D vkms_config_plane_add_all_formats(plane->config);
> +					if (ret)
> +						return ret;
> +				} else {
> +					ret =3D vkms_config_plane_add_format(plane->config,
> +									   *(int *)fmt);
> +					if (ret)
> +						return ret;
> +				}

Minor code simplification:

				if (fmt[0] =3D=3D '*')
					ret =3D vkms_config_plane_add_all_formats(plane->config);
				else
					ret =3D vkms_config_plane_add_format(plane->config,
									   *(int *)fmt);
				if (ret)
					return ret;

Or, if you like the ternary operator:


				ret =3D (fmt[0] =3D=3D '*') ?
					vkms_config_plane_add_all_formats(plane->config):
					vkms_config_plane_add_format(plane->config, *(int *)fmt);
				if (ret)
					return ret;

I'm sorry some of these comments could have been written asof v2, but this
patch is really intricate and they came to mind only while re-thinking
about the code.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
