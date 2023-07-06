Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B263A749E61
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 16:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF64A10E3FD;
	Thu,  6 Jul 2023 14:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8CD10E3FD;
 Thu,  6 Jul 2023 14:00:38 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1b0249f1322so734748fac.3; 
 Thu, 06 Jul 2023 07:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688652036; x=1691244036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WbTQmbmFVcIOFU2jrDIldr0OCa9l8CLI48zUdGarJEg=;
 b=Zofm/GafnORwyPARMChlfpVCrzFinFz4qzO530eufO2U0VwYMLZg81Dcj0n01L4Iy0
 y0rzSl/h5iA4sUb0FIA3Tbg1G4FpoTXFg1NXI/A08Ev2HDkZGE6Eu4Ok3MYot7Eh3LdU
 Y6aWEp+jd6bXdor3pbSDLTkgZ/HCzdoTCoyQsMAwgnY/Mte3uLe3GKya4wTJ6W1UFmEI
 aBRnDCftENJmLyYAR+S8fOzYu75zL3DhexxlHgQ7V1ldUlfK3cUEdPitc7E3HPbdsEIf
 bI/aXKq68gkC1B+FGNH2bIzl8M9nLPZHcW5ht81b1bXt1mu5UN0RWVy/6CH2oHDXZVYO
 3aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688652036; x=1691244036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WbTQmbmFVcIOFU2jrDIldr0OCa9l8CLI48zUdGarJEg=;
 b=C7AREugvdMmbBGtUbOQKRvcAx/vQx2ZeMZ4kH0/GJc39S7/zRmX8rnpdBgM1+YtiQO
 IvFVamt1Otr5VSvKh88OzHCLigaI8cxjT3ywbWm2XNiCKhWLRS8wRAlHO64F6Mh6LJet
 pqhnVxY9Ecl4+8oQdqfS0wFAT78j4ZpD+O++h2RkC6S+XtkhbeoEU6fHajgSKWSnZP5q
 u3BgwT5Pz+psfEMjFZlMSD7TwKu0MfN6pQxJuXDpwh4sV16t9epM4ztequywsMc1JwNa
 Y1K/1+OtD6wuyH2q6X00qxbpO6a+liQ+5Gwx06/p46ombMt0U1osMI00p1oRdYsdxnDI
 VlHg==
X-Gm-Message-State: ABy/qLZz5slkrhLmN+4xLFVhd39ODnMzOqfXA6qJvUpFp6pesYWGqmD6
 wBQsRpGmqnHXsjGccneOy74SS59dOD0UdK6UB2flK2n7
X-Google-Smtp-Source: APBJJlHK4Qrj75FaStTC4XMJpotLSOKFmTsK8R2Fzjn1NPeqoYeSPkPg1cPRKKzYrGSfwq7Veoxxy3wgcGmygU/zatY=
X-Received: by 2002:a05:6870:9114:b0:1b3:ccfd:737 with SMTP id
 o20-20020a056870911400b001b3ccfd0737mr2374864oae.31.1688652035983; Thu, 06
 Jul 2023 07:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230706092850.3417782-1-jani.nikula@intel.com>
In-Reply-To: <20230706092850.3417782-1-jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 6 Jul 2023 10:00:25 -0400
Message-ID: <CADnq5_PrYhMVPNErHufd_Bs=iTt85YO84cGCDri88nkVomDesA@mail.gmail.com>
Subject: Re: [drm-rerere] nightly.conf: drop sound tree from drm-tip altogether
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 6, 2023 at 5:29=E2=80=AFAM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> We used to have the sound branches be part of drm-tip to help
> development of DP and HDMI audio. However, we always used to run into
> problems with the sound branches merging Linus' master at non-tagged
> random commits, wreaking havoc especially during the merge windows. We
> only ever want to have tagged stuff merged back from Linus' tree to
> drm-tip.
>
> We introduced a mechanism in dim to hold back branches at certain
> commits, just to hold back sound branches when problems arise. We moved
> it along, but in the end nobody has updated this in literally years, and
> sound branches have been held back at v5.13.
>
> The merge window is currently open, and AFAICT the sound/for-linus
> branch again contains commits from the merge window.
>
> Let's just forget about the sound tree, as nobody has really missed it
> since v5.13, and focus on the drm branches.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  nightly.conf | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/nightly.conf b/nightly.conf
> index 73aec820e98f..c1e22800e276 100644
> --- a/nightly.conf
> +++ b/nightly.conf
> @@ -46,11 +46,6 @@ git://anongit.freedesktop.org/drm/drm
>  https://anongit.freedesktop.org/git/drm/drm
>  https://anongit.freedesktop.org/git/drm/drm.git
>  "
> -drm_tip_repos[sound-upstream]=3D"
> -git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
> -https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
> -https://kernel.googlesource.com/pub/scm/linux/kernel/git/tiwai/sound.git
> -"
>  drm_tip_repos[linux-upstream]=3D"
>  git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> @@ -79,8 +74,6 @@ drm_tip_config=3D(
>         "drm-intel              drm-intel-next"
>         "drm-intel              drm-intel-gt-next"
>
> -       "sound-upstream         for-linus       v5.13"
> -       "sound-upstream         for-next        v5.13"
>         "drm-intel              topic/core-for-CI"
>         "drm-misc               topic/i915-ttm"
>         "drm            topic/nouveau-misc"
> --
> 2.39.2
>
