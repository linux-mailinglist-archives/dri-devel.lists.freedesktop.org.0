Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2474646DE9
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 12:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3E610E1BE;
	Thu,  8 Dec 2022 11:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6A910E1BE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 11:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=81pH2U2ws5Ebem6IaIN5fhhXFNR7A9R0q9kS0iMMNos=; b=j6j8Mq0Civ4c18rLUmadWpXN/B
 0HVHCO469BOgUNjwR4iAPWJOwTULOO9cId6QI8dro1r5hMcPfXX0MU9e6AQuzTGiIsho1LqpYDglE
 EvjP8F9lrGj6M5MqO0a1tWPCX8++sGWGOUooETZ31Adow8fqqZ6X+OXlCTM0Q/m/GgdeKhylGsrBs
 xcsS7tczDK0SuJfpbkkY9/6ipsSqePT+Rmeax0WynhlsiiadoUheKzOTeUWU4KFAXMVCLT0dHYZOB
 1Jq2SdHhGcmuJw31WoP4rc2qCQJY+EpCL6s9hAkVyR5vxQL9pf6gZ6uWpBetSza2INYo+N6cxMWQq
 /iW1CyNg==;
Received: from [177.34.169.227] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1p3Egg-00H9hu-PV; Thu, 08 Dec 2022 12:03:35 +0100
Message-ID: <fcb94856-b455-24ce-92f2-d7d71862f02f@igalia.com>
Date: Thu, 8 Dec 2022 08:03:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/vc4: Improve the KUnit documentation
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221208094727.2848310-1-maxime@cerno.tech>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221208094727.2848310-1-maxime@cerno.tech>
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/8/22 06:47, Maxime Ripard wrote:
> The command-line can be expressed using a code-block, and we were
> missing which architectures were available.
> 
> Suggested-by: Maíra Canal <mcanal@igalia.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

>  Documentation/gpu/vc4.rst | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/vc4.rst b/Documentation/gpu/vc4.rst
> index a2375f1584e6..5e5e92e40919 100644
> --- a/Documentation/gpu/vc4.rst
> +++ b/Documentation/gpu/vc4.rst
> @@ -61,8 +61,11 @@ The VC4 Driver uses KUnit to perform driver-specific unit and
>  integration tests.
>  
>  These tests are using a mock driver and can be ran using the
> -command::
> -	./tools/testing/kunit/kunit.py run \
> +command below, on either arm or arm64 architectures,
> +
> +.. code-block:: bash
> +
> +	$ ./tools/testing/kunit/kunit.py run \
>  		--kunitconfig=drivers/gpu/drm/vc4/tests/.kunitconfig \
>  		--cross_compile aarch64-linux-gnu- --arch arm64
>  
