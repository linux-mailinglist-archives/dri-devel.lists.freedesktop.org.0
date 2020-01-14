Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286F813A23F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 08:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2428F6E2D7;
	Tue, 14 Jan 2020 07:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036866E2D5;
 Tue, 14 Jan 2020 07:46:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7CCF6AC6E;
 Tue, 14 Jan 2020 07:46:32 +0000 (UTC)
Subject: Re: [PATCH 02/23] drm/amdgpu: Convert to struct
 drm_crtc_helper_funcs.get_scanout_position()
To: Alex Deucher <alexdeucher@gmail.com>
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-3-tzimmermann@suse.de>
 <CADnq5_OCsQQ0=Yr6xinWWCursZc0ZGBrNj1=0667kbqE1BorVw@mail.gmail.com>
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
Message-ID: <7ce3554d-b81e-e3bb-804d-1f69df558596@suse.de>
Date: Tue, 14 Jan 2020 08:46:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CADnq5_OCsQQ0=Yr6xinWWCursZc0ZGBrNj1=0667kbqE1BorVw@mail.gmail.com>
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
Cc: hamohammed.sa@gmail.com, Dave Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, alexandre.torgue@st.com,
 Thomas Hellstrom <thellstrom@vmware.com>, Sean Paul <sean@poorly.run>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, mcoquelin.stm32@gmail.com,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vincent Abriou <vincent.abriou@st.com>,
 rodrigosiqueiramelo@gmail.com, philippe.cornu@st.com, yannick.fertre@st.com,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0589005342=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0589005342==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ze5gAYUIJh5RqpeP1fLk3HyxsXcvJAdv5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ze5gAYUIJh5RqpeP1fLk3HyxsXcvJAdv5
Content-Type: multipart/mixed; boundary="d8m6vbaJ76KgbPpLDKzJ4x85fVIAmDTHh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Chunming Zhou <David1.Zhou@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>, yannick.fertre@st.com,
 philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 Eric Anholt <eric@anholt.net>, rodrigosiqueiramelo@gmail.com,
 hamohammed.sa@gmail.com,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Ben Skeggs <bskeggs@redhat.com>,
 "Wentland, Harry" <harry.wentland@amd.com>,
 "Leo (Sunpeng) Li" <sunpeng.li@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Message-ID: <7ce3554d-b81e-e3bb-804d-1f69df558596@suse.de>
Subject: Re: [PATCH 02/23] drm/amdgpu: Convert to struct
 drm_crtc_helper_funcs.get_scanout_position()
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-3-tzimmermann@suse.de>
 <CADnq5_OCsQQ0=Yr6xinWWCursZc0ZGBrNj1=0667kbqE1BorVw@mail.gmail.com>
In-Reply-To: <CADnq5_OCsQQ0=Yr6xinWWCursZc0ZGBrNj1=0667kbqE1BorVw@mail.gmail.com>

--d8m6vbaJ76KgbPpLDKzJ4x85fVIAmDTHh
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.01.20 um 19:52 schrieb Alex Deucher:
> On Fri, Jan 10, 2020 at 4:21 AM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> The callback struct drm_driver.get_scanout_position() is deprecated in=

>> favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert
>> amdgpu over.
>>
>=20
> I would prefer to just change the signature of
> amdgpu_display_get_crtc_scanoutpos() to match the new API rather than
> wrapping it again.

Will be fixed in v2. I wrapped these functions in amdgpu and radeon to
avoid changes to other, unreleted callers.

Best regards
Thomas

