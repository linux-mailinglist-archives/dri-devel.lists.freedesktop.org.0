Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A56706671ED
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 13:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC60110E8D2;
	Thu, 12 Jan 2023 12:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6247110E8D2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 12:17:22 +0000 (UTC)
Date: Thu, 12 Jan 2023 12:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1673525839; x=1673785039;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=JnalnrNesEpPKKyd5tQh0jeNSG/JZLdK+ZczoGOe9lt913bJSHZPHQCi372BZRQaZ
 aYePLFveAWm9mv2r36EJDEv7FjKSbktTpOJ03vhbbq1mK2QhSeOEltQQ/OivjVHmFV
 +vohm6dx80VyVRuRu3g+r5sAz15Htp6z1vGORwulUJ3Xdhm68bsBfe2bqYyeIO/bw8
 VRYk49S7Mq0LYsS1VynrbhRR3hG9y2k7/8Fhub1drHV5kf77HD84XMT4+rOEzvGteD
 fzhZZA8Y5DGKTiZ6PyWGJmKaZNg313YWXr38agztdjG9hp3NxOgyq4Z/qrkEZymB9U
 nRahf3KMu2Y6w==
To: =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/5] drm/amdgpu: Remove redundant framebuffer format check
Message-ID: <pWB2kYfjJj5au1Un771pjtjiieAawRjX1OzkIqd_xqAjbKTJxaYxPMz76YeO2XCURO9S1yURBzD0JKb4QHz2n9QxkZNZ0IP8GzHATgnsz7s=@emersion.fr>
In-Reply-To: <20230109105807.18172-3-mcanal@igalia.com>
References: <20230109105807.18172-1-mcanal@igalia.com>
 <20230109105807.18172-3-mcanal@igalia.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
