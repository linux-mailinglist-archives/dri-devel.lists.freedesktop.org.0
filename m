Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4A7B47C28
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 18:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D5089CAC;
	Sun,  7 Sep 2025 16:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="IMbPcnBt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazolkn19013012.outbound.protection.outlook.com
 [52.103.33.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE02D10E175;
 Sun,  7 Sep 2025 06:10:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkQWjg4JY9Dbr9jDXBx8osJlb7yJ1EgmAHPMgnHHOXe7o/PPbVuRNaAbDZekq7LMxfkf1cYptK5BDaE+yti32cgFhQmlXIsSVHvQ4sXaDTN9fS8uqNU+755a4u829UFhwwNwx4USpMYRQgeQDMFC021HlcHgt6jDm4IF/WmTlrWXRWt26X+R9Lij98ZBiVew53QKSk+faEqoLPtCXfpTduUajJKtDs/0OjVA4nqCvW5rj5rcRXpW6rE3EbiKPOR/eGs6cZHaSRnRqRNi6X/keVCnYw2DWpKUvkbToU9kpI/GhX0U1ORbG4lOW447xawN+Tse71lbyqrkFCMPqNHQCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/WqvDl9L2FDsC5IvsSUcaa3QqelfDTYK4MzY5dl/6k=;
 b=JFDDJjdnQbi4/Q3icBh4NktxtOzg+YvrTjrOaJDoWayVR48NNjuoeGl9agYQSqwn/WgtunM5p/cVthU8E4TKAODKFcU2ypKlbO5PTCAbZfyqejYrsOwZI4xVOscYfuImVMYRLvNONpfVEUE66XWiK4vqp6sctVDdhV1D36NNjBOj05Kq26KEqSZy6E8hnWS7gqgFnoSwnWdPhSkTep6bSm9I/BLGCxgximCW5fVsK43vjpz4keeHDK+Rbv2c6KLsWqszuzzu+b1WRrN6rc5zNohfOz0OreIL3XF/PQPPdmOH6B3kI+pIkiGOSlpJgJt//9TaEJwe7dF2yhwZF6Q2+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/WqvDl9L2FDsC5IvsSUcaa3QqelfDTYK4MzY5dl/6k=;
 b=IMbPcnBtnyWD3EpJ6fu3iQFSAbn20+Ov32IF2fP969+jWzNKxC0zzuwwtwRTE7m5HBsmPUFJiX1NwBzSfzfA6l6nWU1Ftq0X7PusrCMycODjwLqtJjobSP4xuKPO/u6RIcSF4EXIPbYUFqXipJ+BMKxbZyKehrCRhOhRks8CPiQYdpMYcIRfnykyk+bWyx2BeJXwMYLVav7t/ksAUozMvWr7BfQiMbtXKHS25km8oXMpRtstnYePn6mfzCK0/uWm4IW4lI00kv9svkkcQ/NDCXNZSPo4J8xCYTwsgj8NVyT8wXnEMuuIs1Iwz7bH3QVRvDBytS06REa8KbxNfe5ocQ==
Received: from DU0P190MB2445.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:5a5::8) by
 AS8P190MB1032.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2e7::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Sun, 7 Sep 2025 06:10:38 +0000
Received: from DU0P190MB2445.EURP190.PROD.OUTLOOK.COM
 ([fe80::5dcd:351e:4e91:2380]) by DU0P190MB2445.EURP190.PROD.OUTLOOK.COM
 ([fe80::5dcd:351e:4e91:2380%5]) with mapi id 15.20.9094.018; Sun, 7 Sep 2025
 06:10:38 +0000
From: Muhammed Subair <msubair@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
CC: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
 "linux+etnaviv@armlinux.org.uk" <linux+etnaviv@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-sunxi
 <linux-sunxi@lists.linux.dev>, Chen-Yu Tsai <wens@csie.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: drm/etnaviv: detecting disabled Vivante GPU?
