Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7545B53B663
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 11:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09944112D1D;
	Thu,  2 Jun 2022 09:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5E7112D1E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 09:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654163542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tY+d98+Ar2nYhc4ZWgOPLeQZIlGWSTqA9MPYDgGqDOc=;
 b=AtrHwe0XB5vN53PUej5Fo5345uxXv6LiJxPaidUzSmnRWYdZ59+ffKU3bYxe81ZrkCjQqU
 BXAAaZwt+0a9smflk47CsUml+m3JOjf01p87QMPImhh4zXlgED5enAj3hoeXo/HSMP2YwS
 tOiOpFvjUNUiD6Dg38OCvxJU4G7s06A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-Jyc8MmeeMhCENLOPQIAjhQ-1; Thu, 02 Jun 2022 05:52:19 -0400
X-MC-Unique: Jyc8MmeeMhCENLOPQIAjhQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 d9-20020adfe849000000b00213375a746aso195965wrn.18
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 02:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tY+d98+Ar2nYhc4ZWgOPLeQZIlGWSTqA9MPYDgGqDOc=;
 b=4zA0IRLRto9n6acD3PrZVKG4p+6CMbTPhZ1VOcYaTULxfdLXd/cPcxB01F+MKMm1Hd
 SDSSgWHN/HvjUtuoGr0OmCT1Rjz0IJXlEc0D6a6Ltbyn24z0LDei8UWLPAhraREuvIP3
 4qa1sg0rdU+b+opHx7p2fklmaqHQ2lI8NGVoWioegYsXYy7/Gk07s+r//6SOKX9iyjkj
 PvkDBRMCfI5D5AB/4T2RUtqvit1QAHNao2LILBW2ZvimOhLoGoZrGTLXERoBXNduPSHw
 vnqnvFI1UwdpsVx6y9QepN26R/GWfnyi1e4LdpMvmtASkpfHmTrId20TywjhMCQ6kndh
 Xbmw==
X-Gm-Message-State: AOAM530uvITA/Lt9Lnoc8YNKFjvrjWjkv/mZRbiiop1C166aX89RQ7+k
 6JlgalAubZ1braK5ptA4HIRCXp6KVJ/1dBG3Bi8MJ8MEwm2XXFHBecPOOld+G4Tko24OQ96OyVp
 pMdIyMNCQ6Z8WO85XEQRgQj8E4YVJ
X-Received: by 2002:a5d:64e8:0:b0:20f:d0a2:cc86 with SMTP id
 g8-20020a5d64e8000000b0020fd0a2cc86mr2938270wri.266.1654163538220; 
 Thu, 02 Jun 2022 02:52:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOkwXABKThXPhmNsTmpifdHGnXTKHkLMoUfvmT+5kWv+xA1A1aEvPfyGo3EDUQ7aZKuG15xQ==
X-Received: by 2002:a5d:64e8:0:b0:20f:d0a2:cc86 with SMTP id
 g8-20020a5d64e8000000b0020fd0a2cc86mr2938252wri.266.1654163537991; 
 Thu, 02 Jun 2022 02:52:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a05600c0a0300b0039c362311d2sm802667wmp.9.2022.06.02.02.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 02:52:17 -0700 (PDT)
Message-ID: <e67e7d9c-5b90-bf2a-f59a-4267d6b4ac59@redhat.com>
Date: Thu, 2 Jun 2022 11:52:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 00/10] drm/mgag200: Convert device init to use device-info
 structure
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20220601112522.5774-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20220601112522.5774-1-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/06/2022 13:25, Thomas Zimmermann wrote:
> Convert the device-init code to use a device-info structure for each
> model. The device info contains constants and flags that were previously
> located in different places of the code.
> 
> Also refactor the PCI and VRAM initialization handling. A later patchset
> could convert the PCI magic numbers into constants.
> 
> For modesetting, the per-model init functions currently don't do much.
> This will change when more model-specific code gets moved there. The
> modesetting and PLL code contains model-specific handling that should
> be refactored.
> 
> Tested with G200 and G200EV hardware.

Thanks for this refactoring.
I've also tested this patchset on a G200eW, and have seen no regression.

For the whole series:

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Thomas Zimmermann (10):
>    drm/mgag200: Remove special case for G200SE with <2 MiB
>    drm/mgag200: Initialize each model in separate function
>    drm/mgag200: Move PCI-option setup into model-specific code
>    drm/mgag200: Call mgag200_device_probe_vram() from per-model init
>    drm/mgag200: Implement new init logic
>    drm/mgag200: Add struct mgag200_device_info
>    drm/mgag200: Store HW_BUG_NO_STARTADD flag in device info
>    drm/mgag200: Store maximum resolution and memory bandwith in device
>      info
>    drm/mgag200: Store vidrst flag in device info
>    drm/mgag200: Store positions of I2C data and clock bits in device info
> 
>   drivers/gpu/drm/mgag200/Makefile          |  14 +-
>   drivers/gpu/drm/mgag200/mgag200_drv.c     | 386 ++++++++--------------
>   drivers/gpu/drm/mgag200/mgag200_drv.h     | 135 ++++++--
>   drivers/gpu/drm/mgag200/mgag200_g200.c    | 200 +++++++++++
>   drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  50 +++
>   drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  51 +++
>   drivers/gpu/drm/mgag200/mgag200_g200er.c  |  46 +++
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  50 +++
>   drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  60 ++++
>   drivers/gpu/drm/mgag200/mgag200_g200se.c  | 130 ++++++++
>   drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  50 +++
>   drivers/gpu/drm/mgag200/mgag200_i2c.c     |  27 +-
>   drivers/gpu/drm/mgag200/mgag200_mm.c      | 116 -------
>   drivers/gpu/drm/mgag200/mgag200_mode.c    | 100 ++----
>   drivers/gpu/drm/mgag200/mgag200_pll.c     |  12 +-
>   drivers/gpu/drm/mgag200/mgag200_reg.h     |   2 +
>   16 files changed, 942 insertions(+), 487 deletions(-)
>   create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200.c
>   create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200eh.c
>   create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200eh3.c
>   create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200er.c
>   create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200ev.c
>   create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200ew3.c
>   create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200se.c
>   create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200wb.c
>   delete mode 100644 drivers/gpu/drm/mgag200/mgag200_mm.c
> 
> 
> base-commit: 2c8cc5cd20e28afe6b63acb28890e5f57d9bf055
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24



