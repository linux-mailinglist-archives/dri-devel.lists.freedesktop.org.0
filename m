Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CB55E8F0D
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 19:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C84D10E03F;
	Sat, 24 Sep 2022 17:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn2092.outbound.protection.outlook.com [40.92.41.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B9210E03F
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 17:51:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRj2Vo8PbP9GY09behg0OB2xrojPZ+vGUYuy99V9MWdMJsHV9HuIRY9MO0KMaQ+1D6ELqwlN2yKNTeFVFob4/3LVvB2Ov2vEnwVBIbgUfoSa38f0dlFR5HECsCP4GxTWde/QDqyzbvWVIWnYmGOyBZ6ULwgsTF6X0lgau4F9wguiIvrjKblIM/scTboKZGz0hU/uHm3AdSAs0cKLyi+0f1hAWSsj9mUlre4vdUhEdCmQQZ1T53d/r7hXSAPi/OnxGdc6QSj2IG2gy5q0ejVFxBj6YgB7zbcnIcc1nLU/EhhEgegLk5tKsT2oJ3ig4AzESKXvICQIh3OtHRufTBZ9iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBSF2a6DVsM6OLnefJg+mFYzUBz3eXcPUUrqi7/PEpE=;
 b=HUbyuy/mPqwq2cs6nqHxXYmn7j1Qcyijsd6E5mZllksanaXpx5rygTCMx8nhv+Xk2GTaXqdtLtQlvRQSdaiY/Vzc6ikUdFZDpforycVKzH+HhDaH3fuekO4+q57YqdemXQ6lqGwJ/Hu7wVQEpiYeXRkG6YeRmJtbBFhW9EPa1k35famJ2UdaJEv+rLCGwb9nJekQSTMIorQ2b/hWXk+lY8lsNgrXMi6g+V0UQlAUR7VKn9Je4I5LncKuWJcvU/PjDzewvk0bkkgKCVkuHmdrPz/jSJchadh/F/cP62QTKxH+3YtaAIDOUbiLCwy3nCb4n44+mXat+6VRXtksSMNWRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBSF2a6DVsM6OLnefJg+mFYzUBz3eXcPUUrqi7/PEpE=;
 b=uqufOIFV5aRDf0Svsc7D9XxKlth0nkFQ1uxkQPgmP7Z9qSZX6cac38hwMduxwoY91VJs78uCbWN61c/NOq4wvVZWKlaRwwEjivSDs8z3iT7sm4irxe5aAAfuK1DLFGRbuJhZxkZG9tONUD3dyvXyA02IiB+jyqj1yusgbkEVdKOl4g1QegiJGKBU38OooyiRnsIVYnfyG23Zu5xq4QzYDyQRE0aLkO7RzPbkGpD8tS6+yKqxHr9sakjw15S9RbVxnDSA6syxYKEGa025//9SRr32RbDNpDys5lyeI76Tp9fCJdKnlrUJL6O216vGpY1MkhJG3mSExhXbJQ/6fTIh9A==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by CY4PR06MB3431.namprd06.prod.outlook.com (2603:10b6:910:50::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.18; Sat, 24 Sep
 2022 17:51:26 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43%5]) with mapi id 15.20.5654.022; Sat, 24 Sep 2022
 17:51:26 +0000
Date: Sat, 24 Sep 2022 12:51:24 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 2/3] dt-bindings: display: panel: Add NewVision
 NV3051D bindings
Message-ID: <SN6PR06MB5342F2CB54D028B446D27BA0A5509@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220920145905.20595-1-macroalpha82@gmail.com>
 <20220920145905.20595-3-macroalpha82@gmail.com>
 <20220924170744.GA961091-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924170744.GA961091-robh@kernel.org>
X-TMN: [wJSMGJ6RIWnPO8fJD+uEuu/ErYZ1mOBg]
X-ClientProxiedBy: SA0PR11CA0123.namprd11.prod.outlook.com
 (2603:10b6:806:131::8) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220924175124.GA17667@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|CY4PR06MB3431:EE_
