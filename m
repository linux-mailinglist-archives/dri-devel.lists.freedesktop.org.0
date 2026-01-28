Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHdlARVtemne6AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 21:09:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F53A862C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 21:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C86110E773;
	Wed, 28 Jan 2026 20:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YEvhEZb9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3894210E76E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 20:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769630992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3oHNovVjTrUYJK49M6wz/FmLMQ5S+SMyDHk83bFrTg8=;
 b=YEvhEZb92yar01Q4pNEhFuX4Z1R4v2Q7man+6f9lqlOSXfYOJfuiAcAyJQbTqO4mf22Ov/
 c8Ngv6+74O51XToreq8GdioG6/GMcqNk3J7kbai8Ti+k5hFzOrMlpHO/t7QHxpyDIPgYvS
 1+yJMN05vyFuhomQn4St/NxU71pH4zg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-dU7OZx9dPQiznO5_2B0cDg-1; Wed, 28 Jan 2026 15:09:51 -0500
X-MC-Unique: dU7OZx9dPQiznO5_2B0cDg-1
X-Mimecast-MFC-AGG-ID: dU7OZx9dPQiznO5_2B0cDg_1769630990
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c277fe676eso73280785a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 12:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769630990; x=1770235790;
 h=content-transfer-encoding:content-disposition:mime-version
 :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3oHNovVjTrUYJK49M6wz/FmLMQ5S+SMyDHk83bFrTg8=;
 b=vrDIWQKjhmUMUM6j1Q9YAO7QIM6AqGDWZ44/k2RGYUo7THCGR5KGvpQpqFvpWK+PWv
 loSdqZeFOD0+cLBtO1NhauJ7Teh9B0MeGwnvIoqHVVaLR3b+iFra1u3QJKGRHVd1cCfv
 JLO1xlrFlQpQ2ifuZeYpOduQZ83Ip+kW4VPv+yfX2EgA9kPWfJWY5SIY1cmCezOyemS8
 JSjp6dlA3mlSpSH23qRYdnNV1L7LDqQ7lvgcOU9zHeYRhkal4bFTQipkfvAXnGEwjMYp
 vA5RYkx54nHkmB70GutTJ/5hs6Yyww9mrR9EE9VImPJ49APRbg1MzRa/IkW7J7m9kCms
 ejgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO26X2kPsHBRV29zqKCJKx7I/G4yKEmYMmDM2HF9ysh3R64DtP/JLq5BoFSJU/Ol2vBmGgCmhjvFc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuKL1KQ5B98pq6u1sgGSaNa8+16Ug7HxqkaWysAqST7GMHBlfp
 yCp/kqhf3TnZ2pFBIBHhTLu80WYtcalAmYX22aB6vxe27MHTrnvpRH5IMw1KCJ5J0g+1r9BUj1E
 5bbS7KYkBqQBW73PK8S6QpaFzVIMOryThinniUrw8/4OScI969z8dclvwXRUWUkEFGfDSrA==
X-Gm-Gg: AZuq6aLQljaceuucsFXyuU4aY+yVzSxnl90GP/KhAWTDioRv3lAMd1T+qt4L1PPDMfG
 yRdgp+IEngohBG4cHM6/aABdWtiyoe/wOXPbKK30MlmORv5TfaFlFfpAIEmUd7NOSNMPLubT3iW
 PbCy77ETCLUHq4HriK6Qb0YYiAPfGqD3H/Z3OcaB88b0qOCtiSepbmZTB/nhX3OmNHQPRIODwyA
 dnI3+1TUH5u+Pfz7TEFNDqPz60rKCgLnZzCvbth7VDADHR2Xmn6j7ogLXyQRsg3Z4vK2xamPb8u
 ITbsFKEjrkNXkeDREt4h3bz4Y1/tySsq8y1bGngYDFgPc+Zuzdic0Ieus2fOp76tthm4VCUbhM9
 W1XLbnNvM
X-Received: by 2002:a05:620a:25c6:b0:8b2:f269:f897 with SMTP id
 af79cd13be357-8c70b8f9103mr843921785a.41.1769630987876; 
 Wed, 28 Jan 2026 12:09:47 -0800 (PST)
X-Received: by 2002:a05:620a:25c6:b0:8b2:f269:f897 with SMTP id
 af79cd13be357-8c70b8f9103mr843881385a.41.1769630981344; 
 Wed, 28 Jan 2026 12:09:41 -0800 (PST)
