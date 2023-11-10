Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0E27E7CF8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 15:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDA610E088;
	Fri, 10 Nov 2023 14:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2079.outbound.protection.outlook.com [40.92.42.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59BD10E088
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 14:29:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naDu50TeLul3hJyX3YDr/ZgHs461DU/HXlaOofGXJQHQ/pWPcxluRQuNAwQEqyvQvnjbG+JvYLyOwfe/YSZi4q0iPWW1UofIfu61SXQzlRNB0v9bfIyAGuRnbxSMx/Kv+E4PNEapFEPF7FA9mssVYx110bvs57NeoNIEj3GfLRktbbaQ4ak+Nobd8Oh6FE8/d3/NHKK3FKx1aVmUsehyRup5A3yRuFkvOUoRU+kEfdfHvAS5QLWsMPWALCXfH1U3zivKy7kN6E+M86IV5g8YS4nCmv7spiWg36uzix71nBN1ulXdhyA/iQU9qDNzjIulRFT6hrH8aFrotXiH9MUDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+IiaW2+AFnb9xkq1TIsxwCk+iN1UuoPX/AMeiut2wQ=;
 b=AlslfOOTTnZnfIe9VYLcfW3sv/m6vqjOFJIz5lCwl+Au3iWMbiLsPHCGl6v6Os440X3BNFizi8YXr6+yNz8rR2v+ihywjf5EV7w4vDpZtjXbv4UvCusqfdZbf39qoDoEbljU9qS7gEDw/oOevINpfE7nw95HfopvzXeR/3oxgFVP+eLpY5sHEQ9uZ07r1p349ZA4dQJDuTbndO6+54D889DBvQ1smmK06cDDZ6dBimg14lGLqy2ibVTicUlZkYvPyLA3t0KOkXEjmDI7/QbogYalLl1E9VOy1kgdkMuEijJpsBPUT2WkzQF+vumca+alRAMp/EWdw7W6BPVIxrYICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+IiaW2+AFnb9xkq1TIsxwCk+iN1UuoPX/AMeiut2wQ=;
 b=jg5JcKaSstIbP7GHG3i6ytvZA7jST2gQLYNW0mC/KK/758npNFrysBe8Q5rdXdha1KwR1F5LMObv0O9AhomhBo+FU7/KKHr5/kJ/kVVZE+pagjok1FkcwXOGp2gpDbqu90ZEkgUpfZUAispBLWXatesClDsqoPlZiZlK0ut6RPXUtdwaJpUiR+TIHsuWxRr8Mnd2H3UHo1sCG7fkJJ8T19oKoqstyqdi7/KMcdozc/Yk6CckxskrYpUva5ByT7iJZ9h210Dd1pEcKXYmlJ+Z88QedL9k58u3n7zGHu3TdyBFt5MIW7IOseMsNj+yuzK4RfHDJ9fPKAfCIqEE2ZxK1w==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SJ0PR06MB8280.namprd06.prod.outlook.com (2603:10b6:a03:394::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21; Fri, 10 Nov
 2023 14:29:01 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::3fca:a39b:c9d2:c834]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::3fca:a39b:c9d2:c834%2]) with mapi id 15.20.6954.025; Fri, 10 Nov 2023
 14:29:01 +0000
Date: Fri, 10 Nov 2023 08:28:58 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH V2 1/4] dt-bindings: display: panel: Update NewVision
 NV3051D compatibles
Message-ID: <SN6PR06MB5342A696F25065F9C253154CA5AEA@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231109215007.66826-1-macroalpha82@gmail.com>
 <20231109215007.66826-2-macroalpha82@gmail.com>
 <c012c0b3-d6ca-4291-aa0c-05a192f30dcb@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c012c0b3-d6ca-4291-aa0c-05a192f30dcb@linaro.org>
