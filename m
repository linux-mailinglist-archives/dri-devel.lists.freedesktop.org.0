Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93E6A893C0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 08:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C486E10E35B;
	Tue, 15 Apr 2025 06:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="a7YLlnwX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10626.protonmail.ch (mail-10626.protonmail.ch
 [79.135.106.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782AC10E359
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 06:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1744697822; x=1744957022;
 bh=BVwqC6rXl3ANFkEWsHeU45HK9QZEzYta76kp7W79VWM=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=a7YLlnwXXM6+QLB5nT+K1cgELIh1FpFh5pFDRUmUS1k4TQBGJONeS690BY6yRvHt3
 ZZVnctYRDEcYtgDHvK7mbcJ5l5ZEBNATbcLAhf7Lj/uTHxtWY2f4dFbl24/uCv9jy9
 nyFZXJrircCSzkj4Jusd08ZVIA4Kn4ACQ2blo6CCZdj/ptF4quKV0HVPU5aStZtYsX
 P3vDsWFGI8teYBbOr7XFayBxFYI5QCmVzTsYbLGZQi08DWk4kdpOkwjfQcN3ApbMU2
 s5opRMy22Rve+Cc8PDCODqokBW2wThC9LJQ2G0dAx8U12xtDMDIx8/KjixCzzFoCyT
 EOhTBrolQmEng==
Date: Tue, 15 Apr 2025 06:16:57 +0000
To: "Shankar, Uma" <uma.shankar@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "mwen@igalia.com" <mwen@igalia.com>, "jadahl@redhat.com" <jadahl@redhat.com>,
 "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>,
 "agoins@nvidia.com" <agoins@nvidia.com>, "joshua@froggi.es" <joshua@froggi.es>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "marcan@marcan.st" <marcan@marcan.st>,
 "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>, "Borah,
 Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
Subject: RE: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
Message-ID: <fzuE3KXuocsKA0I9kWXruyw7IVbw3jwH2yeh59SfE0Qb0SGxa29rrj9X_XgNCdmj1vWgxLO619xyJY3r5R3hsZK6ElIkTvbyNfu40x1SiZM=@emersion.fr>
In-Reply-To: <CY5PR11MB63441E057180C043C51230A3F4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-33-alex.hung@amd.com>
 <CY5PR11MB63441E057180C043C51230A3F4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 62e894dd95a5042d0ccef8f603b856f009201a8a
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

On Tuesday, April 15th, 2025 at 08:09, Shankar, Uma <uma.shankar@intel.com>=
 wrote:

> We want to have just one change in the way we expose the hardware capabil=
ities else
> all looks good in general.

I would really recommend leaving this as a follow-up extension. It's a
complicated addition that requires more discussion.