Received: from localhost ([2607:f2c0:b0bc:f100:e97:de30:9768:6518])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-8c711b7ba79sm240747785a.11.2026.01.28.12.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 12:09:40 -0800 (PST)
Date: Wed, 28 Jan 2026 15:09:40 -0500
From: Peter Colberg <pcolberg@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Ivan Lipski <ivan.lipski@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [REGRESSION] drm/amd/display: Add an hdmi_hpd_debounce_delay_ms module
Message-ID: <aXptBPF3L07zJB1O@earendel>
Mail-Followup-To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Ivan Lipski <ivan.lipski@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z-cT3a74h_Yqa_fslnLDIQODOcpaxkWatz-M2IuBeDw_1769630990
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:ivan.lipski@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,m:superm1@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,igalia.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[pcolberg@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pcolberg@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 61F53A862C
X-Rspamd-Action: no action

Hi,

I hit a regression introduced as part of v6.19-rc6 (and still present
in v6.19-rc7), where, upon unloading the amdgpu module, __flush_work()
is passed a work struct with the work function set to NULL. The issue
is seen with an AMD Radeon Pro W7900, but not an AMD Instinct MI210.

#regzbot introduced: d04f73668bebbc5a44a2771ea92b6ec253148050

    4231 static bool __flush_work(struct work_struct *work, bool from_cance=
l)
    4232 {
    4233         struct wq_barrier barr;
    4234
    4235         if (WARN_ON(!wq_online))
    4236                 return false;
    4237
--> 4238         if (WARN_ON(!work->func))
    4239                 return false;

Tests were carried out on an AMD Radeon Pro W7900 with a mainline
kernel compiled and booted with an up-to-date CentOS Stream 10 x86_64
and amdgpu firmware commit 993573ac3dc6ab038505c2639701db22f6142487.

% cp /lib/modules/6.12.0-191.el10.x86_64/config .config
% scripts/config --enable LOCALVERSION_AUTO
% scripts/config --disable EFI_SBAT_FILE
% scripts/config --disable SECURITY_LOCKDOWN_LSM
% scripts/config --disable MODULE_SIG
% make olddefconfig
% make -j $(nproc) binrpm-pkg

The first test exercises commit d04f73668beb which introduced the
regression, the second test b2426a211dba prior to the regression.

# dmesg --follow-new &
# cat /proc/cmdline
BOOT_IMAGE=3D(hd0,gpt2)/boot/ostree/default-8a8985bdb88376ac62c94e787be00de=
a13130a3b5e56e8598bd96b4cf7eaac4c/vmlinuz-6.19.0-rc5-00016-gd04f73668beb ro=
ot=3D/dev/mapper/rhel-root rd.lvm.lv=3Drhel/root rd.lvm.lv=3Drhel/swap rw b=
oot=3DUUID=3D9c458207-c078-4fcf-bb4c-679ae1a3ae9f ostree=3D/ostree/boot.0/d=
efault/8a8985bdb88376ac62c94e787be00dea13130a3b5e56e8598bd96b4cf7eaac4c/0 "=
dyndbg=3Dfile drivers/base/firmware_loader/main.c +fmp"
# rmmod amdgpu
[   77.410012] [drm] PCIE GART of 512M enabled (table at 0x0000008000300000=
).
[   77.410074] amdgpu 0000:83:00.0: amdgpu: PSP is resuming...
[   77.473976] amdgpu 0000:83:00.0: amdgpu: reserve 0x1300000 from 0x8b3c00=
0000 for PSP TMR
[   77.617936] amdgpu 0000:83:00.0: amdgpu: GECC is currently enabled, whic=
h may affect performance
[   77.617941] amdgpu 0000:83:00.0: amdgpu: To disable GECC, please reboot =
the system and load the amdgpu driver with the parameter amdgpu_ras_enable=
=3D0
[   77.634803] amdgpu 0000:83:00.0: amdgpu: RAP: optional rap ta ucode is n=
ot available
[   77.634808] amdgpu 0000:83:00.0: amdgpu: SECUREDISPLAY: optional secured=
isplay ta ucode is not available
[   77.634813] amdgpu 0000:83:00.0: amdgpu: SMU is resuming...
[   77.634818] amdgpu 0000:83:00.0: amdgpu: smu driver if version =3D 0x000=
0003d, smu fw if version =3D 0x00000040, smu fw program =3D 0, smu fw versi=
on =3D 0x004e8300 (78.131.0)
[   77.634825] amdgpu 0000:83:00.0: amdgpu: SMU driver if version not match=
ed
[   77.779854] amdgpu 0000:83:00.0: amdgpu: SMU is resumed successfully!
[   77.789735] amdgpu 0000:83:00.0: amdgpu: [drm] DMUB hardware initialized=
: version=3D0x07002F00
[   77.795903] amdgpu 0000:83:00.0: [drm] Cannot find any crtc or sizes
[   77.795913] amdgpu 0000:83:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng =
0 on hub 0
[   77.795917] amdgpu 0000:83:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng=
 1 on hub 0
[   77.795921] amdgpu 0000:83:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng=
 4 on hub 0
[   77.795924] amdgpu 0000:83:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng=
 6 on hub 0
[   77.795927] amdgpu 0000:83:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng=
 7 on hub 0
[   77.795930] amdgpu 0000:83:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng=
 8 on hub 0
[   77.795933] amdgpu 0000:83:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng=
 9 on hub 0
[   77.795937] amdgpu 0000:83:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng=
 10 on hub 0
[   77.795940] amdgpu 0000:83:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng=
 11 on hub 0
[   77.795943] amdgpu 0000:83:00.0: amdgpu: ring sdma0 uses VM inv eng 12 o=
n hub 0
[   77.795946] amdgpu 0000:83:00.0: amdgpu: ring sdma1 uses VM inv eng 13 o=
n hub 0
[   77.795954] amdgpu 0000:83:00.0: amdgpu: ring vcn_unified_0 uses VM inv =
eng 0 on hub 8
[   77.795958] amdgpu 0000:83:00.0: amdgpu: ring vcn_unified_1 uses VM inv =
eng 1 on hub 8
[   77.795961] amdgpu 0000:83:00.0: amdgpu: ring jpeg_dec uses VM inv eng 4=
 on hub 8
[   77.795965] amdgpu 0000:83:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv =
eng 14 on hub 0
[   77.798920] amdgpu 0000:83:00.0: [drm] Cannot find any crtc or sizes
[   77.835746] amdgpu 0000:83:00.0: amdgpu: amdgpu: finishing device.
[   77.934047] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/gc_11_0_0_mes1.bin devm-00000000729a84e2 rele=
ased
[   77.934052] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/gc_11_0_0_mes_2.bin devm-000000008a601096 rel=
eased
[   77.934054] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/vcn_4_0_0.bin devm-00000000ce1dfe25 released
[   77.934055] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/sdma_6_0_0.bin devm-00000000f4c59a6f released
[   77.934057] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/gc_11_0_0_imu.bin devm-000000000fe0df50 relea=
sed
[   77.934059] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/gc_11_0_0_mec.bin devm-000000006b38a3b2 relea=
sed
[   77.934061] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/gc_11_0_0_rlc.bin devm-000000004a747642 relea=
sed
[   77.934064] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/gc_11_0_0_me.bin devm-000000002ce74390 releas=
ed
[   77.934066] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/gc_11_0_0_pfp.bin devm-00000000b0e91c69 relea=
sed
[   77.934068] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/dcn_3_2_0_dmcub.bin devm-000000000b75c19c rel=
eased
[   77.934069] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/smu_13_0_0.bin devm-000000001ab5d2f3 released
[   77.934071] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/psp_13_0_0_ta.bin devm-00000000a37398c2 relea=
sed
[   77.934072] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/psp_13_0_0_sos.bin devm-0000000027208a82 rele=
ased
[   77.934078] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/gc_11_0_0_mes_2.bin fw_priv=3D000000004a41fbe6 data=3D00000000=
2a21f503 size=3D257344
[   77.934090] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/gc_11_0_0_mes1.bin fw_priv=3D000000004f12a566 data=3D00000000c=
562adda size=3D218240
[   77.934117] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/vcn_4_0_0.bin fw_priv=3D00000000bf93c3ab data=3D000000003ba747=
fe size=3D403856
[   77.934137] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/sdma_6_0_0.bin fw_priv=3D000000006a092a88 data=3D00000000007c1=
a01 size=3D34560
[   77.934167] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/gc_11_0_0_pfp.bin fw_priv=3D00000000b86bbe6d data=3D00000000f1=
3777ad size=3D231008
[   77.934175] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/gc_11_0_0_me.bin fw_priv=3D00000000493fdf17 data=3D00000000afc=
5401f size=3D314512
[   77.934189] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/gc_11_0_0_rlc.bin fw_priv=3D0000000035fafe96 data=3D00000000ab=
68b2da size=3D185376
[   77.934199] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/gc_11_0_0_mec.bin fw_priv=3D00000000293ce4de data=3D000000000e=
b1a171 size=3D406528
[   77.934213] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/dcn_3_2_0_dmcub.bin fw_priv=3D00000000c705cc78 data=3D00000000=
f530b58b size=3D284432
[   77.934228] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/smu_13_0_0.bin fw_priv=3D00000000c876ab3e data=3D000000003f056=
26c size=3D292452
[   77.934238] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/psp_13_0_0_sos.bin fw_priv=3D00000000c877aa90 data=3D00000000f=
123f702 size=3D268304
[   77.934249] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/psp_13_0_0_ta.bin fw_priv=3D00000000886845ff data=3D0000000046=
6f9c99 size=3D267520
[   77.934639] amdgpu 0000:83:00.0: amdgpu: amdgpu: ttm finalized
[   77.935587] ------------[ cut here ]------------
[   77.935592] WARNING: kernel/workqueue.c:4238 at __flush_work+0x338/0x350=
, CPU#31: kworker/31:0/207
[   77.935603] Modules linked in: snd_hda_codec_alc662 snd_hda_codec_realte=
k_lib snd_hda_codec_generic amdgpu(-) snd_hda_codec_atihdmi snd_hda_codec_h=
dmi mt7921e amdxcp drm_panel_backlight_quirks mt7921_common snd_hda_intel d=
rm_ttm_helper mt792x_lib snd_usb_audio amd_atl intel_rapl_msr ttm snd_hda_c=
odec mt76_connac_lib snd_usbmidi_lib intel_rapl_common i2c_algo_bit snd_ump=
 drm_suballoc_helper snd_hda_core mt76 snd_rawmidi amd64_edac gpu_sched snd=
_intel_dspcfg edac_mce_amd snd_intel_sdw_acpi btusb drm_exec mc snd_hwdep b=
trtl drm_buddy snd_seq btintel drm_display_helper btbcm mac80211 snd_seq_de=
vice kvm_amd btmtk cec think_lmi kvm video snd_pcm irqbypass firmware_attri=
butes_class wmi_bmof bluetooth rapl cfg80211 snd_timer pcspkr crc16 snd i2c=
_piix4 rfkill k10temp soundcore i2c_smbus libarc4 gpio_amdpt gpio_generic i=
2c_designware_platform i2c_designware_core loop overlay erofs xfs nvme_tcp =
nvme_fabrics nvme nvme_core nvme_keyring ahci nvme_auth libahci ghash_clmul=
ni_intel hkdf r8169 atlantic ccp libata sp5100_tco realtek
[   77.935687]  macsec wmi sunrpc dm_mirror dm_region_hash dm_log dm_mod fu=
se nfnetlink
[   77.935731] CPU: 31 UID: 0 PID: 207 Comm: kworker/31:0 Not tainted 6.19.=
0-rc5-00016-gd04f73668beb #1 PREEMPT(voluntary)=20
[   77.935744] Workqueue: events drm_connector_free_work_fn
[   77.935751] RIP: 0010:__flush_work+0x338/0x350
[   77.935756] Code: 3e 46 06 00 65 48 8b 15 2e e4 e3 02 48 85 db 48 8b 04 =
24 48 89 54 24 48 0f 85 e6 fe ff ff e9 fe fd ff ff 0f 0b e9 77 ff ff ff <0f=
> 0b e9 70 ff ff ff 0f 0b e9 19 ff ff ff e8 15 22 d9 00 0f 1f 44
[   77.935765] RSP: 0018:ff57cb59c0b7bd68 EFLAGS: 00010246
[   77.935770] RAX: 0000000000000000 RBX: ff2d8e14daf8d480 RCX: 00000000000=
00000
[   77.935775] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ff57cb59c0b=
7bdb8
[   77.935779] RBP: ff2d8e14daf8d480 R08: ff2d8e14a1a86420 R09: 00000000002=
a001f
[   77.935783] R10: ff2d8e14a1a86401 R11: ff2d8e14a1a86f60 R12: ff2d8e15921=
80010
[   77.935788] R13: ff57cb59c0b7bd70 R14: 0000000000000001 R15: 00000000000=
00000
[   77.935792] FS:  0000000000000000(0000) GS:ff2d8e3396243000(0000) knlGS:=
0000000000000000
[   77.935797] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   77.935801] CR2: 000055f1cff22050 CR3: 0000000112666002 CR4: 0000000000f=
71ef0
[   77.935806] PKRU: 55555554
[   77.935809] Call Trace:
[   77.935812]  <TASK>
[   77.935818]  cancel_delayed_work_sync+0x5e/0x80
[   77.935823]  amdgpu_dm_connector_destroy+0x33/0xe0 [amdgpu]
[   77.936146]  drm_connector_free_work_fn+0x72/0x90
[   77.936152]  process_one_work+0x18b/0x340
[   77.936157]  worker_thread+0x256/0x3a0
[   77.936162]  ? __pfx_worker_thread+0x10/0x10
[   77.936166]  kthread+0xfc/0x240
[   77.936171]  ? __pfx_kthread+0x10/0x10
[   77.936175]  ? __pfx_kthread+0x10/0x10
[   77.936180]  ret_from_fork+0x121/0x190
[   77.936186]  ? __pfx_kthread+0x10/0x10
[   77.936190]  ret_from_fork_asm+0x1a/0x30
[   77.936198]  </TASK>
[   77.936201] ---[ end trace 0000000000000000 ]---
[   77.936210] ------------[ cut here ]------------
[   77.936214] WARNING: kernel/workqueue.c:4238 at __flush_work+0x338/0x350=
, CPU#31: kworker/31:0/207
[   77.936221] Modules linked in: snd_hda_codec_alc662 snd_hda_codec_realte=
k_lib snd_hda_codec_generic amdgpu(-) snd_hda_codec_atihdmi snd_hda_codec_h=
dmi mt7921e amdxcp drm_panel_backlight_quirks mt7921_common snd_hda_intel d=
rm_ttm_helper mt792x_lib snd_usb_audio amd_atl intel_rapl_msr ttm snd_hda_c=
odec mt76_connac_lib snd_usbmidi_lib intel_rapl_common i2c_algo_bit snd_ump=
 drm_suballoc_helper snd_hda_core mt76 snd_rawmidi amd64_edac gpu_sched snd=
_intel_dspcfg edac_mce_amd snd_intel_sdw_acpi btusb drm_exec mc snd_hwdep b=
trtl drm_buddy snd_seq btintel drm_display_helper btbcm mac80211 snd_seq_de=
vice kvm_amd btmtk cec think_lmi kvm video snd_pcm irqbypass firmware_attri=
butes_class wmi_bmof bluetooth rapl cfg80211 snd_timer pcspkr crc16 snd i2c=
_piix4 rfkill k10temp soundcore i2c_smbus libarc4 gpio_amdpt gpio_generic i=
2c_designware_platform i2c_designware_core loop overlay erofs xfs nvme_tcp =
nvme_fabrics nvme nvme_core nvme_keyring ahci nvme_auth libahci ghash_clmul=
ni_intel hkdf r8169 atlantic ccp libata sp5100_tco realtek
[   77.936292]  macsec wmi sunrpc dm_mirror dm_region_hash dm_log dm_mod fu=
se nfnetlink
[   77.936331] CPU: 31 UID: 0 PID: 207 Comm: kworker/31:0 Tainted: G       =
 W           6.19.0-rc5-00016-gd04f73668beb #1 PREEMPT(voluntary)=20
[   77.936337] Tainted: [W]=3DWARN
[   77.936342] Workqueue: events drm_connector_free_work_fn
[   77.936346] RIP: 0010:__flush_work+0x338/0x350
[   77.936350] Code: 3e 46 06 00 65 48 8b 15 2e e4 e3 02 48 85 db 48 8b 04 =
24 48 89 54 24 48 0f 85 e6 fe ff ff e9 fe fd ff ff 0f 0b e9 77 ff ff ff <0f=
> 0b e9 70 ff ff ff 0f 0b e9 19 ff ff ff e8 15 22 d9 00 0f 1f 44
[   77.936357] RSP: 0018:ff57cb59c0b7bd68 EFLAGS: 00010246
[   77.936360] RAX: 0000000000000000 RBX: ff2d8e1492153480 RCX: 00000000000=
00000
[   77.936363] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ff57cb59c0b=
7bdb8
[   77.936366] RBP: ff2d8e1492153480 R08: ff2d8e14a1a861e0 R09: 00000000002=
a001e
[   77.936369] R10: ff2d8e14a1a86101 R11: ff2d8e14a1a86420 R12: ff2d8e15921=
80010
[   77.936373] R13: ff57cb59c0b7bd70 R14: 0000000000000001 R15: 00000000000=
00000
[   77.936376] FS:  0000000000000000(0000) GS:ff2d8e3396243000(0000) knlGS:=
0000000000000000
[   77.936379] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   77.936382] CR2: 000055f1cff22050 CR3: 0000000112666002 CR4: 0000000000f=
71ef0
[   77.936386] PKRU: 55555554
[   77.936388] Call Trace:
[   77.936390]  <TASK>
[   77.936393]  cancel_delayed_work_sync+0x5e/0x80
[   77.936397]  amdgpu_dm_connector_destroy+0x33/0xe0 [amdgpu]
[   77.936613]  drm_connector_free_work_fn+0x72/0x90
[   77.936617]  process_one_work+0x18b/0x340
[   77.936621]  worker_thread+0x256/0x3a0
[   77.936624]  ? __pfx_worker_thread+0x10/0x10
[   77.936627]  kthread+0xfc/0x240
[   77.936630]  ? __pfx_kthread+0x10/0x10
[   77.936634]  ? __pfx_kthread+0x10/0x10
[   77.936637]  ret_from_fork+0x121/0x190
[   77.936640]  ? __pfx_kthread+0x10/0x10
[   77.936643]  ret_from_fork_asm+0x1a/0x30
[   77.936649]  </TASK>
[   77.936651] ---[ end trace 0000000000000000 ]---
[   77.936658] ------------[ cut here ]------------
[   77.936661] WARNING: kernel/workqueue.c:4238 at __flush_work+0x338/0x350=
, CPU#31: kworker/31:0/207
[   77.936666] Modules linked in: snd_hda_codec_alc662 snd_hda_codec_realte=
k_lib snd_hda_codec_generic amdgpu(-) snd_hda_codec_atihdmi snd_hda_codec_h=
dmi mt7921e amdxcp drm_panel_backlight_quirks mt7921_common snd_hda_intel d=
rm_ttm_helper mt792x_lib snd_usb_audio amd_atl intel_rapl_msr ttm snd_hda_c=
odec mt76_connac_lib snd_usbmidi_lib intel_rapl_common i2c_algo_bit snd_ump=
 drm_suballoc_helper snd_hda_core mt76 snd_rawmidi amd64_edac gpu_sched snd=
