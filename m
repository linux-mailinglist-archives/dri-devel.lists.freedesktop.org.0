Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A7E1EBC2C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 14:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DCF6E057;
	Tue,  2 Jun 2020 12:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E976E057
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 12:56:59 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id 59so1192638uam.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 05:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BpsIlBQ5nejFohRETbNb9q04gA6fq5BCcsSBn6KKApI=;
 b=JetxGkcmZWwBcj73qk5GvrPQ52LZYWBhk1chHXBbYxrojwIOYCdLU6/e4biJGuow5b
 tVoDhU2dirPxe0+SQa6spJ5Di7Jjk0/Bkgco+Tpe0Z3oAFDHwh0KzP7w92q5qj/3/x3Q
 9L8vVzBOe32M8mc6kbcNKPmzg0fzMn/paYJ/jnoHguC1SPWDNX9zXsXanb+WqbRV+249
 QMj5r88MFMgwB/mim2CvQ6KmhxANKMbwldClAaVj/3SBwiVC5ZmtFzpv9tadk+xPBodH
 xg5ImqIr4I7KAgHbdnae1fbbQpdjwEwen0yl9P7/GvxCOo+2LHlSYtreF+iVF4LI/u8f
 8AVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BpsIlBQ5nejFohRETbNb9q04gA6fq5BCcsSBn6KKApI=;
 b=ZscSVay9zReW46pXQJcBSs4zCZYNFSLQFufeiYME+MbrMBeZT9M0DkdsZnTISv5X4U
 ZWI5FDaK69wzeq5hn7pOK0Hjy0wIg0NEYHE6+eL/fHolius04wE/laUDEv2BogyHhnlh
 ppk4b+xIQ8Pnof3X716geOBwDBkGo/+4kmF5fJY9qZvhoB3GDEYVT/eFKXLsm8L7bFt1
 ZP0KUUpMcxNmTM/YcmfqpLRr5XOc7uf+M+ValuYcJrv0MHcoJWwFOd9irpeEl7K5+ktt
 YAxwQTFl1fAQ3ck4rSU3pSAZbzlZEN2Hgn1JTV7ehwwbHNPgapPjidguL/MF3phHmsOg
 l9Mw==
X-Gm-Message-State: AOAM5339fxt0cXRjxarcmdaaZJ7ijxRfe49FSFS1zAueA1UCtZgE95ol
 Tp3Qo3Xso/CSq8hsCaTnml/MXcMi4P/cqv0Afhw=
X-Google-Smtp-Source: ABdhPJy94b4dAChxDuW4wDOKIg2tO2nMimj827DSzBUBaeBS4xq/NcIVF/RbxLJKqEmvBcwkcK/jKU0XrmmGsie+2ZA=
X-Received: by 2002:a9f:22e1:: with SMTP id 88mr13225614uan.19.1591102618237; 
 Tue, 02 Jun 2020 05:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200427081952.3536741-1-adrian.ratiu@collabora.com>
 <20200427081952.3536741-9-adrian.ratiu@collabora.com>
 <4acc09e8-0610-01f6-b18d-3ffc390c45a3@st.com>
 <87blm387vt.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
In-Reply-To: <87blm387vt.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Jun 2020 13:53:40 +0100
Message-ID: <CACvgo51QyzEa8LFpGq5zjYV-0TifQRtNh4WhMYy8jNtaswxd7Q@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH v8 08/10] drm: stm: dw-mipi-dsi: let the
 bridge handle the HW version check
To: Adrian Ratiu <adrian.ratiu@collabora.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Adrian Pop <pop.adrian61@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Philippe CORNU <philippe.cornu@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adrian,

On Mon, 1 Jun 2020 at 10:14, Adrian Ratiu <adrian.ratiu@collabora.com> wrote:
>
> On Fri, 29 May 2020, Philippe CORNU <philippe.cornu@st.com> wrote:
> > Hi Adrian, and thank you very much for the patchset.  Thank you
> > also for having tested it on STM32F769 and STM32MP1.  Sorry for
> > the late response, Yannick and I will review it as soon as
> > possible and we will keep you posted.  Note: Do not hesitate to
> > put us in copy for the next version  (philippe.cornu@st.com,
> > yannick.fertre@st.com) Regards, Philippe :-)
>
> Hi Philippe,
>
> Thank you very much for your previous and future STM testing,
> really appreciate it! I've CC'd Yannick until now but I'll also CC
> you sure :)
>
> It's been over a month since I posted v8 and I was just gearing up
> to address all feedback, rebase & retest to prepare v9 but I'll
> wait a little longer, no problem, it's no rush.
>
Small idea, pardon for joining so late:

Might be a good idea to add inline comment, why the clocks are disabled so late.
Effectively a 2 line version of the commit summary.

Feel free to make that a separate/follow-up patch.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
