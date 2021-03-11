Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 797803372C4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 13:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC186EC3D;
	Thu, 11 Mar 2021 12:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299E06EC3D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 12:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 50401411E1;
 Thu, 11 Mar 2021 13:36:11 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=hvIgd64K; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hqQ30YBRBb-H; Thu, 11 Mar 2021 13:36:07 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id C35F640FAE;
 Thu, 11 Mar 2021 13:36:06 +0100 (CET)
Received: from [192.168.0.209] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 6C2A1360133;
 Thu, 11 Mar 2021 13:36:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1615466166; bh=Tqsnm7suQcYJFYZ/i4jrfbfSAjsNHPZv+3+LlmUgYHQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hvIgd64KlorxV+ZGTrzG6O+h/3xyK7EqjkFMmDlkN+IarItqTGYPeCoKw6e2yBDg+
 2u6qKkx1JhcecvO8IoeH9AZxxYOfS2dbhbRFEj502hNTnDR52fGD+zhc0qf9hN4Nn6
 1OOohUfE7EkTT0wkjNCA0beclKFJL7bdamFyVWac=
Subject: Re: AW: vmwgfx leaking bo pins?
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-graphics-maintainer@vmware.com" <linux-graphics-maintainer@vmware.com>
References: <09ebc5cf-3e2c-d233-2c58-ff4d72e01297@shipmail.org>
 <MN2PR12MB3775316F45FA7329F375D5F483909@MN2PR12MB3775.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <bb6866f1-13c0-4460-0d41-1fba78efb6e2@shipmail.org>
Date: Thu, 11 Mar 2021 13:36:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <MN2PR12MB3775316F45FA7329F375D5F483909@MN2PR12MB3775.namprd12.prod.outlook.com>
Content-Language: en-US
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1560052421=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1560052421==
Content-Type: multipart/alternative;
 boundary="------------51E18E1EB96B4E926589E288"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------51E18E1EB96B4E926589E288
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 3/11/21 12:32 PM, Koenig, Christian wrote:
> We are investigating a similar problem with radeon.
>
> So far no idea what's going wrong since it doesn't seem to happen with 
> amdgpu.
>
> If you have an idea please speak up :)

Sure. No idea ATM. Was just fiddling a bit with vmwgfx to experiment 
with the fix for the huge page-table-entry issue.

/Thomas


