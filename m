Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E9C135111
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 02:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE776E373;
	Thu,  9 Jan 2020 01:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 65D586E373
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 01:53:45 +0000 (UTC)
X-UUID: c6d133a62cd7438499aa94d8e4cf9430-20200109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TH+HcJiqfSB2BmOUbCTWX/Pd6ZjIbrp6bOMlJpJC85c=; 
 b=DZ0pvIUW90P1LVF0gY3NsHYY1IlTqNcHfKmjG+EqrBugw6vuujnhHjcmzIkwUTNdCpvd2XsEySWf1KbBrV87Cezfxm8MwfDV35xVGgHEaMUCdpLH8lqRZyGRrczAkDY3ElXqKahXvQWVWNj2dqBWsyl6xde0BEJTYSshVybu9qo=;
X-UUID: c6d133a62cd7438499aa94d8e4cf9430-20200109
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 556113510; Thu, 09 Jan 2020 09:53:42 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 9 Jan 2020 09:53:10 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 9 Jan 2020 09:52:06 +0800
Message-ID: <1578534821.23751.2.camel@mtksdaap41>
Subject: Re: Process identical patches in different tree
From: CK Hu <ck.hu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Thu, 9 Jan 2020 09:53:41 +0800
In-Reply-To: <b360ec7f-2cf5-d18f-2ef9-90b044c98f3d@gmail.com>
References: <1578365790.28495.13.camel@mtksdaap41>
 <e7c8313f-13cd-67b7-ad48-9f1d341bfcb6@gmail.com>
 <b360ec7f-2cf5-d18f-2ef9-90b044c98f3d@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Matthias:

On Wed, 2020-01-08 at 13:05 +0100, Matthias Brugger wrote:
> On 08/01/2020 12:14, Matthias Brugger wrote:
> > Hi CK,
> > 
> > On 07/01/2020 03:56, CK Hu wrote:
> >> Hi, Dave, Daniel, Matthias:
> >>
> >> In mediatek-drm-next-5.6 [1], I've cherry-pick 3 patches from
> >> v5.5-next/soc [2] because some drm patches depend on these cmdq patches.
> >> So these cmdq patches exist in both tree now. I want to know how to
> >> process this case. I think we could choose one of below way:
> >>
> >> 1. Because these cmdq patches are identical in both tree, so each tree
> >> could do its own upstream and the there would be nothing happen when
> >> merge.
> >> 2. Let soc upstream first, and mediatek drm rebase on the latest
> >> mainline then upstream.
> >>
> >> Which one do you prefer?
> >>
> > 
> > What we would need is a stable branch with this commits that get merged by both
> > trees. If I understand correctly that otherwise the SHA of the commits would be
> > different and that would provoke merge conflicts.
> > 
> > We should not rely on one tree being merged before the other. AFAIK there is no
> > hard merge order between trees.
> > 
> 
> I prepared a branch with the patches I think are relevant for you. Please
> confirm that this is correct, merge the tree in yours and I'll do the same for
> v5.5-next/soc
> 
> <paste>
> 
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:
> 
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
> tags/v5.5-next-cmdq-stable
> 
> for you to fetch changes up to d412f18c9bc791d8951e903de9a68817e3098a6a:
> 
>   soc: mediatek: cmdq: add cmdq_dev_get_client_reg function (2020-01-08 12:59:57
> +0100)
> 
> ----------------------------------------------------------------
> cmdq patches needed by drm driver to use cmdq interface
> 
> ----------------------------------------------------------------
> Bibby Hsieh (4):
>       soc: mediatek: cmdq: remove OR opertaion from err return
>       soc: mediatek: cmdq: define the instruction struct
>       soc: mediatek: cmdq: add polling function
>       soc: mediatek: cmdq: add cmdq_dev_get_client_reg function
> 
>  drivers/soc/mediatek/mtk-cmdq-helper.c   | 147
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------
>  include/linux/mailbox/mtk-cmdq-mailbox.h |  11 ++++++
>  include/linux/soc/mediatek/mtk-cmdq.h    |  53 +++++++++++++++++++++++++
>  3 files changed, 185 insertions(+), 26 deletions(-)
> 
> </paste>
> 

I've done in [1], is it what you expect?

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.6

Regards,
CK

> Regards,
> Matthias
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
