Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKXgB+BuemlI6QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 21:17:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD5AA86A8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 21:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CCD10E767;
	Wed, 28 Jan 2026 20:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d+CLmayl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50E010E20C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 20:17:30 +0000 (UTC)
Received: by mail-dl1-f44.google.com with SMTP id
 a92af1059eb24-124a7216c9cso21757c88.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 12:17:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769631450; cv=none;
 d=google.com; s=arc-20240605;
 b=kJkPhv4OnV4qtC7NXADQwJ+neL1ol5dBU8HoSjHY6ib9csBG0ELtqFini3Qy2Mzms1
 j+hLjmY9ANVJUuyhu7mZgu++p1W9+4iqeA3lqa7Ye3p/daoJT7/RXwQo2jnxfhY9FI/4
 aAcSEhN2lLfTVJI+HR1jFulqXBFT2YDCuIafPDmrMKOCwrD5/MwJGjxRX4mBoiakjTLa
 9Deptng7sRCgWWUBwMvgWPC0bWC38obqbf2sTGZSq20zQLoAEyo+chETFdohY4BjW1PU
 urgU6IAN1B3/+6v7wtcdsvdzh0epHUSAhieeJPRknKf/EfDyXzkW7NkL1KGS1XXtgI9n
 ASlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=xrGQay6nsSQPdFOjcgmMh48gL9qeXglFQ391llRMDBM=;
 fh=VXr6AuKjYgKCrRf5xXOjBcN0csd8wZ+Kv8wyLCnHXwk=;
 b=bkYKQUxvdCP31/kuwY8GL+FRMT69Obl4LTbBKqqTJHTUhQlbo3PpZzu8iaos/adPsy
 VpFLowf7OoPDnmYKqIMRj7bzKZ6O6suPsgb5lIE/bu466XdNTHdGzhhHlTmtPFYfk1+l
 ltyfyCoB8pkYzF5GK8JcmrsP3NqyjumvdE6xVEocgqBR9O5Lf+EFCL/b1jPn5v0NUm4p
 oG1FREveG6IjD94HoX3UhJZzck9zYvNy9VRGXabvbzttYsSGkLcKI2YU01wNcKTrzp+Q
 o5n8ZHS/vM9BaiHXlWQlIRpPYz9FY2y062iotcsZtTUkFXKMJQ6NGpM2cftZv/Oo7i3j
 wLMQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769631450; x=1770236250; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xrGQay6nsSQPdFOjcgmMh48gL9qeXglFQ391llRMDBM=;
 b=d+CLmaylksoinFEXQ/Qt3JfGGCBKEy6ieIc7sywUMFyC/hdnpqzz2/SGhylakPdPVu
 wuxFVVO0NbxQctDSKh/tdd3nuf/2b/uSFdTS3PikUlty0KlIq5bkuIo+n/b2OcyqOu8W
 CkV58j175PN507oYqy+RtzAG1goIyBZiuewdSFHyLEzKPdRU0czQmzA/ZRsVU/D3gYAD
 U4/Cc82vMNYULsRsqOgPdaNgTZn9mQcwIsjctkmTEySmElG+3J0EF75KgNlhgqI5GTaU
 nufiq8ZeGHZgnf+WTEMKZP9ktt5z/IHLq8vbx2SGrixmw/Sv1gRe99TQ6Ys5nlWt4uTP
 RkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769631450; x=1770236250;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xrGQay6nsSQPdFOjcgmMh48gL9qeXglFQ391llRMDBM=;
 b=Lqagqv0v6vDCuT/jUoGMysw+1ZZHNcIamoqbYeeMuWC7cYlezLq1v9uMveVL6DPV9s
 n1NfMnlSPtm2MCuXLuVUAxkHHiTgMEbHyNgGmbWmcYU5m3lOLCxCqJda3rGFv3fEDiE4
 ubyWoDFYWpNVHEBfVSCTQHrt4yuMNj0Q5kZqRh1vAJeQJBi+jdLbrvjTbLI0tqmuI0wq
 2+FVTNgY3YbW4z9ZcLYYRpZeH48/NoraF5ilqKN2y/zeJ3qeWaI/M4wFntrYIVqK14bK
 US/koo7zu8HTlLb2YtsCrRYzUUKPtdUSKIrzwpr7H3w8Eq8th0d/N1kQH+EXX+umNJWs
 mptw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeleeFYuvUPQMmXSmPL+XnrluJIOWhZYkoHOe4plRFdom5I6ViBvamWqQ6yRtg1qaincmOLb9xrJE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAatHk70eoJoteJ+/JZVu869hgCKhrD8i6DHn0SjkV4Qf+vb9x
 rc+NOhYm09DsLUn2bjO6doCQ4F7R2sdAqffGt7dU2JN7F7VcuQgup4CXYU48OC+kGP8frfmfJLZ
 zBKRSqt4foLS21uw2VMCBJywib2Xfl1s=
X-Gm-Gg: AZuq6aL048W9fvv/fyNn2vvJwnLUSMuyCBbrCa2eYT/5drlgYsZx15Iaeu7gOAg0uJv
 Y0kVCXzJ2f/KNJ0mcJod9QvNRfUgvFTROpijFUYkIzmUsqPsra+5bdXhND5W9di5tDky5LYm1d2
 fLEOLJ6Q7Kertslz0osBEV7zakWbuwDvMj+D0kewpuUrE6DCCeZsUsyABRrn9gMvF2XuyC+sQWU
 3Ozesg3e/7kWsEbxOBdytKScPbpdQOtl6TqTqYS4vTV99Y4h3JnAEEl07R/OyyafJ312LvH
