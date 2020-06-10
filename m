Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2AF1F5110
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 11:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4156E4AD;
	Wed, 10 Jun 2020 09:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB91E6E4AD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 09:27:13 +0000 (UTC)
Received: from mail-qv1-f45.google.com ([209.85.219.45]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MoNy4-1j7PKZ24a0-00olOK for <dri-devel@lists.freedesktop.org>; Wed, 10
 Jun 2020 11:27:11 +0200
Received: by mail-qv1-f45.google.com with SMTP id g7so695109qvx.11
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 02:27:11 -0700 (PDT)
X-Gm-Message-State: AOAM532kB7cBftR514asUPe+qZU/jv+kdV06598oXWSUCeGQzCSv+fnf
 W586r7Mav/llKoKQRTe+KdHOSWFUMvSO7eEGNxs=
X-Google-Smtp-Source: ABdhPJxyWtH9LofwEdTYxXzu1ldBiowqiR86mkHaGO4qq++n7gDHop60yxQeWpkgQAbZwvP05ibJC+11h2MwvKlB+/o=
X-Received: by 2002:a05:6214:846:: with SMTP id
 dg6mr2067587qvb.210.1591781230032; 
 Wed, 10 Jun 2020 02:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200610083333.455-1-sumit.semwal@linaro.org>
In-Reply-To: <20200610083333.455-1-sumit.semwal@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Jun 2020 11:26:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0PzmtWc1p-KgHzHhY+=gca0J8YsGD=ALGESWsgijQQ7w@mail.gmail.com>
Message-ID: <CAK8P3a0PzmtWc1p-KgHzHhY+=gca0J8YsGD=ALGESWsgijQQ7w@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Move dma_buf_release() from fops to dentry_ops
To: Sumit Semwal <sumit.semwal@linaro.org>
X-Provags-ID: V03:K1:PixFVjq4EjLNlD7nfWA/4DxVwArM9fQ3LPWCzjUMxgYGlNrN2GL
 I2h1Z4xxzlXCSQOZ86pgo6qHysuBk4uf0Ln+vMU3ova+QoQezadi9OnRmrawZ3MG1o3Nk50
 0MFej5hVQKhkYfSIcnE+jR8o5FgQQZuGesdDMQW6grB1Orl8yrIdT5Et0gERmiqCbjgfm1+
 QOHnS07Fk402AkzQH+2xw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zmezp+ydP8A=:7helHjuaslzngHQhk2pslM
 feuxXi7LL+MzPDapTCSNzL1phAs1KHXaDt2DRLmAUc6xalukbImDhr5uDJxXRIU+r70vpWpBC
 Uomz2uSP8piPW5O34NrC2afJCOsNLK7HCbiK/PvNGGVMkXyjaXVgUO2/R/VoDSwg0q5E5jjXx
 unY4T583SljCAHXZ01v3VTvWJm4cqE3dwDa6bNEP32xhgP3z6Kq/nsQGUoaIe+In34p5QUIuW
 eRer1Qpdl0lmXGeOgMwaJj5zh0pDxtFyHIQn/rZzvIO134ytXZ8Neu2xCdAU5M8UNQoGLGZ9L
 sA03u7seQGupXUpOtTp0dnzx9juqinEJZi2Te7vaaAgY1+X52PmyY6jkN4jQC5p7Sot9uqHCE
 PYggrp8P/U4vXmg5gLsTras9dR3FiwaTzuiDvErWJh1z7aLifgECI3nFKAOsTlGfzcFJLIPrk
 zH0zSiEN3hox5P5YfIZlqkM/MBeudTSEuIZfbo2biuzpGbd5sgHU2ZQNXwqRqamrHqiBAvJTj
 eoSqpLVF35LJD3U/dg7mxcNFsphcTQ+y65QZpOFiF0/7GyEQrUMbx0N9czxGiI/3X6G/7S0I1
 O/8lEGtG+lbz6IpJokrahWepcazskzrQSw3dwU/Baef+I6Bu2Q+QCKhE06JD8iUSYH1UwjdFN
 SDh92MzpLmnHmkDa+CzffiGjyrppeNoMpwvyo2oIdxKeFztEpumMJ/9fWtDXfQv7BRDTRRnaq
 XxmCpbV71Ay/sVmod8QZmi6eOWONX67Zyp+3muXglLzqgwDjGqzezkLmtj75QpWeai47Zuqf1
 P2g1BZPxCd6fuGH+Sm7HkVsj6nFjKHoNntHfK9HCzFM8DO4D38=
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
Cc: Chenbo Feng <fengc@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 syzbot+3643a18836bce555bff6@syzkaller.appspotmail.com,
 Charan Teja Reddy <charante@codeaurora.org>,
 "# 3.4.x" <stable@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 10, 2020 at 10:33 AM Sumit Semwal <sumit.semwal@linaro.org> wrote:
>
> Charan Teja reported a 'use-after-free' in dmabuffs_dname [1], which
> happens if the dma_buf_release() is called while the userspace is
> accessing the dma_buf pseudo fs's dmabuffs_dname() in another process,
> and dma_buf_release() releases the dmabuf object when the last reference
> to the struct file goes away.
>
> I discussed with Arnd Bergmann, and he suggested that rather than tying
> the dma_buf_release() to the file_operations' release(), we can tie it to
> the dentry_operations' d_release(), which will be called when the last ref
> to the dentry is removed.
>
> The path exercised by __fput() calls f_op->release() first, and then calls
> dput, which eventually calls d_op->d_release().
>
> In the 'normal' case, when no userspace access is happening via dma_buf
> pseudo fs, there should be exactly one fd, file, dentry and inode, so
> closing the fd will kill of everything right away.
>
> In the presented case, the dentry's d_release() will be called only when
> the dentry's last ref is released.
>
> Therefore, lets move dma_buf_release() from fops->release() to
> d_ops->d_release().
>
> Many thanks to Arnd for his FS insights :)
>
> [1]: https://lore.kernel.org/patchwork/patch/1238278/
>
> Fixes: bb2bb9030425 ("dma-buf: add DMA_BUF_SET_NAME ioctls")
> Reported-by: syzbot+3643a18836bce555bff6@syzkaller.appspotmail.com
> Cc: <stable@vger.kernel.org> [5.3+]
> Cc: Arnd Bergmann <arnd@arndb.de>
> Reported-by: Charan Teja Reddy <charante@codeaurora.org>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>

