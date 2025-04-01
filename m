Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F072FA77F5B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353CA10E5F7;
	Tue,  1 Apr 2025 15:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rlyLq6hO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605C910E5F7;
 Tue,  1 Apr 2025 15:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8/CEuCDEsDM4zNlfioiDasrJMlJkZ6rTlvb4xDN6IBI=; b=rlyLq6hO+1hA4yvIdyjKXofPUY
 bpl752bH/bq642sLARVBPd4B/kvZUqRFNLCrIdP08N10uyDSFUrkDZYzIozTCvEixXVfZ64zD4TgM
 pYH2l58VHws+3P2mHrAdD22JcafxR+yN9eSYSiHJYg0ZkusbD9c05QUB40RKEMIA1m48xNjUOc2GQ
 yIClk8KmaLqZQNroScg8DI8j2Z7xzqrSrSMh6rQbXnap/e7v5kjS11AX0r3/PKNU5OIaN+K2HWpok
 5ylWJsss4OZUaiH4jZCXeH6ar6WA72QOQaIQNvhVmkgMAD85NTmCPoQzPfw8YhkcTRsFxPRfcgo5z
 0auTOESA==;
Received: from [189.6.35.67] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tzdp8-009sSl-Nq; Tue, 01 Apr 2025 17:46:47 +0200
Date: Tue, 1 Apr 2025 12:45:55 -0300
From: Melissa Wen <mwen@igalia.com>
To: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, Shengyu Qu <wiagn233@outlook.com>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, 
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, 
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
Message-ID: <4vyvhp5bag5hlmmudwxqolvlf2qgpcmdozj4vgkxzvsv2cvs6p@gumxpiflj7q7>
References: <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
 <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>
 <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <TYCPR01MB843757F4E7BFF224712BD68F98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>
 <CAFZQkGyOvLyqVBRr5_mhApeEx2emoJ8KRp2_GDuF2rL-4zZ2bA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFZQkGyOvLyqVBRr5_mhApeEx2emoJ8KRp2_GDuF2rL-4zZ2bA@mail.gmail.com>
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

On 03/31, Xaver Hugl wrote:
> > Cursor plane has no color pipeline and thus it has no colorop either. It
> > inherits color processing from its parent plane.
> 
> Just to be sure: That means amdgpu will reject atomic commits that try
> to set a color pipeline on the primary plane while showing the cursor
> plane on top of it? Just like with scaling?

Isn't AMD driver resorting to overlay cursor mode when scaling?

In addition, isn't it a case of using overlay cursor mode when setting a
color pipeline for cursor?

Melissa
