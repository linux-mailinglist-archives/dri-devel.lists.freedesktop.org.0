Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354608CB308
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 19:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DB010F015;
	Tue, 21 May 2024 17:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KJbzsR2m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD2D10F013;
 Tue, 21 May 2024 17:39:56 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-5c6bd3100fcso421899a12.3; 
 Tue, 21 May 2024 10:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716313196; x=1716917996; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l6naY1ebYgtBqBr6FtFx0JuqKFL0i54ZhF9HoediEIY=;
 b=KJbzsR2mYC/ZuZrvoOs8RONKeRvuFYok80Cvj01Poy+1pgNVmnq0j3Km1xNQ89DpnO
 /NmYjdzqltjyywf7mKWBS9ixo8eaBM8mobrkg0Z4aW7G5i/mDF075zonOHQJcz533BSe
 efEwm/rYPp+aA+Z0MdFbBQt3ViPV77KpdCe3pjD0+41rt/KCpQZ2dYnbthCjMbA4g5P1
 EtBdin5ctxMcBRIGklZXoH0z4tWO+/TXEO2TwmLpbpLZoMdLfGNFG5cToHhe+Y65U8Ze
 mqTexo52iuG949HV6KLicSIL5+DEjbr9RBsrHPt9RTZhTe4r/5IvG9TAwPrf0JIfbQTS
 mCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716313196; x=1716917996;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l6naY1ebYgtBqBr6FtFx0JuqKFL0i54ZhF9HoediEIY=;
 b=bNFZuWP3nd+BjsaLZOQL/BN9r/DD/lLrEzXKarz+rSh1tN7oItvVqiH5Tt54ApZKuQ
 UC/ZgWfETohEpPZK64jCXSulgxUUgRZ46PDtHo28RiXLVzJl/NoTCdOuqS6/YsR/ArpT
 +5TR1FYuBtkIho2Vbl1bfBduMkZA7wyXXJkQnKhHdqFB5MVPkKzvgRcRUSpqmeCE2mi7
 IqvRbi3s90a7owI/wk05zHsJB0MLceBc847cTYbdgc/KtLCeHP+kYDTKt3X5yNTm28+Q
 3fe60Txzmg5Bo9gqJNBY58/Z/mQ8EZiO935M+Lg7RsKW6pFRd7xVn/vIeGp0fSNkcB3/
 eQtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl0ee4ZNhcjciykQQH7XB7DTNB1SDeJ8qWwCLPFWY4wOBuyXxMmxE948YIarYC3dHLVBUyxvoO1adk4l7LOJuhe4FnH8AljXl6yJAgEiZM4G47JcdX3ITAWCbF1PePnoLRjA6XdPWvW8AuV8HrvF8uv2/geaV3qeiU/nqYRIFROB/4+7dyyWojVaD5Y7Q5mQ==
X-Gm-Message-State: AOJu0YxMnSCfk+gmaB0b106srtVh+cu6Mgk4zuGifQ2dbI9a1Fsa0JQK
 yjNMvTHHklPacfOiisK3g1m4DRjceHGfPckMt2y4UJ6EmCmr0wx/phO6e8LgFzwJ2ev0dVfdue4
 HQiN9CVnEfmN62l6UREOQDRnF7Qc=
X-Google-Smtp-Source: AGHT+IEtIwnLHEJom7EzPs7RT34MstjtZMfmyW9DXLDXYepTOE0snpQgoUF0SiAcYhvLERYK6iuAIEpcIVtspvvn1Wc=
X-Received: by 2002:a17:90a:fd8a:b0:2bc:9bce:19c3 with SMTP id
 98e67ed59e1d1-2bc9bce1df0mr12631794a91.43.1716313195890; Tue, 21 May 2024
 10:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240307062957.2323620-1-Wayne.Lin@amd.com>
 <0847dc03-c7db-47d7-998b-bda2e82ed442@amd.com>
 <41b87510-7abf-47e8-b28a-9ccc91bbd3c1@leemhuis.info>
 <177cfae4-b2b5-4e2c-9f1e-9ebe262ce48c@amd.com>
 <CO6PR12MB5489FA9307280A4442BAD51DFCE72@CO6PR12MB5489.namprd12.prod.outlook.com>
 <87wmo2hver.fsf@intel.com> <6f66e479-2f5a-477a-9705-dca4a3606760@amd.com>
 <83df4e94-e1ec-42f6-8a15-6439ef4a25b7@leemhuis.info>
 <CADnq5_P+WsL8B6B2vK5ENe8VWdvheoHyxoUfgF3Oex8Gvp7Lbg@mail.gmail.com>
In-Reply-To: <CADnq5_P+WsL8B6B2vK5ENe8VWdvheoHyxoUfgF3Oex8Gvp7Lbg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 21 May 2024 13:39:44 -0400
Message-ID: <CADnq5_MYDNBpqXT8snztEGxqHh3N8_7wktNdjedkjnhe1Te6CQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mst: Fix NULL pointer dereference at
 drm_dp_add_payload_part2
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Limonciello, Mario" <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 "Lin, Wayne" <Wayne.Lin@amd.com>, "Wentland, Harry" <Harry.Wentland@amd.com>, 
 "lyude@redhat.com" <lyude@redhat.com>,
 "imre.deak@intel.com" <imre.deak@intel.com>, 
 =?UTF-8?Q?Leon_Wei=C3=9F?= <leon.weiss@ruhr-uni-bochum.de>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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