X-Received: by 2002:a05:7300:3206:b0:2ae:5bd5:c241 with SMTP id
 5a478bee46e88-2b7af7b8fc9mr393364eec.7.1769631449880; Wed, 28 Jan 2026
 12:17:29 -0800 (PST)
MIME-Version: 1.0
References: <aXptBPF3L07zJB1O@earendel>
In-Reply-To: <aXptBPF3L07zJB1O@earendel>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 Jan 2026 15:17:18 -0500
X-Gm-Features: AZwV_QjMUVEUN8BSFXcLOXLYeS1GVfA8tYWmapthDqOo4Luz7ATJ6Hkmj2w_OO0
Message-ID: <CADnq5_OqFEi_ML9zR-i_WFtFmBBQQcbQNRAiP8pVdD+prvEoiQ@mail.gmail.com>
Subject: Re: [REGRESSION] drm/amd/display: Add an hdmi_hpd_debounce_delay_ms
 module
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, Ivan Lipski <ivan.lipski@amd.com>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 regressions@lists.linux.dev, "Mario Limonciello (AMD)" <superm1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:ivan.lipski@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,m:superm1@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BDD5AA86A8
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 3:09=E2=80=AFPM Peter Colberg <pcolberg@redhat.com>=
 wrote:
>
> Hi,
>
> I hit a regression introduced as part of v6.19-rc6 (and still present
> in v6.19-rc7), where, upon unloading the amdgpu module, __flush_work()
> is passed a work struct with the work function set to NULL. The issue
> is seen with an AMD Radeon Pro W7900, but not an AMD Instinct MI210.

I think this should be fixed in:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/17b2c526fd8026d8e0f4c0e=
7f94fc517e3901589

Alex

