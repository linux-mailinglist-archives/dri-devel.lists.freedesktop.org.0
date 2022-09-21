Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 466FB5C000E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 16:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D66210E0D0;
	Wed, 21 Sep 2022 14:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn2010.outbound.protection.outlook.com [40.92.20.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D7210E0D0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 14:38:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qp6iOX5Qc3hWNdXdzVbS/3l2K8gIgSlSRCF/hahZ+9q5jDsuPdIYW+lWpsYDEBwR9JpLyE4TsSdBiC6KnFG/fQDZoh1Qr2ZVVPS7d9jfumT4krLX/0N+2JgjOeK1Lr+2tK9sxut3fgdmzQXEIdxhMSpB3gnGkhPPmorUh6IT05aEDgiydFp03XRteR15CpxSdKAzh2ChD5lQEalsW8XORwHK84M95TD/gDSgPMpF+e89AQICMSOQtAhOw4lp7tqKXaB/TuUPrve8RyZPIpNjmzHAS2gUDiskNr0ec0jthA7gchxuDNJ+yBaXOTxt1zslrBdeofoyfd/hhFQzZahgqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVnRL1lBeRXrDWaoccfx1r2gvZlGjpPca4E5Vfwef5Q=;
 b=cpZhOIvL8Fkeil4IETT9RUNc3ekIWztgahFTL+yYDIBMDS6wwI1olGly0UfhSdL61Ruv5T1eDTEFFmgrJCXW3ITXG/ZyH6zY+dwjFiWljwsfby3wwcmXN07teDrQOVkeDAxAfliW2Sa52xrrpYnz6V6HK+gbHX34rJxar/Z3VF2UYUWVw008wB7h/AGYVDL/DJM+iLs5VPMsKaplYSSzTWY+VupDFgZCI6HTgp+ws/fZZtMlvwASg+L+xccByXOLv9GJx1Po3xTHurdIMDlGd1YqK8sHXn7XzOmEaACcc0Rj2h2cUMxuAtH0BZQtFHN2A9+wIdemfmVhSU3hB1/PNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVnRL1lBeRXrDWaoccfx1r2gvZlGjpPca4E5Vfwef5Q=;
 b=MWlyt5V49IQ0bY2Yfav51ApmkXApMPppmPqAocZW734mScEhFRIwWc0PtlmEGCI3h+VmvPiPGXxg8XqmogrfoR4btxrtLZCRt/2domdwzJ3XY/wtC0FIj1dirOK/u7KtZB+IwEPUywqVCscHs2GkBwW0GXCOCyBWQq6EMsaHxyhuLiZLpla9FNyGoWeEnE0hh/kT2IzSD1roGWz6SjfhuqGwCDnVUl0wqkyAW2MxI2lsRi2KDS7kOQBRWWBUnlxOeXj6mDE5LAF+ghR/oMYgK7GHteGG1a/WSrB5DwmdeZI9bG2uVjawalMctr8VKW1DuB9XRULUuemLflxm4pQ+VQ==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by CO1PR06MB7977.namprd06.prod.outlook.com (2603:10b6:303:e0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Wed, 21 Sep
 2022 14:38:33 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43%5]) with mapi id 15.20.5632.021; Wed, 21 Sep 2022
 14:38:33 +0000
Date: Wed, 21 Sep 2022 09:38:30 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH V2 2/3] dt-bindings: display: panel: Add NewVision
 NV3051D bindings
Message-ID: <SN6PR06MB534220AB227AA3BC5DB58741A54F9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220920145905.20595-1-macroalpha82@gmail.com>
 <20220920145905.20595-3-macroalpha82@gmail.com>
 <e5de0c74-3ece-56c6-6c31-042e1117c10a@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5de0c74-3ece-56c6-6c31-042e1117c10a@linaro.org>
