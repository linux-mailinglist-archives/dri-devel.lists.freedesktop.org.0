Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BE06A1967
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 11:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1553410E203;
	Fri, 24 Feb 2023 10:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB5E10E203
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 10:03:36 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id d20so13178403vsf.11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 02:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TOM+IbwtBAiPFvq6ycNMUw45nB2aH2u3BMzF8LfulTo=;
 b=lJjz2Ig4+Qs0/rc6HicYYxTiXTrw3KU0aEtlIWog/dkOb8669avk/G9Gc4z2yCrPEl
 UoSJKuPWV6wmTncogJPoVR1Libzx7QPM8JhpBQbdMWNV0msZeWG4uvYtb/X+GnIDdPXR
 xm22++ecslEfdQwZpn9qB5YEVo0hakXaU17uU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TOM+IbwtBAiPFvq6ycNMUw45nB2aH2u3BMzF8LfulTo=;
 b=3Hv1mb5/H8kjXnSnNdFL09LzmXGK01hDgF/4blRSCHfqOPVr6Way7Urnl55HKkgrfO
 COWjO7IhTXMK+/2V3lpvSia66QEoJWoyF5EiYSuwUm9WUwKIOa/PVUGmJt/7OWVPgBzW
 T3SCRu0gRhCrhwhbs7ekGe91HgaBufnpZPom87re4SRVUCNTQx+VBV9CZWeUgQ7D12qO
 KdztK86uIV6XvbR4KONRc3ByGFkOEj/A3DBRLTdCExmyJ9m+xKAu4+HC0Q09XYoZ/uuP
 5tmvADeGifxraNmL5z0f3I4D6YymHADhhwCfjI56KNdsX8UBm3vkutsSWKss5W7Ju9OS
 SSJw==
X-Gm-Message-State: AO0yUKUlTek28zpB9vz+Z7knFFgWji20dd5D18hz4KVy0Z9SKGOa+XwT
 zOxC9qrOsefVeu7M1fNXLYwpKY9mhOIE3Hdz9HK5OA==
X-Google-Smtp-Source: AK7set/SYPCxVBflpRQGKecsjnyfDdkoGF7kargtYFZ6pSE/pnkb0nj2hS8BJcPINJZtdPjnTGck5LQCaDsEStN/Zvs=
X-Received: by 2002:ab0:1014:0:b0:68b:90f4:1d8c with SMTP id
 f20-20020ab01014000000b0068b90f41d8cmr4235195uab.1.1677233015332; Fri, 24 Feb
 2023 02:03:35 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-12-angelogioacchino.delregno@collabora.com>
 <4e0673e7-5685-ad1b-2fac-4ae544caefeb@arm.com>
In-Reply-To: <4e0673e7-5685-ad1b-2fac-4ae544caefeb@arm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:03:24 +0800
Message-ID: <CAGXv+5E68nV_Lj-fE5aTqBryUwMu+JJ0N=EZEzjLTXp+980MEQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] drm/panfrost: Add support for Mali on the MT8186
 SoC
To: Steven Price <steven.price@arm.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 4:46 PM Steven Price <steven.price@arm.com> wrote:
>
> On 23/02/2023 13:34, AngeloGioacchino Del Regno wrote:
> > MediaTek MT8186 has a Mali-G52 MC2 2EE (Bifrost): add a new compatible
> > and platform data using the same supplies list as "mt8183_b" (only one
> > regulator), and a new pm_domains list with only two power domains.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
