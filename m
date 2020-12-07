Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDDE2D0B93
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05E889E50;
	Mon,  7 Dec 2020 08:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9212789E50
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 08:17:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B8AAAD3F;
 Mon,  7 Dec 2020 08:16:59 +0000 (UTC)
Subject: Re: [PATCH v3 02/13] video: fbdev: core: Fix kernel-doc warnings in
 fbmon + fb_notify
To: Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-3-sam@ravnborg.org>
 <0fb6ff8b-bea3-c5bc-0d37-8a5fdab41abc@infradead.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <dd81dd0e-9701-8332-63eb-2f159c535d02@suse.de>
Date: Mon, 7 Dec 2020 09:16:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <0fb6ff8b-bea3-c5bc-0d37-8a5fdab41abc@infradead.org>
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
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rich Felker <dalias@libc.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Qilong Zhang <zhangqilong3@huawei.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Douglas Anderson <dianders@chromium.org>,
 Gustavo A R Silva <gustavoars@kernel.org>, Tony Prisk <linux@prisktech.co.nz>,
 Andrzej Hajda <a.hajda@samsung.com>, Peter Jones <pjones@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0719869311=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0719869311==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xYe0uOpM1F6hjIb5nrykrIwuo08X7yJ6m"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xYe0uOpM1F6hjIb5nrykrIwuo08X7yJ6m
Content-Type: multipart/mixed; boundary="VQOHHnh5WletRD1WjGBJJ9Fh5n9ALQ9iS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Cc: Alexander Klimov <grandmaster@al2klimov.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Colin Ian King <colin.king@canonical.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Gustavo A R Silva <gustavoars@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-arm-kernel@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Rapoport <rppt@kernel.org>, Peter Jones <pjones@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Qilong Zhang
 <zhangqilong3@huawei.com>, Rich Felker <dalias@libc.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Tony Prisk <linux@prisktech.co.nz>
Message-ID: <dd81dd0e-9701-8332-63eb-2f159c535d02@suse.de>
Subject: Re: [PATCH v3 02/13] video: fbdev: core: Fix kernel-doc warnings in
 fbmon + fb_notify
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-3-sam@ravnborg.org>
 <0fb6ff8b-bea3-c5bc-0d37-8a5fdab41abc@infradead.org>
In-Reply-To: <0fb6ff8b-bea3-c5bc-0d37-8a5fdab41abc@infradead.org>

--VQOHHnh5WletRD1WjGBJJ9Fh5n9ALQ9iS
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.12.20 um 20:37 schrieb Randy Dunlap:
> On 12/6/20 11:02 AM, Sam Ravnborg wrote:
>> Fix kernel-doc warnings reported when using W=3D1
>>
>> v2:
>>    - Improve subject (Lee)
>>
>> v3:
>>    - Add RETURNS documentation (Thomas)
>=20
> Hi Sam,
>=20
> Yes, RETURNS: will work. It just looks like any kernel-doc section name=
,
> such as Context: or Note:.
> However, the documented format for return info is "Return:".
> (see Documentation/doc-guide/kernel-doc.rst)

Thanks for the note. I asked for RETURNS: because the rest of the file=20
appears to be using it. Returns: is certainly the better alternative. I=20
didn't know there was a difference.

Best regards
Thomas

