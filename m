Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 814A3133917
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 03:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224B46E15F;
	Wed,  8 Jan 2020 02:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E836E15F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 02:25:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jan 2020 18:25:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,408,1571727600"; 
 d="scan'208,217";a="254072389"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.6]) ([10.239.13.6])
 by fmsmga002.fm.intel.com with ESMTP; 07 Jan 2020 18:25:29 -0800
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
To: Thomas Zimmermann <tzimmermann@suse.de>, Feng Tang <feng.tang@intel.com>
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <2f524683-d9ee-77b6-1253-5645dff050a7@suse.de>
 <20190805125239.GB96155@shbuild999.sh.intel.com>
 <89eedbfc-6174-e59d-921e-b92d11a52331@suse.de>
From: Rong Chen <rong.a.chen@intel.com>
Message-ID: <654bacf5-0567-0552-5cdb-c155d96d92bf@intel.com>
Date: Wed, 8 Jan 2020 10:25:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <89eedbfc-6174-e59d-921e-b92d11a52331@suse.de>
Content-Language: en-US
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, michel@daenzer.net, lkp@01.org,
 dri-devel <dri-devel@lists.freedesktop.org>, ying.huang@intel.com
Content-Type: multipart/mixed; boundary="===============1623882156=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1623882156==
Content-Type: multipart/alternative;
 boundary="------------2B2DDFE1C3666A2C8AC448B2"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2B2DDFE1C3666A2C8AC448B2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

The previous throughput was reduced from 43955 to 35691, and there is a little increase in next-20200106,
but there is no obvious change after the patchset:
  
commit:
   f1f8555dfb ("drm/bochs: Use shadow buffer for bochs framebuffer console")
   90f479ae51 ("drm/mgag200: Replace struct mga_fbdev with generic framebuffer emulation")

f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9
---------------- ---------------------------
          %stddev     %change         %stddev
              \          |                \
      43955 ±  2%     -18.8%      35691        vm-scalability.median

commit:

   9eb1b48ca4 ("Add linux-next specific files for 20200106")
   5f20199bac ("drm/fb-helper: Synchronize dirty worker with vblank")

  next-20200106  5f20199bac9b2de71fd2158b90
----------------  --------------------------
          %stddev      change         %stddev
              \          |                \
      38550                       38744
      38549                       38744        vm-scalability.median


Best Regards,
Rong Chen

