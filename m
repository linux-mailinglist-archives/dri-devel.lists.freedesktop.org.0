Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3377C6884D7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 17:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4908110E599;
	Thu,  2 Feb 2023 16:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1703210E4CE;
 Thu,  2 Feb 2023 16:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GDx9kn/8j59iGNWaEvaiHqds0MUV0+WhZYmr2PvASIw=; b=StNsei5G+tmc5ouFy1SpJNW2bu
 I5OL5Wmg43Ms5BGKiPZS7ZM0aDGwWoMHQG3EfDHiUACuFySLj3Q4UcHFRkas1UILrGqSv1LrMRq89
 23z4+MfAKy88j6STRgPtvy3/Oza35b7YNDHhev5ezuOSzfbxIreTkqyC2hcMW2SL5KAnejge2GG29
 PiDeh/QUDN0L6uVPVSLVAar1EFrVQXJLrTu1qXyiAYjYGSJsieF8aV2XOAsNLCP0W3Bnko3b3fqdP
 p4UGZBZ0shiQsPbUdkWYHq3atvhP6YDHR6A6jzQb0HaSjOoe2l8SJIOGOvl+FV5q8M1xgenTADP4c
 I1tVKd/w==;
Received: from [187.10.60.187] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pNcpq-007WOj-Vq; Thu, 02 Feb 2023 17:53:19 +0100
Message-ID: <ae725cf3-08a2-8853-ccb6-af7091a69bc0@igalia.com>
Date: Thu, 2 Feb 2023 13:53:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3] drm/amdgpu/fence: Fix oops due to non-matching
 drm_sched init/fini
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230202134856.1382169-1-gpiccoli@igalia.com>
 <f7805d0a-6fbd-7389-a2fd-d6343ef4598b@amd.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <f7805d0a-6fbd-7389-a2fd-d6343ef4598b@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: kernel@gpiccoli.net, Guchun Chen <guchun.chen@amd.com>, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, Mario Limonciello <mario.limonciello@amd.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/02/2023 13:12, Luben Tuikov wrote:
> Hi Guilherme,
> 
> Thanks for redoing to a v3. This patch is:
> 
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
> 
> Regards,
> Luben
> 

Thank you for the reviews Luben, much appreciated!
