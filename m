Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17943585EA0
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jul 2022 13:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DD68BD10;
	Sun, 31 Jul 2022 11:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851CEBD4FC
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jul 2022 11:23:30 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id b22so8123937plz.9
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jul 2022 04:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=UxO0hCRiQOb9reEUYNzsVTpVbLF/7FGV60JGNLvswSs=;
 b=JmSs3/OuMv2ZzgFEXNsZ8zyZzaIfy6Omrc8G1fwICxOstJa/dv8YV1xDKsZ6W4yzRx
 CfP7xliRCCnPxz9ROaEvX6+dAXpf9q15rAlwQCWDGogvPF84wHPDUJ7glryLyTsMCqLO
 m8cvRS6TuznIBxoB7YTl+B9dY5iCE2Abxrp/jwe+j5WmebpdZxBAPMxcE3H8KsDaDXWT
 50kqynwyDN1Sq6RjSqydseuHT38sfwWMmSLK6KEj5CWzmOX3sFX0XptaLtjHg/d90rkn
 d9Mm4+zOF+8+Q3Z5LWg3KOaj36LyIdJiwotTAyBLIKyGZhbWZsBJT6X5kaCW7GJe+YOw
 J0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=UxO0hCRiQOb9reEUYNzsVTpVbLF/7FGV60JGNLvswSs=;
 b=39x5raZjCoBgyCk4iqHhmmDiUlnfYws8qROWfnj0b4mrH4B9JAk2lNg0O9BvlsOqdu
 DrExs80id2CW6jubthUkhgzhozu1kSJa+7Z0OiqAcf16NmO15X2Tp39wYloFHg/BrE26
 mok4FBEp/skQID1GYW9L1BxBwRV7RPMLYFF7d6Krh+wLfLISDveALTNTuq03A9pRewC3
 DnOaWKmH8Lu6f/hloI6IkiiAIc8VOc9ozK84Q3PoTDzAmXcBZrQIZFQCJOlQfuMw+9AQ
 e65BRsyXgVXTdmLeJBwUVE5GB4LGjF0u5xEAoknZMqRgajEpiZHkzT/llqryl3OlwDBB
 sFLw==
X-Gm-Message-State: ACgBeo2YHzHPG3akA5jXbuCABr0+6UOmOxu5FrQ+juUGGceJnc6AZEyw
 VQibHtVSAsD8+9sHqnewTDEjzifCmxn9pg==
X-Google-Smtp-Source: AA6agR5KXbP9LtVASQRwxwKayUAA/k5/NSjuCqXng2gJ4SFzYQ5i8/JHiUjS7coBUD0psPAevqisEg==
X-Received: by 2002:a17:90b:4f8e:b0:1f4:ed30:d286 with SMTP id
 qe14-20020a17090b4f8e00b001f4ed30d286mr3435420pjb.66.1659266608903; 
 Sun, 31 Jul 2022 04:23:28 -0700 (PDT)
Received: from [192.168.0.110] ([103.159.189.157])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a17090ade1700b001f02a72f29csm2842342pjv.8.2022.07.31.04.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jul 2022 04:23:28 -0700 (PDT)
Message-ID: <83c5dfea-23ce-99c8-bce4-637e9594eab9@gmail.com>
Date: Sun, 31 Jul 2022 17:23:21 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [syzbot] KASAN: vmalloc-out-of-bounds Write in imageblit (2)
Content-Language: en-US
To: Helge Deller <deller@gmx.de>
References: <000000000000bbdd0405d120c155@google.com>
 <20220729065139.6529-1-khalid.masum.92@gmail.com>
 <eb4a26aa-da30-ceee-7d27-c1e902dd4218@gmx.de>
 <7c318150-a10e-e7d9-162f-cd5aaa49e616@gmail.com> <YuZfeJm59UNrw6qE@p100>
