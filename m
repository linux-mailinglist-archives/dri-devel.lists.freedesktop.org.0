Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D0BA80966
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 14:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893AA10E691;
	Tue,  8 Apr 2025 12:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="hXc5WDAv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC4010E691
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 12:54:06 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4769b16d4fbso27776961cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 05:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1744116846; x=1744721646;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1SOIGAlPIPkahYwHYgAhAYgGxiTGM0nQCRzsKxtCV60=;
 b=hXc5WDAv3AdCcqWQ5x/MX4rHcK+e9KkKZu8KeXY/HLhS+/A1aKJlHMpJKLY/hTZM3l
 pxkWqEZhaY99jgzF14R6/MRK4uW9X1R4BI5MBYe4VtT0VfxNHzLEoOF4SNM9zvFOhZM6
 0UVEEIAu3zfo66PQtCufbOrgVjIrQyEDB5JceYqttcWfb913Z3+Omc+V/ycOSo4MCzj4
 KcAyFq2Gehc6tDcG1zLK46wBWQEoc6wV5/MtP6c0ITirp7Ixrkza6YW/FbxXKSqoElJV
 wwNWo+sHtxpzT31Z5nrwGYSHyuYbT76R5ZqIOFBtZTQxzsc3dchDElkLxUrWpfnk8mX/
 4Psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744116846; x=1744721646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1SOIGAlPIPkahYwHYgAhAYgGxiTGM0nQCRzsKxtCV60=;
 b=VwwYq5PDEBoK0ekSnMH82m2RJoWpWszEVoqZS4pXiwO2q99EwXT2c4o7Q80WfVGpWM
 FNF3TvfR4rajmlqwlIRUGicqKtHLLUcw5/2XaGKVKYhWKxMRIqNk7M6bhHGDh4GIhHht
 wKZeoEQ0kzq8ywMbqtARqoBFvagqnF0aN1dyRckVnSH3AWnukX9sg85gC940Jnn70Jug
 E1ZHVCNuayJ857wpgrraxoE6PlRx00JXIYwEomHJ2m4n/EXgTAy21xDbwaJGAYYR8NjZ
 PZGP3uvpwvsONF1bwOywqh9fninADxapwrIijXpn0JBUKwkjWFlUY3ELwqLvrooJbZcy
 UOxA==
X-Gm-Message-State: AOJu0Yx9fbSya4vJT22Aftosl7jrmn1L9ZkkUc0x3mTEKGE+y+JGMrD5
 fkNj4XJKx0ehySCPPZQJeyXl1gFfGPrcfnWQSa4Q+N5LxfNYhOy15DvDh14sEFeYsG7Uk68jHEU
 wAsOI+RJ3TuGWO5rpoETvDBy6jSQR3k6UhCeYYw==
X-Gm-Gg: ASbGncvjOWAHGodtMNdTwmtkNzIek7n0Ij/GHjwAKWOpUPQt+BhIKV7MKsa554TKXsL
 x9yTpSMoV3uAsdWlizyPQtNggkNS+hyDtal6BJaQ4JefYw5HCKJYsRU+3j8HIz2UgLKNsoRfliN
 E4QlxuI3lO/RPbwgABghB13P1UxEBhDmfcaQ==
X-Google-Smtp-Source: AGHT+IH3yGEDGjJ+ExPDzJraDIbXOlbPxjEAdovZolkPtLOhYIN/mYdqdh1ERqqYW1afqQxkR4tN0xJtMIS0s9JX2UU=
X-Received: by 2002:a05:622a:1:b0:476:76bc:cfb8 with SMTP id
 d75a77b69052e-47925991e1emr264246431cf.31.1744116845834; Tue, 08 Apr 2025
 05:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250402125320.21836-1-mail@etehtsea.me>
In-Reply-To: <20250402125320.21836-1-mail@etehtsea.me>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 8 Apr 2025 13:53:54 +0100
X-Gm-Features: ATxdqUHGBTjj2zUxmQ5zr7_KvWlRDt9LY2vuEx-FhL1ewaJPjLISUXXg8A6sWPI
Message-ID: <CAPj87rNiEXpdXVqJGNcKnKpypNgLMPTB2ciz+p56ppT2+9TzoA@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: vop: Fix noise on resolutions >2560
To: Konstantin Shabanov <mail@etehtsea.me>
Cc: dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Mark Yao <mark.yao@rock-chips.com>, Dan Callaghan <djc@djc.id.au>,
 Tom Hebb <tommyhebb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Konstantin,

On Thu, 3 Apr 2025 at 07:45, Konstantin Shabanov <mail@etehtsea.me> wrote:
> Disable AFBC for resolutions bigger than 2560x1600 as RK3399 doesn't
> support them.
>
> From the datasheet[1] ("1.2.10 Video IN/OUT", "Display Interface", p. 17):
>
>   Support AFBC function co-operation with GPU
>     * support 2560x1600 UI

You could even fail the framebuffer creation, so userspace knows early
it can never work, as opposed to -EINVAL from atomic_check which could
mean ~anything.

Cheers,
Daniel
