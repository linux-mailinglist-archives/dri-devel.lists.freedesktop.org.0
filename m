Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F62B1E6F1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 13:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6078610E1E1;
	Fri,  8 Aug 2025 11:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="UBx4H0Ts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C01E10E4E6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 11:06:50 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4b070b3b7adso35848401cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 04:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1754651209; x=1755256009;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fah6fDAHPsacje0Bek0+yZMl1AG/AjYc/B3XNcGffoE=;
 b=UBx4H0TsB4S8PLhh5JInOQVKd4/Aomwu4P/6smbFetnk0Qlaloy8xVdB8D0dSgeF/j
 YDoRo9La4So9XMoaMfnhw4XoGFT4Gl8vCMkKIJeQ6x/ZwrVGsfgylE/bD1CZFodhxP4k
 7E7Q46tEINqzdI/LLAWA0X5iGFpTzs+5LUoBQEcL2rJ7z8tXSqWYVzZWLBy6CKSxgMJb
 WdT2y8oJhUwH61l1Plp7X4vdrIF2IFQFCRazShUS8vza+eX8lw82HBzNnUT501HBtnnj
 +iN0zn0UHWPj1R0XqMq4mXfZnm0x68ltEvUWvakGwcO/f3QYWA7v7zUvaHwmZj8nsLKi
 GuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754651209; x=1755256009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fah6fDAHPsacje0Bek0+yZMl1AG/AjYc/B3XNcGffoE=;
 b=nr7WVdrXKbQEKSV+P8imO9LJYcLGjPSOu02tv1cE8sIX+J8JnHamy8pHefvq6vWKvR
 a5p5Vf1WNz3gPey74zUBIA/F209wuRWdp8MSskH2e8R0iOXtjvPNeGVbdnNYvMTzkQIh
 9sYH6CqOnqydW4gGHAQ071Mv64GHKX8XRQ+CXcugLMnUNCMu+IHYIZG/G3TLTHFMoSJR
 F2qTzBLBC0K65Zg+1EgZtB8T4chWPp91IEOZ+QWnafhoeYER+XZtvYSvI+CUCmoXCD7B
 fesZXhAlmK95BuymF91/voLvq5AJvMCu1pc/Yt8J72Xs2RZu54KBbcrijT2uMpEuuh5V
 ZLtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFDQZTCL5KNcevNhfhrH3KpMqXTzkbAF0s80Tgh35yrZreiGy7Eb2ChAsruUDdO69xKnIifSdDx1A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJDz5WsIk1Gcba+mDVHdJ5lOMH0mkApongr9HVqaEZIla0MUoc
 0dVb0NkI4quW/N/HmOFbmbA8/7WeoaM5FCbwbL0YYL/6oXblcrRaY6eO8TFx0UagIwAHGXiB1a6
 hUBFrNmKN4nH63o5+150hkvg74nAyZJF1dYbuJ7oPQQ==
X-Gm-Gg: ASbGncsA7IB9bWR3Gt4oErHZwUENdLMkxKAMzINsOl4FhY6Tz/ibLNs0IaU2AFCbtp5
 bZ39QJFdoP16ToiRMPBN7qmOdZjELYnhWlbfLIaSPhGe/CnJdASnFk7UngoEDzS4RLLGc0cISpf
 H1FvbOSbXQfDXMl1w9pSzqLaUk6pR6XpBop6Mgh3uhLZM2T9oojDj5xgQkn0IsNh6X93EAK6xPv
 Ta3qvA=
X-Google-Smtp-Source: AGHT+IEOmZWups2hN243iqfjpByJua2uFwUShIijfWfI1uxkQNIXMHQ8pxhoL0a3kOPMvbSICL62EXJEvEDnDiUIOx0=
X-Received: by 2002:ac8:7d89:0:b0:4b0:8092:9918 with SMTP id
 d75a77b69052e-4b0aec614dfmr33698741cf.1.1754651209282; Fri, 08 Aug 2025
 04:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250808010235.2831853-1-adrian.larumbe@collabora.com>
In-Reply-To: <20250808010235.2831853-1-adrian.larumbe@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 8 Aug 2025 12:06:37 +0100
X-Gm-Features: Ac12FXxZaEscduPvHH0B0nLaHo4tpAPiZNRtVv35--KBYHU6yGJnFgpNl8UoigE
Message-ID: <CAPj87rNnjvsJ1P89dv+OtawBXTLwfcaS41mzOL9Z1SwtjRcVJg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panfrost: Print RSS for tiler heap BO's in debugfs
 GEMS file
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com, 
 Christopher Healy <healych@amazon.com>, Daniel Stone <daniels@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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

Hi,

On Fri, 8 Aug 2025 at 02:03, Adri=C3=A1n Larumbe
<adrian.larumbe@collabora.com> wrote:
> Otherwise it would display the virtual allocation size, which is often
> much bigger than the RSS.

I've pushed this to drm-misc-next-fixes to land in 6.17 with the
original commit as well.

Cheers,
Daniel