>=20
>=20
>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Lee Jones <lee.jones@linaro.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
>> ---
>>   drivers/video/fbdev/core/fb_notify.c | 10 ++++++++++
>>   drivers/video/fbdev/core/fbmon.c     |  2 +-
>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/core/fb_notify.c b/drivers/video/fbde=
v/core/fb_notify.c
>> index 74c2da528884..4e39c61fae1f 100644
>> --- a/drivers/video/fbdev/core/fb_notify.c
>> +++ b/drivers/video/fbdev/core/fb_notify.c
>> @@ -19,6 +19,9 @@ static BLOCKING_NOTIFIER_HEAD(fb_notifier_list);
>>   /**
>>    *	fb_register_client - register a client notifier
>>    *	@nb: notifier block to callback on events
>> + *
>> + *	RETURNS:
>> + *	0 on success, negative error code on failure.
>>    */
>>   int fb_register_client(struct notifier_block *nb)
>>   {
>> @@ -29,6 +32,9 @@ EXPORT_SYMBOL(fb_register_client);
>>   /**
>>    *	fb_unregister_client - unregister a client notifier
>>    *	@nb: notifier block to callback on events
>> + *
>> + *	RETURNS:
>> + *	0 on success, negative error code on failure.
>>    */
>>   int fb_unregister_client(struct notifier_block *nb)
>>   {
>> @@ -38,7 +44,11 @@ EXPORT_SYMBOL(fb_unregister_client);
>>  =20
>>   /**
>>    * fb_notifier_call_chain - notify clients of fb_events
>> + * @val: value passed to callback
>> + * @v: pointer passed to callback
>>    *
>> + * RETURNS:
>> + * The return value of the last notifier function
>>    */
>>   int fb_notifier_call_chain(unsigned long val, void *v)
>>   {
>> diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/co=
re/fbmon.c
>> index 1bf82dbc9e3c..b0e690f41025 100644
>> --- a/drivers/video/fbdev/core/fbmon.c
>> +++ b/drivers/video/fbdev/core/fbmon.c
>> @@ -605,6 +605,7 @@ static void get_detailed_timing(unsigned char *blo=
ck,
>>    * fb_create_modedb - create video mode database
>>    * @edid: EDID data
>>    * @dbsize: database size
>> + * @specs: monitor specifications, may be NULL
>>    *
>>    * RETURNS: struct fb_videomode, @dbsize contains length of database=

>>    *
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--VQOHHnh5WletRD1WjGBJJ9Fh5n9ALQ9iS--

--xYe0uOpM1F6hjIb5nrykrIwuo08X7yJ6m
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/N5PQFAwAAAAAACgkQlh/E3EQov+BU
OA/+IbJ5Ctnlbd4h/CDle+mmKYWbEwIzIq2t3YZ768RwmILkJQLKitQ20Cx87ZLvcZxI857bUNyA
7IJ9fxdqob8vQrRsxcnEO/Sf5kUbI2Jbxc9cibusgaTXqLB1j+gLVjD+yKYNbOLgBOkDpRBE+oN5
yCNWUfNAcEk4WGEksvp31K8xmjPrSG+CokuH8Y2pzAMYcf8nzWz/CeuCNajjNgwVYCWu9kvRRpLy
5RuAqq/y1WPvoWkJbC43yXsE9RkwQT7sA2HAlNgvZ6CjVvyM0V257F78OsOH8ovmGopWJjIb3OpZ
14panr3TJryGhmihVpwqBevbTjHHIDOOKPOLtUYtVHAQa2NyYrR7eI9b/raZFilMxDXqvbTSWYd+
+BG0Z/wLwZnetbggRxG0x0raofP9G1HSGCSFQoIof1lIPblFCIBM8ysCzGVy0Lqf3t0f/sU3Psl/
BbmsAViYq+cRekQy/v3gzhmwDM8Sm/suDzGIhPzd30pR92xVvzmieWITVCgjYrqdjHRn7emz+fSq
H7Ibl22RIZLV4miR6+ycXKRB7zW2DPUjlTs1dVK5+ZQ/3/ji1kjWB/CZoctXikCa9LigrA/0cmuh
eBI4OZMWdHeeFM06OxqTlwwBRtVTomEnZuFjASMWbOWI2XQObDM3XsOk1OAeoH0S4tifpAxSaMLU
wu8=
=6Skc
-----END PGP SIGNATURE-----

--xYe0uOpM1F6hjIb5nrykrIwuo08X7yJ6m--

--===============0719869311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0719869311==--
