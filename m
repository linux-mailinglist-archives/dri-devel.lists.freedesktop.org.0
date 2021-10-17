Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F30430CF2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 01:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4B36E83F;
	Sun, 17 Oct 2021 23:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2D36E83F;
 Sun, 17 Oct 2021 23:55:12 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g10so63802014edj.1;
 Sun, 17 Oct 2021 16:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HGDF7aSpsCnbOIzpLibSSZ6HrZjSv7khmiYdmZc/2A4=;
 b=A0MXQEOSx4c0AtCl5ANQrkVYaRx7MHjAifn6OA4Jl4YEI6mSwBr1yU9Y5Noe6r0bzF
 g0ECFLGqKYCpyr20BW115nNXWTFCCK4yUwU7WjWdC/DV5ytUDyhGs6nsPZbzSQ1giMpf
 f0Cpyro5ZCaaBkLrVWMhyNtaPmrVwsJACI4JxsYK/uq9KOQxRJ99Qob6BYrt4dCONvnf
 ZE06c7bq7v+ePcKhiNugEEWeiOmzW50w1KHWjOe3nl4u4Dyk2QQxS5YT80qWNUQVaARt
 EaWRFTAqPID5P0hL5o+cJ3EmoLbLNyUohTRNY5yTaGI/VAZ0zcwjONJx3l+XnIBa3NYE
 sFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HGDF7aSpsCnbOIzpLibSSZ6HrZjSv7khmiYdmZc/2A4=;
 b=jNCc0neDNgwacnd9owlIIZjspw+TxdoHTBU8gdM174ysydoeXUdG/vmCVUmK/6R0xp
 vHxI2B28E8mIxXOqnJ4ckXvs6t3qOy/2+/bbiSW9Ysgp6iWLVU+PJQL1ZlzPR3fIdVIv
 NvVXa9VlgyOaErjA89xq+Bo3rw1uisPZ0LUqneGHj87axKKohqSZZzKnhXWzRxbk0qgV
 6oOHL00oUmvcxCIkW7rJ+s+ZWsUqt4ZdBAoYrt+BWK0nL3cpUKsBEFWVwNnnUpqdv2r7
 zvAymZh4lo/Qg2Lv7S2me3RNxybo35EvmQbtdvQ1FnTUgBNfkhZgqysgx47TcQTIKRnw
 sQUg==
X-Gm-Message-State: AOAM5333b+pGeoBfuhecYvcEbW/jYND5B6YwTbdDBkOXxqWJIEKGpTI+
 WBZPVMO+vWAHsNUnkZsvevzuVSQ1ekTC9c58fjY=
X-Google-Smtp-Source: ABdhPJy9QAKnaO/msGpoqzjiDLmbnVnZZg4fTGCAbq16TkXnLwpQdr8CfKq8kKtNPrZvnkV2s+gTgWd6/jAHciFVi9g=
X-Received: by 2002:a05:6402:5209:: with SMTP id
 s9mr38873024edd.250.1634514910528; 
 Sun, 17 Oct 2021 16:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211014090941.12159-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20211014090941.12159-1-ville.syrjala@linux.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 18 Oct 2021 09:54:59 +1000
Message-ID: <CAPM=9twtQFKU_oFyEoKg3j-OgVNDrODN180eYM+ASvFYyWjm3w@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/i915: Make the driver not oops on load on old
 machines
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>, 
 Jani Nikula <jani.nikula@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
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

On Thu, 14 Oct 2021 at 19:09, Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
>
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Fix a pile of regression on older machines which just oops the driver
> on load.
>

For all 4:

Reviewed-by: Dave Airlie <airlied@redhat.com>

though it would be nice if the clflushes has more justifications on
initial patch submission/review, maybe something for gt team to keep
an eye for patches coming out from internal.

Dave.