Applied and pushed out:
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D8a0a7b98d4b6eeeab337=
ec25daa4bc0a5e710a15

Alex

On Tue, May 21, 2024 at 12:12=E2=80=AFPM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> I've got it teed up.  Is drm-misc-fixes the right branch since we are
> in the merge window?
>
> Alex
>
> On Tue, May 21, 2024 at 7:20=E2=80=AFAM Linux regression tracking (Thorst=
en
> Leemhuis) <regressions@leemhuis.info> wrote:
> >
> > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> > for once, to make this easily accessible to everyone.
> >
> > Hmm, from here it looks like the patch now that it was reviewed more
> > that a week ago is still not even in -next. Is there a reason?
> >
> > I know, we are in the merge window. But at the same time this is a fix
> > (that already lingered on the lists for way too long before it was
> > reviewed) for a regression in a somewhat recent kernel, so it in Linus
> > own words should be "expedited"[1].
> >
> > Or are we again just missing a right person for the job in the CC?
> > Adding Dave and Sima just in case.
> >
> > Ciao, Thorsten
> >
> > [1]
> > https://lore.kernel.org/all/CAHk-=3Dwis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wm=
B6SRUwQUBQ@mail.gmail.com/
> >
> > On 12.05.24 18:11, Limonciello, Mario wrote:
> > > On 5/10/2024 4:24 AM, Jani Nikula wrote:
> > >> On Fri, 10 May 2024, "Lin, Wayne" <Wayne.Lin@amd.com> wrote:
> > >>>> -----Original Message-----
> > >>>> From: Limonciello, Mario <Mario.Limonciello@amd.com>
> > >>>> Sent: Friday, May 10, 2024 3:18 AM
> > >>>> To: Linux regressions mailing list <regressions@lists.linux.dev>;
> > >>>> Wentland, Harry
> > >>>> <Harry.Wentland@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>
> > >>>> Cc: lyude@redhat.com; imre.deak@intel.com; Leon Wei=C3=9F
> > >>>> <leon.weiss@ruhr-uni-
> > >>>> bochum.de>; stable@vger.kernel.org; dri-devel@lists.freedesktop.or=
g;
> > >>>> amd-
> > >>>> gfx@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > >>>> Subject: Re: [PATCH] drm/mst: Fix NULL pointer dereference at
> > >>>> drm_dp_add_payload_part2
> > >>>>
> > >>>> On 5/9/2024 07:43, Linux regression tracking (Thorsten Leemhuis) w=
rote:
> > >>>>> On 18.04.24 21:43, Harry Wentland wrote:
> > >>>>>> On 2024-03-07 01:29, Wayne Lin wrote:
> > >>>>>>> [Why]
> > >>>>>>> Commit:
> > >>>>>>> - commit 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload
> > >>>>>>> allocation/removement") accidently overwrite the commit
> > >>>>>>> - commit 54d217406afe ("drm: use mgr->dev in drm_dbg_kms in
> > >>>>>>> drm_dp_add_payload_part2") which cause regression.
> > >>>>>>>
> > >>>>>>> [How]
> > >>>>>>> Recover the original NULL fix and remove the unnecessary input
> > >>>>>>> parameter 'state' for drm_dp_add_payload_part2().
> > >>>>>>>
> > >>>>>>> Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload
> > >>>>>>> allocation/removement")
> > >>>>>>> Reported-by: Leon Wei=C3=9F <leon.weiss@ruhr-uni-bochum.de>
> > >>>>>>> Link:
> > >>>>>>> https://lore.kernel.org/r/38c253ea42072cc825dc969ac4e6b9b600371=
cc8.c
> > >>>>>>> amel@ruhr-uni-bochum.de/
> > >>>>>>> Cc: lyude@redhat.com
> > >>>>>>> Cc: imre.deak@intel.com
> > >>>>>>> Cc: stable@vger.kernel.org
> > >>>>>>> Cc: regressions@lists.linux.dev
> > >>>>>>> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > >>>>>>
> > >>>>>> I haven't been deep in MST code in a while but this all looks pr=
etty
> > >>>>>> straightforward and good.
> > >>>>>>
> > >>>>>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> > >>>>>
> > >>>>> Hmmm, that was three weeks ago, but it seems since then nothing
> > >>>>> happened to fix the linked regression through this or some other
> > >>>>> patch. Is there a reason? The build failure report from the CI ma=
ybe?
> > >>>>
> > >>>> It touches files outside of amd but only has an ack from AMD.  I
> > >>>> think we
> > >>>> /probably/ want an ack from i915 and nouveau to take it through.
> > >>>
> > >>> Thanks, Mario!
> > >>>
> > >>> Hi Thorsten,
> > >>> Yeah, like what Mario said. Would also like to have ack from i915 a=
nd
> > >>> nouveau.
> > >>
> > >> It usually works better if you Cc the folks you want an ack from! ;)
> > >>
> > >> Acked-by: Jani Nikula <jani.nikula@intel.com>
> > >>
> > >
> > > Thanks! Can someone with commit permissions take this to drm-misc?
> > >
> > >
> > >
