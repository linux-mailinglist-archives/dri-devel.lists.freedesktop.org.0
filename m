Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BC82AEE8B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 11:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFB289D64;
	Wed, 11 Nov 2020 10:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0576B89D64
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 10:11:56 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ABABmZI013422;
 Wed, 11 Nov 2020 04:11:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605089508;
 bh=ltywXhht6ufNJ4Cvh/un4MkCq4XNdNh93Qgaq7wqRGI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=gmu2FnHvQ+9kEqTkKaZX5zB3DBUkM+qR5sLWjJIUsmfFdQWiGiAuaEq5Q8at9QbDW
 hzURMh1mEORnLS0Inq8dIv073z4QPt7JHzWYgxRCCY0QaxXXLSWA0WyVPqtIPq50lE
 I1XPLVWyOyP1S0o8DUEM14PnPvxK0hA5GkTM1wvo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ABABmKb014502
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Nov 2020 04:11:48 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 11
 Nov 2020 04:11:47 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 11 Nov 2020 04:11:47 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ABABjQM112141;
 Wed, 11 Nov 2020 04:11:45 -0600
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
To: "H. Nikolaus Schaller" <hns@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com>
 <837EA533-9946-43B3-B058-69060EC43981@goldelico.com>
 <08589e51-f5e6-2743-57ec-8ac509f97ff0@ti.com>
 <1f1afce4-c822-0fbf-1ce3-dda0064b65c6@ti.com>
 <67786545-23D2-444F-85B8-7A030070B317@goldelico.com>
 <a20f2b88-bfe6-0ab4-a19b-ba5316db6c4f@ti.com>
 <17F5238B-1CC3-4764-B744-C57D9CE4EB42@goldelico.com>
 <db0b9694-4d04-18ba-fdf0-093b5914bbf0@ti.com>
 <6A9407FC-69F7-4E30-B4A3-FFB2E91CAE3B@goldelico.com>
 <1cf563e5-2dc0-1802-86e3-3e24150f0651@ti.com>
 <BBC7824A-A689-4144-969C-32608A202A75@goldelico.com>
 <7f820fd2-820b-bfdd-a43b-174ad6b09868@ti.com>
 <0AF59BFD-89F2-46D3-9EB6-F47FBB52B183@goldelico.com>
 <AEAA7281-7B82-47A6-A0BA-EF08C56824A8@goldelico.com>
 <917fe1c6-4009-7788-f815-fcc1fc2ba7df@ti.com>
 <2265AEF5-42BC-4E7B-B263-D0B93B78DE91@goldelico.com>
 <dd0a41eb-aa86-7c5c-3151-313a0d9d0883@! ti.com>
 <CA791A57-9B35-42A4-95FD-3792C4F83048@goldelico.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <5bd687c4-fff9-0381-a811-d4019cacf7e9@ti.com>
Date: Wed, 11 Nov 2020 12:11:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA791A57-9B35-42A4-95FD-3792C4F83048@goldelico.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/11/2020 09:48, H. Nikolaus Schaller wrote:
> 
>> Am 11.11.2020 um 07:40 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>>
>> On 10/11/2020 23:04, H. Nikolaus Schaller wrote:
>>>
>>>> Am 10.11.2020 um 17:52 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>>>>
>>>> On 10/11/2020 18:49, H. Nikolaus Schaller wrote:
>>>>
>>>> I guess you have the same issue. It goes to dsi_bridge_mode_valid, then __dsi_calc_config, and stays
>>>> there finding good clocks.
>>>
>>
>> drm_display_mode.clock is in kHz, but the panel driver writes Hz (w677l_PIXELCLOCK) to it.
> 
> Ok, fixing this removes the stuck thread issue. Thanks for pointing this out!
> 
>> But
>> there's more after fixing that. The DSI gets configured in bridge's modeset, which I think is before
>> w677l_prepare where the panel already sends DSI commands. Also, the dsi driver fails to lock the
>> PLL, so possibly the clock calcs are still wrong.
> 
> What I now get is
> 
> [  131.035006] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [CRTC:55:crtc-0] flip_done timed out
> [  141.272174] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [CONNECTOR:54:DSI-1] flip_done timed out
> 
> I think for further experiments we could hack the device tree to compatible = "orisetech,otm8009a";
> and configure for panel-orisetech-otm8009a.ko. Since this panel driver is known to work elsewhere
> we could exclude panel driver issues for the moment. To be safe we can modify otm8009a_dcs_write_buf()
> to just print what it would be doing.

I pushed some quick fixes/hacks to:

git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git 5.11/dsi

At least I get the DSI PLL configured, and kmstest --flip works with 60 fps.
I'm pretty sure the panel won't work yet, though.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
