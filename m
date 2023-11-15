Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64D37EDD5E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 10:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CD310E2DC;
	Thu, 16 Nov 2023 09:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4C489B30
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 16:33:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5D4935C00D2;
 Wed, 15 Nov 2023 11:33:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 15 Nov 2023 11:33:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
 :content-type:content-type:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1700066025; x=1700152425; bh=KZkEqWwJQRSrYFgg2mjZ426YJ
 q2QZwzgxVKibWCsknE=; b=fnRNORmCSSsSlsqpf+eFLdBJm+0XnV0n0/j9MV/MQ
 ga1ahHhZSr5STYn3JplljcDhuHRcjTAv/wVqQ7hGqkQQGFod9z8Ie7fKrdXTFu1K
 hcKVMh0UF0GDD+JmoMTGW0CqTZIUv15Ta5HVF0rCplq15MQfq5ceF+sQS/IPEejy
 fjzTBu36OD+k1wqe7wfaguU3CrILEsiKww0qWAcFlrbWgq0O39j79A1hDRsuRE4n
 nCcm+X0N7VkGv7+tr0uGcjnHIpVUdTz7CgbIY5tRHMh232RWb5lbFJUgFS3mKxj9
 z7qZmrOWx2wsxP/2E3y0y1arP5nRQvBGirctmn+zYoyuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1700066025; x=1700152425; bh=KZkEqWwJQRSrYFgg2mjZ426YJq2QZwzgxVK
 ibWCsknE=; b=FNzsEOerVKOEsZ1D/dAV1iXJiu44g7gBFUzkv3rCqovK9hbYCxP
 yWuVWz+1UWFpI2b1vjGTPP545OXLXDiJ3nYZYkCodkculrwlq6m5sTyKkvhPkwx6
 VYkOmxTT1q/Ef7kRlBTOfMUNxe2pgnwBGVkF4S+Cn0KXDe2w6GNgwWmdf1ezjQED
 xlIQIUkzgyyyEajSqYw7oyexybNQzHlxElDTSrv7Uvqwzf7nSR3D+UVpH23zF3Wf
 63IHWFywc14yK2uylpomqK+x3c8u4dtgTR7hjaY+u/Uh2cKldyM5TpqPp0DcL656
 a7tzP4DbZRUAUB4ZkptbRHmax7kuf7c+QoA==
X-ME-Sender: <xms:6PJUZf50ydk7bTJmsqOTBK4Lu4QCb4kPbCDKCA94-xbwovN--pbPXA>
 <xme:6PJUZU4gASC5RPhQNREbHlGNttLymsUzQqQH2wH9XQHXc9na3K3_9YzpKtZdg6Cku
 6IKmJZ10-0PxjXeOA>
X-ME-Received: <xmr:6PJUZWctyQbNJHSU3gMh_lF62sELXJjmeXQSQsU-bwXZVyJFlpfUsMlp5CLfuNAqLARzsF916-J5656ntw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudefiedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkfggtgesghdtreertddtjeenucfhrhhomheptehlhihsshgrucft
 ohhsshcuoehhihesrghlhihsshgrrdhisheqnecuggftrfgrthhtvghrnheptdelieeuue
 fhkeevudelveeigeetfeeutefhkeetteejueekteegteevgeevteejnecuffhomhgrihhn
 pehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhephhhisegrlhihshhsrgdrihhs
X-ME-Proxy: <xmx:6PJUZQJLShS2s6sKCwZfXUDz-RUnoJu-k0iCk-qYj9xW6G6_51O2ag>
 <xmx:6PJUZTKAIYFU22gCu-YTviqeCt8g63WFwSiHVAgl-Rn6IDdJuhjAEw>
 <xmx:6PJUZZwdbx8_655GJ6HXiXBFkmvH0dE6PiL5HWQYgY7n_Q7bLa-LGg>
 <xmx:6fJUZVzwUYRcyxn04S9CJRBPoNR6cSEQ0ZzuSf6JWEEpkS2doSUQJA>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Nov 2023 11:33:44 -0500 (EST)
