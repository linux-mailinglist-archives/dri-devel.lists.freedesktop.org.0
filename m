Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D26962CE7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B2910E551;
	Wed, 28 Aug 2024 15:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="OMkBP1Bz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.155.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D0F10E4B5;
 Wed, 28 Aug 2024 15:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1724860033;
 bh=SJgbPbqzc7SahFIo0tT8HzBFaK2pKFosnheCBPu7Z8A=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=OMkBP1BzHq7Nydk+9qgbCnMk/mSPMlQIEdw/yh+p3YeL9DoH0nDbVXSsRJmhLV2V3
 kXZS0VHLXhGM0fk0IlbaNI0vw2qGTFiMJenkiG0AIYcd2S5zYXer0uJVfxtpEbClGF
 3CSTqqfFET7B/Iouom+1WJmbd7RR8nXOychGKP6g=
X-QQ-mid: bizesmtp82t1724860025tr78hzhh
X-QQ-Originating-IP: NBBWYtTDQvWJrkvX2ybfoykKoh0AM7tmnMshH1rKKO0=
Received: from [10.20.53.89] ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 28 Aug 2024 23:47:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11183564941434698686
Message-ID: <D25D5E6FB683DA94+808c82a3-546f-4289-b531-fa24d7278879@uniontech.com>
Date: Wed, 28 Aug 2024 23:47:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] amdgpu: disable amdgpu_dpm on THTF-SW831-1W-DS25_MB board
To: Alex Deucher <alexdeucher@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, lijo.lazar@amd.com,
 mario.limonciello@amd.com, le.ma@amd.com, Jun.Ma2@amd.com,
 hamza.mahfooz@amd.com, andrealmeid@igalia.com, wenlunpeng@uniontech.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, guanwentao@uniontech.com, zhanjun@uniontech.com
References: <3EA7C2B9E8C4D00A+20240828105938.37674-1-wangyuli@uniontech.com>
 <CADnq5_P42A81D_VufAdSkwVwC08ZRiT=6XAS3oHmSH325ygbow@mail.gmail.com>
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <CADnq5_P42A81D_VufAdSkwVwC08ZRiT=6XAS3oHmSH325ygbow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
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


On 2024/8/28 23:30, Alex Deucher wrote:
> On Wed, Aug 28, 2024 at 7:28 AM WangYuli <wangyuli@uniontech.com> wrote:
>
> This will disable dpm on all devices that you might install on this
> platform.  If this is specific to a particular platform and board
> combination, it might be better to check the platform in the
> dpm_init() code for the specific chip that is problematic.
> Additionally, disabling dpm will result in boot clocks which means
> performance will be very low.
>
> Alex

This motherboard model doesn't have combinations with different 
platforms or chipsets now.Their model numbers are unique,so it seems 
unnecessary to add extra judgment.


-- 
WangYuli

