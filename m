Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0B269F26E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 11:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A982D10E928;
	Wed, 22 Feb 2023 10:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2131.outbound.protection.outlook.com [40.107.241.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D01510E1C1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 10:05:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWq8GnJyW7mXNaVpJ236LU1I2enXi2Rwky0A7pmsBp6jyThElfszr8huAWpgzaW47D/n3KChTIaYVNQ+rSo78dqnPSBWr7B8puLiL5TOb7OdyJ+UEN709FyxEs7ocfY50EP+moXmiO7pP6260jq33ydRCL4V3rd1fObvHFzokFbjoBKkkuh1nqOYARTOzkyRGlKZpjaSzWLvW9UW9bKnshtWRf1yLtckeN7iLmfV/28y7WXzyWxA+H+S2wyw7E2MCBDqWWza40TOPfkFh0NIJwiIqPOVBHUK6Pg/v9U232IOIrwDtlWTOc24BbsNgCPAVSqpitT99vwaDm+ZRYagSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWX1ZjdVSnlx7BuQSMKkyv16mMA9tGbo8R5D1+RXLV4=;
 b=JyhK5/2BhrWONpIaPE7rznecLwipGyqqN5QfgBbogmkCOEeISCEeBm6ZtGlI+SpHUbByuMJqMzuYVXifRw6gxJCy1wi1AbiJvFAVIqtmkfhGFPY3B9rzF2O7XdDecfBcM1zrw0Lj0xGyrUJ0ciyRo29JwRCDn3558q6xQ945d5GGHUun4fH0vdejADtcs1m2h4beoZk6bJzDBFvZuRSTXXnUD6zN0RUJcjKSjHlxABkDZc7/vd1mnfA44hj7aFL58eqfymyypt547F857LI3yOJtQenYoLy2bY9qVcBAGvn13xYLe0gGE99M9s1KzX265Fp0AW+Pl1xUWVr8H+0hVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWX1ZjdVSnlx7BuQSMKkyv16mMA9tGbo8R5D1+RXLV4=;
 b=TJcd2f1o4e+UoQ6lzZv34eL5s8W5j/oLj6khO/cojgbFCP2FqUJgXJmhhh88UUyGxangnFIzm28NIjB9Crj0J8cMwM3s1+nuUd0g/I8tsnJ25MJ4H9j+kUD8DC+7iCdAcHNQDoqLKlBE+p2qv2Hm0i9YJ3WuJpVB/5v1r7RjjJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PAWPR10MB7895.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:366::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 10:05:11 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863%4]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 10:05:11 +0000
