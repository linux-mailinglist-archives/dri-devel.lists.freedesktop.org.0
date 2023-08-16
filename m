Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A845B77E69A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 18:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A8310E39B;
	Wed, 16 Aug 2023 16:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857F810E39C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 16:40:28 +0000 (UTC)
Date: Wed, 16 Aug 2023 16:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1692204026; x=1692463226;
 bh=jzD3dHuts+PNg6DHyrMOozmpDNajsAiQ6O0WgYyiVyc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=bEqkb/jHLDBrjYzjUpkkgvnoZw6eyxpoDBLOjH6DtDnhJlntEl7O1jd+MoWDtxw3F
 eecdnmBkE4WJq9ElYs8wSd4VEjtsAmrR4BUG2RrG9EvGgyJsh37ME48YsZ4Ix/15U/
 +LZ7sM0ya5fgl9eA72sHT5EYULptkUJZupI9R82KDKq63KGGwEua0pTtUhmJ0e1kBY
 zGcT9cyb0OEPO8nWDGKmPEnOCb5TNYxxfOlPpitby+Uwa0epr/XagVa9SRaUO+wJlG
 4tc/w/MCw3t5BNbLwH1e4JOTyFAWSut3Oi76GaUFkj5CvYmJ0Rmm+vqWbeGvc2PVnf
 7RYa5a0LjWY6w==
To: Erik Kurzinger <ekurzinger@nvidia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE
Message-ID: <XMsmays-xGmL68CFTjnEY24F0jiSpQld5_ErWb02c6_LToDRM4sGOs2vlsjGbgphvtFRVYSRCqqrg77ya2XUMkxerGOOM8YFBUWjq5C0oUo=@emersion.fr>
In-Reply-To: <1fac96f1-2f3f-f9f9-4eb0-340f27a8f6c0@nvidia.com>
References: <1fac96f1-2f3f-f9f9-4eb0-340f27a8f6c0@nvidia.com>
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
Cc: david1.zhou@amd.com, dri-devel@lists.freedesktop.org, faith@gfxstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

BTW, question: do you know if we could add an IGT test to make sure we
don't regress this?
