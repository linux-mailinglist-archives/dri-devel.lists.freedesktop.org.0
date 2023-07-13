Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA20B751A29
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 09:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003FD10E61B;
	Thu, 13 Jul 2023 07:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF9A10E5FE;
 Thu, 13 Jul 2023 00:07:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUTw+GaxXAo8m7B/4EiLWvPeyR6kNfHX+LqHUG+iO+b00q24d3uLSQMQioutIwk2jepTG8XvzFTTmRLL1uTZI1rQ0e+0yRR0kv5GOjnCCRYIKmZWZZ8n8b/k8Us6vAFFYKj64c9mRrMWikXudEHNc+aa2ZX0a3ODnhiCELeYPVDWNTjEzF/Cvp7kaTwKItgRhubTU0fz5U/I2kVk2fvXG2ePDZwzYAySeSgYHyYbDMrXXEzWoqrdwPxeWGHvH1lissVVPoKhXvO9VlI1sep6pJVNX1rKp+7EMW6qj6YApGp7lEuuvhaiKri9/QeSvUwFuNrH0jAmmXOtV869MH1jzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Z5H35+F0RctIC+ljl2z7BhYqWE5Rp24IPpYbkFwomc=;
 b=gbH852GnHE3csMzrWtRgQF9QPxLtJi8uDaojIjmx3r8W+0Ey1KWQD98QYjMfSb0mRCwHx5789Ox4uKJM6jaI74doWzmMnd/PFmDJ6vPMGTfiZGvUWjrTvE+GAdnB3Q9j8fREsEF/Wu3voozV3JHoDPDszMPAOQ/n9SlyWVLIf1DvOLVEj6Sj7k4iup0QT7f+nUeO6hO/9pUd+gsX1GDM6h64JI0YtXCYwvrwo0YLZpHYmEGIfImYDzQ75CwM4cu7BoYJdNXNT5Qi3nPWxL3CEXgzQ3msklUfFc+m3ZJoz4htvvW6ACUGUxlsX5GcmguYbFdhXqybrcK5rz5+GF7HLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z5H35+F0RctIC+ljl2z7BhYqWE5Rp24IPpYbkFwomc=;
 b=nI0CjZDiXaSvo8Be/EgRitxDIdf1OSksh20gaEk9fZlmEtivU+COKbmPteZ8GuziqBaODlRwxWSspRnPNmTGj4isIkdWdEtwaLG4vfTlsUNJh5OlhOqI66vNu0Lk1ZNr2Mj8t+AOgOmzSS8X2yaqxuMTPKHYhhnDzWijroTOBts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.22; Thu, 13 Jul 2023 00:07:17 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::e3dd:99bb:b742:2d48]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::e3dd:99bb:b742:2d48%2]) with mapi id 15.20.6565.034; Thu, 13 Jul 2023
 00:07:17 +0000
Message-ID: <83bba180-faac-e2a9-e7d3-c5fdf5df2303@amd.com>
Date: Wed, 12 Jul 2023 20:06:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to
 drm_dev
