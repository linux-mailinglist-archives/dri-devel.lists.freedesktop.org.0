Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7775864D87C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 10:22:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAB810E50C;
	Thu, 15 Dec 2022 09:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2115.outbound.protection.outlook.com [40.107.103.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4D110E50C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 09:22:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjYHkSzWRKffb8B/msBTjLvFKeLhCupTcJuyPsCA3vKq89MHMRe5qHaabSKbLbOuSSAW+PW27pjz9pTdcRXX8wrmmRuTSlf7iKgkKB7IU2NSUyswzzRzTP7QX77pPUbdgBPT+VkVSJVmWPXrJd78V7VzKY34493PWWkQ/7NwuX5pmIre6CLFevC6Pa/ekCArJ+YgtDbBEVeUMfI1Wms/0FW6023HJIZJIZLD7DXQVXxU9fTZQhMXRH1Cf6y1vDZuhemkSWeyhcQ5Uj/7TZuM87HtRcTACaW6tIAbO1dITrbFviZsKe9OaVvhCjT/cHXOZhUaZs+ty+MBhBfqofsG3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QaJDzqpgTZPumsvHgyGXdUFGuiii0y9STUnUCJYYMQ=;
 b=iJ+hxfZ7vm7kslDM17rhtkylh0rQ7QdiybuluHNGPY7AjrnFDzH2c/7GTqdOcBVu/3qkoNynopcMzi5Lx6CT/pHj/6TDlrB5zkLUOW3+Zp6iGX2w/aLueL53dtRjqSSSWYuhogSRsiVOK0V/5WHuL4xtvemCe1uJ/U6YzTZuH6tDZDxMD1cNvK2mJEzGDpTMATlCD0SZMECfXbM36wrBg/27WALujIBWB5NJnHFPG1tmsxrznsAL7URK7BLyR02e2t9k+OvGHQmHHrIhmNhV7I30x5d6t43JUbBL4W8IX952BODNr2qkFLgFhuY19ZOUObx1XM9qNyEEJLa7PtMi9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QaJDzqpgTZPumsvHgyGXdUFGuiii0y9STUnUCJYYMQ=;
 b=BYswrmsEJKQ93HJIaMrj9bN+lTUbgwyPY8/RQK4mGTbBiVcQOfwM4wZBUs1lYSC4uQDw5f58es72/8nawUxjCipmgdZ6qQMSFhMJFw/YS7dAEp+ddwHbYKtID0///rl1lNWzlpRIlO0sDc5m66KklG3q9YXMTueO03ObOjmnxC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by VI1PR10MB3326.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:139::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 09:22:05 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 09:22:04 +0000
Message-ID: <7a58566d-9069-bc65-9a87-e79404d05e0d@kontron.de>
Date: Thu, 15 Dec 2022 10:22:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 16/18] drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano
 support
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Fancy Fang <chen.fang@nxp.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <20221214125907.376148-17-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221214125907.376148-17-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::10) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|VI1PR10MB3326:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d04841b-6a2c-4c2f-b293-08dade7dd4ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WbVOui3kUhz9IafEmMtJ0Bvy3Nk60UNyyNQMp6Af97xzlnAEqCPf5kTgP9HGDXsA/oaiTCH6tc+TjoCXEPvKl/dyb92tBuWeD/JHlfrk4IgCs9YqXDTkft//H7cuUfElgYPg2e+EPXrEAU79AA2g1boHfGbrBNF0cHvl/7jvuvLFLCoKqGo0V1VqhcMKsYPYLCA0EAfHxoSTO9d3OC6zvKxLnodl0RXErO8oq/S+D+nTI7rgZLR6yQ/k1Vob8p+c8caYUOsnQ6fcB1B9b4+kgSskJkK0Wx6G/qrJbfynGt7fQSPdzA14IhLwof+InM6isY2VMJotJzt47qazBaDgka7LipQRrPfdJ8Epg+gW3F+FSJTggys9LTxwSSH0V3tzC7Z158SbomftKK0BzIOJu3ha0VmMVbUy1bGOcbMCipUh5dZWinju0qNojcBiBrdU6ww3jK6KVz9razKKOCBwf3S8UFgstu4/vr4xifg3uYbiYVv3wDIhF6ydElFmmC7+6oEGLpjCx1/iQrrDhq/Jr0RtJLNX6c0AJRt9WW3xJZu2g8Z+FisRtaKjDhD5FUIHlWRmNmVM0Xae8qVfF/8bxpb/RuoGB0W9m6gbHwi7seNw3ef1/mEsI5L9UgxmkPJoCxlS7zRUCdYApTZlg6s9cvUtpX0KJYpWPCeqe3vp10NbR3kyAMj57T6Cfo0ZQtT8VKtlM6Toclz3/lh8AcVFhdhr/I3oOz3jkB3FuaoIAGqbz1qjuRYpzJzTGg2rSMGt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(451199015)(8676002)(44832011)(921005)(6506007)(6666004)(4326008)(6512007)(66946007)(38100700002)(53546011)(4744005)(186003)(66556008)(66476007)(2906002)(316002)(110136005)(54906003)(6486002)(478600001)(36756003)(31696002)(86362001)(31686004)(41300700001)(2616005)(8936002)(7416002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OC9ZS3BwZzd4QmhYWGIxN2UzTkNVUlpXQ3p4aVRtUU9hUVFPRmdTTllQUmZG?=
 =?utf-8?B?bURaN2QrUVZaYUlvNkdWVFNqRDZsb3FOdkF3WFVHOUgySjVLNE5CcThpeTVt?=
 =?utf-8?B?SmRhOXcrbkhSRGFBOEJjdmp0SGxQVXV1c1dTWG1lcFZBY3l6eGNwM2s3SDF5?=
 =?utf-8?B?WU5Ub3ZXLzRSVXdiMkRQYTYvOTFveVE4YmlneUFGelVPWDNmVms3aGVDSXFQ?=
 =?utf-8?B?S1VXbnVaeHJxMVl1VFhkTnFnTW9IV01rb3VLdG9rZi92bE5zM2NmeUlQZnpr?=
 =?utf-8?B?K3RGNm9DbFdEVDZaZC9XZllOT1dHV1RpK09GelVGS2tYMFRROHh5TXNZK3BY?=
 =?utf-8?B?UkxQUnFqQXo3SjBXcjhNV2pQYzZJNXkzZXBhWFBYZGRnOHYvNmNMTHk1eEw5?=
 =?utf-8?B?bmFWN09URS9FaGdrczFaQUdFalk2aFRSWVZ6bm9kWmFFRFU2YjVTZG5vejBJ?=
 =?utf-8?B?cmh6eFh6UVdBSjdLQ1ptN2NHNm52MFBaRXlTSzdoYUMwMXZQUWRxcVNSOVRV?=
 =?utf-8?B?dE4waDBtRkFPWnNpZ1pZQWhsVGdiVTg5bHFwMWl3RHQ1cWl3cjU3NEhrUGJX?=
 =?utf-8?B?WVp6NEFhZzFaYk5BeUNyQ1lMakNYR0kzaUtsT1JmYldzVG5EMW1qMHpRN25H?=
 =?utf-8?B?TXpPc2JXeW9zcy9nMlBwdnNWT2VHMndUMWh4SVNWM3JxL3E1dFJnaU5qUTRi?=
 =?utf-8?B?YXdHUkFvcUU2RlN2M1NiaUppZWlHL0NVNXZWQ2tidVBtbjZPY3pLdUM5Zmwz?=
 =?utf-8?B?SW5GdjJnT2lxZHVGbkJ2TUE0OFZ6c2NNQkF3NkF0WkR3QXdrWDR1aVRBTkUw?=
 =?utf-8?B?Y3l6VlQ3S21maGxWQ3RQZmhpd3RnaVpYOUJBYm5SbCt4aEhTMkl4eXV5cEZn?=
 =?utf-8?B?TDZTZkl4USszQzNhYlV4a0wzUm1POEZBWFZ1VFVEa0hOQTN2T21lZDZKSTEz?=
 =?utf-8?B?TUJlYXh0a3RBQm1LN3pUYWNOelpIdGNoQmx2cnA3TlVEZStuT0drZ0VORFNm?=
 =?utf-8?B?Y2RpenBhR0IzdmVqejNUN2FoMGkxSXE2RzV1UDhHd3FWV3ZMamdQbk1EcWFK?=
 =?utf-8?B?R21pWXpselhLMG54YVN4b3dJT1lqeGVQR1JpNzdDTVFIL3NnQk9KVHpZSmJF?=
 =?utf-8?B?Wkwrblp1WjB1RXByTVI0SHlkVlZRbzJ0NENHU080SmZidzd5UkVUbFlESndU?=
 =?utf-8?B?UjROY3pEd3ViRlpnUWIrTXM5emZ6L25OOS9NQnM3clYwSEwrNGcxczRWTkNB?=
 =?utf-8?B?YURKYzJNT1VoZTB1bGFRRFh3RTBmaFlqT1hpbENUa3ZYaUFIaVdxbjR6L0Fr?=
 =?utf-8?B?N2w0NWpObUdhcStXL3M4VFlOcmk0ekdMNU5DTXdSWGZVYkkwd21OdHNoTEpD?=
 =?utf-8?B?eFJoZ1RyWGhJV082MWZzbDVuaE1mRGttZXVTMW1adjAwcmprZTJTZXZjNjJP?=
 =?utf-8?B?U0xPeXk0M1VEY3BzTEVQSGI5WEs4MEJaMTd6Qm5wTXptdTY4YnRyZTJKbFR4?=
 =?utf-8?B?Z2tHQnllQW43WGtWN1VITzNwaHF3UWljeHorVU1FS1gzYTlNV0xjZjcvYXF4?=
 =?utf-8?B?Z3FwL1NuTnpCNTVic1FRYTN6WlNXM0dXQjQ5ZlQ3SjlnaUs4OEJrdlluYmpK?=
 =?utf-8?B?TlFlZDZSWDVvMFZMUGpOamlCVEVncWJLL2RsVmVOWTQzcHJLdmdJZlRsTWxV?=
 =?utf-8?B?eUVDSUZjYm9OWlloY0xUZ1VacHhGWTN3cU9kMDlGYWtDbGNQQW1LUm5yVytk?=
 =?utf-8?B?TmpqT3RpQXpMcTdVMTdQd2Nlblc2ampvSE5jT3Noci9LdnZsZWtwYjQ0Q29r?=
 =?utf-8?B?S3FhWWJwVGgvUyt5Q3Btb2dtUkE5b3JxVDB3VncxTWdOWUl6M21GQVVYUjlY?=
 =?utf-8?B?M29sM1l6eGs1b3BKNGlOYWdka256ODY4aWJqaEVRTW4wbU4vR2ZKTCsySXhi?=
 =?utf-8?B?TkEzRFQ3NnEwanJUNDB4MEdoWWlveFNMSWdIWHlmY3kzZU9NODBTODhjU0tO?=
 =?utf-8?B?Wi91VlhkTkFKZkNaaXdDZEpJUzJidUlkelJoWkxueU5TSkJmUEJ1dWRwa0dI?=
 =?utf-8?B?MEZpZTQyTTdWNFFqdWIvcXZiaGpqZlFtc3d3a1ZJb3QzV1QzN1BIMXdrd1g0?=
 =?utf-8?B?a2ZEUnpoZVUvVElBb3FWdVl1VndMUXlRNzZHQWdrYURrRlJTRGYvbi9BS0Q1?=
 =?utf-8?Q?vc+cV7u24JVqh4EGiwT1y2A=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d04841b-6a2c-4c2f-b293-08dade7dd4ae
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 09:22:04.8249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X37iQgrcshlXO6OewWpnZZQGinXJfZWO8H2jIkkdpcv9ZSDcJ5xhsNlZ/soTJ2cPQZ07BSPhEQFXLSAV1w1tDeNtRXJn6kU/r4l6eNmRAqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3326
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14.12.22 13:59, Jagan Teki wrote:
> Samsung MIPI DSIM master can also be found in i.MX8M Mini/Nano SoC.
> 
> Add compatible and associated driver_data for it.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
