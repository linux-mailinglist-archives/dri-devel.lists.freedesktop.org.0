Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5036DE01B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 17:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5649B10E58F;
	Tue, 11 Apr 2023 15:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E9310E37F;
 Tue, 11 Apr 2023 15:56:25 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 cp25-20020a056830661900b00693ce5a2f3eso4074770otb.8; 
 Tue, 11 Apr 2023 08:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681228583;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=blZTaPYlMR7AQP+71+NEiokmd1N4qfMAzJNYCFJD4Bg=;
 b=jzQOnNVGM/ALI7dsZpyXhpbkIed3eDV57GxgWlpta6fNfcxOBW8cKWKutgcRGcGN2m
 EN5waxx7JzGYnfsRtlkenrRFv/IWlfX9x0S7hgnhb9CkYiVgXQa032iqqQ6rsVabP0Lg
 bpuWeSnPVxoX1G7EIQb9WuBEIEMc12ZiGEOba4pzgcNmcKcOVX+DoMxTuimUCsQvbe+F
 YakMQbPbQvLIU3YdWoIJ51O1kxnIlCmencEORCpfLbx9MiYppacowNxPSO1wUpX4f4kr
 uq3ehEVVnifACLQTB2tqyAhRq6ROlPPLr1bcVRxzCXtVxFrR5rFLRTxt+UYZxLI5IQ8v
 CbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681228583;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=blZTaPYlMR7AQP+71+NEiokmd1N4qfMAzJNYCFJD4Bg=;
 b=IwwLjgQd/mxcpzPHnuUptGCGvIONbx8LzYxrHcnvanhJ6wEcqFWXy5oADnhiSU+dQ5
 gKhfo6n7jTfI3P1txu27307n64x31QvYvFFboTkQDz+xnBS3xQjcTKHq+2yzvFM/0qAi
 643KJqKDejxbjpHq3JEf5GdKXpNtsgMjBZGk4IHKqCRG5Q0E1Y5sbFq+iDexHkm1y+t9
 0lk74ZB4at54RWP0pCjZeNgoN81H/nnR7mMONH2Y2F3cpFHP3CGSj/FlbFGwZETfuDzT
 b5X3F0WlRGrDJOK6G9zOME4TYZQ6i+rZl3KjetTUESBy9MM0YHoTMaMQeKgQPAI8ISiW
 gbJA==
X-Gm-Message-State: AAQBX9fbxnfZdvfUT2Nc1h4NHUj3yOVP7SGFerZ39WjRXXjek1q6dZHJ
 AY4nvYlI83XfZEcJd+2bLhNgl5Lq0Z7DpiKtLNabDh3+
X-Google-Smtp-Source: AKy350ZeTt35ctmMkf1y/Tm/091yGhyN8QNjPCOcWeYZuyqpqiPMUz4+j/S2KORH+eswkhXOEbtBcjdcg+grziNVopo=
X-Received: by 2002:a05:6830:108c:b0:6a3:e43a:c707 with SMTP id
 y12-20020a056830108c00b006a3e43ac707mr2862709oto.7.1681228583088; Tue, 11 Apr
 2023 08:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGvwuj5tabyW910+N-B=5kFNAC7QNYoQ=0xi3roBjQvFFQ@mail.gmail.com>
 <ZDU2ASmAWEL0yjrc@phenom.ffwll.local>
 <CAF6AEGsLnPempzs1nCEKc4hNF54A_e5eG0gi92hyMd-y3_b3Sg@mail.gmail.com>
 <ZDV1+T9n4HCPnfUM@phenom.ffwll.local>
In-Reply-To: <ZDV1+T9n4HCPnfUM@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 11 Apr 2023 08:56:11 -0700
Message-ID: <CAF6AEGtbwS7-SKd_Q8t0AEPsE0j7ZsvHK2DmH-Ggnp0V6jhXoQ@mail.gmail.com>
Subject: Re: [pull] drm/msm: drm-msm-next-2023-04-10 for v6.4
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 8:00=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Tue, Apr 11, 2023 at 07:55:33AM -0700, Rob Clark wrote:
> > On Tue, Apr 11, 2023 at 3:27=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch>=
 wrote:
> > > > Konrad Dybcio (18):
> > > >       drm/msm/adreno: Use OPP for every GPU generation
> > >
> > > This had a minor conflict with refactoring from drm-misc-next, I went
> > > what's in your pr. Please double check I didn't screw up, but at leas=
t it
> > > compiles :-)
> >
> > Hmm, am I looking at the wrong thing.. the conflict I'm seeing is with
> > drm_gem_lru (and looks to be correctly resolved)
>
> Yeah that one was trivial. Unfortunately git does not report anything if
> you only keep one or the other branch entirely in your resolution, so the
> only way for you to see the conflict is to re-create the merge :-) Or at
> least my git foo isn't good enough for a better way ...

Ahh, right.. yes, this looks like the correct resolution (change
coming from drm-misc side was something that was removed from msm-next
side)

BR,
-R

> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