_intel_dspcfg edac_mce_amd snd_intel_sdw_acpi btusb drm_exec mc snd_hwdep b=
trtl drm_buddy snd_seq btintel drm_display_helper btbcm mac80211 snd_seq_de=
vice kvm_amd btmtk cec think_lmi kvm video snd_pcm irqbypass firmware_attri=
butes_class wmi_bmof bluetooth rapl cfg80211 snd_timer pcspkr crc16 snd i2c=
_piix4 rfkill k10temp soundcore i2c_smbus libarc4 gpio_amdpt gpio_generic i=
2c_designware_platform i2c_designware_core loop overlay erofs xfs nvme_tcp =
nvme_fabrics nvme nvme_core nvme_keyring ahci nvme_auth libahci ghash_clmul=
ni_intel hkdf r8169 atlantic ccp libata sp5100_tco realtek
[   77.936718]  macsec wmi sunrpc dm_mirror dm_region_hash dm_log dm_mod fu=
se nfnetlink
[   77.936751] CPU: 31 UID: 0 PID: 207 Comm: kworker/31:0 Tainted: G       =
 W           6.19.0-rc5-00016-gd04f73668beb #1 PREEMPT(voluntary)=20
[   77.936757] Tainted: [W]=3DWARN
[   77.936762] Workqueue: events drm_connector_free_work_fn
[   77.936766] RIP: 0010:__flush_work+0x338/0x350
[   77.936769] Code: 3e 46 06 00 65 48 8b 15 2e e4 e3 02 48 85 db 48 8b 04 =
24 48 89 54 24 48 0f 85 e6 fe ff ff e9 fe fd ff ff 0f 0b e9 77 ff ff ff <0f=
> 0b e9 70 ff ff ff 0f 0b e9 19 ff ff ff e8 15 22 d9 00 0f 1f 44
[   77.936776] RSP: 0018:ff57cb59c0b7bd68 EFLAGS: 00010246
[   77.936779] RAX: 0000000000000000 RBX: ff2d8e1492151480 RCX: 00000000000=
00000
[   77.936782] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ff57cb59c0b=
7bdb8
[   77.936785] RBP: ff2d8e1492151480 R08: ff2d8e14a1a860c0 R09: 00000000002=
a001d
[   77.936788] R10: ff2d8e14a1a86001 R11: ff2d8e14a1a861e0 R12: ff2d8e15921=
80010
[   77.936791] R13: ff57cb59c0b7bd70 R14: 0000000000000001 R15: 00000000000=
00000
[   77.936795] FS:  0000000000000000(0000) GS:ff2d8e3396243000(0000) knlGS:=
0000000000000000
[   77.936798] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   77.936801] CR2: 000055f1cff22050 CR3: 0000000112666002 CR4: 0000000000f=
71ef0
[   77.936804] PKRU: 55555554
[   77.936806] Call Trace:
[   77.936808]  <TASK>
[   77.936812]  cancel_delayed_work_sync+0x5e/0x80
[   77.936815]  amdgpu_dm_connector_destroy+0x33/0xe0 [amdgpu]
[   77.937015]  drm_connector_free_work_fn+0x72/0x90
[   77.937020]  process_one_work+0x18b/0x340
[   77.937025]  worker_thread+0x256/0x3a0
[   77.937029]  ? __pfx_worker_thread+0x10/0x10
[   77.937034]  kthread+0xfc/0x240
[   77.937038]  ? __pfx_kthread+0x10/0x10
[   77.937042]  ? __pfx_kthread+0x10/0x10
[   77.937047]  ret_from_fork+0x121/0x190
[   77.937051]  ? __pfx_kthread+0x10/0x10
[   77.937056]  ret_from_fork_asm+0x1a/0x30
[   77.937063]  </TASK>
[   77.937065] ---[ end trace 0000000000000000 ]---
[   77.937074] ------------[ cut here ]------------
[   77.937077] WARNING: kernel/workqueue.c:4238 at __flush_work+0x338/0x350=
, CPU#31: kworker/31:0/207
[   77.937084] Modules linked in: snd_hda_codec_alc662 snd_hda_codec_realte=
k_lib snd_hda_codec_generic amdgpu(-) snd_hda_codec_atihdmi snd_hda_codec_h=
dmi mt7921e amdxcp drm_panel_backlight_quirks mt7921_common snd_hda_intel d=
rm_ttm_helper mt792x_lib snd_usb_audio amd_atl intel_rapl_msr ttm snd_hda_c=
odec mt76_connac_lib snd_usbmidi_lib intel_rapl_common i2c_algo_bit snd_ump=
 drm_suballoc_helper snd_hda_core mt76 snd_rawmidi amd64_edac gpu_sched snd=
