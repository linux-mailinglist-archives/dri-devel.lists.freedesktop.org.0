Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7CA34AA91
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E5D6F41C;
	Fri, 26 Mar 2021 14:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA1C6F41C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:54:43 +0000 (UTC)
Date: Fri, 26 Mar 2021 14:54:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1616770480;
 bh=nd47v5BzeRIUWkkPdAxVejmLEjjaNAlynsgoOb3JoC4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=kq90Au1ceaEFp64FSdolL7yI8gmuxPcK4Ssec6F3aZkdPaVM7GnystrN9bL+ugoKh
 BwYkm++Zok3hU3Sndip8LWpEPRt/QfkX1lAR2udMbfh6magHdc2Xpv9D7gzSwOoyNf
 zW8fTLQmWMpg02i3Vz2XJxUQ6KKYETpvK6l8pMZjQFbdSf641qcq4ujmJapk7hCMgA
 IgRqfe30PSQNCyBZNAJCyHvIc/o7+JJjrVg4kOlOGhbS3Yd9uJCDuFOadPtixv/NIE
 dDryZPtk6HeSxoUsJQJs7yjAhWfJ4RjmZD9ZOwNNSSPyxm3+RqNbLSXmjveaUMxtA0
 oCbpM9kwgp/oQ==
To: Thierry Reding <thierry.reding@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 01/10] drm/fourcc: Add macros to determine the modifier
 vendor
Message-ID: <P6bikxumymMi9GOcPaj_n8vMt5caPR3rWO4Kga8Ud_FNIgytl3ljvnkU6nsyxIwN4VKNmfOfsC4KryzFTObEXjtFDiywRWDtO_ed71g9aj0=@emersion.fr>
In-Reply-To: <20210326145139.467072-2-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
 <20210326145139.467072-2-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LGTM, thanks!

Reviewed-by: Simon Ser <contact@emersion.fr>

Let me know if you need me to push this to drm-misc-next.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
