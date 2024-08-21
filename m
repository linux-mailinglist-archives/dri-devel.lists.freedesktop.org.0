Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E0895A287
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 18:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4BA10E5B9;
	Wed, 21 Aug 2024 16:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kziFd8mM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F97210E602
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 16:12:25 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-e13c2ef0f6fso5200991276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 09:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1724256744; x=1724861544;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PwcKOnzwG6QnC9n0i5TxwqfaEkJiWIM/uJRNyENilTM=;
 b=kziFd8mMNNfFEwa700w2LbNMg2WjpUEMaKAdncUKomIb4ioIOZ3POgzHKJCeBjiNbv
 E4G/4Ic+BjplcgqRgGxaKnefJsPUY01G9HdLlLyB/40Uv2dRSdeCxtlERsN+z+xyIsvl
 MqXOUWRmh23qLxSKEIVCC8wubKun/d5FEKPHiDbt3IankNv4cczp1CN6aux0F3EIXve0
 B7NNc4ZTkw7bggdWTdOGDKbalVZZUOYZSj1oIY291MpvDCT35zcQFrexLPf/tLakGZvA
 qOZwxKoI7kTmDa+CXMF3nQRgrAqIywviuDOIwj25Ovf3L0hDinWIbrw+0CZUinf6Jk2Q
 2Img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724256744; x=1724861544;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PwcKOnzwG6QnC9n0i5TxwqfaEkJiWIM/uJRNyENilTM=;
 b=QMM4z+lbz60myL8A++iBKazbmIoSsucQNAbY68WC6KtXPVwgdqh733G1iAWDZKyEVx
 aBVopZdfU7XVPNa7KXvTP8qpKw8tr78tIuk+K1fvGA0/v2DnAzfRUNg6kYAjO33H63mn
 qMPF8PZB/d2r5yx5b2TIsegLNDeMdAyjMcbzX8sP7GByKQ45vNc1Fz79EQAOBbMTXPKh
 E7wnZRrSrbvpYVlVHhJsVLE7YzNJewnCnFNa4UTOPuR6LMqCy9VPbZKfr2nRtK38N98g
 ciLbSKiC+qkafMLR4Q6RFKVcd4lNR5NQVbL/C+LNF1rozr1HoA+pMbtAWZJcdjGRhVXu
 DRDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXunf2Xm0ec1iAtMV1RVf3V78i7hw0yVnhY/ZOBj0mzDw5CsdqSh2QGyMfU7/LNYsEAQamMe0dXIx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUnxRdD7akW/wQtCu1O0GnI7Nkq4q0heVRY7ZfwSQ7Gmk8j1VJ
 o3nSwr2eJepi1/a2bNrXwOtQfOTcQ0gdZF1m3saDCaMdFLbXtCbXwcuZfcEbhNmMnsPWekpJw8P
 D3fay9e3uHEF8/BCaMHp8AL+iKwrlKkhMVTsWNw==
X-Google-Smtp-Source: AGHT+IERa600AtL1OjLJzx8ovPfZhum5LJsFp4M6ZM7H/mFS5GrjVLzXEqqQ00xG0pFhGGg1S8NclW91lnDCVQdBiDw=
X-Received: by 2002:a05:6902:2205:b0:e16:cfa:b2c6 with SMTP id
 3f1490d57ef6-e166642f1c8mr2919958276.29.1724256744436; Wed, 21 Aug 2024
 09:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1724249420.git.hverkuil-cisco@xs4all.nl>
 <501bb64b027022ebcfb9636e9267dfba520c4a67.1724249421.git.hverkuil-cisco@xs4all.nl>
In-Reply-To: <501bb64b027022ebcfb9636e9267dfba520c4a67.1724249421.git.hverkuil-cisco@xs4all.nl>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 21 Aug 2024 17:12:08 +0100
Message-ID: <CAPY8ntBz9Z-OVHpHinANN5WP6Ki8Fa0Fv0VFj+6kniRr-yOqPA@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] media: i2c: tc358743: export InfoFrames to debugfs
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Hans