>
> Thanks,
> Christian.
> ------------------------------------------------------------------------
> *Von:* Thomas Hellström (Intel) <thomas_os@shipmail.org>
> *Gesendet:* Donnerstag, 11. März 2021 11:46
> *An:* Daniel Vetter <daniel.vetter@ffwll.ch>; Koenig, Christian 
> <Christian.Koenig@amd.com>; linux-graphics-maintainer@vmware.com 
> <linux-graphics-maintainer@vmware.com>
> *Cc:* DRI Development <dri-devel@lists.freedesktop.org>
> *Betreff:* vmwgfx leaking bo pins?
> Hi,
>
> I tried latest drm-fixes today and saw a lot of these: Fallout from ttm
> rework?
>
> /Thomas
>
> [  298.404788] WARNING: CPU: 1 PID: 3839 at
> drivers/gpu/drm/ttm/ttm_bo.c:512 ttm_bo_release+0x2b5/0x300 [ttm]
> [  298.404795] Modules linked in: nls_utf8 isofs rfcomm tun bridge stp
> llc ip6table_nat ip6table_mangle ip6table_raw ip6table_security
> iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 libcrc32c nf_defrag_ipv4
> iptable_mangle iptable_raw iptable_security ip_set nfnetlink
> ip6table_filter ip6_tables iptable_filter cmac bnep vsock_loopback
> vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock
> snd_seq_midi snd_seq_midi_event intel_rapl_msr snd_ens1371
> snd_ac97_codec ac97_bus vmw_balloon intel_rapl_common snd_seq rapl
> snd_pcm btusb btrtl btbcm btintel bluetooth joydev gameport snd_timer
> snd_rawmidi snd_seq_device rfkill snd ecdh_generic vmw_vmci ecc
> soundcore i2c_piix4 auth_rpcgss sunrpc ip_tables vmwgfx drm_kms_helper
> cec ttm e1000 crct10dif_pclmul crc32_pclmul crc32c_intel
> ghash_clmulni_intel drm mptspi serio_raw scsi_transport_spi mptscsih
> mptbase ata_generic pata_acpi uas usb_storage fuse
> [  298.404837] CPU: 1 PID: 3839 Comm: thunderbird Tainted: G
> W         5.12.0-rc2+ #42
> [  298.404839] Hardware name: VMware, Inc. VMware Virtual Platform/440BX
> Desktop Reference Platform, BIOS 6.00 07/29/2019
> [  298.404840] RIP: 0010:ttm_bo_release+0x2b5/0x300 [ttm]
> [  298.404845] Code: e8 a0 f3 35 ce e9 da fd ff ff 49 8b 7e 90 b9 30 75
> 00 00 31 d2 be 01 00 00 00 e8 c6 17 36 ce 49 8b 46 e0 eb 9e 48 89 e8 eb
> 99 <0f> 0b 41 c7 86 94 00 00 00 00 00 00 00 49 8d 76 08 31 d2 4c 89 ef
> [  298.404847] RSP: 0018:ffffb24a43ef3bd0 EFLAGS: 00010202
> [  298.404848] RAX: 0000000000000001 RBX: 0000000000000000 RCX:
> 0000000000000001
> [  298.404850] RDX: 0000000000000001 RSI: 0000000000000246 RDI:
> ffffffffc03c50e8
> [  298.404851] RBP: ffff9ad4429f2620 R08: 0000000000000001 R09:
> ffff9ad4429f2000
> [  298.404852] R10: ffff9ad48664e090 R11: 0000000000000000 R12:
> ffff9ad4e71371d0
> [  298.404852] R13: ffff9ad4e7137000 R14: ffff9ad4e7137168 R15:
> ffff9ad48710f4c0
> [  298.404854] FS:  00007fc6d9ae4780(0000) GS:ffff9ad576e40000(0000)
> knlGS:0000000000000000
> [  298.404855] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  298.404857] CR2: 00007fc6c6740000 CR3: 00000001a4eac004 CR4:
> 00000000003706e0
> [  298.404864] Call Trace:
> [  298.404866]  vmw_resource_release+0x131/0x1f0 [vmwgfx]
> [  298.404878] vmw_context_cotables_unref.isra.0+0x6f/0xa0 [vmwgfx]
> [  298.404891]  vmw_resource_release+0x16a/0x1f0 [vmwgfx]
> [  298.404901]  vmw_user_context_base_release+0x31/0x50 [vmwgfx]
> [  298.404912]  ttm_release_base+0x7f/0xc0 [vmwgfx]
> [  298.404922]  ttm_ref_object_release+0xde/0xf0 [vmwgfx]
> [  298.404931]  ttm_ref_object_base_unref+0x8e/0xb0 [vmwgfx]
> [  298.404940]  ? vmw_dx_context_unbind+0x1e0/0x1e0 [vmwgfx]
> [  298.404951]  drm_ioctl_kernel+0xaa/0xf0 [drm]
> [  298.404974]  drm_ioctl+0x20f/0x3a0 [drm]
> [  298.404991]  ? vmw_dx_context_unbind+0x1e0/0x1e0 [vmwgfx]
> [  298.405003]  ? selinux_file_ioctl+0x135/0x230
> [  298.405006]  ? drm_version+0x90/0x90 [drm]
> [  298.405023]  vmw_generic_ioctl+0xab/0x150 [vmwgfx]
> [  298.405033]  __x64_sys_ioctl+0x83/0xb0
> [  298.405035]  do_syscall_64+0x33/0x40
> [  298.405038]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  298.405041] RIP: 0033:0x7fc6d9be15db
> [  298.405042] Code: 89 d8 49 8d 3c 1c 48 f7 d8 49 39 c4 72 b5 e8 1c ff
> ff ff 85 c0 78 ba 4c 89 e0 5b 5d 41 5c c3 f3 0f 1e fa b8 10 00 00 00 0f
> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 6d b8 0c 00 f7 d8 64 89 01 48
> [  298.405044] RSP: 002b:00007ffc8ce6de98 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [  298.405046] RAX: ffffffffffffffda RBX: 00007ffc8ce6dee0 RCX:
> 00007fc6d9be15db
> [  298.405048] RDX: 00007ffc8ce6dee0 RSI: 0000000040086448 RDI:
> 0000000000000007
> [  298.405049] RBP: 0000000040086448 R08: 0000000000000000 R09:
> 0000000000000000
> [  298.405050] R10: 0000000000000000 R11: 0000000000000246 R12:
> 00007fc6d98e0000
> [  298.405051] R13: 0000000000000007 R14: 00007fc6d98ea3b0 R15:
> 00007fc6c671f800
> [  298.405053] ---[ end trace c628fb3ea8b5aa96 ]---
>

