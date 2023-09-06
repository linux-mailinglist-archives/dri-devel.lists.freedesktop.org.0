Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CF0793BD0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 13:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFDE10E60A;
	Wed,  6 Sep 2023 11:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5D910E60A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 11:53:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8ED2AB81884;
 Wed,  6 Sep 2023 11:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75EAC433C8;
 Wed,  6 Sep 2023 11:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694001219;
 bh=bwfka+JpEPprvMJfxECixELCrmxr7bmCc76S67cIWJc=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=pMq9vRCjBQipcs/aGh/mqFdWLTVT6zoNUA45SoqJkid4FVZFVHUKDSkn8We/Lnk49
 Sl4CzaRMQEeJR+5N+R98d62v8tOnx4oBqbZw2c+7MrGq3BruD17BAF6+lkbDb8ERuF
 s++0s/mxgKte4JV8lE75+9388UVUqZcjtSgk3aweApo1nb3wta8sy6tALPX8aC6WNj
 EYPa9T2cMpc2dPujrkpRxZtl4d4QgL2FTl8OfK9I5Xg6CFaUTolcjrShhaucDCI03/
 U589q3S+QVP08oGXMJvETk42p4BPPJNtCBSgLccvNLp79AYZ8YJxwoY8BXX4fl0ZNR
 plgeXBLDN5VEw==
Message-ID: <e4f53f712d7a98c974fc04788720ce78.mripard@kernel.org>
Date: Wed, 06 Sep 2023 11:53:36 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sarah Walker" <sarah.walker@imgtec.com>
Subject: Re: [PATCH v6 07/20] drm/imagination: Add GPU register headers
In-Reply-To: <20230906095542.3280699-8-sarah.walker@imgtec.com>
References: <20230906095542.3280699-8-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 7bit
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 matthew.brost@intel.com, corbet@lwn.net, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 tzimmermann@suse.de, Maxime
 Ripard <mripard@kernel.org>, matt.coster@imgtec.com, robh+dt@kernel.org,
 faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Sep 2023 10:55:29 +0100, Sarah Walker wrote:
> Changes since v5:
> - Split up header commit due to size
> 
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
