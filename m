Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E137D88DD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 21:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5A310E86A;
	Thu, 26 Oct 2023 19:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D43510E86A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 19:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1698347950; x=1698607150;
 bh=ke7swWB6yQygD9krwbOyuLU3chaz5c1MYzM+reWtftA=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=F1CncGlASPt8SLeqIH6vZ6M7jbuZ11tOmUFG4CYglsg7HT41be5WU8jrJQ1+U8/ig
 mzHB35ell7li9CmVLUBR0G9OQ1+1sIoRaeM71hIghugtnGxQ3JIa1CZud+aLJTzLFq
 eWcX2eVMXpQed0ZVfQj6jm8ar5xr+4foa9voZ33TjBWzp6KNbEfcDlU15DsuOT2LXz
 tP8LvohVvNLa4cyUWuCi+lWlFVn141AscXIiWSaD44iUx+GNfTW+N+to48heADINew
 CM5KdotKPCrx1WIXfZ/K4KroFFT9fQcCTrjlUQLs4uNqgWM8FGPVnfHMGogDQFJ3p7
 z+Ee0Mdg82WEA==
Date: Thu, 26 Oct 2023 19:19:05 +0000
To: Erik Kurzinger <ekurzinger@nvidia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE
Message-ID: <YctgwG74KVlkXjxW41UWQzVNW-jQHOfhnKvMLZZ0khpFdTYyJvHR9q1sVuv0pJDMmkWhfEi-8bRbXP_qAxG4vFA4B2HLYEfbkkyW5vQioGk=@emersion.fr>
In-Reply-To: <qBT834zTNzsElUXeKdO8YHrH7VgmmqKRy9k60884hcRc0ATUcIiOK9smiiQHEHfQbMDcqAaPVe1pyMTwp5luV-OwLNUPA_h2DjVnaU0p1Qs=@emersion.fr>
References: <1fac96f1-2f3f-f9f9-4eb0-340f27a8f6c0@nvidia.com>
 <a42f1e8d-2c9a-4511-ba10-64f494ba6920@nvidia.com>
 <qBT834zTNzsElUXeKdO8YHrH7VgmmqKRy9k60884hcRc0ATUcIiOK9smiiQHEHfQbMDcqAaPVe1pyMTwp5luV-OwLNUPA_h2DjVnaU0p1Qs=@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, October 26th, 2023 at 21:16, Simon Ser <contact@emersion.fr> w=
rote:

> On Thursday, October 26th, 2023 at 19:55, Erik Kurzinger ekurzinger@nvidi=
a.com wrote:
>=20
> > Is there anything else needed for this fix to be merged? I have shared
> > an accompanying patch for the IGT test suite here
> > https://lists.freedesktop.org/archives/igt-dev/2023-August/060154.html
>=20
> Do you also happen to have user-space patches to use this? That's also
> a requirement for new uAPI.

Oh my, scratch that. This is not new uAPI, this is a fix. I got things
mixed up.

I'll push your patch now. Thanks!
