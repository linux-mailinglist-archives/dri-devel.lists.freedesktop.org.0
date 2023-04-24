Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B3C6ECBEA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 14:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AD410E4C8;
	Mon, 24 Apr 2023 12:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E9610E40A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 12:17:52 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5050491cb04so6513877a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 05:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682338669; x=1684930669;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H9mfbm+dbpf9TS0Ou+ho3Hm3/Am7ff8ldikg0BEOO8c=;
 b=Fx2Xh4B8a9ZQufp8mXt8s+IpxTfBjlXTDegasscpICbBKAsTvOr3oIbvhMf6WEzit6
 EZHpw4gDhs7SbXoF1aMQ2gYpcpb8sTMFYN8C206nln+9WBQ7wPhq8Cm1ul+S6Krrlso7
 IzliVANvvPM2OlabuVXXWw4zqI6Hf1pEbiKaCsFZq6Mdy89XvBEG/BJ1Ouua2Gx7Hm0+
 RnDrp46igE0rQ+/x0NAP9CyBiH9PHjSoD1G6N380PYNhS6ZQhaGf/8TEMs8o9TDiuZ0c
 CTyEKJvPVUotFqXGfU45joouTxundAG+xfWZv0NcFeENFVjo/CFAjrMsXU0rpJzRB+qB
 eEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682338669; x=1684930669;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H9mfbm+dbpf9TS0Ou+ho3Hm3/Am7ff8ldikg0BEOO8c=;
 b=XLIYj9+Ag7ddclR5RipFK4qxQhQsSRGS0J+EK+CZGC7IF/xJ80a5Fcm/2lADC/+lgU
 hZFZ8O0b8t+hbTHl/T+XXVU6DGjoZb8Mz8QN10C6Egzqq+jZOWClyvcyBZ28DXGlBQX5
 wlziqSUIyVR6dkXxniyjtEHEpj6XWkmwOrjJ23ef8RbEyjVaFAUhWSExKcJTI8vo9a78
 le1D1QL2QkC0tQSelvui0xnr+6DVEbHG7cSFTQ0YMGyhbtq59WddS0oflGHnWhrm8pYg
 XI5h2zuLHgn1icJqvKQgcm6hsO0VcFLqVlkfK5Xl1+V9syXA9ia+zxH7XqcdB6VRJUxG
 vubA==
X-Gm-Message-State: AAQBX9cT1MfJTsdN0NmrYyodwhmuGOih6sLJ6DkXxWizDvYwEy+ILqZD
 auT7HeZTSxPJuNKLRm05E+DB95RMe1GiMg==
X-Google-Smtp-Source: AKy350bWB5Sn5+/nZXvXb0Z9P0V9LHEg53SuNMEB8hHPQ8aiVUlXuhT3c009ZV46oUE1ZBpAmxENdA==
X-Received: by 2002:aa7:c393:0:b0:4fb:4fc2:e600 with SMTP id
 k19-20020aa7c393000000b004fb4fc2e600mr11607995edq.42.1682338668522; 
 Mon, 24 Apr 2023 05:17:48 -0700 (PDT)
Received: from [192.168.178.21] (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 c26-20020a056402121a00b0050673b13b58sm4613816edw.56.2023.04.24.05.17.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 05:17:48 -0700 (PDT)
Message-ID: <49564165-3248-f212-231d-e7130dd61f09@gmail.com>
Date: Mon, 24 Apr 2023 14:17:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/5] drm/debugfs: rework debugfs directory creation v3
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230412145206.2483-1-christian.koenig@amd.com>
 <20230412145206.2483-3-christian.koenig@amd.com>
 <e0803bcf-c447-ad8d-bd1d-af8658cc72c4@habana.ai>
 <5446881a-bdb8-4d85-bf00-c54e001661f1@gmail.com>
 <20230417102624.GB3141290@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230417102624.GB3141290@linux.intel.com>
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
Cc: "quic_jhugo@quicinc.com" <quic_jhugo@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "mcanal@igalia.com" <mcanal@igalia.com>, "mwen@igalia.com" <mwen@igalia.com>,
 Tomer Tayar <ttayar@habana.ai>, "maxime@cerno.tech" <maxime@cerno.tech>,
 "wambui.karugax@gmail.com" <wambui.karugax@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 17.04.23 um 12:26 schrieb Stanislaw Gruszka:
> On Mon, Apr 17, 2023 at 09:18:31AM +0200, Christian König wrote:
>>
>> Am 16.04.23 um 18:03 schrieb Tomer Tayar:
>>> On 12/04/2023 17:52, Christian König wrote:
>>>>     /**
>>>> - * accel_debugfs_init() - Initialize debugfs for accel minor
>>>> + * accel_debugfs_init() - Register debugfs for accel minor
>>>> + * @dev: Pointer to the device instance.
>>>> + *
>>>> + * This function creates a root directory for the device in debugfs.
>>>> + */
>>>> +void accel_debugfs_init(struct drm_device *dev)
>>>> +{
>>>> +	drm_debugfs_dev_init(dev, accel_debugfs_root);
>>>> +}
>>>> +
>>>> +/**
>>>> + * accel_debugfs_register() - Register debugfs for device
>>>>      * @minor: Pointer to the drm_minor instance.
>>>>      * @minor_id: The minor's id
>>>>      *
>>>> - * This function initializes the drm minor's debugfs members and creates
>>>> - * a root directory for the minor in debugfs. It also creates common files
>>>> - * for accelerators and calls the driver's debugfs init callback.
>>>> + * Creates common files for accelerators.
>>>>      */
>>>> -void accel_debugfs_init(struct drm_minor *minor, int minor_id)
>>>> +void accel_debugfs_register(struct drm_device *dev)
>>>>     {
> I wonder if we need this and can not use drm_debugfs_dev_register() ?
> In drm there are two additional files "clients" and "gem_names" which are
> appropriate to accel as well and so far we do not have any accel
> specific files.

I was wondering the same thing while going over this, but then decided 
to leave it as it is for now.

My primary concern is to remove the mid layering with the driver 
callback because that is blocking functionality from working correctly, 
cleanup and re-joining of functionality can then come later on.

Regards,
Christian.

>
> Regards
> Stanislaw

