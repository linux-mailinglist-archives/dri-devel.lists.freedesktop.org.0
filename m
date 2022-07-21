Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48E857C599
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 09:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B3611A0D2;
	Thu, 21 Jul 2022 07:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4837411A44C;
 Thu, 21 Jul 2022 07:57:00 +0000 (UTC)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
 (envelope-from <dri-devel-bounces@lists.sourceforge.net>)
 id 1oER3H-0005Ov-JQ; Thu, 21 Jul 2022 07:56:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <airlied@gmail.com>) id 1oEN69-0008MD-CA
 for dri-devel@lists.sourceforge.net; Thu, 21 Jul 2022 03:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6npaS1zRKm+yyU2zCsQvl5XLwT7kKQ+yzE8xge/iXYI=; b=TczIvv2EL+3U3Ap9TuEHMrWyEu
 uKxh+5oaMLtqSJwDlVAGD89sdCd39Un1nJCD/noYdztlz1e4dPomuxCJ5NxAC82Blb7YYzWNzigrD
 NcIHp+BBC5/RgUrPjYXYiu5RHG45CbfZBFqszSdJyaA1W2NO9TejpiJs7XgxUFNfGIro=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6npaS1zRKm+yyU2zCsQvl5XLwT7kKQ+yzE8xge/iXYI=; b=GCOZ4suyMREkjHWv7Q/K7mkQol
 s4IRgzx00k2p6QdLeZ2D3x6B722idMq1OizAJaRSolbWovlIAg0j+MjkuMfzF2Y3fH1FBllVeH8Hj
 MlfGrL3vLD9e6kpdbOtdsQFRskRonquf44n1A/q527vmR/M5jDQgFexwJ/IYVES1Bc7g=;
