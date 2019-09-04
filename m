Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81631A85A8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 16:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB2789C17;
	Wed,  4 Sep 2019 14:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223C489C0A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 14:30:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 07:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,467,1559545200"; 
 d="scan'208,217";a="334228434"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.170.39])
 ([10.249.170.39])
 by orsmga004.jf.intel.com with ESMTP; 04 Sep 2019 07:30:47 -0700
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
To: Thomas Zimmermann <tzimmermann@suse.de>, Feng Tang <feng.tang@intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>
References: <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
 <20190824051605.GA63850@shbuild999.sh.intel.com>
 <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
 <d114b0b6-6b64-406e-6c3f-a8b8d5502413@intel.com>
 <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
 <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
 <2e1b4d65-d477-f571-845d-fa0a670859af@suse.de>
 <20190904062716.GC5541@shbuild999.sh.intel.com>
 <72c33bf1-9184-e24a-c084-26d9c8b6f9b7@suse.de>
 <CAKMK7uGdOtyDHZMSzY8J45bX57EFKo=DWNUi+WL+GVOzoBpUhw@mail.gmail.com>
 <20190904083558.GD5541@shbuild999.sh.intel.com>
 <33d3ce15-6221-bd96-3f26-b710e4da6b1a@suse.de>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <888fa0f3-7078-d920-c4d1-89970b452b97@intel.com>
Date: Wed, 4 Sep 2019 22:30:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <33d3ce15-6221-bd96-3f26-b710e4da6b1a@suse.de>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>, LKP <lkp@01.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0265207972=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0265207972==
Content-Type: multipart/alternative;
 boundary="------------458C2BF2DE9FCB37D3A72795"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------458C2BF2DE9FCB37D3A72795
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

On 9/4/2019 4:43 PM, Thomas Zimmermann wrote:
> Hi
>
> Am 04.09.19 um 10:35 schrieb Feng Tang:
>> Hi Daniel,
>>
>> On Wed, Sep 04, 2019 at 10:11:11AM +0200, Daniel Vetter wrote:
>>> On Wed, Sep 4, 2019 at 8:53 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>> Hi
>>>>
>>>> Am 04.09.19 um 08:27 schrieb Feng Tang:
>>>>>> Thank you for testing. But don't get too excited, because the patch
>>>>>> simulates a bug that was present in the original mgag200 code. A
>>>>>> significant number of frames are simply skipped. That is apparently the
>>>>>> reason why it's faster.
>>>>> Thanks for the detailed info, so the original code skips time-consuming
>>>>> work inside atomic context on purpose. Is there any space to optmise it?
>>>>> If 2 scheduled update worker are handled at almost same time, can one be
>>>>> skipped?
>>>> To my knowledge, there's only one instance of the worker. Re-scheduling
>>>> the worker before a previous instance started, will not create a second
>>>> instance. The worker's instance will complete all pending updates. So in
>>>> some way, skipping workers already happens.
>>> So I think that the most often fbcon update from atomic context is the
>>> blinking cursor. If you disable that one you should be back to the old
>>> performance level I think, since just writing to dmesg is from process
>>> context, so shouldn't change.
>> Hmm, then for the old driver, it should also do the most update in
>> non-atomic context?
>>
>> One other thing is, I profiled that updating a 3MB shadow buffer needs
>> 20 ms, which transfer to 150 MB/s bandwidth. Could it be related with
>> the cache setting of DRM shadow buffer? say the orginal code use a
>> cachable buffer?
>>
>>
>>> https://unix.stackexchange.com/questions/3759/how-to-stop-cursor-from-blinking
>>>
>>> Bunch of tricks, but tbh I haven't tested them.
>> Thomas has suggested to disable curson by
>> 	echo 0 > /sys/devices/virtual/graphics/fbcon/cursor_blink
>>
>> We tried that way, and no change for the performance data.
> There are several ways of disabling the cursor. On my test system, I entered
>
>    tput civis
>
> before the test and got better performance. Did you try this as well?

There's no obvious change on our system.

Best Regards,
Rong Chen