X-TMN: [JUhyr7PlyRTypM2yne3f/zlha1d4jE0U]
X-ClientProxiedBy: SA1P222CA0132.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::15) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZU4+KlXPw3SvFsij@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SJ0PR06MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df90576-75f3-40af-2873-08dbe1f961a3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E6eYeVK/YUC9aIjVjFubG9ucDrvpz/f0Eb/J+s3HN/5orgBSnM3ENlJaWeDk/PF58RiGVB0ki7BZ/Hc6W45xFcC0+mdMkT+5LBxCMiti/MBahMqAp0pR45/mv+7eg/ryUHP08407ZND+jgErW/RKvJb61VeMD9INGPDPe9dKU5sUWqpadyGk6ORlsnQzVDl4zqp89xIrYKeLlQVtgbw+0hVLZCXTIM4XDmmn6O6SsMIRwuCEmKtZchlve1r1PMev85HAKONeoidYEcAN6cu2jcc1jSDOZlpegOOPnUl43Gg4dT9u9H5obZEAe+h5ukSh+eqaef9KIZF3qTdc1eFqCkUHrRjQ9mazg7+Jyt++jcWba7REvCLl8MaukZavrXVjC8+VkooB+eEES0Nt4vf4lxMMHjx9JOFKpzce8umwhCK6j1o8ttYRKVytsQ4WQtGcz79iuMhVmMuhbiQPlXkWEogXDbuUMAX+8wVFy9NuTTv7umz1HqdowBt4eXYGX27K3ZoJWpbyqG6SlFRuuWhl5ikFE3+LbXd/5L7jpqDMKe6ooG2INk0BoJ/guWX/zLMs
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AYg4PIrggpYW1q30u470IjGzrNceuGuWWdG/WqaOBWu/cFbmaIoRSoCPxV8s?=
 =?us-ascii?Q?EbVy6SX8R7aaxHtAtgD2dx4ZJ5OQH9tt6trPuGLAweD9LqfpnONdN3e0yjHr?=
 =?us-ascii?Q?uDQiLZhJyLOd4bSJsoD42VS9l5BebkzaWLEUyYdrSpS00m8UtV7xVG0ht4cT?=
 =?us-ascii?Q?R6tM8ecWEUJFtKORZDiYa/HT/ZAqX4RfaIfULtr8oLyrKGnLDHAvCR8iL2t9?=
 =?us-ascii?Q?KcZQic0ymffLYI2ZtYEesIWvxPXBHkOB4C/IEX403CSkb4Qpe7jWd57gDaHq?=
 =?us-ascii?Q?tRmwetE+hVdkgVFnsagyo9+kifXrwPc31O3QKti9MyXZidV1Vnlly3nPqzCO?=
 =?us-ascii?Q?cSsAkHr0d54uf/WbMpSM/9qvDrFS3dKszPySen8rTHqylNO0j8mD+D+PEd6v?=
 =?us-ascii?Q?151xsQM1+eaA8XIOtHHFnQ2Jon8ooLUTHXSoXlub7D3y/rnb4zPkI5vG5T/q?=
 =?us-ascii?Q?Q/Q3+dFSaVQUHyUSWACJ+je+NNh4iKeB0UvAdnB8qp9i5xa2fZAf768YPrgr?=
 =?us-ascii?Q?c0rkXinyaxrxJowwfJIkBl++ClfbnlDYz0nEsTgpBieVinSdjvrS0RbKRrxJ?=
 =?us-ascii?Q?grXMhNPXZtE+cygUpikUePuP/ebViTlc/G3Q34CWrlimCBl8eH9OXM9qo2/I?=
 =?us-ascii?Q?8GeeHN0i8fdjEQQ4DHPaNHHfetm7uaKZ4vwfpWkLVeGxtGtmjRYLNsj1Us8B?=
 =?us-ascii?Q?LozQipaXsD2iGoPQjmtOWr4132oaGju/FvzTf1OdzpCtR35frQcAEW9eLttv?=
 =?us-ascii?Q?hdk+ZwssYZUQJjofTRyaYRrwueolklhI5yX11IDRlTHCLkEbGESIOtLJBVsV?=
 =?us-ascii?Q?LAkAM0L2zqlIGFaIKdO92EQUSKjR7Xxkt22ywiHCHh8auOBnlKi4sM5LDGpN?=
 =?us-ascii?Q?isBw0u8ehoPBkpLhjzju3FKDk2E5Z3CyDOLXq8w5x+lTy4SXvVmk7kyjo85V?=
 =?us-ascii?Q?GONzrDquKPVw8/LPR2caandxiEyXaMAUCWgKfEZUNVMbJd06TGyXnJshKgPr?=
 =?us-ascii?Q?Hnvj0uLkhpZYg4RM2nZY7r15Wm96dkLqObDPv7WVXxu6JvtqVMglrVpTnO/h?=
 =?us-ascii?Q?t8oqg1+mi3FTbkigLBuNZ8dbRcp4RAW6vrIA6UyYkei5cyygJcdiNh5K1w1P?=
 =?us-ascii?Q?xZIsL/F6IhXx1/g9r2+zv5LUbkJawI5chXrusPzGMUvvVzVaGFBZRFCKV5Wi?=
 =?us-ascii?Q?NCCxYyYKaaOJfSa9ihH/eHB1XciFoayOqDHUAM44ionfon44hbTjxvpsq7I?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df90576-75f3-40af-2873-08dbe1f961a3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 14:29:01.5450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR06MB8280
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 sebastian.reichel@collabora.com, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 10, 2023 at 02:11:58PM +0100, Krzysztof Kozlowski wrote:
> On 09/11/2023 22:50, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Update the NewVision NV3051D compatible strings by adding a new panel,
> > the powkiddy,rk2023-panel, and removing another entry, the
> > anbernic,rg353v-panel. The rg353v-panel is exactly identical to the
> > rg353p-panel and is not currently in use by any existing device tree.
> > The rk2023-panel is similar to the rg353p-panel but has slightly
> > different timings.
> > 
> > I originally wrote the driver checking for the newvision,nv3051d
> > compatible string which worked fine when there was only 1 panel type.
> > When I added support for the 351v-panel I *should* have changed how the
> > compatible string was handled, but instead I simply added a check in the
> > probe function to look for the secondary string of
> > "anbernic,rg351v-panel". Now that I am adding the 3rd panel type of
> > "powkiddy,rk2023-panel" I am correcting the driver to do it the right
> > way by checking for the specific compatibles.
> 
> I don't understand how any of this driver behavior is a reason to drop
> rg353v. You wrote two paragraphs to justify this removal, but I feel the
> only reason is that rg353v is just not needed, because it is duplicating
> rg353p? Is this right? You actually did not write it explicitly...

Sorry if I wasn't clear, I did note that the rg353p-panel is exactly
identical to the rg353v-panel. Should I add additional details beyond
that to clarify?

Thank you.

> 
> Best regards,
> Krzysztof
> 
