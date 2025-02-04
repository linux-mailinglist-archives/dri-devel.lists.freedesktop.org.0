Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C63A26D08
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275A610E5AD;
	Tue,  4 Feb 2025 08:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VMwf6xi3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C1810E5AD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 08:10:48 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-723442fd88aso1417795a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 00:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738656648; x=1739261448;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fBOHK+Q/PiXoFDTQsRo03kveewFCE282saxpBbp1It8=;
 b=VMwf6xi3XQ2mGUWrqIP5L6H7tjV+cv+xeqCJmwjdRtUJj81pst/Y/rnv7Prw97qnZU
 /xa/1i6DiT5aYwFYkHqDTIuGImp8mum0C/nYd27baxPDu8Vv3lHIDk1qX+RRW2YBqg1o
 7fdu0/SmbdFws4S4vwC+pg3OzhRdk5Wor8qMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738656648; x=1739261448;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fBOHK+Q/PiXoFDTQsRo03kveewFCE282saxpBbp1It8=;
 b=moyCewJkIozKZTfXlr4VINOV4gFhN5+yUjvVZcamfzYB72bBVJU77immeaTZZlBdJ5
 vcoA9YkDa0dSOucW34gzKAkNpp62NrhZMVXNl44XUKDYPzoBwYsRNWaCdFSMzqLMyl9W
 tHVAPt+njB91m23et8Scng5XYVAnqecY+qQOdD6Xoru6cweDmETkubKk+hyZP13V7U0+
 X4C7DHG2kEGpTY9DfRfD8Y4kT443PFwV32oKGbYWyFXSa3PL5xVNZOWbuTcAFZwypAGi
 xiw1BPoLOugPwZb4092Ngf9mRywXO0MXiizT9xDccSXRk55f956HP2cAihyUdBGnMEO7
 NhGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSbpBzBpx17sV/uTi+Sm/q/4JinkhfJVck8mb/brKWvsAOTKiRkVmaG9GRhyU9103SrKmBONVnU0I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxl+ftis1RgejlXVhaMAaLoRGR4Sy4COVvgTW0c8k4yMQhKMVlQ
 x7283KVg3uLEKu+oSpsUwm8bSmxyJof/r9D0pstaUlSyDpBf53lUgyp2wHk+vrYRmcUaARzSLRD
 SRM5wb8L94b0RzT11qlCGm3sojg5E/qhQm0Ci
X-Gm-Gg: ASbGnctWH74AIlSmx9UA3dh1Gp8pI6IDN0ZETHiRuqVkrTvIDZXgMd3IoppclC6B3Ed
 1bg8LP59cXli95SyHiO0RAdZ2kiWiMY1pALjXqA7fLMG0oBtEpi6GZYC04K7F1yxXd23Tbq0IvI
 9/6PHzI0yiJRTj4U4Ne0qlicnZ
X-Google-Smtp-Source: AGHT+IEGazkErGJ8ZI2eWHrSd+ujGXNBP8bsAq54aQ0/O1UZ1Q8bvMN88D+/+7XzJT6SJMt/knMfkGJREUraQnynwpg=
X-Received: by 2002:a05:6830:2a86:b0:71f:c1df:1824 with SMTP id
 46e09a7af769-726568d3d40mr14151695a34.17.1738656648078; Tue, 04 Feb 2025
 00:10:48 -0800 (PST)
MIME-Version: 1.0
References: <20250203-add-audio-codec-v2-1-5c8cd72ee5bb@ite.com.tw>
 <btzdguakskos2gogmwjkz6zoquiut63kmirvdsh4yjoqqvzpin@um4hcrlnecxh>
 <9742a55aa51a461a9d5b9352db0f3c39@ite.com.tw>
In-Reply-To: <9742a55aa51a461a9d5b9352db0f3c39@ite.com.tw>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 4 Feb 2025 16:10:37 +0800
X-Gm-Features: AWEUYZnM1BWgIdbI_hgQydOE6fyx_n8pV9ZxP7JUS_Tq4SOjod2hVZPoMwkE-F0
Message-ID: <CAEXTbpe891XQW6FsYs=uw-PanmVznp5ieeCbJWprZ-+=83KwJA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: it6505: support hdmi_codec_ops for audio
 stream setup
To: Hermes.Wu@ite.com.tw
Cc: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hermes,

