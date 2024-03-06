Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D233873E03
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739E110E141;
	Wed,  6 Mar 2024 18:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="OS3eGMRf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B3910E141;
 Wed,  6 Mar 2024 18:00:34 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 03FC2320DDF;
 Wed,  6 Mar 2024 18:00:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1709748033; bh=84jG00TEsrHi5SDvhc5Wa3urRhoVoEpEGQn5XNo/Ers=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OS3eGMRfG1qBw10+8e19wTAZjJnCOyGIEqb8BM/Pe1W/b6DPSJmYHMtyOVj/xuL7C
 XEgm1yA95G/0vYXaoWJw5i+An34YlZ//XJlhRqYFaSXXnLVofWWFNEAJ0FUF648pdc
 XvnK9DoidkkiRNtTWLaFdGhMkHVR1D0+nmLJoSZs+QItVjg0wzkzPDbeAjYKa0P/+C
 +yO/abWdfI0WBlF17x4WSvKErtiZeIq4Bl4nKCUyIyUm/Ve5Rbh7SoeGw7WB9ozANa
 zvDRUMcI2Ljrr/VIkbsTCHrXVd1XRXRBnqbibX7eRfzT/8Kf9qUmmBU5riAE+RUTsK
 dW7U/fJkqxy8Q==
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a4467d570cdso5001066b.3; 
 Wed, 06 Mar 2024 10:00:33 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX7wzhrvBFG5SyzEucshDzck5gRRjk0lgKxqLamMzzWp9tZOlMDwP/6eBhFMdsNdhHXJRU0rnW4LP/nBFjHpqXI0PzbyfbHjBVBaIj6a1S+s0aP8fDq0vxs3sulLquHr6/MYIX9VZO3L3uO+NqXVg==
X-Gm-Message-State: AOJu0Yz4eQy5Xu6AwEekOO+N8HXL1yH/FUwuOHWXbf0TbEN0jx8mewZF
 ICNKcAtQTf2vt+OJEP0LrlYvA0wngj5mvbYpMyoMkTyWiVSMG/jpVvzc6mPcy5uNqa35iswmG2k
 zbTpyEdjWqkHQQakUUkSw6f/arDU=
X-Google-Smtp-Source: AGHT+IE1fLcf7gOSMUfIhAlw7D36quPs47gO0+Q0VmxRnATf5HmdGeXbIQEY7YZ88zu1C4R/Q8Q60CbwoAfO2Fr68So=
X-Received: by 2002:a17:906:ad89:b0:a45:5109:5206 with SMTP id
 la9-20020a170906ad8900b00a4551095206mr6184485ejb.64.1709748032559; Wed, 06
 Mar 2024 10:00:32 -0800 (PST)
MIME-Version: 1.0
References: <2333702.irdbgypaU6@xavers-framework>
 <e046ff23-8dd8-43ce-8249-c42d0bff7f5f@amd.com>
In-Reply-To: <e046ff23-8dd8-43ce-8249-c42d0bff7f5f@amd.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Wed, 6 Mar 2024 19:00:21 +0100
X-Gmail-Original-Message-ID: <CAFZQkGyHo8wWXhQYeSm+F37unvfE6O2USiNu5RVu5Zq+EudQmQ@mail.gmail.com>
Message-ID: <CAFZQkGyHo8wWXhQYeSm+F37unvfE6O2USiNu5RVu5Zq+EudQmQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Drop abm_level property
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Hamza.Mahfooz@amd.com, Harry.Wentland@amd.com, Sunpeng.Li@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
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

Am Mi., 6. M=C3=A4rz 2024 um 18:19 Uhr schrieb Mario Limonciello
<mario.limonciello@amd.com>:
> So the idea being if the compositor isn't using it we let
> power-profiles-daemon (or any other software) take control via sysfs and
> if the compositor does want to control it then it then it writes a DRM
> cap and we destroy the sysfs file?

Yes. That way still only one party controls it at a given time, and we
can get both good default behavior for display servers that don't care
(like Xorg or compositors without color management support), and
compositors that want to put in the effort can do more specific things
with it.
