Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206D89A2D8F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 21:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C1E10E330;
	Thu, 17 Oct 2024 19:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BTZVyaIs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DA910E226;
 Thu, 17 Oct 2024 19:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UTQitr95XkThZtHjUCmIGVppmZY2ZzwNP0yThkba0mY=; b=BTZVyaIs8tipCLK88VKfAzxzdS
 G6TaFV+Ul8OtqufNsALwXyiGpmTIwZyMQl4yzee1NoM8AgkX2vMs0ifHnQqBLTDxZhFPSC7VTUPm7
 zsg14wF801IHm4YcG2DB1Ia2oP0xC45QeQ1ztQYQcX0ySYC6GLg6agRktHIrT+KQ4fI0aKdgjT93y
 uQvV4ztbB3izIVC7iqP5oQB2psiB4+LSBjAlijFQ+SSCTBR/3p/K5rBPWyMphz/m/Tq073VuQzAES
 +Xi58w4sVijdF7gwE9UfevJHJXG/bTCScQICmq1A8BGiEOcwOE6y5DIxYMui9t+e/UleokSDhK5YL
 sgLfSh7g==;
Received: from [179.118.186.49] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t1Vyq-00BlIv-JD; Thu, 17 Oct 2024 21:16:16 +0200
Message-ID: <ed8cb1e9-df05-44a7-9088-90b3ee8dce85@igalia.com>
Date: Thu, 17 Oct 2024 16:16:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
To: Raag Jadav <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, simona@ffwll.ch,
 intel-gfx@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 lucas.demarchi@intel.com, tursulin@ursulin.net, francois.dugast@intel.com,
 jani.nikula@linux.intel.com, airlied@gmail.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 andi.shyti@linux.intel.com, matthew.d.roper@intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20240930073845.347326-2-raag.jadav@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Raag,

Em 30/09/2024 04:38, Raag Jadav escreveu:
> Introduce device wedged event, which will notify userspace of wedged
> (hanged/unusable) state of the DRM device through a uevent. This is
> useful especially in cases where the device is no longer operating as
> expected even after a hardware reset and has become unrecoverable from
> driver context.
> 
> Purpose of this implementation is to provide drivers a generic way to
> recover with the help of userspace intervention. Different drivers may
> have different ideas of a "wedged device" depending on their hardware
> implementation, and hence the vendor agnostic nature of the event.
> It is up to the drivers to decide when they see the need for recovery
> and how they want to recover from the available methods.
> 
> Current implementation defines three recovery methods, out of which,
> drivers can choose to support any one or multiple of them. Preferred
> recovery method will be sent in the uevent environment as WEDGED=<method>.
> Userspace consumers (sysadmin) can define udev rules to parse this event
> and take respective action to recover the device.
> 
>      =============== ==================================
>      Recovery method Consumer expectations
>      =============== ==================================
>      rebind          unbind + rebind driver
>      bus-reset       unbind + reset bus device + rebind
>      reboot          reboot system
>      =============== ==================================
> 
>

I proposed something similar in the past: 
https://lore.kernel.org/dri-devel/20221125175203.52481-1-andrealmeid@igalia.com/

The motivation was that amdgpu was getting stuck after every GPU reset, 
and there was just a black screen. The uevent would then trigger a 
daemon to reset the compositor and getting things back together. As you 
can see in my thread, the feature was blocked in favor of getting better 
overall GPU reset from the kernel side.

Which kind of scenarios are making i915/xe the need to have userspace 
involvement? I tested a bunch of resets in i915 but never managed to get 
the driver stuck.

For the bus-reset, amdgpu does that too, but it doesn't require 
userspace intervention.