Message-ID: <657fa528-ca01-0c6a-2c2b-bb7f4a95096d@kontron.de>
Date: Wed, 22 Feb 2023 11:05:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Marek Vasut
 <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
 <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
 <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
 <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de>
 <c21ee1e2-b92e-0fad-40bf-91cae9e57f48@prevas.dk>
 <1745c43d-06b4-933b-5dbd-50add565828e@kontron.de>
 <c9dc0b2b-8850-6227-163b-85c53c5d72ef@prevas.dk>
 <b246aae9-b719-02f9-dd0f-305b74611fab@prevas.dk>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <b246aae9-b719-02f9-dd0f-305b74611fab@prevas.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0099.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::40) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|PAWPR10MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d5229e4-c564-4121-8282-08db14bc48d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cg7y1v3P05hAYzjUOSMHoEpGaFByM5QWVOw8NySHDzZ/MNkR581+ouAZ7R+TwJCTvfUA8X7tg8ZI5hRLctZlhw4SPamv7kgCmzh4aHuX3h6QnYMATwIqbj9c35Ska6ENUr53AW673fEpGbAUv3G4Z8lev/f9jDhRJquPEJwwvT4ben+9nlP8ZKDMmL3s90wMvT/W0VChJ+SSjzkg4OXd3Bs2DkDPsQmk01YVCBKPeCQttdNUVkBxIQhrb25nayhh4alHSixHgHlYAS84BUoP3skawAJtb3DJyjWBgywJwNLD+Zcdpna/FIgYQLeICRnTTza56uhzEFN+FN2GA5PFk05vXuXrb6Q/7ERba0sRBjSLgtQQ8OYe8V4nqCkYn0VI8w6wRGDe/aaWHy7+9KFfhoQicBsXngA6OzZpLQSM+dPuHLxLBGZI1ggApAOwb3EMoMbLfR2Bbraowiiuaq/RSyY41+Xuo/g77LEAjSQqos2HvhAkmst0AOvIHowAHQffM69dX+WHyIkxIRgoW9McMzx1EKhgiwampZM6HueLOa8WlyEejG7qtawiUH9BL4bWFE8vhSapMaoVjwhl3rSSDfudZiOvj9P7fiUg4ZO46+RsI/U81kUSEcDltFftK1cGAaw4NfJeCsLxm32+BE6it0n2P36DvykWje0GoxZTCNOMRQc/UcjNlsbgD3hGSXZ1QCGbVHKZq5CczYasTVMMUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199018)(83380400001)(38100700002)(8936002)(31696002)(86362001)(36756003)(7416002)(2906002)(44832011)(5660300002)(41300700001)(186003)(53546011)(6506007)(6512007)(2616005)(316002)(4326008)(8676002)(110136005)(6486002)(966005)(66476007)(66556008)(66946007)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFBQOUpUS0NjbHg5MkYxajllT050c1dTdkU1Tlh1MHpKRjVFcVV0QWt6MFJp?=
 =?utf-8?B?MStVNVZ1M2orWkdxT0Y4UVVERzA2NXNXZHJBRS8xVlcxajVJQmMzeURYR1JY?=
 =?utf-8?B?Mm9yWHZRQUYzMFFFY2N4ZUdDcmpSLzJGZUhOYzNic2xnWlA3RW4zYTZvb0Z2?=
 =?utf-8?B?NnlaRjQvUjlNY0hwbEpCSmlzZmVIcnNFRWpVV2NTQk93dGh3QUJEdDZjVHpr?=
 =?utf-8?B?alFUaE0zd3oraG5iRVpJZDlMTUhEWVJBNGJia2hIeVV2RWhQMHBOLyt6aTVa?=
 =?utf-8?B?MDhCKzAxWXRwYmEyWEtzckZ0U2l6eU4yWnpCVXc3VlpXSml5OXIwNldpdjJ6?=
 =?utf-8?B?TDk0b080cE0reHhDVDQ0S2R5QlgzdVh1SEp0YjZKbno4M29wOHBSRHNiRlVv?=
 =?utf-8?B?Z1JxbytMZjlBNWplVFhZU2RWdDJyQXRkUDVCK05qcnBEQThXa3dudnhESVFx?=
 =?utf-8?B?T2Z6TlIwS0R2THIwSFoya0dVNlp2dm1RTEJzYTFIbDNNZEkzVWljUXpVRWVE?=
 =?utf-8?B?V1FtQjdGVHFEUlNiYUZzeXNKUWhLZTl6cWhIaDduT043S0pLUjUzbXFhRjha?=
 =?utf-8?B?M2FvRmowd0JZbDZkSlNlaXhGOWtiSkduZmxmMjZHbU1RNjlZSzQ4enFQcmNP?=
 =?utf-8?B?NDlmbjhZUW9iVXo5NEhGclZhME8xM0hMeHNScy9WaFRmTzZBQkkvWW91bjM5?=
 =?utf-8?B?RVAwTlpNY1MrcTJlNnk5dmdVZkgvU3g5MlhZVnhWMXV0V3VwUmVZQzZXVUdB?=
 =?utf-8?B?cmZISjdHWnFoODdoaGp1TXpqYVVMYWNEWWJTRXl3bnB0YjZOVmk1RkNXN0NU?=
 =?utf-8?B?ditXQitOYUVCRmlYbXdDM20rMGVNYWZkd2t4aCtMRnRoajhSL0dDckJiNjVt?=
 =?utf-8?B?YjhUaEp0a0NsTDNWSWtlYWVDQlN1ekZwcEl0cDZ0R3QzMFpzSmpzYUhnMlhE?=
 =?utf-8?B?bVRRb0ZsZzdPRTRaRWJBNzROWW1UR2tic3hoRGJ1aHVYVlRkVXJOQ1Qzbmxx?=
 =?utf-8?B?bW1mZ3IvT0xydm55YUtoZzRLS24ydDVkakdIWE5xc21sL3dTU2VhdzNjTzdR?=
 =?utf-8?B?bEMxWUhKZEIxRVFHUnZSVnNaZldPYTZjdEp1M2V6N1FINzRHUkNCZS9VdDho?=
 =?utf-8?B?Sm1oRGlicUN5Ty8vU29wRTNJdzN3VnZQbFRmd0ZHLzBmNWxIdFhlQS92TW9P?=
 =?utf-8?B?ZUs1SGFNcGJlS0tVc21NS3JXTUR4bW5IU3lKMWI2RTZnaEpsMVU1QklVbVB0?=
 =?utf-8?B?TEQ3dlVnOGkxUlFMbE9QTDdBa08vaGluSEJmTlJzbyswRXVWSng2MjBEWFFo?=
 =?utf-8?B?UDdJbTZSTjFMU2JIbmU2TWxucFFGdjFQMU84QWVHUmxLc2EwdTl5TTlFWXpY?=
 =?utf-8?B?Rjk5bFFqRzZocm5BSllhUFhQWGhoc21xZUx1eEIyR3VFT3ZoSWp1WmpwblVR?=
 =?utf-8?B?N2RoLzMyQ1F1TFY1SW9EUk5ZbGcvQVVGRzRXRnYzVzhVQklUSzFkQ0Z0OWxS?=
 =?utf-8?B?V1VYa1BWelBWQ2lneG9yNXIxR0oreURIbVpJaG02a1ZrVUswVmxrcDh6Z212?=
 =?utf-8?B?RHF5SStoVFR6VVhJR3g1WnJGdWZNd2x3aDlkRVJudU1KOHc2a0gvYnVQOW5W?=
 =?utf-8?B?ZkZvN1BxSHBVZS9mQzZTbS8wSENIZ1p5cFk4OUFSVWxUcUUvSHY3Uy9ZdmlK?=
 =?utf-8?B?SUE0MDJ6QVExdVJLSTZkQ2RrRUdTNTlOVi82RXEzL1l5RXhpVEZRZG1lTi9p?=
 =?utf-8?B?bTZWUnpha1ZQdnVtdHMyQlZXTnYzRVhxbHFmcGpOMWQ1NjkrS01kalBnWW8w?=
 =?utf-8?B?N2JRd2xMWlRQZlZHb3VQdXdzZEoxeDduVDZVaWEycHNZWjhFdUE0UHZkdU4r?=
 =?utf-8?B?M255Qm15TXRmdkUrbGtmS0Y4dU45YjBrQlVtbzRYdVA5YU9pOUdLZFVtZ211?=
 =?utf-8?B?SStvNjVLbEFTT3lRN1B5WkViaWNwYjFVblFXbWVqeVg1cUE4VExmWjU1dzA2?=
 =?utf-8?B?OVpXNmIzUzdpUUFzNVdxQ0hkbGRZKzhZYjFNUWU1a2hzWTluYmMvMWd1U2hJ?=
 =?utf-8?B?TzZDR2F0VHg1aUNxeXpzN1F6RVhsMEtOL0NEdTd6a1MyMVdZdytYUmkxTWRO?=
 =?utf-8?B?U1RCMHdlVFo5T3dyUVB2b3hjY0FSRG1pZVdteWx4V3dENldGbHFkamN5dHN5?=
 =?utf-8?Q?FHAu3jLdMgxJDGeTFti74W1Oa+8X4GrUgVfg6WIiJvD3?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5229e4-c564-4121-8282-08db14bc48d4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 10:05:11.2757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhPDnqOfxryitTTycZxrOkQxA07dUFB1YS5Dr5B3KGTDfQfqT63gtuQsYQHKk7OZLdXZj2jEdERcMd+7essoVCM9bw8KVJ8XCUGm58wYtx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7895
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
Cc: linux-samsung-soc@vger.kernel.org, matteo.lisi@engicam.com,
 linux-amarula@amarulasolutions.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 m.szyprowski@samsung.com, aford173@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.02.23 19:22, Rasmus Villemoes wrote:
> On 07/02/2023 10.09, Rasmus Villemoes wrote:
> 
>> I managed to get the whole chain lcdif -> mipi -> bridge -> dp-connector
>> to probe with these settings
>>
> [...]
>> Now hotplug-detect doesn't work with the current sn65dsi86 driver, but
>> that's a separate issue; when I boot with a monitor attached, its edid
>> is correctly read out. But I still don't get any output, and the monitor
>> says "no signal" - my naive attempt (which has worked fine in other
>> cases) was to just dd /dev/urandom to /dev/fb0, so I'm clearly missing
>> some important step.
> 
> No idea if it's important, but in the NXP kernel, there's a
> 
> 	display-subsystem {
> 		compatible = "fsl,imx-display-subsystem";
> 		ports = <&lcdif1_disp>,
> 			<&lcdif2_disp>,
> 			<&lcdif3_disp>;
> 	};
> 
> node in imx8mp.dtsi, and when commenting out that node, the graphics
> ceases to work, even if all the devices in the lcdif->mipi->bridge chain
> actually probes. However, adding a corresponding node in mainline, which
> does have a driver for that "fsl,imx-display-subsystem", makes no
> difference; with or without that, I do get a /dev/fb0 device and the
> whole chain probes, but again the monitor says no signal.

The NXP kernel is completely different. AFAIK it uses the component
helpers to bundle all subdrivers from a central driver
(display-subsystem). This is not how the mainline approach using the
bridge driver interface works. So you can't compare them.

Did you look at this extensive thread with findings from Adam?

https://lore.kernel.org/lkml/CAHCN7xJ=N1vWVTBjArskJ59fyaLzmAGWfc0E=_iGizrDNR_Udw@mail.gmail.com/

It is related to HDMI, but I guess a lot of things are valid for DP, too.

Anyway, we need to get this series merged. Otherwise we can't work on
fixing all the other issues on top.
