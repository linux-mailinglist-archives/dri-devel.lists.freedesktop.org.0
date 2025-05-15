Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B65DAB82D7
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 11:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE55D10E7E2;
	Thu, 15 May 2025 09:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="HSfTSCSr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch
 [109.224.244.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EA610E7F5;
 Thu, 15 May 2025 09:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1747301731; x=1747560931;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=HSfTSCSrjYWSk8tu3IKddMgp3MAsnncvk03YeIomkHfZj0pnuGcWpQxhxrL+NJJoq
 FSJdLbc5YI5Oah95B2MkLjCA/L4Kn5zuZiOUVKkkl77jldu1lRhzR99y/pU5LcTYw7
 fUbn0+RZ/FN/OYpa/fkxpheTWPvkUXyDOzsSkmw+J7y1NG7UqJ9iiPvnXjC4em+FW3
 Nuy6+MEeyKRWDXZsjnOZsPA6kaAMbHRgutIumUloIzbNt0b1bc1e+qeakE4QAvAzJt
 0fFRkdvMY8QI1AATXXW0A6MLUqvdKS7pw9/ErGDixLXIEUeRPPRSOvbRgwMEgXaXiU
 pyPLaeJZMzz5Q==
Date: Thu, 15 May 2025 09:35:25 +0000
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
Subject: Re: [PATCH V9 31/43] drm/colorop: add BT2020/BT709 OETF and Inverse
 OETF
Message-ID: <8WcvC-UGuZ3awh2w-XE0rIfkC56njPFdb45X_EHJ67Q4Ixv69iXbwIa3mfVtvakUb9DcbFLTYCE0GYh0ZaO-bG3ulwZTNExmRs_kj33GL5I=@emersion.fr>
In-Reply-To: <20250430011115.223996-32-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-32-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 236e04ddd8f8446f282b44132b4a12eaf589e45e
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
