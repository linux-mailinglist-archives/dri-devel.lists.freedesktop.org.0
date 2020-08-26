Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C4B253627
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 19:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45B789F5F;
	Wed, 26 Aug 2020 17:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC9389F0A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 17:47:48 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id d11so4002316ejt.13
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 10:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DZhvz/VcmtyOV5FpCQGhe3jSJp/wS6UPaYcPASL+W/w=;
 b=HEdiitSKEBxMSHU8oTLa3sOT98ZqvBgSHQoEa8wKCD7Bep9IfA3SmowbtjCNMgkw9i
 jku1yi1AxvYbxckP53qA3tB5mi0Xeepx/+gdavzei1K18KH4XJJ7ql/2GL6DWC7FoP0J
 DFVlciGxbX1urrNma8ZDr07/YRWt/Uy8XWkxyo6yHLhilLIZNM9TZ2slZHDFGktyk3/Q
 9E9A0VZvOP44jHPNyTpdKN92CKWEsGHxifxkxymJ/Nlu23ojN81Emuo0TqlFKCCQ0/bZ
 QVpX4GgvoQA463xPcCxrkOn6bIi3vIyOL5CtkIXlfdLEfYTsyzwlhbzOju+HDjTrlITC
 zxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DZhvz/VcmtyOV5FpCQGhe3jSJp/wS6UPaYcPASL+W/w=;
 b=jpefnc99tH/DBcdIXwLBhbrxwkIxSR0Qrd7m1z4VKW/2sonp9htvxwxgeXNB63SO+4
 7649oO9GoKFfud9JPuCmhu0vd2vRlNeJ7s+Jo/QZBof65suEWXO+hKeB9dIiKibrF0v8
 a+A3ZCiaQ3gVWNgXVS6acOmiDYIKI/s1XhaCe6T+7Ka/XZlcLZ311fTQ+3dv1x3AdveO
 byRU7ws4Gw/INni/jgXkkO5iBislPomZu/9iRCUdcRcW1Ar5CqHgTdTVBlnwCU+6vjww
 Cbs5VynBBv1ZRYnxadZ8cMSI7DJ+D6kQU5hN7ZcAovSjP/pjIFlBoIjDLVjnc2TBbfBN
 kVRA==
X-Gm-Message-State: AOAM5311Q3lxOMS6upLpnFfImYZ56q11TbVgtiiEJV9Nb6ENkk5JXnog
 0g3kK1D6QaHZFfAP2w9skGfaIpRW8JVHsoBHaZG46w==
X-Google-Smtp-Source: ABdhPJzus1ddDpcAB3sDL3goLET4zr36SFUC2Lm7kSX43cr3KBZpmMROLLbNpz+1kIMWiaUywpNuyma7UHpBq/QSea8=
X-Received: by 2002:a17:906:c10c:: with SMTP id
 do12mr13194774ejc.92.1598464066662; 
 Wed, 26 Aug 2020 10:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <1583589765-19344-1-git-send-email-hexiaolong2008@gmail.com>
In-Reply-To: <1583589765-19344-1-git-send-email-hexiaolong2008@gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 26 Aug 2020 14:47:35 -0300
Message-ID: <CAAEAJfA0w+xs95vnOiFnnMPpzh-0qJDey95bXdbv27O98cpWHA@mail.gmail.com>
Subject: Re: [v2] dma-buf: heaps: bugfix for selftest failure
To: Leon He <hexiaolong2008@gmail.com>
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
Cc: Leon He <leon.he@unisoc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Leon, Shuah,

Thanks for the fix. I had this issue pending to fix,
but have been lazy about it, I appreciate you are taking care of it!

On Sat, 7 Mar 2020 at 11:03, Leon He <hexiaolong2008@gmail.com> wrote:
>
> From: Leon He <leon.he@unisoc.com>
>
> There are two errors in the dmabuf-heap selftest:
> 1. The 'char name[5]' was not initialized to zero, which will cause
>    strcmp(name, "vgem") failed in check_vgem().
> 2. The return value of test_alloc_errors() should be reversed, other-
>    wise the while loop in main() will be broken.
>
> Signed-off-by: Leon He <leon.he@unisoc.com>
> ---
>  tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> index cd5e1f6..836b185 100644
> --- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> +++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> @@ -22,7 +22,7 @@
>  static int check_vgem(int fd)
>  {
>         drm_version_t version = { 0 };
> -       char name[5];
> +       char name[5] = { 0 };
>         int ret;
>

As Shuah already mentioned, I think we want to use strncmp
to be on the safe side.

>         version.name_len = 4;
> @@ -357,7 +357,7 @@ static int test_alloc_errors(char *heap_name)
>         if (heap_fd >= 0)
>                 close(heap_fd);
>
> -       return ret;
> +       return !ret;

I agree with Shuah, this change makes no sense, just drop it.

I think the fact this test was broken and nobody noticed
uncovers the fact that the test isn't being run.

Any reason why this test isn't a regular TARGET?
Or any idea how we can make sure this is run by CIs
and any other testing system?

Thanks!
Ezequiel

>  }
>
>  int main(void)
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
