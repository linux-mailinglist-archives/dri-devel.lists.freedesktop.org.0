Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F19817B0F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458D710E37F;
	Mon, 18 Dec 2023 19:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9D610E37F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:29:37 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-35d74cf427cso14669195ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 11:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1702927777; x=1703532577;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2/dws8qihrRmeu0Tulyhju8JboXJbpC7pxItSGb6vIE=;
 b=VuwlL48nKpjZockOqDYOBS37NwlsIK00El4PMo1wDTe3y3o819nBLex08RzGUP048E
 3p+vILiuaRyJt82lDur5WYNIEL1l+H1OGgB6WgcQMkFr6G+Pwkx5HJGDHkEcrHaTIjXq
 8sEMGe5P7XQ/GQQstx10Eap8lt0daaBgvXWVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702927777; x=1703532577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2/dws8qihrRmeu0Tulyhju8JboXJbpC7pxItSGb6vIE=;
 b=FOiqYXThc2VEpDJj3+9QUWT6gp9rKA7kZviPF7rTknAHUBRyfmWk/AzBQBeAKTpHhg
 5ydcdg3j96gCGHm9TonQSYko1qOjnm6RTsszifvftcr1y5oxeZrNr67UMshf/Z82vB9g
 w69wHsXbtMvby0bAvIMgIFfsURDhwKWc2zGfzm1pF29uiQQOS0PxhN0MQUzTjuOv/Vib
 4c0SD53Vg43dVBTv6xiaejRenqKwIoAcOZ/vw0BIkrc/6qlhgBuqeCX2Gd9tli4kNsUY
 c8AV4MS9/z6nEaXe8Bejx0D+XEkEV6ESgqCd74oUeZr4KTmTUuogI0q7EEHYg6os3hO4
 hTCg==
X-Gm-Message-State: AOJu0YwU7irymwuiueQ0ovJDzoBn3pYNkD3M6/eevHKyuMFXS9p4zH0/
 6wqO5FUJmCNdrgq/ojsVOss/GME4qhn5yyqj/Kp7Wt40UjH2a7Qu
X-Google-Smtp-Source: AGHT+IHijNr4JgfCbOCPk8oNO6u8b76+Do2wBQG4ojyi9QyBXY1t7VqzneGDFvpIBqbseVIp2XWDmlmzuaQvSf9yz9I=
X-Received: by 2002:a5b:787:0:b0:d9a:66a1:a957 with SMTP id
 b7-20020a5b0787000000b00d9a66a1a957mr9675360ybq.13.1702872117437; Sun, 17 Dec
 2023 20:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20231215234102.16574-1-rdunlap@infradead.org>
In-Reply-To: <20231215234102.16574-1-rdunlap@infradead.org>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Sun, 17 Dec 2023 23:01:46 -0500
Message-ID: <CABQX2QNRWsODj48LJpsjD1+5TKUT7JWE745rgBJ829z4woGCYQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: fix all kernel-doc warnings in stdu
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zackr@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 6:41=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> kernel test robot reports one kernel-doc warning in stdu, but
> running scripts/kernel-doc in -Wall mode reports several more,
> so fix all of them at one time:
>
> vmwgfx_stdu.c:76: warning: Excess struct member 'transfer' description in=
 'vmw_stdu_dirty'
> vmwgfx_stdu.c:103: warning: missing initial short description on line:
>  * struct vmw_screen_target_display_unit
> vmwgfx_stdu.c:215: warning: No description found for return value of 'vmw=
_stdu_bind_st'
> vmwgfx_stdu.c:320: warning: No description found for return value of 'vmw=
_stdu_destroy_st'
> vmwgfx_stdu.c:551: warning: No description found for return value of 'vmw=
_kms_stdu_readback'
> vmwgfx_stdu.c:719: warning: No description found for return value of 'vmw=
_kms_stdu_surface_dirty'
> vmwgfx_stdu.c:895: warning: No description found for return value of 'vmw=
_stdu_primary_plane_prepare_fb'
> vmwgfx_stdu.c:1470: warning: No description found for return value of 'vm=
w_stdu_init'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312150347.5icezNlK-lkp@i=
ntel.com/
> Cc: Zack Rusin <zackr@vmware.com>
> Cc: VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---

LGTM. Thanks!

Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z
