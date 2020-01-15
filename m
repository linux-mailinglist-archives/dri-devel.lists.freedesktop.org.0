Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B68613C8A0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 17:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A866EAFA;
	Wed, 15 Jan 2020 16:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16D06EAFA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 16:01:28 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200115160127euoutp01778dac512fa6293f8834696300646f37~qGs0IXtC90032700327euoutp01B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 16:01:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200115160127euoutp01778dac512fa6293f8834696300646f37~qGs0IXtC90032700327euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579104087;
 bh=LqMP39u9c1982REyH6fNGdAAnlEOofc2tfTRpoSDHWA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=BRgaQdvabbB5QxPBTlXaY+rksvc58VBC1QQo6FeXYuLjOQ0RX8WpDzmi7BcyEDmqf
 2S+mXF13/wnsNNfiL0Jf/5aprypR9jSoXRLQKXDjnFGgMVtiYmXf1oTKCY0T/wy4Df
 4EgxsKz+yCmxWPkmJhyao9GEC0KiAEHf6ktABKjU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200115160127eucas1p2da69eea1bdde808be14ebe99db0111de~qGsz-vfU62731027310eucas1p2g;
 Wed, 15 Jan 2020 16:01:27 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id AF.27.60698.6573F1E5; Wed, 15
 Jan 2020 16:01:27 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200115160126eucas1p18cf10b6029eefc5464d9fb4e1402e219~qGszqSGKW0915909159eucas1p12;
 Wed, 15 Jan 2020 16:01:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200115160126eusmtrp1f25b31f47ce3d2e8c881aa3d2044831a~qGszppu7t0554305543eusmtrp1T;
 Wed, 15 Jan 2020 16:01:26 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-33-5e1f3756ad41
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 87.E2.07950.6573F1E5; Wed, 15
 Jan 2020 16:01:26 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200115160126eusmtip16084449c437b257f15551ad3a1c788de~qGszIG3ad1149711497eusmtip1Z;
 Wed, 15 Jan 2020 16:01:26 +0000 (GMT)
Subject: Re: [PATCH] fbmem: Adjust indentation in fb_prepare_logo and fb_blank
To: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor
 <natechancellor@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <b6d5a48e-f1e5-4c51-bf48-a08f1e5e7388@samsung.com>
