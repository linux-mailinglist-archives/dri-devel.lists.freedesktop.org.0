Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E34BEE137
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 10:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C635910E0B5;
	Sun, 19 Oct 2025 08:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32D110E0B5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 08:51:41 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-58b025fce96so2975714e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 01:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760863898; x=1761468698;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XqqRnamX48XVhgy/cSJowCbYmZ8Q51GIp96qBAj+mSU=;
 b=PwORvn/Io+68Hzyv+bOgnyUZqOulLvOMs6LrSlJ79G4CbsFdwWW+vbFF65pmkOCnlR
 flHNL4Y2UT4nQjzikKXlJH/pL45zW8NKgWfSREL5ZDb+35g0hdcX5sABCX+77ZrALrLK
 7o3a5POqFu/xegKL0Oj+fYZ0KjoamOwtLrW7bXcvdWqIApdP/U7KSrqTEtfDT1V69Hz7
 CasZlA12SnFmOz4UR2hChH+GxqOyYB4paZyq+qo08PJ6G1kOQ10jmjFYYMd7r0px0Gg8
 NgaRHwm/qJwTgNEapyxfcM5sgcKcQKAtWIeLzX7kljE1lb6HUAhiY8SNGLyNtS0HHp+B
 wElA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUxMeO7pEG+opDKNN9qHy1SJVD5AGwoW4XfR+kRd5lqqc7t6F2BI2STCMeWFFUGY1iSIeJjO95AB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBVIe/VRMmeHZs05ZHxmxP1hiz/0YTSWGve+ruYTeUWjynyKVi
 2/vcm/dnvEEwqvrbST1VKC1oNFLrdL+14APu31/Zp2WxVt9Oemz9jay608woLrh2
X-Gm-Gg: ASbGncuKslSFV9QsXCJPpoBE1sGd7c7WYgXK/N28moHEQHpff+9oez0YPVmDYHqtHBo
 +0ZaZfacE726NFMig78hLm6R4KQAEjb05pLPrdABKGjSKNJtlN+dcqptTDlD7z3VFjJfW1QPUcu
 +2PFTzcLfHJcB3H6rXtptjirzY4v0G3NnTY3qmEn9Zwf4JtzFHo+lSgb/Wq3ga92q48JZ9rvFsX
 OfgBxAIr/HavnV2mu55gHF0FFSDlC9hGmbI2+XwYtmp0eVqhbJbq1HiZL3YzNblrrS0cjR1DhfC
 2shvXGyeMk3gV6UKwKqbP2mjVMzZGIgrDiBidNxfSnQXJAMHcpNxGupH5ZXALK1X0nsZXx+pabi
 gVrgSkJ6oQNlX+O7sEMyTTiP6Flfx8mIXkcOlxv8BRwwNAj86OuVG1+73ykUQ/A1w5kgT3GFucK
 mxq9lbchgvJ+jcKryXpMe22vn54S2eWlXq
X-Google-Smtp-Source: AGHT+IGL88e8Qm8QckucyPzRsgu3UpI31DjrIq0F0ZqVS30D7BYNxzp9BW/9jVf+Ht+VybCgoTp+OQ==
X-Received: by 2002:a05:6512:3da8:b0:57e:f60:2327 with SMTP id
 2adb3069b0e04-591d85665e1mr3014018e87.49.1760863897387; 
 Sun, 19 Oct 2025 01:51:37 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591def169fdsm1384707e87.68.2025.10.19.01.51.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Oct 2025 01:51:37 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-3612c38b902so32195981fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 01:51:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXA4tMvNQPnGr0wUb94f4EL604SVepW+yDX3y1mG8dlZCfexVItweWaM8O/onftst89t/ciZP/6uIk=@lists.freedesktop.org
X-Received: by 2002:a05:651c:988:b0:337:e0e1:d11e with SMTP id
 38308e7fff4ca-377978ab8d6mr27450931fa.18.1760863896800; Sun, 19 Oct 2025
 01:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-7-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-7-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 16:51:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v661kowYSSNYJ5Bb05mRFJR7pZFym95Oyj7-R5kkPrzNzw@mail.gmail.com>
X-Gm-Features: AS18NWDXIVTjeyhWFEjy65wFSPD-aqsq49LxTr6pJCNafi4Ajfc1OGiZzxQr0Ms
Message-ID: <CAGb2v661kowYSSNYJ5Bb05mRFJR7pZFym95Oyj7-R5kkPrzNzw@mail.gmail.com>
Subject: Re: [PATCH 06/30] drm/sun4i: layers: Make atomic commit functions void
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Functions called by atomic_commit callback should not fail. None of them
> actually returns error, so make them void.
>
> No functional change.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
