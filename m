Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF94B579454
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 09:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C599F10FF10;
	Tue, 19 Jul 2022 07:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E2210FF36;
 Tue, 19 Jul 2022 07:35:47 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id g1so9781795qki.7;
 Tue, 19 Jul 2022 00:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ri9Wtdrs9zsrpeBy+vnSCFNuGKAMpG2mmAMCu25LqXs=;
 b=AWW2U6Xitzx/M3SDaHULenGbqBcdtOVnqcAA1A8NHUduJJ07hIKUKRyFvVd/fhdj+P
 BA/XYdRhp3K+o/eWOtXfuKeXqSjUhkBBa2YDNDnRTx1v9HyOv5HFcv46fwhAjMoflBbs
 AFyUTy3piLZvs2XgoCFwBvFJ9lPj6hMZATkKjy+IuB9h5CRqRKu8SS7PE6G3TSqB/Pm9
 wFeuVxXK2MNDxzpaUG6UUkkvOv6/fREUFCIN32EINWT0Kp8jDs+NaNUlPfjAmPwE87I1
 R0EelbbA8EMf4hJoGnbji0bitx+9wPW++l8WMlRj32HVACgjTHhPrt77+NN+aWDeXjDZ
 /ekQ==
X-Gm-Message-State: AJIora84iCZdkE8WuFPa1npKmVPJsQM0LR+RiEOzj9OCwS6eLQ4nj9VS
 ffFP/SaW/vAcNNsAhcHNtXdi6C3NWfAmpQ==
X-Google-Smtp-Source: AGRyM1vwOHrbcd9RUrYpXpsoyamQIH4Fx6cbmEz+YcoDwQy9XgtbgiWtvLZpUkVf2rVOT/TskO53pQ==
X-Received: by 2002:a37:44b:0:b0:6b5:d3ee:c244 with SMTP id
 72-20020a37044b000000b006b5d3eec244mr11264416qke.239.1658216146605; 
 Tue, 19 Jul 2022 00:35:46 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 g19-20020ac870d3000000b0031edab8ae91sm7828349qtp.49.2022.07.19.00.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 00:35:46 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-31dfe25bd49so94536227b3.2; 
 Tue, 19 Jul 2022 00:35:46 -0700 (PDT)
X-Received: by 2002:a81:84c1:0:b0:31e:4e05:e4f4 with SMTP id
 u184-20020a8184c1000000b0031e4e05e4f4mr5036327ywf.384.1658216145796; Tue, 19
 Jul 2022 00:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220711124742.3b151992@canb.auug.org.au>
 <6e60d396-2a52-d1fa-f125-3c585605b531@amd.com>
 <20220718094453.2f1a1f09@canb.auug.org.au>
In-Reply-To: <20220718094453.2f1a1f09@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Jul 2022 09:35:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzBy0O0kQTZxC52oL7At2EcFpL0C3nY4YAsBPzaEGW=w@mail.gmail.com>
Message-ID: <CAMuHMdWzBy0O0kQTZxC52oL7At2EcFpL0C3nY4YAsBPzaEGW=w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

On Mon, Jul 18, 2022 at 1:49 AM Stephen Rothwell <sfr@canb.auug.org.au> wro=
te:
> On Mon, 11 Jul 2022 10:05:45 +0200 Christian K=C3=B6nig <christian.koenig=
@amd.com> wrote:
> > Am 11.07.22 um 04:47 schrieb Stephen Rothwell:
> > >
> > > Today's linux-next merge of the drm tree got a conflict in:
> > >
> > >    drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > >
> > > between commit:
> > >
> > >    925b6e59138c ("Revert "drm/amdgpu: add drm buddy support to amdgpu=
"")
> > >
> > > from the drm-misc-fixes tree and commit:
> > >
> > >    5e3f1e7729ec ("drm/amdgpu: fix start calculation in amdgpu_vram_mg=
r_new")
> > >
> > > from the drm tree.
> > >
> > > This is a mess :-(  I have just reverted the above revert before merg=
in
> > > the drm tree for today, please fix it up.
> >
> > Sorry for the noise, the patch "5e3f1e7729ec ("drm/amdgpu: fix start
> > calculation in amdgpu_vram_mgr_new")" and another one is going to be
> > reverted from the drm tree as well.
> >
> > It's just that -fixes patches where faster than -next patches.
>
> Here we are a week later, -rc7 has been released and as far as I can
> tell (though I may have missed it), this is still a problem :-(
>
> I am still reverting 925b6e59138c (which is now in Linus' tree).

Thanks for the hint! After reverting that commit, drm-next (sort of[1])
merges cleanly into upstream again.

[1] There's still a small conflict due to the removal of
    force_dpms_off, cfr. the difference between commits
    3283c83eb6fcfbda and cc79950bf0904f58 ("drm/amd/display:
    Ensure valid event timestamp for cursor-only commits") in
    v5.19-rc7 resp. drm-next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
