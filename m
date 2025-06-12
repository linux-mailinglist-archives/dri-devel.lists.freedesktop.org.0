Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0371AD7D60
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 23:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3992610E1C9;
	Thu, 12 Jun 2025 21:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="a28rNTAo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C84A10E1C9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 21:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1749763476; x=1750368276; i=deller@gmx.de;
 bh=r44+RAC0PbOCiKZ0u1Ilbvh1iOInyWXtgHvlm1xgwUM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=a28rNTAoHk4b+QVlfNy9NUcL5XDc5ycSgH0N75t8/6rcYkTeTOq4ORc7dkmTmTj2
 R898cHMS2hhz5pISrYWc38xxUNJb/0AjuLvK0pKnmfmZy2NLDmeidf0Awsf6Njmzw
 PlaHEkVGkao087LJP59P3E0x//dH/3gp4xIa23JBcJ/nf6Mc5G485fSxQmwki9P+0
 K4Wg9akLOCIkdrVRzEW84zx3nabhi4Yq7vZi4oYj6M+URIhtxrpxCXPA1D2LY6C8+
 6WeHGRDgSXhpDcvQ0CqTixIS+9ZUX1rgHc7BXf08A+RH2mz+frirI66QuD+15qqPd
 RXDXKSqP+nzZD/kDFQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6KUT-1usHRh2w8n-00wBLi; Thu, 12
 Jun 2025 23:19:12 +0200
Message-ID: <0efe9043-dc11-448c-a25c-a1dc2def9a1a@gmx.de>
Date: Thu, 12 Jun 2025 23:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] fbdev/cyber2000fb: Unexport symbols
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250612081738.197826-1-tzimmermann@suse.de>
 <20250612081738.197826-5-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250612081738.197826-5-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Yawz4FWwUmJ65fPTPXCkWDffmER/vjVG01/0wFjwvNE/gG8OlMW
 HjNYPT5jITrmNVuYg5qVD2gNQeS/TEZTCY/B+Knntm0XyYAp3uspZ+X+mDpfVNQj9DMxsm8
 70bt0ba7cYfRs1K5SFMr5s5msHqbx5jc3qaDQYGJlZLjoI1Y8H+Sf5K3Ny1lgvvAcasl8S+
 ikHuBHJvvtbgc4y4W9ntQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:D0Tc9oEYRIY=;2neekmYI83Ug4gQ09ea134svJtj
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
>    drivers/video/fbdev/cyber2000fb.c: warning: EXPORT_SYMBOL() is used, =
but #include <linux/export.h> is missing
>=20
> The affected symbols are not used anywhere, so remove the functions
> entirely.
>=20
> v2:
> - remove unused functions (Helge)
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/cyber2000fb.c | 36 -------------------------------
>   drivers/video/fbdev/cyber2000fb.h |  2 --
>   2 files changed, 38 deletions(-)

Reviewed-by: Helge Deller <deller@gmx.de>

