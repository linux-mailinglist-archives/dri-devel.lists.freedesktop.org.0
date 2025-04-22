Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72394A97A8C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 00:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29EC10E640;
	Tue, 22 Apr 2025 22:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JttxUSjl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E52510E640
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 22:37:00 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30c2d427194so51173521fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 15:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1745361419; x=1745966219;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CYnsLlC0NFMYuF8GmCOmo6AutxjaiqbjJEuB9kEX76M=;
 b=JttxUSjlgx+H5Hwl039y6TNcKRy+4uN3byWgQ6Lu7n47x6LO1c2C6RCtqGqcB9py7h
 fgDNc7qL/A633Mn664PsD2Vlfe+ViJt5DCGDI2H7inZLFR8y53JjORIM3T/9ztJQ/EX0
 Zcu8+NPQjvJhcPs2B8w8M9Zm8B4lgOapJSOWhTY97P7PHHvkx5EAX+lPmjhBVPfjryMB
 /w5pNwn765pVR9qwPoaNdDclj4+OBx9Hval0fqBpoO341gYEI5wt+iUpM6ZBTYlHsXXN
 lZb05MZLsO+kvnukOyVF60ioakcq/58Jpr99cIn5gEd2W1Bas6wb9/+U50jXdMw6ZFDa
 1C2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745361419; x=1745966219;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CYnsLlC0NFMYuF8GmCOmo6AutxjaiqbjJEuB9kEX76M=;
 b=l0nojQDGhooeT4EY8zDFnzQBcvRsgyqdeVk8OF34/JFR2NCcjc7vT7U+Sy72ifdR8W
 2GJlrImxMKClzBLDNTOZpCLZjO96aVKkA+xCaj+N9zOdU55EiEqqeks4YOvKLtuxEnFl
 YXfFXXOsg70IIso1LKoB01F7P0jBb/OrL7Gzf4sqY1ZSGVn/RG7Xai4NsjZxC9dlcDL7
 2ZpfjMGyyzDbw9AQvg+2k/DI6G5JG1VHQG74OTKy+llWCw+Tmsrc9Zph3vKmEEXeaxYL
 uf80IxN45PlFZWPcmHaC7EPA+pMByZMkyNXP4LLjiiEU3fqc/3POTTW/+OEkFNnX1HsH
 hzkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsPRLucUqiOGkxjct9Unh3Y0Ix62lu/PtKf02H9WbAk0r9awr5tiB7kuZbbOPY/s5Jxe5CMc+MD4w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy290e+7MJRHu3Gi8sJmMcB5Im6ZKwi7lV7mA1DEmP7jsnns5on
 5T5tne5m9k5UbvHA6T0JubCqLLDWKUVLHT+3KmY7n2Z36qNEVsOskcF6vhY4o9JrBG/ZgSewXMf
 285vmsDnDU5siIsacrv5JqXE4CqmEUvgU42s=
X-Gm-Gg: ASbGnctfc1EeEIjlXw65L4Ukw2pmppIphWb1+MHXBnpp1qf5F8sdSBlVM/NOkyVLwRF
 YEYaT33SWofSIf8crM+pFWgGRDmVnqbvwbIFvgTQDv+4GrtUcyWsxebcFSsCRb/krDIeDGPoDa5
 rcjLgAuMNs4l6ZBBbu1M6gAJkiGPqYc7sxeubNGam7Wz5j/VdaLA==
X-Google-Smtp-Source: AGHT+IE3IEPCCgB0bt/uCVYonB/YsmX9MsBR2/QB63vrorCHbNSrdpM99e+NYH8FchPivlBNMzAKqKtWDNa/LnKLgF4=
X-Received: by 2002:a05:651c:2226:b0:30d:c534:692 with SMTP id
 38308e7fff4ca-31090554d22mr52580801fa.29.1745361418655; Tue, 22 Apr 2025
 15:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250422191939.555963-1-jkangas@redhat.com>
 <20250422191939.555963-3-jkangas@redhat.com>
In-Reply-To: <20250422191939.555963-3-jkangas@redhat.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 22 Apr 2025 15:36:45 -0700
X-Gm-Features: ATxdqUHUf8NvYK-aLnI2B4TJfd1jaEQSDfLR3dMFnq6KQaAqiJ29RDdXxafUgSE
Message-ID: <CANDhNCpbX1718t2gH3LULL=RDxfxh+uCJNF4jJH0sbpLMK=oWA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
To: Jared Kangas <jkangas@redhat.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
 Brian.Starkey@arm.com, tjmercier@google.com, christian.koenig@amd.com, 
 mripard@kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 22, 2025 at 12:19=E2=80=AFPM Jared Kangas <jkangas@redhat.com> =
wrote:
>
> The CMA heap's name in devtmpfs can vary depending on how the heap is
> defined. Its name defaults to "reserved", but if a CMA area is defined
> in the devicetree, the heap takes on the devicetree node's name, such as
> "default-pool" or "linux,cma". To simplify naming, just name it
> "default_cma", and keep a legacy node in place backed by the same
> underlying structure for backwards compatibility.
>
> Signed-off-by: Jared Kangas <jkangas@redhat.com>

Once again, thanks for working out how to improve the standard naming
while keeping compatibility.

I do still hope we can get to the point where other cma regions can be
registered as heaps with unique/purpose-specific names, but I can see
having a standard name for the default region is a nice improvement.

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
