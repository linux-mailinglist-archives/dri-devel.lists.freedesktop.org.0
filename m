Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D990D9C3F13
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 14:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326B110E4A9;
	Mon, 11 Nov 2024 13:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ApSKDk62";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97D410E10F;
 Mon, 11 Nov 2024 13:02:51 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a99f1fd20c4so691913466b.0; 
 Mon, 11 Nov 2024 05:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731330170; x=1731934970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qWJ1Zc4gbL38rTU6yCDqoeg9F8/uCDxA67H0SM4hH8U=;
 b=ApSKDk62jMnoEO/0xp1mneH4FqS9zgc6ST6fPonEx0PhnpvvLVjpBOOFUtz6IPUX45
 sCv8gD0fDELu47YavH3AVVLgrFPql3cBPbQYt9DWiTh3WIB7hgo/jvzVU+X2GQeN9Qrw
 NjnfAHFrQQquMfmumkkp1S5JwfzEr5IEHbnZbyhOdPB9vDgLM5LX6tMnNXBb4GdtQBfN
 /mTnOuxKZd8pxLGtKRHnFaNljJA1BLkFMdkX5F/GgcZgmyYBD9+FIibZZgyz7dMRR3xY
 aHlVWaZJYPwoMzYq1KFTwNHMW+tFE8UNGPhsaCujxqhyIIkoOplAuj2GrQkxfsqEmzga
 3L8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731330170; x=1731934970;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qWJ1Zc4gbL38rTU6yCDqoeg9F8/uCDxA67H0SM4hH8U=;
 b=K0WGSvPQEzaCQNKKkVU8t8wYto5kJ8qeSNKRroCPU+AArCJ6tXgdZtgmrdC4mS014R
 3ZYg9E7bEywdyq682jaoCIe/9mtaTDlShD+sqNeuaLxJVAoEBzzANgB3kHvQHbBBTaEv
 WsYgpPLylEHBnxd0PqKuyIo4vmiW2C+am12Opp0kGH2WQLFbAicq72Zlo9/83beSVyd2
 ztPJr8HZDOyPovCpzEvXFdUi4qU+Ai3IBDQcZnpME+2nDedYBoZ9QN/qcOpIgRW+jPEl
 2McYSxZ1cft0V4BghLBUce2QmAmENW/Cxd9dVlCJHkGLm2XHKRJSYIkIXPOqCdpImj0n
 JKoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr1ncPt6ycdZ3IAArHcIp77hiBgU/Hiu8XmxL/zJ/7OK1RlKXTZdtH11PWUQEXgIm7DNJsYrOCPJOb@lists.freedesktop.org,
 AJvYcCWi8QFwwLpP7yzcj1MforOV0IasLfgBaSR5Itv6Zy9ePiFngqdJGWlnyyySZL/JiF/1DJ1WBsrG@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRNRUC2u7cex2Vq3ZFFg32DKJ/TkDnolB16WPZIrnVsnVWFWx6
 UezQLFlP+c7Zd8C1GdzWf8BbRNLYhINeo1s70myu1OM1DNvLPl/be/XJAP3k7jmeJ8aW28TBdn6
 ktdUvwfZ4KEAmTvUyzE8cyibaMsA=
X-Google-Smtp-Source: AGHT+IETBZjNgVtYOZa5CNlM9YTpe197p2/BkCZ7+rSLqkqcSEhSternfe/Ap3wA6xRRgFXX5ugSCvkrFFBmeB2F1gY=
X-Received: by 2002:a17:907:72c3:b0:a9e:c947:d5e5 with SMTP id
 a640c23a62f3a-a9eeff445b3mr1198984966b.28.1731330169584; Mon, 11 Nov 2024
 05:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20241025060244.535406-1-Qiang.Yu@amd.com>
 <CADnq5_MkQDNjFykm8zL3_yy5PBi6saoN+ianwNZxs_+0w9jiAg@mail.gmail.com>
In-Reply-To: <CADnq5_MkQDNjFykm8zL3_yy5PBi6saoN+ianwNZxs_+0w9jiAg@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 11 Nov 2024 21:02:38 +0800
Message-ID: <CAKGbVbvzm-8EVuNUdq23R2rHfEpSCE5CC9EGDYrd1Y6GcBNn4A@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add AMD_FMT_MOD_TILE_GFX9_4K_D_X
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Qiang Yu <Qiang.Yu@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>
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

On Tue, Oct 29, 2024 at 10:15=E2=80=AFPM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> On Fri, Oct 25, 2024 at 2:03=E2=80=AFAM Qiang Yu <Qiang.Yu@amd.com> wrote=
:
> >
> > From: Qiang Yu <qiang.yu@amd.com>
> >
> > This is used when radeonsi export small texture's modifier
> > to user with eglExportDMABUFImageQueryMESA().
> >
> > mesa changes is available here:
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31658
> >
> > Signed-off-by: Qiang Yu <qiang.yu@amd.com>
>
> I assume you will push this directly to amd-staging-drm-next?
>
Yes, I did.

>
> > ---
> >  include/uapi/drm/drm_fourcc.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourc=
c.h
> > index 78abd819fd62..70f3b00b0681 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -1516,6 +1516,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 m=
odifier)
> >   * 64K_D_2D on GFX12 is identical to 64K_D on GFX11.
> >   */
> >  #define AMD_FMT_MOD_TILE_GFX9_64K_D 10
> > +#define AMD_FMT_MOD_TILE_GFX9_4K_D_X 22
> >  #define AMD_FMT_MOD_TILE_GFX9_64K_S_X 25
> >  #define AMD_FMT_MOD_TILE_GFX9_64K_D_X 26
> >  #define AMD_FMT_MOD_TILE_GFX9_64K_R_X 27
> > --
> > 2.43.0
> >