On 1/6/20 9:19 PM, Thomas Zimmermann wrote:
> Hi Feng,
>
> do you still have the test setup that produced the performance penalty?
>
> If so, could you give a try to the patchset at [1]? I think I've fixed
> the remaining issues in earlier versions and I'd like to see if it
> actually improves performance.
>
> Best regards
> Thomas
>
> [1]
> https://lists.freedesktop.org/archives/dri-devel/2019-December/247771.html
>
> Am 05.08.19 um 14:52 schrieb Feng Tang:
>> Hi Thomas,
>>
>> On Mon, Aug 05, 2019 at 12:22:11PM +0200, Thomas Zimmermann wrote:
>>
>> 	[snip]
>>
>>>>>    2019-08-03 19:29:17  ./case-anon-cow-seq-hugetlb
>>>>>    2019-08-03 19:29:17  ./usemem --runtime 300 -n 4 --prealloc --prefault
>>>>>      -O -U 815394406
>>>>>    917318700 bytes / 659419 usecs = 1358497 KB/s
>>>>>    917318700 bytes / 659658 usecs = 1358005 KB/s
>>>>>    917318700 bytes / 659916 usecs = 1357474 KB/s
>>>>>    917318700 bytes / 660168 usecs = 1356956 KB/s
>>>>>
>>>>> Rong, Feng, could you confirm this by disabling the cursor or blinking?
>>>> Glad to know this method restored the drop. Rong is running the case.
>>>>
>>>> While I have another finds, as I noticed your patch changed the bpp from
>>>> 24 to 32, I had a patch to change it back to 24, and run the case in
>>>> the weekend, the -18% regrssion was reduced to about -5%. Could this
>>>> be related?
>>> In the original code, the fbdev console already ran with 32 bpp [1] and
>>> 16 bpp was selected for low-end devices. [2][3] The patch only set the
>>> same values for userspace; nothing changed for the console.
>> I did the experiment becasue I checked the commit
>>
>> 90f479ae51afa4 drm/mgag200: Replace struct mga_fbdev with generic framebuffer emulation
>>
>> in which there is code:
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
>> index b10f726..a977333 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>>   	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
>>   		dev->mode_config.preferred_depth = 16;
>>   	else
>> -		dev->mode_config.preferred_depth = 24;
>> +		dev->mode_config.preferred_depth = 32;
>>   	dev->mode_config.prefer_shadow = 1;
>>   
>> My debug patch was kind of restoring of this part.
>>
>> Thanks,
>> Feng
>>
>>> Best regards
>>> Thomas
>>>
>>> [1]
>>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mgag200_fb.c?id=5d17718997367c435dbe5341a8e270d9b19478d3#n259
>>> [2]
>>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mgag200_fb.c?id=5d17718997367c435dbe5341a8e270d9b19478d3#n263
>>> [3]
>>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mgag200_fb.c?id=5d17718997367c435dbe5341a8e270d9b19478d3#n286
>>>
>>>> commit:
>>>>    f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer console
>>>>    90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic framebuffer emulation
>>>>    01e75fea0d5 mgag200: restore the depth back to 24
>>>>
>>>> f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 01e75fea0d5ff39d3e588c20ec5
>>>> ---------------- --------------------------- ---------------------------
>>>>       43921 ±  2%     -18.3%      35884            -4.8%      41826        vm-scalability.median
>>>>    14889337           -17.5%   12291029            -4.1%   14278574        vm-scalability.throughput
>>>>   
>>>> commit 01e75fea0d5ff39d3e588c20ec52e7a4e6588a74
>>>> Author: Feng Tang <feng.tang@intel.com>
>>>> Date:   Fri Aug 2 15:09:19 2019 +0800
>>>>
>>>>      mgag200: restore the depth back to 24
>>>>      
>>>>      Signed-off-by: Feng Tang <feng.tang@intel.com>
>>>>
>>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
>>>> index a977333..ac8f6c9 100644
>>>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>>>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>>>> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>>>>   	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
>>>>   		dev->mode_config.preferred_depth = 16;
>>>>   	else
>>>> -		dev->mode_config.preferred_depth = 32;
>>>> +		dev->mode_config.preferred_depth = 24;>  	dev->mode_config.prefer_shadow = 1;
>>>>   
>>>>   	r = mgag200_modeset_init(mdev);
>>>>
>>>> Thanks,
>>>> Feng
>>>>
>>>>>
>>>>> The difference between mgag200's original fbdev support and generic
>>>>> fbdev emulation is generic fbdev's worker task that updates the VRAM
>>>>> buffer from the shadow buffer. mgag200 does this immediately, but relies
>>>>> on drm_can_sleep(), which is deprecated.
>>>>>
>>>>> I think that the worker task interferes with the test case, as the
>>>>> worker has been in fbdev emulation since forever and no performance
>>>>> regressions have been reported so far.
>>>>>
>>>>>
>>>>> So unless there's a report where this problem happens in a real-world
>>>>> use case, I'd like to keep code as it is. And apparently there's always
>>>>> the workaround of disabling the cursor blinking.
>>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>> -- 
>>> Thomas Zimmermann
>>> Graphics Driver Developer
>>> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
>>> GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
>>> HRB 21284 (AG Nürnberg)
>>>
>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>


--------------2B2DDFE1C3666A2C8AC448B2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre style="font-size: 13px; font-family: monospace; white-space: pre-wrap; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">Hi Thomas,

The previous throughput was reduced from 43955 to 35691, and there is a little increase in next-20200106,
but there is no obvious change after the patchset:
 
commit: 
  f1f8555dfb ("drm/bochs: Use shadow buffer for bochs framebuffer console")
  90f479ae51 ("drm/mgag200: Replace struct mga_fbdev with generic framebuffer emulation")

f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     43955 ±  2%     -18.8%      35691        vm-scalability.median

commit: 

  9eb1b48ca4 ("Add linux-next specific files for 20200106")
  5f20199bac ("drm/fb-helper: Synchronize dirty worker with vblank")

 next-20200106  5f20199bac9b2de71fd2158b90
----------------  --------------------------
         %stddev      change         %stddev
             \          |                \  
     38550                       38744       
     38549                       38744        vm-scalability.median
</pre>
    <br>
    Best Regards,<br>
    Rong Chen<br>
    <br>
    <div class="moz-cite-prefix">On 1/6/20 9:19 PM, Thomas Zimmermann
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:89eedbfc-6174-e59d-921e-b92d11a52331@suse.de">
      <pre class="moz-quote-pre" wrap="">Hi Feng,

do you still have the test setup that produced the performance penalty?

If so, could you give a try to the patchset at [1]? I think I've fixed
the remaining issues in earlier versions and I'd like to see if it
actually improves performance.

Best regards
Thomas

[1]
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/archives/dri-devel/2019-December/247771.html">https://lists.freedesktop.org/archives/dri-devel/2019-December/247771.html</a>

Am 05.08.19 um 14:52 schrieb Feng Tang:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi Thomas,

