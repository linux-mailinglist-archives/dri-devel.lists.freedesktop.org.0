Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F93A4A58E4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 10:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4D210EA21;
	Tue,  1 Feb 2022 09:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691CB10E5B7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 16:38:17 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id u6so27999046lfm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 08:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AIOLUSIJu0tNp0OuaV9P5L9B3qaObFHnZycKiVkaU1A=;
 b=64X94uv2GH6qSSKTOedtresZbziebe8LNz//gjVK5gXLXntHF6gFaSY2yq9aSpj3fl
 q+Scl/+1/aE58Fnf0PmqwEmDzMztFQulvCQmY1kcKd5/pekrhvDwi1EfDaDA2a6bqW1v
 7Ly3w260lrbuYKkvVH5sRXcHzRRIdW03HgvFRVcj9vZ/y6zZCqreLokXL3AXqbyF9LmU
 sdhVHteMGk2zR7r9Tc+dBwkGTcS7y4HkYycT1xARbt/MjFyL7Tt3JGPtXr2a7iQETSGn
 RHFeF9j+NZvss75Gb+Z0Y9kem8rsYZ79mDBYvBKhR4L9ff84UUPKcxv+gicOYEM+UK4I
 Njtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AIOLUSIJu0tNp0OuaV9P5L9B3qaObFHnZycKiVkaU1A=;
 b=7RLiqy1nMtrQOsOwyy5u2G7y/pCA+bCwK3GhL8U3MWspm3Tuh+RgDzsD/1UU65Rh+b
 Q1eTah8frfmS/Kzh2j3/Ssa72dy2Lfv9cdFkcEE4hb3Nvv0b9nR0bBMXd+KnCVo+9hpK
 ZGiEX0pBK9ekmPxKHkdu7mj8bM7p8bLOYX9j0n5aMJNbaK2y5+LBXLO3Z5rS82S35uIa
 etq7DlgslSTIFayiBtvSHule9iy6ggEXVu6NxO8/udt1TpGTUSnvLcoyS+sWkM4CDWAV
 uTh4LJhuc7dWWn4yJ1Z+52ozP6ee3PUDoQcl+B33osoy64F1xS1peCrd09lYPdW6SMqd
 +O2Q==
X-Gm-Message-State: AOAM530y7aOKli9ZRawhQpjcW6yAHlaKxt464iz4o8kmXlmTlam75J56
 cGMiZK9eXGHB42HOE1+JuaBsug==
X-Google-Smtp-Source: ABdhPJyoCcErQX0vsg98FdoDAMuRvyMa+2GRoObUDbZMEQ+bUB/ipXLT4CCABJpkI1hQHUdkoPexXg==
X-Received: by 2002:a05:6512:3e18:: with SMTP id
 i24mr15837511lfv.522.1643647095637; 
 Mon, 31 Jan 2022 08:38:15 -0800 (PST)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id r14sm3704681lfr.129.2022.01.31.08.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 08:38:14 -0800 (PST)
Message-ID: <a7d0b013-6114-07b3-0a7b-0d17db8a3982@cogentembedded.com>
Date: Mon, 31 Jan 2022 19:38:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/bridge_connector: enable HPD by default if supported
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20211225063151.2110878-1-nikita.yoush@cogentembedded.com>
 <Yczy3UYpU2UMFQ6N@pendragon.ideasonboard.com>
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <Yczy3UYpU2UMFQ6N@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 01 Feb 2022 09:01:14 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> Hotplug events reported by bridge drivers over drm_bridge_hpd_notify()
>> get ignored unless somebody calls drm_bridge_hpd_enable(). When the
>> connector for the bridge is bridge_connector, such a call is done from
>> drm_bridge_connector_enable_hpd().
>>
>> However drm_bridge_connector_enable_hpd() is never called on init paths,
>> documentation suggests that it is intended for suspend/resume paths.
> 
> Hmmmm... I'm in two minds about this. The problem description is
> correct, but I wonder if HPD should be enabled unconditionally here, or
> if this should be left to display drivers to control.
> drivers/gpu/drm/imx/dcss/dcss-kms.c enables HPD manually at init time,
> other drivers don't.
> 
> It feels like this should be under control of the display controller
> driver, but I can't think of a use case for not enabling HPD at init
> time. Any second opinion from anyone ?

Hi.

Can we somehow move forward here?..
