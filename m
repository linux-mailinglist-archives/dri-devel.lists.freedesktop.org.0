Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AB5AEB198
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 10:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC5710E978;
	Fri, 27 Jun 2025 08:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="eKMZAsc0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id B24E210E978
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 08:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Content-Type:Message-ID:Date:MIME-Version:Subject:
 To:From; bh=Pq+1XKtNSvpaQmA6ZxfbYt5XeL1e53dHySyiZSw45GQ=; b=eKMZ
 Asc0xn7pyRyrTQ2pTtm8H+HxteG3gUVmUdZFnApVIueWV7oKp2IBtG4E3hxikTPE
 WpEyhVLyWOiap/L7H+p8+8XHdL0irVGUq/FMKHC4PPAWigYNQt5eatgzoTlyEPFJ
 RwA5d0v1EuakhvMCo2+rqepkAUnSTnTMaxWLkJI=
Received: from [10.42.20.80] (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wDHzZfiWl5oO5GgAw--.34240S2; 
 Fri, 27 Jun 2025 16:48:35 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------FwqcQS2wBt8xOw36xNT2oO40"
Message-ID: <bbfebeac-a5b4-4350-a4e8-3da8a5f0efad@163.com>
Date: Fri, 27 Jun 2025 16:48:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: efifb: do not load efifb if PCI BAR has changed
 but not fixuped
To: Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>
Cc: Peter Jones <pjones@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250626094937.515552-1-oushixiong1025@163.com>
 <ecf7f260-4c5f-45fc-be8d-0361b00af6a3@suse.de>
 <24f53098-710a-43f9-8d1c-d809fb5354eb@163.com>
 <855d6faa-9f72-466e-9294-d6059bb9d920@suse.de>
From: Shixiong Ou <oushixiong1025@163.com>
In-Reply-To: <855d6faa-9f72-466e-9294-d6059bb9d920@suse.de>
X-CM-TRANSID: _____wDHzZfiWl5oO5GgAw--.34240S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKrWxGr4UuF4xCrWDXF45trb_yoW3Zry3pF
 4fKw47uF48XF1fGws8Ca1DGr1S9r1v9FyqkFsxKw1UA3y7GF1jvr97C3yq9ry5Zr48Jr17
 trsrtw12kF1UuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRtDGOUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXRR5D2heWDdAdwAAsR
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

This is a multi-part message in MIME format.
--------------FwqcQS2wBt8xOw36xNT2oO40
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2025/6/27 16:12, Thomas Zimmermann 写道:
> Hi
>
> Am 27.06.25 um 10:07 schrieb Shixiong Ou:
>>
>> 在 2025/6/26 18:31, Thomas Zimmermann 写道:
>>> Hi
>>>
>>> Am 26.06.25 um 11:49 schrieb oushixiong1025@163.com:
>>>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>>>
>>>> [WHY]
>>>> On an ARM machine, the following log is present:
>>>> [    0.900884] efifb: framebuffer at 0x1020000000, using 3072k, 
>>>> total 3072k
>>>> [    2.297884] amdgpu 0000:04:00.0: 
>>>> remove_conflicting_pci_framebuffers: bar 0: 0x1000000000 -> 
>>>> 0x100fffffff
>>>> [    2.297886] amdgpu 0000:04:00.0: 
>>>> remove_conflicting_pci_framebuffers: bar 2: 0x1010000000 -> 
>>>> 0x10101fffff
>>>> [    2.297888] amdgpu 0000:04:00.0: 
>>>> remove_conflicting_pci_framebuffers: bar 5: 0x58200000 -> 0x5823ffff
>>>>
>>>> It show that the efifb framebuffer base is out of PCI BAR, and this
>>>
>>> The patch at
>>>
>>> https://patchwork.freedesktop.org/series/148057/
>>>
>>> is supposed to fix the problem. It has been merged with v6.16-rc1 as 
>>> commit 2f29b5c23101 ("video: screen_info: Relocate framebuffers 
>>> behind PCI bridges"). It is in your tree?
>>>
>>> Best regards
>>> Thomas
>>>
>> yeah, this patch is in my tree. but do not fix the problem.
>
> The patch's final revision had a rough development. Just for testing 
> purposes, could you revert the commit and instead apply the patch's 
> earlier revision from
>
> https://patchwork.freedesktop.org/patch/649527/?series=148057&rev=1
>
> ?
>
> Thanks a lot.
>
> Best regards
> Thomas
>
I have revert the commit and applied this patch, and added some prints as:

+               printk("pcibios_bus_to_resource orginal: start = %llx, 
end = %llx",
+                               r->start, r->end);
+               pcibios_bus_to_resource(pdev->bus, r, &bus_region);
+               printk("pcibios_bus_to_resource finished: start = %llx, 
end = %llx",
+                               r->start, r->end);
+

and the kernel message as follow:

kylin@kylin-pc:~$ dmesg | grep pcibios_bus_to_resource
[    0.684698] pcibios_bus_to_resource orginal: start = 1020000000, end 
= 10202fffff
[    0.684702] pcibios_bus_to_resource finished: start = 1020000000, end 
= 10202fffff

The address doesn't seem to have been modified.
Best regards
Shixiong.

>>
>> this is some message:
>>
>> kylin@kylin-pc:~$ dmesg | grep BAR
>> [    0.688192] pci 0000:00:03.0: BAR 15: assigned [mem 
>> 0x1000000000-0x101fffffff 64bit pref]
>> [    0.688200] pci 0000:00:00.0: BAR 0: assigned [mem 
>> 0x1020000000-0x10200fffff 64bit pref]
>> [    0.688205] pci 0000:00:00.0: BAR 14: assigned [mem 
>> 0x58000000-0x580fffff]
>> [    0.688210] pci 0000:00:01.0: BAR 0: assigned [mem 
>> 0x1020100000-0x10201fffff 64bit pref]
>> [    0.688215] pci 0000:00:02.0: BAR 0: assigned [mem 
>> 0x1020200000-0x10202fffff 64bit pref]
>> [    0.688221] pci 0000:00:02.0: BAR 14: assigned [mem 
>> 0x58100000-0x581fffff]
>> [    0.688225] pci 0000:00:03.0: BAR 0: assigned [mem 
>> 0x1020300000-0x10203fffff 64bit pref]
>> [    0.688231] pci 0000:00:03.0: BAR 14: assigned [mem 
>> 0x58200000-0x585fffff]
>> [    0.688237] pci 0000:00:04.0: BAR 0: assigned [mem 
>> 0x1020400000-0x10204fffff 64bit pref]
>> [    0.688243] pci 0000:00:05.0: BAR 0: assigned [mem 
>> 0x1020500000-0x10205fffff 64bit pref]
>> [    0.688249] pci 0000:00:05.0: BAR 14: assigned [mem 
>> 0x58600000-0x586fffff]
>> [    0.688253] pci 0000:01:00.0: BAR 0: assigned [mem 
>> 0x58000000-0x58003fff 64bit]
>> [    0.688290] pci 0000:03:00.0: BAR 6: assigned [mem 
>> 0x58100000-0x5817ffff pref]
>> [    0.688296] pci 0000:03:00.0: BAR 0: assigned [mem 
>> 0x58180000-0x58181fff]
>> [    0.688303] pci 0000:03:00.0: BAR 5: assigned [mem 
>> 0x58182000-0x58183fff]
>> [    0.688317] pci 0000:04:00.0: BAR 1: assigned [mem 
>> 0x1000000000-0x101fffffff 64bit pref]
>> [    0.688326] pci 0000:04:00.0: BAR 0: assigned [mem 
>> 0x58200000-0x583fffff]
>> [    0.688332] pci 0000:04:00.0: BAR 6: assigned [mem 
>> 0x58400000-0x584fffff pref]
>> [    0.688336] pci 0000:04:00.1: BAR 0: assigned [mem 
>> 0x58500000-0x58503fff]
>> [    0.688360] pci 0000:06:00.0: BAR 0: assigned [mem 
>> 0x58600000-0x58601fff 64bit]
>> kylin@kylin-pc:~$ dmesg | grep framebuffer
>> [    1.137536] efifb: framebuffer at 0x1020000000, using 3072k, total 
>> 3072k
>>
>> the efifb base address is still at 0x1020000000 after calling 
>> pcibios_bus_to_resource().
>>
>>
>>>> results in both efi-framebuffer and amdgpudrmfb co-existing.
>>>>
>>>> The fbcon will be bound to efi-framebuffer by default and cannot be 
>>>> used.
>>>>
>>>> [HOW]
>>>> Do not load efifb driver if PCI BAR has changed but not fixuped.
>>>> In the following cases:
>>>>     1. screen_info_lfb_pdev is NULL.
>>>>     2. __screen_info_relocation_is_valid return false.
>>>>
>>>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>>>> ---
>>>>   drivers/video/fbdev/efifb.c     |  4 ++++
>>>>   drivers/video/screen_info_pci.c | 24 ++++++++++++++++++++++++
>>>>   include/linux/screen_info.h     |  5 +++++
>>>>   3 files changed, 33 insertions(+)
>>>>
>>>> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
>>>> index 0e1bd3dba255..de8d016c9a66 100644
>>>> --- a/drivers/video/fbdev/efifb.c
>>>> +++ b/drivers/video/fbdev/efifb.c
>>>> @@ -303,6 +303,10 @@ static void efifb_setup(struct screen_info 
>>>> *si, char *options)
>>>>     static inline bool fb_base_is_valid(struct screen_info *si)
>>>>   {
>>>> +    /* check whether fb_base has changed but not fixuped */
>>>> +    if (!screen_info_is_useful())
>>>> +        return false;
>>>> +
>>>>       if (si->lfb_base)
>>>>           return true;
>>>>   diff --git a/drivers/video/screen_info_pci.c 
>>>> b/drivers/video/screen_info_pci.c
>>>> index 66bfc1d0a6dc..ac57dcaf0cac 100644
>>>> --- a/drivers/video/screen_info_pci.c
>>>> +++ b/drivers/video/screen_info_pci.c
>>>> @@ -9,6 +9,8 @@ static struct pci_dev *screen_info_lfb_pdev;
>>>>   static size_t screen_info_lfb_bar;
>>>>   static resource_size_t screen_info_lfb_res_start; // original 
>>>> start of resource
>>>>   static resource_size_t screen_info_lfb_offset; // framebuffer 
>>>> offset within resource
>>>> +static bool screen_info_changed;
>>>> +static bool screen_info_fixuped;
>>>>     static bool __screen_info_relocation_is_valid(const struct 
>>>> screen_info *si, struct resource *pr)
>>>>   {
>>>> @@ -24,6 +26,24 @@ static bool 
>>>> __screen_info_relocation_is_valid(const struct screen_info *si, stru
>>>>       return true;
>>>>   }
>>>>   +bool screen_info_is_useful(void)
>>>> +{
>>>> +    unsigned int type;
>>>> +    const struct screen_info *si = &screen_info;
>>>> +
>>>> +    type = screen_info_video_type(si);
>>>> +    if (type != VIDEO_TYPE_EFI)
>>>> +        return true;
>>>> +
>>>> +    if (screen_info_changed && !screen_info_fixuped) {
>>>> +        pr_warn("The screen_info has changed but not fixuped");
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    pr_info("The screen_info is useful");
>>>> +    return true;
>>>> +}
>>>> +
>>>>   void screen_info_apply_fixups(void)
>>>>   {
>>>>       struct screen_info *si = &screen_info;
>>>> @@ -32,18 +52,22 @@ void screen_info_apply_fixups(void)
>>>>           struct resource *pr = 
>>>> &screen_info_lfb_pdev->resource[screen_info_lfb_bar];
>>>>             if (pr->start != screen_info_lfb_res_start) {
>>>> +            screen_info_changed = true;
>>>>               if (__screen_info_relocation_is_valid(si, pr)) {
>>>>                   /*
>>>>                    * Only update base if we have an actual
>>>>                    * relocation to a valid I/O range.
>>>>                    */
>>>>                   __screen_info_set_lfb_base(si, pr->start + 
>>>> screen_info_lfb_offset);
>>>> +                screen_info_fixuped = true;
>>>>                   pr_info("Relocating firmware framebuffer to 
>>>> offset %pa[d] within %pr\n",
>>>>                       &screen_info_lfb_offset, pr);
>>>>               } else {
>>>>                   pr_warn("Invalid relocating, disabling firmware 
>>>> framebuffer\n");
>>
>> And should something be done 
>> after __screen_info_relocation_is_valid() return false?
>>
>> Best regards
>> Shixiong.
>>
>>>>               }
>>>>           }
>>>> +    } else {
>>>> +        screen_info_changed = true;
>>>>       }
>>>>   }
>>>>   diff --git a/include/linux/screen_info.h 
>>>> b/include/linux/screen_info.h
>>>> index 923d68e07679..632cdbb1adbe 100644
>>>> --- a/include/linux/screen_info.h
>>>> +++ b/include/linux/screen_info.h
>>>> @@ -138,9 +138,14 @@ ssize_t screen_info_resources(const struct 
>>>> screen_info *si, struct resource *r,
>>>>   u32 __screen_info_lfb_bits_per_pixel(const struct screen_info *si);
>>>>     #if defined(CONFIG_PCI)
>>>> +bool screen_info_is_useful(void);
>>>>   void screen_info_apply_fixups(void);
>>>>   struct pci_dev *screen_info_pci_dev(const struct screen_info *si);
>>>>   #else
>>>> +bool screen_info_is_useful(void)
>>>> +{
>>>> +    return true;
>>>> +}
>>>>   static inline void screen_info_apply_fixups(void)
>>>>   { }
>>>>   static inline struct pci_dev *screen_info_pci_dev(const struct 
>>>> screen_info *si)
>>>
>>
>
--------------FwqcQS2wBt8xOw36xNT2oO40
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2025/6/27 16:12, Thomas Zimmermann
      写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:855d6faa-9f72-466e-9294-d6059bb9d920@suse.de">Hi
      <br>
      <br>
      Am 27.06.25 um 10:07 schrieb Shixiong Ou:
      <br>
      <blockquote type="cite">
        <br>
        在 2025/6/26 18:31, Thomas Zimmermann 写道:
        <br>
        <blockquote type="cite">Hi
          <br>
          <br>
          Am 26.06.25 um 11:49 schrieb <a class="moz-txt-link-abbreviated" href="mailto:oushixiong1025@163.com">oushixiong1025@163.com</a>:
          <br>
          <blockquote type="cite">From: Shixiong Ou
            <a class="moz-txt-link-rfc2396E" href="mailto:oushixiong@kylinos.cn">&lt;oushixiong@kylinos.cn&gt;</a>
            <br>
            <br>
            [WHY]
            <br>
            On an ARM machine, the following log is present:
            <br>
            [    0.900884] efifb: framebuffer at 0x1020000000, using
            3072k, total 3072k
            <br>
            [    2.297884] amdgpu 0000:04:00.0:
            remove_conflicting_pci_framebuffers: bar 0: 0x1000000000
            -&gt; 0x100fffffff
            <br>
            [    2.297886] amdgpu 0000:04:00.0:
            remove_conflicting_pci_framebuffers: bar 2: 0x1010000000
            -&gt; 0x10101fffff
            <br>
            [    2.297888] amdgpu 0000:04:00.0:
            remove_conflicting_pci_framebuffers: bar 5: 0x58200000 -&gt;
            0x5823ffff
            <br>
            <br>
            It show that the efifb framebuffer base is out of PCI BAR,
            and this
            <br>
          </blockquote>
          <br>
          The patch at
          <br>
          <br>
            <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/148057/">https://patchwork.freedesktop.org/series/148057/</a>
          <br>
          <br>
          is supposed to fix the problem. It has been merged with
          v6.16-rc1 as commit 2f29b5c23101 ("video: screen_info:
          Relocate framebuffers behind PCI bridges"). It is in your
          tree?
          <br>
          <br>
          Best regards
          <br>
          Thomas
          <br>
          <br>
        </blockquote>
        yeah, this patch is in my tree. but do not fix the problem.
        <br>
      </blockquote>
      <br>
      The patch's final revision had a rough development. Just for
      testing purposes, could you revert the commit and instead apply
      the patch's earlier revision from
      <br>
      <br>
<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/649527/?series=148057&amp;rev=1">https://patchwork.freedesktop.org/patch/649527/?series=148057&amp;rev=1</a>
      <br>
      <br>
      ?
      <br>
      <br>
      Thanks a lot.
      <br>
      <br>
      Best regards
      <br>
      Thomas <br>
      <br>
    </blockquote>
    <p>I have revert the commit and applied this patch, and added some
      prints as:</p>
    <p>+               printk("pcibios_bus_to_resource orginal: start =
      %llx, end = %llx",<br>
      +                               r-&gt;start, r-&gt;end);<br>
      +               pcibios_bus_to_resource(pdev-&gt;bus, r,
      &amp;bus_region);<br>
      +               printk("pcibios_bus_to_resource finished: start =
      %llx, end = %llx",<br>
      +                               r-&gt;start, r-&gt;end);<br>
      +</p>
    <p>and the kernel message as follow:</p>
    <p>kylin@kylin-pc:~$ dmesg | grep pcibios_bus_to_resource<br>
      [    0.684698] pcibios_bus_to_resource orginal: start =
      1020000000, end = 10202fffff<br>
      [    0.684702] pcibios_bus_to_resource finished: start =
      1020000000, end = 10202fffff<br>
    </p>
    <div id="tta_output_ta"
class="tta_no_click_outline                                                                                                                                             tta_output_hastxt                                      tta_focusTextExtraExtraSmall"
      dir="ltr" data-placeholder="翻译" style="height: 48px;"
      lang="zh-Hans" tabindex="0">The address doesn't seem to have been
      modified.</div>
    <div
class="tta_no_click_outline                                                                                                                                             tta_output_hastxt                                      tta_focusTextExtraExtraSmall"
      dir="ltr" data-placeholder="翻译" style="height: 48px;"
      lang="zh-Hans" tabindex="0">Best regards
      <br>
      Shixiong.
      <br>
      <br>
    </div>
    <blockquote type="cite"
      cite="mid:855d6faa-9f72-466e-9294-d6059bb9d920@suse.de">
      <blockquote type="cite">
        <br>
        this is some message:
        <br>
        <br>
        kylin@kylin-pc:~$ dmesg | grep BAR
        <br>
        [    0.688192] pci 0000:00:03.0: BAR 15: assigned [mem
        0x1000000000-0x101fffffff 64bit pref]
        <br>
        [    0.688200] pci 0000:00:00.0: BAR 0: assigned [mem
        0x1020000000-0x10200fffff 64bit pref]
        <br>
        [    0.688205] pci 0000:00:00.0: BAR 14: assigned [mem
        0x58000000-0x580fffff]
        <br>
        [    0.688210] pci 0000:00:01.0: BAR 0: assigned [mem
        0x1020100000-0x10201fffff 64bit pref]
        <br>
        [    0.688215] pci 0000:00:02.0: BAR 0: assigned [mem
        0x1020200000-0x10202fffff 64bit pref]
        <br>
        [    0.688221] pci 0000:00:02.0: BAR 14: assigned [mem
        0x58100000-0x581fffff]
        <br>
        [    0.688225] pci 0000:00:03.0: BAR 0: assigned [mem
        0x1020300000-0x10203fffff 64bit pref]
        <br>
        [    0.688231] pci 0000:00:03.0: BAR 14: assigned [mem
        0x58200000-0x585fffff]
        <br>
        [    0.688237] pci 0000:00:04.0: BAR 0: assigned [mem
        0x1020400000-0x10204fffff 64bit pref]
        <br>
        [    0.688243] pci 0000:00:05.0: BAR 0: assigned [mem
        0x1020500000-0x10205fffff 64bit pref]
        <br>
        [    0.688249] pci 0000:00:05.0: BAR 14: assigned [mem
        0x58600000-0x586fffff]
        <br>
        [    0.688253] pci 0000:01:00.0: BAR 0: assigned [mem
        0x58000000-0x58003fff 64bit]
        <br>
        [    0.688290] pci 0000:03:00.0: BAR 6: assigned [mem
        0x58100000-0x5817ffff pref]
        <br>
        [    0.688296] pci 0000:03:00.0: BAR 0: assigned [mem
        0x58180000-0x58181fff]
        <br>
        [    0.688303] pci 0000:03:00.0: BAR 5: assigned [mem
        0x58182000-0x58183fff]
        <br>
        [    0.688317] pci 0000:04:00.0: BAR 1: assigned [mem
        0x1000000000-0x101fffffff 64bit pref]
        <br>
        [    0.688326] pci 0000:04:00.0: BAR 0: assigned [mem
        0x58200000-0x583fffff]
        <br>
        [    0.688332] pci 0000:04:00.0: BAR 6: assigned [mem
        0x58400000-0x584fffff pref]
        <br>
        [    0.688336] pci 0000:04:00.1: BAR 0: assigned [mem
        0x58500000-0x58503fff]
        <br>
        [    0.688360] pci 0000:06:00.0: BAR 0: assigned [mem
        0x58600000-0x58601fff 64bit]
        <br>
        kylin@kylin-pc:~$ dmesg | grep framebuffer
        <br>
        [    1.137536] efifb: framebuffer at 0x1020000000, using 3072k,
        total 3072k
        <br>
        <br>
        the efifb base address is still at 0x1020000000 after calling
        pcibios_bus_to_resource().
        <br>
        <br>
        <br>
        <blockquote type="cite">
          <blockquote type="cite">results in both efi-framebuffer and
            amdgpudrmfb co-existing.
            <br>
            <br>
            The fbcon will be bound to efi-framebuffer by default and
            cannot be used.
            <br>
            <br>
            [HOW]
            <br>
            Do not load efifb driver if PCI BAR has changed but not
            fixuped.
            <br>
            In the following cases:
            <br>
                1. screen_info_lfb_pdev is NULL.
            <br>
                2. __screen_info_relocation_is_valid return false.
            <br>
            <br>
            Signed-off-by: Shixiong Ou <a class="moz-txt-link-rfc2396E" href="mailto:oushixiong@kylinos.cn">&lt;oushixiong@kylinos.cn&gt;</a>
            <br>
            ---
            <br>
              drivers/video/fbdev/efifb.c     |  4 ++++
            <br>
              drivers/video/screen_info_pci.c | 24
            ++++++++++++++++++++++++
            <br>
              include/linux/screen_info.h     |  5 +++++
            <br>
              3 files changed, 33 insertions(+)
            <br>
            <br>
            diff --git a/drivers/video/fbdev/efifb.c
            b/drivers/video/fbdev/efifb.c
            <br>
            index 0e1bd3dba255..de8d016c9a66 100644
            <br>
            --- a/drivers/video/fbdev/efifb.c
            <br>
            +++ b/drivers/video/fbdev/efifb.c
            <br>
            @@ -303,6 +303,10 @@ static void efifb_setup(struct
            screen_info *si, char *options)
            <br>
                static inline bool fb_base_is_valid(struct screen_info
            *si)
            <br>
              {
            <br>
            +    /* check whether fb_base has changed but not fixuped */
            <br>
            +    if (!screen_info_is_useful())
            <br>
            +        return false;
            <br>
            +
            <br>
                  if (si-&gt;lfb_base)
            <br>
                      return true;
            <br>
              diff --git a/drivers/video/screen_info_pci.c
            b/drivers/video/screen_info_pci.c
            <br>
            index 66bfc1d0a6dc..ac57dcaf0cac 100644
            <br>
            --- a/drivers/video/screen_info_pci.c
            <br>
            +++ b/drivers/video/screen_info_pci.c
            <br>
            @@ -9,6 +9,8 @@ static struct pci_dev *screen_info_lfb_pdev;
            <br>
              static size_t screen_info_lfb_bar;
            <br>
              static resource_size_t screen_info_lfb_res_start; //
            original start of resource
            <br>
              static resource_size_t screen_info_lfb_offset; //
            framebuffer offset within resource
            <br>
            +static bool screen_info_changed;
            <br>
            +static bool screen_info_fixuped;
            <br>
                static bool __screen_info_relocation_is_valid(const
            struct screen_info *si, struct resource *pr)
            <br>
              {
            <br>
            @@ -24,6 +26,24 @@ static bool
            __screen_info_relocation_is_valid(const struct screen_info
            *si, stru
            <br>
                  return true;
            <br>
              }
            <br>
              +bool screen_info_is_useful(void)
            <br>
            +{
            <br>
            +    unsigned int type;
            <br>
            +    const struct screen_info *si = &amp;screen_info;
            <br>
            +
            <br>
            +    type = screen_info_video_type(si);
            <br>
            +    if (type != VIDEO_TYPE_EFI)
            <br>
            +        return true;
            <br>
            +
            <br>
            +    if (screen_info_changed &amp;&amp;
            !screen_info_fixuped) {
            <br>
            +        pr_warn("The screen_info has changed but not
            fixuped");
            <br>
            +        return false;
            <br>
            +    }
            <br>
            +
            <br>
            +    pr_info("The screen_info is useful");
            <br>
            +    return true;
            <br>
            +}
            <br>
            +
            <br>
              void screen_info_apply_fixups(void)
            <br>
              {
            <br>
                  struct screen_info *si = &amp;screen_info;
            <br>
            @@ -32,18 +52,22 @@ void screen_info_apply_fixups(void)
            <br>
                      struct resource *pr =
            &amp;screen_info_lfb_pdev-&gt;resource[screen_info_lfb_bar];
            <br>
                        if (pr-&gt;start != screen_info_lfb_res_start) {
            <br>
            +            screen_info_changed = true;
            <br>
                          if (__screen_info_relocation_is_valid(si, pr))
            {
            <br>
                              /*
            <br>
                               * Only update base if we have an actual
            <br>
                               * relocation to a valid I/O range.
            <br>
                               */
            <br>
                              __screen_info_set_lfb_base(si,
            pr-&gt;start + screen_info_lfb_offset);
            <br>
            +                screen_info_fixuped = true;
            <br>
                              pr_info("Relocating firmware framebuffer
            to offset %pa[d] within %pr\n",
            <br>
                                  &amp;screen_info_lfb_offset, pr);
            <br>
                          } else {
            <br>
                              pr_warn("Invalid relocating, disabling
            firmware framebuffer\n");
            <br>
          </blockquote>
        </blockquote>
        <br>
        And should something be done
        after __screen_info_relocation_is_valid() return false?
        <br>
        <br>
        Best regards
        <br>
        Shixiong.
        <br>
        <br>
        <blockquote type="cite">
          <blockquote type="cite">              }
            <br>
                      }
            <br>
            +    } else {
            <br>
            +        screen_info_changed = true;
            <br>
                  }
            <br>
              }
            <br>
              diff --git a/include/linux/screen_info.h
            b/include/linux/screen_info.h
            <br>
            index 923d68e07679..632cdbb1adbe 100644
            <br>
            --- a/include/linux/screen_info.h
            <br>
            +++ b/include/linux/screen_info.h
            <br>
            @@ -138,9 +138,14 @@ ssize_t screen_info_resources(const
            struct screen_info *si, struct resource *r,
            <br>
              u32 __screen_info_lfb_bits_per_pixel(const struct
            screen_info *si);
            <br>
                #if defined(CONFIG_PCI)
            <br>
            +bool screen_info_is_useful(void);
            <br>
              void screen_info_apply_fixups(void);
            <br>
              struct pci_dev *screen_info_pci_dev(const struct
            screen_info *si);
            <br>
              #else
            <br>
            +bool screen_info_is_useful(void)
            <br>
            +{
            <br>
            +    return true;
            <br>
            +}
            <br>
              static inline void screen_info_apply_fixups(void)
            <br>
              { }
            <br>
              static inline struct pci_dev *screen_info_pci_dev(const
            struct screen_info *si)
            <br>
          </blockquote>
          <br>
        </blockquote>
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------FwqcQS2wBt8xOw36xNT2oO40--

