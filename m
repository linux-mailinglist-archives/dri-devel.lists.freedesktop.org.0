Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E5851843F
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB66310F9F2;
	Tue,  3 May 2022 12:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD94F10F9F2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:26:06 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2ef5380669cso177499967b3.9
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/kdLTIP5KWv/w0AGbW53dgxr50ylE5lpuqrP/XFE1k0=;
 b=sZ1hgtTI7fxvaZ0k0uOV0GVYFCdwj7DY7WyRTiIERlNBLwVMA0aHkM9eKI80hA90uD
 TXVIUXOGNCaChIHkrDbRhvfjvJ0FLlxpCu/9Fcn4eqBj6GWfHbSOtkkgrbdVdckmuHJO
 QMdo8MDD6ZfD78z6MNJYaz4rHtJumcdPKAyidpPq6G6BV//fDOirycvGWFrXm7CGonHd
 jdt8JKOKbEldXBTe+9cfzR5GgqTyKwjsF2/aeOcX/05Xhs9WsVZW9XRZwxak4N+E2GlS
 VCEGLtHKm24ij5PYMb7kqfkjC9t8ITlg/FFNoZl2N4ZKuZ9lIWVaA4+F+58PlU6+2wEs
 L6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/kdLTIP5KWv/w0AGbW53dgxr50ylE5lpuqrP/XFE1k0=;
 b=4fyfFcYg9A7jgvNf0M2H6gyg1Nhzk+9zZGqywhPM/ahj1m9qoqhZAnBmYFyZfdp+7y
 1kMLgv/GSKz1IS8OsqRfhqgbkrPOVuji+8U8T8v3ORua/F1XjqQ4gryLgb/RMS/2P2jf
 ZqwRi24cJBwyXGxGrrTM+cNs8a1ccuTc9qbavcuMnRFx9jznoU7bW4/nyM9AF/LshQ/Y
 1aG50Mi+rSgb6fh61aP5c1j+EDOUkiJh/XQSnlFWz7qk8nBp75OW0OM5APblXunDhOQ+
 7Db0GriDQts3Ds8UgqoO/ZUW7QX7y/AzYIQHjqx8nOa4euHm3awpdPN6n8fsbE95H6Lt
 qDJA==
X-Gm-Message-State: AOAM530MMV5jBFS6QadCCSyL1u6tNBioTHWtt5uK0mD6ADKAizylBYnV
 OmLX386/So6rC8o31nNybyxTURjtmHBdFQGo432FIw==
X-Google-Smtp-Source: ABdhPJy748BeoJGvdERlz6RifdnU94P5oaWHAfAf55iJWUIXN/sTYUf3fG9793RzhGeYw55AQSLOvtiy7IjggXp0lMY=
X-Received: by 2002:a0d:e5c6:0:b0:2f8:c866:7af9 with SMTP id
 o189-20020a0de5c6000000b002f8c8667af9mr15130119ywe.268.1651580765968; Tue, 03
 May 2022 05:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220412215000.897344-1-richard.gong@amd.com>
 <d4ba3998-34aa-86d2-bde9-bc6ae9d8d08d@molgen.mpg.de>
 <CADnq5_MgvcGPWf2gYn_3qCr+Gq1P39tvv-W-o8NhivvMpMwUBA@mail.gmail.com>
 <91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de>
 <94fd858d-1792-9c05-b5c6-1b028427687d@amd.com>
 <efc1dfd1-2b54-aee5-1497-4b800a468141@molgen.mpg.de>
 <237da02b-0ed8-6b1c-3eaf-5574aab4f13f@amd.com>
 <294555b4-2d1b-270f-6682-3a17e9df133c@molgen.mpg.de>
 <5adfe067-dc00-6567-e218-c5c68670cf5b@amd.com>
 <543a9e76-ca90-984b-b155-a0647cdeacff@molgen.mpg.de>
In-Reply-To: <543a9e76-ca90-984b-b155-a0647cdeacff@molgen.mpg.de>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 3 May 2022 13:25:53 +0100
Message-ID: <CAPj87rOERk-kNa6n-UdjQsDKXP9zzm8=an=FHcM+33yebW6ECw@mail.gmail.com>
Subject: Re: [PATCHv4] drm/amdgpu: disable ASPM on Intel Alder Lake based
 systems
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: Dave Airlie <airlied@linux.ie>, Richard Gong <richard.gong@amd.com>,
 Xinhui Pan <xinhui.pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexander Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 1 May 2022 at 08:08, Paul Menzel <pmenzel@molgen.mpg.de> wrote:
> Am 26.04.22 um 15:53 schrieb Gong, Richard:
> > I think so. We captured dmesg log.
>
> Then the (whole) system did *not* freeze, if you could still log in
> (maybe over network) and execute `dmesg`. Please also paste the
> amdgpu(?) error logs in the commit message.
>
> > As mentioned early we need support from Intel on how to get ASPM working
> > for VI generation on Intel Alder Lake, but we don't know where things
> > currently stand.
>
> Who is working on this, and knows?

This has gone beyond the point of a reasonable request. The amount of
detail you're demanding is completely unnecessary.
