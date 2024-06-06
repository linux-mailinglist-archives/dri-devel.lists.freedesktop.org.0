Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8748FDCD1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 04:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9371510E840;
	Thu,  6 Jun 2024 02:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="eSfMdGaN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047C810E840
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 02:35:25 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-627ecda47d0so4274597b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 19:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1717641325; x=1718246125;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWbZE4IHnSQNJX1Cr059FeAfCDjIY7ZcvY1qnkeTunU=;
 b=eSfMdGaNGe/OmsF0/xO7/Qqbh5u0jR+ORBx7g7Iw/myh4Cr2+gyE+DZMuwLktPxikH
 QnEe2rE75KrWJ0zMtxtJ0m9wS/pE69Am6LQrvC7nKP3u2wrXM/Fi9LJJ5wdPk0/4Nh94
 khzGAtWeaoUoMh1uRVKNX/nYZluhPstdIhp54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717641325; x=1718246125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jWbZE4IHnSQNJX1Cr059FeAfCDjIY7ZcvY1qnkeTunU=;
 b=ezPmzQc9t15MbOJ/hlThZsx7Oo6UXJEIuvF4bHXqRDoDlm5Ombzj6Bk/6KoYwi9/G1
 M3x7TSPYS04u9c7x3folQAQSE725vr9/2llB0DJvupHSFg6CaARMZ09iZyOQJmOgdmPI
 25+zqa1+GXP+vR7OyrjsPUGlPDxVtTjadn1xtlRT6hXzlBKuN/eG4KBG9rSLx93LcHog
 Bcdxf5iKCc+rrgXhEG0JZ2GjH9RIDI87eCXcIGgYhsG5z1m+j7HdIzLgf/EVJjtxAfWM
 PAlFtFO9mBHT6ah+FYgvGVRG8JN2cKW+5dPfULNoiJ/5TEWLwp6LBYyjrrCJfFSSK2pV
 NeDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlR4hKOgVrn03YL3XqytzGK7+ZnYg8YnrrUEk6jSosxihJHLPqSpTLv9ThqwDzIDM9IaC+GnP3zUsa0Aq1ICJCk1hlBVkqf+ikjAFBFUVJ
X-Gm-Message-State: AOJu0Yw4rw8xOh5q5DXscQBqh7esAjXI7AcNy2bXeIJ/fZC3KoX3inQB
 VE/nfzsgA/DbV52TzLAyZIVL5yIahQ77pOUwgL/TMx381IBwQQHEQfykThP6kd3RvvhOWgVUFth
 9NL/5uqrz2e6cKNJUPsSyRdo+gpMRYjblZWkO
X-Google-Smtp-Source: AGHT+IEetZtg3sd1WRfUjCaJp694k1J+jq1d22kipTdG54+7IYVn7+AwLxlfHKh9spCBKCQDFhYxQNkIgI+5c7y8imY=
X-Received: by 2002:a81:4c8b:0:b0:61d:fcf7:b79a with SMTP id
 00721157ae682-62cbb4ab5ecmr40559257b3.11.1717641318577; Wed, 05 Jun 2024
 19:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240517232858.230860-1-linux@treblig.org>
 <Zl38XRm7TAfb3azW@gallifrey>
In-Reply-To: <Zl38XRm7TAfb3azW@gallifrey>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 5 Jun 2024 22:35:07 -0400
Message-ID: <CABQX2QNG67dehASGQS-0C+9ikqk0Bb6Sfb3FtxrcXGhW+aXBaQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/vmwgfx: remove unused struct 'vmw_stdu_dma'
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: bcm-kernel-feedback-list@broadcom.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, Jun 3, 2024 at 1:24=E2=80=AFPM Dr. David Alan Gilbert <linux@trebli=
g.org> wrote:
>
> * linux@treblig.org (linux@treblig.org) wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> >
> > 'vmw_stdu_dma' is unused since
> > commit 39985eea5a6d ("drm/vmwgfx: Abstract placement selection")
> > Remove it.
>
> Ping.

Thanks. I pushed it to drm-misc-fixes.

z
