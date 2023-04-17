Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 545AC6E408C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7C410E352;
	Mon, 17 Apr 2023 07:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BA310E352
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:18:35 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2fa2fc747easo325841f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 00:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681715913; x=1684307913;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uOgsPOg06uTLsO6QrLPZTGQtUlMqcqb0XBJoSHlOgAk=;
 b=snrZ3TwncmNKJvTWJK41ywEFKwrNy/Ol+EdZ2cvQvUc/fnEwtv7Qt9iONGeZMIGjbX
 uBk+QmHyXpHk6hkVqX6BmxjylkfVFIWMRGbWCIXPUBgIFDQw9EP6veFRckN++91IMjwu
 H51OdFjh39ouBAHd2muFX9ObOq8pOhcOSiLSvjKmU6JLztzzPi/T514l3bapDN0m/5Iu
 GTv/Mk8tPEUanMaKQ6Q7eiIqo2XZuTL1/RwMhlngMoHDDd5AE2wfaUNlEo6G6Jn238DY
 TscVAQSsWSoqYQ4iuTsdAcvN6dIxYYQZUZNbpJ/KFgVi+G5iNRwTqjVjY2RF2Q8lkhwT
 xDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681715913; x=1684307913;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uOgsPOg06uTLsO6QrLPZTGQtUlMqcqb0XBJoSHlOgAk=;
 b=IvMyI6mMgGX58JfqErTDhna1EtCW/W0eDGSvIwxs9ZA/qFhGrFN89G5akQpcPRE6oT
 oPGh+b5F2k+5Uzg6kzQqoin7z6qLTgzqqXPoqMXubju8eWnILljc2cUIEDta0zWRV2fs
 5aU5lCvkkWzv+MTSB6EkDkfvHwMOc9hi/sb76zrCGH8Dev9DWgpE8R64ibRUZKB/s5YM
 64IZJOKBcAillMmkElJjNzbu3lArnwHYkH9apL3H8Myv5N+AYFmVOXaLYzaXA2ngNxQ2
 DHxi9dDV2hDUGPVyf+/Sq7UJJGunA4HbsGgOA4jsZ7guoavGIUIXUl9JmIo0KJk84y/k
 3fbg==
X-Gm-Message-State: AAQBX9eWjoayu19egbef7LGOpXIbukZoRyfzdLfEvmhoqna24ciJ7HoC
 F1uCg4rTgOo5G4oOUQU0yyA=
X-Google-Smtp-Source: AKy350YPv0if8PoRZKRNXCgS6IFAr8eBxnjxYhlwZJiw/D7z7hoEx4qt0xQydvUQqplpjQtWrySoCQ==
X-Received: by 2002:a5d:69c8:0:b0:2ee:e47e:9014 with SMTP id
 s8-20020a5d69c8000000b002eee47e9014mr5081646wrw.1.1681715913306; 
 Mon, 17 Apr 2023 00:18:33 -0700 (PDT)
Received: from [192.168.178.21] (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a056000181900b002f90a75b843sm4419519wrh.117.2023.04.17.00.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 00:18:32 -0700 (PDT)
Message-ID: <5446881a-bdb8-4d85-bf00-c54e001661f1@gmail.com>
Date: Mon, 17 Apr 2023 09:18:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/5] drm/debugfs: rework debugfs directory creation v3
Content-Language: en-US
To: Tomer Tayar <ttayar@habana.ai>, "mcanal@igalia.com" <mcanal@igalia.com>,
 "stanislaw.gruszka@linux.intel.com" <stanislaw.gruszka@linux.intel.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "quic_jhugo@quicinc.com" <quic_jhugo@quicinc.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "mwen@igalia.com" <mwen@igalia.com>, "maxime@cerno.tech"
 <maxime@cerno.tech>, "wambui.karugax@gmail.com" <wambui.karugax@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20230412145206.2483-1-christian.koenig@amd.com>
 <20230412145206.2483-3-christian.koenig@amd.com>
 <e0803bcf-c447-ad8d-bd1d-af8658cc72c4@habana.ai>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <e0803bcf-c447-ad8d-bd1d-af8658cc72c4@habana.ai>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 16.04.23 um 18:03 schrieb Tomer Tayar:
> On 12/04/2023 17:52, Christian König wrote:
>>    /**
>> - * accel_debugfs_init() - Initialize debugfs for accel minor
>> + * accel_debugfs_init() - Register debugfs for accel minor
>> + * @dev: Pointer to the device instance.
>> + *
>> + * This function creates a root directory for the device in debugfs.
>> + */
>> +void accel_debugfs_init(struct drm_device *dev)
>> +{
>> +	drm_debugfs_dev_init(dev, accel_debugfs_root);
>> +}
>> +
>> +/**
>> + * accel_debugfs_register() - Register debugfs for device
>>     * @minor: Pointer to the drm_minor instance.
>>     * @minor_id: The minor's id
>>     *
>> - * This function initializes the drm minor's debugfs members and creates
>> - * a root directory for the minor in debugfs. It also creates common files
>> - * for accelerators and calls the driver's debugfs init callback.
>> + * Creates common files for accelerators.
>>     */
>> -void accel_debugfs_init(struct drm_minor *minor, int minor_id)
>> +void accel_debugfs_register(struct drm_device *dev)
>>    {
> Maybe the accel_debugfs_init() description should now be "Initialize
> debugfs for device"?

Good point, going to adjust that as well.

Thanks,
Christian.
