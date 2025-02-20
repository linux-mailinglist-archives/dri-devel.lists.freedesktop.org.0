Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CEEA3D480
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 10:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351B710E138;
	Thu, 20 Feb 2025 09:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="HOcAUzWq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id E9D2A10E138
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Content-Type:Message-ID:Date:MIME-Version:Subject:
 From; bh=fiWzTImhcJhFkw3iBCtbv+at2+RzmNY+PuuC7fpoIS8=; b=HOcAUzW
 qZZlkrwpWFU5CZEklCLdDlWQxmXIpGa3YhB21UwyAGA1M8LabndbkFyZ398VXhzn
 g3seBJFWBwLEMi0OvTMFebLD8vgtJHxaEYgqkQnItnYTJHvTJlJqCtixID+tViGn
 w+mu3KemcyaqcgnDWBKAmG90khmPpaJbAv4g=
Received: from [10.42.20.80] (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgDH2qbx87ZnurSIAQ--.62101S2;
 Thu, 20 Feb 2025 17:20:50 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------Istq003YC4yLznzx0Dmcs9N2"
Message-ID: <c3b340a6-04fe-adc2-d9e5-be95135aa0ab@163.com>
Date: Thu, 20 Feb 2025 17:20:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/arm/komeda: Add a condition check before removing
 sysfs attribute
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250220085358.232883-1-oushixiong1025@163.com>
 <20250220-tiny-pragmatic-pug-5addfc@houat>
From: Shixiong Ou <oushixiong1025@163.com>
In-Reply-To: <20250220-tiny-pragmatic-pug-5addfc@houat>
X-CM-TRANSID: PygvCgDH2qbx87ZnurSIAQ--.62101S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw1DCF1ktF47JrW5Zw4Dtwb_yoWxZwb_WF
 n5trn8X34Dta9Fgay29Fn3KrWxKa1UKryUJFZ5XF4Sq3W3tws7Zas09r9FgF1j9FZYyFWY
 y3yYqryjyF9YkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREuyI7UUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXRD5D2e25TahOwACsh
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
--------------Istq003YC4yLznzx0Dmcs9N2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2025/2/20 17:12, Maxime Ripard 写道:
> On Thu, Feb 20, 2025 at 04:53:58PM +0800,oushixiong1025@163.com  wrote:
>> From: Shixiong Ou<oushixiong@kylinos.cn>
>>
>> [WHY] If the call to sysfs_create_group() fails, there is
>>        no need to call function sysfs_remove_group().
>>
>> [HOW] Add a condition check before removing sysfs attribute.
>>
>> Signed-off-by: Shixiong Ou<oushixiong@kylinos.cn>
> What are you trying to fix exactly? AFAIK, there's no code path that
> calls komeda_dev_destroy() after komeda_dev_create() has failed.
>
> Maxime

|if calling |||sysfs_create_group() fails, it will go to lable 'err_cleanup:', and it 
will call |komeda_dev_destroy() laterly. thanks, Shixiong Ou. |

--------------Istq003YC4yLznzx0Dmcs9N2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2025/2/20 17:12, Maxime Ripard 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250220-tiny-pragmatic-pug-5addfc@houat">
      <pre class="moz-quote-pre" wrap="">On Thu, Feb 20, 2025 at 04:53:58PM +0800, <a class="moz-txt-link-abbreviated" href="mailto:oushixiong1025@163.com">oushixiong1025@163.com</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Shixiong Ou <a class="moz-txt-link-rfc2396E" href="mailto:oushixiong@kylinos.cn">&lt;oushixiong@kylinos.cn&gt;</a>

[WHY] If the call to sysfs_create_group() fails, there is
      no need to call function sysfs_remove_group().

[HOW] Add a condition check before removing sysfs attribute.

Signed-off-by: Shixiong Ou <a class="moz-txt-link-rfc2396E" href="mailto:oushixiong@kylinos.cn">&lt;oushixiong@kylinos.cn&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What are you trying to fix exactly? AFAIK, there's no code path that
calls komeda_dev_destroy() after komeda_dev_create() has failed.

Maxime
</pre>
    </blockquote>
    <pre style="padding: 0px; margin: 0px; color: rgb(0, 0, 0); font-size: 13.3333px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code>if calling </code><code><code>sysfs_create_group() fails, it will go to lable 'err_cleanup:', and it will call </code>komeda_dev_destroy() laterly.

thanks,
Shixiong Ou.
</code></pre>
    <p></p>
  </body>
</html>

--------------Istq003YC4yLznzx0Dmcs9N2--

