Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4598BA83D28
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 10:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A26210E7BA;
	Thu, 10 Apr 2025 08:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1ad/pI1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1088D10E7BA;
 Thu, 10 Apr 2025 08:37:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jevnqumo1U63abvv57l7niqR+35GyXqxqyYZCm3m32N6NXeR94ICjABsjbmjtLYo0Sp3K6KhajqQwoH5m46cReIA9yqoXjo7y6MgMyTTeHAwWdHliKUG0wuP3CTcNUX1k/jGId5wpIVogM6SlQX5ChpG9SMOJKz4S9uE0QxX6UHGPjUy8BSK7cconxww20HbSCj2qMtjWvNIwUKp2ygXY1FH6G8LtUREpEKlphP5PlzU1etuZdiRu/bN4ATPGJegVHeiRCC9/7uhG9j3NIkCzsAgP/NIGovBwfR5HJpgwVzXIZP7ucA3q/rM99yVa/3Io+hxi7yHgux21NE1pDfCgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYzyVUBgBsbL7grtewF+buEH6tgGGnbb47odBhqBFz8=;
 b=SOUs2IO8nREh3/k2BkOCZkFRA9NcOks9vDdylB7z2HjLOUAk7oYU5dLSUOFe1j041ebzzducRvl3Acs/4le9pzrzPy/GGhCq9/MOHM6hFoKWnPKVxru5ZYB3CX9rRbn91VFkHzCnaBTxJb1aLpPmUR3Kv6EYfciVcpkPYcTJAGAS4XfYOuP74i07kv4CyRXpI8FCkymrN5XRzh888aSX6ieCmAy5GTyA5D/9gjpUTInhKpeYWM+iPVuVsHED0Xb6JjVMXBNAZ7Zpy09NqGYZjW/qPMaczw/snuhCZGZmb9VFO8a40JR0un2erA66QBmNsI+VJSRliuig3gbfH7GnBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYzyVUBgBsbL7grtewF+buEH6tgGGnbb47odBhqBFz8=;
 b=1ad/pI1r+ile+W+04Gp6yLIc1WmUZQA+zeGRAqjCJ24SBtTLLv9GDKR2ulMFN+KgwDk3whOSkl6G7bRKQ8to+F+bHbvV8J6yhSZCXFKyL20O+m1OgMqJyAYZhiYud691BKZ/7MeWFusIr7SqUNxpO25471sNVjsuk6bkn9WgAbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW3PR12MB4426.namprd12.prod.outlook.com (2603:10b6:303:58::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 08:37:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 08:37:36 +0000
Content-Type: multipart/mixed; boundary="------------RitEXH8ONBTGBTbpKtqnx0LV"
Message-ID: <4283351a-5650-4b48-8958-e76a54118045@amd.com>
Date: Thu, 10 Apr 2025 10:37:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-fence: Rename dma_fence_is_signaled()
To: phasta@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, Qiang Yu <yuq825@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul
 <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Zack Rusin <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Yang Wang <kevinyang.wang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>,
 Tim Huang <tim.huang@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>, Eric Huang <jinhuieric.huang@amd.com>,
 Asad Kamal <asad.kamal@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Friedrich Vock <friedrich.vock@gmx.de>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250409120640.106408-2-phasta@kernel.org>
 <20250409120640.106408-3-phasta@kernel.org>
 <20250409143917.31303d22@collabora.com>
 <73d41cd84c73b296789b654e45125bfce88e0dbf.camel@mailbox.org>
 <72eb974dfea8fa1167cf97e29848672223f6fc5b.camel@mailbox.org>
 <ab7d1937-d0e9-45f8-8f7d-ddd7a1a9d3d5@amd.com>
 <9a90f7f14c22c01aa28d89aa91bf4dfa4049c062.camel@mailbox.org>
 <334e843c-d7fe-4e33-b4fc-f3d18226465a@amd.com>
 <0b2fc70d8fae566c8ca43bafc929e2bd19725924.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <0b2fc70d8fae566c8ca43bafc929e2bd19725924.camel@mailbox.org>
X-ClientProxiedBy: FR4P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW3PR12MB4426:EE_
X-MS-Office365-Filtering-Correlation-Id: ac36526f-8010-49fe-866d-08dd780af1c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|4053099003|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3JWZ2kvamkvTytSaHlGODhQcEhHaDlHS3J0cmxTdmJYNEV5bVZ4Z2cySE0x?=
 =?utf-8?B?aHRsRWNoY3haRUZhd2dQdDZOMzR2Y29Cbi9OV01hZis5cTdwbWFzbjkzbEt3?=
 =?utf-8?B?bUR4R3RsNmlKTkducnM3S3lUK205UHdPdEcwcEM1L2ZhRmRxbTZaNkM1MFFl?=
 =?utf-8?B?cTY0a3pEeEgwQmlreDVPc2p5Q05oVG4xS3JvSk4raDI4NkFXYVBuaGtPcElR?=
 =?utf-8?B?bnU2ZjQ0NkJPcXRiTkorTC9BelRyRjBFQkZXVitFVFM4ZVR4TVhvbHRLYVZx?=
 =?utf-8?B?M0VlMUdkcTlqN2ZmcjZ3ZnRxNDdMUG9nWEtrQlQxK1NBQldFZHB2dThZSG54?=
 =?utf-8?B?czAwS0NQbTVacm02VXNXOGlFU3E5Q2RabUduYnpKWCtpcG1sT0ZXVGZ6dHBB?=
 =?utf-8?B?WFVrSW1XZW10VEd5ZnVidjBzNnJWRjI1dm9XTURmVEE4NXBTVGNzZm1YN05S?=
 =?utf-8?B?SXRQRTlKMU41cmREbHZBL0VYL1FubmpvZDdMYVRyQklDWGI3dk4yNmpNTGNp?=
 =?utf-8?B?UFNHVTVyZkd5dUkxYjBOUXVXd1VQbkNaaFp3VUpKOGFXcEFleXpDRkFLY2pX?=
 =?utf-8?B?Y2cvUnVpbHE1TzhFeDV5dTdEbDhIMFpHaVhqdXRrSmQ0a0p2TEdobFBlQ0dG?=
 =?utf-8?B?OUV6ZDdLNjEyY0w2QkRROU5WT3JHNGw1T1pURW92K0FCUGJhdmljYlVIUXli?=
 =?utf-8?B?bGNHcXoxZmYyRTJJRENQSUtEbGtjc3lYUzNkQkRuZGh0cFZOUCswYkNtQzhh?=
 =?utf-8?B?OHhYZzEyUXBYT2NvckN3NGpzM3lFWEtVZ1ZrSFlhVGpic0NDcmdLM3pBS3d0?=
 =?utf-8?B?WmYrdkVjRDFxWjViYTI0N2d5OWgzTytnWWNSWGkyTmVDUDFGN0NtelkrUVpQ?=
 =?utf-8?B?QVV3c3FRd0lMZWdtZlY1eHhERzhteDIzcXFQa2Z5MjVMcWlRTng2b3FGUHV5?=
 =?utf-8?B?M0xZRldGYlNMVC9rU0hBUzVCRGRXQUhJSnd0UUZDeHprZzN5czRFK1doV0lk?=
 =?utf-8?B?ZnJWMjdmZmYyT1FHMHZRUjY4bDhJUGdpZmxFYjZtbk5JMmNnMy9qM3hKUU43?=
 =?utf-8?B?L0RaZUdyRjdQd3Y2Qm1PYnRMVGpqcHh0M0wzMXk1Wml0dkpiUVRaeHBISDkz?=
 =?utf-8?B?RHErbzJHUmE3bVdhb3dMV2JGR3QwejBXQXJnaDFJalZZd0d0ajdjS0YzY1Bz?=
 =?utf-8?B?T0xkV1VTWVZURkNQamZTeUtWL1JmRUZLdXMzSG40dzVkamlxK0lTQ3pmd2JX?=
 =?utf-8?B?eVNVTW1QSmp1aFJZMlk4bUhQUmMwTWMwVmdpMEJvVnd2T2FGc25qWHdqMnN0?=
 =?utf-8?B?My9sKzRUOFNWeEJmTVkySFRtQ3ZOK3dSQ1lPcHlXeXYwSDNjdmw1WXdZc01H?=
 =?utf-8?B?QWxTaGRkek82ZlFtS0VSTE5tOWkzMlp3c3NjcDVWRVBDeDBteEx2SGtkZURC?=
 =?utf-8?B?bFFXOHlIQ1p1SXA5Q1ExNDFYa3RJOTdveTFFejBFMmE0SGxRNTIvREx6TDBT?=
 =?utf-8?B?VGhhSkpTYzhReVpHZ3lzejFYTjlxdlJPVFpTK3pnVWQ3bjdQV2RpdCtyaUtL?=
 =?utf-8?B?T0s1ZnJWNmVPNWpxajVWcXpkRlVMdE96ZTE3RFVkQndoNGk2OWhvaWd5T1NJ?=
 =?utf-8?B?bExXbVNSMkdmT3RCS2FNVE1YYXI1ME9yK2ZkTFJZRkJsY1c2UmVCY1ZoK2lI?=
 =?utf-8?B?V0VZVEYxSU5EbktCRXRGSVFnd210emFWZWhreWJaK0Z6ZWhmRTNWa0tBSm9O?=
 =?utf-8?B?bVI1SWRsOG91dWV5QWxOVzA5RDFuQVJ0MlpCZkI1SzVoS0h0OHVLTHlCeDd6?=
 =?utf-8?B?NnFNMU1iZStyUWk2QW4rSFI5RHNNYjFWZ2l1dUJNaVZSZFJ4MVc1RjRQb0hF?=
 =?utf-8?Q?SpJi82IAoRRen?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(4053099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEJOVVRGZkZjN2lVVjl1VUVxcWxMMndWaExDRFdodmZXcVQ2VnNTNUxCTHY4?=
 =?utf-8?B?TjR5NkFTKzEwYm4wYWlqVHZ1RU1RdDVSWml3a0JRTE9RcllRMUxndDNpRUUr?=
 =?utf-8?B?OVNRMU5NQXFEdUZPVkxGNTdBdmJtVi95V1UveEdKWklpSkQyODBOLzVUY0xK?=
 =?utf-8?B?TWFpclpoN1JoRFN0TGR3ZVNheXIxR1ljMTdvZEJIZ2RoVFFsei9COVZQK0R6?=
 =?utf-8?B?ZG03SUtoRUVpb0dvS3RkZ2RKNDVTMWIzUU9LM3ZmZGo4L2J0TDV3YTI2cFZr?=
 =?utf-8?B?MHhsNFJ2YVZjaWg4eHQ1UWhPVGlyblo3SnAvRUlWNnR2MXdtaGtZcHc4Y2w2?=
 =?utf-8?B?S2hVUTF0ckR3cDY1VWx4RTlabHVaQ1RWSy8wUUlkSGhhOWh1cnkybW9ralpi?=
 =?utf-8?B?SnZRUHlLZVh6dXFZcUxlTUNSV0xLbUlQYVRySHJzNDl3VnBUdWNtQ1RFbSt6?=
 =?utf-8?B?dEZBWTJoYWt3bDlqbDNiUGY4Vk9Zbkg5bkpvMmZiRWd6TVNrOGpGVVBzWE9z?=
 =?utf-8?B?MHpRRUFFbkd1cHdJbjkxMFkvellmSk4zMWl1Syt3bEJhbXg5OWtvZXU2QlYv?=
 =?utf-8?B?d2tncE4wOW9aMjVwYk1BdWEyMGlrbU1USnJwTUxFZ2FrZkQweUFNMDAwMjhi?=
 =?utf-8?B?N2hmVmgvSUxmOTBtNEprWnJzYlM5eHg3aEM1SjcyZElWa3Ewa1ZoNWJGMnpa?=
 =?utf-8?B?SytoNmNNSkdscEFwMHpnZjFlRWc4V2VwUWlFck1od1IwVE1HSzZJa1ZOTmZN?=
 =?utf-8?B?RHlURFE1V3hGTmJ3RmV3clpQL1p3enhSeStmV3dvUE9wVUs0bUdjbzB3ZmpR?=
 =?utf-8?B?TUJkczI1eFAvK3ZXc0x0UFlpMm1kejk5NEM2d1dYZTMzb2ZCSGZxSHFQWnN4?=
 =?utf-8?B?Q29VVjgvUUd5WnNTUXk5Y0pjUk0rQWVpL2RVOVB1RVBaNmcyTnp3R01ycEx3?=
 =?utf-8?B?RDhLU0ZrbjUxVUp6eEZUUW1sZEVRUE9lREw0M25Ca05HclJmUklua09FYTNw?=
 =?utf-8?B?T0N5ZVFDWVBtSkJyL1ZURWtGcWk2U3NZVW9HYWNxTGRlOVc1TDJiVC81bGhy?=
 =?utf-8?B?Y0ljM3NTaVJRUVROVjU5RE1DWWdZWjd0cG5mdXdOYk1mMFZ1VTVwMnQxTUpv?=
 =?utf-8?B?YkNSUGVueXZ4OWFGeVZDSnFkdEhJTzdsTTNGK0dVUmZpamVXSjc5UU8rOFJC?=
 =?utf-8?B?TlBnM2JmcFlwa3RnUnkveXJ1OGFXSGZmalFrVklDS1ZkUVR2YXFvcDQwc1Zz?=
 =?utf-8?B?cGxYWU9JcG40VDFLczhwelcxQWpQRGwxV2ZpSmlyWmY5QTdidDExZTRsYjVU?=
 =?utf-8?B?NHpJa3RJWUIvNlE5cWswNjBQd05YK3RTTFFIMTNzNU1RL1JXNE9Sbjl1Mm5o?=
 =?utf-8?B?azNZdUU2dVIyaldEYS9ka3NxZFhDNkRwcWpibGZSSjNNazZMaG9IMmpMSktX?=
 =?utf-8?B?WEhaaXYvWUdrR01MLzhtSkh5WSt2bzIwd0xEaDg5L0gwT3NtYzg1WnBnMGk5?=
 =?utf-8?B?cjl3QUh2a2hIRFMvdTAxYzRCbkU1OE9Ka2RYSE1xNnBySHVBdXd6ZVFEc2xx?=
 =?utf-8?B?QzE1MEY1S0ZaZVN1Z2lGOUZGMmtKSVlkcXdsblNPTzBPNzkySE1NOVRPU3BJ?=
 =?utf-8?B?RDhlc25qYlpGWkVjcVZqdFZxNXFXYlM0Vm1YM2NHRE9QeFpSKzRheXJzMktW?=
 =?utf-8?B?KzhDRXI3b2lVaHA5RytRVHJsZ0VSeUxWWGVVSDQ1bkREUFg3c3E4UXg5dzJx?=
 =?utf-8?B?SVNyVXl1TmxrWnFtS0Z6eHkyV1pnWGJ6RjRoMXBwZ1RTTk5pd04vNm5INDBy?=
 =?utf-8?B?ajdoQzYxYlhCbzVWOGd6Q0U3MlhVVVNBZU1CR0dMejdsTVhyUG5jeFRPVURT?=
 =?utf-8?B?Mmdoak4vVHhqUCtFT29XY3lsVm5qclV2RWtEeVVOQmRFY3AzZkJCTXJYS2ls?=
 =?utf-8?B?S1U1WGZOdmxFZlR5dXc3VDVSek4wSENOc0t0QUdxOWI0ekRCVG1SQTgxRVpR?=
 =?utf-8?B?SHNqa3BKUmxDaTJGSkNIVXVKQUJ3cFRvYkEweFVoYWdJUW9LQlJBdEp1VERt?=
 =?utf-8?B?N2ZWQ1F6bjV5NEFuWXZHckRWdlErYXlqWnVCM2NqMXVpNXM0ZU1FaDdLNnQr?=
 =?utf-8?Q?mJKs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac36526f-8010-49fe-866d-08dd780af1c9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:37:35.9724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geU0JqPTkFQad5oiNqNKoYle62eAG7hLQ2sXBBOR5Yn8L7KwdSjdzoSH5gKa6dcs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4426
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

--------------RitEXH8ONBTGBTbpKtqnx0LV
Content-Type: multipart/alternative;
 boundary="------------SqV01NuVquRMkgoJu407omKu"

--------------SqV01NuVquRMkgoJu407omKu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 09.04.25 um 17:04 schrieb Philipp Stanner:
> On Wed, 2025-04-09 at 16:10 +0200, Christian König wrote:
>>> I only see improvement by making things more obvious.
>>>
>>> In any case, how would you call a wrapper that just does
>>> test_bit(IS_SIGNALED, …) ?
>> Broken, that was very intentionally removed quite shortly after we
>> created the framework.
>>
>> We have a few cases were implementations do check that for their
>> fences, but consumers should never be allowed to touch such
>> internals.
> There is theory and there is practice. In practice, those internals are
> being used by Nouveau, i915, Xe, vmgfx and radeon.

What do you mean? I only skimmed over the use cases, but as far as I can see those are all valid.

You can test the flag if you know what the fence means to you, that is not a problem at all.

> So it seems that we failed quite a bit at communicating clearly how the
> interface should be used.
>
> And, to repeat myself, with both name and docu of that function, I
> think it is very easy to misunderstand what it's doing. You say that it
> shouldn't matter – and maybe that's true, in theory. In practice, it
> does matter. In practice, APIs get misused and have side-effects. And
> making that harder is desirable.

That sounds like I didn't used the right wording.

It *must* not matter to the consumer. See the purpose of the DMA-fence framework is to make it irrelevant for the consumer how the provider has implemented it's fences.

This means that things like if polling or interrupt driven signaling is used, 32bit vs 64bit seq numbers, etc... should all be hidden by the framework from the consumer of the fences.


BTW I'm actually not sure if nouveau has a bug here. As far as I can see nouveau_fence_signal() will be called later eventually and do the necessary cleanup.

But on the other hand it wouldn't surprise me if nouveau has a bug with that. The driver has been basically only barely maintained for quite a while.

> In any case, I might have to add another such call to Nouveau, because
> the solution preferred by you over the callback causes another race.
> Certainly one could solve this in a clean way, but someone has to do
> the work, and we're talking about more than a few hours here.

Well this is not my preferred solution, it's just the technical correct solution as far as I can see.

> In any case, be so kind and look at patch 2 and tell me there if you're
> at least OK with making the documentation more detailed.

As far as I can see that is clearly the wrong place to document that stuff.

Regards,
Christian.

>
> P.
--------------SqV01NuVquRMkgoJu407omKu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 09.04.25 um 17:04 schrieb Philipp Stanner:<br>
    <blockquote type="cite" cite="mid:0b2fc70d8fae566c8ca43bafc929e2bd19725924.camel@mailbox.org">
      <pre class="moz-quote-pre" wrap="">On Wed, 2025-04-09 at 16:10 +0200, Christian König wrote:
</pre>
      <blockquote type="cite"><span style="white-space: pre-wrap">
</span>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">I only see improvement by making things more obvious.

In any case, how would you call a wrapper that just does
test_bit(IS_SIGNALED, …) ?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Broken, that was very intentionally removed quite shortly after we
created the framework.

We have a few cases were implementations do check that for their
fences, but consumers should never be allowed to touch such
internals.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
There is theory and there is practice. In practice, those internals are
being used by Nouveau, i915, Xe, vmgfx and radeon.</pre>
    </blockquote>
    <br>
    What do you mean? I only skimmed over the use cases, but as far as I
    can see those are all valid.<br>
    <br>
    You can test the flag if you know what the fence means to you, that
    is not a problem at all.<br>
    <br>
    <blockquote type="cite" cite="mid:0b2fc70d8fae566c8ca43bafc929e2bd19725924.camel@mailbox.org">
      <pre class="moz-quote-pre" wrap="">So it seems that we failed quite a bit at communicating clearly how the
interface should be used.

And, to repeat myself, with both name and docu of that function, I
think it is very easy to misunderstand what it's doing. You say that it
shouldn't matter – and maybe that's true, in theory. In practice, it
does matter. In practice, APIs get misused and have side-effects. And
making that harder is desirable.</pre>
    </blockquote>
    <br>
    That sounds like I didn't used the right wording.<br>
    <br>
    It *must* not matter to the consumer. See the purpose of the
    DMA-fence framework is to make it irrelevant for the consumer how
    the provider has implemented it's fences.<br>
    <br>
    This means that things like if polling or interrupt driven signaling
    is used, 32bit vs 64bit seq numbers, etc... should all be hidden by
    the framework from the consumer of the fences.<br>
    <br>
    <br>
    BTW I'm actually not sure if nouveau has a bug here. As far as I can
    see nouveau_fence_signal() will be called later eventually and do
    the necessary cleanup.<br>
    <br>
    But on the other hand it wouldn't surprise me if nouveau has a bug
    with that. The driver has been basically only barely maintained for
    quite a while.<br>
    <br>
    <blockquote type="cite" cite="mid:0b2fc70d8fae566c8ca43bafc929e2bd19725924.camel@mailbox.org">
      <pre class="moz-quote-pre" wrap="">In any case, I might have to add another such call to Nouveau, because
the solution preferred by you over the callback causes another race.
Certainly one could solve this in a clean way, but someone has to do
the work, and we're talking about more than a few hours here.</pre>
    </blockquote>
    <br>
    Well this is not my preferred solution, it's just the technical
    correct solution as far as I can see.<br>
    <br>
    <blockquote type="cite" cite="mid:0b2fc70d8fae566c8ca43bafc929e2bd19725924.camel@mailbox.org">
      <pre class="moz-quote-pre" wrap="">In any case, be so kind and look at patch 2 and tell me there if you're
at least OK with making the documentation more detailed.</pre>
    </blockquote>
    <br>
    As far as I can see that is clearly the wrong place to document that
    stuff.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:0b2fc70d8fae566c8ca43bafc929e2bd19725924.camel@mailbox.org">
      <pre class="moz-quote-pre" wrap="">

P.
</pre>
    </blockquote>
  </body>
</html>

--------------SqV01NuVquRMkgoJu407omKu--

--------------RitEXH8ONBTGBTbpKtqnx0LV
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-nouveau-fix-and-cleanup-fence-handling.patch"
Content-Disposition: attachment;
 filename="0001-drm-nouveau-fix-and-cleanup-fence-handling.patch"
Content-Transfer-Encoding: base64

RnJvbSAzMGI5NTc0YmFhZGNmODYwMTA0ZTYxY2UyNzY3Zjk5OTliYmRkNzdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/Q2hyaXN0aWFuPTIwSz1DMz1CNm5pZz89IDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkRhdGU6IFRodSwgMTAgQXByIDIwMjUgMTA6MTg6Mjkg
KzAyMDAKU3ViamVjdDogW1BBVENIXSBkcm0vbm91dmVhdTogZml4IGFuZCBjbGVhbnVwIGZlbmNl
IGhhbmRsaW5nCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hh
cnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpUaGUgZmVuY2Ugd2Fz
IG5vdCByZW1vdmVkIGZyb20gdGhlIHBlbmRpbmcgbGlzdCB3aGVuIHNpZ25hbGVkIGZyb20gdGhl
Ci5zaWduYWxlZCBjYWxsYmFjay4gRml4IHRoYXQgYW5kIGFsc28gcmVtb3ZlIHRoZSBzdXBlcmZs
b3VzCi5lbmFibGVfc2lnbmFsaW5nIGNhbGxiYWNrLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfZmVuY2UuYyB8IDMxICsrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZmVuY2UuYyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfZmVuY2UuYwppbmRleCA3Y2M4NDQ3MmNlY2UuLjUzYzcwZGRl
Zjk2NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9mZW5jZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZmVuY2UuYwpAQCAtNDg1LDMy
ICs0ODUsMTggQEAgc3RhdGljIGJvb2wgbm91dmVhdV9mZW5jZV9pc19zaWduYWxlZChzdHJ1Y3Qg
ZG1hX2ZlbmNlICpmKQogCQlyZXQgPSAoaW50KShmY3R4LT5yZWFkKGNoYW4pIC0gZmVuY2UtPmJh
c2Uuc2Vxbm8pID49IDA7CiAJcmN1X3JlYWRfdW5sb2NrKCk7CiAKLQlyZXR1cm4gcmV0OwotfQot
Ci1zdGF0aWMgYm9vbCBub3V2ZWF1X2ZlbmNlX25vX3NpZ25hbGluZyhzdHJ1Y3QgZG1hX2ZlbmNl
ICpmKQotewotCXN0cnVjdCBub3V2ZWF1X2ZlbmNlICpmZW5jZSA9IGZyb21fZmVuY2UoZik7Ci0K
LQkvKgotCSAqIGNhbGxlciBzaG91bGQgaGF2ZSBhIHJlZmVyZW5jZSBvbiB0aGUgZmVuY2UsCi0J
ICogZWxzZSBmZW5jZSBjb3VsZCBnZXQgZnJlZWQgaGVyZQotCSAqLwotCVdBUk5fT04oa3JlZl9y
ZWFkKCZmZW5jZS0+YmFzZS5yZWZjb3VudCkgPD0gMSk7CisJaWYgKHJldCkgeworCQkvKgorCQkg
KiBjYWxsZXIgc2hvdWxkIGhhdmUgYSByZWZlcmVuY2Ugb24gdGhlIGZlbmNlLAorCQkgKiBlbHNl
IGZlbmNlIGNvdWxkIGdldCBmcmVlZCBoZXJlCisJCSAqLworCQlXQVJOX09OKGtyZWZfcmVhZCgm
ZmVuY2UtPmJhc2UucmVmY291bnQpIDw9IDEpOwogCi0JLyoKLQkgKiBUaGlzIG5lZWRzIHVldmVu
dHMgdG8gd29yayBjb3JyZWN0bHksIGJ1dCBkbWFfZmVuY2VfYWRkX2NhbGxiYWNrIHJlbGllcyBv
bgotCSAqIGJlaW5nIGFibGUgdG8gZW5hYmxlIHNpZ25hbGluZy4gSXQgd2lsbCBzdGlsbCBnZXQg
c2lnbmFsZWQgZXZlbnR1YWxseSwKLQkgKiBqdXN0IG5vdCByaWdodCBhd2F5LgotCSAqLwotCWlm
IChub3V2ZWF1X2ZlbmNlX2lzX3NpZ25hbGVkKGYpKSB7CiAJCWxpc3RfZGVsKCZmZW5jZS0+aGVh
ZCk7Ci0KIAkJZG1hX2ZlbmNlX3B1dCgmZmVuY2UtPmJhc2UpOwotCQlyZXR1cm4gZmFsc2U7CiAJ
fQogCi0JcmV0dXJuIHRydWU7CisJcmV0dXJuIHJldDsKIH0KIAogc3RhdGljIHZvaWQgbm91dmVh
dV9mZW5jZV9yZWxlYXNlKHN0cnVjdCBkbWFfZmVuY2UgKmYpCkBAIC01MjUsNyArNTExLDYgQEAg
c3RhdGljIHZvaWQgbm91dmVhdV9mZW5jZV9yZWxlYXNlKHN0cnVjdCBkbWFfZmVuY2UgKmYpCiBz
dGF0aWMgY29uc3Qgc3RydWN0IGRtYV9mZW5jZV9vcHMgbm91dmVhdV9mZW5jZV9vcHNfbGVnYWN5
ID0gewogCS5nZXRfZHJpdmVyX25hbWUgPSBub3V2ZWF1X2ZlbmNlX2dldF9nZXRfZHJpdmVyX25h
bWUsCiAJLmdldF90aW1lbGluZV9uYW1lID0gbm91dmVhdV9mZW5jZV9nZXRfdGltZWxpbmVfbmFt
ZSwKLQkuZW5hYmxlX3NpZ25hbGluZyA9IG5vdXZlYXVfZmVuY2Vfbm9fc2lnbmFsaW5nLAogCS5z
aWduYWxlZCA9IG5vdXZlYXVfZmVuY2VfaXNfc2lnbmFsZWQsCiAJLndhaXQgPSBub3V2ZWF1X2Zl
bmNlX3dhaXRfbGVnYWN5LAogCS5yZWxlYXNlID0gbm91dmVhdV9mZW5jZV9yZWxlYXNlCkBAIC01
NDAsNyArNTI1LDcgQEAgc3RhdGljIGJvb2wgbm91dmVhdV9mZW5jZV9lbmFibGVfc2lnbmFsaW5n
KHN0cnVjdCBkbWFfZmVuY2UgKmYpCiAJaWYgKCFmY3R4LT5ub3RpZnlfcmVmKyspCiAJCW52aWZf
ZXZlbnRfYWxsb3coJmZjdHgtPmV2ZW50KTsKIAotCXJldCA9IG5vdXZlYXVfZmVuY2Vfbm9fc2ln
bmFsaW5nKGYpOworCXJldCA9IG5vdXZlYXVfZmVuY2VfaXNfc2lnbmFsZWQoZik7CiAJaWYgKHJl
dCkKIAkJc2V0X2JpdChETUFfRkVOQ0VfRkxBR19VU0VSX0JJVFMsICZmZW5jZS0+YmFzZS5mbGFn
cyk7CiAJZWxzZSBpZiAoIS0tZmN0eC0+bm90aWZ5X3JlZikKLS0gCjIuMzQuMQoK

--------------RitEXH8ONBTGBTbpKtqnx0LV--
