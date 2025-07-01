Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122B9AF032C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 20:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5F810E608;
	Tue,  1 Jul 2025 18:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GrR5iIz6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E6510E613;
 Tue,  1 Jul 2025 18:50:01 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-234b122f2feso5832505ad.0; 
 Tue, 01 Jul 2025 11:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751395801; x=1752000601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c18tP8nMm4WxN5l3Je6fgQ9inVG1a5KDTeXUjUHXCSo=;
 b=GrR5iIz6rBCY1C0sMeALY8HZ52/E7bp9lKlLAUKJUDHiJrTlRKu1z5KE4wp5CASbm6
 lxPw3CTllZTijRKJZCI61gZL9H2c5oaIqbB9UcOpDeO/aFDh4W5jRaRSxWqxKUMF/ESV
 rPO7QURZrG0gdEsf5N5Z4c4fhIm5JhXdQNOTYEnqg1w0Ezatwq5qm/DVyRQcTDyp9bg3
 +JzQg0fbsD3OHzkOZ8yvELh5yxefoIZxX1D9F9QHwLQoQa5QqejskEoRUSUT0PZCq+KC
 BNamJ9EChQ9Ev5SyAO+SBNqCYm6tHZZWP+Cih/D/uXEHnvDL2Yoys70vsqYL5tDH09CS
 KxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751395801; x=1752000601;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c18tP8nMm4WxN5l3Je6fgQ9inVG1a5KDTeXUjUHXCSo=;
 b=Qk0FiiMpnvqMS+qJdn6QuDwFLAYGTxI/EVy6x7AtIcEzfaJ7jOiyxZEKeGDNl86PbM
 89qpkQ1YvZS4BzIlNxhOKTfDLUgzFJ5f/isGIrs9z1FUjV6qdzk2cZN0Mh9eQJrBurkC
 dxVXKO9SGWOqD63o37wWua5oOcNQeMUYuFgoPF3tC3/ZwoFG2XyvOuGly7vJSOzrLQli
 +rHM5DAAzvotHABxiJm5fIDuEezB19DwIXHY2OHopvw8a+Qn/21DoQ367eB55XFC4464
 j/u4Raxlr2kx0Xq5NAObHY2pojkO3mIXLsQQCON8J6BNS1g4tZeMCEIasIrTLDN64muV
 n1rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwhKM20v8WTCJoGvLp1td8DD5vVmU0r4mmczi3O2l3Q3LnBzEvpHgKrWx30PzLhugIZPp43N8KxLgg@lists.freedesktop.org,
 AJvYcCX4WAo0t0EWsKaNep0T65/Csi/xv/56Apy0NYJk+LleOVL92pMnEQb40MwfMH+XBAsPC03TbX2B@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgeWiEdnnIwVlQ4QfuUIOuNwieZGumOjZiNJ0Rc2HFfaxEUUAP
 EIm1tajMXXhYBsIICF59536p7j+pDgmS+X7E/C0q800shlsPs+Tq+MT3bj1dMnYepuNkRL+4Rsu
 scA5dkELL5hYbzy+05Ku0Pwc5GTUpi5M=
X-Gm-Gg: ASbGncul+BsJUiPV3mNA3pClbzhyuhaVISRzjw3DOyMkrL0BLVpkS8dIpEzH9+UkT+2
 VvcKyBUyv90M5mKQ8qY5SGttNRN0x9cyZJr2qUtD3WcCGV7TWGvNUPmgoM9BmIV3043Jb996uNy
 X/O4UmlkA4lXXsmhjxl0BKhJpXUrYDyO6D7aNmq4UpGUw5
X-Google-Smtp-Source: AGHT+IELUYSLiXIvs+5/n36TgYU+Pz6iPW4D6o9eUn0uNN9wyJnM52eqk0EHR3VV2zEtbUR3q5cH76BCZEpC9vjZidM=
X-Received: by 2002:a17:903:189:b0:235:ca87:37d0 with SMTP id
 d9443c01a7336-23b621039bcmr27042365ad.11.1751395800830; Tue, 01 Jul 2025
 11:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250630202618.1537569-1-pchelkin@ispras.ru>
In-Reply-To: <20250630202618.1537569-1-pchelkin@ispras.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Jul 2025 14:49:48 -0400
X-Gm-Features: Ac12FXxAYEN6HICp5nfu6qjYqypkqYMmASkqv7jqJtXG5bSVzrLRAePPXKKK3kY
Message-ID: <CADnq5_PRBcOb+9To8ax4ardU9rBOAbEch7qegTxErpUGm7rW+w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm/powerplay/hwmgr/smu_helper: fix order of mask
 and value
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Rex Zhu <Rex.Zhu@amd.com>, Jammy Zhou <Jammy.Zhou@amd.com>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.org
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

Applied.

Alex

On Mon, Jun 30, 2025 at 4:33=E2=80=AFPM Fedor Pchelkin <pchelkin@ispras.ru>=
 wrote:
>
> There is a small typo in phm_wait_on_indirect_register().
>
> Swap mask and value arguments provided to phm_wait_on_register() so that
> they satisfy the function signature and actual usage scheme.
>
> Found by Linux Verification Center (linuxtesting.org) with Svace static
> analysis tool.
>
> Fixes: 3bace3591493 ("drm/amd/powerplay: add hardware manager sub-compone=
nt")
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> index 79a566f3564a..c305ea4ec17d 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> @@ -149,7 +149,7 @@ int phm_wait_on_indirect_register(struct pp_hwmgr *hw=
mgr,
>         }
>
>         cgs_write_register(hwmgr->device, indirect_port, index);
> -       return phm_wait_on_register(hwmgr, indirect_port + 1, mask, value=
);
> +       return phm_wait_on_register(hwmgr, indirect_port + 1, value, mask=
);
>  }
>
>  int phm_wait_for_register_unequal(struct pp_hwmgr *hwmgr,
> --
> 2.50.0
>
