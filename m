Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB58214D92C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 11:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904FB89EBD;
	Thu, 30 Jan 2020 10:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680070.outbound.protection.outlook.com [40.107.68.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9259489EA9;
 Thu, 30 Jan 2020 10:40:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7Lu1zmb7EmTxD30QVgwrxLyIOMCYYcagLCP1gW0hNAFjdeuGSowhsfM0JLYsxIJc6Y0voGoYeVGzZQko1d2rdPJ5cFuZnME0blG+6vdda9HLvo9iES8hft6epzivwGlN+jajLLw/fc4zIwF+EDqo7G7AJs/RkbwlLhNuOMiyd+Dj2d29lm9UFrC5YRhgVqONON2cme130sJVY0GgGecrr0tb4PnKcwWzWnEniZb8nGUky8dD2/D2ULhK5bfjjKU6USZEEQgZ1AMXfsJyOx+F6t3C6qPsT0XVCkTxeeSQmh8pWsSaq2zyzEqzD5EWGzK07PIGdb1xyE/2OBMasx8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePGb5EOc5Gw7N2onze2Sq0wEhmeqt+QLpHANY4OjG38=;
 b=Ku3oevu+hMFdYXUoUe6+UUsUJgRVW+m6jRM8mLlXD5cMs5h2tK7p+u5rz9kFGb2e1IP36m29Tm4Hx7MhIDl5zUUFAbA0ZBBur+edAcXHe9xQpEdiYYnPqIFKFcm3pJQJvnVybmiQayxK2D/O4ZjIHSrQwS9UyCX+ETMNu4b9A9E8l2QdPS7QhZl7241PQxP/Tv7TkTjdAZtwoeSyk5dmM1D8xSdLaDHqtkipjaeh0z2S7ZThYNeAVCdV4+V/Pb9yiBOF70ULqtRwE7tcEm6Dp0LcQgIuEJlZsWjD5RefN1WCJewJzCPTIYKXn/ynw8D05QyDXVHkwfbdv/kyxF+lOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePGb5EOc5Gw7N2onze2Sq0wEhmeqt+QLpHANY4OjG38=;
 b=HIEOGp4cvSF5ep7zxr2KmoK+6Qdzk7w9AWvdHF9NhKrQndsGqtAfWsJN95xopBNzjf9SrqoT6hyMtdlgtYoIpGJrlxKrqr5wNuJuIYQHxTCbpRw57B8wfxEZ4XWA5ifmdgdLsIhiI/BHGdTqDirRgt4PGCeXeBRurL/xZYYJ01o=
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB2617.namprd12.prod.outlook.com (20.176.116.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20; Thu, 30 Jan 2020 10:40:33 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882%7]) with mapi id 15.20.2665.027; Thu, 30 Jan 2020
 10:40:33 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "Lipski, Mikita" <Mikita.Lipski@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/dm/mst: Ignore payload update failures on disable
Thread-Topic: [PATCH] drm/amd/dm/mst: Ignore payload update failures on disable
Thread-Index: AQHV0sZnKGWsqcD3KEuZ/D4ItIXVW6f6BEIAgAAmKwCACNDHUA==
Date: Thu, 30 Jan 2020 10:40:33 +0000
Message-ID: <DM6PR12MB4137B67100E8C5F038AE4AAFFC040@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20200124000643.99859-1-lyude@redhat.com>
 <41187639-f077-0212-aa02-d5dcc96c442b@amd.com>
 <4ddde071-356b-77a0-25e8-26c22e0ffa14@amd.com>
 <290570863e9564165c40624d03ee572ce7c231fa.camel@redhat.com>