>
> #regzbot introduced: d04f73668bebbc5a44a2771ea92b6ec253148050
>
>     4231 static bool __flush_work(struct work_struct *work, bool from_can=
cel)
>     4232 {
>     4233         struct wq_barrier barr;
>     4234
>     4235         if (WARN_ON(!wq_online))
>     4236                 return false;
>     4237
> --> 4238         if (WARN_ON(!work->func))
>     4239                 return false;
>
> Tests were carried out on an AMD Radeon Pro W7900 with a mainline
> kernel compiled and booted with an up-to-date CentOS Stream 10 x86_64
> and amdgpu firmware commit 993573ac3dc6ab038505c2639701db22f6142487.
>
> % cp /lib/modules/6.12.0-191.el10.x86_64/config .config
> % scripts/config --enable LOCALVERSION_AUTO
> % scripts/config --disable EFI_SBAT_FILE
> % scripts/config --disable SECURITY_LOCKDOWN_LSM
> % scripts/config --disable MODULE_SIG
> % make olddefconfig
> % make -j $(nproc) binrpm-pkg
>
> The first test exercises commit d04f73668beb which introduced the
> regression, the second test b2426a211dba prior to the regression.
>
> # dmesg --follow-new &
> # cat /proc/cmdline
> BOOT_IMAGE=3D(hd0,gpt2)/boot/ostree/default-8a8985bdb88376ac62c94e787be00=
dea13130a3b5e56e8598bd96b4cf7eaac4c/vmlinuz-6.19.0-rc5-00016-gd04f73668beb =
root=3D/dev/mapper/rhel-root rd.lvm.lv=3Drhel/root rd.lvm.lv=3Drhel/swap rw=
 boot=3DUUID=3D9c458207-c078-4fcf-bb4c-679ae1a3ae9f ostree=3D/ostree/boot.0=
/default/8a8985bdb88376ac62c94e787be00dea13130a3b5e56e8598bd96b4cf7eaac4c/0=
 "dyndbg=3Dfile drivers/base/firmware_loader/main.c +fmp"
> # rmmod amdgpu
> [   77.410012] [drm] PCIE GART of 512M enabled (table at 0x00000080003000=
00).
> [   77.410074] amdgpu 0000:83:00.0: amdgpu: PSP is resuming...
> [   77.473976] amdgpu 0000:83:00.0: amdgpu: reserve 0x1300000 from 0x8b3c=
000000 for PSP TMR
> [   77.617936] amdgpu 0000:83:00.0: amdgpu: GECC is currently enabled, wh=
ich may affect performance
> [   77.617941] amdgpu 0000:83:00.0: amdgpu: To disable GECC, please reboo=
t the system and load the amdgpu driver with the parameter amdgpu_ras_enabl=
e=3D0
> [   77.634803] amdgpu 0000:83:00.0: amdgpu: RAP: optional rap ta ucode is=
 not available
> [   77.634808] amdgpu 0000:83:00.0: amdgpu: SECUREDISPLAY: optional secur=
edisplay ta ucode is not available
> [   77.634813] amdgpu 0000:83:00.0: amdgpu: SMU is resuming...
> [   77.634818] amdgpu 0000:83:00.0: amdgpu: smu driver if version =3D 0x0=
000003d, smu fw if version =3D 0x00000040, smu fw program =3D 0, smu fw ver=
sion =3D 0x004e8300 (78.131.0)
> [   77.634825] amdgpu 0000:83:00.0: amdgpu: SMU driver if version not mat=
ched
> [   77.779854] amdgpu 0000:83:00.0: amdgpu: SMU is resumed successfully!
> [   77.789735] amdgpu 0000:83:00.0: amdgpu: [drm] DMUB hardware initializ=
ed: version=3D0x07002F00
> [   77.795903] amdgpu 0000:83:00.0: [drm] Cannot find any crtc or sizes
> [   77.795913] amdgpu 0000:83:00.0: amdgpu: ring gfx_0.0.0 uses VM inv en=
g 0 on hub 0
> [   77.795917] amdgpu 0000:83:00.0: amdgpu: ring comp_1.0.0 uses VM inv e=
ng 1 on hub 0
> [   77.795921] amdgpu 0000:83:00.0: amdgpu: ring comp_1.1.0 uses VM inv e=
ng 4 on hub 0
> [   77.795924] amdgpu 0000:83:00.0: amdgpu: ring comp_1.2.0 uses VM inv e=
ng 6 on hub 0
> [   77.795927] amdgpu 0000:83:00.0: amdgpu: ring comp_1.3.0 uses VM inv e=
ng 7 on hub 0
> [   77.795930] amdgpu 0000:83:00.0: amdgpu: ring comp_1.0.1 uses VM inv e=
ng 8 on hub 0
> [   77.795933] amdgpu 0000:83:00.0: amdgpu: ring comp_1.1.1 uses VM inv e=
ng 9 on hub 0
> [   77.795937] amdgpu 0000:83:00.0: amdgpu: ring comp_1.2.1 uses VM inv e=
ng 10 on hub 0
> [   77.795940] amdgpu 0000:83:00.0: amdgpu: ring comp_1.3.1 uses VM inv e=
ng 11 on hub 0
> [   77.795943] amdgpu 0000:83:00.0: amdgpu: ring sdma0 uses VM inv eng 12=
 on hub 0
> [   77.795946] amdgpu 0000:83:00.0: amdgpu: ring sdma1 uses VM inv eng 13=
 on hub 0
> [   77.795954] amdgpu 0000:83:00.0: amdgpu: ring vcn_unified_0 uses VM in=
v eng 0 on hub 8
> [   77.795958] amdgpu 0000:83:00.0: amdgpu: ring vcn_unified_1 uses VM in=
v eng 1 on hub 8
> [   77.795961] amdgpu 0000:83:00.0: amdgpu: ring jpeg_dec uses VM inv eng=
 4 on hub 8
> [   77.795965] amdgpu 0000:83:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM in=
v eng 14 on hub 0
> [   77.798920] amdgpu 0000:83:00.0: [drm] Cannot find any crtc or sizes
> [   77.835746] amdgpu 0000:83:00.0: amdgpu: amdgpu: finishing device.
> [   77.934047] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_mes1.bin devm-00000000729a84e2 re=
leased
> [   77.934052] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_mes_2.bin devm-000000008a601096 r=
eleased
> [   77.934054] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/vcn_4_0_0.bin devm-00000000ce1dfe25 release=
d
> [   77.934055] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/sdma_6_0_0.bin devm-00000000f4c59a6f releas=
ed
> [   77.934057] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_imu.bin devm-000000000fe0df50 rel=
eased
> [   77.934059] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_mec.bin devm-000000006b38a3b2 rel=
eased
> [   77.934061] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_rlc.bin devm-000000004a747642 rel=
eased
> [   77.934064] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_me.bin devm-000000002ce74390 rele=
ased
> [   77.934066] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_pfp.bin devm-00000000b0e91c69 rel=
eased
> [   77.934068] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/dcn_3_2_0_dmcub.bin devm-000000000b75c19c r=
eleased
> [   77.934069] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/smu_13_0_0.bin devm-000000001ab5d2f3 releas=
ed
> [   77.934071] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/psp_13_0_0_ta.bin devm-00000000a37398c2 rel=
eased
> [   77.934072] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/psp_13_0_0_sos.bin devm-0000000027208a82 re=
leased
> [   77.934078] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_mes_2.bin fw_priv=3D000000004a41fbe6 data=3D000000=
002a21f503 size=3D257344
> [   77.934090] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_mes1.bin fw_priv=3D000000004f12a566 data=3D0000000=
0c562adda size=3D218240
> [   77.934117] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/vcn_4_0_0.bin fw_priv=3D00000000bf93c3ab data=3D000000003ba7=
47fe size=3D403856
> [   77.934137] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/sdma_6_0_0.bin fw_priv=3D000000006a092a88 data=3D00000000007=
c1a01 size=3D34560
> [   77.934167] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_pfp.bin fw_priv=3D00000000b86bbe6d data=3D00000000=
f13777ad size=3D231008
> [   77.934175] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_me.bin fw_priv=3D00000000493fdf17 data=3D00000000a=
fc5401f size=3D314512
> [   77.934189] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_rlc.bin fw_priv=3D0000000035fafe96 data=3D00000000=
ab68b2da size=3D185376
> [   77.934199] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_mec.bin fw_priv=3D00000000293ce4de data=3D00000000=
0eb1a171 size=3D406528
> [   77.934213] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/dcn_3_2_0_dmcub.bin fw_priv=3D00000000c705cc78 data=3D000000=
00f530b58b size=3D284432
> [   77.934228] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/smu_13_0_0.bin fw_priv=3D00000000c876ab3e data=3D000000003f0=
5626c size=3D292452
> [   77.934238] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/psp_13_0_0_sos.bin fw_priv=3D00000000c877aa90 data=3D0000000=
0f123f702 size=3D268304
> [   77.934249] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/psp_13_0_0_ta.bin fw_priv=3D00000000886845ff data=3D00000000=
466f9c99 size=3D267520
> [   77.934639] amdgpu 0000:83:00.0: amdgpu: amdgpu: ttm finalized
> [   77.935587] ------------[ cut here ]------------
> [   77.935592] WARNING: kernel/workqueue.c:4238 at __flush_work+0x338/0x3=
50, CPU#31: kworker/31:0/207
> [   77.935603] Modules linked in: snd_hda_codec_alc662 snd_hda_codec_real=
tek_lib snd_hda_codec_generic amdgpu(-) snd_hda_codec_atihdmi snd_hda_codec=
_hdmi mt7921e amdxcp drm_panel_backlight_quirks mt7921_common snd_hda_intel=
 drm_ttm_helper mt792x_lib snd_usb_audio amd_atl intel_rapl_msr ttm snd_hda=
_codec mt76_connac_lib snd_usbmidi_lib intel_rapl_common i2c_algo_bit snd_u=
mp drm_suballoc_helper snd_hda_core mt76 snd_rawmidi amd64_edac gpu_sched s=
nd_intel_dspcfg edac_mce_amd snd_intel_sdw_acpi btusb drm_exec mc snd_hwdep=
 btrtl drm_buddy snd_seq btintel drm_display_helper btbcm mac80211 snd_seq_=
device kvm_amd btmtk cec think_lmi kvm video snd_pcm irqbypass firmware_att=
ributes_class wmi_bmof bluetooth rapl cfg80211 snd_timer pcspkr crc16 snd i=
2c_piix4 rfkill k10temp soundcore i2c_smbus libarc4 gpio_amdpt gpio_generic=
 i2c_designware_platform i2c_designware_core loop overlay erofs xfs nvme_tc=
p nvme_fabrics nvme nvme_core nvme_keyring ahci nvme_auth libahci ghash_clm=
ulni_intel hkdf r8169 atlantic ccp libata sp5100_tco realtek
> [   77.935687]  macsec wmi sunrpc dm_mirror dm_region_hash dm_log dm_mod =
fuse nfnetlink
> [   77.935731] CPU: 31 UID: 0 PID: 207 Comm: kworker/31:0 Not tainted 6.1=
9.0-rc5-00016-gd04f73668beb #1 PREEMPT(voluntary)
> [   77.935744] Workqueue: events drm_connector_free_work_fn
> [   77.935751] RIP: 0010:__flush_work+0x338/0x350
> [   77.935756] Code: 3e 46 06 00 65 48 8b 15 2e e4 e3 02 48 85 db 48 8b 0=
4 24 48 89 54 24 48 0f 85 e6 fe ff ff e9 fe fd ff ff 0f 0b e9 77 ff ff ff <=
0f> 0b e9 70 ff ff ff 0f 0b e9 19 ff ff ff e8 15 22 d9 00 0f 1f 44
> [   77.935765] RSP: 0018:ff57cb59c0b7bd68 EFLAGS: 00010246
> [   77.935770] RAX: 0000000000000000 RBX: ff2d8e14daf8d480 RCX: 000000000=
0000000
> [   77.935775] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ff57cb59c=
0b7bdb8
> [   77.935779] RBP: ff2d8e14daf8d480 R08: ff2d8e14a1a86420 R09: 000000000=
02a001f
> [   77.935783] R10: ff2d8e14a1a86401 R11: ff2d8e14a1a86f60 R12: ff2d8e159=
2180010
> [   77.935788] R13: ff57cb59c0b7bd70 R14: 0000000000000001 R15: 000000000=
0000000
> [   77.935792] FS:  0000000000000000(0000) GS:ff2d8e3396243000(0000) knlG=
S:0000000000000000
> [   77.935797] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   77.935801] CR2: 000055f1cff22050 CR3: 0000000112666002 CR4: 000000000=
0f71ef0
> [   77.935806] PKRU: 55555554
> [   77.935809] Call Trace:
> [   77.935812]  <TASK>
> [   77.935818]  cancel_delayed_work_sync+0x5e/0x80
> [   77.935823]  amdgpu_dm_connector_destroy+0x33/0xe0 [amdgpu]
> [   77.936146]  drm_connector_free_work_fn+0x72/0x90
> [   77.936152]  process_one_work+0x18b/0x340
> [   77.936157]  worker_thread+0x256/0x3a0
> [   77.936162]  ? __pfx_worker_thread+0x10/0x10
> [   77.936166]  kthread+0xfc/0x240
> [   77.936171]  ? __pfx_kthread+0x10/0x10
> [   77.936175]  ? __pfx_kthread+0x10/0x10
> [   77.936180]  ret_from_fork+0x121/0x190
> [   77.936186]  ? __pfx_kthread+0x10/0x10
> [   77.936190]  ret_from_fork_asm+0x1a/0x30
> [   77.936198]  </TASK>
> [   77.936201] ---[ end trace 0000000000000000 ]---
> [   77.936210] ------------[ cut here ]------------
> [   77.936214] WARNING: kernel/workqueue.c:4238 at __flush_work+0x338/0x3=
50, CPU#31: kworker/31:0/207
> [   77.936221] Modules linked in: snd_hda_codec_alc662 snd_hda_codec_real=
tek_lib snd_hda_codec_generic amdgpu(-) snd_hda_codec_atihdmi snd_hda_codec=
_hdmi mt7921e amdxcp drm_panel_backlight_quirks mt7921_common snd_hda_intel=
 drm_ttm_helper mt792x_lib snd_usb_audio amd_atl intel_rapl_msr ttm snd_hda=
