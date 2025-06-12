Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2559AD7D6C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 23:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F68E10E1CE;
	Thu, 12 Jun 2025 21:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="C+KqRQbz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 360 seconds by postgrey-1.36 at gabe;
 Thu, 12 Jun 2025 21:25:27 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6851E10E1CE
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 21:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1749763520; x=1750368320; i=deller@gmx.de;
 bh=L+cdANZBuTCHVydrdzRXZCJ84LfjIj05/cQxt9E59rc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=C+KqRQbzUE5QpnDJB1dg262gEyM6VLYdfwXR87XeZQMt1Eyw0UJI8f/bjtbmnTbd
 saob2OJ4KoWB7mozO7ivaasy0g3B5MpzJAOApEPAwCQIaWs/5aOB3Ca3f3C214owO
 vitiBS2zEihB68dKg65HPDq0MesoAT9aFx3cegf+uui9elgvfEMvy2PmqgA7nacAn
 iJSBBDsGaeCRFM7HnfYC6QxvbyQUEj2tWxSWECfxTHFNJSeT83PHduMQoqp8kA8im
 bAYvzOoxXlFB/5SXyOm5hgkVjlqB7rcfNGgjvpiMShZDCB4WRHtCXm+sPlKdaa+dg
 q+ngX66lVDJuF6B0pg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDQic-1uZD5q1Lr4-003NQW; Thu, 12
 Jun 2025 23:25:20 +0200
Message-ID: <9ccfe556-cf25-4903-b5ad-d7657a998c69@gmx.de>
Date: Thu, 12 Jun 2025 23:25:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] fbdev/sisfb: Unexport symbols
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250612081738.197826-1-tzimmermann@suse.de>
 <20250612081738.197826-13-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250612081738.197826-13-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rGCbnxHv9u/zsyXVZ7QjqGY6Cj4n6p0Wg3LBMdAG4/ht/aCaVOV
 JcgRpMeW6JNj02Fzi0mMnfKrbAxxpRDce95ekHY1WjAEUi8+uuEKdWnlK4JfEWh0nyYk9ap
 ur0FeBQcnGPsbbSKmFpAVrsj9rf8f6biVA7xu6QVG8p+2A9ZirHhGiQVxfA5SxbJo0u5vcK
 UOminVT7V6UZlLIMTX1YQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZkLCMZedziM=;5fllnf0rYm+6eCK+W9Vhp8Zv1jT
 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
 BN1+0sXFsHkwmVGMEh5WnugG5GNKChe7xQ
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

On 6/12/25 10:16, Thomas Zimmermann wrote:
> Fix the compile-time warning
>=20
>    drivers/video/fbdev/sis/sis_main.c: warning: EXPORT_SYMBOL() is used,=
 but #include <linux/export.h> is missing
>=20
> The affected symbols are not used outside of their module. Some of
> the symbols are not used anywhere, so remove the functions entirely.
> Also remove the related, but unused, define SISFB_HAVE_MALLOC_NEW.
>=20
> v2:
> - remove unused functions (Helge)
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/sis/sis.h      |  2 --
>   drivers/video/fbdev/sis/sis_main.c | 25 -------------------------
>   include/video/sisfb.h              |  6 ------
>   3 files changed, 33 deletions(-)

Reviewed-by: Helge Deller <deller@gmx.de>
