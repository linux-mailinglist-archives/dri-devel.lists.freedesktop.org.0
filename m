Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 751AA5B8DAB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 18:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C9210E998;
	Wed, 14 Sep 2022 16:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4749510E998
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 16:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663174746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8eAE9HpKpIVvmOEFXUeeAc8cv8ndkWqJta1h5pXlw4I=;
 b=htB1+QxvhQyn20/KrKl8hoVunrDNiZQrO6ypkapEBdKIxQdLO+d6eCq/9w2WWdnlhpoAf7
 wlpdCAIb56cNsT2XbFxVGFG9OD5zqbR2griwA7HsFLFUB6sZbOsdByj97DpOQHut9cKa1e
 4kuMetPS8w+bDpbzJOD0mp2sqxEBmh8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-31-JFTsbuWUPCqDraanSwjLvg-1; Wed, 14 Sep 2022 12:59:02 -0400
X-MC-Unique: JFTsbuWUPCqDraanSwjLvg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c5-20020a7bc005000000b003a63a3570f2so5623551wmb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 09:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=8eAE9HpKpIVvmOEFXUeeAc8cv8ndkWqJta1h5pXlw4I=;
 b=ESC4drNwj+FRNnAWOTSc2S4N1EYcXWpF+8nebcbogsHhNNHgtMx7cQ6sR5iLqa38NB
 6+nxF1PKNRmVplu8m189fnNeOuK7uOSp4F7HN6tySQbWk5vwfn02bjGSceaYGLrKRFO2
 IS+iXu0u+Y/vrNmXci4FqYckRkyGBo+ideqhdRAm56wUQyKBQh0TCcdqSgvt0B2ji42S
 8DJ0lNWnyG7t+ri8I1DUTLtUdcm2dtVVzBhd9ayHc2z//VcoNMFUt1eOIDnO9QpCd6lP
 NDwHXFpv5KuKzgwKWtLExsThrgaA3hyIO6C5mAJd+X+LnUO2law93/9uTcZW2Drv2NpC
 fSoQ==
X-Gm-Message-State: ACgBeo2yxHBMPnKOjV7t4+OR6VJZnaGYAUYdq8v95DCg6MIjSbRHeM0H
 RZzOjH3ZqeSloWui2Qs5LDE6sDT0bp9A/USmrsBbEOQvEq+5wwtdjVPlfR0edlSem5VPzcBeqP+
 p7mRhqIdOrPr92b74QeIDmb7Fd8xG
X-Received: by 2002:adf:f211:0:b0:228:d6a4:3510 with SMTP id
 p17-20020adff211000000b00228d6a43510mr21648612wro.448.1663174741051; 
 Wed, 14 Sep 2022 09:59:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4/hMrbSSVrICYCjqMv7OHktLT/ShhknRc4TABv3IGMoKgXGV5RhWzuT4s56YrRzLlwdjxauA==
X-Received: by 2002:adf:f211:0:b0:228:d6a4:3510 with SMTP id
 p17-20020adff211000000b00228d6a43510mr21648581wro.448.1663174740767; 
 Wed, 14 Sep 2022 09:59:00 -0700 (PDT)
Received: from [172.16.38.152] ([185.122.133.20])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a05600c3b1700b003b477532e66sm6954615wms.2.2022.09.14.09.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Sep 2022 09:58:59 -0700 (PDT)
Message-ID: <2b7693c4-b04e-425a-2f87-c4b12fa2f63b@redhat.com>
Date: Wed, 14 Sep 2022 17:58:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [GIT PULL] Immutable backlight-detect-refactor branch between
 acpi, drm-* and pdx86
To: Maxime Ripard <maxime@cerno.tech>
References: <261afe3d-7790-e945-adf6-a2c96c9b1eff@redhat.com>
 <20220914112933.64ovljgsrv2l25rs@penduick>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220914112933.64ovljgsrv2l25rs@penduick>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Karol Herbst <kherbst@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@redhat.com>, Len Brown <lenb@kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Mark Gross <markgross@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Xinhui <Xinhui.Pan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/14/22 12:29, Maxime Ripard wrote:
> Hi Hans,
> 
> On Mon, Sep 05, 2022 at 10:35:47AM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Now that all patches have been reviewed/acked here is an immutable backlight-detect-refactor
>> branch with 6.0-rc1 + the v5 patch-set, for merging into the relevant (acpi, drm-* and pdx86)
>> subsystems.
>>
>> Please pull this branch into the relevant subsystems.
>>
>> I will merge this into the review-hans branch of the pdx86 git tree today and
>> from there it will move to for-next once the builders have successfully build-tested
>> the merge.
> 
> I merged it into drm-misc-next, thanks!

Great, thank you!

Regards,

Hans