Thread-Topic: Re: drm/etnaviv: detecting disabled Vivante GPU?
Thread-Index: AdwftZRL4V/ycwT/ShypPIPQ1UB47Q==
Date: Sun, 7 Sep 2025 06:10:38 +0000
Message-ID: <DU0P190MB2445D1343E4FF538B0AA1E29BC0DA@DU0P190MB2445.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P190MB2445:EE_|AS8P190MB1032:EE_
x-ms-office365-filtering-correlation-id: 487c60d2-7b14-45f6-efd3-08ddedd543fc
x-microsoft-antispam: BCL:0;
 ARA:14566002|31061999003|15080799012|15030799006|461199028|8062599012|8060799015|19110799012|4295299021|51005399003|3412199025|40105399003|440099028|10035399007|102099032|12091999003;
x-microsoft-antispam-message-info: =?Windows-1252?Q?Qw39ytonmtLYi7KYUawF+KQYJaenRRNrNE0aLsleRDrJxA2PUqukRMm/?=
 =?Windows-1252?Q?YScVcchy5ki0pDaww/ZKABJO8ASfPEKMWQ8f93J+FtCRW1y2NfN42fru?=
 =?Windows-1252?Q?qGONJSJoQPIAGumSc1clTSl+Y8+OdsaCIj+lJQGdsFyzzYnI/hQ8XAuC?=
 =?Windows-1252?Q?a+nzUOu45qtNoPMtWEfFMHDrpwsq2C60dLXF8On9YPSo/2uwrCzbTUUC?=
 =?Windows-1252?Q?p+MYo/nvDWtmLUnlLAT9/aUheI/sKK+qvkjGd2Hf0HNdIb/EcEbQChx7?=
 =?Windows-1252?Q?k6zZKd5j93Dg9gdaGVh33ZZp0mOqHUwcnBLWsjL6qX91zLTJgZyxIGZ7?=
 =?Windows-1252?Q?hDbupcPnSNuXrraJaB9H7y1iJQufKDuoBf4Duc2X5D931gfZ04EB3Pid?=
 =?Windows-1252?Q?7zZqAs3pGkQ2gwRfKY4pkye9N60qrSdnzR+3Wp1g1XBGCqLQiQVp0t/Q?=
 =?Windows-1252?Q?qcqI2uPEn5T0i989q4/u2Ys46BGu733sN8CJtTZxPj1eJAlgrUgj0TpD?=
 =?Windows-1252?Q?mr1cu+TfsIDM22qkh67CDnLra2/I2aNO/KUHFTDffgN2GPDZLk2bUliM?=
 =?Windows-1252?Q?UkCQxENM2vmsuUSz3IEWOYwC2rLsEgK09heA/40Apsiif9cpvLH8TNM0?=
 =?Windows-1252?Q?V0OvJilNO+kb1cXCzOI9mSAHdLXD0dwMvEuK2thQ33NcLHIJ1Jh7amJM?=
 =?Windows-1252?Q?vfZShtd54PPKzqefu8aLkdGcPazmacp6mxOQh+gD/3zDp2yCpp3VXAvG?=
 =?Windows-1252?Q?uqTJUB4bnDxDQxt8kUv2f6IrAY7S0aMV5J+ZiyyaFLbydOf+PV8inFMm?=
 =?Windows-1252?Q?vZXlDdRjJg8FMyFEK6YBP6Gd6fuzs5gH74ccRounB6Ejx5yvOlqNBBoO?=
 =?Windows-1252?Q?3dh9skE/RVK5WwY9Czb5xcUPWupl9D5g8pKhZ6sgi9cgaSqVOvNEdfC8?=
 =?Windows-1252?Q?4WZgF+RG1mvp0PSB2L45KKGixVXz3RAhyh3dK3r8SGdU+08jzK+0onzX?=
 =?Windows-1252?Q?e0IIMkkfhSPSDzNYWPUlNzXdk5v7M0Fli3pXPlKinIpwmvQIqCvIkVNn?=
 =?Windows-1252?Q?lZGodV71YkzirvlHwwcGUiMzjZYe68nJvyCklDLUfgAshMV6D+fzTaML?=
 =?Windows-1252?Q?6F4hujv1gbhLkQAqMKgP/70pzvVpV+cXheF7P6NlHa/LF4fSas7Sddnn?=
 =?Windows-1252?Q?eql7JSajv4MgPBuYaFn4neWgTc/bZ3YjWBsu9ohEPKoEJWEeb4qhnUe4?=
 =?Windows-1252?Q?b9UKmQ/rV5HRU9oEa5pRBpayjqZSxJnNM65FcUDIJV9ljRpm8Pr95KrD?=
 =?Windows-1252?Q?9M9+308ikjue3Cdbi/Q5Ll9mExGJxKTnPhUVAoOJ5sNhNLbx?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?jDJTdkWWo7v05u+TnbrPriPY9IhIOmjQe1gL8IfNJv00NjbwIhQEdn7q?=
 =?Windows-1252?Q?Ebp9sh1y9gYIF3Czz74Cq/ScCOGNTNVxY6zcAqxkn+P+P2HKvCetPvNQ?=
 =?Windows-1252?Q?rbbih2Nrq5ho6kqvgXUN51TW+B7fQwTWdxyez9o3SP8z5r6aZfq2Mm6d?=
 =?Windows-1252?Q?TtQlhfGUjKpF3und9utOcZDWzyy8f8Kf5gXl1Bq7qZyj3zXqkqpnvSFm?=
 =?Windows-1252?Q?bWAnaZW33FHoF2tom0svTqJCuYLonGkGk5Zc3/I5XL+UEZASU8pN7w3t?=
 =?Windows-1252?Q?eCjOGrAc5DDUbpGJVDSkFAxuNLTv1C2Dcxy8NVoDPH2V1bwa8Fe7xae2?=
 =?Windows-1252?Q?e7VgpFcUR3HfFZEfHhtE6I4bUv4NtQBq0MU7RvofIU6uGY8WJySTS4g/?=
 =?Windows-1252?Q?Xe0zN+ey6zi+7EIuHKfcN+91LzkIRRjFMTO6MfhXMTqGwtvWiCVaXSgL?=
 =?Windows-1252?Q?4l3cdcK4s2UtXm+g9/ay4rh4/NmF+0dbcbgx5BOcKeuFUn8b7TOZZ/Do?=
 =?Windows-1252?Q?RQZF8R6ECXcuutVP1RwZbN8CQmB1h1pybq5eEqSpbOxQDEMdh6WPuQtZ?=
 =?Windows-1252?Q?RXG7lnMdUqxMa2n1bQXHys+J7harmm8JpXpLZV2tusFnki34/ZcjpxqU?=
 =?Windows-1252?Q?Q0eoSFGkq/a0oSIhk64UOFgaUM5S4IV+LYzUzkHw1t0S5OmtILaDIVUX?=
 =?Windows-1252?Q?6VyBd09eC9n3GBNe7G+4zTNvbAtsafQ1AK8HsVVrMcAaQbduJTLCfF//?=
 =?Windows-1252?Q?tNSVivFaoYY8hFhYsIo5dLq0u0lWqto6WD7oeoPITKJHIwbiclMyPsko?=
 =?Windows-1252?Q?rvAwxVLaZ0MU4plaCFHo8TaEWPxHlaUp5gTXLqg8eWGN59PNxAWZqgF9?=
 =?Windows-1252?Q?y0lLLCrx+HsEBU8lGyeKRMoK16itf6grMbxuxSeLb2EHsCHLSoriubx2?=
 =?Windows-1252?Q?OlwgVc7c2WWxwEOnuPAqLEHxNiqBRK6J/bw4RYwND5FaQoGG5SsLJBbw?=
 =?Windows-1252?Q?q1ikfaPata3LYlDbdx3+qMJ70qu4/sIfeNtXywn9Ph2H61G/7xAKZxFZ?=
 =?Windows-1252?Q?PJpeWehA1jaogNGya5BIRfe4yV5sh2RC/u51lqifChMQ80kEWEtS0pBG?=
 =?Windows-1252?Q?TPvY5hab+ksKGligWqUH3TVwcYlgeKiWO2dh+Vsi87c5ZEUlmmKf0I3w?=
 =?Windows-1252?Q?gXnpSVDQUs9yW+FySb/vY2FmAsMIjYLxiFzlx/xLIxuejYktVSA/LMFh?=
 =?Windows-1252?Q?y3lEjki5ztrD/IjSMLfDPbd8m6/UEn4HEfyzbsR2H9792f1VDfBnQXJa?=
 =?Windows-1252?Q?jIRitw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-e6540.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P190MB2445.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 487c60d2-7b14-45f6-efd3-08ddedd543fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2025 06:10:38.0871 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P190MB1032
