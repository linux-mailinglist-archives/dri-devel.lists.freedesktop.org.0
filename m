Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5959C7D10E9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 15:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31AB10E0E4;
	Fri, 20 Oct 2023 13:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31F410E0E4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 13:54:56 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c501bd6ff1so12140711fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 06:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697810095; x=1698414895; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TU+4cLyMxwHmH/3SxQtozmdTv4a+pF1ZZa2bD4OIIaw=;
 b=iNFxCQWs4OpB63wfdx6oBn5Q4E7MC0wdW4g+1qzyB4N5o/ZvG1CgPCDtxOM7ne1QG8
 8lvhc/w4/enxCL6LdMcsvzEYK1USSPG4Xsfo/9A6dtrFFSED0ZopxH3SGmaIWuxERgJ8
 0hmBAN/s9+r04BzH3qI92rGBBkCH6bcegzz37j8t/P/7z7nLUgm/seuCNingfXiUf2B5
 /zbxcKGwNF5d6cnxwZfXFleVda02Ebp3mAxVW98obLR8JbKYuEmq22td25C5ouAKVm9i
 X/cExbiP3P5f3i1UNbD3vs2cDVm6sude9cQNw5Zp2vW6BbdiPAEDaT7SKLjW6gf53AdB
 pDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697810095; x=1698414895;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TU+4cLyMxwHmH/3SxQtozmdTv4a+pF1ZZa2bD4OIIaw=;
 b=TgtsHk8dGbuT6dSDoXOzM45PQNenBGM8IFyWIvVymwDzC7e4NXrNvGdKRnb7t3XPen
 aPJE9dtX9Gb1VF9tGfZmzxSg5vukcagjOdz2lxDam5wIzs2pI0yjCNU0Gh66TWMRGWin
 1LXE33ZXZvt9Gk7BlHcR1dg8CMmOs35TeO0Gew4TbIhh9ilpTJomvKWEEGI43WDvsdwp
 hk6RLZSxwGW5B/czfh8rl4C/8qLc5XObH/08X/y817Ya/5gEWpY6r294WiyvDQq7k/D0
 0TfjGrrS+PYjAZbfLrpokpMB88zRdZ5CX/UuCTAUQjaog4umigvOVi7L+P3Mihi3ejd0
 FJYg==
X-Gm-Message-State: AOJu0Yya+85WHrK/ObR16j7txpXtYJFJuU4xVTi9iRsbmiLZ3AcY89oD
 Azui/d4hIa+Qc5dmoEEMEy+FChWYdK4KXzlh9MA=
X-Google-Smtp-Source: AGHT+IEFqiuIcidUMc1LeR/QZcZbUQoUqfON9mFbzp2xrDe3YA5m+Fg4xU88uHgiUnwEkNKu9k9BhQ==
X-Received: by 2002:a05:651c:2092:b0:2b6:a804:4cc with SMTP id
 m18-20020a05651c209200b002b6a80404ccmr1248159lje.53.1697810095022; 
 Fri, 20 Oct 2023 06:54:55 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 ay10-20020a05600c1e0a00b00405442edc69sm4423429wmb.14.2023.10.20.06.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 06:54:54 -0700 (PDT)
Date: Fri, 20 Oct 2023 16:54:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: javierm@redhat.com
Subject: [bug report] drm/ssd130x: Add support for the SSD132x OLED
 controller family
Message-ID: <7dd6ca45-8263-44fe-a318-2fd9d761425d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Javier Martinez Canillas,

The patch fdd591e00a9c: "drm/ssd130x: Add support for the SSD132x
OLED controller family" from Oct 14, 2023 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/solomon/ssd130x.c:921 ssd132x_primary_plane_atomic_check()
	error: uninitialized symbol 'crtc_state'.

drivers/gpu/drm/solomon/ssd130x.c
    905 static int ssd132x_primary_plane_atomic_check(struct drm_plane *plane,
    906                                               struct drm_atomic_state *state)
    907 {
    908         struct drm_device *drm = plane->dev;
    909         struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
    910         struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
    911         struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane_state);
    912         struct drm_crtc *crtc = plane_state->crtc;
    913         struct drm_crtc_state *crtc_state;
    914         const struct drm_format_info *fi;
    915         unsigned int pitch;
    916         int ret;
    917 
    918         if (crtc)
    919                 crtc_state = drm_atomic_get_new_crtc_state(state, crtc);

crtc_state is not initialized

    920 
--> 921         ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,

The rule here is that if drm_atomic_helper_check_plane_state() is
inlined then we have to examine it to see if "crtc_state" is used, but
since it's not inlined then passing uninitialized data is a bug
regardless of whether or not it's used.  It will triger a KMsan warning
at runtime as well.

    922                                                   DRM_PLANE_NO_SCALING,
    923                                                   DRM_PLANE_NO_SCALING,
    924                                                   false, false);
    925         if (ret)
    926                 return ret;
    927         else if (!plane_state->visible)
    928                 return 0;
    929 
    930         fi = drm_format_info(DRM_FORMAT_R8);
    931         if (!fi)

regards,
dan carpenter
