Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 371CB13C894
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 16:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B576EAF8;
	Wed, 15 Jan 2020 15:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35C86EAF8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 15:59:13 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200115155912euoutp025db753d32b73aa9df55d5f1d556aabcd~qGq2ZwnSZ2715827158euoutp02Y
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 15:59:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200115155912euoutp025db753d32b73aa9df55d5f1d556aabcd~qGq2ZwnSZ2715827158euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579103952;
 bh=tlZOFhcA5K3eXyOfi9aCIy9MzGM2jqBd5MqiVtEQrME=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=k+NUh030OVzWI47umVVP4tdMG6P2Sk+kY514cJRFVM8iMfJxVqsQahxV2KxY9VXmv
 u1sdYBDXvI5Yw7LGOyKuqs4nnzY7/GKot1WrQvCh3aUHMIxX8jb3TOjIyJAsTmHnY/
 KcEIA/xPs7J19Io0hivMNvGVe5brsHbSyt5F110g=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200115155912eucas1p1fb336d2576c52ff09108b40ee20efd21~qGq2Quqpm0918709187eucas1p1P;
 Wed, 15 Jan 2020 15:59:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id DD.27.61286.FC63F1E5; Wed, 15
 Jan 2020 15:59:12 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200115155911eucas1p220088bc450d966bb2f25eb0f6ebb4e16~qGq1xo2nz1037010370eucas1p2W;
 Wed, 15 Jan 2020 15:59:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200115155911eusmtrp1863eec411d2583ec2e23e9d1f1186848~qGq1xFoID0436504365eusmtrp1N;
 Wed, 15 Jan 2020 15:59:11 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-aa-5e1f36cf65ad
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 3F.82.08375.FC63F1E5; Wed, 15
 Jan 2020 15:59:11 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200115155910eusmtip2c6122f0c7e9d1c4294b3e509bdc2d3cf~qGq09fjz30449104491eusmtip2U;
 Wed, 15 Jan 2020 15:59:10 +0000 (GMT)
Subject: Re: [PATCH] fbcon: Adjust indentation in set_con2fb_map
To: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor
 <natechancellor@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <02a247ea-6837-847b-c3cb-af881bc26850@samsung.com>
Date: Wed, 15 Jan 2020 16:59:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOd=DcXiA5d07bS_3qhr4F-mbsGzZic=OgomuhZchGaXeoQ@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsWy7djPc7oXzOTjDOZkWDx4M5vN4srX92wW
 J/o+sFpc3jWHzeLD2xKLDxP+MzmweeycdZfdY8GmUo89E0+yedzvPs7k8XmTXABrFJdNSmpO
 Zllqkb5dAlfG9UnaBS8VKr6c/cTWwHhVvIuRk0NCwETi05NOpi5GLg4hgRWMEouvT2aDcL4w
 Sjz7cYkZpEpI4DOjxIV1ml2MHGAdMx4oQ9QsZ5RontcGVfOWUaJxfj2ILSzgIHHywWs2EFtE
 IE7i7qEbjCANzAJrGSW2Ld7HApJgE7CSmNi+CijBzsErYCfxNxpkPIuAqsSu6YYgBaICERKf
 HhxmBbF5BQQlTs58AtbIKRAo8Xv6FHYQm1lAXOLWk/lMELa8xPa3c5hBNkkIrGOXOLlsJwvE
 ky4Stxc9YIawhSVeHd/CDmHLSJye3MMC1cAo8bfjBVT3dkaJ5ZP/sUFUWUvcOfeLDeQ6ZgFN
 ifW79CHCjhLzHq1hg4QJn8SNt4IQR/BJTNo2nRkizCvR0SYEUa0msWHZBjaYtV07VzJPYFSa
 heS1WUjemYXknVkIexcwsqxiFE8tLc5NTy02zEst1ytOzC0uzUvXS87P3cQITDWn/x3/tIPx
 66WkQ4wCHIxKPLwZf+TihFgTy4orcw8xSnAwK4nwnpwhGyfEm5JYWZValB9fVJqTWnyIUZqD
 RUmc13jRy1ghgfTEktTs1NSC1CKYLBMHp1QDY4Uv29l7kbYLqorWWzMcnfldbPHhRxlntnsd
 ndkst7zd2vKEnd/WnBtGoXsWuG5PLyifsTt738PaGDWOnL3XPmwu5Harf2TuOffc8cbvJX/O
 P3q2KfVe19WDltez5/MrOjnFzhL8s0bJgm+PefLptRt5deV2em8KC3tuHp9kqfJy1oFEdUmR
 ICWW4oxEQy3mouJEAFGhA4oxAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsVy+t/xe7rnzeTjDNqfK1o8eDObzeLK1/ds
 Fif6PrBaXN41h83iw9sSiw8T/jM5sHnsnHWX3WPBplKPPRNPsnnc7z7O5PF5k1wAa5SeTVF+
 aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexvVJ2gUvFSq+
 nP3E1sB4VbyLkYNDQsBEYsYD5S5GLg4hgaWMEo0vJrFBxGUkjq8v62LkBDKFJf5c62KDqHnN
 KPHs2ixmkISwgIPEyQev2UBsEYE4iTdHb7KAFDELrGWUmL+rnxGi4wajxL1l/WAdbAJWEhPb
 VwEl2Dl4Bewk/kaD7GIRUJXYNd0QpEBUIELi8I5ZjCA2r4CgxMmZT1hAbE6BQInf06ewg9jM
 AuoSf+ZdYoawxSVuPZnPBGHLS2x/O4d5AqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucWG
 esWJucWleel6yfm5mxiB8bXt2M/NOxgvbQw+xCjAwajEw5vxRy5OiDWxrLgy9xCjBAezkgjv
 yRmycUK8KYmVValF+fFFpTmpxYcYTYF+m8gsJZqcD4z9vJJ4Q1NDcwtLQ3Njc2MzCyVx3g6B
 gzFCAumJJanZqakFqUUwfUwcnFINjPnB93xfh8kp5B/6z/Yp0WDe5sMrm7gfLKr8by7etdvk
 gkGRUSovz9NP5vvub72Wm9kge+BC0stNvyKX63Mttb21NOw2Z5K8a8jrVwx5c/cv8nXR9+gu
 a2wMDJL/sLRwy5yFnXoqnnfcDvc2X5ki5cQ1/fzelK2myrXL6rkOlXyMkrj+4dyxE0osxRmJ
 hlrMRcWJAH8Xo2rFAgAA
