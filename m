Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC12D718933
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 20:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C659E10E500;
	Wed, 31 May 2023 18:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCC210E500;
 Wed, 31 May 2023 18:17:06 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1a208e249e3so60157fac.2; 
 Wed, 31 May 2023 11:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685557026; x=1688149026;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IKE7gLneboHzBYpBQs2sbluEvJxYw167pBbu10odVYc=;
 b=WjgN/rQ6A6sy6x1UGKx0hZUiHK/3aru6qw39NAaT7SV65yJHIjt1fXFfINdMz3mftd
 E/Yoxh5e7Wgu3nPlRvoONaHNk6EusOa4m2eJsQRkct/wBtqwjMeunwyesJB7clFCTGHj
 YedMkxyg/Knxb/6S3I04JD9Y9RH7xAbJDIabn/iNLahoES7UKHhV0/SNPHOgWbmzIuA6
 WcJ/eVeNPltZjtt+0SITiVCOvAiWODUJdDZ9fUlXIzpg9aBp1Kd7+HLe1RNZKpWbXFmz
 uC1ssYRLUn7kfdI2SsSE7kyv4e6huTnGCnfYfe6Mn9m2/LbPaVCENEdZSW0EoM9w12Fk
 LCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685557026; x=1688149026;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IKE7gLneboHzBYpBQs2sbluEvJxYw167pBbu10odVYc=;
 b=WQq0hKCL5HLTpdeF8TQDXti2AiC9jbBghgP39XmpcKvCRM+z0OtNBtt74mNfL3+RvJ
 0+dakZP8dcxEAS856BN+DkAl3YWb1XzxKxmfoi1RaqM5vQs7zsZu3u5N8yklNb3G2L2r
 aBDDa0wuNLL71MCdiXXHQTAtKW8opOD/CfBbTgxBAzLlsy0Qq4EELXOTAL6RaYHsC1mT
 PfBBRqlJI8k60gN6cIE6if26+w0ZjTnPqEMZh9TmdyciVvqtTcu+Y7wqckqj19+REjOi
 qhd6FJYZxlYaxbV8jAY6R/pCmgXq76hsav0RGO3/4dPwM+daGqEVYXSZS3GMKvAO+VoO
 RQGQ==
X-Gm-Message-State: AC+VfDwwIH9xdvycrlUVRqHkKNrcoSurk0KlSavSJgWNXqZKMFneRN3+
 unnySprq6Tx3xZh6ShlH65UyyM7UXZkCL7FM5Y0=
X-Google-Smtp-Source: ACHHUZ6cLe1ZQVM8glQY1J5ntv8EYVB9R8yV7noymkqrytZ5v9UmE1VzoQp4Yp73YfIKYBX8LGitTg1kRp59ixYa7RQ=
X-Received: by 2002:a05:6870:e19:b0:199:a7f5:61fa with SMTP id
 mp25-20020a0568700e1900b00199a7f561famr3510327oab.58.1685557025625; Wed, 31
 May 2023 11:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230330152040.1838353-1-trix@redhat.com>
 <6dac0c4b-a792-849b-97be-31ad3a527e7b@amd.com>
 <CY8PR12MB743581364ACB8E28AB149A48858E9@CY8PR12MB7435.namprd12.prod.outlook.com>
In-Reply-To: <CY8PR12MB743581364ACB8E28AB149A48858E9@CY8PR12MB7435.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 31 May 2023 14:16:54 -0400
Message-ID: <CADnq5_NP=bGpe6cih7pnYauNWccLzetzZxvg2zAiaWrJRJQG9w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: remove unused sq_int_priv variable
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>
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
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Tom Rix <trix@redhat.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 12:04=E2=80=AFPM Kim, Jonathan <Jonathan.Kim@amd.co=
m> wrote:
>
> [Public]
>
> Hi Felix,
>
> That is correct.  The debugger will need sq_int_priv to work.

I'll just apply this for now.  We can squash the revert into the
debugger changes once those land.

Alex

>
> Thanks,
>
> Jon
>
> > -----Original Message-----
> > From: Kuehling, Felix <Felix.Kuehling@amd.com>
> > Sent: Thursday, March 30, 2023 11:39 AM
> > To: Tom Rix <trix@redhat.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> > airlied@gmail.com; daniel@ffwll.ch; nathan@kernel.org;
> > ndesaulniers@google.com; Kim, Jonathan <Jonathan.Kim@amd.com>
> > Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; lin=
ux-
> > kernel@vger.kernel.org; llvm@lists.linux.dev
> > Subject: Re: [PATCH] drm/amdkfd: remove unused sq_int_priv variable
> >
> > Am 2023-03-30 um 11:20 schrieb Tom Rix:
> > > clang with W=3D1 reports
> > > drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.c:282:38:
> > error: variable
> > >    'sq_int_priv' set but not used [-Werror,-Wunused-but-set-variable]
> > >          uint8_t sq_int_enc, sq_int_errtype, sq_int_priv;
> > >                                              ^
> > > This variable is not used so remove it.
> >
> > Hi Jon,
> >
> > I think your debugger patches are going to start using this. Can you
> > comment?
> >
> > I'd prefer not to apply this patch now, as Jon's patches are expected t=
o
> > land soon, once Alex is done upstreaming GFX 9.4.3 support.
> >
> > Regards,
> >    Felix
> >
> >
> > >
> > > Signed-off-by: Tom Rix <trix@redhat.com>
> > > ---
> > >   drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c | 9 +--------
> > >   1 file changed, 1 insertion(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
> > b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
> > > index 0d53f6067422..bbd646c0dee7 100644
> > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
> > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
> > > @@ -279,7 +279,7 @@ static void event_interrupt_wq_v11(struct kfd_dev
> > *dev,
> > >   {
> > >     uint16_t source_id, client_id, ring_id, pasid, vmid;
> > >     uint32_t context_id0, context_id1;
> > > -   uint8_t sq_int_enc, sq_int_errtype, sq_int_priv;
> > > +   uint8_t sq_int_enc, sq_int_errtype;
> > >     struct kfd_vm_fault_info info =3D {0};
> > >     struct kfd_hsa_memory_exception_data exception_data;
> > >
> > > @@ -348,13 +348,6 @@ static void event_interrupt_wq_v11(struct kfd_de=
v
> > *dev,
> > >                             break;
> > >                     case SQ_INTERRUPT_WORD_ENCODING_INST:
> > >                             print_sq_intr_info_inst(context_id0,
> > context_id1);
> > > -                           sq_int_priv =3D REG_GET_FIELD(context_id0=
,
> > > -
> >       SQ_INTERRUPT_WORD_WAVE_CTXID0, PRIV);
> > > -                           /*if (sq_int_priv &&
> > (kfd_set_dbg_ev_from_interrupt(dev, pasid,
> > > -
> >       KFD_CTXID0_DOORBELL_ID(context_id0),
> > > -
> >       KFD_CTXID0_TRAP_CODE(context_id0),
> > > -                                           NULL, 0)))
> > > -                                   return;*/
> > >                             break;
> > >                     case SQ_INTERRUPT_WORD_ENCODING_ERROR:
> > >                             print_sq_intr_info_error(context_id0,
> > context_id1);
