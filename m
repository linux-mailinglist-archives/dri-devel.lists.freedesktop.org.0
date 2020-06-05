Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CEC1EFA03
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 16:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF4B6E903;
	Fri,  5 Jun 2020 14:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E8D6E903
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 14:10:24 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id y123so5676640vsb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jun 2020 07:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e+E/xW7vVK4IIcDSZzSgi1sFOkgm2ohHEOAsxFv3RWM=;
 b=f66UyConOqd1vPGZCJ4Fqa7JMZTxodRIxj5X2iINgZAPDJMSyTZTh9Ng7jTG6n7i9p
 /OUMeb5vCVZK8WzZCWcO+ZkscSXa7+NCGAy2LPCr8asCx54pK0ysZEwA5t1uLlPBvAnx
 e5Qv0ZgkPe0XReK9crBTZQjsGsnttVwaAFDIh/dBHXy5BXyqR06sRk+q99on4H3RfV4S
 f8cwqTtI4q60Qv06mXD5z+Bs4hd951V2vOh3eK1Kr/GpIR7DQJNo7m2tplbpx41xSKqh
 fkh98EW12NLklCiFO/RHzOrBvCKIN8NZtlprPtlxsnmB1T8QAg2eGFeeyqosFLTkii4g
 0kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e+E/xW7vVK4IIcDSZzSgi1sFOkgm2ohHEOAsxFv3RWM=;
 b=o23qQdFqaZAovxCXiuncmryFceRNTrtXHdRHCvyXbP5XbZ4LbfvYamLLlQhje/R8I1
 G0eIZCUieJxjC2uF/m5W2YwCWQr8FDxxdOuaMlON7vJqwn1IKD5WvxE6W6cmXHs5cHGi
 GJ0a1PWSuKkaxdEn+q0Xs7nxnJcyUsiUQRCfLGbkfbxoV0vwff6rlCTUmoT58pVx0FTa
 sXMovasZZXxJpHzGECSPsYiFw4FujxVVgqUFS27MBI5E8qtEVfoypFtx/bqZBKTxOeVR
 d2EmawSSzrykWckPLjeoCy86sYyyNVSs5Ez7Q/J2v6eiYYtnVHNJg68JpeFtfTJXsOU+
 mchA==
X-Gm-Message-State: AOAM532d9hxq0G4j0M06jVlDFnarZz3wIBmrNDkPkPNYlQWPgEDLaL3U
 nnSJVtYH1GmdN2IOO2v3QMXNv9VH63Z+kkO6bKY=
X-Google-Smtp-Source: ABdhPJyozrVoRJRgzjGazL/XxlYiJfLleK9SsAkDir9gUBMp43/58usHWr8qr1HwaKgtsQLqu3NtT5E/wo5wuR9pHAs=
X-Received: by 2002:a05:6102:22ec:: with SMTP id
 b12mr7364242vsh.138.1591366223986; 
 Fri, 05 Jun 2020 07:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
 <20200530031015.15492-23-laurent.pinchart@ideasonboard.com>
 <CACvgo50XZaOmH5RFtr-toZGrWcK72tcsQSE8aqcW+wuthECdcQ@mail.gmail.com>
 <20200602224248.GN6547@pendragon.ideasonboard.com>
In-Reply-To: <20200602224248.GN6547@pendragon.ideasonboard.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 5 Jun 2020 15:07:01 +0100
Message-ID: <CACvgo51FD2ivBayxvJ=-O7zyxj1DhuWcX-W8eG7fpwKwRPM7Hg@mail.gmail.com>
Subject: Re: [PATCH v2 22/22] drm: mxsfb: Support the alpha plane
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, ML dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>, leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2 Jun 2020 at 23:43, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Emil,
>
> On Sun, May 31, 2020 at 05:54:04PM +0100, Emil Velikov wrote:
> > HI Laurent,
> >
> > From a quick glance the series looks really good and neat.
>
> Thank you :-)
>
> > Then again, I don't know much about the hardware to provide meaningful
> > review.
> >
> > A couple of small ideas below.
> >
> > On Sat, 30 May 2020 at 04:11, Laurent Pinchart wrote:
> >
> > > +#define LCDC_AS_BUF                    0x220
> > > +#define LCDC_AS_NEXT_BUF               0x230
> >
> > s/LCDC_AS_BUF/LCDC_AS_CUR_BUF/ - to stay consistent with the primary
> > plane name scheme.
>
> The register names come directly from the datasheet (and yes, the
> datasheet uses CUR_BUF and NEXT_BUF for the primary plane, and BUF and
> NEXT_BUF for the overlay plane :-S). I'd thus rather keep them aligned
> with the documentation.
>
> > Would it make sense to store the above registers in mxsfb_devdata,
> > just like we do for the primary planes?
>
> The reason the register addresses are stored in mxsfb_devdata for the
> primary plane is because they differ between hardware revisions (don't
> they teach hardware engineers in school these days *not* to move
> registers around ? :-)). The overlay plane is only supported in the
> latest versions of the IP core, and are always located at the same
> address as far as I can tell. I don't think we need an extra level of
> indirection.
>
Right, makes sense. Thanks for the information.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
