Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B48881823
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 20:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D3310FF25;
	Wed, 20 Mar 2024 19:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="4DfYpmxT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A7410FF25
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 19:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710964207;
 bh=xcFHxhN8Oae0n0FGmnwYLDwR9iw/gIqIjV3s2djWmk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=4DfYpmxT/0K2fGyEB77eudotA10IBp+oPjOTw1qbS32dZEOl7s9sDhJHB5/9DbdYa
 MfoNlhrNa+cYxUAkDrrga/kaw7kLtxaZRQs5Chr3+CeTYfzQWmFzkE/gPg8g4Q+5m2
 VRcTdtpu3hYOFCBhSOU5nWAOmpbAmQfXEraIqplw527OND+VxsKINNUww1OGvTKukT
 l+iWHHvey6iV+zhJOcvVrWNuU8OoEo6ZOQ94oymlh7N+5Db6IDSNksMyqiMYWaVI2H
 GowCsQPqzmt6/HU/yANMxRpaSIldd+6gLz9uE2iJOJ5sONVyGTFF30rg+HfHLTXIxS
 xZokiNesYj/Lw==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 38125378148F;
 Wed, 20 Mar 2024 19:50:06 +0000 (UTC)
Date: Wed, 20 Mar 2024 15:50:04 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wens@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-arm-msm@vger.kernel.org
Subject: Re: Missing commits from drm-misc-next on linux-next
Message-ID: <a5691f16-5283-47b7-ba50-3b9dcbee283c@notapiano>
References: <39ad88fa-449a-4aa9-ac6a-902d8d531984@notapiano>
 <20240320-sticky-shiny-mussel-5da3cf@houat>
 <613c60d8-2652-451d-91f3-bde84219bf48@notapiano>
 <CAGb2v65Te6hsPvB7nQjGTAm0x9nurq7Kcdpjtb-MvQ-a1hxqYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v65Te6hsPvB7nQjGTAm0x9nurq7Kcdpjtb-MvQ-a1hxqYQ@mail.gmail.com>
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

On Thu, Mar 21, 2024 at 02:08:59AM +0800, Chen-Yu Tsai wrote:
> On Thu, Mar 21, 2024 at 1:59 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > On Wed, Mar 20, 2024 at 04:19:51PM +0100, Maxime Ripard wrote:
> > > Hi,
> > >
> > > On Wed, Mar 20, 2024 at 11:07:34AM -0400, Nícolas F. R. A. Prado wrote:
> > > > I noticed that there are some commits from drm-misc-next [1] that haven't been
> > > > added to the for-linux-next [2] branch, and consequently haven't made their way
> > > > into linux-next.
> > > >
> > > > Namely, commit bf0390e2c95b ("drm/panel: add samsung s6e3fa7 panel driver") and
> > > > commit 2689b33b8864 ("dt-bindings: display: panel-simple-dsi: add s6e3fa7
> > > > ams559nk06 compat") which have been applied almost a month ago [3].
> > > >
> > > > I noticed because running 'make dtbs_check' on today's next is showing new
> > > > warnings, but with these commits applied there shouldn't be any warning.
> > > >
> > > > Could you please take a look? I'm guessing a merge was forgotten somewhere along
> > > > the line on the for-linux-next branch.
> > >
> > > Those commits are in drm-misc-next which is now targetting the 6.10
> > > merge window. In order not to disrupt the oncoming 6.9 release though,
> > > drm-misc-next is removed from the for-next branch, it will be
> > > reintroduced after 6.9-rc1.
> > >
> > > Maxime
> >
> > I see. I didn't realize that's how drm-misc-next worked.
> >
> > Interestingly enough, the reason why this happened is because the for-next
> > branch on the qcom tree [1] also includes changes that are queued for 6.10. So
> > it seems that every subsystem has a different view of whether linux-next should
> > include only changes for the next (or current) merge window (6.9 in this case),
> > or if it should also include changes for the following merge window (6.10 in
> > this case). The end result is that in the time period leading to, and during,
> > the merge window, linux-next might be in an inconsistent state - it's neither a
> > snapshot for this release's rc1, nor a snapshot for the rc1 of the following
> > release. This seems to me to partially defeat the purpose of linux-next, so I
> > wonder if it's just a matter of better documenting the expectations for
> > linux-next.
> 
> AFAIK 6.10 material should not be included in -next until after the merge
> window has closed. If they are including it then they are doing it wrong.

+CC QCOM folks

Indeed I was just pointed out by a colleague to this message from Stephen
clearly stating linux-next should only contain commits for v6.9. [1]

QCOM folks: FYI there are commits scheduled for 6.10 in your for-next branch,
which is not supposed to happen according to Stephen.

Thanks,
Nícolas

[1] https://lore.kernel.org/linux-next/20240319164505.485b3801@canb.auug.org.au/

> 
> ChenYu
> 
> > Anyway, at least for now I'll keep in mind that linux-next can be inconsistent
> > when looking through future results.
> >
> > Thank you both for the insight.
> >
> > Thanks,
> > Nícolas
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=for-next
