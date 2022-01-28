Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D294D49F7E8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 12:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C8210EF1D;
	Fri, 28 Jan 2022 11:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B2010EEFC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 11:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643368149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=35G0EZH/o9dD2crtrnjLKHLlwbAMq77uRxgBW+YN2gA=;
 b=BQEkv8S6mM3zkeWHZMmBR2u9CELc+3S+p6HDdiO248GOLo53LPGbJkdwSvb6Cc3a7o96fd
 yrm7J5FsS3OD1/3ZDIkMiq853lhIemsQlh55gz80qilpv74m284v/CRAL1O9XZ7E9OsPNy
 4dcFkEJ3pJDGp/3OmGu3cuVdVeczzrs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-TqDghe7QPt6y0z2MuvtxNg-1; Fri, 28 Jan 2022 06:09:07 -0500
X-MC-Unique: TqDghe7QPt6y0z2MuvtxNg-1
Received: by mail-wm1-f70.google.com with SMTP id
 q125-20020a1c4383000000b003503e10c027so1348287wma.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 03:09:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=35G0EZH/o9dD2crtrnjLKHLlwbAMq77uRxgBW+YN2gA=;
 b=KhCvE7T56MKG9aTy+otME7IU2v/TGFsYPPV4k5iqLKrLk3h3Izi01LA0VwKPgtPhaB
 acBMh+EJDZTKzls0+Irdj/KLwUaUXq0ZFzOmRkjEzT0L2W6i989q7vNVXdnGzMLOUqVV
 P7X8mWA0stXhl2G2PnaKW6t7rrsKRzsvmK3Tdwz6Om2CRHzVMBEtFKvxSkEcJM/VRQ/d
 piYARJIQWgvGXPzSu7qRzWUDIsipV4RjIx92nX47wtrDQWCaI0ztmk+hCCWe43wl2iHt
 wxvmV7IT5r5vgCw4D9JpBsC6KskuXBnTAvEiC9izbMC8CX3S1TIALDeIT5yx/XbMclM2
 EcKw==
X-Gm-Message-State: AOAM533scXP6DyHSfDKSIAhw7/emDgMKSoiEDyBBwTytxItUTggfqgRP
 nz2hNKF5ceEbT2SBbkwOQ9fVRuELKLXfpYYhDKLgbxEVOQygwEu3yjBi+hD03iLcwTDyFT8Vg2m
 Bo8OzkOdsYeXxum3BK9Ny24U/fMv9
X-Received: by 2002:a05:600c:2948:: with SMTP id
 n8mr7006477wmd.61.1643368146526; 
 Fri, 28 Jan 2022 03:09:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyK3G/FxIBrsORiLFoh6WUx871HJXkDD26z2CbztjoHQ9dhXPymdoC9rR9lW4k1VOIwEQjifw==
X-Received: by 2002:a05:600c:2948:: with SMTP id
 n8mr7006453wmd.61.1643368146276; 
 Fri, 28 Jan 2022 03:09:06 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m25sm1594570wml.47.2022.01.28.03.09.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 03:09:05 -0800 (PST)
Message-ID: <9ae2c7ba-133e-7c6f-190b-97158f241c7f@redhat.com>
Date: Fri, 28 Jan 2022 12:09:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 31/37] drm: rcar-du: Add support for the nomodeset
 kernel parameter
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20211217003752.3946210-1-javierm@redhat.com>
 <20211217003752.3946210-32-javierm@redhat.com>
 <164336121612.533872.1685181669511488706@Monstersaurus>
 <eb27fa44-2972-4a6e-465f-b9e4775820f4@suse.de>
 <YfPGnfly3GOAOlfp@pendragon.ideasonboard.com>
 <584f1343-b285-bf8e-e48c-764c2a56bce3@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <584f1343-b285-bf8e-e48c-764c2a56bce3@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/28/22 11:46, Thomas Zimmermann wrote:
> Am 28.01.22 um 11:34 schrieb Laurent Pinchart:

[snip]

>>>
>>> It cannot be 'mode-setted'. We get a pre-configured framebuffer from the
>>> firmware or bootloader. Whatever we draw there shows up on the screen.
>>
>> I doubt that's going to work as you expect, clocks and regulators will
>> get disabled at boot if not used by any driver.
> 
> Simpledrm and simplefb attach to these firmware framebuffers. Both 
> drivers look at the device tree nodes to acquire the relevant clocks and 
> regulators.
>

Laurent is correct that in some cases it might be an issue. For example, if
a SystemReady ES image is booted using the U-boot EFI stub instead of bootz.

In this case the system will be presented as EFI and the firmware framebuffer
just taken from the EFI GOP. There won't be any Device Tree node describing
the clocks, regulators, etc that are required for the framebuffer to work.

The user then will have to pass clk_ignore_unused, pd_ignore_unused and maybe
other cmdline params (or even hack a DT to set regulator-always-on for needed
regulators).

But that is also true if the user wants to disable the real DRM driver with
modprobe.blacklist=rcar-du-drm.

What this patch does is just to make all DRM drivers consistent and honour the
nomodeset param (whose name is really misleading but we can't change that).

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

