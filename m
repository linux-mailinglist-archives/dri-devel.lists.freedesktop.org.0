Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2175666D1CC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 23:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AC910E500;
	Mon, 16 Jan 2023 22:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4895610E50F;
 Mon, 16 Jan 2023 22:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E7C7tYNLE3lV3jdPU+8p0yYbyDO/5dn3cCY4IF7ooz4=; b=jpX/8HIyM02JnnciQygamDxSSO
 wURaMf5J0bemTIo1YrHasf/l5CQyEQ2LGGTqqcu6Hb6TPeXITt3kNdwonEIEDy4vAa/x3i0nSZver
 zUb3jtLCPzVa6RbCNzfu5KnpAorAUfTAojy/0atrppuP2eJ/AvWqZDmKnU/KUxlq1+wRwitdsWSIm
 CFVTE9zQiRcTq4wZKYH3QBS3WJpoqZFaT9huxQYCRdl9gP8oXGUBJWPGve9ubr71zyM1PpZYKPN7A
 m80hO/PHHlwWWP0wewwBZuL/AWgF8m8GTj0qDFfIdsJ4UqEvFIGqvM51nxAfGXHJHdyIa9+WKQ249
 j7G/qK6g==;
Received: from [187.56.70.205] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pHY3i-00AAm8-Ow; Mon, 16 Jan 2023 23:34:31 +0100
Message-ID: <b8a7253e-6902-e143-1bf2-ff107f25fd2b@igalia.com>
Date: Mon, 16 Jan 2023 19:34:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] drm/amdgpu/vcn: Add parameter to force (en/dis)abling
 indirect SRAM mode
Content-Language: en-US
To: "Liu, Leo" <Leo.Liu@amd.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20230116212004.860968-1-gpiccoli@igalia.com>
 <20230116212004.860968-3-gpiccoli@igalia.com>
 <CADnq5_Oh5Vdygo12evQKxw3w-ipRoQMvSNFHGcKtBNbSmtW7GQ@mail.gmail.com>
 <DM8PR12MB53991481A19B6AC8BA7A4E0AE5C19@DM8PR12MB5399.namprd12.prod.outlook.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <DM8PR12MB53991481A19B6AC8BA7A4E0AE5C19@DM8PR12MB5399.namprd12.prod.outlook.com>
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
Cc: "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jiang,
 Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/01/2023 19:27, Liu, Leo wrote:
> Secure part requires PSP load VCN boot sequence which is with indirect
> sram mode.
> 
> Regards,
> Leo

With that said, and with the plans of just setting the indirect sram
mode nevertheless (with no switch/cases anymore - I'll submit the V2
tomorrow if everybody agrees), does anybody oppose to have this
parameter for debug reasons?

I first considered doing through debugfs, but obviously was a (very) bad
idea, since this should be an early boot tuning heheh

Cheers,


Guilherme