--------------51E18E1EB96B4E926589E288
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/11/21 12:32 PM, Koenig, Christian
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:MN2PR12MB3775316F45FA7329F375D5F483909@MN2PR12MB3775.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <div style="font-family: &quot;segoe ui westeuropean&quot;,
        &quot;segoe ui&quot;, helvetica, arial, sans-serif; font-size:
        12pt; color: rgb(0, 0, 0);">
        We are investigating a similar problem with radeon.</div>
      <div style="font-family: &quot;segoe ui westeuropean&quot;,
        &quot;segoe ui&quot;, helvetica, arial, sans-serif; font-size:
        12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: &quot;segoe ui westeuropean&quot;,
        &quot;segoe ui&quot;, helvetica, arial, sans-serif; font-size:
        12pt; color: rgb(0, 0, 0);">
        So far no idea what's going wrong since it doesn't seem to
        happen with amdgpu.</div>
      <div style="font-family: &quot;segoe ui westeuropean&quot;,
        &quot;segoe ui&quot;, helvetica, arial, sans-serif; font-size:
        12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: &quot;segoe ui westeuropean&quot;,
        &quot;segoe ui&quot;, helvetica, arial, sans-serif; font-size:
        12pt; color: rgb(0, 0, 0);">
        If you have an idea please speak up :)</div>
    </blockquote>
    <p>Sure. No idea ATM. Was just fiddling a bit with vmwgfx to
      experiment with the fix for the huge page-table-entry issue.<br>
    </p>
    <p>/Thomas</p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:MN2PR12MB3775316F45FA7329F375D5F483909@MN2PR12MB3775.namprd12.prod.outlook.com">
      <div style="font-family: &quot;segoe ui westeuropean&quot;,
        &quot;segoe ui&quot;, helvetica, arial, sans-serif; font-size:
        12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: &quot;segoe ui westeuropean&quot;,
        &quot;segoe ui&quot;, helvetica, arial, sans-serif; font-size:
        12pt; color: rgb(0, 0, 0);">
        Thanks,</div>
      <div style="font-family: &quot;segoe ui westeuropean&quot;,
        &quot;segoe ui&quot;, helvetica, arial, sans-serif; font-size:
        12pt; color: rgb(0, 0, 0);">
        Christian.</div>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
          face="Calibri, sans-serif" color="#000000"><b>Von:</b> Thomas
          Hellström (Intel) <a class="moz-txt-link-rfc2396E" href="mailto:thomas_os@shipmail.org">&lt;thomas_os@shipmail.org&gt;</a><br>
          <b>Gesendet:</b> Donnerstag, 11. März 2021 11:46<br>
          <b>An:</b> Daniel Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel.vetter@ffwll.ch">&lt;daniel.vetter@ffwll.ch&gt;</a>;
          Koenig, Christian <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>;
          <a class="moz-txt-link-abbreviated" href="mailto:linux-graphics-maintainer@vmware.com">linux-graphics-maintainer@vmware.com</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:linux-graphics-maintainer@vmware.com">&lt;linux-graphics-maintainer@vmware.com&gt;</a><br>
          <b>Cc:</b> DRI Development
          <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a><br>
          <b>Betreff:</b> vmwgfx leaking bo pins?</font>
        <div> </div>
      </div>
      <div class="BodyFragment"><font size="2"><span
            style="font-size:11pt;">
            <div class="PlainText">Hi,<br>
              <br>
              I tried latest drm-fixes today and saw a lot of these:
              Fallout from ttm <br>
              rework?<br>
              <br>
              /Thomas<br>
              <br>
              [  298.404788] WARNING: CPU: 1 PID: 3839 at <br>
              drivers/gpu/drm/ttm/ttm_bo.c:512
              ttm_bo_release+0x2b5/0x300 [ttm]<br>
              [  298.404795] Modules linked in: nls_utf8 isofs rfcomm
              tun bridge stp <br>
              llc ip6table_nat ip6table_mangle ip6table_raw
              ip6table_security <br>
              iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 libcrc32c
              nf_defrag_ipv4 <br>
              iptable_mangle iptable_raw iptable_security ip_set
              nfnetlink <br>
              ip6table_filter ip6_tables iptable_filter cmac bnep
              vsock_loopback <br>
              vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport
              vsock <br>
              snd_seq_midi snd_seq_midi_event intel_rapl_msr snd_ens1371
              <br>
              snd_ac97_codec ac97_bus vmw_balloon intel_rapl_common
              snd_seq rapl <br>
              snd_pcm btusb btrtl btbcm btintel bluetooth joydev
              gameport snd_timer <br>
              snd_rawmidi snd_seq_device rfkill snd ecdh_generic
              vmw_vmci ecc <br>
              soundcore i2c_piix4 auth_rpcgss sunrpc ip_tables vmwgfx
              drm_kms_helper <br>
              cec ttm e1000 crct10dif_pclmul crc32_pclmul crc32c_intel <br>
              ghash_clmulni_intel drm mptspi serio_raw
              scsi_transport_spi mptscsih <br>
              mptbase ata_generic pata_acpi uas usb_storage fuse<br>
              [  298.404837] CPU: 1 PID: 3839 Comm: thunderbird Tainted:
              G        <br>
              W         5.12.0-rc2+ #42<br>
              [  298.404839] Hardware name: VMware, Inc. VMware Virtual
              Platform/440BX <br>
              Desktop Reference Platform, BIOS 6.00 07/29/2019<br>
              [  298.404840] RIP: 0010:ttm_bo_release+0x2b5/0x300 [ttm]<br>
              [  298.404845] Code: e8 a0 f3 35 ce e9 da fd ff ff 49 8b
              7e 90 b9 30 75 <br>
              00 00 31 d2 be 01 00 00 00 e8 c6 17 36 ce 49 8b 46 e0 eb
              9e 48 89 e8 eb <br>
              99 &lt;0f&gt; 0b 41 c7 86 94 00 00 00 00 00 00 00 49 8d 76
              08 31 d2 4c 89 ef<br>
              [  298.404847] RSP: 0018:ffffb24a43ef3bd0 EFLAGS: 00010202<br>
              [  298.404848] RAX: 0000000000000001 RBX: 0000000000000000
              RCX: <br>
              0000000000000001<br>
              [  298.404850] RDX: 0000000000000001 RSI: 0000000000000246
              RDI: <br>
              ffffffffc03c50e8<br>
              [  298.404851] RBP: ffff9ad4429f2620 R08: 0000000000000001
              R09: <br>
              ffff9ad4429f2000<br>
              [  298.404852] R10: ffff9ad48664e090 R11: 0000000000000000
              R12: <br>
              ffff9ad4e71371d0<br>
              [  298.404852] R13: ffff9ad4e7137000 R14: ffff9ad4e7137168
              R15: <br>
              ffff9ad48710f4c0<br>
              [  298.404854] FS:  00007fc6d9ae4780(0000)
              GS:ffff9ad576e40000(0000) <br>
              knlGS:0000000000000000<br>
              [  298.404855] CS:  0010 DS: 0000 ES: 0000 CR0:
              0000000080050033<br>
              [  298.404857] CR2: 00007fc6c6740000 CR3: 00000001a4eac004
              CR4: <br>
              00000000003706e0<br>
              [  298.404864] Call Trace:<br>
              [  298.404866]  vmw_resource_release+0x131/0x1f0 [vmwgfx]<br>
              [  298.404878] 
              vmw_context_cotables_unref.isra.0+0x6f/0xa0 [vmwgfx]<br>
              [  298.404891]  vmw_resource_release+0x16a/0x1f0 [vmwgfx]<br>
              [  298.404901]  vmw_user_context_base_release+0x31/0x50
              [vmwgfx]<br>
              [  298.404912]  ttm_release_base+0x7f/0xc0 [vmwgfx]<br>
              [  298.404922]  ttm_ref_object_release+0xde/0xf0 [vmwgfx]<br>
              [  298.404931]  ttm_ref_object_base_unref+0x8e/0xb0
              [vmwgfx]<br>
              [  298.404940]  ? vmw_dx_context_unbind+0x1e0/0x1e0
              [vmwgfx]<br>
              [  298.404951]  drm_ioctl_kernel+0xaa/0xf0 [drm]<br>
              [  298.404974]  drm_ioctl+0x20f/0x3a0 [drm]<br>
              [  298.404991]  ? vmw_dx_context_unbind+0x1e0/0x1e0
              [vmwgfx]<br>
              [  298.405003]  ? selinux_file_ioctl+0x135/0x230<br>
              [  298.405006]  ? drm_version+0x90/0x90 [drm]<br>
              [  298.405023]  vmw_generic_ioctl+0xab/0x150 [vmwgfx]<br>
              [  298.405033]  __x64_sys_ioctl+0x83/0xb0<br>
              [  298.405035]  do_syscall_64+0x33/0x40<br>
              [  298.405038]  entry_SYSCALL_64_after_hwframe+0x44/0xae<br>
              [  298.405041] RIP: 0033:0x7fc6d9be15db<br>
              [  298.405042] Code: 89 d8 49 8d 3c 1c 48 f7 d8 49 39 c4
              72 b5 e8 1c ff <br>
              ff ff 85 c0 78 ba 4c 89 e0 5b 5d 41 5c c3 f3 0f 1e fa b8
              10 00 00 00 0f <br>
              05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d 6d b8 0c 00
              f7 d8 64 89 01 48<br>
              [  298.405044] RSP: 002b:00007ffc8ce6de98 EFLAGS: 00000246
              ORIG_RAX: <br>
              0000000000000010<br>
              [  298.405046] RAX: ffffffffffffffda RBX: 00007ffc8ce6dee0
              RCX: <br>
              00007fc6d9be15db<br>
              [  298.405048] RDX: 00007ffc8ce6dee0 RSI: 0000000040086448
              RDI: <br>
              0000000000000007<br>
              [  298.405049] RBP: 0000000040086448 R08: 0000000000000000
              R09: <br>
              0000000000000000<br>
              [  298.405050] R10: 0000000000000000 R11: 0000000000000246
              R12: <br>
              00007fc6d98e0000<br>
              [  298.405051] R13: 0000000000000007 R14: 00007fc6d98ea3b0
              R15: <br>
              00007fc6c671f800<br>
              [  298.405053] ---[ end trace c628fb3ea8b5aa96 ]---<br>
              <br>
            </div>
          </span></font></div>
    </blockquote>
  </body>
</html>

--------------51E18E1EB96B4E926589E288--

--===============1560052421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1560052421==--
