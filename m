Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 240A770C61A
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 21:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775BC10E00D;
	Mon, 22 May 2023 19:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0817B10E00D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 19:15:01 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7606d460da7so98055139f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 12:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684782900; x=1687374900;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AwjBRA7/uhFNzHjEScJUwEdwFUFbBR/xMYomuf0Nyj8=;
 b=TWmLsLM9TACnOcxPQXCZqSIRRHd3hIHgYBbCG3Os06oxYS/3ekqoWZDd+Q6MXoCSka
 fkaC47xgsH2uyQdNHxJMvrS4UBrLEyTj/XMUkEjvwCJPRSEK2pncUQjsKTLq2RIMZ6eL
 QZkiH9n5mJyXn3vy0epa/57SasCcG8gwzydKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684782900; x=1687374900;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AwjBRA7/uhFNzHjEScJUwEdwFUFbBR/xMYomuf0Nyj8=;
 b=DlEKQanqhwtsl5PE06EXo+J5S/N5jQIjEJVE+0nHNBX0cuPMhjnhKWMnOGoAdDLcsa
 R21kfqe/DRdkZ7LNXeltu/josO2v/6JdLqx6/zlVA/pGjY6vum8dNObWTtDQErF20x1L
 /h+1hHQ/Swwnr74F7/7bwJ1mLfEjXzVUWKy1dE5nVLmSUvO5FEMtu3PYtbXEsH8cJLUH
 hNt2kd+5t6rhOw1JDlHxlUsMVDL1YFhKUSMbqPvpgYiPMjHdmBV/gycrlo7+D7La/GWJ
 aGwvgG+exf7io1dZCDm7/49PhGoGAcwsnL5cVkoUQnKd4Cje0ePp1pLn7P4iW5Y6myzX
 PRxQ==
X-Gm-Message-State: AC+VfDyiP6pwlL8c+Iy6M7RcI3uwbox3FFx1TshBSlJKYvsLaOEK7EgP
 bo97nrfqBGxqNtPb1CgkftIpgq4ZBCRcyhTe8e0=
X-Google-Smtp-Source: ACHHUZ4FRH/D0yXJENAgk/FlGlYawO+6gVCeqsmkHuv+S0C1oUe1gccwbmfBHikAhwIC0K9/SRbdDQ==
X-Received: by 2002:a92:503:0:b0:334:7796:f90c with SMTP id
 q3-20020a920503000000b003347796f90cmr7688188ile.18.1684782900763; 
 Mon, 22 May 2023 12:15:00 -0700 (PDT)
Received: from chromium.org ([2620:15c:183:200:e720:cc4c:7286:e140])
 by smtp.gmail.com with ESMTPSA id
 ed16-20020a056638291000b0040fa72e0b6fsm1823288jab.139.2023.05.22.12.15.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 12:15:00 -0700 (PDT)
Date: Mon, 22 May 2023 13:14:58 -0600
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: DRM_MODE_PAGE_FLIP_ASYNC for atomic IOCTL
Message-ID: <ZGu/MvxBpYqvvYSA@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

My understanding is that DRM_MODE_PAGE_FLIP_ASYNC is currently only
supported for the legacy DRM_IOCTL_MODE_PAGE_FLIP ioctl. Comments in
related code suggest that while ASYNC is not currently supported for
DRM_IOCTL_MODE_ATOMIC, there could be support for it at some point in
the future.

Is anyone currently working on adding DRM_IOCTL_MODE_PAGE_FLIP support
to DRM_IOCTL_MODE_ATOMIC?

If not, has there already been any discussion as to what is required to
make it happen?

Thanks.
