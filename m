Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FA9C2C21E
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 14:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA5D10E3F0;
	Mon,  3 Nov 2025 13:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPq2ln3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050F410E3F5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 13:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762177150; x=1793713150;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=eq/RT7BpjUwhApbhxsKz0hrwz6/owlS+SH51RF5JcfQ=;
 b=mPq2ln3plqLFIfMhoEWLy9y22Ej49xkYvPZTqlmiFoMxO3lX6RD90+W+
 kpSF7+EZkLwSSkVRGzdESq+6G7vJ0JxQeDGWIINZp6DYD2GuQ7W/rcuxx
 rAyJ45YCUQlCh3gRBUTmBfbJfE+UTEwJ8A5HWwPMqS3yL185thiZQvSdb
 uKt2PX3CjlpPi1V00Sd5da3RPPMeFmtq3Bz04cqdBgP8WsLuYC1ZLgAvU
 VFsoM6ozMXZSshDdcNDY75G7yZfW/aTDk2z0w710CquI9JmlD2VHZPcMB
 QCNaeB833LF5Ns+y6DxJaCl/TzqZe2CnphBvzIl1n6jJn8XFkLhpUxSFk A==;
X-CSE-ConnectionGUID: vFiX7CxgSw++UDQ378Jvug==
X-CSE-MsgGUID: qqUhitj2Rj2MMHUhFkUZhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64289554"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="64289554"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 05:39:10 -0800
X-CSE-ConnectionGUID: z2BwnwGEQQW0fwTuZ+/U7A==
X-CSE-MsgGUID: v/5mefj9QA+8SyeCGsGsig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="187325128"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.127])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 05:39:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Christoph Thielecke <christoph.thielecke@gmx.de>, Linus Torvalds
 <torvalds@linux-foundation.org>, Douglas Anderson <dianders@chromium.org>,
 Alex Deucher <alexdeucher@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: drm/edid: Add kernel parameter for override edid check
In-Reply-To: <6209957.lOV4Wx5bFT@precision>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <6209957.lOV4Wx5bFT@precision>
Date: Mon, 03 Nov 2025 15:39:04 +0200
Message-ID: <339fb24ed184567e8bf0810ab70638a852c2e40d@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 03 Nov 2025, Christoph Thielecke <christoph.thielecke@gmx.de> wrote:
> Hello all,
>
>
> I run in the same problem as lot of other people since a longer time.
> The edid reported by my external monitor is no longer accepted and only r=
esolutions up to=20
> 1024x768 are possible (supported by hardware: 1920x1200).
> It seems the kernel drm module gained a strict check of the edid delived =
by the monitor.

Seems like you're referring to something that happened 15+ years
ago. It's not like it's a recent regression, is it?

> The kernel logs shows:
> [    7.172357] [drm] Initialized nouveau 1.4.0 for 0000:01:00.0 on minor 0
> [    7.356212] EDID block 0 (tag 0x00) checksum is invalid, remainder is =
210
> [    7.356220]     [00] BAD  00 ff ff ff ff ff ff 00 a1 ff a0 46 a1 ff a0=
 4a
> [    7.356221]     [00] BAD  d0 ff 01 50 ff ff 20 78 2a 5a d5 a7 56 4b 9b=
 24
> [    7.356222]     [00] BAD  13 50 54 ff 08 00 81 00 81 80 95 00 a9 40 b3=
 00
> [    7.356223]     [00] BAD  8b c0 d0 9b a1 ff a0 9c a1 ff a0 9d a1 ff a0=
 9e
> [    7.356224]     [00] BAD  a1 ff a0 ff ff ff a0 ac a1 ff a0 ad a1 ff a1=
 ff
> [    7.356225]     [00] BAD  50 ff ff 9e a1 ff a0 9f a1 ff a0 a0 a1 ff a0=
 a1
> [    7.356226]     [00] BAD  d0 ff a0 ff a0 ae b0 ff d0 ff ff ff d0 ff ff=
 ff
> [    7.356227]     [00] BAD  a0 ad a1 d0 ff ff 20 50 ff 20 20 50 ff ff 50=
 ff

