Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3485C0249
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 17:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A2210E92D;
	Wed, 21 Sep 2022 15:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2036.outbound.protection.outlook.com [40.92.21.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598F210E92D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 15:51:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b57Odv0wFKFcgBigiUl2lOwi2cVxUbpIlcj1KN/5fKkcb/F2yI0ojW2f5S9ebJ2HQCwf5cZ26OI3+HdFegmqBayRynfPPvCNDMoWnPpkRPYNMVKW2XvWfmQ/cAd2ED/CAGqufNaZfkl1mUFmY24J/9DTXpwx375h0FUL4f6f8nfPusiFTYfakT0a7NIzgcI3D+9O6pGxmkas6WbgROrt5q9P9BI+xviYbsuQVaTcDJ7KqIwiv4A02551+HzJQVh69sVlxlDYxlnhQR000ohPa0cJWw+d+Cn80IK2cVvMZVCC89m1Lymg6fEB/XIFYXrJx5esUrLRSxps2F+2HhwF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8v+s1F2VZsh6JpSpAt9eqkUCFqnh6f7MZyYeo+mWXA=;
 b=fFduSip9J/LY6feXNuqiwgX2wMFQs0G4Bf+74nV1uU/tLcLET2Qfn/6Kulmu2uKU+WjqGr+z3xZDMyjfkUu7m1JecqVSu+9jYH+fZam1jMcTxIDIPuZNuQCk/ExHSHEzWWHTBKxfrV6VaINUxXjDc9ajYvCFmC6FtpcInZpyNoHCNrxbXrVcKQkrgPgId0UA4b8Er3ruABsNRIgSiK6wDgJTKrkgr9KPpPSl/ZIz+8kDUmS3tzls6tPSw3dBoKp1j7Qbvfdai2EMozKpbyWqNZTX1ZHFtfnTXvtcgiCNHYxLJkL0iM70+ImaMkDWfgS4XPv2EMLrRV66PDjeEW/2Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8v+s1F2VZsh6JpSpAt9eqkUCFqnh6f7MZyYeo+mWXA=;
 b=Z9quOhQs5GXqs8plmSLzdIp5zjLOBlRYoMxsqtrOJtsOANIRtKP52xvVTmGHa9OF4T1aHIm00u/NfYjDvspeWqTmLh7m9dlSR0w8JgqFviSDYjDaPn4OtemCegd1rR2eYU2oeVw8njM7LFqnIbfAwafQaQ/b7/0gLGn4VYR7LnhfbzGAQDwqT6DWazS0+FyKZXFkD1PEWAGhmPjy660in1G1fb/VYfzI+EQkci1BTyiQGJx0Vmjmh02bFlemisV/Z9BXMVueoDRQeDt5VJV5qzRwR9Qriyj+MZkz8PLuK0gEuIEmWB1r+oNv0iWwhmB81ZTHme5SDP1jnjNMhSfIJA==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by DM6PR06MB6281.namprd06.prod.outlook.com (2603:10b6:5:12c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 15:50:51 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43%5]) with mapi id 15.20.5632.021; Wed, 21 Sep 2022
 15:50:51 +0000
Date: Wed, 21 Sep 2022 10:50:48 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH V2 2/3] dt-bindings: display: panel: Add NewVision
 NV3051D bindings
Message-ID: <SN6PR06MB53420E8B1245EDFCB7547C69A54F9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220920145905.20595-1-macroalpha82@gmail.com>
 <20220920145905.20595-3-macroalpha82@gmail.com>
 <e5de0c74-3ece-56c6-6c31-042e1117c10a@linaro.org>
 <SN6PR06MB534220AB227AA3BC5DB58741A54F9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <ff2ee392-0f78-37d4-56b5-443e6e998443@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff2ee392-0f78-37d4-56b5-443e6e998443@linaro.org>