X-Mailman-Approved-At: Sun, 07 Sep 2025 16:04:26 +0000
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

Hello=0A=
=0A=
The board I have is A527 , and the legacy (5.15.147)  kernel detecting npu =
as shown below,=0A=
However https://linux-sunxi.org/A523#Family_of_sun55iw3 shows that there is=
 no npu, not sure whether information is correct in this link.=0A=
=0A=
[   13.887892] npu[106][106] vipcore, platform device compatible=3Dallwinne=
r,npu=0A=
[   13.890322] npu[106][106] vipcore, platform driver device=3D0xffffff80c1=
a11c10=0A=
[   13.890394] npu[106][106] vipcore irq number is 116.=0A=
[   13.890471] vipcore 7122000.npu: supply npu not found, using dummy regul=
ator=0A=
[   13.892589] npu[106][106] NPU Use VF3, use freq 696=0A=
[   13.892754] npu[106][106] Get NPU Regulator Control FAIL!=0A=
[   13.892766] npu[106][106] Want set npu vol(1000000) now vol(-22)=0A=
[   13.938664] npu[106][106] core_0, request irqline=3D116, name=3Dvipcore_=
0=0A=
[   13.938889] npu[106][106] vipcore, allocate page for video memory, size:=
 0x2000000bytes=0A=
