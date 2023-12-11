Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA8180D3A2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 18:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9871910E124;
	Mon, 11 Dec 2023 17:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C30B10E124;
 Mon, 11 Dec 2023 17:23:12 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1efabc436e4so3270586fac.1; 
 Mon, 11 Dec 2023 09:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702315391; x=1702920191; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PjWlkl7RLfvyUu1Wp3IwYJ9TdVasWn4eiJ+vWXnx6qw=;
 b=fuO93Dbs4PrSmHkV4gwAzWGX9iysb0o+rsCot6fRqTiENDdM57gYTRaofXQYPTBAOJ
 n5at5ZSZezXtUK61TLktmM1vkgBMu0Fhl2NfKZbgWKvef6l1G68pRneRHAFHMW9fm7z7
 J6HKEPN+SO76vSl1VSRpa0EQTl/gxgz7T/a1eCjWW63FpMlTjQCfF+t/9SKwy8s4jpF9
 xdJ8OkjmyssyzJY4zLcw5Mm1cjTgjmaBx8+voc/cNrt6qoa+fPEv2HFV41XHCIDd8lwp
 CACw7FiWbxzbWs6Yw9D6JITTTHXvH1Quec7eq41iAS/LTxbVxKdka5eDAUCBoTU/v+zm
 AlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702315391; x=1702920191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PjWlkl7RLfvyUu1Wp3IwYJ9TdVasWn4eiJ+vWXnx6qw=;
 b=X4dPW58BT+4MkJLeUuY1TI3+cfkIT8MYQ1WuU4yHKtBN1c/JbfbhLklIH/zLApYGp8
 1Ec4C/BBnlejY3POc/pVLJPHPT0dKgJHCrPajfCtw5+hZl6dhJIaXo67brlSRQv9uos3
 oR2BD4SvdhsfEoUUU5OMWyaNsoJD/PI7Uo2Oly0KOakdHsIj/ysJdEt0cZCsvhkZMM52
 vSFcosgAR5llNZIyfJdEFnP/VM1BOubLILJu/iXGeS1WcLSVKzu37udD9vgyN+67ZRzb
 i2WdKnBKLrP7yvFxLjke5AxuCAsBMrmt68XCAMj5yP2vqbHUybaVp9gnI1ruZc8Tbam7
 5AmA==
X-Gm-Message-State: AOJu0YzTUDg0DV88l/AszUgHK5F9yk8aALgHGlSvy4i7UAVoi+PlsUTA
 pg8f+CIh64ZXB/gPqOGiAsJSVcy9kgoTXnnoF/k=
X-Google-Smtp-Source: AGHT+IHC/nWmvQid9AdBCE/8sBKp01t4jHvuokijxO/t58qrFBUqFpkFpivBU9bCULRAxjkXRQJTJZVbojPhzqt9n28=
X-Received: by 2002:a05:6870:1b0f:b0:1fb:75a:c415 with SMTP id
 hl15-20020a0568701b0f00b001fb075ac415mr3988556oab.62.1702315391460; Mon, 11
 Dec 2023 09:23:11 -0800 (PST)
MIME-Version: 1.0
References: <20231207151142.929349-1-Arunpravin.PaneerSelvam@amd.com>
 <20231207151142.929349-2-Arunpravin.PaneerSelvam@amd.com>
 <d30b7992-5c39-49f5-889c-c31d4994a5c3@amd.com>
 <CADnq5_PdWUDVK0mvMgyTyogMnT-DD2nhXHarO+BLg9BjtGPRGA@mail.gmail.com>
 <473652dd-8ca1-436b-aa52-eb85eb0e98df@gmail.com>
In-Reply-To: <473652dd-8ca1-436b-aa52-eb85eb0e98df@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Dec 2023 12:22:59 -0500
Message-ID: <CADnq5_NabQ4Cm=q+ONsAmU5S6XwvM=4kB1Ux93Tta6Qv0S527g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: Enable clear page functionality
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 4:50=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 08.12.23 um 20:53 schrieb Alex Deucher:
>
> [SNIP]
>
> You also need a functionality which resets all cleared blocks to
> uncleared after suspend/resume.
>
> No idea how to do this, maybe Alex knows of hand.
>
> Since the buffers are cleared on creation, is there actually anything to =
do?
>
>
> Well exactly that's the problem, the buffers are no longer always cleared=
 on creation with this patch.
>
> Instead we clear on free, track which areas are cleared and clear only th=
e ones which aren't cleared yet on creation.
>
> So some cases need special handling. E.g. when the engine is not initiali=
zed yet or suspend/resume.
>
> In theory after a suspend/resume cycle the VRAM is cleared to zeros, but =
in practice that's not always true.

The vbios asic_init table will clear vram on boards with RAS, but not on ot=
hers.

Alex
