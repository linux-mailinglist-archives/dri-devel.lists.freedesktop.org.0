Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47591993308
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 18:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37FF10E32A;
	Mon,  7 Oct 2024 16:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MBhpBfZh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853A710E32A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 16:23:57 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a99650da839so32886866b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 09:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728318236; x=1728923036; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1DjhLFwVBpKRr9Z2MwbXlQuaVUI2IN6bC3xXF+EK/4g=;
 b=MBhpBfZhl7V1HDpfwbeNTPK0lWDe0gYZ9vdRVDhivRwC5icQHKd8pCZLe2xu9AMqG1
 MkNjyiLjSwuGjkL3HmPfKkz0jjhImjMlAC3j+VzZBwLkk2XqWACu+mKXBLsZ7jdM0MYJ
 fzMCwy0AGs+ceiKTsDZ/wPvQ93rRuNs6shMwsTxeWw2S7dhAhY4TmCni10S+s1Dny0H2
 U/bd87cxvYIwvLbQQXjbUMUFDu9QJYjk2GyXNIZ1NERtA5u4ZFyu0S8Kk86hOX/tSphK
 j2NdVRnqbBxcDTEcwB/uLNAhx2BlFwWxsvqgxiZTn8WGYkvooGnh9i4J0kS86efgOuEn
 Uu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728318236; x=1728923036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DjhLFwVBpKRr9Z2MwbXlQuaVUI2IN6bC3xXF+EK/4g=;
 b=wlkoFTvFouY1Evge26Fy5iWWSh/lyNzF/cdOCdHcF4ZuvEVvB2qkGAVYQGhCTOaLmY
 6uureeTGNK9MfyNsbmCi5J3Otmabd0To2jDvi1ZeMsPRZJenUlTXbM34ThzpXJqe5pDj
 T18J8wsafZ5G1biEJ0XKk5Sp+8MT28f39vapU9YSDVg4uUAf6sUAVkRhnxUhG6IoR5MI
 cVH03xDceaWnmU4Gdf1oAgyqWoIv9dVRsPhdeCTrgW+XTC7fhSa/f3aCr/qANHn9r6E5
 hsjv24WskwO7sqAWbw/SP7k/IS02n6pId037MzJtKl8dw+cpuTtW5Pe6edIAirGyyMR9
 ZtNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB6xI8Kcaw/ohdkFHpp/raLmYzjQejtetunf7gTVGOHO6UukG+QVdXisBdzeZ8k+JJxBEi3eAXNp4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYyemmre6bR6+a6ozTYQjjb2mBsyGtLgyTphyhN6GjgwajysZj
 8gDv5eSS+eddHzs1BecQbqs1xKlF0RcLV+hN3TYm4x09DFu/nrQa4MzikCWTapPMLsL63TQPT1v
 Dz41pCWGqnODYR1TfE+rSFkGV5Wk=
X-Google-Smtp-Source: AGHT+IEhWSRFZqVhC3rbl0UHvbwLLLlpn38m/GYhWm2qL50BAg4U+z5JzqqQw152dm0AYm6pv3+IQ51UGtTJYfZ34DY=
X-Received: by 2002:a17:907:a0d:b0:a8b:ddf4:4701 with SMTP id
 a640c23a62f3a-a991bd47985mr1349645766b.16.1728318235289; Mon, 07 Oct 2024
 09:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241003120655.53663-1-vamsikrishna.brahmajosyula@gmail.com>
 <202410060802.Ln9ygpuY-lkp@intel.com>
In-Reply-To: <202410060802.Ln9ygpuY-lkp@intel.com>
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
Date: Mon, 7 Oct 2024 21:53:43 +0530
Message-ID: <CAJvTgAg-8RYjo9Rapor86G5o10aTws7B1NmZVuN64KRy5kjzWg@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm: set gamma_lut or degamma_lut based on HW in
 setcmap_atomic
To: kernel test robot <lkp@intel.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, oe-kbuild-all@lists.linux.dev, 
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
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

On Sun, Oct 6, 2024 at 6:31=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Vamsi,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 7ec462100ef9142344ddbf86f2c3008b97acddbe]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Vamsi-Krishna-Brah=
majosyula/gpu-drm-set-gamma_lut-or-degamma_lut-based-on-HW-in-setcmap_atomi=
c/20241003-200835
> base:   7ec462100ef9142344ddbf86f2c3008b97acddbe
> patch link:    https://lore.kernel.org/r/20241003120655.53663-1-vamsikris=
hna.brahmajosyula%40gmail.com
> patch subject: [PATCH] gpu/drm: set gamma_lut or degamma_lut based on HW =
in setcmap_atomic
> config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241006=
/202410060802.Ln9ygpuY-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241006/202410060802.Ln9ygpuY-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410060802.Ln9ygpuY-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
Based on the kernel bot compile failure I received,
> >> ERROR: modpost: "drm_mode_obj_find_prop_id" [drivers/gpu/drm/drm_kms_h=
elper.ko] undefined!
I realised I can not use drm_mode_obj_find_prop_id in setcmap_atomic
(in atomic context).
I am exploring atomic functions which access gamma_lut and degamma_lut
via state.
I will send a v2 with a new approach.
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