X-CMS-MailID: 20200115155911eucas1p220088bc450d966bb2f25eb0f6ebb4e16
X-Msg-Generator: CA
X-RootMTR: 20191220180738eucas1p2c5a571666d1f75812de7078ca6b84ab3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191220180738eucas1p2c5a571666d1f75812de7078ca6b84ab3
References: <20191218025337.35044-1-natechancellor@gmail.com>
 <CGME20191220180738eucas1p2c5a571666d1f75812de7078ca6b84ab3@eucas1p2.samsung.com>
 <CAKwvOd=DcXiA5d07bS_3qhr4F-mbsGzZic=OgomuhZchGaXeoQ@mail.gmail.com>
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/20/19 7:07 PM, Nick Desaulniers wrote:
> On Tue, Dec 17, 2019 at 6:53 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
>>
>> Clang warns:
>>
>> ../drivers/video/fbdev/core/fbcon.c:915:3: warning: misleading
>> indentation; statement is not part of the previous 'if'
>> [-Wmisleading-indentation]
>>         return err;
>>         ^
>> ../drivers/video/fbdev/core/fbcon.c:912:2: note: previous statement is
>> here
>>         if (!search_fb_in_map(info_idx))
>>         ^
>> 1 warning generated.
>>
>> This warning occurs because there is a space before the tab on this
>> line. This happens on several lines in this function; normalize them
>> so that the indentation is consistent with the Linux kernel coding
>> style and clang no longer warns.
>>
>> This warning was introduced before the beginning of git history so no
>> fixes tab.
>>
>> https://github.com/ClangBuiltLinux/linux/issues/824
>> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> Thanks for the patch!
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Patch queued for v5.6, thanks.
 
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

>> ---
>>  drivers/video/fbdev/core/fbcon.c | 27 +++++++++++++--------------
>>  1 file changed, 13 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
>> index c9235a2f42f8..9d2c43e345a4 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -866,7 +866,7 @@ static int set_con2fb_map(int unit, int newidx, int user)
>>         int oldidx = con2fb_map[unit];
>>         struct fb_info *info = registered_fb[newidx];
>>         struct fb_info *oldinfo = NULL;
>> -       int found, err = 0;
>> +       int found, err = 0;
>>
>>         WARN_CONSOLE_UNLOCKED();
>>
>> @@ -888,31 +888,30 @@ static int set_con2fb_map(int unit, int newidx, int user)
>>
>>         con2fb_map[unit] = newidx;
>>         if (!err && !found)
>> -               err = con2fb_acquire_newinfo(vc, info, unit, oldidx);
>> -
>> +               err = con2fb_acquire_newinfo(vc, info, unit, oldidx);
>>
>>         /*
>>          * If old fb is not mapped to any of the consoles,
>>          * fbcon should release it.
>>          */
>> -       if (!err && oldinfo && !search_fb_in_map(oldidx))
>> -               err = con2fb_release_oldinfo(vc, oldinfo, info, unit, oldidx,
>> -                                            found);
>> +       if (!err && oldinfo && !search_fb_in_map(oldidx))
>> +               err = con2fb_release_oldinfo(vc, oldinfo, info, unit, oldidx,
>> +                                            found);
>>
>> -       if (!err) {
>> -               int show_logo = (fg_console == 0 && !user &&
>> -                                logo_shown != FBCON_LOGO_DONTSHOW);
>> +       if (!err) {
>> +               int show_logo = (fg_console == 0 && !user &&
>> +                                logo_shown != FBCON_LOGO_DONTSHOW);
>>
>> -               if (!found)
>> -                       fbcon_add_cursor_timer(info);
>> -               con2fb_map_boot[unit] = newidx;
>> -               con2fb_init_display(vc, info, unit, show_logo);
>> +               if (!found)
>> +                       fbcon_add_cursor_timer(info);
>> +               con2fb_map_boot[unit] = newidx;
>> +               con2fb_init_display(vc, info, unit, show_logo);
>>         }
>>
>>         if (!search_fb_in_map(info_idx))
>>                 info_idx = newidx;
>>
>> -       return err;
>> +       return err;
>>  }
>>
>>  /*
>> --
>> 2.24.1
>>
>> --
>> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit https://protect2.fireeye.com/url?k=bb9fa192-e64db737-bb9e2add-0cc47a31bee8-3ce98548f51cd7a2&u=https://groups.google.com/d/msgid/clang-built-linux/20191218025337.35044-1-natechancellor%40gmail.com.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