This is a very useful little series - thanks.

On Wed, 21 Aug 2024 at 15:16, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Export InfoFrames to debugfs.

I had a tc358743 to hand, so thought this warranted a quick test.
I think you have an off-by-one on the length that this exposes.

log_status is giving me state
   [  428.600874] tc358743 10-000f: -----HDMI status-----
   [  428.600881] tc358743 10-000f: HDCP encrypted content: no
   [  428.600887] tc358743 10-000f: Input color space: RGB limited range
   [  428.601404] tc358743 10-000f: AV Mute: off
   [  428.601921] tc358743 10-000f: Deep color mode: 8-bits per channel
   [  428.604407] tc358743 10-000f: HDMI infoframe: Auxiliary Video
Information (AVI), version 2, length 13
   [  428.604425] tc358743 10-000f:     colorspace: RGB
   [  428.604433] tc358743 10-000f:     scan mode: Underscan
   [  428.604441] tc358743 10-000f:     colorimetry: No Data
   [  428.604449] tc358743 10-000f:     picture aspect: 16:9
   [  428.604456] tc358743 10-000f:     active aspect: Same as Picture
   [  428.604463] tc358743 10-000f:     itc: No Data
   [  428.604469] tc358743 10-000f:     extended colorimetry: xvYCC 601
   [  428.604476] tc358743 10-000f:     quantization range: Limited
   [  428.604483] tc358743 10-000f:     nups: Unknown Non-uniform Scaling
   [  428.604490] tc358743 10-000f:     video code: 4
   [  428.604497] tc358743 10-000f:     ycc quantization range: Limited
   [  428.604505] tc358743 10-000f:     hdmi content type: Graphics
   [  428.604511] tc358743 10-000f:     pixel repeat: 0
   [  428.604519] tc358743 10-000f:     bar top 0, bottom 0, left 0, right 0

