Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AAF7FD7DB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 14:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E775910E1D3;
	Wed, 29 Nov 2023 13:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BB110E1D3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 13:22:37 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a02cc476581so912997866b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 05:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1701264156; x=1701868956;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/VP3ii8qzlwzBFXOUvCIlM2ChKhNv0Z2flI0ZUJ06go=;
 b=XexfCZy/ZWvxBi066YMX+jtDIO+N8mVWJekeirP3r5vwq+gKI6snlZ666akON46ZOz
 6HxAZiS5UcGKBsYCEnuaV648NaSTXY+kRHeCOIDxgVKiK+G124M8/KfS+d233vKV9zIt
 1KVHZolGyZZfFjBBxdiz0IitmQxq+6finDaMLjRZFsRyRfO00wJvp339pGZe/iTKDYCF
 EDlJUC2LETgdOTzHcqfkbl0BF9xY0j8CZLi/D8KHGPRExedlLtuxrH5HS1MQiLy+SOlS
 iQwQA/FbhlMG507m/fN4ciyjsg1WqhD+WPI9WUbovMNImgXymUEKJHccIUR/gnzHnTHe
 mYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701264156; x=1701868956;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/VP3ii8qzlwzBFXOUvCIlM2ChKhNv0Z2flI0ZUJ06go=;
 b=ESuLr1ps76jFAWltFe/9TOsLtavRrKw1DnpMQbeOEDSQzzuoIi5MOGqlXw9RzB72IY
 FgzMlR19T2tk/uV54IDO5NMcuWRmqOOwlYznoagiiYERKCI4EfbAwWTKwxwHnFc/LjtK
 ytPMQsAN+XVf5hEvyeKdsuw7L8MuVNuLV30toNW6DzPGVJWiW3TaDMs3/SIRHP8iWm5l
 lPQvOgXwsTKz6+GIUBqgnLeYRY/TMZE3WnTqZK7DSlvC2dxubHUnqVeSAeaA1+8lCj01
 r+1r//O61/KHI9W5UuhZptlDIRlxqB/f/oIx/3GTrbpZd7Wbxppqkp7mWcC9vFHdSeQu
 dNIg==
X-Gm-Message-State: AOJu0YyeTYB5olK8m7Ak/SWi6QUZibQJHMw198a0fQ4uAwVmRpcJlU3l
 +ijILtztnMJzXObnMIclccFyGBOE3OD5LwuwYX5J7w==
X-Google-Smtp-Source: AGHT+IESfQEmd7uikH5eYlpIkIXnzdfz7yOnSZr9KANdmLWdgeBrFVefxKHw37NvqQrsvZJsay74wE6WyTTIfjyDBNw=
X-Received: by 2002:a17:906:3f88:b0:a02:a2cc:66b8 with SMTP id
 b8-20020a1709063f8800b00a02a2cc66b8mr11788067ejj.14.1701264156218; Wed, 29
 Nov 2023 05:22:36 -0800 (PST)
MIME-Version: 1.0
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
 <20231129121841.253223-7-vignesh.raman@collabora.com>
In-Reply-To: <20231129121841.253223-7-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 29 Nov 2023 13:22:24 +0000
Message-ID: <CAPj87rPKywWa8KxTCeJQz4vvgTwhPzL+y4aCX9zxZDkkfrvsoQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] drm: ci: mediatek: Set IGT_FORCE_DRIVER for
 mt8173
To: Vignesh Raman <vignesh.raman@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, david.heidelberg@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 gustavo.padovan@collabora.com, helen.koike@collabora.com,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vignesh,

On Wed, 29 Nov 2023 at 12:19, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Expected driver for mt8173 is "mediatek" and for mt8183
> it is "panfrost". Set IGT_FORCE_DRIVER to 'mediatek' as
> the expected driver for mt8173.

Actually, for mt8183 it's both. And for mt8173 it will probably be
mediatek+pvr pretty soon. Each of these SoCs (like most Arm devices)
have a separate display controller and GPU, with different drivers for
each. They'll run different tests with different xfails. So we should
figure out a way to support igt running for both devices on the one
system.

Cheers,
Daniel
