Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497F8C0E14
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 12:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DDF10E178;
	Thu,  9 May 2024 10:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="kwYdFWQG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7A810E178
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 10:20:35 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-69b5de48126so2785666d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 03:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1715250034; x=1715854834;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ofJNoM+WFsY5dD3W/Ots0aoJ4YE0LHXYdyyKBCzkIlQ=;
 b=kwYdFWQGfNsHTxcn2VcTZXY3tdj+wYwpZsa6E4etu/smDywQa/hO4AgodASBoDzbyV
 FbVc31M2jvPMFYa8yRRoIkD8rHDPwPUWFfabnpaSQlZrSs7eDmsUYdaGCJZKyxhetJck
 USFlwIi+iOARTvT1xlKuEdv71gs0dK/i8xeiaab8cTwdgF7O+T8E3RubFnmTSEqG6TLf
 fqgp9Aoo2qI3TNpy8Q6ZF1jdk35tYtwhcvnl3ruW00jRyf5mFzoR6zSvxf0R5v1xU8vT
 KHEQrryBY0Wazolu6rt4s3Yf8Ba7FGAn3eiiPnANenF8n3jgQF17qslj3wRA+1TjBHGG
 NuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715250034; x=1715854834;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ofJNoM+WFsY5dD3W/Ots0aoJ4YE0LHXYdyyKBCzkIlQ=;
 b=NqjQY7jE5yo1eaglStKkoj0Ukyr1J535QRBc2+gqnHqJlCTo4Gs/75TlAmdj/eUnbH
 X6r8diVn5LW+twlZQuBxaY0Ot/TwWxGE3fBlisskML57Se10IDIv96xqi3y/jxkRPquk
 aeTn0j486dBf3LOAjVTiixP2WmIBRVgn5a28zHq7XGN39OkXRl4YyxbVQ9J+WnGq8uZq
 5fdUZnv3QHRYCWwlNM80TUMC6vkPZkahvnJUTCBbJBzsfSO5LbeweB5QDXJ/Kd9QQZ5w
 MfixjMbeJoAq7V5nMookJm8Dzj7129P/EJQPTa2PH76tak31sxPZF+U/5FQ7q8DvhLTx
 8XNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA1nB7hgzGqVKGpUdeTztS1fGZWhkRWD5f6oK+OaIZ2HTNZcuISTAL1kF8+8dE9Inw8Qbp82SJKZMyGqDBwy8QUcWVzxrdXD1VxtXX8gRi
X-Gm-Message-State: AOJu0YyrWkRurPkiVrLiEATChaLPGFvV7nf9e1hg5yhQqcPq6uP+wjec
 g0VIhMS0JKTJbeVpeJByYShmHuqlc47lx3ZCiuZ8nDhPYuH49JXhU7etVmpLCmgf3HYMWDk9W85
 Dqb2ZhUr9/aUPTxwk7/lmyrPBOB5dWBN6eE7HKimwHfVhDxVm2Mo=
X-Google-Smtp-Source: AGHT+IGi3RlYbfi8fJ+W4DHtA3O09IY3hJz95kTFzo2FF+oGydoHzNs/s5uuQt6Vg3XddgJkXtrZJJwS9acIKasJRwg=
X-Received: by 2002:a05:6214:1d0c:b0:6a0:6676:f1c8 with SMTP id
 6a1803df08f44-6a1514e9f76mr52387046d6.59.1715250034270; Thu, 09 May 2024
 03:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240228102245.80469-1-jacopo.mondi@ideasonboard.com>
 <7frycd5jnd674cily3xz3p2yl2bjc2yrn3z6sw3dzqdpl4widp@hrgyml6b7vh5>
In-Reply-To: <7frycd5jnd674cily3xz3p2yl2bjc2yrn3z6sw3dzqdpl4widp@hrgyml6b7vh5>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 9 May 2024 11:20:22 +0100
Message-ID: <CAPj87rPyfgB5=09hGUgekREN-S+W6Ti1s3izo+-FSohtRtjOJw@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/fourcc.h: Add libcamera to Open Source Waiver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Naushir Patuck <naush@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 libcamera-devel@lists.libcamera.org, dri-devel@lists.freedesktop.org
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

On Thu, 14 Mar 2024 at 10:12, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
> gentle nudge for
>
> *) libcamera: are we ok being listed here ?
> *) DRM/KMS: is it ok splitting the list of projects in the way I've
>    done ?

My bikeshed would be to change the list to 1) OpenGL / OpenGL ES / EGL
and its extensions, 2) Vulkan and its extensions, 3) libcamera.

But it doesn't really make much difference; people are going to get the point.

With whatever reasonable wording, series is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

Thanks Jacopo!
-d
