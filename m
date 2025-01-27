Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA82CA1D6C7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 14:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF1210E03C;
	Mon, 27 Jan 2025 13:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.b="er52xKaf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 791 seconds by postgrey-1.36 at gabe;
 Mon, 27 Jan 2025 13:28:17 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A468710E03C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 13:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202412;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Cc:From:
 References:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
 Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5jZEc0JNiGyXM16e3OlSdlhbuyhdjiCrAIvuqD0Zrmk=; b=e
 r52xKafCSdQY5bg0J00omPfjtfyoZnkZZsUV5/sijKdkmC64VhksU9w1gmQ7/DUnp66FdUMtAAAMh
 hsPHipHlzWL4/QLcv6SfQR+XcbzPkJUY4xszN2zql+TfEQk5zW3oRzjGAOr0bGOMyRHbA+AqhNtwY
 sg68I3pQxoLzyhHGCciQtZMMpXftsAo2HuXMd73w9dp1yVp1MxX1EQu6Ytgs8Kde+MrqKG4RQXfrZ
 I2SJhm74RGi2L3AsSl8n0t+j2MkvAZ6Hye6xQuZbJ1RIu+t/O20BpLEnsgXRlZKWYpH1/tH+gMIkh
 jBfr8Rf7nRcMwnGiIsEG7JlPZPFTVOZOQ==;
Received: from smtp by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 id 1tcPA0-0019g8-4J; Mon, 27 Jan 2025 14:28:16 +0100
Message-ID: <530715c7-7dcd-44ea-97ca-a3f65a799a00@tronnes.org>
Date: Mon, 27 Jan 2025 14:28:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_MAINTAINERS=3A_Remove_Noralf_Tr=C3=B8nn?=
 =?UTF-8?Q?es_as_driver_maintainer?=
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250123-remove-myself-as-maintainer-v1-1-cc3ab7cd98ae@tronnes.org>
 <Z5NgDExm2ONu5Su1@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: noralf@tronnes.org
In-Reply-To: <Z5NgDExm2ONu5Su1@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24.01.2025 10:40, Simona Vetter wrote:
> Dear Noralf
> 
> On Thu, Jan 23, 2025 at 05:34:25PM +0100, Noralf Trønnes via B4 Relay wrote:
>> From: Noralf Trønnes <noralf@tronnes.org>
>>
>> Remove myself as maintainer for gud, mi0283qt, panel-mipi-dbi and repaper.
>> My fatigue illness has finally closed the door on doing development of
>> even moderate complexity so it's sad to let this go.
>>
>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> 
> As much as it pains me:
> 
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> 
> Was great to have you around while it was possible, I'll miss you. And
> will you push this last one yourself?
> 

It has been very rewarding to be part of the DRM community. There are so
many kind people here making it a nice place to be. Even though this has
been a hobby for me I have always felt included in the community.
Thanks for getting me up to speed on how to do development in the kernel
and all the time you have spent reviewing my patches. For that I am
grateful. When the sadness leaves me I will have some good memories to
look back on.

Noralf.

> Cheers, Sima
> 
>> ---
>>  MAINTAINERS | 12 ++++--------
>>  1 file changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4b038382481f99e336a2de0d2249537ec6781463..ed86d884ee0dfeede2ee185f7779380d04c5080b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7173,8 +7173,7 @@ F:	Documentation/devicetree/bindings/display/panel/panel-edp.yaml
>>  F:	drivers/gpu/drm/panel/panel-edp.c
>>  
>>  DRM DRIVER FOR GENERIC USB DISPLAY
>> -M:	Noralf Trønnes <noralf@tronnes.org>
>> -S:	Maintained
>> +S:	Orphan
>>  W:	https://github.com/notro/gud/wiki
>>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>>  F:	drivers/gpu/drm/gud/
>> @@ -7279,15 +7278,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>>  F:	drivers/gpu/drm/mgag200/
>>  
>>  DRM DRIVER FOR MI0283QT
>> -M:	Noralf Trønnes <noralf@tronnes.org>
>> -S:	Maintained
>> +S:	Orphan
>>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>>  F:	Documentation/devicetree/bindings/display/multi-inno,mi0283qt.txt
>>  F:	drivers/gpu/drm/tiny/mi0283qt.c
>>  
>>  DRM DRIVER FOR MIPI DBI compatible panels
>> -M:	Noralf Trønnes <noralf@tronnes.org>
>> -S:	Maintained
>> +S:	Orphan
>>  W:	https://github.com/notro/panel-mipi-dbi/wiki
>>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>>  F:	Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
>> @@ -7384,8 +7381,7 @@ F:	Documentation/devicetree/bindings/display/bridge/ps8640.yaml
>>  F:	drivers/gpu/drm/bridge/parade-ps8640.c
>>  
>>  DRM DRIVER FOR PERVASIVE DISPLAYS REPAPER PANELS
>> -M:	Noralf Trønnes <noralf@tronnes.org>
>> -S:	Maintained
>> +S:	Orphan
>>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>>  F:	Documentation/devicetree/bindings/display/repaper.txt
>>  F:	drivers/gpu/drm/tiny/repaper.c
>>
>> ---
>> base-commit: a9301e5bef12f8989a02d886109f13e89e1e51b0
>> change-id: 20250122-remove-myself-as-maintainer-7540b245ab05
>>
>> Best regards,
>> -- 
>> Noralf Trønnes <noralf@tronnes.org>
>>
>>
> 

