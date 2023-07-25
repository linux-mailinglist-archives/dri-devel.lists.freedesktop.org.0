Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77691761D59
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 17:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84C910E3DC;
	Tue, 25 Jul 2023 15:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BC710E3DC;
 Tue, 25 Jul 2023 15:26:35 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-563439ea4a2so3802695eaf.0; 
 Tue, 25 Jul 2023 08:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690298795; x=1690903595;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0fUeb8wxv7pK70JGK+OzUJpuT5a5QL825TOjXkooBTM=;
 b=p4SlQTlBOX7qsNpWJHDm7lTzaQL8Y5qyTltfb4csDTCYNaRA8vscclEMiy+WAo9Omu
 TtGfjFLmQXv5CkZCDyTIjjsOQDvBy9vL2ZYzFzDJdS7Ui02dVc0j9z1FcfMn0tnMFstD
 fFm3dwv5KHD3NBdbKHxs23YWjZlhEnoiOYjaZcY5RtFrRpaeTizazIjQKOwYiXML99hK
 bqU8+OyXuPwAOxpDqSrAR7OGJeL4PGwL0aUtfkm5X5K7Eh4nG9yXPRlaHB8Oi4lv4rzE
 EuztkTxWpR8U+mhUkhUjbZp0aIPYPKRhjX11cc4jnGr/f5gc6mx9uQp2wzScbEGeRvh0
 ZvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690298795; x=1690903595;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0fUeb8wxv7pK70JGK+OzUJpuT5a5QL825TOjXkooBTM=;
 b=IDJt9oJ+J1XD3DMEjPv3jgGpOCqG4OLBLvSaMlI41i1AcKpfOyK2h2CFyAva9oY8b1
 HJH6BSFZsW9m4guwweTtjh0Xq7kKnoWAbIHYTH6u3ShK9KjS/2QGHMpQxb3rKlJKmGDE
 4TZCBoz8591F415VnXzsTamrPhjNIfID7+xP/rzVLl+h1pJh7OOdX1JM7oHGa9ln9/Dy
 BOK3Q6fRxbeVqeE/ws7S3NYdg5TnjMP6ADMEtY93WXHHevmUZCHv2iBugmhdCPQPHPaX
 +M0y/BRf+pbPd2uiMX41Nh8XSRn7CYXq8GSN1bj+D6UYHbRQC2OpxDLsPHm7sRJDenke
 Uyfg==
X-Gm-Message-State: ABy/qLbkSzWb8yniO9BfHKAtuP09hLYDNkGop2mWrsxrqienBY6ELIg4
 KLAkIH6gKtN0VV2wk37zfUtcnkFS5I5bR7Xpyk0=
X-Google-Smtp-Source: APBJJlEpTSUxyD+aoX0PG6FBzZg8ZBF0TeoTZhOm/IDSTSaDySFrvJAfT2bgxHD8GdcysYxS7w0r1B6khv4/MuoLp+w=
X-Received: by 2002:a05:6808:192a:b0:3a3:f237:61db with SMTP id
 bf42-20020a056808192a00b003a3f23761dbmr18906337oib.11.1690298794976; Tue, 25
 Jul 2023 08:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230725043946.33470-1-zhanglibing@cdjrlc.com>
 <6bf7217253d188c37004e8793bd58c88@208suo.com>
In-Reply-To: <6bf7217253d188c37004e8793bd58c88@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Jul 2023 11:26:23 -0400
Message-ID: <CADnq5_Pk=zvAeHPjFT3=ZdLPKAzyMEyD-uxtfAB84nFtYsM9gA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Fix format error
To: wuyonggang001@208suo.com
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Jul 25, 2023 at 3:19=E2=80=AFAM <wuyonggang001@208suo.com> wrote:
>
> Fix the error(s):
>
> ERROR: space required before the open parenthesis '('
>
> Signed-off-by: Yonggang Wu <wuyonggang001@208suo.com>
> ---
>   drivers/gpu/drm/radeon/r300.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/r300.c
> b/drivers/gpu/drm/radeon/r300.c
> index 9c1a92fa2af6..25201b9a5aae 100644
> --- a/drivers/gpu/drm/radeon/r300.c
> +++ b/drivers/gpu/drm/radeon/r300.c
> @@ -249,7 +249,7 @@ void r300_ring_start(struct radeon_device *rdev,
> struct radeon_ring *ring)
>
>         /* Sub pixel 1/12 so we can have 4K rendering according to doc */
>         gb_tile_config =3D (R300_ENABLE_TILING | R300_TILE_SIZE_16);
> -       switch(rdev->num_gb_pipes) {
> +       switch (rdev->num_gb_pipes) {
>         case 2:
>                 gb_tile_config |=3D R300_PIPE_COUNT_R300;
>                 break;
> @@ -638,7 +638,7 @@ static int r300_packet0_check(struct
> radeon_cs_parser *p,
>         track =3D (struct r100_cs_track *)p->track;
>         idx_value =3D radeon_get_ib_value(p, idx);
>
> -       switch(reg) {
> +       switch (reg) {
>         case AVIVO_D1MODE_VLINE_START_END:
>         case RADEON_CRTC_GUI_TRIG_VLINE:
>                 r =3D r100_cs_packet_parse_vline(p);
> @@ -1180,7 +1180,7 @@ static int r300_packet3_check(struct
> radeon_cs_parser *p,
>         ib =3D p->ib.ptr;
>         idx =3D pkt->idx + 1;
>         track =3D (struct r100_cs_track *)p->track;
> -       switch(pkt->opcode) {
> +       switch (pkt->opcode) {
>         case PACKET3_3D_LOAD_VBPNTR:
>                 r =3D r100_packet3_load_vbpntr(p, pkt, idx);
>                 if (r)
