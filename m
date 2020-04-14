Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDEE1A9411
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0FB6E86B;
	Wed, 15 Apr 2020 07:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by gabe.freedesktop.org (Postfix) with ESMTP id E02B789BC0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:37:38 +0000 (UTC)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by
 rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee35e95ae7ef07-541ba;
 Tue, 14 Apr 2020 20:37:22 +0800 (CST)
X-RM-TRANSID: 2ee35e95ae7ef07-541ba
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [192.168.0.102] (unknown[112.3.208.246])
 by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee75e95ae80772-e8ef5;
 Tue, 14 Apr 2020 20:37:22 +0800 (CST)
X-RM-TRANSID: 2ee75e95ae80772-e8ef5
Subject: Re: [PATCH] drm/dp_mst: Fix drm_dp_mst_topology.c selftest
 compilation warning
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20200411141740.14584-1-tangbin@cmss.chinamobile.com>
 <CADnq5_MD6LkOEJC-hKKQSAmFAHY7LMZ2WU_ER-ttNrP20AxoQA@mail.gmail.com>
 <87imi2miin.fsf@intel.com>
From: Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <ba9202f9-0373-52e7-9d74-4997e33c516d@cmss.chinamobile.com>
Date: Tue, 14 Apr 2020 20:39:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87imi2miin.fsf@intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0431624816=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0431624816==
Content-Type: multipart/alternative;
 boundary="------------DC925C4A3BC7418B3461611D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------DC925C4A3BC7418B3461611D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jani:

On 2020/4/14 19:08, Jani Nikula wrote:
> On Mon, 13 Apr 2020, Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Mon, Apr 13, 2020 at 5:29 AM Tang Bin <tangbin@cmss.chinamobile.com> wrote:
>>> The struct drm_dp_desc contains struct drm_dp_dpcd_ident, and the struct
>>> drm_dp_dpcd_ident contains the array, so zero-initialization requires a
>>> more couple of braces. In the ARM compiler environment, the compile
>>> warning pointing it out:
>>>      drivers/gpu/drm/drm_dp_mst_topology.c: In function 'drm_dp_mst_dsc_aux_for_port':
>>>      drivers/gpu/drm/drm_dp_mst_topology.c:5494:9: warning: missing braces around initializer [-Wmissing-braces]
>>>        struct drm_dp_desc desc = { 0 };
>>>
>> This seems to vary based on compilers.  Maybe a memset would be better.
> = {}; will do the trick.

Yes, I had already confirmed this on the hardware before I mentioned the 
patch: '{}' or '{{{0}}}' are the same result in this file.But someone 
may query '{}' could not initialize all members, that's why I brought 
'{{{0}}}' up. Both initializations are validated on the hardware.

My environment:

   PC : Ubuntu 16.04

   Hardware : I.MX6ULL

   Tool Chain : arm-linux-gnueabihf-gcc (Linaro GCC 4.9-2017.01) 4.9.4


Thanks

Tang Bin


--------------DC925C4A3BC7418B3461611D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Jani:<br>
    </p>
    <div class="moz-cite-prefix">On 2020/4/14 19:08, Jani Nikula wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87imi2miin.fsf@intel.com">
      <pre class="moz-quote-pre" wrap="">On Mon, 13 Apr 2020, Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexdeucher@gmail.com">&lt;alexdeucher@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Mon, Apr 13, 2020 at 5:29 AM Tang Bin <a class="moz-txt-link-rfc2396E" href="mailto:tangbin@cmss.chinamobile.com">&lt;tangbin@cmss.chinamobile.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
The struct drm_dp_desc contains struct drm_dp_dpcd_ident, and the struct
drm_dp_dpcd_ident contains the array, so zero-initialization requires a
more couple of braces. In the ARM compiler environment, the compile
warning pointing it out:
    drivers/gpu/drm/drm_dp_mst_topology.c: In function 'drm_dp_mst_dsc_aux_for_port':
    drivers/gpu/drm/drm_dp_mst_topology.c:5494:9: warning: missing braces around initializer [-Wmissing-braces]
      struct drm_dp_desc desc = { 0 };

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
This seems to vary based on compilers.  Maybe a memset would be better.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
= {}; will do the trick.</pre>
    </blockquote>
    <p>Yes, I had already confirmed this on the hardware before I
      mentioned the patch: '{}' or '{{{0}}}' are the same result in this
      file.But someone may query '{}' could not initialize all members,
      that's why I brought '{{{0}}}' up. Both initializations are
      validated on the hardware.<br>
    </p>
    <div style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant: normal; font-weight: normal; letter-spacing:
      normal; line-height: normal; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255);">My environment:</div>
    <br style="color: rgb(0, 0, 0); font-size: 14px; font-style: normal;
      font-variant: normal; font-weight: normal; letter-spacing: normal;
      line-height: normal; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255);">
    <div style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant: normal; font-weight: normal; letter-spacing:
      normal; line-height: normal; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255);">  PC : Ubuntu 16.04</div>
    <br style="color: rgb(0, 0, 0); font-size: 14px; font-style: normal;
      font-variant: normal; font-weight: normal; letter-spacing: normal;
      line-height: normal; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255);">
    <div style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant: normal; font-weight: normal; letter-spacing:
      normal; line-height: normal; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255);">  Hardware : I.MX6ULL</div>
    <br style="color: rgb(0, 0, 0); font-size: 14px; font-style: normal;
      font-variant: normal; font-weight: normal; letter-spacing: normal;
      line-height: normal; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255);">
    <div style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant: normal; font-weight: normal; letter-spacing:
      normal; line-height: normal; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255);">  Tool Chain : arm-linux-gnueabihf-gcc (Linaro GCC
      4.9-2017.01) 4.9.4</div>
    <p><br>
    </p>
    <p>Thanks <br>
    </p>
    <p>Tang Bin<br>
    </p>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:87imi2miin.fsf@intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DC925C4A3BC7418B3461611D--



--===============0431624816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0431624816==--


