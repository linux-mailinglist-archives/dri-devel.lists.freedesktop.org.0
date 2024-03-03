Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456B886F586
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 15:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5E210E6D1;
	Sun,  3 Mar 2024 14:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="jcN4spbR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE58610E6D1
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Mar 2024 14:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1709476325; x=1709735525;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=jcN4spbRPMS/t2O67DdnJLPirs86fSoTJAUvPE+mo1IBPV0euCEgrh+H6nZ33KV0n
 g/BX244S/6ljDNVUV2krKixjo26gf+zzzBmDFJJ0CphZAhb2BxDqJUhtbm827eJUSW
 q1GCpYOskzTqxQ9p77lsKWDlwrA50bSrJ1ViCJgDdx9J/pkc9oRCOJGAiBwvk4AZ+f
 Pvf1Nlbr+46M0VpEEG6L5CYDLui2H5ONVobyeT7AfO2cClMynTN2IOBLTqQ/lUE/TK
 AH988DOCRNDv91hrjEq5mAs2zMdymHAlTwCk7Fs6ki7kfcLh1yfxkjHN+7Q+8g6RyJ
 BYWhUckRYlnuw==
Date: Sun, 03 Mar 2024 14:31:58 +0000
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Naushir Patuck <naush@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH] drm/fourcc: Add RGB161616 and BGR161616 formats
Message-ID: <UC3wdtuThrCSbFAOZ-enaDsgiutcdLMGEDz06KilKqE3aq-RvzmMKgZ98GHNelG91EY-_VpfviQqaccfbdNo2f1HZmf0FfZGzHm0MACVyJA=@emersion.fr>
In-Reply-To: <20240226132544.82817-1-jacopo.mondi@ideasonboard.com>
References: <20240226132544.82817-1-jacopo.mondi@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
