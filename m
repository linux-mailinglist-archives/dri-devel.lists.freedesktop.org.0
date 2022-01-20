Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1D34952D1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 18:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF0910E94F;
	Thu, 20 Jan 2022 17:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DD710E892
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 17:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642698129;
 bh=+JXhNOsw5MHkIVzGSJW0sfejmO+zFCCP/sfpuUD9wKI=;
 h=X-UI-Sender-Class:Date:To:References:From:Subject:In-Reply-To;
 b=aDJ2eioR3emy6j0MAQZ9JAh5JHbIRcXkOt3Ml/c5lvqy6R3bXlCo0jaO+kLdiwL6k
 3+VYB9hz9jdbp4BwbNh9SWJPe9TsIyExHch3/rTdI/6enK40FbgZwMeGwRah78Wi5O
 AsMrqChkZOs0V93Wsi1VoKNB5f8Miw02GcAMcWrk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.166.9]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrQJ5-1mYFL42TUF-00oXJG; Thu, 20
 Jan 2022 18:02:09 +0100
Message-ID: <6c000477-002b-d125-b945-2c4831bad8a5@gmx.de>
Date: Thu, 20 Jan 2022 18:01:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Sven Schnelle <svens@stackframe.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Ilia Mirkin <imirkin@alum.mit.edu>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>, Pavel Machek <pavel@ucw.cz>,
 linux-kernel@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>,
 Claudio Suarez <cssk@net-c.es>
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de> <YelyGDNDTn1Aq/hm@phenom.ffwll.local>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
In-Reply-To: <YelyGDNDTn1Aq/hm@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HYKznw+AROEUb19KFphHX3jBu+8VFsPzvK1w56ZWReh6hz5gRAL
 Yv+ISQ95yKuukbtq5OeYmZKYIb2CZm98fRx6wfi3oeQUQe6JHPXAlZtJRF3posFuCHiBqwX
 FJGbMXwNJJpgWY4mpel58M/MtVGWMjwX1/ahtIna3d42Bz+7CHpGTiAZhBIbnKBo5OYs28x
 5o58uyOHlpZthTSM4VWqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vuR0FnfXGrI=:FNei+G/vJWgcWxM9I1dSE3
 tdVYcE5p9pqqMpa0gpCHxg3tnxGfZHWkf2RGrt5LI2cCGDyBE2Mt2iENp+WIPxCp6zvqDugVv
 tG7aDjZVXDZmsnz4VSJZ93HXX3SQPznJdU5Ywjx0g21LJYtXvlsi1T7Nx995cz70DZBHS+yag
 SoIjsvvSUJdAE7lITZmZWl5JGgJiaI2CLpLklZl47rFG03FxNKVB2NVKOUlMMH+mo8AsnqJRs
 d+UYw4sbOs/oD5e2w5J1fJD720hQ15GFHF0bZvDJ7s+5Vj9WajppumhcOK4YbgtUDB/hAXK2B
 WKjZ4kT4L1Qxg8Tj0MlA/s6WAptapMe1YkSeHjC6dywaMTlJNj4gT0Xz2UwZRqFKgwJtK6SDf
 A+0Si7VEZTsEQXlQm4T3/jv9Vko8jIiQHeqNs17kcwFIvMNkDrbNkxnj5hUG37BYnhZfwz72d
 hWwJXMlp5sBX+SY1Q5h5yNYLnCqFMUkJT8g+0ekBCkRtCrP/2UnudLbbIfVXWg2R8nas/c5Mk
 ly2T8j3ShTKHYY0AlokYOzsrBr4TL8NIEGc9Xsn8rcjFfKpiutx4vPlxaqOfu0PFT1UKbXwlp
 Ai6j+EorbgBiqtmbYRtTWBcs4Kbkw0NMkmPd4cAFh+H0fijN4+/CoV/K2ACwoVpdP/aznPm6d
 Qo8fmM+i2xsZceWhOd749ILyJ0QyR/Zluew+Josaja/MnscqKJiDHwJqrwdPquH10MbyIJEpM
 UGUNV4oLiWk71HbdgycprCyLJ0u4kWpKjFPG8QO50xwi7+cjho+TuUtxKhrefNTylKtoASdlr
 3oWpswA4f6V1C092b+D2Xkb9MyPXmiB2gQW1D/3bZx+Kh+dj67QnurVhJYnILJwRb/m7kLW7T
 LeXgtRg1OwALQNVpbK9SUvK+05ty47p/Xv8c1A9kad+OzdGLZIb4deZEG7dx6OGop+Vwwl98s
 BgJybX8lIGemZuJfLaJpUmGvnux9RFKjApDzEM8AC4cDaiRadVngo00AZwr9vkH4wlU+z13kz
 4o7KiHtDr0/9JqZEV5K4fjfIjo/ZCnzuVi1vYJp0klaYAXSvkPQqr32atvo21spncF301GIdj
 9TBWxFAMTH8Pzw=
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

