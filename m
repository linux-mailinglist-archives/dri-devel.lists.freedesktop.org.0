Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE72430C7E
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 23:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F166E581;
	Sun, 17 Oct 2021 21:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 588 seconds by postgrey-1.36 at gabe;
 Sun, 17 Oct 2021 17:39:51 UTC
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345A86E7E2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 17:39:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------SDsJyPngrMmYYD0rh0GP8nvH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1634491800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AN1s7KnukBrj9d/Itf7F0ED/FxN2cJIq4NlZ2WzqUNM=;
 b=MhZ/bc8kjaVk4hl1NYtwhztpj0QyNBlGtn2Dn48jvF5R2ATUaphAmDsJCumCut8Rs/QfIv
 h0rJctdUcBxM31AGePv6xPUzpLbzR+j664vnfASTB3qr3+ZzSy7jD2crofQA3a6aNe9Pid
 BHOgPKxF0085Gz4aXqTh8GZdZpGpXs1Df8yTjzqNtbBj1fjDlWc/Uy/hOkLmZmBU9K4WLP
 6b7on1zykdH+Tf5YyaFr/L2OFG7GhIm7fk2XzUwDYbsyAS4NWotFlpV0hdtt+E5hLmMAnt
 E6hs/VaPQ0y/PmYj3KKoOm7PgzYb07sLjp82UyfuIw8YfRsli8N6LLhx0GqLfQ==
Message-ID: <bf9ddc2a-b3ce-3c07-2c63-c73ae427d648@manjaro.org>
Date: Sun, 17 Oct 2021 19:29:58 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/panel:Adjust sync values for Feixin K101-IM2BYL02
 panel
Content-Language: da-DK
To: Sam Ravnborg <sam@ravnborg.org>
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, Marius Gripsgard <marius@ubports.com>
References: <20210818214818.298089-1-strit@manjaro.org>
 <YWxcMPo9PzsIsMRZ@ravnborg.org>
From: Dan Johansen <strit@manjaro.org>
Organization: Manjaro ARM
In-Reply-To: <YWxcMPo9PzsIsMRZ@ravnborg.org>
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=strit@manjaro.org smtp.mailfrom=strit@manjaro.org
X-Mailman-Approved-At: Sun, 17 Oct 2021 21:55:07 +0000
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
--------------SDsJyPngrMmYYD0rh0GP8nvH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for applying.

