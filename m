Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A3FA756C3
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 15:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F4210E259;
	Sat, 29 Mar 2025 14:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="Rc1aLNAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.protonmail.ch (mail-4018.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A500810E265
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 14:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1743259262; x=1743518462;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=Rc1aLNAzRXE2Yoz6fwzKYhrF9MvwOXg3uZwjMwP7HdHM+IlXaJBH1sZcJSU2Cce6b
 ETL9gZ9avsgGQneudCn468NRnge9MCfaW2IX0jUGJ1kTGtH4C3PhyKNB4CPQWtMh84
 vvIPKqAyxNZa7hkbvRcnaKT8Exd4vqQGngmXshTH2a+ROmqFp/qguVCaDSBLV4O/2R
 sROg9IX4fcLHgp/auKzyvwNcpU5noLNRtxvzyhSeitYRfOqM8wK8HAX9/nlF1ayd4r
 8QAOQyWX20UR+2f4fI1ZM0tVSB57/0ZOOiAZUQJodYBl1YCXsOWX3JUuB37JCMm8XD
 699ohRqYBvniQ==
Date: Sat, 29 Mar 2025 14:40:58 +0000
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
 louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 12/43] Documentation/gpu: document drm_colorop
Message-ID: <SltZ89M6U3kGZgiUE-3RzJ5kyczz3pkSZL3PKSkUcHG7Dz8N2s9IcObx-P9A-NMYt6H817kloUcwl_8xmsHw7VX4pvupuJ4ebVKnMnWh7PU=@emersion.fr>
In-Reply-To: <20250326234748.2982010-13-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-13-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: fe5806361cc6f8c9822d7543f869b84e57afdcbc
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
