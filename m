Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDEE4D47B0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 14:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5387010E82A;
	Thu, 10 Mar 2022 13:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80110.outbound.protection.outlook.com [40.107.8.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2142A10E82A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 13:06:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCI41G+WDZNI0ZlXVZnvII5H/ef7B6q+kSYt6UTMr3a8etPpu+yN+7D/NpZeksltik6JLgx1vaBlbumbUbASSxTPpDQs+vXpz9+Z/TQrxBqyykxzotG2T725gw4/K0ZEHW4Ty+S0noKk2/uM+8QkpGQhcDructjxekhGp25pCRvCyKDBr1NdFkCA803HfAEk0NiTYHFOZGSICHDvw+G/PNhkNYiSphAMGriwvCnMhWuYuanp2yrC9yZLmMz4a9hHEXLVXNCaejSiMLEg34k9WmRdGyn7ULpnARniZb7j71hmR3uvw/XrwVkUe9AxM9iaxpEJaQJdGHf5QrG62jqmyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwxJ4Sso0O5YQOFYiwvJ/FE2UtkbVtYImgeGO/5PsbI=;
 b=mDlVm3SbXvDGd3fNHFaeF7nakRDfiTAyZnbPKrJGKrQwo6W6OPeTKS9B+ZiN1CFkcirtiT5GBUpz2Tzo6yn3Pa/gs8JgT7M3q+spp3P9tm1qI3f2Z5DW1IN6pRb9zdgB3vmknphbSaNKxogQznbjBOEcSD75y6lAU/lSJx4j1PzLamAXjbZEPPNH1YVnOaoniK3icCSQYKWwyOiJI2H67XUvyBRG1r7ARfj3ZCx4RJKQxjWsXxKz/TA+0oeWfilfr7sr+TxtLEYUjUUcNoR6ZbEGAcTywU5U3CD4hY/RL45xMM27Ia0Q+UH75QqXKrUrFgIUA1R0cz+UvPgMSjq1Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwxJ4Sso0O5YQOFYiwvJ/FE2UtkbVtYImgeGO/5PsbI=;
 b=YolDbapUbadG1YEfWAarC/6eMyXZCf0KjH/abC5FqDjANwkrSbvQ6WnD7HQ88OgdPW4dhiqao5zkSsRHf+dTS21aZhWriSwAPXLFl0r82fXHAwFwnJPtKakx1G56A51czBLYIB+yMrBnBBxoZHoBaJ1BuQpD3+6J595Oo3CfdV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM6PR10MB2279.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Thu, 10 Mar
 2022 13:06:09 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d5ba:3ed1:1acd:b5b7]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d5ba:3ed1:1acd:b5b7%3]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 13:06:08 +0000
Message-ID: <96c8fefe-0e9d-4538-eb51-9d189d61dd0c@kontron.de>
Date: Thu, 10 Mar 2022 14:06:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v6 0/6] drm: exynos: dsi: Convert drm bridge
Content-Language: en-US
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20220303163654.3381470-1-jagan@amarulasolutions.com>
 <c13b6b1e-04b2-b013-7cdd-dbf960808ea5@kontron.de>
 <CAMty3ZDwp=H2qasdPxLXNo6XcmbYGcMyf3+KeOus6NDrdth9_Q@mail.gmail.com>
 <ee363ef4-57c3-3c25-bfc1-79a13198872f@kontron.de>
In-Reply-To: <ee363ef4-57c3-3c25-bfc1-79a13198872f@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR05CA0095.eurprd05.prod.outlook.com
 (2603:10a6:208:136::35) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be103174-7eba-48f8-fa49-08da0296be5d
