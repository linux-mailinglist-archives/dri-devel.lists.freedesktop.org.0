Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809BCAD7D8B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 23:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D8010E1E1;
	Thu, 12 Jun 2025 21:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Izs2qE/f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4863510E1E1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 21:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1749763706; x=1750368506; i=deller@gmx.de;
 bh=EQ/WnXs+ZZBC5/jZvtIeaKmfF+35V9ClldktkpJu4zw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Izs2qE/fvHmGOLMEBzxLIV9Gnk2oTjphmX/6M6ArtyLkfSXBdrblf8xo18wZo5yj
 /w+C6R7dwPDXeZ4Cjd2lS/MPKOENbzRut7yNPiKwzNZuQadl2kYzmc5pT5CSdSlAx
 J0RQ9PzoEVh+Jzu30V7EkHImsMklvwqMiYQk5kbmkqwr1cOx153Bwtw7963HrNzPd
 XzpeeaFUy9KQp4sOVdjXLt3TZM9a7iWdLGpBtoD87WVhmXNTeFsg/UfHRT0xH1y5L
 qKGQ12jm1OF+TVEONmBtbx9aZ8J0ong5I8eufptEc4eF3v9rV3AAamIbUR/Z/vLyd
 wsGf2KmUGiMHRw1a2g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdvmY-1uziAi2OoQ-00ia7O; Thu, 12
 Jun 2025 23:23:18 +0200
Message-ID: <c73e51a5-6e67-49e4-9004-ec3782270e3d@gmx.de>
Date: Thu, 12 Jun 2025 23:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] fbdev/mb862xx: Do not include <linux/export.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250612081738.197826-1-tzimmermann@suse.de>
 <20250612081738.197826-11-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250612081738.197826-11-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Mdpu6TGWMfwxIUqjDRBNni+FFPWEpunSbirTU/o18p49F5GWL8g
 XYHy7YzeDnDYZSvjq1JLTgsH9Npz6huklFLO1iVvLXIfvAnsZvFrmMOTd0ordqjBVev2WiZ
 0ixsx+z+nhazXInq0IvSGtTS0ZsW1PY6h3qJmDGoDS7SSNR7sTbs6KTjHKyyWRS/lPxDOC6
 FbxxyjJH4r1zfn8O0Uq1Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NNJVTnVqfTA=;cQnDXQYtCwC4NridtSNo2oaQ9v9
 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
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
>    drivers/video/fbdev/mb862xx/mb862xx-i2c.c: warning: EXPORT_SYMBOL() i=
s not used, but #include <linux/export.h> is present
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/mb862xx/mb862xx-i2c.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Helge Deller <deller@gmx.de>

