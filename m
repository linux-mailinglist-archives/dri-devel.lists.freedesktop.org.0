Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D8F523E6B
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 22:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBB3112B5B;
	Wed, 11 May 2022 20:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF844112B58;
 Wed, 11 May 2022 20:06:37 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a5so646477wrp.7;
 Wed, 11 May 2022 13:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W6YNSoA5Dua0+s/FF7SpEIcKqn99xdL9v6a8e8wASjE=;
 b=huVs1irgBIkg9Eul0wYK5EYPJx3b0ncqN0x9QsTfJvBcQ2t5FOtXmqR45KnVbSBCt0
 tRVR32t6absZdZ99QabYYfqRY9JvV5eBYNqMncuhU2tTBEa3Jx27JsNQ5Qk/8J/I1Rqd
 uiZxKXViZRvewgUcnsIcC3Lbrm8xA1GbN6EW0FjiDtQoz/UCGHm8rUNxBJguevCQ8bby
 hbqSts8HPIVGxqadiiBHoU5HXVcqmZGmu8SOnw+2/jhm12VXAimJtNgdng9UB3jfuSIq
 6e1eUh5wALaSoHtArYquH1ViBA4Y+EuTOUaXV46Htl6nWhXkQD9cVPMgbXCnlOic3bq7
 XXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W6YNSoA5Dua0+s/FF7SpEIcKqn99xdL9v6a8e8wASjE=;
 b=sUtepmhvnole91/OxWUnuxDi64P/pDwv2skjdaQdSmkDrzntediH+Q1BGh1FNcPlSV
 LNg7SVseejTfPJ6xUbDlMtox1x339nGXbk6g7o3VBv/QkNgCd4S6SgjZMaRhNloOa9SR
 hyCOTWnDvCCE2QuqxqUL50mRG/6Eq9Yw7/suMFaItncobTIOdb/fpvb23SaQlhwf6KIo
 XBWiRxMtgHTq/hOKp55pd84xaxKg13AL8k58SWWP6t10zeoQZjHgZuiOiTkg6cjPns2e
 zDh2uf6x1j9Q3nWpz0Vf35sMMPM43eVFtTucBX+n6WQ8nlJwnczPld5W10dTxZ92Carm
 LwZg==
X-Gm-Message-State: AOAM533QjXFnWZY6JkqJ+s6Ux2ppoFh77MS3h9ebvtPvxQPHNi5bwJ34
 jPe2AKRpow1hbnWNxnXXRavQrseFrG4/pIQW6fI=
X-Google-Smtp-Source: ABdhPJztZ9XbUj0FLLKnjaG49uOatzw5PqIll6Yx+Z6ecof8fZ/Xg+4CXVkwVcsz/BnqI+EDtAS88Q5dTYmp2/hyOH8=
X-Received: by 2002:a05:6000:156e:b0:20c:5218:8907 with SMTP id
 14-20020a056000156e00b0020c52188907mr24120425wrz.297.1652299596131; Wed, 11
 May 2022 13:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
 <CAF6AEGusO9XAqHNatJLgV+wpVoyyLg1vHtUsnSkAxJeV7n3WNg@mail.gmail.com>
 <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com>
In-Reply-To: <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 11 May 2022 13:06:23 -0700
Message-ID: <CAF6AEGvNfC6=o63hH7eoSzT5JmF5C73sDyYXJj-hecS_cgRjHg@mail.gmail.com>
Subject: Re: Adding CI results to the kernel tree was Re: [RFC v2] drm/msm:
 Add initial ci/ subdirectory
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sean Paul <sean@poorly.run>, freedreno <freedreno@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 12:08 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, May 11, 2022 at 11:40 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > It is missing in this revision of the RFC, but the intention is to
> > have the gitlab-ci.yml point to a specific commit SHA in the
> > gfx-ci/drm-ci[1] tree, to solve the problem of keeping the results in
> > sync with the expectations.  Ie. a kernel commit would control moving
> > to a new version of i-g-t (and eventually deqp and/or piglit), and at
> > the same time make any necessary updates in the expectations files.
>
> Wouldn't it then be better to just have the expectation files in the
> ci tree too?

The main reason is that we would frequently have situations where both
-next and -fixes pointing at the same ci tree commit, but with
differing expectations.  If we kept the expectations in the ci tree,
we'd end up frequently updating the ci tree and then updating the
kernel tree to point to the appropriate ci tree version.

Additionally, on the mesa side, it has been useful to squash the
expectations update into the commit that fixed a bug or added a
feature.  It provides a connection in git history between code and
test results.

BR,
-R
