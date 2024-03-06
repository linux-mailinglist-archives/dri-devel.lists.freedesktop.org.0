Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D610A873CF3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 18:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8811113367;
	Wed,  6 Mar 2024 17:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7ACD113367;
 Wed,  6 Mar 2024 17:09:08 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d40963ec12so619181fa.1; 
 Wed, 06 Mar 2024 09:09:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709744947; x=1710349747;
 h=content-transfer-encoding:mime-version:in-reply-to:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=siC6Rqgbd35iVHa78mvb3c5AMDAEjw7t8lhcTcE4x1I=;
 b=J0kTfhgP1Dn/5SC0b2z9cvOmFM1GJo2UMEO9NPWwjyBkJ3hkMVzW8AWd4Fhunkrni5
 2W1nE31dI7EADKlT8J3qgvkJb8ndJ91UHBfBlVvCTYrsbRBgWtsaZ4AAd6pgUHxu2QqG
 HLCNUTkIuQeN/kjGMMGONnjgU2JwunTpgqpBWLIHgKZIXl/LPN2gcTKDbnlseULosyY7
 UQNswAq8aZ0E5TbVXii4tQYqqJwjTqZD3eHd3gct15X6593ICcIdaKrzyKpHhzdlJeUd
 3YCRNXUBviS1Y5RMv7tEKP6EeAE0Ym5Tv3PvsuDhyMIVs/wENrwg01v435DJtTqn6RzV
 0Xnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1MS2oZ3CocCLYPwsnkk44PP5XhsQZOprye9VbCUu+ArwwIJLiqBeNbP29UYkTuDPNjnPE11Y3Nt+gQ5c5VY8PHO3v7DI8kFWMfkg3m2LJIfGVCCKiX4Z7PIAHe2kmTMqqJODO5ryuUZztQFQjEw==
X-Gm-Message-State: AOJu0YyxZtNT++2dqCyHlF9Ipzq4OwrpN5Vo3b5TWx7t69ofBfp9zLbA
 RERnpvly0GQHoy7Aw5NGtKMXgL8z4Yi87bNPmrSWVawapG6y74fdlSvjLhnTcDQ=
X-Google-Smtp-Source: AGHT+IEZ4GjQImAsDKLWuAgm4H61qMpMKcoK6dO/cSgHALQv3JyBozIgy3SeGg3dScpl6S3vtemj4A==
X-Received: by 2002:a05:6512:61:b0:512:f6d3:9998 with SMTP id
 i1-20020a056512006100b00512f6d39998mr3686586lfo.17.1709744926283; 
 Wed, 06 Mar 2024 09:08:46 -0800 (PST)
Received: from xavers-framework.localnet
 ([2a04:7d84:aac2:e190:26ad:2e66:1a0c:f136])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c4f8f00b00412fb4f5756sm1417562wmq.27.2024.03.06.09.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 09:08:46 -0800 (PST)
From: Xaver Hugl <xaver.hugl@kde.org>
To: mario.limonciello@amd.com
Cc: Hamza.Mahfooz@amd.com, Harry.Wentland@amd.com, Sunpeng.Li@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH] drm/amd: Drop abm_level property
Date: Wed, 06 Mar 2024 18:08:35 +0100
Message-ID: <2333702.irdbgypaU6@xavers-framework>
In-Reply-To: <20240216153334.83372-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Like already mentioned in the power profiles daemon repository, I don't think 
this makes sense. This is a display setting, which compositors have interest 
in controlling, for example to:
- disable it in a bright environment, because afaiu it reduces the maximum 
screen brightness
- disable it when it shows color critical content
- disable it while profiling the display
- enable it when it shows content that's definitely not color critical (based 
on the content-type property of Wayland surfaces)
- enable it as a first step before properly dimming the screen on idle

If the primary concern here is that this hasn't been used by compositors and 
potential power savings aren't being realized, that could be solved by 
providing documentation about what the feature does in the kernel, and by 
sending a mail to wayland-devel describing why it should be used.

If the goal is to implement it in power profiles daemon and not get conflicts, I 
think disabling the property by default and instead enable it + disable the 
sysfs file when a CAP for it is set would make more sense than making the 
listed features impossible.