Date: Wed, 15 Jan 2020 17:01:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdk0hz-Eu00yRwRT6MFDmxPWdgnuYZWxGxASicCq68NivQ@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsWy7djP87rh5vJxBhd2Mlo8eDObzeLK1/ds
 Fif6PrBaXN41h83iw9sSiw8T/jM5sHnsnHWX3WPBplKPPRNPsnnc7z7O5PF5k1wAaxSXTUpq
 TmZZapG+XQJXRm9PL1PBRpWKnXPOMjUwPpfsYuTkkBAwkWi5sZmxi5GLQ0hgBaPE+qN9rBDO
 F0aJC90T2CCcz4wSJ3tXssG0TP1wHqpqOaPEpjP9UM5bRonvc/rZQaqEBQIkupu2MoPYIgJx
 EncP3QBbwiywllFi2+J9LCAJNgEriYntqxhBbF4BO4lXLT9YQWwWAVWJFVsfgdWICkRIfHpw
 mBWiRlDi5MwnYHFOgUCJaf2NYMuYBcQlbj2ZzwRhy0tsfzuHGWSZhMA6domXxy+xQ9ztIjH3
 xjNGCFtY4tXxLVBxGYnTk3tYoBoYJf52vIDq3s4osXzyP6ivrSXunPsFZHMArdCUWL9LH8SU
 EHCUOPRDFMLkk7jxVhDiBj6JSdumM0OEeSU62oQgZqhJbFi2gQ1ma9fOlcwTGJVmIflsFpJv
 ZiH5ZhbC2gWMLKsYxVNLi3PTU4uN81LL9YoTc4tL89L1kvNzNzECE8/pf8e/7mDc9yfpEKMA
 B6MSD2/GH7k4IdbEsuLK3EOMEhzMSiK8J2fIxgnxpiRWVqUW5ccXleakFh9ilOZgURLnNV70
 MlZIID2xJDU7NbUgtQgmy8TBKdXAuN6yNHHyp0cS0o2nL7mJn/o0O+p2rsJOxyrx+L0Bd4M5
 Hxz4Ft/A1WfOk2P40dXLXfTXk79m795Fm0k6d05ssNaR55KQt+zzsjy2r2puyouznWxLM6f5
 /tylerj2bQqHqVXOtIPKzysLJZ6sFYvU+O07/Y8ny97g3U9c0jUSpW6V/5ukdfCmEktxRqKh
 FnNRcSIAgm/o9zgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xu7ph5vJxBp2rtS0evJnNZnHl63s2
 ixN9H1gtLu+aw2bx4W2JxYcJ/5kc2Dx2zrrL7rFgU6nHnokn2Tzudx9n8vi8SS6ANUrPpii/
 tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvo7enl6lgo0rF
 zjlnmRoYn0t2MXJySAiYSEz9cJ61i5GLQ0hgKaPEm/P9TF2MHEAJGYnj68sgaoQl/lzrYoOo
 ec0o8eBOBxNIQljAT+Jj810wW0QgTuLN0ZssIEXMAmsZJebv6mcESQgJ3GCU6NpYC2KzCVhJ
 TGxfBRbnFbCTeNXygxXEZhFQlVix9RELiC0qECFxeMcsqBpBiZMzn4DFOQUCJab1N7KD2MwC
 6hJ/5l1ihrDFJW49mc8EYctLbH87h3kCo9AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xUZ6
 xYm5xaV56XrJ+bmbGIFxtu3Yzy07GLveBR9iFOBgVOLhPfBPLk6INbGsuDL3EKMEB7OSCO/J
 GbJxQrwpiZVVqUX58UWlOanFhxhNgZ6byCwlmpwPTAF5JfGGpobmFpaG5sbmxmYWSuK8HQIH
 Y4QE0hNLUrNTUwtSi2D6mDg4pRoYp0xNY/b9x/rKK7zw2KXm1j6Xq8V/F2ya/vbpsWNynh7x
 +xcHL5PgCqlbUet6b+fzY7te5K362KbH5snhptjD9sxVce/yY3sr3qvriJeeXf7h6gtnNdc9
 C6uvzooQZvi/2c9ojXnfA62TgV0Xr37e7y/Zyq/Tt4H9AHt3r51NRfP8ukeCNnfeKbEUZyQa
 ajEXFScCAJiSiNvJAgAA
X-CMS-MailID: 20200115160126eucas1p18cf10b6029eefc5464d9fb4e1402e219
X-Msg-Generator: CA
X-RootMTR: 20191220180959eucas1p134233cbd0a32573e8bc7460d5ddd5906
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191220180959eucas1p134233cbd0a32573e8bc7460d5ddd5906
References: <20191218030025.10064-1-natechancellor@gmail.com>
 <CGME20191220180959eucas1p134233cbd0a32573e8bc7460d5ddd5906@eucas1p1.samsung.com>
 <CAKwvOdk0hz-Eu00yRwRT6MFDmxPWdgnuYZWxGxASicCq68NivQ@mail.gmail.com>
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


