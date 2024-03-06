Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD248873A58
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 16:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80147112A1E;
	Wed,  6 Mar 2024 15:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jmHUeMX1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9905E112A1E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 15:10:36 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6906a7870f3so15601676d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 07:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709737833; x=1710342633;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IOrkhaixLjiui7k6IQZDRBbES9GKSHpQRKMa/zH55cM=;
 b=jmHUeMX1l88rsZvwBeJj7Dc01x8waKK5qNAURKQR/80yQM/kIW3zXmtwTk9biezaIF
 zWOlfZ41/zeWEs/+J0AlFkMQmFs1k2J53AM7gc3adOXX1v/brV6PE6TSko+iL4OqWmXU
 TsNkfXwLQyOoz0AuHJMllBYOlud7bTMVmv7nA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709737833; x=1710342633;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IOrkhaixLjiui7k6IQZDRBbES9GKSHpQRKMa/zH55cM=;
 b=bFn7kI1fqnMYM8+P4oquOSQXjoA8w8Pbj6RqK+CnlAi2h17QJ4yliDN4wqUHpsODNU
 30YQ6nrFz1WnYVhiLJJ1qIrKh0YfBjRMB3SunhOSk5eyzK/0EnEXn5ZVHztki3Np0zlZ
 mpK5Mj063DW3f/w7necrRNIgKeH3rlT0FYeHwHtxFg9vxvm2bjnDSs0svgUOXFDEIcWV
 gEMy4LtClnPQoN0J9OO8Z/5n1aPDzTL6PWfExnyjHkNtkA1QANx2sor5hLvolg5Z9TWv
 +Wzi3Vy1FpU59VVM0Xqlru8gJlAtJnztMJqPo3zIHWlTzrOreAjFx9Z//Ukix8PrFT5h
 6eiA==
X-Gm-Message-State: AOJu0YzK+MGm5moONgs0qPu2EskqVcZpLJEmF0i8qrsXYKau1H01BuWY
 98++uJpyQ4b+jET9D7EQt7cCwHnwUIijxmOkx/jk4ebFbiuLxaPTvHvnVPL8JTsgwkzIHvpq0YI
 e7PBN
X-Google-Smtp-Source: AGHT+IFjtrQNRt4rvtApHRQqGxbKVB5gh7Aoqi/EiJ1bQFc+5wZP1mckbgPXHc6/dQ5O4Y93ozTwcg==
X-Received: by 2002:a0c:bf47:0:b0:68f:b8e0:aa3b with SMTP id
 b7-20020a0cbf47000000b0068fb8e0aa3bmr5522779qvj.14.1709737833056; 
 Wed, 06 Mar 2024 07:10:33 -0800 (PST)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 om13-20020a0562143d8d00b0069049135a69sm7364619qvb.118.2024.03.06.07.10.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 07:10:32 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-428405a0205so274271cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 07:10:32 -0800 (PST)
X-Received: by 2002:a05:622a:38f:b0:42f:a3c:2d4a with SMTP id
 j15-20020a05622a038f00b0042f0a3c2d4amr323669qtx.11.1709737831437; Wed, 06 Mar
 2024 07:10:31 -0800 (PST)
MIME-Version: 1.0
References: <20240306063721.1.I4a32475190334e1fa4eef4700ecd2787a43c94b5@changeid>
In-Reply-To: <20240306063721.1.I4a32475190334e1fa4eef4700ecd2787a43c94b5@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Mar 2024 07:10:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XMqNwFyswz0CBVPRa2wxZ-G8eY8QT2-6uTrNROjvOtkw@mail.gmail.com>
Message-ID: <CAD=FV=XMqNwFyswz0CBVPRa2wxZ-G8eY8QT2-6uTrNROjvOtkw@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/udl: Add ARGB8888 as a format"
To: dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
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

Hi,

On Wed, Mar 6, 2024 at 6:38=E2=80=AFAM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> This reverts commit 95bf25bb9ed5dedb7fb39f76489f7d6843ab0475.
>
> Apparently there was a previous discussion about emulation of formats
> and it was decided XRGB8888 was the only format to support for legacy
> userspace [1]. Remove ARGB8888. Userspace needs to be fixed to accept
> XRGB8888.
>
> [1] https://lore.kernel.org/r/60dc7697-d7a0-4bf4-a22e-32f1bbb792c2@suse.d=
e
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/udl/udl_modeset.c | 1 -
>  1 file changed, 1 deletion(-)

Pushed to drm-misc-fixes with Thomas and Javier's tags:

317f86dc1b8e Revert "drm/udl: Add ARGB8888 as a format"
