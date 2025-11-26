Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7E6C8C3C0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 23:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FB110E6FE;
	Wed, 26 Nov 2025 22:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="sqbr/7ei";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch
 [109.224.244.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7B910E6FE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 22:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1764196777; x=1764455977;
 bh=DgSSzxJrqNEVzqNZI3iR28xGOIQFV4E6DP4otbovhh8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=sqbr/7eiaPIkCDcbTOWerFYL6Ci1ZnJ9OBz+atdiAS2uE/6VkW0wa/dvRviqGaXBz
 OFl9XOi9+Adw/Ntk2IWrdWeDGx2fywDM0rRXXHKqU7iQCV2yRTMnoR36IPDxZNxZTX
 1tG9tw3SAfy90FlsLZFdBY+RlYx8dI9fWNmOUfp7dI8ifJmWk+DqMdPANG0yTDUbQl
 STk4uH1N00HjdpzgqPhpw4SpObdmq7mj5oNhxwujEv5Esf1N+L9VK5wpYotQFl7n+7
 mNxOiPydCLJWhR4phowGaMZ7qHnFEaYzlRYcrtb1eqpapiiFZ+RgC2v329Fk/jbVGq
 mB46oC/GEwhbQ==
Date: Wed, 26 Nov 2025 22:39:35 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, Alex Hung <alex.hung@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 xaver.hugl@gmail.com, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, mcanal@igalia.com, nfraprado@collabora.com,
 arthurgrillo@riseup.net
Subject: Re: [PATCH V13 00/51][FINAL] Color Pipeline API w/ VKMS
Message-ID: <9SKik7HYjfvfDFnhulaAYG4Hkw_dzXvXEZqzLtTQNEadc1SHg9eQUnBWtP3zOtV8qip9yrWY57d5E2jKWDhJybvRog9GerilPeiVLd9dFMs=@emersion.fr>
In-Reply-To: <5b0ab1cd-0a66-4a47-9251-396df9693477@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
 <cbe00ac4-a535-47d3-813a-e2eda7e9b991@amd.com>
 <d8360e9c-502d-4003-93ab-9afd8d716c49@bootlin.com>
 <cb13dd25-82b6-4d8d-a8f2-a9a31ef2e73d@amd.com>
 <ecf54c45-4b45-4fb4-a102-46ce9e1de3a5@amd.com>
 <2270bad3-8634-438a-aa16-2092398e271b@bootlin.com>
 <5b0ab1cd-0a66-4a47-9251-396df9693477@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 8281192959043d8f035316ff5a8c836d625c2123
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

On Wednesday, November 26th, 2025 at 16:22, Harry Wentland <harry.wentland@=
amd.com> wrote:

> > I tried to apply the series, there are a lot of checkpatch warnings, do=
 you have the time to fix them?
>=20
> Right, there seem to be a whole bunch. Let me clean them up and send a ne=
w version.

Oh, I only now see this message=E2=80=A6 Seems like we duplicated the work,=
 sorry!
