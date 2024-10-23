Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6059AD5F2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 22:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F6810E23A;
	Wed, 23 Oct 2024 20:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="2GD40DV3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C591D10E23A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 20:59:47 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-37d6a2aa748so86512f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 13:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729717186;
 x=1730321986; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RqBQuVSIycI00hdpx3lR5ACuKRsYQWaJxf8hFYYXxOk=;
 b=2GD40DV3/wtd3ZHfBuc6vDkpeir3z7MsTNDQ04i+EqLYyJrfBn8B56olYo8NdYRiMz
 P+SehQHrDEzqbjct8Vp5bkp/WWBwLE9GNKU6Lxd6OaHY2b8W/qi+mnulAPfd47ta4eRE
 29KqTukhnrCsTEmsKOgf5FqGPpUUjYZoTSUhVh2+KZ4Gg/yZ/LwABtf2z0LkP0mXWaji
 s12eYLB1/dOgz6pozG0XlmmgmpnS8RnR/YJtQGj1BUdQf/4bFL2S7l6Kw2ecSjMDlo+7
 mUReXI71zqXgLKFax9GncaN9uROk6pLBo52GLex4yOwk2k3W72Xb54Kb4ym93pB6BEmA
 CUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729717186; x=1730321986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RqBQuVSIycI00hdpx3lR5ACuKRsYQWaJxf8hFYYXxOk=;
 b=nrtDvrHkQtk1b0lTJwb27KoMZFczaUeEdCubzKW6ccEAEy6r4ylt5r54bqJ2QY/Y/5
 qLzXsd0kPQDiSEyYphp6/cG2PiDEiKE0hquwjYtrlsQZjxoE5pCFJqCJGms7NNFivk/v
 Xw4o3mVaRES5EgIWVtz5RA+oQ9KXE2hY1AmleBbvUBBeFDDyZnJY9qTkRADIKLHdlacr
 NTRiOjKV76c+fg6SZgMtTy/neSib+xP2PDD+6H6a94aOYSIOG3WlYa0UwF2ATYI2ybEP
 kQdTE62h8JZrb+FUgHhr5bgOD1kLk8K6zM5LcGcbXi/szqHX0g1LKT4G+RFiv3bT6trK
 7YMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/mhHtCuc1e/rZhroGrH7jIdlW3BXz4wR2C/ZsSM1Spm8vwMfMAabjOl2maZWsph0YzkDv6BFdIk0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwixSbEGqg/EzDmhNg32EhUuGQSMakPt7fk8larWz0JKA0SCv4i
 pEpvVOkfxnSVZD7o0sAbXt4jzZtVU+LTm3Mlmc4dT9btBiUoIpHBGWvcctbb3G26k4La7gimvU1
 jc5siPM+JMi66QDzPwGMhmF9F3UMPXf9/Q29lOQ==
X-Google-Smtp-Source: AGHT+IELL8lRAg7cArEXQHvrs//3nuGQjeroLsRRDAQdATMPf9GdpSIb/13x+Z9wrbZRpZVIDhudm8c3MtPuKR4g+mo=
X-Received: by 2002:a5d:5b92:0:b0:37d:43f1:57fd with SMTP id
 ffacd0b85a97d-37efcef528emr2325118f8f.6.1729717185866; Wed, 23 Oct 2024
 13:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20241010165801.3913-1-everestkc@everestkc.com.np>
 <ZxlYbVOLPQv-oWrv@intel.com>
In-Reply-To: <ZxlYbVOLPQv-oWrv@intel.com>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Wed, 23 Oct 2024 14:59:34 -0600
Message-ID: <CAEO-vhGzRxths0OG_MJEPqocyQ5C0hDXvJRWfYYv74qnCbCVCg@mail.gmail.com>
Subject: Re: [PATCH V4] drm/xe/guc: Fix dereference before NULL check
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, skhan@linuxfoundation.org, 
 dan.carpenter@linaro.org, michal.wajdeczko@intel.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Oct 23, 2024 at 2:11=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.co=
m> wrote:
>
> On Thu, Oct 10, 2024 at 10:57:59AM -0600, Everest K.C. wrote:
> > The pointer list->list is dereferenced before the NULL check.
> > Fix this by moving the NULL check outside the for loop, so that
> > the check is performed before the dereferencing.
> > The list->list pointer cannot be NULL so this has no effect on runtime.
> > It's just a correctness issue.
> >
> > This issue was reported by Coverity Scan.
> > https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssu=
e=3D1600335
> >
> > Fixes: 0f1fdf559225 ("drm/xe/guc: Save manual engine capture into captu=
re list")
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> > Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > V3 -> V4: - Corrected the Fixes tag
> >           - Added Reviewed-by tag
>
> For some reason it looks like nor CI nor lore has this v4 version.
Yeah, I just checked that and it's something strange.
> could you please resubmit it?
Yes, let me send it right away.
> > V2 -> V3: - Changed Null to NULL in the changelog
> >           - Corrected typo in the changelong
> >           - Added more description to the changelong
> >         - Fixed the link for Coverity Report
> >         - Removed the space after the Fixes tag
> > V1 -> V2: - Combined the `!list->list` check in preexisting if statemen=
t
> >         - Added Fixes tag
> >         - Added the link to the Coverity Scan report
> >
> >  drivers/gpu/drm/xe/xe_guc_capture.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/x=
e_guc_capture.c
> > index 41262bda20ed..947c3a6d0e5a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> > @@ -1531,7 +1531,7 @@ read_reg_to_node(struct xe_hw_engine *hwe, const =
struct __guc_mmio_reg_descr_gro
> >  {
> >       int i;
> >
> > -     if (!list || list->num_regs =3D=3D 0)
> > +     if (!list || !list->list || list->num_regs =3D=3D 0)
> >               return;
> >
> >       if (!regs)
> > @@ -1541,9 +1541,6 @@ read_reg_to_node(struct xe_hw_engine *hwe, const =
struct __guc_mmio_reg_descr_gro
> >               struct __guc_mmio_reg_descr desc =3D list->list[i];
> >               u32 value;
> >
> > -             if (!list->list)
> > -                     return;
> > -
> >               if (list->type =3D=3D GUC_STATE_CAPTURE_TYPE_ENGINE_INSTA=
NCE) {
> >                       value =3D xe_hw_engine_mmio_read32(hwe, desc.reg)=
;
> >               } else {
> > --
> > 2.43.0
> >

With Regards,
Everest K C