On 12/20/19 7:09 PM, Nick Desaulniers wrote:
> On Tue, Dec 17, 2019 at 7:00 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
>>
>> Clang warns:
>>
>> ../drivers/video/fbdev/core/fbmem.c:665:3: warning: misleading
>> indentation; statement is not part of the previous 'else'
>> [-Wmisleading-indentation]
>>         if (fb_logo.depth > 4 && depth > 4) {
>>         ^
>> ../drivers/video/fbdev/core/fbmem.c:661:2: note: previous statement is
>> here
>>         else
>>         ^
>> ../drivers/video/fbdev/core/fbmem.c:1075:3: warning: misleading
>> indentation; statement is not part of the previous 'if'
>> [-Wmisleading-indentation]
>>         return ret;
>>         ^
>> ../drivers/video/fbdev/core/fbmem.c:1072:2: note: previous statement is
>> here
>>         if (!ret)
>>         ^
>> 2 warnings generated.
>>
>> This warning occurs because there are spaces before the tabs on these
>> lines. Normalize the indentation in these functions so that it is
>> consistent with the Linux kernel coding style and clang no longer warns.
>>
>> Fixes: 1692b37c99d5 ("fbdev: Fix logo if logo depth is less than framebuffer depth")
>> Link: https://protect2.fireeye.com/url?k=6092966e-3d083fcd-60931d21-002590f5b904-0ba0d782b5b6272b&u=https://github.com/ClangBuiltLinux/linux/issues/825
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
>>  drivers/video/fbdev/core/fbmem.c | 36 ++++++++++++++++----------------
>>  1 file changed, 18 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
>> index 0662b61fdb50..bf63cc0e6b65 100644
>> --- a/drivers/video/fbdev/core/fbmem.c
>> +++ b/drivers/video/fbdev/core/fbmem.c
>> @@ -662,20 +662,20 @@ int fb_prepare_logo(struct fb_info *info, int rotate)
>>                 fb_logo.depth = 1;
>>
>>
>> -       if (fb_logo.depth > 4 && depth > 4) {
>> -               switch (info->fix.visual) {
>> -               case FB_VISUAL_TRUECOLOR:
>> -                       fb_logo.needs_truepalette = 1;
>> -                       break;
>> -               case FB_VISUAL_DIRECTCOLOR:
>> -                       fb_logo.needs_directpalette = 1;
>> -                       fb_logo.needs_cmapreset = 1;
>> -                       break;
>> -               case FB_VISUAL_PSEUDOCOLOR:
>> -                       fb_logo.needs_cmapreset = 1;
>> -                       break;
>> -               }
>> -       }
>> +       if (fb_logo.depth > 4 && depth > 4) {
>> +               switch (info->fix.visual) {
>> +               case FB_VISUAL_TRUECOLOR:
>> +                       fb_logo.needs_truepalette = 1;
>> +                       break;
>> +               case FB_VISUAL_DIRECTCOLOR:
>> +                       fb_logo.needs_directpalette = 1;
>> +                       fb_logo.needs_cmapreset = 1;
>> +                       break;
>> +               case FB_VISUAL_PSEUDOCOLOR:
>> +                       fb_logo.needs_cmapreset = 1;
>> +                       break;
>> +               }
>> +       }
>>
>>         height = fb_logo.logo->height;
>>         if (fb_center_logo)
>> @@ -1060,19 +1060,19 @@ fb_blank(struct fb_info *info, int blank)
>>         struct fb_event event;
>>         int ret = -EINVAL;
>>
>> -       if (blank > FB_BLANK_POWERDOWN)
>> -               blank = FB_BLANK_POWERDOWN;
>> +       if (blank > FB_BLANK_POWERDOWN)
>> +               blank = FB_BLANK_POWERDOWN;
>>
>>         event.info = info;
>>         event.data = &blank;
>>
>>         if (info->fbops->fb_blank)
>> -               ret = info->fbops->fb_blank(blank, info);
>> +               ret = info->fbops->fb_blank(blank, info);
>>
>>         if (!ret)
>>                 fb_notifier_call_chain(FB_EVENT_BLANK, &event);
>>
>> -       return ret;
>> +       return ret;
>>  }
>>  EXPORT_SYMBOL(fb_blank);
>>
>> --
>> 2.24.1
>>
>> --
>> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit https://protect2.fireeye.com/url?k=d7e70d81-8a7da422-d7e686ce-002590f5b904-15caafb1f7cc41ea&u=https://groups.google.com/d/msgid/clang-built-linux/20191218030025.10064-1-natechancellor%40gmail.com.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
