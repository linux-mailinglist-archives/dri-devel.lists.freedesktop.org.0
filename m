Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 803BF4C634D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 07:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9FD10E162;
	Mon, 28 Feb 2022 06:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1814510E162
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 06:44:32 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id w4so9267416ilj.5
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 22:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=naa1bQQ3wDALov45zcQaVdVKBgdT17zOTWl4QEhFOG8=;
 b=Dbne3WMFHDtIsMbCcNHhvP6hJYwPDEankTOHAl9Tg7kaRbjbEsHF7WjmOFDdBlripu
 CLjLXpoITQsy6gmj4s9X9GHXD8/+ice0DuAt9R2gd2F0lXPbpsYSnFcOoowdu2jI2qlg
 tPO1YQyXD3ZdmVhew0XzDvM5Sazn+S1KCjKrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=naa1bQQ3wDALov45zcQaVdVKBgdT17zOTWl4QEhFOG8=;
 b=FZh01SC3a4OKPh1aPr1HYKKlsNtOzzYq+3N9cUizPOy7SuGscQQTej5DSD1jKqzTnA
 Pax5Z7iJRo+KmjQlyaKZhF2KJ2QzsQGkYNihRvSMqoRU39G+E1fAAZNTmizbVgT5nnXx
 0+KMkl01rk1sXYYxyGKSAYatdJ2q8uFJs1Oav4l4AdLvXWRyGhdS2BLBPkWa2zHVjCCR
 r2VEYHee/D43ANiYmPi8OoJT2BPBdYffH6hyM5AM9fEb6KPF+z0n4XkvrrkJbHzaIqw1
 39if8kXpwog3FWN3NNgSWyKaZiyWwP7C1P251/zgUVB0uHiPmJxNDjy1oX07dcebscYI
 Bbnw==
X-Gm-Message-State: AOAM530Q1wHmct31M+p9Q2EI+oBfCgkOTQoY+XxHtmokpd6qjd13FHiT
 1P5Urjbt5silDK70/UHwoKaQct8a7AN1KH2/rPBCHQ==
X-Google-Smtp-Source: ABdhPJxzzDQSWbH2ghhnUuIFIexqihxzGnBtqJqBe+e8bxF2gAEQoJIdhXmDkJE+CKWZpxU2vLu57zbsn/qJOMx7y6A=
X-Received: by 2002:a92:7102:0:b0:2c2:e590:9707 with SMTP id
 m2-20020a927102000000b002c2e5909707mr4456960ilc.10.1646030671243; Sun, 27 Feb
 2022 22:44:31 -0800 (PST)
MIME-Version: 1.0
References: <20220225164231.904173-1-broonie@kernel.org>
In-Reply-To: <20220225164231.904173-1-broonie@kernel.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 28 Feb 2022 14:44:05 +0800
Message-ID: <CAJMQK-jGCX6Zp0gkfgqeA6=0zuWiSbWbytUixH3VFiwX9wtLNQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To: broonie@kernel.org
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 26, 2022 at 12:43 AM <broonie@kernel.org> wrote:
>
> Hi all,
>
> After merging the drm tree, today's linux-next build (x86 allmodconfig)
> failed like this:
>
> lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x10b: call to do_strncpy_from_user() with UACCESS enabled
> lib/strnlen_user.o: warning: objtool: strnlen_user()+0xbb: call to do_strnlen_user() with UACCESS enabled
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c: In function 'receive_timing_debugfs_show':
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
>  3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   b5c84a9edcd418 ("drm/bridge: add it6505 driver")
>
> I have used the drm tree from yesterday instead.

hi all,

The following fix should be able to address the errors. Should it be
squashed into b5c84a9edcd418 ("drm/bridge: add it6505 driver")?

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c
b/drivers/gpu/drm/bridge/ite-it6505.c
index fb16a176822d81..f2f101220ade94 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -289,7 +289,7 @@
 #define WORD_LENGTH_20BIT 2
 #define WORD_LENGTH_24BIT 3
 #define DEBUGFS_DIR_NAME "it6505-debugfs"
-#define READ_BUFFER_SIZE 200
+#define READ_BUFFER_SIZE 400

 /* Vendor option */
 #define HDCP_DESIRED 1
@@ -3074,7 +3074,7 @@ static ssize_t
receive_timing_debugfs_show(struct file *file, char __user *buf,
        struct it6505 *it6505 = file->private_data;
        struct drm_display_mode *vid = &it6505->video_info;
        u8 read_buf[READ_BUFFER_SIZE];
-       u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
+       u8 *str = read_buf, *end = read_buf + READ_BUFFER_SIZE;
        ssize_t ret, count;

        if (!it6505)
