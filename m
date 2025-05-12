Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856EDAB3988
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 15:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7780D10E40E;
	Mon, 12 May 2025 13:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="eE4mhAz2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D012110E40E;
 Mon, 12 May 2025 13:43:31 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EEFCC40E0241; 
 Mon, 12 May 2025 13:43:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id O_dZuhafoLZV; Mon, 12 May 2025 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1747057405; bh=LUM0TIYK6V7MxGqCziEXETvadDUqaxdImRi2b8LllN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eE4mhAz2TzgI7BSAFJtAYYb+DgMQUtlErUsSY/MIHfGdER1pC/gaFN2Cvcv09VSag
 g3Q5kTVCHN94VPDIWKnc5C5gM60XZPIAP6wxqFich4jCPwSZ3acIMPoAVm7rQtwK0J
 4iujfJ7ZrVfu/gRPZBCwrQM6LU7y8P62jq1lsHZ19MNN7vuxb1HzLzajcSmNPXO+KS
 AUHRRV2qm/vuX9mIHHYhFrF8+efwIOiOyy7rghnC15FEmlHOLgdALvvm1EfQjL8mJc
 8O3Q1E44JToqwmJimBIcWS/s+/dtrkmniG4ewC6MWm6rJ6ixHO885eV9StNI2dtIyI
 GPxJuC+fST9YRFPvQK8lOVzXwMzpxqbhxTOA6FjgDN1a4NarnTXQA1LCaKuv1MKHqG
 YIw/VK+kk7TZYkeU7TqFFCyUE3DZihDSzi+f+P0VM5NdWbHvem+sGwfzKW67MOIUsL
 CJUtddf5RFW4PkVVe/+dLm53hmWX6eiwq8Y1uu6KclsXPEQBKe79kr72/ecVMkacF8
 CnlJLrScOgIXmaw8NtiyFur9QqTzNJAefyfJCc5lXgpU4ATsCG4KJYqJXQsTZob3Sf
 0HCT3wmy7T1TB6591cn/VqHbscbneiph4SFkb2zk9hSTjdDoWthRUHOuFBDAzB49qR
 OThac9YX1W46vvEtAbuyG0Zk=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4F14840E0192;
 Mon, 12 May 2025 13:43:13 +0000 (UTC)
Date: Mon, 12 May 2025 15:43:06 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Lin, Wayne" <Wayne.Lin@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Khatri, Sunil" <Sunil.Khatri@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: amdgpu RENOIR funky complaints in dmesg
Message-ID: <20250512134306.GEaCH66l4S5qKzYpsH@fat_crate.local>
References: <20250512121836.GDaCHnHNjeBwfyV0hh@fat_crate.local>
 <CADnq5_Nq0yzyaYGMHHjjvmZdAAup4PHvvxTLjH9+KbMeeQkneA@mail.gmail.com>
 <CO6PR12MB548999B70BA6108AA111D656FC97A@CO6PR12MB5489.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CO6PR12MB548999B70BA6108AA111D656FC97A@CO6PR12MB5489.namprd12.prod.outlook.com>
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

On Mon, May 12, 2025 at 01:22:01PM +0000, Lin, Wayne wrote:
> It's due to a newly merged patch which adds more logs indicating exceptions
> while doing AUX transactions. These exceptions might be temporary state with
> the DPRx.
> Will give another patch to adjust the log. Sorry for any inconvenience.

No worries. If you want me to test it, lemme know.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
