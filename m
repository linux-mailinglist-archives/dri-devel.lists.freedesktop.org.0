Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350B6AB82BA
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 11:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB16910E04F;
	Thu, 15 May 2025 09:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="r44kFZ9x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch
 [109.224.244.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A2410E1C0;
 Thu, 15 May 2025 09:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1747301648; x=1747560848;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=r44kFZ9xu0hrhZ53aNNmfDrHsFX6eamsxWXIyGGB32BeZV3jUcSdK3JDD8appyy6b
 P7//AKLq/LTz8OnlvhdX6vNIioCcBE0IO3NX3cgKxnUsjM+icqRQtx0f9/LkVXRAen
 q8rpYwpcb0a4K/e07HAhmpl9k4NDPEUEgHuZbs6P42NRyCL7eeeZ6+3sMPaKKSLYbY
 EUOVz9b86Qy2S3YBGKgM2zNoD6k6/IqDY5qA1ysNDFLNBaRVxAwiQWbaqSF8eRe1cC
 4K+vDLRxukAca6SrgIxzvM4a273RO8u+0Hv0/KxmT2AaLKS9jdVNGJhTuWFdTJ6EzB
 9AkzQkE56o+Og==
Date: Thu, 15 May 2025 09:34:05 +0000
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
Subject: Re: [PATCH V9 13/43] drm/colorop: Add destroy functions for color
 pipeline
Message-ID: <QQqy1j1ZcCnwkhtJKKhrWISYwrKbJCoi5MbKC3IcDXRqG908_2tQNd96xl-rGslACjXE6A6g0R4hVl-NzAgXHB9DFtXlEy3EnOIpCXO2fLM=@emersion.fr>
In-Reply-To: <20250430011115.223996-14-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-14-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: b9ee361b5a76871aacc0f0ad8d35d02e98c6264d
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