X-TMN: [7gEn3JhLs+36TiUeTJSMZa+Zv9B/K/dR]
X-ClientProxiedBy: SN1PR12CA0095.namprd12.prod.outlook.com
 (2603:10b6:802:21::30) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220921143830.GA16595@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|CO1PR06MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: a63223af-1c69-4c2c-8f77-08da9bdef51f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DIg75ZlYqo+MKcwiqxy4kI+M+BzlN/bicE5fzSIypE0z8mq6lBSf9D2RX6sSMZNsfY7aX3SrApTd/IAxW6QN94nMvfDnvWaCnAtokLWtkb7YDiy8hqyCGwkekTW2oFXeJq9fYLAMCUSn6jzNwgHiGYzc95UcYRglUsldYcPLs6Ny1Npc/L739lbtrIujjUT0J5AZdm+kCsDWEbZVvV306PfrzE3mwLcENsfeXEbxfef50iG7bJuRJQ9cyRj6mE3ynIkntYzGHzIMtUHBRXGeUF6Lof/8vbu8zbdYRKUpOElRBuG18N5Oc4lfDbcW5w1neAbZeDpRwV2CJ3uOB1elCERxURLpNM9HYvIchHoSLBkLfrmfyb9gzA0aAuCZLopdhY51xWQKG9rnWJY6rZEK6+79Z4MpeqniVIHvYMu+jtQLU5OBuct12C6vRtT9Aom768TiNazgQoPD5v7nyw4MM0BcIfqYR175IdE3hVDWSk0LejHmDocm6mYL45xILtZbE8H/YUQVCaeUM8XJ5/8DYgtC2RSPGEzUqzOky0GRKosNhVn0DchYhUJMHpUOGcYeBLe+kUdBNEJdbT7h9s0PNi0DYOSueiBvGqkgP13PvI5BszVKgefmyUIP3bq7QPfEo8ZnmC6E1gRaWoTz5SvZGs2gxuhYRh2RpRf0yP7tmusSLuWbF3CQbFjNo8I9kZzG
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wnfVqjIeYPstz5EZWb1Yy9oYpGesWo8GeevEY3G2A59K6f/kmqyS9/brecv5?=
 =?us-ascii?Q?xpySQe7iHx3O3y54prnrQVnUbfOWUF3di7tP+6FdbslVmkpDfjNR3LwqVn76?=
 =?us-ascii?Q?oko4hrP3DAueO4B+z5vZbF375lYCVTEgv+B1L89wQBlU+IkqVR/Ipl5y8vbN?=
 =?us-ascii?Q?UIX63Nxrr7chOxeL2e6T3f4+n8fS3UYFMDXv6XhhQXgv1yBGiKEOe8csSO2p?=
 =?us-ascii?Q?QHKu+jIDcTSwJCLcBoMNeo3PiQrfEbVAF/tYccj6XfP6e2xwIJ5qpeFJ6yzR?=
 =?us-ascii?Q?nBb3aPOQdBjqtGH4Z/SAtnNRfffYSthFspK0s8f+oji7xE2Bb1+ot2lwDV/C?=
 =?us-ascii?Q?f6QqSwAJvXS5cRQqjbyEL8YPpNLPx6LaVMqewKDONR3RI4dmucLnAFcfUgfD?=
 =?us-ascii?Q?PRry73LQjggY73wJlIxlw0KvVkfwpLHX0Y7TY68PP1Ykpz3Wgl49RvQL63JS?=
 =?us-ascii?Q?20guRKs/f7/wTKNfc5nJ1hAJ+JI8W73683ml7s+wtnft5185B5Iw3B1dSg9i?=
 =?us-ascii?Q?Fjb4s4VvaY9jvMqIiyXLP678zOXIQekfpMOsTGHG4pB+CB8h3wUyT1QDu5Rp?=
 =?us-ascii?Q?evRLQB9wOWmrbPKrXBhRHPmyeCp32gWAH4vvW6wey5JIebYzQGnyDDKsp4HK?=
 =?us-ascii?Q?mHlgiq80LZHCXfMGAKAb5y/f/eo42GZmxYtDncXCALGbs2M4uKivkCrI5P0k?=
 =?us-ascii?Q?U5o6shqhDXiH+6IUnM20wwzK/NDgz2I6cVVO7iUmFCX6DHTmQ0gE1V+5C+Od?=
 =?us-ascii?Q?KVKKbzLCI+6+BZVAGMokcJ6jmsULjSsDAjBk3swoX+12PzooCd57kFA30Ore?=
 =?us-ascii?Q?BAkY11NMMszBTEvL11ZqZFvhNF2DP2N+i3HN76EwgC8Wl4tTjAGgnoW4JWuq?=
 =?us-ascii?Q?eaMdufcmDpkVthkHjaBJnE+0jCH00Gdr1pisVrGgUfvb/fYsRD5xxTmMlg5g?=
 =?us-ascii?Q?OKIh+j2PWhYqPfshdulm5TzYZxYTRm0ekpVG9o40z6Wqe5c5Ru7TJt8G1HMP?=
 =?us-ascii?Q?t0ty92JLZtF9RSK/i8hfPE0WZEURqvu1aMeXczgzAQvYlWGZ1wdUaogaFkbb?=
 =?us-ascii?Q?akuJGIAMmL9TxoNBgTldxFL3cFI7DSZUs+YNMKN7XjVtZmYzRskzOAcKdoH4?=
 =?us-ascii?Q?KMZspYjoyXMS1WNBKVQo53Id9Qtn7CsxU5UeFPeM6A4trDe0t2X8ECXojSHI?=
 =?us-ascii?Q?iz7bbXzVfZJfCLJDE5DAHK0cLmokrp3INJU7Row24iaiDTc/t0q7JFk/g70d?=
 =?us-ascii?Q?crc9NCKMM88+lojaDeAPdA5Msi1Hu9dnlG4QCN6Alg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a63223af-1c69-4c2c-8f77-08da9bdef51f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 14:38:33.0595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR06MB7977
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
 Chris Morgan <macroalpha82@gmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 21, 2022 at 08:51:34AM +0200, Krzysztof Kozlowski wrote:
> On 20/09/2022 16:59, Chris Morgan wrote:
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
> > +$id: https://nam12.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fpanel%2Fnewvision%2Cnv3051d.yaml%23&amp;data=05%7C01%7C%7C844872fdf91b413aa65a08da9b9db9e7%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637993398994635658%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=eTM2IFjR0TKPlQNYfoq3Poao8QYLSHRVaqiXtufJ7VA%3D&amp;reserved=0
> > +$schema: https://nam12.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=05%7C01%7C%7C844872fdf91b413aa65a08da9b9db9e7%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637993398994635658%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=sjb7x2Z2wKu1C8mMBW1epwuXipe8V26zxpHcCAuKLZY%3D&amp;reserved=0
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
> 
> Are these vendor prefixs documented?

Yes, they are in another patch series referenced in the cover letter.
They were added for the Anbernic devicetrees and should (I believe)
land in 6.1.

> 
> > +          - anbernic,rg353v-panel
> > +      - const: newvision,nv3051d
> 
> Blank line.
> 

Ack.

> > +  reg: true
> > +  backlight: true
> > +  port: true
> > +  reset-gpios: true
> > +  vdd-supply:
> > +    description: regulator that supplies the vdd voltage
> 
> Skip description and make it just "true". It's kind of obvious.
> 

Ack.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - backlight
> > +  - vdd-supply
> 
> Best regards,
> Krzysztof