[   13.938900] npu[106][106] vipcore, video memory heap size is more than 4=
Mbyte,only can allocate 4M byte from page=0A=
[   13.938948] npu[106][106] vipcore, cpu_physical=3D0x10cc00000, vip_physi=
cal=3D0x10cc00000, vip_memsize=3D0x400000=0A=
[   13.940230] npu[106][106] VIPLite driver version 1.13.0.0-AW-2023-01-09=
=0A=
[   25.090905] sunxi:sunxi_pd_test-0.pd-npu-test:[WARN]: runtime_suspend di=
sable clock=0A=
=0A=
While with new patches in upstream 6.17.rc4 shows below ,=0A=
=0A=
# dmesg | grep  7122000 =0A=
[   21.988215] etnaviv-gpu 7122000.npu: probe with driver etnaviv-gpu faile=
d with error -110=0A=
[   21.988173] etnaviv-gpu 7122000.npu: deferred probe timeout, ignoring de=
pendency=0A=
[   21.988215] etnaviv-gpu 7122000.npu: probe with driver etnaviv-gpu faile=
d with error -110=0A=
=0A=
Have the full source code and schematic, happy to provide any support requi=
red.=0A=
=0A=
Subair=0A=
=0A=
* Re: drm/etnaviv: detecting disabled Vivante GPU?=0A=
  2025-09-04 10:10 ` Christian Gmeiner=0A=
@ 2025-09-04 10:36   ` Andre Przywara=0A=
  0 siblings, 0 replies; 4+ messages in thread=0A=
From: Andre Przywara @ 2025-09-04 10:36 UTC (permalink / raw)=0A=
  To: Christian Gmeiner=0A=
  Cc: Lucas Stach, Russell King, etnaviv, dri-devel, linux-kernel,=0A=
	Chen-Yu Tsai, linux-sunxi=0A=
