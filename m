Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D97E75B5CB8
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 16:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DF510E594;
	Mon, 12 Sep 2022 14:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20115.outbound.protection.outlook.com [40.107.2.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAB410E594
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 14:52:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNAstLvftvFANnfmSkell+Fio6ilX5RHQSC0yK+QyCgiyYfd4WF7fNIwQs77JT4v8ShFo/jjSGJaqtFo05rmV+T1ic/JwjjdsftVYdAEPEo91FpbevG69+iYhfYVlEBM/IxKaBXhKXaCH+s4EIpJA4ITzmPzpPkE/O+nHCAfMc26q+eEmr+clrxMgtgiqlRY/rTZWDpaKRnC5i9VkUyboDcqKstGQpO6s6+xkIm/R74vNxygbHllgU08mA/k6tR6+vzknQVnZmnFwlOREOmSoj2+eHydkJBZ1N86Z3akITZQTRJT0Fh+4u3Qnewse11R1XPRJ8jSfdBvcHSWHIXasA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVmUPYYf1gpNjiTe/tUQdgbDTCGO7FAV0l6erp0VnWA=;
 b=SVduxIfnR3EfVNeqUV3XtfXsS1vfkGoWU2AUgTdIpn6mRnDHAiu4Uh4TFAeeVfRSX5RbrlPymTUfa5Z4bohWWCkzkeC8eY8nmf8Lfhlc1pIrDfwwZ/8xTnRM5IOeK7U+QmjoFUdnknrOKyYsXf9uTxek7nbpb1scAPlYp6IWO3UNFdjF1BA8Vx+6Qza4L+HDOksf766erOgRMG693Ihh4NvVog+PsmldsITdGiiOjdRmO+SkxkK4V5MPXulnK/AFYkI/cvn4nfUSNukbw3j8f2qiCIKz0Umg8iyVoF+UlyxBKTX59/F35mgunI2uprHKeBWrPLSkf5Lrey1C7DHnEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVmUPYYf1gpNjiTe/tUQdgbDTCGO7FAV0l6erp0VnWA=;
 b=oaAY6wuu+s6lRt+QMPP0vZWLAZicbNfl2jxhJo8mZvoD/XnP55Ojvhjp1intwrbPfi0cJHt6aHoEKIGC4M3VPv+cqYYZ9JJg5UtcmLa1KmJXUrSkfSTaN+ahkoU3+y5optX3Y48UwT20hJDwlZHbZlKbCKZKQ/BjedntjZyy25s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS4PR10MB6062.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:581::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 14:52:20 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7c6a:563b:5a96:d125]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7c6a:563b:5a96:d125%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 14:52:19 +0000
