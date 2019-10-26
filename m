Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD36E59E4
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 13:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815E16EC19;
	Sat, 26 Oct 2019 11:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id DD0746EC19
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2019 11:12:52 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D2503720E2; Sat, 26 Oct 2019 11:12:52 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112138] [kernel 5.4-rc4][amdgpu][CIK]: [drm]
 dce110_link_encoder_construct: Failed to get encoder_cap_info from VBIOS with
 error code 4!
Date: Sat, 26 Oct 2019 11:12:51 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-112138-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0086285040=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0086285040==
Content-Type: multipart/alternative; boundary="15720883720.600a3d5.8647"
Content-Transfer-Encoding: 7bit


--15720883720.600a3d5.8647
Date: Sat, 26 Oct 2019 11:12:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112138

            Bug ID: 112138
           Summary: [kernel 5.4-rc4][amdgpu][CIK]: [drm]
                    dce110_link_encoder_construct: Failed to get
                    encoder_cap_info from VBIOS with error code 4!
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: erhard_f@mailbox.org

Created attachment 145821
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145821&action=3Dedit
dmesg (kernel 5.4-rc4)

My card (Radeon R9 290 Tri-X) tells me 3 times it fails to get get
encoder_cap_info from VBIOS with error code 4.

[...]
[    6.084919] [drm] amdgpu kernel modesetting enabled.
[    6.086395] CRAT table not found
[    6.086493] Virtual CRAT table created for CPU
[    6.086560] Parsing CRAT table with 2 nodes
[    6.086755] Creating topology SYSFS entries
[    6.088841] Topology: Add CPU node
[    6.088952] Finished initializing topology
[    6.090354] amdgpu 0000:01:00.0: remove_conflicting_pci_framebuffers: ba=
r 0:
0xd0000000 -> 0xdfffffff
[    6.090480] amdgpu 0000:01:00.0: remove_conflicting_pci_framebuffers: ba=
r 2:
0xcf800000 -> 0xcfffffff
[    6.090601] amdgpu 0000:01:00.0: remove_conflicting_pci_framebuffers: ba=
r 5:
0xfe980000 -> 0xfe9bffff
[    6.102438] [drm] initializing kernel modesetting (HAWAII 0x1002:0x67B0
0x174B:0xE285 0x00).
[    6.102810] [drm] register mmio base: 0xFE980000
[    6.102906] [drm] register mmio size: 262144
[    6.103008] [drm] PCIE atomic ops is not supported
[    6.103115] [drm] add ip block number 0 <cik_common>
[    6.103211] [drm] add ip block number 1 <gmc_v7_0>
[    6.103312] [drm] add ip block number 2 <cik_ih>
[    6.103402] [drm] add ip block number 3 <gfx_v7_0>
[    6.103497] [drm] add ip block number 4 <cik_sdma>
[    6.103604] [drm] add ip block number 5 <powerplay>
[    6.103705] [drm] add ip block number 6 <dm>
[    6.103812] [drm] add ip block number 7 <uvd_v4_2>
[    6.103912] [drm] add ip block number 8 <vce_v2_0>
[    6.104297] resource sanity check: requesting [mem 0x000c0000-0x000dffff=
],
which spans more than PCI Bus 0000:00 [mem 0x000d0000-0x000dffff window]
[    6.104497] caller pci_map_rom+0x65/0x180 mapping multiple BARs
[    6.106500] ATOM BIOS: 113-C6710100-O05
[    6.108480] [drm] vm size is 128 GB, 2 levels, block size is 10-bit,
fragment size is 9-bit
[    6.114123] e1000e 0000:02:00.0 enp2s0: renamed from eth0
[    6.121192] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001,
bcdDevice=3D 5.04
[    6.121329] usb usb3: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    6.121454] usb usb3: Product: OHCI PCI host controller
[    6.121559] usb usb3: Manufacturer: Linux 5.4.0-rc4 ohci_hcd
[    6.121667] usb usb3: SerialNumber: 0000:00:12.0
[    6.125828] hub 3-0:1.0: USB hub found
[    6.126006] hub 3-0:1.0: 3 ports detected
[    6.136409] ohci-pci 0000:00:12.1: OHCI PCI host controller
[    6.136686] ohci-pci 0000:00:12.1: new USB bus registered, assigned bus
number 4
[    6.137314] ohci-pci 0000:00:12.1: irq 16, io mem 0xfe8fe000
[    6.139369] amdgpu 0000:01:00.0: VRAM: 4096M 0x000000F400000000 -
0x000000F4FFFFFFFF (4096M used)
[    6.139505] amdgpu 0000:01:00.0: GART: 1024M 0x000000FF00000000 -
0x000000FF3FFFFFFF
[    6.139651] [drm] Detected VRAM RAM=3D4096M, BAR=3D256M
[    6.139747] [drm] RAM width 512bits GDDR5
[    6.143904] [TTM] Zone  kernel: Available graphics memory: 16436068 KiB
[    6.144093] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[    6.144194] [TTM] Initializing pool allocator
[    6.144667] [TTM] Initializing DMA pool allocator
[    6.146087] [drm] amdgpu: 4096M of VRAM memory ready
[    6.146348] [drm] amdgpu: 4096M of GTT memory ready.
[    6.147358] [drm] GART: num cpu pages 262144, num gpu pages 262144
[    6.148692] [drm] PCIE GART of 1024M enabled (table at 0x000000F40090000=
0).
[    6.181882] amdgpu: [powerplay] hwmgr_sw_init smu backed is ci_smu
[    6.187238] [drm] Found UVD firmware Version: 1.64 Family ID: 9
[    6.190278] [drm] Found VCE firmware Version: 50.10 Binary ID: 2
[    6.201941] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001,
bcdDevice=3D 5.04
[    6.202059] usb usb4: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    6.202165] usb usb4: Product: OHCI PCI host controller
[    6.202318] usb usb4: Manufacturer: Linux 5.4.0-rc4 ohci_hcd
[    6.202411] usb usb4: SerialNumber: 0000:00:12.1
[    6.204076] [drm] PCIE gen 2 link speeds already enabled
[    6.205321] hub 4-0:1.0: USB hub found
[    6.205841] hub 4-0:1.0: 3 ports detected
[    6.294583] ohci-pci 0000:00:13.0: OHCI PCI host controller
[    6.294691] ohci-pci 0000:00:13.0: new USB bus registered, assigned bus
number 5
[    6.295006] ohci-pci 0000:00:13.0: irq 18, io mem 0xfe8f7000
[    6.316082] [drm] dce110_link_encoder_construct: Failed to get
encoder_cap_info from VBIOS with error code 4!
[    6.316555] [drm] dce110_link_encoder_construct: Failed to get
encoder_cap_info from VBIOS with error code 4!
[    6.317065] [drm] dce110_link_encoder_construct: Failed to get
encoder_cap_info from VBIOS with error code 4!
[    6.317673] [drm] Display Core initialized with v3.2.48!
[...]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15720883720.600a3d5.8647
Date: Sat, 26 Oct 2019 11:12:52 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [kernel 5.4-rc4][amdgpu][CIK]: [drm] dce110_link_encoder_=
construct: Failed to get encoder_cap_info from VBIOS with error code 4!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112138">112138</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[kernel 5.4-rc4][amdgpu][CIK]: [drm] dce110_link_encoder_cons=
truct: Failed to get encoder_cap_info from VBIOS with error code 4!
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>DRI git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>erhard_f&#64;mailbox.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145821=
" name=3D"attach_145821" title=3D"dmesg (kernel 5.4-rc4)">attachment 145821=
</a> <a href=3D"attachment.cgi?id=3D145821&amp;action=3Dedit" title=3D"dmes=
g (kernel 5.4-rc4)">[details]</a></span>
dmesg (kernel 5.4-rc4)

