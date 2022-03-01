Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59034C8C37
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 14:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74F010EC63;
	Tue,  1 Mar 2022 13:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141B910EC63
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 13:03:40 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id r13so31352799ejd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 05:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=54IDvufnRzrBfjaYnEXmgrUgjbov9TaKLRgPhl0wbI4=;
 b=grH5RaAMgUAuzaEWZV+C3Lpkaew/wWpLX1709iyO5dfVCn62Tccc+o/WP8O25+YgP1
 gh+Til9TZE2yyxeghRZ4m59caMPQj4Af1LWw36Lr6HMGY3/0H5hN8K3U2/uaqqqbp1fm
 SpuBjalvJAZuaJYSktOf6hvKe8bnqcpIAZ66Y/meHFE9Rttl8Xjc1TuAa+S/xKT1CF//
 JTDHa3hz3UYYuR06UhAf5IAb6ldKjmCV7n9XDunmzMPf0/SBnwQi+R/2iV20rbJhTs57
 nD1aHNTr0SYmWKYVfJ1tSnUN4wAuvLc2sIQuPK8uo4sn16h7tlCXDUumdONeVQGI7QdL
 s/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=54IDvufnRzrBfjaYnEXmgrUgjbov9TaKLRgPhl0wbI4=;
 b=iHsjJHRCbv9VYO7H6O8MWNj9LksAUFDWdzYVxJOO3M6dHyYWUrjg9YxtWIHTm8ZdUE
 CJ1JJBIMuKs9b0FGK1ogPUbGItTXrjGkeIlul5BEBpuRqT0f9xJgmMrADFCLGKYDVJmB
 NHwfnT4lHN6j4dQcTiKnI84mKOUoc1TncNK1iA3Z71tnRYSnWPSVce7wC3r9wNoDqbE4
 wf3ITM+EeU6PU6VHW6wpERmgg8HN1Jn15ZEOzhr0KVqG22J7SFaZguICSehWIoTn3jKe
 DarlQqqgcvwcKxHAEKTGLaJysVdpuMJ1UfeTG2SSBK2SsZ1asV9bnrY1r9nGUHPgwNtv
 hANA==
X-Gm-Message-State: AOAM530e/tkdWQ7UhzS9d3ye9tcf5f2FxQPYUsKGtO3DzankcqCMWKm5
 TiPyAck0NUap8Maj7+itmX8mPZzhq4UHjsweTYY=
X-Google-Smtp-Source: ABdhPJw0lEjtN3KvaKBtSodtm+IRjb8lAvIfaB2qQ9CSc7Z6xiPafAjJifuYh4hdsgizjTAKCACQL43ptW2+5DJIPfI=
X-Received: by 2002:a17:907:1c8b:b0:6d7:129f:f543 with SMTP id
 nb11-20020a1709071c8b00b006d7129ff543mr599207ejc.198.1646139818246; Tue, 01
 Mar 2022 05:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20220228004605.367040-1-marex@denx.de>
 <35b981d0d9d763525c427491ca0e25b6e4c03d0f.camel@oss.nxp.com>
 <8eac8a2c-bc6d-0c79-c727-bdaa2cd9abee@denx.de>
 <a3ab4ec2dd0c7b87698bc7902509a4de6950dd25.camel@oss.nxp.com>
 <33207e88-da9b-96d7-0fef-461cb4496c88@denx.de>
 <284d65f53dffb6085bde6ef6ecd398f10d4c6c80.camel@oss.nxp.com>
 <8950434843ff7bbd1a527b0c799d9a74a75ee36d.camel@pengutronix.de>
 <7aeed693-dfb7-950f-fdf0-3c90de285392@denx.de>
 <8bf0b5a1c9ab9faee28077436cdfd49c0cd08792.camel@pengutronix.de>
In-Reply-To: <8bf0b5a1c9ab9faee28077436cdfd49c0cd08792.camel@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 1 Mar 2022 07:03:26 -0600
Message-ID: <CAHCN7xJ6ypDxZouZV1b1F1EgQFwdTvmY6EEekj+_z-UWbQMD5Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for i.MX8MP
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Marek Vasut <marex@denx.de>, devicetree <devicetree@vger.kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Liu Ying <victor.liu@oss.nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 1, 2022 at 5:05 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Am Dienstag, dem 01.03.2022 um 11:19 +0100 schrieb Marek Vasut:
> > On 3/1/22 11:04, Lucas Stach wrote:
> >
> > Hi,
> >
> > [...]
> >
> > > > Given the two totally different IPs, I don't see bugs of IP control
> > > > logics should be fixed for both drivers. Naturally, the two would
> > > > diverge due to different HWs. Looking at Patch 9/9, it basically
> > > > squashes code to control LCDIFv3 into the mxsfb drm driver with
> > > > 'if/else' checks(barely no common control code), which is hard to
> > > > maintain and not able to achieve good scalability for both 'LCDIFv3'
> > > > and 'LCDIF'.
> > >
> > > I tend to agree with Liu here. Writing a DRM driver isn't that much
> > > boilerplate anymore with all the helpers we have available in the
> > > framework today.
> >
> > I did write a separate driver for this IP before I spent time merging
> > them into single driver, that's when I realized a single driver is much
> > better and discarded the separate driver idea.
> >
> > > The IP is so different from the currently supported LCDIF controllers
> > > that I think trying to support this one in the existing driver actually
> > > increases the chances to break something when modifying the driver in
> > > the future. Not everyone is able to test all LCDIF versions. My vote is
> > > on having a separate driver for the i.MX8MP LCDIF.
> >
> > If you look at both controllers, it is clear it is still the LCDIF
> > behind, even the CSC that is bolted on would suggest that.
>
> Yes, but from a driver PoV what you care about is not really the
> hardware blocks used to implement something, but the programming model,
> i.e. the register interface exposed to software.
>
> >
> > I am also not happy when I look at the amount of duplication a separate
> > driver would create, it will be some 50% of the code that would be just
> > duplicated.
> >
> Yea, the duplicated code is still significant, as the HW itself is so
> simple. However, if you find yourself in the situation where basically
> every actual register access in the driver ends up being in a "if (some
> HW rev) ... " clause, i still think it would be better to have a
> separate driver, as the programming interface is just different.

I tend to agree with Marek on this one.  We have an instance where the
blk-ctrl and the GPC driver between 8m, mini, nano, plus are close,
but different enough where each SoC has it's own set of tables and
some checks.   Lucas created the framework, and others adapted it for
various SoC's.  If there really is nearly 50% common code for the
LCDIF, why not either leave the driver as one or split the common code
into its own driver like lcdif-common and then have smaller drivers
that handle their specific variations.

adam
>
> Regards,
> Lucas
>
>
