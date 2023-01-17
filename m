Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2308066D3B1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 01:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7105A10E170;
	Tue, 17 Jan 2023 00:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CA610E170;
 Tue, 17 Jan 2023 00:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7rA3dOZYWNXtMCsmezhMtKfclk/IKSdCdL3lUcKIGqo=; b=FU54kzvbdSnqn+Ve8r7bMnrBAv
 WulqJ+KYg0XBL682MyaPd4t5WCXPuLPBcAgDPqnlpPpTC+GZDx74eIlDaxlo0VACHAqvBAYkFQYAG
 Y74QE//xaTPLIA3D+KCYuYuiFbfiSZSMIzPBN3OO19pdGjvTVJbtr0lHPU6tzE8J0ai000Emfb+cx
 CsIBYR/zUCGBkfpxY9SyNysFBDN6HcIWn0OL4hwYcRsTicSQt0T2O3C55y65BRh/RoS4VC9jnmdZa
 kHdPxHdMx+om1taKJl/iOplBbpgv3O3SeRiD4XzEPxt+cVwzUnMPQBajHTEow9jiT10yYb8jfJE1p
 rNq8FtcA==;
Received: from [187.56.70.205] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pHa8j-00AEPd-Ui; Tue, 17 Jan 2023 01:47:50 +0100
Message-ID: <a6680b24-372f-673c-4b3c-1fd3c309f242@igalia.com>
Date: Mon, 16 Jan 2023 21:47:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] drm/amdgpu/vcn: Add parameter to force (en/dis)abling
 indirect SRAM mode
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20230116212004.860968-1-gpiccoli@igalia.com>
 <20230116212004.860968-3-gpiccoli@igalia.com>
 <CADnq5_Oh5Vdygo12evQKxw3w-ipRoQMvSNFHGcKtBNbSmtW7GQ@mail.gmail.com>
 <DM8PR12MB53991481A19B6AC8BA7A4E0AE5C19@DM8PR12MB5399.namprd12.prod.outlook.com>
 <b8a7253e-6902-e143-1bf2-ff107f25fd2b@igalia.com>
 <CADnq5_NJ7Kjoi7d+8bL2KNY3Leg8Jy7QL5reDS_dyEt7MUB0wA@mail.gmail.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <CADnq5_NJ7Kjoi7d+8bL2KNY3Leg8Jy7QL5reDS_dyEt7MUB0wA@mail.gmail.com>
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
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Pierre-Loup Griffais <pgriffais@valvesoftware.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/01/2023 20:00, Alex Deucher wrote:
> [...]
> 
> It's not clear to me when this would be used.  We only disable it
> briefly during new asic bring up, after that we never touch it again.
> No end user on production hardware should ever have to change it and
> doing so would break VCN on their system.
> 
> Alex

[+ Pierre-Loup]

Steam Deck is facing a pretty weird scenario then heheh

Commit 82132ecc543 ("drm/amdgpu: enable Vangogh VCN indirect sram mode")
corrected a long-term issue in which the indirect SRAM mode wasn't
enabled for Vangogh - and Deck GPU architecture is Vangogh, so it was
working perfectly with that disabled.

Happens that a bad FW candidate seems to have broken something - it was
a bit convoluted to debug, but we proved that disabling indirect SRAM is
a good workaround so far, it "restored the behavior" pre-82132ecc543.

Hence my proposal - this parameter would've made life so much easier,
and we're start using it "downstream" now. While I understand that of
course the FW should be fixed, meanwhile this is a cheap solution to
allow further debug and real use of the system.

Thanks,


Guilherme