Simply ignoring the invalid checksum on this EDID will lead to other
problems. The EDID claims to have 0x50 extension blocks. That's bogus,
as normally you have 0-3. There are limits to how much garbage you can
accept and pretend it's all fine.

> [    7.356232] nouveau 0000:01:00.0: drm: DDC responded, but no EDID for =
VGA-1
>
>
> (the monitor is a 24=E2=80=9D Yuraku MB24WKH, product number: Yur.Vision =
YV24WBH1)
>
>
> After seaching the net, I found that a lot of people have this problem.
>
>
> It would be nice to have a new kernel parameter of the drm module as prop=
osed by Alex=20
> called "edid_strict" (https://lists.freedesktop.org/archives/dri-devel/20=
11-January/
> 006778.html[1]). Set the param to =E2=80=9C0=E2=80=9D will disable the ch=
eck and let accept the edid=20
> reported by the monitor.

That suggestion too is very old. I think over the years the mentality
towards module parameters has changed considerably. Requiring users to
set a module parameter is not a fix.

> The only workaround to get the higher resolution working is to provide a =
edid firmware=20
> file using the parameter =E2=80=9Cedid_firmware=E2=80=9D. This needs to b=
e created manually and build into=20
> the initrd to be available early at runtime.
> I think the workaround isn=E2=80=99t very user friendly.
> Putting a flag to disable the edid strict check would help more people ge=
t their moditors=20
> more easy runnning by their own responsibilty.
>
>
> At a later time I think a solution for controlling the edid check at runt=
ime should be made=20
> possible, so that desktop environmens like KDE can implement an manually =
override by=20
> specifying a firmware file or disable the the edid check.

I think generally the solution would be a quirk, but we don't really
have a mechanism to identify displays based on half-read EDIDs. Chicken
and egg.

And then there's the problem that it's not just the checksum that
appears to be wrong here. The workaround pretty much is the edid
firmware option.

> References:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/712075[2]
> https://lists.freedesktop.org/archives/dri-devel/2011-January/006778.html=
[1]
>
>
> Monitor edid:
> monitor-get-edid | hexdump=20=20
> 0000000 ff00 ffff ffff 00ff e430 025a 0000 0000=20
> 0000010 1300 0401 2595 7817 4402 9c75 5459 2796=20
> 0000020 5023 0054 0000 0101 0101 0101 0101 0101=20
> 0000030 0101 0101 0101 37c8 6480 b070 400f 2022=20
> 0000040 0036 e672 0010 1a00 283c a080 b070 4023=20
> 0000050 2030 0036 e672 0010 1a00 0000 fe00 4800=20
> 0000060 3830 5236 3182 3137 5557 0a37 0000 0000=20
> 0000070 0000 3141 001e 0000 0600 0a01 2020 2300=20
> 0000080=20

This is not the same EDID as you list above. This one actually has the
correct checksum. I don't know monitor-get-edid nor monitor-parse-edid,
where are they from?


BR,
Jani.

>
> monitor-get-edid | monitor-parse-edid=20
> EISA ID: LGD025a=20
> EDID version: 1.4=20
> EDID extension blocks: 0=20
> Screen size: 37.0 cm x 23.0 cm (17.15 inches, aspect ratio 16/10 =3D 1.61=
)=20
> Gamma: 2.2=20
> Digital signal=20
>
>        # Monitor preferred modeline (58.2 Hz vsync, 70.7 kHz hsync, ratio=
 16/10, 131 dpi)=20
>        ModeLine "1920x1200" 142.8 1920 1954 1986 2020 1200 1203 1209 1215=
 -hsync=20
> +vsync=20
>
>        # Monitor supported modeline (40.1 Hz vsync, 49.5 kHz hsync, ratio=
 16/10, 131 dpi)=20
>        ModeLine "1920x1200" 103 1920 1968 2000 2080 1200 1203 1209 1235 -=
hsync +vsync
>
>
>
> With best regards
>
>
> Christoph
> --
>
>
>
> --------
> [1] https://lists.freedesktop.org/archives/dri-devel/2011-January/006778.=
html
> [2] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/712075

--=20
Jani Nikula, Intel