Hello Daniel,

On 1/20/22 15:30, Daniel Vetter wrote:
> On Wed, Jan 19, 2022 at 12:08:39PM +0100, Helge Deller wrote:
>> This reverts commit 39aead8373b3c20bb5965c024dfb51a94e526151.
>>
>> Revert this patch.  This patch started to introduce the regression that
>> all hardware acceleration of more than 35 existing fbdev drivers were
>> bypassed and thus fbcon console output for those was dramatically slowe=
d
>> down by factor of 10 and more.
>>
>> Reverting this commit has no impact on DRM, since none of the DRM drive=
rs are
>> tagged with the acceleration flags FBINFO_HWACCEL_COPYAREA,
>> FBINFO_HWACCEL_FILLRECT or others.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: stable@vger.kernel.org # v5.16
>
> So if this really has to come back then I think the pragmatic approach i=
s
> to do it behind a CONFIG_FBCON_ACCEL, default n, and with a huge warning
> that enabling that shouldn't be done for any distro which only enables
> firmware and drm fbdev drivers.

Thanks for coming back on this, but quite frankly I don't understand
that request. How should that warning look like, something along:
"BE WARNED: The framebuffer text console on your non-DRM supported
graphic card will then run faster and smoother if you enable this option."
That doesn't make sense. People and distros would want to enable that.

And if a distro *just* has firmware and drm fbdev drivers enabled,
none of the non-DRM graphic cards would be loaded anyway and this code
wouldn't be executed anyway.

I think what you want is that DRM drivers are preferred over standard
fbdev drivers, esp. if there is a driver for both available.
But that's completely independed of fbdev-drivers console hardware acceler=
ation.

> Plus adjusting the todo to limit it to drm drivers. Maybe also #ifdef ou=
t
> the code that's then dead from fbcon.

Sorry, I don't understand that either.
I assume you mean to put code of fbcon which is only used by fbdev-drivers
into and #ifdef CONFIG_FB .. #endif (CONFIG_FB may be wrong in this exampl=
e).
That's probably possible, but I don't see a big win.
If there is no fbdev driver compiled-in or as module, none of this fbdev-d=
rivers
will be loaded and that code path wouldn't be executed anyway.
In that case you will win a few bytes of code, but probably not much.

> Also in that case I guess it's ok to cc: stable, and really if you cc:
> stable it needs to go down to 5.11, not 5.16.

Yes, I missed that in my patch request. Will fix.

> And if we do that, I think that should go in through a -next cycle, or a=
t
> least quite some soaking before it's cherry-picked over. Enough to give
> syzbot a chance to discover any path we've missed at least.

Sure. We don't need to hurry.

Thanks!
Helge


> -Daniel
>
>> ---
>>  Documentation/gpu/todo.rst       | 21 ---------------
>>  drivers/video/fbdev/core/fbcon.c | 45 ++++++++++++++++++++++++++------
>>  2 files changed, 37 insertions(+), 29 deletions(-)
>>
>> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
>> index 29506815d24a..a1212b5b3026 100644
>> --- a/Documentation/gpu/todo.rst
>> +++ b/Documentation/gpu/todo.rst
>> @@ -300,27 +300,6 @@ Contact: Daniel Vetter, Noralf Tronnes
>>
>>  Level: Advanced
>>
>> -Garbage collect fbdev scrolling acceleration
>> ---------------------------------------------
>> -
>> -Scroll acceleration is disabled in fbcon by hard-wiring p->scrollmode =
=3D
>> -SCROLL_REDRAW. There's a ton of code this will allow us to remove:
>> -
>> -- lots of code in fbcon.c
>> -
>> -- a bunch of the hooks in fbcon_ops, maybe the remaining hooks could b=
e called
>> -  directly instead of the function table (with a switch on p->rotate)
>> -
>> -- fb_copyarea is unused after this, and can be deleted from all driver=
s
>> -
>> -Note that not all acceleration code can be deleted, since clearing and=
 cursor
