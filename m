Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A3499F553
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 20:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4252E10E5DF;
	Tue, 15 Oct 2024 18:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="IqXhDIWm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D498610E5DF
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 18:29:27 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3a3b3f4b599so1357775ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 11:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729016967; x=1729621767;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gsx3rVKk6EHdFPE0feA0DgeAupvx9NOXATe162zYTy8=;
 b=IqXhDIWmA4cDQB/mWqgqTmX3wnxRnpJ7qg51fO2vm/KAEPmA/jLTJD7eoGxOl1/9Ou
 ls+RgBSi3Hbk7Of9xmFq/j+dyLC03J8hGIhdGAhg1QlylmkRS6vtUvaNMVPb5ngGzEPU
 huCveYT+AR1Wg027KXDA93eWBsGFO/6UQMFJaJOG6T6e4GDZ5HcsE8bkrrPUJgdMBmes
 i1ZYLtt52pbDVg8tOHsu7KPkHtYDswRwqfW+Tk6ulEXKRpPPnhwQbrq1I1ou2lycAbi/
 xhW5zgnQsOCDKZgU0pxLIg07xeVp+q2px+6RBTyMlTNpJKw7DQlaLW3+OkNC2/iMQAlf
 1Cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729016967; x=1729621767;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gsx3rVKk6EHdFPE0feA0DgeAupvx9NOXATe162zYTy8=;
 b=CPN+mur6uPso1tipQ53HQnYwCRGrqYAf+oajWhT0y8tX2Gz7tctm1qYwrTWufwUy9j
 UzzBL1HNmz5gfVjYZ2H6uKBkHppgrUI8lq3XnFqPIKb0Kydmp/tzM9E+RxE38FLhmK1D
 6rVPRWx8XJscn6a5zrW3Ug/KqbFalfRw3ZjDwZ6pWYVmsIxzisPO5LWXokGEy7Z6aG0m
 pM8MLHS2nJhS9GgMkRgFBwqxJpTtTYcl0YtrLG3KWyjUmsOET4dF8k59B8wP5nrOD5Tx
 b8vOjJwf6dpd3HZBkM2P90O+Afuxk97VyS8PtY93xUPPXEPJaeVhVBGcbOT4kk9I2Re/
 q1Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxngJzSu9Mp8Fl3WfuHFg8fJOEnqpghTDxcapzqsK8shSR/bNqmGUrYDNbwLUaLaV7fcJXCtDOE1c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw836iYkKhEH7W7TbGrhfg+3BPR5tZl6nIxPRjIV+Avs1NS0Y9g
 EWkZ7tLaMPCxlQBUOePEhIwhUSmWsv5pGswvu9PBKBXtStRoUsEkeHpoauqDqHDBBSr/CMDMXgC
 KGVf62AkPNlMuR20xcOFfAbGM0gpRF3cGDent
X-Google-Smtp-Source: AGHT+IHYZhCaFHMFZvkhdJXYDWIOjpmUHlhAQ02PJI3HGXk+yjx/FbcIgWVnP920/c5Dg1cimfTpl0cFaJ6Ky3iSPoY=
X-Received: by 2002:a05:6e02:550:b0:3a0:a75d:8659 with SMTP id
 e9e14a558f8ab-3a3ddffd5acmr185295ab.29.1729016966751; Tue, 15 Oct 2024
 11:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241015182745.1012684-1-irogers@google.com>
In-Reply-To: <20241015182745.1012684-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Oct 2024 11:29:12 -0700
Message-ID: <CAP-5=fXanbFKK=mYZJc+prjyO8wZhrdquELWG4URYksuSaVtEQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm: Fix separator for drm-pdev
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Oct 15, 2024 at 11:27=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> The PCI slot address for drm-pdev should be a colon not a period. On a
> i915 GPU I see:
> ```
> drm-pdev:       0000:00:02.0
> ```
>
> Signed-off-by: Ian Rogers <irogers@google.com>

Possibly:
Fixes: 055634e4b62f ("drm/i915: Expose client engine utilisation via fdinfo=
")

Thanks,
Ian

> ---
>  Documentation/gpu/drm-usage-stats.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/dr=
m-usage-stats.rst
> index a80f95ca1b2f..f56ca58312fc 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -56,7 +56,7 @@ Optional fully standardised keys
>  Identification
>  ^^^^^^^^^^^^^^
>
> -- drm-pdev: <aaaa:bb.cc.d>
> +- drm-pdev: <aaaa:bb:cc.d>
>
>  For PCI devices this should contain the PCI slot address of the device i=
n
>  question.
> --
> 2.47.0.rc1.288.g06298d1525-goog
>
