Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3847F68D1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 23:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938D310E35A;
	Thu, 23 Nov 2023 22:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D84910E35A;
 Thu, 23 Nov 2023 22:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1700777494; x=1701036694;
 bh=1FSAtIYmUftMaxOldMoteCptRTxIkeeuJnWLHgIXrlA=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=cKWk6SyY7AK0lUuCp5Xn1fwoCcUc2EdFsBbzXNqYMgHpOlmoEFhqIx7LNPXCVydfZ
 hp8uUX5zJnqE9v/ix0YVj0RqzUUCHMvjOCeH2Xwd2xHH0McUo9+3qYY54YBj84GacZ
 pWI5jsjKxxLgTTePqS7y3u9F9k8ieFvYSl6Q6iK44gNmnWkWXB9Sy3Crf/06IaxflB
 N+kSQL2L8hcB8CWR5XWZrqB6Bu0trOXoYPLKmAlRKP1X1oQuAlUPc6Uvripwnl25Fb
 MZGqoGbgOMKE23vmgO0yvUp/CeMO2Lo1MNJHA1ZzK19jncMnk7Wwh95LC069Y4Wno8
 XFTP4BYoDTbUg==
Date: Thu, 23 Nov 2023 22:11:14 +0000
To: Javier Martinez Canillas <javierm@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 0/9] Fix cursor planes with virtualized drivers
Message-ID: <xUgaKXv4lqgCEWWlB4KRGx-yLXefTg-uXEdXaTqAhOTxC4G7bCILTK9SH6ymdmMMBLooAl3_Kdvl5JXeUA8Hofg9PcCMBhPWhVhnCoxvgqA=@emersion.fr>
In-Reply-To: <87y1eqc5qk.fsf@minerva.mail-host-address-is-not-set>
References: <20231023074613.41327-1-aesteve@redhat.com>
 <-ngmaSLF2S5emYjTBWcLRNzvJRoe_eZ-Nv9HQhE6ZLuK8nIE2ZbfVh2G2O2Z41GoIFIRpts0ukEtFXUx8pNAptmrZBhlXxaQGykx_qCZ_9k=@emersion.fr>
 <CADSE00KW4+hpbAbZAusBngq5FYSa067wYJCGeetqngWRJaD9Kg@mail.gmail.com>
 <87y1eqc5qk.fsf@minerva.mail-host-address-is-not-set>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Albert Esteve <aesteve@redhat.com>, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 mombasawalam@vmware.com, iforbes@vmware.com, Jonathan Corbet <corbet@lwn.net>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 David Airlie <airlied@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, ppaalanen@gmail.com, banackm@vmware.com,
 spice-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Matt Roper <matthew.d.roper@intel.com>, linux-kernel@vger.kernel.org,
 krastevm@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, November 22nd, 2023 at 13:49, Javier Martinez Canillas <javie=
rm@redhat.com> wrote:

> Any objections to merge the series ?

No objections from me :)
