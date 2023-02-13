Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A20695137
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 21:00:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8182510E17C;
	Mon, 13 Feb 2023 19:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A16810E0B1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 19:59:54 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id dr8so34583512ejc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 11:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SFuSzT0jxoph4+E0IB50ZKoXNK5N9/vOwPAZrxfBD9c=;
 b=m7vn2fMVd4EGs/UvatS1s+s0Z+3/fTtnLogm7JxjbjeM5VniZUylQDEUXd0L4mbWoi
 Lr0H5988CyNq0MJQWhKr7/LHwA8jlaCQ5jI8hYPZg3U7agHURRXM8nxsI2rYLdzgaK4a
 b2LzTS9P9Tx6zb6oSginB4vWzrJyePTBQEwg169Hwz1iH20xVN3pGrCGMUfhKC7Jzg10
 yMHczPzA1NlbQfDe+4JsbVD9kKa3R/o5WfzuRfRnGdeyAjV8vItSTYdxindNH5ZHOYOl
 /9vljKH7eGfuTJv+2sShQuLhZi6QrKg1nr8o+kMkrrGSPFd6nY/UIniDa9xHl2sUMSt6
 3Kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SFuSzT0jxoph4+E0IB50ZKoXNK5N9/vOwPAZrxfBD9c=;
 b=MnczPeRBcYi6ktJES+8szTfAZ0fMFd3yZM+JhbUpuH6GBmZLtn/qv1Uc2GgAoRHD0P
 Obh+qkb0KIPcqbI1Iyn5ExyYeQsf1OWRwRy+kewbXqO1EifFlY/XO5i6pL9I6+OuqbYH
 Udjmyxk0OVNGICpMLOnAm7kHaNrxnxi46nxqeQvSjMm31Vwll12VkH4zkC8NFz5MiF5O
 FNTxRIXhXtb/8hyJulbm+ko6ir2zl2QNaMGsAukYS2SXPLafORRD0rMMsdBxPT5ka0/2
 fWnM4M9us03Wcbm5TDG1+g2EdLJjUPvE1h1wvbOLE6/dDzWI68fHJ75fJOzc6Ip2wXwP
 SQcw==
X-Gm-Message-State: AO0yUKUQ4MK3DvjisQwoChN+DoYnlBbSteul9AglSeYzgWwxT42UnaV0
 4NTWCEDCddm04spqFm7zIWY=
X-Google-Smtp-Source: AK7set/1NYJfZS2yvrLrQNeyHqqRgt/6Qr5v0ZabpNhvd8AKJLuPStK3SGyOAUr5nCNNqFuiybimzQ==
X-Received: by 2002:a17:906:eb4b:b0:8b1:22af:b39f with SMTP id
 mc11-20020a170906eb4b00b008b122afb39fmr159443ejb.13.1676318392532; 
 Mon, 13 Feb 2023 11:59:52 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:9080:6244:6394:500a?
 ([2a02:908:1256:79a0:9080:6244:6394:500a])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a170906179400b008b12413cf38sm443622eje.220.2023.02.13.11.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 11:59:51 -0800 (PST)
Message-ID: <15d1cff1-e48e-ae1a-4121-92bb74060785@gmail.com>
Date: Mon, 13 Feb 2023 20:59:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Try to address the drm_debugfs issues
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <0d9c852b-8639-55f4-4ec1-ca24f72d72f7@igalia.com>
 <4161ae4e-549c-00f6-5f37-f635a9cb775d@gmail.com>
 <613b9aec-7105-ca2d-13cd-16ddd85a6fda@igalia.com>
 <20230213181651.GA2822143@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230213181651.GA2822143@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 mairacanal@riseup.net, maxime@cerno.tech, wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.02.23 um 19:16 schrieb Stanislaw Gruszka:
> On Thu, Feb 09, 2023 at 10:06:25AM -0300, Maíra Canal wrote:
>>>> [    3.872026] debugfs: File 'v3d_ident' in directory '0' already present!
>>>> [    3.872064] debugfs: File 'v3d_ident' in directory '128' already present!
>>>> [    3.872078] debugfs: File 'v3d_regs' in directory '0' already present!
>>>> [    3.872087] debugfs: File 'v3d_regs' in directory '128' already present!
>>>> [    3.872097] debugfs: File 'measure_clock' in directory '0' already present!
>>>> [    3.872105] debugfs: File 'measure_clock' in directory '128' already present!
>>>> [    3.872116] debugfs: File 'bo_stats' in directory '0' already present!
>>>> [    3.872124] debugfs: File 'bo_stats' in directory '128' already present!
>>>>
>>>> It looks like the render node is being added twice, since this doesn't happen
>>>> for vc4 and vkms.
>>> Thanks for the feedback and yes that's exactly what I meant with that I haven't looked into all code paths.
>>>
>>> Could it be that v3d registers it's debugfs files from the debugfs_init callback?
>> Although this is true, I'm not sure if this is the reason why the files are
>> being registered twice, as this doesn't happen to vc4, and it also uses the
>> debugfs_init callback. I believe it is somewhat related to the fact that
>> v3d is the primary node and the render node.
> Yes, this seems to be because ->debugfs_init = v3d_debugfs_init() uses
> drm_debugfs_add_files() which create files for both primary and render.
> And ->debugfs_init is called via drm_minor_register() also for both
> when registering.
>
> Probably need to change debugfs_init callback to create files just
> for one minor. And if we don't want to use minor pointer directly in
> drivers, the callback can take debugfs dir as argument.

Well the intention of Maira's and my work is to get rid of the callback 
altogether.

So far nobody came up with an argument why we should keep the 
distinction of the debugfs directories into primary and render node. I 
will just go ahead and remove that.

This way we will have the callback used only once and can slowly 
deprecate it.

Regards,
Christian.

>
> Regards
> Stanislaw

