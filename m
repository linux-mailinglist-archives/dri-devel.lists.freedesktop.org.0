Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87228430C9
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 00:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC93C1136DC;
	Tue, 30 Jan 2024 23:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700941136DC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 23:01:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 070E2CE0E58;
 Tue, 30 Jan 2024 23:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FD6C433F1;
 Tue, 30 Jan 2024 23:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706655620;
 bh=SRp2QhaE8on2XaoCyowQ38M3H5KYB1hkQPVd3UamK+A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qMXR+ZX0tD5ef1wxtXFwrUJAurXEDgYXnZ83TqywafSRnoPNXRygiPEXziixp1Lht
 lpdyAgumsDb9mQZc3Y8AohdddD++6V+JPobFmYKYgFJDVqcIyqtLATx40K6nFOX4QE
 heW9WceZsILUAtYrswnl0fOCNC8rc+ddPJ4OcqzdqazoJECJkMOQzE9pzKcot1WCIY
 7+jLnAvx76bJp5GvIt6pHCGJzDs8vIziYkpL4SnClMVUh/UN/FJ6e7jCZpVjbyPhT8
 xouIcgVJjdY1wtXrlrpg2dnPCsBSwZ/dGbVvbY3Mji6hPcII9Fk+JfSnx685Fs7BbG
 h9mT+IhNUI6HA==
Date: Tue, 30 Jan 2024 18:00:18 -0500
From: Sasha Levin <sashal@kernel.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH AUTOSEL 6.1 04/53] drm: Fix color LUT rounding
Message-ID: <Zbl_gq9FhTICi4FS@sashalap>
References: <20240122150949.994249-1-sashal@kernel.org>
 <20240122150949.994249-4-sashal@kernel.org>
 <Za6ano6dg0Mau7OI@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Za6ano6dg0Mau7OI@intel.com>
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
Cc: tzimmermann@suse.de, Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>, daniel@ffwll.ch,
 airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 06:50:00PM +0200, Ville Syrjälä wrote:
>On Mon, Jan 22, 2024 at 10:08:05AM -0500, Sasha Levin wrote:
>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>
>> [ Upstream commit c6fbb6bca10838485b820e8a26c23996f77ce580 ]
>
>Why is this being backported?

Is this not a fix for an issue?

-- 
Thanks,
Sasha