In-Reply-To: <290570863e9564165c40624d03ee572ce7c231fa.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-01-30T09:33:59Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=1a5f2538-609a-4036-8254-0000bee26243;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-01-30T10:40:30Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: eb9f15f3-d594-4691-8b3b-00006c4eb479
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
x-originating-ip: [165.204.134.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 51f5f04c-19aa-4093-f481-08d7a570d595
x-ms-traffictypediagnostic: DM6PR12MB2617:|DM6PR12MB2617:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2617F4D0E1EC765ABFADFB2CFC040@DM6PR12MB2617.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02981BE340
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(189003)(199004)(26005)(33656002)(53546011)(6506007)(9686003)(81166006)(81156014)(5660300002)(966005)(8676002)(478600001)(55016002)(7696005)(8936002)(15650500001)(4326008)(45080400002)(54906003)(7416002)(76116006)(186003)(110136005)(2906002)(66446008)(71200400001)(66556008)(86362001)(66946007)(52536014)(316002)(64756008)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2617;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +SqDuyGXixigtg6aSiS4Q5fiTiZ7IMzwr71ok0iAs/Wu3GHhNZRUxMTSTIHSFLxW8e1Rdx8Dxvb5bGgQTpoyrsMprBKTg7JaC6iOY9J5L7Zj+VQHfDtohR8I28FMcF3XSI6Se08PGJBJxM4uKgsCmeRxn4amOpVeHLysXm6gbEHsBzn6kLT4NZZfEIm5wMuccy7BDi9d9HXFLHJd++kwtNARvEWaSFCz4Opslwd7WmmAmzD5THLKMVBaduK50GXIH5SXvMPIy55j2VcwFtBxxfgGB4bTNlzVMXWXGufrk7+Q59m+c/5X+2Iqtva5A/FK8hFTK+wytKBkWFQyW1Cf71VqrYr0E5DCN+Yh/rwb2WtxMHA+k6KXKxaAzTxEP7RVw/8plvIIb7Z4Dv7cLZ+FcI3e2u0UaVTfSgWUnBjfyCrFz5IpjZT2aoLI37TtyNR9hWfwULlhQyktRx+zokuFGSbJI6+BztDbew3NX5nrvToYDVrldMBV7tZTTbxv1xna/nw1+AooY/jRx5G13PHqfw==
x-ms-exchange-antispam-messagedata: mfmtoM4sXHsvzIaUEAH/bXMojcQQiMjoiKM+LdSx8KrqMcIyrjXpnp3OdNK+xBNoAoNonbYsmBsvkuTTeTBlwBEzXpKcrANNJomJhv/vYSST2ES6aYfvSfJiO88Ur0vbVuiJTbCNp7XbhRJsyIu5/g==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f5f04c-19aa-4093-f481-08d7a570d595
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2020 10:40:33.2896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GTmJTSNCFHiJDn5kHF1sXIjDNvJaHMtadaRc2ok7OfB8k9s9bHq+salcFtgL6r50RBTqJEUl5XQ/5yNowI7xIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2617
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
Cc: "Tsai, Martin" <Martin.Tsai@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "Lakha, 
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, David Francis <David.Francis@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, "Lee, Alvin" <Alvin.Lee2@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Lipski,
 Mikita" <Mikita.Lipski@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Jean Delvare <jdelvare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

Hi Lyude,

Thanks for the patch!
I'm wondering if this error still occurs with this patch applied
https://patchwork.kernel.org/patch/11274363/
I tried to clean up all mgr->proposed_vcpis[] in this patch so
drm_dp_update_payload_part1() will skip all invalid ports.

However, I'm also thinking to improve this patch.
Maybe it is better to do cleaning proposed_vcpis[] in 
dm_helpers_dp_mst_write_payload_allocation_table() due to
it is the actual place that DC try to update the status for a specific 
VC stream. If it's reasonable then I'll do that in the future :)