Den 17.10.2021 kl. 19.24 skrev Sam Ravnborg:
> Hi Dan,
>
> On Wed, Aug 18, 2021 at 11:48:18PM +0200, Dan Johansen wrote:
>> This adjusts sync values according to the datasheet
>>
>> Fixes: 	1c243751c095bb95e2795f076ea7a0bcdd60a93a ("drm/panel: ilitek-ili9881c: add support for Feixin K101-IM2BYL02 panel")
>> Co-developed-by: Marius Gripsgard<marius@ubports.com>
>> Signed-off-by: Dan Johansen<strit@manjaro.org>
> Sorry for not picking this up sooner - I have been away for a while.
>
> The patch is now applied to drm-misc-fixes and will show up in the
> upstream kernel in 1-2 week from now.
> I updated the subject and the fixes tag while applying.
Thanks.
>
> The Co-developed-by: is supposed to be paired with a Signed-off-by:
> by the same person. Something to do right next time.
Didn't know that. Thanks, will remember for next time!
>
> 	Sam
>
>> ---
>>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
>> index 0145129d7c66..534dd7414d42 100644
>> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
>> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
>> @@ -590,14 +590,14 @@ static const struct drm_display_mode k101_im2byl02_default_mode = {
>>   	.clock		= 69700,
>>   
>>   	.hdisplay	= 800,
>> -	.hsync_start	= 800 + 6,
>> -	.hsync_end	= 800 + 6 + 15,
>> -	.htotal		= 800 + 6 + 15 + 16,
>> +	.hsync_start	= 800 + 52,
>> +	.hsync_end	= 800 + 52 + 8,
>> +	.htotal		= 800 + 52 + 8 + 48,
>>   
>>   	.vdisplay	= 1280,
>> -	.vsync_start	= 1280 + 8,
>> -	.vsync_end	= 1280 + 8 + 48,
>> -	.vtotal		= 1280 + 8 + 48 + 52,
>> +	.vsync_start	= 1280 + 16,
>> +	.vsync_end	= 1280 + 16 + 6,
>> +	.vtotal		= 1280 + 16 + 6 + 15,
>>   
>>   	.width_mm	= 135,
>>   	.height_mm	= 217,
>> -- 
>> 2.32.0
-- 
Kind regards
*Dan Johansen*
Project lead of the *Manjaro ARM* project
Manjaro-ARM <https://manjaro.org>
--------------SDsJyPngrMmYYD0rh0GP8nvH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Thanks for applying.<br>
    </p>
    <div class="moz-cite-prefix">Den 17.10.2021 kl. 19.24 skrev Sam
      Ravnborg:<br>
    </div>
    <blockquote type="cite" cite="mid:YWxcMPo9PzsIsMRZ@ravnborg.org">
      <pre class="moz-quote-pre" wrap="">Hi Dan,

On Wed, Aug 18, 2021 at 11:48:18PM +0200, Dan Johansen wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This adjusts sync values according to the datasheet

Fixes: 	1c243751c095bb95e2795f076ea7a0bcdd60a93a ("drm/panel: ilitek-ili9881c: add support for Feixin K101-IM2BYL02 panel")
Co-developed-by: Marius Gripsgard <a class="moz-txt-link-rfc2396E" href="mailto:marius@ubports.com">&lt;marius@ubports.com&gt;</a>
Signed-off-by: Dan Johansen <a class="moz-txt-link-rfc2396E" href="mailto:strit@manjaro.org">&lt;strit@manjaro.org&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Sorry for not picking this up sooner - I have been away for a while.

The patch is now applied to drm-misc-fixes and will show up in the
upstream kernel in 1-2 week from now.
I updated the subject and the fixes tag while applying.</pre>
    </blockquote>
    Thanks.<br>
    <blockquote type="cite" cite="mid:YWxcMPo9PzsIsMRZ@ravnborg.org">
      <pre class="moz-quote-pre" wrap="">

The Co-developed-by: is supposed to be paired with a Signed-off-by:
by the same person. Something to do right next time.</pre>
    </blockquote>
    Didn't know that. Thanks, will remember for next time!<br>
    <blockquote type="cite" cite="mid:YWxcMPo9PzsIsMRZ@ravnborg.org">
      <pre class="moz-quote-pre" wrap="">

	Sam

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 0145129d7c66..534dd7414d42 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -590,14 +590,14 @@ static const struct drm_display_mode k101_im2byl02_default_mode = {
 	.clock		= 69700,
 
 	.hdisplay	= 800,
-	.hsync_start	= 800 + 6,
-	.hsync_end	= 800 + 6 + 15,
-	.htotal		= 800 + 6 + 15 + 16,
+	.hsync_start	= 800 + 52,
+	.hsync_end	= 800 + 52 + 8,
+	.htotal		= 800 + 52 + 8 + 48,
 
 	.vdisplay	= 1280,
-	.vsync_start	= 1280 + 8,
-	.vsync_end	= 1280 + 8 + 48,
-	.vtotal		= 1280 + 8 + 48 + 52,
+	.vsync_start	= 1280 + 16,
+	.vsync_end	= 1280 + 16 + 6,
+	.vtotal		= 1280 + 16 + 6 + 15,
 
 	.width_mm	= 135,
 	.height_mm	= 217,
-- 
2.32.0
</pre>
      </blockquote>
    </blockquote>
    <div class="moz-signature">-- <br>
      Kind regards <br>
      <b>Dan Johansen</b> <br>
      Project lead of the <b>Manjaro ARM</b> project<br>
      <a href="https://manjaro.org">Manjaro-ARM</a></div>
  </body>
</html>
--------------SDsJyPngrMmYYD0rh0GP8nvH--