>> -support is still accelerated, which might be good candidates for furth=
er
>> -deletion projects.
>> -
>> -Contact: Daniel Vetter
>> -
>> -Level: Intermediate
>> -
>>  idr_init_base()
>>  ---------------
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/cor=
e/fbcon.c
>> index 22bb3892f6bd..b813985f1403 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -1025,7 +1025,7 @@ static void fbcon_init(struct vc_data *vc, int in=
it)
>>  	struct vc_data *svc =3D *default_mode;
>>  	struct fbcon_display *t, *p =3D &fb_display[vc->vc_num];
>>  	int logo =3D 1, new_rows, new_cols, rows, cols;
>> -	int ret;
>> +	int cap, ret;
>>
>>  	if (WARN_ON(info_idx =3D=3D -1))
>>  	    return;
>> @@ -1034,6 +1034,7 @@ static void fbcon_init(struct vc_data *vc, int in=
it)
>>  		con2fb_map[vc->vc_num] =3D info_idx;
>>
>>  	info =3D registered_fb[con2fb_map[vc->vc_num]];
>> +	cap =3D info->flags;
>>
>>  	if (logo_shown < 0 && console_loglevel <=3D CONSOLE_LOGLEVEL_QUIET)
>>  		logo_shown =3D FBCON_LOGO_DONTSHOW;
>> @@ -1135,13 +1136,11 @@ static void fbcon_init(struct vc_data *vc, int =
init)
>>
>>  	ops->graphics =3D 0;
>>
>> -	/*
>> -	 * No more hw acceleration for fbcon.
>> -	 *
>> -	 * FIXME: Garbage collect all the now dead code after sufficient time
>> -	 * has passed.
>> -	 */
>> -	p->scrollmode =3D SCROLL_REDRAW;
>> +	if ((cap & FBINFO_HWACCEL_COPYAREA) &&
>> +	    !(cap & FBINFO_HWACCEL_DISABLED))
>> +		p->scrollmode =3D SCROLL_MOVE;
>> +	else /* default to something safe */
>> +		p->scrollmode =3D SCROLL_REDRAW;
>>
>>  	/*
>>  	 *  ++guenther: console.c:vc_allocate() relies on initializing
>> @@ -1953,15 +1952,45 @@ static void updatescrollmode(struct fbcon_displ=
ay *p,
>>  {
>>  	struct fbcon_ops *ops =3D info->fbcon_par;
>>  	int fh =3D vc->vc_font.height;
>> +	int cap =3D info->flags;
>> +	u16 t =3D 0;
>> +	int ypan =3D FBCON_SWAP(ops->rotate, info->fix.ypanstep,
>> +				  info->fix.xpanstep);
>> +	int ywrap =3D FBCON_SWAP(ops->rotate, info->fix.ywrapstep, t);
>>  	int yres =3D FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
>>  	int vyres =3D FBCON_SWAP(ops->rotate, info->var.yres_virtual,
>>  				   info->var.xres_virtual);
>> +	int good_pan =3D (cap & FBINFO_HWACCEL_YPAN) &&
>> +		divides(ypan, vc->vc_font.height) && vyres > yres;
>> +	int good_wrap =3D (cap & FBINFO_HWACCEL_YWRAP) &&
>> +		divides(ywrap, vc->vc_font.height) &&
>> +		divides(vc->vc_font.height, vyres) &&
>> +		divides(vc->vc_font.height, yres);
>> +	int reading_fast =3D cap & FBINFO_READS_FAST;
>> +	int fast_copyarea =3D (cap & FBINFO_HWACCEL_COPYAREA) &&
>> +		!(cap & FBINFO_HWACCEL_DISABLED);
>> +	int fast_imageblit =3D (cap & FBINFO_HWACCEL_IMAGEBLIT) &&
>> +		!(cap & FBINFO_HWACCEL_DISABLED);
>>
>>  	p->vrows =3D vyres/fh;
>>  	if (yres > (fh * (vc->vc_rows + 1)))
>>  		p->vrows -=3D (yres - (fh * vc->vc_rows)) / fh;
>>  	if ((yres % fh) && (vyres % fh < yres % fh))
>>  		p->vrows--;
>> +
>> +	if (good_wrap || good_pan) {
>> +		if (reading_fast || fast_copyarea)
>> +			p->scrollmode =3D good_wrap ?
>> +				SCROLL_WRAP_MOVE : SCROLL_PAN_MOVE;
>> +		else
>> +			p->scrollmode =3D good_wrap ? SCROLL_REDRAW :
>> +				SCROLL_PAN_REDRAW;
>> +	} else {
>> +		if (reading_fast || (fast_copyarea && !fast_imageblit))
>> +			p->scrollmode =3D SCROLL_MOVE;
>> +		else
>> +			p->scrollmode =3D SCROLL_REDRAW;
>> +	}
>>  }
>>
>>  #define PITCH(w) (((w) + 7) >> 3)
>> --
>> 2.31.1
>>
>