From: Khalid Masum <khalid.masum.92@gmail.com>
In-Reply-To: <YuZfeJm59UNrw6qE@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 syzbot <syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/31/22 16:54, Helge Deller wrote:
> * Khalid Masum <khalid.masum.92@gmail.com>:
>> On 7/30/22 23:25, Helge Deller wrote:
>>> On 7/29/22 08:51, Khalid Masum wrote:
>>>> Here is a simplified reproducer for the issue:
>>>>
>>>> https://gist.githubusercontent.com/Labnann/923d6b9b3a19848fc129637b839b8a55/raw/a68271fcc724569735fe27f80817e561b3ff629a/reproducer.c
>>>
>>> The reproducer does this:
>>
>> Thanks for Looking into this. Being to this, so I have some questions.
>>> ioctl(3, TIOCLINUX, TIOCL_SETSEL, selection: xs:3  ys:0  xe:0 ye:0 mode:0)  = 0
>>
>> How did you find out the selection values? From strace and man pages I know
>> the third argument is an address.
> 
> Right. It's a pointer into userspace.
> I simply added printk debug code to see what's happening.
> I've attached that patch below.
> 
> 
>>> -> sets the text selection area
>>> ioctl(4, KDFONTOP)  with op=0 (con_font_set), charcount=512  width=8  height=32, 0x20000000) = 0
>>
>> Same here, It would be very helpful if you could tell me how.
> 
> See patch below.
> 
>>> -> changes the font size.
>>>
>>> It does not crash with current Linus' head (v5.19-rc8).
>>
>> I tested in 5.19-rc8 in Qemu x86_64 and it crashed for me.
> 
> That's strange, since I tested the same. Maybe I did something wrong.
> Anyway, the patches I sent applies to all kernel versions.
> 
>>> Kernel v5.16, which was used by this KASAN report, hasn't received backports
>>> since months, so I tried stable kernel v5.15.58 instead, and this
>>> kernel crashed with the reproducer.
>>>
>>> The reproducer brings up two issues with current code:
>>> 1. The reproducer uses ioctl(TIOCLINUX, TIOCL_SETSEL) and hands over (invalid)
>>> zero-values for ys and ye for the starting lines.
>>> This is wrong, since the API seems to expect a "1" as the very first line for the selection.
>>> This can be easily fixed by adding checks for zero-values and return -EINVAL if found.
>>>
>>> But this bug isn't critical itself and is not the reason for the kernel crash.
>>> Without the checks, the ioctl handler simply wraps the coordinate values and converts them
>>> from:
>>> input selection: xs:3  ys:0  xe:0   ye:0  mode:0    to the new:
>>> vc_selection =   xs:2  ys:23 xe:127 ye:23 mode:0
>>> which is the current maximum coordinates for the screen.
>>>
>>> Those higher values now trigger issue #2:
>>> After the TIOCL_SETSEL the last line on the screen is now selected. The KDFONTOP ioctl
>>> then sets a 8x32 console font, and replaces the former 8x16 console font.
>>> With the bigger font the current screen selection is now outside the visible screen
>>> and this finally triggeres this backtrace, because vc_do_resize() calls clear_selection()
>>> to unhighlight the selection (which starts to render chars outside of the screen):
>>
>> That makes sense.
>>
>>>    drm_fb_helper_sys_imageblit drivers/gpu/drm/drm_fb_helper.c:794 [inline]
>>>    drm_fbdev_fb_imageblit+0x15c/0x350 drivers/gpu/drm/drm_fb_helper.c:2288
>>>    bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:124 [inline]
>>>    bit_putcs+0x6e1/0xd20 drivers/video/fbdev/core/bitblit.c:173
>>>    fbcon_putcs+0x353/0x440 drivers/video/fbdev/core/fbcon.c:1277
>>>    do_update_region+0x399/0x630 drivers/tty/vt/vt.c:676
>>>    invert_screen+0x1d4/0x600 drivers/tty/vt/vt.c:800
>>>    highlight drivers/tty/vt/selection.c:57 [inline]
>>>    clear_selection drivers/tty/vt/selection.c:84 [inline]
>>>    clear_selection+0x55/0x70 drivers/tty/vt/selection.c:80
>>>    vc_do_resize+0xe6e/0x1180 drivers/tty/vt/vt.c:1257
>>>
>>> IMHO the easiest way to prevent this crash is to simply clear the
>>> selection before the various con_font_set() console handlers are called.
>>> Otherwise every console driver needs to add checks and verify if the current
>>> selection still fits with the selected font, which gets tricky because some
>>> of those drivers fiddle with the screen width&height before calling vc_do_resize().
>>>
>>> I'll follow up to this mail with patches for both issues shortly.
>>
>> I tested the patches. The crash no longer occurs with the reproducer.
> 
> Thanks for testing!
> Maybe you want to reply to the patches with a Tested-by: tag?

