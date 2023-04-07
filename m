Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE7C6DB1B2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 19:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8840810E082;
	Fri,  7 Apr 2023 17:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F66A10E082
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 17:36:43 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id l184so15772752pgd.11
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 10:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680889002; x=1683481002;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EKQ/0jGnOo/TaPpGUaml4IRy69MNIBKloNhJZjKlyT0=;
 b=KD6ZnfzfidIvC2otpuKywoCEsPFpclOlyGbsChbiRW+NoHLgvlIIgbDR4G+StlGoIH
 70V+Xb3tH88TdmFrqGplFBGXqlCuzUxbpiYDRXsLBoXwoTz2W/3cDhHDXwaLaBxXrYgF
 HoyNSRrWgdMunOUk6NYADKkEMctFlUeJ1Iki7CFRPojkLCxojNZhXIY4q/yC9rhMflBI
 HVPtR1t3cZu8XwM35jE6pq6TIb9CglNvwwY1HkADONdXRkNJsKn9yWoPfVIRjtounOsv
 vbp2pu43LZzeofyFbChgOgo1nVZLGY29Dl835qQC8chqq9E88SUh/NyYFrzZxEKcCFHk
 R1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680889002; x=1683481002;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EKQ/0jGnOo/TaPpGUaml4IRy69MNIBKloNhJZjKlyT0=;
 b=gYXsmtQ3g6TVgcLgwGdyqJFGtcByt/lhOMxhNQOJC7B1RrD75psbQ/PvKaCJXVYZvz
 1+GpjOXEhuDXBCknVsZqR8W5NglPP6u20YASXy+a9ugnVA0Jx3Ipy/SUuWOIDGNn9I3z
 RjmnDJhRcWNZEdQDu8tsq5n1qbdCBkfOSrPrXLhsDK7KwdNGxOoMJuk4PCLhb8MJNEB3
 zZn88vYhKhOtCHDCMy2i8aJSNlc6boQwg0e1BpWBffg2WT93GAiNDWkK/IaTW2q5wUib
 eeCQApTaHnzFl+l0vA2X7mCP2n96WT2pZF6N1OeZPpAKKRBrgqmnhkzS+x7Ixt7kq5V5
 o0nw==
X-Gm-Message-State: AAQBX9cegliaGq1F6G+H7axbXv5T/vzVp5ByEjRFd5plGydZ0EPt7FWG
 l4G65OrMWgoKw64FhjjLidp/1SNs8ycZSlKoxsiHbmhCwi5lsF52wSU=
X-Google-Smtp-Source: AKy350aSeVgPhP3/iHKIqEYixpWTIqJFHUyWjp2+JIS3RbQGz3Zhh/BGeX+aSZcOD/B9rL3bBeCHzbu+p557vPjtJzU=
X-Received: by 2002:a65:578e:0:b0:513:a488:f05f with SMTP id
 b14-20020a65578e000000b00513a488f05fmr620379pgr.1.1680889001970; Fri, 07 Apr
 2023 10:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230318133952.1684907-1-trix@redhat.com>
In-Reply-To: <20230318133952.1684907-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 10:36:30 -0700
Message-ID: <CAKwvOdk=TGUTJMN1Am6EayVd1M9NRy_SwpUQBFWCb=+5KyMeXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/kmb: remove unused
 set_test_mode_src_osc_freq_target_low, hi_bits functions
To: Tom Rix <trix@redhat.com>
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
Cc: llvm@lists.linux.dev, edmund.j.dea@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nathan@kernel.org,
 anitha.chrisanthus@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 18, 2023 at 6:39=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/kmb/kmb_dsi.c:822:2: error: unused function
>   'set_test_mode_src_osc_freq_target_low_bits' [-Werror,-Wunused-function=
]
>         set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi *kmb_ds=
i,
>         ^
> drivers/gpu/drm/kmb/kmb_dsi.c:834:2: error: unused function
>   'set_test_mode_src_osc_freq_target_hi_bits' [-Werror,-Wunused-function]
>         set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi=
,
>         ^
> These static functions are not used, so remove them.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/gpu/drm/kmb/kmb_dsi.c | 28 ----------------------------
>  1 file changed, 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.=
c
> index cf7cf0b07541..ed99b14375aa 100644
> --- a/drivers/gpu/drm/kmb/kmb_dsi.c
> +++ b/drivers/gpu/drm/kmb/kmb_dsi.c
> @@ -818,34 +818,6 @@ static void test_mode_send(struct kmb_dsi *kmb_dsi, =
u32 dphy_no,
>         }
>  }
>
> -static inline void
> -       set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi *kmb_ds=
i,
> -                                                  u32 dphy_no,
> -                                                  u32 freq)
> -{
> -       /* Typical rise/fall time=3D166, refer Table 1207 databook,
> -        * sr_osc_freq_target[7:0]
> -        */
> -       test_mode_send(kmb_dsi, dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES,
> -                      (freq & 0x7f));
> -}
> -
> -static inline void
> -       set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi=
,
> -                                                 u32 dphy_no,
> -                                                 u32 freq)
> -{
> -       u32 data;
> -
> -       /* Flag this as high nibble */
> -       data =3D ((freq >> 6) & 0x1f) | (1 << 7);
> -
> -       /* Typical rise/fall time=3D166, refer Table 1207 databook,
> -        * sr_osc_freq_target[11:7]
> -        */
> -       test_mode_send(kmb_dsi, dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES, =
data);
> -}
> -
>  static void mipi_tx_get_vco_params(struct vco_params *vco)
>  {
>         int i;
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