My card (Radeon R9 290 Tri-X) tells me 3 times it fails to get get
encoder_cap_info from VBIOS with error code 4.

[...]
[    6.084919] [drm] amdgpu kernel modesetting enabled.
[    6.086395] CRAT table not found
[    6.086493] Virtual CRAT table created for CPU
[    6.086560] Parsing CRAT table with 2 nodes
[    6.086755] Creating topology SYSFS entries
[    6.088841] Topology: Add CPU node
[    6.088952] Finished initializing topology
[    6.090354] amdgpu 0000:01:00.0: remove_conflicting_pci_framebuffers: ba=
r 0:
0xd0000000 -&gt; 0xdfffffff
[    6.090480] amdgpu 0000:01:00.0: remove_conflicting_pci_framebuffers: ba=
r 2:
0xcf800000 -&gt; 0xcfffffff
[    6.090601] amdgpu 0000:01:00.0: remove_conflicting_pci_framebuffers: ba=
r 5:
0xfe980000 -&gt; 0xfe9bffff
[    6.102438] [drm] initializing kernel modesetting (HAWAII 0x1002:0x67B0
0x174B:0xE285 0x00).
[    6.102810] [drm] register mmio base: 0xFE980000
[    6.102906] [drm] register mmio size: 262144
[    6.103008] [drm] PCIE atomic ops is not supported
[    6.103115] [drm] add ip block number 0 &lt;cik_common&gt;
[    6.103211] [drm] add ip block number 1 &lt;gmc_v7_0&gt;
[    6.103312] [drm] add ip block number 2 &lt;cik_ih&gt;
[    6.103402] [drm] add ip block number 3 &lt;gfx_v7_0&gt;
[    6.103497] [drm] add ip block number 4 &lt;cik_sdma&gt;
[    6.103604] [drm] add ip block number 5 &lt;powerplay&gt;
[    6.103705] [drm] add ip block number 6 &lt;dm&gt;
[    6.103812] [drm] add ip block number 7 &lt;uvd_v4_2&gt;
[    6.103912] [drm] add ip block number 8 &lt;vce_v2_0&gt;
[    6.104297] resource sanity check: requesting [mem 0x000c0000-0x000dffff=
],
which spans more than PCI Bus 0000:00 [mem 0x000d0000-0x000dffff window]
[    6.104497] caller pci_map_rom+0x65/0x180 mapping multiple BARs
[    6.106500] ATOM BIOS: 113-C6710100-O05
[    6.108480] [drm] vm size is 128 GB, 2 levels, block size is 10-bit,
fragment size is 9-bit
[    6.114123] e1000e 0000:02:00.0 enp2s0: renamed from eth0
[    6.121192] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001,
bcdDevice=3D 5.04
[    6.121329] usb usb3: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    6.121454] usb usb3: Product: OHCI PCI host controller
[    6.121559] usb usb3: Manufacturer: Linux 5.4.0-rc4 ohci_hcd
[    6.121667] usb usb3: SerialNumber: 0000:00:12.0
[    6.125828] hub 3-0:1.0: USB hub found
[    6.126006] hub 3-0:1.0: 3 ports detected
[    6.136409] ohci-pci 0000:00:12.1: OHCI PCI host controller
[    6.136686] ohci-pci 0000:00:12.1: new USB bus registered, assigned bus
number 4
[    6.137314] ohci-pci 0000:00:12.1: irq 16, io mem 0xfe8fe000
[    6.139369] amdgpu 0000:01:00.0: VRAM: 4096M 0x000000F400000000 -
0x000000F4FFFFFFFF (4096M used)
[    6.139505] amdgpu 0000:01:00.0: GART: 1024M 0x000000FF00000000 -
0x000000FF3FFFFFFF
[    6.139651] [drm] Detected VRAM RAM=3D4096M, BAR=3D256M
[    6.139747] [drm] RAM width 512bits GDDR5
[    6.143904] [TTM] Zone  kernel: Available graphics memory: 16436068 KiB
[    6.144093] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[    6.144194] [TTM] Initializing pool allocator
[    6.144667] [TTM] Initializing DMA pool allocator
[    6.146087] [drm] amdgpu: 4096M of VRAM memory ready
[    6.146348] [drm] amdgpu: 4096M of GTT memory ready.
[    6.147358] [drm] GART: num cpu pages 262144, num gpu pages 262144
[    6.148692] [drm] PCIE GART of 1024M enabled (table at 0x000000F40090000=
0).
[    6.181882] amdgpu: [powerplay] hwmgr_sw_init smu backed is ci_smu
[    6.187238] [drm] Found UVD firmware Version: 1.64 Family ID: 9
[    6.190278] [drm] Found VCE firmware Version: 50.10 Binary ID: 2
[    6.201941] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001,
bcdDevice=3D 5.04
[    6.202059] usb usb4: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    6.202165] usb usb4: Product: OHCI PCI host controller
[    6.202318] usb usb4: Manufacturer: Linux 5.4.0-rc4 ohci_hcd
[    6.202411] usb usb4: SerialNumber: 0000:00:12.1
[    6.204076] [drm] PCIE gen 2 link speeds already enabled
[    6.205321] hub 4-0:1.0: USB hub found
[    6.205841] hub 4-0:1.0: 3 ports detected
[    6.294583] ohci-pci 0000:00:13.0: OHCI PCI host controller
[    6.294691] ohci-pci 0000:00:13.0: new USB bus registered, assigned bus
number 5
[    6.295006] ohci-pci 0000:00:13.0: irq 18, io mem 0xfe8f7000
[    6.316082] [drm] dce110_link_encoder_construct: Failed to get
encoder_cap_info from VBIOS with error code 4!
[    6.316555] [drm] dce110_link_encoder_construct: Failed to get
encoder_cap_info from VBIOS with error code 4!
[    6.317065] [drm] dce110_link_encoder_construct: Failed to get
encoder_cap_info from VBIOS with error code 4!
[    6.317673] [drm] Display Core initialized with v3.2.48!
[...]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15720883720.600a3d5.8647--

--===============0086285040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0086285040==--