Message-ID: <12e10f46-f28e-7b56-47c4-5fca27b46b31@kontron.de>
Date: Mon, 12 Sep 2022 16:52:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 02/12] drm: bridge: Add Samsung DSIM bridge driver
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
 <CGME20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180@eucas1p2.samsung.com>
 <20220829184031.1863663-3-jagan@amarulasolutions.com>
 <7511aa28-a944-d241-5bea-8404008e7dce@samsung.com>
 <d750a140-c87e-16af-7683-22d48f68305a@samsung.com>
 <CAMty3ZBVrRa9VHDpGBM_r9gdU=Ex4iwpSHjzcOdxSBrwRrHF2A@mail.gmail.com>
 <473e88ee-1866-49ca-4a43-17a378e6fe47@samsung.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <473e88ee-1866-49ca-4a43-17a378e6fe47@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0021.eurprd04.prod.outlook.com
 (2603:10a6:208:122::34) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS4PR10MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 00885874-cbcd-42ac-7949-08da94ce6478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mp0O3nLz/nRf0kytF7iChjvR33fiWrZW+dzWuaQ4PPMJC8+N4mchCWdSFQYa9CrgaZeGhcQPdwWU/H28e8mcTMfUcqFvOZ0toZGy7jCfxToCl5lWwthbMXV66RKj23ZhLx5mMZRbCh4LGNU57ZiMZZVAlwieVgkQOlNQY+36cmKAkpWn0tTVvnXEl3YmcT+H2Njgjnk8arbAmKCuCX3Z3+quO4/+45KhkTwXU/LWvCpi4CbClOc/b2NoT1sNyg7aAgY4dEiOmkgcO+b3o8ri/GaHtGdcs8QpNPJz++Ptt4bQfbM+fElxhv1o3vpcaYVRUHobOHKORjZfYs3Mv/BxefqNVD7jwYtVrW3bWSHG3rgF1vE+lvxDkO9ixzfNipqnwN0lm1W4WIBppjWpnSE9zWtwB9ncXxxZUox3Vz/J+ofUAHKarzu7U1i8XP3dByxhg7HvmQgzwNhzb/K/I+G/TUl8F5QoHfEoFN/tTKFZd+EIz2+ol76xZnLfhW4Oc5rX2TSqnHziPJscwdIo+tQ3vJsaHN0qMVr9ZkCLRlTxThzrqrDd1FeeuXDJld0JoAI5YndZpEHueFqAW9SvdDFeglMzuywn21DwJl/I1tdiDaOnbksaErUCbcm4rDIq+Ak6h45kNOnLTEWvFPj8UJikOwfqkTJytlgAU+RViRkTgKlPvSgnkvJX/l2IxGG3RuJIydUHXH12+/R/WiT3xh6Kcn6aIquxcs9QfNowI914YnDUumE4WBkWgUWYeLiHxCy6JXXaDApifQ5HrQOyztiyPhn2BjG83H/ZRYX2EVXu2Dk0asmj5kDZzWUZjC9ua0aQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(26005)(6512007)(7416002)(38100700002)(5660300002)(31696002)(66476007)(66946007)(8676002)(66556008)(4326008)(86362001)(44832011)(110136005)(54906003)(8936002)(83380400001)(53546011)(6486002)(316002)(36756003)(2616005)(45080400002)(6506007)(2906002)(31686004)(186003)(966005)(478600001)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHdwOVBSM1BTK0N1TmFna3VnbkdPTTFvdUVwUjhVbnY2M0hNMk5GWTAzYWJR?=
 =?utf-8?B?em4vcU8yR0dmZDlNc0lLblpBU2ZvcFZZWmVXTVhOZnZtUTdIc2VOeHJ6ZkRN?=
 =?utf-8?B?TzcveFZCTjNaOGNYZkk5UktWUTdlNVYwNURjV2NGUHdza3JOeSs0ZThUZlg1?=
 =?utf-8?B?djNDMnd2Z1NPd0VYQzFGYUViZUZaZDQrd040dTFkMTdlSmJIVUJTNm1CMHpa?=
 =?utf-8?B?a2Z0bnRwUU5rNDRGM3J1TEFaNnJmSmFxeDJBUU91cC9yVjFRNFBhOUJLMW5a?=
 =?utf-8?B?azkyQVY4MDhwSlVpSWpQK2pacitjOFc4cndtWGVrUWVzT3dyQ0l1blR0THZu?=
 =?utf-8?B?MHBJT0ROYlNUSE1QQ2c3QS9VN1JQdm9lUHgvTitxb01Heno5alhkQlMvWEtN?=
 =?utf-8?B?L2JEdzR6WjRuc1JmdWhDazRmd0FMblRKeno1QXlvQVYrbExVOVFta1U2K2h0?=
 =?utf-8?B?ZC83RkhVd2RhOVdOQnF2bkNHU2hZT1FudmZZdHZFNkY2TzhRYUUwcG8rTEMw?=
 =?utf-8?B?TFVFbkRMbFRpOS9PV2ZGMm1KeVdtc2VyYnJVK2diSUF2cnFmRHJwamlXdVdN?=
 =?utf-8?B?VUZRM2kxU0NEWUE4MFlDRDBnVnV3bzVxK0R4cjRjV0pINGh1RjBhZVNwbitn?=
 =?utf-8?B?OWErRXF3TUY5dThuZ29pNmFSMTdpalZCSUtxRWtPa3ROMnB1a3pCaE91MnNp?=
 =?utf-8?B?R2Y0UmFndU9SNEJpQlF5ZGl3VVdTT3hGUWpUa1VUUkVQZTQ1MXN1TkhrVjRK?=
 =?utf-8?B?RW1UanVQTFByNDhmdW9TM3dNdE80V21vSHBnb0F1dytDQlpZYndZMGxRZnBt?=
 =?utf-8?B?bE94cFNFMzIwNEZMUTRiUUIxRDlWWDZmR3FiQitXeHlnRXZ0SjAyRExsdGsz?=
 =?utf-8?B?bkV5TWd5YUdNbEg3MG40T2NSeWZpMVhibWJweUR1ei90S20wSUdxTFRORUlH?=
 =?utf-8?B?aFgxRlNCQmxrSjBtT1lZbDhNQjFBVnYzSDFBUWQ0WXB4eWwwbXRSTFU5TU5S?=
 =?utf-8?B?TThKc1dDbFNUOFdHVU5WeXVnWjU3M0xaUWd3MllOSkEybm1QQUw3VFdWLy9Z?=
 =?utf-8?B?ZVFYVUhmTE1zNEU5ZlYzTXBqSnNJWlo5dGZXSVJLS0FlQUkwYUhMaGRaUUxr?=
 =?utf-8?B?cWhXZ0VvaWpYd3dhUW5JcmVWMVVzUjZNNnNXT2tYUkRaN2FIQzdicmtFZmlj?=
 =?utf-8?B?cjN4WGc2MXFVVFMvNktpZFJOTHA5YkMrMG9IV0k1VXJoUHUwcUhvMHhTOGF4?=
 =?utf-8?B?cGJ6OW14SHc4N3pLUTJYTmFDYTNiR3dEZ0ozZ2VodCtmVmYzTk5USGdabUZ3?=
 =?utf-8?B?YXFhOTA1N3lZZzY0N0dIampzRHIvMHNpNGcydkgraGl1a2ZBRzdWaTBiNllC?=
 =?utf-8?B?UzM5bnBPTFQxZWxlVjFPYXd4bU5WM3RhcVlWSEFJT0s1UHkwYWJqblBSaGRY?=
 =?utf-8?B?SXdaQTBBa3RHZkE5UWJpanpaTjRTYzBMRi9XSnFUZTc4UHlCdk05TVExN2ha?=
 =?utf-8?B?OWgrZldjV2pxNFdoVEZKK0xqRWVaMWpsYmZmVG1qazNrVzNQaGZBUi8wSzZj?=
 =?utf-8?B?ZlZFakkxUVU2dW80WTUxQldzWG93ZmhTNjBlSE5IOHlacXI0MDFrVWduUTV2?=
 =?utf-8?B?VHo0VjFyRFg4b0JmbWRRa2c2MkhMUjF5NWlIdWk1V0pVd3J3d0lxMTlIcTdB?=
 =?utf-8?B?V1BtWW5tOXlWdFJuNnBjWW1qOEZjK3YybTdGU2J3c1BKVG55cXpYeFJaZVF1?=
 =?utf-8?B?MUdUa2k0UDhVeXo4MU1qV3QwK09IUHdGdndHU3N5M3lGQ2V5bnZkQzJvWDB1?=
 =?utf-8?B?QlJyU2RGNUQyL1ZUcXNZTnY2eW45ajhLbXIwZTRENThOYVVjZmhQYUhVakpE?=
 =?utf-8?B?WjJDYTJPbGx1T0gwTDFBY2JHM09WblpYUWdrbUw5TFNYUWNSTnMxbUR5Mysx?=
 =?utf-8?B?d2p0SHB4ZW1sNlQ2MWhKaEFGRVBjRUVQNTJUTkNYNUlzcjZBYjJtVkFCWTd6?=
 =?utf-8?B?aWFDSDBMV0hJVUNJMmVHcDErVFRnbGZpU25ZMi8zbUVjZ3hOdVZ4a3g4TGJq?=
 =?utf-8?B?dVczWEd2OEVtaVU5VTdVSXJOdmxNR1V3Y3VJSmFUMEtUVFlSMzlndUo1S0lM?=
 =?utf-8?B?WElZcTloVFRaM1hzQXpic21FcXFXWGpHUzI2aFVtemVEK3lEVHJGVnppWmdI?=
 =?utf-8?B?R3c9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 00885874-cbcd-42ac-7949-08da94ce6478
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 14:52:19.8011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rxhhx1FFno8cQMSWuoSHrL5Gu/t2549HA4p3eNcnsbaoqeklz8y90kc/PGAPOxEe+tn9NHbaLomFcQmBkUiLHtVid31Gj2RWL6DQR6XOKHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6062
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
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Matteo Lisi <matteo.lisi@engicam.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan, Marek,

