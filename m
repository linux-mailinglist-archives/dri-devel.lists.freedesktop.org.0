Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF6A748402
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 14:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E424510E296;
	Wed,  5 Jul 2023 12:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6515110E16A;
 Wed,  5 Jul 2023 12:17:34 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3a1c162cdfeso4765091b6e.2; 
 Wed, 05 Jul 2023 05:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688559452; x=1691151452;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WHaJYkkoWiJSGGDBGpgeQFN7MbsuVxr7WFW0gmyjXTA=;
 b=Zs4B9aItH6VtyXrbhksxUuND8Db/AH9sGKaZHk0ln5kJWGDQ6WGZqC5VYjBjc0wfek
 cuwmHNFT9i4jHFWv4qisOeCaEn/VcrRmlC8P5eoRzTpQrThdqk07XlPCUXpdtoLGkFQl
 z7Hzys0waQ05tB63rjFs7boSvyZ8QIP80YkKtNbOOksrZp4BjwlZ+UCeqTdU73Qnbyp7
 uKUnDVbd7zNdIaghKtjQINDzroHtt6i8zkeRvu0vfqAwYBhehjN++OWHH2Sri1qotQUK
 yySLb6rOHvSF4mMK95TEUrHQbDEKWOjZJ0FnnXDAzrIjWFNfANDELdYstRAl488pYPiZ
 oCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688559452; x=1691151452;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WHaJYkkoWiJSGGDBGpgeQFN7MbsuVxr7WFW0gmyjXTA=;
 b=LvKmABVUp46E7nVlh/NG+TFfaM4NHRkEwTIuAgt1aL3lOSTc2dl3MF51CWOxwEiW9F
 mJ/v3agVc8P9pR9V7hubY1WY+ICjDqXJdatxQzuR9cM4eo0asqg2Adu4CpoTbjJGDR7H
 ZY1EexFJoRshgYZgidE+b7a9EryeWew0P3+A8mFBrOfF7QHs2Y4cK4rSIMOFnOJzwAGB
 ubQzBEv734rxa8jzaK5nu1Q9mVoj3yQ70BvY4Lcy/y6WNrdGHfbBEhEcv6YAaQIjfhdm
 rVWQPU1zIGd8eG4gF558kLislxnN/yVXnLYPZQLb8oJUR1mb+VNjcVMu7IsFzZhUyQNC
 H9yA==
X-Gm-Message-State: ABy/qLbaz+VOS8VLZ3um7cj2Jt/FXM8He4cWq6+KhMsH1nRp5wKTa/yN
 GZjPb32VfGOLfsNWqsWGXz5Y/o5WDo3pZIh+ZKQ=
X-Google-Smtp-Source: APBJJlGmd2YQxHbMPcUXogLn1oSwHE63ZETeKN2G8EQbu7OgMbsrRzzXMdlHMBwBep/9zR9fd1mWHG4XSJ7SsZm4y/M=
X-Received: by 2002:a05:6808:f14:b0:3a3:9ae0:efec with SMTP id
 m20-20020a0568080f1400b003a39ae0efecmr13526480oiw.14.1688559451929; Wed, 05
 Jul 2023 05:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <87v8eyoouz.wl-tiwai@suse.de>
In-Reply-To: <87v8eyoouz.wl-tiwai@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 5 Jul 2023 08:17:20 -0400
Message-ID: <CADnq5_Ps7NJ8NiK8s=aTtVjXjttOZtDVH96ToFu6co4DKRFPMg@mail.gmail.com>
Subject: Re: Missing AMDGPU drm-fixes-6.4 merges
To: Takashi Iwai <tiwai@suse.de>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 5, 2023 at 2:26=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> Hi Dave, Alex,
>
> it seems that the last PR for AMDGPU 6.4 fixes wasn't taken by Linus
> due to the missing signed tag:
>   https://lore.kernel.org/lkml/CAHk-=3DwiOCgiwzVPOwORHPML9eBphnbtM2DhRcv+=
v=3D-tnRrgbYg@mail.gmail.com/
>
> And more importantly, this series isn't seen on linux-next, either; so
> the whole fixes are missing in the upstream.  Could you check it?

I included all of the necessary changes in last week's 6.5 fixes PR.
Once that lands, I'll make sure the necessary changes make it to
stable.

Alex

>
> FWIW, I stumbled on this due to a recent regression report on openSUSE
> Tumbleweed:
>   https://bugzilla.suse.com/show_bug.cgi?id=3D1212848
>
>
> thanks,
>
> Takashi