_intel_dspcfg edac_mce_amd snd_intel_sdw_acpi btusb drm_exec mc snd_hwdep b=
trtl drm_buddy snd_seq btintel drm_display_helper btbcm mac80211 snd_seq_de=
vice kvm_amd btmtk cec think_lmi kvm video snd_pcm irqbypass firmware_attri=
butes_class wmi_bmof bluetooth rapl cfg80211 snd_timer pcspkr crc16 snd i2c=
_piix4 rfkill k10temp soundcore i2c_smbus libarc4 gpio_amdpt gpio_generic i=
2c_designware_platform i2c_designware_core loop overlay erofs xfs nvme_tcp =
nvme_fabrics nvme nvme_core nvme_keyring ahci nvme_auth libahci ghash_clmul=
ni_intel hkdf r8169 atlantic ccp libata sp5100_tco realtek
[   77.937154]  macsec wmi sunrpc dm_mirror dm_region_hash dm_log dm_mod fu=
se nfnetlink
[   77.937197] CPU: 31 UID: 0 PID: 207 Comm: kworker/31:0 Tainted: G       =
 W           6.19.0-rc5-00016-gd04f73668beb #1 PREEMPT(voluntary)=20
[   77.937204] Tainted: [W]=3DWARN
[   77.937211] Workqueue: events drm_connector_free_work_fn
[   77.937216] RIP: 0010:__flush_work+0x338/0x350
[   77.937221] Code: 3e 46 06 00 65 48 8b 15 2e e4 e3 02 48 85 db 48 8b 04 =
24 48 89 54 24 48 0f 85 e6 fe ff ff e9 fe fd ff ff 0f 0b e9 77 ff ff ff <0f=
> 0b e9 70 ff ff ff 0f 0b e9 19 ff ff ff e8 15 22 d9 00 0f 1f 44
[   77.937229] RSP: 0018:ff57cb59c0b7bd68 EFLAGS: 00010246
[   77.937234] RAX: 0000000000000000 RBX: ff2d8e1492155480 RCX: 00000000000=
00000
[   77.937238] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ff57cb59c0b=
7bdb8
[   77.937242] RBP: ff2d8e1492155480 R08: ff2d8e14836abf00 R09: 00000000002=
a0026
[   77.937246] R10: ff2d8e14836abf01 R11: ff2d8e14836abcc0 R12: ff2d8e15921=
80010
[   77.937251] R13: ff57cb59c0b7bd70 R14: 0000000000000001 R15: 00000000000=
00000
[   77.937255] FS:  0000000000000000(0000) GS:ff2d8e3396243000(0000) knlGS:=
0000000000000000
[   77.937260] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   77.937264] CR2: 000055f1cff22050 CR3: 0000000112666002 CR4: 0000000000f=
71ef0
[   77.937268] PKRU: 55555554
[   77.937271] Call Trace:
[   77.937274]  <TASK>
[   77.937278]  cancel_delayed_work_sync+0x5e/0x80
[   77.937283]  amdgpu_dm_connector_destroy+0x33/0xe0 [amdgpu]
[   77.937467]  drm_connector_free_work_fn+0x72/0x90
[   77.937471]  process_one_work+0x18b/0x340
[   77.937475]  worker_thread+0x256/0x3a0
[   77.937478]  ? __pfx_worker_thread+0x10/0x10
[   77.937481]  kthread+0xfc/0x240
[   77.937484]  ? __pfx_kthread+0x10/0x10
[   77.937488]  ? __pfx_kthread+0x10/0x10
[   77.937491]  ret_from_fork+0x121/0x190
[   77.937494]  ? __pfx_kthread+0x10/0x10
[   77.937498]  ret_from_fork_asm+0x1a/0x30
[   77.937503]  </TASK>
[   77.937505] ---[ end trace 0000000000000000 ]---