Received: from mail-ed1-f43.google.com ([209.85.208.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oEN68-005d4u-Gr
 for dri-devel@lists.sourceforge.net; Thu, 21 Jul 2022 03:43:37 +0000
Received: by mail-ed1-f43.google.com with SMTP id y4so650963edc.4
 for <dri-devel@lists.sf.net>; Wed, 20 Jul 2022 20:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=6npaS1zRKm+yyU2zCsQvl5XLwT7kKQ+yzE8xge/iXYI=;
 b=p1MOI/PwyKmAKZLRGUU7wHJ3gwmCfOuMSd9qe8/di7NRgYoQPVattGIm2LLA/5ZRzt
 UmkU5j7zN1FHuEPODuf5718XISFVfuLHo7rlPOyFt0V58zPmMwJD1kG7cNARq4n1qG1/
 xWPDaDD+f5JXnDkwiGvO7GhQVNM9VnDE/QT9Wer6VhUl3z6bBcM9aN93BWHJJX/y/Q3I
 HBozrneJP0gbcCgI0IKl+MyC0FQKZzDHKL02n/9I3eqSk38jOFbMYJk3ShWxQIAokptk
 0ew9hHw8UUP63i9jplHud3h+FVPCkA0FQyUiO55QiCkqmVKmB+mDy86it0JvXhH0iuM9
 +ncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=6npaS1zRKm+yyU2zCsQvl5XLwT7kKQ+yzE8xge/iXYI=;
 b=HMOv2SJkvA9mLB+AdodOm1UaGpTqZd/TNB5iSsnyhhV2Xzmn74lT1XzT6MbPvvUJZt
 JWmnq7C68jl3WxEOgvgkEGzlAPSxGPQGsLNCfYipyvE7D/DDcbWVR9huM8I2d6lN4Fpd
 nibbChIfpFenhnm8bnv0t8C2N/96KT7CuX86ZUdCV/5a4a5MNv69LoOc13w7EUdmE3jL
 XndMfvFmWr+/kvJyhC8hMCCPNcO162AddNlQJrYXCoFq6rG0WJV8RdEtyYJdlge87ep6
 tNT/SpQYk6FLn2XZF7JiFaJ//Gwt/8VBZMTQ6OnzT8eN2JEG7V0Gg4eaib1456sYUBCk
 3RyQ==
X-Gm-Message-State: AJIora/Wv5q0k8o+G1EDG2fwV3cDB0d9u9Rz1b1ezZ2H30hXpUIYdgow
 ooZNjFZFX0hYqae6Nx1D+pR9z5UbiVVqzxAjz1A=
X-Google-Smtp-Source: AGRyM1uOI+8BZmBho8NWh0C+///IOSzyEsQPkRoYp57fJlWZ+qY2k+4HwdfPpAVjNR2BGQDSHLue/6IDKdxW5yyntWw=
X-Received: by 2002:a05:6402:3326:b0:43a:902b:d335 with SMTP id
 e38-20020a056402332600b0043a902bd335mr55228432eda.412.1658375009916; Wed, 20
 Jul 2022 20:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220719065357.2705918-1-airlied@gmail.com>
 <20220719094835.52197852@sal.lan>
In-Reply-To: <20220719094835.52197852@sal.lan>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 21 Jul 2022 13:43:18 +1000
Message-ID: <CAPM=9tzoB_dJXgb9M7y9cJ24Z4vBmy7NRePxJARdYRLag2Vx9g@mail.gmail.com>
Subject: Re: [PATCH] docs: driver-api: firmware: add driver firmware
 guidelines. (v2)
To: Mauro Carvalho Chehab <mchehab@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > It is hard to enforce how vendors will version their
 firmware.
 On media, > we have some drivers whose major means different hardware versions.
 For > instance, on xc3028, v3.x means low voltage chips [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.43 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [airlied[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.43 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1oEN68-005d4u-Gr
X-Mailman-Approved-At: Thu, 21 Jul 2022 07:56:54 +0000
X-BeenThere: dri-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Wireless List <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 "Luis R. Rodriguez" <mcgrof@kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 "dri-devel@lists.sf.net" <dri-devel@lists.sf.net>,
 Dave Airlie <airlied@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> It is hard to enforce how vendors will version their firmware. On media,
> we have some drivers whose major means different hardware versions. For
> instance, on xc3028, v3.x means low voltage chips, while v2.x means
> "normal" voltage. We end changing the file name on Linux to avoid the risk
> of damaging the hardware, as using v27 firmware on low power chips damage
> them. So, we have:
>
>         drivers/media/tuners/xc2028.h:#define XC2028_DEFAULT_FIRMWARE "xc3028-v27.fw"
>         drivers/media/tuners/xc2028.h:#define XC3028L_DEFAULT_FIRMWARE "xc3028L-v36.fw"
>
> As their main market is not Linux - nor PC - as their main sales are on
> TV sets, and them don't officially support Linux, there's nothing we can
> do to enforce it.
>
> IMO we need a more generic text here to indicate that Linux firmware
> files should be defined in a way that it should be possible to detect
> when there are incompatibilities with past versions.
> So, I would say, instead:
>
>         Firmware files shall be designed in a way that it allows
>         checking for firmware ABI version changes. It is recommended
>         that firmware files to be versioned with at least major/minor
>         version.

This sounds good, will update with this.

>
> > It
> > +  is suggested that the firmware files in linux-firmware be named with
> > +  some device specific name, and just the major version.
>
> > The
> > +  major/minor/patch versions should be stored in a header in the
> > +  firmware file for the driver to detect any non-ABI fixes/issues.
>
> I would also make this more generic. On media, we ended adding the firmware
> version indicated at the file name. For instance, xc4000 driver checks for
> two firmware files:
>
> drivers/media/tuners/xc4000.c:#define XC4000_DEFAULT_FIRMWARE "dvb-fe-xc4000-1.4.fw"
> drivers/media/tuners/xc4000.c:#define XC4000_DEFAULT_FIRMWARE_NEW "dvb-fe-xc4000-1.4.1.fw"

This is probably fine for products where development never produces
much firmwares, but it quickly becomes unmanageable when you end up
with _NEW_NEW_NEW etc.

I'd rather not encourage this sort of thing unless it is totally
outside our control. So I'd like to keep the guidelines for when we
have some control what we'd recommend.

In this case I'd have recommended you put the 1.4.1 in the header of
the fw, and just have it called dvb-fe-xc4000-1.fw and overwrite the
NEW with the OLD, I understand we likely don't have the control here.

> > +  firmware files in linux-firmware should be overwritten with the newest
> > +  compatible major version.
>
> For me "shall" is mandatory, while "should" is optional.
>
> In this specific case, I'm not so sure if overriding it is the best thing
> to do on all subsystems. I mean, even with the same ABI, older firmware
> usually means that some bugs and/or limitations will be present there.

As long as you can detect the minor/patch versions from the firmware
file after loading it you should be able to do sufficient workarounds.
>
> That's specially true on codecs: even having the same ABI, older versions
> won't support decoding newer protocols. We have one case with some
> digital TV decoders that only support some Cable-TV protocols with
> newer firmware versions. We have also one case were remote controller
> decoding is buggy with older firmwares. On both situations, the ABI
> didn't change.

If the only way to figure that out is by the filename or minor
version, then so be it, but where people have some control I'd rather
provide some harder guidelines.

Dave.


--
_______________________________________________
Dri-devel mailing list
Dri-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/dri-devel