Am 07.09.22 um 12:04 schrieb Marek Szyprowski:
> Hi Jagan,
> 
> On 06.09.2022 21:07, Jagan Teki wrote:
>> On Mon, Sep 5, 2022 at 4:54 PM Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>>> On 02.09.2022 12:47, Marek Szyprowski wrote:
>>>> On 29.08.2022 20:40, Jagan Teki wrote:
>>>>> Samsung MIPI DSIM controller is common DSI IP that can be used in
>>>>> various
>>>>> SoCs like Exynos, i.MX8M Mini/Nano.
>>>>>
>>>>> In order to access this DSI controller between various platform SoCs,
>>>>> the ideal way to incorporate this in the drm stack is via the drm bridge
>>>>> driver.
>>>>>
>>>>> This patch is trying to differentiate platform-specific and bridge
>>>>> driver
>>>>> code and keep maintaining the exynos_drm_dsi.c code as platform-specific
>>>>> glue code and samsung-dsim.c as a common bridge driver code.
>>>>>
>>>>> - Exynos specific glue code is exynos specific te_irq, host_attach, and
>>>>>     detach code along with conventional component_ops.
>>>>>
>>>>> - Samsung DSIM is a bridge driver which is common across all
>>>>> platforms and
>>>>>     the respective platform-specific glue will initialize at the end
>>>>> of the
>>>>>     probe. The platform-specific operations and other glue calls will
>>>>> invoke
>>>>>     on associate code areas.
>>>>>
>>>>> v4:
>>>>> * include Inki Dae in MAINTAINERS
>>>>> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
>>>> This breaks Exynos DRM completely as the Exynos DRM driver is not able
>>>> to wait until the DSI driver is probed and registered as component.
>>>>
>>>> I will show how to rework this the way it is done in
>>>> drivers/gpu/drm/exynos/exynos_dp.c and
>>>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c soon...
>>> I've finally had some time to implement such approach, see
>>> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fprotect2.fireeye.com%2Fv1%2Furl%3Fk%3Dc5d024d9-a4ab8e4e-c5d1af96-74fe4860001d-625a8324a9797375%26q%3D1%26e%3D489b94d4-84fb-408e-b679-a8d27acf2930%26u%3Dhttps%253A%252F%252Fgithub.com%252Fmszyprow%252Flinux%252Ftree%252Fv6.0-dsi-v4-reworked&amp;data=05%7C01%7Cfrieder.schrempf%40kontron.de%7C8ed9bd90703b48c9d43708da90b86876%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637981418959345104%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=vLwOMBbdNo1C5x%2BESY3SU%2FwaYKBmAgIyafLOLmd3BlM%3D&amp;reserved=0
>>>
>>> If you want me to send the patches against your v4 patchset, let me
>>> know, but imho my changes are much more readable after squashing to the
>>> original patches.
>>>
>>> Now the driver is fully multi-arch safe and ready for further
>>> extensions. I've removed the weak functions, reworked the way the
>>> plat_data is used (dropped the patch related to it) and restored
>>> exynos-dsi driver as a part of the Exynos DRM drivers/subsystem. Feel
>>> free to resend the above as v5 after testing on your hardware. At least
>>> it properly works now on all Exynos boards I have, both compiled into
>>> the kernel or as modules.
>> Thanks. I've seen the repo added on top of Dave patches - does it mean
>> these depends on Dave changes as well?
> 
> Yes and no. My rework doesn't change anything with this dependency. It 
> comes from my patch "drm: exynos: dsi: Restore proper bridge chain 
> order" already included in your series (patch #1). Without it exynos-dsi 
> driver hacks the list of bridges to ensure the order of pre_enable calls 
> needed for proper operation. This works somehow with DSI panels on my 
> test systems, but it has been reported that it doesn't work with a bit 
> more complex display pipelines. Only that patch depends on the Dave's 
> patches. If you remove it, you would need to adjust the code in the 
> exynos_drm_dsi.c and samsung-dsim.c respectively. imho it would be 
> better to keep it and merge Dave's patches together with dsi changes, as 
> they are the first real client of it.

I tried to test Jagan's v4 on our Kontron BL i.MX8MM with SN65DSI84 LVDS
bridge and it didn't work due to driver dependency issues.

Instead trying Marek's branch rebased to 6.0-rc4 and including the
necessary DT changes from Jagan's v4 looks good and produces an image on
the display.

Only one thing caused problems: In Jagan's patch for the LCDIF node [1]
there's a typo (missing 's') in the assigned-clock-rates property.
Without fixing this the display doesn't work.

Jagan, can you come up with a v5 including Marek's fixes?
And if you like, I think you could also start sending the DT changes for
i.MX8MM, so we can start reviewing/testing them?

Thanks
Frieder

[1]:
https://github.com/openedev/kernel/commit/89a6252cec47f3593d4f2b7ea3132f4745c4fdb3