=0A=
On Thu, 4 Sep 2025 12:10:30 +0200=0A=
Christian Gmeiner  wrote:=0A=
=0A=
&gt; Hi=0A=
&gt; =0A=
&gt; &gt;=0A=
&gt; &gt; the Allwinner A523/A527/T527 family of SoCs feature a Vivante=0A=
&gt; &gt; "VIP9000"(?) NPU, though it seems to be disabled on many SKUs.=0A=
&gt; &gt; See https://linux-sunxi.org/A523#Family_of_sun55iw3 for a table, =
the=0A=
&gt; &gt; row labelled "NPU" indicates which model has the IP. We suspect i=
t's=0A=
&gt; &gt; all the same die, with the NPU selectively fused off on some pack=
ages.=0A=
&gt; &gt;=0A=
&gt; &gt; Board vendors seem to use multiple SKUs of the SoC on the same bo=
ard,=0A=
&gt; &gt; so it's hard to say which particular board has the NPU or not. We=
=0A=
&gt; &gt; figured that on unsupported SoCs all the NPU registers read as 0,=
=0A=
&gt; &gt; though, so were wondering if that could be considered as a bail-o=
ut=0A=
&gt; &gt; check for the driver?=0A=
&gt; &gt; At the moment I get this, on a SoC with a disabled NPU:=0A=
&gt; &gt; [    1.677612] etnaviv etnaviv: bound 7122000.npu (ops gpu_ops)=
=0A=
&gt; &gt; [    1.683849] etnaviv-gpu 7122000.npu: model: GC0, revision: 0=
=0A=
&gt; &gt; [    1.690020] etnaviv-gpu 7122000.npu: Unknown GPU model=0A=
&gt; &gt; [    1.696145] [drm] Initialized etnaviv 1.4.0 for etnaviv on min=
or 0=0A=
&gt; &gt; [    1.953053] etnaviv-gpu 7122000.npu: GPU not yet idle, mask: 0=
x00000000=0A=
&gt; &gt;=0A=
&gt; &gt; Chen-Yu got this on his board featuring the NPU:=0A=
&gt; &gt;     etnaviv-gpu 7122000.npu: model: GC9000, revision: 9003=0A=
&gt; &gt;=0A=
&gt; &gt; If I get the code correctly, then etnaviv_gpu_init() correctly de=
tects=0A=
&gt; &gt; the "unsupported" GPU model, and returns -ENXIO, but load_gpu() i=
n=0A=
&gt; &gt; etnaviv_drv.c then somewhat ignores this, since it keeps looking =
for more=0A=
&gt; &gt; GPUs, and fails to notice that *none* showed up:=0A=
&gt; &gt; /sys/kernel/debug/dri/etnaviv/gpu is empty in my case.=0A=
&gt; &gt;  =0A=
&gt; =0A=
&gt; Looks fine to me - no wrong behavior.=0A=
&gt; =0A=
&gt; &gt; Quick questions:=0A=
&gt; &gt; - Is reading 0 from VIVS_HI_CHIP_IDENTITY (or any other of the ID=
=0A=
&gt; &gt;   registers) an invalid ID, so we can use that to detect those di=
sabled=0A=
&gt; &gt;   NPUs? If not, can any other register used to check this? The wh=
ole=0A=
&gt; &gt;   block seems to be RAZ/WI when the NPU is disabled.=0A=
&gt; &gt;=0A=
&gt; &gt; - Would it be acceptable to change the logic to error out of the=
=0A=
&gt; &gt;   driver's init or probe routine when no GPU/NPU has been found, =
at=0A=
&gt; &gt;   best with a proper error message? As it stands at the moment, t=
he=0A=
&gt; &gt;   driver is loaded, but of course nothing is usable, so it keeps=
=0A=
&gt; &gt;   confusing users.=0A=
&gt; &gt;  =0A=
&gt; =0A=
&gt; From an application standpoint, it=92s not confusing since there is no=
 etnaviv=0A=
&gt; device to interact with. The user might wonder about the kernel messag=
es,=0A=
&gt; but that=92s actually caused by an incorrect device tree. If the SoC d=
oesn=92t=0A=
&gt; have an NPU, it shouldn=92t be enabled in the DTS.=0A=
=0A=
You have a point there, but as I mentioned above, that sounds tricky to=0A=
do: I have two boards that looks otherwise identical, but one has an A527,=
=0A=
the other an T527. And still both don't have the NPU, since only some=0A=
T527s feature it. So putting this on the user to use the right DT (or=0A=
U-Boot defconfig) does not sound very nice.=0A=
=0A=
And in contrast to many other devices described in DTs, we *can* safely=0A=
detect the existence of this NPU: each of the SoCs have all the clock=0A=
gates and resets, and accesses to the MMIO frame do not fault - and the=0A=
kernel code apparently can cope with this situation already. So yeah, we=0A=
could smear something into U-Boot, to put a status =3D "disabled"; in there=
,=0A=
but I would like to avoid that, especially if the kernel is almost there=0A=
already.=0A=
=0A=
Cheers,=0A=
Andre=0A=