X-TMN: [TBP9+y4oGt8Q3Oe16g8eqkgy03YefoIt]
X-ClientProxiedBy: SA0PR11CA0123.namprd11.prod.outlook.com
 (2603:10b6:806:131::8) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220921155048.GA16627@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|DM6PR06MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: eedb488b-1334-4b35-99f5-08da9be90ee9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b6ikKiq1aQu2eIyL+rnmcd6TJY4LDx7YeaBfzRsxzmHm1c4trk1F7sbV9B/hq7wJBdDuZrnJCT9hz9rR4ch3AgjH9F4ju2pMmVKC7rHbvmc3OmjGh6F+sepJTpS0lqT9ZCcfOD5wNzEoYL/1sFCzvlrF2S6joePEOVXWePiDR+puaDLki+upvV1QQUDDT7VnVeQZxG2zAmvLQpvkRo/JLXz8KO8TuOPBA+9goi0XBcOOMqrougvpgOWI9RKvpf43oErNA67ySktDMsR75uoeaLEVmiSGDkICB2K/XyeI7sRu8HvGJtIBjo3/lvYr4d29Dhv1laxuTsF4vL77Z7oC2biOwXwOyFJCwgOXNt95yyNxVhseAn+7zP0ZIqUBxbQHUq8b0TwyMyXV8ZVupPpmJ1eT5PekZ33epyj+rxhbVVM0YGWhY9S5quYc20eGS1domHzd494glHwoazOirisvWsnQqJdsV6xB9bZ2SRBoBn7NcIn7Pm/A1j2AgGyx7F0b8OvZf5iPl5OCS93VayMH9p2GA1cn7MGx3jC5dcGuDDml6z7DWta+IAu9Wj66vjaWbWo3ppanE3PrU0YmsAKcEqV6I5MUT4sMCurOuazfTHKq460HzbI0cWt6SSxmPHRU6XusJ69JmGXbz50tZv4ihw+3VBzDGXzOwpryrOYEvrDWjuq6RmzVQA8z+LQLw3u9
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xuTXEk1+vVc6g25KLMwPo2jWmGwNnV1owwdit7MQgCiwOHTiHpVo9OUXbQ+N?=
 =?us-ascii?Q?71b7G7PobvKnaQ8PX5lRJyyVcqCV3ttN3TACh1j9ku62NfED9hA7ePnrs0XH?=
 =?us-ascii?Q?59hAyHNL4zg9qSJEII7FwpP1TyDg0SNUTxHUjlhikLUdravWn0xsW7QIynS9?=
 =?us-ascii?Q?n0yQ/MGdw2GDjpuIiER3ajmsq9/TNtdHpW1kl1YBV63LxGrfeTLsaPNgZJC5?=
 =?us-ascii?Q?GadwJoaj3pAhQ/m8TIfTVxwGpyWgHJZl1LbjCHq1xSw9uksBi9Awd8igiQdl?=
 =?us-ascii?Q?8xHUhVJmutTaKaivJJUzTjGxSVzzDqZMpwb4v/ksYKo8Lqd8B5fEWXRko+NX?=
 =?us-ascii?Q?s05mTtjXzoLl7scs/y6O8AjUQPzEowvUR7NLyl3l4yhWNBp0Ygc9RGUsBnZk?=
 =?us-ascii?Q?BsUgnS+yMtUiqt5uvDeNP+b3Sd4il4qKIkSeXPpNP2fEP/SbEDv3kINLyF1Y?=
 =?us-ascii?Q?vC1+wIoo2/j1umTncQML2VVFCUhk2H7fy11ln/dxqt7H/2B/Xw4OaYd1qZBs?=
 =?us-ascii?Q?o0yuxUD393oIdVQttyQgxzFl8sJ5Yem8rhZEs4HMV9qwQEGPMxGSgQX2rKs2?=
 =?us-ascii?Q?SgYDCmHWA52IEsX7VLB9/NphVRgeBq47s/MlblmzGeyZOIQtP2B2Xmv3Dp5U?=
 =?us-ascii?Q?/j4wBPVUB5HAkP/8QL+mlTYSqj9ixCxyV0GeH9L6houhIWxHyzhaVzGWNwnv?=
 =?us-ascii?Q?eqQrG2bKmEWF2zWJFgoNRGnozksg6gm5EpzjCBeRyg8RmP+6q2Vdn1eJRio6?=
 =?us-ascii?Q?NZ3RFKdXQ4okDVcNFrUPMGcA78bQphkzHZ+KO35lgDOu+2udwKSxkUw63QwU?=
 =?us-ascii?Q?MKX1Zu/v+N0cukip8IOBg+WI163vnygbxEEISh4VaOiZYhmk6olWPMopDUui?=
 =?us-ascii?Q?ilBO01TYg+Dxab8CAp+S+6lo/OMsJt3yJbKMDZwOFb4VWkkGVZ/l+OexFkk/?=
 =?us-ascii?Q?P75cchuqY7PqZ3GWm/RsjyHV9TdWGONqb+SSov6PzwYNycec1rkPDZs5fOrQ?=
 =?us-ascii?Q?iAf7jAGDfdXb3ksxH+GxD2mVnTX+5NcTioV1MJ6IWt4G3U32j+B3oSxPCals?=
 =?us-ascii?Q?SicJl6orBhVYdtPuTFNUsbGNyUpZ5wqPGb1RI4yEEPWde24geiPzI/8tLpfE?=
 =?us-ascii?Q?V6oL3M28PyAwV0EkRU9ndtEAUEfmcogmQLNXC4fAcPjam3r8VtgveGX3WCmw?=
 =?us-ascii?Q?oO+vgEqG8itfeMTPRaU8ygVdeAsyF0YpkCLe9sbzck5Xct0JUdWrQZnC7Fsk?=
 =?us-ascii?Q?9LkAMBKg8lpfpFPp5dUU0MgUF0cTTZSTHSbFFVpsAA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: eedb488b-1334-4b35-99f5-08da9be90ee9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 15:50:51.4346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR06MB6281
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

On Wed, Sep 21, 2022 at 05:21:19PM +0200, Krzysztof Kozlowski wrote:
> On 21/09/2022 16:38, Chris Morgan wrote:
> >>> +  compatible:
> >>> +    items:
> >>> +      - enum:
> >>> +          - anbernic,rg353p-panel
> >>
> >> Are these vendor prefixs documented?
> > 
> > Yes, they are in another patch series referenced in the cover letter.
> > They were added for the Anbernic devicetrees and should (I believe)
> > land in 6.1.
> 
> OK... you still need to test your bindings. Your patch was clearly not
> tested before sending. :(

I did: yamllint, make dt_binding_check (with DT_SCHEMA_FILES specified), and
make dtbs_check (with DT_SCHEMA_FILES specified again). That's the proper
testing flow correct? In this case it's the pre-requisite that's causing
the issue as I see on a pristine master tree I'm warned about the missing
vendor prefix for anbernic. Should I wait for that to go upstream before
I submit this again?

I'll make the other change about the space and the description of the
vdd-supply when I resubmit. Are we good with the panel compatibles? I'm
still not entirely sure the best thing to name them as I have no part
number whatsoever except the driver IC.

Thank you.

> 
> Best regards,
> Krzysztof
> 