X-MS-Office365-Filtering-Correlation-Id: e98436bc-4737-4d79-87ab-08da9e5566f3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wd+tT6NtZ4jZmCRP87fZjv4o6Cad50pOvg51xJHwRwySnFDS9UX+6q6wNtgzXMR6CGHYyIXkZS5RN2rkTmeptyNdXvNexR6q6r3lorocQkBJzaq0U8QFW9RfT4kRmDGTMAdIi7Jc2jahmYhH9W8os/QLtwOQWB1B/NNu+9lejdRpM8XPOpMH1Td1UJN4Y5uFJkahVa5YT5UQZt0z4DP2QODrVaT7BgNwhxodyCFJiHsPAbpciqaJK+1GqUgQirP70/4PJVVfqlE0dVDrpTy4qW+0HDWCIfN5ldvkeTJB/C2JTrR0OPP0Aix0cTukVdEe18y6ojKbbPYu39fO87tYIyg9U+8XPklXb5XVmIRvByRoTuzMkZB8aK6R59ftnwPcbiB11+YjvbkmMrwediCqvacJb2dsMv8mg7ImgI0y+KSu67F1g9qZUCEE6MwQY3mHUfiCnmMv/2TIgtit4EbsCn5+bPTUFWPi33Fz+8wo2tM7gySQQS3PFI/0Qr64+n84751veXkt42dL8JiIyHWEdWS4RgOhADoHI/RboBDltMr4D2Df+exjm/Z+mmVL2Wp/PPIUbAgTyGpJr7opXMCHMw/MJ52Dp+IoPY1GKBlv5JrI21H2xQ6K8oG1DOd3l0RSNiuftUPH0z0sl6UqYwhimTFp5h1pq86z7C1Gr8o2OoGscEDKDTf9q32rsihcLuQc
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oC/x9sYhNF7DjF4c0S+paisM9VJgyPUXYmU1WthPdNaj3mItAYNWbmCRy4FC?=
 =?us-ascii?Q?WSw3uEfcqfvxifT8YSrqM74kt34V6CFRHeTOaUUc+ExOTsI0GEmMe062SLBs?=
 =?us-ascii?Q?kKvomnhXhqA4qRAQ+OvLx4J9uMJhtVB3tSQ/1x2HhP0VqIZTuchUbiLTHy/8?=
 =?us-ascii?Q?s7d+Z6ABSP0A0PY6Yl8hM1KDTV9/1zcVhuoncXSm4TOG5mie8Vromh60k7jo?=
 =?us-ascii?Q?WrS3gPVJl3iMG6v8pLYoCiFlb+Db6cUDlwRh5rZjc2ZJDH3Yle+ekxbdW+m8?=
 =?us-ascii?Q?BrcotvXbzoosN3B4vt9vLvBpY7zqJOdgvxXm9Kn6WZbkNSxMwRo6bdJ7Os8y?=
 =?us-ascii?Q?p4aFnWDSwg22B80PGjf1AySDSrnKyTmd1vwdF+vkcUCqSoFNn40Dsi/x4L/E?=
 =?us-ascii?Q?uSRQI5ggHgflKXMf/G4huju+bd5siqRuCAoVGdIp50PLn7hN3ZPVvu2QXSSk?=
 =?us-ascii?Q?aQ9UUdoZfU2yY3YpyYapc29OBX7JU2RxTphZJeplBjXtpSJmg6lGi4flS8Vx?=
 =?us-ascii?Q?CdSXe4xj1NbIit9vmZ5wpvJu1Dz/Brv5cJzLU8nVvg6y8yJxyT04/xO4sLDf?=
 =?us-ascii?Q?hp010XoNhK+ub65UFWs7Ip2f4w6aEJ3qo73iZdgIn15a8F+od0L53J61TPl8?=
 =?us-ascii?Q?guH2x76jOM6Lbz6vM9GKCLa/0Ogf2RPxAx3dfnZUfdsnUYfVAvhuL3lJOlK8?=
 =?us-ascii?Q?5mM1ciuY3Za6/1RsO9ZwJYLFLblaWg65TEWh6O4oW6K1Kx/y9LTSe+xoAek/?=
 =?us-ascii?Q?3eytwGdbPfPMyqORFQWQCMyjYwXxj56qOc+9YF46GebsO/RXjpEhR/0BAPWE?=
 =?us-ascii?Q?m4m2yzatE/gH5kAenia2hv5v3rbnJeAB0Hg8TddqmHNeJ8b/Ie/rBS7VnOVv?=
 =?us-ascii?Q?vJzjUBH86QjKWnuMmaWA4rvnsyaCaU5y87XTUvP5ZIXmA+V0TfYSinxuNHpn?=
 =?us-ascii?Q?AA2OBitLbyzxAa97dBBH58N/WjYywxN9DJWRiYotK8V1eRQu902Q+bv1XmIH?=
 =?us-ascii?Q?x2uQCqsNLkDJLzp3S6g7w8DLJnd36ptAHPkaHbCd1rHXZNDOpRxhsRtKp0S7?=
 =?us-ascii?Q?v1dAa2O8+MVZe9Zfiikr8X2SiYz8bnLeHt+FazpUo77O/ZbXP0BVlSFSwD0M?=
 =?us-ascii?Q?I1sorlDQiK/lGTcNqxfCen1FRyn5rKZkCZw2HeuxV+QLth7hVtuv51+J7Br2?=
 =?us-ascii?Q?uXLT4QHovKnPav2lEUyHO66OpDGN1WBMcbJY6YKkZaREemkQL+CQjtfEOXBR?=
 =?us-ascii?Q?bUPjwEFk+fLAKJqMh0Eq77hXDFPxil31Gwkmm9OYGA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e98436bc-4737-4d79-87ab-08da9e5566f3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2022 17:51:26.7209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR06MB3431
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>, thierry.reding@gmail.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 24, 2022 at 12:07:44PM -0500, Rob Herring wrote:
> On Tue, Sep 20, 2022 at 09:59:04AM -0500, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add documentation for the NewVision NV3051D panel bindings.
> > Note that for the two expected consumers of this panel binding
> > the underlying LCD model is unknown. Name "anbernic,rg353p-panel"
> > is used because the hardware itself is known as "anbernic,rg353p".
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  .../display/panel/newvision,nv3051d.yaml      | 55 +++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> > new file mode 100644
> > index 000000000000..d90bca4171c2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> > @@ -0,0 +1,55 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://nam12.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fpanel%2Fnewvision%2Cnv3051d.yaml%23&amp;data=05%7C01%7C%7C4f204345128d4cb827ca08da9e4f4d06%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637996360672620588%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=9%2B66S0t1p9EqWBdmaLBj8pKte2fjzsmL%2FSbmmD8eNi0%3D&amp;reserved=0
> > +$schema: https://nam12.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=05%7C01%7C%7C4f204345128d4cb827ca08da9e4f4d06%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637996360672620588%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=r%2BzTHlte226t9fXktNC9k4NO%2FE2RomRIxuWBuRshIw0%3D&amp;reserved=0
> > +
> > +title: NewVision NV3051D based LCD panel
> > +
> > +description: |
> > +  The NewVision NV3051D is a driver chip used to drive DSI panels. For now,
> > +  this driver only supports the 640x480 panels found in the Anbernic RG353
> > +  based devices.
> > +
> > +maintainers:
> > +  - Chris Morgan <macromorgan@hotmail.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - anbernic,rg353p-panel
> > +          - anbernic,rg353v-panel
> 
> Is 'panel' redundant? IOW, could 'rg353v' identify something else other 
> than the panel?

It is not redundant, the device itself is identified as "anbernic,rg353v".
I don't have a part number for the LCD panel itself, only the controller IC.

Thank you.

> 
> Rob