Sure, I will do that.

> 
> Below is my debug code.

Thanks for the debug code! It explains a lot.

> Helge
> 
> 
> diff --git a/drivers/tty/vt/selection.c b/drivers/tty/vt/selection.c
> index 58692a9b4097..0167b368a70f 100644
> --- a/drivers/tty/vt/selection.c
> +++ b/drivers/tty/vt/selection.c
> @@ -333,6 +333,7 @@ static int vc_selection(struct vc_data *vc, struct tiocl_selection *v,
>   	v->ys = min_t(u16, v->ys - 1, vc->vc_rows - 1);
>   	v->xe = min_t(u16, v->xe - 1, vc->vc_cols - 1);
>   	v->ye = min_t(u16, v->ye - 1, vc->vc_rows - 1);
> +	printk("vc_selection =   xs:%u  ys:%u  xe:%u ye:%u mode:%u\n", v->xs, v->ys, v->xe, v->ye, v->sel_mode);
> 
>   	if (mouse_reporting() && (v->sel_mode & TIOCL_SELMOUSEREPORT)) {
>   		mouse_report(tty, v->sel_mode & TIOCL_SELBUTTONMASK, v->xs,
> @@ -357,6 +358,7 @@ int set_selection_kernel(struct tiocl_selection *v, struct tty_struct *tty)
>   {
>   	int ret;
> 
> +	printk("tiocl_selection =   xs:%u  ys:%u  xe:%u ye:%u mode:%u\n", v->xs, v->ys, v->xe, v->ye, v->sel_mode);
>   	mutex_lock(&vc_sel.lock);
>   	console_lock();
>   	ret = vc_selection(vc_cons[fg_console].d, v, tty);
> diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> index 3f09205185a4..a0b4570c959a 100644
> --- a/drivers/tty/vt/vt.c
> +++ b/drivers/tty/vt/vt.c
> @@ -3194,6 +3194,8 @@ int tioclinux(struct tty_struct *tty, unsigned long arg)
>   		return -EFAULT;
>   	ret = 0;
> 
> +	printk("tioclinux: type = %d\n", type);  // TIOCL_SETSEL
> +
>   	switch (type)
>   	{
>   		case TIOCL_SETSEL:
> @@ -4655,6 +4657,8 @@ static int con_font_set(struct vc_data *vc, struct console_font_op *op)
>   	if (IS_ERR(font.data))
>   		return PTR_ERR(font.data);
> 
> +	pr_err("con_font_set   charcount %d   w:%d  h:%d\n", op->charcount, op->width, op->height);
> +
>   	font.charcount = op->charcount;
>   	font.width = op->width;
>   	font.height = op->height;
> @@ -4709,6 +4713,7 @@ static int con_font_default(struct vc_data *vc, struct console_font_op *op)
> 
>   int con_font_op(struct vc_data *vc, struct console_font_op *op)
>   {
> +	pr_warn("con_font_op  op = %d\n", op->op);
>   	switch (op->op) {
>   	case KD_FONT_OP_SET:
>   		return con_font_set(vc, op);

Thanks,
   -- Khalid Masum