>
> Best regards
> Thomas
>
>> Thanks,
>> Feng
>>
>>> In any case, I still strongly advice you don't print anything to dmesg
>>> or fbcon while benchmarking, because dmesg/printf are anything but
>>> fast, especially if a gpu driver is involved. There's some efforts to
>>> make the dmesg/printk side less painful (untangling the console_lock
>>> from printk), but fundamentally printing to the gpu from the kernel
>>> through dmesg/fbcon won't be cheap. It's just not something we
>>> optimize beyond "make sure it works for emergencies".
>>> -Daniel
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>> Thanks,
>>>>> Feng
>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>
>>>> --
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
>>>> GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
>>>> HRB 21284 (AG Nürnberg)
>>>>
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>>>
>>> -- 
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
>
> _______________________________________________
> LKP mailing list
> LKP@lists.01.org
> https://lists.01.org/mailman/listinfo/lkp


--------------458C2BF2DE9FCB37D3A72795
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Thomas,<br>
    <br>
    <div class="moz-cite-prefix">On 9/4/2019 4:43 PM, Thomas Zimmermann
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:33d3ce15-6221-bd96-3f26-b710e4da6b1a@suse.de">
      <pre class="moz-quote-pre" wrap="">Hi

Am 04.09.19 um 10:35 schrieb Feng Tang:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi Daniel,

On Wed, Sep 04, 2019 at 10:11:11AM +0200, Daniel Vetter wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Wed, Sep 4, 2019 at 8:53 AM Thomas Zimmermann <a class="moz-txt-link-rfc2396E" href="mailto:tzimmermann@suse.de">&lt;tzimmermann@suse.de&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
Hi

Am 04.09.19 um 08:27 schrieb Feng Tang:
</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Thank you for testing. But don't get too excited, because the patch
simulates a bug that was present in the original mgag200 code. A
significant number of frames are simply skipped. That is apparently the
reason why it's faster.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">
Thanks for the detailed info, so the original code skips time-consuming
work inside atomic context on purpose. Is there any space to optmise it?
If 2 scheduled update worker are handled at almost same time, can one be
skipped?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
To my knowledge, there's only one instance of the worker. Re-scheduling
the worker before a previous instance started, will not create a second
instance. The worker's instance will complete all pending updates. So in
some way, skipping workers already happens.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
So I think that the most often fbcon update from atomic context is the
blinking cursor. If you disable that one you should be back to the old
performance level I think, since just writing to dmesg is from process
context, so shouldn't change.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hmm, then for the old driver, it should also do the most update in
non-atomic context? 

One other thing is, I profiled that updating a 3MB shadow buffer needs
20 ms, which transfer to 150 MB/s bandwidth. Could it be related with
the cache setting of DRM shadow buffer? say the orginal code use a
cachable buffer?


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
<a class="moz-txt-link-freetext" href="https://unix.stackexchange.com/questions/3759/how-to-stop-cursor-from-blinking">https://unix.stackexchange.com/questions/3759/how-to-stop-cursor-from-blinking</a>

Bunch of tricks, but tbh I haven't tested them.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Thomas has suggested to disable curson by
	echo 0 &gt; /sys/devices/virtual/graphics/fbcon/cursor_blink

We tried that way, and no change for the performance data.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
There are several ways of disabling the cursor. On my test system, I entered

  tput civis

before the test and got better performance. Did you try this as well?</pre>
    </blockquote>
    <br>
    There's no obvious change on our system.<br>
    <br>
    Best Regards,<br>
    Rong Chen<br>
    <br>
    <blockquote type="cite"
      cite="mid:33d3ce15-6221-bd96-3f26-b710e4da6b1a@suse.de">
      <pre class="moz-quote-pre" wrap="">

Best regards
Thomas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Thanks,
Feng

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
In any case, I still strongly advice you don't print anything to dmesg
or fbcon while benchmarking, because dmesg/printf are anything but
fast, especially if a gpu driver is involved. There's some efforts to
make the dmesg/printk side less painful (untangling the console_lock
from printk), but fundamentally printing to the gpu from the kernel
through dmesg/fbcon won't be cheap. It's just not something we
optimize beyond "make sure it works for emergencies".
-Daniel

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
Best regards
Thomas

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
Thanks,
Feng

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">
Best regards
Thomas
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/dri-devel">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a>

</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)

_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/dri-devel">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a>
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - <a class="moz-txt-link-freetext" href="http://blog.ffwll.ch">http://blog.ffwll.ch</a>
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
LKP mailing list
<a class="moz-txt-link-abbreviated" href="mailto:LKP@lists.01.org">LKP@lists.01.org</a>
<a class="moz-txt-link-freetext" href="https://lists.01.org/mailman/listinfo/lkp">https://lists.01.org/mailman/listinfo/lkp</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------458C2BF2DE9FCB37D3A72795--

--===============0265207972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0265207972==--
