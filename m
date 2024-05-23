Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A178CCAD7
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 04:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1F010F631;
	Thu, 23 May 2024 02:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c1exlQJQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461F010F631;
 Thu, 23 May 2024 02:51:26 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-df1ceefd864so114737276.0; 
 Wed, 22 May 2024 19:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716432685; x=1717037485; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v5LuDwEZakdwbwY0ym0Hwpmt3ZIkNDD5vuPYxuRQOvQ=;
 b=c1exlQJQ+LjTclNIhriPZ7fBvC+TIM1RfjW6qaGbN8dcuST3LUB9X1kkibxkaKopfo
 IE8xyZWgUEBFxotbtE7WyrfjqmCXfLuG2wbDH8XFWJmLfWUrkv1EgaF/hslk3RkwZs2I
 JBJuFnJFt2yt3PSp/3kUp6drG5l3wmgqDkjN2Nzn1IdxgC9rcJ/FtPVsvxz6OKiwCqml
 U77MNP8tp4NEDJM2rF+PEiA7wKZ2NuYCi3p6gtyF+cAr8HWpu7KowOpurkvzmcqzalRH
 AiGV25kdzwy092LP4fJUITgEo3H3ThjXhSGvp5MLckb8MxSWbm0ehbzbctwU/NUuZRBl
 x/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716432685; x=1717037485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v5LuDwEZakdwbwY0ym0Hwpmt3ZIkNDD5vuPYxuRQOvQ=;
 b=rOypYOAaqE7lAWZbb4DmTaM0ci2Z0vq/NTJgV2SHlkW6cScIHOdpnm96AFV3JTEJrq
 8ff7QjZ4logCSNimPGKAKRmjH5fT3NhMfARzjZnq4/QugQfDDV+qDvqZd8haB56UJ9EH
 UXxVzJfdGftQXO2K9SOC+pUpcOH/ngcNK9+UAFbk0afx2sj4k8SXc0KwAm9p99Y0y6XI
 XlFSXom3F/MHLvMIkbElcUgDhKdbPrIicv/N8Fgp32Le3s9QLwdpENPhTDoMmpGUnhUo
 xvY39YhuKvM+k0rlq5nzmoEhmie3ArdJbc0jDpvmea+pOZok8ZRA/Pjqe/Uz7HmNkFde
 Tdqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnrw/gkYEgJcQP4v0ghzqDkYuxqkjbb2cou8KDlPQutfm/rEg4zNvLVKgOkUL6vin31cyPGDFCNfD9FaIbZ2FLI/VEFvRpmTcbZVUvrJdldW4ychJ0GH7NqQjckgDOb3DovxkR51y3fKs4RX4IcA==
X-Gm-Message-State: AOJu0YwHe8xx4mlG/ShGz8WBK+/porxEaAd0IqSI63TyapXKpJE4RJEV
 jepCnd8kfOpL813yMIV0r05PlBZd79QfoquUkjiryAxn5x1x3i6pef7CPPbOikdKIsnroKYonT1
 01SxuqHLfaHeN1yCo/p3lG6JrSrM=
X-Google-Smtp-Source: AGHT+IGoGrlyVl36Z3U/uNce2TSp6L62rcU3gkTHLc+sbhgiwRZ9seU1gNOO89339GRoQiUoYwsYHFD13z2NjWmF818=
X-Received: by 2002:a05:6902:2003:b0:df4:d863:93f1 with SMTP id
 3f1490d57ef6-df4e092c8acmr3589932276.0.1716432684934; Wed, 22 May 2024
 19:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <fa885eca-d7e6-415a-8a08-9103b002c6bb@amd.com>
 <20240521051140.30509-1-rinoandrejohnsen@gmail.com>
 <17782a6e-db84-4c20-874a-342b9655ffc5@amd.com>
 <CAACkh=-B-jH6g7KY7Nn_7Y_+gHPQ7G5Z5AZ0=a=_ifjcmsorcw@mail.gmail.com>
 <86410711-9b88-448c-9148-109f81b1ca55@amd.com>
 <CAACkh=9hY7eg_uuH7Psm=XJfSzwQTvzs8bvOXQ=wwkMPrC44SA@mail.gmail.com>
 <666e36b7-5379-46ef-a16b-00ec499fb42c@amd.com>
 <1XiLpoWd2E_COrHNl9BYkmCXkUKK6Bv1wibdFxiw3Vi6AQOPAIhrIMPNEZmmKAp9yxC8Er4DEMqOqjshMgRqtpV3UkS7MN2OjCsDjllvdRE=@emersion.fr>
In-Reply-To: <1XiLpoWd2E_COrHNl9BYkmCXkUKK6Bv1wibdFxiw3Vi6AQOPAIhrIMPNEZmmKAp9yxC8Er4DEMqOqjshMgRqtpV3UkS7MN2OjCsDjllvdRE=@emersion.fr>
From: =?UTF-8?Q?Rino_Andr=C3=A9_Johnsen?= <rinoandrejohnsen@gmail.com>
Date: Thu, 23 May 2024 04:51:13 +0200
Message-ID: <CAACkh=9RBVwX1-ENki9XiscH3XYzw8buab8ZFTyicTn8Yc84oQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: Add pixel encoding info to debugfs
To: Simon Ser <contact@emersion.fr>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 alexander.deucher@amd.com, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>, 
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne Lin <wayne.lin@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Looked through the patch series from Andri Yngvason and that does
exactly what I wanted in the first place. I think that the patch
series should be encouraged to be merged in as fast as possible.

For the patch I have submitted, it stands on its own, since the patch
series from Andri Yngvason does not include anything in the debugfs.
This means whenever or not the patch series gets merged, at least
those with an AMD gpu can figure out which pixel encoding that is
used.

Rino

On Wed, May 22, 2024 at 3:40=E2=80=AFPM Simon Ser <contact@emersion.fr> wro=
te:
>
> On Wednesday, May 22nd, 2024 at 15:36, Mario Limonciello <mario.limonciel=
lo@amd.com> wrote:
>
> > > To be perfectly honest with you, I haven't given that much though. I
> > > used the 'bpc' and 'colorspace' property in debugfs, since I could no=
t
> > > find that information anywhere else. And since I also needed to verif=
y
> > > the pixel encoding being used, I added it where those other values
> > > were. That made for a simple and easy addition for this property.
> > >
> > > If you want me to do this differently, let me know. And please point
> > > me to the standardized DRM property where I should expose the values.
>
> FWIW, there is a patch from Andri to add a similar (?) property:
> https://lore.kernel.org/dri-devel/20240115160554.720247-1-andri@yngvason.=
is/
>
> The patch also allows user-space to set the "pixel encoding".
