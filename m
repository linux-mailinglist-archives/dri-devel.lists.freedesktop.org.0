Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EFF3E590B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 13:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6456B89C7F;
	Tue, 10 Aug 2021 11:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 36168 seconds by postgrey-1.36 at gabe;
 Tue, 10 Aug 2021 11:26:10 UTC
Received: from smtpproxy21.qq.com (smtpbg701.qq.com [203.205.195.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4B389C7F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 11:26:10 +0000 (UTC)
X-QQ-mid: bizesmtp31t1628594759tu6p5dd4
Received: from [10.10.53.82] (unknown [124.126.19.250])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 10 Aug 2021 19:25:01 +0800 (CST)
X-QQ-SSF: 0040000000200030C000B00A0000000
X-QQ-FEAT: CoFLB+lOOOJ03bnkBnovcjk5d+ve2GH7tifewNdmjt3K78C3TfnbVxro1Pk9P
 AOEDqaCoIbLMmUdiImScWvAu0avh12qXWguw4ZQFG9V+Wnc+T8qGXT2X4XFhOUnzDMEpIFX
 RHX8925Khs4ulvyJhUNkUb1sn6TtgtWtoqq1VNZfAjpThuuCoRrL6TU4mLH2J/SuWrk4V0b
 H8FPwC2/itrDsd6X5d9Vmq7KgfoT988vAcHbavsfv4pq4uzBxKJ3+sVvbcesP8eVMwF8FTw
 jc7WVOL6KIWUuOm5pZwAXASdSrJVVkMPTDp8Lameumm4kuhJmk9+0QYXFRjwKGEUOP/GYhY
 qNAJsnfRUiBVmS8UxNTuaOz7LZduA==
X-QQ-GoodBg: 2
Subject: Re: [PATCH v2] drm/drv: Remove initialization of static variables
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210806023047.24386-1-zhaoxiao@uniontech.com>
 <YRJOCzKVJOfCS4Ro@phenom.ffwll.local>
From: zhaoxiao <zhaoxiao@uniontech.com>
Message-ID: <622b0d89-2d75-8e60-4dd4-3e5fc49f5eb8@uniontech.com>+B320512A2A78F14B
Date: Tue, 10 Aug 2021 19:25:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <YRJOCzKVJOfCS4Ro@phenom.ffwll.local>
Content-Type: multipart/alternative;
 boundary="------------A426B56454A84EBBBCD6BF36"
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
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
--------------A426B56454A84EBBBCD6BF36
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for you advice, and I modify the patch according to your suggestions.

在 2021/8/10 下午5:59, Daniel Vetter 写道:
> On Fri, Aug 06, 2021 at 10:30:47AM +0800, zhaoxiao wrote:
>> Address the following checkpatch errors:
>> ERROR: do not initialise statics to false
>>
>> FILE: :drivers/gpu/drm/msm/msm_drv.c:21:
>> -static bool reglog = false;
>>
>> FILE: :drivers/gpu/drm/msm/msm_drv.c:31:
>> -bool dumpstate = false;
>>
>> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
> Subject should start out with drm/msm, not drm/drv - that would indicate a
> patch touching the drm_drv.c core files, or things related to that.
> -Daniel
>
>> ---
>> v2: change the patch description
>>   drivers/gpu/drm/msm/msm_drv.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index 9b8fa2ad0d84..d9ca4bc9620b 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -59,7 +59,7 @@ static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
>>   };
>>   
>>   #ifdef CONFIG_DRM_MSM_REGISTER_LOGGING
>> -static bool reglog = false;
>> +static bool reglog;
>>   MODULE_PARM_DESC(reglog, "Enable register read/write logging");
>>   module_param(reglog, bool, 0600);
>>   #else
>> @@ -76,7 +76,7 @@ static char *vram = "16m";
>>   MODULE_PARM_DESC(vram, "Configure VRAM size (for devices without IOMMU/GPUMMU)");
>>   module_param(vram, charp, 0);
>>   
>> -bool dumpstate = false;
>> +bool dumpstate;
>>   MODULE_PARM_DESC(dumpstate, "Dump KMS state on errors");
>>   module_param(dumpstate, bool, 0600);
>>   
>> -- 
>> 2.20.1
>>
>>
>>

--------------A426B56454A84EBBBCD6BF36
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Thanks for you advice, and I  <span class="Y2IQFc" lang="en">modify
        the patch according to your suggestions.<br>
      </span></p>
    <div class="moz-cite-prefix">在 2021/8/10 下午5:59, Daniel Vetter 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:YRJOCzKVJOfCS4Ro@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">On Fri, Aug 06, 2021 at 10:30:47AM +0800, zhaoxiao wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Address the following checkpatch errors:
ERROR: do not initialise statics to false

FILE: :drivers/gpu/drm/msm/msm_drv.c:21:
-static bool reglog = false;

FILE: :drivers/gpu/drm/msm/msm_drv.c:31:
-bool dumpstate = false;

Signed-off-by: zhaoxiao <a class="moz-txt-link-rfc2396E" href="mailto:zhaoxiao@uniontech.com">&lt;zhaoxiao@uniontech.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Subject should start out with drm/msm, not drm/drv - that would indicate a
patch touching the drm_drv.c core files, or things related to that.
-Daniel

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">---
v2: change the patch description 
 drivers/gpu/drm/msm/msm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9b8fa2ad0d84..d9ca4bc9620b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -59,7 +59,7 @@ static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 };
 
 #ifdef CONFIG_DRM_MSM_REGISTER_LOGGING
-static bool reglog = false;
+static bool reglog;
 MODULE_PARM_DESC(reglog, "Enable register read/write logging");
 module_param(reglog, bool, 0600);
 #else
@@ -76,7 +76,7 @@ static char *vram = "16m";
 MODULE_PARM_DESC(vram, "Configure VRAM size (for devices without IOMMU/GPUMMU)");
 module_param(vram, charp, 0);
 
-bool dumpstate = false;
+bool dumpstate;
 MODULE_PARM_DESC(dumpstate, "Dump KMS state on errors");
 module_param(dumpstate, bool, 0600);
 
-- 
2.20.1



</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A426B56454A84EBBBCD6BF36--


