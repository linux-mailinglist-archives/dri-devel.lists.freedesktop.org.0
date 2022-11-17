Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E1762D5A8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 09:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5EE10E581;
	Thu, 17 Nov 2022 08:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3823 seconds by postgrey-1.36 at gabe;
 Thu, 17 Nov 2022 08:58:34 UTC
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4845510E584;
 Thu, 17 Nov 2022 08:58:34 +0000 (UTC)
Date: Thu, 17 Nov 2022 08:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1668675511; x=1668934711;
 bh=6KGa/c+LMHT5tzDXZrMiZV13nLyC2Z5bX9/nNvvGSSA=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=IsbOVE3OljD4lBU7e8xDRptlfqX+XsvAo8wyAwtXznt3uMixo6cq/eHgCr/iIQVFH
 sNEyunTIAS2YPznnr2g5pjdaJfm1a9S8w8sROsxA7GNESbjAxxxuC9Zn3GBzbYiEzz
 VL1gqkwDnLMtCt9GtK3oUl8RYU+SahE4MOp1+I5wQDI92ePULvRNGGJ6TyyqUvdqCG
 pMKvvXV3drAWe8GjncHHb0Tzhsx3/hefeqxocm7dReRTLx6F6tr0X0Vk0taaONKTzj
 lCp/FpxKokYcGAi2TclAAPAlCNzaXSVMcs27IzC3YCXgic6SwORhlSQtSqIInLVgnI
 Pxn/Es5gpPhkg==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 0/6] Add support for atomic async page-flips
Message-ID: <2gTBGn0MFrQeE-GBD4weUAgOHEYiLDD5_hqTLNxOYKYIOfD1HL_84sEVhjftn7nR3kr0of-bONvg55mHNDCuOiwAhCcKexGrD9RvIN-OHw8=@emersion.fr>
In-Reply-To: <PJIfCPDOH8tzwE1mwv58g4ICBZbEgW44vwzW-JdUde6PjLDUeF_JNT0kUZ_Z8hZWqii_DTdDFfAYpRbO_T1Tu28wpjiwYlQpRdsrHJXLF58=@emersion.fr>
References: <20220929184307.258331-1-contact@emersion.fr>
 <Yzb0uNjB5FpjCIjq@intel.com> <Yzb6203nHF8fVH/W@intel.com>
 <YzcGw9myJotLRTVl@intel.com>
 <PJIfCPDOH8tzwE1mwv58g4ICBZbEgW44vwzW-JdUde6PjLDUeF_JNT0kUZ_Z8hZWqii_DTdDFfAYpRbO_T1Tu28wpjiwYlQpRdsrHJXLF58=@emersion.fr>
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
Cc: andrealmeid@igalia.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 mwen@igalia.com, amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 hwentlan@amd.com, nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ville, any news on this?
