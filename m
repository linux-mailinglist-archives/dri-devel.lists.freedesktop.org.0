Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ED27F659E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 18:39:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F86C10E2FB;
	Thu, 23 Nov 2023 17:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0371210E2FB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 17:39:20 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-da819902678so1056952276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700761160; x=1701365960; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VjgH4EkUYchg4j5kMkgkHWQ0qshINLgkzgLZ6QI8pc8=;
 b=g9CATDwSHqGiOan5iTbx07qIQAcNARbWdCbFt7VqX+hjbAmFDlIvL2xRX4I6rfOEMM
 wx4Y13xwutXuWiLcGGHkTBXGZ75c2mUZodai7csfuH1S2VSIMTeACjEFmGdE9zW+HoNN
 nscAZQcvAsOn9c5xmw5EJx1eVLRrqlGmENDnb4FgQHHoNTN5OFOfKIdSR5LBFGUdWAiR
 LtinB7hv+d+rhzIMHuCedjNu6FzRjyfCfmsCQEIf3yP/qlwNUEQm3e69wUXvQ91FEPyv
 oJcpaag82fYcmDJWJy0B/erTJmGgeGoP7m2DPip173atuUCs0KBHqBWucj+Kc8qz9dac
 iCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700761160; x=1701365960;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VjgH4EkUYchg4j5kMkgkHWQ0qshINLgkzgLZ6QI8pc8=;
 b=OV5keKAWkgWAYdZbrUU1s02lDwKkUsNxjjmzJ2OYgiwaQtkbteCqZ+/IRm/DFO2ecM
 WyM+QX4FM7u0I30FaWvOUSyMBLpdrjyLwszmoy3IgFyHFoZpVmfCWT3xH/BNUERFscc0
 tTcLPin1yu2OUmxsIVHhqi3czHJNc87qzUDNsiU58MgkblwGWixqz30qUlGhHzsQ49mX
 iG2ga54Jt5OHijqXY8RUVp+Q+tcy8WyZkaN9dpIoJ0fbKIGcEie0kManenGnxBK7E4xS
 D/LfGSsrqCfpMeZ18cHC73T4Vn48CDsY/dN9zgYf22pujXJvBMGxNTYBp4WYre6SA6on
 s+/A==
X-Gm-Message-State: AOJu0YwgToGgyn4AdDR/QFujl3n5L69H0MMZPqWMtcoOK3ovn08p3jgR
 BbGfIIXp72EyyH/G2T5DbEkO7MYqOAkGgWVg2RTuMQ==
X-Google-Smtp-Source: AGHT+IGBZtcTHAbj2wdNf4qoa5a7G0j9kuSPQXq5UsQCdvUM1YHbdFfUVoz/McPrY9b6Ui2wjsez126KRpqKrjfM69M=
X-Received: by 2002:a25:5845:0:b0:d9a:e129:92a1 with SMTP id
 m66-20020a255845000000b00d9ae12992a1mr5443261ybb.54.1700761159972; Thu, 23
 Nov 2023 09:39:19 -0800 (PST)
MIME-Version: 1.0
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <79301d04-c0cb-4740-8a6d-27a889b65daf@linux.dev>
 <CAA8EJpom5kAbDkacOdqp6BR7YPfmCSXaQfDYRVcLf9eGmi64CQ@mail.gmail.com>
 <121163c9-0d56-47ad-a12e-e67390fef2b4@linux.dev>
 <CAA8EJpowjhX=LL-9cnQL4pfCei63zNkCGW5wGOeeFxcnFpNCVA@mail.gmail.com>
 <00ba2245-0e48-4b21-bcd4-29dfb728e408@linux.dev>
 <CAA8EJpoiehS2wS3ri_DggzxeEfLY4yK7X6c+bCFKvkwSce6r+A@mail.gmail.com>
 <77c3ad35-24e4-4bf4-87a1-f48e13a6b838@linux.dev>
In-Reply-To: <77c3ad35-24e4-4bf4-87a1-f48e13a6b838@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Nov 2023 19:39:08 +0200
Message-ID: <CAA8EJpoAOeb_zGBwGPN0ymo=ZJk3_jFamhF3Qede-9uBvXpK0g@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
To: Sui Jingfeng <sui.jingfeng@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Nov 2023 at 19:04, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
>
> On 2023/11/23 16:08, Dmitry Baryshkov wrote:
> >>> The host can not specify the
> >>> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, it will cause a warning here. And
> >>> it can not omit the flag (as otherwise the first bridge will create a
> >>> connector, without consulting the second bridge).
> >> The semantics of DRM_BRIDGE_ATTACH_NO_CONNECTOR flagare implement-defined,
> > No, they are not. Semantics are pretty simple: do not create the
> > drm_connector instance. Pass the flag to the next bridge in the chain.
> >
> >> for our case, I could just ignore it if their
> >> don't have a signal(DT or ACPI) tell me that there are multiple bridges
> >> in the chain. This depend on community's attitude.
> > Ignoring a flag is a bad idea.
>
>
> Can you also read the code in the bridge/lontium-lt8912.c please?
> when flags == 0 is true, the lt8912 driver will just create
> a drm_connector instance in the drm bridge drivers. The behavior
> is similar with this patch in the perspective of spirit.
>
> And the most important thing is that no matter what the flag the upstream
> port is passed, lt8912 just always pass the DRM_BRIDGE_ATTACH_NO_CONNECTOR
> flags to the next bridge. Does this count as a kind of ignore? or
>
> This is to say that both the lt8912 and the tfp410 drm bridge drivers are
> allowing create a drm_connector manually in drm bridge drivers. They didn't
> being asked to move the drm_connector related code to display controller
> driver. I don't know why I can't follow this way?

This is called 'legacy'.

>
> Do you really read the code before do comments or I failed to understand something?


-- 
With best wishes
Dmitry
