Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8C25BC0DE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 02:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE06910E3C8;
	Mon, 19 Sep 2022 00:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F7B10E3C8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 00:58:51 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MW5sK3W1tz4xG5;
 Mon, 19 Sep 2022 10:58:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1663549126;
 bh=hDw2dsdejkPD/gt5RyWiV32nKiS/nDdYlt7NISnavHI=;
 h=Date:From:To:Cc:Subject:From;
 b=LcRLz/a8cMtLy7HeeYp42dEiGKqOFbqFT1A+p67fYLrWeOdwDqogH5fWl8eg+L8wV
 f5l9WR4ocMCmHlN53LozpASgLcsieIHkyJndhEZZOEglk9Qc+Dbbi+l9gLeMzUi4a7
 EPXZy06J/H6IIIzUF7NYzGETCVH/Zt0ChUhSwpfTlBCT6xw8qlJCOtWDxW+feMUmum
 OkWz7RbtCUV2PoEjoUmoN4k5ESnEmJQ9Kumhh3EJxmUhDd7WxV8x4UD2D1FzuVGGrt
 1e/ZWefLZKZg6XWvPiPDT9Xs0MCDMrnjz3WDk0Rtd/eZWfk5LZHLGRHSz5fYhRQsU2
 pWAGcIPps9fKQ==
Date: Mon, 19 Sep 2022 10:58:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20220919105839.496f1b72@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NeLjGeSAXU8n/+K4A/ZwoSk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/NeLjGeSAXU8n/+K4A/ZwoSk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c

between commit:

  41012d715d5d ("drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinli=
ne for stack usage")

from Linus' tree and commit:

  a0f7e7f759cf ("drm/amd/display: fix i386 frame size warning")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index 1cb858dd6ea0,b7fa003ffe06..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@@ -6610,66 -6497,11 +6497,11 @@@ static double CalculateUrgentLatency
  	return ret;
  }
 =20
 -static void UseMinimumDCFCLK(
 +static noinline_for_stack void UseMinimumDCFCLK(
  		struct display_mode_lib *mode_lib,
- 		int MaxInterDCNTileRepeaters,
+ 		struct vba_vars_st *v,
  		int MaxPrefetchMode,
- 		double FinalDRAMClockChangeLatency,
- 		double SREnterPlusExitTime,
- 		int ReturnBusWidth,
- 		int RoundTripPingLatencyCycles,
- 		int ReorderingBytes,
- 		int PixelChunkSizeInKByte,
- 		int MetaChunkSize,
- 		bool GPUVMEnable,
- 		int GPUVMMaxPageTableLevels,
- 		bool HostVMEnable,
- 		int NumberOfActivePlanes,
- 		double HostVMMinPageSize,
- 		int HostVMMaxNonCachedPageTableLevels,
- 		bool DynamicMetadataVMEnabled,
- 		enum immediate_flip_requirement ImmediateFlipRequirement,
- 		bool ProgressiveToInterlaceUnitInOPP,
- 		double MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOper=
ation,
- 		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixel=
MixedWithVMData,
- 		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDat=
aOnly,
- 		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixel=
DataOnly,
- 		int VTotal[],
- 		int VActive[],
- 		int DynamicMetadataTransmittedBytes[],
- 		int DynamicMetadataLinesBeforeActiveRequired[],
- 		bool Interlace[],
- 		double RequiredDPPCLK[][2][DC__NUM_DPP__MAX],
- 		double RequiredDISPCLK[][2],
- 		double UrgLatency[],
- 		unsigned int NoOfDPP[][2][DC__NUM_DPP__MAX],
- 		double ProjectedDCFCLKDeepSleep[][2],
- 		double MaximumVStartup[][2][DC__NUM_DPP__MAX],
- 		double TotalVActivePixelBandwidth[][2],
- 		double TotalVActiveCursorBandwidth[][2],
- 		double TotalMetaRowBandwidth[][2],
- 		double TotalDPTERowBandwidth[][2],
- 		unsigned int TotalNumberOfActiveDPP[][2],
- 		unsigned int TotalNumberOfDCCActiveDPP[][2],
- 		int dpte_group_bytes[],
- 		double PrefetchLinesY[][2][DC__NUM_DPP__MAX],
- 		double PrefetchLinesC[][2][DC__NUM_DPP__MAX],
- 		unsigned int swath_width_luma_ub_all_states[][2][DC__NUM_DPP__MAX],
- 		unsigned int swath_width_chroma_ub_all_states[][2][DC__NUM_DPP__MAX],
- 		int BytePerPixelY[],
- 		int BytePerPixelC[],
- 		int HTotal[],
- 		double PixelClock[],
- 		double PDEAndMetaPTEBytesPerFrame[][2][DC__NUM_DPP__MAX],
- 		double DPTEBytesPerRow[][2][DC__NUM_DPP__MAX],
- 		double MetaRowBytes[][2][DC__NUM_DPP__MAX],
- 		bool DynamicMetadataEnable[],
- 		double VActivePixelBandwidth[][2][DC__NUM_DPP__MAX],
- 		double VActiveCursorBandwidth[][2][DC__NUM_DPP__MAX],
- 		double ReadBandwidthLuma[],
- 		double ReadBandwidthChroma[],
- 		double DCFCLKPerState[],
- 		double DCFCLKState[][2])
+ 		int ReorderingBytes)
  {
  	double   NormalEfficiency =3D 0;
  	double   PTEEfficiency =3D 0;

--Sig_/NeLjGeSAXU8n/+K4A/ZwoSk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmMnvr8ACgkQAVBC80lX
0Gwz3Qf/Xrtejbco5JcSqX5BGkL9jtI8TFHKS857oTxMVgwC3kgU8qVILiWrhwf1
sdrZuYZ+t1llwRu8E8J5GNDkkB4UYdxAkbD6wVbj5chtseyO6k72MP2v5Nc5ZhfP
x7WdMyhavtYsxrYi02PkKXZoNxT2oVNeCJ/lvhjmg+o2pkNxbk9lB9g0K/9Iwa42
fdO1TH5KmWWo7JHSFGt0JXd6WjVduWIW5Fg0d2EN5nQaup5cALI3JR+oWkNnfJTl
MR6aRnXdqfrAhc5ihYTqHOmcLPFS+qAFHXXM39d55aZZs04vVsy4kDA5543tN4uY
XLEuvCY3kRRkl7B6ztZn6zSYoheYLQ==
=2sFe
-----END PGP SIGNATURE-----

--Sig_/NeLjGeSAXU8n/+K4A/ZwoSk--