_codec mt76_connac_lib snd_usbmidi_lib intel_rapl_common i2c_algo_bit snd_u=
mp drm_suballoc_helper snd_hda_core mt76 snd_rawmidi amd64_edac gpu_sched s=
nd_intel_dspcfg edac_mce_amd snd_intel_sdw_acpi btusb drm_exec mc snd_hwdep=
 btrtl drm_buddy snd_seq btintel drm_display_helper btbcm mac80211 snd_seq_=
device kvm_amd btmtk cec think_lmi kvm video snd_pcm irqbypass firmware_att=
ributes_class wmi_bmof bluetooth rapl cfg80211 snd_timer pcspkr crc16 snd i=
2c_piix4 rfkill k10temp soundcore i2c_smbus libarc4 gpio_amdpt gpio_generic=
 i2c_designware_platform i2c_designware_core loop overlay erofs xfs nvme_tc=
p nvme_fabrics nvme nvme_core nvme_keyring ahci nvme_auth libahci ghash_clm=
ulni_intel hkdf r8169 atlantic ccp libata sp5100_tco realtek
> [   77.936292]  macsec wmi sunrpc dm_mirror dm_region_hash dm_log dm_mod =
fuse nfnetlink
> [   77.936331] CPU: 31 UID: 0 PID: 207 Comm: kworker/31:0 Tainted: G     =
   W           6.19.0-rc5-00016-gd04f73668beb #1 PREEMPT(voluntary)
