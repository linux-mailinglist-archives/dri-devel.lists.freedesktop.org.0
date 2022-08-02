Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1742587D24
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 15:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB2F11B3D6;
	Tue,  2 Aug 2022 13:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0062D11302A;
 Tue,  2 Aug 2022 13:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mp0CGMiBXy71SpOOQFY30cTJ8g7bkqqErkbWltubfWk=; b=Y858Ago0qi8B6ZL2PlN7IP2Gfq
 G4d4bDgG62Q8qKbUVqJpnL+xuuUB3uhSn6aKWIKw3dA3fgxrW8T+74mlbBOqf7rN7HAb0rmNuBvTi
 1+MMuo5Yu2ATZeLQbqnwy60ff5tLFv4ovWDUOI32BSgskSyWuMNbIu/FTEHq47EUnju2rUXzSOKfx
 CHR+4RRGiui2U42IJpqHJfiTfo1VSPdRQfZPx3rvUL9ZK6WbSXMPRGv2mEVOOf0S0lvFy1z/aVWFm
 uC8Xth80fQdzOma6u2ir6yCuGdyNnKdJus7Qkr+0kbjq2DE+54mDWaWUvoBOaZ403mGHNjjYpWhn3
 PsPNL+fw==;
Received: from [187.34.27.134] (helo=[192.168.15.109])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1oIrzx-00EhoP-Kq; Tue, 02 Aug 2022 15:31:49 +0200
Message-ID: <7069d082-f508-af3a-8098-081e59a4e41f@igalia.com>
Date: Tue, 2 Aug 2022 10:31:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] drm/amd/display: make variables static
Content-Language: en-US
To: Magali Lemes <magalilemes00@gmail.com>
References: <20220730010700.1824647-1-magalilemes00@gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20220730010700.1824647-1-magalilemes00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: siqueirajordao@riseup.net, sunpeng.li@amd.com, tales.aparecida@gmail.com,
 airlied@linux.ie, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 mairacanal@riseup.net, alex.hung@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, isabbasso@riseup.net, andrealmeid@riseup.net,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Às 22:06 de 29/07/22, Magali Lemes escreveu:
> As "dcn3_1_soc", "dcn3_15_soc", and "dcn3_16_soc" are not used outside
> of their corresponding "dcn3*_fpu.c", make them static and remove their
> extern declaration.
> 
> Fixes: 26f4712aedbd ("drm/amd/display: move FPU related code from dcn31 to dml/dcn31 folder")
> Fixes: fa896297b31b ("drm/amd/display: move FPU related code from dcn315 to dml/dcn31 folder")
> Fixes: 3f8951cc123f ("drm/amd/display: move FPU related code from dcn316 to dml/dcn31 folder")
> Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
> Reviewed-by: Maíra Canal <mairacanal@riseup.net>
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> ---

Series is Reviewed-by: André Almeida <andrealmeid@igalia.com>