# dmesg --follow-new &
# cat /proc/cmdline
BOOT_IMAGE=3D(hd0,gpt2)/boot/ostree/default-4d1352b3a0c9141bf3b54ff6edfc190=
370f348342e5f6c795641cfd33ee2c88b/vmlinuz-6.19.0-rc5-00015-gb2426a211dba ro=
ot=3D/dev/mapper/rhel-root rd.lvm.lv=3Drhel/root rd.lvm.lv=3Drhel/swap rw b=
oot=3DUUID=3D9c458207-c078-4fcf-bb4c-679ae1a3ae9f ostree=3D/ostree/boot.1/d=
efault/4d1352b3a0c9141bf3b54ff6edfc190370f348342e5f6c795641cfd33ee2c88b/0 "=
dyndbg=3Dfile drivers/base/firmware_loader/main.c +fmp"
# rmmod amdgpu
[  130.326780] [drm] PCIE GART of 512M enabled (table at 0x0000008000300000=
).
[  130.326830] amdgpu 0000:83:00.0: amdgpu: PSP is resuming...
[  130.390765] amdgpu 0000:83:00.0: amdgpu: reserve 0x1300000 from 0x8b3c00=
0000 for PSP TMR
[  130.534582] amdgpu 0000:83:00.0: amdgpu: GECC is currently enabled, whic=
h may affect performance
[  130.534587] amdgpu 0000:83:00.0: amdgpu: To disable GECC, please reboot =
the system and load the amdgpu driver with the parameter amdgpu_ras_enable=
=3D0
[  130.551451] amdgpu 0000:83:00.0: amdgpu: RAP: optional rap ta ucode is n=
ot available
[  130.551456] amdgpu 0000:83:00.0: amdgpu: SECUREDISPLAY: optional secured=
isplay ta ucode is not available
[  130.551461] amdgpu 0000:83:00.0: amdgpu: SMU is resuming...
[  130.551466] amdgpu 0000:83:00.0: amdgpu: smu driver if version =3D 0x000=
0003d, smu fw if version =3D 0x00000040, smu fw program =3D 0, smu fw versi=
on =3D 0x004e8300 (78.131.0)
[  130.551473] amdgpu 0000:83:00.0: amdgpu: SMU driver if version not match=
ed
[  130.695062] amdgpu 0000:83:00.0: amdgpu: SMU is resumed successfully!
[  130.707036] amdgpu 0000:83:00.0: amdgpu: [drm] DMUB hardware initialized=
: version=3D0x07002F00
[  130.714347] amdgpu 0000:83:00.0: [drm] Cannot find any crtc or sizes
[  130.714359] amdgpu 0000:83:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng =
0 on hub 0
[  130.714364] amdgpu 0000:83:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng=
 1 on hub 0
