Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FB0881733
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 19:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE0610FE2B;
	Wed, 20 Mar 2024 18:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AKeznGg8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C1910FE2B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 18:09:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4C1ABCE11E6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 18:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7726AC433A6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 18:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710958151;
 bh=S2AmceJnA1oqX4L4Alvthv0KzzmvHxPORGTg4Ewyq04=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=AKeznGg86fgoPAtbyRS728/k3KtijffusdH3Is/KwO+8KZdQueO2r0VdKr0iAtfo9
 esNOjIV5D+PlkJygPjqyw1X0SuigiTXF+l4EZzPwcnkqx8MsS0fNDPdZu8HDsh7UF5
 rqgmOMfcbEZUQgx1sqFCdS1fECMPraY2YTq0168zFsJdyZToqjopeprEsucXIsACp4
 QU8sobYma/UwAH1b8zaw6WKebLXkabKZvyyu8WDT4Am6v2LrWT2YHTjHqXn8ffeDnG
 KvPkUtrMlnZDcH5QpwvdbOjiy4QSUFu+EVtq7EgNkzr99jgJIOsSoacahYTPks6gDI
 2gULs97eswqzg==
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-29fb12a22afso140135a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 11:09:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWlAy7JS93rGah/OOrM7AAa6iusNYsZjRgNnqZ/LdLdHdLBhVfanylUNqxDHGBqaJR5UBdI3PBRdnVg0niWGo9x9PeB3nc0hXO/x0KWazs/
X-Gm-Message-State: AOJu0Yz9sQtJmt5O0K1QJ7wKDjVSBW0hWR0Rd+5NfkqvMIFLU8+AFiOU
 bFUXzjl3mGmJpDPctIvbkbJPssv3OfJeerx/iMjC7A/h+MeMoGTNFr3x5NUIeGQ1lfEDQBsEPwW
 jxEkmIn/gT8InojEolnbTRNHAoc0=
X-Google-Smtp-Source: AGHT+IE8Fp7AEG8Xv/sqho125kkMBhYA1oEp8uDuh9BRLzOcKiQp/VsikDjp2CnbNrMlOJfqPf8dFexudbpXt2Vnnik=
X-Received: by 2002:a17:90a:88d:b0:29d:e70f:7240 with SMTP id
 v13-20020a17090a088d00b0029de70f7240mr14350249pjc.11.1710958151026; Wed, 20
 Mar 2024 11:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <39ad88fa-449a-4aa9-ac6a-902d8d531984@notapiano>
 <20240320-sticky-shiny-mussel-5da3cf@houat>
 <613c60d8-2652-451d-91f3-bde84219bf48@notapiano>
In-Reply-To: <613c60d8-2652-451d-91f3-bde84219bf48@notapiano>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 21 Mar 2024 02:08:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v65Te6hsPvB7nQjGTAm0x9nurq7Kcdpjtb-MvQ-a1hxqYQ@mail.gmail.com>
Message-ID: <CAGb2v65Te6hsPvB7nQjGTAm0x9nurq7Kcdpjtb-MvQ-a1hxqYQ@mail.gmail.com>
Subject: Re: Missing commits from drm-misc-next on linux-next
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
 kernel@collabora.com
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 21, 2024 at 1:59=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Wed, Mar 20, 2024 at 04:19:51PM +0100, Maxime Ripard wrote:
> > Hi,
> >
> > On Wed, Mar 20, 2024 at 11:07:34AM -0400, N=C3=ADcolas F. R. A. Prado w=
rote:
> > > I noticed that there are some commits from drm-misc-next [1] that hav=
en't been
> > > added to the for-linux-next [2] branch, and consequently haven't made=
 their way
> > > into linux-next.
> > >
> > > Namely, commit bf0390e2c95b ("drm/panel: add samsung s6e3fa7 panel dr=
iver") and
> > > commit 2689b33b8864 ("dt-bindings: display: panel-simple-dsi: add s6e=
3fa7
> > > ams559nk06 compat") which have been applied almost a month ago [3].
> > >
> > > I noticed because running 'make dtbs_check' on today's next is showin=
g new
> > > warnings, but with these commits applied there shouldn't be any warni=
ng.
> > >
> > > Could you please take a look? I'm guessing a merge was forgotten some=
where along
> > > the line on the for-linux-next branch.
> >
> > Those commits are in drm-misc-next which is now targetting the 6.10
> > merge window. In order not to disrupt the oncoming 6.9 release though,
> > drm-misc-next is removed from the for-next branch, it will be
> > reintroduced after 6.9-rc1.
> >
> > Maxime
>
> I see. I didn't realize that's how drm-misc-next worked.
>
> Interestingly enough, the reason why this happened is because the for-nex=
t
> branch on the qcom tree [1] also includes changes that are queued for 6.1=
0. So
> it seems that every subsystem has a different view of whether linux-next =
should
> include only changes for the next (or current) merge window (6.9 in this =
case),
> or if it should also include changes for the following merge window (6.10=
 in
> this case). The end result is that in the time period leading to, and dur=
ing,
> the merge window, linux-next might be in an inconsistent state - it's nei=
ther a
> snapshot for this release's rc1, nor a snapshot for the rc1 of the follow=
ing
> release. This seems to me to partially defeat the purpose of linux-next, =
so I
> wonder if it's just a matter of better documenting the expectations for
> linux-next.

AFAIK 6.10 material should not be included in -next until after the merge
window has closed. If they are including it then they are doing it wrong.

ChenYu

> Anyway, at least for now I'll keep in mind that linux-next can be inconsi=
stent
> when looking through future results.
>
> Thank you both for the insight.
>
> Thanks,
> N=C3=ADcolas
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=
=3Dfor-next
