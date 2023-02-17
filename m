Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9A869A78E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 09:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9841710EF11;
	Fri, 17 Feb 2023 08:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2097.outbound.protection.outlook.com [40.107.8.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFDD10EF11
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 08:55:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llmvD1mXTHjclzgXIZE3Z/ZJ/hWAlk5S1hnynHcUQNTFCqUn7z40Hq4qObxzNwG0ZGm20DszmI9JLl3A4xjMWkNQfSJ0OozVQtMOZsKhUCmPyxqfpqK8EVuTXUv53TYW0/ylYnGSN/sSyOFnxdIZoH+JkltqvNVk/UJaqWMyqBpjwdaezfbGOLiuUpzbTGTt5ZPotbZlCLshiOb0eQMfBXR3k0e/ziY/loG9gI4dgr5G50PC/0HyqZOTc6aYVQUQFWxkc959vUa+ruiAxm4s/E9Vy5vJFAorfVYOIjZBXpXxlAjK96pQS5hu5fWH93ygVfQIMo5y6zlzkq2nB9NkJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mopu1H85eEVpv9GFJj74EWhLfIGfkDGXsLDrYv8Aczw=;
 b=ksiKqr3wDfD0eCbs9I7so9EKYpwDkkVeIXPLzpPOHS4p1hR7ybrFt9RR1YP/v0Ss00FCB3hs3ETKGb4Ko1DZFKsk3dIGBEePMBj0vgcvGu7nuRVwQjhNnqFA9o8WSclufog+eGZYVyrlEhTpRPhspgm8h3fXjpjwv657UDeW/2AVQEQf4z3h7FJSc3cgs3bkncb/GY1+ZLcERNnexsogn4MJ2QFJXwwZqzvx/gYy8stoTxDf1V9O2HPJSGFrgoXJZksjb60wBuiP0xO2KeLe4dWijNfsBlBbSWTxdyzP+rt9z+YLmiU+fLMOiTKj/+jhKp1h5A55SaR1Pf2366gdmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mopu1H85eEVpv9GFJj74EWhLfIGfkDGXsLDrYv8Aczw=;
 b=ACWH2F91HZuEkji0g/1E0SxX8WZgu+9maSnA/0erezcuO6nv+al0b2S3PT7LO04M61hJbo4N2dzMpH/aCXEl20CXGjYnu6Q6B79+iapwJ6g3oIHMj5b5s72DlJUyDthWTm+2+ynI0fNzArsPRIscRsAP+VFqpV6Gc2kUXpBABH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by DU0PR10MB6953.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:414::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 08:55:26 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d067:93ef:f184:668a]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d067:93ef:f184:668a%5]) with mapi id 15.20.6086.026; Fri, 17 Feb 2023
 08:55:26 +0000