Received: by mbp.qyliss.net (Postfix, from userid 1000)
 id D17CE49D1; Wed, 15 Nov 2023 17:33:42 +0100 (CET)
From: Alyssa Ross <hi@alyssa.is>
To: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Use after free with GEM shadow-buffered planes
Date: Wed, 15 Nov 2023 17:32:45 +0100
Message-ID: <87leazm0ya.fsf@alyssa.is>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
X-Mailman-Approved-At: Thu, 16 Nov 2023 09:06:53 +0000
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

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

[Originally reported at https://gitlab.freedesktop.org/drm/misc/-/issues/33]

The following happens in a cycle:

 =E2=80=A2 An atomic state is allocated
 =E2=80=A2 A plane state is allocated (drm_gem_duplicate_shadow_plane_state=
())
 =E2=80=A2 Commit (drm_atomic_helper_commit(), possibly nonblocking / async=
hronously)
 =E2=80=A2 The previous plane state is freed (drm_gem_destroy_shadow_plane_=
state())
 =E2=80=A2 The atomic state is put

But what happens if a nonblocking commit doesn't get scheduled until a
couple of iterations later in the cycle?  Plane states are not
refcounted, so by that point, the plane state has been freed, and so
commit_tail() will encounter a use after free when it accesses the plane
state.

I encountered this issue using simpledrm on the Asahi kernel based on
v6.5, but none of the files I examined to determine that this is a
use-after-free have been modified from mainline.  I've also reviewed the
diff between my kernel and tip of mainline (8f6f76a6a29f), and didn't
see anything that would affect this issue.

Here's an example of a use after free.  It's been a couple of weeks
since I thoroughly investigated this, but from memory, in this case, the
plane state has been overwritten by a struct drm_crtc_state.

Unable to handle kernel paging request at virtual address 0000000100000049
Mem abort info:
  ESR =3D 0x0000000096000005
  EC =3D 0x25: DABT (current EL), IL =3D 32 bits
  SET =3D 0, FnV =3D 0
  EA =3D 0, S1PTW =3D 0
  FSC =3D 0x05: level 1 translation fault
Data abort info:
  ISV =3D 0, ISS =3D 0x00000005, ISS2 =3D 0x00000000
  CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
  GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
user pgtable: 16k pages, 48-bit VAs, pgdp=3D000000080e0e31b0
[0000000100000049] pgd=3D080000083d390003, p4d=3D080000083d390003, pud=3D08=
0000083db9c003, pmd=3D0000000000000000
Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
Modules linked in: overlay uas usb_storage usbhid rfcomm snd_seq_dummy snd_=
hrtimer snd_seq snd_seq_device bnep des_generic libdes md4 brcmfmac_wcc joy=
dev hci_bcm4377 bluetooth brcmfmac brcmutil cfg80211 hid_magicmouse ecdh_ge=
neric ecc rfkill snd_soc_macaudio macsmc_hid macsmc_power macsmc_reboot ofp=
art spi_nor apple_isp videobuf2_dma_sg snd_soc_cs42l84 snd_soc_tas2764 vide=
obuf2_memops clk_apple_nco snd_soc_apple_mca apple_admac videobuf2_v4l2 vid=
eodev videobuf2_common mc hid_apple pwm_apple leds_pwm apple_soc_cpufreq xt=
_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip6t_rpfilter ipt_rpf=
ilter xt_pkttype xt_LOG nf_log_syslog nft_compat nf_tables nfnetlink loop t=
un tap macvlan bridge stp llc fuse zstd zram dm_crypt xhci_plat_hcd xhci_hc=
d nvmem_spmi_mfd rtc_macsmc gpio_macsmc tps6598x dockchannel_hid simple_mfd=
_spmi regmap_spmi nvme_apple phy_apple_atc dwc3 pcie_apple typec pci_host_c=
ommon udc_core apple_sart macsmc_rtkit apple_rtkit_helper apple_dockchannel=
 macsmc apple_rtkit mfd_core
 spmi_apple_controller nvmem_apple_efuses pinctrl_apple_gpio spi_apple i2c_=
apple apple_dart apple_mailbox btrfs xor xor_neon raid6_pq
CPU: 0 PID: 1095074 Comm: kworker/u16:11 Tainted: G S                 6.5.0=
-asahi #1-NixOS
Hardware name: Apple MacBook Pro (13-inch, M2, 2022) (DT)
Workqueue: events_unbound commit_work
pstate: 21400009 (nzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=3D--)
pc : drm_gem_fb_vunmap+0x18/0x74
lr : drm_gem_end_shadow_fb_access+0x1c/0x2c
sp : ffff800087ea3d00
x29: ffff800087ea3d00 x28: 0000000000000000 x27: 0000000000000000
x26: ffff800081325000 x25: 00000000fffffef7 x24: ffff000046c5b560
x23: ffff000001fcaa05 x22: 0000000000000000 x21: 0000000100000001
x20: ffff000046c5b500 x19: 0000000000000001 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffff2e2d5ab0
x14: 0000000000000195 x13: 0000000000000000 x12: ffff800081310a80
x11: 0000000000000001 x10: 1444e7e23f083897 x9 : 6e82f0b7605f292f
x8 : ffff0001249e0f48 x7 : 0000000000000004 x6 : 0000000000000190
x5 : 0000000000000001 x4 : ffff000093c54440 x3 : ffff00000e968000
x2 : ffff80008077883c x1 : ffff00009ce37498 x0 : 0000000100000001
Call trace:
 drm_gem_fb_vunmap+0x18/0x74
 drm_gem_end_shadow_fb_access+0x1c/0x2c
 drm_atomic_helper_cleanup_planes+0x58/0xd8
 drm_atomic_helper_commit_tail+0x90/0xa0
 commit_tail+0x15c/0x188
 commit_work+0x14/0x20
 process_one_work+0x1e0/0x344
 worker_thread+0x68/0x424
 kthread+0xf4/0x100
 ret_from_fork+0x10/0x20
Code: 910003fd a90153f3 f90013f5 aa0003f5 (f9402400)=20
=2D--[ end trace 0000000000000000 ]---

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEH9wgcxqlHM/ARR3h+dvtSFmyccAFAmVU8q0ACgkQ+dvtSFmy
ccCDeRAApnYfLig9M6iEtP/3V0IfF4wpgSSuiptcxehZTa5lhwDMynSzvlah27wA
Q6OJWF9cGlUq8XE1/TO7sGGhx56aWichcadFh906Ef68frR0TTaUasADR3xBqgQO
lgazp7cAmybEDd/ItsHk0DeXOc058zKBywuh1aA80QeVDQfnwJL9Xys5HDaJLGTr
kFezXXFpQXYV8xconX0AQ+2ALwtHGB+vIQlReTncQB0RQ9wjGOhfymJP/gkFn+qW
2KxOQ+zcWitpMfH+/RywnZzsmZ3/cR0M/JT8vw681nd7vn65HbjnqpSqnziRGN8V
0FqvpAWv2TWxJT+IrozWEapNzGPZ2UjJG9WpqPLXa+fkg2HRnL72gsjxQsOpj6ZL
xq8k/w3ovJtZ24x8Nj0NRghm7SGDj6OkHHxcHHmAThd+HbPW7G9X32Hfr0dOEZP7
pQi3KF50NcGujgBC9cGdL2LvsjYqE1J5ML1Q4Wj64lWXZ7ypizRFYyRnKt3gKvJm
RdxqgMBVB55CuAF1yNzle3xgFjfMjyAerZYow+y61ukfKh5n8T9/y3CCLkf9Blst
3y5UuvtCOwFQHnjWHsgOnHwCIjyFbJPjw/BSCaKpw/YxxPPBu0oVWaaX+LWlsRJc
+dCnsOunr4RAkcPYvpp+1ogZWiUmpAnQmWkHl0gRQ2r7lOZ3UvM=
=dTe0
-----END PGP SIGNATURE-----
--=-=-=--