On Tue, Feb 4, 2025 at 11:49=E2=80=AFAM <Hermes.Wu@ite.com.tw> wrote:
>
> Hi
> >
> >-----Original Message-----
> >From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >Sent: Tuesday, February 4, 2025 1:28 AM
> >To: Hermes Wu (=E5=90=B3=E4=BD=B3=E5=AE=8F) <Hermes.Wu@ite.com.tw>
> >Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstr=
ong@linaro.org>; Robert Foss <rfoss@kernel.org>; Laurent Pinchart <Laurent.=
pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>; Jernej Skrabec=
 <jernej.skrabec@gmail.com>; Maarten Lankhorst <maarten.lankhorst@linux.int=
el.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann=
@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch=
>; treapking@chromium.org; dri-devel@lists.freedesktop.org; linux-kernel@vg=
er.kernel.org; Pet Weng (=E7=BF=81=E7=8E=89=E8=8A=AC) <Pet.Weng@ite.com.tw>=
; Kenneth Hung (=E6=B4=AA=E5=AE=B6=E5=80=AB) <Kenneth.Hung@ite.com.tw>
> >Subject: Re: [PATCH v2] drm/bridge: it6505: support hdmi_codec_ops for a=
udio stream setup
> >
> >On Mon, Feb 03, 2025 at 02:04:30PM +0800, Hermes Wu via B4 Relay wrote:
> >> From: Hermes Wu <Hermes.wu@ite.com.tw>
> >>
> >> For supporting audio form I2S to DP audio data sub stream.
> >> Add hdmi_audio callbacks to drm_bridge_funcs for the HDMI codec
> >> framework. The DRM_BRIDGE_OP_HDMI flag in bridge.ops must be set, and
> >> hdmi_write_infoframe and hdmi_clear_infoframe are necessary for the
> >> drm_bridge_connector to enable the HDMI codec.
> >
> >Please split this into two commits: one adding OP_HDMI, second one addin=
g audio support.
>
> This will need send patches with cover letter, should I keep patch versio=
n or reset it?

I would bump to v3 in this case.

