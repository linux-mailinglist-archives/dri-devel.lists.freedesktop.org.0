Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E87AB82E7
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 11:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD9810E7F3;
	Thu, 15 May 2025 09:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="Zf1AtNm1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch
 [79.135.106.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2277410E7F2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 09:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1747301842; x=1747561042;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=Zf1AtNm1xZ6Ot+kF6W9yFVtMvi/O9g54AY8bA6ZZncPy1uqmhVXgD2OoFtkpAMwx+
 jiIgRMUbNq9ILDkui/q2fRwn0RNPlNMRYesbBF0qeLj+iUzl0nmWV7H2TLospyg1cW
 mMFsCjipwnQQDxmaQ9a+T7lpLKLxH3TNigMpqaJ/tgAeJ5BEgV9gaRrlgBH4xRMCEN
 Cf+4k7QKs0tDlPyy/s5lDv4UizXa9qTleMpNkUM/EH/ed7xLuuwkRk/mlEfUef21t+
 kF5W1vnkV+QIjq7WM4BL0SNaruT8zCZ6IC+L6kHtnZgiIr6oUIzDfB2MBHXXJwqJO2
 gi/h8df3t0rLA==
Date: Thu, 15 May 2025 09:37:16 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH V9 40/43] drm/colorop: allow non-bypass colorops
Message-ID: <_P-ce65VbC0wayDmolw8t002K2DjoC1KuHqEPCRPOd2efOUnovsbPRLyHszwboRs55PDjsQwSMZ17pMlSyvtraq1GPGDi_e4_iBq43v4CTM=@emersion.fr>
In-Reply-To: <20250430011115.223996-41-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-41-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 38e07c1f4b15b64dd926ce324a0e48a893019db0
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