> [   77.936337] Tainted: [W]=3DWARN
> [   77.936342] Workqueue: events drm_connector_free_work_fn
> [   77.936346] RIP: 0010:__flush_work+0x338/0x350
> [   77.936350] Code: 3e 46 06 00 65 48 8b 15 2e e4 e3 02 48 85 db 48 8b 0=
4 24 48 89 54 24 48 0f 85 e6 fe ff ff e9 fe fd ff ff 0f 0b e9 77 ff ff ff <=
0f> 0b e9 70 ff ff ff 0f 0b e9 19 ff ff ff e8 15 22 d9 00 0f 1f 44
> [   77.936357] RSP: 0018:ff57cb59c0b7bd68 EFLAGS: 00010246
> [   77.936360] RAX: 0000000000000000 RBX: ff2d8e1492153480 RCX: 000000000=
0000000
> [   77.936363] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ff57cb59c=
0b7bdb8
> [   77.936366] RBP: ff2d8e1492153480 R08: ff2d8e14a1a861e0 R09: 000000000=
02a001e
> [   77.936369] R10: ff2d8e14a1a86101 R11: ff2d8e14a1a86420 R12: ff2d8e159=
2180010
> [   77.936373] R13: ff57cb59c0b7bd70 R14: 0000000000000001 R15: 000000000=
0000000
> [   77.936376] FS:  0000000000000000(0000) GS:ff2d8e3396243000(0000) knlG=
S:0000000000000000
> [   77.936379] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   77.936382] CR2: 000055f1cff22050 CR3: 0000000112666002 CR4: 000000000=
0f71ef0
> [   77.936386] PKRU: 55555554
> [   77.936388] Call Trace:
> [   77.936390]  <TASK>
> [   77.936393]  cancel_delayed_work_sync+0x5e/0x80
> [   77.936397]  amdgpu_dm_connector_destroy+0x33/0xe0 [amdgpu]
> [   77.936613]  drm_connector_free_work_fn+0x72/0x90
> [   77.936617]  process_one_work+0x18b/0x340
> [   77.936621]  worker_thread+0x256/0x3a0
> [   77.936624]  ? __pfx_worker_thread+0x10/0x10
> [   77.936627]  kthread+0xfc/0x240
> [   77.936630]  ? __pfx_kthread+0x10/0x10
> [   77.936634]  ? __pfx_kthread+0x10/0x10
> [   77.936637]  ret_from_fork+0x121/0x190
> [   77.936640]  ? __pfx_kthread+0x10/0x10
> [   77.936643]  ret_from_fork_asm+0x1a/0x30
> [   77.936649]  </TASK>
> [   77.936651] ---[ end trace 0000000000000000 ]---
> [   77.936658] ------------[ cut here ]------------
> [   77.936661] WARNING: kernel/workqueue.c:4238 at __flush_work+0x338/0x3=
50, CPU#31: kworker/31:0/207
> [   77.936666] Modules linked in: snd_hda_codec_alc662 snd_hda_codec_real=
tek_lib snd_hda_codec_generic amdgpu(-) snd_hda_codec_atihdmi snd_hda_codec=
_hdmi mt7921e amdxcp drm_panel_backlight_quirks mt7921_common snd_hda_intel=
 drm_ttm_helper mt792x_lib snd_usb_audio amd_atl intel_rapl_msr ttm snd_hda=
_codec mt76_connac_lib snd_usbmidi_lib intel_rapl_common i2c_algo_bit snd_u=
mp drm_suballoc_helper snd_hda_core mt76 snd_rawmidi amd64_edac gpu_sched s=
nd_intel_dspcfg edac_mce_amd snd_intel_sdw_acpi btusb drm_exec mc snd_hwdep=
 btrtl drm_buddy snd_seq btintel drm_display_helper btbcm mac80211 snd_seq_=
