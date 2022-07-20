Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8417557BDC0
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 20:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF65E8D2F5;
	Wed, 20 Jul 2022 18:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051FE8D165
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 18:29:24 +0000 (UTC)
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net
 [98.113.53.228])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 872ED6601593;
 Wed, 20 Jul 2022 19:29:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658341762;
 bh=BYHmwKYdmqtFLYQZFIsOLfxw+gBeqzenF2nInIVq+g8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CTPPUy6HwrcrLfXcBNjPBt4UbkwcAVUa/ebZxwNwl4nYblGG09PHlqacLe6Pg/+5X
 YOohRvbDnR8n24hHA3EXYWv0BDpG7tWicUGxg0WrEdqVf57atoeZX8oZ9rEoDWvTHh
 mez0VaMvhSB2Jg0I1gZ6Kbzt/52mYnzYjSPty0LDt7JWMKhnAT+t50BMHN6zDrx0qF
 8pVhDneQDy2WSUvgY49dy5Qge+f8yKQ8KA0NnlQChDIe/9zn3+QI6kT0Umkgqgcm4N
 SzjemjK6LaJd91nqeTwjRvC1qGzSVAaROWYa8DQmWAweYZ9JpJm6HL0g0yWTzdky8c
 7o7fjUwYc7gdQ==
Date: Wed, 20 Jul 2022 14:29:16 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/3] drm/panel-edp: Add panel entry for B120XAN01.0
Message-ID: <20220720182916.drlz5pwcyyi4weav@notapiano>
References: <20220719203857.1488831-1-nfraprado@collabora.com>
 <20220719203857.1488831-3-nfraprado@collabora.com>
 <CAD=FV=URVf6kDm9A8OsFqmy7tdsNsoDTBvfUy8aT=kfzofyDtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=URVf6kDm9A8OsFqmy7tdsNsoDTBvfUy8aT=kfzofyDtA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 19, 2022 at 03:41:43PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Jul 19, 2022 at 1:39 PM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > Add panel identification entry for the AUO B120XAN01.0 (product ID:
> > 0x1062) panel.
> >
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >
> >  drivers/gpu/drm/panel/panel-edp.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> > index 675d793d925e..152e00eb846f 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1879,6 +1879,7 @@ static const struct edp_panel_entry edp_panels[] = {
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x1062, &delay_200_500_e50, "B120XAN01.0"),
> 
>  * Sort first by vendor, then by product ID.
> 
> 0x1062 sorts at the top of the AUO panels, not at the bottom.

Right. Will fix on v2.

Thanks,
Nícolas
