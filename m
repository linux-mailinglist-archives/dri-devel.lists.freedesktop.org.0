Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6F7829701
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 11:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4F210E594;
	Wed, 10 Jan 2024 10:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B4110E584
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 10:12:09 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5e7409797a1so37109037b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 02:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yngvason.is; s=google; t=1704881528; x=1705486328; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=96G7DIyssciX4jnAzNrTPlryo3sWO8sgy39soI2lLIM=;
 b=aiBYE17WJRr4FhbVQVOqHd5sUD6rek/aCjpVDlxRv7qYTDi6HYYmZ9JPKOVOxNUrpH
 HmtNi8+3yhTG6e56XRvSkDoN/dFyNwHUKgYKYDFu7EVAVOvWHWyIj61P7NHEL5upkrQ/
 ef/5tDW+KQ8/Dqjqn2DDxCKJg45d8bM2xfLV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704881528; x=1705486328;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=96G7DIyssciX4jnAzNrTPlryo3sWO8sgy39soI2lLIM=;
 b=pUmty2gTZvkecEjI9OBlOI87Uk9WMyfxwl2OfzllXYYF5thf1MVlg6mltQZFuJt0HV
 Ugmmh1aWaAxC9oSGA+5Bpdnv/gaTYuh9Ccftr21sR/GHpX55kqWLZoaIXm2GfrmqVsDn
 1iGMf6/tGYN5/XyEsxxO8PHlo/uEvW4fanSQimk3fyNC1rigIVWY7LGOuhFu76MPyL+R
 8LH8p8OLNo/aWVpr1DvYQhG1kZs4AgRcG/Y6snkC80dnXRgw0ZCL/KJXX3l+GAqmsgat
 G5PfMEbQikSp6I36h0sJJxNMofcqMBl+J1jiq6U9in+Tbyio5s/+JnxdeGcWDYyIqkJW
 LjDA==
X-Gm-Message-State: AOJu0Ywjyzq/g+1KPcPtA+dwTiFPkm2ffil/DKvYawEq04/iVd7Vi2k9
 1qu9XKNFEON2fDueAlZGXqXSYcsNOQM8pFC5IikLyamWhN62dA==
X-Google-Smtp-Source: AGHT+IGS4RF/sw1vbqlkX/KGSnVK4rjCwYusB936/yIZemFr40lAz/v1ty4wbuIZQF+WlPwAE3a+cK+ILR852Vcqmd4=
X-Received: by 2002:a25:f822:0:b0:dbf:227a:a2c with SMTP id
 u34-20020a25f822000000b00dbf227a0a2cmr504361ybd.126.1704881528497; Wed, 10
 Jan 2024 02:12:08 -0800 (PST)
MIME-Version: 1.0
References: <20240109181104.1670304-1-andri@yngvason.is>
 <20240109181104.1670304-6-andri@yngvason.is>
 <qdwv7sagqs5nmmsy5lko5hypldanfodafyzamrs3loj3n7jzlr@n5bacxkknkj4>
In-Reply-To: <qdwv7sagqs5nmmsy5lko5hypldanfodafyzamrs3loj3n7jzlr@n5bacxkknkj4>
From: Andri Yngvason <andri@yngvason.is>
Date: Wed, 10 Jan 2024 10:11:32 +0000
Message-ID: <CAFNQBQzijyE4wR34AOLM45m+ryx128igVKO9zPJ5-M3afFQMxQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/uAPI: Add "preferred color format" drm property
 as setting for userspace
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

mi=C3=B0., 10. jan. 2024 kl. 09:27 skrifa=C3=B0i Maxime Ripard <mripard@ker=
nel.org>:
> On Tue, Jan 09, 2024 at 06:11:02PM +0000, Andri Yngvason wrote:
> > From: Werner Sembach <wse@tuxedocomputers.com>
> >
> > Add a new general drm property "preferred color format" which can be us=
ed
> > by userspace to tell the graphic drivers to which color format to use.
> >
> > Possible options are:
> >     - auto (default/current behaviour)
> >     - rgb
> >     - ycbcr444
> >     - ycbcr422 (not supported by both amdgpu and i915)
> >     - ycbcr420
> >
> > In theory the auto option should choose the best available option for t=
he
> > current setup, but because of bad internal conversion some monitors loo=
k
> > better with rgb and some with ycbcr444.
>
> I looked at the patch and I couldn't find what is supposed to happen if
> you set it to something else than auto, and the driver can't match that.
> Are we supposed to fallback to the "auto" behaviour, or are we suppose
> to reject the mode entirely?
>
> The combination with the active output format property suggests the
> former, but we should document it explicitly.

It is also my understanding that it should fall back to the "auto"
behaviour. I will add this to the documentation.

Thanks,
Andri