device kvm_amd btmtk cec think_lmi kvm video snd_pcm irqbypass firmware_att=
ributes_class wmi_bmof bluetooth rapl cfg80211 snd_timer pcspkr crc16 snd i=
2c_piix4 rfkill k10temp soundcore i2c_smbus libarc4 gpio_amdpt gpio_generic=
 i2c_designware_platform i2c_designware_core loop overlay erofs xfs nvme_tc=
p nvme_fabrics nvme nvme_core nvme_keyring ahci nvme_auth libahci ghash_clm=
ulni_intel hkdf r8169 atlantic ccp libata sp5100_tco realtek
> [   77.936718]  macsec wmi sunrpc dm_mirror dm_region_hash dm_log dm_mod =
fuse nfnetlink
> [   77.936751] CPU: 31 UID: 0 PID: 207 Comm: kworker/31:0 Tainted: G     =
   W           6.19.0-rc5-00016-gd04f73668beb #1 PREEMPT(voluntary)
> [   77.936757] Tainted: [W]=3DWARN
> [   77.936762] Workqueue: events drm_connector_free_work_fn
> [   77.936766] RIP: 0010:__flush_work+0x338/0x350
> [   77.936769] Code: 3e 46 06 00 65 48 8b 15 2e e4 e3 02 48 85 db 48 8b 0=
4 24 48 89 54 24 48 0f 85 e6 fe ff ff e9 fe fd ff ff 0f 0b e9 77 ff ff ff <=
0f> 0b e9 70 ff ff ff 0f 0b e9 19 ff ff ff e8 15 22 d9 00 0f 1f 44
> [   77.936776] RSP: 0018:ff57cb59c0b7bd68 EFLAGS: 00010246
> [   77.936779] RAX: 0000000000000000 RBX: ff2d8e1492151480 RCX: 000000000=
0000000
> [   77.936782] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ff57cb59c=
0b7bdb8
> [   77.936785] RBP: ff2d8e1492151480 R08: ff2d8e14a1a860c0 R09: 000000000=
02a001d
> [   77.936788] R10: ff2d8e14a1a86001 R11: ff2d8e14a1a861e0 R12: ff2d8e159=
2180010
> [   77.936791] R13: ff57cb59c0b7bd70 R14: 0000000000000001 R15: 000000000=
0000000
> [   77.936795] FS:  0000000000000000(0000) GS:ff2d8e3396243000(0000) knlG=
S:0000000000000000
> [   77.936798] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   77.936801] CR2: 000055f1cff22050 CR3: 0000000112666002 CR4: 000000000=
0f71ef0
> [   77.936804] PKRU: 55555554
> [   77.936806] Call Trace:
> [   77.936808]  <TASK>
> [   77.936812]  cancel_delayed_work_sync+0x5e/0x80
> [   77.936815]  amdgpu_dm_connector_destroy+0x33/0xe0 [amdgpu]
> [   77.937015]  drm_connector_free_work_fn+0x72/0x90
> [   77.937020]  process_one_work+0x18b/0x340
> [   77.937025]  worker_thread+0x256/0x3a0
> [   77.937029]  ? __pfx_worker_thread+0x10/0x10
> [   77.937034]  kthread+0xfc/0x240
> [   77.937038]  ? __pfx_kthread+0x10/0x10
> [   77.937042]  ? __pfx_kthread+0x10/0x10
> [   77.937047]  ret_from_fork+0x121/0x190
> [   77.937051]  ? __pfx_kthread+0x10/0x10
> [   77.937056]  ret_from_fork_asm+0x1a/0x30
> [   77.937063]  </TASK>
> [   77.937065] ---[ end trace 0000000000000000 ]---
> [   77.937074] ------------[ cut here ]------------
> [   77.937077] WARNING: kernel/workqueue.c:4238 at __flush_work+0x338/0x3=
50, CPU#31: kworker/31:0/207
> [   77.937084] Modules linked in: snd_hda_codec_alc662 snd_hda_codec_real=
tek_lib snd_hda_codec_generic amdgpu(-) snd_hda_codec_atihdmi snd_hda_codec=
_hdmi mt7921e amdxcp drm_panel_backlight_quirks mt7921_common snd_hda_intel=
 drm_ttm_helper mt792x_lib snd_usb_audio amd_atl intel_rapl_msr ttm snd_hda=
_codec mt76_connac_lib snd_usbmidi_lib intel_rapl_common i2c_algo_bit snd_u=
mp drm_suballoc_helper snd_hda_core mt76 snd_rawmidi amd64_edac gpu_sched s=
nd_intel_dspcfg edac_mce_amd snd_intel_sdw_acpi btusb drm_exec mc snd_hwdep=
 btrtl drm_buddy snd_seq btintel drm_display_helper btbcm mac80211 snd_seq_=
device kvm_amd btmtk cec think_lmi kvm video snd_pcm irqbypass firmware_att=
ributes_class wmi_bmof bluetooth rapl cfg80211 snd_timer pcspkr crc16 snd i=
2c_piix4 rfkill k10temp soundcore i2c_smbus libarc4 gpio_amdpt gpio_generic=
 i2c_designware_platform i2c_designware_core loop overlay erofs xfs nvme_tc=
p nvme_fabrics nvme nvme_core nvme_keyring ahci nvme_auth libahci ghash_clm=
ulni_intel hkdf r8169 atlantic ccp libata sp5100_tco realtek
> [   77.937154]  macsec wmi sunrpc dm_mirror dm_region_hash dm_log dm_mod =
fuse nfnetlink
> [   77.937197] CPU: 31 UID: 0 PID: 207 Comm: kworker/31:0 Tainted: G     =
   W           6.19.0-rc5-00016-gd04f73668beb #1 PREEMPT(voluntary)
