Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E653C20E9E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 16:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20B510E9E6;
	Thu, 30 Oct 2025 15:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="xRciWGok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEFC10E9E6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 15:26:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D96C31A178F;
 Thu, 30 Oct 2025 15:25:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A4A646068C;
 Thu, 30 Oct 2025 15:25:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 65B6311808BF6; Thu, 30 Oct 2025 16:25:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761837957; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9TyfVTtmiB0HqF3wvvWDiUMZGtwH3+ueA2qzLuORFuo=;
 b=xRciWGok4j1T3/882LJemGiLsaiRP7bgsC3acWGBUnYAjwwn9uV7C7r+GYs8nMOWImik3Q
 TX9ppbvdV5kv0LI3PM1Gv8/njfbyWVJW/8eiDBith5VpQSn0yEpYNVINJPYfRXtUffawgc
 x0sw2iz5X9TxWq1GzSi7KOE5a2e2dntoEPgYoLFwqgstXAxKEXOXc5wHUEcYNIjL9ujipy
 +Qmt3SFl1ZjA+Dv6SXL4CXLU2FcPjVglD+qUpVwpjJboiRWtfZ+w3wkrQ7IdLgWP1XEJDH
 dhFXZUGFDc1/o8/g+04XlUyAbkeB50IgOQwh8rbGlMENhOJCtUbtAlY6mlKWdg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Oct 2025 16:25:50 +0100
Message-Id: <DDVRFGWCDRGT.2IR33ALXLVJ2U@bootlin.com>
To: "Mark Brown" <broonie@kernel.org>
Cc: "Marek Szyprowski" <m.szyprowski@samsung.com>, "Naresh Kamboju"
 <naresh.kamboju@linaro.org>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] Revert "drm/display: bridge_connector: get/put
 the stored bridges"
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
 <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-1-667abf6d47c0@bootlin.com>
 <7873e2ab-a8ea-4fdc-8534-746f91c8368b@sirena.org.uk>
In-Reply-To: <7873e2ab-a8ea-4fdc-8534-746f91c8368b@sirena.org.uk>
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

Hello Mark,

On Thu Oct 30, 2025 at 2:11 PM CET, Mark Brown wrote:
> On Fri, Oct 17, 2025 at 06:15:04PM +0200, Luca Ceresoli wrote:
>> This reverts commit 2be300f9a0b6f6b0ae2a90be97e558ec0535be54.
>>
>> The commit being reverted moved all the bridge_connector->bridge_*
>> assignments to just before the final successful return in order to handl=
e
>> the bridge refcounting in a clean way.
>
> Is there any news on getting this series merged - the currently broken
> code in -next is causing boot issues on several affected platforms (eg,
> Rock5B) which is disrupting other testing?  If the other patches are
> somehow causing issues could we perhaps get the revert in to fix the
> boot issue while those issues are resolved?

Thanks for pinging, I must agree the regression is out since quite a few
weeks. Despite having four Tested-by, this series was lacking Reviewed- and
Tested-by entirely.

Now Louis reviewed the whole series (thanks!), so my understanding of the
drm-misc policy is that I can apply the series, which I plan to do in a few
days to let anybody else comment.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
