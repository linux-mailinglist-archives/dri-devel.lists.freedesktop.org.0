Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7885AA7D0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 08:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1BD10E753;
	Fri,  2 Sep 2022 06:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA19210E753
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 06:10:20 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id k18so1192473lji.13
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 23:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date; bh=GJXMI1bgdbpR3iMrtD6mnbkGrMOokN2mS5GTxThRtDE=;
 b=eYBBknZYzAuqKIrCFvA4xTlaviWl5STVdMToAXE7PvGni78GymmPrGY2il5cocor35
 8bDv8TWwnP1cNyGgYKnz/ZmUfdqCtclda/yj/VGSQjVrceLB+9OolH3yevDrY8o5iUa2
 VsNwIlYI31HfUR/e4HukNBC0kb3ndnAg0wXcsX27r4+eZMKXAsv3yfQkuhKz0mvJPUAX
 uy/aEO1fGNpYQ0gNSHpmfvIKNi8IRnseCL6pQDGPw0CugsKrV+HTFPXmteDISDhDMCbV
 VWdMOJPKsGQzgQ6CVYPVPaOcZVAwnp9VsWrL4xkTKIbAzsJtfi0xHrfyFf6XOpe0uHhO
 hyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=GJXMI1bgdbpR3iMrtD6mnbkGrMOokN2mS5GTxThRtDE=;
 b=ZShE9k7/gGUBLD3DnDa/+GaQhFb2D8LzIwAgothZswuxzama71JsAcUBSNHkHGUgiy
 3+J0zroJHJlMGfvpHAu68GW/Q4CgHZZ/G28pCTYCFeH+Co9RKCfUEdrdXBxxJL7Zp11v
 RjEu+kpWW/XnvYrIhV7vepp4kMXaZgCGTq5kMH/q3R5irExAT9ZCK1aHuhiXhWsjJp/L
 F1jnFl/p1BSahzqUts0sLCqdy4vMilNhv2kQLMMN8tyRd1ZpwhBMD84kG/gj7YY9XZHs
 A/ZmtBTrJX8lNdCPgCO1nHIj7skHKTR4FoJ8p/IxO+vNJjlCRAzEIOnXLUrlliE+/cki
 MeYQ==
X-Gm-Message-State: ACgBeo0Uf2V3HyZqD26gjAy0GI0w+H2OYH/4SsyVtgZo7tBUUEASFZ+J
 0zhry1bxRFOS8nwC7Vz/a6wcXg==
X-Google-Smtp-Source: AA6agR5JuHJzuuhi/0n3H6pou86GKLRIStBn/J97UiGVZH7IecoReZoWFe+Ytqkjx+aIqU2iJF95Ww==
X-Received: by 2002:a2e:9252:0:b0:264:349d:85d1 with SMTP id
 v18-20020a2e9252000000b00264349d85d1mr7462692ljg.358.1662099019114; 
 Thu, 01 Sep 2022 23:10:19 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.228.19]) by smtp.gmail.com with ESMTPSA id
 19-20020a2eb953000000b0025e60089f34sm79601ljs.52.2022.09.01.23.10.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Sep 2022 23:10:18 -0700 (PDT)
Date: Fri, 02 Sep 2022 09:10:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, dri-devel@lists.freedesktop.org
Subject: =?US-ASCII?Q?Re=3A_=5BRESEND_PATCH_libdrm_v3_1/2=5D_tests/modetest=3A_A?=
 =?US-ASCII?Q?llocate_drmModeAtomicReq_before_setting_properties?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20220901230924.145-2-quic_jesszhan@quicinc.com>
References: <20220901230924.145-1-quic_jesszhan@quicinc.com>
 <20220901230924.145-2-quic_jesszhan@quicinc.com>
Message-ID: <F67073D2-EAA6-41D9-B2BD-CA5C68080EE2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: hoegsberg@google.com, Rohith Iyer <quic_rohiiyer@quicinc.com>,
 quic_abhinavk@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2 September 2022 02:09:23 GMT+03:00, Jessica Zhang <quic_jesszhan@quici=
nc=2Ecom> wrote:
>From: Rohith Iyer <quic_rohiiyer@quicinc=2Ecom>
>
>Fix null pointer deference caused by drmModeAtomicReq being
>allocated before set_property was called when modetest was run
>with the atomic flag=2E

=2E=2E=2E being allocated _after_ =2E=2E=2E

Other than that:

Reviewed-by: Dmitry Baryshkov<dmitry=2Ebaryshkov@linaro=2Eorg>

>
>Reviewed-by: Rob Clark <robdclark@gmail=2Ecom>
>Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc=2Ecom>
>Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc=2Ecom>
>---
> tests/modetest/modetest=2Ec | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/tests/modetest/modetest=2Ec b/tests/modetest/modetest=2Ec
>index 42e2d1f4=2E=2E2c31c4fc 100644
>--- a/tests/modetest/modetest=2Ec
>+++ b/tests/modetest/modetest=2Ec
>@@ -2186,11 +2186,13 @@ int main(int argc, char **argv)
> 	dump_resource(&dev, planes);
> 	dump_resource(&dev, framebuffers);
>=20
>+	if (dev=2Euse_atomic)
>+		dev=2Ereq =3D drmModeAtomicAlloc();
>+
> 	for (i =3D 0; i < prop_count; ++i)
> 		set_property(&dev, &prop_args[i]);
>=20
> 	if (dev=2Euse_atomic) {
>-		dev=2Ereq =3D drmModeAtomicAlloc();
>=20
> 		if (set_preferred || (count && plane_count)) {
> 			uint64_t cap =3D 0;

--=20
With best wishes
Dmitry