> [   77.937204] Tainted: [W]=3DWARN
> [   77.937211] Workqueue: events drm_connector_free_work_fn
> [   77.937216] RIP: 0010:__flush_work+0x338/0x350
> [   77.937221] Code: 3e 46 06 00 65 48 8b 15 2e e4 e3 02 48 85 db 48 8b 0=
4 24 48 89 54 24 48 0f 85 e6 fe ff ff e9 fe fd ff ff 0f 0b e9 77 ff ff ff <=
0f> 0b e9 70 ff ff ff 0f 0b e9 19 ff ff ff e8 15 22 d9 00 0f 1f 44
> [   77.937229] RSP: 0018:ff57cb59c0b7bd68 EFLAGS: 00010246
> [   77.937234] RAX: 0000000000000000 RBX: ff2d8e1492155480 RCX: 000000000=
0000000
> [   77.937238] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ff57cb59c=
0b7bdb8
> [   77.937242] RBP: ff2d8e1492155480 R08: ff2d8e14836abf00 R09: 000000000=
02a0026
> [   77.937246] R10: ff2d8e14836abf01 R11: ff2d8e14836abcc0 R12: ff2d8e159=
2180010
> [   77.937251] R13: ff57cb59c0b7bd70 R14: 0000000000000001 R15: 000000000=
0000000
> [   77.937255] FS:  0000000000000000(0000) GS:ff2d8e3396243000(0000) knlG=
S:0000000000000000
> [   77.937260] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   77.937264] CR2: 000055f1cff22050 CR3: 0000000112666002 CR4: 000000000=
0f71ef0
> [   77.937268] PKRU: 55555554
> [   77.937271] Call Trace:
> [   77.937274]  <TASK>
> [   77.937278]  cancel_delayed_work_sync+0x5e/0x80
> [   77.937283]  amdgpu_dm_connector_destroy+0x33/0xe0 [amdgpu]
> [   77.937467]  drm_connector_free_work_fn+0x72/0x90
> [   77.937471]  process_one_work+0x18b/0x340
> [   77.937475]  worker_thread+0x256/0x3a0
> [   77.937478]  ? __pfx_worker_thread+0x10/0x10
> [   77.937481]  kthread+0xfc/0x240
> [   77.937484]  ? __pfx_kthread+0x10/0x10
> [   77.937488]  ? __pfx_kthread+0x10/0x10
> [   77.937491]  ret_from_fork+0x121/0x190
> [   77.937494]  ? __pfx_kthread+0x10/0x10
> [   77.937498]  ret_from_fork_asm+0x1a/0x30
> [   77.937503]  </TASK>
> [   77.937505] ---[ end trace 0000000000000000 ]---
>
> # dmesg --follow-new &
> # cat /proc/cmdline
> BOOT_IMAGE=3D(hd0,gpt2)/boot/ostree/default-4d1352b3a0c9141bf3b54ff6edfc1=
90370f348342e5f6c795641cfd33ee2c88b/vmlinuz-6.19.0-rc5-00015-gb2426a211dba =
root=3D/dev/mapper/rhel-root rd.lvm.lv=3Drhel/root rd.lvm.lv=3Drhel/swap rw=
 boot=3DUUID=3D9c458207-c078-4fcf-bb4c-679ae1a3ae9f ostree=3D/ostree/boot.1=
/default/4d1352b3a0c9141bf3b54ff6edfc190370f348342e5f6c795641cfd33ee2c88b/0=
 "dyndbg=3Dfile drivers/base/firmware_loader/main.c +fmp"
> # rmmod amdgpu
> [  130.326780] [drm] PCIE GART of 512M enabled (table at 0x00000080003000=
00).
> [  130.326830] amdgpu 0000:83:00.0: amdgpu: PSP is resuming...
> [  130.390765] amdgpu 0000:83:00.0: amdgpu: reserve 0x1300000 from 0x8b3c=
000000 for PSP TMR
> [  130.534582] amdgpu 0000:83:00.0: amdgpu: GECC is currently enabled, wh=
ich may affect performance
> [  130.534587] amdgpu 0000:83:00.0: amdgpu: To disable GECC, please reboo=
t the system and load the amdgpu driver with the parameter amdgpu_ras_enabl=
e=3D0
> [  130.551451] amdgpu 0000:83:00.0: amdgpu: RAP: optional rap ta ucode is=
 not available