X-MS-TrafficTypeDiagnostic: AM6PR10MB2279:EE_
X-Microsoft-Antispam-PRVS: <AM6PR10MB22793EB30791A3C48FC54A60E90B9@AM6PR10MB2279.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nygmQA7CHVzGsCbsRf4Tb9zA++YsWHNXqjMRaj5yu/rYbh4+8j7CWEyWpIIziFa7aWckXLC9ThLkI2NpOdxB2zI6OoG52G8gWIqG4z+8lzO/xo80IwqbkLaQQm4Y5i3JXbB/lAS+QbOb950VOLweAUaJGCfy9S+59i9p0vHcuL3PO1A6bkjSDvBcv5E1LVMRxHojFbzS7ppMwYobxp7AAUQKECO2lJWCS2f5DLv+3zTSKJibxLgPdBla7bGeJ4jqZOf05XIDUCVcL6awW1iZc+3w26d82ZzngzlnrfYM7nSTWtyZ6fm+JbUoHqik18yJrCcGQo3909UCZnFr+OYFWqLSOqWAJEM8vKEw1dYJHz1BPyS0quBXzWNGWz7hQGWenUnlBUrA2HCTeLXAJe3n0e5IYg0nM2kg9wxlwSr1hXi+KzEJQvo3s+0hKZOq9KAGdnvKI2yKOU/WYX9g4d7NIKsdtU1SZw7wkUrfbuNUvHdHNi2frdo1V3fQlSowjsKpIQMnypN3JWLk95lL0ZVoBqFLCBbysLMT3XEiX1znbzNZ9EBkLojfhHflbXNRQd4upqkSr5uceCwc8EDpRwEvuSM6IQQkBQyTvFp0HfPA3ARakVXvc9sSMUMzLc6oDSqY0EyosrEx/NLEf2BKu9au9nZvvPM1+oqccGjpeGPqNsDK4VJoQzm2pdopYJlfRUT65MR3k9NafsUKxPudOjwgZhiRpb0NC4y0N41zVu/3oD1cdK1DsQK0pJn8yRldrTHkv6X8magQk4VfhRreEKb9G2WsIjNfp42klWYUmDpwtKh4SnrUjhBk5cwYXcPiYBDFU/u9un8/en2qu39YJVSoWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(6506007)(31686004)(36756003)(53546011)(6512007)(44832011)(2616005)(2906002)(186003)(8936002)(38100700002)(45080400002)(7416002)(66946007)(966005)(26005)(31696002)(508600001)(86362001)(4326008)(6486002)(66476007)(66556008)(316002)(6916009)(8676002)(54906003)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjQ2UFN1Y0hXN2ROdHZJMGtReVJNYU83clJoK0RhM0ptRUJsMmpTTmM1TXE0?=
 =?utf-8?B?dE51TG52MnNJeXF6Q1dqcVRYQ25tWWpHRHlvOWJEa0pkTkdXRjhXd3dkaTVs?=
 =?utf-8?B?Uis1TlJCNjJxanBvNmQ4YnFaZzRtbUxFbGlZOGlHRHVHTXRYWTZ0VzU1dnRO?=
 =?utf-8?B?eHdnTDY5QTZIVk1rWllnMkl3d1dkcDYxcVdqWUI3YUlIQmJtNkJrbmNDSnN3?=
 =?utf-8?B?NnEyTzNjVjI4NXRHdnQvN05WV0ZyTVkrVEZONTR6dUJRczVZSCtQaW95dldv?=
 =?utf-8?B?TmYrYVhrSUJsdU5zYXo3RkVRSFJuS3RmS215Z0gybTB2MEdzdTNxV0dsUytV?=
 =?utf-8?B?Z1UrRi8xZWlvZWxNeDJoL1ArTGtrK0w2Sk85T29keFcvMkFKODM4RjlQajND?=
 =?utf-8?B?WHRWN3VNZ3B0RWIwRTMzMmZYWnRldm5ISkYyak0relpTVnJ6YmxxdW9xNGR5?=
 =?utf-8?B?RFQ5WTdjNlBHVllhejZMZFROYlNTbW9HcFVkQ3hSdDMwaEs2RWVaMVFsQURM?=
 =?utf-8?B?dWlpRitVUGN5N0NiSjI2M01vdXAyQXFCZEs4RlpoTDRNOXhOanc0cEhVbUEy?=
 =?utf-8?B?d0tuenU5eW90d2paaW1nQ0tqVUhrZ1ZCdzhzRnJWMm51ck5WM1U5OS9mdnN2?=
 =?utf-8?B?Uno2NERpQkllM2xIc2FVU0NlL3VicnYzVDNsYUdXMEh5WFBFV09VV0dwbE1v?=
 =?utf-8?B?U0dBUUNhdmRHdHZRSDZldXJoNk9SbnU0V3RRVlQyYklxWnhQbVFORkxzdktB?=
 =?utf-8?B?cUhPU1A5VWVOUnZSSjcvUkRiSWtxWUJnV24vSjZFRUF3ZlZDUXgya1VZUTY5?=
 =?utf-8?B?VTBnS1dTMG0rS0h2TFBsTVVhR3N1UEdKcXZORUd4Yi9jNTlGZ1BzM0pyODBP?=
 =?utf-8?B?SFViRWpEc1FYUUptVm1aRXFOUERWamJSWEdoWFYxSjlGYkdCYjc5OU9yOE9v?=
 =?utf-8?B?S0hqZUNDSjhaeWhtWFJGb1VWRDd3cmtKQkEweGxrVTBpQUlmQWp1YVVLUnR1?=
 =?utf-8?B?aUhJSERDTUdzUXNUMUhpTlQ5K1RnUEhGcFJBL0VzTUUyYldmU0RwZ1R2QXcz?=
 =?utf-8?B?cGQ0SVRoc00yNUdMK3lTQi9Zci9qNDdhWUxqUGhybExDendHQlFESFFFd2FO?=
 =?utf-8?B?NE5kZUFVa1J0ais3amxPOXp5cERSb1NhYmNIWTZVMSticHdDVThxNHJtNFFH?=
 =?utf-8?B?UVZLRDFDNDBMdTdqQlVuTUNORTJtYkxibzlPRndIVjYrV1hHOE81Z2pRVWZF?=
 =?utf-8?B?T2pXTzBoWDBqc1poTm5LYzE2dEIyRzVVWXUxOEN2TE5LOFJ6NG9UdC9XMm1G?=
 =?utf-8?B?NUF1QjBYcjFiUFlNTy9CQWMxZEo0VzlSOHdyMUdmNHNSeWhDYzdic3lxMlF4?=
 =?utf-8?B?NVVFZmd3V2RYWFVHWmJ1NDQyb1YzamcvcjVkVnE2anl6L255Zmh0RTljVFBu?=
 =?utf-8?B?YlcxMnNxSjhuSjZSeUIvOUVTN0lac1JqRGQyYmxEYml3Z2hrRW9tOWNlczlF?=
 =?utf-8?B?TGxDTGx1VzVsd3NjQk5ldjV0d2tXMXdoS2JhQWNId3ZXTXE5RkwrclZtUEFv?=
 =?utf-8?B?b08rN3p2ZzdqRFFCc1F1SVlZd01XaFQzQ2xTaFVKTEVzZFZjbGxpS1grRTdK?=
 =?utf-8?B?MnBRNUxQdmtVK25DMUhHZ29HeitKT0FaU1l2Q1gyeWtteG56NG9yRW9mWUgy?=
 =?utf-8?B?NmJJMEJDdzF3KzBxRzkvWW9RVVJ2Y1B1cFBsbFhKU0RxQ2tETFlrRk15Z2lv?=
 =?utf-8?B?YTl3cEFoQTlLZHlrWk85NDFQNE1Va1lwZHRISzFDd0Nic3hDVXYycnhscWt4?=
 =?utf-8?B?STBBV3lLcndqOTJFeS96YkN3LzJUZjJrNEF3aHF4N0QzaUVldWZNVjlGWWo2?=
 =?utf-8?B?M1JRREQrR0k4TkxJYVp6dUhWaGpDTFJVdm1TOGFlMHQ0Q0ZVNVhzeEFTRFRX?=
 =?utf-8?B?cTFRbkE2ZzZuSFczdy9Ba2xPUnI0L29FTXZhNVJYTXhCOTBDWVU0SkJGaEJk?=
 =?utf-8?B?T1l3N2pIVXowdFQrd3E0aVUwTEcvSDNkYXQ1cm5TWG9VMndlUkJDamFPRHFV?=
 =?utf-8?B?R21YV0d6eGgxb1ZEUUhsblBGbllxZG4yU3ozNGZqNlM4QU85SmZKRXhINHBn?=
 =?utf-8?B?OU5jN1QvR0pCUWRJbU96dlg5YlhpaXVBTG9EMlFTdXc1RlNMVDFWYSt2T2VH?=
 =?utf-8?B?OCtzdVpGdVdHUTV2bFdSY3hJZi81MGphemJ3ZUtYWDZuQTRPdWs5TGVhTGVL?=
 =?utf-8?B?V0U1VWJiOUF4NTRyNStnUVhTSkhnPT0=?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: be103174-7eba-48f8-fa49-08da0296be5d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 13:06:08.9463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /P4USJ1kwxRiBXT2qCyqtprSFqiEGmk7Acm94XF5it7JI9RBsdgohDt6L1z3HAb1IP3lIdf5x/vjPjdfHrkxiz4Lz0uwrsXcdXKc+1LIU5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2279
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.03.22 um 14:03 schrieb Frieder Schrempf:
> Hi Jagan,
> 
> Am 09.03.22 um 15:01 schrieb Jagan Teki:
>> Hi Frieder,
>>
>> On Wed, Mar 9, 2022 at 6:54 PM Frieder Schrempf
>> <frieder.schrempf@kontron.de> wrote:
>>>
>>> Hi Jagan,
>>>
>>> Am 03.03.22 um 17:36 schrieb Jagan Teki:
>>>> Updated series about drm bridge conversion of exynos dsi.
>>>>
>>>> Previous version can be accessible, here [1].
>>>>
>>>> Patch 1: tc358764 panel_bridge API
>>>>
>>>> Patch 2: connector reset
>>>>
>>>> Patch 3: bridge attach in MIC
>>>>
>>>> Patch 4: panel_bridge API
>>>>
>>>> Patch 5: bridge conversion
>>>>
>>>> Patch 6: atomic functions
>>>>
>>>> [1] https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fcover%2F1839&amp;data=04%7C01%7Cfrieder.schrempf%40kontron.de%7Cc99f637dd67444dfc38208da01d55963%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637824313083236643%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=qF5bVwelZ35cQQygW3PvPUZkQlyFalUDsyDVjDnngiU%3D&amp;reserved=0
>>>>
>>>> Any inputs?
>>>
>>> Thanks for your efforts. I didn't follow the whole history, but I'm
>>> looking forward and hope to see upstream support for the i.MX8MM DSIM in
>>> the not too distant future.
>>>
>>> Can you give me a short update about the state of this patchset? Are
>>> there still any major obstacles?
>>>
>>> I can't help with testing on Exynos, but if you have the matching
>>> follow-up patches for i.MX8MM support somewhere around I could do some
>>> tests with those on i.MX8MM.
>>
>> Unfortunately, it is getting slow due to existing exynos dsi drivers.
>> Idea is to push exynos and then move the bridge as per Mailing-list
>> discussion. I have initial series to support i.MX8MM on linux-next [1]
>> which is working on my setup. However I'm waiting for this series to
>> move further to send those on the mailing list. Indeed I'm solely
>> relaying on Marek testing to move further as I too don't have Exynos
>> hardware to validate.
> 
> Thanks for the status update. Let's hope Marek or others with access to
> the hardware can provide further testing.
> 
> And thanks for providing the git tree for i.MX8MM. I will try to do some
> tests on our hardware.

Sorry, forgot to say that if you could cc me on future iterations of
this patchset and the upcoming i.MX8MM patches, that would be great, thanks!
