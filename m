Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52685585E69
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jul 2022 12:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA7E10E073;
	Sun, 31 Jul 2022 10:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFFD10E1D9
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jul 2022 10:03:57 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id q22so4362795pfn.9
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jul 2022 03:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=VOvCfhvyQfAN/M5z1j6V9L/i0fsg5ZjQt6rgWpAfh5k=;
 b=EeVDENci31sMtuC0NnEiPJjLsQ5ZGHUEYluqtXNzoAatJ88kPkF5ydrDQGEKAd3vU0
 kVY9Z+vDz0OQSy0dQAqWsHwv9ccrUD8ttCBC3MP7jr2UdJhXP0t/TVIgYfVECVE2Q0VZ
 RvCVyY9tWkgh7QDoFonbjVrMIj+SG3KtHPiHvK/7Lp1pL1WM+jfYsifjPEhM/SqKiEQK
 bKvoI2tiZhM2e0kMsGCdZfdJMQvhsf2Xcd90E+Uv3B3XFWbwckYymP2Gv715Yrj3VPhT
 pUcGN9j7JpAq3Q9f27U9abayLC698mAnIAo9xuC/mI+lmV2wmml4mxozxYe/b8ZULV6I
 DUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=VOvCfhvyQfAN/M5z1j6V9L/i0fsg5ZjQt6rgWpAfh5k=;
 b=HH4osrw+eZ6SuBd1eFY6ahuVzh/PQMu+uzYnbpop2uCbVjNxOc0nZOhbaMv8y4cWlV
 0fiO0k97YTUBt2ln7qiF19I0qTJ+/DfJtntXVnGUcKuKmQ2drLlVY54NWa3cnEsS1/CK
 badsXs5bLnBsrUfaW1+oUq7x9VKskb7Zihhleiojxec9GewHG61JoJgFyAryMsY6O+pm
 Ko6i0waZwdC0FSp0CmdWD0sWU9GHxq08OzfyG8Xa+vTnb6evpvBjB+DlUwNiV7tgWSqJ
 h0hVP+aUGHyRppXNGvrTSpW0kpnJYLSwOUeMh9tsLTIaS6eGVPQDn6guVz4eezrWvv/U
 SK2A==
X-Gm-Message-State: ACgBeo28BkB7jo0GnQNdUkjY6AjEAflij6Xtrg3t6AKj/f3nC+t/16tU
 3FfexRUCblkznqOrogsQytU=
X-Google-Smtp-Source: AA6agR61scUWb13WeKYOnTIgOUIKCYtymjkJ/NjkokkRrurN73Ofkl1GtFp4X6WxuzFmKV/WANSSzw==
X-Received: by 2002:a05:6a00:2386:b0:52d:7472:208 with SMTP id
 f6-20020a056a00238600b0052d74720208mr44406pfc.8.1659261836585; 
 Sun, 31 Jul 2022 03:03:56 -0700 (PDT)
Received: from [192.168.0.110] ([103.159.189.149])
 by smtp.gmail.com with ESMTPSA id
 n184-20020a6227c1000000b0052aaf7fe731sm6223354pfn.45.2022.07.31.03.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jul 2022 03:03:56 -0700 (PDT)
Message-ID: <7c318150-a10e-e7d9-162f-cd5aaa49e616@gmail.com>
Date: Sun, 31 Jul 2022 16:03:43 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [syzbot] KASAN: vmalloc-out-of-bounds Write in imageblit (2)
Content-Language: en-US
To: Helge Deller <deller@gmx.de>,
 syzbot <syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
References: <000000000000bbdd0405d120c155@google.com>
 <20220729065139.6529-1-khalid.masum.92@gmail.com>
 <eb4a26aa-da30-ceee-7d27-c1e902dd4218@gmx.de>