[  130.714368] amdgpu 0000:83:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng=
 4 on hub 0
[  130.714372] amdgpu 0000:83:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng=
 6 on hub 0
[  130.714375] amdgpu 0000:83:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng=
 7 on hub 0
[  130.714379] amdgpu 0000:83:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng=
 8 on hub 0
[  130.714383] amdgpu 0000:83:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng=
 9 on hub 0
[  130.714387] amdgpu 0000:83:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng=
 10 on hub 0
[  130.714391] amdgpu 0000:83:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng=
 11 on hub 0
[  130.714395] amdgpu 0000:83:00.0: amdgpu: ring sdma0 uses VM inv eng 12 o=
n hub 0
[  130.714399] amdgpu 0000:83:00.0: amdgpu: ring sdma1 uses VM inv eng 13 o=
n hub 0
[  130.714403] amdgpu 0000:83:00.0: amdgpu: ring vcn_unified_0 uses VM inv =
eng 0 on hub 8
[  130.714407] amdgpu 0000:83:00.0: amdgpu: ring vcn_unified_1 uses VM inv =
eng 1 on hub 8
[  130.714411] amdgpu 0000:83:00.0: amdgpu: ring jpeg_dec uses VM inv eng 4=
 on hub 8
[  130.714415] amdgpu 0000:83:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv =
eng 14 on hub 0
[  130.717614] amdgpu 0000:83:00.0: [drm] Cannot find any crtc or sizes
[  130.749867] amdgpu 0000:83:00.0: amdgpu: amdgpu: finishing device.
[  130.832990] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/gc_11_0_0_mes1.bin devm-0000000074b66149 rele=
ased
[  130.832994] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/gc_11_0_0_mes_2.bin devm-00000000d46d3d0a rel=
eased
[  130.832995] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/vcn_4_0_0.bin devm-00000000016db898 released
[  130.832997] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/sdma_6_0_0.bin devm-000000005efee9f4 released
[  130.832998] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/gc_11_0_0_imu.bin devm-000000003ae64728 relea=
sed
[  130.832999] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/gc_11_0_0_mec.bin devm-00000000af46a982 relea=
sed
[  130.833001] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/gc_11_0_0_rlc.bin devm-000000001cb79a18 relea=
sed
[  130.833002] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/gc_11_0_0_me.bin devm-00000000cc67f139 releas=
ed
[  130.833003] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/gc_11_0_0_pfp.bin devm-0000000081c0968b relea=
sed
[  130.833004] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/dcn_3_2_0_dmcub.bin devm-00000000443f0df7 rel=
eased
[  130.833006] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/smu_13_0_0.bin devm-00000000b15e02fd released
[  130.833007] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/psp_13_0_0_ta.bin devm-000000000210a6a5 relea=
sed
[  130.833008] firmware_class:fw_name_devm_release: firmware_class: fw_name=
_devm_release: fw_name-amdgpu/psp_13_0_0_sos.bin devm-00000000f20cdcf8 rele=
ased
[  130.833014] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/gc_11_0_0_mes_2.bin fw_priv=3D000000002d9267e4 data=3D00000000=
31802202 size=3D257344
[  130.833024] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/gc_11_0_0_mes1.bin fw_priv=3D00000000c7ac6b6f data=3D000000003=
3e75f41 size=3D218240
[  130.833055] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/vcn_4_0_0.bin fw_priv=3D000000004d750fd5 data=3D000000003b01c6=
c8 size=3D403856
[  130.833077] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/sdma_6_0_0.bin fw_priv=3D000000009cbfce7c data=3D00000000e9246=
0ba size=3D34560
[  130.833109] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/gc_11_0_0_pfp.bin fw_priv=3D00000000db83ee7b data=3D0000000030=
55277c size=3D231008
[  130.833118] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/gc_11_0_0_me.bin fw_priv=3D00000000eacba546 data=3D00000000829=
0cf98 size=3D314512
[  130.833126] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/gc_11_0_0_rlc.bin fw_priv=3D00000000328bec43 data=3D00000000b1=
39d21a size=3D185376
[  130.833134] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/gc_11_0_0_mec.bin fw_priv=3D00000000fd9b77a5 data=3D00000000e6=
42bc9c size=3D406528
[  130.833151] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/dcn_3_2_0_dmcub.bin fw_priv=3D00000000af71cb2f data=3D00000000=
aca60ab1 size=3D284432
[  130.833167] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/smu_13_0_0.bin fw_priv=3D00000000fa494fe0 data=3D00000000a8e97=
967 size=3D292452
[  130.833180] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/psp_13_0_0_sos.bin fw_priv=3D000000005273a87e data=3D000000004=
f725920 size=3D268304
[  130.833192] firmware_class:__free_fw_priv: firmware_class: __free_fw_pri=
v: fw-amdgpu/psp_13_0_0_ta.bin fw_priv=3D00000000dbd3858b data=3D00000000b5=
34cfff size=3D267520
[  130.833581] amdgpu 0000:83:00.0: amdgpu: amdgpu: ttm finalized

Thanks,
Peter

