Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA1A5B4EC8
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 14:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE7610E426;
	Sun, 11 Sep 2022 12:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA13C10E441
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 12:30:04 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-12b542cb1d3so6694645fac.13
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 05:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=GXvt6+VlPIhHOKITk2PzUWa0nWONYyaMAMJ7e2meRv4=;
 b=EZEl63xbvmbPjPG63Mciy2nY6cBBuCukvf2nwy7bFE5t6cAKB3BIVny2QgCzUDc3/J
 GGXLQ8fOQCHZxx3nuiJorYB4DIzC5UHObvp4C26qKEjFIFEkhlZBletYjbcfQFXBb7D+
 EJFmAngJDZKB2KHGA9AR5DdyOlAVqzAySu9tPXWPvoZgv61F+bqYWKDIQOKpu6C40LT7
 Ys+HlXc0UWQoVCeBWDwRIU6AJlyWA6O0rp6fx+cllTLzT0HntkqLzqDFGSicpqJ1kIOC
 GRRPPElz72Mrl88k3Z6fS4MrIMaFoNRjTz/5YXBfPg66qsNRD3aE0NHojk507crMv5Zf
 lAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=GXvt6+VlPIhHOKITk2PzUWa0nWONYyaMAMJ7e2meRv4=;
 b=p6y3DQ6PzE8KhIuy0SX6yUP2QwTs9lKOoFJcn5wXhG5YJPAoRY1dpQzpti4L5WcGg4
 XSALnAprHix2YvBnwbLbEHRjK6hnCVtdIHtHx8TyJTK8IOSA6Fl2QHsKpFubuYxIL9/B
 Y76vsa9qBzLkbNfaRoeDYeMmCE7jFkyDEk0Aazph5c68NLcdQ489IkTH5NfwvmcE8qV6
 54aulmOlKxMTCG5TOqasABFrmc+iGnqMSFkjXeaZziHb2TbTslHe4UrtgZ3pXY21SoMU
 wVf66qB/CSSLMeeQQ0UNP3tp5COESd4S/94ovpnGM4WHo4WAgPBq5LKeLfIX9/M48ne2
 EDoA==
X-Gm-Message-State: ACgBeo00kdDdSWuyYWizuLepVfm5eHaREVfRku8hpo+LsEzzXyDV6ftZ
 FiSVxPRAdzuENnhL15wBcrclgN492r9CQTqqsZY=
X-Google-Smtp-Source: AA6agR4tKbPZAxhfGLE9XIxmEkvIdgiAEldIFmg/Gd0QPI979tp+VbXg7FDSSgmCioQZcs+KGrS2eed/fftgabqlH14=
X-Received: by 2002:a05:6870:2d1:b0:125:5519:1e4e with SMTP id
 r17-20020a05687002d100b0012555191e4emr9233932oaf.264.1662899404072; Sun, 11
 Sep 2022 05:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220910190303.682897-1-mwen@igalia.com>
In-Reply-To: <20220910190303.682897-1-mwen@igalia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sun, 11 Sep 2022 22:29:52 +1000
Message-ID: <CAPM=9txFJcKivJn=k2_n=PJt646vcvBN=5m3zxXojYew1E4gaQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vkms: fix 32bit compilation error by replacing
 macros
To: Melissa Wen <mwen@igalia.com>
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
Cc: kernel test robot <lkp@intel.com>, rodrigosiqueiramelo@gmail.com,
 Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, melissa.srw@gmail.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 11 Sept 2022 at 05:03, Melissa Wen <mwen@igalia.com> wrote:
>
> Replace vkms_formats macro for fixed-point operations with functions
> from drm/drm_fixed.h to do the same job and fix 32-bit compilation
> errors.
>
> v2:
> - don't cast results to s32 (Igor)
> - add missing drm_fixp2int conversion (Igor)

btw I've applied this in drm-next, as otherwise I can't build my
32-bit arm build.

Dave.