pi@bookworm64:~/edid-decode $ xxd /sys/kernel/debug/v4l2/tc358743\
10-000f/infoframes/avi
00000000: 8202 0d2d 1228 0404 0000 0000 0000 0000  ...-.(..........

At the transmitting end I've got
pi@bookworm64:~/edid-decode $ sudo xxd
/sys/kernel/debug/dri/1/HDMI-A-1/infoframes/avi
00000000: 8202 0d2d 1228 0404 0000 0000 0000 0000  ...-.(..........
00000010: 00

edid-decode -I decodes the latter fine, but aborts on the former.
Oddly the "fail" message from parse_if_hdr [1] doesn't get printed, it
just stops with
pi@bookworm64:~/edid-decode $ ./build/edid-decode -I
/sys/kernel/debug/v4l2/tc358743\ 10-000f/infoframes/avi
edid-decode InfoFrame (hex):

82 02 0d 2d 12 28 04 04 00 00 00 00 00 00 00 00

----------------

HDMI InfoFrame Checksum: 0x2d

AVI InfoFrame
  Version: 2
  Length: 13


[1] https://git.linuxtv.org/edid-decode.git/tree/parse-if.cpp#n21

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/i2c/tc358743.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index 65d58ddf0287..c7652c0dbaeb 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -87,6 +87,10 @@ struct tc358743_state {
>         struct timer_list timer;
>         struct work_struct work_i2c_poll;
>
> +       /* debugfs */
> +       struct dentry *debugfs_dir;
> +       struct v4l2_debugfs_if *infoframes;
> +
>         /* edid  */
>         u8 edid_blocks_written;
>
> @@ -430,12 +434,35 @@ static void tc358743_erase_bksv(struct v4l2_subdev *sd)
>
>  /* --------------- AVI infoframe --------------- */
>
> +static ssize_t
> +tc358743_debugfs_if_read(u32 type, void *priv, struct file *filp,
> +                        char __user *ubuf, size_t count, loff_t *ppos)
> +{
> +       u8 buf[V4L2_DEBUGFS_IF_MAX_LEN] = {};
> +       struct v4l2_subdev *sd = priv;
> +       int len;
> +
> +       if (!is_hdmi(sd))
> +               return 0;
> +
> +       if (type != V4L2_DEBUGFS_IF_AVI)
> +               return 0;
> +
> +       i2c_rd(sd, PK_AVI_0HEAD, buf, PK_AVI_16BYTE - PK_AVI_0HEAD + 1);
> +       len = buf[2] + 3;

tda1997x has len = buffer[2] + 4;
adv7842 and adv7604 have len = buf[2] + 1; and then return len + 3;
adv7511 has len = buffer[2]; and return len + 4;

So I think this should be len = buf[2] + 4;

Doing so makes edid-decode happy.
pi@bookworm64:~/edid-decode $ sudo ./build/edid-decode -I
/sys/kernel/debug/v4l2/tc358743\ 10-000f/infoframes/avi
edid-decode InfoFrame (hex):

82 02 0d 2d 12 28 04 04 00 00 00 00 00 00 00 00
00

----------------

HDMI InfoFrame Checksum: 0x2d

AVI InfoFrame
  Version: 2
  Length: 13
  VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
  Y: Color Component Sample Format: RGB
  A: Active Format Information Present: Yes
  B: Bar Data Present: Bar Data not present
  S: Scan Information: Composed for an underscanned display
  C: Colorimetry: No Data
  M: Picture Aspect Ratio: 16:9
  R: Active Portion Aspect Ratio: 8
  ITC: IT Content: No Data
  EC: Extended Colorimetry: xvYCC601
  Q: RGB Quantization Range: Limited Range
  SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
  YQ: YCC Quantization Range: Limited Range
  CN: IT Content Type: Graphics
  PR: Pixel Data Repetition Count: 0
  Line Number of End of Top Bar: 0
  Line Number of Start of Bottom Bar: 0
  Pixel Number of End of Left Bar: 0
  Pixel Number of Start of Right Bar: 0

I haven't double checked the maths to ensure that we have read that
extra byte via i2c_rd though.

  Dave

> +       if (len > V4L2_DEBUGFS_IF_MAX_LEN)
> +               len = -ENOENT;
> +       if (len > 0)
> +               len = simple_read_from_buffer(ubuf, count, ppos, buf, len);
> +       return len < 0 ? 0 : len;
> +}
> +
>  static void print_avi_infoframe(struct v4l2_subdev *sd)
>  {
>         struct i2c_client *client = v4l2_get_subdevdata(sd);
>         struct device *dev = &client->dev;
>         union hdmi_infoframe frame;
> -       u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];
> +       u8 buffer[HDMI_INFOFRAME_SIZE(AVI)] = {};
>
>         if (!is_hdmi(sd)) {
>                 v4l2_info(sd, "DVI-D signal - AVI infoframe not supported\n");
> @@ -2161,6 +2188,11 @@ static int tc358743_probe(struct i2c_client *client)
>         if (err < 0)
>                 goto err_work_queues;
>
> +       state->debugfs_dir = debugfs_create_dir(sd->name, v4l2_debugfs_root());
> +       state->infoframes = v4l2_debugfs_if_alloc(state->debugfs_dir,
> +                                                 V4L2_DEBUGFS_IF_AVI, sd,
> +                                                 tc358743_debugfs_if_read);
> +
>         v4l2_info(sd, "%s found @ 0x%x (%s)\n", client->name,
>                   client->addr << 1, client->adapter->name);
>
> @@ -2188,6 +2220,8 @@ static void tc358743_remove(struct i2c_client *client)
>                 flush_work(&state->work_i2c_poll);
>         }
>         cancel_delayed_work_sync(&state->delayed_work_enable_hotplug);
> +       v4l2_debugfs_if_free(state->infoframes);
> +       debugfs_remove_recursive(state->debugfs_dir);
>         cec_unregister_adapter(state->cec_adap);
>         v4l2_async_unregister_subdev(sd);
>         v4l2_device_unregister_subdev(sd);
> --
> 2.43.0
>