From: Khalid Masum <khalid.masum.92@gmail.com>
In-Reply-To: <eb4a26aa-da30-ceee-7d27-c1e902dd4218@gmx.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/30/22 23:25, Helge Deller wrote:
> On 7/29/22 08:51, Khalid Masum wrote:
>> Here is a simplified reproducer for the issue:
>>
>> https://gist.githubusercontent.com/Labnann/923d6b9b3a19848fc129637b839b8a55/raw/a68271fcc724569735fe27f80817e561b3ff629a/reproducer.c
> 
> The reproducer does this:

Thanks for Looking into this. Being to this, so I have some questions.
> ioctl(3, TIOCLINUX, TIOCL_SETSEL, selection: xs:3  ys:0  xe:0 ye:0 mode:0)  = 0

How did you find out the selection values? From strace and man pages I 
know the third argument is an address.

> -> sets the text selection area
> ioctl(4, KDFONTOP)  with op=0 (con_font_set), charcount=512  width=8  height=32, 0x20000000) = 0

Same here, It would be very helpful if you could tell me how.

> -> changes the font size.
> 
> It does not crash with current Linus' head (v5.19-rc8).

I tested in 5.19-rc8 in Qemu x86_64 and it crashed for me.
> Kernel v5.16, which was used by this KASAN report, hasn't received backports
> since months, so I tried stable kernel v5.15.58 instead, and this
> kernel crashed with the reproducer.
> 
> The reproducer brings up two issues with current code:
> 1. The reproducer uses ioctl(TIOCLINUX, TIOCL_SETSEL) and hands over (invalid)
> zero-values for ys and ye for the starting lines.
> This is wrong, since the API seems to expect a "1" as the very first line for the selection.
> This can be easily fixed by adding checks for zero-values and return -EINVAL if found.
> 
> But this bug isn't critical itself and is not the reason for the kernel crash.
> Without the checks, the ioctl handler simply wraps the coordinate values and converts them
> from:
> input selection: xs:3  ys:0  xe:0   ye:0  mode:0    to the new:
> vc_selection =   xs:2  ys:23 xe:127 ye:23 mode:0
> which is the current maximum coordinates for the screen.
> 
> Those higher values now trigger issue #2:
> After the TIOCL_SETSEL the last line on the screen is now selected. The KDFONTOP ioctl
> then sets a 8x32 console font, and replaces the former 8x16 console font.
> With the bigger font the current screen selection is now outside the visible screen
> and this finally triggeres this backtrace, because vc_do_resize() calls clear_selection()
> to unhighlight the selection (which starts to render chars outside of the screen):

That makes sense.

>   drm_fb_helper_sys_imageblit drivers/gpu/drm/drm_fb_helper.c:794 [inline]
>   drm_fbdev_fb_imageblit+0x15c/0x350 drivers/gpu/drm/drm_fb_helper.c:2288
>   bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:124 [inline]
>   bit_putcs+0x6e1/0xd20 drivers/video/fbdev/core/bitblit.c:173
>   fbcon_putcs+0x353/0x440 drivers/video/fbdev/core/fbcon.c:1277
>   do_update_region+0x399/0x630 drivers/tty/vt/vt.c:676
>   invert_screen+0x1d4/0x600 drivers/tty/vt/vt.c:800
>   highlight drivers/tty/vt/selection.c:57 [inline]
>   clear_selection drivers/tty/vt/selection.c:84 [inline]
>   clear_selection+0x55/0x70 drivers/tty/vt/selection.c:80
>   vc_do_resize+0xe6e/0x1180 drivers/tty/vt/vt.c:1257
> 
> IMHO the easiest way to prevent this crash is to simply clear the
> selection before the various con_font_set() console handlers are called.
> Otherwise every console driver needs to add checks and verify if the current
> selection still fits with the selected font, which gets tricky because some
> of those drivers fiddle with the screen width&height before calling vc_do_resize().
> 
> I'll follow up to this mail with patches for both issues shortly.

I tested the patches. The crash no longer occurs with the reproducer.

> Helge

Thanks,
  -- Khalid Masum