Content-Language: en-CA, en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <94eb6e4d-9384-152f-351b-ebb217411da9@amd.com>
 <20230712110253.paoyrmcbvlhpfxbf@pengutronix.de>
 <o3dc4q27ap6rajsvpfwfvs3z3afekkwbhnclvswkaietciy2kc@unjf67gz5tur>
 <20230712133803.rf26cbg5wz7wsmgl@pengutronix.de>
 <603f0b69-71d3-ad8f-4b5e-53b63a6fd521@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <603f0b69-71d3-ad8f-4b5e-53b63a6fd521@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::21) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DS0PR12MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 4992d380-7822-4818-e82c-08db83351e21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OetvGvXD4kbxnCvicm9ni93hrWSam1zxuJRcM29ALwkNkH1AFtPd7P/Fyut+wVTwNRt8kO+LhdiIUSC1nQqS+szX772rIFaiUjeRRephMzDJ3xy8rpIje9x49uMfe9F9/LjfLGoWKdfeJqcwYUureMjoenn97vO+dYMxty5PauyatVWKpap4APxXn7eypRg6Z4r7zknOnRzj29/lHavwBcALufwcs5VfL/FigAspNt75CSQuPhNMs3a08krXLPL/erzed/WZkLd+0FBPGRAp8c5vsiH52N3jc94uvGRANw+kb5Uw+28WUhzIvnpwvEa8VJCgsr3deKdhL3+f4AT3drVotCYjrDbci0NrK24snHfS3m1Tgo31MAq7mIH2elLJ/JhuClAnoygxSAIg+mYpet5v7nkLkibMmthjZRSUisxDItjg1idZmrA18aJ6v/BkjE1N8YzvGJ1bxPasqsJUs+I4kfjVsctqSXhZQXRMaJR9zJe9rGcf2iFQ+IDOhHlM56aUv6o7oe7mIuzVXImAvsy3PM1U9GPWr9Kase/6s8ozNB6wq8z8Yd3XwvsQhOBf6vk0a3KEotDh3oYEJEq+43G/I6/3LDwJlkzPH0DpqdI8I6zEDNPCZU/Kpsp4gjErmrS4H6o/dX3ChVCJ3du5ZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(66574015)(2906002)(2616005)(36756003)(41300700001)(83380400001)(53546011)(5660300002)(26005)(6506007)(186003)(7416002)(7406005)(7366002)(7276002)(44832011)(7336002)(8936002)(8676002)(31696002)(54906003)(110136005)(6486002)(66476007)(66946007)(66556008)(4326008)(6666004)(86362001)(478600001)(38100700002)(31686004)(316002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2N5THVtVkpNaWV5NUJIRG1QS1dBa0dqbXpYZnpOTmxFZ2pDVUY2U3M4anh2?=
 =?utf-8?B?SW1IOTlCN2RVbUJha2hzY01aZkFZT2UxTndiR2dKNlVjVFZINDJXLzRYN1Aw?=
 =?utf-8?B?djFxN0VGZVVyaW1xSmhTN1NpYmo3NGRLTVl1Mlo0L2V4cklISHM2bStXL1lj?=
 =?utf-8?B?bVZTd2pTaGJVcG9WN0svQ0pQVXFQKzEvaUsxTlJIblc5N2l3TFNtYlpqSmNh?=
 =?utf-8?B?Rk1aZHBZUS9oanhwOGxzV1VCMFR2MjM3UmdzRE43V3F4V3dMQVRYdy81bVQ3?=
 =?utf-8?B?bFhHb1l1eHR4d0YrQmkzdVpVeEkzVm12QjgzektVUTA3OHduVGpOMU9sTjRR?=
 =?utf-8?B?SXRCN2MzSE54R3ZXZWlsNVVYY0xKZC9neGFwNlE3Y3VEczN6TzZXQkxkNWtn?=
 =?utf-8?B?Z2djZkJkc3JIODc4UDkzbkRpZzhDSDBRZURpK0Y4Uk8xMGdocis5WHk3RTJT?=
 =?utf-8?B?RFVWQkdQQWJ4OGNoNmcrNnRWenpVc0F5aFlXclU5VWZDV0FOYUcvQURNYWpq?=
 =?utf-8?B?MnYvY1lWMEE1eUJYSEdOenMzSzBXK2hmMDdOcFcxSGpKWHZoZjNFNlJRZkFC?=
 =?utf-8?B?WWdhZFhiN0FqaWwrOWdpZE9tWXdLZ24wVkpENmViYjJMVnZVdlowQSt5ZjNs?=
 =?utf-8?B?Q3dpTCtQQnRCbXBORUFFL3d1OXZrMi9rTHVIZnIwaVVtblIydG9wOU9KWG42?=
 =?utf-8?B?aHpqZ3FTdmJqVTM5NlZ5Z1NDNUtwSENnMkFHNEdFRjREMlhoRVQxUnY1MU9N?=
 =?utf-8?B?a2E5UEFpbGd1Tm8wY1MvS1REUndERkZzSmpXdVRGeTRGbE1LSStTSDZDZS9v?=
 =?utf-8?B?SGlESDlSTm5ua01YTG5tTDF6NDY4T0ZaMFIzZHpRRWF3ZnROeHpVQjN6TGp2?=
 =?utf-8?B?bGIyMXMzeXdnSjNyM1ZsL1BVNG1tVllETDZVQkxUbDdrdkp5K3VzUEZwTXJw?=
 =?utf-8?B?Ly9yY21vcTN5T0U2OEluWkNudUdUc0NuN1hFNFcvclZMOTVtT1lIZGEyYTk3?=
 =?utf-8?B?NnIxelRjR3Z2cEdxTk1OZHFTWExuWFhMM0hucU41QmVGOHRBTGVORWJ1ZVh2?=
 =?utf-8?B?NmoyMktEQk1FSEEvRUExaHozL1dNOEdqSEFNcmdHRlNleXpUdVR2Q0VDc2Vt?=
 =?utf-8?B?Q0N4cnFaaW8vb0NVeFJBWmN5Yi9uTnY1WmI4SXVFc0oxNk9pOWlOdHBhNUNt?=
 =?utf-8?B?MFVwaFArbmNEN1lad3poLzNqMk94NnYvYnFJUDNmRW5BelcvRUgwYk92eTlo?=
 =?utf-8?B?eWQyQm1OZnZ2YmlIR2tNNU56Wklad3hQVWRGc293cXladHY1ZVFuZllaZksr?=
 =?utf-8?B?TFpWYU1PT296TU9lQ3gxZnJVaDgzbkxDZnZoV0pwMkNRQW5rTjRBcDFtbGZO?=
 =?utf-8?B?cm80NWVqSlhRQllRcjY1V2lRYXZYeTRHTEVJNHJsWkFVcGR0aHY2QU9lc3Ry?=
 =?utf-8?B?VjFHeXZHVmZNWG81U1ZCV2xzdlJKQUNzTG9uejVSR3IwTDYyZTkrdlpWVk1F?=
 =?utf-8?B?YVYrdEFrSGRLWWZBYjlHS2JsOTYzRWU0TkwzYktqZndTMlphbnNiT1FPUkd2?=
 =?utf-8?B?Y1R1TC9sSStwQXJWZ25uS0JIOWFMcjBsUzdYTDR5c281a0tKeHdzZDUycnVh?=
 =?utf-8?B?SHljYmNUVDNicEQvWTNxc2YrVkJIWkNaYXVrN3kvRmlxQ0dVRVFLNVdReVFX?=
 =?utf-8?B?QVhZMWhJQXRZRHYvOUFDKzhpNHdnQ1JPempmOFd3d1NGTzJOZytqQVNKS3Fk?=
 =?utf-8?B?NHhmUlZPYWtQeG00SWRHOCs5M3RMOUVZWlBSWEtTWGl0NFVpakdCVk1KRU5Q?=
 =?utf-8?B?TU15QzQzUy95TkdwbCtqN3Q5UktoL2Q4N2taVG0wajhFRDlUY2oyUXlOMFlP?=
 =?utf-8?B?d0JhWSsxVWZqdnpmL1F6R0xzSGRJSUlGdndBb2lseVZOOEEzWXNnZU4rRjlH?=
 =?utf-8?B?QXdkaW05Q2RLUlNiQThzeEFrS0hVM0lOc01yV1VzVE4zQlc1c0Q1ZWNiYWFJ?=
 =?utf-8?B?c05Oall2M3JLQVltRlB4MVdzU290dEdXdzdsT3JUM3RZVGFyQTRLZE42d0hD?=
 =?utf-8?B?Tm5NbThmYUJ5YjJ3Q1JuaW55cmlBd3BGZUhKcnZ1dVhseHhEU1dTc1VYbzNP?=
 =?utf-8?Q?k7m36FXVjmqGRYjPJGL1uTMxN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4992d380-7822-4818-e82c-08db83351e21
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 00:07:16.9878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKN08Ur9guvB4xSjc0iFLLgs5BPyDy2I6XIh73skvHxQqbwwf8rx4nqW3J6KPWkI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7747
X-Mailman-Approved-At: Thu, 13 Jul 2023 07:44:19 +0000
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Jerome Brunet <jbrunet@baylibre.com>, Liu Shixin <liushixin2@huawei.com>,
 linux-samsung-soc@vger.kernel.org, Drew Davenport <ddavenport@chromium.org>,
 Samuel Holland <samuel@sholland.org>, Matt Roper <matthew.d.roper@intel.com>,
 Wenjing Liu <wenjing.liu@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 spice-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 linux-sunxi@lists.linux.dev, Stylon Wang <stylon.wang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 amd-gfx@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Fei Yang <fei.yang@intel.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, David Francis <David.Francis@amd.com>,
 Aaron Liu <aaron.liu@amd.com>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 linux-rockchip@lists.infradead.org, Fangzhi Zuo <jerry.zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 Dave Airlie <airlied@redhat.com>, linux-mips@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Evan Quan <evan.quan@amd.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Sandy Huang <hjc@rock-chips.com>, Swati Sharma <swati2.sharma@intel.com>,
 linux-renesas-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, Dan Carpenter <error27@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, linux-hyperv@vger.kernel.org,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 Luca Coelho <luciano.coelho@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Likun Gao <Likun.Gao@amd.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Alan Liu <haoping.liu@amd.com>,
 Philip Yang <Philip.Yang@amd.com>, intel-gfx@lists.freedesktop.org,
 Alison Wang <alison.wang@nxp.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Roman Li <roman.li@amd.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Paul Cercueil <paul@crapouillou.net>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Marek Vasut <marex@denx.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Leo Li <sunpeng.li@amd.com>, Uma Shankar <uma.shankar@intel.com>,
 Mika Kahola <mika.kahola@intel.com>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 David Lechner <david@lechnology.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-tegra@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, John Stultz <jstultz@google.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-12 09:53, Christian König wrote:
> Am 12.07.23 um 15:38 schrieb Uwe Kleine-König:
>> Hello Maxime,
>>
>> On Wed, Jul 12, 2023 at 02:52:38PM +0200, Maxime Ripard wrote:
>>> On Wed, Jul 12, 2023 at 01:02:53PM +0200, Uwe Kleine-König wrote:
>>>>> Background is that this makes merge conflicts easier to handle and detect.
>>>> Really?
>>> FWIW, I agree with Christian here.
>>>
>>>> Each file (apart from include/drm/drm_crtc.h) is only touched once. So
>>>> unless I'm missing something you don't get less or easier conflicts by
>>>> doing it all in a single patch. But you gain the freedom to drop a
>>>> patch for one driver without having to drop the rest with it.
>>> Not really, because the last patch removed the union anyway. So you have
>>> to revert both the last patch, plus that driver one. And then you need
>>> to add a TODO to remove that union eventually.
>> Yes, with a single patch you have only one revert (but 194 files changed,
>> 1264 insertions(+), 1296 deletions(-)) instead of two (one of them: 1
>> file changed, 9 insertions(+), 1 deletion(-); the other maybe a bit
>> bigger). (And maybe you get away with just reverting the last patch.)
>>
>> With a single patch the TODO after a revert is "redo it all again (and
>> prepare for a different set of conflicts)" while with the split series
>> it's only "fix that one driver that was forgotten/borked" + reapply that
>> 10 line patch.
> 
> Yeah, but for a maintainer the size of the patches doesn't matter. 
> That's only interesting if you need to manually review the patch, which 
> you hopefully doesn't do in case of something auto-generated.
> 
> In other words if the patch is auto-generated re-applying it completely 
> is less work than fixing things up individually.
> 
>>   As the one who gets that TODO, I prefer the latter.
> 
> Yeah, but your personal preferences are not a technical relevant 
> argument to a maintainer.
> 
> At the end of the day Dave or Daniel need to decide, because they need 
> to live with it.
> 
> Regards,
> Christian.
> 
>>
>> So in sum: If your metric is "small count of reverted commits", you're
>> right. If however your metric is: Better get 95% of this series' change
>> in than maybe 0%, the split series is the way to do it.
>>
>> With me having spend ~3h on this series' changes, it's maybe
>> understandable that I did it the way I did.
>>
>> FTR: This series was created on top of v6.5-rc1. If you apply it to
>> drm-misc-next you get a (trivial) conflict in patch #2. If I consider to
>> be the responsible maintainer who applies this series, I like being able
>> to just do git am --skip then.
>>
>> FTR#2: In drm-misc-next is a new driver
>> (drivers/gpu/drm/loongson/lsdc_crtc.c) so skipping the last patch for
>> now might indeed be a good idea.
>>
>>>> So I still like the split version better, but I'm open to a more
>>>> verbose reasoning from your side.
>>> You're doing only one thing here, really: you change the name of a
>>> structure field. If it was shared between multiple maintainers, then
>>> sure, splitting that up is easier for everyone, but this will go through
>>> drm-misc, so I can't see the benefit it brings.
>> I see your argument, but I think mine weights more.

I'm with Maxime and Christian on this--a single action necessitates a single patch.
One single movement. As Maxime said "either 0 or 100."

As to the name, perhaps "drm_dev" is more descriptive than just "drm".
What is "drm"? Ah it's a "dev", as in "drm dev"... Then why not rename it
to "drm_dev"? You are renaming it from "dev" to something more descriptive
after all. "dev" --> "drm" is no better, but "dev" --> "drm_dev" is just
right.
-- 
Regards,
Luben

