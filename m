Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB5E346207
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 15:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E576E90A;
	Tue, 23 Mar 2021 14:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5816E909;
 Tue, 23 Mar 2021 14:56:33 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 c12-20020a4ae24c0000b02901bad05f40e4so4998133oot.4; 
 Tue, 23 Mar 2021 07:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=crpOCZ60DCBuwt1S72UL7ppFvHjUGvqZ5yR3kG9lxbs=;
 b=cJmfOsPzE0P+Wx3J0VF/8JzInsyP2vvvZHUaXxyOFUTwyQhErBHfFdqxeVhtfRxLtp
 KMFCT3xSwNLSEYPBwkqsQMNVTRMsmhPsEYNwVVjSMGquedqLS0XoORy+Hy+LgNA7rrl5
 YB/ESJgMuvnXmnHBZRHeKvWWNQezitrBqm3jv3pm9xvOVDi/7RXun3+C8VZzf3Vh6vXG
 G9KCi34XuLlYmtY4Xp175rYgMgvRfWVJqfKsENAwjqlWjQcw/dmDZblJTTS4JPp0DbRT
 8MZHJVwjOvJqqzoCfiaLQOwZKF0pD8zpZ6rMwTKUIGskmx48uaTGQ335Uw2JQCMI0Dub
 YC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=crpOCZ60DCBuwt1S72UL7ppFvHjUGvqZ5yR3kG9lxbs=;
 b=ABKfF38tF8gU78uyvmtUMmetrO2W5EGrnnKNR3hTqOA4VOkxk67jxqrmBdAm24+zO1
 UBsGf9UixFk8LQmaJxN+N+zrl3PCW09cVgJsxGRzuGlQgAHb/FBLCPLFpCqvyxEh7b5R
 JP92YE227QFrhQFarInRfNcA9hGCcpUTwc8zoKl4uZI1TghZaqEnh/1GLRpZW71n56Kp
 KKt7N8AwTwCO0lkRsSkq/PGI7EhzwoioxspfpaTB4/8Fk/9Lj5YMUxQqqUeTMi+9zXiK
 dVSxdkj6guII+Z2FmDFrVJXJsgYaJ1Km9jGFQY9IXEycVYiw8pv1S87wMtOEx4fIOJ9J
 VI9Q==
X-Gm-Message-State: AOAM533pM2OB4X6Kr7RjcksQuU0td6Dpn4JtjCm/gEB/B9s9kgF6LScD
 JZHXjQTBWW7X02xPKJeosR2rsYmmaJNwSzTnlOU=
X-Google-Smtp-Source: ABdhPJwsS0Ns78tBQ4XT+o+/pWDRy5/lp8mEUAqGjAojHIJrRlkFOZFCff7Z1ABu8VsKGnlP3jut/sphye0ris9Ei80=
X-Received: by 2002:a4a:7615:: with SMTP id t21mr4120473ooc.72.1616511392713; 
 Tue, 23 Mar 2021 07:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <1616315298-109091-1-git-send-email-jinsdb@126.com>
In-Reply-To: <1616315298-109091-1-git-send-email-jinsdb@126.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Mar 2021 10:56:21 -0400
Message-ID: <CADnq5_OLBjUbwxUptPk17XMHarThXj7GDYkgYZOPcd_GOJH1XQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Fix cat debugfs hang_hws file causes system
 crash bug
To: Qu Huang <jinsdb@126.com>
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
Cc: Dave Airlie <airlied@linux.ie>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sun, Mar 21, 2021 at 5:33 AM Qu Huang <jinsdb@126.com> wrote:
>
> Here is the system crash log:
> [ 1272.884438] BUG: unable to handle kernel NULL pointer dereference at
> (null)
> [ 1272.884444] IP: [<          (null)>]           (null)
> [ 1272.884447] PGD 825b09067 PUD 8267c8067 PMD 0
> [ 1272.884452] Oops: 0010 [#1] SMP
> [ 1272.884509] CPU: 13 PID: 3485 Comm: cat Kdump: loaded Tainted: G
> [ 1272.884515] task: ffff9a38dbd4d140 ti: ffff9a37cd3b8000 task.ti:
> ffff9a37cd3b8000
> [ 1272.884517] RIP: 0010:[<0000000000000000>]  [<          (null)>]
> (null)
> [ 1272.884520] RSP: 0018:ffff9a37cd3bbe68  EFLAGS: 00010203
> [ 1272.884522] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
> 0000000000014d5f
> [ 1272.884524] RDX: fffffffffffffff4 RSI: 0000000000000001 RDI:
> ffff9a38aca4d200
> [ 1272.884526] RBP: ffff9a37cd3bbed0 R08: ffff9a38dcd5f1a0 R09:
> ffff9a31ffc07300
> [ 1272.884527] R10: ffff9a31ffc07300 R11: ffffffffaddd5e9d R12:
> ffff9a38b4e0fb00
> [ 1272.884529] R13: 0000000000000001 R14: ffff9a37cd3bbf18 R15:
> ffff9a38aca4d200
> [ 1272.884532] FS:  00007feccaa67740(0000) GS:ffff9a38dcd40000(0000)
> knlGS:0000000000000000
> [ 1272.884534] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1272.884536] CR2: 0000000000000000 CR3: 00000008267c0000 CR4:
> 00000000003407e0
> [ 1272.884537] Call Trace:
> [ 1272.884544]  [<ffffffffade68940>] ? seq_read+0x130/0x440
> [ 1272.884548]  [<ffffffffade40f8f>] vfs_read+0x9f/0x170
> [ 1272.884552]  [<ffffffffade41e4f>] SyS_read+0x7f/0xf0
> [ 1272.884557]  [<ffffffffae374ddb>] system_call_fastpath+0x22/0x27
> [ 1272.884558] Code:  Bad RIP value.
> [ 1272.884562] RIP  [<          (null)>]           (null)
> [ 1272.884564]  RSP <ffff9a37cd3bbe68>
> [ 1272.884566] CR2: 0000000000000000
>
> Signed-off-by: Qu Huang <jinsdb@126.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c b/drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c
> index 511712c..673d5e3 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c
> @@ -33,6 +33,11 @@ static int kfd_debugfs_open(struct inode *inode, struct file *file)
>
>         return single_open(file, show, NULL);
>  }
> +static int kfd_debugfs_hang_hws_read(struct seq_file *m, void *data)
> +{
> +       seq_printf(m, "echo gpu_id > hang_hws\n");
> +       return 0;
> +}
>
>  static ssize_t kfd_debugfs_hang_hws_write(struct file *file,
>         const char __user *user_buf, size_t size, loff_t *ppos)
> @@ -94,7 +99,7 @@ void kfd_debugfs_init(void)
>         debugfs_create_file("rls", S_IFREG | 0444, debugfs_root,
>                             kfd_debugfs_rls_by_device, &kfd_debugfs_fops);
>         debugfs_create_file("hang_hws", S_IFREG | 0200, debugfs_root,
> -                           NULL, &kfd_debugfs_hang_hws_fops);
> +                           kfd_debugfs_hang_hws_read, &kfd_debugfs_hang_hws_fops);
>  }
>
>  void kfd_debugfs_fini(void)
> --
> 1.8.3.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
