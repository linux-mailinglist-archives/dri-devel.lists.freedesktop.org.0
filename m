Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C9254D199
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 21:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EBD112A82;
	Wed, 15 Jun 2022 19:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFBA10FAC9;
 Wed, 15 Jun 2022 19:29:04 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so17787177fac.9; 
 Wed, 15 Jun 2022 12:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Y4NhrC9ap1cWsoDMhoc9arNxoObzeSf6cpbEcoKtqOY=;
 b=B/P70sGpq6xUOe94W78uBcFHRfunszNgH2mj+2oSKF0RN2ETvCjk9qWg0+MBR1dD7z
 HDlN0nI0BAlnrbqt0yrF6OD5MP0cjwu0t5C17naQiodA9+aVXlZLXBm9LmD4XvgFme06
 NKi+mNb1yZ0AKl7PmFo989PYS4uLU1dSDTr5a9CxvcpoOKqWNbmqWw0NwhK9oH3MTTJs
 sbj/6Lv652bL7DVtJjlPZBRnvk3aRLF/DFUIodXdRdEdTC6Qr7UnZYCReGbJP6ka7nvi
 vmPC1NEw/S/tMwl+uincKChUGO6fRGdDzFvdk5Rmwq4P/62MmPWMB/0sZBDO+GtUHqBe
 yYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Y4NhrC9ap1cWsoDMhoc9arNxoObzeSf6cpbEcoKtqOY=;
 b=okve6U5Y76rAVTH6Whn1HLSDoMKIpFTNI7reW01Bi78hJEKzP1hH0TD3NhqMbqiGcu
 3/wfkfxSf9jxdtsmbS7ooDLqact4AH/u/0tWrhrH9AlsmAOqyfKu3JRxZnUErm+/D2xU
 TKxG/kct8gVXJmAXTBJXM3yNwdhNSEZzy6EbLBOmjchsnMsBKd8nlRGrLmF7qCnHPCLH
 P46hoShMe2tj6NCs43YEg/8YKEJXFACX3nqXA+72znpi2/yEIFwcACgLa0DtVeV/rIGM
 V/OIBtqa8JzoA9urHFuhynLShENpPfJWOC0+UbiFPIfB2/jsgo87mYLAbwPblOtjUMss
 Sq/w==
X-Gm-Message-State: AJIora964d9LSznwo7a4eEtlRhTICanh0OFkesjnR/CiVKo0LYwXZA22
 mMoG4EmOG9F3MyMmRKV+GVaDMfSQnPa1A+XVVGU=
X-Google-Smtp-Source: AGRyM1sh5C6I86k34hmYg98ITPYaf2PCUY3hNVmQHMGJbMzCs6kHfAYa838vIEBejr/TrpvyKV6eZFFbyFvDSQFyMUs=
X-Received: by 2002:a05:6870:538b:b0:101:17f2:d6e with SMTP id
 h11-20020a056870538b00b0010117f20d6emr6296051oan.200.1655321343622; Wed, 15
 Jun 2022 12:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220615160116.528c324b@canb.auug.org.au>
 <d1a48a84-6d07-e8f7-5fd8-d24a7a1cf187@infradead.org>
In-Reply-To: <d1a48a84-6d07-e8f7-5fd8-d24a7a1cf187@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 15 Jun 2022 15:28:52 -0400
Message-ID: <CADnq5_N6gfaPfZJAX4+poWFFruxNdFKZqzXZXosj1A55e-O1mA@mail.gmail.com>
Subject: Re: linux-next: Tree for Jun 15
 (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c)
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 3:01 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 6/14/22 23:01, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20220614:
> >
>
> on i386:
> # CONFIG_DEBUG_FS is not set
>
>
> ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In functi=
on =E2=80=98amdgpu_dm_crtc_late_register=E2=80=99:
> ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6599:2: er=
ror: implicit declaration of function =E2=80=98crtc_debugfs_init=E2=80=99; =
did you mean =E2=80=98amdgpu_debugfs_init=E2=80=99? [-Werror=3Dimplicit-fun=
ction-declaration]
>   crtc_debugfs_init(crtc);
>   ^~~~~~~~~~~~~~~~~
>   amdgpu_debugfs_init
>
>
> Full randconfig file is attached.

I tried building with your config and I can't repro this.  As Harry
noted, that function and the whole secure display feature depend on
debugfs.  It should never be built without CONFIG_DEBUG_FS.  See
drivers/gpu/drm/amd/display/Kconfig:

> config DRM_AMD_SECURE_DISPLAY
>         bool "Enable secure display support"
>         default n
>         depends on DEBUG_FS
>         depends on DRM_AMD_DC_DCN
>         help
>             Choose this option if you want to
>             support secure display
>
>             This option enables the calculation
>             of crc of specific region via debugfs.
>             Cooperate with specific DMCU FW.

amdgpu_dm_crtc_late_register is guarded by
CONIG_DRM_AMD_SECURE_DISPLAY.  It's not clear to me how we could hit
this.

Alex


>
> --
> ~Randy