Regards,
Pin-yen
>
> >>
> >> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> >> ---
> >> Changes in v2:
> >> - Use DRM HDMI codec framewrok for audio stream setup.
> >> - Link to v1:
> >> https://lore.kernel.org/r/20250121-add-audio-codec-v1-1-e3ff71b3c819@i
> >> te.com.tw
> >> ---
> >>  drivers/gpu/drm/bridge/ite-it6505.c | 151
> >> +++++++++++++++++++++++++++++++-----
> >>  1 file changed, 132 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c
> >> b/drivers/gpu/drm/bridge/ite-it6505.c
> >> index
> >> 88ef76a37fe6accacdd343839ff2569b31b18ceb..361e2412b8e8f040cf4254479b60
> >> 588d99e8c99a 100644
> >> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> >> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> >> @@ -1414,32 +1414,43 @@ static void it6505_variable_config(struct it65=
05 *it6505)
> >>      memset(it6505->bksvs, 0, sizeof(it6505->bksvs));  }
> >>
> >> +static int it6505_write_avi_infoframe(struct it6505 *it6505,
> >> +                                  const u8 *buffer, size_t len) {
> >> +    struct device *dev =3D it6505->dev;
> >> +
> >> +    if (len - HDMI_INFOFRAME_HEADER_SIZE > 13) {
> >> +            DRM_DEV_DEBUG_DRIVER(dev, "AVI size fail %d", len);
> >> +            return -EINVAL;
> >> +    }
> >> +
> >> +    it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AVI_PKT, 0);
> >> +    regmap_bulk_write(it6505->regmap, REG_AVI_INFO_DB1,
> >> +                      buffer + HDMI_INFOFRAME_HEADER_SIZE,
> >> +                      len - HDMI_INFOFRAME_HEADER_SIZE);
> >> +
> >> +    it6505_write(it6505, REG_AVI_INFO_SUM, buffer[3]);
> >> +    it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AVI_PKT,
> >> +                    EN_AVI_PKT);
> >> +
> >> +    return 0;
> >> +}
> >> +
> >>  static int it6505_send_video_infoframe(struct it6505 *it6505,
> >>                                     struct hdmi_avi_infoframe *frame) =
 {
> >>      u8 buffer[HDMI_INFOFRAME_HEADER_SIZE + HDMI_AVI_INFOFRAME_SIZE];
> >> -    int err;
> >> +    int err, length;
> >>      struct device *dev =3D it6505->dev;
> >>
> >> -    err =3D hdmi_avi_infoframe_pack(frame, buffer, sizeof(buffer));
> >> -    if (err < 0) {
> >> -            dev_err(dev, "Failed to pack AVI infoframe: %d", err);
> >> -            return err;
> >> +    length =3D hdmi_avi_infoframe_pack(frame, buffer, sizeof(buffer))=
;
> >> +    if (length < 0) {
> >> +            dev_err(dev, "Failed to pack AVI infoframe: %d", length);
> >> +            return length;
> >>      }
> >>
> >> -    err =3D it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AVI_PKT, 0=
x00);
> >> -    if (err)
> >> -            return err;
> >> -
> >> -    err =3D regmap_bulk_write(it6505->regmap, REG_AVI_INFO_DB1,
> >> -                            buffer + HDMI_INFOFRAME_HEADER_SIZE,
> >> -                            frame->length);
> >> -    if (err)
> >> -            return err;
> >> -
> >> -    err =3D it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AVI_PKT,
> >> -                          EN_AVI_PKT);
> >> -    if (err)
> >> +    err =3D it6505_write_avi_infoframe(it6505, buffer, length);
> >
> >You mustn't to do this. Please instead call
> >drm_atomic_helper_connector_hdmi_update_infoframes() from your .atomic_e=
nable instead.
> >
> >> +    if (err < 0)
> >>              return err;
> >>
> >>      return 0;
> >> @@ -1625,6 +1636,18 @@ static void it6505_enable_audio_infoframe(struc=
t it6505 *it6505)
> >>                      EN_AUD_CTRL_PKT);
> >>  }
> >>
> >> +static void it6505_write_audio_infoframe(struct it6505 *it6505,
> >> +                                     const u8 *buffer, size_t len)
> >> +{
> >> +    it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AUD_PKT, 0);
> >> +    regmap_bulk_write(it6505->regmap, REG_AUD_INFOFRAM_DB1,
> >> +                      buffer + HDMI_INFOFRAME_HEADER_SIZE,
> >> +                      4);
> >> +    it6505_write(it6505, REG_AUD_INFOFRAM_SUM, buffer[3]);
> >> +    it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AUD_PKT,
> >> +                    EN_AUD_PKT);
> >> +}
> >> +
> >>  static void it6505_disable_audio(struct it6505 *it6505)  {
> >>      it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_AUD_MUTE,
> >> EN_AUD_MUTE); @@ -3302,6 +3325,85 @@ static const struct drm_edid *it6=
505_bridge_edid_read(struct drm_bridge *bridge,
> >>      return drm_edid_dup(it6505->cached_edid);
> >>  }
> >>
> >> +static int it6505_bridge_hdmi_audio_startup(struct drm_connector *con=
nector,
> >> +                                        struct drm_bridge *bridge)
> >> +{
> >> +    struct it6505 *it6505 =3D bridge_to_it6505(bridge);
> >> +    struct device *dev =3D it6505->dev;
> >> +
> >> +    if (!it6505->powered || it6505->enable_drv_hold)
> >> +            return -EIO;
> >> +
> >> +    DRM_DEV_DEBUG_DRIVER(dev, "Audio enable");
> >> +    it6505_enable_audio(it6505);
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static int it6505_bridge_hdmi_audio_prepare(struct drm_connector *con=
nector,
> >> +                                        struct drm_bridge *bridge,
> >> +                                        struct hdmi_codec_daifmt *fmt=
,
> >> +                                        struct hdmi_codec_params *hpa=
rms) {
> >> +    struct it6505 *it6505 =3D bridge_to_it6505(bridge);
> >> +
> >> +    return it6505_audio_setup_hw_params(it6505, hparms); }
> >> +
> >> +static void it6505_bridge_hdmi_audio_shutdown(struct drm_connector *c=
onnector,
> >> +                                          struct drm_bridge *bridge) =
{
> >> +    struct it6505 *it6505 =3D bridge_to_it6505(bridge);
> >> +
> >> +    if (it6505->powered && !it6505->enable_drv_hold)
> >> +            it6505_disable_audio(it6505);
> >> +}
> >> +
> >> +static int it6505_bridge_hdmi_clear_infoframe(struct drm_bridge *brid=
ge,
> >> +                                          enum hdmi_infoframe_type ty=
pe) {
> >> +    struct it6505 *it6505 =3D bridge_to_it6505(bridge);
> >> +    struct device *dev =3D it6505->dev;
> >> +
> >> +    switch (type) {
> >> +    case HDMI_INFOFRAME_TYPE_AUDIO:
> >> +            it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AUD_PKT, 0=
);
> >> +            break;
> >> +
> >> +    case HDMI_INFOFRAME_TYPE_AVI:
> >> +            it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_AVI_PKT, 0=
);
> >> +            break;
> >
> >Are SPD / Vendor InfoFrames not supported by the HW?
> >
> >> +    default:
> >> +            dev_dbg(dev, "unsupported HDMI infoframe 0x%x\n", type);
> >> +            break;
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static int it6505_bridge_hdmi_write_infoframe(struct drm_bridge *brid=
ge,
> >> +                                          enum hdmi_infoframe_type ty=
pe,
> >> +                                          const u8 *buffer, size_t le=
n) {
> >> +    struct it6505 *it6505 =3D bridge_to_it6505(bridge);
> >> +    struct device *dev =3D it6505->dev;
> >> +
> >> +    switch (type) {
> >> +    case HDMI_INFOFRAME_TYPE_AUDIO:
> >> +            it6505_write_audio_infoframe(it6505, buffer, len);
> >> +            break;
> >> +
> >> +    case HDMI_INFOFRAME_TYPE_AVI:
> >> +            it6505_write_avi_infoframe(it6505, buffer, len);
> >> +            break;
> >> +    default:
> >> +            dev_dbg(dev, "unsupported HDMI infoframe 0x%x\n", type);
> >> +            break;
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >
> >Please group functions logically, by having all InfoFrame functions next=
 to each other.
> >
> >> +
> >>  static const struct drm_bridge_funcs it6505_bridge_funcs =3D {
> >>      .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_st=
ate,
> >>      .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> >> @@ -3315,6 +3417,12 @@ static const struct drm_bridge_funcs it6505_bri=
dge_funcs =3D {
> >>      .atomic_post_disable =3D it6505_bridge_atomic_post_disable,
> >>      .detect =3D it6505_bridge_detect,
> >>      .edid_read =3D it6505_bridge_edid_read,
> >> +    .hdmi_audio_startup =3D it6505_bridge_hdmi_audio_startup,
> >> +    .hdmi_audio_prepare =3D it6505_bridge_hdmi_audio_prepare,
> >> +    .hdmi_audio_shutdown =3D it6505_bridge_hdmi_audio_shutdown,
> >> +    .hdmi_clear_infoframe =3D it6505_bridge_hdmi_clear_infoframe,
> >> +    .hdmi_write_infoframe =3D it6505_bridge_hdmi_write_infoframe,
> >
> >No .hdmi_tmds_char_rate_valid?
> >
> >> +
> >>  };
> >>
> >>  static __maybe_unused int it6505_bridge_resume(struct device *dev) @@
> >> -3700,7 +3808,12 @@ static int it6505_i2c_probe(struct i2c_client *cli=
ent)
> >>      it6505->bridge.funcs =3D &it6505_bridge_funcs;
> >>      it6505->bridge.type =3D DRM_MODE_CONNECTOR_DisplayPort;
> >>      it6505->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID =
|
> >> -                         DRM_BRIDGE_OP_HPD;
> >> +                         DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_HDMI;
> >> +    it6505->bridge.vendor =3D "iTE";
> >> +    it6505->bridge.product =3D "IT6505";
> >> +    it6505->bridge.hdmi_audio_dev =3D dev;
> >> +    it6505->bridge.hdmi_audio_max_i2s_playback_channels =3D 2;
> >> +    it6505->bridge.hdmi_audio_dai_port =3D 1;
> >>      drm_bridge_add(&it6505->bridge);
> >>
> >>      return 0;
> >>
> >> ---
> >> base-commit: fe003bcb69f7bff9ff2b30b659b004dbafe52907
> >> change-id: 20250114-add-audio-codec-8c9d47062a6c
> >>
> >> Best regards,
> >> --
> >> Hermes Wu <Hermes.wu@ite.com.tw>
> >>
> >>
> >
> >--
> >With best wishes
> >Dmitry
> >
>
> BR,
> Hermes
