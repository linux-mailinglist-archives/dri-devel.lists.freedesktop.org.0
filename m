Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD68510352
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CD810E70C;
	Tue, 26 Apr 2022 16:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CE810E862
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 16:29:39 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id bv19so37181967ejb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 09:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a0oTNdA7KNR2J/3ArbqLGzjjNHn69huPblQOyFpcMmU=;
 b=ay+/wFuOA/A5B9UuK2ok01F4CWy/Jg/c3fG3UnmJY58z+IiVMF25FgNcTpnStSn1O1
 L2yCIJrBcSoWTp7poYjDnZN5/zUwO7A1bUwNlvbE1pp3iVfUoR5DOl/qcxh/zhmiW+kX
 DeuAEMa62jhqiBDH8yZizxkZLbLTXzySjnjwDrZNESqLa9ZM84sGxBKMLzrGAXeIIWqd
 nnfhFNdvMaN6hIu37nNFMiFwvBGs02KdQvhBTEdUti6l3rXQ5Zty2XQprQ/gcgbPr5dJ
 prue25C/lL5ll7PqJgjPGxaPxvYUvcEE6f9jWSNQCebhR4hoZMRZ0wX8hwiPKf7xqF8H
 j1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a0oTNdA7KNR2J/3ArbqLGzjjNHn69huPblQOyFpcMmU=;
 b=ZEKSpAouQoSQbwg+sF8TMuyH5y+TjxavqrR/Ew7gO7fnMrrdFHIeTyEaHlgww+M34Y
 Mox1b+OWrJvQHnSbc39qsCq81omWFdjY5hRRfZpoLOpckmK1319X6TJNoAsRqvRT2DBp
 zDsvW+Y/ubrDVpkOVAHIl59U0covTQfncdJfs3AERDOFvIWjY8FaueeOxtiDVi+nO+qj
 60HwSOzk6tCRO3qjfRHzTfgdFL6silo0elXC3a3KFv1Tj8aUfXyBKZ1+E9GL3rZPpQBw
 kMJ1X2HND/0mC0s3vRzePwN4VryUrY2L+mSZjfdbMD7xzygcu6NZYrt0EOkzkWNTFQpw
 B4NA==
X-Gm-Message-State: AOAM530dm+BAgcekXbCMsKncS1nHfyVoba2rHm7zm2ZPiXcdZed/9NIx
 nrblkqWjPgJu7sZkmDJIChpn16tuXUm/jWsAibfAD2FxcRk=
X-Google-Smtp-Source: ABdhPJxvkPz4LeLKwvDslrR6mnt/MYTZEJkmUaC5vJ2IZmrSOgjyEYXEod+5Q2sYfDI2Q3QQR7HNIdXB773QAmZ7pnQ=
X-Received: by 2002:a17:907:9808:b0:6f3:89ed:279a with SMTP id
 ji8-20020a170907980800b006f389ed279amr13041502ejc.308.1650990577986; Tue, 26
 Apr 2022 09:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220412204809.824491-1-olvaffe@gmail.com>
In-Reply-To: <20220412204809.824491-1-olvaffe@gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 26 Apr 2022 09:29:26 -0700
Message-ID: <CAPaKu7RwUwuQEGBB87CQysOFzPHbzjhW6we4dq198UsOWdoJyg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/sched: use DECLARE_EVENT_CLASS
To: ML dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: David Airlie <airlied@linux.ie>, Rob Clark <robdclark@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 12, 2022 at 1:48 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> drm_sched_job and drm_run_job have the same prototype.
>
> v2: rename the class from drm_sched_job_entity to drm_sched_job (Andrey)
>
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> Cc: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
This series has been reviewed.  Is it ok to land (if it hasn't)?
