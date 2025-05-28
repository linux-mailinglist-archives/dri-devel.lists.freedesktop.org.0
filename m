Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5502AC6E94
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 18:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFF310E616;
	Wed, 28 May 2025 16:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=yngvason.is header.i=@yngvason.is header.b="D5Lfax8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4D210E616
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:58:54 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-70825de932bso12734707b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yngvason.is; s=google; t=1748451533; x=1749056333; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+DlT5K3RW1W1q0E9EAUPVxYzg49krvWWlXM2xIh54XM=;
 b=D5Lfax8BZ7CXfc9JTwRBE5+DfmtMys2wtFCzatvkATzG7+X/5eoM1o3bno74Sig8Gn
 xTCLcH2oBPcEbqOolbFJDRoAUxOY1Ahq82b39rVkX/FEirD1DRnvfjr4t4EBYy5HsTqk
 OyBs3KFnynpSFrkqGHD/Ragk8WUIC9PK7b2mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748451533; x=1749056333;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+DlT5K3RW1W1q0E9EAUPVxYzg49krvWWlXM2xIh54XM=;
 b=bU1rabgCIi+vLRzGOAf+Fj6Z9gQTxNL2O4ZWRrfFG9LB8Oneceyug6TbHXQoIS1eqm
 Bh3+bFH2f5/gkkB7r4WI2i3esMoNgS5cB+VvGsTAjr+8taZLjS8mcCaJSuSatSLaIW+U
 GGQLLrTXEfQA0GidQXpSCEWDRjOv2EoVn8rQubstIardlffDK1tLLXaNGsFk2Yq4wpIh
 Gv6mLEB14J+lEIZPk6Z5bZxhlt9/YYshP6vI1Rh5ohjcEbVhzY9LWmMcon48TPej9ELo
 IQjm/xRbiinGO0Ged/ziV/Rw7kXbbe0WFEYAb8ErWRBkT/1ljZpivRshB448klGSQ2ez
 KJQg==
X-Gm-Message-State: AOJu0YxuTLz7Eh2VtTEDTndR4U1HxsDrQLOffL9HEyXyv3Lq9cT1oEjz
 JCqHYXAecC7qqH//HkJvsX3hSnfAUrwW7VMdEF6qAz5Has4u2xqmbA/cEw7CG0VvXt7Uw9i+Tgx
 oTaARVRKkHUXbyFaE9WBGQkrjjWEcf7X0PxrmaG7yXQ==
X-Gm-Gg: ASbGncu7iWHZQuNr2c1FCZkdyRomTajr0XECt+xjo8aN8jj/BYj28ZIB1ZbCvsIch0V
 n9uR1NQ07MDygm5JOmbBjyrFhz0zvYyKE8Pub3LZixeJstWRhZsFmmIrs6rqFrxqWivmt5K5WAS
 VIJvCMJLqcjzthuQ1fSb6OQ6xKqqjoinDtZlo+jQNw409NVXbtbd1PhNXSiOEitIuv
X-Google-Smtp-Source: AGHT+IH/HqlvM/P/LySa02hOa0htvMZR14ZbVRxYz1QC3ZcT93zAuME43VeVM9bkg0ty+0Y0EMPBhJb2AjlybMMn5Z4=
X-Received: by 2002:a05:690c:670f:b0:70e:2b06:b045 with SMTP id
 00721157ae682-70f87666732mr6193217b3.5.1748451533524; Wed, 28 May 2025
 09:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <SJ2PR16MB5525F636C5B7620CA5D400848167A@SJ2PR16MB5525.namprd16.prod.outlook.com>
In-Reply-To: <SJ2PR16MB5525F636C5B7620CA5D400848167A@SJ2PR16MB5525.namprd16.prod.outlook.com>
From: Andri Yngvason <andri@yngvason.is>
Date: Wed, 28 May 2025 16:58:17 +0000
X-Gm-Features: AX0GCFuwwQboZHtEuFHEmxC6WYwoNHOd99ULwfHjOYeiXsUDDGPoRu6ifnV7qYk
Message-ID: <CAFNQBQztun1QvGsgMX7jXns9_GeLoDjsmWHAyrPT+w60gNif4Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] New DRM properties for output color format
To: Sean Summers <Sean.Summers@qsc.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
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

Hi Sean,

mi=C3=B0., 28. ma=C3=AD 2025 kl. 16:24 skrifa=C3=B0i Sean Summers <Sean.Sum=
mers@qsc.com>:
>
> Hi Andri,
>
> I've made this patch, but I'm unable to configure the video pipeline for =
YCC 420. I'm using libdrm's modetest to set the output format / colorspace =
and pass a test pattern through. Modetest can see the new "force output for=
mat" property, but it's being rejected and falls back to RGB. I verified my=
 EDID has support for YCC 420. Can you tell me how you're testing this chan=
ge?
>
> Here's my modetest command:
> modetest -s 185:3840x2160-60@NV12 -w "185:force color format:8"

I tested this using wlroots with these changes applied:
https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/4509

N.b. there are instructions on how to reply to threads on
lore.kernel.org. For the original thread, instructions are on the
bottom of this page:
https://lore.kernel.org/lkml/20240109181104.1670304-1-andri@yngvason.is/
It's needed for bookkeeping on lore.kernel.org and it's useful for
recipients who will otherwise have to search through their email to
find the context.

Regards,
Andri
