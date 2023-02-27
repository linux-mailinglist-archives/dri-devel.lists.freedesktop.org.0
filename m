Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A116A4161
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 13:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B153310E3B6;
	Mon, 27 Feb 2023 12:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE0710E3B6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 12:06:58 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso1926590pjb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 04:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RrHEMkhyfJhxIny70LQz8hfKlJZxebfX1zWh9JqyY+g=;
 b=Yj28AAZRGZ0QzeoY1TIm9msvcpiSCxy4fSZgwOXT2VeXGJI06XOK23h77Ulc+3TCmM
 rNkgRMyGhy/Nz7m6MzfbagblWRRnEPlUMxlfZpuTFUWsmQ0h4f4Ggcjknk5cExgekM1V
 2mxPQsnd6vZ73yaEmK5lXoUeDgdRefpT+RJFlw0rjV/ucrLSsFtH+1UC914QT2GIKiD7
 HhF1j6JM5ucV9ro0+h5i8WAnohqQJEIstlZmN8k+z8RilWRb9ciHU1pSttJW920WmSJa
 DG4j4YXLUo/Z5QZVvvN2Yvyn5ebvpdQwUiH2VIF9u2aZH1zyZDo77wOtGG4TpWjBYLCA
 6KTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RrHEMkhyfJhxIny70LQz8hfKlJZxebfX1zWh9JqyY+g=;
 b=FOD01XRjKq+QqDfrMdNkS/9skAst9o4HvI7NqdHyxh6+oyG/T4m/g9UNYK439B3Io0
 n9jSJbSbUJDoovSLiZenkUWwLt21aJy2R49r1+16/pv2NBiKtLB2LuMIjat0XC75SK8A
 2xRF90aCAqDvqH6GaoAHCOKABzMBZcE1Q7Wug/QgyLYDn0A6qs5tBM7J4JF2f31FUVa6
 7mIm0f+Za9VXwNR8evGsXZyyZgUiZLW+uJ26YOzcu+1LN0AqONebfL7oeaO9Qvvn42GA
 spPBS1sepJpq5i1MwLLu5REx+1oTuvkC4pe+Q42WeofamPlqFdv48HUHZLDSD63UC3/L
 QIKA==
X-Gm-Message-State: AO0yUKXJ0X1Zz19nmd6nzOTEUvnXYK0JOnqr58PP4luNK9lal3ZhN5Px
 WbfRDAZ7DUw1nEfH13ZewWQ=
X-Google-Smtp-Source: AK7set8NO0asQI/pmISNEICt0Z8cmaKJvOLhp0aqvHqrYnOAzeoc04uOO2eT8MP882N2GR02yXcnAg==
X-Received: by 2002:a05:6a20:2996:b0:c3:2bef:bd62 with SMTP id
 f22-20020a056a20299600b000c32befbd62mr13007016pzh.1.1677499618113; 
 Mon, 27 Feb 2023 04:06:58 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp.
 [106.167.171.201]) by smtp.gmail.com with ESMTPSA id
 w18-20020aa78592000000b005afda149679sm4210430pfn.179.2023.02.27.04.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 04:06:57 -0800 (PST)
Message-ID: <a0d52b30-265e-056e-0e67-6873d2c3b9ee@gmail.com>
Date: Mon, 27 Feb 2023 21:06:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] media: Fix building pdfdocs
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
 <307dbafd-6fe7-1b75-a484-67553529a5e0@gmail.com>
 <20230226114744.7221f460@coco.lan>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230226114744.7221f460@coco.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Airlie <airlied@redhat.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

On Sun, 26 Feb 2023 11:47:44 +0100, Mauro Carvalho Chehab wrote:
> Em Sun, 26 Feb 2023 08:39:32 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
> 
>> [+CC: Jon, linux-doc]
>>
>> On Wed,  8 Feb 2023 10:29:16 +0200, Tomi Valkeinen wrote:
>>> Commit 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats") added
>>> documatation for a few new RGB formats. For some reason these break the
>>> pdfdocs build, even if the same style seems to work elsewhere in the
>>> file.
>>>
>>> Remove the trailing empty dash lines, which seems to fix the issue.
>>>
>>> Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
>>> Reported-by: Akira Yokosawa <akiyks@gmail.com>  
>> Link: https://lore.kernel.org/r/12250823-8445-5854-dfb8-b92c0ff0851e@gmail.com/
>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> ---
>>>
>>> Note: the offending patch was merged via drm tree, so we may want to
>>> apply the fix to the drm tree also.  
>>
>> So, the offending commit is now in mainline without this fix...
>> I believe this build regression -- a real build error of "make pdfdocs"
>> -- should be fixed ASAP.
>>
>> Tomi, Laurent has suggested a typo fix in the Changelog.
>> Can you respin ?
>>
>> Or, Laurent, can you do the fix on your own?
>>
>> Hopefully, the fix can make v6.3-rc1.
> 
> Better to wait for media PR to be handled. There were some changes at
> the documentation that affected the patch. I guess the bug is gone.

You mean the PR at https://lore.kernel.org/lkml/20230226114551.68480d44@coco.lan/ ?
Unfortunately, it has had no effect on this issue.

> If not, we'll need to rebase the patch.

There was no change in Documentation/userspace-api/media/v4l/pixfmt-rgb.rst,
so rebase is not needed.

Should this bug survive v6.3-rc1, I guess this fix could go through
media or doc tree.

Thoughts?

        Thanks, Akira

> 
> Regards,
> Mauro
> 