The patch looks correct to me.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Obviously this should still be verified against the original report if possible.

>  drivers/dma-buf/dma-buf.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 01ce125f8e8d..92ba4b6ef3e7 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -54,8 +54,11 @@ static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
>                              dentry->d_name.name, ret > 0 ? name : "");
>  }
>
> +static void dma_buf_release(struct dentry *dentry);
> +
>  static const struct dentry_operations dma_buf_dentry_ops = {
>         .d_dname = dmabuffs_dname,
> +       .d_release = dma_buf_release,
>  };

I'd suggest rearranging the file to avoid the forward declaration, even
if it makes it a little harder to review the change, the resulting code
will remain organized more logically.

>  static struct vfsmount *dma_buf_mnt;
> @@ -77,14 +80,14 @@ static struct file_system_type dma_buf_fs_type = {
>         .kill_sb = kill_anon_super,
>  };
>
> -static int dma_buf_release(struct inode *inode, struct file *file)
> +static void dma_buf_release(struct dentry *dentry)
>  {
>         struct dma_buf *dmabuf;
>
> -       if (!is_dma_buf_file(file))
> -               return -EINVAL;
> +       if (dentry->d_op != &dma_buf_dentry_ops)
> +               return;

I think the check here is redundant and it's clearer without it.

          Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