On Mon, Aug 05, 2019 at 12:22:11PM +0200, Thomas Zimmermann wrote:

	[snip] 

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">  2019-08-03 19:29:17  ./case-anon-cow-seq-hugetlb
  2019-08-03 19:29:17  ./usemem --runtime 300 -n 4 --prealloc --prefault
    -O -U 815394406
  917318700 bytes / 659419 usecs = 1358497 KB/s
  917318700 bytes / 659658 usecs = 1358005 KB/s
  917318700 bytes / 659916 usecs = 1357474 KB/s
  917318700 bytes / 660168 usecs = 1356956 KB/s

Rong, Feng, could you confirm this by disabling the cursor or blinking?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
Glad to know this method restored the drop. Rong is running the case.

While I have another finds, as I noticed your patch changed the bpp from
24 to 32, I had a patch to change it back to 24, and run the case in
the weekend, the -18% regrssion was reduced to about -5%. Could this
be related?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
In the original code, the fbdev console already ran with 32 bpp [1] and
16 bpp was selected for low-end devices. [2][3] The patch only set the
same values for userspace; nothing changed for the console.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I did the experiment becasue I checked the commit 

90f479ae51afa4 drm/mgag200: Replace struct mga_fbdev with generic framebuffer emulation

in which there is code:

diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index b10f726..a977333 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 	if (IS_G200_SE(mdev) &amp;&amp; mdev-&gt;mc.vram_size &lt; (2048*1024))
 		dev-&gt;mode_config.preferred_depth = 16;
 	else
-		dev-&gt;mode_config.preferred_depth = 24;
+		dev-&gt;mode_config.preferred_depth = 32;
 	dev-&gt;mode_config.prefer_shadow = 1;
 
My debug patch was kind of restoring of this part.

Thanks,
Feng

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Best regards
Thomas

[1]
<a class="moz-txt-link-freetext" href="https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mgag200_fb.c?id=5d17718997367c435dbe5341a8e270d9b19478d3#n259">https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mgag200_fb.c?id=5d17718997367c435dbe5341a8e270d9b19478d3#n259</a>
[2]
<a class="moz-txt-link-freetext" href="https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mgag200_fb.c?id=5d17718997367c435dbe5341a8e270d9b19478d3#n263">https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mgag200_fb.c?id=5d17718997367c435dbe5341a8e270d9b19478d3#n263</a>
[3]
<a class="moz-txt-link-freetext" href="https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mgag200_fb.c?id=5d17718997367c435dbe5341a8e270d9b19478d3#n286">https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mgag200_fb.c?id=5d17718997367c435dbe5341a8e270d9b19478d3#n286</a>

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
commit: 
  f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer console
  90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic framebuffer emulation
  01e75fea0d5 mgag200: restore the depth back to 24

f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 01e75fea0d5ff39d3e588c20ec5 
---------------- --------------------------- --------------------------- 
     43921 ±  2%     -18.3%      35884            -4.8%      41826        vm-scalability.median
  14889337           -17.5%   12291029            -4.1%   14278574        vm-scalability.throughput
 
commit 01e75fea0d5ff39d3e588c20ec52e7a4e6588a74
Author: Feng Tang <a class="moz-txt-link-rfc2396E" href="mailto:feng.tang@intel.com">&lt;feng.tang@intel.com&gt;</a>
Date:   Fri Aug 2 15:09:19 2019 +0800

    mgag200: restore the depth back to 24
    
    Signed-off-by: Feng Tang <a class="moz-txt-link-rfc2396E" href="mailto:feng.tang@intel.com">&lt;feng.tang@intel.com&gt;</a>

diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index a977333..ac8f6c9 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 	if (IS_G200_SE(mdev) &amp;&amp; mdev-&gt;mc.vram_size &lt; (2048*1024))
 		dev-&gt;mode_config.preferred_depth = 16;
 	else
-		dev-&gt;mode_config.preferred_depth = 32;
+		dev-&gt;mode_config.preferred_depth = 24;&gt;  	dev-&gt;mode_config.prefer_shadow = 1;
 
 	r = mgag200_modeset_init(mdev);

Thanks,
Feng

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">

The difference between mgag200's original fbdev support and generic
fbdev emulation is generic fbdev's worker task that updates the VRAM
buffer from the shadow buffer. mgag200 does this immediately, but relies
on drm_can_sleep(), which is deprecated.

I think that the worker task interferes with the test case, as the
worker has been in fbdev emulation since forever and no performance
regressions have been reported so far.


So unless there's a report where this problem happens in a real-world
use case, I'd like to keep code as it is. And apparently there's always
the workaround of disabling the cursor blinking.

Best regards
Thomas

</pre>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">


_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/dri-devel">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a>

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------2B2DDFE1C3666A2C8AC448B2--

--===============1623882156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1623882156==--
