Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F93A8961E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 10:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33A510E67A;
	Tue, 15 Apr 2025 08:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="NgaHgYnv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.155.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFA510E681;
 Tue, 15 Apr 2025 08:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1744704597;
 bh=iNh5evHJUywRwTG+40vvBkWAew+FHIXObMQAM9x50Ig=;
 h=MIME-Version:From:Date:Message-ID:Subject:To;
 b=NgaHgYnvkWSE1UJhdOyUApCzHs+z4wQ/tQggdrL7Y5jmpZFxADiVbMkqkkCkD/uUa
 pg3MsA1Od0YIaE5sRzbrS8C93ZH9u/+7CJ3epdzXRXN9aztyvwL8HBeLrMP8WS4U2o
 47+Xm7hsLjupHv4amATTsEke2Olw3A26yqg1m4Ec=
X-QQ-mid: zesmtpsz4t1744704592te3135b3a
X-QQ-Originating-IP: it5IqF99Gt3HL/ewKO0fg6+cNcYxA3sxiPflAiEM+ok=
Received: from mail-yb1-f169.google.com ( [209.85.219.169])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 15 Apr 2025 16:09:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4846207634195593150
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e6df4507690so4605565276.0; 
 Tue, 15 Apr 2025 01:09:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVm2UIz7CSog7EsvhvqITKjIxxBM+CweJdLr7fbsBtSPfr5ILBfNlOMEO3cPSWRabvs+nIt5MFFGI80@lists.freedesktop.org,
 AJvYcCXf8Bu0j2bdoZL5aQy9Ay3l8UuYVxv9+S1zrrVch9BW43z64SD3zIqI9gKqxDKgnGc2gKpHXjjKzew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXNEwGFUpVNazqDa+wPNOV6iGYkEPguy84QAsdwNNcDBtgzPQW
 pzraQ7NLjbij6jIq5KvayHjA5N5yVzOQV3/M5PzF1fKXl+w/z2Z0f2FsBsOG0rxfI3RWnTIJkZy
 Lk0TRfrpI83htnAL7vYIjPe+TrX4=
X-Google-Smtp-Source: AGHT+IF44p1Tl1fp8b57iSl2LN3MmmbjsUksYboLirN5uKzIqEc9Wg6NTY7B4YCgu9/aQ2qBxW8fFjV63/YhrNc1n+A=
X-Received: by 2002:a05:6902:4a2:b0:e63:cfb7:5da5 with SMTP id
 3f1490d57ef6-e70a600de9amr2485436276.9.1744704589570; Tue, 15 Apr 2025
 01:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <31F42D8141CDD2D0+20250411105142.89296-1-chenlinxuan@uniontech.com>
 <20250411105459.90782-1-chenlinxuan@uniontech.com>
 <8921351F23CD8948+20250411105459.90782-4-chenlinxuan@uniontech.com>
 <87sem9svmn.fsf@intel.com>
