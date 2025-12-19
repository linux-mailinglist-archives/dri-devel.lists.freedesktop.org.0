Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D35CD1D23
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 21:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C97E10F0AB;
	Fri, 19 Dec 2025 20:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YIBOmFFp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B36810F0AB
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 20:47:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 21BB21A22FA;
 Fri, 19 Dec 2025 20:47:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E04826071D;
 Fri, 19 Dec 2025 20:47:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7297110AA9874; Fri, 19 Dec 2025 21:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766177258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tqIMgIT1zgOc7/k4/J08FVID6FI+V7s5NeZfBKk0l3I=;
 b=YIBOmFFp02TRQXWabZ8ET2m+7prByScZ8aFCrw9S8vFwA9s32N6Q7V8cda1luaSCNvLlXj
 W1hr15b7FzrX6OfEJ3aMiureZlwTSWtCXYNoGi53M2l8JhLJP2shGrxw8zTYVrAduZr22p
 MUHmbLUSNn/2MN7/JCN/N9ji/ZFAifcOcb0B92w7RPU9qZbfTgXNYoqGrQ6fFSiryQSGpd
 72DC+Xc7/4xqOkQnlroCBdn/Y4ck1nFRCMK9TYr2c5qH25H77a21+OaqmCA/kdPTCchkzy
 NvLtTcFB0P+qxUt4HscryA0X+RvtM0/W4FCmFWZA+4/WrlFZI8fVWsPMipOKXg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 21:47:32 +0100
Message-Id: <DF2HL0S1XLMI.Y94M4FT7KOJM@bootlin.com>
Subject: Re: [PATCH RESEND v2 29/32] drm/vkms: Rename vkms_connector_init to
 vkms_connector_init_static
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Haneen Mohammed"
 <hamohammed.sa@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Melissa Wen"
 <melissa.srw@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <jose.exposito89@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-29-a49a2d4cba26@bootlin.com>
 <DF2F97ZVFINU.VQ5ZD96C4ZNH@bootlin.com>
 <76417a1c-1179-4e47-ab2d-00048116bfae@bootlin.com>
In-Reply-To: <76417a1c-1179-4e47-ab2d-00048116bfae@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
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

On Fri Dec 19, 2025 at 8:11 PM CET, Louis Chauvet wrote:
>
>
> On 12/19/25 19:58, Luca Ceresoli wrote:
>> On Wed Oct 29, 2025 at 3:37 PM CET, Louis Chauvet wrote:
>>> With the introduction of dynamic connectors we will have two way of
>>> initializing a VKMS connector. Rename the current function to clarify
>>> the case.
>>>
>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>
>>> --- a/drivers/gpu/drm/vkms/vkms_connector.h
>>> +++ b/drivers/gpu/drm/vkms/vkms_connector.h
>>> @@ -4,6 +4,7 @@
>>>   #define _VKMS_CONNECTOR_H_
>>>
>>>   #include "vkms_drv.h"
>>> +#include "vkms_config.h"
>>
>> Why? Maybe this is for another patch in the series?
>
> This line is useful, I use struct vkms_config_connector
> But I agree, this should be a separate patch.

Ah, I see, perhaps it is working currently because it is included by some
other .h files. Yes, better making that explicit (include what you use), or
use a forward declaration if you want. In any case, a separate patch
indeed.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
