Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AE18B3507
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 12:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1655B10FBC6;
	Fri, 26 Apr 2024 10:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="F2nE/olS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com
 [95.215.58.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBAC10FBC6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 10:11:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------SfX8gHvpJ42HNCrKrIEmHalF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714126316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OyuUlQqD6cFhFEnkyPE+mZbM5k2NW+MLbfYE6KClSX8=;
 b=F2nE/olSxN8uQHP5hNSoIz3nqApmRT1D3Zq05yMqBS8yCAXv8An7un2EBqFzH5dwZG4VFH
 8Isdn+d3StzJ+68JliZasmTfDLHbAV7+oe4/wWUIcvcbw3JEHY4nAPod2n4J34gZyWaE/j
 WOdCFVieugKUi0cbSvvMQwednVCttAA=
Message-ID: <207ec54f-3309-2801-1279-f9c379e7c95e@linux.dev>
Date: Fri, 26 Apr 2024 18:11:38 +0800
MIME-Version: 1.0
Subject: Re: [v1,1/3] drm/panel: ili9341: Correct use of device property APIs
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240425142706.2440113-2-andriy.shevchenko@linux.intel.com>
 <c2d41916-0b6c-43b5-98eb-514eb0511f84@linux.dev>
 <ZiqqiAztCaiAgI8e@smile.fi.intel.com>
 <2599705c-0a64-4742-b1d7-330e9fde6e7a@linux.dev>
 <20240426-married-augmented-mantis-ff7edd@penduick>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240426-married-augmented-mantis-ff7edd@penduick>
X-Migadu-Flow: FLOW_OUT
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
--------------SfX8gHvpJ42HNCrKrIEmHalF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,


On 2024/4/26 14:23, Maxime Ripard wrote:
> Hi,
>
> On Fri, Apr 26, 2024 at 04:43:18AM +0800, Sui Jingfeng wrote:
>> On 2024/4/26 03:10, Andy Shevchenko wrote:
>>> On Fri, Apr 26, 2024 at 02:08:16AM +0800, Sui Jingfeng wrote:
>>>> On 2024/4/25 22:26, Andy Shevchenko wrote:
>>>>> It seems driver missed the point of proper use of device property APIs.
>>>>> Correct this by updating headers and calls respectively.
>>>> You are using the 'seems' here exactly saying that you are not 100% sure.
>>>>
>>>> Please allow me to tell you the truth: This patch again has ZERO effect.
>>>> It fix nothing. And this patch is has the risks to be wrong.
>>> Huh?! Really, stop commenting the stuff you do not understand.
>> I'm actually a professional display drivers developer at the downstream
>> in the past, despite my contribution to upstream is less. But I believe
>> that all panel driver developers know what I'm talking about. So please
>> have take a look at my replies.
> Most of the interactions you had in this series has been uncalled for.


Right, this paragraph is a little bit of not relevant to the technique point involved. My bad.


> You might be against a patch,


I'm not rejecting, I'm actually appreciate the original motivation of this series.
Its motivation is good, as it helps to move things forward. And it is definitely
a nice cleanup.

> but there's no need to go to such length.


Yeah, this is my problem.

> As far as I'm concerned, this patch is fine to me in itself, and I don't
> see anything that would prevent us from merging it.


And I think you are right, the codes inside the patch is good enough. I would like
to respect your decision then.


> Maxime
--------------SfX8gHvpJ42HNCrKrIEmHalF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2024/4/26 14:23, Maxime Ripard
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240426-married-augmented-mantis-ff7edd@penduick">
      <pre class="moz-quote-pre" wrap="">Hi,

On Fri, Apr 26, 2024 at 04:43:18AM +0800, Sui Jingfeng wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 2024/4/26 03:10, Andy Shevchenko wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Fri, Apr 26, 2024 at 02:08:16AM +0800, Sui Jingfeng wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 2024/4/25 22:26, Andy Shevchenko wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">It seems driver missed the point of proper use of device property APIs.
Correct this by updating headers and calls respectively.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">You are using the 'seems' here exactly saying that you are not 100% sure.

Please allow me to tell you the truth: This patch again has ZERO effect.
It fix nothing. And this patch is has the risks to be wrong.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Huh?! Really, stop commenting the stuff you do not understand.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I'm actually a professional display drivers developer at the downstream
in the past, despite my contribution to upstream is less. But I believe
that all panel driver developers know what I'm talking about. So please
have take a look at my replies.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Most of the interactions you had in this series has been uncalled for.</pre>
    </blockquote>
    <p><br>
    </p>
    <pre>Right, this paragraph is a little bit of not relevant to the technique point involved. My bad.
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20240426-married-augmented-mantis-ff7edd@penduick">
      <pre class="moz-quote-pre" wrap="">
You might be against a patch, </pre>
    </blockquote>
    <p><br>
    </p>
    <pre>I'm not rejecting, I'm actually appreciate the original motivation of this series.
Its motivation is good, as it helps to move things forward. And it is definitely
a nice cleanup.

</pre>
    <blockquote type="cite"
      cite="mid:20240426-married-augmented-mantis-ff7edd@penduick">
      <pre class="moz-quote-pre" wrap="">but there's no need to go to such length.
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre>Yeah, this is my problem.

</pre>
    <blockquote type="cite"
      cite="mid:20240426-married-augmented-mantis-ff7edd@penduick">
      <pre class="moz-quote-pre" wrap="">
As far as I'm concerned, this patch is fine to me in itself, and I don't
see anything that would prevent us from merging it.
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre>And I think you are right, the codes inside the patch is good enough. I would like
to respect your decision then.
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20240426-married-augmented-mantis-ff7edd@penduick">
      <pre class="moz-quote-pre" wrap="">
Maxime
</pre>
    </blockquote>
  </body>
</html>

--------------SfX8gHvpJ42HNCrKrIEmHalF--