In-Reply-To: <87sem9svmn.fsf@intel.com>
From: Chen Linxuan <chenlinxuan@uniontech.com>
Date: Tue, 15 Apr 2025 16:09:38 +0800
X-Gmail-Original-Message-ID: <E03CDF8280BA0401+CAC1kPDMuAmfoJfL4wjrBEcK+rpgbWk7kYEWJjvps=2UJ6-_WHw@mail.gmail.com>
X-Gm-Features: ATxdqUGMt5t8NoBhtiULJMPe9lwTrkhJZn98DpdX0RPcQenV938hZ2QVLR5IOU8
Message-ID: <CAC1kPDMuAmfoJfL4wjrBEcK+rpgbWk7kYEWJjvps=2UJ6-_WHw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/7] drm/i915/pxp: fix undefined reference to
 `intel_pxp_gsccs_is_ready_for_sessions'
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Chen Linxuan <chenlinxuan@uniontech.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Alan Previn <alan.previn.teres.alexis@intel.com>, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, 
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: N7zE+17nr98T7G4a9Ai8Ezs2J351uv8jqUSg0FofJPciVF+Vbwz3nuWR
 UNfvdtYegL6PnrsWjqXp7hL03vUfKinM52tIVA9T0yGjYbLXq5v8H+yDUWuWK6t1V8Tlb1h
 x/4JhmMKbG6dAXLtKKYXVYKHfSLcVzcTfwR+S0sA/cnnexkiJ1OsW34yDd/GEI0GP2+FAMG
 2JkZuVifPWDQ3ORARpZS8OqC/GFMcNSgLZgZT3MexjqqpFGduG9uZkDKJDSVwnzz+4cnkZf
 oTnmnILQO1zSXO7VWs+xzBm3CDsuj/bin5wVArSzqLO2/j5yl7lniIKpsM2B3sEng+wArFR
 YtPmfqaFPoCMc636w4gFEHrVRdHVB9fDHB4f8QGCT7Bsh9mjLpjsK/dFYwRCOMt2KxG4fTl
 oaiAy9n9Ssh26X6EwSIzRewC8Wj2OdTCmuLO42k//S+tFeJgFZ2QcRpN1hQ5Rk2xRrh1X4G
 h5LMkeXBROeIa46mmuE7OB5iYqrglNK7zGf8lQJQlf0gAVykdcEPXtVX0dad/OS3BVHvMb3
 tBraBnZlA9iE50xC0GD2ZxOyqFb5k9IDUR41YAdaaL7VuEe21MbQBIBTnC1xnZGWZqnjUkb
 XvDExc75nF7rbj7eAS5I/oJeMMMrjmRYPwTfHTLx9b5auqRdBMsArJ0OF88orT7vwxCFFub
 /4/mQFtvPnwoaJY/sxQsfRE5afQXWEgMOdqTeh6ycVVydbZ2yDWauR+WG7KhgIuTIQ7kAPj
 i3ABCR/NXB4+5/bSJeXlFiDRJNZOLzA0IdtOXXzbdkTCxnSqxQP3WDF8dmol+ShF2fwl1py
 O4b3BweEzf/lcOlccMslJF83q5BKvEwazPrbeN6Qt3EMThtvDeV5N2SwyzCeYzc0BB7kuLb
 AFLsWYjPp+hRqC/P1T5RSrEswoQsrSuM1hY8uV8E1yaCWIPAKSkQ9MxFXwonzSDgrPRrR62
 Rp9TO+0EPo2JShZnzEVVmO6GUxsoJlzvBVx+A1W8ZrZgO6xTxff9tAJVwfKp/UkvSYvkF7f
 BCYYLaibXA8YZLncxiF/Tg+exmyLeZFre/DJQ6Wcdlyt6EBXFlbxJvJWwGPWrADimZALfF8
 PJOmr+k+fs9ZSJCMKfCgt7V92pwkoKrIA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
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

Jani Nikula <jani.nikula@linux.intel.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=881=
5=E6=97=A5=E5=91=A8=E4=BA=8C 15:59=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, 11 Apr 2025, Chen Linxuan <chenlinxuan@uniontech.com> wrote:
> > On x86_64 with gcc version 13.3.0, I compile kernel with:
> >
> >   make defconfig
> >   ./scripts/kconfig/merge_config.sh .config <(
> >     echo CONFIG_COMPILE_TEST=3Dy
> >   )
> >   make KCFLAGS=3D"-fno-inline-functions -fno-inline-small-functions -fn=
o-inline-functions-called-once"
>
> The change looks good, but I'm guessing the real explanation is that you
> have CONFIG_DRM_I915_PXP=3Dn and that appears to be broken.
>
> Fixes: 99afb7cc8c44 ("drm/i915/pxp: Add ARB session creation and cleanup"=
)
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
> But how do you want this merged?
>

As patch 5 has been merged into rdma-next, I think it's OK to merge
this single patch into your tree.

>
> BR,
> Jani.
>
> >
> > Then I get a linker error:
> >
> >   ld: vmlinux.o: in function `pxp_fw_dependencies_completed':
> >   kintel_pxp.c:(.text+0x95728f): undefined reference to `intel_pxp_gscc=
s_is_ready_for_sessions'
> >
> > Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
> > ---
> >  drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/d=
rm/i915/pxp/intel_pxp_gsccs.h
> > index 9aae779c4da3..4969d3de2bac 100644
> > --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> > @@ -23,6 +23,7 @@ int intel_pxp_gsccs_init(struct intel_pxp *pxp);
> >
> >  int intel_pxp_gsccs_create_session(struct intel_pxp *pxp, int arb_sess=
ion_id);
> >  void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 arb=
_session_id);
> > +bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
> >
> >  #else
> >  static inline void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
> > @@ -34,8 +35,11 @@ static inline int intel_pxp_gsccs_init(struct intel_=
pxp *pxp)
> >       return 0;
> >  }
> >
> > -#endif
> > +static inline bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_=
pxp *pxp)
> > +{
> > +     return false;
> > +}
> >
> > -bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
> > +#endif
> >
> >  #endif /*__INTEL_PXP_GSCCS_H__ */
>
> --
> Jani Nikula, Intel
>
>