> [  130.551456] amdgpu 0000:83:00.0: amdgpu: SECUREDISPLAY: optional secur=
edisplay ta ucode is not available
> [  130.551461] amdgpu 0000:83:00.0: amdgpu: SMU is resuming...
> [  130.551466] amdgpu 0000:83:00.0: amdgpu: smu driver if version =3D 0x0=
000003d, smu fw if version =3D 0x00000040, smu fw program =3D 0, smu fw ver=
sion =3D 0x004e8300 (78.131.0)
> [  130.551473] amdgpu 0000:83:00.0: amdgpu: SMU driver if version not mat=
ched
> [  130.695062] amdgpu 0000:83:00.0: amdgpu: SMU is resumed successfully!
> [  130.707036] amdgpu 0000:83:00.0: amdgpu: [drm] DMUB hardware initializ=
ed: version=3D0x07002F00
> [  130.714347] amdgpu 0000:83:00.0: [drm] Cannot find any crtc or sizes
> [  130.714359] amdgpu 0000:83:00.0: amdgpu: ring gfx_0.0.0 uses VM inv en=
g 0 on hub 0
> [  130.714364] amdgpu 0000:83:00.0: amdgpu: ring comp_1.0.0 uses VM inv e=
ng 1 on hub 0
> [  130.714368] amdgpu 0000:83:00.0: amdgpu: ring comp_1.1.0 uses VM inv e=
ng 4 on hub 0
> [  130.714372] amdgpu 0000:83:00.0: amdgpu: ring comp_1.2.0 uses VM inv e=
ng 6 on hub 0
> [  130.714375] amdgpu 0000:83:00.0: amdgpu: ring comp_1.3.0 uses VM inv e=
ng 7 on hub 0
> [  130.714379] amdgpu 0000:83:00.0: amdgpu: ring comp_1.0.1 uses VM inv e=
ng 8 on hub 0
> [  130.714383] amdgpu 0000:83:00.0: amdgpu: ring comp_1.1.1 uses VM inv e=
ng 9 on hub 0
> [  130.714387] amdgpu 0000:83:00.0: amdgpu: ring comp_1.2.1 uses VM inv e=
ng 10 on hub 0
> [  130.714391] amdgpu 0000:83:00.0: amdgpu: ring comp_1.3.1 uses VM inv e=
ng 11 on hub 0
> [  130.714395] amdgpu 0000:83:00.0: amdgpu: ring sdma0 uses VM inv eng 12=
 on hub 0
> [  130.714399] amdgpu 0000:83:00.0: amdgpu: ring sdma1 uses VM inv eng 13=
 on hub 0
> [  130.714403] amdgpu 0000:83:00.0: amdgpu: ring vcn_unified_0 uses VM in=
v eng 0 on hub 8
> [  130.714407] amdgpu 0000:83:00.0: amdgpu: ring vcn_unified_1 uses VM in=
v eng 1 on hub 8
> [  130.714411] amdgpu 0000:83:00.0: amdgpu: ring jpeg_dec uses VM inv eng=
 4 on hub 8
> [  130.714415] amdgpu 0000:83:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM in=
v eng 14 on hub 0
> [  130.717614] amdgpu 0000:83:00.0: [drm] Cannot find any crtc or sizes
> [  130.749867] amdgpu 0000:83:00.0: amdgpu: amdgpu: finishing device.
> [  130.832990] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_mes1.bin devm-0000000074b66149 re=
leased
> [  130.832994] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_mes_2.bin devm-00000000d46d3d0a r=
eleased
> [  130.832995] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/vcn_4_0_0.bin devm-00000000016db898 release=
d
> [  130.832997] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/sdma_6_0_0.bin devm-000000005efee9f4 releas=
ed
> [  130.832998] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_imu.bin devm-000000003ae64728 rel=
eased
> [  130.832999] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_mec.bin devm-00000000af46a982 rel=
eased
> [  130.833001] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_rlc.bin devm-000000001cb79a18 rel=
eased
> [  130.833002] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_me.bin devm-00000000cc67f139 rele=
ased
> [  130.833003] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_pfp.bin devm-0000000081c0968b rel=
eased
> [  130.833004] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/dcn_3_2_0_dmcub.bin devm-00000000443f0df7 r=
eleased
> [  130.833006] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/smu_13_0_0.bin devm-00000000b15e02fd releas=
ed
> [  130.833007] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/psp_13_0_0_ta.bin devm-000000000210a6a5 rel=
eased
> [  130.833008] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/psp_13_0_0_sos.bin devm-00000000f20cdcf8 re=
leased
> [  130.833014] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_mes_2.bin fw_priv=3D000000002d9267e4 data=3D000000=
0031802202 size=3D257344
> [  130.833024] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_mes1.bin fw_priv=3D00000000c7ac6b6f data=3D0000000=
033e75f41 size=3D218240
> [  130.833055] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/vcn_4_0_0.bin fw_priv=3D000000004d750fd5 data=3D000000003b01=
c6c8 size=3D403856
> [  130.833077] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/sdma_6_0_0.bin fw_priv=3D000000009cbfce7c data=3D00000000e92=
460ba size=3D34560
> [  130.833109] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_pfp.bin fw_priv=3D00000000db83ee7b data=3D00000000=
3055277c size=3D231008
> [  130.833118] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_me.bin fw_priv=3D00000000eacba546 data=3D000000008=
290cf98 size=3D314512
> [  130.833126] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_rlc.bin fw_priv=3D00000000328bec43 data=3D00000000=
b139d21a size=3D185376
> [  130.833134] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_mec.bin fw_priv=3D00000000fd9b77a5 data=3D00000000=
e642bc9c size=3D406528
> [  130.833151] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/dcn_3_2_0_dmcub.bin fw_priv=3D00000000af71cb2f data=3D000000=
00aca60ab1 size=3D284432
> [  130.833167] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/smu_13_0_0.bin fw_priv=3D00000000fa494fe0 data=3D00000000a8e=
97967 size=3D292452
> [  130.833180] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/psp_13_0_0_sos.bin fw_priv=3D000000005273a87e data=3D0000000=
04f725920 size=3D268304
> [  130.833192] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/psp_13_0_0_ta.bin fw_priv=3D00000000dbd3858b data=3D00000000=
b534cfff size=3D267520
> [  130.833581] amdgpu 0000:83:00.0: amdgpu: amdgpu: ttm finalized
>
> Thanks,
> Peter
>