>=20
> Alex
>=20
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 12 ++++++++++++
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 11 -----------
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h          |  5 +++++
>>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            |  1 +
>>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            |  1 +
>>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             |  1 +
>>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             |  1 +
>>  drivers/gpu/drm/amd/amdgpu/dce_virtual.c          |  1 +
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 ++-
>>  9 files changed, 24 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_display.c
>> index 4e699071d144..a1e769d4417d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> @@ -914,3 +914,15 @@ int amdgpu_display_crtc_idx_to_irq_type(struct am=
dgpu_device *adev, int crtc)
>>                 return AMDGPU_CRTC_IRQ_NONE;
>>         }
>>  }
>> +
>> +bool amdgpu_crtc_get_scanout_position(struct drm_crtc *crtc,
>> +                       bool in_vblank_irq, int *vpos,
>> +                       int *hpos, ktime_t *stime, ktime_t *etime,
>> +                       const struct drm_display_mode *mode)
>> +{
>> +       struct drm_device *dev =3D crtc->dev;
>> +       unsigned int pipe =3D crtc->index;
>> +
>> +       return amdgpu_display_get_crtc_scanoutpos(dev, pipe, 0, vpos, =
hpos,
>> +                                                 stime, etime, mode);=

>> +}
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_drv.c
>> index 3f6f14ce1511..0749285dd1c7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -1367,16 +1367,6 @@ int amdgpu_file_to_fpriv(struct file *filp, str=
uct amdgpu_fpriv **fpriv)
>>         return 0;
>>  }
>>
>> -static bool
>> -amdgpu_get_crtc_scanout_position(struct drm_device *dev, unsigned int=
 pipe,
>> -                                bool in_vblank_irq, int *vpos, int *h=
pos,
>> -                                ktime_t *stime, ktime_t *etime,
>> -                                const struct drm_display_mode *mode)
>> -{
>> -       return amdgpu_display_get_crtc_scanoutpos(dev, pipe, 0, vpos, =
hpos,
>> -                                                 stime, etime, mode);=

>> -}
>> -
>>  static struct drm_driver kms_driver =3D {
>>         .driver_features =3D
>>             DRIVER_USE_AGP | DRIVER_ATOMIC |
>> @@ -1391,7 +1381,6 @@ static struct drm_driver kms_driver =3D {
>>         .enable_vblank =3D amdgpu_enable_vblank_kms,
>>         .disable_vblank =3D amdgpu_disable_vblank_kms,
>>         .get_vblank_timestamp =3D drm_calc_vbltimestamp_from_scanoutpo=
s,
>> -       .get_scanout_position =3D amdgpu_get_crtc_scanout_position,
>>         .irq_handler =3D amdgpu_irq_handler,
>>         .ioctls =3D amdgpu_ioctls_kms,
>>         .gem_free_object_unlocked =3D amdgpu_gem_object_free,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_mode.h
>> index eb9975f4decb..37ba07e2feb5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>> @@ -612,6 +612,11 @@ void amdgpu_panel_mode_fixup(struct drm_encoder *=
encoder,
>>                              struct drm_display_mode *adjusted_mode);
>>  int amdgpu_display_crtc_idx_to_irq_type(struct amdgpu_device *adev, i=
nt crtc);
>>
>> +bool amdgpu_crtc_get_scanout_position(struct drm_crtc *crtc,
>> +                       bool in_vblank_irq, int *vpos,
>> +                       int *hpos, ktime_t *stime, ktime_t *etime,
>> +                       const struct drm_display_mode *mode);
>> +
>>  /* fbdev layer */
>>  int amdgpu_fbdev_init(struct amdgpu_device *adev);
>>  void amdgpu_fbdev_fini(struct amdgpu_device *adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/=
amd/amdgpu/dce_v10_0.c
>> index 40d2ac723dd6..bdc1e0f036d4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
>> @@ -2685,6 +2685,7 @@ static const struct drm_crtc_helper_funcs dce_v1=
0_0_crtc_helper_funcs =3D {
>>         .prepare =3D dce_v10_0_crtc_prepare,
>>         .commit =3D dce_v10_0_crtc_commit,
>>         .disable =3D dce_v10_0_crtc_disable,
>> +       .get_scanout_position =3D amdgpu_crtc_get_scanout_position,
>>  };
>>
>>  static int dce_v10_0_crtc_init(struct amdgpu_device *adev, int index)=

>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/=
amd/amdgpu/dce_v11_0.c
>> index 898ef72d423c..0319da5f7bf9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>> @@ -2793,6 +2793,7 @@ static const struct drm_crtc_helper_funcs dce_v1=
1_0_crtc_helper_funcs =3D {
>>         .prepare =3D dce_v11_0_crtc_prepare,
>>         .commit =3D dce_v11_0_crtc_commit,
>>         .disable =3D dce_v11_0_crtc_disable,
>> +       .get_scanout_position =3D amdgpu_crtc_get_scanout_position,
>>  };
>>
>>  static int dce_v11_0_crtc_init(struct amdgpu_device *adev, int index)=

>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/a=
md/amdgpu/dce_v6_0.c
>> index db15a112becc..78642c3b14fc 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
>> @@ -2575,6 +2575,7 @@ static const struct drm_crtc_helper_funcs dce_v6=
_0_crtc_helper_funcs =3D {
>>         .prepare =3D dce_v6_0_crtc_prepare,
>>         .commit =3D dce_v6_0_crtc_commit,
>>         .disable =3D dce_v6_0_crtc_disable,
>> +       .get_scanout_position =3D amdgpu_crtc_get_scanout_position,
>>  };
>>
>>  static int dce_v6_0_crtc_init(struct amdgpu_device *adev, int index)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/a=
md/amdgpu/dce_v8_0.c
>> index f06c9022c1fd..1e8d4975435a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
>> @@ -2593,6 +2593,7 @@ static const struct drm_crtc_helper_funcs dce_v8=
_0_crtc_helper_funcs =3D {
>>         .prepare =3D dce_v8_0_crtc_prepare,
>>         .commit =3D dce_v8_0_crtc_commit,
>>         .disable =3D dce_v8_0_crtc_disable,
>> +       .get_scanout_position =3D amdgpu_crtc_get_scanout_position,
>>  };
>>
>>  static int dce_v8_0_crtc_init(struct amdgpu_device *adev, int index)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/dr=
m/amd/amdgpu/dce_virtual.c
>> index e4f94863332c..4b2f915aba47 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
>> @@ -218,6 +218,7 @@ static const struct drm_crtc_helper_funcs dce_virt=
ual_crtc_helper_funcs =3D {
>>         .prepare =3D dce_virtual_crtc_prepare,
>>         .commit =3D dce_virtual_crtc_commit,
>>         .disable =3D dce_virtual_crtc_disable,
>> +       .get_scanout_position =3D amdgpu_crtc_get_scanout_position,
>>  };
>>
>>  static int dce_virtual_crtc_init(struct amdgpu_device *adev, int inde=
x)
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drive=
rs/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index f2db400a3920..39c5cf242c1b 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -4821,7 +4821,8 @@ static bool dm_crtc_helper_mode_fixup(struct drm=
_crtc *crtc,
>>  static const struct drm_crtc_helper_funcs amdgpu_dm_crtc_helper_funcs=
 =3D {
>>         .disable =3D dm_crtc_helper_disable,
>>         .atomic_check =3D dm_crtc_helper_atomic_check,
>> -       .mode_fixup =3D dm_crtc_helper_mode_fixup
>> +       .mode_fixup =3D dm_crtc_helper_mode_fixup,
>> +       .get_scanout_position =3D amdgpu_crtc_get_scanout_position,
>>  };
>>
>>  static void dm_encoder_helper_disable(struct drm_encoder *encoder)
>> --
>> 2.24.1
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--d8m6vbaJ76KgbPpLDKzJ4x85fVIAmDTHh--

--ze5gAYUIJh5RqpeP1fLk3HyxsXcvJAdv5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4dcdIACgkQaA3BHVML
eiPo7Af+O7W21BgMWX8hYlJvRZd0v8wVkJ9VFqgkW5CUexHacuJB9nJYj0T5UDfp
xWzweSOva5AeHkINjkXqikFWn841Q16BZ0l+UsC/FCDkfBYQARI1xN7Bi01bL80R
WGzRUV1ORVxzHbUPCR/+hKbLrqa9fuxbYI1QiLlt7++KfXQu87g4huuTrlviU09w
EOderXnB9UHC5tLvjshI/C1XoMZGxXWwGz9K4giQrRCNMobz1Ib4MTTbg+yoa9g8
MhzypABzPbu4+P58gwnwjNINe+nTPC0UmlqMNNGdKlQi22ibaJnmSwYyAhoXQbct
4U32mjCM8Da9wntcqsgyAPT47BVjZA==
=8NKQ
-----END PGP SIGNATURE-----

--ze5gAYUIJh5RqpeP1fLk3HyxsXcvJAdv5--

--===============0589005342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0589005342==--