Message-ID: <25ae1824-4f00-4337-4512-0d8190981fb6@prevas.dk>
Date: Fri, 17 Feb 2023 09:55:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US, da
To: Fabio Estevam <festevam@gmail.com>
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
 <12d5568f-c12c-970d-0f78-17d6dc7c0c1d@denx.de>
 <6ceb6866-f8a5-072f-3d86-895024fcec79@prevas.dk>
 <CAOMZO5C1oau7+YAbadD=8ERiNSLi_Z1k3VC9HVmT8aVpQF5hiQ@mail.gmail.com>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <CAOMZO5C1oau7+YAbadD=8ERiNSLi_Z1k3VC9HVmT8aVpQF5hiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0025.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::16) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB5266:EE_|DU0PR10MB6953:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a4ae21b-4d7e-4bfb-e049-08db10c4b646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dbhNWMqrVbMa0Mj8JqgobMjP4v8NsZJ4UzmJwVzL7CH6j2x6fsPpRqQZTtZU+BBQTzjQFr552Pjfo6ItZqaPQJbzJxfaE1iNgpPWoZoueRD6e1N0auLsYrc9NTyEg2b8eStpfrNf3ojPkNq1v+pDC5lWaRayhIgL4OI3fkaykopL4vROI2+9b8s8/unQ7d5fgYL3UpSnqMGtMHXKFPqpqNIS64iCeeZU4MisWe0OdydGZ1YE5pPDIS2xa+vzDsnSIUaTcULPfh6mnHo7T0A+z9/MmxG6DRueP3Db7ohDM6XiGdc/ZuUHCnehVtPetPGctlzzIuRzKuDxUQyRpXaiAu/zPk4WFrghn23qApOBPurhlXR2aPhUrp1xjrJYm+ejnJGv0uF455pQ8RheClI+CVlh5PPfC6pRCyBY2olxspaz6+N758n1knfYDZM8xamPlDPYgi5c54LFEq9/kajxEcKAH6OTzAZFXy4CJPN8WSVzeUL4+PkxBG4PHj7RQJDj8PD9EEzGscnLWD/tt7Mdb3MCSZHeZ6sa40aRavN+yniYhq7lFlryFOjLWIr5NVlwgmtgWCgYQW4E/6VsuNTSr8Yucd+V7rZVHUGJRqIiGwmsGIB6DsxAJiKmW2H35lMvK0pHvmLPXSPqcsqvpmmj5YTTYgcck+rUSUbMy6BtP8PqFsGAin+jciwFepifTiFMrb3/uegoUP2YfEgSBt2PTgQ8PDwmjn+zjBcaZn24+w5GUAoQAOkkIMBaZYidLdVtOTU8ECSWd/JNRnB956iCaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(39850400004)(136003)(366004)(376002)(451199018)(44832011)(86362001)(31696002)(2906002)(38350700002)(38100700002)(31686004)(6486002)(52116002)(6506007)(6512007)(53546011)(54906003)(26005)(186003)(478600001)(36756003)(6916009)(66476007)(66556008)(66946007)(8676002)(83380400001)(4326008)(316002)(6666004)(41300700001)(2616005)(8936002)(8976002)(7416002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmNhWmNJV2F3bjNMVDdLWVdtVkcwSFdJTDFZSXBmL1NPS3I2c0QyOUlzKzhG?=
 =?utf-8?B?RDhscDI2VXE5N3V1enB2MTFKYWI5bjVQby9UM3ljYlY2d3M2azhsMjZZd0p0?=
 =?utf-8?B?endSSkpjbWdVWTRNWTZTVlpGRHIrakZqSmdpc2d3UHdjRXF1UmpUUmtZYVQ1?=
 =?utf-8?B?V1hKV2NueTJLaWYwK1JSVHp1R29saVFvbWo1YzZHd1RCbjkyMW9LMElSNGg5?=
 =?utf-8?B?OVhEcnJKenVpOEdYWTdWZHJqQ2tjbnhCR1Nra1orc0ViMGVLYU9uMTY1Rld6?=
 =?utf-8?B?M2hNN3BlbWdKenZoY1R4WkpCdFNEbHVNV1dmNzZTNDBUNjVVbDBaanhOa1Bi?=
 =?utf-8?B?S0ZxYXdudGlsOE9qQ1VXSTBvM0k2WkJiNXBnL2F1QUZVSDY4TERPWWpDQzRt?=
 =?utf-8?B?U25Td2l3V1dYaDVvT05vRzFtN2lYUzdmT1N3UitxQkJVckVSY0Q2dEJ6TnFv?=
 =?utf-8?B?RFM5MzVoVjRLTVowMlVSMVFlYit4MzdyWnVSZUFmRlUzOSttak50OUVQRkRO?=
 =?utf-8?B?eEl1V25TdmwwWEpWTzRXSCtIczVmakdkcUQxWi8rUU1ScWRodE0zQjhwd2Zi?=
 =?utf-8?B?T0p2UCtsTkJwYkVXOVFhZk1GVVhod01ScXpXMUsxUTBLOTFGUXc0ZHBtU1d6?=
 =?utf-8?B?TXdNQ1YwV0ZzUHBDRHNIUGN3cUxhc3EwRE5ZZGl5ZGdjNnl0UmhMRkNyM0gr?=
 =?utf-8?B?R2hxZGNTOEs0VkVFTnZqcGtQb1dqSWNkS2lhMHFFZ3lteHhvRDNDcDZnTVJX?=
 =?utf-8?B?djdMNlZDbFZyTXJwZzJQcnJ4akp0ZUpEYk9pMWdsS2IrMFMyVyt6ZUVramls?=
 =?utf-8?B?a3lvRWg0QTdMSjVKZ01NZjRWaFVtSUNUb1dLQzRKOTIxdGNrOTdLSXljQW9i?=
 =?utf-8?B?OVlVN1Y1TnlieHFjaSsrVmlDS2pSNUw3aWFyaHhOUEJJcVlaL0xQdG4yUkhI?=
 =?utf-8?B?WnhpUmd6MHFtUFZucUN3QWlEKzI1SGVIdmMxWTlZWFptOVJlbzFWM0NLOW5I?=
 =?utf-8?B?Sy9UUkNqd09wRTdSRk42QUQ5RzlPTzVndk85UFRvaDFuUUV1UjUvdDk1Rjd2?=
 =?utf-8?B?bjJSeUg3YzFNZGtsSTQ5NXRmc1lUM3hpSm1DU0dkSk9hbVcwV3E0V2V4OWV4?=
 =?utf-8?B?MHY3S1lJcUJtTTJ6bUk4VSt4VUdPSGFDNjBIRWNoTGt3bmZKNENvTE9ZR3dL?=
 =?utf-8?B?dHFpTU9tVDdHWXVZSWlaMFlCTlJSWnJYenNPejFRVkE5ektwaFdPYWFNYjRY?=
 =?utf-8?B?RzZEcDlWdmg4SWdncnhpaktSaU0vOXdRNjdrSzhaU21Md25EbVNQN2xkQWp1?=
 =?utf-8?B?K0dqZHY4eUFVQ0VxNDRnTE9KUzVjRUppaXhyR2hhbCtRSWY3Yjk0djgrclhw?=
 =?utf-8?B?YW1OWmpaWG0vQmdOaDBBWjhIaFZpNnZCTC8wYy82Q1dnMEFYNnl1cmpqN3Y5?=
 =?utf-8?B?SmRVcDJrc1Q4bTgrT2pDSjN4ZE44SXlmS1ltUDdhaThuNWMzeVdNVDNzUDJF?=
 =?utf-8?B?QlZZT0txd0Z2VFlqUGVsdHBEMnZXK21WZzZML0dMWG85WFFiVFgvNWd5dWF4?=
 =?utf-8?B?ZXI0VWxibzg1YVRQcm1kSXZvRWhJS2R0MkUrMk1Idlc0T1Rmbk5WL29ENmdP?=
 =?utf-8?B?T3JXY1A2SDBzT2lid3liRytBakE1ZUMyWnIzVDF4TTNadTB2VitYUzI1Q0sv?=
 =?utf-8?B?dTFWVkNhUDcxSXpCU2pzdm14OFpjVTJuM2dJZ0RoUkYxQU5QZ2xML21jTWNE?=
 =?utf-8?B?TEF2WmRrY2JJWjVXVEdTMU9qeXlnbVo4akhWNkJkQkNKN3FYY2dZbDlUbWMx?=
 =?utf-8?B?NG5JNldLRGNQUExnOUtlaHJmRmFySm1uVDY2cXRPdzRWM3Foc2NQK1dSbTJv?=
 =?utf-8?B?KzhHYXVKRWtZTFlTT1Z3enVsTlovZUYxSnVxazZpQmkweC82Rmxma05oOWVs?=
 =?utf-8?B?empwVXFsVURiV1U2WFVSWldkb2FFZE03c3d3SjJSS0tZamRDN2VBWEtxRkVW?=
 =?utf-8?B?Q0F4N2owdkplNkduNnVRMW13WGcrcGQ1TXJmNzdTcjhIT2ZkTUo0d1Vpb2I4?=
 =?utf-8?B?QmFoY1U4MG5rUW1qWGozMWIwT3NGcDRPcXVEMmU2YnhCbHpjWGZhU3hhWTFx?=
 =?utf-8?B?ZTZmSnlpcXd1Y0NVaVArckFwVWNuYVg5WjJUYWswanliQk1oWWU0TUtnQXVm?=
 =?utf-8?B?cXc9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4ae21b-4d7e-4bfb-e049-08db10c4b646
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 08:55:26.3133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4FZH207YOR4yQMBXjyad7xM/gwqqvpwfbaY367rE549WGRm29J8hYTyNY7isF0it5hzze2Dl/iQy6vXJzd533+8sbaRbLsoTjD8Q55Lr78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6953
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 matteo.lisi@engicam.com, aford173@gmail.com, dri-devel@lists.freedesktop.org,
 sw0312.kim@samsung.com, linux-imx@nxp.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, kyungmin.park@samsung.com,
 Jagan Teki <jagan@amarulasolutions.com>, andrzej.hajda@intel.com,
 m.szyprowski@samsung.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/02/2023 12.09, Fabio Estevam wrote:
> Hi Rasmus,
> 
> On Tue, Feb 14, 2023 at 7:55 AM Rasmus Villemoes
> <rasmus.villemoes@prevas.dk> wrote:
> 
>> Well, the data sheet for the dsi86 says up to 750MHz DSI HS clock, and
>> if the value specified in samsung,burst-clock-frequency is twice the DSI
>> HS clk, I suppose I should be good up to 1.5GHz? I have tried many
>> different values, but I never seem to get anything through; I think I'm
>> missing some piece.
>>
>> So now I've tried to use these patches on the imx8mp-evk with the
>> mipi->hdmi accessory from NXP, just to see if I can ever get any
>> graphics through the mipi interface. And there the story is the same:
>> the adv7535 bridge gets probed, and can read out the edid from the
>> monitor over hdmi. And while the mipi block and the bridge seem to
>> attach to each other, I still don't get any output.
>>
>> Do any of you happen to have this working on the imx8mp-evk, and if so,
>> can you share the .dts updates you've done and how exactly you test the
>> graphics?
> 
> I don't have access to an imx8mp-evk, but I tested the ADV7535 MIPI to
> HDMI daughter card on an imx8mm-evk.
> 
> Some extra ADV7535 patches were needed. Please check patches 0020-0023
> and see if they help.

Thanks, but they don't seem to make a difference.

I've started trying to simply compare registers between the NXP 5.15
kernel and the imx8mm-dsi-v12 branch with Marek's patch on top. Already
in MEDIA_BLK_CTRL, 0x32ec0000, there's something interesting:

 ## Media Mix Clock Enable Register
-CLK_EN                 0004    0080e133
+CLK_EN                 0004    00800133
 ## MIPI PHY Control Register
-MIPI_RESET_DIV         0008    40030000
+MIPI_RESET_DIV         0008    00020000

So with the NXP kernel, there are three bits set in CLK_EN which are not
set with the "mainline", but those bits are marked reserved in the RM,
so I have no idea if they are just some RO bits that get set due to some
other munging. Then there's the MIPI_RESET_DIV register where bits 16
and 30 do not get set. Of course, there are lots of other differences,
but perhaps this gives somebody an idea.

Thanks,
Rasmu
