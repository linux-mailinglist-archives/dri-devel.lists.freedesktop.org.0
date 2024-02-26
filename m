Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF89F8671C5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 11:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EE710F030;
	Mon, 26 Feb 2024 10:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="FbiRuXCB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5975310F03C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 10:46:56 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-42e75559043so7982711cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 02:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1708944415; x=1709549215;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u7I7d5osDP5GRj6EQPpg79dCaRhTSCM5MDa3lXjopQg=;
 b=FbiRuXCBzcC8KUVUifgNmqx0DQEZmxWXrnMzBU4s8xPRFHH48LGHn/KkjFDLPOU05e
 6fh/YQpewhpqPoanEsxSivnq7ShpoIF4V0nFdG90XebRHvMGffrHqVvxqZLROCMC6WbS
 El1HxoRBgBNoFMnRmQStmlw8oUGUB9z4x3jYqC7NIJNX59iL1rbYpSA6R2+3PVC9lqEL
 zfRi8nPCUK9WdWljsUDx4G47Ci9LggTXmuGjS+aUvmNdfzzXK2o919a6ebbVZc5yOKxu
 yENVMqgb1RlethnWKUXuOpLRpH8HexVkye3pyw5LOvexDb/20nl3PCcUweqYeN53ET7n
 vt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708944415; x=1709549215;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u7I7d5osDP5GRj6EQPpg79dCaRhTSCM5MDa3lXjopQg=;
 b=YcpWiGPa8NDqeyzDOp8vomY6a8umQBF/YZhI2XNZ2nCze7e544VrI9WRtqzpq8W+G+
 8Zr/XYn4hYBPth79bJJHf/Ch2fTt/8K0F+Z4b5RNjEuh7Z86R6TkiQvBmBfM+aAIlk50
 lQyHQdxGq3FylY8ePFy2xApvH+RDQ2YqIAZnlZBGpwvaBoOFxyrr4IQWo6rMDmxJx8oH
 5btmo4kHQDLnwFqrlHlUsMbwYIm8qE1jYZQkP7xF2uLc5ii0D4XS016XL/idhkv4glhn
 ZOx9m1ZopLOgoErU+4Mnd3a47p/UXdr3WEcRgK/3opcVhHzefuSisrs2es8fwx1rLvxc
 s6Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm/IzrXKUS6zTCe5EfcnKGR5tcvluUiJKYO9fIdxLuQ55Pr4XdaBGLTYmWaIXQCV2+6TKsF51zsnYApop9Sb8HiuJCbh+V9Yy2m+FQP3mm
X-Gm-Message-State: AOJu0YwGdKdLjgOVT6gmlV6V+VKsYVPhNQ7eTeW5vVgDVoHbRKE3aFBn
 mBl75b0T7ItkOpXv1n7frutrVodHGGmACKmqOexzeWwiil6KT3eYpjEnLBzDv0XVdiO5mnM83vW
 6CJeHawkXZIlMSeAc/j6VCzrz2WYExoOVj1KQSQ==
X-Google-Smtp-Source: AGHT+IHHrY0NvHwjigWczKb4D3QxZ41Uh3arNiqZU7ZGXj68Sf2YZkd0XuRm4u5WrHl59ZQUl9GHZR37KrV+2fw7UqU=
X-Received: by 2002:ac8:7593:0:b0:42e:7094:90c0 with SMTP id
 s19-20020ac87593000000b0042e709490c0mr5387408qtq.48.1708944415043; Mon, 26
 Feb 2024 02:46:55 -0800 (PST)
MIME-Version: 1.0
References: <dbdkrwmcoqqlwftuc3olbauazc3pbamj26wa34puztowsnauoh@i3zms7ut4yuw>
In-Reply-To: <dbdkrwmcoqqlwftuc3olbauazc3pbamj26wa34puztowsnauoh@i3zms7ut4yuw>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 26 Feb 2024 10:46:43 +0000
Message-ID: <CAPj87rO4K6QS8hVn-d6N8CEi+Uibmgo6mZ5bNGz2rZDUMshvxA@mail.gmail.com>
Subject: Re: [PULL] drm-xe-next
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
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

Hi,

On Mon, 26 Feb 2024 at 03:21, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> All of this should be fixed by now: dim is used for applying and pushing
> patches, which has additional checks so that doesn't happen again. Still
> pending confirmation from Daniel Stone if the git server hooks are ready
> in gitlab so we properly forbid pushes without dim, like we do with the
> git.fd.o infra.

Yeah, I did that last week.

Cheers,
Daniel