> -----Original Message-----
> From: Lyude Paul <lyude@redhat.com>
> Sent: Saturday, January 25, 2020 2:57 AM
> To: Lipski, Mikita <Mikita.Lipski@amd.com>; Wentland, Harry
> <Harry.Wentland@amd.com>; amd-gfx@lists.freedesktop.org
> Cc: stable@vger.kernel.org; Wentland, Harry <Harry.Wentland@amd.com>; Li,
> Sun peng (Leo) <Sunpeng.Li@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Zhou, David(ChunMing)
> <David1.Zhou@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
> <daniel@ffwll.ch>; Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>;
> Lipski, Mikita <Mikita.Lipski@amd.com>; Sam Ravnborg <sam@ravnborg.org>;
> David Francis <David.Francis@amd.com>; Tsai, Martin
> <Martin.Tsai@amd.com>; Chris Wilson <chris@chris-wilson.co.uk>; Lee, Alvin
> <Alvin.Lee2@amd.com>; Jean Delvare <jdelvare@suse.de>;
> dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Lin, Wayne
> <Wayne.Lin@amd.com>
> Subject: Re: [PATCH] drm/amd/dm/mst: Ignore payload update failures on
> disable
> 
> 
> 
> On Fri, 2020-01-24 at 11:39 -0500, Mikita Lipski wrote:
> >
> > On 1/24/20 9:55 AM, Harry Wentland wrote:
> > > On 2020-01-23 7:06 p.m., Lyude Paul wrote:
> > > > Disabling a display on MST can potentially happen after the entire
> > > > MST topology has been removed, which means that we can't
> > > > communicate with the topology at all in this scenario. Likewise,
> > > > this also means that we can't properly update payloads on the
> > > > topology and as such, it's a good idea to ignore payload update failures
> when disabling displays.
> > > > Currently, amdgpu makes the mistake of halting the payload update
> > > > process when any payload update failures occur, resulting in
> > > > leaving DC's local copies of the payload tables out of date.
> > > >
> > > > This ends up causing problems with hotplugging MST topologies, and
> > > > causes modesets on the second hotplug to fail like so:
> > > >
> > > > [drm] Failed to updateMST allocation table forpipe idx:1
> > > > ------------[ cut here ]------------
> > > > WARNING: CPU: 5 PID: 1511 at
> > > > drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2677
> > > > update_mst_stream_alloc_table+0x11e/0x130 [amdgpu] Modules linked
> > > > in: cdc_ether usbnet fuse xt_conntrack nf_conntrack
> > > > nf_defrag_ipv6 libcrc32c nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4
> > > > nft_counter nft_compat nf_tables nfnetlink tun bridge stp llc
> > > > sunrpc vfat fat wmi_bmof uvcvideo snd_hda_codec_realtek
> > > > snd_hda_codec_generic snd_hda_codec_hdmi videobuf2_vmalloc
> > > > snd_hda_intel videobuf2_memops
> > > > videobuf2_v4l2 snd_intel_dspcfg videobuf2_common crct10dif_pclmul
> > > > snd_hda_codec videodev crc32_pclmul snd_hwdep snd_hda_core
> > > > ghash_clmulni_intel snd_seq mc joydev pcspkr snd_seq_device
> > > > snd_pcm sp5100_tco k10temp i2c_piix4 snd_timer thinkpad_acpi
> > > > ledtrig_audio snd wmi soundcore video i2c_scmi acpi_cpufreq
> > > > ip_tables amdgpu(O) rtsx_pci_sdmmc amd_iommu_v2 gpu_sched
> mmc_core
> > > > i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt
> > > > fb_sys_fops cec drm crc32c_intel serio_raw hid_multitouch r8152
> > > > mii nvme r8169 nvme_core rtsx_pci pinctrl_amd
> > > > CPU: 5 PID: 1511 Comm: gnome-shell Tainted: G           O
> 5.5.0-
> > > > rc7Lyude-Test+ #4
> > > > Hardware name: LENOVO FA495SIT26/FA495SIT26, BIOS
> R12ET22W(0.22 )
> > > > 01/31/2019
> > > > RIP: 0010:update_mst_stream_alloc_table+0x11e/0x130 [amdgpu]
> > > > Code: 28 00 00 00 75 2b 48 8d 65 e0 5b 41 5c 41 5d 41 5e 5d c3 0f
> > > > b6 06
> > > > 49 89 1c 24 41 88 44 24 08 0f b6 46 01 41 88 44 24 09 eb 93 <0f>
> > > > 0b e9 2f ff ff ff e8 a6 82 a3 c2 66 0f 1f 44 00 00 0f 1f 44 00
> > > > RSP: 0018:ffffac428127f5b0 EFLAGS: 00010202
> > > > RAX: 0000000000000002 RBX: ffff8d1e166eee80 RCX:
> 0000000000000000
> > > > RDX: ffffac428127f668 RSI: ffff8d1e166eee80 RDI: ffffac428127f610
> > > > RBP: ffffac428127f640 R08: ffffffffc03d94a8 R09: 0000000000000000
> > > > R10: ffff8d1e24b02000 R11: ffffac428127f5b0 R12: ffff8d1e1b83d000
> > > > R13: ffff8d1e1bea0b08 R14: 0000000000000002 R15:
> 0000000000000002
> > > > FS:  00007fab23ffcd80(0000) GS:ffff8d1e28b40000(0000)
> > > > knlGS:0000000000000000
> > > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > CR2: 00007f151f1711e8 CR3: 00000005997c0000 CR4:
> 00000000003406e0
> > > > Call Trace:
> > > >   ? mutex_lock+0xe/0x30
> > > >   dc_link_allocate_mst_payload+0x9a/0x210 [amdgpu]
> > > >   ? dm_read_reg_func+0x39/0xb0 [amdgpu]
> > > >   ? core_link_enable_stream+0x656/0x730 [amdgpu]
> > > >   core_link_enable_stream+0x656/0x730 [amdgpu]
> > > >   dce110_apply_ctx_to_hw+0x58e/0x5d0 [amdgpu]
> > > >   ? dcn10_verify_allow_pstate_change_high+0x1d/0x280 [amdgpu]
> > > >   ? dcn10_wait_for_mpcc_disconnect+0x3c/0x130 [amdgpu]
> > > >   dc_commit_state+0x292/0x770 [amdgpu]
> > > >   ? add_timer+0x101/0x1f0
> > > >   ? ttm_bo_put+0x1a1/0x2f0 [ttm]
> > > >   amdgpu_dm_atomic_commit_tail+0xb59/0x1ff0 [amdgpu]
> > > >   ? amdgpu_move_blit.constprop.0+0xb8/0x1f0 [amdgpu]
> > > >   ? amdgpu_bo_move+0x16d/0x2b0 [amdgpu]
> > > >   ? ttm_bo_handle_move_mem+0x118/0x570 [ttm]
> > > >   ? ttm_bo_validate+0x134/0x150 [ttm]
> > > >   ? dm_plane_helper_prepare_fb+0x1b9/0x2a0 [amdgpu]
> > > >   ? _cond_resched+0x15/0x30
> > > >   ? wait_for_completion_timeout+0x38/0x160
> > > >   ? _cond_resched+0x15/0x30
> > > >   ? wait_for_completion_interruptible+0x33/0x190
> > > >   commit_tail+0x94/0x130 [drm_kms_helper]
> > > >   drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
> > > >   drm_atomic_helper_set_config+0x70/0xb0 [drm_kms_helper]
> > > >   drm_mode_setcrtc+0x194/0x6a0 [drm]
> > > >   ? _cond_resched+0x15/0x30
> > > >   ? mutex_lock+0xe/0x30
> > > >   ? drm_mode_getcrtc+0x180/0x180 [drm]
> > > >   drm_ioctl_kernel+0xaa/0xf0 [drm]
> > > >   drm_ioctl+0x208/0x390 [drm]
> > > >   ? drm_mode_getcrtc+0x180/0x180 [drm]
> > > >   amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
> > > >   do_vfs_ioctl+0x458/0x6d0
> > > >   ksys_ioctl+0x5e/0x90
> > > >   __x64_sys_ioctl+0x16/0x20
> > > >   do_syscall_64+0x55/0x1b0
> > > >   entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > > > RIP: 0033:0x7fab2121f87b
> > > > Code: 0f 1e fa 48 8b 05 0d 96 2c 00 64 c7 00 26 00 00 00 48 c7 c0
> > > > ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05
> > > > <48> 3d 01
> > > > f0 ff ff 73 01 c3 48 8b 0d dd 95 2c 00 f7 d8 64 89 01 48
> > > > RSP: 002b:00007ffd045f9068 EFLAGS: 00000246 ORIG_RAX:
> > > > 0000000000000010
> > > > RAX: ffffffffffffffda RBX: 00007ffd045f90a0 RCX: 00007fab2121f87b
> > > > RDX: 00007ffd045f90a0 RSI: 00000000c06864a2 RDI: 000000000000000b
> > > > RBP: 00007ffd045f90a0 R08: 0000000000000000 R09:
> 000055dbd2985d10
> > > > R10: 000055dbd2196280 R11: 0000000000000246 R12:
> 00000000c06864a2
> > > > R13: 000000000000000b R14: 0000000000000000 R15:
> 000055dbd2196280
> > > > ---[ end trace 6ea888c24d2059cd ]---
> > > >
> > > > Note as well, I have only been able to reproduce this on setups
> > > > with 2 MST displays.
> > > >
> > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > Cc: stable@vger.kernel.org
> > >
> > > LGTM but would like Mikita or Wayne to have a look as well.
> > > Acked-by: Harry Wentland <harry.wentland@amd.com>
> >
> > I think its a good change and it definetely helps to deal with
> > discreptency between drm and dc payload allocation tables.
> > But I think we might not even need extra enable checks.
> 
> I think you're right here, I'll remove those in the next respin
> 
> >
> > > Harry
> > >
> > > > ---
> > > >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 7
> ++++---
> > > >   1 file changed, 4 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git
> > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > > index 069b7a6f5597..252fa60c6775 100644
> > > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > > @@ -216,6 +216,7 @@ bool
> > > > dm_helpers_dp_mst_write_payload_allocation_table(
> > > >   		drm_dp_mst_reset_vcpi_slots(mst_mgr, mst_port);
> > > >   	}
> > > >
> > > > +	/* If disabling, it's OK for this to fail */
> > > >   	ret = drm_dp_update_payload_part1(mst_mgr);
> > > >
> > > >   	/* mst_mgr->->payloads are VC payload notify MST branch using
> > > > DPCD or @@ -225,7 +226,7 @@ bool
> > > > dm_helpers_dp_mst_write_payload_allocation_table(
> > > >
> > > >   	get_payload_table(aconnector, proposed_table);
> > > >
> > > > -	if (ret)
> > > > +	if (ret && !enable)
> > > >   		return false;
> >
> > Wouldn't it be better to check ret value, and instead of returning
> > false just throw DRM_ERROR message, since drm_dp_update_payload_part1
> > only returns error if a port is not validated?
> 
> You're right on avoiding returning here, that's probably a better idea since we
> want all steps to be run even if they don't succeed. I think we can skip the
> error message though, it's expected that modesets which disable displays will
> happen on ports that no longer can be validated.
> 
> >
> > Thank you,
> > Mikita
> >
> > > >
> > > >   	return true;
> > > > @@ -299,9 +300,9 @@ bool
> dm_helpers_dp_mst_send_payload_allocation(
> > > >   	if (!mst_mgr->mst_state)
> > > >   		return false;
> > > >
> > > > +	/* If disabling, it's OK for this to fail */
> > > >   	ret = drm_dp_update_payload_part2(mst_mgr);
> > > > -
> > > > -	if (ret)
> > > > +	if (enable && ret)
> > > >   		return false;
> > > >
> > > >   	if (!enable)
> --
> Cheers,
> 	Lyude Paul
--
Best regards,
Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
