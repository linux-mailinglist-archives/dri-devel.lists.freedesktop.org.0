Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87441265CDC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206E86E9A4;
	Fri, 11 Sep 2020 09:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8B36E2CF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 07:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1599724444;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=l1WbT/SvoDNXkiR2i/Ms97l7Wmw8ncgIm8q+yWXRhJo=;
 b=S6AG7+laKYIuuOoC14IT/ehfiLrSRYF+qFl7EI2JPzP6Cbh7mRyZu0Q/MgT8xNfkS6
 nKWVOcCUFrB7tEpom1VxQh7b8Ozuip0I3XqQ0pmey6kzAaEcs6wiGE7hKFbjclEeuymg
 cxH50eky64oS3ePp4aMvS9Gm6T23pFPpYD7j6tjiEWL84YvKWCDFUe/jsEBychRoILqy
 Ct9ZQ1E4WX9cD03eKwR3UAI+MERvHsQNOpCwMyOiqAW7sFCwcoGN9tCXcOJ+SrPtA3UM
 U5JePROLXrXE04bkuHAkbmIEiehTYqdlYZrkVCRVSmzAlvikQCsyTC8/MpbsidYya8V/
 K+RQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSfXA0N8oI="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
 with ESMTPSA id n03b0dw8A7rtbeU
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 10 Sep 2020 09:53:55 +0200 (CEST)
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the Ingenic
 JZ4780)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <2093A5E6-28CC-42C6-8CF9-3E78942254F4@goldelico.com>
Date: Thu, 10 Sep 2020 09:53:53 +0200
Message-Id: <DD421AB9-E419-41C1-B23E-B7FC4603C433@goldelico.com>
References: <1940005.XIBaf5lNV5@jeremy> <1857880.I5TKlsx52r@jason>
 <CAAEAJfDU=rvQ4aEAbBrveLigUjoYFGhLZJ7PsE_WpoOYxaDqdg@mail.gmail.com>
 <6531669.OW97vx6Khr@jason> <B8QFFQ.FVZD8SCWAWD51@crapouillou.net>
 <CAAEAJfBQRLKxaR_6HUi-Dvoc+_WC0JPJNGH5C0rz-yxhOwArdw@mail.gmail.com>
 <829D6884-D1F1-4197-B25C-F0DBF2F4AEA7@goldelico.com>
 <CAAEAJfBO5-T9oG_whDu5=MDcthAJpbJ5ER3eJJx1gXMsHu-v7w@mail.gmail.com>
 <2093A5E6-28CC-42C6-8CF9-3E78942254F4@goldelico.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Paul Boddie <paul@boddie.org.uk>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>,
 MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ezequiel,

> Am 27.08.2020 um 09:21 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> 
> Hi Ezequiel,
> 
>> Am 24.08.2020 um 19:38 schrieb Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>:
>> 
>> On Mon, 24 Aug 2020 at 13:05, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>>> 
>>> Hi Ezequiel,
>> 
>> The fix is just re-organizing the code a bit. Just pushed a possible
>> fix for that (following the IPU handling by Paul Cercueil),
>> please feel free to test this:
>> 
>> https://gitlab.collabora.com/linux/0day/-/commits/jz4780-drm-hdmi-module-fix-v5.9-rc2
> 
> Works well (after doing a minor fix to the CI20 defconfig)!
> 
>> 
>> FWIW, my test setup uses mainline vanilla U-Boot v2020.07.
>> The kernel is loaded via TFTP. Debian mipsel is mounted via NFS
>> (which means dm9000 works). I'm testing with weston and modetest.
>> 
>> Note that enabling DRM_INGENIC_IPU will make the driver
>> fail to load, as the IPU is not optional (and not present on ci20.dts).
>> A minor thing to fix.
>> 
>> Cheers,
>> Ezequiel
>> 
>>> And it seems to differ significantly from what Paul has developed recently
>>> to make it work. It seems to be quite lucky that we have a working setup now :)
>>> 
>>>> Nikolaus, Paul: Do you have plans to submit these?
>>> 
>>> Yes, as soon as we are sure that it works (and when it doesn't).
>>> 
>>> But thanks to your work it is now much easier to improve things, since we
>>> are no longer looking for a break-through but just have to avoid regressions.
>>> 
>>>> If not, I'll be happy to get them out the door for review.
>>> 
>>> Let it mature a little first and have it tested on more setups and rebased
>>> to mainline v5.9-rc2 :)
> 
> 
>> Am 24.08.2020 um 23:11 schrieb Paul Cercueil <paul@crapouillou.net>:
>> 
>> DRM drivers follow their own schedule, you should rebase to drm-misc-next instead.
>> 
> 
> With the comment from Paul, I think it is best if you push them for review.
> 
> My patch set based on v5.9-rc2 is here (including one EFUSE patch which I have
> included only for making my Ethernet interface work for testing):
> 
> https://git.goldelico.com/?p=letux-kernel.git;a=shortlog;h=refs/heads/letux/jz4780-hdmi-v5
> 
> Please take it, do the required squashes and rebasing and post them for discussion to the
> appropriate lists.

I hope you are well. Do you plan to do the squash and rebase and posts?

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
