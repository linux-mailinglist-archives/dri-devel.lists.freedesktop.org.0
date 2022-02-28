Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0084C635A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 07:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C752210E220;
	Mon, 28 Feb 2022 06:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B56810E220
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 06:49:00 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id gb39so22771484ejc.1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 22:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VtdxgxKnpOzp/IOMEe55+hGAU7UnYBpWIDnMsFXjwTk=;
 b=S9WuuRUM63iMiQEObW/gLBEXcaHpVI0fOM4zz16PKm673tMquxmRXAUGIeFxLZKTKO
 mMI6nFJRkOwwTRxuUQ5xt8LG6gPHVcOt3q1g+QSFro4DDwMGf47c3VCc/rctOC/mTeE4
 ZaBawDtRzxAdwH+g3o3Wjaxvc8dxAfRXz1U0ZgsdLVA2Pj3nr/2HxeWA2Slcwk6hnINz
 Rc5HF3FrCyfyGHsNdntAa87x23Kn6dvC54xddzmo1mfUMwBiOaUMvh3js/nxmzgts6m4
 A7WDgsMKbIhULisN5vuNGIWuKNoMRTMfviJzxkUNrW3h1Njug+ZLNHRioQ2csQ3YxvJW
 3XJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VtdxgxKnpOzp/IOMEe55+hGAU7UnYBpWIDnMsFXjwTk=;
 b=mM6foPhVoeVCcxUw7jgCmSrvf/aslynzF4U22gUzWmovbgHe7ha3v1/kHJMjqbfA+p
 yw9gmC3ArOfOMZo1/KN0sQNZusX5KBnfBsnXihqlI6pFlTc2Eq4F5xWCEz7W4OSf5oFp
 l1DG45eYXqXeXAFkLe9/QbBHBRPqKyK3NAf8GHk5E5jIVE2DzhjadCnVGsyVe6Y7l0qD
 NeeUI4FgPvdrnPc5hdi2Tw3ao3Bk0mvaTJBqlTPeXRUcVcl5xFJLQ6Rxl31DY6aMAR1Z
 BLuRaDrSxnHJDdzPYrrjARHnJ2w5T96cA3kl5hXMDafmB+3FKFNeDo55EqbUmXZCCopm
 cLzA==
X-Gm-Message-State: AOAM5310qXLbMZcjDaRZWdZyKyd7ftokvfoaJMml0d8AcvvWyYt327aD
 p8UIcsOnYuGZdaHnLJskERTRvpi1k0NxEZrt9mTCEIEc6yU=
X-Google-Smtp-Source: ABdhPJzzNIWTAShQGm7kD0MeqfACwMltUD0PL56BN40U1IPBItne3Wp4n7o1hgAfEgBtYEEBf6XPc2GB4M32bqbPFxc=
X-Received: by 2002:a17:907:7663:b0:6ce:fdd:762d with SMTP id
 kk3-20020a170907766300b006ce0fdd762dmr14202783ejc.750.1646030938535; Sun, 27
 Feb 2022 22:48:58 -0800 (PST)
MIME-Version: 1.0
References: <20220225164231.904173-1-broonie@kernel.org>
 <CAJMQK-jGCX6Zp0gkfgqeA6=0zuWiSbWbytUixH3VFiwX9wtLNQ@mail.gmail.com>
In-Reply-To: <CAJMQK-jGCX6Zp0gkfgqeA6=0zuWiSbWbytUixH3VFiwX9wtLNQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 28 Feb 2022 16:48:47 +1000
Message-ID: <CAPM=9tz0igKq1W3N_QseF97jqCY2Q9iSYwoFBVx2qJ8rWeVx-w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Hsin-Yi Wang <hsinyi@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Dave Airlie <airlied@linux.ie>, Allen Chen <allen.chen@ite.com.tw>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Feb 2022 at 16:44, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Sat, Feb 26, 2022 at 12:43 AM <broonie@kernel.org> wrote:
> >
> > Hi all,
> >
> > After merging the drm tree, today's linux-next build (x86 allmodconfig)
> > failed like this:
> >
> > lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x10b: call to do_strncpy_from_user() with UACCESS enabled
> > lib/strnlen_user.o: warning: objtool: strnlen_user()+0xbb: call to do_strnlen_user() with UACCESS enabled
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c: In function 'receive_timing_debugfs_show':
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
> >  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
> >       |                       ^~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
> >  3076 |  u8 read_buf[READ_BUFFER_SIZE];
> >       |     ^~~~~~~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
> >  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
> >       |                       ^~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
> >  3076 |  u8 read_buf[READ_BUFFER_SIZE];
> >       |     ^~~~~~~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
> >  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
> >       |                       ^~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
> >  3076 |  u8 read_buf[READ_BUFFER_SIZE];
> >       |     ^~~~~~~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
> >  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
> >       |                       ^~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
> >  3076 |  u8 read_buf[READ_BUFFER_SIZE];
> >       |     ^~~~~~~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
> >  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
> >       |                       ^~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
> >  3076 |  u8 read_buf[READ_BUFFER_SIZE];
> >       |     ^~~~~~~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
> >  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
> >       |                       ^~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
> >  3076 |  u8 read_buf[READ_BUFFER_SIZE];
> >       |     ^~~~~~~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
> >  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
> >       |                       ^~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
> >  3076 |  u8 read_buf[READ_BUFFER_SIZE];
> >       |     ^~~~~~~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
> >  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
> >       |                       ^~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
> >  3076 |  u8 read_buf[READ_BUFFER_SIZE];
> >       |     ^~~~~~~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
> >  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
> >       |                       ^~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
> >  3076 |  u8 read_buf[READ_BUFFER_SIZE];
> >       |     ^~~~~~~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
> >  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
> >       |                       ^~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
> >  3076 |  u8 read_buf[READ_BUFFER_SIZE];
> >       |     ^~~~~~~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
> >  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
> >       |                       ^~~
> > /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
> >  3076 |  u8 read_buf[READ_BUFFER_SIZE];
> >       |     ^~~~~~~~
> > cc1: all warnings being treated as errors
> >
> > Caused by commit
> >
> >   b5c84a9edcd418 ("drm/bridge: add it6505 driver")
> >
> > I have used the drm tree from yesterday instead.
>
> hi all,
>
> The following fix should be able to address the errors. Should it be
> squashed into b5c84a9edcd418 ("drm/bridge: add it6505 driver")?

Can you send a patch with this to dri-devel? It's far too far down the
tree to sqaush anything at this point.

Dave.
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c
> b/drivers/gpu/drm/bridge/ite-it6505.c
> index fb16a176822d81..f2f101220ade94 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -289,7 +289,7 @@
>  #define WORD_LENGTH_20BIT 2
>  #define WORD_LENGTH_24BIT 3
>  #define DEBUGFS_DIR_NAME "it6505-debugfs"
> -#define READ_BUFFER_SIZE 200
> +#define READ_BUFFER_SIZE 400
>
>  /* Vendor option */
>  #define HDCP_DESIRED 1
> @@ -3074,7 +3074,7 @@ static ssize_t
> receive_timing_debugfs_show(struct file *file, char __user *buf,
>         struct it6505 *it6505 = file->private_data;
>         struct drm_display_mode *vid = &it6505->video_info;
>         u8 read_buf[READ_BUFFER_SIZE];
> -       u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
> +       u8 *str = read_buf, *end = read_buf + READ_BUFFER_SIZE;
>         ssize_t ret, count;
>
>         if (!it6505)
