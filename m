Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0D4996A04
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 14:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154DE10E2C6;
	Wed,  9 Oct 2024 12:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ebcxlR4t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516F810E6DE;
 Wed,  9 Oct 2024 12:31:09 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-71dfc1124cdso685699b3a.1; 
 Wed, 09 Oct 2024 05:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728477069; x=1729081869; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BoXo3f7Y68PvCPMCc0T9YZbtyt8gkr+wUJb37wXCOZc=;
 b=ebcxlR4tSfVcQlUsyfVfznzkcM2kyfCuzJSaPFZ1H7yYWDkpTRezlfayMHFk6pd3d/
 pmFNMygADVSlHdJdExeq2k7jlkTP+lxm/VGo23c3kw90RKoS9mE15wWFujYM79R5PKzE
 +2d7SslomaqWmCzQlOKPzWwug8RKgjKZcn82XaYOXrFNzl4ya15nPNBNyNbsTBVZ5RLM
 Ilg0dTAeCXwGFV2ox59OdC/4PTWMmK7FcBiVmovhPIyoo7sfdanZ8Q9ae39+Yu9tlMXE
 1ZwhK6zZOdNVm6W+e4ZvD6spCRwV64auiitCPR+ra1252U3k0/4RQ//oBIqG7Hyd/Lgq
 hGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728477069; x=1729081869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BoXo3f7Y68PvCPMCc0T9YZbtyt8gkr+wUJb37wXCOZc=;
 b=vzkYSmfJFL82fjMWcpJRT/65RrnWGGv2pPYnKFRl8Bdp7csesqmsLJldQKI0jUiCpG
 o6Ls56dmxg2qx/nQwrvALRNPXWD1WyarASND510EipZsg+QZeaG/jWc08UBXfvsdvlnG
 J7NamAUWZngtA6zKUjke+6eL5/SKEF94Lm9CcFZJ/zPFI/70R53QbHLRrBb9M3tdcQ8h
 V7BOQvOFuglekKj/X/m1aDmHCuOB4LK/I+XtjyByqhryGOwTkrHRsPXsGm5AI8mHPwRF
 Z+IKUHR+TDYx1IrhWEU2YghnuiRYwsIlUsXo70WgWVpXoIJsS2SuCUPqu9EpUGBYJPw5
 HH9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCUXr2N68+dpz2UqmjCbNSx7Bo1ApAL8xJL8kNZWD/seJLhiE7rOOcgW2Yz4xvT9ikYvrT5GIO@lists.freedesktop.org,
 AJvYcCWw/7vGPk+0yPSYiH2D7DxCF51dOwqltjx6Rs/o8iGAkGM2jnnGQanfxFKTobb7CS4gj+FFvCiqyh/h@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3NgxONdRoZC5O6ruDAFq7E+RxojqUhSOiE2j6s2/3erKQz2Wl
 dt/5CsooOFnwtiMuSZUKjBYVUTOSDbfefrFF59I2DCtnthgjCl9lfILIlW23
X-Google-Smtp-Source: AGHT+IFfJ68/5foHByY+8GSZiuoecJs1L1P//p1m0klDWr3726ikTXNGjwCHw3o52TJ577X/xbO0cA==
X-Received: by 2002:aa7:92c9:0:b0:71d:ea34:977d with SMTP id
 d2e1a72fcca58-71e104d949bmr9104538b3a.8.1728477068657; 
 Wed, 09 Oct 2024 05:31:08 -0700 (PDT)
Received: from archlinux.. ([2405:201:e00c:517f:5e87:9cff:fe63:6000])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-71df0d7cf42sm7699558b3a.193.2024.10.09.05.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 05:31:08 -0700 (PDT)
From: Mohammed Anees <pvmohammedanees2003@gmail.com>
To: pierre-eric@damsy.net
Cc: David.Wu3@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 felix.kuehling@amd.com, linux-kernel@vger.kernel.org,
 pvmohammedanees2003@gmail.com, simona@ffwll.ch,
 srinivasan.shanmugam@amd.com
Subject: Re: [PATCH] drm/amdgpu: prevent BO_HANDLES error from being
 overwritten
Date: Wed,  9 Oct 2024 18:00:44 +0530
Message-ID: <20241009123044.109909-1-pvmohammedanees2003@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <d9a3fee4-bb14-4162-95b1-06177d0a9949@damsy.net>
References: <d9a3fee4-bb14-4162-95b1-06177d0a9949@damsy.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

I have sent the v2 Patch reflecting these changes along with
the Cc tag as suggested by Christian.

Thanks
