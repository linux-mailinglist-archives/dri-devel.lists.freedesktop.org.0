Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0BE8CD6C8
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 17:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD88E10EC24;
	Thu, 23 May 2024 15:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="HnziyE4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E81B10EC24
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 15:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1716477096; x=1716736296;
 bh=nRU4xSXIMtI2i2h+LDaYQCpy/iiJnRkDTKajfkq4M08=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=HnziyE4vJ0MXsZSdljyWe7EgGoyimom9PA6mGp3kxrcA2/VleUCG6hxFDRjNV5CdZ
 E34YfEUDjk1/+Y5dxpRBtxCdQKxsXPAUW8j1eS/SUZ7Ma+3QhS+nqWyNn2VNocLM0c
 zuBhdAg2bk+q0E85EhRleGroPw1vGv6hFe7ehd2X/kskcI7df2i05UQPwXhN7017vq
 XNJof0NNjDa01KxjIZ0lLBjiV9RxikJKDRCc/P0LujP5HHWJJMQkXq29SGETDam7d8
 Ei0kLOb5Vwbrmm9s1cRB6Zg6jksIOM5M9BNd0k5r+6Uib5valTWB5AQFBDVeMzVoFg
 Jex+rqKav8jVw==
Date: Thu, 23 May 2024 15:11:31 +0000
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Cc: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Subject: Re: UAPI Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Message-ID: <N0sGFmcyTVt8r1kwJ7MrJcDC5IbVSEaFH14nviFfU-1vbhGvERJ2eYSI7_pAeStO0_mugwxwXOF1puWojEQJxy5fcrpo1BsmQjdf-8NBYMA=@emersion.fr>
In-Reply-To: <ZeBh3N4uttG53qhU@phenom.ffwll.local>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
 <20240221110751.48da8190@eldfell>
 <b43rdl7yebxn6z3pvyeyxbikccr7umrojo5kqw5i3ybloxktso@de4oxsbskkwp>
 <20240226171143.27e60c30@eldfell>
 <CAPY8ntCHi8joN-w3PNjMj31FSkCjqmJ4ZyhSDFZ1-PnfL4+FrQ@mail.gmail.com>
 <5us3AK9XJ5zu1AOKQeZxKWsK0f6Xtm7vHWttRTFPRo57Ph5WO62deVIK8TrkQIFmjFMrn-a2qusgP3W74dV6SKTA5OdTt4zncR7J2qQ_Qck=@emersion.fr>
 <20240228-nice-flat-cormorant-badff7@houat>
 <ttd0tkA6ym5NBhHqKQFa88BjxMoctTVJd03aIqnSyXZ0ve0jPPrlkTVmUNWIQGNyNBpFvxzplydGqGFQa5VaYuf5mm1n9dEGDM5MG25j_4Q=@emersion.fr>
 <ZeBh3N4uttG53qhU@phenom.ffwll.local>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 832758c76b9d01ac4ced426708451eaf1a42e61b
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, February 29th, 2024 at 11:52, Daniel Vetter <daniel@ffwll.ch> =
wrote:

> I think some weston (or whatever compositor you like) config file support
> to set a bunch of "really only way to configure is by hand" output
> properties would clear the bar here for me. Because that is a feature I
> already mentioned that xrandr does have, and which modetest hackery very
> much does not.

FWIW, this is a feature I would very much not want to add in my own
compositor. Not only there is a bunch of complexity exposing KMS props
in config files (enums, bitfields, blobs, etc), but also I don't like
the idea of having a way to set arbitrary KMS props behind my back,
which would be a very easy way to mess up the KMS state and cause
conflicts when the compositor is upgraded.
